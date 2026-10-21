# Clean column names: "=" inside a label, "%", names made unique with the
# column's short name, and labels with no letters or digits.

all_setup_files <- function() {
  files <- list.files(system.file("testdata", package = "asciiSetupReader"),
                      pattern = "[.](sps|sas)$|_(sps|sas)[.]zip$",
                      ignore.case = TRUE, full.names = TRUE)
  # This one is broken on purpose (see test-error.R)
  files <- files[!grepl("starting_number_bigger_than_ending_number", files)]
  c(files, list.files(system.file("extdata", package = "asciiSetupReader"),
                      pattern = "[.](sps|sas)$", full.names = TRUE))
}

test_that("every test setup file gives unique column names", {
  skip_on_cran()
  files <- all_setup_files()
  expect_gt(length(files), 100)
  for (f in files) {
    names <- suppressMessages(parse_setup(f))$setup$column_name
    expect_equal(anyDuplicated(tolower(names)), 0, info = basename(f))
    expect_false(any(is.na(names) | names == ""), info = basename(f))
  }
})

test_that("a repeated name gets the column's short name added", {
  property <- parse_setup(property_stolen_sps_name)$setup
  clothing <- property$column_name[grepl("^CLOTHING", property$column_name)]
  expect_length(clothing, 24)
  expect_equal(clothing[1:4], c("CLOTHING", "CLOTHING_V93", "CLOTHING_V174",
                                "CLOTHING_V186"))
  expect_equal(property$column_name[property$column_number == "V81"], "CLOTHING")
  property_sas <- parse_setup(property_stolen_sas_name)$setup
  expect_equal(property_sas$column_name[grepl("^CLOTHING", property_sas$column_name)],
               clothing)

  cambridge <- parse_setup(cambridge_sps_name)$setup
  interviewer <- cambridge[grepl("^INTERVIEWER", cambridge$column_name), ]
  expect_equal(interviewer$column_name[1:3],
               c("INTERVIEWER", "INTERVIEWER_V266", "INTERVIEWER_V420"))
  expect_equal(interviewer$column_number[1], "V128")

  sadc <- parse_setup(sadc_sps_name)$setup
  expect_equal(sadc$column_name[sadc$column_number %in% c("Q28", "QN28")],
               c("Attempted_suicide", "Attempted_suicide_QN28"))
})

test_that("PSID's repeated labels get each wave's variable name", {
  skip_on_cran()
  psid <- parse_setup(system.file("testdata", "psid_main_sps.zip",
                                  package = "asciiSetupReader"))$setup
  release <- psid[grepl("^RELEASE_NUMBER", psid$column_name), ]
  expect_equal(release$column_name[1:3],
               c("RELEASE_NUMBER", "RELEASE_NUMBER_TA050001",
                 "RELEASE_NUMBER_TA070001"))
  expect_equal(release$column_number[1], "ER30000")
})

test_that("unique_names() handles case, three or more repeats and clashes", {
  setup <- data.frame(column_number = c("V1", "V2", "V3", "V4", "V5"),
                      column_name = c("AGE", "age", "AGE", "SEX", "Sex"))
  renamed <- unique_names(setup)
  expect_equal(renamed$column_number, c("V2", "V3", "V5"))
  expect_equal(renamed$name, c("age", "AGE", "Sex"))
  expect_equal(renamed$column_name, c("age_V2", "AGE_V3", "Sex_V5"))

  expect_null(unique_names(data.frame(column_number = c("V1", "V2"),
                                      column_name = c("a", "b"))))

  # The new name is already another column's name
  setup <- data.frame(column_number = c("V1", "V2", "V3"),
                      column_name = c("AGE", "AGE", "AGE_V2"))
  renamed <- unique_names(setup)
  expect_equal(renamed$column_name, "AGE_V2_2")
  names <- setup$column_name
  names[match(renamed$column_number, setup$column_number)] <- renamed$column_name
  expect_equal(anyDuplicated(tolower(names)), 0)
})

test_that("select_columns accepts the unique names", {
  data <- temp_file(c("01 02 03", "04 05 06"), ".txt")
  setup <- temp_file(c("DATA LIST FILE = 'x'", "  V1 1-2  V2 4-5  V3 7-8", ".",
                       "VARIABLE LABELS", "  V1 'AGE'", "  V2 'AGE'", "  V3 'SEX'",
                       ".", "EXECUTE."), ".sps")
  out <- suppressMessages(read_ascii_setup(data, setup))
  expect_named(out, c("AGE", "AGE_V2", "SEX"))
  out <- suppressMessages(read_ascii_setup(data, setup, select_columns = "AGE_V2"))
  expect_named(out, "AGE_V2")
  expect_equal(out$AGE_V2, c(2, 5))
  out <- read_ascii_setup(data, setup, use_clean_names = FALSE)
  expect_named(out, c("V1", "V2", "V3"))
})

test_that("an = inside a label is kept in the name", {
  cambridge <- parse_setup(cambridge_sps_name)$setup
  expect_equal(cambridge$column_name[cambridge$column_number %in% c("V139", "V140")],
               c("SEP_FROM_FATHER_under_OR_5", "SEP_FROM_MOTHER_under_OR_5"))
  cambridge_sas <- parse_setup(cambridge_sas_name)$setup
  expect_equal(cambridge_sas$column_name[cambridge_sas$column_number == "V139"],
               "SEP_FROM_FATHER_under_OR_5")
  sadc <- parse_setup(sadc_sas_name)$setup
  expect_equal(sadc$column_name[sadc$column_number == "qcoffeetea"],
               "Coffee_tea_drinking_over_1_time_day")
  expect_equal(fix_names('V1 = "Age < = 5"'), "Age_5")
  expect_equal(fix_names('V1 "Age = 5"'), "Age_5")
  # parse_column_names() puts spaces around every "=" before fix_names(), so
  # indonesia's HHID='HHID(=case)' arrives like this (2.6.0 gave "case")
  expect_equal(fix_names("HHID = 'HHID( = case)'"), "HHID_case")
  setup <- temp_file(c("DATA x;", "INFILE 'x';", "INPUT", "  HHID 1-9", "", ";",
                       "LABEL", "  HHID='HHID(=case)'", ";"), ".sas")
  expect_equal(parse_setup(setup)$setup$column_name, "HHID_case")
  # Only the column's short name and the first " = " or ' "' are removed
  expect_equal(fix_names('V1 = "a = b = c"'), "a_b_c")
})

test_that("% becomes _percent_", {
  weimar <- parse_setup(weimar_sps_name)$setup
  expect_equal(weimar$column_name[weimar$column_number %in% c("V7", "V22", "V23")],
               c("X1919_RT_percent_VOTES_CAST", "X1919_RT_OTHER_PARTIES",
                 "X1919_RT_percent_OTHER_PARTIES"))
  expect_equal(parse_setup(weimar_sas_name)$setup$column_name, weimar$column_name)
})

test_that("runs of punctuation become one _", {
  setup <- temp_file(c("DATA LIST FILE = 'x'", "  V1 1  V2 2  V3 3  V4 4", ".",
                       "VARIABLE LABELS",
                       "  V1 'FAM SIZE - OVERCROWDING'",
                       "  V2 'ACTIVITY--HW'",
                       "  V3 '-TOTAL LARCENY -- USED'",
                       "  V4 'WHAT?!'",
                       ".", "EXECUTE."), ".sps")
  expect_equal(parse_setup(setup)$setup$column_name,
               c("FAM_SIZE_OVERCROWDING", "ACTIVITY_HW", "TOTAL_LARCENY_USED", "WHAT"))
})

test_that("a label with no letters or digits keeps the short name", {
  setup <- temp_file(c("DATA LIST FILE = 'x'", "  V1 1  V2 2  V3 3", ".",
                       "VARIABLE LABELS",
                       "  V1 'first'",
                       "  V2 '...'",
                       "  V3 'third'",
                       ".", "EXECUTE."), ".sps")
  # The empty name used to end the list, leaving V3 without its name
  expect_equal(parse_setup(setup)$setup$column_name, c("first", "V2", "third"))
})
