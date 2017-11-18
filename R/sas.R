#' Read ASCII file using SAS Setup file
#'
#' @param dataset_name
#' Name of the ASCII file with the data
#' @param sas_name
#' Name of the SAS Setup file - should be a .sps or .txt file.
#' @param value_label_fix
#' If TRUE, fixes value labels of the data. e.g. If a column is "sex" and has
#' values of 0 or 1, and the setup file says 0 = male and 1 = female, it will
#' make that change. The reader is much faster is this parameter is FALSE.
#' @param real_names
#' If TRUE fixes column names from default column name in the SAS setup file
#' (e.g. V1, V2) to the name is says the column is calle (e.g. age, sex, etc.)
#' @param keep_columns
#' Specify which columns from the dataset you want. If NULL, will return all columns.
#' Accepts the column number (e.g. 1:5), column name (e.g. V1, V2, etc.) or
#' column label (e.g. VICTIM_NAME, CITY, etc.)
#' @return
#' Data.frame of the data from the ASCII file
#' @export
#'
#' @examples
#'
#' dataset_name <- system.file("extdata", "example_data.txt",
#'  package = "asciiSetupReader")
#' sas_name <- system.file("extdata", "example_setup.sas",
#' package = "asciiSetupReader")
#'
#' \dontrun{
#' example <- sas_ascii_reader(dataset_name = dataset_name,
#' sas_name = sas_name)
#' }
#'
#' # Does not fix value labels
#' example2 <- sas_ascii_reader(dataset_name = dataset_name,
#' sas_name = sas_name, value_label_fix = FALSE)
#'
#' # Keeps original column names
#' example3 <- sas_ascii_reader(dataset_name = dataset_name,
#' sas_name = sas_name, real_names = FALSE)
#'
#' # Only returns the first 5 columns
#' example <- sas_ascii_reader(dataset_name = dataset_name,
#' sas_name = sas_name, keep_columns = 1:5)
sas_ascii_reader <- function(dataset_name,
                             sas_name,
                             value_label_fix = TRUE,
                             real_names = TRUE,
                             keep_columns = NULL) {

  # SAS setup
  sas <- readr::read_lines(sas_name)
  sas <- trimws(sas)


  # Get format - column names and column names with f
  format <- sas[grep("^FORMAT$", sas, ignore.case = TRUE) : length(sas)]
  format <- unlist(strsplit(format, "\\."))
  format <- trimws(format)
  format <- data.frame(format)
  format$real_name <- gsub(" .*", "", format$format)
  format$f_name <- gsub("\\$|.* ", "", format$format)
  format <- format[tolower(format$real_name) ==
                     tolower(gsub("f*$", "", format$f_name)) &
                     format$real_name != "RUN",]
  format$f_name <- paste("VALUE", format$f_name)


  # Get column name - both undescriptive and descriptive
  column_name <- sas[grep("^LABEL$", sas): grep("^$", sas)[grep("^$", sas) >
                                                             grep("^LABEL$", sas)][1]]
  column_name <- column_name[grep("=", column_name)]
  column_name <- gsub("(\\w)=","\\1 =", column_name)
  column_name <- data.frame(column_name)
  column_name$real_name <- gsub(".*=", "", column_name$column_name)
  column_name$original_name <- gsub(" .*", "", column_name$column_name)

  # Get column spacing
  column_spaces <- sas[grep("INPUT STATEMENTS", sas) : grep("^$", sas)[grep("^$", sas) >
                                                                         grep("INPUT STATEMENTS", sas) + 5][1]]
  column_spaces <- unlist(strsplit(x = column_spaces, split = "\\s{2,}"))
  column_spaces <- gsub("\\$", "", column_spaces)
  column_spaces <- trimws(column_spaces)
  column_spaces <- column_spaces[grep("[0-9]$", column_spaces)]
  column_spaces <- gsub(" \\.[0-9]*", "", column_spaces)
  column_spaces <- data.frame(column_spaces)
  names(column_spaces)[1] <- "column_number"

  column_spaces$first_num <- gsub(".* ", "", column_spaces$column_number)
  column_spaces$second_num <- gsub(".*-", "", column_spaces$first_num)
  column_spaces$first_num <- gsub("-.*", "", column_spaces$first_num)

  column_spaces$column_number <- gsub(" .*", "", column_spaces$column_number)
  column_spaces <- column_spaces[column_spaces$column_number %in%
                                   column_name$original_name,]

  if (!is.null(keep_columns)) {
    if (is.numeric(keep_columns)) {
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
  }
  column_spaces$first_num <- as.numeric(column_spaces$first_num)
  column_spaces$second_num <- as.numeric(column_spaces$second_num)


  dataset <- suppressMessages(readr::read_fwf(dataset_name,
                                              readr::fwf_positions(column_spaces$first_num,
                                                                   column_spaces$second_num,
                                                                   column_spaces$column_number), col_types = paste0(rep("c", nrow(column_spaces)), collapse = "")))
  dataset <- data.table::data.table(dataset)
  column_order <- colnames(dataset)

  # Gets value labels
  value_position <- grep("VALUE .*f .*=", sas, ignore.case = TRUE)
  value_labels <- sas[value_position[1] : grep("^$", sas)[grep("^$", sas) >
                                                            value_position[length(value_position)]][1]]
  value_labels <- unlist(strsplit(value_labels, "\\s{2,}"))

  value_labels <- unlist(strsplit(value_labels, "\\' \\'"))
  value_labels <- gsub("\\' ([0-9])", "~~~\\1", value_labels)
  value_labels <- unlist(strsplit(value_labels, "~~~"))

  value_labels <- value_labels[grep("VALUE|=", value_labels)]
  value_labels <- gsub("\\'|\\(.*\\) |\\$", "", value_labels)
  value_labels <- unlist(strsplit(value_labels, "="))

  value_labels <- data.frame(value_labels)
  value_labels$group <- 0

  group <- 1
  for (i in 1:nrow(value_labels)) {
    value_labels$group[i] <- group
    if (grepl(";", value_labels$value_labels[i])) {
      group <- group + 1
    }
  }
  value_labels$value_labels <- gsub(";$", "", value_labels$value_labels)
  value_labels <- split.data.frame(value_labels, value_labels$group)


  if (value_label_fix) {
    for (i in 1:length(value_labels)) {
      column <- as.character(value_labels[[i]][1, 1])
      column <- toupper(gsub("f+$|^VALUE ", "", column))
      if (column %in% toupper(column_spaces$column_number)) {
        value_label_section <-  value_label_matrixer(value_labels[[i]])
        dataset <- fix_variable_values(dataset, value_label_section, column)
      }
    }
    data.table::setcolorder(dataset, column_order)
  }

  column_name$real_name <- gsub("^\\s*|\\s*$|\\'", "", column_name$real_name)
  column_name$real_name <- gsub(" |:", "_",
                                  column_name$real_name)
  column_name$column_name <- gsub("_/$", "",
                                  column_name$real_name)
  if (real_names) {
    # Fixes column names to real names
    for (n in 1:nrow(column_name)) {
      names(dataset)[which(names(dataset) ==
                             column_name$original_name[n])] <-
        column_name$real_name[n]
    }
  }
  dataset <- as.data.frame(dataset)
  return(dataset)
}

