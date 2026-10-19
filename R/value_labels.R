# Value labels ----------------------------------------------------------------
#
# Setup files give each variable's code/label pairs. In SPSS files:
#   VALUE LABELS
#     V1   1 "Male"  2 "Female" /
#     V2   '01' "Alabama"  '09' "doctor's office"
#          'XX' 'Brother''s keeper'
#          'YY' 'a label continued ' + 'on the next line' .
# In SAS files the pairs belong to a format, and the FORMAT section says
# which columns use it:
#   VALUE $locf  '09'="doctor's office"  '10'='Brother''s keeper';
# Codes and labels are quoted with ' or " (codes can also be bare numbers).
# Inside "..." an apostrophe is just a character; inside '...' a doubled ''
# is one apostrophe. The setup files are read token by token so that a
# quote inside a label is never mistaken for the end of the label.

# Patterns for one quoted string. Some files don't double an apostrophe
# inside '...' (e.g. 'Wife's'), so a ' followed by a letter or digit is
# also kept as part of the string rather than ending it.
double_quoted <- "\"(?:[^\"]|\"\")*\""
single_quoted <- "'(?:[^']|''|'(?=[[:alnum:]]))*'"

# Splits lines into tokens: quoted strings, the given separators and bare
# words (anything else that isn't white space). The lines are read as one
# text because a long quoted label can continue onto the next line.
tokenize <- function(lines, separators) {
  bare <- paste0("[^\\s\"'", paste(separators, collapse = ""), "]+")
  pattern <- paste(c(double_quoted, single_quoted,
                     paste0("\\", separators), bare), collapse = "|")
  text <- paste(lines, collapse = "\n")
  regmatches(text, gregexpr(pattern, text, perl = TRUE))[[1]]
}

is_quoted <- function(tokens) substr(tokens, 1, 1) %in% c("'", "\"")

# Removes the quotes around quoted tokens and undoubles the quote character
# inside them. Bare tokens are returned as they are.
unquote <- function(tokens) {
  quote <- substr(tokens, 1, 1)
  body  <- substr(tokens, 2, nchar(tokens) - 1)
  ifelse(quote == "\"", gsub("\"\"", "\"", body, fixed = TRUE),
         ifelse(quote == "'", gsub("''", "'", body, fixed = TRUE), tokens))
}

# A code written as a blank (" ") stays a single space; other codes are
# trimmed.
clean_code <- function(code) {
  if (grepl("^\\s+$", code)) " " else trimws(code)
}

# Labels are kept as written apart from runs of spaces (from labels split
# over lines), which become one space.
clean_label <- function(label) {
  trimws(gsub("\\s+", " ", label))
}

# Turns a data.frame of code/label pairs (with a `block` number for each
# time a variable's pairs are written) into the list parse_setup() returns:
# one element per variable, a character vector of codes named by their
# labels, e.g. c(Male = "1", Female = "2"). If a variable's pairs are
# written more than once, the later copies only add codes not already
# labelled, so a variable name never ends up inside a label.
pairs_to_value_labels <- function(pairs) {
  if (is.null(pairs) || nrow(pairs) == 0) {
    return(stats::setNames(list(), character(0)))
  }
  first_block <- stats::ave(pairs$block, pairs$column, FUN = min)
  repeated <- pairs$block != first_block &
    duplicated(pairs[c("column", "code")])
  pairs <- pairs[!repeated, ]

  columns <- unique(pairs$column)
  value_labels <- lapply(columns, function(col) {
    stats::setNames(pairs$code[pairs$column == col],
                    pairs$label[pairs$column == col])
  })
  stats::setNames(value_labels, columns)
}

# SPSS ------------------------------------------------------------------------

# Returns the value labels of an SPSS setup file (see
# pairs_to_value_labels()), or NULL if it has no VALUE LABELS line.
parse_value_labels_sps <- function(codebook, setup) {
  start <- grep2("^value labels$", codebook)
  if (length(start) == 0) {
    return(NULL)
  }
  # The section runs to the first "." or blank line after the last
  # VALUE LABELS line
  end <- grep("^\\.$|^$", codebook)
  end <- end[end > start[length(start)]][1] - 1
  if (is.na(end)) {
    end <- length(codebook)
  }
  lines <- codebook[start[1]:end]
  # Drop /* comments */ (PSID files note truncated labels this way)
  lines <- gsub("/\\*.*\\*/", "", lines)

  tokens <- tokenize(lines, c("/", "+"))
  quoted <- is_quoted(tokens)
  text   <- unquote(tokens)
  number <- !quoted & grepl("^-?[0-9.]*[0-9][0-9.]*$", tokens)
  known_column <- !quoted & tolower(tokens) %in% tolower(setup$column_number)

  pairs  <- list()
  column <- NA_character_
  block  <- 0
  code   <- NULL
  i <- 1
  while (i <= length(tokens)) {
    if (!quoted[i] && toupper(tokens[i]) %in% c("VALUE", "LABELS")) {
      # The VALUE LABELS command itself
    } else if (!quoted[i] && tokens[i] %in% c("/", ".", "+")) {
      # The end of a variable's pairs ("/"), of the section (".") or a
      # stray "+"
      code <- NULL
      if (tokens[i] != "+") column <- NA_character_
    } else if (known_column[i] || (!quoted[i] && !number[i] && is.null(code))) {
      # A variable name starts that variable's pairs
      column <- tokens[i]
      block  <- block + 1
      code   <- NULL
    } else if (is.null(code)) {
      code <- clean_code(text[i])
    } else {
      # The label, with any pieces joined by "+"
      label <- text[i]
      while (i + 2 <= length(tokens) && tokens[i + 1] == "+" && quoted[i + 2]) {
        label <- paste0(label, text[i + 2])
        i <- i + 2
      }
      if (!is.na(column)) {
        pairs[[length(pairs) + 1]] <- data.frame(column = column,
                                                 block = block,
                                                 code = code,
                                                 label = clean_label(label))
      }
      code <- NULL
    }
    i <- i + 1
  }

  pairs <- do.call(rbind, pairs)
  if (!is.null(pairs)) {
    pairs$column <- match_case(pairs$column, setup$column_number)
    pairs <- pairs[pairs$column %in% setup$column_number, ]
  }
  pairs_to_value_labels(pairs)
}

# SAS -------------------------------------------------------------------------

# Returns the value labels of a SAS setup file (see
# pairs_to_value_labels()), or NULL if it has none. Each format's labels go
# to every column the FORMAT section gives that format.
parse_value_labels_sas <- function(codebook, setup) {
  f_names <- unique(as.character(setup$f_name[!is.na(setup$f_name)]))
  if (length(f_names) == 0) {
    return(NULL)
  }
  # The VALUE statements start at the first one for a format that is used
  # and run to the first blank (or ".", ";", "*/") line after the last one
  starts <- unlist(lapply(f_names, function(f_name) {
    found <- grep(paste("VALUE", f_name), codebook, fixed = TRUE)
    if (length(found) == 0) {
      found <- grep(paste("value", f_name), codebook, fixed = TRUE)
    }
    found
  }))
  if (length(starts) == 0) {
    return(NULL)
  }
  value_position <- grep2("^VALUE ", codebook)
  value_position <- value_position[value_position >= min(starts)]
  end <- grep2("^$|^\\.$|^\\*/$|^;$|^; ?\\*/$", codebook)
  end <- end[end >= max(value_position)][1] - 1
  if (is.na(end)) {
    end <- length(codebook)
  }
  lines <- codebook[value_position[1]:end]

  tokens <- tokenize(lines, c("=", ";"))
  quoted <- is_quoted(tokens)
  text   <- unquote(tokens)

  pairs  <- list()
  f_name <- NA_character_
  block  <- 0
  code   <- character()
  i <- 1
  while (i <= length(tokens)) {
    if (!quoted[i] && toupper(tokens[i]) == "VALUE" && i < length(tokens)) {
      # VALUE name, then any options in parentheses, e.g. (default=30)
      f_name <- tokens[i + 1]
      block  <- block + 1
      code   <- character()
      i <- i + 1
      if (i < length(tokens) && startsWith(tokens[i + 1], "(")) {
        while (i < length(tokens) && !endsWith(tokens[i], ")")) i <- i + 1
      }
    } else if (!quoted[i] && tokens[i] == ";") {
      f_name <- NA_character_
      code   <- character()
    } else if (is.na(f_name)) {
      # Anything between statements (comments, PROC FORMAT, ...)
    } else if (!quoted[i] && tokens[i] == "=") {
      # The label follows; the code is everything since the last pair. A
      # long label can be split into several quoted pieces, joined with a
      # space (a quoted string followed by "=" is the next code instead).
      label <- if (i < length(tokens)) text[i + 1] else ""
      i <- i + 1
      while (i + 1 <= length(tokens) && quoted[i + 1] &&
             !(i + 2 <= length(tokens) && tokens[i + 2] == "=")) {
        label <- paste(label, text[i + 1])
        i <- i + 1
      }
      pairs[[length(pairs) + 1]] <- data.frame(f_name = f_name,
                                               block = block,
                                               code = clean_code(paste(code, collapse = " ")),
                                               label = clean_label(label))
      code <- character()
    } else {
      code <- c(code, text[i])
    }
    i <- i + 1
  }
  pairs <- do.call(rbind, pairs)
  if (is.null(pairs)) {
    return(pairs_to_value_labels(NULL))
  }

  # Copy each format's pairs to the columns that use it, formats in the
  # order they're defined and columns in file order
  by_column <- lapply(unique(pairs$f_name), function(f) {
    columns <- unique(setup$column_number[setup$f_name %in% f])
    format_pairs <- pairs[pairs$f_name == f, ]
    do.call(rbind, lapply(columns, function(col) {
      cbind(column = col, format_pairs)
    }))
  })
  pairs_to_value_labels(do.call(rbind, by_column))
}
