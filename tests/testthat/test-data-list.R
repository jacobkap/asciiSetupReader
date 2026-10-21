# SPSS DATA LIST (and GET DATA) column positions, read token by token so the
# spacing and layout of the command don't matter.

data_list <- function(...) {
  temp_file(c("DATA LIST FILE = 'x'", ..., "EXECUTE."), ".sps")
}
positions <- function(setup) {
  s <- parse_setup(setup)$setup
  stats::setNames(paste0(s$begin, "-", s$end), s$column_number)
}

test_that("tightly spaced columns are read", {
  setup <- data_list("/AA 1-4(A) BB 5-8(A) CC 9-10(2) DD 11", ".")
  expect_equal(positions(setup), c(AA = "1-4", BB = "5-8", CC = "9-10", DD = "11-11"))
  expect_equal(read_setup(setup)$text_columns, c("AA", "BB"))
  expect_equal(parse_setup(setup)$setup$decimals, c(0, 0, 2, 0))
})

test_that("formats and decimals are read wherever they are on the line", {
  setup <- data_list("/V1 1-5 (F,2) V2 6-7 V3 8 (A) V4 9-12 (COMMA,1)", ".")
  expect_equal(positions(setup), c(V1 = "1-5", V2 = "6-7", V3 = "8-8", V4 = "9-12"))
  expect_equal(parse_setup(setup)$setup$decimals, c(2, 0, 0, 1))
  expect_equal(read_setup(setup)$text_columns, "V3")
})

test_that("columns can start on the DATA LIST line or after a record number", {
  same_line <- temp_file(c("DATA LIST FILE = 'x' FIXED /V1 1-2 V2 3-4.", "EXECUTE."), ".sps")
  expect_equal(positions(same_line), c(V1 = "1-2", V2 = "3-4"))
  record <- temp_file(c("data list file = 'x' records = 1 / 1 V1 1-2", "  V2 3-4", "."), ".sps")
  expect_equal(positions(record), c(V1 = "1-2", V2 = "3-4"))
  # No "/" at all
  no_slash <- temp_file(c("DATA LIST FILE = 'x' SKIP = 2", "  V1 1-2 V2 3-4", "."), ".sps")
  expect_equal(positions(no_slash), c(V1 = "1-2", V2 = "3-4"))
  expect_equal(read_setup(no_slash)$skip, 2)
})

test_that("a name and its position can be on different lines, with any spacing", {
  setup <- data_list("/V1", "1-2", "V2 3 -  5   V3 6- 7", "V4", "8", ".")
  expect_equal(positions(setup), c(V1 = "1-2", V2 = "3-5", V3 = "6-7", V4 = "8-8"))
})

test_that("comments, names with @ # $ and a missing period are handled", {
  setup <- data_list("/AGE 1-2 /* in years */ @ID 3-5 #N 6 $X 7-8 (A)",
                     "VARIABLE LABELS AGE 'Age' /@ID 'ID'", ".")
  expect_equal(positions(setup), c(AGE = "1-2", `@ID` = "3-5", `#N` = "6-6", `$X` = "7-8"))
  expect_equal(parse_setup(setup)$setup$column_name[1], "Age")
})

test_that("the command ends at its period", {
  # Numbers in the labels on the next line aren't read as positions
  setup <- data_list("/V1 1-2 V2 3-4 .", "VARIABLE LABELS V1 'Age in 1-2' V2 'Sex 3'", ".")
  expect_equal(positions(setup), c(V1 = "1-2", V2 = "3-4"))
  expect_equal(parse_setup(setup)$setup$column_name, c("Age_in_1_2", "Sex_3"))
})

test_that("names listed before one range share it equally, as in SPSS", {
  expect_equal(positions(data_list("/A B C 1-6", ".")), c(A = "1-2", B = "3-4", C = "5-6"))
  expect_equal(positions(data_list("/Q1 TO Q3 3-5 Z 6", ".")),
               c(Q1 = "3-3", Q2 = "4-4", Q3 = "5-5", Z = "6-6"))
  expect_equal(positions(data_list("/V08 TO V10 1-6", ".")),
               c(V08 = "1-2", V09 = "3-4", V10 = "5-6"))
  expect_error(parse_setup(data_list("/A B 1-5", ".")), "can't be shared equally",
               class = "asciiSetupReader_unsupported_input")
  expect_error(parse_setup(data_list("/Q1 TO R3 1-6", ".")), "isn't a numbered list",
               class = "asciiSetupReader_unsupported_input")
})

test_that("DATA LIST forms the package can't read stop with clear errors", {
  expect_error(parse_setup(data_list("/V1 1-2 V2", ".")), "V2 has no column position",
               class = "asciiSetupReader_unsupported_input")
  expect_error(parse_setup(data_list("/V1 1-2 'x' 3-4", ".")), "isn't a name",
               class = "asciiSetupReader_unsupported_input")
  expect_error(parse_setup(data_list("/V1 1-2 3-4", ".")), "3-4 has no name",
               class = "asciiSetupReader_unsupported_input")
  free <- temp_file(c("DATA LIST FREE FILE = 'x' / V1 V2", "."), ".sps")
  expect_error(parse_setup(free), "delimited", class = "asciiSetupReader_delimited")
  list_file <- temp_file(c("DATA LIST LIST / V1 V2", "."), ".sps")
  expect_error(parse_setup(list_file), "DATA LIST LIST", class = "asciiSetupReader_delimited")
})

test_that("GET DATA columns count from 0, with A formats as text", {
  setup <- temp_file(c("GET DATA /TYPE = TXT", "/FILE = 'x.txt'", "/ARRANGEMENT = FIXED",
                       "/FIRSTCASE = 3", "/VARIABLES =", "/1 NAME 0-9 A10",
                       "AGE 10-11 F2.0", "RATE 12-15 F4.1", "."), ".sps")
  expect_equal(positions(setup), c(NAME = "1-10", AGE = "11-12", RATE = "13-16"))
  expect_equal(read_setup(setup)$text_columns, "NAME")
  expect_equal(parse_setup(setup)$setup$decimals, c(0, 0, 0))
  expect_equal(read_setup(setup)$skip, 2)
})

test_that("SKIP is read only from the DATA LIST command", {
  setup <- data_list("/V1 1-2", ".", "* SKIP = 5 isn't this file's.")
  expect_equal(read_setup(setup)$skip, 0)
})

# Found by the independent review of the DATA LIST reader

test_that("GET DATA formats without a width (AUTO) and A... date formats are read", {
  setup <- temp_file(c("GET DATA /TYPE = TXT", "/FILE = 'x.txt'", "/VARIABLES =",
                       "V1 0-1 AUTO", "V2 2-11 ADATE10", "V3 12-13 AHEX4",
                       "V4 V5 14-17 F2.0", "."), ".sps")
  expect_equal(positions(setup), c(V1 = "1-2", V2 = "3-12", V3 = "13-14",
                                   V4 = "15-16", V5 = "17-18"))
  expect_equal(read_setup(setup)$text_columns, "V3")
})

test_that("GET DATA /VARIABLES= without spaces is read", {
  setup <- temp_file(c("GET DATA /TYPE=TXT /FILE='x.txt' /ARRANGEMENT=FIXED",
                       "/VARIABLES=", "/1 V1 0-1 A2", "V2 2-5 F4.0", "."), ".sps")
  expect_equal(positions(setup), c(V1 = "1-2", V2 = "3-6"))
})

test_that("names with . and $ keep their decimals and text flags", {
  setup <- data_list("/Q.1 1-2 Q.2 3-4 (2) V.3 5-6 (A) V$4 7-8 (A)", ".")
  expect_equal(positions(setup), c(Q.1 = "1-2", Q.2 = "3-4", V.3 = "5-6", `V$4` = "7-8"))
  expect_equal(parse_setup(setup)$setup$decimals, c(0, 2, 0, 0))
  expect_equal(read_setup(setup)$text_columns, c("V.3", "V$4"))
})

test_that("each bare / starts the next record, so two of them stop with an error", {
  expect_error(parse_setup(data_list("/ V1 1-2", "/ V2 3-4", ".")),
               "several lines \\(records\\) per case",
               class = "asciiSetupReader_unsupported_input")
  # "/" then "/1" is still the first record
  expect_equal(positions(data_list("/", "/1 V1 1-2", ".")), c(V1 = "1-2"))
})

test_that("SKIP inside a quoted file name isn't the SKIP option", {
  setup <- temp_file(c("DATA LIST FILE='C:\\SKIP=3\\x.dat' /V1 1-2."), ".sps")
  expect_equal(read_setup(setup)$skip, 0)
})

test_that("a comment mentioning DATA LIST isn't taken for the command", {
  setup <- temp_file(c("* The DATA LIST below reads the file.",
                       "FILE HANDLE IN /NAME = 'x.txt'. DATA LIST FILE = IN /V1 1-2 V2 3-4.",
                       "EXECUTE."), ".sps")
  expect_equal(positions(setup), c(V1 = "1-2", V2 = "3-4"))
})

test_that("a missing period ends DATA LIST at the next command", {
  for (command in c("VARIABLE LEVEL V1 (SCALE).", "FREQUENCIES V1.", "STRING V3 (A2).",
                    "BEGIN DATA")) {
    setup <- data_list("/V1 1-2 V2 3-4", command)
    expect_equal(positions(setup), c(V1 = "1-2", V2 = "3-4"))
  }
  # A variable named like a command, followed by its position, is a column
  expect_equal(positions(data_list("/V1 1-2", "TITLE 3-30", ".")),
               c(V1 = "1-2", TITLE = "3-30"))
})
