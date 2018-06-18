context("That value labels are properly assigned")

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
UCR <- spss_ascii_reader(dataset_name = UCR_dataset_name,
                         sps_name = UCR_sps_name,
                         keep_columns = c("ID_CODE", "NUMERIC_STATE_CODE",
                                          "ORI_CODE", "CORE_CITY_INDICATION",
                                          "DIVISION",
                                          "NUMBER_OF_MONTHS_REPORTED",
                                          "FOLLOW_UP_INDICATION",
                                          "SPECIAL_MAILING_GROUP",
                                          "JAN_MONTH_INCLUDED_IN",
                                          "JAN_CARD_0_TYPE"))
NIBRS <- spss_ascii_reader(dataset_name = NIBRS_dataset_name,
                           sps_name = NIBRS_sps_name)

# Read SAS =============================================================
SHR_sas <- sas_ascii_reader(dataset_name = SHR_dataset_name,
                         sas_name = SHR_sas_name)
UCR_sas <- sas_ascii_reader(dataset_name = UCR_dataset_name,
                         sas_name = UCR_sas_name,
                         keep_columns = c("ID_CODE", "NUMERIC_STATE_CODE",
                                          "ORI_CODE", "CORE_CITY_INDICATION",
                                          "DIVISION",
                                          "NUMBER_OF_MONTHS_REPORTED",
                                          "FOLLOW_UP_INDICATION",
                                          "SPECIAL_MAILING_GROUP",
                                          "JAN_MONTH_INCLUDED_IN",
                                          "JAN_CARD_0_TYPE"))
NIBRS_sas <- sas_ascii_reader(dataset_name = NIBRS_dataset_name,
                           sas_name = NIBRS_sas_name)

test_that("Correct number of labels - SPSS", {
  expect_equal(length(unique(SHR$GEOGRAPHIC_DIVISION)), 10)
  expect_equal(length(unique(SHR$MONTH_OF_OFFENSE)), 12)
  expect_equal(length(unique(SHR$SITUATION)), 6)
  expect_equal(length(unique(SHR$IDENTIFIER_CODE)), 1)
  expect_equal(length(unique(SHR$VICTIM_1_AGE)), 99)
  expect_equal(length(unique(SHR$VICTIM_1_SEX)), 3)
  expect_equal(length(unique(SHR$VICTIM_1_RACE)), 5)
  expect_equal(length(unique(SHR$VICTIM_1_ETHNIC_ORIGIN)), 4)
  expect_equal(length(unique(SHR$OFFENDER_1_AGE)), 93)
  expect_equal(length(unique(SHR$OFFENDER_1_SEX)), 3)
  expect_equal(length(unique(SHR$OFFENDER_1_RACE)), 5)
  expect_equal(length(unique(SHR$OFFENDER_1_ETHNIC_ORIGIN)), 4)

  expect_equal(length(unique(UCR$ID_CODE)), 1)
  expect_equal(length(unique(UCR$NUMERIC_STATE_CODE)), 54)
  expect_equal(length(unique(UCR$ORI_CODE)), 8452)
  expect_equal(length(unique(UCR$CORE_CITY_INDICATION)), 1)
  expect_equal(length(unique(UCR$DIVISION)), 10)
  expect_equal(length(unique(UCR$NUMBER_OF_MONTHS_REPORTED)), 13)
  expect_equal(length(unique(UCR$FOLLOW_UP_INDICATION)), 2)
  expect_equal(length(unique(UCR$SPECIAL_MAILING_GROUP)), 5)
  expect_equal(length(unique(UCR$JAN_MONTH_INCLUDED_IN)), 6)
  expect_equal(length(unique(UCR$JAN_CARD_0_TYPE)), 2)

  expect_equal(length(unique(NIBRS$SEGMENT_LEVEL)), 1)
  expect_equal(length(unique(NIBRS$NUMERIC_STATE_CODE)), 54)
  expect_equal(length(unique(NIBRS$COUNTRY_REGION)), 4)
  expect_equal(length(unique(NIBRS$COUNTRY_DIVISION)), 10)
  expect_equal(length(unique(NIBRS$ORIGINATING_AGENCY_IDENTIFIER)), 19711)
  expect_equal(length(unique(NIBRS$FBI_FIELD_OFFICE)), 56)
  expect_equal(length(unique(NIBRS$AGENCY_INDICATOR)), 7)
  expect_equal(length(unique(NIBRS$CORE_CITY)), 2)

})

test_that("Correct labels are assigned - SPSS", {

  expect_equal(sum(SHR$GEOGRAPHIC_DIVISION %in% "Possessions"), 39)
  expect_equal(sum(SHR$GEOGRAPHIC_DIVISION %in% "New England States"), 309)
  expect_equal(sum(SHR$GEOGRAPHIC_DIVISION %in% "West North Central States"),
               921)
  expect_equal(sum(SHR$GEOGRAPHIC_DIVISION %in% "Pacific States"), 2323)

  expect_equal(sum(SHR$MONTH_OF_OFFENSE %in% "January"), 1083)
  expect_equal(sum(SHR$MONTH_OF_OFFENSE %in% "February"), 850)
  expect_equal(sum(SHR$MONTH_OF_OFFENSE %in% "October"), 1187)
  expect_equal(sum(SHR$MONTH_OF_OFFENSE %in% "December"), 1232)

  expect_equal(sum(SHR$SITUATION %in% "Single victim/single offender"), 7075)
  expect_equal(sum(SHR$SITUATION %in% "Single victim/unknown offender(s)"),
               4236)
  expect_equal(sum(SHR$SITUATION %in% "Multiple victims/single offender"), 374)
  expect_equal(sum(SHR$SITUATION %in% "Multiple victims/unknown offender(s)"),
               203)

  expect_equal(sum(SHR$IDENTIFIER_CODE %in% "SHR master file"), 13844)

  expect_equal(sum(UCR$ID_CODE %in% "Offenses known"), 8452)
  expect_equal(sum(UCR$NUMERIC_STATE_CODE %in% "Alabama"), 174)
  expect_equal(sum(UCR$NUMERIC_STATE_CODE %in% "Arizona"), 44)
  expect_equal(sum(UCR$NUMERIC_STATE_CODE %in% "California"), 415)
  expect_equal(sum(UCR$NUMERIC_STATE_CODE %in% "Texas"), 567)
  expect_equal(sum(UCR$NUMERIC_STATE_CODE %in% "Wyoming"), 44)
  expect_equal(sum(UCR$JAN_MONTH_INCLUDED_IN %in% "Jan not w oth month"), 1101)
  expect_equal(sum(UCR$NUMBER_OF_MONTHS_REPORTED %in% "No months reported"),
               1406)
  expect_equal(sum(UCR$NUMBER_OF_MONTHS_REPORTED %in% "May last reported"), 106)
  expect_equal(sum(UCR$NUMBER_OF_MONTHS_REPORTED %in% "August last reported"),
               58)
  expect_equal(sum(UCR$NUMBER_OF_MONTHS_REPORTED %in% "Dec last reported"),
               5933)
  expect_equal(sum(UCR$JAN_CARD_0_TYPE %in% "Not updated"), 7046)

  expect_equal(sum(NIBRS$SEGMENT_LEVEL %in% "Batch header 1"), 19711)
  expect_equal(sum(NIBRS$NUMERIC_STATE_CODE %in% "AL"), 424)
  expect_equal(sum(NIBRS$NUMERIC_STATE_CODE %in% "CA"), 865)
  expect_equal(sum(NIBRS$NUMERIC_STATE_CODE %in% "WY"), 79)
  expect_equal(sum(NIBRS$NUMERIC_STATE_CODE %in% "TX"), 1028)
  expect_equal(sum(NIBRS$NUMERIC_STATE_CODE %in% "WV"), 443)
  expect_equal(sum(NIBRS$POPULATION_GROUP %in% "Possessions"), 3)
  expect_equal(sum(NIBRS$POPULATION_GROUP %in% "MSA State Police"), 20)
  expect_equal(sum(NIBRS$POPULATION_GROUP %in% "Cities 2,500-9,999"), 4334)
  expect_equal(sum(NIBRS$CORE_CITY %in% "Yes"), 452)
  expect_equal(sum(NIBRS$COUNTRY_REGION %in% "West"), 2534)

})


# SAS tests
test_that("Correct number of labels - SAS", {

  expect_equal(length(unique(SHR_sas$GEOGRAPHIC_DIVISION)), 10)
  expect_equal(length(unique(SHR_sas$MONTH_OF_OFFENSE)), 12)
  expect_equal(length(unique(SHR_sas$SITUATION)), 6)
  expect_equal(length(unique(SHR_sas$IDENTIFIER_CODE)), 1)
  expect_equal(length(unique(SHR_sas$VICTIM_1_AGE)), 99)
  expect_equal(length(unique(SHR_sas$VICTIM_1_SEX)), 3)
  expect_equal(length(unique(SHR_sas$VICTIM_1_RACE)), 5)
  expect_equal(length(unique(SHR_sas$VICTIM_1_ETHNIC_ORIGIN)), 4)
  expect_equal(length(unique(SHR_sas$OFFENDER_1_AGE)), 93)
  expect_equal(length(unique(SHR_sas$OFFENDER_1_SEX)), 3)
  expect_equal(length(unique(SHR_sas$OFFENDER_1_RACE)), 5)
  expect_equal(length(unique(SHR_sas$OFFENDER_1_ETHNIC_ORIGIN)), 4)

  expect_equal(length(unique(UCR_sas$ID_CODE)), 1)
  expect_equal(length(unique(UCR_sas$NUMERIC_STATE_CODE)), 54)
  expect_equal(length(unique(UCR_sas$ORI_CODE)), 8452)
  expect_equal(length(unique(UCR_sas$CORE_CITY_INDICATION)), 1)
  expect_equal(length(unique(UCR_sas$DIVISION)), 10)
  expect_equal(length(unique(UCR_sas$NUMBER_OF_MONTHS_REPORTED)), 13)
  expect_equal(length(unique(UCR_sas$FOLLOW_UP_INDICATION)), 2)
  expect_equal(length(unique(UCR_sas$SPECIAL_MAILING_GROUP)), 5)
  expect_equal(length(unique(UCR_sas$JAN_MONTH_INCLUDED_IN)), 6)
  expect_equal(length(unique(UCR_sas$JAN_CARD_0_TYPE)), 2)

  expect_equal(length(unique(NIBRS_sas$SEGMENT_LEVEL)), 1)
  expect_equal(length(unique(NIBRS$NUMERIC_STATE_CODE)), 54)
  expect_equal(length(unique(NIBRS$COUNTRY_REGION)), 4)
  expect_equal(length(unique(NIBRS$COUNTRY_DIVISION)), 10)
  expect_equal(length(unique(NIBRS$ORIGINATING_AGENCY_IDENTIFIER)), 19711)
  expect_equal(length(unique(NIBRS$FBI_FIELD_OFFICE)), 56)
  expect_equal(length(unique(NIBRS$AGENCY_INDICATOR)), 7)
  expect_equal(length(unique(NIBRS$CORE_CITY)), 2)
})

test_that("Correct labels are assigned - SAS", {

  expect_equal(sum(SHR_sas$GEOGRAPHIC_DIVISION %in% "Possessions"), 39)
  expect_equal(sum(SHR_sas$GEOGRAPHIC_DIVISION %in% "New England States"), 309)
  expect_equal(sum(SHR_sas$GEOGRAPHIC_DIVISION %in%
                     "West North Central States"), 921)
  expect_equal(sum(SHR_sas$GEOGRAPHIC_DIVISION %in% "Pacific States"), 2323)

  expect_equal(sum(SHR_sas$MONTH_OF_OFFENSE %in% "January"), 1083)
  expect_equal(sum(SHR_sas$MONTH_OF_OFFENSE %in% "February"), 850)
  expect_equal(sum(SHR_sas$MONTH_OF_OFFENSE %in% "October"), 1187)
  expect_equal(sum(SHR_sas$MONTH_OF_OFFENSE %in% "December"), 1232)

  expect_equal(sum(SHR_sas$SITUATION %in% "Single victim/single offender"),
               7075)
  expect_equal(sum(SHR_sas$SITUATION %in% "Single victim/unknown offender(s)"),
               4236)
  expect_equal(sum(SHR_sas$SITUATION %in% "Multiple victims/single offender"),
               374)
  expect_equal(sum(SHR_sas$SITUATION %in%
                     "Multiple victims/unknown offender(s)"), 203)

  expect_equal(sum(SHR_sas$IDENTIFIER_CODE %in% "SHR master file"), 13844)

  expect_equal(sum(UCR_sas$ID_CODE %in% "Offenses known"), 8452)
  expect_equal(sum(UCR_sas$NUMERIC_STATE_CODE %in% "Alabama"), 174)
  expect_equal(sum(UCR_sas$NUMERIC_STATE_CODE %in% "Arizona"), 44)
  expect_equal(sum(UCR_sas$NUMERIC_STATE_CODE %in% "California"), 415)
  expect_equal(sum(UCR_sas$NUMERIC_STATE_CODE %in% "Texas"), 567)
  expect_equal(sum(UCR_sas$NUMERIC_STATE_CODE %in% "Wyoming"), 44)
  expect_equal(sum(UCR_sas$JAN_MONTH_INCLUDED_IN %in% "Jan not w oth month"),
               1101)
  expect_equal(sum(UCR_sas$NUMBER_OF_MONTHS_REPORTED %in% "No months reported"),
               1406)
  expect_equal(sum(UCR_sas$NUMBER_OF_MONTHS_REPORTED %in% "May last reported"),
               106)
  expect_equal(sum(UCR_sas$NUMBER_OF_MONTHS_REPORTED %in%
                     "August last reported"), 58)
  expect_equal(sum(UCR_sas$NUMBER_OF_MONTHS_REPORTED %in% "Dec last reported"),
               5933)
  expect_equal(sum(UCR_sas$JAN_CARD_0_TYPE %in% "Not updated"), 7046)

  expect_equal(sum(NIBRS$SEGMENT_LEVEL %in% "Batch header 1"), 19711)
  expect_equal(sum(NIBRS$NUMERIC_STATE_CODE %in% "AL"), 424)
  expect_equal(sum(NIBRS$NUMERIC_STATE_CODE %in% "CA"), 865)
  expect_equal(sum(NIBRS$NUMERIC_STATE_CODE %in% "WY"), 79)
  expect_equal(sum(NIBRS$NUMERIC_STATE_CODE %in% "TX"), 1028)
  expect_equal(sum(NIBRS$NUMERIC_STATE_CODE %in% "WV"), 443)
  expect_equal(sum(NIBRS$POPULATION_GROUP %in% "Possessions"), 3)
  expect_equal(sum(NIBRS$POPULATION_GROUP %in% "MSA State Police"), 20)
  expect_equal(sum(NIBRS$POPULATION_GROUP %in% "Cities 2,500-9,999"), 4334)
  expect_equal(sum(NIBRS$CORE_CITY %in% "Yes"), 452)
  expect_equal(sum(NIBRS$COUNTRY_REGION %in% "West"), 2534)

})
