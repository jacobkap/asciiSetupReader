parse_setup <- function(setup_file) {

  if (grepl(".sps(\\.zip)?$", setup_file)) {
    type <- "sps"
  } else {
    type <- "sas"
  }

  codebook  <- parse_codebook(setup_file, type = type)
  variables <- parse_column_names(codebook, type = type)

  if (type == "sps") {
  setup <- codebook[grep2("DATA LIST", codebook):
                      grep2("^variable labels$", codebook)]
  setup <- gsub("([[:alpha:]]+[0-9]*)\\s+", "\\1 ",
                setup)
  setup <- gsub(" ([0-9]+-[0-9]+) ([[:alpha:]])", " \\1   \\2",
                setup)
  setup <- gsub(" ([0-9]+) ([[:alpha:]])", " \\1   \\2",
                setup)
  setup <- unlist(strsplit(setup, '"\\s{3,}'))
  } else {
    setup <- codebook[grep2("^INPUT$", codebook):grep("^$", codebook)[grep("^$", codebook) > grep2("^INPUT$", codebook) + 5][1]]
    setup <- gsub("([[:alnum:]])\\s{2,}([0-9]+) ", "\\1 \\2 ", setup)
    setup <- gsub("([[:alnum:]])\\s{2,}([0-9]+)$", "\\1 \\2", setup)
    setup <- gsub("([[:alnum:]])\\s{2,}([0-9]+-[0-9]+) ", "\\1 \\2 ", setup)
    setup <- gsub("([[:alnum:]])\\s{2,}([0-9]+-[0-9]+)$", "\\1 \\2", setup)
  }
  setup <- get_column_spaces(setup, variables, codebook)
  setup <- setup[setup$column_number != "*", ]
  rownames(setup) <- 1:nrow(setup)
  if (any(grepl2("MISSING VALUES", codebook)) && type != "sas") {
    missing <- parse_missing(codebook)
    missing <- missing[missing$variable %in% setup$column_number, ]
  } else {
    missing <- NULL
  }


  value_labels <- get_value_labels(codebook, setup, type = type)
  setup <- stats::setNames(list(setup, value_labels, missing),
                           c("setup",
                             "value_labels",
                             "missing"))
  setup$value_labels <- parse_value_labels(setup, type = type)

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

parse_codebook <- function(setup_file, type) {
  codebook <- readr::read_lines(setup_file)
  codebook <- stringr::str_trim(codebook)
  if (type == "sps") {
    codebook <- codebook[-c(1:(grep2("^DATA LIST", codebook) - 1))]
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
      value_labels <- value_labels[value_labels$column %in% setup$setup$f_name, ]
    }
    value_labels <- split.data.frame(value_labels, value_labels$column)
    value_label_cols <- c()
    for (i in seq_along(value_labels)) {
      column <- unique(value_labels[[i]]$column)
 #     message(column)
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
  } else if (type == "sas") {
    variables <- codebook[grep2("^LABEL$", codebook):
                            grep("^$", codebook)[grep("^$", codebook) >
                                                   grep2("^LABEL$",
                                                         codebook)][1]]
    variables <- variables[grep("=", variables)]
    variables <- gsub("(\\S)=", "\\1 =", variables)
    variables <- gsub('([[:alpha:]]+\\") ', '\\1   ', variables)
  }
  variables <- unlist(strsplit(variables, '"\\s{3,}'))


  variables <- data.frame(column_name = fix_names(variables),
                          column_number = gsub(" .*", "",
                                               variables),
                          stringsAsFactors = FALSE)
  if (any(grepl("^$", variables$column_name))) {
    variables <- variables[1:(grep("^$", variables$column_name)[1]), ]
  }
  return(variables)
}
