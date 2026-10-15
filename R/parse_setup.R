#' Parse the setup file (.sps or .sas).
#'
#' @param setup_file Name of the SPSS or SAS setup file - should be a .sps or
#'   .sas (.txt also accepted as are these files in zipped format). Whether it
#'   is SPSS or SAS is determined from the file name: names ending in .sps
#'   (optionally followed by .zip or .txt) are SPSS and everything else is SAS.
#'
#' @return A list of length 3. The first object ("setup") is a data frame
#' with 4 columns: column_number, the non-descriptive name of each column
#' (e.g. V1); column_name, its descriptive name; and begin and end, the
#' first and last character position of the column in the fixed-width data
#' file.
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

  if (grepl(".sps(\\.zip)?$|.sps(\\.txt)?$", setup_file, ignore.case = TRUE)) {
    type <- "sps"
  } else {
    type <- "sas"
  }

  codebook  <- parse_codebook(setup_file, type = type)
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
    setup <- codebook[grep2("DATA LIST|/VARIABLES =$", codebook):second_grep_value]
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
    setup <- codebook[grep2("^INPUT$", codebook):second_grep_value]
    setup <- gsub("\\([0-9]+\\) |\\.[0-9]+ ", "", setup)
    setup <- join_number_lines(setup)

    setup <- gsub("([[:alpha:]]+[0-9]* [0-9]+) ([[:alpha:]]+[0-9]*)", "\\1   \\2",
                  setup)
    setup <- gsub("([[:alnum:]])\\s{2,}([0-9]+) ", "\\1 \\2 ", setup)
    setup <- gsub("([[:alnum:]])\\s{2,}([0-9]+)$", "\\1 \\2", setup)
    setup <- gsub("([[:alnum:]])\\s{2,}([0-9]+-[0-9]+) ", "\\1 \\2 ", setup)
    setup <- gsub("([[:alnum:]])\\s{2,}([0-9]+-[0-9]+)$", "\\1 \\2", setup)
  }
  setup <- get_column_spaces(setup, variables, codebook)
  setup <- setup[setup$column_number != "*", ]
  rownames(setup) <- 1:nrow(setup)

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

  value_labels <- get_value_labels(codebook, setup, type = type)
  setup <- list(setup        = setup,
                value_labels = value_labels,
                missing      = missing)
  if (!is.null(setup$value_labels)) {
    setup$value_labels <- parse_value_labels(setup, type = type)
  }
  setup$setup <- setup$setup[, c("column_number",
                                 "column_name",
                                 "begin",
                                 "end")]

  return(setup)

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
  codebook <- readr::read_lines(setup_file)
  codebook <- stringr::str_trim(codebook)

  if (type == "sps") {
    data_list <- grep2("^DATA LIST", codebook)
    if (length(data_list) > 0) {
      codebook <- codebook[data_list[1]:length(codebook)]
    }
  }
  return(codebook)
}

# Turns the value-label pieces from get_value_labels() into a named list
# with one element per column (in setup file order), each a named vector
# from value_label_matrixer().
parse_value_labels <- function(setup, type) {
  value_labels <- setup$value_labels
  value_labels <- value_labels[value_labels$column %in% setup$setup$column_number, ]

  value_label_order <- unique(value_labels$column)
  value_labels <- split.data.frame(value_labels, value_labels$column)
  value_label_cols <- c()
  for (i in seq_along(value_labels)) {
    column <- unique(value_labels[[i]]$column)
    value_labels[[i]] <- value_label_matrixer(value_labels[[i]][[1]], type)
    value_label_cols <- c(value_label_cols, column)
  }

  names(value_labels) <- value_label_cols
  value_labels <- value_labels[value_label_order]
  return(value_labels)
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

  variables <- gsub("^/", "", variables)
  variables <- gsub('"\\s*(.*?)\\s*"', '"\\1"', variables)

  variables <- data.frame(column_name   = fix_names(variables),
                          column_number = gsub(" .*", "",
                                               variables)
                          )

  # Stop at the first empty label (the end of the section)
  if (any(grepl("^$", variables$column_name))) {
    variables <- variables[1:(grep("^$", variables$column_name)[1]), ]
  }
  variables <- variables[!variables$column_number %in% "*", ]
  variables <- variables[!duplicated(variables$column_number), ]
  return(variables)
}

