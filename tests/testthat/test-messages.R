# Every message read_ascii_setup() and parse_setup() can give: its text, its
# classes, and the cases where it must not appear.

message_texts <- function(found) vapply(found, conditionMessage, character(1))
message_classes <- function(found) vapply(found, function(m) class(m)[1], character(1))

test_that("messages have the package's classes", {
  found <- messages_from(read_ascii_setup(weimar_dataset_name, weimar_sps_name))
  expect_equal(message_classes(found),
               c("asciiSetupReader_implied_decimals",
                 "asciiSetupReader_commented_missing"))
  for (m in found) {
    expect_s3_class(m, c("asciiSetupReader_message", "message", "condition"))
    expect_null(conditionCall(m))
  }
})

test_that("the implied decimals message lists every column and its places", {
  found <- messages_from(read_ascii_setup(weimar_dataset_name, weimar_sps_name))
  expect_equal(message_texts(found)[1], paste0(
    "In 'weimar_sps.zip', 8 columns have implied decimal places, so a decimal ",
    "point was added to values without one (e.g. X1919_RT_percent_VOTES_CAST: ",
    "\"0000785\" became \"000078.5\"). Columns (decimal places): ",
    "X1919_RT_percent_VOTES_CAST (1), X1919_RT_percent_GERMNAT_PP (1), ",
    "X1919_RT_percent_GERM_P_PARTY (1), X1919_RT_percent_CHRIST_P_PARTY (1), ",
    "X1919_RT_percent_GERMDEM_PTY (1), X1919_RT_percent_SOCDEM_PARTY (1), ",
    "X1919_RT_percent_IND_SOCDEM_PTY (1), X1919_RT_percent_OTHER_PARTIES (1).\n"))

  # With use_clean_names = FALSE it uses the names the data has
  found <- messages_from(read_ascii_setup(weimar_dataset_name, weimar_sps_name,
                                          use_clean_names = FALSE))
  expect_equal(message_texts(found)[1], paste0(
    "In 'weimar_sps.zip', 8 columns have implied decimal places, so a decimal ",
    "point was added to values without one (e.g. V7: \"0000785\" became ",
    "\"000078.5\"). Columns (decimal places): V7 (1), V11 (1), V13 (1), ",
    "V15 (1), V17 (1), V19 (1), V21 (1), V23 (1).\n"))

  # One column, so "column has"
  found <- messages_from(read_ascii_setup(jail_1987_dataset_name, jail_1987_sps_name))
  expect_equal(message_texts(found), paste0(
    "In 'jail_survey_1987.sps', 1 column has implied decimal places, so a ",
    "decimal point was added to values without one (e.g. WEIGHT: \"1000\" ",
    "became \"1.000\"). Columns (decimal places): WEIGHT (3).\n"))
  expect_equal(message_classes(found), "asciiSetupReader_implied_decimals")

  # coerce_numeric = FALSE gives the same message
  found <- messages_from(read_ascii_setup(jail_1987_dataset_name, jail_1987_sps_name,
                                          coerce_numeric = FALSE))
  expect_match(message_texts(found), "1 column has implied decimal places")
})

test_that("the implied decimals message is only given when values change", {
  # Only columns without implied decimals selected
  expect_silent(read_ascii_setup(jail_1987_dataset_name, jail_1987_sps_name,
                                 select_columns = 1:5))
  # Every value already has a decimal point, or is blank
  data <- temp_file(c("01 12.5", "02     "), ".txt")
  setup <- temp_file(c("DATA LIST FILE = 'x'", "  V1 1-2  V2 4-7 (1)", ".",
                       "VARIABLE LABELS", "  V1 'id'", "  V2 'rate'", ".",
                       "EXECUTE."), ".sps")
  expect_silent(out <- read_ascii_setup(data, setup))
  expect_equal(out$rate, c(12.5, NA))
  # Only the columns whose values changed are listed
  data <- temp_file(c("01 12.5 0025", "02 13.5 0030"), ".txt")
  setup <- temp_file(c("DATA LIST FILE = 'x'", "  V1 1-2  V2 4-7 (1)  V3 9-12 (2)",
                       ".", "VARIABLE LABELS", "  V1 'id'", "  V2 'rate'",
                       "  V3 'share'", ".", "EXECUTE."), ".sps")
  expect_message(read_ascii_setup(data, setup),
                 "1 column has implied .*Columns \\(decimal places\\): share \\(2\\)\\.",
                 class = "asciiSetupReader_implied_decimals")
})

test_that("the commented-out missing values message gives the line and counts", {
  # Line 77 of weimar's setup file is "* MISSING VALUES"
  expect_equal(trimws(readr::read_lines(weimar_sps_name)[77]), "* MISSING VALUES")
  found <- messages_from(read_ascii_setup(weimar_dataset_name, weimar_sps_name))
  expect_equal(message_texts(found)[2], paste0(
    "In 'weimar_sps.zip', the missing values starting on line 77 are commented ",
    "out, but they were still set to NA, as in earlier versions: 3 values in 1 ",
    "column (X1919_RT_NR_ELIGIBLE_VTRS). Use missing_values = \"active\" to only ",
    "use missing values that aren't commented out, or missing_values = \"none\" ",
    "to use none.\n"))

  # SAS: line 87 is the "/*" before the IF statements' first line
  expect_message(read_ascii_setup(weimar_dataset_name, weimar_sas_name),
                 "the missing values starting on line [0-9]+ are commented out",
                 class = "asciiSetupReader_commented_missing")

  # Many values and columns: numbers get commas
  shr <- messages_from(read_ascii_setup(fixture("supplementary_homicide_reports_1976.zip"),
                                        fixture("supplementary_homicide_reports_1976.sps.zip"),
                                        use_value_labels = FALSE))
  shr <- message_texts(shr)[message_classes(shr) == "asciiSetupReader_commented_missing"]
  expect_match(shr, "starting on line 1721 are commented out")
  expect_match(shr, "71,574 values in 128 columns")
  # Only the first 20 columns are listed
  expect_match(shr, "and 108 more\\)")
})

test_that("the commented-out missing values message isn't given when not needed", {
  for (mv in c("active", "none")) {
    found <- messages_from(read_ascii_setup(weimar_dataset_name, weimar_sps_name,
                                            missing_values = mv))
    expect_equal(message_classes(found), "asciiSetupReader_implied_decimals", info = mv)
  }
  # The commented-out codes aren't in the columns read
  found <- messages_from(read_ascii_setup(weimar_dataset_name, weimar_sps_name,
                                          select_columns = 1:4))
  expect_length(found, 0)
  # Missing values that aren't commented out give no message
  expect_silent(read_ascii_setup(parole_survey_dataset_name, parole_sps_name))
})

test_that("the unique names message lists the renamed columns", {
  data <- temp_file(c("01 02 03 04", "05 06 07 08"), ".txt")
  setup <- temp_file(c("DATA LIST FILE = 'x'", "  V1 1-2  V2 4-5  V3 7-8  V4 10-11",
                       ".", "VARIABLE LABELS", "  V1 'AGE'", "  V2 'AGE'",
                       "  V3 'SEX'", "  V4 'age'", ".", "EXECUTE."), ".sps")
  expect_message(read_ascii_setup(data, setup), paste0(
    "In '", basename(setup), "', 2 columns have the same name as an earlier ",
    "column, so the column's short name was added to make each name unique: ",
    "V2 -> AGE_V2, V4 -> age_V4. parse_setup() shows every column's name."),
    fixed = TRUE, class = "asciiSetupReader_unique_names")
  # Not with the short names, and only for columns that are read
  expect_silent(read_ascii_setup(data, setup, use_clean_names = FALSE))
  expect_silent(read_ascii_setup(data, setup, select_columns = c(1, 3)))
  expect_message(read_ascii_setup(data, setup, select_columns = 1:2),
                 "1 column has the same name as an earlier column")
  # parse_setup() doesn't give the message; its result shows the names
  expect_silent(parse_setup(setup))
})

test_that("long lists of renamed columns are shortened", {
  skip_on_cran()
  data <- temp_file(strrep("1", 30), ".txt")
  setup <- temp_file(c("DATA LIST FILE = 'x'",
                       paste0("  V", 1:30, " ", 1:30),
                       ".", "VARIABLE LABELS",
                       paste0("  V", 1:30, " 'SAME'"),
                       ".", "EXECUTE."), ".sps")
  expect_message(out <- read_ascii_setup(data, setup),
                 "29 columns .* V21 -> SAME_V21 and 9 more\\.")
  expect_equal(names(out)[1:3], c("SAME", "SAME_V2", "SAME_V3"))
})

test_that("all of the package's messages can be silenced together", {
  expect_silent(allow_messages(read_ascii_setup(weimar_dataset_name, weimar_sps_name)))
  expect_silent(suppressMessages(read_ascii_setup(weimar_dataset_name, weimar_sps_name)))
  # And one kind at a time
  found <- messages_from(allow_messages(
    read_ascii_setup(weimar_dataset_name, weimar_sps_name),
    classes = "asciiSetupReader_implied_decimals"))
  expect_equal(message_classes(found), "asciiSetupReader_commented_missing")
})

test_that("list_items() shortens long lists", {
  expect_equal(list_items(c("a", "b")), "a, b")
  expect_equal(list_items(letters[1:22], max = 20),
               paste0(paste(letters[1:20], collapse = ", "), " and 2 more"))
  expect_equal(list_items(character(0)), "")
})

test_that("inform() and abort() signal classed conditions", {
  expect_message(inform("test_kind", "a ", "b"), "^a b\n$", class = "asciiSetupReader_test_kind")
  expect_error(abort("test_kind", "x"), "^x$", class = "asciiSetupReader_test_kind")
  expect_error(abort("test_kind", "x"), class = "asciiSetupReader_error")
})
