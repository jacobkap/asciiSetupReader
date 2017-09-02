names_semicolon <- function(value_labels, codebook_column_spaces) {
  matches <- rev(unique(grep(paste(
    codebook_column_spaces$column_number,
    collapse = "|"),
    unlist(strsplit(value_labels, " ")), value = TRUE)))

  for (i in seq(1, length(matches), 20)) {

    secondi <- i + 19
    if (secondi > length(matches)) {secondi <- length(matches)}
    matches2 <- paste0("^", matches[i:(i + 19)], "$",  collapse = "|")
    matches2 <- paste0("(", matches2, ")")
    matches3 <- paste0("^", matches[i:(i + 19)], " ",  collapse = "|")
    matches3 <- paste0("(", matches3, ")")

    value_labels <- gsub(matches2, "\\1;;;;;", value_labels)
    value_labels <- gsub(matches3, "\\1;;;;; ", value_labels)
    value_labels <- gsub(" ;;;;;", ";;;;;", value_labels)
  }
  return(value_labels)
}


value_label_matrixer <- function(value_label_section) {
  column_name <- stringr::str_split(value_label_section, ";;;;;")[[1]][1]

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
  dataset[[column_num]] <- factor(dataset[[column_num]], levels = variable_fix[,1], labels = variable_fix[,2])
  return(dataset)
}

# z <- ""
# for (i in 1:nrow(variable_fix)) {
#   z <- paste0(z, '"', variable_fix[i,2], '" = "', variable_fix[i,1], '",')
# }
# z
