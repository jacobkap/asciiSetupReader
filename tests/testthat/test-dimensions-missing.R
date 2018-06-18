context("Proper dimensions and missing values")

SHR_dataset_name <- system.file("extdata", "example_data.zip",
                            package = "asciiSetupReader")
SHR_sps_name <- system.file("extdata", "example_setup_sps.zip",
                        package = "asciiSetupReader")
SHR_sas_name <- system.file("extdata", "example_setup_sas.zip",
                            package = "asciiSetupReader")
UCR_dataset_name <- system.file("testdata", "ucr1960.zip",
                                package = "asciiSetupReader")
UCR_sps_name <- system.file("testdata", "ucr1960_sps.zip",
                            package = "asciiSetupReader")
UCR_sas_name <- system.file("testdata", "ucr1960_sas.zip",
                            package = "asciiSetupReader")
NIBRS_dataset_name <- system.file("testdata", "nibrs_2000_batch_header1.zip",
                                  package = "asciiSetupReader")
NIBRS_sps_name <- system.file("testdata", "nibrs_2000_batch_header1_sps.zip",
                              package = "asciiSetupReader")
NIBRS_sas_name <- system.file("testdata", "nibrs_2000_batch_header1_sas.zip",
                              package = "asciiSetupReader")


SHR <- spss_ascii_reader(dataset_name = SHR_dataset_name,
                             sps_name = SHR_sps_name)
SHR2 <- spss_ascii_reader(dataset_name = SHR_dataset_name,
                              sps_name = SHR_sps_name, keep_columns = 1:5)
SHR3 <- spss_ascii_reader(dataset_name = SHR_dataset_name,
                              sps_name = SHR_sps_name,
                          keep_columns = c(1, 5, 50:55, 100:121, 152))

UCR2 <- spss_ascii_reader(dataset_name = UCR_dataset_name,
                             sps_name = UCR_sps_name,
                             keep_columns = c("V1", "V50", "V100", "V111",
                                              "V1000"))
NIBRS <- spss_ascii_reader(dataset_name = NIBRS_dataset_name,
                         sps_name = NIBRS_sps_name)
NIBRS2 <- spss_ascii_reader(dataset_name = NIBRS_dataset_name,
                          sps_name = NIBRS_sps_name,
                          keep_columns = c("B1001", "B1005", "B1010",
                                           "B1016", "B1019"))

# Read SAS ====================================================================
SHR_sas <- sas_ascii_reader(dataset_name = SHR_dataset_name,
                            sas_name = SHR_sas_name)
SHR2_sas <- sas_ascii_reader(dataset_name = SHR_dataset_name,
                         sas_name = SHR_sas_name, keep_columns = 1:5)
SHR3_sas <- sas_ascii_reader(dataset_name = SHR_dataset_name,
                         sas_name = SHR_sas_name,
                         keep_columns = c(1, 5, 50:55, 100:121, 152))


UCR2_sas <- sas_ascii_reader(dataset_name = UCR_dataset_name,
                         sas_name = UCR_sas_name,
                          keep_columns = c("V1", "V50", "V100",
                                           "V111", "V1000"))
NIBRS_sas <- sas_ascii_reader(dataset_name = NIBRS_dataset_name,
                          sas_name = NIBRS_sas_name)
NIBRS2_sas <- sas_ascii_reader(dataset_name = NIBRS_dataset_name,
                            sas_name = NIBRS_sas_name,
                            keep_columns = c("B1001", "B1005",
                                             "B1010", "B1016", "B1019"))

test_that("number of columns is correct - SPSS", {
  expect_equal(ncol(SHR), 152)
  expect_equal(ncol(SHR2), 5)
  expect_equal(ncol(SHR3), 31)

  expect_equal(ncol(UCR2), 5)

  expect_equal(ncol(NIBRS), 20)
  expect_equal(ncol(NIBRS2), 5)

})


test_that("number of rows is correct - SPSS", {
  expect_equal(nrow(SHR), 13844)
  expect_equal(nrow(SHR2), 13844)
  expect_equal(nrow(SHR3), 13844)

  expect_equal(nrow(UCR2), 8452)

  expect_equal(nrow(NIBRS), 19711)
  expect_equal(nrow(NIBRS2), 19711)
})


# Check for appropriate number of NAs
test_that("Character columns have proper number of NAs - SPSS", {
  expect_equal(sum(is.na(SHR$ORI_CODE)), 0)
  expect_equal(sum(is.na(SHR$LAST_UPDATE)), 0)

  expect_equal(sum(is.na(NIBRS$ORIGINATING_AGENCY_IDENTIFIER)), 0)
  expect_equal(sum(is.na(NIBRS$CITY_NAME)), 0)
  expect_equal(sum(is.na(NIBRS$COVERED_BY_ORI)), 16900)
})

test_that("Numeric columns have proper number of NAs - SPSS", {
  expect_equal(sum(is.na(SHR$ADDITIONAL_VICTIM_COUNT)), 0)
  expect_equal(sum(is.na(SHR$ADDITIONAL_OFFENDER_COUNT)), 0)
  expect_equal(sum(is.na(SHR$POPULATION)), 0)

  expect_equal(sum(is.na(NIBRS$N_RECORDS_PER_ORI_INCIDENT_NUMBER)), 0)
  expect_equal(sum(is.na(NIBRS$FILLER_BLANKS)), 19711)
  expect_equal(sum(is.na(NIBRS$COUNTRY_DIVISION)), 0)
})

test_that("Factor columns have proper number of NAs - SPSS", {
  expect_equal(sum(is.na(SHR$VICTIM_1_RACE)), 0)
  expect_equal(sum(is.na(SHR$VICTIM_10_RACE)), 13843)
  expect_equal(sum(is.na(SHR$OFFENDER_1_RACE)), 0)
  expect_equal(sum(is.na(SHR$OFFENDER_10_RACE)), 13842)

  expect_equal(sum(is.na(SHR$VICTIM_1_AGE)), 0)
  expect_equal(sum(is.na(SHR$VICTIM_4_AGE)), 13807)
  expect_equal(sum(is.na(SHR$OFFENDER_1_AGE)), 0)
  expect_equal(sum(is.na(SHR$OFFENDER_4_AGE)), 13530)

  expect_equal(sum(is.na(NIBRS$POPULATION_GROUP)), 1)
  expect_equal(sum(is.na(NIBRS$COUNTRY_DIVISION)), 0)
  expect_equal(sum(is.na(NIBRS$SEGMENT_LEVEL)), 0)
  expect_equal(sum(is.na(NIBRS$NUMERIC_STATE_CODE)), 0)

})

# SAS tests
test_that("number of columns is correct - SAS", {
  expect_equal(ncol(SHR_sas), 152)
  expect_equal(ncol(SHR2_sas), 5)
  expect_equal(ncol(SHR3_sas), 31)

  expect_equal(ncol(UCR2_sas), 5)

  expect_equal(ncol(NIBRS_sas), 20)
  expect_equal(ncol(NIBRS2_sas), 5)

})


test_that("number of rows is correct - SAS", {
  expect_equal(nrow(SHR_sas), 13844)
  expect_equal(nrow(SHR2_sas), 13844)
  expect_equal(nrow(SHR3_sas), 13844)

  expect_equal(nrow(UCR2_sas), 8452)

  expect_equal(nrow(NIBRS_sas), 19711)
  expect_equal(nrow(NIBRS2_sas), 19711)
})


# Check for appropriate number of NAs
test_that("Character columns have proper number of NAs - SAS", {
  expect_equal(sum(is.na(SHR_sas$ORI_CODE)), 0)
  expect_equal(sum(is.na(SHR_sas$LAST_UPDATE)), 0)


  expect_equal(sum(is.na(NIBRS_sas$ORIGINATING_AGENCY_IDENTIFIER)), 0)
  expect_equal(sum(is.na(NIBRS_sas$CITY_NAME)), 0)
  expect_equal(sum(is.na(NIBRS_sas$COVERED_BY_ORI)), 16900)
})

test_that("Numeric columns have proper number of NAs - SAS", {
  expect_equal(sum(is.na(SHR_sas$ADDITIONAL_VICTIM_COUNT)), 0)
  expect_equal(sum(is.na(SHR_sas$ADDITIONAL_OFFENDER_COUNT)), 0)
  expect_equal(sum(is.na(SHR_sas$POPULATION)), 0)

  expect_equal(sum(is.na(NIBRS_sas$N_RECORDS_PER_ORI_INCIDENT_NUMBER)), 0)
  expect_equal(sum(is.na(NIBRS_sas$FILLER_BLANKS)), 19711)
  expect_equal(sum(is.na(NIBRS_sas$COUNTRY_DIVISION)), 0)
})

test_that("Factor columns have proper number of NAs - SAS", {
  expect_equal(sum(is.na(SHR_sas$VICTIM_1_RACE)), 0)
  expect_equal(sum(is.na(SHR_sas$VICTIM_10_RACE)), 13843)
  expect_equal(sum(is.na(SHR_sas$OFFENDER_1_RACE)), 0)
  expect_equal(sum(is.na(SHR_sas$OFFENDER_10_RACE)), 13842)

  expect_equal(sum(is.na(SHR_sas$VICTIM_1_AGE)), 0)
  expect_equal(sum(is.na(SHR_sas$VICTIM_4_AGE)), 13807)
  expect_equal(sum(is.na(SHR_sas$OFFENDER_1_AGE)), 0)
  expect_equal(sum(is.na(SHR_sas$OFFENDER_4_AGE)), 13530)

  expect_equal(sum(is.na(NIBRS_sas$POPULATION_GROUP)), 1)
  expect_equal(sum(is.na(NIBRS_sas$COUNTRY_DIVISION)), 0)
  expect_equal(sum(is.na(NIBRS_sas$SEGMENT_LEVEL)), 0)
  expect_equal(sum(is.na(NIBRS_sas$NUMERIC_STATE_CODE)), 0)

})
