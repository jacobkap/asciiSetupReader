context("Columns are the correct type/class")

dataset_name <- system.file("extdata", "example_data.txt",
                            package = "asciiSetupReader")
sps_name <- system.file("extdata", "example_setup.sps",
                        package = "asciiSetupReader")
example <- spss_ascii_reader(dataset_name = dataset_name,
                             sps_name = sps_name)

test_that("Character columns are character", {
  expect_is(example$ORI_CODE, "character")

})

test_that("Numeric columns are Numeric", {
  expect_is(example$ADDITIONAL_OFFENDER_COUNT, "numeric")
  expect_is(example$ADDITIONAL_VICTIM_COUNT, "numeric")
  expect_is(example$INCIDENT_NUMBER, "numeric")
  expect_is(example$POPULATION, "numeric")
})

test_that("Factor columns are Factor", {
  expect_is(example$NUMERIC_STATE_CODE, "factor")
  expect_is(example$SITUATION, "factor")
  expect_is(example$VICTIM_4_ETHNIC_ORIGIN, "factor")
  expect_is(example$VICTIM_1_SEX, "factor")
  expect_is(example$OFFENDER_1_WEAPON, "factor")
})
