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

test_that("a later VALUE LABELS command replaces a variable's labels, as in SPSS", {
  # IBM: VALUE LABELS "deletes all existing value labels" for its variables
  labels <- labels_of(c("VALUE LABELS",
                        "  V1 1 'yes' 2 'no' / V2 1 'one'",
                        ".",
                        "VALUE LABELS",
                        "  V1 1 'Yes' 3 'maybe'",
                        "."))
  expect_equal(labels$V1, c(Yes = "1", maybe = "3"))
  expect_equal(labels$V2, c(one = "1"))
  # ADD VALUE LABELS after it still adds
  labels <- labels_of(c("VALUE LABELS V1 1 'yes'.",
                        "VALUE LABELS V1 2 'no'.",
                        "ADD VALUE LABELS V1 3 'maybe'."))
  expect_equal(labels$V1, c(no = "2", maybe = "3"))
  # and a later VALUE LABELS drops what ADD VALUE LABELS added before it
  labels <- labels_of(c("VALUE LABELS V1 1 'yes'.",
                        "ADD VALUE LABELS V1 3 'maybe'.",
                        "VALUE LABELS V1 2 'no'."))
  expect_equal(labels$V1, c(no = "2"))
})

test_that("replaced labels are reported only when they were different", {
  setup <- sps_with_labels(c("VALUE LABELS",
                             "  V1 1 'yes' 2 'no' / V2 1 'one'",
                             ".",
                             "VALUE LABELS",
                             "  V1 1 'Yes' / V2 1 'one'",
                             "."))
  expect_equal(read_setup(setup)$replaced_labels, "V1")
  data <- temp_file(c("1112", "2121"), ".txt")
  expect_message(out <- read_ascii_setup(data, setup), paste0(
    "In '", basename(setup), "', 1 column has value labels in more than one ",
    "VALUE LABELS command, with different labels; as in SPSS, only the last ",
    "command's labels are used: first. parse_setup()$value_labels shows the ",
    "labels used."), fixed = TRUE, class = "asciiSetupReader_replaced_labels")
  expect_equal(out$first, c("Yes", "2"))
  # Short names when use_clean_names = FALSE; none when labels aren't used
  # or the column isn't read
  expect_message(read_ascii_setup(data, setup, use_clean_names = FALSE),
                 "are used: V1\\.")
  expect_silent(read_ascii_setup(data, setup, use_value_labels = FALSE))
  expect_silent(read_ascii_setup(data, setup, select_columns = 2:4))
  # The same labels written twice drop nothing, so no message
  same <- sps_with_labels(c("VALUE LABELS V1 1 'yes'.", "VALUE LABELS V1 1 'yes'."))
  expect_length(read_setup(same)$replaced_labels, 0)
  expect_silent(read_ascii_setup(data, same))
})

test_that("a VALUE LABELS section ends where another command ends", {
  # "FORMATS V1 (F2.0)." used to leave V1 open, so V1 got V2's labels too
  labels <- labels_of(c("VALUE LABELS",
                        "  V1 1 'one' 2 'two'",
                        ".",
                        "FORMATS V1 (F2.0).",
                        "VALUE LABELS",
                        "  V2 3 'three'",
                        "."))
  expect_equal(labels$V1, c(one = "1", two = "2"))
  expect_equal(labels$V2, c(three = "3"))
})

test_that("a commented-out VALUE LABELS between others is skipped", {
  labels <- labels_of(c("VALUE LABELS",
                        "  V1 1 'one'",
                        ".",
                        "* VALUE LABELS",
                        "  V1 5 'commented five'",
                        ".",
                        "VALUE LABELS",
                        "  V2 3 'three'",
                        "."))
  expect_equal(labels$V1, c(one = "1"))
  expect_equal(labels$V2, c(three = "3"))
  expect_equal(drop_comment_commands(c("a", "* note", "more", "end.", "b", "*x", "", "c")),
               c("a", "b", "c"))
})

test_that("a variable can be called VALUE or LABELS", {
  setup <- temp_file(c("DATA LIST FILE = 'x'", "  AGE 1  VALUE 2  LABELS 3", ".",
                       "VARIABLE LABELS", "  AGE 'Age'", "  VALUE 'Value'",
                       "  LABELS 'Labels'", ".",
                       "VALUE LABELS",
                       "  AGE 1 'young' /",
                       "  VALUE 1 'Low' 2 'High' /",
                       "  LABELS 1 'Some'",
                       "."), ".sps")
  labels <- parse_setup(setup)$value_labels
  expect_equal(labels$AGE, c(young = "1"))
  expect_equal(labels$VALUE, c(Low = "1", High = "2"))
  expect_equal(labels$LABELS, c(Some = "1"))
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
