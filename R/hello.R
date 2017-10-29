#' Read ASCII file using SPSS Setup file
#'
#' @param dataset_name
#' Name of the ASCII file with the data
#' @param sps_name
#' Name of the SPSS Setup file - should be a .sps or .txt file.
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
#'
#' dataset_name <- system.file("extdata", "example_data.txt",
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
#' example <- spss_ascii_reader(dataset_name = dataset_name,
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
  codebook_variables$column_name <- gsub(" ", "_",
                                         codebook_variables$column_name)
  codebook_variables$column_name <- gsub("_/$", "",
                                         codebook_variables$column_name)
  # codebook_variables <- codebook_variables[codebook_variables$column_number !=
  #                                            codebook_variables$column_name,]




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
  codebook_column_spaces2 <- codebook_column_spaces

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

  dataset <- suppressMessages(readr::read_fwf(dataset_name,
                                              readr::fwf_positions(codebook_column_spaces$first_num,
                                                                   codebook_column_spaces$second_num,
                                                                   codebook_column_spaces$column_number)))
  dataset <- data.table::data.table(dataset)
  column_order <- colnames(dataset)


  value_start <- grep("^value labels$",
                      codebook[,1], ignore.case = TRUE)

  end_row <- grep("^\\.$", codebook[,1])
  end_row <- end_row[end_row > value_start][1] - 1
  if (is.na(end_row)) { end_row <- nrow(codebook) }
  value_labels <- codebook[value_start:end_row,]
  value_labels <- trimws(value_labels)
  value_labels <- gsub('\\s+\\"$', '"', value_labels)
  value_labels <- gsub('\\"\\s+([[:alnum:]])', '\\"\\1', value_labels, ignore.case = TRUE)
  value_labels <- gsub("\\s+\\(", " \\(", value_labels)
  value_labels <- gsub("&\\s+", "& ", value_labels)
  value_labels <- unlist(strsplit(value_labels, "\\s{2,}"))
  value_labels <- value_labels[!value_labels %in% c(".", "/")]


  if (value_label_fix) {
    all_column_names <- paste0(codebook_column_spaces2$column_number, "$",
                              collapse = "|")

    matching_rows <- grep(all_column_names, value_labels)

    for (i in seq(1, length(matching_rows), 1)) {
      if (i < length(matching_rows)) {
        value_label_section <-
          value_labels[matching_rows[i]:(matching_rows[(i + 1)] - 1)]
      } else {
        value_label_section <- value_labels[matching_rows[i]:length(value_labels)]
      }
      variable_fix <-  value_label_matrixer(value_label_section)
      names(variable_fix) <- gsub("/", "", names(variable_fix))

      if (names(variable_fix)[1] %in% codebook_column_spaces$column_number
          && nrow(variable_fix) < nrow(dataset)/2) {
        dataset <- fix_variable_values(dataset, variable_fix)
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

  return(dataset)
}

