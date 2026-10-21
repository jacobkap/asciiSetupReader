# Turns the column-position lines of a setup file (e.g. "V1 1-3  V2 $ 4-5")
# into a data.frame with one row per column: column_number (the short name
# in the setup file, e.g. V1), column_name (its descriptive label, from
# `variables`), begin and end (positions in the fixed-width file) and, for
# SAS files with a FORMAT section, f_name (the format holding its value
# labels). Rows are ordered by position.
get_column_spaces <- function(setup, variables, codebook) {
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

  # Add the descriptive names, keeping only columns that have one
  if (!is.null(variables)) {
    setup <- setup[tolower(setup$column_number) %in%
                     tolower(variables$column_number), ]

    # In the CDC SADC data set, the column number changes from lowercase
    # to uppercase depending on section of setup file.
    setup$column_number <- match_case(setup$column_number,
                                      variables$column_number)
    setup <- merge(setup, variables,
                   by = "column_number", all.x = TRUE)
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

  # SAS files: the FORMAT section links each column to the format (f_name)
  # whose VALUE statement holds its value labels.
  format_section <- grep2("^FORMAT$|SAS FORMAT STATEMENT|\\/\\* format$", codebook)
  if (length(format_section) > 0) {
    format <- codebook[format_section[1]:length(codebook)]
    format <- gsub("^FORMAT ", "", format, ignore.case = TRUE)
    format <- unlist(strsplit(format, "\\."))
    format <- stringr::str_trim(format)
    format <- data.frame(column_name = gsub(" .*", "", format),
                         f_name      = gsub(".* ", "", format))
    setup <- merge(setup, format, by.x = "column_number",
                   by.y = "column_name", all.x = TRUE)
  }

  setup <- setup[order(setup$begin), ]

  return(setup)
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

# Labels each element of x with the section it belongs to. A section starts
# at the first element and after every element flagged in new_section, and
# is named after its first element.
fill_section <- function(x, new_section) {
  starts <- c(1L, which(new_section) + 1L)
  x[starts[findInterval(seq_along(x), starts)]]
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

    # Open-ended ranges ("5 THRU HI(GHEST)", "LO(WEST) THRU 0") become the
    # values in the data that fall in the range. Values are compared as
    # numbers but kept as they appear in the data, so zero-padded values
    # (e.g. "0000012" for "0000009 THRU HI") match.
    thru_hi_pattern  <- "\\s+thru\\s+hi.*$"
    low_thru_pattern <- "^lo(w|west)?\\s+thru\\s+"
    is_thru_hi  <- grepl(thru_hi_pattern, missing_values, ignore.case = TRUE)
    is_low_thru <- grepl(low_thru_pattern, missing_values, ignore.case = TRUE)
    if (any(is_thru_hi) || any(is_low_thru)) {
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
      missing_values <- c(missing_values[!is_thru_hi & !is_low_thru],
                          values[in_range])
    }
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

  out <- suppressMessages(vroom::vroom_fwf(data,
                                           col_positions = positions,
                                           col_types = vroom::cols(.default =
                                                                     vroom::col_character()),
                                           altrep = FALSE))
  # setDT() converts in place; as.data.table() would copy all the data
  data.table::setDT(out)
  return(out)
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
    # Codes of columns with implied decimal places are written as numbers
    # (e.g. "1.0" for data of "0000010"), so they're also matched as numbers
    by_number <- setup$setup$column_number[setup$setup$decimals > 0]
    for (i in seq_along(value_labels)) {
      data <- fix_variable_values(data,
                                  value_labels[[i]],
                                  names(value_labels)[i],
                                  by_number = names(value_labels)[i] %in% by_number)
    }
  }
  return(data)
}

