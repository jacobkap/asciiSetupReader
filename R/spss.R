#' Read fixed-width ASCII file using SPSS Setup file.
#'
#' spss_ascii_reader() and sas_ascii_reader() are used when you need to
#' read a fixed-width ASCII (text) file that comes with a setup file.
#' These file combinations are sometimes referred to as .txt+.sps, .txt+.sas,
#' .dat+.sps, or .dat+.sas.
#' The setup file provides instructions on how to create and name the columns,
#' and fix the key-value pairs (sometimes called value labels). This is common
#' in government data, particularly data produced before 2010.
#'
#' spss_ascii_reader() gives the same result as \code{\link{read_ascii_setup}},
#' which reads both SPSS and SAS setup files; its arguments just have older
#' names.
#'
#' @family ASCII Reader functions
#' @seealso \code{\link{read_ascii_setup}}, \code{\link{sas_ascii_reader}} For
#'   using an SAS setup file
#'
#' @param dataset_name Name of the ASCII (.txt) file that contains the data.
#'   This file may be zipped with a file extension of .zip.
#' @param sps_name Name of the SPSS Setup file - should be a .sps or .txt
#'   (zipped text files also work) file.
#' @param value_label_fix If TRUE, fixes value labels of the data. e.g. If a
#'   column is "sex" and has values of 0 or 1, and the setup file says 0 = male
#'   and 1 = female, it will make that change.
#' @param real_names If TRUE fixes column names from default column name in the
#'   SPSS setup file (e.g. V1, V2) to the name it says the column is called
#'   (e.g. age, sex, etc.).
#' @param keep_columns Specify which columns from the dataset you want. If
#'   NULL, will return all columns. Accepts the column number (e.g. 1:5),
#'   column name (e.g. V1, V2, etc.) or column label (e.g. VICTIM_NAME, CITY,
#'   etc.).
#' @param coerce_numeric
#' If TRUE (default) will make columns where all values can be made numeric
#' into numeric columns. Every value is checked, so a column with any text
#' value stays character. Useful as FALSE if variables have leading zeros -
#' such as US Census FIPS codes.
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
#' example <- spss_ascii_reader(dataset_name = dataset_name,
#'   sps_name = sps_name)
#'
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

  read_ascii_setup(data             = dataset_name,
                   setup_file       = sps_name,
                   use_value_labels = value_label_fix,
                   use_clean_names  = real_names,
                   select_columns   = keep_columns,
                   coerce_numeric   = coerce_numeric)
}
