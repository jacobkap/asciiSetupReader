# old code


value_labels[,1] <- toupper(value_labels[,1])

value_labels[,1] <- gsub('"', "'", value_labels[,1])

value_labels[,1] <-  gsub("\\'(?=-1\\')" , "",
                          value_labels[,1], perl = TRUE)
value_labels[,1] <-  gsub("(?<=-1)\\'" , "",
                          value_labels[,1], perl = TRUE)


value_labels[,1] <-  gsub("\\'(?=[0-9+]\\')" , "",
                          value_labels[,1], perl = TRUE)

value_labels[,1] <- gsub("(?<= [0-9])\\' |(?<=^[0-9])\\' " , " ",
                         value_labels[,1], perl = TRUE)

value_labels[,1] <- gsub("(?<=[0-9][A-Z])\\'" , "",
                         value_labels[,1], perl = TRUE,
                         ignore.case = TRUE)

value_labels[,1] <- gsub("(?<=[0-9][0-9])\\'" , "",
                         value_labels[,1], perl = TRUE,
                         ignore.case = TRUE)
value_labels[,1] <-
  gsub("\\'(?=[0-9][0-9]\\')|\\'(?=[0-9][0-9])" , "",
       value_labels[,1], perl = TRUE)

value_labels[,1] <- gsub("(?<=[0-9][0-9][A-Z])\\'" , "",
                         value_labels[,1], perl = TRUE,
                         ignore.case = TRUE)

value_labels[,1] <- gsub("(?<=[0-9][0-9][0-9])\\'" , "",
                         value_labels[,1], perl = TRUE,
                         ignore.case = TRUE)

value_labels[,1] <-
  gsub("\\'(?=[0-9][0-9][0-9]\\')|\\'(?=[0-9][0-9][0-9])" , "",
       value_labels[,1], perl = TRUE)


value_labels[,1] <- gsub("\\'(?=[0-9][A-Z])|\\'(?=[0-9][0-9][A-Z])" , "",
                         value_labels[,1], perl = TRUE,
                         ignore.case = TRUE)

value_labels[,1] <- gsub("\\'(?=[A-Z]\\')" , "",
                         value_labels[,1], perl = TRUE)
value_labels[,1] <- gsub("(?<= [A-Z])\\'|(?<=^[A-Z])\\'" , "",
                         value_labels[,1], perl = TRUE,
                         ignore.case = TRUE)

value_labels[,1] <- gsub("\\'(?=[A-Z][A-Z]\\')" , "",
                         value_labels[,1], perl = TRUE,
                         ignore.case = TRUE)
value_labels[,1] <- gsub("(?<= [A-Z][A-Z])\\'|(?<=^[A-Z][A-Z])\\'" , "",
                         value_labels[,1], perl = TRUE,
                         ignore.case = TRUE)


value_labels[,1] <- gsub("\\s*\\([^\\)]+\\)", " ",
                         value_labels[,1])

variable_add_space <- data.frame(codebook_variables$column_number,
                                 stringsAsFactors = FALSE)
variable_add_space$added <- paste0(variable_add_space[,1], "   ")
variable_add_space[,3] <- paste0("^", variable_add_space[,1], " ")
variable_add_space[,1] <- paste0("^", variable_add_space[,1], "$")

for (i in 1:nrow(variable_add_space)) {
  value_labels[,1] <- gsub(variable_add_space[i ,1],
                           variable_add_space[i ,2],
                           value_labels[,1])
  value_labels[,1] <- gsub(variable_add_space[i ,3],
                           variable_add_space[i ,2],
                           value_labels[,1])
}

check_length <- data.frame(unlist(strsplit(value_labels[,1],
                                           split = "\\' |\\'$")),
                           stringsAsFactors = FALSE)
if (nrow(check_length) > (1.75 * nrow(value_labels))) {
  value_labels <- data.frame(unlist(strsplit(value_labels[,1],
                                             split = "\\' |\\'$")),
                             stringsAsFactors = FALSE)
}
value_labels[,1] <- gsub("\\' ", "\\'    ", value_labels[,1])
value_labels <- data.frame(unlist(
  stringr::str_split(value_labels[,1],
                     "\\s\\s\\s+")), stringsAsFactors = FALSE)
value_labels[,1] <- gsub("-1", "tempminusone", value_labels[,1])
value_labels[,1] <- gsub("-2", "tempminustwo", value_labels[,1])
value_labels[,1] <- gsub("-3", "tempminusthree", value_labels[,1])
value_labels[,1] <- gsub("-4", "tempminusfour", value_labels[,1])
value_labels[,1] <- gsub("-5", "tempminusfive", value_labels[,1])
value_labels[,1] <- gsub("[[:punct:]]", " ", value_labels[,1])
value_labels[,1] <- gsub("tempminusone", "-1", value_labels[,1])
value_labels[,1] <- gsub("tempminustwo", "-2", value_labels[,1])
value_labels[,1] <- gsub("tempminusthree", "-3", value_labels[,1])
value_labels[,1] <- gsub("tempminusfour", "-4", value_labels[,1])
value_labels[,1] <- gsub("tempminusfive", "-5", value_labels[,1])
value_labels[,1] <- gsub("\"", "", value_labels[,1])
value_labels <- data.frame(value_labels[-grep("^$|^ *$",
                                              value_labels[,1]),],
                           stringsAsFactors = FALSE)
value_labels[,1] <- gsub(' +', ' ', value_labels[,1])
names(value_labels) <- "column_number"
value_labels$value <- gsub("(.[:alnum:]*) .*", "\\1", value_labels[,1])
value_labels$replace <- NA
for (i in 1:nrow(value_labels)) {
  value_labels$replace[i] <- gsub(paste0("^",
                                         value_labels$value[i]), "",
                                  value_labels$column_number[i])
}
replacement <- value_labels[,1][1]
value_labels[,1] <- gsub(" ", "_", value_labels[,1])
for (i in 1:nrow(value_labels)) {
  if (value_labels[i, 1] %in% codebook_variables$column_number) {
    value_labels[i, 2] <- value_labels[i, 1]
    value_labels[i, 3] <- ""
    replacement <- value_labels[i, 1]
  }
  value_labels[i, 1] <- replacement
}
value_labels <- value_labels[value_labels[,1] != value_labels[,2],]
value_labels$value <- stringr::str_trim(value_labels$value)
value_labels <- suppressMessages(dplyr::left_join(value_labels,
                                                  codebook_column_spaces))
value_labels <- value_labels[!is.na(value_labels$column_name) &
                               value_labels$replace != "",]
value_labels[, c("first_num", "second_num", "column_name")] <- NULL

value_labels <- suppressWarnings(reshape(value_labels,
                                         timevar = "column_number",
                                         idvar = "value", direction = "wide"))
names(value_labels) <- gsub("Replace.", "",
                            ignore.case = TRUE, names(value_labels))


system.time(fix_value_labels(clean_text_file, value_labels))
