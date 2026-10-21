#' Read fixed-width ASCII file using SAS Setup file.
#'
#' sas_ascii_reader() and spss_ascii_reader() are used when you need to
#' read a fixed-width ASCII (text) file that comes with a setup file. These file
#' combinations are sometimes referred to as .txt+.sps, .txt+.sas,
#' .dat+.sps, or .dat+.sas.
#' The setup file provides instructions on how to create and name the columns,
#' and fix the key-value pairs (sometimes called value labels). This is common
#' in government data, particularly data produced before 2010.
#'
#' sas_ascii_reader() gives the same result as \code{\link{read_ascii_setup}},
#' which reads both SPSS and SAS setup files; its arguments just have older
#' names.
#'
#' @family ASCII Reader functions
#' @seealso \code{\link{read_ascii_setup}}, \code{\link{spss_ascii_reader}} For
#'   using an SPSS setup file
#'
#' @param sas_name Name of the SAS Setup file - should be a .sas or .txt file.
#' @inheritParams spss_ascii_reader
#' @return Data.frame of the data from the ASCII file
#' @export
#' @examples
#' # Text file is zipped to save space.
#' dataset_name <- system.file("extdata", "example_data.zip",
#'   package = "asciiSetupReader")
#' sas_name <- system.file("extdata", "example_setup.sas",
#'   package = "asciiSetupReader")
#'
#' example <- sas_ascii_reader(dataset_name = dataset_name,
#'   sas_name = sas_name)
#'
#' # Only returns the first 5 columns
#' example2 <- sas_ascii_reader(dataset_name = dataset_name,
#'   sas_name = sas_name, keep_columns = 1:5)
#'
sas_ascii_reader <- function(dataset_name,
                             sas_name,
                             value_label_fix = TRUE,
                             real_names = TRUE,
                             keep_columns = NULL,
                             coerce_numeric = TRUE,
                             missing_values = c("all", "active", "none")) {

  read_ascii_setup(data             = dataset_name,
                   setup_file       = sas_name,
                   use_value_labels = value_label_fix,
                   use_clean_names  = real_names,
                   select_columns   = keep_columns,
                   coerce_numeric   = coerce_numeric,
                   missing_values   = missing_values)
}
