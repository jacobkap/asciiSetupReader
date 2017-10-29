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
  original <- data.frame(unique(dataset[[column_num]]),
                         unique(dataset[[column_num]]))
  original <- original[!original[,1] %in% variable_fix[,1],]
  names(original) <- names(variable_fix)

  if (nrow(original) > 0) {
    variable_fix <- under10_fixer(variable_fix, original)
  }

  duplicates <- variable_fix[duplicated(variable_fix[,2]),]
  if (nrow(duplicates) > 0) {
    duplicates[,2] <- paste0(duplicates[,2], "69789ladadadada")
  }

  variable_fix <- variable_fix[!variable_fix[,1] %in% duplicates[,1],]
  variable_fix <- variable_fix[!variable_fix[,2] %in% duplicates[,2],]
  variable_fix <- rbind(variable_fix, duplicates)

  if (any(variable_fix[,1] %in% unique(dataset,by = names(variable_fix[1]))[[column_num]])) {
    variable_fix <- rbind(variable_fix, original)
    variable_fix <- variable_fix[!is.na(variable_fix[,1]),]
    variable_fix <- variable_fix[!duplicated(variable_fix[,1]),]

    dataset[[column_num]] <- factor(dataset[[column_num]], levels = variable_fix[,1], labels = variable_fix[,2])
  }

    if (nrow(duplicates) > 0) {
      dataset[[column_num]] <- gsub("69789ladadadada", "",
                                    dataset[[column_num]], fixed = TRUE)

    }
  return(dataset)
}

under10_fixer <- function(variable_fix, original) {
  if (any(grepl("^0[0-9]+", variable_fix[,1])) & !any(grepl("^0[0-9]+", original[,1]))) {

    temp <- variable_fix[,1][gsub("^0([0-9]+)", "\\1", variable_fix[,1]) %in% original[,1]]
    if (length(temp) > 0) {
    temp <- as.data.frame(temp)
    temp$new <- gsub("^0([0-9]+)", "\\1", temp[,1])
    temp[,1] <- paste0("^", temp[,1], "$")

    for (i in 1:nrow(temp)) {
      variable_fix[,1] <- gsub(temp[i, 1], temp[i, 2], variable_fix[,1])
    }
    }
  }
  return(variable_fix)
}

