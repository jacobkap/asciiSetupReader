# Every setup file's columns fit together, and fit its data: a column that
# the parser dropped or misplaced shows up as a gap, an overlap or a line
# width that doesn't match.

setup_files_to_check <- function() {
  files <- c(list.files(test_path("testdata"), pattern = "[.](sps|sas)$|_(sps|sas)[.]zip$",
                        ignore.case = TRUE, full.names = TRUE),
             list.files(test_path("fixtures"), pattern = "[.](sps|sas)(\\.zip)?$",
                        ignore.case = TRUE, full.names = TRUE),
             list.files(system.file("extdata", package = "asciiSetupReader"),
                        pattern = "[.](sps|sas)$", full.names = TRUE))
  # Files that are meant to fail to parse (see test-error.R and
  # test-setup-files.R)
  files[!grepl("starting_number_bigger_than_ending_number|_format\\.sas|_formats\\.sps|delimited_get_data",
               files)]
}

# How many columns read each position of the record
coverage <- function(setup) {
  tabulate(unlist(mapply(seq, setup$begin, setup$end, SIMPLIFY = FALSE)),
           nbins = max(setup$end))
}

test_that("every setup file's columns leave no gaps and don't overlap", {
  skip_on_cran()
  files <- setup_files_to_check()
  expect_gt(length(files), 120)
  for (f in files) {
    setup <- suppressMessages(parse_setup(f))$setup
    covered <- coverage(setup)
    expect_equal(sum(covered == 0), 0, label = paste(basename(f), "positions no column reads"))
    expect_equal(sum(covered > 1), 0, label = paste(basename(f), "positions read twice"))
    # So the widths add up to the record's length
    expect_equal(sum(setup$end - setup$begin + 1), max(setup$end), label = basename(f))
  }
})

# Setup files and the data they read
data_pairs <- function() {
  td <- function(x) test_path("testdata", x)
  fx <- function(x) test_path("fixtures", x)
  ex <- function(x) system.file("extdata", x, package = "asciiSetupReader")
  list(
    list(ex("example_data.zip"), ex("example_setup.sps")),
    list(ex("example_data.zip"), ex("example_setup.sas")),
    list(td("ucr1960.zip"), td("ucr1960_sps.zip")),
    list(td("ucr1960.zip"), td("ucr1960_sas.zip")),
    list(td("nibrs_2000_batch_header1.zip"), td("nibrs_2000_batch_header1_sps.zip")),
    list(td("nibrs_2000_batch_header1.zip"), td("nibrs_2000_batch_header1_sas.zip")),
    list(td("weimar.txt"), td("weimar_sps.zip")),
    list(td("weimar.txt"), td("weimar_sas.zip")),
    list(td("parole_survey.txt"), td("parole_survey.sps")),
    list(td("parole_survey.txt"), td("parole_survey.sas")),
    list(td("sacramento.txt"), td("sacramento_sps.zip")),
    list(td("sacramento.txt"), td("sacramento_sas.zip")),
    list(td("sex_offender_notification.txt"), td("sex_offender_notification.sps")),
    list(td("sex_offender_notification.txt"), td("sex_offender_notification.sas")),
    list(td("jail_survey_1987.zip"), td("jail_survey_1987.sps")),
    list(td("jail_survey_1987.zip"), td("jail_survey_1987.sas")),
    list(fx("supplementary_homicide_reports_1976.zip"),
         fx("supplementary_homicide_reports_1976.sps.zip")),
    list(fx("hate_crimes_2024_batch_header.txt"), fx("ucr_hate_crimes_batch_header.sps")),
    list(fx("nibrs_2024_offense_segment.txt"), fx("nibrs_offense_segment.sps")),
    list(fx("nibrs_2024_batch_header.txt"), fx("nibrs_batch_header_1.sps")),
    list(fx("arrests_2024_monthly_header.txt"), fx("arrests_monthly_header_1980_present.sps")))
}

test_that("every setup file's columns fill its data's lines exactly", {
  skip_on_cran()
  for (pair in data_pairs()) {
    lines <- readr::read_lines(pair[[1]])
    setup <- suppressMessages(parse_setup(pair[[2]]))$setup
    label <- paste(basename(pair[[2]]), "with", basename(pair[[1]]))
    width <- max(nchar(lines, type = "bytes"))
    # No column reads past the end of the data
    expect_lte(max(setup$end), width, label = label)
    # Anything after the last column is blank (e.g. padding)
    after <- substring(lines, max(setup$end) + 1)
    expect_true(all(trimws(after) == ""), label = paste(label, "columns after the last"))
  }
})

test_that("the 2024 hate crime incident layout stops short of the data (cdap)", {
  # cdap's layout ends at column 221, but the FBI's 2024 incident records
  # are 312 wide and have data after column 221. That's a gap in the cdap
  # layout, not in the package; if the layout is updated, update this test.
  lines <- readr::read_lines(fixture("hate_crimes_2024_incident_report.txt"))
  setup <- parse_setup(fixture("ucr_hate_crimes_incident_report.sps"))$setup
  expect_equal(max(setup$end), 221)
  expect_equal(max(nchar(lines)), 312)
  expect_true(any(trimws(substring(lines, 222)) != ""))
})

test_that("ca_vital.zip holds a copy of the setup file, not data", {
  # So it isn't one of the pairs above
  expect_match(readr::read_lines(test_path("testdata", "ca_vital.zip"), n_max = 3)[3],
               "SPSS SETUP FILE")
})
