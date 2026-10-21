#' Parse the setup file (.sps or .sas)
#'
#' @param setup_file Name of the SPSS or SAS setup file - should be a .sps or
#'   .sas (.txt also accepted as are these files in zipped format). Whether it
#'   is SPSS or SAS is determined from the file name: names ending in .sps
#'   (optionally followed by .zip or .txt) are SPSS and everything else is SAS.
#'
#'   A setup file that isn't valid UTF-8 text is read as Windows-1252
#'   (Latin-1), with a message.
#'
#' @return A list of length 3. The first object ("setup") is a data frame
#' with 5 columns: column_number, the non-descriptive name of each column
#' (e.g. V1); column_name, its descriptive name; begin and end, the first
#' and last character position of the column in the fixed-width data file;
#' and decimals, the number of implied decimal places the setup file gives
#' the column (0 if none; see \code{\link{read_ascii_setup}}). Descriptive
#' names are made unique: a name already used by an earlier column (in any
#' case) gets the column's short name added, e.g. the second "CLOTHING"
#' column, V93, is "CLOTHING_V93".
#'
#' The second object ("value_labels") is a list of named vectors for the
#' value labels, one per column with value labels. The vector's values are
#' the codes in the data and its names are the labels. If there are no
#' value labels, this will be NULL.
#'
#' The third object ("missing") is a data.frame with three columns. The
#' first column (variable) says the column name, the second (values) says
#' the value that is missing and will be replaced with NA, and the third
#' (commented) is TRUE if the setup file has that missing value commented
#' out. If there are no missing values, this will be NULL.
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
#   replaced_labels: SPSS variables whose value labels in an earlier VALUE
#     LABELS command were replaced by different ones in a later command
#   skipped_missing: SAS IF statements about missing values that couldn't
#     be read
#   recodes: statements that change values rather than mark them missing
#     (SAS "IF v = 1 THEN v = 5", SPSS "RECODE v (1=5)"), which aren't
#     applied
#   text_columns: columns the setup file says are text (SPSS "(A)" or "Aw",
#     SAS "$"), whose missing values are matched exactly rather than as
#     numbers
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
    check_data_list(setup, setup_file)
    decimals <- parse_decimals(setup, type)
    text_columns <- parse_text_columns(setup, type)
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
    # The INPUT statement that isn't commented out, on its own line or with
    # the first column after it, up to its ";" (blank lines don't end it)
    comment_open <- sas_comment_state(codebook)
    input_start <- grep2("^INPUT$", codebook)
    if (length(input_start) == 0) {
      input_start <- grep2("^INPUT\\s+[[:alpha:]_@]", codebook)
    }
    input_start <- c(input_start[!comment_open[input_start]], input_start)[1]
    uncommented <- gsub("/\\*.*?\\*/", "", codebook, perl = TRUE)
    input_end <- grep(";", uncommented)
    input_end <- input_end[input_end >= input_start][1]
    if (is.na(input_end)) {
      input_end <- grep("^$|^;$", codebook)
      input_end <- c(input_end[input_end > input_start + 5], length(codebook))[1]
    }
    setup <- codebook[input_start:input_end]
    setup[1] <- sub("^INPUT\\s*", "", setup[1], ignore.case = TRUE)
    words <- strsplit(trimws(gsub("/\\*.*?\\*/|;", " ", paste(setup, collapse = " "),
                                  perl = TRUE)), "\\s+")[[1]]
    if (any(grepl("^#[0-9]+$|^/$", words))) {
      abort("unsupported_input", "The SAS INPUT statement in '",
            basename(setup_file), "' reads several lines (records) per ",
            "case (#n or /), which asciiSetupReader can't read.")
    }
    informat <- "^\\$?([[:alpha:]_][[:alnum:]_]*?)?[0-9]+\\.[0-9]*$"
    if (any(grepl("@\\s*[0-9]", setup)) || any(grepl(informat, words))) {
      # Formatted input: "@37 V7 7.1" or "V7 7.1" (see formatted_input())
      setup <- formatted_input(codebook[input_start:input_end])
      decimals <- attr(setup, "decimals")
      text_columns <- attr(setup, "text")
    } else {
      decimals <- parse_decimals(setup, type)
      text_columns <- parse_text_columns(setup, type)
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
  rownames(setup) <- seq_len(nrow(setup))

  # SPSS GET DATA files count columns from 0 rather than 1
  if (type == "sps" && any(grepl2("^GET DATA", codebook)) &&
      !any(grepl2("DATA LIST", codebook))) {
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
  if (type == "sps" && any(grepl2("MISSING VALUE", codebook))) {
    missing <- parse_missing_sps(codebook, setup)
  } else if (type == "sas") {
    missing <- parse_missing_sas(codebook, setup, after = input_end)
  } else {
    missing <- NULL
  }
  skipped_missing <- attr(missing, "skipped")
  recodes <- attr(missing, "recodes")
  if (length(missing) == 0) missing <- NULL
  commented_lines <- attr(missing, "line") + line_offset
  missing <- missing[!duplicated(missing), ]

  if (type == "sps") {
    value_labels <- parse_value_labels_sps(codebook, setup)
  } else if (any(grepl2("^value labels$|SAS FORMAT STATEMENT|^format$|\\/\\* format$",
                        codebook))) {
    value_labels <- parse_value_labels_sas(codebook, setup)
  } else {
    value_labels <- NULL
  }
  replaced_labels <- attr(value_labels, "replaced")
  attr(value_labels, "replaced") <- NULL
  setup <- list(setup           = setup,
                value_labels    = value_labels,
                missing         = missing,
                renamed         = renamed,
                commented_lines = if (any(missing$commented)) commented_lines,
                replaced_labels = replaced_labels,
                skipped_missing = skipped_missing,
                recodes         = recodes,
                text_columns    = match_case(text_columns, setup$column_number),
                skip            = lines_to_skip(codebook, type))
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
    infile <- grep2("^INFILE\\b", codebook)
    infile <- infile[!sas_comment_state(codebook)[infile]]
    if (any(grepl2("\\b(DLM|DELIMITER|DSD)\\b", codebook[infile]))) {
      abort("delimited", "'", file_name, "' is for a delimited data file ",
            "(INFILE ... DLM= or DSD), not a fixed-width one. ",
            "asciiSetupReader only reads fixed-width files; read the data ",
            "with a function for delimited files, such as read.csv() or ",
            "readr::read_delim(), instead.")
    }
    has_positions <- any(grepl2("^INPUT$|^INPUT\\s+[[:alpha:]_@]", codebook))
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

# Stops with a clear error for SPSS DATA LIST forms this package can't
# read, rather than reading the wrong columns: several records (lines) per
# case, several variables sharing one column range ("Q1 TO Q3 3-5") and
# positions implied by formats ("ID (F3) NAME (A5)").
check_data_list <- function(lines, setup_file) {
  # Only the DATA LIST (or GET DATA) command itself, up to its closing
  # period; a FORMATS command after it can have "V1 (F7.3)"
  lines <- gsub("/\\*.*?(\\*/|$)", " ", lines, perl = TRUE)
  end <- which(endsWith(trimws(lines), "."))[1]
  if (!is.na(end)) lines <- lines[seq_len(end)]
  text <- paste(lines, collapse = " ")
  file_name <- basename(setup_file)
  records <- regmatches(text, regexec("(?i)RECORDS\\s*=\\s*([0-9]+)", text, perl = TRUE))[[1]]
  fixcase <- regmatches(text, regexec("(?i)/FIXCASE\\s*=\\s*([0-9]+)", text, perl = TRUE))[[1]]
  if ((length(records) && as.numeric(records[2]) > 1) ||
      (length(fixcase) && as.numeric(fixcase[2]) > 1) ||
      grepl("(^|\\s)/\\s*([2-9]|[1-9][0-9]+)\\b", text, perl = TRUE)) {
    abort("unsupported_input", "'", file_name, "' reads several lines ",
          "(records) per case, which asciiSetupReader can't read.")
  }
  if (grepl("(?i)\\b[[:alpha:]][[:alnum:]_.]*\\s+TO\\s+[[:alpha:]][[:alnum:]_.]*\\s+[0-9]+",
            text, perl = TRUE)) {
    abort("unsupported_input", "'", file_name, "' gives several variables ",
          "one column range (e.g. \"Q1 TO Q3 3-5\"), which asciiSetupReader ",
          "can't read.")
  }
  if (!grepl("(?i)/VARIABLES", text, perl = TRUE) &&
      grepl(paste0("(?i)\\b[[:alpha:]][[:alnum:]_.]*\\s*\\((?:F|A|N|E|Z|DOLLAR|",
                   "COMMA|DOT|PCT|DATE|ADATE|EDATE|SDATE|JDATE|TIME|DATETIME)",
                   "[0-9]"), text, perl = TRUE)) {
    abort("unsupported_input", "'", file_name, "' gives columns by format ",
          "only (e.g. \"ID (F3) NAME (A5)\"), not by position, which ",
          "asciiSetupReader can't read.")
  }
}

# The number of lines before the first case: SPSS DATA LIST SKIP = n or
# GET DATA /FIRSTCASE = n, SAS INFILE FIRSTOBS = n.
lines_to_skip <- function(codebook, type) {
  if (type == "sps") {
    # Only the DATA LIST or GET DATA command, before VARIABLE LABELS
    end <- c(grep2("^variable labels", codebook), length(codebook))[1]
    lines <- codebook[seq_len(end)]
    lines <- lines[!startsWith(lines, "*")]
    pattern <- "(?i)(?:\\bSKIP|/FIRSTCASE)\\s*=\\s*([0-9]+)"
  } else {
    lines <- codebook[grepl("^INFILE\\b", codebook, ignore.case = TRUE) &
                        !sas_comment_state(codebook)]
    pattern <- "(?i)\\bFIRSTOBS\\s*=\\s*([0-9]+)"
  }
  found <- regmatches(lines, regexec(pattern, lines, perl = TRUE))
  found <- unlist(lapply(found, function(m) if (length(m)) m[1:2]))
  if (length(found) == 0) return(0)
  n <- as.numeric(found[2])
  # SKIP = n skips n lines; FIRSTCASE / FIRSTOBS = n starts at line n
  if (grepl("SKIP", found[1], ignore.case = TRUE)) n else max(n - 1, 0)
}

positions_needed <- function(type) {
  if (type == "sps") {
    "SPSS setup files need a DATA LIST section giving each column's position."
  } else {
    "SAS setup files need an INPUT section, on its own line, giving each column's position."
  }
}

# Implied decimal places, as a vector of the number of places named by
# column. SPSS DATA LIST writes them in parentheses after the position,
# "V7 37-43 (1)" (or "(F,1)"); SAS writes them as an informat after the
# position, "V7 37-43 .1". A value with 1 implied decimal place written
# "0000785" is 78.5. SPSS GET DATA files have none: IBM says GET DATA
# doesn't read implied decimals, so its "F7.1" formats are ignored.
parse_decimals <- function(lines, type) {
  text <- paste(lines, collapse = " ")
  if (type == "sps") {
    pattern <- paste0("([[:alpha:]@#$][[:alnum:]@#$_.]*)\\s+[0-9]+(?:\\s*-\\s*[0-9]+)?",
                      "\\s*\\((?:[[:alpha:]]+\\s*,\\s*)?([0-9]+)\\)")
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

# The columns the setup file says are text: SPSS "V1 1-2 (A)" or, in GET
# DATA files, "V1 0-1 A2"; SAS "V1 $ 1-2". Their missing values are
# matched exactly, not as numbers.
parse_text_columns <- function(lines, type) {
  text <- paste(lines, collapse = " ")
  if (type == "sps") {
    # A bare "A2" is a format only in GET DATA files; in DATA LIST it could
    # be the next column's name
    get_data <- any(grepl("/VARIABLES", lines, ignore.case = TRUE))
    pattern <- paste0("([[:alpha:]@#$][[:alnum:]@#$_.]*)\\s+[0-9]+(?:\\s*-\\s*[0-9]+)?",
                      "\\s*(?:\\(A[0-9]*\\)", if (get_data) "|A[0-9]+\\b", ")")
  } else {
    pattern <- "([[:alpha:]_][[:alnum:]_]*)\\s*\\$"
  }
  found <- regmatches(text, gregexpr(pattern, text, perl = TRUE, ignore.case = TRUE))[[1]]
  unique(sub("^([^[:space:]$]+).*$", "\\1", found))
}

# SAS formatted input: "@1 V1 $2.  @3 V2 4.1  V3 2." means V1 starts at
# column 1 and is 2 wide, V2 starts at 3 and is 4 wide with 1 implied
# decimal place, and V3 follows straight after V2. "@n" moves to column n
# and "+n" moves n columns on. Columns can also be given as "V4 10-12".
# Returns "name begin-end" lines for get_column_spaces(), with the implied
# decimal places as the "decimals" attribute and the text ("$") columns as
# the "text" attribute. Stops with an error for what it can't read (several
# records per case, or lists of variables in parentheses) rather than
# placing columns wrongly.
formatted_input <- function(lines) {
  text <- paste(lines, collapse = " ")
  text <- gsub("/\\*.*?\\*/", " ", text, perl = TRUE)
  text <- gsub("^\\s*INPUT\\b|;", " ", text, ignore.case = TRUE)
  text <- gsub("@\\s+", "@", text)
  text <- gsub("\\$\\s+", "$", text)
  text <- gsub("([0-9]+)\\s*-\\s*([0-9]+)", "\\1-\\2", text)
  tokens <- strsplit(trimws(text), "\\s+")[[1]]

  # An informat: optional $, a name (e.g. COMMA, $CHAR, MMDDYY), the width
  # and the decimal places. Only numeric informats imply decimal places.
  informat <- "^(\\$?)([[:alpha:]_][[:alnum:]_]*?)?([0-9]+)\\.([0-9]*)$"
  numeric_informats <- c("", "F", "BEST", "COMMA", "COMMAX", "DOLLAR",
                         "DOLLARX", "NUMX", "BZ", "ZD")
  pointer  <- 1
  name     <- NA_character_
  out      <- character(0)
  text_columns <- character(0)
  decimals <- stats::setNames(integer(0), character(0))
  for (token in tokens) {
    if (grepl("^@[0-9]+$", token)) {
      pointer <- as.numeric(substring(token, 2))
    } else if (grepl("^\\+[0-9]+$", token)) {
      pointer <- pointer + as.numeric(substring(token, 2))
    } else if (token %in% c("@", "@@")) {
      # Holding the line for another INPUT statement: no columns
    } else if (grepl("^#[0-9]+$|^/$", token)) {
      abort("unsupported_input", "This SAS INPUT statement reads several ",
            "lines (records) per case (", token, "), which asciiSetupReader ",
            "can't read.")
    } else if (!is.na(name) && grepl(informat, token, perl = TRUE)) {
      parts  <- regmatches(token, regexec(informat, token, perl = TRUE))[[1]]
      width  <- as.numeric(parts[4])
      places <- parts[5]
      out <- c(out, paste0(name, " ", pointer, "-", pointer + width - 1))
      if (nzchar(parts[2])) text_columns <- c(text_columns, name)
      if (nzchar(places) && as.integer(places) > 0 && !nzchar(parts[2]) &&
          toupper(parts[3]) %in% numeric_informats) {
        decimals[name] <- as.integer(places)
      }
      pointer <- pointer + width
      name <- NA_character_
    } else if (!is.na(name) && grepl("^\\$?[0-9]+(-[0-9]+)?$", token)) {
      range <- as.numeric(strsplit(sub("^\\$", "", token), "-")[[1]])
      out <- c(out, paste0(name, " ", range[1], "-", range[length(range)]))
      if (startsWith(token, "$")) text_columns <- c(text_columns, name)
      pointer <- range[length(range)] + 1
      name <- NA_character_
    } else if (grepl("^[[:alpha:]_][[:alnum:]_]*$", token)) {
      name <- token
    } else if (grepl("^\\$", token) && !is.na(name)) {
      # "$" on its own before a width or informat
      text_columns <- c(text_columns, name)
    } else {
      abort("unsupported_input", "asciiSetupReader can't read this part of ",
            "the SAS INPUT statement: '", token, "'.")
    }
  }
  attr(out, "decimals") <- decimals
  attr(out, "text") <- unique(text_columns)
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
  # Rarely that is still taken (by another column's name or another new
  # name); then a number is added too, counting up until it's free. Names
  # that weren't changed are never touched, so this always ends.
  lower <- tolower(new_names)
  if (anyDuplicated(lower)) {
    taken <- new.env(hash = TRUE)
    for (x in lower[!changed]) assign(x, TRUE, envir = taken)
    for (i in which(changed)) {
      candidate <- new_names[i]
      n <- 1
      while (exists(tolower(candidate), envir = taken, inherits = FALSE)) {
        n <- n + 1
        candidate <- paste0(new_names[i], "_", n)
      }
      new_names[i] <- candidate
      assign(tolower(candidate), TRUE, envir = taken)
    }
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
    for (n in rev(seq_along(start_with_number))) {
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

# Both also say whether the section is commented out (the commented
# column) and give the line it starts on (the "line" attribute).

# SPSS: "MISSING VALUES V1 (9, 99) V2 (-1)." or RECODE ... =SYSMIS
# statements, up to the next EXECUTE. The statement can start on the
# MISSING VALUES line, and a list of columns ("V1 V2 (9)" or
# "V1 TO V5 (9)") shares the missing values that follow it.
parse_missing_sps <- function(codebook, setup) {
  # A file can have more than one section, e.g. a commented-out one and one
  # that isn't; each runs to the next section or EXECUTE, and a MISSING
  # VALUES command also ends at the "." that ends its last line
  starts <- grep2("MISSING VALUES?$|Convert missing data", codebook)
  starts <- sort(unique(c(starts, same_line_start(codebook, "MISSING VALUES?",
                                                  c(setup$column_number, "ALL")))))
  if (length(starts) == 0) {
    starts <- grep2("MISSING VALUE RECODE", codebook)[1]
  }
  # e.g. only a comment that mentions "MISSING VALUES"
  if (length(starts) == 0 || is.na(starts[1])) {
    return(NULL)
  }
  ends <- grep2("EXECUTE|^\\*.*SPSS", codebook)
  recodes <- character(0)
  sections <- lapply(seq_along(starts), function(k) {
    start <- starts[k]
    end <- ends[ends > start][1]
    if (is.na(end)) end <- length(codebook)
    if (k < length(starts)) end <- min(end, starts[k + 1] - 1)
    command <- grepl2("^\\*?\\s*MISSING VALUES?\\b", codebook[start])
    if (command) {
      period <- which(endsWith(codebook[start:end], "."))[1]
      if (!is.na(period)) end <- start + period - 1
    }
    lines <- codebook[start:end]
    if (!command) {
      # RECODE groups to a value other than SYSMIS, e.g. (1=5), change
      # values rather than mark them missing; they aren't applied
      group <- "\\([^()]*=(?![^()]*SYSMIS)[^()]*\\)"
      has_recode <- grepl(group, lines, perl = TRUE, ignore.case = TRUE)
      recodes <<- c(recodes, lines[has_recode])
      lines <- gsub(group, " ", lines, perl = TRUE, ignore.case = TRUE)
    }
    section <- parse_missing_section_sps(lines, setup, start)
    if (!is.null(section)) {
      section$section <- k
      section$command <- command
    }
    section
  })
  missing <- combine_missing(sections)
  if (length(recodes) > 0) {
    if (is.null(missing)) missing <- list()
    attr(missing, "recodes") <- unique(recodes)
  }
  missing
}

# The marker for "V1 ()", which clears V1's missing values
clear_marker <- "\001clear\001"

# Parses one missing values section (the lines of codebook from line
# `start`) of an SPSS file.
parse_missing_section_sps <- function(missing, setup, start) {

  # Commented out if the statement itself starts with "*" (the section can
  # start with a comment saying what follows, e.g. "* SPSS MISSING VALUE
  # RECODE *." before RECODE statements)
  statement <- grep2("^\\*?\\s*(MISSING VALUES?|RECODE)\\b", missing)[1]
  commented <- !is.na(statement) && startsWith(missing[statement], "*")

  missing <- sub("^\\*?\\s*MISSING VALUES?\\s*", "", missing, ignore.case = TRUE)
  missing <- gsub("\\*{10,}.*|.*Convert missing data to system missing.*|SAVE OUTFILE = .*", "", missing)
  missing <- missing[missing != ""]
  missing <- gsub("^RECODE ", "", missing)
  # "V1 ()" clears V1's missing values; "/" can separate columns on a line;
  # ALL is every column
  missing <- gsub("\\(\\s*\\)", paste0("(", clear_marker, ")"), missing)
  missing <- gsub("\\)\\s*/\\s*", ")   ", missing)
  missing <- gsub("^/\\s*", "", missing)
  missing <- sub("^ALL\\s*\\(", paste0(paste(setup$column_number, collapse = " "), " ("),
                 missing, ignore.case = TRUE)
  missing <- expand_column_lists(missing, setup$column_number)
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
  finish_missing(missing, commented, start)
}

# Joins the missing values of several sections. As in SPSS, a MISSING
# VALUES command replaces the missing values earlier commands gave a column
# (compared separately among commented-out and active commands), and
# "V1 ()" leaves it none. A value in both a commented-out section and one
# that isn't counts as not commented out. The "line" attribute is the first
# line of each commented-out section used.
combine_missing <- function(sections) {
  sections <- Filter(Negate(is.null), sections)
  if (length(sections) == 0) {
    return(NULL)
  }
  lines <- unlist(lapply(sections, function(s) {
    if (all(s$commented)) attr(s, "line")
  }))
  missing <- do.call(rbind, sections)
  if (!is.null(missing$section)) {
    group <- paste(missing$variable, missing$commented)
    last  <- stats::ave(ifelse(missing$command, missing$section, -Inf), group,
                        FUN = max)
    missing <- missing[!missing$command | missing$section == last, ]
    missing <- missing[missing$values != clear_marker, ]
    missing$section <- NULL
    missing$command <- NULL
    if (nrow(missing) == 0) return(NULL)
  }
  key  <- paste(missing$variable, missing$values, sep = "\r")
  drop <- missing$commented & key %in% key[!missing$commented]
  missing <- missing[!drop, ]
  rownames(missing) <- NULL
  attr(missing, "line") <- lines
  missing
}

# Expands "V1 TO V3" and "V1 V2" column lists before a parenthesised list
# of values into one "column (values)" piece per column, e.g.
# "V1 TO V3 (9)" becomes "V1 (9)   V2 (9)   V3 (9)". Only lists made
# entirely of columns in the setup file (in file order) are expanded.
expand_column_lists <- function(lines, columns) {
  # Only lines with two or more names before a "(" can have a list
  pattern <- "((?:[[:alpha:]@#$][[:alnum:]@#$_.]*\\s+){2,})(\\([^)]*\\))"
  has_list <- grepl(pattern, lines, perl = TRUE)
  if (!any(has_list)) return(lines)
  lower_columns <- tolower(columns)
  lines[has_list] <- vapply(lines[has_list], function(line) {
    found <- gregexpr(pattern, line, perl = TRUE)[[1]]
    pieces <- regmatches(line, list(found))[[1]]
    expanded <- vapply(pieces, function(piece) {
      names  <- strsplit(trimws(sub("\\(.*$", "", piece)), "\\s+")[[1]]
      values <- sub("^[^(]*", "", piece)
      names  <- expand_to(names, columns, lower_columns)
      if (is.null(names) || length(names) < 2) return(piece)
      paste(paste(names, values), collapse = "   ")
    }, character(1))
    regmatches(line, list(found)) <- list(expanded)
    line
  }, character(1), USE.NAMES = FALSE)
  lines
}

# The columns in a list such as c("V1", "TO", "V3", "V7"), with each
# "A TO B" expanded to every column from A to B in the order of columns.
# NULL if anything in the list isn't a column. lower_columns is
# tolower(columns), passed in so it's only computed once per file.
expand_to <- function(names, columns, lower_columns = tolower(columns)) {
  position <- match(tolower(names), lower_columns)
  is_to <- toupper(names) == "TO"
  if (any(is.na(position) & !is_to)) return(NULL)
  out <- character(0)
  i <- 1
  while (i <= length(names)) {
    if (is_to[i]) {
      if (i == 1 || i == length(names) || is_to[i + 1]) return(NULL)
      from <- position[i - 1]
      to   <- position[i + 1]
      if (to < from) return(NULL)
      if (to > from) out <- c(out, columns[seq(from + 1, to)])
      i <- i + 2
    } else {
      out <- c(out, columns[position[i]])
      i <- i + 1
    }
  }
  out
}

# Lines where a command (e.g. "MISSING VALUES") is followed on the same
# line by one of the columns, as in "MISSING VALUES V1 (9)." Comment text
# that happens to start with the command's name isn't matched. Commands
# commented out with "*" are included if commented.
same_line_start <- function(codebook, command, columns, commented = TRUE) {
  pattern <- paste0(if (commented) "^\\*?\\s*" else "^", command,
                    "\\s+/?([^[:space:](/]+)")
  lines <- grep2(pattern, codebook)
  first <- regmatches(codebook[lines],
                      regexec(pattern, codebook[lines], ignore.case = TRUE))
  # The last group is the column (command can have groups of its own)
  first <- vapply(first, function(m) m[length(m)], character(1))
  lines[tolower(first) %in% tolower(columns)]
}

# Adds the commented column and the "line" attribute to the parsed missing
# values, and expands "1 thru 5" ranges. NULL if there are none.
finish_missing <- function(missing, commented, line) {
  if (nrow(missing) == 0) {
    return(NULL)
  }
  missing <- make_thru_missing_rows(missing)
  rownames(missing) <- seq_len(nrow(missing))
  missing$commented <- commented
  attr(missing, "line") <- line
  missing
}

# SAS: "IF V1 = 9 OR V1 = 99 THEN V1 = .;" statements after the INPUT
# statement (line `after`), whether commented out or not. Only statements
# that set the column they test to missing (". ", ".A", "''" or "' '") are
# used, with conditions made of "=" (EQ), "IN (...)", ">=" (GE), "<=" (LE),
# ">= a AND <= b" and OR; others are listed in the "skipped" attribute
# rather than misread.
parse_missing_sas <- function(codebook, setup, after = 0) {
  statements <- sas_statements(codebook, from = after + 1)
  statements <- statements[grepl("^\\*?\\s*IF\\b", statements$text, ignore.case = TRUE), ]
  if (nrow(statements) == 0) return(NULL)

  rows    <- list()
  skipped <- character(0)
  recodes <- character(0)
  for (i in seq_len(nrow(statements))) {
    parsed <- sas_missing_statement(sub("^\\*\\s*", "", statements$text[i]))
    if (is.null(parsed)) {
      if (is_sas_recode(statements$text[i])) {
        recodes <- c(recodes, statements$text[i])
      } else {
        skipped <- c(skipped, statements$text[i])
      }
      next
    }
    parsed$commented <- statements$commented[i]
    parsed$line <- statements$line[i]
    rows[[length(rows) + 1]] <- parsed
  }
  missing <- do.call(rbind, rows)
  if (is.null(missing)) {
    return(structure(list(), skipped = skipped, recodes = recodes))
  }
  missing$variable <- match_case(missing$variable, setup$column_number)
  missing <- missing[missing$variable %in% setup$column_number, ]
  if (nrow(missing) == 0) {
    return(structure(list(), skipped = skipped, recodes = recodes))
  }
  # Values in both a commented-out and an active statement count as active
  key <- paste(missing$variable, missing$values, sep = "\r")
  missing <- missing[!(missing$commented & key %in% key[!missing$commented]), ]
  # Codes that are the same number (9 and 0000009, as in a file with the
  # same section written twice) only need to be listed once: the last
  number <- suppressWarnings(as.numeric(missing$values))
  same <- paste(missing$variable, ifelse(is.na(number), missing$values, number),
                sep = "\r")
  missing <- missing[!duplicated(same, fromLast = TRUE), ]
  # The line each run of commented-out statements starts on
  commented_lines <- missing$line[missing$commented]
  commented_lines <- sort(unique(commented_lines))
  commented_lines <- commented_lines[c(TRUE, diff(commented_lines) > 3)]

  out <- make_thru_missing_rows(missing[c("variable", "values")])
  out$commented <- missing$commented[match(out$variable, missing$variable)]
  # Row-level commented status (a column could have both)
  key_out <- paste(out$variable, out$values, sep = "\r")
  key_in  <- paste(missing$variable, missing$values, sep = "\r")
  known   <- key_out %in% key_in
  out$commented[known] <- missing$commented[match(key_out[known], key_in)]
  rownames(out) <- NULL
  attr(out, "line") <- commented_lines
  attr(out, "skipped") <- skipped
  attr(out, "recodes") <- recodes
  out
}

# TRUE for a SAS IF statement that sets a column to a value rather than to
# missing, e.g. "IF V1 = 1 THEN V1 = 5" (a recode, which isn't applied).
is_sas_recode <- function(statement) {
  target <- regmatches(statement,
                       regexec("(?i)\\bTHEN\\s+[[:alpha:]_][[:alnum:]_]*\\s*=\\s*(.+)$",
                               statement, perl = TRUE))[[1]]
  length(target) == 2 &&
    !grepl("^(\\.[[:alpha:]_]?|''|' '|\"\"|\" \")\\s*$", trimws(target[2]))
}

# Splits SAS code (from line `from` on) into statements ending in ";".
# Returns a data.frame of each statement's text (with /* */ comments and
# their markers removed), the line its first word is on, and whether that
# word is inside a /* */ comment or the statement is a "* ...;" comment.
sas_statements <- function(codebook, from = 1) {
  if (from > length(codebook)) {
    return(data.frame(text = character(0), line = integer(0), commented = logical(0)))
  }
  lines <- codebook[from:length(codebook)]
  open_at_start <- sas_comment_state(lines)
  text <- character(0); line <- integer(0); commented <- logical(0)
  buffer <- ""; first_line <- NA_integer_; first_commented <- NA
  for (i in seq_along(lines)) {
    pieces <- strsplit(paste0(lines[i], " "), ";", fixed = TRUE)[[1]]
    for (k in seq_along(pieces)) {
      piece <- pieces[k]
      # A comment that opens and closes here isn't the statement's start
      blanked <- piece
      closed <- gregexpr("/\\*.*?\\*/", blanked, perl = TRUE)
      regmatches(blanked, closed) <- lapply(regmatches(blanked, closed),
                                            function(m) strrep(" ", nchar(m)))
      visible <- trimws(gsub("/\\*|\\*/", " ", blanked))
      if (is.na(first_line) && nzchar(visible)) {
        first_line <- i
        # Is the first word inside a comment? Follow the /* and */ markers
        # on this line up to it
        word_at <- regexpr("[^[:space:]/*]", blanked)
        before  <- paste0(paste(pieces[seq_len(k - 1)], collapse = ";"),
                          if (k > 1) ";", substr(piece, 1, word_at - 1))
        first_commented <- sas_comment_state(c(lines[i], ""),
                                             prefix = before,
                                             open = open_at_start[i])[2] ||
          startsWith(visible, "*")
      }
      buffer <- paste(buffer, piece)
      if (k < length(pieces)) {
        if (!is.na(first_line)) {
          clean <- gsub("/\\*.*?\\*/", " ", buffer, perl = TRUE)
          clean <- trimws(gsub("\\s+", " ", gsub("/\\*|\\*/", " ", clean)))
          text <- c(text, clean)
          line <- c(line, first_line + from - 1)
          commented <- c(commented, first_commented)
        }
        buffer <- ""; first_line <- NA_integer_; first_commented <- NA
      }
    }
  }
  data.frame(text = text, line = line, commented = commented)
}

# Whether a /* */ comment is open at the start of each line, given whether
# one is open before the first (`open`). Quoted text can't open or close
# one. If `prefix` is given, only that much of the first line is followed.
sas_comment_state <- function(lines, prefix = NULL, open = FALSE) {
  state <- logical(length(lines))
  for (i in seq_along(lines)) {
    state[i] <- open
    line <- if (i == 1 && !is.null(prefix)) prefix else lines[i]
    line <- gsub("'[^']*'|\"[^\"]*\"", "", line)
    for (m in regmatches(line, gregexpr("/\\*|\\*/", line))[[1]]) {
      open <- m == "/*"
    }
  }
  state
}

# Reads one SAS "IF ... THEN v = .;" statement (without the ";") into a
# data.frame of variable and values, in the "1 thru 5", "5 thru highest"
# and "lowest thru 5" forms the SPSS reader also gives. NULL if it isn't a
# statement this reads correctly.
sas_missing_statement <- function(statement) {
  name  <- "[[:alpha:]_][[:alnum:]_]*"
  number <- "-?(?:[0-9]+\\.?[0-9]*|\\.[0-9]+)"
  value <- paste0("(?:", number, "|'[^']*'|\"[^\"]*\")")
  list_ <- paste0("\\(\\s*", value, "(?:\\s*,?\\s*", value, ")*\\s*\\)")
  atom  <- paste0("(?:", name, "\\s*(?:=|\\bEQ\\b)\\s*", value,
                  "|", name, "\\s+IN\\s*", list_,
                  "|", name, "\\s*(?:>=|\\bGE\\b)\\s*", value,
                  "(?:\\s+AND\\s+", name, "\\s*(?:<=|\\bLE\\b)\\s*", value, ")?",
                  "|", name, "\\s*(?:<=|\\bLE\\b)\\s*", value, ")")
  atom_p <- paste0("\\(?\\s*", atom, "\\s*\\)?")
  pattern <- paste0("^IF\\s+(", atom_p, "(?:\\s+OR\\s+", atom_p, ")*)\\s+THEN\\s+(",
                    name, ")\\s*=\\s*(?:\\.[[:alpha:]_]?|''|' '|\"\"|\" \")$")
  if (!grepl(pattern, statement, ignore.case = TRUE, perl = TRUE)) return(NULL)
  parts <- regmatches(statement, regexec(pattern, statement, ignore.case = TRUE, perl = TRUE))[[1]]
  condition <- parts[2]
  target <- parts[3]
  # Every column the condition tests must be the one set to missing
  words <- regmatches(gsub("'[^']*'|\"[^\"]*\"", " ", condition),
                      gregexpr(name, gsub("'[^']*'|\"[^\"]*\"", " ", condition)))[[1]]
  words <- words[!toupper(words) %in% c("IN", "OR", "AND", "EQ", "GE", "LE")]
  if (!all(tolower(words) == tolower(target))) return(NULL)

  values <- character(0)
  token <- paste0("'[^']*'|\"[^\"]*\"|", name, "|", number)
  for (a in strsplit(condition, "(?i)\\s+OR\\s+", perl = TRUE)[[1]]) {
    a <- trimws(gsub("^\\(|\\)$", "", trimws(a)))
    # The values are the tokens that aren't names (so V1's 1 isn't one)
    found <- regmatches(a, gregexpr(token, a, perl = TRUE))[[1]]
    found <- found[!grepl(paste0("^", name, "$"), found)]
    found <- gsub("^['\"]|['\"]$", "", found)
    if (grepl("\\bIN\\b", a, ignore.case = TRUE)) {
      values <- c(values, trimws(found))
    } else if (grepl(">=|\\bGE\\b", a, ignore.case = TRUE)) {
      values <- c(values, if (length(found) == 2) paste(found[1], "thru", found[2])
                          else paste(found[1], "thru highest"))
    } else if (grepl("<=|\\bLE\\b", a, ignore.case = TRUE)) {
      values <- c(values, paste("lowest thru", found[1]))
    } else {
      values <- c(values, trimws(found))
    }
  }
  data.frame(variable = target, values = values)
}

# TRUE if line `line` of codebook is inside a /* ... */ comment or is a
# "* ...;" comment statement.
in_sas_comment <- function(codebook, line) {
  if (startsWith(codebook[line], "*")) return(TRUE)
  before <- paste(codebook[seq_len(line - 1)], collapse = "\n")
  # Closed /* */ comments, then quoted text and "* ...;" comment statements,
  # which can mention "/*" without starting a comment
  before <- gsub("(?s)/\\*.*?\\*/", "", before, perl = TRUE)
  before <- gsub("'[^'\n]*'|\"[^\"\n]*\"", "", before, perl = TRUE)
  before <- gsub("(?m)^\\s*\\*[^;]*;", "", before, perl = TRUE)
  grepl("/*", before, fixed = TRUE)
}

# Expands "1 thru 5" rows into one row per value (1, 2, 3, 4, 5).
# Only ranges of up to 1,000 whole numbers are expanded; others (such as
# "1000000 thru 9999999" or "99.5 thru 99.9") stay as one row, which
# fix_missing() compares with the data as numbers.
make_thru_missing_rows <- function(missing) {
  pattern <- "^\\s*(-?[0-9]*\\.?[0-9]+)\\s+thru\\s+(-?[0-9]*\\.?[0-9]+)\\s*$"
  is_thru <- grepl(pattern, missing$values, ignore.case = TRUE)
  if (!any(is_thru)) {
    return(missing)
  }
  from <- as.numeric(sub(pattern, "\\1", missing$values, ignore.case = TRUE))
  to   <- as.numeric(sub(pattern, "\\2", missing$values, ignore.case = TRUE))
  expand <- is_thru & from == round(from) & to == round(to) & to >= from &
    to - from < 1000
  expand[is.na(expand)] <- FALSE
  if (!any(expand)) {
    return(missing)
  }

  for (i in which(expand)) {
    values <- seq(from[i], to[i])
    missing <- rbind(missing,
                     data.frame(variable = rep(missing$variable[i], length(values)),
                                values = as.character(values)))
  }
  # Removes the expanded "thru" rows
  missing[-which(expand), ]
}

# Reads the setup file as trimmed lines. For SPSS files, anything before
# DATA LIST is dropped.
parse_codebook <- function(setup_file, type) {
  codebook_from_lines(read_setup_lines(setup_file), type)
}

# Reads the setup file as trimmed lines. Files that aren't valid UTF-8
# (often older files with accented letters) are read as Windows-1252, which
# is Latin-1 plus curly quotes and dashes in bytes 0x80-0x9F; if that
# fails, as Latin-1.
read_setup_lines <- function(setup_file) {
  lines <- readr::read_lines(setup_file)
  if (!all(validUTF8(lines))) {
    lines <- tryCatch(
      readr::read_lines(setup_file,
                        locale = readr::locale(encoding = "windows-1252")),
      error = function(e) {
        readr::read_lines(setup_file, locale = readr::locale(encoding = "latin1"))
      })
    inform("encoding", "'", basename(setup_file), "' isn't valid UTF-8 ",
           "text, so it was read as Windows-1252 (Latin-1).")
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
    # (Anchored, so a label such as "Number of missing values" doesn't end
    # the section)
    next_location <- grep2("^value labels$|^\\*?\\s*(SPSS\\s+)?missing values?\\b|^\\*?\\s*user-defined missing values|^execute$|^.$|\\*RECODE$",
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
      for (n in seq_along(plus)) {
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

