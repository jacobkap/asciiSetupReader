# Turns the column-position lines of a setup file (e.g. "V1 1-3  V2 $ 4-5")
# into a data.frame with one row per column: column_number (the short name
# in the setup file, e.g. V1), column_name (its descriptive label, from
# `variables`), begin and end (positions in the fixed-width file) and, for
# SAS files with a FORMAT section, f_name (the format holding its value
# labels). Rows are ordered by position. SPSS positions come already read
# (a data.frame from data_list_sps()), so names with "." or "$" are kept.
get_column_spaces <- function(setup, variables, codebook) {
  if (!is.data.frame(setup)) setup <- positions_from_lines(setup)

  # Add the descriptive names; a column without one keeps its short name
  if (!is.null(variables)) {
    # In the CDC SADC data set, the column number changes from lowercase
    # to uppercase depending on section of setup file.
    setup$column_number <- match_case(setup$column_number,
                                      variables$column_number)
    setup <- merge(setup, variables,
                   by = "column_number", all.x = TRUE)
    no_name <- is.na(setup$column_name)
    setup$column_name[no_name] <- setup$column_number[no_name]
  } else {
    setup$column_name <- setup$column_number
  }

  setup$begin <- as.numeric(setup$begin)
  setup$end   <- as.numeric(setup$end)

  if (any(setup$begin > setup$end)) {
    stop(paste0("The following columns have a start number greater than the end number. Please check your setup file and fix this issue before rerunning this code.",
                paste("\nColumns with issue: ",
                      setup$column_number[setup$begin > setup$end])))
  }

  # SAS files: the FORMAT statement links each column to the format (f_name)
  # whose VALUE statement holds its value labels.
  format <- sas_formats(codebook, setup$column_number)
  if (!is.null(format)) {
    setup <- merge(setup, format, by.x = "column_number",
                   by.y = "column_name", all.x = TRUE)
  }

  setup <- setup[order(setup$begin), ]

  return(setup)
}

# Turns SAS column-position lines ("V1 1-3  V2 $ 4-5") into a data.frame of
# column_number (the short name), begin and end.
positions_from_lines <- function(setup) {
  setup <- gsub("^/[0-9]+$", "", setup)
  setup <- setup[!setup %in% ""]

  # Keep only lines with positions and standardize them to "begin-end"
  setup <- gsub("([0-9]+) -([0-9]+)", "\\1-\\2", setup)
  setup <- setup[grep("[0-9]-[0-9]| [0-9]| \\$[0-9]", setup)]
  setup <- gsub("([0-9])- +([0-9])", "\\1-\\2", setup)

  # Drop SPSS format specs (F3.0, A10, (A)) and split the lines so each
  # piece is one "name begin-end" pair
  setup <- gsub("\tF[0-9].0$|\tA[0-9]+$|\t\\(.*\\)$", "", setup)
  setup <- gsub("\t", " ", setup)
  setup <- gsub("([0-9]) - ([0-9])", "\\1-\\2", setup)
  setup <- gsub("([0-9]+-[0-9]+) ([[:alpha:]]+)", "\\1   \\2",
                setup)
  setup <- gsub("([[:alpha:]]+[0-9]* [0-9]+) ([[:alpha:]]+[0-9]*)", "\\1   \\2",
                setup)
  setup <- gsub("\\s{2,}\\$ ([0-9]+)", " \\1",
                setup)
  setup <- unlist(strsplit(setup, "\\s{2,}"))
  setup <- gsub("\\$|\\;|\\(.*|\\.[0-9]+", "", setup)
  setup <- gsub("\\.$", "", setup)
  setup <- stringr::str_trim(setup)
  setup <- setup[grep("[0-9]$", setup)]
  setup <- data.frame(column_number = setup
                      )
  setup$column_number <- gsub("^\\/", "", setup$column_number)

  # A single position ("V1 5") is a one-character column, so begin == end
  setup$begin <- gsub(".* ", "", setup$column_number)
  setup$end   <- gsub(".*-", "", setup$begin)
  setup$begin <- gsub("-.*", "", setup$begin)
  setup <- setup[setup$column_number != setup$begin, ]

  setup$column_number <- gsub(" .*", "", setup$column_number)
  setup
}


# SAS FORMAT statements ("FORMAT V1 V2 YNF. V3-V5 AGEF. V6 8.2;") and
# ATTRIB ... FORMAT= link columns to formats. Each format applies to every
# column named since the last format; "V3-V5" is V3, V4 and V5 and "V3--V5"
# every column from V3 to V5 in file order. Returns a data.frame of
# column_name and f_name (the format's name without its width), or NULL.
sas_formats <- function(codebook, columns) {
  text <- gsub("/\\*|\\*/", " ", codebook)
  starts <- grep("^\\s*(FORMAT|ATTRIB)\\b", text, ignore.case = TRUE)
  if (length(starts) == 0) return(NULL)
  # A quoted label becomes one word, so a ";" inside it doesn't end the
  # statement and "LABEL='Sex' FORMAT=SEXF." keeps its format
  text <- gsub("'[^']*'|\"[^\"]*\"", " _quoted_ ", text)
  semicolons <- grep(";", text)
  rows <- list()
  for (s in starts) {
    e <- c(semicolons[semicolons >= s], length(text))[1]
    statement <- paste(text[s:e], collapse = " ")
    statement <- sub(";.*$", "", statement)
    attrib <- grepl("^\\s*ATTRIB\\b", statement, ignore.case = TRUE)
    statement <- sub("^\\s*(FORMAT|ATTRIB)\\b", "", statement, ignore.case = TRUE)
    if (attrib) {
      # ATTRIB V1 LABEL = '...' FORMAT = V1F. V2 ...
      statement <- gsub("\\b(LABEL|LENGTH|INFORMAT|TRANSCODE)\\s*=\\s*\\S+", " ", statement,
                        ignore.case = TRUE)
      statement <- gsub("\\bFORMAT\\s*=\\s*", " ", statement, ignore.case = TRUE)
    }
    tokens <- strsplit(trimws(statement), "\\s+")[[1]]
    pending <- character(0)
    for (token in tokens) {
      if (grepl("^\\$?([[:alpha:]_][[:alnum:]_]*?)?[0-9]*\\.[0-9]*$", token)) {
        # A format: its name (if any) without the width and "."
        f_name <- sub("[0-9]*\\.[0-9]*$", "", token)
        if (length(pending) > 0 && nzchar(sub("^\\$", "", f_name))) {
          rows[[length(rows) + 1]] <- data.frame(column_name = pending, f_name = f_name)
        }
        pending <- character(0)
      } else {
        pending <- c(pending, sas_variable_list(token, columns))
      }
    }
  }
  if (length(rows) == 0) return(NULL)
  format <- do.call(rbind, rows)
  format$column_name <- match_case(format$column_name, columns)
  # A column given a format twice keeps the last, as in SAS
  format <- format[!duplicated(format$column_name, fromLast = TRUE), ]
  format <- format[format$column_name %in% columns, ]
  if (nrow(format) == 0) NULL else format
}

# The columns a SAS variable list token means: "V3-V5" is V3, V4 and V5
# ("Q08-Q10" is Q08, Q09 and Q10; "A1_1-A1_3" is A1_1, A1_2 and A1_3),
# "V3--V5" every column from V3 to V5 in file order, anything else itself.
sas_variable_list <- function(token, columns) {
  positional <- regmatches(token, regexec(
    "^([[:alpha:]_][[:alnum:]_]*)--([[:alpha:]_][[:alnum:]_]*)$", token))[[1]]
  if (length(positional) == 3) {
    from <- match(tolower(positional[2]), tolower(columns))
    to   <- match(tolower(positional[3]), tolower(columns))
    if (!is.na(from) && !is.na(to) && to >= from) return(columns[from:to])
  }
  numbered <- regmatches(token, regexec(
    "^([[:alpha:]_][[:alnum:]_]*?)([0-9]+)-([[:alpha:]_][[:alnum:]_]*?)?([0-9]+)$",
    token, perl = TRUE))[[1]]
  if (length(numbered) == 5 &&
      (numbered[4] == "" || toupper(numbered[4]) == toupper(numbered[2]))) {
    from <- as.numeric(numbered[3])
    to   <- as.numeric(numbered[5])
    if (to >= from && to - from < 10000) {
      numbers <- as.character(as.integer(seq(from, to)))
      # Zero-padded numbers keep their width
      if (startsWith(numbered[3], "0")) {
        numbers <- formatC(as.integer(seq(from, to)), width = nchar(numbered[3]),
                           flag = "0", format = "d")
      }
      return(paste0(numbered[2], numbers))
    }
  }
  token
}

# Keeps the rows of column_spaces for the requested columns, given as row
# numbers, column_number names (V1, V2) or column_name labels.
selected_columns <- function(keep_columns, column_spaces) {
  if (is.null(keep_columns)) {
    return(column_spaces)
  } else if (is.numeric(keep_columns)) {
    column_spaces <- column_spaces[keep_columns, ]
  } else if (all(keep_columns %in% column_spaces$column_number)) {
    column_spaces <- column_spaces[
      column_spaces$column_number %in% keep_columns, ]
  } else if (all(keep_columns %in% column_spaces$column_name)) {
    column_spaces <- column_spaces[
      column_spaces$column_name %in% keep_columns, ]
  } else {
    stop(paste0("Not all column names in 'keep_columns' are in data. ",
                "Please check spelling"))
  }

  return(column_spaces)
}

grep2 <- function(pattern, x) grep(pattern, x, ignore.case = TRUE)
grepl2 <- function(pattern, x) grepl(pattern, x, ignore.case = TRUE)

# Replaces each value of x with its case-insensitive match in table, if any.
# Setup files don't always use the same case for a column name in every
# section (e.g. the CDC SADC files).
match_case <- function(x, table) {
  m <- match(tolower(x), tolower(table))
  x[!is.na(m)] <- table[m[!is.na(m)]]
  x
}

# Replaces values of x found in labels with the names of labels (what
# haven::as_factor() does for a labelled vector) and returns character.
# Values with no label are kept as they are. If by_number, values that
# don't match a label's code as text are also matched as numbers, so
# "000078.5" matches a code of "78.5".
replace_values <- function(x, labels, by_number = FALSE) {
  x <- as.character(x)
  m <- match(x, labels, incomparables = NA)
  if (by_number && anyNA(m)) {
    as_number <- function(v) {
      tryCatch(suppressWarnings(as.numeric(v)), error = function(e) {
        rep(NA_real_, length(v))
      })
    }
    unmatched <- is.na(m)
    m[unmatched] <- match(as_number(x[unmatched]), as_number(labels),
                          incomparables = NA)
  }
  x[!is.na(m)] <- names(labels)[m[!is.na(m)]]
  x
}

# Implied decimal places ------------------------------------------------------

# Adds the decimal point to the values of columns with implied decimal
# places (setup$setup$decimals), e.g. "0000785" with 1 place becomes
# "000078.5" and "5" with 2 places "0.05". Only whole numbers are changed:
# a value that already has a decimal point keeps it, as in SPSS and SAS.
# Returns a list of the data and `changed`, a data.frame of the columns
# changed (column_number, decimals, and an example value before and
# after), or NULL.
fix_implied_decimals <- function(data, setup) {
  columns <- setup$setup[setup$setup$decimals > 0 &
                           setup$setup$column_number %in% names(data), ]
  changed <- list()
  for (i in seq_len(nrow(columns))) {
    column <- columns$column_number[i]
    places <- columns$decimals[i]
    values <- data[[column]]
    whole  <- !is.na(values) & grepl("^[+-]?[0-9]+$", values)
    if (!any(whole)) next
    new_values <- add_decimal_point(values[whole], places)
    changed[[length(changed) + 1]] <- data.frame(
      column_number = column, decimals = places,
      example = values[whole][1], example_new = new_values[1])
    values[whole] <- new_values
    data.table::set(data, j = column, value = values)
  }
  list(data = data, changed = do.call(rbind, changed))
}

add_decimal_point <- function(values, places) {
  sign   <- sub("^([+-]?).*$", "\\1", values)
  digits <- sub("^[+-]", "", values)
  short  <- nchar(digits) <= places
  digits[short] <- paste0(strrep("0", places + 1 - nchar(digits[short])),
                          digits[short])
  n <- nchar(digits)
  paste0(sign, substr(digits, 1, n - places), ".",
         substr(digits, n - places + 1, n))
}

# Reading data --------------------------------------------------------------
#
# read_ascii_setup() runs: read_data() -> fix_value_labels() ->
# fix_names_missing_numeric() (missing values, names, numeric columns).

# Sets the setup file's missing values to NA. `missing` is the data.frame
# from parse_setup(): one row per column (variable) and missing value. As in
# SPSS and SAS, codes are matched by value, so "9", "09" and "0000009" are
# the same, except in text_columns (SPSS "(A)", SAS "$"), where they must
# be the same text.
fix_missing <- function(data, missing, text_columns = character(0)) {
  missing <- missing[missing$variable %in% names(data), ]

  for (column in unique(missing$variable)) {
    missing_values <- missing$values[missing$variable == column]
    missing_values <- as.character(trimws(missing_values))
    missing_values <- gsub("\\'", "", missing_values)

    # Ranges ("97 THRU 99", "5 THRU HI(GHEST)", "LO(WEST) THRU 0") become
    # the values in the data that fall in the range. Values are compared as
    # numbers, so 97.5 is in "97 thru 99", but kept as they appear in the
    # data, so zero-padded values (e.g. "0000012" for "0000009 THRU HI")
    # match.
    thru_hi_pattern  <- "\\s+thru\\s+hi.*$"
    low_thru_pattern <- "^lo(w|west)?\\s+thru\\s+"
    range_pattern    <- "^(-?[0-9]*\\.?[0-9]+)\\s+thru\\s+(-?[0-9]*\\.?[0-9]+)$"
    is_thru_hi  <- grepl(thru_hi_pattern, missing_values, ignore.case = TRUE)
    is_low_thru <- grepl(low_thru_pattern, missing_values, ignore.case = TRUE)
    is_range    <- grepl(range_pattern, missing_values, ignore.case = TRUE)
    if (any(is_thru_hi) || any(is_low_thru) || any(is_range)) {
      values  <- unique(data[[column]])
      values  <- values[!is.na(values) & validEnc(values)]
      numbers <- suppressWarnings(as.numeric(values))
      values  <- values[!is.na(numbers)]
      numbers <- numbers[!is.na(numbers)]

      lowest  <- as.numeric(sub(thru_hi_pattern, "", missing_values[is_thru_hi],
                                ignore.case = TRUE))
      highest <- as.numeric(sub(low_thru_pattern, "", missing_values[is_low_thru],
                                ignore.case = TRUE))
      lowest   <- lowest[!is.na(lowest)]
      highest  <- highest[!is.na(highest)]
      in_range <- rep(FALSE, length(values))
      if (length(lowest) > 0)  in_range <- in_range | numbers >= min(lowest)
      if (length(highest) > 0) in_range <- in_range | numbers <= max(highest)
      for (r in missing_values[is_range]) {
        ends <- as.numeric(sub(range_pattern, "\\1", r, ignore.case = TRUE))
        ends <- c(ends, as.numeric(sub(range_pattern, "\\2", r, ignore.case = TRUE)))
        in_range <- in_range | (numbers >= ends[1] & numbers <= ends[2])
      }
      missing_values <- c(missing_values[!is_thru_hi & !is_low_thru & !is_range],
                          values[in_range])
    }
    # A range no value falls in leaves nothing to set to NA
    if (length(missing_values) == 0) next
    names(missing_values) <- NA

    data.table::set(data, j = column,
                    value = replace_values(data[[column]], missing_values,
                                           by_number = !column %in% text_columns))
  }
  return(data)
}

# Reads the fixed-width file with every column as character, using the
# positions from the setup file.
read_data <- function(data, setup) {
  positions <- vroom::fwf_positions(setup$setup$begin,
                                    setup$setup$end,
                                    setup$setup$column_number)

  # Nothing is made NA while reading: in text columns a blank or the
  # letters "NA" are values that can have a label (see blanks_to_na())
  out <- suppressMessages(vroom::vroom_fwf(data,
                                           col_positions = positions,
                                           col_types = vroom::cols(.default =
                                                                     vroom::col_character()),
                                           na = character(),
                                           skip = if (is.null(setup$skip)) 0 else setup$skip,
                                           altrep = FALSE))
  # setDT() converts in place; as.data.table() would copy all the data
  data.table::setDT(out)
  # In number columns a blank, "NA" or a lone "." is missing, as in SPSS
  # and SAS
  for (column in setdiff(names(out), setup$text_columns)) {
    values <- out[[column]]
    empty <- values %in% c("", "NA", ".")
    if (any(empty)) {
      values[empty] <- NA
      data.table::set(out, j = column, value = values)
    }
  }
  return(out)
}

# Makes blank text values that weren't labelled or set missing NA, as
# earlier versions did.
blanks_to_na <- function(data) {
  for (column in names(data)) {
    values <- data[[column]]
    blank <- !is.na(values) & values == ""
    if (any(blank)) {
      values[blank] <- NA
      data.table::set(data, j = column, value = values)
    }
  }
  data
}

# Sets missing values to NA, renames columns from their short names (V1) to
# their descriptive names if real_names, converts all-number columns to
# numeric if coerce_numeric, and returns a plain data.frame. The number of
# values that only commented-out missing values made NA is the
# "commented_na" attribute (a named vector, by column).
fix_names_missing_numeric <- function(data,
                                      setup,
                                      real_names,
                                      coerce_numeric) {
  commented_na <- NULL
  if (!is.null(setup$missing)) {
    text_columns <- setup$text_columns
    commented <- setup$missing$commented %in% TRUE
    data <- fix_missing(data, setup$missing[!commented, ], text_columns)
    if (any(commented)) {
      columns <- intersect(unique(setup$missing$variable[commented]), names(data))
      before  <- vapply(columns, function(x) sum(is.na(data[[x]])), numeric(1))
      data <- fix_missing(data, setup$missing[commented, ], text_columns)
      after   <- vapply(columns, function(x) sum(is.na(data[[x]])), numeric(1))
      commented_na <- (after - before)[after > before]
    }
  }
  data <- blanks_to_na(data)
  if (real_names) {
    variables <- setup$setup[setup$setup$column_number
                             %in% names(data), ]
    data.table::setnames(data, old = variables$column_number,
                         new = variables$column_name)
  }

  if (coerce_numeric) {
    data <- make_cols_numeric(data)
  }
  attributes(data)$spec <- NULL
  attributes(data)$problems <- NULL
  data.table::setDF(data)
  attr(data, "commented_na") <- commented_na
  return(data)
}

# Replaces codes with their value labels in every column that has them, if
# value_label_fix.
fix_value_labels <- function(data, setup, value_label_fix) {
  # Only columns that were read (see select_columns)
  value_labels <- setup$value_labels
  if (!is.null(value_labels)) {
    value_labels <- value_labels[names(value_labels) %in%
                                   setup$setup$column_number]
  }

  if (value_label_fix && length(value_labels) > 0) {
    # As in SPSS and SAS, codes of number columns are matched by value
    # ("0" labels "0000000"); codes of text columns must be the same text
    for (i in seq_along(value_labels)) {
      data <- fix_variable_values(data,
                                  value_labels[[i]],
                                  names(value_labels)[i],
                                  by_number = !names(value_labels)[i] %in%
                                    setup$text_columns)
    }
  }
  return(data)
}

