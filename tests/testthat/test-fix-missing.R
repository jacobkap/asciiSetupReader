make_data <- function() {
  data.table::data.table(a = c("0", "5", "9", "50", "90", "99", NA, "abc"),
                         b = c("x", "7", "3", "-1", "y", "7", NA, "z"))
}

test_that("listed missing values become NA", {
  missing <- data.frame(variable = c("a", "b", "b"), values = c("5", "x", "7"))
  data <- fix_missing(make_data(), missing)
  expect_equal(data$a, c("0", NA, "9", "50", "90", "99", NA, "abc"))
  expect_equal(data$b, c(NA, NA, "3", "-1", "y", NA, NA, "z"))
})

test_that("'thru highest' makes the bound and all higher numbers NA", {
  # The bound (90) is also in the data; this used to error with
  # "`labels` must be unique".
  missing <- data.frame(variable = c("a", "a"), values = c("9", "90 thru highest"))
  data <- fix_missing(make_data(), missing)
  expect_equal(data$a, c("0", "5", NA, "50", NA, NA, NA, "abc"))
})

test_that("'THRU HI' is matched regardless of case", {
  missing <- data.frame(variable = "a", values = "95 THRU HI")
  data <- fix_missing(make_data(), missing)
  expect_equal(data$a, c("0", "5", "9", "50", "90", NA, NA, "abc"))
})

test_that("'thru highest' matches zero-padded values", {
  data <- data.table::data.table(V6 = c("0000003", "0000009", "0000012", "0000000"))
  missing <- data.frame(variable = c("V6", "V6"),
                        values = c("0000009 THRU HI", "0000000"))
  expect_equal(fix_missing(data, missing)$V6, c("0000003", NA, NA, NA))
})

test_that("LO, LOW and LOWEST THRU make the bound and all lower numbers NA", {
  for (keyword in c("LO", "LOW", "LOWEST", "lowest")) {
    data <- data.table::data.table(a = c("-5", "00", "03", "99", "x"))
    missing <- data.frame(variable = "a", values = paste(keyword, "THRU 0"))
    expect_equal(fix_missing(data, missing)$a, c(NA, NA, "03", "99", "x"),
                 info = keyword)
  }
})

test_that("a column can have both an open-low and an open-high range", {
  data <- data.table::data.table(a = c("-5", "0", "3", "97", "99"))
  missing <- data.frame(variable = c("a", "a"),
                        values = c("LO THRU -1", "98 THRU HI"))
  expect_equal(fix_missing(data, missing)$a, c(NA, "0", "3", "97", NA))
})

test_that("open-ended ranges are read from a setup file", {
  dir <- tempfile()
  dir.create(dir)
  writeLines(c("-5 9", "00 9", "03 8", "99 7"), file.path(dir, "data.txt"))
  writeLines(c("* test setup file",
               "DATA LIST FILE = 'data.txt'",
               "  V1 1-2  V2 4",
               ".",
               "VARIABLE LABELS",
               "  V1 'first'",
               "  V2 'second'",
               ".",
               "MISSING VALUES",
               "   V1 (LO THRU 0)       V2 (8 THRU HI)",
               ".",
               "EXECUTE."), file.path(dir, "setup.sps"))
  data <- read_ascii_setup(file.path(dir, "data.txt"), file.path(dir, "setup.sps"))
  expect_equal(data$first, c(NA, NA, 3, 99))
  expect_equal(data$second, c(NA, NA, NA, 7))
  unlink(dir, recursive = TRUE)
})
