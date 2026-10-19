# Value labels on real setup files and data. The setup files are the cdap
# project's layouts for public FBI data; the data files are small extracts
# of the 2024 FBI master files:
#
# fixtures/ucr_hate_crimes_incident_report.sps with
#   hate_crimes_2024_incident_report.txt: "IR" records from
#   2024_HC_NATIONAL_MASTER_FILE.txt. 30 labels have an apostrophe
#   ("anti-jehovah's witness", "unknown (offender's motivation ...)",
#   "drug store/doctor's office/hospital"); includes every record with bias
#   code 29 (99 isn't used in 2024) and records with location 09 and 08.
#   Location codes are written '08' in the setup file.
# fixtures/ucr_hate_crimes_batch_header.sps with
#   hate_crimes_2024_batch_header.txt: "BH" records from the same file, up to
#   8 of each population group (V9). V9's labels are written twice in the
#   setup file, which used to give "msa state police V9".
# fixtures/nibrs_offense_segment.sps with nibrs_2024_offense_segment.txt:
#   offense segment ("02") records from 2024_NIBRS_NATIONAL_MASTER_FILE.txt,
#   including ones with location 09 and bias 29 or 99 (3 labels with an
#   apostrophe).
# fixtures/nibrs_batch_header_1.sps with nibrs_2024_batch_header.txt: batch
#   header ("BH") records from the same file, including ones with a "Y"
#   January zero-report flag (V42), whose labels are written three times
#   (used to give "zero-report was submitted V42").
# fixtures/arrests_monthly_header_1980_present.sps with
#   arrests_2024_monthly_header.txt: monthly header records (character 1 is
#   3, characters 18-20 are 000) from 2024_ASRMONTHLY_NATIONAL_MASTER_FILE.txt,
#   15 for each month. Months are written '1'-'12'; the data has 01-12.
#
# The tests don't use the package's parser to find the expected labels: the
# cdap files write each pair on its own line as 'code' "label", so they're
# read here with a simple pattern, and every cell's expected value is worked
# out from the raw record text.

fixture <- function(name) test_path("fixtures", name)

# The code/label pairs written in a cdap setup file, by variable. The first
# time a variable's pairs are written is used (repeated blocks are copies).
written_labels <- function(setup_file) {
  lines <- trimws(readLines(setup_file))
  start <- grep("^value labels$", lines, ignore.case = TRUE)
  end <- start + which(lines[(start + 1):length(lines)] == ".")[1]
  lines <- lines[(start + 1):(end - 1)]
  lines <- lines[lines != ""]
  is_variable <- grepl("^V[0-9]+$", lines)
  is_pair <- grepl("^'[^']*' +\"[^\"]*\"$", lines)
  stopifnot(all(is_variable | is_pair))  # every line has one of the 2 forms
  variable <- lines[is_variable][cumsum(is_variable)]
  pairs <- data.frame(variable = variable[is_pair],
                      code = sub("^'([^']*)'.*", "\\1", lines[is_pair]),
                      label = sub("^'[^']*' +\"([^\"]*)\"$", "\\1", lines[is_pair]))
  pairs <- pairs[!duplicated(pairs[c("variable", "code")]), ]
  split(stats::setNames(pairs$label, pairs$code), pairs$variable)
}

# What a column should hold: the label of the value's code, where a one- or
# two-digit number also matches its 0-padded or unpadded form ("8" and "08",
# "01" and "1"), and otherwise the value as it is.
expected_column <- function(raw, labels) {
  key <- function(x) {
    number <- !is.na(x) & grepl("^[0-9]{1,2}$", x)
    x[number] <- as.character(as.integer(x[number]))
    x
  }
  codes <- names(labels)
  match_code <- match(raw, codes)
  numeric_match <- match(key(raw), key(codes))
  use <- ifelse(is.na(match_code), numeric_match, match_code)
  ifelse(is.na(use), raw, unname(labels[use]))
}

# Reads a fixture and checks every labelled column against the labels written
# in its setup file. Returns the data read.
check_fixture <- function(setup_name, data_name) {
  setup_file <- fixture(setup_name)
  data_file  <- fixture(data_name)
  data <- read_ascii_setup(data_file, setup_file, use_clean_names = FALSE,
                           coerce_numeric = FALSE)
  layout <- parse_setup(setup_file)$setup
  records <- readLines(data_file)
  labels <- written_labels(setup_file)
  for (variable in intersect(names(labels), names(data))) {
    position <- layout[layout$column_number == variable, ]
    raw <- trimws(substr(records, position$begin, position$end))
    raw[raw == ""] <- NA
    expect_equal(data[[variable]], expected_column(raw, labels[[variable]]),
                 info = paste(setup_name, variable))
    # No label picked up a variable name or anything else not written
    labelled <- data[[variable]][!data[[variable]] %in% raw]
    expect_true(all(labelled %in% labels[[variable]]),
                info = paste(setup_name, variable))
  }
  data
}

test_that("hate crime incident reports keep apostrophes in labels", {
  data <- check_fixture("ucr_hate_crimes_incident_report.sps",
                        "hate_crimes_2024_incident_report.txt")
  bias <- unlist(data[paste0("V", 14 + 5 * (0:9))])
  location <- unlist(data[paste0("V", 13 + 5 * (0:9))])
  expect_equal(sum(bias == "anti-jehovah's witness", na.rm = TRUE), 12)
  expect_true(any(location == "drug store/doctor's office/hospital"))
  expect_false(any(grepl("doctor s|jehovah s|offender s", c(bias, location))))
})

test_that("hate crime batch headers have no variable name in a label", {
  data <- check_fixture("ucr_hate_crimes_batch_header.sps",
                        "hate_crimes_2024_batch_header.txt")
  expect_true("msa state police" %in% data$V9)
  expect_false(any(grepl(" V[0-9]+$", unlist(data))))
})

test_that("NIBRS offense segments keep apostrophes in labels", {
  data <- check_fixture("nibrs_offense_segment.sps",
                        "nibrs_2024_offense_segment.txt")
  expect_true("drug store/doctor's office/hospital" %in% data$V11)
  expect_true(any(c("anti-jehovah's witness",
                    "unknown (offender's motivation not known, mutually exclusive)") %in% data$V23))
})

test_that("NIBRS batch headers have no variable name in a label", {
  data <- check_fixture("nibrs_batch_header_1.sps", "nibrs_2024_batch_header.txt")
  expect_true("zero-report was submitted" %in% data$V42)
  expect_false(any(grepl(" V[0-9]+$", unlist(data))))
})

test_that("arrest months written '1'-'12' label data written 01-12", {
  data <- check_fixture("arrests_monthly_header_1980_present.sps",
                        "arrests_2024_monthly_header.txt")
  expect_equal(unique(data$V6), tolower(month.name))
  expect_equal(as.vector(table(factor(data$V6, levels = tolower(month.name)))),
               rep(15, 12))
})
