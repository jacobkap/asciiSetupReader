# Replaces the codes in one column of .data with their value labels (from
# parse_setup()$value_labels).
fix_variable_values <- function(.data, value_label_section, column,
                                by_number = FALSE) {
  # Data are sometimes zero-padded differently from the setup file, so a
  # label for "1" also applies to "01" and vice versa
  value_label_section <- single_digit(value_label_section)
  value_label_section <- double_digit(value_label_section)
  # A blank code (" ") labels blank fields, which are read as ""
  blank <- value_label_section[value_label_section == " "]
  if (length(blank) > 0) {
    value_label_section <- c(value_label_section, stats::setNames("", names(blank)[1]))
  }
  value_label_section <- value_label_section[!duplicated(value_label_section)]

  data.table::set(.data, j = column,
                  value = replace_values(.data[[column]], value_label_section,
                                         by_number = by_number))
  return(.data)
}

# Adds a "0"-padded copy of each single-digit value ("1" -> "01").
single_digit <- function(value_label_section) {
  if (any(grepl("^[0-9]$", value_label_section))) {
    single_digit <- value_label_section[grep("^[0-9]$", value_label_section)]
    names_single_digit <- names(single_digit)
    single_digit <- paste0("0", single_digit)
    names(single_digit) <- names_single_digit
    value_label_section <- c(value_label_section, single_digit)
  }
  return(value_label_section)
}

# Adds an unpadded copy of each "0"-padded two-digit value ("01" -> "1").
double_digit <- function(value_label_section) {
  if (any(grepl("^0[0-9]$", value_label_section))) {
    double_digit <- value_label_section[grep("^0[0-9]$", value_label_section)]
    names_double_digit <- names(double_digit)
    double_digit <- gsub("^.", "", double_digit)
    names(double_digit) <- names_double_digit
    value_label_section <- c(value_label_section, double_digit)
  }
  return(value_label_section)
}


# Returns column as numeric, or NULL if any non-missing value isn't a number.
as_numeric_or_null <- function(column) {
  # as.numeric() errors (rather than returning NA) on bytes that are invalid
  # in the current locale, which some older data files contain.
  out <- tryCatch(suppressWarnings(as.numeric(as.character(column))),
                  error = function(e) NULL)
  if (is.null(out) || sum(is.na(out)) != sum(is.na(column))) return(NULL)
  out
}

# Converts every column whose values are all numbers to numeric, except the
# columns named in keep_text. Every row is checked, so a column with even
# one text value stays character.
make_cols_numeric <- function(dataset, keep_text = character(0)) {
  for (i in which(!names(dataset) %in% keep_text)) {
    # One text value in the first rows rules a column out cheaply; only
    # columns that pass get every row checked.
    if (is.null(as_numeric_or_null(utils::head(dataset[[i]], 1000)))) next
    converted <- as_numeric_or_null(dataset[[i]])
    if (!is.null(converted)) data.table::set(dataset, j = i, value = converted)
  }
  return(dataset)
}
