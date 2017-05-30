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
spss_reader <- function(dataset_name, spss_name) {
  codebook <- suppressMessages(readr::read_lines(spss_name))
  codebook <- trimws(codebook)
  codebook <- codebook[grep("^DATA LIST",
                                codebook)[length(grep("^DATA LIST",
                                codebook))]:length(codebook)]
  codebook <- data.frame(codebook, stringsAsFactors = FALSE)

  # Get the column names
  codebook_variables <- codebook[grep("^variable labels$",
                                          ignore.case = TRUE, codebook[,1]):
                                       grep("^value labels$",
                                            ignore.case = TRUE, codebook[,1]),]
  codebook_variables <- gsub("\\s{2,}", " ", codebook_variables)
  codebook_variables <- data.frame(column_number =
                                     unlist(strsplit(codebook_variables,
                                     "\\s{2,}")), stringsAsFactors = FALSE)
  codebook_variables[,1] <- gsub("\'", "\"", codebook_variables[,1])

  codebook_variables$column_name <- gsub(".*\"(.*)\"", "\\1",
                                         codebook_variables$column_number)
  codebook_variables$column_number <- gsub("(.*) \".*", "\\1",
                                           codebook_variables$column_number)
  codebook_variables$column_name <- gsub(" ", "_",
                                           codebook_variables$column_name)
  codebook_variables$column_name <- gsub("_/$", "",
                                         codebook_variables$column_name)




  codebook_column_spaces <- data.frame(codebook[,1][grep("DATA LIST FILE",
                          ignore.case = TRUE, codebook[,1]):
                       grep("^variable labels$",
                            ignore.case = TRUE, codebook[,1])],
                       stringsAsFactors = FALSE)


  codebook_column_spaces[,1] <- gsub("([[:alpha:]]+[0-9]*)\\s+", "\\1 ",
                                     codebook_column_spaces[,1])

    codebook_column_spaces <- unlist(
      strsplit(codebook_column_spaces[,1], "\\s{2,}"))
  codebook_column_spaces <- data.frame(codebook_column_spaces,
                                       stringsAsFactors = FALSE)
  codebook_column_spaces[,1] <- gsub("\\(.*", "", codebook_column_spaces[,1])
  codebook_column_spaces[,1] <- stringr::str_trim(codebook_column_spaces[,1])

  # Splits column name and spaces
  splitted <- data.table::tstrsplit(codebook_column_spaces[,1], " ")
  codebook_column_spaces[,2] <- splitted[[2]]
  codebook_column_spaces[,1] <- splitted[[1]]

  splitted2 <- data.table::tstrsplit(codebook_column_spaces[,2], "-")
  codebook_column_spaces[,3] <- splitted2[[2]]
  codebook_column_spaces[,2] <- splitted2[[1]]
  codebook_column_spaces[,3] <- ifelse(is.na(codebook_column_spaces[,3]),
                                       codebook_column_spaces[,2],
         codebook_column_spaces[,3])


  names(codebook_column_spaces) <- c("column_number", "first_num", "second_num")
  codebook_column_spaces[,2:3] <- suppressWarnings(
                                   apply(codebook_column_spaces[2:3], 2,
                                        as.numeric))
  codebook_column_spaces <- codebook_column_spaces[
            !is.na(codebook_column_spaces[,2]),]

  x = mapply(seq, codebook_column_spaces$first_num,
             codebook_column_spaces$second_num)
  codebook_column_spaces$length <- lapply(x, length)
  codebook_column_spaces$length <- as.numeric(codebook_column_spaces$length)

  dataset <- readr::read_fwf(dataset_name,
                       readr::fwf_widths(codebook_column_spaces$length,
                       codebook_column_spaces$column_number))
  dataset <- data.table::data.table(dataset)
  column_order <- colnames(dataset)


  value_start <- grep("^value labels$",
                      codebook[,1], ignore.case = TRUE)

  end_row = grep("\\*|^\\.$", codebook[,1])
  end_row <- end_row[end_row > value_start][1] - 1
  if (is.na(end_row)) { end_row <- nrow(codebook) }
  value_labels <- codebook[value_start:end_row,]
  value_labels <- unlist(strsplit(value_labels, "\\s{2,}"))
  value_labels <- value_labels[!value_labels %in% c(".", "/")]


  value_labels <- names_semicolon(value_labels, codebook_column_spaces)

  all_column_names <- paste(codebook_column_spaces$column_number,
                            collapse = "|")

  matching_rows <- grep(all_column_names, value_labels)
  # if (length(matching_rows) %% 2 != 0) {
  # matching_rows <- c(matching_rows, length(value_labels))
  # }

  listing <- vector("list", length(matching_rows))
  count <- 1
  for (i in seq(1, length(matching_rows), 1)) {
    if (i < length(matching_rows)) {
      value_label_section <-
        value_labels[matching_rows[i]:(matching_rows[(i + 1)]-1)]
    } else {
      value_label_section <- value_labels[matching_rows[i]:length(value_labels)]
    }
    variable_fix <-  value_label_matrixer(value_label_section)
    listing[[count]] <- variable_fix
    dataset <- fix_variable_values(dataset, variable_fix)
    count <- count + 1

  }
  data.table::setcolorder(dataset, column_order)


  # Fixes column names to real names
  for (n in 1:nrow(codebook_variables)) {
    names(dataset)[which(names(dataset) ==
                             codebook_variables$column_number[n])] <-
      codebook_variables$column_name[n]
  }


  return(dataset)
}
