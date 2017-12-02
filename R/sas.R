#' Read ASCII file using SAS Setup file.
#'
#' sas_ascii_reader() and spss_ascii_reader() are used when you need to
#' read an fixed-width ASCII (text) file that comes with a setup file.
#' The setup file provides instructions on how to create and name the columns,
#' and fix the key-value pairs (sometimes called value labels). This is common
#' in government data, particular data produced before 2010.
#'
#' @family ASCII Reader functions
#' @seealso \code{\link{spss_ascii_reader}} For using an SPSS setup file
#'
#' @param sas_name Name of the SAS Setup file - should be a .sps or .txt file.
#' @inheritParams spss_ascii_reader
#' @export
#' @examples
#' # Text file is zipped to save space.
#' dataset_name <- system.file("extdata", "example_data.zip",
#'   package = "asciiSetupReader")
#' sas_name <- system.file("extdata", "example_setup.sas",
#'   package = "asciiSetupReader")
#'
#' \dontrun{
#' example <- sas_ascii_reader(dataset_name = dataset_name,
#'   sas_name = sas_name)
#' }
#'
#' # Does not fix value labels
#' example2 <- sas_ascii_reader(dataset_name = dataset_name,
#'   sas_name = sas_name, value_label_fix = FALSE)
#'
#' # Keeps original column names
#' example3 <- sas_ascii_reader(dataset_name = dataset_name,
#'   sas_name = sas_name, real_names = FALSE)
#'
#' # Only returns the first 5 columns
#' example <- sas_ascii_reader(dataset_name = dataset_name,
#'   sas_name = sas_name, keep_columns = 1:5)
sas_ascii_reader <- function(dataset_name,
                             sas_name,
                             value_label_fix = TRUE,
                             real_names = TRUE,
                             keep_columns = NULL) {

  # SAS setup
  sas <- readr::read_lines(sas_name)
  sas <- stringr::str_trim(sas)


  # Get format - column names and column names with f ====================
  format <- sas[grep("^FORMAT$", sas, ignore.case = TRUE) : length(sas)]
  format <- format[-1]
  format <- unlist(strsplit(format, "\\."))
  format <- stringr::str_trim(format)
  format <- data.frame(format)
  format$real_name <- gsub(" .*", "", format$format)
  format$f_name <- gsub(".* ", "", format$format)

  # Get column name - both undescriptive and descriptive =====================
  column_name <- sas[grep("^LABEL$", sas): grep("^$", sas)[grep("^$", sas) >
                                                             grep("^LABEL$", sas)][1]]
  column_name <- column_name[grep("=", column_name)]
  column_name <- gsub("(\\w)=","\\1 =", column_name)
  column_name <- data.frame(column_name)
  column_name$real_name <- fix_names(column_name$column_name)
  column_name$original_name <- gsub(" .*", "", column_name$column_name)



  # Get column spacing ==================================================
  column_spaces <- sas[grep("INPUT STATEMENTS", sas) : grep("^$", sas)[grep("^$", sas) >
                                        grep("INPUT STATEMENTS", sas) + 5][1]]
  column_spaces <- unlist(strsplit(x = column_spaces, split = "\\s{2,}"))
  column_spaces <- gsub("\\$|\\;", "", column_spaces)
  column_spaces <- stringr::str_trim(column_spaces)
  column_spaces <- column_spaces[grep("[0-9]$", column_spaces)]
  column_spaces <- gsub(" \\.[0-9]*", "", column_spaces)
  column_spaces <- data.frame(column_spaces, stringsAsFactors = FALSE)
  names(column_spaces)[1] <- "column_number"

  column_spaces$first_num <- gsub(".* ", "", column_spaces$column_number)
  column_spaces$second_num <- gsub(".*-", "", column_spaces$first_num)
  column_spaces$first_num <- gsub("-.*", "", column_spaces$first_num)

  column_spaces$column_number <- gsub(" .*", "", column_spaces$column_number)
  column_spaces <- column_spaces[column_spaces$column_number %in%
                                   column_name$original_name,]
  column_spaces <- merge(column_spaces, column_name, by.x = "column_number",
                         by.y = "original_name", all.x = TRUE)
  column_spaces$first_num <- as.numeric(column_spaces$first_num)
  column_spaces$second_num <- as.numeric(column_spaces$second_num)
  column_spaces <- column_spaces[order(column_spaces$first_num),]

  if (!is.null(keep_columns)) {
    if (is.numeric(keep_columns)) {
      column_spaces <- column_spaces[keep_columns,]
    } else if (all(keep_columns %in% column_spaces$column_number)) {
      column_spaces <- column_spaces[
        column_spaces$column_number %in% keep_columns,]
    } else if (all(keep_columns %in% column_spaces$real_name)) {
      column_spaces <- column_spaces[
        column_spaces$real_name %in% keep_columns,]
    } else {
      stop("Not all column names in 'keep_columns' are in data. Please check spelling")
    }
  }
  column_spaces <- merge(column_spaces, format, by.x = "column_number",
                         by.y = "real_name", all.x = TRUE)
  column_spaces <- column_spaces[order(column_spaces$first_num),]



  dataset <- suppressMessages(readr::read_fwf(dataset_name,
                                              readr::fwf_positions(column_spaces$first_num,
                                                                   column_spaces$second_num,
                                                                   column_spaces$column_number), col_types = paste0(rep("c", nrow(column_spaces)), collapse = "")))
  dataset <- data.table::data.table(dataset)
  column_order <- colnames(dataset)

  # Gets value labels
  value_position <- grep("^VALUE ", sas)
  value_labels <- sas[value_position[1] : grep("\\*/$", sas)[grep("\\*/$", sas) >
                                                            value_position[length(value_position)]][1]]
  value_labels <- gsub(";\\*\\/", "", value_labels)
  value_labels <- unlist(strsplit(value_labels, ";"))
  value_labels <- gsub("(^VALUE.* )\\(.*\\)", "\\1", value_labels)
  value_labels <- gsub("^VALUE ", "", value_labels)
  value_labels <- stringr::str_trim(value_labels)
  value_labels <- gsub("&\\s+", "& ", value_labels)
  value_labels <- unlist(strsplit(value_labels, "\\s{2,}"))


  value_labels <- data.frame(value_labels, stringsAsFactors = FALSE)
  value_labels$group <- 0

  group <- 1
  column <- value_labels$value_labels[1]
  for (i in 1:nrow(value_labels)) {
    value_labels$group[i] <- group
    value_labels$column[i] <- column
    if (value_labels$value_labels[i + 1] %in% format$f_name) {
      group <- group + 1
      column <- value_labels$value_labels[i + 1]
    }
  }
  value_labels <- value_labels[value_labels$column %in% column_spaces$f_name,]
  value_labels <- split.data.frame(value_labels, value_labels$group)


  if (value_label_fix) {
    for (i in 1:length(value_labels)) {
      column <- as.character(value_labels[[i]][1, 1])
      if (toupper(column) %in% toupper(column_spaces$f_name)) {
        column <- column_spaces$column_number[toupper(column_spaces$f_name) %in% toupper(column)]
        value_label_section <-  value_label_matrixer(value_labels[[i]])
        if (length(column) > 1) {
          for (col in column) {
            dataset <- fix_variable_values(dataset, value_label_section, col)
          }
        } else {
          dataset <- fix_variable_values(dataset, value_label_section, column)
        }
      }
    }
      data.table::setcolorder(dataset, column_order)
    }

  column_name$column_name <- gsub("_/$", "",
                                  column_name$real_name)
  if (real_names) {
    # Fixes column names to real names
    for (n in 1:nrow(column_name)) {
      names(dataset)[which(names(dataset) ==
                             column_name$original_name[n])] <-
        column_name$real_name[n]
    }
  }

  # Makes columns that should be numeric numeric
  dataset <- make_cols_numeric(dataset)

  dataset <- as.data.frame(dataset)
  return(dataset)
}
