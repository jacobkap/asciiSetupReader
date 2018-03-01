get_column_spaces <- function(column_spaces, codebook_variables) {

  column_spaces <- unlist(strsplit(column_spaces, "\\s{2,}"))
  column_spaces <- gsub("\\$|\\;|\\(.*|\\.[0-9]", "", column_spaces)
  column_spaces <- gsub("\\.$", "", column_spaces)
  column_spaces <- stringr::str_trim(column_spaces)
  column_spaces <- column_spaces[grep("[0-9]$", column_spaces)]
  column_spaces <- data.frame(column_number = column_spaces,
                              stringsAsFactors = FALSE)

  column_spaces$begin <- gsub(".* ", "", column_spaces$column_number)
  column_spaces$end <- gsub(".*-", "", column_spaces$begin)
  column_spaces$begin <- gsub("-.*", "", column_spaces$begin)

  column_spaces$column_number <- gsub(" .*", "", column_spaces$column_number)
  column_spaces <- column_spaces[column_spaces$column_number %in%
                                   codebook_variables$column_number, ]
  column_spaces <- merge(column_spaces, codebook_variables,
                         by = "column_number", all.x = TRUE)
  column_spaces$begin <- suppressMessages(as.numeric(column_spaces$begin))
  column_spaces$end <- suppressMessages(as.numeric(column_spaces$end))
  column_spaces <- column_spaces[order(column_spaces$begin), ]
  return(column_spaces)
}


selected_columns <- function(keep_columns, column_spaces) {
  if (is.null(keep_columns)) {
    return(column_spaces)
  } else if (is.numeric(keep_columns)) {
    column_spaces <- column_spaces[keep_columns, ]
  } else if (all(keep_columns %in% column_spaces$column_number)) {
    column_spaces <- column_spaces[
      column_spaces$column_number %in% keep_columns, ]
  } else if (all(keep_columns %in% column_spaces$column_name)) {
    column_spaces <- column_spaces[
      column_spaces$column_name %in% keep_columns, ]
  } else {
    stop(paste0("Not all column names in 'keep_columns' are in data. ",
                "Please check spelling"))
  }

  return(column_spaces)
}

grep2 <- function(pattern, x) grep(pattern, x, ignore.case = TRUE)
grepl2 <- function(pattern, x) grepl(pattern, x, ignore.case = TRUE)



fix_missing <- function(dataset, missing) {

  for (column in unique(missing$variable)) {
    missing_values <- missing$values[missing$variable == column]
    missing_values <- as.character(trimws(missing_values))
    missing_values <- gsub("\\'", "", missing_values)
    names(missing_values) <- NA

    if (!is.character(dataset[[column]])) {
      data.table::set(dataset, j = column, value = as.character(dataset[[column]]))
    }
    data.table::set(dataset, j = column,
                    value = haven::as_factor(haven::labelled(dataset[[column]],
                                                             missing_values)))
    data.table::set(dataset, j = column, value = as.character(dataset[[column]]))

  }
  return(dataset)
}


read_data <- function(dataset_name, setup, ...) {
  positions <- readr::fwf_positions(setup$setup$begin,
                                    setup$setup$end,
                                    setup$setup$column_number)
  data <- suppressMessages(readr::read_fwf(dataset_name,
                                           col_positions = positions,
                                           col_types = readr::cols(.default =
                                                                     readr::col_character()),
                                           ...))

  return(data)
}


parse_value_labels <- function(setup) {

  if (is.null(setup$value_labels)) {
    return(NULL)
  } else {

    value_labels <- setup$value_labels
    if (!is.null(value_labels)) {
      value_labels <- value_labels[value_labels$column %in%
                                     setup$setup$column_number, ]
      value_labels <- split.data.frame(value_labels, value_labels$group)
    }

    value_label_cols <- c()
    for (i in seq_along(value_labels)) {
      column <- value_labels[[i]][1, 1]
      if (column %in% setup$setup$column_number) {
        value_labels[[i]] <- value_label_matrixer(value_labels[[i]][[1]])
        value_label_cols <- c(value_label_cols, column)
      }
    }
    return(list(value_labels, value_label_cols))
  }
}
