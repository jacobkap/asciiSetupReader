parse_spss <- function(sps_name, keep_columns = NULL, value_label_fix = TRUE) {

  codebook <- parse_codebook(sps_name)

  # Get the column names
  variables <- codebook[grep2("^variable labels$", codebook):
                          grep2("^value labels$|missing values",
                                codebook)[1]]
  variables <- gsub("\\'\\'", "\\'", variables)
  variables <- gsub("( \\'[[:alnum:]])\\'([[:alnum:]])", "\\1\\2",
                    variables)
  variables <- gsub("\'", "\"", variables)
  variables <- unlist(strsplit(variables, '"\\s{3,}'))
  variables <- data.frame(column_name = fix_names(variables),
                          column_number = gsub(" .*", "",
                                               variables),
                          stringsAsFactors = FALSE)
  if (any(grepl("^$", variables$column_name))) {
    variables <- variables[1:(grep("^$", variables$column_name)[1]), ]
  }

  setup <- codebook[grep2("DATA LIST", codebook):
                      grep2("^variable labels$", codebook)]
  setup <- gsub("([[:alpha:]]+[0-9]*)\\s+", "\\1 ",
                setup)
  setup <- unlist(strsplit(setup, '"\\s{3,}'))
  setup <- get_column_spaces(setup, variables)
  setup <- selected_columns(keep_columns, setup)
  setup <- setup[setup$column_number != "*", ]

  if (any(grepl("MISSING VALUES", codebook))) {
    missing <- parse_missing(codebook)
    missing <- missing[missing$variable %in% setup$column_number, ]
  } else missing <- NULL

  if (value_label_fix) {
    value_labels <- get_value_labels(codebook, setup)
  } else {
    value_labels <- NULL
  }

  setup <- stats::setNames(list(setup, value_labels, missing), c("setup",
                                                                 "value_labels",
                                                                 "missing"))

  return(setup)

}


parse_missing <- function(codebook) {

  start <- grep("MISSING VALUES$", codebook)
  end <- grep("EXECUTE|^\\*.*SPSS", codebook, ignore.case = TRUE)
  if (length(end) == 0 | all(end <= start)) {
    end <- length(codebook)
  } else {
    end <- min(end[end > start])
  }
  missing <- codebook[start:end]
  missing <- gsub("(\\S),(\\S)", "\\1, \\2", missing)
  missing <- unlist(strsplit(missing, ",|\\s{2,}"))

  missing <- data.frame(variable = gsub(" .*", "", missing),
                        values = gsub(".*\\(|\\).*", "", missing),
                        stringsAsFactors = FALSE)
  missing$variable[missing$variable == ""] <- NA
  missing$variable <- zoo::na.locf(missing$variable, na.rm = FALSE)
  missing$values <- gsub("\\.$", "", missing$values)
  missing$values <- gsub('\\"', "\\'", missing$values)
  return(missing)
}

parse_codebook <- function(sps_name) {
  codebook <- readr::read_lines(sps_name)
  codebook <- stringr::str_trim(codebook)
  codebook <- codebook[-c(1:(grep2("^DATA LIST", codebook) - 1))]
  return(codebook)
}


parse_value_labels <- function(setup) {

  if (is.null(setup$value_labels)) {
    return(NULL)
  } else {

    value_labels <- setup$value_labels
    if (!is.null(value_labels)) {
      value_labels <- value_labels[value_labels$column %in%
                                     setup$setup$column_number, ]
      value_labels <- split.data.frame(value_labels, value_labels$group)
    }

    value_label_cols <- c()
    for (i in seq_along(value_labels)) {
      column <- value_labels[[i]][1, 1]
      if (column %in% setup$setup$column_number) {
        value_labels[[i]] <- value_label_matrixer(value_labels[[i]][[1]])
        value_label_cols <- c(value_label_cols, column)
      }
    }
    names(value_labels) <- value_label_cols
    return(value_labels)
  }
}
