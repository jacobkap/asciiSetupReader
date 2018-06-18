context("There are no warning or error messages")


test_that("No messages or warnings or errors for file loads - SPSS", {
  skip_on_cran()
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
                                  sps_name = crosswalk_sps_name,
                                  keep_columns = 4))
  expect_silent(spss_ascii_reader(dataset_name = crosswalk_dataset_name,
                                  sps_name = crosswalk_sps_name,
                                  real_names = FALSE))



  expect_silent(spss_ascii_reader(dataset_name = parole_survey_dataset_name,
                                  sps_name = parole_survey_sps_name,
                                  keep_columns = 4))
  expect_silent(spss_ascii_reader(dataset_name = parole_survey_dataset_name,
                                  sps_name = parole_survey_sps_name,
                                  real_names = FALSE))

  expect_silent(spss_ascii_reader(dataset_name = UCR_dataset_name,
                                  sps_name = UCR_sps_name))
  expect_silent(spss_ascii_reader(dataset_name = crosswalk_dataset_name,
                                  sps_name = crosswalk_sps_name))
  expect_silent(spss_ascii_reader(dataset_name = parole_survey_dataset_name,
                                  sps_name = parole_survey_sps_name))
  expect_silent(spss_ascii_reader(dataset_name = SHR_dataset_name,
                                  sps_name = SHR_sps_name))
})

test_that("No messages or warnings or errors for file loads - SAS", {
  skip_on_cran()

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

  expect_silent(sas_ascii_reader(dataset_name = NIBRS_dataset_name,
                                 sas_name = NIBRS_sas_name))
  expect_silent(sas_ascii_reader(dataset_name = UCR_dataset_name,
                                 sas_name = UCR_sas_name))
  expect_silent(sas_ascii_reader(dataset_name = SHR_dataset_name,
                                 sas_name = SHR_sas_name))
})
