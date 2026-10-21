# How values are read: blanks, "NA" and "." in text and number columns,
# value labels matched by number, and lines skipped before the first case.

sps_file <- function(data_list, rest = NULL) {
  temp_file(c("DATA LIST FILE = 'x'", data_list, ".",
              "VARIABLE LABELS", "  V1 'code'", "  V2 'number'", ".",
              rest, "EXECUTE."), ".sps")
}

test_that("a blank text value gets the label of a blank code", {
  setup <- sps_file("  V1 1-2 (A)  V2 3-4",
                    c("VALUE LABELS", "  V1 ' ' 'No return' 'XX' 'Other' /",
                      "  V2 ' ' 'Blank number'", "."))
  data <- temp_file(c("  01", "XX  ", "AB02"), ".txt")
  out <- read_ascii_setup(data, setup, coerce_numeric = FALSE)
  expect_equal(out$code, c("No return", "Other", "AB"))
  # A blank in a number column is missing, as in SPSS
  expect_equal(out$number, c("01", NA, "02"))
  # Without labels a blank text value is NA, as before
  out <- read_ascii_setup(data, setup, use_value_labels = FALSE)
  expect_equal(out$code, c(NA, "XX", "AB"))
})

test_that("the letters NA in a text column are a value, not missing", {
  setup <- sps_file("  V1 1-2 (A)  V2 3-4",
                    c("VALUE LABELS", "  V1 'NA' 'Not applicable' 'DK' 'Not known'", "."))
  data <- temp_file(c("NANA", "DK01", "AB02"), ".txt")
  out <- read_ascii_setup(data, setup, coerce_numeric = FALSE)
  expect_equal(out$code, c("Not applicable", "Not known", "AB"))
  # In a number column it is missing
  expect_equal(out$number, c(NA, "01", "02"))
  out <- read_ascii_setup(data, setup, use_value_labels = FALSE)
  expect_equal(out$code, c("NA", "DK", "AB"))
})

test_that("a lone . is missing in a number column but kept in a text column", {
  setup <- sps_file("  V1 1-2 (A)  V2 3-4")
  data <- temp_file(c(" . .", "AB12"), ".txt")
  out <- read_ascii_setup(data, setup)
  expect_equal(out$code, c(".", "AB"))
  expect_equal(out$number, c(NA, 12))
})

test_that("labels of number columns match by value, of text columns by text", {
  setup <- sps_file("  V1 1-3 (A)  V2 4-10",
                    c("VALUE LABELS", "  V1 '1' 'one' / V2 0 'Not updated' 12 'twelve'", "."))
  data <- temp_file(c("0010000000", "01 0000012", "1  1960001"), ".txt")
  out <- read_ascii_setup(data, setup)
  expect_equal(out$number, c("Not updated", "twelve", "1960001"))
  # Text: "001" isn't "1" (the 1- and 2-digit padding rule still applies)
  expect_equal(out$code, c("001", "one", "one"))
})

test_that("real files' blank, NA and zero-padded codes get their labels", {
  skip_on_cran()
  ucr <- read_ascii_setup(UCR_dataset_name, UCR_sps_name, use_clean_names = FALSE,
                          select_columns = c("V34", "V40"))
  expect_equal(sum(ucr$V40 %in% "No return received"), 8452)
  expect_equal(sum(ucr$V34 %in% "Not updated"),
               sum(substr(readr::read_lines(UCR_dataset_name), 1, 1) != "") -
                 sum(ucr$V34 != "Not updated", na.rm = TRUE) - sum(is.na(ucr$V34)))
  expect_false(any(ucr$V34 %in% "0000000"))
  ucr_sas <- read_ascii_setup(UCR_dataset_name, UCR_sas_name, use_clean_names = FALSE,
                              select_columns = c("V34", "V40"))
  expect_identical(ucr_sas, ucr)

  nibrs <- read_ascii_setup(NIBRS_dataset_name, NIBRS_sps_name, use_clean_names = FALSE)
  expect_equal(sum(nibrs$B1017 %in% "Inactive"), 15555)

  parole <- suppressMessages(read_ascii_setup(parole_survey_dataset_name, parole_sps_name,
                                              missing_values = "none",
                                              use_clean_names = FALSE))
  expect_equal(sum(parole$ISPIN %in% "Not applicable"), 12)
  expect_equal(sum(parole$EMIN %in% "Not applicable"), 21)
})

test_that("DATA LIST columns without a label are kept, with their short name", {
  setup <- temp_file(c("DATA LIST FILE = 'x'", "  V1 1-2  V2 3-4  V3 5-6", ".",
                       "VARIABLE LABELS", "  V1 'first'", "  V3 'third'", ".",
                       "EXECUTE."), ".sps")
  expect_equal(parse_setup(setup)$setup$column_name, c("first", "V2", "third"))
})

test_that("a label mentioning missing values doesn't end VARIABLE LABELS", {
  setup <- temp_file(c("DATA LIST FILE = 'x'", "  V1 1-2  V2 3-4  V3 5-6", ".",
                       "VARIABLE LABELS", "  V1 'first'",
                       "  V2 'Number of missing values in grid'", "  V3 'third'", ".",
                       "EXECUTE."), ".sps")
  expect_equal(parse_setup(setup)$setup$column_name,
               c("first", "Number_of_missing_values_in_grid", "third"))
})

