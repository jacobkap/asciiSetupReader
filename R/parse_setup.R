#' Parse the setup file (.sps or .sas).
#'
#' @param setup_file Name of the SPSS or SAS setup file - should be a .sps or .sas (.txt also accepted as are these files in zipped format)
#'
#' @return A list of length 3. The first object ("setup") is a data frame
#' containing 4 columns: first the non-descriptive name of each column,
#' The second column is the descriptive name of the column. Columns three
#' and four and the beginning and ending number of the column (used to
#' determine the columns location in the fixed-with data file).
#'
#' The second object ("value_labels") in the list is list of named vectors for the value labels. The
#' list has a length equal to the number of columns with value labels. If there are
#' no value labels, this will be NULL.
#'
#' The third object ("missing") in the list is a data.frame with two columns. The first
#' column says the variable name and the second column says the value that is missing
#' and will be replaced with NA.
#' @export
#'
#' @examples
#' \dontrun{
#' sas_name <- system.file("extdata", "example_setup.sas",
#'                          package = "asciiSetupReader")
#' sas_example <- parse_setup(sas_name)
#'
#' sps_name <- system.file("extdata", "example_setup.sps",
#'                          package = "asciiSetupReader")
#' sps_example <- parse_setup(sps_name)
#' }
parse_setup <- function(setup_file) {

  if (grepl(".sps(\\.zip)?$", setup_file, ignore.case = TRUE)) {
    type <- "sps"
  } else {
    type <- "sas"
  }

  codebook  <- parse_codebook(setup_file, type = type)
  variables <- parse_column_names(codebook, type = type)

  if (type == "sps") {
    second_grep_value <- grep2("^variable labels$", codebook)
    second_grep_value <- second_grep_value[1]
    if (is.na(second_grep_value)) {
      second_grep_value <- length(codebook)
    }
    setup <- codebook[grep2("DATA LIST|/VARIABLES =$", codebook):second_grep_value]
    setup <- gsub("\\([0-9]+\\) |\\.[0-9]+ ", "", setup)

    # If starts with a number, combine with previous row
    start_with_number <- grep("^[0-9]", setup)
    if (length(start_with_number) > 0) {
      for (n in length(start_with_number):1) {
        setup[start_with_number[n] - 1] <- paste(setup[start_with_number[n] - 1],
                                                 setup[start_with_number[n]],
                                                 collapse = " ")
      }
      setup <- setup[-start_with_number]
    }
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

    # If starts with a number, combine with previous row
    start_with_number <- grep("^[0-9]", setup)

    if (length(start_with_number) > 0) {
      for (n in length(start_with_number):1) {
        setup[start_with_number[n] - 1] <- paste(setup[start_with_number[n] - 1],
                                                 setup[start_with_number[n]],
                                                 collapse = " ")
      }
      setup <- setup[-start_with_number]
    }

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
  if (any(grepl2("MISSING VALUE", codebook))) {
    if (type == "sps") {
      missing <- parse_missing_sps(codebook, setup)
    } else {
      missing <- parse_missing_sas(codebook, setup)
    }
  } else {
    missing <- NULL
  }

  value_labels <- get_value_labels(codebook, setup, type = type)
  setup <- stats::setNames(list(setup, value_labels, missing),
                           c("setup",
                             "value_labels",
                             "missing"))
  setup$value_labels <- parse_value_labels(setup, type = type)
  setup$setup <- setup$setup[, c("column_number",
                                 "column_name",
                                 "begin",
                                 "end")]

  return(setup)

}


parse_missing_sps <- function(codebook, setup) {

  start <- grep2("MISSING VALUES$", codebook)
  end <- grep2("EXECUTE|^\\*.*SPSS", codebook)
  if (length(end) == 0 | all(end <= start)) {
    end <- length(codebook)
  } else {
    end <- min(end[end > start])
  }
  missing <- codebook[start:end]
  missing <- gsub('\\"\\s+\\"', '""', missing)
  missing <- gsub("(\\S),(\\S)", "\\1, \\2", missing)
  missing <- gsub("\\s{3,}\\(", " \\(", missing)
  missing <- gsub("\\) ", "\\)   ", missing)
  missing <- gsub(",\\s+(-?[0-9]),", ", \\1,", missing)
  missing <- gsub(",\\s+(-?[0-9])\\)", ", \\1\\)", missing)
  missing <- unlist(strsplit(missing, ",|\\s{2,}"))

  missing <- data.frame(variable = gsub(" .*", "", missing),
                        values = gsub(".*\\(|\\).*", "", missing),
                        stringsAsFactors = FALSE)
  missing$variable[missing$variable == ""] <- NA
  missing$variable <- zoo::na.locf(missing$variable, na.rm = FALSE)
  # missing$values <- gsub("\\.$", "", missing$values)
  missing$values <- gsub('\\"', "\\'", missing$values)
  missing$values <- gsub("\\'", "", missing$values)
  missing$values <- trimws(missing$values)

  for (i in 1:nrow(missing)) {
    if (tolower(missing$variable[i]) %in% tolower(setup$column_number)) {
      missing$variable[i] <-
        setup$column_number[tolower(setup$column_number) %in% tolower(missing$variable[i])]
    }
  }

  missing <- missing[missing$variable %in% setup$column_number, ]
  missing <- make_thru_missing_rows(missing)
  rownames(missing) <- 1:nrow(missing)
  return(missing)
}

parse_missing_sas <- function(codebook, setup) {

  start <- grep2("MISSING VALUE", codebook)
  start <- grep2("^IF", codebook)[grep2("^IF", codebook) > max(start)][1]
  # Some .sas files have "example" code at the beginnig which screws this up
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


  # missing <- data.frame(variable = gsub("=.*", "", missing),
  #                       values = gsub(".*=", "", missing),
  #                       stringsAsFactors = FALSE)  missing <- gsub("\\) ", "\\)   ", missing)
  missing <- unlist(strsplit(missing, ",|\\s{2,}"))

  missing <- data.frame(variable = gsub(" .*", "", missing),
                        values = gsub(".*\\(|\\).*", "", missing),
                        stringsAsFactors = FALSE)
  missing$variable[missing$variable == ""] <- NA
  missing$variable <- zoo::na.locf(missing$variable, na.rm = FALSE)
  # missing$values <- gsub("\\.$", "", missing$values)
  missing$values <- gsub('\\"', "\\'", missing$values)
  missing$values <- gsub("\\'", "", missing$values)
  missing$values <- trimws(missing$values)

  missing <- missing[missing$variable %in% setup$column_number, ]
  missing <- make_thru_missing_rows(missing)
  rownames(missing) <- 1:nrow(missing)
  return(missing)
}


make_thru_missing_rows <- function(missing) {
  thru_rows <- missing[grep("thru -?[0-9]", missing$values, ignore.case = TRUE), ]
  # thru_highest_rows <- missing[grep("thru hi", missing$values, ignore.case = TRUE), ]

  if (nrow(thru_rows) < 1) return(missing)

  for (i in 1:nrow(thru_rows)) {
    temp <- thru_rows$values[i]
    temp <- strsplit(temp, " thru | THRU ")[[1]]
    values <- temp[1]:temp[2]
    temp <- data.frame(variable = rep(thru_rows$variable[i], length(values)),
                       values = values,
                       stringsAsFactors = FALSE)
    missing <- rbind(missing, temp)
  }

  # Removes all rows with "thru"
  missing <- missing[-grep("thru -?[0-9]", missing$values, ignore.case = TRUE), ]
  return(missing)
}

parse_codebook <- function(setup_file, type) {
  codebook <- readr::read_lines(setup_file)
  codebook <- stringr::str_trim(codebook)
  if (type == "sps") {
    if (any(grepl("^DATA LIST", codebook, ignore.case = TRUE))) {
      codebook <- codebook[-c(1:(grep2("^DATA LIST", codebook) - 1))]
    }
  }
  return(codebook)
}


parse_value_labels <- function(setup, type) {

  if (is.null(setup$value_labels)) {
    return(NULL)
  } else {
    value_labels <- setup$value_labels
    if (type == "sps") {
      value_labels <- value_labels[value_labels$column %in% setup$setup$column_number, ]
    } else if (type == "sas") {
      value_labels <- value_labels[value_labels$column %in% setup$setup$column_number, ]
    }
    value_labels <- split.data.frame(value_labels, value_labels$column)
    value_label_cols <- c()
    for (i in seq_along(value_labels)) {
      column <- unique(value_labels[[i]]$column)
      value_labels[[i]] <- value_label_matrixer(value_labels[[i]][[1]])
      value_label_cols <- c(value_label_cols, column)
    }

    names(value_labels) <- value_label_cols
    return(value_labels)
  }
}

parse_column_names <- function(codebook, type) {
  # Get the column names
  if (type == "sps") {
    variable_label_location <- grep2("^variable labels$", codebook)
    if (length(variable_label_location) == 0) {
      return(NULL)
    }
    next_location <- grep2("^value labels$|missing values|^execute$|^.$|\\*RECODE$",
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
    # In case some variables are on multiple lines
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


    variables <- codebook[variable_label_location:next_location]
    variables <- variables[grep("=", variables)]
    variables <- gsub("(\\S)=", "\\1 =", variables)
    variables <- gsub("=(\\S)", "= \\1", variables)
    variables <- gsub('([[:alpha:]]+\\") ', '\\1   ', variables)

    variables <- gsub(' LABEL =\\"', '  "', variables)
  }
  variables <- unlist(strsplit(variables, '"\\s{3,}'))


  variables <- data.frame(column_name   = fix_names(variables),
                          column_number = gsub(" .*", "",
                                               variables),
                          stringsAsFactors = FALSE)
  if (any(grepl("^$", variables$column_name))) {
    variables <- variables[1:(grep("^$", variables$column_name)[1]), ]
  }
  variables <- variables[!variables$column_number %in% "*", ]
  return(variables)
}
