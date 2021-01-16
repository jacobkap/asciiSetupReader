#' Read fixed-width ASCII file using SAS Setup file.
#'
#' sas_ascii_reader() and spss_ascii_reader() are used when you need to
#' read an fixed-width ASCII (text) file that comes with a setup file. These file
#' combinations are sometimes referred to as .txt+.sps, .txt+.sas,
#' .dat+.sps, or .dat+.sas.
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
#'
#'
#' # Does not fix value labels
#' example2 <- sas_ascii_reader(dataset_name = dataset_name,
#'   sas_name = sas_name, value_label_fix = FALSE)
#'
#' # Keeps original column names
#' example3 <- sas_ascii_reader(dataset_name = dataset_name,
#'   sas_name = sas_name, real_names = FALSE)
#'
#' }
#' # Only returns the first 5 columns
#' example <- sas_ascii_reader(dataset_name = dataset_name,
#'   sas_name = sas_name, keep_columns = 1:5)
#'
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

  data <- fix_value_labels(data, setup, value_label_fix)



  data <- fix_names_missing_numeric(data,
                                    setup,
                                    missing,
                                    real_names,
                                    coerce_numeric)
  return(data)
}
