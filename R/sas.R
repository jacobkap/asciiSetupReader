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

  stopifnot(is.character(dataset_name), length(dataset_name) == 1,
            is.character(sas_name), length(sas_name) == 1,
            is.logical(value_label_fix), length(value_label_fix) == 1,
            is.logical(real_names), length(real_names) == 1)


  # SAS setup
  codebook <- readr::read_lines(sas_name)
  codebook <- stringr::str_trim(codebook)

  # Get column name - both undescriptive and descriptive =====================
  codebook_variables <- codebook[grep2("^LABEL$", codebook):
                                   grep("^$", codebook)[grep("^$", codebook) >
                                                             grep2("^LABEL$",
                                                                   codebook)][1]]
  codebook_variables <- codebook_variables[grep("=", codebook_variables)]
  codebook_variables <- gsub("\\S=", " =", codebook_variables)
  codebook_variables <- data.frame(column_name = fix_names(codebook_variables),
                                   column_number = gsub(" .*", "",
                                                        codebook_variables),
                                   stringsAsFactors = FALSE)



  # Get column spacing ==================================================
  column_spaces <- codebook[grep2("INPUT STATEMENTS", codebook) : grep("^$", codebook)[grep("^$", codebook) > grep2("INPUT STATEMENTS", codebook) + 5][1]]

  column_spaces <- get_column_spaces(column_spaces, codebook_variables)
  column_spaces <- selected_columns(keep_columns, column_spaces)


  if (any(grepl2("^FORMAT$", codebook))) {
    # Get format - column names and column names with f ====================
    format <- codebook[grep2("^FORMAT$", codebook) : length(codebook)]
    format <- unlist(strsplit(format, "\\."))
    format <- stringr::str_trim(format)
    format <- data.frame(column_name = gsub(" .*", "", format),
                         f_name      = gsub(".* ", "", format))
  column_spaces <- merge(column_spaces, format, by.x = "column_number",
                         by.y = "column_name", all.x = TRUE)
  }
  column_spaces <- column_spaces[order(column_spaces$begin), ]


# Reads in Data File ------------------------------------------------------

  dataset <- suppressMessages(readr::read_fwf(dataset_name,
                              readr::fwf_positions(column_spaces$begin,
                                                   column_spaces$end,
                                                   column_spaces$column_number),
                             col_types = readr::cols(.default =
                                                       readr::col_character())))
  dataset <- data.table::as.data.table(dataset)
  column_order <- names(dataset)

  if (any(grepl2("^FORMAT$", codebook))) {
  # Gets value labels
  value_position <- grep("^VALUE ", codebook)
  value_labels <- codebook[value_position[1] : grep("\\*/$", codebook)[grep("\\*/$", codebook) > value_position[length(value_position)]][1]]
  value_labels <- gsub(";\\*\\/", "", value_labels)
  value_labels <- unlist(strsplit(value_labels, ";"))
  value_labels <- gsub("(^VALUE.* )\\(.*\\)", "\\1", value_labels)
  value_labels <- gsub("^VALUE ", "", value_labels)
  value_labels <- stringr::str_trim(value_labels)
  value_labels <- gsub("&\\s+", "& ", value_labels)
  value_labels <- unlist(strsplit(value_labels, "\\s{2,}"))


  value_labels <- data.frame(value_labels,
                             group = 0,
                             column = value_labels[1],
                             stringsAsFactors = FALSE)

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
  value_labels <- value_labels[value_labels$column %in% column_spaces$f_name, ]
  value_labels <- split.data.frame(value_labels, value_labels$group)


  if (value_label_fix && length(value_labels) > 0) {
    for (i in seq_along(value_labels)) {
      column <- value_labels[[i]][1, 1]
      if (toupper(column) %in% toupper(column_spaces$f_name)) {
        column <- column_spaces$column_number[toupper(column_spaces$f_name) %in%
                                                toupper(column)]
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
  }

  if (real_names) {
    codebook_variables <- codebook_variables[codebook_variables$column_number %in% names(dataset), ]
    data.table::setnames(dataset, old = codebook_variables$column_number,
                         new = codebook_variables$column_name)
  }

  # Makes columns that should be numeric numeric
  dataset <- make_cols_numeric(dataset)
  dataset <- as.data.frame(dataset)
  return(dataset)
}
