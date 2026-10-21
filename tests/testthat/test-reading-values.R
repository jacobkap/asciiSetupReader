# How values are read: blanks, "NA" and "." in text and number columns,
# value labels matched by number, and lines skipped before the first case.

sps_file <- function(data_list, rest = NULL) {
  temp_file(c("DATA LIST FILE = 'x'", data_list, ".",
              "VARIABLE LABELS", "  V1 'code'", "  V2 'number'", ".",
              rest, "EXECUTE."), ".sps")
}

test_that("labels of number columns match by value, of text columns by text", {
  setup <- sps_file("  V1 1-3 (A)  V2 4-10",
                    c("VALUE LABELS", "  V1 '1' 'one' / V2 0 'Not updated' 12 'twelve'", "."))
  data <- temp_file(c("0010000000", "01 0000012", "1  1960001"), ".txt")
  out <- read_ascii_setup(data, setup)
  expect_equal(out$number, c("Not updated", "twelve", "1960001"))
  # Text: "001" isn't "1" (the 1- and 2-digit padding rule still applies)
  expect_equal(out$code, c("001", "one", "one"))
})

