value_label_matrixer <- function(value_label_section) {
  # In case some labels are on multiple lines
  plus <- grep("^\\+", value_label_section)
  if (length(plus) > 0) {
  for (n in 1:length(plus)) {
    value_label_section[n-1] <- paste(value_label_section[n-1],
                                      value_label_section[n],
                                      collapse = " ")
  }
    value_label_section <- value_label_section[-plus]
  }

  value_label_section <- value_label_section[2:nrow(value_label_section), 1]

  value_label_section <- gsub(" {2,}| /|\\.", "", value_label_section)
  value_label_section <- gsub('"', "'", value_label_section)
  value_label_section <- gsub("'$", "", value_label_section)
  value_label_section <- unlist(stringr::str_split(value_label_section, "' '"))
  if (all(grepl("\\s", value_label_section))) {
    value_label_section <- unlist(stringr::str_split(value_label_section, "'"))
  }
  value_label_section <- gsub("'", "", value_label_section)
  value_label_section <- trimws(value_label_section)

  value_label_section <- matrix(value_label_section, ncol = 2, byrow = TRUE)
  values <- value_label_section[,1]
  names(values) <- value_label_section[,2]

  return(values)
}


fix_variable_values <- function(dataset, value_label_section, column) {
  column <- as.integer(grep(paste0("^", column, "$"), names(dataset)))
  if (!is.character(dataset[[column]])) {
  data.table::set(dataset, j = column, value = as.character(dataset[[column]]))
  }
  data.table::set(dataset, j = column,  value = haven::as_factor(haven::labelled(dataset[[column]], value_label_section)))
}
