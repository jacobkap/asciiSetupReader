context("There is no warning or error messages")

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

crosswalk_dataset_name <- system.file("testdata", "crosswalk.zip",
                                      package = "asciiSetupReader")
crosswalk_sps_name <- system.file("testdata", "crosswalk.sps",
                                  package = "asciiSetupReader")


parole_survey_dataset_name <- system.file("testdata", "parole_survey.txt",
                                          package = "asciiSetupReader")
parole_survey_sps_name <- system.file("testdata", "parole_survey.sps",
                                      package = "asciiSetupReader")

test_that("No messages or warnings or errors for file loads - SPSS", {
  expect_silent(spss_ascii_reader(dataset_name = SHR_dataset_name,
                                  sps_name = SHR_sps_name))
  expect_silent(spss_ascii_reader(dataset_name = SHR_dataset_name,
                                  sps_name = SHR_sps_name,
                                  keep_columns = 3))
  expect_silent(spss_ascii_reader(dataset_name = SHR_dataset_name,
                                  sps_name = SHR_sps_name,
                                  keep_columns = 100))
  expect_silent(spss_ascii_reader(dataset_name = SHR_dataset_name,
                                  sps_name = SHR_sps_name,
                                  keep_columns = c(3, 10, 100)))

  expect_silent(spss_ascii_reader(dataset_name = UCR_dataset_name,
                                  sps_name = UCR_sps_name))
  expect_silent(spss_ascii_reader(dataset_name = UCR_dataset_name,
                                  sps_name = UCR_sps_name,
                                  keep_columns = 1))
  expect_silent(spss_ascii_reader(dataset_name = UCR_dataset_name,
                                  sps_name = UCR_sps_name,
                                  keep_columns = 1200))
  expect_silent(spss_ascii_reader(dataset_name = UCR_dataset_name,
                                  sps_name = UCR_sps_name,
                                  keep_columns = c("ID_CODE",
                                                   "NUMERIC_STATE_CODE",
                                                   "ORI_CODE",
                                                   "CORE_CITY_INDICATION",
                                                   "DIVISION",
                                                   "NUMBER_OF_MONTHS_REPORTED",
                                                   "FOLLOW_UP_INDICATION",
                                                   "SPECIAL_MAILING_GROUP",
                                                   "JAN_MONTH_INCLUDED_IN",
                                                   "JAN_CARD_0_TYPE")))

  expect_silent(spss_ascii_reader(dataset_name = NIBRS_dataset_name,
                    sps_name = NIBRS_sps_name,
                    keep_columns = 1))
  expect_silent(spss_ascii_reader(dataset_name = NIBRS_dataset_name,
                                  sps_name = NIBRS_sps_name,
                                  keep_columns = 1:3))
  expect_silent(spss_ascii_reader(dataset_name = NIBRS_dataset_name,
                                  sps_name = NIBRS_sps_name,
                                  keep_columns = 3))

  expect_silent(spss_ascii_reader(dataset_name = weimar_dataset_name,
                                  sps_name = weimar_sps_name))
  expect_silent(spss_ascii_reader(dataset_name = weimar_dataset_name,
                                  sps_name = weimar_sps_name,
                                  keep_columns = 4))
  expect_silent(spss_ascii_reader(dataset_name = weimar_dataset_name,
                                  sps_name = weimar_sps_name,
                                  keep_columns = 3))

  expect_silent(spss_ascii_reader(dataset_name = crosswalk_dataset_name,
                                  sps_name = crosswalk_sps_name))
  expect_silent(spss_ascii_reader(dataset_name = crosswalk_dataset_name,
                                  sps_name = crosswalk_sps_name,
                                  keep_columns = 4))
  expect_silent(spss_ascii_reader(dataset_name = crosswalk_dataset_name,
                                  sps_name = crosswalk_sps_name,
                                  real_names = FALSE))


  expect_silent(spss_ascii_reader(dataset_name = parole_survey_dataset_name,
                                  sps_name = parole_survey_sps_name))
  expect_silent(spss_ascii_reader(dataset_name = parole_survey_dataset_name,
                                  sps_name = parole_survey_sps_name,
                                  keep_columns = 4))
  expect_silent(spss_ascii_reader(dataset_name = parole_survey_dataset_name,
                                  sps_name = parole_survey_sps_name,
                                  real_names = FALSE))



})

test_that("No messages or warnings or errors for file loads - SAS", {

  expect_silent(sas_ascii_reader(dataset_name = SHR_dataset_name,
                                 sas_name = SHR_sas_name))
  expect_silent(sas_ascii_reader(dataset_name = SHR_dataset_name,
                                 sas_name = SHR_sas_name,
                                 keep_columns = 3))
  expect_silent(sas_ascii_reader(dataset_name = SHR_dataset_name,
                                 sas_name = SHR_sas_name,
                                 keep_columns = 100))
  expect_silent(sas_ascii_reader(dataset_name = SHR_dataset_name,
                                 sas_name = SHR_sas_name,
                                 keep_columns = c(3, 10, 100)))

  expect_silent(sas_ascii_reader(dataset_name = UCR_dataset_name,
                                 sas_name = UCR_sas_name))
  expect_silent(sas_ascii_reader(dataset_name = UCR_dataset_name,
                                 sas_name = UCR_sas_name,
                                 keep_columns = 1))
  expect_silent(sas_ascii_reader(dataset_name = UCR_dataset_name,
                                 sas_name = UCR_sas_name,
                                 keep_columns = 1200))
  expect_silent(sas_ascii_reader(dataset_name = UCR_dataset_name,
                                 sas_name = UCR_sas_name,
                                 keep_columns = c("ID_CODE",
                                                  "NUMERIC_STATE_CODE",
                                                  "ORI_CODE",
                                                  "CORE_CITY_INDICATION",
                                                  "DIVISION",
                                                  "NUMBER_OF_MONTHS_REPORTED",
                                                  "FOLLOW_UP_INDICATION",
                                                  "SPECIAL_MAILING_GROUP",
                                                  "JAN_MONTH_INCLUDED_IN",
                                                  "JAN_CARD_0_TYPE")))

  expect_silent(sas_ascii_reader(dataset_name = NIBRS_dataset_name,
                                 sas_name = NIBRS_sas_name,
                                 keep_columns = 1))
  expect_silent(sas_ascii_reader(dataset_name = NIBRS_dataset_name,
                                 sas_name = NIBRS_sas_name,
                                 keep_columns = 1:3))
  expect_silent(sas_ascii_reader(dataset_name = NIBRS_dataset_name,
                                 sas_name = NIBRS_sas_name,
                                 keep_columns = 3))

  expect_silent(sas_ascii_reader(dataset_name = weimar_dataset_name,
                                 sas_name = weimar_sas_name))
  expect_silent(sas_ascii_reader(dataset_name = weimar_dataset_name,
                                 sas_name = weimar_sas_name,
                                 keep_columns = 4))
  expect_silent(sas_ascii_reader(dataset_name = weimar_dataset_name,
                                 sas_name = weimar_sas_name,
                                 keep_columns = 3))

})
