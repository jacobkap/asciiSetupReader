context("Columns are the correct type/class")

SHR_dataset_name <- system.file("extdata", "example_data.zip",
                                package = "asciiSetupReader")
SHR_sps_name <- system.file("extdata", "example_setup.sps",
                            package = "asciiSetupReader")
UCR_dataset_name <- system.file("testdata", "ucr1960.zip",
                                package = "asciiSetupReader")
UCR_sps_name <- system.file("testdata", "ucr1960.sps",
                            package = "asciiSetupReader")
NIBRS_dataset_name <- system.file("testdata", "nibrs_2000_batch_header1.zip",
                                  package = "asciiSetupReader")
NIBRS_sps_name <- system.file("testdata", "nibrs_2000_batch_header1.sps",
                              package = "asciiSetupReader")

example <- spss_ascii_reader(dataset_name = SHR_dataset_name,
                             sps_name = SHR_sps_name)
UCR <- spss_ascii_reader(dataset_name = UCR_dataset_name,
                         sps_name = UCR_sps_name)
NIBRS <- spss_ascii_reader(dataset_name = NIBRS_dataset_name,
                           sps_name = NIBRS_sps_name)

test_that("Character columns are character", {
  expect_is(example$ORI_CODE, "character")

  expect_is(UCR$ORI_CODE, "character")
  expect_is(UCR$AGENCY_NAME, "character")
  expect_is(UCR$AGENCY_STATE_NAME, "character")
  expect_is(UCR$MAILING_ADDRESS_LINE_1, "character")
  expect_is(UCR$MAILING_ADDRESS_LINE_2, "character")
  expect_is(UCR$MAILING_ADDRESS_LINE_3, "character")

  expect_is(NIBRS$CITY_NAME, "character")
  expect_is(NIBRS$STATE_ABBREVIATION, "character")
  expect_is(NIBRS$ORIGINATING_AGENCY_IDENTIFIER, "character")
  expect_is(NIBRS$JUDICIAL_DISTRICT, "character")
})

test_that("Numeric columns are Numeric", {
  expect_is(example$ADDITIONAL_OFFENDER_COUNT, "numeric")
  expect_is(example$ADDITIONAL_VICTIM_COUNT, "numeric")
  expect_is(example$INCIDENT_NUMBER, "numeric")
  expect_is(example$POPULATION, "numeric")

  expect_is(UCR$POPULATION_1, "numeric")
  expect_is(UCR$POPULATION_3, "numeric")
  expect_is(UCR$`DEC_CLR<18_ALL_FIELDS`, "numeric")
  expect_is(UCR$POPULATION_1, "numeric")
  expect_is(UCR$`DEC_ACT_#_VHC_THEFT_TO`, "numeric")
  expect_is(UCR$`AUG_ACT_#_AUTO_THEFT`, "numeric")

  expect_is(NIBRS$N_RECORDS_PER_ORI_INCIDENT_NUMBER, "numeric")
  expect_is(NIBRS$DATE_ORI_WAS_ADDED, "numeric")
  expect_is(NIBRS$DATE_ORI_WENT_NIBRS, "numeric")
})

test_that("Factor columns are Factor", {
  expect_is(example$NUMERIC_STATE_CODE, "factor")
  expect_is(example$SITUATION, "factor")
  expect_is(example$VICTIM_4_ETHNIC_ORIGIN, "factor")
  expect_is(example$VICTIM_1_SEX, "factor")
  expect_is(example$OFFENDER_1_WEAPON, "factor")

  expect_is(UCR$ID_CODE, "factor")
  expect_is(UCR$NUMERIC_STATE_CODE, "factor")
  expect_is(UCR$GROUP_NUMBER, "factor")
  expect_is(UCR$DIVISION, "factor")
  expect_is(UCR$NUMBER_OF_MONTHS_REPORTED, "factor")

  expect_is(NIBRS$SEGMENT_LEVEL, "factor")
  expect_is(NIBRS$NUMERIC_STATE_CODE, "factor")
  expect_is(NIBRS$CORE_CITY, "factor")
  expect_is(NIBRS$POPULATION_GROUP, "factor")
})
