get_column_spaces <- function(column_spaces, codebook_variables) {

  column_spaces <- unlist(strsplit(column_spaces, "\\s{2,}"))
  column_spaces <- gsub("\\$|\\;|\\(.*|\\.[0-9]", "", column_spaces)
  column_spaces <- stringr::str_trim(column_spaces)
  column_spaces <- gsub("\\.$", "", column_spaces)
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
    # Do nothing
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


get_missing <- function(codebook, column_spaces) {
    missing <- codebook[grep("MISSING VALUES$", codebook):length(codebook)]
    missing <- unlist(strsplit(missing, ",|\\s{2,}"))

    missing <- data.frame(variable = gsub(" .*", "", missing),
                          values = gsub(".*\\(|\\).*", "", missing),
                          stringsAsFactors = FALSE)
    missing$variable[missing$variable == ""] <- NA
    missing$variable <- zoo::na.locf(missing$variable, na.rm = FALSE)
    missing$values <- gsub("\\.$", "", missing$values)
    missing$values <- gsub('\\"', "\\'", missing$values)
    missing <- missing[missing$variable %in% column_spaces$column_number, ]
    return(missing)
}

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
