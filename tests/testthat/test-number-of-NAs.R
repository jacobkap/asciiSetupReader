context("Proper number of NAs")

dataset_name <- system.file("extdata", "example_data.txt",
                            package = "asciiSetupReader")
sps_name <- system.file("extdata", "example_setup.sps",
                        package = "asciiSetupReader")
example <- spss_ascii_reader(dataset_name = dataset_name,
                             sps_name = sps_name)

test_that("Character columns have proper number of NAs", {
  expect_equal(sum(is.na(example$ORI_CODE)), 0)
  expect_equal(sum(is.na(example$LAST_UPDATE)), 0)
})

test_that("Numeric columns have proper number of NAs", {
  expect_equal(sum(is.na(example$ADDITIONAL_VICTIM_COUNT)), 0)
  expect_equal(sum(is.na(example$ADDITIONAL_OFFENDER_COUNT)), 0)
  expect_equal(sum(is.na(example$POPULATION)), 0)

})

test_that("Factor columns have proper number of NAs", {
  expect_equal(sum(is.na(example$VICTIM_1_RACE)), 0)
  expect_equal(sum(is.na(example$VICTIM_10_RACE)), 13843)
  expect_equal(sum(is.na(example$OFFENDER_1_RACE)), 0)
  expect_equal(sum(is.na(example$OFFENDER_10_RACE)), 13842)

  expect_equal(sum(is.na(example$VICTIM_1_AGE)), 0)
  expect_equal(sum(is.na(example$VICTIM_4_AGE)), 13807)
  expect_equal(sum(is.na(example$OFFENDER_1_AGE)), 0)
  expect_equal(sum(is.na(example$OFFENDER_4_AGE)), 13530)
})
