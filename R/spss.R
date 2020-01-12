#' Read fixed-width ASCII file using SPSS Setup file.
#'
#' spss_ascii_reader() and sas_ascii_reader() are used when you need to
#' read an fixed-width ASCII (text) file that comes with a setup file.
#' These file combinations are sometimes referred to as .txt+.sps, .txt+.sas,
#' .dat+.sps, or .dat+.sas.
#' The setup file provides instructions on how to create and name the columns,
#' and fix the key-value pairs (sometimes called value labels). This is common
#' in government data, particular data produced before 2010.
#'
#' @family ASCII Reader functions
#' @seealso \code{\link{sas_ascii_reader()}} For using an SAS setup file
#'
#' @param dataset_name Name of the ASCII (.txt) file that contains the data.
#'   This file may be zipped with a file extension of .zip.
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
#' @param coerce_numeric
#' If TRUE (default) will make columns where all values can be made numeric
#' into numeric columns.Useful as FALSE if variables have leading zeros - such
#' as US Census FIPS codes.
#'
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
#'
#'
#' # Does not fix value labels
#' example2 <- spss_ascii_reader(dataset_name = dataset_name,
#'   sps_name = sps_name, value_label_fix = FALSE)
#'
#' # Keeps original column names
#' example3 <- spss_ascii_reader(dataset_name = dataset_name,
#'   sps_name = sps_name, real_names = FALSE)
#'
#' }
#' # Only returns the first 5 columns
#' example4 <- spss_ascii_reader(dataset_name = dataset_name,
#'   sps_name = sps_name, keep_columns = 1:5)
#'
spss_ascii_reader <- function(dataset_name,
                              sps_name,
                              value_label_fix = TRUE,
                              real_names = TRUE,
                              keep_columns = NULL,
                              coerce_numeric = TRUE) {

  #  .Deprecated("read_ascii_setup")

  stopifnot(is.character(dataset_name), length(dataset_name) == 1,
            is.character(sps_name), length(sps_name) == 1,
            is.logical(value_label_fix), length(value_label_fix) == 1,
            is.logical(real_names), length(real_names) == 1)

  setup <- parse_setup(sps_name)
  setup$setup <- selected_columns(keep_columns, setup$setup)

  data <- read_data(dataset_name, setup)
  #data2 <- read_data_vroom(dataset_name, setup)


  data <- fix_value_labels(data, setup, value_label_fix)


  data <- fix_names_missing_numeric(data,
                                    setup,
                                    missing,
                                    real_names,
                                    coerce_numeric)

  return(data)
}
