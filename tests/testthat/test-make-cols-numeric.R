test_that("a rare text value in a large file keeps the column character", {
  # Before 2.6.0 only a sample of rows was checked in files over 50,000 rows,
  # so rare text values could be silently turned into NA.
  column <- as.character(seq_len(120000) %% 97)
  column[c(17, 119999)] <- c("A1", "B2")
  data <- make_cols_numeric(data.table::data.table(x = column, y = column))
  expect_type(data$x, "character")
  expect_equal(data$x[c(17, 119999)], c("A1", "B2"))
})

test_that("all-numeric columns are converted and NAs are kept", {
  data <- make_cols_numeric(data.table::data.table(x = c("1", NA, "-2.5", "10"),
                                                   y = c("a", "1", "2", "3")))
  expect_equal(data$x, c(1, NA, -2.5, 10))
  expect_type(data$y, "character")
})

test_that("text after the first 1,000 rows keeps the column character", {
  column <- as.character(1:5000)
  column[4000] <- "text"
  data <- make_cols_numeric(data.table::data.table(x = column))
  expect_type(data$x, "character")
})

test_that("bytes that are invalid in the locale don't cause an error", {
  column <- as.character(1:100)
  column[50] <- "12\xff"
  expect_no_error(data <- make_cols_numeric(data.table::data.table(x = column)))
  expect_type(data$x, "character")
})

test_that("converting columns doesn't change the random number stream", {
  set.seed(1)
  expected <- stats::runif(1)
  set.seed(1)
  make_cols_numeric(data.table::data.table(x = as.character(1:60000)))
  expect_identical(stats::runif(1), expected)
})
