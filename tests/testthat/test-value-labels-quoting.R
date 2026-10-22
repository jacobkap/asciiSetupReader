# Value labels are read by their quoting: a quote character inside a label
# is part of the label, not the end of it (before 2.6.1 apostrophes became
# spaces). Each test writes a small setup file, and data file if needed.

# Writes an SPSS setup file for columns V1 (positions 1-2) and V2 (3-4)
# with the given VALUE LABELS lines and returns its path.
sps_file <- function(value_labels) {
  path <- tempfile(fileext = ".sps")
  writeLines(c("* test setup file",
               "DATA LIST FILE = 'data.txt'",
               "  V1 1-2  V2 3-4",
               ".",
               "VARIABLE LABELS",
               "  V1 'first'",
               "  V2 'second'",
               ".",
               "VALUE LABELS",
               value_labels,
               ".",
               "EXECUTE."), path)
  path
}

data_file <- function(lines) {
  path <- tempfile(fileext = ".txt")
  writeLines(lines, path)
  path
}

labels_of <- function(value_labels, column = "V1") {
  parse_setup(sps_file(value_labels))$value_labels[[column]]
}

test_that("an apostrophe inside a double-quoted label is kept", {
  expect_equal(labels_of(c("V1",
                           "'29'  \"anti-jehovah's witness\"",
                           "'99'  \"unknown (offender's motivation not known, mutually exclusive)\"",
                           "'09'  \"drug store/doctor's office/hospital\"")),
               c("anti-jehovah's witness" = "29",
                 "unknown (offender's motivation not known, mutually exclusive)" = "99",
                 "drug store/doctor's office/hospital" = "09"))
})

test_that("a doubled '' inside a single-quoted label is one apostrophe", {
  expect_equal(labels_of(c("V1  -2 'Don''t know'  1 'Sheriff''s office'",
                           "    3 'farmer, ''profits'' -- draw'")),
               c("Don't know" = "-2", "Sheriff's office" = "1",
                 "farmer, 'profits' -- draw" = "3"))
})

test_that("a double quote inside a single-quoted label is kept", {
  expect_equal(labels_of(c("V1  1 'Wife/\"Wife\"'",
                           "    2 'Twelfth grade, \"High School\", GED'")),
               c("Wife/\"Wife\"" = "1", "Twelfth grade, \"High School\", GED" = "2"))
})

test_that("an apostrophe inside a single-quoted label that isn't doubled is kept", {
  # Some files write 'Wife's' instead of 'Wife''s'
  expect_equal(labels_of("V1  1 'Head or Wife's mother'  2 'Lover's triangle'"),
               c("Head or Wife's mother" = "1", "Lover's triangle" = "2"))
})

test_that("the PSID Wife cases are read as written", {
  expect_equal(labels_of(c("V1",
                           "     1 'Head'",
                           "     2 'Wife/\"Wife\"'",
                           "     3 'Son or daughter of \"Wife\" but not Head'",
                           "     4 'Head or Wife/\"Wife''s\" age unknown'",
                           "     5 'TA head or wife/\"wife\" with most recent main job'")),
               c("Head" = "1",
                 "Wife/\"Wife\"" = "2",
                 "Son or daughter of \"Wife\" but not Head" = "3",
                 "Head or Wife/\"Wife's\" age unknown" = "4",
                 "TA head or wife/\"wife\" with most recent main job" = "5"))
})

test_that("a label that is just 'Wife' doesn't change the codes around it", {
  # The old parser's PSID 'Wife' fix turned this into a code "2 Wife 3"
  expect_equal(labels_of("V1  1 'Husband' 2 'Wife' 3 'Common-law husband'"),
               c("Husband" = "1", "Wife" = "2", "Common-law husband" = "3"))
})

test_that("codes can be single-quoted, double-quoted or bare numbers", {
  expect_equal(labels_of(c("V1  '01' 'one'  \"02\" \"two\"  3 'three'  -9 \"missing\"",
                           "    4.5 'four and a half'")),
               c("one" = "01", "two" = "02", "three" = "3", "missing" = "-9",
                 "four and a half" = "4.5"))
})

test_that("a blank code '' and a code written as a space are kept", {
  expect_equal(labels_of("V1  '' 'blank'  ' ' 'space'  '1' ''"),
               c("blank" = "", "space" = " ", "1"))
  expect_equal(names(labels_of("V1  '1' ''")), "")
})

test_that("labels end at the next variable name, with no stray ending", {
  value_labels <- c("V1",
                    "'1'  \"one\"",
                    "'2'  \"two\"",
                    "V2",
                    "'A'  \"alpha\"",
                    "'B'  \"bravo\" /")
  setup <- parse_setup(sps_file(value_labels))
  expect_equal(setup$value_labels$V1, c("one" = "1", "two" = "2"))
  expect_equal(setup$value_labels$V2, c("alpha" = "A", "bravo" = "B"))
})

test_that("labels after / and with the section ending in . have no stray text", {
  setup <- parse_setup(sps_file(c("V1  1 'one' 2 'two' /",
                                  "V2  'T' \"Totals only\" / .")))
  expect_equal(setup$value_labels$V1, c("one" = "1", "two" = "2"))
  expect_equal(setup$value_labels$V2, c("Totals only" = "T"))
})

test_that("a variable's labels written twice don't put its name in a label", {
  # As in ucr_hate_crimes_batch_header.sps (V9) and nibrs_batch_header_1.sps
  # (V42), where a block is repeated; the old parser gave "msa state police V9"
  value_labels <- c("V1",
                    "'1E'  \"msa county police\"",
                    "'9E'  \"msa state police\"",
                    "V2",
                    "'Y'   \"zero-report was submitted\"",
                    "V1",
                    "'1E'  \"msa county police\"",
                    "'9E'  \"msa state police\"",
                    "V2",
                    "'Y'   \"zero-report was submitted\"",
                    "V2",
                    "'Y'   \"zero-report was submitted\"")
  setup <- parse_setup(sps_file(value_labels))
  expect_equal(setup$value_labels$V1,
               c("msa county police" = "1E", "msa state police" = "9E"))
  expect_equal(setup$value_labels$V2, c("zero-report was submitted" = "Y"))
  expect_false(any(grepl("V1|V2", unlist(lapply(setup$value_labels, names)))))
})

test_that("a repeated block can add codes but doesn't change earlier ones", {
  setup <- parse_setup(sps_file(c("V1  '1' 'one' '2' 'two' /",
                                  "V1  '2' 'second two' '3' 'three' /")))
  expect_equal(setup$value_labels$V1, c("one" = "1", "two" = "2", "three" = "3"))
})

test_that("a label continued with + is joined", {
  expect_equal(labels_of(c("V1  1 'a long label that ' +",
                           "      'goes on' 2 \"short\"")),
               c("a long label that goes on" = "1", "short" = "2"))
})

test_that("numeric codes match the data with or without a leading zero", {
  # cdap: location code '08' with data 8, and month '1' with data 01
  # (2.6.0 already did this; this checks it still does)
  setup <- sps_file(c("V1  '08' 'department/discount store' '09' 'drug store' /",
                      "V2  '1' 'january' '2' 'february' 'A' 'alpha'"))
  data <- data_file(c(" 801", "0902", "09 A", "08 a", "77 1"))
  out <- read_ascii_setup(data, setup, coerce_numeric = FALSE)
  expect_equal(out$first, c("department/discount store", "drug store",
                            "drug store", "department/discount store", "77"))
  # A text code only matches itself ('A' doesn't label "a")
  expect_equal(out$second, c("january", "february", "alpha", "a", "january"))
})

test_that("a value with no label stays as it is in the data", {
  setup <- sps_file("V1  '01' 'one' /  V2  'A' \"alpha's\"")
  data <- data_file(c("01A ", "07B ", "99Z "))
  out <- read_ascii_setup(data, setup, coerce_numeric = FALSE)
  expect_equal(out$first, c("one", "07", "99"))
  expect_equal(out$second, c("alpha's", "B", "Z"))
})

test_that("apostrophes survive make_sps_setup() and read_ascii_setup()", {
  file_name <- file.path(tempdir(), "apostrophe_round_trip")
  make_sps_setup(file_name,
                 col_positions = c("1-2", "3-4"),
                 col_names = c("V1", "V2"),
                 col_labels = c("bias", "location"),
                 value_labels = c("V1 = ",
                                  "29 = anti-jehovah's witness",
                                  "99 = unknown (offender's motivation not known)",
                                  "V2 = ",
                                  "09 = drug store/doctor's office/hospital",
                                  "08 = department/discount store"))
  data <- data_file(c("2909", "9908", "29 8"))
  out <- read_ascii_setup(data, paste0(file_name, ".sps"))
  expect_equal(out$bias, c("anti-jehovah's witness",
                           "unknown (offender's motivation not known)",
                           "anti-jehovah's witness"))
  expect_equal(out$location, c("drug store/doctor's office/hospital",
                               "department/discount store",
                               "department/discount store"))
  unlink(paste0(file_name, ".sps"))
})

# SAS -------------------------------------------------------------------------

# Writes a SAS setup file for V1 (positions 1-2, format biasf) and V2
# (3-4, format $locf) with the given VALUE statement lines.
sas_file <- function(value_lines) {
  path <- tempfile(fileext = ".sas")
  writeLines(c("* test setup file;",
               "PROC FORMAT;",
               value_lines,
               "",
               "DATA;",
               "INFILE 'data.txt';",
               "INPUT",
               "        V1 1-2              V2 $ 3-4",
               ";",
               "",
               "LABEL",
               "   V1 = 'bias'",
               "   V2 = 'location'",
               ";",
               "",
               "FORMAT",
               "   V1 biasf. V2 $locf.",
               ";"), path)
  path
}

test_that("SAS labels keep apostrophes in either quoting", {
  setup <- parse_setup(sas_file(c("VALUE biasf  29=\"anti-jehovah's witness\"",
                                  "             99='unknown (offender''s motivation not known)';",
                                  "VALUE $locf  '09'=\"drug store/doctor's office/hospital\"",
                                  "             '01'='Twelfth grade, \"High School\", GED';")))
  expect_equal(setup$value_labels$V1,
               c("anti-jehovah's witness" = "29",
                 "unknown (offender's motivation not known)" = "99"))
  expect_equal(setup$value_labels$V2,
               c("drug store/doctor's office/hospital" = "09",
                 "Twelfth grade, \"High School\", GED" = "01"))
})

test_that("SAS labels keep ; and = and can continue over lines", {
  setup <- parse_setup(sas_file(c("VALUE biasf  9 = 'NA; DK'",
                                  "             0 = 'Inap.: (ER30003=0); born after the 1980'",
                                  "                 'interview'",
                                  "             1 - 5 = 'one to five';",
                                  "VALUE $locf  'A'='alpha';")))
  expect_equal(setup$value_labels$V1,
               c("NA; DK" = "9",
                 "Inap.: (ER30003=0); born after the 1980 interview" = "0",
                 "one to five" = "1 - 5"))
  expect_equal(setup$value_labels$V2, c("alpha" = "A"))
})

test_that("SAS format options like (default=30) are skipped", {
  setup <- parse_setup(sas_file(c("VALUE biasf (default=30) 1='one';",
                                  "VALUE $locf (default=30) 'A'=\"alpha's\";")))
  expect_equal(setup$value_labels$V1, c("one" = "1"))
  expect_equal(setup$value_labels$V2, c("alpha's" = "A"))
})

test_that("SAS labels are applied to the data, with apostrophes", {
  setup <- sas_file(c("VALUE biasf  29=\"anti-jehovah's witness\";",
                      "VALUE $locf  '09'=\"doctor's office\";"))
  data <- data_file(c("2909", "1 77", "29 9"))
  out <- read_ascii_setup(data, setup, coerce_numeric = FALSE)
  expect_equal(out$bias, c("anti-jehovah's witness", "1", "anti-jehovah's witness"))
  # 9 gets the label of code '09'; 77 has no label
  expect_equal(out$location, c("doctor's office", "77", "doctor's office"))
})
