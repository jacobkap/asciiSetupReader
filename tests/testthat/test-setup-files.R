# Setup files from GitHub issues and other layouts: clear errors for files
# that can't be read, Latin-1 files, SPSS GET DATA and SAS formatted input.

test_that("a delimited GET DATA file gives a clear error (GitHub #13)", {
  expect_error(parse_setup(fixture("delimited_get_data.sps")),
               "delimited data file .*read.delim",
               class = "asciiSetupReader_delimited")
  expect_error(read_ascii_setup(tempfile(), fixture("delimited_get_data.sps")),
               class = "asciiSetupReader_delimited")
  expect_error(parse_setup(fixture("delimited_get_data.sps")), class = "asciiSetupReader_error")
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

test_that("a setup file that isn't UTF-8 is read as Windows-1252 with a message", {
  expect_message(sas <- parse_setup(fixture("INPUT_SAS_CENSOESC.sas.zip")),
                 "'INPUT_SAS_CENSOESC.sas.zip' isn't valid UTF-8 text, so it was read as Windows-1252",
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

  # Windows-1252's curly quote (byte 0x92) and dash (0x96) are read as such,
  # not as invisible control characters
  cp1252 <- file.path(dir, "cp1252.sps")
  con <- file(cp1252, "wb")
  writeBin(c(charToRaw("DATA LIST FILE = 'x'\n  V1 1-2\n.\nVALUE LABELS\n  V1 1 'Don"),
             as.raw(0x92), charToRaw("t know "), as.raw(0x96),
             charToRaw(" refused'\n.\nEXECUTE.\n")), con)
  close(con)
  expect_message(parsed <- parse_setup(cp1252), class = "asciiSetupReader_encoding")
  expect_equal(names(parsed$value_labels$V1), "Don’t know – refused")

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
  # IBM: GET DATA doesn't read implied decimals, so F4.1 doesn't make 0125
  # into 12.5
  expect_equal(parsed$decimals, c(0, 0, 0))
  expect_equal(read_setup(setup)$text_columns, "NAME")
  data <- temp_file(c("01Maria0125", "02Joao 0990"), ".txt")
  expect_silent(out <- read_ascii_setup(data, setup))
  expect_equal(out$ID, c(1, 2))
  expect_equal(out$NAME, c("Maria", "Joao"))
  expect_equal(out$RATE, c(125, 990))
})

test_that("DATA LIST positions are never shifted, even with GET DATA in a comment", {
  # "DATA LIST" not at the start of its line
  setup <- temp_file(c("FILE HANDLE IN /NAME='x.txt'. DATA LIST FILE=IN FIXED /",
                       "V1 1-2 V2 3-4 .", "VARIABLE LABELS", "V1 'a'", "V2 'b'",
                       ".", "EXECUTE."), ".sps")
  expect_equal(parse_setup(setup)$setup$begin, c(1, 3))
  setup <- temp_file(c("* GET DATA is not used here.", "DATA LIST FILE='x' /",
                       "V1 1-2 V2 3-4 .", "EXECUTE."), ".sps")
  expect_equal(parse_setup(setup)$setup$begin, c(1, 3))
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
               structure(c("A 5-7", "B 10-11", "C 12-15"), decimals = c(C = 2L),
                         text = "B"))
})

test_that("SAS formatted input handles spaced ranges and named informats", {
  out <- formatted_input("INPUT @1 Z 1 - 3 @4 P S370FPD4. T TIME8.2 M COMMA6.2 D MMDDYY8. @@;")
  expect_equal(as.vector(out), c("Z 1-3", "P 4-7", "T 8-15", "M 16-21", "D 22-29"))
  # Only numeric informats (COMMA6.2) imply decimal places; TIME8.2 doesn't
  expect_equal(attr(out, "decimals"), c(M = 2L))
})

test_that("SAS INPUT the package can't read stops with a clear error", {
  expect_error(formatted_input("INPUT #1 @1 A 2. #2 @1 B 2.;"),
               "several lines \\(records\\) per case",
               class = "asciiSetupReader_unsupported_input")
  expect_error(formatted_input("INPUT @1 (Q1-Q3) (1.);"),
               "can't read this part of the SAS INPUT statement: '\\(Q1-Q3\\)'",
               class = "asciiSetupReader_unsupported_input")
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
