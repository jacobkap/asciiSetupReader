# Setup files from GitHub issues and other layouts: clear errors for files
# that can't be read, Latin-1 files, SPSS GET DATA and SAS formatted input.

test_that("a delimited GET DATA file gives a clear error (GitHub #13)", {
  expect_error(parse_setup(fixture("SPSS_SPS.sps")),
               "delimited data file .*read.delim",
               class = "asciiSetupReader_delimited")
  expect_error(read_ascii_setup(tempfile(), fixture("SPSS_SPS.sps")),
               class = "asciiSetupReader_delimited")
  expect_error(parse_setup(fixture("SPSS_SPS.sps")), class = "asciiSetupReader_error")
})

test_that("a file of formats only gives a clear error", {
  expect_error(parse_setup(fixture("J260682_format.sas.zip")),
               "has value labels but no column positions.*INPUT section",
               class = "asciiSetupReader_no_positions")
  expect_error(parse_setup(fixture("J260813_formats.sps.zip")),
               "has value labels but no column positions.*DATA LIST section",
               class = "asciiSetupReader_no_positions")
})

test_that("a file with no column positions gives a clear error", {
  sps <- temp_file(c("* nothing useful here", "VARIABLE LABELS", "  V1 'id'", "."),
                   ".sps")
  expect_error(parse_setup(sps), "No column positions were found .*DATA LIST",
               class = "asciiSetupReader_no_positions")
  sas <- temp_file(c("DATA x;", "LABEL V1 = 'id';", "RUN;"), ".sas")
  expect_error(parse_setup(sas), "No column positions were found .*INPUT",
               class = "asciiSetupReader_no_positions")
})

test_that("the PSID setup file from GitHub is read", {
  psid <- parse_setup(fixture("J260682.sas.zip"))
  expect_equal(nrow(psid$setup), 1534)
  expect_equal(psid$setup$column_number[1:3], c("ER30000", "ER30001", "ER30002"))
  expect_equal(psid$setup$begin[1:3], c(1, 2, 6))
  expect_equal(anyDuplicated(tolower(psid$setup$column_name)), 0)
})

test_that("a setup file that isn't UTF-8 is read as Latin-1 with a message", {
  expect_message(sas <- parse_setup(fixture("INPUT_SAS_CENSOESC.sas.zip")),
                 "'INPUT_SAS_CENSOESC.sas.zip' isn't valid UTF-8 text, so it was read as Latin-1",
                 class = "asciiSetupReader_encoding")
  expect_true(all(validUTF8(sas$setup$column_name)))

  dir <- tempfile(); dir.create(dir)
  setup <- file.path(dir, "latin1.sps")
  lines <- c("DATA LIST FILE = 'x'", "  V1 1-2", ".", "VARIABLE LABELS",
             "  V1 'Município'", ".", "VALUE LABELS", "  V1 1 'São Paulo'",
             ".", "EXECUTE.")
  writeLines(iconv(lines, "UTF-8", "latin1"), setup, useBytes = TRUE)
  expect_message(parsed <- parse_setup(setup), class = "asciiSetupReader_encoding")
  expect_equal(parsed$setup$column_name, "Município")
  expect_equal(names(parsed$value_labels$V1), "São Paulo")

  data <- file.path(dir, "data.txt")
  writeLines(c("01", "02"), data)
  expect_message(out <- read_ascii_setup(data, setup), class = "asciiSetupReader_encoding")
  expect_equal(out[[1]], c("São Paulo", "02"))

  # A UTF-8 file gives no message
  writeLines(lines, setup, useBytes = TRUE)
  expect_silent(parse_setup(setup))
})

test_that("SPSS GET DATA positions count from 0", {
  # IBM: the first column of a GET DATA /ARRANGEMENT = FIXED file is 0
  setup <- temp_file(c("GET DATA  /TYPE = TXT",
                       " /FILE = 'data.txt'",
                       " /ARRANGEMENT = FIXED",
                       " /FIRSTCASE = 1",
                       "/VARIABLES =",
                       " /1",
                       "ID\t\t0-1\t\tF2.0",
                       "NAME\t\t2-6\t\tA5",
                       "RATE\t\t7-10\tF4.1",
                       " .",
                       "EXECUTE."), ".sps")
  parsed <- parse_setup(setup)$setup
  expect_equal(parsed$column_number, c("ID", "NAME", "RATE"))
  expect_equal(parsed$begin, c(1, 3, 8))
  expect_equal(parsed$end, c(2, 7, 11))
  expect_equal(parsed$decimals, c(0, 0, 1))
  data <- temp_file(c("01Maria0125", "02Joao 0990"), ".txt")
  out <- suppressMessages(read_ascii_setup(data, setup))
  expect_equal(out$ID, c(1, 2))
  expect_equal(out$NAME, c("Maria", "Joao"))
  expect_equal(out$RATE, c(12.5, 99))
})

test_that("SAS formatted input with @ pointers and informats is read", {
  setup <- temp_file(c("DATA x;",
                       "INFILE 'data.txt';",
                       "INPUT",
                       "",
                       "@1    ID        2.     /* row id */",
                       "@3    NAME      $CHAR5.",
                       "",
                       "/* a blank line and comment don't end INPUT */",
                       "@8    RATE      4.1",
                       "      SCORE     3.",
                       "+1    CODE      $ 2.",
                       "      YEAR      16-19",
                       ";",
                       "RUN;"), ".sas")
  parsed <- parse_setup(setup)$setup
  expect_equal(parsed$column_number, c("ID", "NAME", "RATE", "SCORE", "CODE", "YEAR"))
  expect_equal(parsed$begin, c(1, 3, 8, 12, 16, 16))
  expect_equal(parsed$end, c(2, 7, 11, 14, 17, 19))
  expect_equal(parsed$decimals, c(0, 0, 1, 0, 0, 0))

  expect_equal(formatted_input(c("INPUT @5 A 3. @ 10 B $CHAR2. C 4.2;")),
               structure(c("A 5-7", "B 10-11", "C 12-15"), decimals = c(C = 2L)))
})

test_that("Brazil's SAS and SPSS layouts give the same columns (GitHub #5)", {
  # The SAS file uses @ pointers; the SPSS file is GET DATA, counting from 0
  sas <- suppressMessages(parse_setup(fixture("INPUT_SAS_CENSOESC.sas.zip")))$setup
  sps <- suppressMessages(parse_setup(fixture("INPUT_SPSS_CENSOESC.SPS.zip")))$setup
  expect_equal(nrow(sas), 1307)
  expect_equal(sas$column_number, sps$column_number)
  expect_equal(sas$begin, sps$begin)
  expect_equal(sas$end, sps$end)
  expect_equal(sas[1:3, c("column_number", "begin", "end")],
               data.frame(column_number = c("MASCARA", "ANO", "CODMUNIC"),
                          begin = c(1, 9, 14), end = c(8, 13, 25)))
  expect_equal(tail(sas$end, 1), 8395)
})
