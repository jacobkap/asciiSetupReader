#' Read fixed-width ASCII file using SPSS or SAS Setup file
#'
#' read_ascii_setup() is used when you need to
#' read a fixed-width ASCII (text) file that comes with a setup file.
#' The setup file provides instructions on how to create and name the columns,
#' and fix the key-value pairs (sometimes called value labels). This is common
#' in government data, particularly data produced before 2010.
#'
#' @param data Name of the ASCII (.txt or .dat) file that contains the data.
#'   This file may be zipped with a file extension of .zip.
#' @param setup_file Name of the SPSS or SAS setup file - should be a .sps or
#'   .sas (.txt also accepted as are these files in zipped format). See
#'   \code{\link{parse_setup}} for how the type is determined.
#' @param use_value_labels If TRUE, fixes value labels of the data. e.g. If a
#'   column is "sex" and has values of 0 or 1, and the setup file says 0 = male
#'   and 1 = female, it will make that change.
#' @param use_clean_names If TRUE fixes column names from default column name
#'   in the setup file (e.g. V1, V2) to the descriptive label for the column
#'   provided in the file (e.g. age, sex, etc.).
#' @param select_columns Specify which columns from the dataset you want. If
#'   NULL, will return all columns. Accepts the column number (e.g. 1:5),
#'   column name (e.g. V1, V2, etc.) or column label (e.g. VICTIM_NAME, CITY,
#'   etc.).
#' @param coerce_numeric
#' If TRUE (default) will make columns where all values can be made numeric
#' into numeric columns. Every value is checked, so a column with any text
#' value stays character. Useful as FALSE if variables have leading zeros -
#' such as US Census FIPS codes.
#'
#' Columns that the setup file gives implied decimal places (e.g.
#' \code{V7 37-43 (1)} in SPSS or \code{V7 37-43 .1} in SAS) get their
#' decimal point whatever coerce_numeric is: a value of "0000785" with 1
#' implied decimal place becomes 78.5, or the text "000078.5" if
#' coerce_numeric is FALSE. Values that already have a decimal point are
#' kept as they are.
#' @param missing_values Which of the setup file's missing values to set to
#'   NA. Setup files often have their missing values section commented out
#'   (e.g. "* MISSING VALUES" in SPSS or inside \code{/* */} in SAS) so that
#'   the codes stay in the data unless the user chooses otherwise.
#'   \describe{
#'     \item{"all"}{(default) Use every missing value in the setup file,
#'       ignoring whether it is commented out. This is what earlier versions
#'       did.}
#'     \item{"active"}{Use only the missing values that aren't commented
#'       out, as SPSS and SAS would.}
#'     \item{"none"}{Don't use any missing values; every code is kept.}
#'   }
#'   Missing values are matched by value, as in SPSS and SAS, so a missing
#'   value written 9 also matches 09 or 0000009 in the data, except in
#'   columns the setup file says are text (SPSS "(A)", SAS "$"), where it
#'   must be the same text. Value labels are applied first, so a missing
#'   value that also has a value label (e.g. 9 = "Unknown") keeps its label
#'   rather than becoming NA unless \code{use_value_labels = FALSE}.
#'
#' @section Value labels:
#' As in SPSS and SAS, codes of number columns are matched by value (a label
#' for 0 labels 0000000), and codes of text columns (SPSS "(A)", SAS "$")
#' must be the same text; a blank or the letters NA in a text column are
#' values that can have a label. As in SPSS, a VALUE LABELS command replaces
#' any labels an earlier VALUE LABELS command gave a column, and ADD VALUE
#' LABELS adds to them (changing the label of a code that already has one).
#'
#' @section Recodes:
#' Only a setup file's layout, names, value labels and missing values are
#' used. Statements that change values (SAS \code{IF v = 1 THEN v = 5;}, SPSS
#' \code{RECODE v (1=5)}) aren't applied, and a message lists them.
#'
#' @section Blank values:
#' A blank in a number column, or a lone "." or the letters NA, is NA. A
#' blank in a text column is NA unless it has a value label.
#'
#' @section Messages:
#' read_ascii_setup() tells you with a message when it:
#' \itemize{
#'   \item adds implied decimal places to a column's values (listing the
#'     columns and their decimal places),
#'   \item sets values to NA because of missing values that are commented
#'     out in the setup file (only when \code{missing_values = "all"}),
#'   \item makes column names unique because two columns would have had
#'     the same name (only when \code{use_clean_names = TRUE}),
#'   \item uses only the last of several different sets of value labels a
#'     column has (only when \code{use_value_labels = TRUE}),
#'   \item skips SAS missing value statements it can't read (only when
#'     \code{missing_values} isn't "none"),
#'   \item finds statements that change values (recodes), which aren't
#'     applied, or
#'   \item reads a setup file that isn't valid UTF-8 as Windows-1252.
#' }
#' \code{suppressMessages(read_ascii_setup(...))} silences them. They have
#' the class "asciiSetupReader_message", so
#' \code{suppressMessages(read_ascii_setup(...), classes = "asciiSetupReader_message")}
#' silences only these messages. Each kind also has its own class:
#' "asciiSetupReader_implied_decimals", "asciiSetupReader_commented_missing",
#' "asciiSetupReader_unique_names", "asciiSetupReader_replaced_labels",
#' "asciiSetupReader_skipped_missing", "asciiSetupReader_recodes" and
#' "asciiSetupReader_encoding".
#'
#' @section Errors:
#' Setup files that can't be read stop with an error of class
#' "asciiSetupReader_error" and a more specific class:
#' "asciiSetupReader_delimited" (a file for delimited, not fixed-width,
#' data), "asciiSetupReader_no_positions" (no column positions, e.g. a file
#' of value labels only) or "asciiSetupReader_unsupported_input" (an SPSS
#' DATA LIST or SAS INPUT statement this package can't read, e.g. one with
#' several records per case).
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
#' example <- read_ascii_setup(data = dataset_name,
#'   setup_file = sps_name)
#'
#' # Does not fix value labels
#' example2 <- read_ascii_setup(data = dataset_name,
#'   setup_file = sps_name, use_value_labels = FALSE)
#'
#' # Keeps original column names
#' example3 <- read_ascii_setup(data = dataset_name,
#'   setup_file = sps_name, use_clean_names = FALSE)
#'
#' # Only returns the first 5 columns
#' example4 <- read_ascii_setup(data = dataset_name,
#'   setup_file = sps_name, select_columns = 1:5)
#'
#' # Only uses the missing values that aren't commented out
#' example5 <- read_ascii_setup(data = dataset_name,
#'   setup_file = sps_name, missing_values = "active")
read_ascii_setup <- function(data,
                             setup_file,
                             use_value_labels = TRUE,
                             use_clean_names  = TRUE,
                             select_columns   = NULL,
                             coerce_numeric   = TRUE,
                             missing_values   = c("all", "active", "none")) {

  stopifnot(is.character(data), length(data) == 1,
            is.character(setup_file), length(setup_file) == 1,
            is.logical(use_value_labels), length(use_value_labels) == 1,
            is.logical(use_clean_names), length(use_clean_names) == 1)
  missing_values <- match.arg(missing_values)

  # read_setup() works out from the file name whether it's SPSS or SAS
  setup <- read_setup(setup_file)
  setup$setup <- selected_columns(select_columns, setup$setup)
  if (missing_values == "none") {
    setup$missing <- NULL
  } else if (missing_values == "active" && !is.null(setup$missing)) {
    setup$missing <- setup$missing[!setup$missing$commented, ]
  }

  data <- read_data(data, setup)
  decimals <- fix_implied_decimals(data, setup)
  data <- fix_value_labels(decimals$data, setup, use_value_labels)
  data <- fix_names_missing_numeric(data,
                                    setup,
                                    use_clean_names,
                                    coerce_numeric)
  commented_na <- attr(data, "commented_na")
  attr(data, "commented_na") <- NULL

  file_name <- basename(setup_file)
  final_name <- function(column_number) {
    if (!use_clean_names) return(column_number)
    setup$setup$column_name[match(column_number, setup$setup$column_number)]
  }
  if (!is.null(decimals$changed)) {
    changed <- decimals$changed
    inform("implied_decimals", "In '", file_name, "', ", nrow(changed),
           ngettext(nrow(changed), " column has", " columns have"),
           " implied decimal places, so a decimal point was added to ",
           "values without one (e.g. ", final_name(changed$column_number[1]),
           ": \"", changed$example[1], "\" became \"",
           changed$example_new[1], "\"). Columns (decimal places): ",
           list_items(paste0(final_name(changed$column_number), " (",
                             changed$decimals, ")")),
           if (nrow(changed) > 20) "; parse_setup()$setup$decimals has them all",
           ".")
  }
  if (length(commented_na) > 0) {
    lines <- unique(setup$commented_lines)
    inform("commented_missing", "In '", file_name, "', the missing values ",
           ngettext(length(lines), "starting on line ", "starting on lines "),
           paste(lines, collapse = ", "),
           " are commented out, but they were still set to NA, as in ",
           "earlier versions: ", format(sum(commented_na), big.mark = ","),
           ngettext(sum(commented_na), " value in ", " values in "),
           length(commented_na),
           ngettext(length(commented_na), " column (", " columns ("),
           list_items(final_name(names(commented_na))), "). Use ",
           "missing_values = \"active\" to only use missing values that ",
           "aren't commented out, or missing_values = \"none\" to use none.")
  }
  renamed <- setup$renamed
  renamed <- renamed[renamed$column_number %in% setup$setup$column_number, ]
  if (use_clean_names && NROW(renamed) > 0) {
    inform("unique_names", "In '", file_name, "', ", nrow(renamed),
           ngettext(nrow(renamed), " column has", " columns have"),
           " the same name as an earlier column, so the column's short name ",
           "was added to make each name unique: ",
           list_items(paste(renamed$column_number, "->", renamed$column_name)),
           ". parse_setup() shows every column's name.")
  }
  skipped <- setup$skipped_missing
  if (missing_values != "none" && length(skipped) > 0) {
    inform("skipped_missing", "In '", file_name, "', ", length(skipped),
           ngettext(length(skipped), " missing value statement", " missing value statements"),
           " couldn't be read and ", ngettext(length(skipped), "was", "were"),
           " skipped (only \"IF v = ... THEN v = .;\" forms that set the ",
           "column they test to missing are used): ",
           list_items(paste0("\"", skipped, "\""), max = 5), ".")
  }
  recodes <- setup$recodes
  if (length(recodes) > 0) {
    inform("recodes", "In '", file_name, "', ", length(recodes),
           ngettext(length(recodes), " statement changes", " statements change"),
           " values rather than marking them missing, so ",
           ngettext(length(recodes), "it wasn't", "they weren't"),
           " applied (asciiSetupReader reads a setup file's layout, labels ",
           "and missing values, not other changes to the data): ",
           list_items(paste0("\"", recodes, "\""), max = 5), ".")
  }
  ranges <- setup$label_ranges
  ranges <- ranges[ranges$column %in% setup$setup$column_number, ]
  if (use_value_labels && NROW(ranges) > 0) {
    columns <- unique(ranges$column)
    inform("label_ranges", "In '", file_name, "', ", length(columns),
           ngettext(length(columns), " column has", " columns have"),
           " value labels for ranges of values, which weren't applied so ",
           "the values are kept (a range such as 1 - 97 = \"Actual hours\" ",
           "describes the numbers in it): ",
           list_items(paste0(final_name(ranges$column), " ", ranges$code, " = \"",
                             ranges$label, "\"")), ".")
  }
  replaced <- intersect(setup$replaced_labels, setup$setup$column_number)
  if (use_value_labels && length(replaced) > 0) {
    if (identical(setup$type, "sas")) {
      where <- "a format defined in more than one VALUE statement, with "
      rule  <- "different labels; as in SAS, only the last definition is used: "
    } else {
      where <- "value labels in more than one VALUE LABELS command, with "
      rule  <- "different labels; as in SPSS, only the last command's labels are used: "
    }
    inform("replaced_labels", "In '", file_name, "', ", length(replaced),
           ngettext(length(replaced), " column has", " columns have"), " ",
           where, rule, list_items(final_name(replaced)),
           ". parse_setup()$value_labels shows the labels used.")
  }
  return(data)
}
