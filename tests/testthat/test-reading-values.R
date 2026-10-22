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

test_that("the letters NA in a text column get their label, or are missing", {
  setup <- sps_file("  V1 1-2 (A)  V2 3-4",
                    c("VALUE LABELS", "  V1 'NA' 'Not applicable' 'DK' 'Not known'", "."))
  data <- temp_file(c("NANA", "DK01", "AB02"), ".txt")
  out <- read_ascii_setup(data, setup, coerce_numeric = FALSE)
  expect_equal(out$code, c("Not applicable", "Not known", "AB"))
  # In a number column it is missing
  expect_equal(out$number, c(NA, "01", "02"))
  # Without labels, or without a label for "NA", it is missing, as before
  # 3.0.0
  out <- read_ascii_setup(data, setup, use_value_labels = FALSE)
  expect_equal(out$code, c(NA, "DK", "AB"))
  unlabelled <- sps_file("  V1 1-2 (A)  V2 3-4", c("VALUE LABELS", "  V1 'DK' 'Not known'", "."))
  out <- read_ascii_setup(data, unlabelled, coerce_numeric = FALSE)
  expect_equal(out$code, c(NA, "Not known", "AB"))
  # A label whose text is "NA" is kept
  na_label <- sps_file("  V1 1-2 (A)  V2 3-4", c("VALUE LABELS", "  V1 'DK' 'NA'", "."))
  out <- read_ascii_setup(data, na_label, coerce_numeric = FALSE)
  expect_equal(out$code, c(NA, "NA", "AB"))
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

test_that("SKIP, FIRSTCASE and FIRSTOBS skip lines before the first case", {
  data <- temp_file(c("HEADER", "0102", "0304"), ".txt")
  skip <- temp_file(c("DATA LIST FILE = 'x' SKIP = 1", "  V1 1-2  V2 3-4", ".",
                      "EXECUTE."), ".sps")
  expect_equal(read_ascii_setup(data, skip)$V1, c(1, 3))
  first <- temp_file(c("GET DATA /TYPE = TXT /FILE = 'x' /ARRANGEMENT = FIXED",
                       " /FIRSTCASE = 2", "/VARIABLES =", "V1 0-1 F2.0", "V2 2-3 F2.0",
                       " .", "EXECUTE."), ".sps")
  expect_equal(read_ascii_setup(data, first)$V2, c(2, 4))
  sas <- temp_file(c("DATA x;", "INFILE 'x' FIRSTOBS = 2;", "INPUT", "  V1 1-2  V2 3-4",
                     ";", "RUN;"), ".sas")
  expect_equal(read_ascii_setup(data, sas)$V1, c(1, 3))
  # No skip without one, and not from a comment
  none <- temp_file(c("* SKIP = 1 is not used.", "DATA LIST FILE = 'x'", "  V1 1-2", ".",
                      "EXECUTE."), ".sps")
  expect_equal(read_setup(none)$skip, 0)
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

test_that("DATA LIST forms the package can't read stop with clear errors", {
  records <- temp_file(c("DATA LIST FILE = 'x' RECORDS = 2", "/1 V1 1-2", "/2 V2 1-2", ".",
                         "EXECUTE."), ".sps")
  expect_error(parse_setup(records), "several lines \\(records\\) per case",
               class = "asciiSetupReader_unsupported_input")
  # (Several variables sharing one range, "Q1 TO Q3 3-5", are read since
  # 3.0.0's DATA LIST reader; see test-data-list.R)
  formats <- temp_file(c("DATA LIST FILE = 'x'", "  ID 1-3 AGE (F2) SEX (A1)", ".",
                         "EXECUTE."), ".sps")
  expect_error(parse_setup(formats), "by format only",
               class = "asciiSetupReader_unsupported_input")
  # A FORMATS command after DATA LIST is fine
  ok <- temp_file(c("DATA LIST FILE = 'x'", "  V1 1-2  V2 3-4", ".",
                    "FORMATS V1 (F7.3) V2 (F2.0).", "EXECUTE."), ".sps")
  expect_equal(parse_setup(ok)$setup$column_number, c("V1", "V2"))
})

test_that("SPSS MISSING VALUES follow SPSS's rules", {
  run <- function(missing) {
    setup <- sps_file("  V1 1-2  V2 3-4", missing)
    m <- parse_setup(setup)$missing
    if (is.null(m)) return(character(0))
    sort(paste(m$variable, m$values))
  }
  # A later command replaces a column's missing values
  expect_equal(run(c("MISSING VALUES V1 (9).", "MISSING VALUES V1 (99) V2 (8).")),
               c("V1 99", "V2 8"))
  # () clears them
  expect_equal(run(c("MISSING VALUES V1 (9) V2 (8).", "MISSING VALUES V1 ().")),
               "V2 8")
  # ALL is every column; / can separate columns on one line
  expect_equal(run("MISSING VALUES ALL (9)."), c("V1 9", "V2 9"))
  expect_equal(run("MISSING VALUES V1 (9) /V2 (8)."), c("V1 9", "V2 8"))
  # THRU in any case; long or decimal ranges stay as ranges
  expect_equal(run("MISSING VALUES V1 (90 Thru 92)."), c("V1 90", "V1 91", "V1 92"))
  expect_equal(run("MISSING VALUES V1 (1000000 THRU 9999999)."), "V1 1000000 THRU 9999999")
  expect_equal(run("MISSING VALUES V1 (99.5 thru 99.9)."), "V1 99.5 thru 99.9")
})

test_that("ranges kept as one row are compared as numbers", {
  data <- data.table::data.table(a = c("1500000", "999999", "99.7", "99.4", "5"))
  missing <- data.frame(variable = c("a", "a"),
                        values = c("1000000 THRU 9999999", "99.5 thru 99.9"))
  expect_equal(fix_missing(data, missing)$a, c(NA, "999999", NA, "99.4", "5"))
  expect_lt(system.time(make_thru_missing_rows(
    data.frame(variable = "a", values = "1000000 THRU 9999999")))[["elapsed"]], 2)
})

test_that("an inline /* */ comment in VALUE LABELS doesn't hide labels", {
  setup <- sps_file("  V1 1-2  V2 3-4",
                    c("VALUE LABELS",
                      "  V1 1 'Yes' /* a */ 2 'No' /* b */",
                      "  3 'Maybe' /* don't use",
                      "  /V2 1 'Male' 2 'Female'", "."))
  labels <- parse_setup(setup)$value_labels
  expect_equal(labels$V1, c(Yes = "1", No = "2", Maybe = "3"))
  expect_equal(labels$V2, c(Male = "1", Female = "2"))
})
