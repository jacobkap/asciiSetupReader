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
