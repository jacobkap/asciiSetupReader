#' Paese the SPSS setup file (.sps file)
#'
#' @param sps_name
#' String of the name of the sps setup file.
#' @param select_columns
#'
#' @param use_value_labels
#' If TRUE (default) returns a data.frame of three columns.
#' Column 1 shows the value
#' else returns NULL
#'
#' @return
#' @export
#'
#' @examples
#' sps_name <- system.file("extdata", "example_setup.sps",
#'   package = "asciiSetupReader")
#'
#' \dontrun{
#' example  <- parse_spss(sps_name = sps_name)
#' }
parse_spss <- function(sps_name) {

  codebook <- parse_codebook(sps_name)

  # Get the column names
  variables <- codebook[grep2("^variable labels$", codebook):
                          grep2("^value labels$|missing values|^execute$",
                                codebook)[1]]
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
  setup <- gsub(" ([0-9]+-[0-9]+) ([[:alpha:]])", " \\1   \\2",
                setup)
  setup <- gsub(" ([0-9]+) ([[:alpha:]])", " \\1   \\2",
                setup)



  setup <- unlist(strsplit(setup, '"\\s{3,}'))
  setup <- get_column_spaces(setup, variables)
  setup <- setup[setup$column_number != "*", ]

  if (any(grepl2("MISSING VALUES", codebook))) {
    missing <- parse_missing(codebook)
    missing <- missing[missing$variable %in% setup$column_number, ]
  } else missing <- NULL


    value_labels <- get_value_labels(codebook, setup)

  setup <- stats::setNames(list(setup, value_labels, missing), c("setup",
                                                                 "value_labels",
                                                                 "missing"))

  return(setup)

}


parse_missing <- function(codebook) {

  start <- grep2("MISSING VALUES$", codebook)
  end <- grep2("EXECUTE|^\\*.*SPSS", codebook)
  if (length(end) == 0 | all(end <= start)) {
    end <- length(codebook)
  } else {
    end <- min(end[end > start])
  }
  missing <- codebook[start:end]
  missing <- gsub("(\\S),(\\S)", "\\1, \\2", missing)
  missing <- gsub("\\s{3,}\\(", " \\(", missing)
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
