#' Read fixed-width ASCII file using SPSS or SAS Setup file.
#'
#' read_ascii_setup() is used when you need to
#' read an fixed-width ASCII (text) file that comes with a setup file.
#' The setup file provides instructions on how to create and name the columns,
#' and fix the key-value pairs (sometimes called value labels). This is common
#' in government data, particular data produced before 2010.
#'
#' @param data Name of the ASCII (.txt or .dat) file that contains the data.
#'   This file may be zipped with a file extension of .zip.
#' @param setup_file Name of the SPSS or SAS setup file - should be a .sps or .sas (.txt also accepted as are these files in zipped format)
#' @param use_value_labels If TRUE, fixes value labels of the data. e.g. If a
#'   column is "sex" and has values of 0 or 1, and the setup file says 0 = male
#'   and 1 = female, it will make that change. Using this parameter for enormous files may slow down the package considerably.
#' @param use_clean_names If TRUE fixes column names from default column name in the
#'   setup file (e.g. V1, V2) to the descriptive label for the column provided in the file (e.g. age, sex, etc.).
#' @param select_columns Specify which columns from the dataset you want. If
#'   NULL, will return all columns. Accepts the column number (e.g. 1:5),
#'   column name (e.g. V1, V2, etc.) or column label (e.g. VICTIM_NAME, CITY,
#'   etc.).
#' @param coerce_numeric
#' If TRUE (default) will make columns where all values can be made numeric
#' into numeric columns. Useful as FALSE if variables have leading zeros - such
#' as US Census FIPS codes.
#'
#' @return data.frame of the data from the ASCII file
#' @export
#' @examples
#' # Text file is zipped to save space.
#' dataset_name <- system.file("extdata", "example_data.zip",
#'   package = "asciiSetupReader")
#' sps_name <- system.file("extdata", "example_setup.sps",
#'   package = "asciiSetupReader")
#'
#' \dontrun{
#' example <- read_ascii_setup(data = dataset_name,
#'   setup_file = sps_name)
#'
#'
#' # Does not fix value labels
#' example2 <- read_ascii_setup(data = dataset_name,
#'   setup_file = sps_name, use_value_labels = FALSE)
#'
#' # Keeps original column names
#' example3 <- read_ascii_setup(data = dataset_name,
#'   setup_file = sps_name, use_clean_names = FALSE)
#' }
#'
#' # Only returns the first 5 columns
#' example4 <- read_ascii_setup(data = dataset_name,
#'   setup_file = sps_name, select_columns = 1:5)
read_ascii_setup <- function(data,
                             setup_file,
                             use_value_labels = TRUE,
                             use_clean_names  = TRUE,
                             select_columns   = NULL,
                             coerce_numeric   = TRUE) {

  if (grepl(".sps(\\.zip)?$", setup_file)) {

    data <- spss_ascii_reader(dataset_name   = data,
                             sps_name        = setup_file,
                             value_label_fix = use_value_labels,
                             real_names      = use_clean_names,
                             keep_columns    = select_columns,
                             coerce_numeric  = coerce_numeric)
  } else {

    data <- sas_ascii_reader(dataset_name    = data,
                             sas_name        = setup_file,
                             value_label_fix = use_value_labels,
                             real_names      = use_clean_names,
                             keep_columns    = select_columns,
                             coerce_numeric  = coerce_numeric)
  }

  return(data)
}
