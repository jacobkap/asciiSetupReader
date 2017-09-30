value_label_matrixer <- function(value_label_section) {
  # column_name <- stringr::str_split(value_label_section, ";;;;;")[[1]][1]
  column_name <- value_label_section[1]
  value_label_section <- value_label_section[-1]

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

  colnames(value_label_section) <- c(column_name, "variable_fixer12345")
  value_label_section <- data.table::data.table(value_label_section)
  return(value_label_section)
}


fix_variable_values <- function(dataset, variable_fix) {

  column_num <- as.numeric(grep(paste0("^", names(variable_fix)[1], "$"), names(dataset)))
  dataset[[column_num]] <- gsub("^0([1-9])$", "\\1", dataset[[column_num]])
  variable_fix <- data.frame(variable_fix)
  variable_fix <- variable_fix[!duplicated(variable_fix[,2]),]
  original <- data.frame(unique(dataset[[column_num]]),
                         unique(dataset[[column_num]]))
  original <- original[!original[,1] %in% variable_fix[,1],]
  names(original) <- names(variable_fix)

  if (any(variable_fix[,1] %in% unique(dataset,by = names(variable_fix[1]))[[column_num]])) {
  variable_fix <- rbind(variable_fix, original)
  variable_fix <- variable_fix[!is.na(variable_fix[,1]),]
  dataset[[column_num]] <- factor(dataset[[column_num]], levels = variable_fix[,1], labels = variable_fix[,2])
  }
  return(dataset)
}
