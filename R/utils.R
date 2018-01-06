get_column_spaces <- function(column_spaces, codebook_variables) {

  column_spaces <- unlist(strsplit(column_spaces, "\\s{2,}"))
  column_spaces <- gsub("\\$|\\;|\\(.*|\\.[0-9]", "", column_spaces)
  column_spaces <- stringr::str_trim(column_spaces)
  column_spaces <- column_spaces[grep("[0-9]$", column_spaces)]
  column_spaces <- data.frame(column_number = column_spaces,
                              stringsAsFactors = FALSE)

  column_spaces$begin <- gsub(".* ", "", column_spaces$column_number)
  column_spaces$end <- gsub(".*-", "", column_spaces$begin)
  column_spaces$begin <- gsub("-.*", "", column_spaces$begin)

  column_spaces$column_number <- gsub(" .*", "", column_spaces$column_number)
  column_spaces <- column_spaces[column_spaces$column_number %in%
                                   codebook_variables$column_number,]
  column_spaces <- merge(column_spaces, codebook_variables,
                         by = "column_number", all.x = TRUE)
  column_spaces$begin <- suppressMessages(as.numeric(column_spaces$begin))
  column_spaces$end <- suppressMessages(as.numeric(column_spaces$end))
  column_spaces <- column_spaces[order(column_spaces$begin),]
  return(column_spaces)
}


selected_columns <- function(keep_columns, column_spaces) {
  if (is.null(keep_columns)) {
    # Do nothing
  } else if (is.numeric(keep_columns)) {
    column_spaces <- column_spaces[keep_columns,]
  } else if (all(keep_columns %in% column_spaces$column_number)) {
    column_spaces <- column_spaces[
      column_spaces$column_number %in% keep_columns,]
  } else if (all(keep_columns %in% column_spaces$column_name)) {
    column_spaces <- column_spaces[
      column_spaces$column_name %in% keep_columns,]
  } else {
    stop("Not all column names in 'keep_columns' are in data. Please check spelling")
  }

    return(column_spaces)
}

grep2 <- function(pattern, x) grep(pattern, x, ignore.case = TRUE)
grepl2 <- function(pattern, x) grepl(pattern, x, ignore.case = TRUE)
