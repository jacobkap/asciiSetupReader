#' Read ASCII file using SPSS Setup file
#'
#' @param dataset_name
#' Name of the ASCII file
#' @param setup_file_name
#' Name of the SPSS Setup file
#' @return
#' Data frame of the data from the ASCII file
#' @export
#'
#' @examples
#'
#' # The juvenile jails dataset contains info about jails that house
#' # juveniles in the United States in 1995
#'
#' example <- spssSetup(dataset_name = "juvenile_jails_1994_5.txt",
#' setup_file_name = "juvenile_jails_1994_5.sps")
#'
#' example2 <- spssSetup(dataset_name = "juvenile_jails_1994_5.txt",
#' setup_file_name = "juvenile_jails_1994_5.sps", smart_col_class = TRUE)
spss_reader <- function(dataset_name, setup_file_name) {
  codebook <- data.frame(readr::read_lines(setup_file_name))
  # codebook <- gsub("\\.", "", codebook)
  codebook[,1] <- stringr::str_trim(codebook[,1])
  # Get the column names
  codebook_variables <- data.frame(codebook[grep("^variable labels$",
                                          ignore.case = TRUE, codebook[,1]):
                                       grep("^value labels$",
                                            ignore.case = TRUE, codebook[,1]),])
  if (mean(stringr::str_count(codebook_variables[,1], "V[0-9]")) > 1) {
    codebook_variables <- data.frame(unlist(stringr::str_split(codebook_variables[,1],
                                           "\\s\\s+")))
#    codebook_variables <- codebook_variables[codebook_variables != ""]
  }
  names(codebook_variables) <- "column_number"
  codebook_variables[,1] <- gsub("\'", "\"", codebook_variables[,1])

  codebook_variables$column_name <- gsub(".*\"(.*)\"", "\\1",
                                         codebook_variables$column_number)
  codebook_variables$column_number <- gsub("(.*) \".*", "\\1",
                                           codebook_variables$column_number)
  # codebook_variables$column_number <-
  #   stringr::str_trim(codebook_variables$column_number)
  #
  #
  #   codebook_variables$column_name <-
  #     gsub("[[:punct:]]", " ",
  #                                          codebook_variables$column_number)
  #   codebook_variables$column_name <- gsub("\\s\\s+", " ",
  #                                          codebook_variables$column_name)
    codebook_variables$column_name <-
          stringr::str_trim(codebook_variables$column_name)
    codebook_variables$column_name <- gsub(" ", "_",
                                           codebook_variables$column_name)




  codebook_column_spaces <- data.frame(codebook[,1][grep("DATA LIST FILE",
                          ignore.case = TRUE, codebook[,1]):
                       grep("^variable labels$",
                            ignore.case = TRUE, codebook[,1])],
                       stringsAsFactors = FALSE)
  codebook_column_spaces <- codebook_column_spaces[-grep("VARIABLE LABELS",
                               codebook_column_spaces,
                               ignore.case = TRUE)]

  if (!all(grepl("[::alphanum::]\\s[::alphanum::]",
             codebook_column_spaces[,1]))) {
  qdap_value <- paste0(codebook_variables[,1],
                       "\\s+")
  qdap_replace <- paste0(codebook_variables[,1], " ")
  codebook_column_spaces[,1] <- qdap::mgsub(qdap_value,
                                            qdap_replace,
                                codebook_column_spaces[,1],
                                trim = FALSE,
                                fixed = FALSE)
  }


  codebook_column_spaces[,1] <- gsub("\\s*\\([^\\)]+\\)","  ",
                                     codebook_column_spaces[,1])

    codebook_column_spaces <- unlist(
      stringr::str_split(codebook_column_spaces[,1],
                                               "\\s\\s+"))
  codebook_column_spaces <- data.frame(codebook_column_spaces,
                                       stringsAsFactors = FALSE)
  codebook_column_spaces[,1] <- gsub("\\(.*", "", codebook_column_spaces[,1])
  codebook_column_spaces[,1] <- stringr::str_trim(codebook_column_spaces[,1])
  for (i in 1:nrow(codebook_column_spaces)) {
    if (grepl("-", codebook_column_spaces[,1][i]) == FALSE) {
      codebook_column_spaces[,1][i] <- gsub("(.* )(.*$)", "\\1\\2-\\2",
                                            codebook_column_spaces[,1][i])
    }
  }
  codebook_column_spaces$first_num <- gsub(".* (.*)-.*", "\\1",
                                           codebook_column_spaces[,1])
  codebook_column_spaces$second_num <- gsub(".* .*-(.*)", "\\1",
                                            codebook_column_spaces[,1])
  codebook_column_spaces[,1] <- gsub(" .*", "", codebook_column_spaces[,1])
  names(codebook_column_spaces)[1] <- "column_number"
  codebook_column_spaces[,2:3] <- apply(codebook_column_spaces[2:3], 2,
                                        as.numeric)
  codebook_column_spaces <- codebook_column_spaces[
            !is.na(codebook_column_spaces$first_num) &
              codebook_column_spaces$column_number != "*",]

  codebook_column_spaces <-
    suppressMessages(dplyr::inner_join(codebook_column_spaces,
                                              codebook_variables))

  x = mapply(seq, codebook_column_spaces$first_num,
             codebook_column_spaces$second_num)
  codebook_column_spaces$length <- lapply(x, length)
  codebook_column_spaces$length <- as.numeric(codebook_column_spaces$length)

  system.time(z <- readr::read_fwf("1990_offenses.txt",
                       readr::fwf_widths(codebook_column_spaces$length,
                       codebook_column_spaces$column_number)))


  value_labels <- codebook[grep("^value labels$",
                                codebook[,1],
                                ignore.case = TRUE):end_row,]
  value_labels <- data.frame(value_labels, stringsAsFactors = FALSE)
  value_labels <- data.frame(unlist(strsplit(value_labels[,1], "\\s\\s\\s+")),
                             stringsAsFactors = FALSE)

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
  value_labels$first_num <- NULL
  value_labels$second_num <- NULL
  value_labels$column_name <- NULL

  value_labels <- suppressWarnings(reshape(value_labels,
                                           timevar = "column_number",
                          idvar = "value", direction = "wide"))
  names(value_labels) <- gsub("Replace.", "",
                              ignore.case = TRUE, names(value_labels))


  system.time(fix_value_labels(clean_text_file, value_labels))

  #
#   start <- proc.time()
#   for (i in 2:ncol(value_labels)) {
#     temp <- value_labels[, c(1, i)]
#     temp <- temp[!is.na(temp[,2]),]
#     temp_name <- names(temp)[2]
#     temp_name <- paste0("^", temp_name, "$")
#
#     if (nrow(temp) >= 1 & nrow(temp) < 1000) {
#       if (number_test(temp$value)) {
#         temp$value <- as.numeric(temp$value)
#       }
#       temp$value <- paste0("^", temp$value, "$")
#       clean_text_file[, grep(temp_name,
#                              names(clean_text_file))] <-
#         try(stringr::str_trim(clean_text_file[, grep(temp_name,
#          names(clean_text_file))]), silent = TRUE)
#
#       clean_text_file[, grep(temp_name,
#                              names(clean_text_file))] <-
#         qdap::mgsub(temp[,1], temp[,2],
#                     clean_text_file[, grep(temp_name,
#                                            names(clean_text_file))],
#                     order.pattern = TRUE,
#                     trim = TRUE,
#                     fixed = FALSE,
#                     perl = TRUE)
#     }
#   }
#   end <- proc.time()
#   end - start

  # Fixes column names to real names
  for (n in 1:nrow(codebook_variables)) {
    names(clean_text_file)[which(names(clean_text_file) ==
                             codebook_variables$column_number[n])] <-
      codebook_variables$column_name[n]
  }


  # # Fix missing values
  # if (any(grepl("^\\*.* MISSING VALUES$", codebook[,1]))) {
  #   missing_rows <- data.frame(codebook[grep("^\\*.* MISSING VALUES$",
  #                               codebook[,1])[1]:
  #                               nrow(codebook),],
  #                           stringsAsFactors = FALSE)
  # }

  return(clean_text_file)
}


number_test <- function(column) {
  return(all(!is.na(suppressWarnings(as.numeric(column[!is.na(column)])))))
}



library(data.table)
clean_text_file <- data.table(clean_text_file)
for (i in 1:length(value_list)) {
  clean_text_file <- value_list[[i]][clean_text_file, on = names(value_list[[i]])[1]]
  zzz <- clean_text_file[,names(value_list[[i]])[2],
                         with = FALSE]
  clean_text_file[, names(value_list[[i]])[1] := zzz]
}

value_list <- lapply(ls(pattern = "^x[0-9]*"), get)

for (i in 2:ncol(value_labels)) {
  dataset <- data.frame(value_labels[, c(1, i)])
  dataset <- dataset[!is.na(dataset[,2]),]
  names(dataset)[1] <- names(dataset)[2]
  names(dataset)[2] <- paste0(names(dataset)[2], "_to_replace")
  dataset <- data.table(dataset)
  assign(paste0("x", i), dataset)
}




apply(clean_text_file[, names(value_labels[2:ncol(value_labels)])], 2,
      function(x) ifelse(x == value_labels$value, value_labels[,names(x)], x))

system.time(clean_text_file$V6 <- apply(temp, 1, function(x) ifelse(clean_text_file$V6 == x[1], x[2], clean_text_file$V6)))


fix_value_labels <- function(clean_text_file, value_labels) {

  for (i in 2:ncol(value_labels)) {
    temp <- value_labels[, c(1, i)]
    temp <- temp[!is.na(temp[,2]),]
    names(temp)[1] <- names(temp)[2]
    names(temp)[2] <- paste0("to_replace_12345")

    if (number_test(temp[,1])) {
      temp[,1] <- as.numeric(temp[,1])
    }

    clean_text_file[, names(temp)[1]] <- stringr::str_trim(
      clean_text_file[, names(temp)[1]]
    )

    clean_text_file[, names(temp)[1]][
      clean_text_file[, names(temp)[1]] == ""] <- NA

    if (number_test(clean_text_file[, names(temp)[1]])) {
      clean_text_file[, names(temp)[1]] <- as.numeric(
        clean_text_file[, names(temp)[1]])
    }

    system.time(clean_text_file <- dplyr::left_join(clean_text_file, temp))
    system.time(temp[clean_text_file])
    clean_text_file[, names(temp)[1]] <- ifelse(!is.na(clean_text_file[, "to_replace_12345"]),
                                                       clean_text_file$to_replace_12345,
                                                       clean_text_file[, names(temp)[1]])
    clean_text_file$to_replace_12345 <- NULL
  }
  return(clean_text_file)
}
