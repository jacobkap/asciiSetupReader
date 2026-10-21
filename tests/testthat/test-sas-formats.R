# SAS FORMAT statements, VALUE statements (code lists, ranges, formats in
# any case or defined twice) and ATTRIB FORMAT=.

sas_with_formats <- function(format_statement, value_statements,
                             input = "  V1 1  V2 2  V3 3  V4 4") {
  temp_file(c("DATA x;", "INFILE 'x';", "INPUT", input, ";",
              "PROC FORMAT;", value_statements, "",
              format_statement, "RUN;"), ".sas")
}
labels_of_sas <- function(...) parse_setup(sas_with_formats(...))$value_labels

test_that("one format can be given to a list of columns", {
  labels <- labels_of_sas("FORMAT V1 V2 YNF. V4 ZF.;",
                          c("VALUE YNF 1 = 'Yes' 2 = 'No';", "VALUE ZF 9 = 'Nine';"))
  expect_equal(labels$V1, c(Yes = "1", No = "2"))
  expect_equal(labels$V2, c(Yes = "1", No = "2"))
  expect_null(labels$V3)
  expect_equal(labels$V4, c(Nine = "9"))
})

test_that("numbered and positional column lists are expanded", {
  labels <- labels_of_sas("FORMAT V1-V3 YNF.;", "VALUE YNF 1 = 'Yes';")
  expect_named(labels, c("V1", "V2", "V3"))
  labels <- labels_of_sas("FORMAT V2--V4 YNF.;", "VALUE YNF 1 = 'Yes';")
  expect_named(labels, c("V2", "V3", "V4"))
  expect_equal(sas_variable_list("V1-V3", c("V1", "V2", "V3")), c("V1", "V2", "V3"))
  expect_equal(sas_variable_list("V2--V3", c("V1", "V2", "V3")), c("V2", "V3"))
  expect_equal(sas_variable_list("AGE", c("AGE")), "AGE")
  # A range written with a different prefix isn't a numbered list
  expect_equal(sas_variable_list("V1-X3", c("V1")), "V1-X3")
})

test_that("formats without a VALUE statement don't take labels", {
  # "8.2" used to split the statement at its "." and lose V2's format
  labels <- labels_of_sas("FORMAT V1 8.2  V2 V2F.  V3 DATE9.;", "VALUE V2F 1 = 'one';")
  expect_named(labels, "V2")
  expect_equal(labels$V2, c(one = "1"))
})

test_that("format names and VALUE match in any case and spacing", {
  labels <- labels_of_sas("FORMAT V1 V1F. V2 V2F. V3 $V3F.;",
                          c("value v1f 1 = 'one';", "Value  V2F 2 = 'two';",
                            "VALUE $v3f 'A' = 'Alpha';"))
  expect_equal(labels$V1, c(one = "1"))
  expect_equal(labels$V2, c(two = "2"))
  expect_equal(labels$V3, c(Alpha = "A"))
})

test_that("ATTRIB ... FORMAT= links a column to a format", {
  setup <- temp_file(c("DATA x;", "INFILE 'x';", "INPUT", "  V1 1  V2 2", ";",
                       "PROC FORMAT;", "VALUE V1F 1 = 'one';", "",
                       "ATTRIB V1 LABEL = \"Age\" FORMAT = V1F.  V2 LENGTH = 8;", "RUN;"), ".sas")
  expect_equal(parse_setup(setup)$value_labels$V1, c(one = "1"))
})

test_that("a list of codes gives each code the label", {
  labels <- labels_of_sas("FORMAT V1 NF. V2 $CF.;",
                          c("VALUE NF 1, 2, 3 = 'Low' 4 = 'High';",
                            "VALUE $CF 'A', 'B' = 'Early' 'C,D' = 'Comma';"))
  expect_equal(labels$V1, c(Low = "1", Low = "2", Low = "3", High = "4"))
  # A comma inside quotes is part of the code
  expect_equal(labels$V2, c(Early = "A", Early = "B", Comma = "C,D"))
  expect_equal(sas_code_list(c("1,", "2", ",3"), c(FALSE, FALSE, FALSE)), c("1", "2", "3"))
  expect_equal(sas_code_list(c("1", "-", "5"), c(FALSE, FALSE, FALSE)), "1 - 5")
})

test_that("value ranges and OTHER aren't applied, with a message", {
  setup <- sas_with_formats("FORMAT V1 HF. V2 OF.;",
                            c("VALUE HF 0 = 'None' 1 - 7 = 'Some hours' 8 = 'DK';",
                              "VALUE OF 1 = 'one' OTHER = 'Valid';"),
                            input = "  V1 1  V2 2")
  ranges <- read_setup(setup)$label_ranges
  expect_equal(paste(ranges$column, ranges$code), c("V1 1 - 7", "V2 OTHER"))
  data <- temp_file(c("01", "52", "81"), ".txt")
  found <- messages_from(out <- read_ascii_setup(data, setup, use_clean_names = FALSE))
  expect_equal(vapply(found, function(m) class(m)[1], ""), "asciiSetupReader_label_ranges")
  expect_match(conditionMessage(found[[1]]),
               "2 columns have value labels for ranges of values, which weren't applied")
  expect_match(conditionMessage(found[[1]]), "V1 1 - 7 = \"Some hours\", V2 OTHER = \"Valid\"",
               fixed = TRUE)
  # Real numbers in a range are kept; exact codes get their labels
  expect_equal(out$V1, c("None", "5", "DK"))
  expect_equal(out$V2, c("one", "2", "one"))
  expect_silent(read_ascii_setup(data, setup, use_value_labels = FALSE))
  expect_equal(is_sas_range(c("1 - 97", "1-5", "-9 - -1", "LOW - 0", "5 <- HIGH",
                              "LOW-<5", "OTHER", "-9", "10", "A-B")),
               c(TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE))
})

test_that("PSID's ranges are listed, not applied", {
  skip_on_cran()
  psid <- read_setup(test_path("testdata", "psid_main_sas.zip"))
  expect_equal(nrow(psid$label_ranges), 728)
  expect_equal(length(unique(psid$label_ranges$column)), 611)
  hours <- psid$label_ranges[psid$label_ranges$column == "ER30029", ]
  expect_equal(hours$code, "1 - 97")
  expect_equal(hours$label, "Actual hours spent")
})

test_that("a format defined twice uses the later definition, as in SAS", {
  setup <- sas_with_formats("FORMAT V1 YNF.;",
                            c("VALUE YNF 1 = 'Old one' 2 = 'Old two';",
                              "VALUE YNF 1 = 'one';"),
                            input = "  V1 1")
  expect_equal(parse_setup(setup)$value_labels$V1, c(one = "1"))
  data <- temp_file(c("1", "2"), ".txt")
  expect_message(out <- read_ascii_setup(data, setup, use_clean_names = FALSE),
                 "a format defined in more than one VALUE statement.*as in SAS",
                 class = "asciiSetupReader_replaced_labels")
  expect_equal(out$V1, c("one", "2"))
})

# Found by the 3.0.0 challenge review

test_that("ATTRIB with LABEL before FORMAT, with no spaces, keeps the format", {
  labels <- labels_of_sas(c("ATTRIB V1 LABEL='Sex' FORMAT=SEXF.",
                            "       V2 LABEL=\"Age; in years\" LENGTH=8 FORMAT=AGEF.;"),
                          c("VALUE SEXF 1 = 'Male' 2 = 'Female';", "VALUE AGEF 9 = 'Unknown';"))
  expect_equal(labels$V1, c(Male = "1", Female = "2"))
  expect_equal(labels$V2, c(Unknown = "9"))
})

test_that("numbered lists keep zero padding and can have _ and digits in the prefix", {
  expect_equal(sas_variable_list("Q08-Q10", character(0)), c("Q08", "Q09", "Q10"))
  expect_equal(sas_variable_list("A1_1-A1_3", character(0)), c("A1_1", "A1_2", "A1_3"))
  expect_equal(sas_variable_list("V99999-V100001", character(0)),
               c("V99999", "V100000", "V100001"))
  labels <- labels_of_sas("FORMAT Q08-Q10 YNF.;", "VALUE YNF 1 = 'Yes' 2 = 'No';",
                          input = "  Q08 1  Q09 2  Q10 3")
  expect_equal(names(labels), c("Q08", "Q09", "Q10"))
})
