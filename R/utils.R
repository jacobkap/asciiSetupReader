get_column_spaces <- function(setup, variables, codebook) {


  setup <- setup[grep("[0-9]-[0-9]| [0-9]| \\$[0-9]", setup)]

  setup <- gsub("([0-9])- +([0-9])", "\\1-\\2", setup)

  setup <- gsub("\tF[0-9].0$|\tA[0-9]+$|\t\\(.*\\)$", "", setup)
  setup <- gsub("\t", " ", setup)
  setup <- gsub("([0-9]) - ([0-9])", "\\1-\\2", setup)
  setup <- gsub("([0-9]+-[0-9]+) ([[:alpha:]]+)", "\\1   \\2",
                setup)
  setup <- gsub("([[:alpha:]]+[0-9]* [0-9]+) ([[:alpha:]]+[0-9]*)", "\\1   \\2",
                setup)
  setup <- gsub("\\s{2,}\\$ ([0-9]+)", " \\1",
                setup)
  setup <- unlist(strsplit(setup, "\\s{2,}"))
  setup <- gsub("\\$|\\;|\\(.*|\\.[0-9]+", "", setup)
  setup <- gsub("\\.$", "", setup)
  setup <- stringr::str_trim(setup)
  setup <- setup[grep("[0-9]$", setup)]
  setup <- data.frame(column_number = setup,
                      stringsAsFactors = FALSE)
  setup$column_number <- gsub("^\\/", "", setup$column_number)

  setup$begin <- gsub(".* ", "", setup$column_number)
  setup$end   <- gsub(".*-", "", setup$begin)
  setup$begin <- gsub("-.*", "", setup$begin)
  setup <- setup[setup$column_number != setup$begin, ]

  setup$column_number <- gsub(" .*", "", setup$column_number)
  if (!is.null(variables)) {
    setup <- setup[tolower(setup$column_number) %in%
                     tolower(variables$column_number), ]

    # In the CDC SADC data set, the column number changes from lowercase
    # to uppercase depending on section of setup file.
    for (i in 1:nrow(setup)) {
      if (tolower(setup$column_number[i]) %in% tolower(variables$column_number)) {
        setup$column_number[i] <-
          variables$column_number[tolower(variables$column_number) %in%
                                    tolower(setup$column_number[i])]
      }
    }
    setup <- merge(setup, variables,
                   by = "column_number", all.x = TRUE)
  } else {
    setup$column_name <- setup$column_number
  }


  setup$begin <- as.numeric(setup$begin)
  setup$end   <- as.numeric(setup$end)

  # Checks if any begin values are > than end values
  if (any(setup$begin > setup$end)) {

    stop(paste0("The following columns have a start number greater than the end number. Please check your setup file and fix this issue before rerunning this code.",
                paste("\nColumns with issue: ",
                      setup$column_number[setup$begin > setup$end])))
  }


  format_section <- grep2("^FORMAT$|SAS FORMAT STATEMENT|\\/\\* format$", codebook)
  if (any(grepl2("^FORMAT$|SAS FORMAT STATEMENT|\\/\\* format$", codebook))) {
    # Get format - column names and column names with f ====================
    format_section = grep2("^FORMAT$|SAS FORMAT STATEMENT|\\/\\* format$", codebook)

    format <- codebook[format_section[1]:length(codebook)]
    format <- gsub("^FORMAT ", "", format, ignore.case = TRUE)
    format <- unlist(strsplit(format, "\\."))
    format <- stringr::str_trim(format)
    format <- data.frame(column_name = gsub(" .*", "", format),
                         f_name      = gsub(".* ", "", format))
    setup <- merge(setup, format, by.x = "column_number",
                   by.y = "column_name", all.x = TRUE)
  }

  setup <- setup[order(setup$begin), ]

  return(setup)
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



fix_missing <- function(data, missing) {
  missing <- missing[missing$variable %in% names(data), ]

  for (column in unique(missing$variable)) {
    missing_values <- missing$values[missing$variable == column]
    missing_values <- as.character(trimws(missing_values))
    missing_values <- gsub("\\'", "", missing_values)

    if (any(grepl("thru hi", missing, ignore.case = TRUE))) {
      thru_higher <- missing_values[grep("thru hi", missing_values, ignore.case = TRUE)]
      thru_higher <- gsub(" thru hi.*", "", thru_higher, ignore.case = TRUE)
      thru_higher <- as.numeric(thru_higher)
      unique_values_numeric <- suppressWarnings(as.numeric(unique(data[[column]])))
      unique_values_numeric <- unique_values_numeric[!is.na(unique_values_numeric)]
      missing_values <- c(missing_values,
                          unique_values_numeric[unique_values_numeric > thru_higher])
      missing_values <- gsub(" thru hi.*", "", missing_values, ignore.case = TRUE)

    }
    names(missing_values) <- NA

    # Sets character to column type in case it isn't already.
    if (!is.character(data[[column]])) {
      data.table::set(data, j = column, value = as.character(data[[column]]))
    }

    data.table::set(data, j = column,
                    value = haven::as_factor(haven::labelled(data[[column]],
                                                             missing_values)))
    # Re-saves as character type instead of factor type
    data.table::set(data, j = column, value = as.character(data[[column]]))

  }
  return(data)
}


read_data <- function(data, setup) {
  positions <- vroom::fwf_positions(setup$setup$begin,
                                    setup$setup$end,
                                    setup$setup$column_number)

  out <- tryCatch(
    {
      temp <- suppressMessages(vroom::vroom_fwf(data,
                                                col_positions = positions,
                                                col_types = vroom::cols(.default =
                                                                          vroom::col_character())))
      temp <- data.table::as.data.table(temp)
    },
    error=function(cond) {
      temp <- suppressMessages(readr::read_fwf(data,
                                               col_positions = positions,
                                               col_types = vroom::cols(.default =
                                                                         vroom::col_character())))
      temp <- data.table::as.data.table(temp)
    }
  )

  return(out)
}


fix_names_missing_numeric <- function(data,
                                      setup,
                                      missing,
                                      real_names,
                                      coerce_numeric) {
  # Fixes missing values ----------------------------------------------------
  missing <- setup$missing
  if (!is.null(missing)) {
    data <- fix_missing(data, missing)
  }
  if (real_names) {
    # Fixes column names to real names
    variables <- setup$setup[setup$setup$column_number
                             %in% names(data), ]
    data.table::setnames(data, old = variables$column_number,
                         new = variables$column_name)
  }


  # Makes columns that should be numeric numeric
  if (coerce_numeric) {
    data <- make_cols_numeric(data)
  }
  attributes(data)$spec <- NULL
  data <- as.data.frame(data)
  return(data)
}

fix_value_labels <- function(data, setup, value_label_fix) {
  # Value Labels ------------------------------------------------------------
  # Removes columns not asked for
  value_labels <- setup$value_labels
  if (!is.null(value_labels)) {
    value_labels <- value_labels[names(value_labels) %in%
                                   setup$setup$column_number]
  }

  if (value_label_fix && length(value_labels) > 0) {
    column_order <- names(data)
    for (i in seq_along(value_labels)) {
      data <- fix_variable_values(data,
                                  value_labels[[i]],
                                  names(value_labels)[i])
      data.table::setcolorder(data, column_order)
    }
  }
  return(data)
}
