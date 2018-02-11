value_label_matrixer <- function(value_label_section) {
  # In case some labels are on multiple lines
  plus <- grep("^\\+", value_label_section)
  if (length(plus) > 0) {
  for (n in 1:length(plus)) {
    value_label_section[plus[n] - 1] <- paste(value_label_section[plus[n] - 1],
                                      value_label_section[plus[n]],
                                      collapse = " ")
    value_label_section[plus[n] - 1] <- gsub("\\' *\\+ *\\'", "",
                                             value_label_section[plus[n] - 1])
  }
    value_label_section <- value_label_section[-plus]
  }

  value_label_section <- value_label_section[2:length(value_label_section)]

  value_label_section <- gsub(" {2,}| /| /\\.", "", value_label_section)
  value_label_section <- gsub('"', "'", value_label_section)
  value_label_section <- gsub("'$", "", value_label_section)
  value_label_section <- gsub("=", " ", value_label_section)
  value_label_section <- gsub("\\s+", " ", value_label_section)
  value_label_section <- gsub("([[:alpha:]])\\'([[:alpha:]])", "\\1 \\2",
                              value_label_section)

  value_label_section <- unlist(stringr::str_split(value_label_section, "' '"))
  if (all(grepl("\\s", value_label_section))) {
    value_label_section <- unlist(stringr::str_split(value_label_section, "'"))
  }
  value_label_section <- gsub("'| =", "", value_label_section)
  value_label_section <- gsub("^\\(.*\\) ", "", value_label_section)
  value_label_section <- stringr::str_trim(value_label_section)

  value_label_section <- matrix(value_label_section, ncol = 2, byrow = TRUE)
  values <- value_label_section[, 1]
  names(values) <- value_label_section[, 2]

  return(values)
}


fix_variable_values <- function(dataset, value_label_section, column) {

  value_label_section <- single_digit(value_label_section)
  value_label_section <- double_digit(value_label_section)

  if (!is.character(dataset[[column]])) {
  data.table::set(dataset, j = column, value = as.character(dataset[[column]]))
  }
  if (length(value_label_section) < nrow(dataset) / 2) {
  data.table::set(dataset, j = column,
                  value = haven::as_factor(haven::labelled(dataset[[column]],
                                                      value_label_section)))
  }
  return(dataset)
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

get_value_labels <- function(codebook, codebook_column_spaces) {
  if (!any(grepl2("^value labels$",
           codebook))) {
    return(NULL)
  }
  value_start <- grep2("^value labels$",
                      codebook)

  end_row <- grep("^\\.$", codebook)
  end_row <- end_row[end_row > value_start][1] - 1
  if (is.na(end_row))  end_row <- length(codebook)
  value_labels <- codebook[value_start:end_row]
  value_labels <- stringr::str_trim(value_labels)
  value_labels <- gsub('\\s+\\"$', '"', value_labels)
  value_labels <- gsub('\\"\\s+([[:alnum:]])', '\\"\\1', value_labels)
  value_labels <- gsub("\\s+\\(", " \\(", value_labels)
  value_labels <- gsub("&\\s+", "& ", value_labels)
  value_labels <- gsub("([[:alpha:]])\\s{2,}([[:alpha:]])", "\\1 \\2",
                       value_labels)

  value_labels <- gsub('^([0-9]+)\\s{2,}\\"', '\\1 \\"', value_labels)
  value_labels <- unlist(strsplit(value_labels, "\\s{2,}"))
  value_labels <- value_labels[!value_labels %in% c(".", "/")]
  value_labels <- value_labels[-1]
  value_labels <- gsub('"', "'", value_labels)
  value_labels <- gsub('^/', "", value_labels)
  value_labels <- gsub('\\"', "\\'", value_labels)
  value_labels <- data.frame(value_labels,
                             group = 0,
                             column = value_labels[1], stringsAsFactors = FALSE)

  group <- 1
  column <- value_labels$value_labels[1]
  for (i in 1:nrow(value_labels)) {
    value_labels$group[i] <- group
    value_labels$column[i] <- column
    if (grepl("\\' \\/$", value_labels$value_labels[i]) |
        value_labels$value_labels[i + 1] %in%
        codebook_column_spaces$column_number |
        !grepl("\\'", value_labels$value_labels[i + 1])) {
      group <- group + 1
      column <- value_labels$value_labels[i + 1]
    }
  }
  return(value_labels)
}

fix_names <- function(names) {
  names <- gsub('^.* = |^.* \\"|\\W', "_", names)
  names <- gsub("_+", "_", names)
  names <- gsub("^_|_$", "", names)
  names <- gsub("^([0-9])", "X\\1", names)
  return(names)
}

# Make numeric columns numeric
all_numeric <- function(column) {
  if (is.factor(column)) {
    return(FALSE)
  }
  column_NAs <- sum(is.na(column))
  column <- suppressWarnings(as.numeric(as.character(column)))
  return(is.numeric(column) && sum(is.na(column)) == column_NAs)
}


make_cols_numeric <- function(dataset) {
  times <- nrow(dataset) * .10
  if (times < 100000 && nrow(dataset) > 100000)  times <- 100000
  times <- sample(nrow(dataset), times, replace = FALSE)
  if (nrow(dataset) < 100000) times <- 1:nrow(dataset)
  for (i in seq_along(dataset)) {
    if ( (!is.factor(dataset[[i]][times]) && all_numeric(dataset[[i]][times])) ) {
      suppressWarnings(data.table::set(dataset, j = i,
                                       value = as.numeric(dataset[[i]])))
    }
  }
  return(dataset)
}
