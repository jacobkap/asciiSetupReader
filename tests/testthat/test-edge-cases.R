# Edge cases found by measuring test coverage (covr): branches that no other
# test reached.

test_that("a SAS INPUT statement without its ; ends at a blank line", {
  setup <- temp_file(c("DATA x;", "INFILE 'x';", "INPUT", "  V1 1-2", "  V2 3-4",
                       "  V3 5-6", "  V4 7-8", "  V5 9-10", "  V6 11-12", "",
                       "RUN"), ".sas")
  expect_equal(parse_setup(setup)$setup$column_number, paste0("V", 1:6))
})

test_that("a DATA LIST with no positions stops with a clear error", {
  setup <- temp_file(c("DATA LIST FILE = 'x' /", ".", "EXECUTE."), ".sps")
  expect_error(parse_setup(setup), "No column positions were found",
               class = "asciiSetupReader_no_positions")
})

test_that("SAS formatted input marks $ ranges as text", {
  out <- formatted_input("INPUT @1 V1 $ 1-2 @3 V2 2.;")
  expect_equal(as.vector(out), c("V1 1-2", "V2 3-4"))
  expect_equal(attr(out, "text"), "V1")
  # SAS list input (names without positions) isn't fixed-width; V1 used to
  # get V2's width and V2 was lost
  expect_error(formatted_input("INPUT @1 V1 $ V2 2.;"),
               "reads 'V1' as list input", class = "asciiSetupReader_unsupported_input")
  expect_error(formatted_input("INPUT @1 V1 V2 2.;"),
               "reads 'V1' as list input", class = "asciiSetupReader_unsupported_input")
  # "$ 2." and "$CHAR 5." stay one informat
  expect_equal(as.vector(formatted_input("INPUT @1 V1 $ 2. V2 $ CHAR5.;")),
               c("V1 1-2", "V2 3-7"))
})

test_that("missing value sections that give nothing return NULL", {
  sps <- function(lines) {
    temp_file(c("DATA LIST FILE = 'x'", "  V1 1-2", ".", lines, "EXECUTE."), ".sps")
  }
  # Only a column that isn't in the file
  expect_null(parse_setup(sps(c("MISSING VALUES", "  V9 (9)", ".")))$missing)
  # Only clearing
  expect_null(parse_setup(sps("MISSING VALUES V1 ().") )$missing)
  # Set and then cleared
  expect_null(parse_setup(sps(c("MISSING VALUES V1 (9).", "MISSING VALUES V1 ().")))$missing)
  # Only a recode, which isn't a missing value
  only_recode <- read_setup(sps(c("* SPSS MISSING VALUE RECODE *.", "RECODE V1 (1=5).")))
  expect_null(only_recode$missing)
  expect_equal(only_recode$recodes, "RECODE V1 (1=5).")
})

test_that("SAS missing value statements that give nothing return NULL", {
  sas <- function(lines) {
    temp_file(c("DATA x;", "INFILE 'x';", "INPUT", "  V1 1-2", ";", lines, "RUN;"), ".sas")
  }
  # Only statements that are skipped
  skipped <- read_setup(sas("IF V1 = 1 AND V2 = 2 THEN V1 = .;"))
  expect_null(skipped$missing)
  expect_length(skipped$skipped_missing, 1)
  # Only a column that isn't in the file
  expect_null(parse_setup(sas("IF V9 = 9 THEN V9 = .;"))$missing)
})

test_that("a wrong name in select_columns says so", {
  expect_error(read_ascii_setup(weimar_dataset_name, weimar_sps_name,
                                select_columns = c("V1", "NOT_A_COLUMN")),
               "Not all column names in select_columns are in the data: NOT_A_COLUMN",
               class = "asciiSetupReader_select_columns")
})

# Found by the 3.0.0 challenge review

test_that("a column number past the last column stops with an error, not a crash", {
  expect_error(read_ascii_setup(weimar_dataset_name, weimar_sps_name, select_columns = c(1, 500)),
               "aren't in the setup file, which has 23 columns: 500",
               class = "asciiSetupReader_select_columns")
  # Negative numbers still drop columns, as before
  dropped <- allow_messages(read_ascii_setup(weimar_dataset_name, weimar_sps_name,
                                             select_columns = -(1:20)))
  expect_equal(ncol(dropped), 3)
})

test_that("a column selected twice is read once, with its implied decimals", {
  once <- allow_messages(read_ascii_setup(weimar_dataset_name, weimar_sps_name, select_columns = "V7"))
  twice <- allow_messages(read_ascii_setup(weimar_dataset_name, weimar_sps_name,
                                           select_columns = c("V7", "V7")))
  expect_identical(twice, once)
})

test_that("selecting a name another column also had says what that one is called now", {
  setup <- temp_file(c("DATA LIST FILE = 'x' /V1 1-2 V2 3-4 .", "VARIABLE LABELS",
                       "  V1 'AGE' /V2 'AGE' .", "EXECUTE."), ".sps")
  data <- temp_file(c("0102", "0304"), ".txt")
  expect_message(out <- read_ascii_setup(data, setup, select_columns = "AGE"),
                 "AGE -> AGE_V2", class = "asciiSetupReader_select_columns")
  expect_equal(names(out), "AGE")
  expect_equal(names(allow_messages(read_ascii_setup(data, setup, select_columns = c("AGE", "AGE_V2")))),
               c("AGE", "AGE_V2"))
})

test_that("VALUE LABELS sections without pairs give no labels", {
  sps <- function(lines) {
    temp_file(c("DATA LIST FILE = 'x'", "  V1 1-2", ".", lines, "EXECUTE."), ".sps")
  }
  expect_length(parse_setup(sps(c("VALUE LABELS", "  V1", ".")))$value_labels, 0)
  expect_length(parse_setup(sps(c("VALUE LABELS", ".")))$value_labels, 0)
  expect_length(pairs_to_value_labels(NULL), 0)
})

test_that("a TO list with more columns than tokens is collected", {
  # The pair collector starts with room for one pair per token and grows
  n <- 30
  setup <- temp_file(c("DATA LIST FILE = 'x'", paste0("  V", 1:n, " ", 1:n), ".",
                       "VALUE LABELS", "  V1 TO V30 1 'yes'", ".", "EXECUTE."), ".sps")
  labels <- parse_setup(setup)$value_labels
  expect_length(labels, n)
  expect_equal(labels$V30, c(yes = "1"))
})

test_that("SAS value labels: no format links, VALUE at the end, no pairs", {
  base <- c("DATA x;", "INFILE 'x';", "INPUT", "  V1 1-2", ";")
  # A FORMAT section that links no column to a format
  no_links <- temp_file(c(base, "PROC FORMAT;", "VALUE V1F 1 = 'one';", "",
                          "FORMAT", "  ;", "RUN;"), ".sas")
  expect_null(parse_setup(no_links)$value_labels)
  # VALUE statements that run to the end of the file
  at_end <- temp_file(c(base, "FORMAT", "  V1 V1F.;", "", "PROC FORMAT;",
                        "VALUE V1F 1 = 'one'", "  2 = 'two';"), ".sas")
  expect_equal(parse_setup(at_end)$value_labels$V1, c(one = "1", two = "2"))
  # A VALUE statement with no pairs
  empty <- temp_file(c(base, "FORMAT", "  V1 V1F.;", "", "PROC FORMAT;",
                       "VALUE V1F;", "", "RUN;"), ".sas")
  expect_length(parse_setup(empty)$value_labels, 0)
})

test_that("a setup file is read as Latin-1 if Windows-1252 fails", {
  setup <- temp_file(c("DATA LIST FILE = 'x'", "  V1 1-2", ".", "EXECUTE."), ".sps")
  con <- file(setup, "ab"); writeBin(as.raw(c(0x2a, 0x20, 0xe9, 0x0a)), con); close(con)
  real <- readr::read_lines
  local_mocked_bindings(read_lines = function(file, ..., locale = readr::default_locale()) {
    if (identical(locale$encoding, "windows-1252")) stop("can't convert")
    real(file, ..., locale = locale)
  }, .package = "readr")
  expect_message(lines <- read_setup_lines(setup), class = "asciiSetupReader_encoding")
  expect_equal(lines[length(lines)], "* é")
})
