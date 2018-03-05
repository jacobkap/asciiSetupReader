context("Columns are the correct type/class")

SHR_dataset_name <- system.file("extdata", "example_data.zip",
                                package = "asciiSetupReader")

SHR_sps_name <- system.file("extdata", "example_setup.sps",
                            package = "asciiSetupReader")
SHR_sas_name <- system.file("extdata", "example_setup.sas",
                            package = "asciiSetupReader")
UCR_dataset_name <- system.file("testdata", "ucr1960.zip",
                                package = "asciiSetupReader")
UCR_sps_name <- system.file("testdata", "ucr1960.sps",
                            package = "asciiSetupReader")
UCR_sas_name <- system.file("testdata", "ucr1960.sas",
                            package = "asciiSetupReader")
NIBRS_dataset_name <- system.file("testdata", "nibrs_2000_batch_header1.zip",
                                  package = "asciiSetupReader")
NIBRS_sps_name <- system.file("testdata", "nibrs_2000_batch_header1.sps",
                              package = "asciiSetupReader")
NIBRS_sas_name <- system.file("testdata", "nibrs_2000_batch_header1.sas",
                              package = "asciiSetupReader")

weimar_dataset_name <- system.file("testdata", "weimar.txt",
                                   package = "asciiSetupReader")
weimar_sps_name <- system.file("testdata", "weimar.sps",
                               package = "asciiSetupReader")
weimar_sas_name <- system.file("testdata", "weimar.sas",
                               package = "asciiSetupReader")


SHR <- spss_ascii_reader(dataset_name = SHR_dataset_name,
                             sps_name = SHR_sps_name)
UCR <- spss_ascii_reader(dataset_name = UCR_dataset_name,
                         sps_name = UCR_sps_name,
                         keep_columns = c("ORI_CODE", "AGENCY_NAME",
                                          "AGENCY_STATE_NAME",
                                          "MAILING_ADDRESS_LINE_1",
                                          "MAILING_ADDRESS_LINE_2",
                                          "MAILING_ADDRESS_LINE_3",
                                          "POPULATION_1",
                                          "POPULATION_3",
                                          "DEC_ACT_VHC_THEFT_TO",
                                          "AUG_ACT_AUTO_THEFT", "ID_CODE",
                                          "NUMERIC_STATE_CODE", "GROUP_NUMBER",
                                          "DIVISION",
                                          "NUMBER_OF_MONTHS_REPORTED",
                                          "DEC_CLR_18_ALL_FIELDS"))
NIBRS <- spss_ascii_reader(dataset_name = NIBRS_dataset_name,
                           sps_name = NIBRS_sps_name)

weimar <- spss_ascii_reader(dataset_name = weimar_dataset_name,
                            sps_name = weimar_sps_name)


SHR_sas <- sas_ascii_reader(dataset_name = SHR_dataset_name,
                         sas_name = SHR_sas_name)
UCR_sas <- sas_ascii_reader(dataset_name = UCR_dataset_name,
                         sas_name = UCR_sas_name,
                         keep_columns = c("ORI_CODE", "AGENCY_NAME",
                                          "AGENCY_STATE_NAME",
                                          "MAILING_ADDRESS_LINE_1",
                                          "MAILING_ADDRESS_LINE_2",
                                          "MAILING_ADDRESS_LINE_3",
                                          "POPULATION_1",
                                          "POPULATION_3",
                                          "DEC_ACT_VHC_THEFT_TO",
                                          "AUG_ACT_AUTO_THEFT", "ID_CODE",
                                          "NUMERIC_STATE_CODE", "GROUP_NUMBER",
                                          "DIVISION",
                                          "NUMBER_OF_MONTHS_REPORTED",
                                          "DEC_CLR_18_ALL_FIELDS"))
NIBRS_sas <- sas_ascii_reader(dataset_name = NIBRS_dataset_name,
                           sas_name = NIBRS_sas_name)
weimar_sas <- sas_ascii_reader(dataset_name = weimar_dataset_name,
                                sas_name = weimar_sas_name)

test_that("Character columns are character - SPSS", {
  expect_is(SHR$ORI_CODE, "character")

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

  expect_is(weimar[, 4], "character")

  expect_is(SHR$NUMERIC_STATE_CODE, "character")
  expect_is(SHR$SITUATION, "character")
  expect_is(SHR$VICTIM_4_ETHNIC_ORIGIN, "character")
  expect_is(SHR$VICTIM_1_SEX, "character")
  expect_is(SHR$OFFENDER_1_WEAPON, "character")

  expect_is(UCR$ID_CODE, "character")
  expect_is(UCR$NUMERIC_STATE_CODE, "character")
  expect_is(UCR$GROUP_NUMBER, "character")
  expect_is(UCR$DIVISION, "character")
  expect_is(UCR$NUMBER_OF_MONTHS_REPORTED, "character")

  expect_is(NIBRS$SEGMENT_LEVEL, "character")
  expect_is(NIBRS$NUMERIC_STATE_CODE, "character")
  expect_is(NIBRS$CORE_CITY, "character")
  expect_is(NIBRS$POPULATION_GROUP, "character")
})

test_that("Numeric columns are Numeric - SPSS", {
  expect_is(SHR$ADDITIONAL_OFFENDER_COUNT, "numeric")
  expect_is(SHR$ADDITIONAL_VICTIM_COUNT, "numeric")
  expect_is(SHR$INCIDENT_NUMBER, "numeric")
  expect_is(SHR$POPULATION, "numeric")

  expect_is(UCR$POPULATION_1, "numeric")
  expect_is(UCR$POPULATION_3, "numeric")
  expect_is(UCR$DEC_CLR_18_ALL_FIELDS, "numeric")
  expect_is(UCR$DEC_ACT_VHC_THEFT_TO, "numeric")
  expect_is(UCR$AUG_ACT_AUTO_THEFT, "numeric")

  expect_is(NIBRS$N_RECORDS_PER_ORI_INCIDENT_NUMBER, "numeric")
  expect_is(NIBRS$DATE_ORI_WAS_ADDED, "numeric")
  expect_is(NIBRS$DATE_ORI_WENT_NIBRS, "numeric")

  expect_is(weimar[, 1], "numeric")
  expect_is(weimar[, 2], "numeric")
  expect_is(weimar[, 3], "numeric")
  expect_is(weimar[, 5], "numeric")
  expect_is(weimar[, 6], "numeric")
  expect_is(weimar[, 7], "numeric")
  expect_is(weimar[, 8], "numeric")
  expect_is(weimar[, 9], "numeric")
  expect_is(weimar[, 10], "numeric")
  expect_is(weimar[, 11], "numeric")
})



test_that("Character columns are character - SAS", {

  expect_is(SHR_sas$NUMERIC_STATE_CODE, "character")
  expect_is(SHR_sas$SITUATION, "character")
  expect_is(SHR_sas$VICTIM_4_ETHNIC_ORIGIN, "character")
  expect_is(SHR_sas$VICTIM_1_SEX, "character")
  expect_is(SHR_sas$OFFENDER_1_WEAPON, "character")

  expect_is(UCR_sas$ID_CODE, "character")
  expect_is(UCR_sas$NUMERIC_STATE_CODE, "character")
  expect_is(UCR_sas$GROUP_NUMBER, "character")
  expect_is(UCR_sas$DIVISION, "character")
  expect_is(UCR_sas$NUMBER_OF_MONTHS_REPORTED, "character")

  expect_is(NIBRS_sas$SEGMENT_LEVEL, "character")
  expect_is(NIBRS_sas$NUMERIC_STATE_CODE, "character")
  expect_is(NIBRS_sas$CORE_CITY, "character")
  expect_is(NIBRS_sas$POPULATION_GROUP, "character")

  expect_is(SHR_sas$ORI_CODE, "character")

  expect_is(UCR_sas$ORI_CODE, "character")
  expect_is(UCR_sas$AGENCY_NAME, "character")
  expect_is(UCR_sas$AGENCY_STATE_NAME, "character")
  expect_is(UCR_sas$MAILING_ADDRESS_LINE_1, "character")
  expect_is(UCR_sas$MAILING_ADDRESS_LINE_2, "character")
  expect_is(UCR_sas$MAILING_ADDRESS_LINE_3, "character")

  expect_is(NIBRS_sas$CITY_NAME, "character")
  expect_is(NIBRS_sas$STATE_ABBREVIATION, "character")
  expect_is(NIBRS_sas$ORIGINATING_AGENCY_IDENTIFIER, "character")
  expect_is(NIBRS_sas$JUDICIAL_DISTRICT, "character")
  expect_is(weimar_sas[, 4], "character")
})

test_that("Numeric columns are Numeric - SAS", {
  expect_is(SHR_sas$ADDITIONAL_OFFENDER_COUNT, "numeric")
  expect_is(SHR_sas$ADDITIONAL_VICTIM_COUNT, "numeric")
  expect_is(SHR_sas$INCIDENT_NUMBER, "numeric")
  expect_is(SHR_sas$POPULATION, "numeric")

  expect_is(UCR_sas$POPULATION_1, "numeric")
  expect_is(UCR_sas$POPULATION_3, "numeric")
  expect_is(UCR_sas$DEC_CLR_18_ALL_FIELDS, "numeric")
  expect_is(UCR_sas$DEC_ACT_VHC_THEFT_TO, "numeric")
  expect_is(UCR_sas$AUG_ACT_AUTO_THEFT, "numeric")

  expect_is(NIBRS_sas$N_RECORDS_PER_ORI_INCIDENT_NUMBER, "numeric")
  expect_is(NIBRS_sas$DATE_ORI_WAS_ADDED, "numeric")
  expect_is(NIBRS_sas$DATE_ORI_WENT_NIBRS, "numeric")

  expect_is(weimar_sas[, 1], "numeric")
  expect_is(weimar_sas[, 2], "numeric")
  expect_is(weimar_sas[, 3], "numeric")
  expect_is(weimar_sas[, 5], "numeric")
  expect_is(weimar_sas[, 6], "numeric")
  expect_is(weimar_sas[, 7], "numeric")
  expect_is(weimar_sas[, 8], "numeric")
  expect_is(weimar_sas[, 9], "numeric")
  expect_is(weimar_sas[, 10], "numeric")
  expect_is(weimar_sas[, 11], "numeric")
})


