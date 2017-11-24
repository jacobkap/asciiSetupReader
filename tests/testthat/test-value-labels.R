context("That value labels are properly assigned")

dataset_name <- system.file("extdata", "example_data.txt",
                            package = "asciiSetupReader")
sps_name <- system.file("extdata", "example_setup.sps",
                        package = "asciiSetupReader")
example <- spss_ascii_reader(dataset_name = dataset_name,
                             sps_name = sps_name)


test_that("Correct number of labels", {
  expect_equal(length(unique(example$GEOGRAPHIC_DIVISION)), 10)
  expect_equal(length(unique(example$MONTH_OF_OFFENSE)), 12)
  expect_equal(length(unique(example$SITUATION)), 6)
  expect_equal(length(unique(example$IDENTIFIER_CODE)), 1)
  expect_equal(length(unique(example$VICTIM_1_AGE)), 99)
  expect_equal(length(unique(example$VICTIM_1_SEX)), 3)
  expect_equal(length(unique(example$VICTIM_1_RACE)), 5)
  expect_equal(length(unique(example$VICTIM_1_ETHNIC_ORIGIN)), 4)
  expect_equal(length(unique(example$OFFENDER_1_AGE)), 93)
  expect_equal(length(unique(example$OFFENDER_1_SEX)), 3)
  expect_equal(length(unique(example$OFFENDER_1_RACE)), 5)
  expect_equal(length(unique(example$OFFENDER_1_ETHNIC_ORIGIN)), 4)
})

test_that("Correct labels are assigned", {

  expect_equal(sum(example$GEOGRAPHIC_DIVISION == "Possessions"), 39)
  expect_equal(sum(example$GEOGRAPHIC_DIVISION == "New England States"), 309)
  expect_equal(sum(example$GEOGRAPHIC_DIVISION == "West North Central States"), 921)
  expect_equal(sum(example$GEOGRAPHIC_DIVISION == "Pacific States"), 2323)

  expect_equal(sum(example$MONTH_OF_OFFENSE == "January"), 1083)
  expect_equal(sum(example$MONTH_OF_OFFENSE == "February"), 850)
  expect_equal(sum(example$MONTH_OF_OFFENSE == "October"), 1187)
  expect_equal(sum(example$MONTH_OF_OFFENSE == "December"), 1232)

  expect_equal(sum(example$SITUATION == "Single victim/single offender"), 7075)
  expect_equal(sum(example$SITUATION == "Single victim/unknown offender(s)"), 4236)
  expect_equal(sum(example$SITUATION == "Multiple victims/single offender"), 374)
  expect_equal(sum(example$SITUATION == "Multiple victims/unknown offender(s)"), 203)

  expect_equal(sum(example$IDENTIFIER_CODE == "SHR master file"), 13844)
})


