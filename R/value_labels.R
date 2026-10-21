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
  ifelse(grepl("^\\s+$", code), " ", trimws(code))
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
# written more than once in one command, the later copies only add codes
# not already labelled. SPSS pairs also have the `command` they're in and
# whether it is ADD VALUE LABELS (`add`); see spss_label_commands().
pairs_to_value_labels <- function(pairs) {
  if (is.null(pairs) || nrow(pairs) == 0) {
    return(stats::setNames(list(), character(0)))
  }
  replaced <- NULL
  if (!is.null(pairs$command)) {
    pairs <- spss_label_commands(pairs)
    replaced <- attr(pairs, "replaced")
  }
  # ADD VALUE LABELS pairs are applied after, so they can change labels
  add <- if (is.null(pairs$add)) rep(FALSE, nrow(pairs)) else pairs$add
  plain <- pairs[!add, ]
  first_block <- stats::ave(plain$block, plain$column, FUN = min)
  repeated <- plain$block != first_block &
    duplicated(plain[c("column", "code")])
  pairs <- rbind(plain[!repeated, ], pairs[add, ])
  if (any(add)) {
    pairs <- apply_added_labels(pairs)
  }

  columns <- factor(pairs$column, levels = unique(pairs$column))
  codes   <- split(pairs$code, columns)
  labels  <- split(pairs$label, columns)
  value_labels <- lapply(levels(columns), function(col) {
    stats::setNames(codes[[col]], labels[[col]])
  })
  value_labels <- stats::setNames(value_labels, levels(columns))
  attr(value_labels, "replaced") <- replaced
  value_labels
}

# SPSS: a VALUE LABELS command replaces all of a variable's earlier labels,
# and an ADD VALUE LABELS command adds to them, changing the label of a
# code that already has one. So for each variable only the last VALUE
# LABELS command that labels it, and ADD VALUE LABELS commands after it,
# count. The "replaced" attribute names the variables whose earlier labels
# were different from the ones kept (so something was dropped).
spss_label_commands <- function(pairs) {
  plain <- pairs$command
  plain[pairs$add] <- NA
  last_plain <- stats::ave(plain, pairs$column, FUN = function(x) {
    if (all(is.na(x))) NA else max(x, na.rm = TRUE)
  })
  keep <- is.na(last_plain) | pairs$command >= last_plain
  pair_key <- paste(pairs$column, pairs$code, pairs$label, sep = "\r")
  replaced <- unique(pairs$column[!keep & !pair_key %in% pair_key[keep]])
  pairs <- pairs[keep, ]
  attr(pairs, "replaced") <- replaced
  pairs
}

# Applies the pairs of ADD VALUE LABELS commands (add = TRUE): a code that
# already has a label gets the new one, and a new code is added.
apply_added_labels <- function(pairs) {
  key  <- paste(pairs$column, pairs$code, sep = "\r")
  drop <- rep(FALSE, nrow(pairs))
  for (i in which(pairs$add)) {
    earlier <- which(key == key[i] & seq_along(key) < i & !drop)
    if (length(earlier) > 0) {
      pairs$label[earlier[1]] <- pairs$label[i]
      drop[i] <- TRUE
    }
  }
  pairs[!drop, ]
}

# Collects code/label pairs one at a time without growing a data.frame.
# add(columns, ...) records a pair for each of `columns`; pairs() returns
# them all as a data.frame.
pair_collector <- function(size) {
  n <- 0
  store <- list(column = character(size), block = numeric(size),
                code = character(size), label = character(size),
                add = logical(size), command = numeric(size))
  list(
    add = function(columns, block, code, label, add = FALSE, command = 0) {
      rows <- n + seq_along(columns)
      if (max(c(rows, 0)) > length(store$column)) {
        store <<- lapply(store, function(x) {
          c(x, rep(x[NA_integer_], max(length(x), length(rows))))
        })
      }
      store$column[rows]  <<- columns
      store$block[rows]   <<- block
      store$code[rows]    <<- code
      store$label[rows]   <<- label
      store$add[rows]     <<- add
      store$command[rows] <<- command
      n <<- n + length(columns)
    },
    pairs = function() {
      if (n == 0) return(NULL)
      out <- as.data.frame(lapply(store, `[`, seq_len(n)))
      out$code  <- clean_code(out$code)
      out$label <- clean_label(out$label)
      out
    }
  )
}

# SPSS ------------------------------------------------------------------------

# Returns the value labels of an SPSS setup file (see
# pairs_to_value_labels()), or NULL if it has no VALUE LABELS line. The
# pairs can follow a list of variables ("V1 V2 1 'Yes'" or
# "V1 TO V5 1 'Yes'"), in which case each variable gets them, and the
# first variable can be on the VALUE LABELS line itself. Commented-out
# ("* VALUE LABELS") sections are skipped.
parse_value_labels_sps <- function(codebook, setup) {
  start <- sort(c(grep2("^(add )?value labels$", codebook),
                  same_line_start(codebook, "(ADD )?VALUE LABELS",
                                  setup$column_number, commented = FALSE)))
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
  # Drop /* comments */ (PSID files note truncated labels this way; one
  # without its */ runs to the end of the line) and comment commands
  # ("* ..." up to a line ending in "." or a blank line)
  lines <- gsub("/\\*.*?(\\*/|$)", "", lines, perl = TRUE)
  lines <- drop_comment_commands(lines)

  tokens <- tokenize(lines, c("/", "+"))
  quoted <- is_quoted(tokens)
  text   <- unquote(tokens)
  number <- !quoted & grepl("^-?[0-9.]*[0-9][0-9.]*$", tokens)
  known_column <- !quoted & tolower(tokens) %in% tolower(setup$column_number)

  word    <- toupper(tokens)
  # VALUE and LABELS are the command's name only together (a variable can
  # be called VALUE)
  next_word <- c(word[-1], "")
  prev_word <- c("", word[-length(word)])
  command_word <- !quoted & ((word == "VALUE" & next_word == "LABELS") |
                               (word == "LABELS" & prev_word == "VALUE"))
  # Another command ending in "." on the same token, e.g. "(F2.0)." in
  # "FORMATS V1 (F2.0)."
  ends_command <- !quoted & !number & nchar(tokens) > 1 & endsWith(tokens, ".")
  columns <- setup$column_number
  found   <- pair_collector(length(tokens))
  current <- character(0)   # the variables the next pairs belong to
  listing <- FALSE          # TRUE while reading a list of variables
  adding  <- FALSE          # TRUE inside an ADD VALUE LABELS command
  block   <- 0
  command <- 0
  code    <- NULL
  i <- 1
  while (i <= length(tokens)) {
    if (!quoted[i] && word[i] == "ADD" && i < length(tokens) &&
        word[i + 1] == "VALUE") {
      adding <- TRUE
    } else if (command_word[i]) {
      # The VALUE LABELS command itself starts a new command
      if (word[i] == "VALUE") {
        command <- command + 1
        current <- character(0)
        listing <- FALSE
        code    <- NULL
      }
    } else if (ends_command[i] ||
               (!quoted[i] && tokens[i] %in% c("/", ".", "+"))) {
      # The end of a variable's pairs ("/"), of the command (".") or a
      # stray "+"
      code <- NULL
      if (tokens[i] != "+") {
        current <- character(0)
        listing <- FALSE
      }
      if (tokens[i] == "." || ends_command[i]) adding <- FALSE
    } else if (listing && !quoted[i] && word[i] == "TO" &&
               i < length(tokens) && known_column[i + 1]) {
      # "V1 TO V5": add the variables between V1 and V5 (V5 is added next)
      from <- match(tolower(current[length(current)]), tolower(columns))
      to   <- match(tolower(tokens[i + 1]), tolower(columns))
      if (!is.na(from) && !is.na(to) && to > from + 1) {
        current <- c(current, columns[seq(from + 1, to - 1)])
      }
    } else if (known_column[i] || (!quoted[i] && !number[i] && is.null(code))) {
      # A variable name: starts a new list of variables, or adds to it
      if (listing) {
        current <- c(current, tokens[i])
      } else {
        current <- tokens[i]
        block   <- block + 1
        listing <- TRUE
      }
      code <- NULL
    } else if (is.null(code)) {
      code    <- text[i]
      listing <- FALSE
    } else {
      # The label, with any pieces joined by "+"
      label <- text[i]
      while (i + 2 <= length(tokens) && tokens[i + 1] == "+" && quoted[i + 2]) {
        label <- paste0(label, text[i + 2])
        i <- i + 2
      }
      found$add(current, block, code, label, adding, command)
      code <- NULL
    }
    i <- i + 1
  }

  pairs <- found$pairs()
  if (!is.null(pairs)) {
    pairs$column <- match_case(pairs$column, setup$column_number)
    pairs <- pairs[pairs$column %in% setup$column_number, ]
  }
  pairs_to_value_labels(pairs)
}

# Removes SPSS comment commands: a line starting with "*" (or "COMMENT")
# and the lines after it, up to and including one that ends in "." or a
# blank line, which ends a command in SPSS.
drop_comment_commands <- function(lines) {
  lines[!in_comment_command(lines)]
}

# TRUE for each line that is part of an SPSS comment command ("*" or
# COMMENT, which runs to a line ending in "." or a blank line).
in_comment_command <- function(lines) {
  out <- rep(FALSE, length(lines))
  in_comment <- FALSE
  for (i in seq_along(lines)) {
    if (!in_comment && grepl("^(\\*|COMMENT\\b)", lines[i], ignore.case = TRUE)) {
      in_comment <- TRUE
    }
    if (in_comment) {
      out[i] <- TRUE
      if (lines[i] == "" || endsWith(lines[i], ".")) in_comment <- FALSE
    }
  }
  out
}

# SAS -------------------------------------------------------------------------

# Returns the value labels of a SAS setup file (see
# pairs_to_value_labels()), or NULL if it has none. Each format's labels go
# to every column the FORMAT statement gives that format (format names in
# any case). A code list ("1, 2, 3 = 'x'") gives each code the label. Ranges
# ("1 - 97", "LOW - 0", "OTHER") are kept as written, so they never match a
# value: they describe what a span of real numbers means (e.g. PSID's
# "1 - 97 = 'Actual hours'"), and replacing the numbers would lose them.
# The "ranges" attribute lists them by column (see read_ascii_setup()).
parse_value_labels_sas <- function(codebook, setup) {
  f_names <- unique(toupper(as.character(setup$f_name[!is.na(setup$f_name)])))
  if (length(f_names) == 0) {
    return(NULL)
  }
  # The VALUE statements start at the first one for a format that is used
  # and run to the first blank (or ".", ";", "*/") line after the last one
  named <- regmatches(toupper(codebook),
                      regexec("(?:^|[[:space:];*/])VALUE\\s+(\\$?[[:alpha:]_][[:alnum:]_]*)",
                              toupper(codebook), perl = TRUE))
  named <- vapply(named, function(m) if (length(m)) m[2] else NA_character_, "")
  starts <- which(named %in% f_names)
  if (length(starts) == 0) {
    return(NULL)
  }
  value_position <- which(!is.na(named))
  value_position <- value_position[value_position >= min(starts)]
  end <- grep2("^$|^\\.$|^\\*/$|^;$|^; ?\\*/$", codebook)
  end <- end[end >= max(value_position)][1] - 1
  if (is.na(end)) {
    end <- length(codebook)
  }
  lines <- codebook[value_position[1]:end]
  # A /* comment */ inside a VALUE statement isn't part of a code
  lines <- gsub("/\\*.*?\\*/", " ", lines, perl = TRUE)

  tokens <- tokenize(lines, c("=", ";"))
  quoted <- is_quoted(tokens)
  text   <- unquote(tokens)

  found  <- pair_collector(length(tokens))
  f_name <- NA_character_
  block  <- 0
  code   <- character()
  code_quoted <- logical()
  i <- 1
  while (i <= length(tokens)) {
    if (!quoted[i] && toupper(tokens[i]) == "VALUE" && i < length(tokens)) {
      # VALUE name, then any options in parentheses, e.g. (default=30)
      f_name <- toupper(tokens[i + 1])
      block  <- block + 1
      code   <- character()
      code_quoted <- logical()
      i <- i + 1
      if (i < length(tokens) && startsWith(tokens[i + 1], "(")) {
        while (i < length(tokens) && !endsWith(tokens[i], ")")) i <- i + 1
      }
    } else if (!quoted[i] && tokens[i] == ";") {
      f_name <- NA_character_
      code   <- character()
      code_quoted <- logical()
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
      # (The format's name goes in the "column" field for now)
      for (one_code in sas_code_list(code, code_quoted)) {
        found$add(f_name, block, one_code, label)
      }
      code <- character()
      code_quoted <- logical()
    } else {
      code <- c(code, text[i])
      code_quoted <- c(code_quoted, quoted[i])
    }
    i <- i + 1
  }
  pairs <- found$pairs()
  if (is.null(pairs)) {
    return(pairs_to_value_labels(NULL))
  }
  names(pairs)[names(pairs) == "column"] <- "f_name"
  # As in SAS, a format defined again replaces the earlier definition: each
  # VALUE statement is a "command" for spss_label_commands()
  pairs$command <- pairs$block

  # Copy each format's pairs to the columns that use it, formats in the
  # order they're defined and columns in file order
  formats <- unique(pairs$f_name)
  rows_by_format <- split(seq_len(nrow(pairs)),
                          factor(pairs$f_name, levels = formats))
  uses <- data.frame(column = setup$column_number,
                     f_name = toupper(as.character(setup$f_name)))
  uses <- uses[uses$f_name %in% formats & !duplicated(uses), ]
  uses <- uses[order(match(uses$f_name, formats)), ]
  rows <- rows_by_format[uses$f_name]
  by_column <- pairs[unlist(rows), ]
  by_column$column <- rep(uses$column, lengths(rows))
  value_labels <- pairs_to_value_labels(by_column)
  ranges <- by_column[is_sas_range(by_column$code), c("column", "code", "label")]
  if (nrow(ranges) > 0) attr(value_labels, "ranges") <- ranges
  value_labels
}

# The codes in a SAS VALUE statement before "=": several codes separated by
# commas ("1, 2, 3" or "'A', 'B'") are a list; anything else is one code
# (e.g. "1 - 5", kept as written).
sas_code_list <- function(code, quoted) {
  groups <- list(character())
  for (k in seq_along(code)) {
    if (!quoted[k] && grepl(",", code[k], fixed = TRUE)) {
      parts <- strsplit(paste0(code[k], " "), ",", fixed = TRUE)[[1]]
      for (p in seq_along(parts)) {
        if (p > 1) groups[[length(groups) + 1]] <- character()
        if (nzchar(trimws(parts[p]))) {
          groups[[length(groups)]] <- c(groups[[length(groups)]], trimws(parts[p]))
        }
      }
    } else {
      groups[[length(groups)]] <- c(groups[[length(groups)]], code[k])
    }
  }
  codes <- vapply(groups, paste, character(1), collapse = " ")
  if (length(codes) > 1) codes <- codes[nzchar(trimws(codes))]
  codes
}

# TRUE for a SAS value range or OTHER ("1 - 97", "LOW - 0", "5 <- HIGH",
# "OTHER"), which this package doesn't apply.
is_sas_range <- function(code) {
  number <- "(?:LOW|LO|HIGH|HI|-?[0-9]*\\.?[0-9]+)"
  grepl(paste0("^\\s*", number, "\\s*<?-<?\\s*", number, "\\s*$|^\\s*OTHER\\s*$"),
        code, ignore.case = TRUE, perl = TRUE)
}
