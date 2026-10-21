# SPSS VALUE LABELS for lists of variables (V1 V2, V1 TO V3), on the
# command's line, ADD VALUE LABELS and commented-out sections.

sps_with_labels <- function(value_labels) {
  temp_file(c("* test setup file",
              "DATA LIST FILE = 'data.txt'",
              "  V1 1  V2 2  V3 3  V4 4",
              ".",
              "VARIABLE LABELS",
              "  V1 'first'",
              "  V2 'second'",
              "  V3 'third'",
              "  V4 'fourth'",
              ".",
              value_labels,
              "EXECUTE."), ".sps")
}
labels_of <- function(value_labels) parse_setup(sps_with_labels(value_labels))$value_labels

test_that("a list of variables shares the pairs that follow it", {
  labels <- labels_of(c("VALUE LABELS",
                        "  V1 V3 1 'yes' 2 'no' /",
                        "  V2 1 'one'",
                        "."))
  expect_equal(labels$V1, c(yes = "1", no = "2"))
  expect_equal(labels$V3, c(yes = "1", no = "2"))
  expect_equal(labels$V2, c(one = "1"))
  expect_null(labels$V4)
})

test_that("V1 TO V3 gives the pairs to every variable from V1 to V3", {
  labels <- labels_of(c("VALUE LABELS",
                        "  V1 TO V3 1 'yes' 2 'no' /",
                        "  V4 9 'missing'",
                        "."))
  expect_named(labels, c("V1", "V2", "V3", "V4"))
  for (v in c("V1", "V2", "V3")) expect_equal(labels[[v]], c(yes = "1", no = "2"))
  expect_equal(labels$V4, c(missing = "9"))
  # Lower case "to" and a list that mixes both
  labels <- labels_of(c("VALUE LABELS", "  V1 v2 to V4 1 'yes'", "."))
  expect_named(labels, c("V1", "V2", "V3", "V4"))
})

test_that("the first variable can be on the VALUE LABELS line", {
  labels <- labels_of(c("VALUE LABELS V1 1 'yes' 2 'no'",
                        "  /V2 1 'one'."))
  expect_equal(labels$V1, c(yes = "1", no = "2"))
  expect_equal(labels$V2, c(one = "1"))
  labels <- labels_of(c("VALUE LABELS V1 TO V2 1 'yes'."))
  expect_equal(labels$V2, c(yes = "1"))
})

test_that("ADD VALUE LABELS adds pairs and changes existing labels", {
  labels <- labels_of(c("VALUE LABELS",
                        "  V1 1 'yes' 2 'no'",
                        ".",
                        "ADD VALUE LABELS",
                        "  V1 2 'No answer' 3 'maybe' /",
                        "  V2 1 'one'",
                        "."))
  expect_equal(labels$V1, c(yes = "1", "No answer" = "2", maybe = "3"))
  expect_equal(labels$V2, c(one = "1"))
  labels <- labels_of(c("VALUE LABELS V1 1 'yes'.",
                        "ADD VALUE LABELS V1 1 'Yes!'."))
  expect_equal(labels$V1, c("Yes!" = "1"))
})

test_that("a variable repeated in plain VALUE LABELS keeps its first labels", {
  # As in 2.6.1: later copies only add codes (see test-value-labels-quoting.R)
  labels <- labels_of(c("VALUE LABELS",
                        "  V1 1 'yes' 2 'no' /",
                        "  V1 2 'other' 3 'maybe'",
                        "."))
  expect_equal(labels$V1, c(yes = "1", no = "2", maybe = "3"))
})

test_that("commented-out VALUE LABELS are skipped", {
  expect_null(labels_of(c("* VALUE LABELS", "  V1 1 'yes'", ".")))
  expect_null(labels_of(c("* VALUE LABELS V1 1 'yes'.")))
  # A comment that starts with the command's name isn't a section
  expect_null(labels_of(c("VALUE LABELS contains the labels.")))
})

test_that("the labels are applied to every listed variable's data", {
  setup <- sps_with_labels(c("VALUE LABELS", "  V1 TO V3 1 'yes' 2 'no'", "."))
  data <- temp_file(c("1212", "2121"), ".txt")
  out <- read_ascii_setup(data, setup)
  expect_equal(out$first, c("yes", "no"))
  expect_equal(out$second, c("no", "yes"))
  expect_equal(out$third, c("yes", "no"))
  expect_equal(out$fourth, c(2, 1))
})
