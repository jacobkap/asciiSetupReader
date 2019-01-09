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
#' @param sas_name Name of the SAS Setup file - should be a .sas or .txt file.
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
                             keep_columns = NULL,
                             coerce_numeric = TRUE) {

  #  .Deprecated("read_ascii_setup")

  stopifnot(is.character(dataset_name), length(dataset_name) == 1,
            is.character(sas_name), length(sas_name) == 1,
            is.logical(value_label_fix), length(value_label_fix) == 1,
            is.logical(real_names), length(real_names) == 1)


  # SAS setup
  setup <- parse_setup(sas_name)
  setup$setup <- selected_columns(keep_columns, setup$setup)




  # Reads in Data File ------------------------------------------------------
  data <- read_data(dataset_name, setup)
  column_order <- names(data)

  data <- fix_value_labels(data, setup, value_label_fix)
  # value_labels <- setup$value_labels
  # if (!is.null(value_labels)) {
  #   value_labels <- value_labels[names(value_labels) %in%
  #                                  setup$setup$f_name]
  # }
  #
  # if (value_label_fix && length(value_labels) > 0) {
  #   for (i in seq_along(value_labels)) {
  #     columns <- names(value_labels)[i]
  #     columns <- setup$setup$column_number[setup$setup$f_name %in% columns]
  #     for (col in columns) {
  #       data <- fix_variable_values(data, value_labels[[i]], col)
  #     }
  #   }
  #   data.table::setcolorder(data, column_order)
  # }


  data <- fix_names_missing_numeric(data,
                                    setup,
                                    missing,
                                    real_names,
                                    coerce_numeric)
  return(data)
}
