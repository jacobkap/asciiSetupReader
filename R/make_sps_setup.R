
#' Create an SPSS setup file (.sps) to use for reading in fixed-width text files
#'
#' make_sps_setup() is used to create the setup file used in reading in
#' fixed-width text files. Often the setup file comes with the data file but
#' in some cases (usually with government data) you will need to create
#' the setup file yourself.
#'
#' @param file_name
#' Name (or path) of the file to be saved (e.g. "setup_file1"). The .sps
#' extension is added if it isn't already there.
#' @param col_positions
#' Either a vector of strings indicating the start and end position of each column
#' (e.g. "1-3", "4-5") or a vector of the widths of the columns (e.g. 3, 2).
#' @param col_names
#' A vector of names for the columns. If none are provided, will automatically
#' create names based on column number (e.g. V1, V2, V3).
#' @param col_labels
#' A vector of labels for the columns. These are often longer and more descriptive
#' than the col_names. These are the values used as column names if
#' use_clean_names = TRUE in \code{\link{read_ascii_setup}}.
#' @param value_labels
#' A vector with the value first, then an ' = ' then the label. Each
#' new column should have the column name (or label) followed by ' ='.
#' @param missing_values
#' A vector of strings with the column name or label followed by the values
#' to be replaced by NA, e.g. c("var1", "9", "-8", "var2", "-8").
#' @return
#' \code{NULL}, invisibly. Called to write the .sps file.
#' @export
#'
#' @examples
#' value_labels <- c("var1 = ",
#'                   "1 = label 1",
#'                   "2 = label 2",
#'                   "3 = label 3",
#'                   "4 = label 4",
#'                   "5 = label 5",
#'                   "var3 = ",
#'                   "1A = alpha",
#'                   "1B = bravo",
#'                   "1C = cat")
#' missing_values <- c("state name", "9", "-8", "county", "-8")
#' file_name <- file.path(tempdir(), "example_name")
#' make_sps_setup(file_name      = file_name,
#'                col_positions  = c(1, 3, 4, 2),
#'                col_names      = c("var1", "var2", "var3", "var4"),
#'                col_labels     = c("state name", "county",
#'                                   "population", "census region code"),
#'                value_labels   = value_labels,
#'                missing_values = missing_values)
#'
#' # The new setup file can be used with parse_setup() and read_ascii_setup()
#' parse_setup(paste0(file_name, ".sps"))
make_sps_setup <- function(file_name,
                           col_positions,
                           col_names = NULL,
                           col_labels = NULL,
                           value_labels = NULL,
                           missing_values = NULL) {

  stopifnot(is.character(file_name),
            (is.character(col_positions) | is.numeric(col_positions)),
            (is.null(value_labels) | is.vector(value_labels)),
            (is.null(missing_values) | is.vector(missing_values)))





  intro <- paste0("This setup file was created using the R package asciiSetupReader",
                  "(version ",
                  utils::packageVersion("asciiSetupReader"),
                  ") on ",
                  Sys.time(), ".",
                  " For any feedback or problems (or if the file looks odd), ",
                  "please make a report on https://github.com/jacobkap/asciiSetupReader/issues.",
                  " For more information on this package see here: https://jacobkap.github.io/asciiSetupReader/.")
  intro <- c(intro, "", "")
  line_break <- c(".", "")
  file_name <- gsub("\\.sps$", "", file_name, ignore.case = TRUE)

  # Takes the input of column widths and makes the column position strings
  if (is.numeric(col_positions)) {
    col_positions       <- readr::fwf_widths(col_positions)
    col_positions$begin <- col_positions$begin + 1
    col_positions       <- paste0(col_positions$begin,
                                  "-",
                                  col_positions$end)
  }




# Make column names if none provided --------------------------------------


  if (is.null(col_names)) {
    col_names <- paste0("V", seq_along(col_positions))
  }

  data_list <- format(col_names,
                      width = max(nchar(col_names)) + 5)
  data_list <- paste(data_list, col_positions)
  data_list <- c("data list", data_list, line_break)


# Make value labels -------------------------------------------------------
  if (!is.null(value_labels)) {
    value_labels       <- stringr::str_split_fixed(value_labels, pattern = " = ", n = 2)
    val_labels_columns <- as.character(value_labels[, 1][value_labels[, 2] == ""])
    val_name_columns   <- col_names[match(val_labels_columns, col_labels)]
    val_labels_columns <- paste0("^", val_labels_columns, "$")
    if (all(!is.na(val_name_columns))) {
      names(val_name_columns) <- val_labels_columns
      value_labels[, 1] <-
        stringr::str_replace_all(value_labels[, 1], val_name_columns)
    }
    values <- value_labels[, 1]
    values[value_labels[, 2] != ""] <- paste0("'", values[value_labels[, 2] != ""] , "'")
    values <- format(values,
                     width = max(nchar(as.character(values))) + 5)
    labels   <- paste0('"', value_labels[, 2], '"')
    labels[labels == '""'] <- ""
    value_labels <- paste(values, labels)
    value_labels <- c("value labels", value_labels, line_break)
  } else {
    value_labels <- ""
  }


  if (!is.null(missing_values)) {

    # Each column's values start with its name or label (labels are
    # replaced with the name)
    is_column   <- missing_values %in% c(col_names, col_labels)
    label_match <- match(missing_values, col_labels)
    missing_values[!is.na(label_match)] <-
      col_names[label_match[!is.na(label_match)]]
    temp <- cumsum(is_column)
    split_missing <- split(missing_values, as.factor(temp))
    missing_values <- c()
    for (i in seq_along(split_missing)) {
      temp <- paste(unlist(split_missing[i]), collapse = ", ")
      temp <- stringr::str_replace(temp, ", ", "      (")
      temp <- paste0(temp, ")")
      missing_values <- c(missing_values, temp)
    }

    # Formats to make all same number of characters (so it looks better)
    missing_values <- format(missing_values,
                        width = max(nchar(missing_values)) + 5)
    missing_values <- c("missing values", missing_values, line_break)
  } else {
    missing_values <- ""
  }

  if (!is.null(col_labels)) {
    variable_labels <- format(col_names,
                              width = max(nchar(col_names)) + 5)
    col_labels      <- paste0('"', col_labels, '"')
    variable_labels <- paste(variable_labels, col_labels)
    variable_labels <- c("variable labels", variable_labels, line_break)
  } else {
    variable_labels <- ""
  }

  writeLines(c(file_name,
               "",
               intro,
               data_list,
               variable_labels,
               value_labels,
               missing_values,
               "",
               "execute"),
             paste0(file_name, ".sps"))
  invisible(NULL)
}
