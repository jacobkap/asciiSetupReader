# Columns are the correct type/class


test_that("Character columns are character - SPSS", {
  expect_type(SHR$ORI_CODE, "character")

  expect_type(UCR$ORI_CODE, "character")
  expect_type(UCR$AGENCY_NAME, "character")
  expect_type(UCR$AGENCY_STATE_NAME, "character")
  expect_type(UCR$MAILING_ADDRESS_LINE_1, "character")
  expect_type(UCR$MAILING_ADDRESS_LINE_2, "character")
  expect_type(UCR$MAILING_ADDRESS_LINE_3, "character")

  expect_type(NIBRS$CITY_NAME, "character")
  expect_type(NIBRS$STATE_ABBREVIATION, "character")
  expect_type(NIBRS$ORIGINATING_AGENCY_IDENTIFIER, "character")
  expect_type(NIBRS$JUDICIAL_DISTRICT, "character")

  expect_type(weimar[, 4], "character")

  expect_type(SHR$NUMERIC_STATE_CODE, "character")
  expect_type(SHR$SITUATION, "character")
  expect_type(SHR$VICTIM_4_ETHNIC_ORIGIN, "character")
  expect_type(SHR$VICTIM_1_SEX, "character")
  expect_type(SHR$OFFENDER_1_WEAPON, "character")

  expect_type(UCR$ID_CODE, "character")
  expect_type(UCR$NUMERIC_STATE_CODE, "character")
  expect_type(UCR$GROUP_NUMBER, "character")
  expect_type(UCR$DIVISION, "character")
  expect_type(UCR$NUMBER_OF_MONTHS_REPORTED, "character")

  expect_type(NIBRS$SEGMENT_LEVEL, "character")
  expect_type(NIBRS$NUMERIC_STATE_CODE, "character")
  expect_type(NIBRS$CORE_CITY, "character")
  expect_type(NIBRS$POPULATION_GROUP, "character")
})

test_that("Numeric columns are Numeric - SPSS", {
  expect_type(SHR$ADDITIONAL_OFFENDER_COUNT, "double")
  expect_type(SHR$ADDITIONAL_VICTIM_COUNT, "double")
  expect_type(SHR$INCIDENT_NUMBER, "double")
  expect_type(SHR$POPULATION, "double")

  expect_type(UCR$POPULATION_1, "double")
  expect_type(UCR$POPULATION_3, "double")
  expect_type(UCR$JAN_CLR_under_18_ALL_FIELDS, "double")
  expect_type(UCR$JAN_ACT_VHC_THEFT_TO, "double")
  expect_type(UCR$JAN_ACT_AUTO_THEFT, "double")

  expect_type(NIBRS$N_RECORDS_PER_ORI_INCIDENT_NUMBER, "double")
  expect_type(NIBRS$DATE_ORI_WAS_ADDED, "double")
  expect_type(NIBRS$DATE_ORI_WENT_NIBRS, "double")

  expect_type(weimar[, 1], "double")
  expect_type(weimar[, 2], "double")
  expect_type(weimar[, 3], "double")
  expect_type(weimar[, 5], "double")
  expect_type(weimar[, 6], "double")
  expect_type(weimar[, 7], "double")
  expect_type(weimar[, 8], "double")
  expect_type(weimar[, 9], "double")
  expect_type(weimar[, 10], "double")
  expect_type(weimar[, 11], "double")
})



test_that("Character columns are character - SAS", {

  expect_type(SHR_sas$NUMERIC_STATE_CODE, "character")
  expect_type(SHR_sas$SITUATION, "character")
  expect_type(SHR_sas$VICTIM_4_ETHNIC_ORIGIN, "character")
  expect_type(SHR_sas$VICTIM_1_SEX, "character")
  expect_type(SHR_sas$OFFENDER_1_WEAPON, "character")

  expect_type(UCR_sas$ID_CODE, "character")
  expect_type(UCR_sas$NUMERIC_STATE_CODE, "character")
  expect_type(UCR_sas$GROUP_NUMBER, "character")
  expect_type(UCR_sas$DIVISION, "character")
  expect_type(UCR_sas$NUMBER_OF_MONTHS_REPORTED, "character")

  expect_type(NIBRS_sas$SEGMENT_LEVEL, "character")
  expect_type(NIBRS_sas$NUMERIC_STATE_CODE, "character")
  expect_type(NIBRS_sas$CORE_CITY, "character")
  expect_type(NIBRS_sas$POPULATION_GROUP, "character")

  expect_type(SHR_sas$ORI_CODE, "character")

  expect_type(UCR_sas$ORI_CODE, "character")
  expect_type(UCR_sas$AGENCY_NAME, "character")
  expect_type(UCR_sas$AGENCY_STATE_NAME, "character")
  expect_type(UCR_sas$MAILING_ADDRESS_LINE_1, "character")
  expect_type(UCR_sas$MAILING_ADDRESS_LINE_2, "character")
  expect_type(UCR_sas$MAILING_ADDRESS_LINE_3, "character")

  expect_type(NIBRS_sas$CITY_NAME, "character")
  expect_type(NIBRS_sas$STATE_ABBREVIATION, "character")
  expect_type(NIBRS_sas$ORIGINATING_AGENCY_IDENTIFIER, "character")
  expect_type(NIBRS_sas$JUDICIAL_DISTRICT, "character")
  expect_type(weimar_sas[, 4], "character")
})

test_that("Numeric columns are Numeric - SAS", {
  expect_type(SHR_sas$ADDITIONAL_OFFENDER_COUNT, "double")
  expect_type(SHR_sas$ADDITIONAL_VICTIM_COUNT, "double")
  expect_type(SHR_sas$INCIDENT_NUMBER, "double")
  expect_type(SHR_sas$POPULATION, "double")

  expect_type(UCR_sas$POPULATION_1, "double")
  expect_type(UCR_sas$POPULATION_3, "double")
  expect_type(UCR_sas$JAN_CLR_under_18_ALL_FIELDS, "double")
  expect_type(UCR_sas$JAN_ACT_VHC_THEFT_TO, "double")
  expect_type(UCR_sas$JAN_ACT_AUTO_THEFT, "double")

  expect_type(NIBRS_sas$N_RECORDS_PER_ORI_INCIDENT_NUMBER, "double")
  expect_type(NIBRS_sas$DATE_ORI_WAS_ADDED, "double")
  expect_type(NIBRS_sas$DATE_ORI_WENT_NIBRS, "double")

  expect_type(weimar_sas[, 1], "double")
  expect_type(weimar_sas[, 2], "double")
  expect_type(weimar_sas[, 3], "double")
  expect_type(weimar_sas[, 5], "double")
  expect_type(weimar_sas[, 6], "double")
  expect_type(weimar_sas[, 7], "double")
  expect_type(weimar_sas[, 8], "double")
  expect_type(weimar_sas[, 9], "double")
  expect_type(weimar_sas[, 10], "double")
  expect_type(weimar_sas[, 11], "double")
})


