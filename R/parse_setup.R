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
#   label_ranges: SAS value ranges and OTHER (column, code, label), which
#     aren't applied
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
    lines <- data_list_lines(codebook)
    check_data_list(lines, setup_file)
    setup <- data_list_sps(lines, setup_file)
    decimals <- attr(setup, "decimals")
    text_columns <- attr(setup, "text")
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
  } else if (!is.null(setup$f_name)) {
    value_labels <- parse_value_labels_sas(codebook, setup)
  } else {
    value_labels <- NULL
  }
  replaced_labels <- attr(value_labels, "replaced")
  attr(value_labels, "replaced") <- NULL
  label_ranges <- attr(value_labels, "ranges")
  attr(value_labels, "ranges") <- NULL
  setup <- list(setup           = setup,
                value_labels    = value_labels,
                missing         = missing,
                renamed         = renamed,
                commented_lines = if (any(missing$commented)) commented_lines,
                replaced_labels = replaced_labels,
                label_ranges    = label_ranges,
                skipped_missing = skipped_missing,
                recodes         = recodes,
                text_columns    = match_case(text_columns, setup$column_number),
                type            = type,
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
    has_positions <- any(grepl2("DATA LIST|/VARIABLES\\s*=", codebook))
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

# The SPSS DATA LIST (or GET DATA) command: from its first line to the line
# that ends with its closing period, or up to the next command if the
# period is missing. Comments ("/* ... */") are removed and so is the
# period.
data_list_lines <- function(codebook) {
  start <- grep2("^DATA LIST\\b", codebook)
  if (length(start) == 0) start <- grep2("^GET DATA\\b", codebook)
  if (length(start) == 0) {
    # After another command on the line ("FILE HANDLE ... . DATA LIST"), but
    # not in a comment
    start <- setdiff(grep2("DATA LIST|/VARIABLES\\s*=", codebook), grep("^\\*", codebook))
  }
  lines <- codebook[start[1]:length(codebook)]
  lines <- gsub("/\\*.*?(\\*/|$)", " ", lines, perl = TRUE)
  unquoted <- trimws(gsub("'[^']*'|\"[^\"]*\"", "", lines))
  # The next command, if the closing period is missing. (A command word
  # followed by a number is a variable, e.g. "TITLE 5-30".)
  next_command <- grep(paste0("^\\*|^(ADD )?VALUE LABELS\\b|^(VARIABLE|VAR) LABELS?\\b|",
                              "^MISSING VALUES?\\b|^EXECUTE\\b|^FORMATS?\\b|",
                              "^RECODE\\b|^SAVE\\b|^COMPUTE\\b|",
                              "^(VARIABLE LEVEL|FILE LABEL|FILE HANDLE|BEGIN DATA|",
                              "FREQUENCIES|DESCRIPTIVES|CROSSTABS|STRING|NUMERIC|",
                              "PRINT FORMATS|WRITE FORMATS|DISPLAY|SORT CASES|SELECT IF|",
                              "FILTER|WEIGHT|DOCUMENT|TITLE|SUBTITLE|N OF CASES|SET|",
                              "DO IF|DO REPEAT|IF|LIST)\\b(?!\\s*[0-9])"),
                       unquoted, ignore.case = TRUE, perl = TRUE)
  next_command <- next_command[next_command > 1]
  end <- min(which(endsWith(unquoted, ".")), next_command - 1, length(lines))
  lines <- lines[seq_len(end)]
  if (endsWith(unquoted[end], ".")) lines[end] <- sub("\\.\\s*$", "", lines[end])
  lines
}

# SPSS DATA LIST (or GET DATA /VARIABLES) column positions, read token by
# token so spacing doesn't matter: "V1 1-2 (A) V2 3 V3 4-9 (2)", or written
# "V1 1-2(A) V2 3 V3 4-9(2)", has V1 in columns 1-2 (text), V2 in column 3
# and V3 in 4-9 with 2 implied decimal places ("(F,2)" too). As in SPSS,
# names listed before one range share it equally: "A B C 1-6" is 2 columns
# each, and "Q1 TO Q3 3-5" is Q1, Q2 and Q3 in one column each. GET DATA
# gives a format after each range ("V1 0-1 A2"; its columns count from 0,
# see read_setup()). Returns a data.frame of column_number, begin and end
# for get_column_spaces(), with the implied decimal places as the
# "decimals" attribute and the text columns as the "text" attribute. Stops
# with an error for what it can't read rather than placing columns wrongly.
data_list_sps <- function(lines, setup_file) {
  text <- paste(lines, collapse = " ")
  tokens <- regmatches(text, gregexpr(paste0(double_quoted, "|", single_quoted,
                                             "|\\([^)]*\\)|[0-9]+\\s*-\\s*[0-9]+",
                                             "|/[0-9]*|=|[^\\s()/=]+"),
                                      text, perl = TRUE))[[1]]
  file_name <- basename(setup_file)
  cant_read <- function(...) {
    abort("unsupported_input", "asciiSetupReader can't read the DATA LIST ",
          "command in '", file_name, "': ", ...)
  }
  # The command can follow another on its line ("FILE HANDLE ... . DATA LIST")
  upper <- toupper(tokens)
  start <- which((upper == "DATA" & c(upper[-1], "") == "LIST") |
                   (upper == "GET" & c(upper[-1], "") == "DATA"))[1]
  if (!is.na(start)) tokens <- tokens[start:length(tokens)]
  upper <- toupper(tokens)
  get_data <- upper[1] == "GET"
  if (get_data) {
    # The columns follow "/VARIABLES ="
    at <- which(upper == "VARIABLES" & c("", tokens[-length(tokens)]) == "/")
    i <- if (length(at)) at[1] + 1 else length(tokens) + 1
    if (i <= length(tokens) && tokens[i] == "=") i <- i + 1
  } else {
    # Skip DATA LIST and its options (FILE = 'x', FIXED, SKIP = 1, ...)
    i <- 3
    while (i <= length(tokens)) {
      if (upper[i] %in% c("FREE", "LIST")) {
        abort("delimited", "'", file_name, "' is for a delimited data file ",
              "(DATA LIST ", upper[i], "), not a fixed-width one. ",
              "asciiSetupReader only reads fixed-width files; read the data ",
              "with a function for delimited files, such as read.table() or ",
              "readr::read_table(), instead.")
      }
      if (upper[i] %in% c("FILE", "ENCODING", "RECORDS", "SKIP", "END") &&
          isTRUE(tokens[i + 1] == "=")) {
        i <- i + 3
      } else if (upper[i] %in% c("FIXED", "TABLE", "NOTABLE")) {
        i <- i + 1
      } else {
        break
      }
    }
  }

  name_pattern <- "^[[:alpha:]@#$][[:alnum:]_.@#$]*$"
  # SPSS formats, as GET DATA writes them after each range: A10, F7.1,
  # ADATE10, AUTO, ...
  get_data_format <- paste0("^(A|AHEX|F|N|E|Z|P|PK|IB|PIB|PIBHEX|RB|RBHEX|",
                            "COMMA|DOT|DOLLAR|PCT|CCA|CCB|CCC|CCD|CCE|DATE|",
                            "ADATE|EDATE|JDATE|SDATE|QYR|MOYR|WKYR|DATETIME|",
                            "YMDHMS|TIME|MTIME|DTIME|WKDAY|MONTH|AUTO)",
                            "[0-9]*(\\.[0-9]+)?$")
  names    <- character(0)  # names waiting for their position
  last     <- character(0)  # names given the latest position
  out_names <- character(0); out_begin <- numeric(0); out_end <- numeric(0)
  text_columns <- character(0)
  decimals <- stats::setNames(integer(0), character(0))
  record   <- 0
  while (i <= length(tokens)) {
    token <- tokens[i]
    if (startsWith(token, "/")) {
      # A record: "/1" (or "/ 1") is the first line of a case and a bare
      # "/" the next one
      if (token == "/" && isTRUE(tokens[i + 1] == "1")) {
        token <- "/1"
        i <- i + 1
      }
      record <- if (token == "/") record + 1 else as.numeric(substring(token, 2))
      if (record > 1) {
        abort("unsupported_input", "'", file_name, "' reads several lines ",
              "(records) per case, which asciiSetupReader can't read.")
      }
      last <- character(0)
    } else if (grepl("^[0-9]+(\\s*-\\s*[0-9]+)?$", token)) {
      if (length(names) == 0) cant_read("the position ", token, " has no name.")
      range <- as.numeric(strsplit(token, "\\s*-\\s*")[[1]])
      begin <- range[1]
      width <- (range[length(range)] - begin + 1) / length(names)
      # (A start after the end stops in get_column_spaces())
      if (length(names) > 1 && (width < 1 || width != round(width))) {
        cant_read("columns ", token, " can't be shared equally by ",
                  paste(names, collapse = " "), ".")
      }
      starts <- begin + width * (seq_along(names) - 1)
      out_names <- c(out_names, names)
      out_begin <- c(out_begin, starts)
      out_end   <- c(out_end, starts + width - 1)
      last  <- names
      names <- character(0)
    } else if (startsWith(token, "(")) {
      format <- toupper(gsub("[()[:space:]]", "", token))
      if (length(last) == 0) {
        cant_read("the format ", token, " has no column position before it.")
      }
      if (grepl("^A[0-9]*$", format)) {
        text_columns <- c(text_columns, last)
      } else if (grepl("^([[:alpha:]]+,)?[0-9]+$", format)) {
        places <- as.integer(sub("^.*,", "", format))
        if (places > 0) decimals[last] <- places
      }
      last <- character(0)
    } else if (get_data && length(last) && grepl(get_data_format, toupper(token))) {
      # GET DATA format, e.g. A2 or F7.1 (which has no implied decimals)
      if (grepl("^(A|AHEX)[0-9]*$", toupper(token))) {
        text_columns <- c(text_columns, last)
      }
      last <- character(0)
    } else if (toupper(token) == "TO" && length(names) &&
               isTRUE(grepl(name_pattern, tokens[i + 1]))) {
      # "Q1 TO Q3" is Q1, Q2 and Q3
      from <- regmatches(names[length(names)], regexec("^(.*?)([0-9]+)$", names[length(names)]))[[1]]
      to   <- regmatches(tokens[i + 1], regexec("^(.*?)([0-9]+)$", tokens[i + 1]))[[1]]
      if (length(from) == 0 || length(to) == 0 || toupper(from[2]) != toupper(to[2]) ||
          as.numeric(from[3]) > as.numeric(to[3])) {
        cant_read("'", names[length(names)], " TO ", tokens[i + 1], "' isn't a ",
                  "numbered list of names.")
      }
      numbers <- (as.numeric(from[3]) + 1):as.numeric(to[3])
      names <- c(names, paste0(from[2], formatC(numbers, width = nchar(from[3]), flag = "0")))
      i <- i + 1
    } else if (grepl(name_pattern, token)) {
      names <- c(names, token)
      last  <- character(0)
    } else {
      cant_read("'", token, "' isn't a name, a column position or a format.")
    }
    i <- i + 1
  }
  if (length(names)) {
    cant_read(paste(names, collapse = " "), " has no column position.")
  }
  out <- data.frame(column_number = out_names, begin = out_begin, end = out_end)
  attr(out, "decimals") <- decimals
  attr(out, "text") <- unique(text_columns)
  out
}

# Stops with a clear error for SPSS DATA LIST forms this package can't
# read, rather than reading the wrong columns: several records (lines) per
# case and positions implied by formats ("ID (F3) NAME (A5)"). `lines` is
# the command, from data_list_lines().
check_data_list <- function(lines, setup_file) {
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
    # Only the DATA LIST or GET DATA command
    lines <- data_list_lines(codebook)
    pattern <- "(?i)(?:\\bSKIP|/FIRSTCASE)\\s*=\\s*([0-9]+)"
  } else {
    lines <- codebook[grepl("^INFILE\\b", codebook, ignore.case = TRUE) &
                        !sas_comment_state(codebook)]
    pattern <- "(?i)\\bFIRSTOBS\\s*=\\s*([0-9]+)"
  }
  # (Not inside a quoted file name)
  lines <- gsub("'[^']*'|\"[^\"]*\"", "", lines)
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
# column. SAS writes them as an informat after the position, "V7 37-43 .1":
# a value with 1 implied decimal place written "0000785" is 78.5. (SPSS
# DATA LIST's "(1)" is read by data_list_sps().)
parse_decimals <- function(lines, type) {
  text <- paste(lines, collapse = " ")
  pattern <- "([[:alpha:]_][[:alnum:]_]*)\\s+\\$?\\s*[0-9]+(?:\\s*-\\s*[0-9]+)?\\s+\\.([0-9]+)"
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

# The columns the setup file says are text, SAS "V1 $ 1-2". Their missing
# values are matched exactly, not as numbers. (SPSS DATA LIST's "(A)" is
# read by data_list_sps().)
parse_text_columns <- function(lines, type) {
  text <- paste(lines, collapse = " ")
  pattern <- "([[:alpha:]_][[:alnum:]_]*)\\s*\\$"
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
  # "$ 2." and "$ 1-2" are one token, but not "$ V2" (list input)
  text <- gsub("\\$\\s+(?=[0-9]|[[:alpha:]_][[:alnum:]_]*?[0-9]+\\.)", "$", text, perl = TRUE)
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
    } else if (grepl("^[[:alpha:]_][[:alnum:]_]*$", token) || token == "$") {
      # A name (or a lone $) while the last name still has no position is
      # list input ("V1 $ V2 2."), which reads values separated by blanks,
      # not columns
      if (!is.na(name) || token == "$") {
        abort("unsupported_input", "This SAS INPUT statement reads '",
              if (is.na(name)) token else name, "' as list input (no ",
              "column position), which asciiSetupReader can't read.")
      }
      name <- token
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
    pieces <- split_outside_quotes(paste0(lines[i], " "), ";")
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

# Splits a line at each `separator` that isn't inside quotes, like
# strsplit(line, separator, fixed = TRUE) but keeping "a; b" in 'a; b'.
split_outside_quotes <- function(line, separator) {
  masked <- line
  quoted <- gregexpr("'[^']*'|\"[^\"]*\"", line)
  regmatches(masked, quoted) <- lapply(regmatches(masked, quoted),
                                       function(m) strrep("x", nchar(m)))
  at <- gregexpr(separator, masked, fixed = TRUE)[[1]]
  if (at[1] == -1) return(line)
  substring(line, c(1, at + 1), c(at - 1, nchar(line)))
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
  labels <- if (type == "sps") variable_labels_sps(codebook) else variable_labels_sas(codebook)
  if (is.null(labels)) {
    return(NULL)
  }
  names <- name_from_label(labels$label)
  # A label of only punctuation (e.g. "...") has no clean name, so the
  # column keeps its short name
  names[names == ""] <- labels$column_number[names == ""]
  variables <- data.frame(column_name = names, column_number = labels$column_number)
  variables[!duplicated(tolower(variables$column_number)), ]
}

# Turns a column's label into a clean name: symbols with a meaning become
# words ("<" is "_under_", "%" "_percent_", ...), anything else that isn't a
# letter, number or "_" becomes "_", and a name can't start with a number.
name_from_label <- function(label) {
  label <- gsub("<", "_under_", label)
  label <- gsub(">", "_over_", label)
  label <- gsub("\\$", "_dollar_", label)
  label <- gsub("\\+", "_plus_", label)
  label <- gsub("@", "_at_", label)
  label <- gsub("%", "_percent_", label)
  name <- gsub("\\W|#|\\/", "_", label)
  name <- gsub("_+", "_", name)
  name <- gsub("^_|_$", "", name)
  sub("^([0-9])", "X\\1", name)
}

# SPSS VARIABLE LABELS commands ("VAR LABELS" too): each column's name and
# its quoted label (pieces joined by "+"), with "/" between columns and a
# "." ending the command. Returns a data.frame of column_number and label,
# or NULL.
variable_labels_sps <- function(codebook) {
  # On its own line, or with the first column and its quoted label after it
  # (not a note that starts with the command's name)
  first <- "^(VARIABLE|VAR) LABELS?\\s+/?[[:alpha:]@#$][[:alnum:]_.@#$]*"
  starts <- grep(paste0("^(VARIABLE|VAR) LABELS?$|", first, "\\s+['\"]"),
                 codebook, ignore.case = TRUE)
  # or with the first column alone, its label on the next line
  alone <- grep(paste0(first, "$"), codebook, ignore.case = TRUE)
  alone <- alone[grepl("^['\"]", c(codebook, "")[alone + 1])]
  starts <- sort(c(starts, alone))
  if (length(starts) == 0) {
    return(NULL)
  }
  out <- list()
  for (s in starts) {
    # The command runs to its "." (a "." token) or the next command
    end <- grep(paste0("^\\*|^(ADD )?VALUE LABELS|^MISSING VALUES?\\b|^EXECUTE\\b|",
                       "^FORMATS?\\b|^RECODE\\b|^SAVE\\b|^(VARIABLE|VAR) LABELS?"),
                codebook, ignore.case = TRUE)
    end <- c(end[end > s] - 1, length(codebook))[1]
    lines <- codebook[s:end]
    lines[1] <- sub("^(VARIABLE|VAR) LABELS?\\s*", "", lines[1], ignore.case = TRUE)
    tokens <- tokenize(lines, c("/", "+"))
    quoted <- is_quoted(tokens)
    text <- unquote(tokens)
    column <- NA_character_
    i <- 1
    while (i <= length(tokens)) {
      if (!quoted[i] && tokens[i] == ".") break
      if (!quoted[i] && !tokens[i] %in% c("/", "+")) {
        column <- tokens[i]
      } else if (quoted[i] && !is.na(column)) {
        label <- text[i]
        while (i + 2 <= length(tokens) && tokens[i + 1] == "+" && quoted[i + 2]) {
          label <- paste0(label, text[i + 2])
          i <- i + 2
        }
        out[[length(out) + 1]] <- data.frame(column_number = column,
                                             label = trimws(label))
        column <- NA_character_
      }
      i <- i + 1
    }
  }
  do.call(rbind, out)
}

# SAS LABEL statements ("LABEL V1 = 'Age' V2 = 'Sex';") and ATTRIB ...
# LABEL = '...': each column's name and label, read to the ";". Returns a
# data.frame of column_number and label, or NULL.
variable_labels_sas <- function(codebook) {
  # Statements start a line or follow a ";" ("LENGTH V1 8; LABEL V1 = ...")
  masked <- mask_quotes(codebook)
  at <- regexpr("(^|;)\\s*\\K(LABEL|ATTRIB)\\b", masked, ignore.case = TRUE, perl = TRUE)
  starts <- which(at > 0)
  # Not ones inside a /* */ comment
  starts <- starts[!sas_comment_state(codebook)[starts]]
  if (length(starts) == 0) {
    return(NULL)
  }
  keywords <- c("LABEL", "ATTRIB", "FORMAT", "INFORMAT", "LENGTH", "TRANSCODE")
  # The line each statement's ";" is on (not one inside quotes)
  semicolons <- grep(";", masked)
  out <- list()
  for (s in starts) {
    first <- substring(codebook[s], at[s])
    end <- if (grepl(";", substring(masked[s], at[s]))) s else
      c(semicolons[semicolons > s], length(codebook))[1]
    statement <- sas_statements(c(first, if (end > s) codebook[(s + 1):end]))
    if (nrow(statement) == 0) next
    tokens <- tokenize(statement$text[1], c("=", ";"))
    quoted <- is_quoted(tokens)
    text <- unquote(tokens)
    # The columns the next label is for: in LABEL, the last name; in
    # ATTRIB, every name listed before its attributes ("ATTRIB V1 V2
    # LABEL = 'x'")
    columns <- character(0)
    attributes_started <- TRUE
    for (i in seq_along(tokens)) {
      if (!quoted[i] && toupper(tokens[i]) %in% keywords) {
        attributes_started <- TRUE
      } else if (!quoted[i] && tokens[i] != "=" &&
                 grepl("^[[:alpha:]_][[:alnum:]_]*$", tokens[i]) &&
                 !(i > 1 && tokens[i - 1] == "=")) {
        if (attributes_started || toupper(tokens[1]) == "LABEL") columns <- character(0)
        columns <- c(columns, tokens[i])
        attributes_started <- FALSE
      } else if (quoted[i] && i > 2 && tokens[i - 1] == "=" && length(columns) &&
                 toupper(tokens[i - 2]) %in% c("LABEL", toupper(columns))) {
        out[[length(out) + 1]] <- data.frame(column_number = columns,
                                             label = trimws(gsub("\\s+", " ", text[i])))
      }
    }
  }
  do.call(rbind, out)
}

# Replaces each quoted string in x with as many "x"s, so what's outside
# quotes can be searched without moving any positions.
mask_quotes <- function(x) {
  quoted <- gregexpr("'[^']*'|\"[^\"]*\"", x)
  regmatches(x, quoted) <- lapply(regmatches(x, quoted),
                                  function(m) strrep("x", nchar(m)))
  x
}
