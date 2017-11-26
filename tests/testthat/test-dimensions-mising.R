context("Proper dimensions and missing values")

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
example2 <- spss_ascii_reader(dataset_name = SHR_dataset_name,
                              sps_name = SHR_sps_name, keep_columns = 1:5)
example3 <- spss_ascii_reader(dataset_name = SHR_dataset_name,
                              sps_name = SHR_sps_name, keep_columns = c(1, 5, 50:55, 100:121, 152))

UCR <- spss_ascii_reader(dataset_name = UCR_dataset_name,
                             sps_name = UCR_sps_name)
UCR2 <- spss_ascii_reader(dataset_name = UCR_dataset_name,
                             sps_name = UCR_sps_name,
                             keep_columns = c("V1", "V50", "V100", "V111", "V1000"))
NIBRS <- spss_ascii_reader(dataset_name = NIBRS_dataset_name,
                         sps_name = NIBRS_sps_name)
NIBRS2 <- spss_ascii_reader(dataset_name = NIBRS_dataset_name,
                          sps_name = NIBRS_sps_name,
                          keep_columns = c("B1001", "B1005", "B1010", "B1016", "B1019"))

test_that("number of columns is correct", {
  expect_equal(ncol(example), 152)
  expect_equal(ncol(example2), 5)
  expect_equal(ncol(example3), 31)

  expect_equal(ncol(UCR), 1448)
  expect_equal(ncol(UCR2), 5)

  expect_equal(ncol(NIBRS), 20)
  expect_equal(ncol(NIBRS2), 5)

})


test_that("number of rows is correct", {
  expect_equal(nrow(example), 13844)
  expect_equal(nrow(example2), 13844)
  expect_equal(nrow(example3), 13844)

  expect_equal(nrow(UCR), 8452)
  expect_equal(nrow(UCR2), 8452)

  expect_equal(nrow(NIBRS), 19711)
  expect_equal(nrow(NIBRS2), 19711)
})


# Check for appropriate number of NAs
test_that("Character columns have proper number of NAs", {
  expect_equal(sum(is.na(example$ORI_CODE)), 0)
  expect_equal(sum(is.na(example$LAST_UPDATE)), 0)

  expect_equal(sum(is.na(UCR$`JAN_CARD_0_P/T`)), 8452)
  expect_equal(sum(is.na(UCR$MAILING_ADDRESS_LINE_1)), 200)
  expect_equal(sum(is.na(UCR$MAILING_ADDRESS_LINE_2)), 2)
  expect_equal(sum(is.na(UCR$MAILING_ADDRESS_LINE_4)), 8452)


  expect_equal(sum(is.na(NIBRS$ORIGINATING_AGENCY_IDENTIFIER)), 0)
  expect_equal(sum(is.na(NIBRS$CITY_NAME)), 0)
  expect_equal(sum(is.na(NIBRS$COVERED_BY_ORI)), 16900)
})

test_that("Numeric columns have proper number of NAs", {
  expect_equal(sum(is.na(example$ADDITIONAL_VICTIM_COUNT)), 0)
  expect_equal(sum(is.na(example$ADDITIONAL_OFFENDER_COUNT)), 0)
  expect_equal(sum(is.na(example$POPULATION)), 0)

  expect_equal(sum(is.na(UCR$ZIP_CODE)), 0)
  expect_equal(sum(is.na(UCR$AUG_ACT_NUM_MURDER)), 0)
  expect_equal(sum(is.na(UCR$AUG_ACT_NUM_MANSLGHTR)), 0)
  expect_equal(sum(is.na(UCR$AUG_ACT_NUM_ROBBRY_TOTL)), 0)

  expect_equal(sum(is.na(NIBRS$N_RECORDS_PER_ORI_INCIDENT_NUMBER)), 0)
  expect_equal(sum(is.na(NIBRS$FILLER_BLANKS)), 19711)
  expect_equal(sum(is.na(NIBRS$COUNTRY_DIVISION)), 0)
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

  expect_equal(sum(is.na(UCR$ID_CODE)), 0)
  expect_equal(sum(is.na(UCR$NUMERIC_STATE_CODE)), 0)
  expect_equal(sum(is.na(UCR$FOLLOW_UP_INDICATION)), 0)
  expect_equal(sum(is.na(UCR$JAN_MONTH_INCLUDED_IN)), 7343)

  expect_equal(sum(is.na(NIBRS$POPULATION_GROUP)), 1)
  expect_equal(sum(is.na(NIBRS$COUNTRY_DIVISION)), 0)
  expect_equal(sum(is.na(NIBRS$SEGMENT_LEVEL)), 0)
  expect_equal(sum(is.na(NIBRS$NUMERIC_STATE_CODE)), 0)

})

