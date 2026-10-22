# Missing value ranges (SPSS "97 THRU 99", "97 THRU HI", "LO THRU -1"; SAS
# ">=", "<=", "GE ... AND LE ...") are compared with the data as numbers.

read_with_missing <- function(data_lines, setup_lines, ext) {
  data <- temp_file(data_lines, ".txt")
  setup <- temp_file(setup_lines, ext)
  suppressMessages(read_ascii_setup(data, setup))
}
sps_missing <- function(missing, positions = "/V1 1-3 V2 4-5") {
  c("DATA LIST FILE = 'x'", positions, ".", missing, "EXECUTE.")
}
sas_missing <- function(missing, positions = "V1 1-3 V2 4-5") {
  c("DATA x;", "INFILE 'x';", paste0("INPUT ", positions, ";"), missing, "RUN;")
}

test_that("a range no value falls in doesn't stop the read", {
  data <- c("00101", "00302")
  for (missing in c("MISSING VALUES V1 (97 THRU HI).", "MISSING VALUES V1 (LO THRU -1).",
                    "MISSING VALUES V1 (1000000 THRU 9999999).",
                    "MISSING VALUES V1 (97 THRU 99).")) {
    out <- read_with_missing(data, sps_missing(missing), ".sps")
    expect_equal(out$V1, c(1, 3), label = missing)
  }
  for (missing in c("IF V1 >= 97 THEN V1 = .;", "IF V1 <= -1 THEN V1 = .;",
                    "IF V1 GE 97 AND V1 LE 99 THEN V1 = .;")) {
    out <- read_with_missing(data, sas_missing(missing), ".sas")
    expect_equal(out$V1, c(1, 3), label = missing)
  }
})

test_that("a range in a text column with no value in it doesn't stop the read", {
  out <- read_with_missing(c("ab01", "cd02"),
                           sps_missing("MISSING VALUES V2 (97 THRU HI).", "/V1 1-2 (A) V2 3-4"),
                           ".sps")
  expect_equal(out$V2, c(1, 2))
})

test_that("an empty column with a range doesn't stop the read", {
  out <- read_with_missing(c("001  ", "002  "), sps_missing("MISSING VALUES V2 (97 THRU HI)."),
                           ".sps")
  expect_equal(out$V1, c(1, 2))
  expect_true(all(is.na(out$V2)))
})

test_that("values between whole numbers in a range are missing too", {
  # 975 with one implied decimal place is 97.5, inside 97 THRU 99; 99.5
  # is outside it
  data <- c("975  ", "985  ", "995  ", "1001 ", "0965 ")
  spss <- read_with_missing(data, sps_missing("MISSING VALUES V1 (97 THRU 99).",
                                              "/V1 1-4 (1) V2 5"), ".sps")
  expect_equal(spss$V1, c(NA, NA, 99.5, 100.1, 96.5))
  sas <- read_with_missing(data, sas_missing("IF V1 >= 97 AND V1 <= 99 THEN V1 = .;",
                                             "V1 1-4 .1 V2 5"), ".sas")
  expect_equal(sas$V1, c(NA, NA, 99.5, 100.1, 96.5))
})

test_that("ranges match zero-padded values and their ends", {
  out <- read_with_missing(c("09701", "09902", "09603", "10004"),
                           sps_missing("MISSING VALUES V1 (97 THRU 99)."), ".sps")
  expect_equal(out$V1, c(NA, NA, 96, 100))
})

test_that("parse_setup() still lists a range of whole numbers value by value", {
  setup <- temp_file(sps_missing("MISSING VALUES V1 (7 THRU 9) V2 (99.5 THRU 99.9)."), ".sps")
  missing <- parse_setup(setup)$missing
  expect_equal(missing$values[missing$variable == "V1"], c("7", "8", "9"))
  expect_equal(missing$values[missing$variable == "V2"], "99.5 THRU 99.9")
})

test_that("a range and a text code in one file give no coercion warnings", {
  setup <- temp_file(sps_missing("MISSING VALUES V1 (1 THRU 5) V2 ('X')."), ".sps")
  expect_no_warning(parse_setup(setup))
})

test_that("real setup files whose data has no missing codes are read", {
  # Both stopped with "'names' attribute must be the same length as the
  # vector" when no value fell in one of their missing value ranges
  for (f in c("ncvs_1979_sps.zip", "monitoring_the_future_1979_sps.zip")) {
    setup <- test_path("testdata", f)
    width <- max(suppressMessages(parse_setup(setup))$setup$end)
    data <- temp_file(rep(strrep("1", width), 3), ".txt")
    out <- suppressMessages(read_ascii_setup(data, setup))
    expect_equal(nrow(out), 3, label = f)
  }
})
