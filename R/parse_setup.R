#' Parse the setup file (.sps or .sas).
#'
#' @param setup_file Name of the SPSS or SAS setup file - should be a .sps or
#'   .sas (.txt also accepted as are these files in zipped format). Whether it
#'   is SPSS or SAS is determined from the file name: names ending in .sps
#'   (optionally followed by .zip or .txt) are SPSS and everything else is SAS.
#'
#'   A setup file that isn't valid UTF-8 text is read as Latin-1, with a
#'   message.
#'
#' @return A list of length 3. The first object ("setup") is a data frame
#' with 5 columns: column_number, the non-descriptive name of each column
#' (e.g. V1); column_name, its descriptive name; begin and end, the first
#' and last character position of the column in the fixed-width data file;
#' and decimals, the number of implied decimal places the setup file gives
#' the column (0 if none; see \code{\link{read_ascii_setup}}). Descriptive
#' names are made unique by adding "_2", "_3", ... to names already used by
#' an earlier column.
#'
#' The second object ("value_labels") is a list of named vectors for the
#' value labels, one per column with value labels. The vector's values are
#' the codes in the data and its names are the labels. If there are no
#' value labels, this will be NULL.
#'
#' The third object ("missing") is a data.frame with two columns. The first
#' column (variable) says the column name and the second (values) says the
#' value that is missing and will be replaced with NA. If there are no
#' missing values, this will be NULL.
#' @export
#'
#' @examples
#' sas_name <- system.file("extdata", "example_setup.sas",
#'                          package = "asciiSetupReader")
#' sas_example <- parse_setup(sas_name)
#'
#' sps_name <- system.file("extdata", "example_setup.sps",
#'                          package = "asciiSetupReader")
#' sps_example <- parse_setup(sps_name)
#' head(sps_example$setup)
parse_setup <- function(setup_file) {
  setup <- read_setup(setup_file)
  setup[c("setup", "value_labels", "missing")]
}

# Does the work of parse_setup(). Also returns:
#   renamed: a data.frame of the columns whose descriptive name was made
#     unique (column_number, name: the name it would have had, and
#     column_name: the unique name), or NULL
#   commented_lines: the line numbers in the setup file of the missing value
#     sections that are commented out
read_setup <- function(setup_file) {

  if (grepl(".sps(\\.zip)?$|.sps(\\.txt)?$", setup_file, ignore.case = TRUE)) {
    type <- "sps"
  } else {
    type <- "sas"
  }

  lines     <- read_setup_lines(setup_file)
  codebook  <- codebook_from_lines(lines, type = type)
  # Line numbers in codebook are this much less than in the setup file
  line_offset <- length(lines) - length(codebook)
  check_setup_file(codebook, setup_file, type)
  variables <- parse_column_names(codebook, type = type)

  # Column positions: SPSS "DATA LIST" section (up to "VARIABLE LABELS") or
  # SAS "INPUT" section (up to the next blank line or ";"). Each is put
  # into "name begin-end" pieces separated by 2+ spaces for
  # get_column_spaces().
  if (type == "sps") {
    second_grep_value <- grep2("^variable labels$", codebook)
    second_grep_value <- second_grep_value[1]
    if (is.na(second_grep_value)) {
      second_grep_value <- length(codebook)
    }
    setup <- codebook[grep2("DATA LIST|/VARIABLES =$", codebook)[1]:second_grep_value]
    decimals <- parse_decimals(setup, type)
    setup <- gsub("\\([0-9]+\\) |\\.[0-9]+ ", "", setup)
    setup <- join_number_lines(setup)
    setup <- gsub("([[:alpha:]]+[0-9]* [0-9]+) ([[:alpha:]]+[0-9]*)", "\\1   \\2",
                  setup)

    setup <- gsub("([[:alpha:]]+[0-9]*)\\s+", "\\1 ",
                  setup)

    setup <- gsub(" \\(A\\) ", " ", setup)
    setup <- gsub(" ([0-9]+-[0-9]+) ([[:alpha:]])", " \\1   \\2",
                  setup)
    setup <- gsub(" ([0-9]+) ([[:alpha:]])", " \\1   \\2",
                  setup)
    setup <- unlist(strsplit(setup, '"\\s{3,}'))
  } else {
    second_grep_value <- grep("^$|^;$", codebook)[grep("^$|^;$", codebook) > grep2("^INPUT$", codebook) + 5]
    second_grep_value <- second_grep_value[1]
    if (is.na(second_grep_value)) {
      second_grep_value <- length(codebook)
    }
    input_start <- grep2("^INPUT$", codebook)[1]
    setup <- codebook[input_start:second_grep_value]
    if (any(grepl("@\\s*[0-9]", setup))) {
      # Formatted input: "@37 V7 7.1" (see formatted_input()). The INPUT
      # statement runs to its ";", even past blank lines.
      uncommented <- gsub("/\\*.*?\\*/", "", codebook, perl = TRUE)
      input_end <- grep(";", uncommented)
      input_end <- input_end[input_end > input_start][1]
      if (is.na(input_end)) input_end <- length(codebook)
      setup <- formatted_input(codebook[input_start:input_end])
      decimals <- attr(setup, "decimals")
    } else {
      decimals <- parse_decimals(setup, type)
      setup <- gsub("\\([0-9]+\\) |\\.[0-9]+ ", "", setup)
      setup <- join_number_lines(setup)

      setup <- gsub("([[:alpha:]]+[0-9]* [0-9]+) ([[:alpha:]]+[0-9]*)", "\\1   \\2",
                    setup)
      setup <- gsub("([[:alnum:]])\\s{2,}([0-9]+) ", "\\1 \\2 ", setup)
      setup <- gsub("([[:alnum:]])\\s{2,}([0-9]+)$", "\\1 \\2", setup)
      setup <- gsub("([[:alnum:]])\\s{2,}([0-9]+-[0-9]+) ", "\\1 \\2 ", setup)
      setup <- gsub("([[:alnum:]])\\s{2,}([0-9]+-[0-9]+)$", "\\1 \\2", setup)
    }
  }
  setup <- get_column_spaces(setup, variables, codebook)
  setup <- setup[setup$column_number != "*", ]
  if (nrow(setup) == 0) {
    abort("no_positions", "No column positions were found in '",
          basename(setup_file), "'. ", positions_needed(type))
  }
  rownames(setup) <- 1:nrow(setup)

  # SPSS GET DATA files count columns from 0 rather than 1
  if (type == "sps" && !any(grepl2("^DATA LIST", codebook))) {
    setup$begin <- setup$begin + 1
    setup$end   <- setup$end + 1
  }

  setup$decimals <- unname(decimals[match(tolower(setup$column_number),
                                          tolower(names(decimals)))])
  setup$decimals[is.na(setup$decimals)] <- 0

  renamed <- unique_names(setup)
  if (!is.null(renamed)) {
    setup$column_name[match(renamed$column_number, setup$column_number)] <-
      renamed$column_name
  }

  # Missing values and value labels both need the column list
  if (any(grepl2("MISSING VALUE", codebook))) {
    if (type == "sps") {
      missing <- parse_missing_sps(codebook, setup)
    } else {
      missing <- parse_missing_sas(codebook, setup)
    }
  } else {
    missing <- NULL
  }
  missing <- missing[!duplicated(missing), ]

  if (type == "sps") {
    value_labels <- parse_value_labels_sps(codebook, setup)
  } else if (any(grepl2("^value labels$|SAS FORMAT STATEMENT|^format$|\\/\\* format$",
                        codebook))) {
    value_labels <- parse_value_labels_sas(codebook, setup)
  } else {
    value_labels <- NULL
  }
  setup <- list(setup         = setup,
                value_labels  = value_labels,
                missing       = missing,
                renamed       = renamed)
  setup$setup <- setup$setup[, c("column_number",
                                 "column_name",
                                 "begin",
                                 "end",
                                 "decimals")]

  return(setup)

}

# Stops with a clear error for setup files this package can't read: ones
# for delimited (not fixed-width) data and ones with no column positions,
# such as files that only have value labels.
check_setup_file <- function(codebook, setup_file, type) {
  file_name <- basename(setup_file)
  if (type == "sps" && any(grepl2("/\\s*ARRANGEMENT\\s*=\\s*DELIMITED", codebook))) {
    abort("delimited", "'", file_name, "' is for a delimited data file ",
          "(GET DATA /ARRANGEMENT = DELIMITED), not a fixed-width one. ",
          "asciiSetupReader only reads fixed-width files; read the data ",
          "with a function for delimited files, such as read.delim() or ",
          "readr::read_tsv(), instead.")
  }
  if (type == "sps") {
    has_positions <- any(grepl2("DATA LIST|/VARIABLES =$", codebook))
    has_labels    <- any(grepl2("^(ADD )?VALUE LABELS\\b", codebook))
  } else {
    has_positions <- any(grepl2("^INPUT$", codebook))
    has_labels    <- any(grepl2("^PROC FORMAT\\b|^VALUE\\s", codebook))
  }
  if (!has_positions && has_labels) {
    abort("no_positions", "'", file_name, "' has value labels but no ",
          "column positions. ", positions_needed(type), " It looks like a ",
          "file of formats (value labels) that goes with a separate setup ",
          "file; use that setup file instead.")
  }
  if (!has_positions) {
    abort("no_positions", "No column positions were found in '",
          file_name, "'. ", positions_needed(type))
  }
}

positions_needed <- function(type) {
  if (type == "sps") {
    "SPSS setup files need a DATA LIST section giving each column's position."
  } else {
    "SAS setup files need an INPUT section, on its own line, giving each column's position."
  }
}

# Implied decimal places, as a vector of the number of places named by
# column. SPSS writes them in parentheses after the position,
# "V7 37-43 (1)" (or "(F,1)"), or as a format, "V7 36-42 F7.1" (GET DATA
# files); SAS writes them as an informat after the position, "V7 37-43 .1".
# A value with 1 implied decimal place written "0000785" is 78.5.
parse_decimals <- function(lines, type) {
  text <- paste(lines, collapse = " ")
  if (type == "sps") {
    pattern <- paste0("([[:alpha:]@#$][[:alnum:]@#$_.]*)\\s+[0-9]+(?:\\s*-\\s*[0-9]+)?",
                      "\\s*(?:\\((?:[[:alpha:]]+\\s*,\\s*)?([0-9]+)\\)|F[0-9]+\\.([0-9]+))")
  } else {
    pattern <- "([[:alpha:]_][[:alnum:]_]*)\\s+\\$?\\s*[0-9]+(?:\\s*-\\s*[0-9]+)?\\s+\\.([0-9]+)"
  }
  found <- regmatches(text, gregexpr(pattern, text, perl = TRUE))[[1]]
  if (length(found) == 0) {
    return(stats::setNames(integer(0), character(0)))
  }
  parts <- regmatches(found, regexec(pattern, found, perl = TRUE))
  places <- vapply(parts, function(p) {
    p <- p[-(1:2)]
    as.integer(p[nzchar(p)][1])
  }, integer(1))
  names(places) <- vapply(parts, `[`, character(1), 2)
  places[places > 0]
}

# SAS formatted input: "@1 V1 $2.  @3 V2 4.1  V3 2." means V1 starts at
# column 1 and is 2 wide, V2 starts at 3 and is 4 wide with 1 implied
# decimal place, and V3 follows straight after V2. "@n" moves to column n
# and "+n" moves n columns on. Columns can also be given as "V4 10-12".
# Returns "name begin-end" lines for get_column_spaces(), with the implied
# decimal places as the "decimals" attribute.
formatted_input <- function(lines) {
  text <- paste(lines, collapse = " ")
  text <- gsub("/\\*.*?\\*/", " ", text, perl = TRUE)
  text <- gsub("^\\s*INPUT\\b|;", " ", text, ignore.case = TRUE)
  text <- gsub("@\\s+", "@", text)
  text <- gsub("\\$\\s+", "$", text)
  tokens <- strsplit(trimws(text), "\\s+")[[1]]

  informat <- "^\\$?[[:alpha:]]*([0-9]+)\\.([0-9]*)$"
  pointer  <- 1
  name     <- NA_character_
  out      <- character(0)
  decimals <- stats::setNames(integer(0), character(0))
  for (token in tokens) {
    if (grepl("^@[0-9]+$", token)) {
      pointer <- as.numeric(substring(token, 2))
    } else if (grepl("^\\+[0-9]+$", token)) {
      pointer <- pointer + as.numeric(substring(token, 2))
    } else if (!is.na(name) && grepl(informat, token)) {
      width  <- as.numeric(sub(informat, "\\1", token))
      places <- sub(informat, "\\2", token)
      out <- c(out, paste0(name, " ", pointer, "-", pointer + width - 1))
      if (nzchar(places) && as.integer(places) > 0) {
        decimals[name] <- as.integer(places)
      }
      pointer <- pointer + width
      name <- NA_character_
    } else if (!is.na(name) && grepl("^\\$?[0-9]+(-[0-9]+)?$", token)) {
      range <- as.numeric(strsplit(sub("^\\$", "", token), "-")[[1]])
      out <- c(out, paste0(name, " ", range[1], "-", range[length(range)]))
      pointer <- range[length(range)] + 1
      name <- NA_character_
    } else if (grepl("^[[:alpha:]_][[:alnum:]_]*$", token)) {
      name <- token
    }
  }
  attr(out, "decimals") <- decimals
  out
}

# Gives every column a different descriptive name: a name already used by
# an earlier column (in any case) gets that column's short name added, e.g.
# the second "CLOTHING" column, V93, becomes "CLOTHING_V93". The short name
# says which column it is (in PSID files, which wave), and doesn't depend on
# which other columns are read. Returns a data.frame of the renamed columns
# (see read_setup()), or NULL if the names were already unique.
unique_names <- function(setup) {
  names <- setup$column_name
  key   <- tolower(names)
  if (!anyDuplicated(key)) {
    return(NULL)
  }
  changed <- duplicated(key)
  new_names <- names
  new_names[changed] <- paste0(names[changed], "_", setup$column_number[changed])
  # If that is still another column's name, add a number too
  n <- 1
  repeat {
    lower <- tolower(new_names)
    clash <- changed & (duplicated(lower) | duplicated(lower, fromLast = TRUE))
    if (!any(clash)) break
    n <- n + 1
    new_names[clash] <- paste0(names[clash], "_", setup$column_number[clash],
                               "_", n)
  }
  data.frame(column_number = setup$column_number[changed],
             name          = names[changed],
             column_name   = new_names[changed])
}

# A line in the column-position section that starts with a number continues
# the line before it (e.g. a name on one line and its position on the next),
# so it's pasted onto that line. Runs of such lines all join the line above.
join_number_lines <- function(setup) {
  start_with_number <- grep("^[0-9]", setup)
  if (length(start_with_number) > 0) {
    for (n in length(start_with_number):1) {
      setup[start_with_number[n] - 1] <- paste(setup[start_with_number[n] - 1],
                                               setup[start_with_number[n]],
                                               collapse = " ")
    }
    setup <- setup[-start_with_number]
  }
  setup
}

# Fills each NA with the most recent non-NA value before it (leading NAs
# stay NA), like zoo::na.locf(x, na.rm = FALSE).
fill_down <- function(x) {
  last_value <- cummax(seq_along(x) * !is.na(x))
  last_value[last_value == 0] <- NA
  x[last_value]
}

# Missing values ------------------------------------------------------------
#
# Both parsers return a data.frame with one row per column (variable) and
# missing value (values), or NULL. Ranges like "1 thru 5" are expanded to
# one row per value; open-ended ones ("8 thru highest") are left for
# fix_missing(), which needs the data to expand them.

# SPSS: "MISSING VALUES V1 (9, 99) V2 (-1)." or RECODE ... =SYSMIS
# statements, up to the next EXECUTE.
parse_missing_sps <- function(codebook, setup) {
  start <- grep2("MISSING VALUES?$|Convert missing data", codebook)
  if (length(start) == 0) {
    start <- grep2("MISSING VALUE RECODE", codebook)
  }
  end <- grep2("EXECUTE|^\\*.*SPSS", codebook)
  if (length(end) == 0 | all(end <= start)) {
    end <- length(codebook)
  } else {
    end <- min(end[end > start])
  }
  missing <- codebook[start:end]

  missing <- gsub("\\*{10,}.*|.*Convert missing data to system missing.*|SAVE OUTFILE = .*", "", missing)
  missing <- missing[missing != ""]
  missing <- gsub("^RECODE ", "", missing)
  missing <- gsub("^\\(-", " -", missing)

  missing <- gsub('\\"\\s+\\"', '""', missing)
  missing <- gsub("(\\S),(\\S)", "\\1, \\2", missing)
  missing <- gsub("\\s{3,}\\(", " \\(", missing)
  missing <- gsub("\\) ", "\\)   ", missing)
  missing <- gsub(",\\s+(-?[0-9]),", ", \\1,", missing)
  missing <- gsub(",\\s+(-?[0-9])\\)", ", \\1\\)", missing)
  missing <- gsub("([0-9]),([0-9])", "\\1, \\2", missing)
  missing <- gsub("^RECODE (V\\S*) *", "\\1 ", missing)
  missing <- gsub("=SYSMIS", "", missing)
  missing <- gsub("([0-9], ) +(-?[0-9])", "\\1\\2", missing)

  missing <- gsub("([0-9])  (\\(.*\\)\\.)", "\\1 \\2", missing)

  # Split into "V1 (9" / "99)" pieces; pieces without a column name belong
  # to the column before them
  missing <- unlist(strsplit(missing, ",|\\s{2,}"))

  missing <- data.frame(variable = gsub(" .*", "", missing),
                        values = gsub(".*\\(|\\).*", "", missing)
                        )
  missing$variable[missing$variable == ""] <- NA
  missing$variable <- fill_down(missing$variable)
  missing$values <- gsub('\\"', "\\'", missing$values)
  missing$values <- gsub("\\'", "", missing$values)
  missing$values <- trimws(missing$values)

  missing <- missing[missing$variable != missing$values, ]

  missing$variable <- match_case(missing$variable, setup$column_number)

  missing <- missing[missing$variable %in% c(setup$column_number), ]
  if (nrow(missing) > 0) {
    missing <- make_thru_missing_rows(missing)
    rownames(missing) <- 1:nrow(missing)
  } else {
    missing <- NULL
  }
  return(missing)
}

# SAS: "IF V1 = 9 OR V1 = 99 THEN V1 = .;" statements after the MISSING
# VALUE comment, rewritten into the same "V1 (9, 99)" form as SPSS.
parse_missing_sas <- function(codebook, setup) {
  start <- grep2("MISSING VALUE", codebook)
  start <- grep2("^IF", codebook)[grep2("^IF", codebook) > max(start)][1]
  # Some .sas files have "example" code at the beginning which screws this up
  if (is.na(start)) return(NULL)
  end <- grep2("\\*/", codebook)[grep2("\\*/", codebook) > start][1]
  if (is.na(end) | length(end) == 0 | all(end <= start)) {
    end <- length(codebook)
  } else {
    end <- min(end[end > start])
  }
  missing <- codebook[start:end]
  missing <- unlist(strsplit(missing, ";"))
  missing <- trimws(missing)
  missing <- missing[grepl2("^IF", missing)]
  missing <- gsub(" then.*= ?\\..*| then.*= ?\\''.*|^IF ", "", missing, ignore.case = TRUE)
  missing <- gsub(" >= (.+) AND [[:alnum:]]+ <= (.*)", " \\1 thru \\2", missing,
                  ignore.case = TRUE)
  missing <- gsub(" (.*) thru ", " (\\1 thru ", missing,
                  ignore.case = TRUE)
  missing <- gsub("^\\(", "", missing,
                  ignore.case = TRUE)

  missing <- gsub("(\\S),(\\S)", "\\1, \\2", missing)
  missing <- gsub(" = ", "=", missing)
  missing <- gsub("=", " \\(", missing)
  missing <- paste0(missing, ")")
  missing <- gsub("\\)\\)$", "\\)", missing)
  missing <- gsub(" in \\(", " \\(", missing, ignore.case = TRUE)
  missing <- gsub(" GE ([0-9]+)(\\s|\\))", " \\(\\1 thru highest\\) ", missing, ignore.case = TRUE)
  missing <- gsub(" OR ", "    ", missing, ignore.case = TRUE)
  missing <- gsub('\\"', "\\'", missing)
  missing <- gsub("\\' ", "\\') ", missing)
  missing <- gsub("\\'", "", missing)

  missing <- unlist(strsplit(missing, ",|\\s{2,}"))

  missing <- data.frame(variable = gsub(" .*", "", missing),
                        values = gsub(".*\\(|\\).*", "", missing)
                        )
  missing$variable[missing$variable == ""] <- NA
  missing$variable <- fill_down(missing$variable)
  missing$values <- gsub('\\"', "\\'", missing$values)
  missing$values <- gsub("\\'", "", missing$values)
  missing$values <- trimws(missing$values)

  missing <- missing[missing$variable %in% setup$column_number, ]
  if (nrow(missing) > 0) {
    missing <- make_thru_missing_rows(missing)
    rownames(missing) <- 1:nrow(missing)
  } else {
    missing <- NULL
  }
  return(missing)
}

# Expands "1 thru 5" rows into one row per value (1, 2, 3, 4, 5).
make_thru_missing_rows <- function(missing) {
  thru_rows <- missing[grep("[0-9] thru -?[0-9]", missing$values, ignore.case = TRUE), ]

  if (nrow(thru_rows) < 1) {
    return(missing)
  }

  for (i in 1:nrow(thru_rows)) {
    temp <- thru_rows$values[i]
    temp <- strsplit(temp, " thru | THRU ")[[1]]
    values <- temp[1]:temp[2]
    temp <- data.frame(variable = rep(thru_rows$variable[i], length(values)),
                       values = values
                       )
    missing <- rbind(missing, temp)
  }

  # Removes all rows with "thru"
  missing <- missing[-grep("[0-9] thru -?[0-9]", missing$values, ignore.case = TRUE), ]
  return(missing)
}

# Reads the setup file as trimmed lines. For SPSS files, anything before
# DATA LIST is dropped.
parse_codebook <- function(setup_file, type) {
  codebook_from_lines(read_setup_lines(setup_file), type)
}

# Reads the setup file as trimmed lines. Files that aren't valid UTF-8
# (often older files with accented letters) are read as Latin-1.
read_setup_lines <- function(setup_file) {
  lines <- readr::read_lines(setup_file)
  if (!all(validUTF8(lines))) {
    lines <- readr::read_lines(setup_file,
                               locale = readr::locale(encoding = "latin1"))
    inform("encoding", "'", basename(setup_file), "' isn't valid UTF-8 ",
           "text, so it was read as Latin-1 (ISO-8859-1).")
  }
  stringr::str_trim(lines)
}

codebook_from_lines <- function(codebook, type) {
  if (type == "sps") {
    data_list <- grep2("^DATA LIST", codebook)
    if (length(data_list) > 0) {
      codebook <- codebook[data_list[1]:length(codebook)]
    }
  }
  return(codebook)
}

# Returns a data.frame of column_number (short name, e.g. V1) and
# column_name (descriptive label made into a clean name) from the SPSS
# VARIABLE LABELS or SAS LABEL/ATTRIB section. NULL if there isn't one.
parse_column_names <- function(codebook, type) {
  if (type == "sps") {
    variable_label_location <- grep2("^variable labels$", codebook)
    if (length(variable_label_location) == 0) {
      return(NULL)
    }
    next_location <- grep2("^value labels$|missing values|user-defined missing values|^execute$|^.$|\\*RECODE$",
                           codebook)
    next_location <- next_location[next_location > variable_label_location]
    next_location <- next_location[1]
    next_location <- next_location - 1
    if (is.na(next_location)) {
      next_location <- length(codebook) + 1
    }
    variables <- codebook[variable_label_location:next_location]
    variables <- gsub("\\'\\'", "\\'", variables)
    variables <- gsub("( \\'[[:alnum:]])\\'([[:alnum:]])", "\\1\\2",
                      variables)
    variables <- gsub("\'", "\"", variables)
    # Labels continued on the next line end in "+
    plus <- grep('\\"\\+$', variables)
    if (length(plus) > 0) {
      for (n in 1:length(plus)) {
        variables[plus[n] + 1] <- paste(variables[plus[n]],
                                        variables[plus[n] + 1],
                                        collapse = " ")
        variables[plus[n] + 1] <- gsub('\\"\\+ *\\"', "",
                                       variables[plus[n] + 1])
      }
      variables <- variables[-plus]
    }
  } else if (type == "sas") {
    variable_label_location <- grep2("^LABEL$|^ATTRIB$", codebook)
    if (length(variable_label_location) == 0) {
      return(NULL)
    }
    next_location <- grep2("^$|^;", codebook)
    next_location <- next_location[next_location > variable_label_location]
    next_location <- next_location[1]
    if (is.na(next_location)) {
      next_location <- length(codebook)
    }

    # V1 = "Label" (or V1 LABEL="Label" FORMAT=... in ATTRIB statements)
    variables <- codebook[variable_label_location:next_location]
    variables <- variables[grep("=", variables)]
    variables <- gsub('\\"\\s+FORMAT=.*$', '\\"', variables)
    variables <- gsub("(\\S)=", "\\1 =", variables)
    variables <- gsub("=(\\S)", "= \\1", variables)
    variables <- gsub('([[:alpha:]]+\\") ', '\\1   ', variables)

    variables <- gsub(' LABEL =\\"', '  "', variables)
  }
  variables <- unlist(strsplit(variables, '"\\s{3,}'))

  # Keep the meaning of symbols that fix_names() would otherwise turn into _
  variables <- gsub("<", "_under_", variables)
  variables <- gsub(">", "_over_", variables)
  variables <- gsub("\\$", "_dollar_", variables)
  variables <- gsub("\\+", "_plus_", variables)
  variables <- gsub("@", "_at_", variables)
  variables <- gsub("%", "_percent_", variables)

  variables <- gsub("^/", "", variables)
  variables <- gsub('"\\s*(.*?)\\s*"', '"\\1"', variables)
  variables_raw <- variables

  variables <- data.frame(column_name   = fix_names(variables),
                          column_number = gsub(" .*", "",
                                               variables)
                          )
  # A label of only punctuation (e.g. "...") has no clean name, so the
  # column keeps its short name rather than ending the section below
  no_name <- variables$column_name == "" & grepl('"[^"]+"|\'[^\']+\'', variables_raw)
  variables$column_name[no_name] <- variables$column_number[no_name]

  # Stop at the first empty label (the end of the section)
  if (any(grepl("^$", variables$column_name))) {
    variables <- variables[1:(grep("^$", variables$column_name)[1]), ]
  }
  variables <- variables[!variables$column_number %in% "*", ]
  variables <- variables[!duplicated(variables$column_number), ]
  return(variables)
}

