# SAS INPUT and IF ... THEN missing value statements.

sas_file <- function(input, rest = NULL, infile = "INFILE 'x';") {
  temp_file(c("DATA x;", infile, input, "LABEL", "  V1 = 'first'", "  V2 = 'second'",
              "  V3 = 'third'", ";", rest, "RUN;"), ".sas")
}
missing_of <- function(statements) {
  setup <- sas_file(c("INPUT", "  V1 1-2  V2 3-4  V3 $ 5-6", ";"),
                    c("* USER-DEFINED MISSING VALUE RECODE TO SAS SYSMIS;", statements))
  m <- parse_setup(setup)$missing
  if (is.null(m)) character(0) else paste(m$variable, m$values)
}

test_that("the forms of IF statements SAS uses for missing values are read", {
  expect_equal(missing_of("IF V1 = 9 OR V1 = 99 THEN V1 = .;"), c("V1 9", "V1 99"))
  expect_equal(missing_of("IF V1 EQ 9 THEN V1 = .;"), "V1 9")
  expect_equal(missing_of("IF V1 IN (7, 8 9) THEN V1 = .;"), c("V1 7", "V1 8", "V1 9"))
  expect_equal(missing_of("IF V1 >= 98 THEN V1 = .;"), "V1 98 thru highest")
  expect_equal(missing_of("IF V1>=98 THEN V1=.;"), "V1 98 thru highest")
  expect_equal(missing_of("IF V1 GE 97 AND V1 LE 98 THEN V1 = .;"), c("V1 97", "V1 98"))
  expect_equal(missing_of("IF V1 <= -1 THEN V1 = .;"), "V1 lowest thru -1")
  expect_equal(missing_of("IF V1 = 9999999. THEN V1 = .A;"), "V1 9999999.")
  expect_equal(missing_of("if v1 = 99 then v1 = .;"), "V1 99")
  expect_equal(missing_of(c("IF V1 = 98 OR", "   V1 = 99 THEN V1 = .;")), c("V1 98", "V1 99"))
  expect_equal(missing_of("IF V3 = 'XX' THEN V3 = ' ';"), "V3 XX")
})

test_that("IF statements that aren't missing value recodes are skipped and reported", {
  statements <- c("IF V1 = 1 THEN V1 = 5;", "IF V1 = 1 AND V2 = 1 THEN V1 = .;",
                  "IF V1 = 1 THEN V2 = .;", "IF V1 = 9 THEN V1 = .;")
  expect_equal(missing_of(statements), "V1 9")
  setup <- sas_file(c("INPUT", "  V1 1-2  V2 3-4  V3 $ 5-6", ";"),
                    c("* USER-DEFINED MISSING VALUE RECODE TO SAS SYSMIS;", statements))
  expect_length(read_setup(setup)$skipped_missing, 3)
  data <- temp_file(c("0102AB", "0901CD"), ".txt")
  expect_message(read_ascii_setup(data, setup),
                 "3 missing value statements couldn't be read and were skipped",
                 class = "asciiSetupReader_skipped_missing")
  expect_silent(read_ascii_setup(data, setup, missing_values = "none"))
})

test_that("every missing value section is read, each marked commented or not", {
  setup <- sas_file(c("INPUT", "  V1 1-2  V2 3-4  V3 $ 5-6", ";"),
                    c("/*", "IF V1 = 9 THEN V1 = .;", "*/", "",
                      "IF V2 = 8 THEN V2 = .;",
                      "/*  IF V2 = 7 THEN V2 = .;  */"))
  m <- parse_setup(setup)$missing
  expect_equal(paste(m$variable, m$values, m$commented),
               c("V1 9 TRUE", "V2 8 FALSE", "V2 7 TRUE"))
  # Statements before INPUT (e.g. examples in the file's notes) aren't used
  early <- temp_file(c("/* Example: IF V1 = 1 THEN V1 = .; */", "DATA x;", "INFILE 'x';",
                       "INPUT", "  V1 1-2", ";", "RUN;"), ".sas")
  expect_null(parse_setup(early)$missing)
})

test_that("INPUT runs to its ; and a commented-out INPUT is ignored", {
  blank <- sas_file(c("INPUT", "  V1 1-2", "", "  V2 3-4", "", "  V3 $ 5-6", ";"))
  expect_equal(parse_setup(blank)$setup$column_number, c("V1", "V2", "V3"))
  same_line <- sas_file("INPUT V1 1-2  V2 3-4  V3 $ 5-6;")
  expect_equal(parse_setup(same_line)$setup$begin, c(1, 3, 5))
  commented <- temp_file(c("/*", "INPUT", "  X 1-5", ";", "*/", "DATA x;", "INFILE 'x';",
                           "INPUT", "  V1 1-2  V2 3-4", ";", "RUN;"), ".sas")
  expect_equal(parse_setup(commented)$setup$column_number, c("V1", "V2"))
  # Text ($) columns are known
  expect_equal(read_setup(same_line)$text_columns, "V3")
})

test_that("formatted input without @ pointers is read", {
  setup <- sas_file("INPUT V1 2. V2 $3. V3 4.1;")
  parsed <- parse_setup(setup)$setup
  expect_equal(parsed$begin, c(1, 3, 6))
  expect_equal(parsed$end, c(2, 5, 9))
  expect_equal(parsed$decimals, c(0, 0, 1))
})

test_that("SAS forms the package can't read stop with clear errors", {
  records <- sas_file(c("INPUT", "  #1 V1 1-2", "  #2 V2 1-2", ";"))
  expect_error(parse_setup(records), "several lines \\(records\\) per case",
               class = "asciiSetupReader_unsupported_input")
  slash <- sas_file(c("INPUT", "  V1 1-2 /", "  V2 1-2", ";"))
  expect_error(parse_setup(slash), class = "asciiSetupReader_unsupported_input")
  delimited <- sas_file("INPUT V1 V2 $;", infile = "INFILE 'x' DLM = ',' DSD;")
  expect_error(parse_setup(delimited), "delimited data file",
               class = "asciiSetupReader_delimited")
})

test_that("statements and comment state are found across lines", {
  st <- sas_statements(c("a = 1;", "/*", "IF V1 = 9", "THEN V1 = .;", "*/", "b = 2; c = 3;"))
  expect_equal(st$text, c("a = 1", "IF V1 = 9 THEN V1 = .", "b = 2", "c = 3"))
  expect_equal(st$line, c(1, 3, 6, 6))
  expect_equal(st$commented, c(FALSE, TRUE, FALSE, FALSE))
  expect_equal(sas_comment_state(c("x", "/* a", "b */", "y", "'/*'", "z")),
               c(FALSE, FALSE, TRUE, FALSE, FALSE, FALSE))
})
