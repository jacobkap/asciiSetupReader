names_semicolon <- function(value_labels, codebook_column_spaces) {
  matches <- rev(unique(grep(paste(
    codebook_column_spaces$column_number,
    collapse = "|"),
    unlist(strsplit(value_labels, " ")), value = TRUE)))

  for (i in seq(1, length(matches), 20)) {

    secondi <- i + 19
    if (secondi > length(matches)) {secondi <- length(matches)}
    matches2 <- paste0("^", matches[i:(i+19)], "$",  collapse = "|")
    matches2 <- paste0("(", matches2, ")")
    matches3 <- paste0("^", matches[i:(i+19)], " ",  collapse = "|")
    matches3 <- paste0("(", matches3, ")")

    value_labels <- gsub(matches2, "\\1;;;;;", value_labels)
    value_labels <- gsub(matches3, "\\1;;;;; ", value_labels)
    value_labels <- gsub(" ;;;;;", ";;;;;", value_labels)
  }
  return(value_labels)
}


value_label_matrixer <- function(value_label_section) {
  column_name <- stringr::str_split(value_label_section, ";;;;;")[[1]][1]
  value_label_section <- gsub(paste0(column_name, ";;;;;"), "",
                              value_label_section)
  value_label_section <- paste(value_label_section, collapse = "")
  value_label_section <- gsub(" {2,}| /|\\.", "", value_label_section)
  value_label_section <- gsub('"', "'", value_label_section)
  value_label_section <- trimws(value_label_section)
  value_label_section <- stringr::str_split(value_label_section, "'")[[1]]
  value_label_section <- value_label_section[!value_label_section  %in%
                                               c("", " ", "/" )]
  value_label_section <- matrix(value_label_section, ncol = 2, byrow = TRUE)
  value_label_section[,1] <- trimws(value_label_section[,1])

  # for digits under 10 this fixes the error where it starts WITH 0
  # and doesn't match dataset
  if (length(grepl("^0[0-9]", value_label_section[,1])) > 0) {
  under10 <- matrix(value_label_section[grepl("^0[0-9]",
                    value_label_section[,1]),],
                    ncol = 2, byrow = FALSE)
  under10[,1] <- gsub("^0([0-9])", "\\1", under10[,1])
  value_label_section <- rbind(value_label_section, under10)
  }

  # for digits under 10 this fixes the error where it starts withOUT 0
  # and doesn't match dataset
  if (length(grepl("^[0-9]$", value_label_section[,1])) > 0) {
    under10 <- matrix(value_label_section[grepl("^[0-9]$",
                      value_label_section[,1]),],
                      ncol = 2, byrow = FALSE)
    under10[,1] <- paste0("0", under10[,1])
    value_label_section <- rbind(value_label_section, under10)
  }

  colnames(value_label_section) <- c(column_name, "variable_fixer12345")
  value_label_section <- data.table::data.table(value_label_section)
  return(value_label_section)
}


fix_variable_values <- function(dataset, variable_fix) {
  dataset[, names(variable_fix)[1] :=
            as.character(get(names(variable_fix)[1]))]
  dataset2 <- variable_fix[dataset, on = names(variable_fix)[1]]
  dataset2[, names(variable_fix)[1] :=
             as.character(get(names(variable_fix)[1]))]
  dataset2[!is.na(variable_fixer12345),
           names(variable_fix)[1] := variable_fixer12345]
  dataset2[, variable_fixer12345 := NULL]
  return(dataset2)
}
