#' Read ASCII file using SPSS Setup file
#'
#' @param dataset_name
#' Name of the ASCII file with the data
#' @param sps_name
#' Name of the SPSS Setup file - should be a .sps or .txt (zipped text files also work) file.
#' @param value_label_fix
#' If TRUE, fixes value labels of the data. e.g. If a column is "sex" and has
#' values of 0 or 1, and the setup file says 0 = male and 1 = female, it will
#' make that change. The reader is much faster is this parameter is FALSE.
#' @param real_names
#' If TRUE fixes column names from default column name in the SPSS setup file
#' (e.g. V1, V2) to the name is says the column is calle (e.g. age, sex, etc.)
#' @param keep_columns
#' Specify which columns from the dataset you want. If NULL, will return all columns.
#' Accepts the column number (e.g. 1:5), column name (e.g. V1, V2, etc.) or
#' column label (e.g. VICTIM_NAME, CITY, etc.)
#' @return
#' Data.frame of the data from the ASCII file
#' @export
#'
#' @examples
#' # Text file is zipped to save space.
#' dataset_name <- system.file("extdata", "example_data.zip",
#'  package = "asciiSetupReader")
#' sps_name <- system.file("extdata", "example_setup.sps",
#' package = "asciiSetupReader")
#'
#' \dontrun{
#' example <- spss_ascii_reader(dataset_name = dataset_name,
#' sps_name = sps_name)
#' }
#'
#' # Does not fix value labels
#' example2 <- spss_ascii_reader(dataset_name = dataset_name,
#' sps_name = sps_name, value_label_fix = FALSE)
#'
#' # Keeps original column names
#' example3 <- spss_ascii_reader(dataset_name = dataset_name,
#' sps_name = sps_name, real_names = FALSE)
#'
#' # Only returns the first 5 columns
#' example4 <- spss_ascii_reader(dataset_name = dataset_name,
#' sps_name = sps_name, keep_columns = 1:5)
spss_ascii_reader <- function(dataset_name,
                              sps_name,
                              value_label_fix = TRUE,
                              real_names = TRUE,
                              keep_columns = NULL) {

  codebook <- readr::read_lines(sps_name)
  codebook <- trimws(codebook)
  codebook <- codebook[grep("^DATA LIST",
                            codebook, ignore.case = TRUE)[length(grep("^DATA LIST",
                                                  codebook, ignore.case = TRUE))]:length(codebook)]
  codebook <- data.frame(codebook, stringsAsFactors = FALSE)

  # Get the column names
  codebook_variables <- codebook[grep("^variable labels$",
                                      ignore.case = TRUE, codebook[,1]):
                                   grep("^value labels$",
                                        ignore.case = TRUE, codebook[,1]),]
  codebook_variables <- gsub("\\'\\'", "\\'", codebook_variables)
  codebook_variables <- gsub("( \\'[[:alnum:]])\\'([[:alnum:]])", "\\1\\2", codebook_variables)
  temp <- any(stringr::str_count(codebook_variables, '\\"') > 2 |
                stringr::str_count(codebook_variables, "\\'") > 2)
    if (!is.na(temp) && temp == TRUE) {
    codebook_variables <- data.frame(column_number =
                                       unlist(strsplit(codebook_variables,
                                                       "\\s{2,}")), stringsAsFactors = FALSE)
  } else {
    codebook_variables <- gsub("\\s{2,}", " ", codebook_variables)
    codebook_variables <- data.frame(column_number =
                                       unlist(strsplit(codebook_variables,
                                                       "\\s{2,}")), stringsAsFactors = FALSE)
  }

  codebook_variables[,1] <- gsub("\'", "\"", codebook_variables[,1])

  codebook_variables$column_name <- gsub(".*\"(.*)\"", "\\1",
                                         codebook_variables$column_number)
  codebook_variables$column_number <- gsub("(.*) \".*", "\\1",
                                           codebook_variables$column_number)
  codebook_variables$column_name <- gsub(" |:|-", "_",
                                         codebook_variables$column_name)
  codebook_variables$column_name <- gsub("_+", "_",
                                         codebook_variables$column_name)
  codebook_variables$column_name <- gsub("_/$", "",
                                         codebook_variables$column_name)

  codebook_column_spaces <- data.frame(codebook[,1][grep("DATA LIST",
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

  names(codebook_column_spaces)[1] <- "column_number"
  codebook_column_spaces$first_num <- gsub(".* ", "", codebook_column_spaces$column_number)
  codebook_column_spaces$second_num <- gsub(".*-", "", codebook_column_spaces$first_num)
  codebook_column_spaces$first_num <- gsub("-.*", "", codebook_column_spaces$first_num)
  codebook_column_spaces$column_number <- gsub(" .*", "", codebook_column_spaces$column_number)
  codebook_column_spaces <- codebook_column_spaces[codebook_column_spaces$column_number %in%
                                                     codebook_variables$column_number,]
  codebook_column_spaces$first_num <- suppressWarnings(as.numeric(codebook_column_spaces$first_num))
  codebook_column_spaces$second_num <- suppressWarnings(as.numeric(codebook_column_spaces$second_num))
  codebook_column_spaces <- codebook_column_spaces[!is.na(codebook_column_spaces$first_num),]

  codebook_column_spaces <- merge(codebook_column_spaces, codebook_variables,
                                  all.x = TRUE)
  codebook_column_spaces <- codebook_column_spaces[
    order(codebook_column_spaces$first_num),]


  value_labels <- get_value_labels(codebook, codebook_column_spaces)

  if (!is.null(keep_columns)) {
    if (is.numeric(keep_columns)) {
      codebook_column_spaces <- codebook_column_spaces[keep_columns,]
    } else if (all(keep_columns %in% codebook_column_spaces$column_number)) {
      codebook_column_spaces <- codebook_column_spaces[
        codebook_column_spaces$column_number %in% keep_columns,]
    } else if (all(keep_columns %in% codebook_column_spaces$column_name)) {
      codebook_column_spaces <- codebook_column_spaces[
        codebook_column_spaces$column_name %in% keep_columns,]
    } else {
      stop("Not all column names in 'keep_columns' are in data. Please check spelling")
    }
  }

  # Removes columns not asked for
  value_labels <- value_labels[value_labels$column %in% codebook_column_spaces$column_number,]

  value_labels <- split.data.frame(value_labels, value_labels$group)


  dataset <- suppressMessages(readr::read_fwf(dataset_name,
                                              readr::fwf_positions(codebook_column_spaces$first_num,
                                                                   codebook_column_spaces$second_num,
                                                                   codebook_column_spaces$column_number), col_types = paste0(rep("c", nrow(codebook_column_spaces)), collapse = "")))
  dataset <- data.table::data.table(dataset)
  column_order <- colnames(dataset)


  if (value_label_fix) {
    for (i in 1:length(value_labels)) {
      column <- as.character(value_labels[[i]][1, 1])
      if (column %in% codebook_column_spaces$column_number) {
       value_label_section <- value_label_matrixer(value_labels[[i]])
       dataset <- fix_variable_values(dataset, value_label_section, column)
      }
    }
    data.table::setcolorder(dataset, column_order)
  }



  if (real_names) {
    # Fixes column names to real names
    for (n in 1:nrow(codebook_variables)) {
      names(dataset)[which(names(dataset) ==
                             codebook_variables$column_number[n])] <-
        codebook_variables$column_name[n]
    }
  }

  # Make numeric columns numeric
  all_numeric <- function(column) {
    column_NAs <- sum(is.na(column))
    column <- suppressWarnings(as.numeric(column))
    return(all(is.numeric(column) & sum(is.na(column)) == column_NAs))
  }
  times <- nrow(dataset) * .10
  if (times < 100000 & nrow(dataset) > 100000) { times <- 100000 }
  times <- sample(1:nrow(dataset), times, replace = FALSE)
  for (i in 1:ncol(dataset)) {
    if (all((!is.factor(dataset[[i]]) & all_numeric(dataset[[i]][times])))) {
      suppressWarnings(data.table::set(dataset, j = i, value = as.numeric(dataset[[i]])))
    }
  }

  dataset <- as.data.frame(dataset)
  return(dataset)
}

