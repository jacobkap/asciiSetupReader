# Implied decimal places: "V7 37-43 (1)" (SPSS) or "V7 37-43 .1" (SAS) means
# a value of 0000785 is 78.5.

sps_with_decimals <- function(data_list, value_labels = NULL, missing = NULL) {
  temp_file(c("* test setup file",
              "DATA LIST FILE = 'data.txt'",
              data_list,
              ".",
              "VARIABLE LABELS",
              "  V1 'id'",
              "  V2 'rate'",
              "  V3 'weight'",
              ".",
              value_labels,
              missing,
              "EXECUTE."), ".sps")
}

test_that("parse_decimals() reads SPSS (d), (F,d) and Fw.d specs", {
  expect_equal(parse_decimals(c("V1 1-2   V2 3-9 (1)   V3 10-14 (3)"), "sps"),
               c(V2 = 1L, V3 = 3L))
  expect_equal(parse_decimals("V1 1-2 (F,2)", "sps"), c(V1 = 2L))
  expect_equal(parse_decimals("MASCARA 0-7 F8.2   ANO 8-12 F5.0", "sps"),
               c(MASCARA = 2L))
  # (A) is a text column and (0) has no decimal places
  expect_length(parse_decimals("V1 1-2 (A)   V2 3-4 (0)   V3 5-6", "sps"), 0)
  # Spaces inside the position are allowed
  expect_equal(parse_decimals("V1 1 - 5 (2)", "sps"), c(V1 = 2L))
  # A one-column variable can have them too
  expect_equal(parse_decimals("V9 12 (1)", "sps"), c(V9 = 1L))
})

test_that("parse_decimals() reads SAS .d informats", {
  expect_equal(parse_decimals(c("V13 31-31   V14 32-35 .3   V15 36-40"), "sas"),
               c(V14 = 3L))
  expect_equal(parse_decimals("V1 1-2 .1  V2 $ 3-4  V3 5-8 .2", "sas"),
               c(V1 = 1L, V3 = 2L))
  expect_length(parse_decimals("V1 1-2   V2 $ 3-8", "sas"), 0)
})

test_that("parse_setup() gives each column's decimal places", {
  weimar <- parse_setup(weimar_sps_name)$setup
  expect_equal(weimar$decimals[weimar$column_number %in% c("V5", "V6", "V7", "V11", "V23")],
               c(0, 0, 1, 1, 1))
  expect_equal(sum(weimar$decimals > 0), 8)
  # Comparing the columns by name, so a missing decimals column is an error
  # rather than NULL equalling NULL
  expect_equal(parse_setup(weimar_sas_name)$setup[, c("column_number", "decimals")],
               weimar[, c("column_number", "decimals")])

  jail <- parse_setup(jail_1987_sps_name)$setup
  expect_equal(jail$decimals[jail$column_number == "V14"], 3)
  expect_equal(sum(jail$decimals > 0), 1)
  expect_equal(parse_setup(jail_1987_sas_name)$setup[, c("column_number", "decimals")],
               jail[, c("column_number", "decimals")])

  # Files without implied decimals have 0 for every column
  expect_equal(unique(parse_setup(SHR_sps_name)$setup$decimals), 0)
  expect_equal(unique(parse_setup(SHR_sas_name)$setup$decimals), 0)
})

test_that("add_decimal_point() puts the point d places from the right", {
  expect_equal(add_decimal_point("0000785", 1), "000078.5")
  expect_equal(add_decimal_point("1000", 3), "1.000")
  expect_equal(add_decimal_point("5", 2), "0.05")
  expect_equal(add_decimal_point("123", 3), "0.123")
  expect_equal(add_decimal_point("-12", 1), "-1.2")
  expect_equal(add_decimal_point("+7", 1), "+0.7")
  expect_equal(add_decimal_point(c("10", "250"), 2), c("0.10", "2.50"))
})

test_that("read_ascii_setup() applies implied decimals to real files", {
  weimar_raw <- substr(readLines(weimar_dataset_name), 37, 43)
  expect_equal(weimar_raw[1:3], c("0000785", "0000584", "0000809"))
  weimar <- allow_messages(read_ascii_setup(weimar_dataset_name, weimar_sps_name,
                                            use_clean_names = FALSE))
  expect_equal(weimar$V7[1:3], c(78.5, 58.4, 80.9))
  weimar_text <- allow_messages(read_ascii_setup(weimar_dataset_name, weimar_sps_name,
                                                 use_clean_names = FALSE,
                                                 coerce_numeric = FALSE))
  expect_equal(weimar_text$V7[1:3], c("000078.5", "000058.4", "000080.9"))
  # Columns without implied decimals are unchanged
  expect_equal(weimar_text$V6[1], substr(readLines(weimar_dataset_name)[1], 30, 36))

  weimar_sas <- allow_messages(read_ascii_setup(weimar_dataset_name, weimar_sas_name,
                                                use_clean_names = FALSE))
  expect_equal(weimar_sas$V7, weimar$V7)

  jail <- allow_messages(read_ascii_setup(jail_1987_dataset_name, jail_1987_sps_name,
                                          use_clean_names = FALSE))
  expect_equal(jail$V14[1:4], c(1, 4, 4, 7.024))
  jail_sas <- allow_messages(read_ascii_setup(jail_1987_dataset_name, jail_1987_sas_name,
                                              use_clean_names = FALSE))
  expect_equal(jail_sas$V14, jail$V14)
})

test_that("values that already have a decimal point, blanks and text are kept", {
  data <- temp_file(c("01 12.5 00100", "02   15 00200", "03      00300", "04 abcd 00400"),
                    ".txt")
  setup <- sps_with_decimals("  V1 1-2  V2 4-7 (1)  V3 9-13 (2)")
  out <- suppressMessages(read_ascii_setup(data, setup, coerce_numeric = FALSE))
  expect_equal(out$rate, c("12.5", "1.5", NA, "abcd"))
  expect_equal(out$weight, c("001.00", "002.00", "003.00", "004.00"))
  out <- suppressMessages(read_ascii_setup(data, setup))
  expect_equal(out$weight, c(1, 2, 3, 4))
})

test_that("value labels of a column with implied decimals match by value", {
  # The setup file gives the codes as numbers with the decimal point
  data <- temp_file(c("01 0010 00100", "02 0020 00200", "03 0035 99999"), ".txt")
  setup <- sps_with_decimals("  V1 1-2  V2 4-7 (1)  V3 9-13 (2)",
                             value_labels = c("VALUE LABELS",
                                              "  V2 1.0 'one'  2.0 'two' /",
                                              "  V3 999.99 'unknown'",
                                              "."))
  out <- suppressMessages(read_ascii_setup(data, setup))
  # The column has text labels so it stays text; the unlabelled value keeps
  # its zero-padding
  expect_equal(out$rate, c("one", "two", "003.5"))
  expect_equal(out$weight, c("001.00", "002.00", "unknown"))
})

test_that("missing values of a column with implied decimals match by value", {
  data <- temp_file(c("01 0010 00100", "02 0090 -0900", "03 0035 00300"), ".txt")
  setup <- sps_with_decimals("  V1 1-2  V2 4-7 (1)  V3 9-13 (2)",
                             missing = c("MISSING VALUES",
                                         "  V2 (9.0)  V3 (-9)",
                                         "."))
  out <- suppressMessages(read_ascii_setup(data, setup))
  expect_equal(out$rate, c(1, NA, 3.5))
  expect_equal(out$weight, c(1, NA, 3))
})

test_that("SAS implied decimals work the same way", {
  data <- temp_file(c("01 0010 00100", "02 0020 00250"), ".txt")
  setup <- temp_file(c("DATA x;",
                       "INFILE 'data.txt';",
                       "INPUT",
                       "  V1 1-2  V2 4-7 .1  V3 $ 9-13",
                       "",
                       ";",
                       "LABEL",
                       "  V1 = 'id'",
                       "  V2 = 'rate'",
                       "  V3 = 'code'",
                       ";"), ".sas")
  expect_equal(parse_setup(setup)$setup$decimals, c(0, 1, 0))
  out <- suppressMessages(read_ascii_setup(data, setup, coerce_numeric = FALSE))
  expect_equal(out$rate, c("001.0", "002.0"))
  expect_equal(out$code, c("00100", "00250"))
})
