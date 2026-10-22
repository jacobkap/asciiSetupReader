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
  # The recode to 5 changes values; the other two test or set another
  # column, which this can't read
  parsed <- read_setup(setup)
  expect_equal(parsed$recodes, "IF V1 = 1 THEN V1 = 5")
  expect_equal(parsed$skipped_missing,
               c("IF V1 = 1 AND V2 = 1 THEN V1 = .", "IF V1 = 1 THEN V2 = ."))
  data <- temp_file(c("0102AB", "0901CD"), ".txt")
  found <- messages_from(out <- read_ascii_setup(data, setup))
  expect_equal(vapply(found, function(m) class(m)[1], ""),
               c("asciiSetupReader_skipped_missing", "asciiSetupReader_recodes"))
  expect_match(conditionMessage(found[[1]]),
               "2 missing value statements couldn't be read and were skipped")
  expect_equal(conditionMessage(found[[2]]), paste0(
    "In '", basename(setup), "', 1 statement changes values rather than marking ",
    "them missing, so it wasn't applied (asciiSetupReader reads a setup ",
    "file's layout, labels and missing values, not other changes to the ",
    "data): \"IF V1 = 1 THEN V1 = 5\".\n"))
  # The 1 isn't changed to 5, and only V1's 9 is missing
  expect_equal(out$first, c(1, NA))
  # With missing_values = "none" only the recode message is left
  expect_message(read_ascii_setup(data, setup, missing_values = "none"),
                 class = "asciiSetupReader_recodes")
  expect_true(is_sas_recode("IF V1 = 1 THEN V1 = 5"))
  expect_false(is_sas_recode("IF V1 = 1 THEN V1 = .A"))
  expect_false(is_sas_recode("IF V1 = 1 THEN V2 = ' '"))
})

test_that("SPSS RECODE to a value other than SYSMIS isn't applied or misread", {
  setup <- temp_file(c("DATA LIST FILE = 'x'", "  V1 1-2  V2 3-4", ".",
                       "VARIABLE LABELS", "  V1 'first'", "  V2 'second'", ".",
                       "* SPSS MISSING VALUE RECODE *.",
                       "RECODE V1 (9=SYSMIS) (1=5).",
                       "RECODE V2 (2=3).", "EXECUTE."), ".sps")
  parsed <- read_setup(setup)
  expect_equal(paste(parsed$missing$variable, parsed$missing$values), "V1 9")
  expect_equal(parsed$recodes, c("RECODE V1 (9=SYSMIS) (1=5).", "RECODE V2 (2=3)."))
  data <- temp_file(c("0102", "0902"), ".txt")
  expect_message(out <- read_ascii_setup(data, setup),
                 "2 statements change values rather than marking them missing",
                 class = "asciiSetupReader_recodes")
  expect_equal(out$first, c(1, NA))
  expect_equal(out$second, c(2, 2))
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

test_that("a comment inside a SAS VALUE statement isn't part of a code", {
  setup <- sas_file(c("INPUT", "  V1 1-2", ";"),
                    c("PROC FORMAT;", "VALUE V1F", "  /* note */ 5 = 'five'", "  6 = 'six';",
                      "", "FORMAT", "  V1 V1F.;"))
  expect_equal(parse_setup(setup)$value_labels$V1, c(five = "5", six = "6"))
})

test_that("statements and comment state are found across lines", {
  st <- sas_statements(c("a = 1;", "/*", "IF V1 = 9", "THEN V1 = .;", "*/", "b = 2; c = 3;"))
  expect_equal(st$text, c("a = 1", "IF V1 = 9 THEN V1 = .", "b = 2", "c = 3"))
  expect_equal(st$line, c(1, 3, 6, 6))
  expect_equal(st$commented, c(FALSE, TRUE, FALSE, FALSE))
  expect_equal(sas_comment_state(c("x", "/* a", "b */", "y", "'/*'", "z")),
               c(FALSE, FALSE, TRUE, FALSE, FALSE, FALSE))
})

# Found by the 3.0.0 challenge review: SAS column input is read token by
# token, as formatted input is

positions_of <- function(input) {
  setup <- temp_file(c("DATA x;", "INFILE 'x';", input, "RUN;"), ".sas")
  s <- parse_setup(setup)$setup
  stats::setNames(paste0(s$begin, "-", s$end), s$column_number)
}

test_that("a statement or comment after INPUT's ; on its line isn't read as columns", {
  expect_equal(positions_of("INPUT V1 1-2 V2 3-4; RUN;"), c(V1 = "1-2", V2 = "3-4"))
  expect_equal(positions_of("INPUT ID 1-3 AGE 4-5; LABEL AGE = 'Age 2';"),
               c(ID = "1-3", AGE = "4-5"))
  expect_equal(positions_of("INPUT V1 1-2 V2 3-4 V3 5-6; * read 3 vars;"),
               c(V1 = "1-2", V2 = "3-4", V3 = "5-6"))
})

test_that("a comment inside INPUT isn't a column", {
  expect_equal(positions_of(c("INPUT", "  V1 1-2", "  /* the next 2 columns are 10 years old */",
                              "  V2 3-4", "  /* spread",
                              "     over lines 5 */", "  V3 5-6", ";")),
               c(V1 = "1-2", V2 = "3-4", V3 = "5-6"))
})

test_that("single-spaced column input is read", {
  # 2.6.0 read SEX at 9-15 and dropped INCOME
  expect_equal(positions_of("INPUT ID 1-7 SEX $ 8 INCOME 9-15;"),
               c(ID = "1-7", SEX = "8-8", INCOME = "9-15"))
  expect_equal(positions_of("INPUT A1_1 1 A1_2 2 A1_3 3;"),
               c(A1_1 = "1-1", A1_2 = "2-2", A1_3 = "3-3"))
  expect_equal(positions_of(c("INPUT", "V1 1-2 V2 3-4; LENGTH V3 8;")),
               c(V1 = "1-2", V2 = "3-4"))
})

test_that("FIRSTOBS is read from anywhere in the INFILE statement", {
  skip_of <- function(...) {
    read_setup(temp_file(c(..., "INPUT V1 1-2;", "RUN;"), ".sas"))$skip
  }
  expect_equal(skip_of("DATA x;", "INFILE 'd.txt' LRECL=10", "  FIRSTOBS=3;"), 2)
  expect_equal(skip_of("DATA x; INFILE 'd.txt' FIRSTOBS=2;"), 1)
  expect_equal(skip_of("DATA x;", "INFILE 'firstobs=5.txt';"), 0)
  expect_equal(skip_of("DATA x;", "/* INFILE 'd.txt' FIRSTOBS=9; */", "INFILE 'd.txt';"), 0)
})

test_that("DLM or DSD anywhere in INFILE, but not in its file name, means delimited data", {
  setup <- function(...) temp_file(c("DATA x;", ..., "INPUT V1 1-2;", "RUN;"), ".sas")
  expect_error(parse_setup(setup("INFILE 'd.txt'", "  DLM = ',';")),
               class = "asciiSetupReader_delimited")
  expect_equal(parse_setup(setup("INFILE 'c:/dsd/dlm.txt';"))$setup$column_number, "V1")
})

test_that("SPSS RECODE outside a missing values section is reported too", {
  sps_with <- function(...) {
    temp_file(c("DATA LIST FILE = 'x'", "  V1 1-2  V2 3-4", ".", ..., "EXECUTE."), ".sps")
  }
  expect_equal(read_setup(sps_with("RECODE V1 (1=5).", "recode v2 (2=3)", "  (4=6)."))$recodes,
               c("RECODE V1 (1=5).", "recode v2 (2=3) (4=6)."))
  # Commented out, or only to SYSMIS (a missing value): not a recode
  expect_null(read_setup(sps_with("* RECODE V1 (1=5).", "RECODE V2 (9=SYSMIS)."))$recodes)
})

test_that("SAS missing codes: text codes stay apart, active ones win, ELSE IF is read", {
  sas_missing_of <- function(input, statements) {
    setup <- temp_file(c("DATA x;", "INFILE 'x';", input, statements, "RUN;"), ".sas")
    m <- parse_setup(setup)$missing
    paste(m$variable, m$values, m$commented)
  }
  # In a text column '9' and '09' are different codes
  expect_setequal(sas_missing_of("INPUT V1 $ 1-2;", "IF V1 IN ('9', '09') THEN V1 = ' ';"),
                  c("V1 9 FALSE", "V1 09 FALSE"))
  # The same number active and commented out: the active one is kept
  expect_equal(sas_missing_of("INPUT V1 1-2;", c("IF V1 = 9 THEN V1 = .;",
                                                 "/* IF V1 = 09 THEN V1 = .; */")),
               "V1 9 FALSE")
  expect_equal(sas_missing_of("INPUT V1 1-2 V2 3-4;",
                              c("IF V1 = 98 THEN V1 = .;", "ELSE IF V1 = 99 THEN V1 = .;")),
               c("V1 98 FALSE", "V1 99 FALSE"))
})

# Found by the review of the 3.0.0 challenge fixes

test_that("ELSE IF is only read when it tests the same column as the IF before it", {
  setup <- temp_file(c("DATA x;", "INFILE 'x';", "INPUT V1 1-2 V2 3-4;",
                       "IF V1 = 98 THEN V1 = .;", "ELSE IF V1 = 99 THEN V1 = .;",
                       "IF V1 >= 97 THEN V1 = .;", "ELSE IF V2 <= 0 THEN V2 = .;", "RUN;"), ".sas")
  parsed <- read_setup(setup)
  expect_equal(paste(parsed$missing$variable, parsed$missing$values),
               c("V1 98", "V1 99", "V1 97 thru highest"))
  # V2 <= 0 only applies when V1 isn't missing, so it isn't used
  expect_equal(parsed$skipped_missing, "ELSE IF V2 <= 0 THEN V2 = .")
})

test_that("an INPUT statement missing its ; ends at the next statement", {
  expect_equal(positions_of(c("INPUT V1 1-2 V2 $ 3-4", "LABEL V1 = 'a';")),
               c(V1 = "1-2", V2 = "3-4"))
  # A column named like a statement, with its position, is still a column
  expect_equal(positions_of(c("INPUT V1 1-2", "LENGTH 3-4;")), c(V1 = "1-2", LENGTH = "3-4"))
})

