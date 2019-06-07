value_label_matrixer <- function(value_label) {
  value_label <- gsub("'\\.$", "'", value_label)
  value_label <- gsub("=\\[(.*)\\]", "='\\1'", value_label)
  value_label <- gsub('"\\.$', '"', value_label)
  # In case some labels are on multiple lines
  plus <- grep("^\\+", value_label)
  # For cases where label is on multiple line but doesn't have a plus
  num_apostrophes <- stringr::str_count(value_label, "'")
  apostrophe_plus <- grep("\\'$", value_label)
  apostrophe_plus <- apostrophe_plus[which(num_apostrophes == 1)]
  apostrophe_plus <- apostrophe_plus[!is.na(apostrophe_plus)]
  plus <- unique(c(plus, apostrophe_plus))
  if (length(plus) > 0) {
    for (n in 1:length(plus)) {
      value_label[plus[n] - 1] <- paste(value_label[plus[n] - 1],
                                                value_label[plus[n]],
                                                collapse = " ")
      value_label[plus[n] - 1] <- gsub("\\' *\\+ *\\'", "",
                                               value_label[plus[n] - 1])
    }
    value_label <- value_label[-plus]
  }

  value_label <- value_label[2:length(value_label)]


  value_label <- gsub('\\"', "\\'",
                              value_label)
  value_label <- gsub("^''", "'####BLANK####'",
                              value_label)
  value_label <- gsub("^' '", "'####SPACE####'",
                              value_label)
  value_label <- gsub(" '' ", " '####BLANK####' ",
                              value_label)
  value_label <- gsub(" {2,}| /\\.", "", value_label)
  value_label <- gsub('"', "'", value_label)
  value_label <- gsub("'\\s+.$", "'", value_label)
  value_label <- gsub("'$|''", "", value_label,
                              perl = TRUE)
  value_label <- gsub("(?<![<>])=", " ", value_label, perl = TRUE)
  value_label <- gsub("\\s+", " ", value_label)
  value_label <- gsub("([[:alpha:]])\\'([[:alpha:]])", "\\1 \\2",
                              value_label)

  value_label <- unlist(stringr::str_split(value_label, "' '"))
  if (all(grepl("\\s", value_label))) {
    value_label <- unlist(stringr::str_split(value_label, "'"))
  }
  value_label <- gsub("'| =", "", value_label)
  value_label <- stringr::str_trim(value_label)
  value_label <- gsub("####BLANK####", "", value_label)
  value_label <- gsub("####SPACE####", " ", value_label)

  value_label <- matrix(value_label, ncol = 2, byrow = TRUE)
  values <- value_label[, 1]
  names(values) <- value_label[, 2]

  return(values)
}


fix_variable_values <- function(.data, value_label_section, column) {

  value_label_section <- single_digit(value_label_section)
  value_label_section <- double_digit(value_label_section)
  value_label_section <- value_label_section[!duplicated(value_label_section)]

  if (!is.character(.data[[column]])) {
    data.table::set(.data, j = column, value = as.character(.data[[column]]))
  }
  data.table::set(.data, j = column,
                  value = haven::as_factor(haven::labelled(.data[[column]],
                                                           value_label_section)))


  data.table::set(.data, j = column, value = as.character(.data[[column]]))
  return(.data)
}

single_digit <- function(value_label_section) {
  if (any(grepl("^[0-9]$", value_label_section))) {
    single_digit <- value_label_section[grep("^[0-9]$", value_label_section)]
    names_single_digit <- names(single_digit)
    single_digit <- paste0("0", single_digit)
    names(single_digit) <- names_single_digit
    value_label_section <- c(value_label_section, single_digit)
  }
  return(value_label_section)
}

double_digit <- function(value_label_section) {
  if (any(grepl("^0[0-9]$", value_label_section))) {
    double_digit <- value_label_section[grep("^0[0-9]$", value_label_section)]
    names_double_digit <- names(double_digit)
    double_digit <- gsub("^.", "", double_digit)
    names(double_digit) <- names_double_digit
    value_label_section <- c(value_label_section, double_digit)
  }
  return(value_label_section)
}

get_value_labels <- function(codebook, setup, type) {
  if (!any(grepl2("^value labels$|SAS FORMAT STATEMENT|^format$|\\/\\* format$",
                  codebook))) {
    return(NULL)
  }

  if (type == "sps") {
    value_labels <- get_value_labels_sps(codebook, setup)
  } else if (type == "sas") {
    value_labels <- get_value_labels_sas(codebook, setup)
  }

  for (i in 1:nrow(value_labels)) {
    if (tolower(value_labels$column[i]) %in% tolower(setup$column_number)) {
      value_labels$column[i] <-
        setup$column_number[tolower(setup$column_number) %in% tolower(value_labels$column[i])]
    }
  }

  return(value_labels)
}

get_value_labels_sas <- function(codebook, column_spaces) {
  # Gets value labels
  f_names <- as.character(column_spaces$f_name[!is.na(column_spaces$f_name)])
  starting <- c()
  for (f_name in f_names) {
    result <- grep(paste("VALUE", f_name),
                   codebook, fixed = TRUE)
    if (length(result) < 1) {
      result <- grep(paste("value", f_name),
                     codebook, fixed = TRUE)
    }
    starting <- c(starting, result)
  }
  starting <- min(starting)

  value_position <- grep2("^VALUE ", codebook)
  next_section <- grep2("^$|^\\.$|^\\*/$|^;$|^; ?\\*/$", codebook)
  value_position <- value_position[value_position >= starting]
  value_labels <- codebook[(value_position[1]):(next_section[next_section >= max(value_position)][1]-1)]
  value_labels <- gsub(";\\*\\/", "", value_labels)
  value_labels <- gsub("([[:alpha:]]+);", "\\1", value_labels)
  value_labels <- unlist(strsplit(value_labels, ";"))


  for (f_name in f_names) {
    value_labels <- gsub(paste0("^VALUE ", f_name, " \\(\\S*\\)"),
                         paste0("VALUE ", f_name), value_labels,
                         ignore.case = TRUE)
  }


  value_labels <- gsub("^VALUE ", "", value_labels,
                       ignore.case = TRUE)
  value_labels <- stringr::str_trim(value_labels)
  value_labels <- gsub("&\\s+", "& ", value_labels)



  value_labels <- gsub("([[:alpha:]]+)\\s+(<?[0-9]+)", "\\1 \\2",
                       value_labels)
  value_labels <- gsub("([[:alpha:]]+)\\s+([[:alpha:]]+)", "\\1 \\2",
                       value_labels)
  value_labels <- gsub("([[:alnum:]]+\\.[[:alnum:]]+=)", "      \\1",
                       value_labels)
  value_labels <- gsub("([^\\.]-?[[:alnum:]]+=)", "      \\1",
                       value_labels)
  value_labels <- trimws(value_labels)
  value_labels <- unlist(strsplit(value_labels, "\\s{2,}"))

  value_labels <- data.frame(value_labels,
                             column = value_labels[1],
                             stringsAsFactors = FALSE)

  column <- value_labels$value_labels[1]
  for (i in 1:nrow(value_labels)) {
    value_labels$column[i] <- column
    if (value_labels$value_labels[i + 1] %in% column_spaces$f_name) {
      column <- value_labels$value_labels[i + 1]
    }
  }

  final_value_labels <- data.frame(stringsAsFactors = FALSE)
  for (col in unique(value_labels$column)) {
    single_value_label <- value_labels[value_labels$column %in% col, ]
    real_names <- unique(column_spaces$column_number[column_spaces$f_name %in% col])
    for (real_name in real_names) {
      temp <- single_value_label
      temp$value_labels[1] <- real_name
      temp$column <- real_name
      final_value_labels <- rbind(final_value_labels, temp)
    }
  }

  return(final_value_labels)
}

get_value_labels_sps <- function(codebook, codebook_column_spaces) {
  value_start <- grep2("^value labels$",
                       codebook)
  end_row <- grep("^\\.$|^$", codebook)
  end_row <- end_row[end_row > value_start][1] - 1
  if (is.na(end_row))  end_row <- length(codebook)
  value_labels <- codebook[value_start:end_row]
  value_labels <- stringr::str_trim(value_labels)
  # value_labels <- gsub("([[:alpha:]])''([[:alpha:]])", "\\1'\\2",
  #                      value_labels)
  value_labels <- gsub('\\s+\\"$', '"', value_labels)
  value_labels <- gsub('\\"\\s+([[:alnum:]])', '\\"\\1', value_labels)
  value_labels <- gsub("\\s+\\(", " \\(", value_labels)
  value_labels <- gsub("&\\s+", "& ", value_labels)
  value_labels <- gsub("([[:alpha:]])\\s{2,}([[:alpha:]])", "\\1 \\2",
                       value_labels)

  value_labels <- gsub('^([0-9]+)\\s{2,}\\"', '\\1 \\"', value_labels)
  value_labels <- gsub('(\\s{2,})([0-9]+)\\s{2,}\\"', '\\1\\2 \\"',
                       value_labels)

  add_spaces <- paste0(codebook_column_spaces$column_number, "   ")
  names(add_spaces) <- paste0('^', codebook_column_spaces$column_number, " ")
  add_spaces <- add_spaces[!duplicated(add_spaces)]
  add_spaces <- add_spaces[!grepl("^\\*", add_spaces)]
  value_labels <- stringr::str_replace_all(value_labels, add_spaces)
  value_labels <- gsub("\"([[:alnum:]]+)\\s+([0-9])", "\"\\1 \\2",
                       value_labels)

  value_labels <- gsub("([[:alpha:]])\\s\\s([0-9])",
                       "\\1 \\2", value_labels)
  value_labels <- gsub("([[:alpha:]])\\s\\s([[:punct:]])",
                       "\\1 \\2", value_labels)
  value_labels <- gsub(":  ",
                       ": ", value_labels)

  value_labels <- unlist(strsplit(value_labels, "\\s{2,}"))
  value_labels <- value_labels[!value_labels %in% c(".", "/")]
  value_labels <- value_labels[-1]
  value_labels <- gsub('"', "'", value_labels)
  value_labels <- gsub('^/', "", value_labels)
  value_labels <- gsub("''''", "''", value_labels)
  value_labels <- gsub('\\"', "\\'", value_labels)
  value_labels <- data.frame(value_labels,
                             column = value_labels,
                             stringsAsFactors = FALSE)


  column <- value_labels$value_labels[1]
  for (i in 1:nrow(value_labels)) {
    value_labels$column[i] <- column
    if (grepl("\\' \\/$", value_labels$value_labels[i]) |
        value_labels$value_labels[i + 1] %in%
        codebook_column_spaces$column_number |
        (!grepl("\\'", value_labels$value_labels[i + 1]) &
         !grepl("^[0-9]+$", value_labels$value_labels[i + 1]))) {
      column <- value_labels$value_labels[i + 1]
    }
  }
  return(value_labels)
}

fix_names <- function(names) {
  names <- gsub('^.* = |^.* \\"|\\W|#|\\/', "_", names)
  names <- gsub("_+", "_", names)
  names <- gsub("^_|_$", "", names)
  names <- gsub("^([0-9])", "X\\1", names)
  return(names)
}

# Make numeric columns numeric
all_numeric <- function(column) {
  column_NAs <- sum(is.na(column))
  column <- suppressWarnings(as.numeric(as.character(column)))
  return(is.numeric(column) && sum(is.na(column)) == column_NAs)
}

make_cols_numeric <- function(dataset) {
  times <- nrow(dataset) * .10
  if (times < 50000 && nrow(dataset) > 50000)  times <- 50000
  times <- sample(nrow(dataset), times, replace = FALSE)
  if (nrow(dataset) < 50000) times <- 1:nrow(dataset)
  for (i in seq_along(dataset)) {
    if ( (all_numeric(dataset[[i]][times])) ) {
      suppressWarnings(data.table::set(dataset, j = i,
                                       value = as.numeric(as.character(dataset[[i]]))))
    }
  }
  return(dataset)
}
