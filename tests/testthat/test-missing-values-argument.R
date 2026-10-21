# missing_values = "all" (default), "active" or "none", and missing value
# sections that are commented out.

shr_1976_setup <- function() fixture("supplementary_homicide_reports_1976.sps.zip")
shr_1976_data  <- function() fixture("supplementary_homicide_reports_1976.zip")

sps_with_missing <- function(missing) {
  temp_file(c("* test setup file",
              "DATA LIST FILE = 'data.txt'",
              "  V1 1-2  V2 4-5  V3 7-8  V4 10-11",
              ".",
              "VARIABLE LABELS",
              "  V1 'first'",
              "  V2 'second'",
              "  V3 'third'",
              "  V4 'fourth'",
              ".",
              missing,
              "EXECUTE."), ".sps")
}
missing_data <- function() {
  temp_file(c("00 09 99 01", "05 00 98 02", "8  9  97 99"), ".txt")
}

test_that("parse_setup() says which missing values are commented out", {
  shr <- parse_setup(shr_1976_setup())$missing
  expect_named(shr, c("variable", "values", "commented"))
  expect_true(all(shr$commented))
  expect_equal(nrow(shr), 139)

  # SHR 1981 has a commented-out RECODE section and a MISSING VALUES
  # section that isn't commented out (the one used)
  shr_1981 <- parse_setup(SHR1981_sps_name)$missing
  expect_false(any(shr_1981$commented))

  weimar <- parse_setup(weimar_sps_name)$missing
  expect_true(all(weimar$commented))
  # SAS: the IF statements are inside /* */
  expect_true(all(parse_setup(weimar_sas_name)$missing$commented))
  expect_equal(nrow(parse_setup(weimar_sas_name)$missing), nrow(weimar))
})

test_that("a section is commented out only if its statement starts with *", {
  live <- parse_setup(sps_with_missing(c("MISSING VALUES", "  V1 (0)", ".")))$missing
  expect_false(any(live$commented))
  commented <- parse_setup(sps_with_missing(c("* MISSING VALUES", "  V1 (0)", ".")))$missing
  expect_true(all(commented$commented))
  no_space <- parse_setup(sps_with_missing(c("*MISSING VALUES", "  V1 (0)", ".")))$missing
  expect_true(all(no_space$commented))
  # A comment before RECODE statements doesn't make them commented out
  recode <- parse_setup(sps_with_missing(c("* SPSS MISSING VALUE RECODE *.",
                                           "RECODE V1 (0=SYSMIS).")))$missing
  expect_equal(recode$values, "0")
  expect_false(any(recode$commented))
})

test_that("both commented-out and active sections are read", {
  setup <- sps_with_missing(c("* MISSING VALUES",
                              "  V1 (0)  V2 (9)",
                              ".",
                              "MISSING VALUES",
                              "  V3 (99)  V2 (9)",
                              "."))
  missing <- parse_setup(setup)$missing
  missing <- missing[order(missing$variable), ]
  expect_equal(missing$variable, c("V1", "V2", "V3"))
  expect_equal(missing$values, c("0", "9", "99"))
  # V2's 9 is in both, so it counts as active
  expect_equal(missing$commented, c(TRUE, FALSE, FALSE))
})

test_that("missing_values chooses which missing values become NA", {
  setup <- sps_with_missing(c("* MISSING VALUES",
                              "  V1 (0)  V2 (9)",
                              ".",
                              "MISSING VALUES",
                              "  V3 (99)",
                              "."))
  all_codes <- suppressMessages(read_ascii_setup(missing_data(), setup))
  expect_equal(all_codes$first, c(NA, 5, 8))
  expect_equal(all_codes$second, c(NA, 0, NA))
  expect_equal(all_codes$third, c(NA, 98, 97))

  active <- read_ascii_setup(missing_data(), setup, missing_values = "active")
  expect_equal(active$first, c(0, 5, 8))
  expect_equal(active$second, c(9, 0, 9))
  expect_equal(active$third, c(NA, 98, 97))

  none <- read_ascii_setup(missing_data(), setup, missing_values = "none")
  expect_equal(none$first, c(0, 5, 8))
  expect_equal(none$second, c(9, 0, 9))
  expect_equal(none$third, c(99, 98, 97))

  # "all" is the default
  expect_identical(suppressMessages(read_ascii_setup(missing_data(), setup,
                                                     missing_values = "all")),
                   all_codes)
  expect_error(read_ascii_setup(missing_data(), setup, missing_values = "some"),
               "should be one of")
  expect_error(read_ascii_setup(missing_data(), setup, missing_values = TRUE))
})

test_that("missing_values works on a real file with a commented-out section", {
  # SHR 1976's MISSING VALUES section is commented out; SUB_CIRCUMSTANCE_1
  # has 0 as a missing value, which is also its most common code
  raw <- readLines(unz(shr_1976_data(), "supplementary_homicide_reports_1976.txt"))
  zeros <- substr(raw, 262, 262) == "0"
  expect_equal(sum(zeros), 570)

  all_codes <- suppressMessages(read_ascii_setup(shr_1976_data(), shr_1976_setup()))
  expect_equal(sum(is.na(all_codes$SUB_CIRCUMSTANCE_1[zeros])), 570)
  active <- read_ascii_setup(shr_1976_data(), shr_1976_setup(), missing_values = "active")
  # The column has value labels, so it's text
  expect_equal(unique(active$SUB_CIRCUMSTANCE_1[zeros]), "0")
  expect_equal(sum(is.na(active)), 0)
  none <- read_ascii_setup(shr_1976_data(), shr_1976_setup(), missing_values = "none")
  expect_identical(none, active)
})

test_that("spss_ascii_reader() and sas_ascii_reader() pass missing_values on", {
  for (mv in c("all", "active", "none")) {
    expect_identical(
      suppressMessages(spss_ascii_reader(weimar_dataset_name, weimar_sps_name,
                                         missing_values = mv)),
      suppressMessages(read_ascii_setup(weimar_dataset_name, weimar_sps_name,
                                        missing_values = mv)),
      info = mv)
    expect_identical(
      suppressMessages(sas_ascii_reader(weimar_dataset_name, weimar_sas_name,
                                        missing_values = mv)),
      suppressMessages(read_ascii_setup(weimar_dataset_name, weimar_sas_name,
                                        missing_values = mv)),
      info = mv)
  }
  weimar <- suppressMessages(read_ascii_setup(weimar_dataset_name, weimar_sps_name))
  weimar_active <- suppressMessages(read_ascii_setup(weimar_dataset_name, weimar_sps_name,
                                                     missing_values = "active"))
  expect_equal(sum(is.na(weimar$X1919_RT_NR_ELIGIBLE_VTRS)), 3)
  expect_equal(sum(is.na(weimar_active$X1919_RT_NR_ELIGIBLE_VTRS)), 0)
})

test_that("one- and two-digit missing codes match however they're padded", {
  setup <- sps_with_missing(c("MISSING VALUES",
                              "  V1 (0)  V2 (09)  V3 (9)  V4 (1)",
                              "."))
  data <- temp_file(c("00 9  09 01", "0  09 9  1 ", "05 99 99 10"), ".txt")
  out <- read_ascii_setup(data, setup, coerce_numeric = FALSE)
  expect_equal(out$first, c(NA, NA, "05"))
  expect_equal(out$second, c(NA, NA, "99"))
  expect_equal(out$third, c(NA, NA, "99"))
  expect_equal(out$fourth, c(NA, NA, "10"))
})

test_that("three-digit codes aren't padded", {
  setup <- temp_file(c("DATA LIST FILE = 'x'", "  V1 1-3", ".",
                       "VARIABLE LABELS", "  V1 'first'", ".",
                       "MISSING VALUES", "  V1 (9)", ".", "EXECUTE."), ".sps")
  data <- temp_file(c("009", "9  ", "090"), ".txt")
  out <- read_ascii_setup(data, setup, coerce_numeric = FALSE)
  expect_equal(out$first, c("009", NA, "090"))
})

test_that("labelled missing codes keep their label, as before", {
  setup <- sps_with_missing(c("VALUE LABELS",
                              "  V1 0 'none'",
                              ".",
                              "MISSING VALUES",
                              "  V1 (0)",
                              "."))
  out <- read_ascii_setup(missing_data(), setup)
  expect_equal(out$first, c("none", "05", "8"))
  out <- read_ascii_setup(missing_data(), setup, use_value_labels = FALSE)
  expect_equal(out$first, c(NA, 5, 8))
})

test_that("MISSING VALUES can list columns with TO or several names", {
  setup <- sps_with_missing(c("MISSING VALUES",
                              "  V1 TO V3 (9)  V4 (1)",
                              "."))
  missing <- parse_setup(setup)$missing
  expect_equal(missing$variable, c("V1", "V2", "V3", "V4"))
  expect_equal(missing$values, c("9", "9", "9", "1"))

  setup <- sps_with_missing(c("MISSING VALUES",
                              "  V1 V3 (9, 8)",
                              "  V4 (1)",
                              "."))
  missing <- parse_setup(setup)$missing
  expect_equal(missing$variable, c("V1", "V1", "V3", "V3", "V4"))
  expect_equal(missing$values, c("9", "8", "9", "8", "1"))

  # V2 TO V2 is just V2
  setup <- sps_with_missing(c("MISSING VALUES", "  V2 TO V2 (9)", "."))
  expect_equal(parse_setup(setup)$missing$variable, "V2")
})

test_that("a list with something that isn't a column isn't expanded", {
  expect_null(expand_to(c("V1", "TO", "V9"), c("V1", "V2")))
  expect_null(expand_to(c("V2", "TO", "V1"), c("V1", "V2")))
  expect_null(expand_to(c("TO", "V1"), c("V1", "V2")))
  expect_equal(expand_to(c("v1", "to", "V3"), c("V1", "V2", "V3")),
               c("V1", "V2", "V3"))
  expect_equal(expand_column_lists("RECODE V1 V2 (9)", c("V1", "V2")),
               "RECODE V1 V2 (9)")
  expect_equal(expand_column_lists("V1 V2 (9)", c("V1", "V2")),
               "V1 (9)   V2 (9)")
})

test_that("MISSING VALUES can start on the same line as the command", {
  setup <- sps_with_missing(c("MISSING VALUES V1 (0) V2 (9).",
                              "MISSING VALUES V3 (99)."))
  missing <- parse_setup(setup)$missing
  expect_equal(missing$variable, c("V1", "V2", "V3"))
  expect_equal(missing$values, c("0", "9", "99"))
  out <- read_ascii_setup(missing_data(), setup)
  expect_equal(out$first, c(NA, 5, 8))
  expect_equal(out$third, c(NA, 98, 97))
  # A comment that starts with the command's name isn't a section
  setup <- sps_with_missing(c("MISSING VALUES contains the program statements."))
  expect_null(parse_setup(setup)$missing)
})

test_that("SAS missing values inside /* */ are commented out", {
  sas <- function(lines) {
    temp_file(c("DATA x;", "INFILE 'x';", "INPUT", "  V1 1-2  V2 4-5", "",
                ";", "LABEL", "  V1 = 'first'", "  V2 = 'second'", ";",
                "* USER-DEFINED MISSING VALUE RECODE TO SAS SYSMIS;", "",
                lines, "", "RUN;"), ".sas")
  }
  commented <- parse_setup(sas(c("/*", "IF V1 = 0 THEN V1 = .;", "*/")))$missing
  expect_equal(commented$values, "0")
  expect_true(commented$commented)
  live <- parse_setup(sas(c("IF V1 = 0 THEN V1 = .;", "IF V2 = 9 THEN V2 = .;")))$missing
  expect_equal(live$values, c("0", "9"))
  expect_false(any(live$commented))
  # A comment that's already closed doesn't count
  closed <- parse_setup(sas(c("/* recodes below */", "IF V1 = 0 THEN V1 = .;")))$missing
  expect_false(closed$commented)

  expect_true(in_sas_comment(c("a", "/* b", "c"), 3))
  expect_false(in_sas_comment(c("a", "/* b */", "c"), 3))
  expect_true(in_sas_comment(c("a", "/* b */ /* c", "d"), 3))
  expect_true(in_sas_comment(c("a", "* IF V1 = 0 THEN V1 = .;"), 2))
})
