#' Read ASCII file using SPSS Setup file.
#'
#' spss_ascii_reader() and sas_ascii_reader() are used when you need to
#' read an fixed-width ASCII (text) file that comes with a setup file.
#' The setup file provides instructions on how to create and name the columns,
#' and fix the key-value pairs (sometimes called value labels). This is common
#' in government data, particular data produced before 2010.
#'
#' @family ASCII Reader functions
#' @seealso \code{\link{sas_ascii_reader}} For using an SAS setup file
#'
#' @param dataset_name Name of the ASCII (.txt) file that contains the data.
#'   This file may be zipped with a file extention of .zip.
#' @param sps_name Name of the SPSS Setup file - should be a .sps or .txt
#'   (zipped text files also work) file.
#' @param value_label_fix If TRUE, fixes value labels of the data. e.g. If a
#'   column is "sex" and has values of 0 or 1, and the setup file says 0 = male
#'   and 1 = female, it will make that change. The reader is much faster is this
#'    parameter is FALSE.
#' @param real_names If TRUE fixes column names from default column name in the
#'   SPSS setup file (e.g. V1, V2) to the name is says the column is called
#'   (e.g. age, sex, etc.).
#' @param keep_columns Specify which columns from the dataset you want. If
#'   NULL, will return all columns. Accepts the column number (e.g. 1:5),
#'   column name (e.g. V1, V2, etc.) or column label (e.g. VICTIM_NAME, CITY,
#'   etc.).
#' @return Data.frame of the data from the ASCII file
#' @export
#' @examples
#' # Text file is zipped to save space.
#' dataset_name <- system.file("extdata", "example_data.zip",
#'   package = "asciiSetupReader")
#' sps_name <- system.file("extdata", "example_setup.sps",
#'   package = "asciiSetupReader")
#'
#' \dontrun{
#' example <- spss_ascii_reader(dataset_name = dataset_name,
#'   sps_name = sps_name)
#' }
#'
#' # Does not fix value labels
#' example2 <- spss_ascii_reader(dataset_name = dataset_name,
#'   sps_name = sps_name, value_label_fix = FALSE)
#'
#' # Keeps original column names
#' example3 <- spss_ascii_reader(dataset_name = dataset_name,
#'   sps_name = sps_name, real_names = FALSE)
#'
#' # Only returns the first 5 columns
#' example4 <- spss_ascii_reader(dataset_name = dataset_name,
#'   sps_name = sps_name, keep_columns = 1:5)
spss_ascii_reader <- function(dataset_name,
                              sps_name,
                              value_label_fix = TRUE,
                              real_names = TRUE,
                              keep_columns = NULL) {

  stopifnot(is.character(dataset_name), length(dataset_name) == 1,
            is.character(sps_name), length(sps_name) == 1,
            is.logical(value_label_fix), length(value_label_fix) == 1,
            is.logical(real_names), length(real_names) == 1)

  codebook <- readr::read_lines(sps_name)
  codebook <- stringr::str_trim(codebook)
  codebook <- codebook[grep("^DATA LIST",
                            codebook, ignore.case = TRUE)[length(grep("^DATA LIST",
                                                  codebook, ignore.case = TRUE))]:length(codebook)]
  codebook <- data.frame(codebook, stringsAsFactors = FALSE)

  # Get the column names
  codebook_variables <- codebook[grep("^variable labels$",
                                      ignore.case = TRUE, codebook[,1]):
                                   grep("^value labels$|missing values",
                                        ignore.case = TRUE, codebook[,1])[1],]
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
  codebook_variables$column_name <- fix_names(codebook_variables$column_name)


  column_spaces <- data.frame(codebook[,1][grep("DATA LIST",
                                                         ignore.case = TRUE, codebook[,1]):
                                                      grep("^variable labels$",
                                                           ignore.case = TRUE, codebook[,1])],
                                       stringsAsFactors = FALSE)


  column_spaces[,1] <- gsub("([[:alpha:]]+[0-9]*)\\s+", "\\1 ",
                                     column_spaces[,1])

  column_spaces <- unlist(
    strsplit(column_spaces[,1], "\\s{2,}"))
  column_spaces <- data.frame(column_spaces,
                                       stringsAsFactors = FALSE)
  column_spaces[,1] <- gsub("\\(.*", "", column_spaces[,1])
  column_spaces[,1] <- stringr::str_trim(column_spaces[,1])

  names(column_spaces)[1] <- "column_number"
  column_spaces$first_num <- gsub(".* ", "", column_spaces$column_number)
  column_spaces$second_num <- gsub(".*-", "", column_spaces$first_num)
  column_spaces$first_num <- gsub("-.*", "", column_spaces$first_num)
  column_spaces$column_number <- gsub(" .*", "", column_spaces$column_number)
  column_spaces <- column_spaces[column_spaces$column_number %in%
                                                     codebook_variables$column_number,]
  column_spaces$first_num <- suppressWarnings(as.numeric(column_spaces$first_num))
  column_spaces$second_num <- suppressWarnings(as.numeric(column_spaces$second_num))
  column_spaces <- column_spaces[!is.na(column_spaces$first_num),]

  column_spaces <- merge(column_spaces, codebook_variables,
                                  all.x = TRUE)
  column_spaces <- column_spaces[
    order(column_spaces$first_num),]

  if (!is.null(keep_columns)) {
    if (is.numeric(keep_columns)) {
      column_spaces <- column_spaces[keep_columns,]
    } else if (all(keep_columns %in% column_spaces$column_number)) {
      column_spaces <- column_spaces[
        column_spaces$column_number %in% keep_columns,]
    } else if (all(keep_columns %in% column_spaces$column_name)) {
      column_spaces <- column_spaces[
        column_spaces$column_name %in% keep_columns,]
    } else {
      stop("Not all column names in 'keep_columns' are in data. Please check spelling")
    }
  }



  dataset <- suppressMessages(readr::read_fwf(dataset_name,
                                              readr::fwf_positions(column_spaces$first_num,
                                                                   column_spaces$second_num,
                                                                   column_spaces$column_number), col_types = paste0(rep("c", nrow(column_spaces)), collapse = "")))
  dataset <- data.table::data.table(dataset)
  column_order <- colnames(dataset)


# Value Labels ------------------------------------------------------------
    # Removes columns not asked for
  value_labels <- get_value_labels(codebook, column_spaces)
  if (!is.null(value_labels)) {
    value_labels <- value_labels[value_labels$column %in% column_spaces$column_number,]
    value_labels <- split.data.frame(value_labels, value_labels$group)
  }

  if (value_label_fix & length(value_labels) > 0) {
    for (i in 1:length(value_labels)) {
      column <- as.character(value_labels[[i]][1, 1])
      if (column %in% column_spaces$column_number) {
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


  # Makes columns that should be numeric numeric
  dataset <- make_cols_numeric(dataset)

  dataset <- as.data.frame(dataset)
  return(dataset)
}

