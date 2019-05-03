context("There are no warning or error messages")


test_that("No messages or warnings or errors for file loads - SPSS", {
  skip_on_cran()


  expect_silent(read_ascii_setup(data = dutch_election_dataset_name,
                                 setup_file = dutch_election_sps_name))
  expect_silent(read_ascii_setup(data = dutch_election_dataset_name,
                                 setup_file = dutch_election_sps_name,
                                 select_columns = 1:5))
  expect_silent(read_ascii_setup(data = dutch_election_dataset_name,
                                 setup_file = dutch_election_sps_name,
                                 select_columns = c(1:5, 7, 111:123)))


  expect_silent(read_ascii_setup(data = jail_1987_dataset_name,
                                 setup_file = jail_1987_sps_name))
  expect_silent(read_ascii_setup(data = jail_1987_dataset_name,
                                 setup_file = jail_1987_sps_name,
                                 select_columns = 1:5))
  expect_silent(read_ascii_setup(data = jail_1987_dataset_name,
                                 setup_file = jail_1987_sps_name,
                                 select_columns = c(1:5, 7, 11)))

  expect_silent(read_ascii_setup(data = SHR_dataset_name,
                                 setup_file = SHR_sps_name,
                                 select_columns = 3))
  expect_silent(read_ascii_setup(data = SHR_dataset_name,
                                 setup_file = SHR_sps_name,
                                 select_columns = 100))
  expect_silent(read_ascii_setup(data = SHR_dataset_name,
                                 setup_file = SHR_sps_name,
                                 select_columns = c(3, 10, 100)))


  expect_silent(read_ascii_setup(data = UCR_dataset_name,
                                 setup_file = UCR_sps_name,
                                 select_columns = 1))
  expect_silent(read_ascii_setup(data = UCR_dataset_name,
                                 setup_file = UCR_sps_name,
                                 select_columns = 1200))
  expect_silent(read_ascii_setup(data = UCR_dataset_name,
                                 setup_file = UCR_sps_name,
                                 select_columns = c("ID_CODE",
                                                    "NUMERIC_STATE_CODE",
                                                    "ORI_CODE",
                                                    "CORE_CITY_INDICATION",
                                                    "DIVISION",
                                                    "NUMBER_OF_MONTHS_REPORTED",
                                                    "FOLLOW_UP_INDICATION",
                                                    "SPECIAL_MAILING_GROUP",
                                                    "JAN_MONTH_INCLUDED_IN",
                                                    "JAN_CARD_0_TYPE")))

  expect_silent(read_ascii_setup(data = NIBRS_dataset_name,
                                 setup_file = NIBRS_sps_name,
                                 select_columns = 1))
  expect_silent(read_ascii_setup(data = NIBRS_dataset_name,
                                 setup_file = NIBRS_sps_name,
                                 select_columns = 1:3))
  expect_silent(read_ascii_setup(data = NIBRS_dataset_name,
                                 setup_file = NIBRS_sps_name,
                                 select_columns = 3))

  expect_silent(read_ascii_setup(data = weimar_dataset_name,
                                 setup_file = weimar_sps_name))
  expect_silent(read_ascii_setup(data = weimar_dataset_name,
                                 setup_file = weimar_sps_name,
                                 select_columns = 4))
  expect_silent(read_ascii_setup(data = weimar_dataset_name,
                                 setup_file = weimar_sps_name,
                                 select_columns = 3))


  expect_silent(read_ascii_setup(data = crosswalk_dataset_name,
                                 setup_file = crosswalk_sps_name,
                                 select_columns = 4))
  expect_silent(read_ascii_setup(data = crosswalk_dataset_name,
                                 setup_file = crosswalk_sps_name,
                                 use_clean_names = FALSE))



  expect_silent(read_ascii_setup(data = parole_survey_dataset_name,
                                 setup_file = parole_sps_name,
                                 select_columns = 4))
  expect_silent(read_ascii_setup(data = parole_survey_dataset_name,
                                 setup_file = parole_sps_name,
                                 use_clean_names = FALSE))

  expect_silent(read_ascii_setup(data = UCR_dataset_name,
                                 setup_file = UCR_sps_name))
  expect_silent(read_ascii_setup(data = crosswalk_dataset_name,
                                 setup_file = crosswalk_sps_name))
  expect_silent(read_ascii_setup(data = parole_survey_dataset_name,
                                 setup_file = parole_sps_name))
  expect_silent(read_ascii_setup(data = SHR_dataset_name,
                                 setup_file = SHR_sps_name))
})

test_that("No messages or warnings or errors for file loads - SAS", {
  skip_on_cran()

  expect_silent(read_ascii_setup(data = SHR_dataset_name,
                                 setup_file = SHR_sas_name,
                                 select_columns = 3))
  expect_silent(read_ascii_setup(data = SHR_dataset_name,
                                 setup_file = SHR_sas_name,
                                 select_columns = 100))
  expect_silent(read_ascii_setup(data = SHR_dataset_name,
                                 setup_file = SHR_sas_name,
                                 select_columns = c(3, 10, 100)))


  expect_silent(read_ascii_setup(data = UCR_dataset_name,
                                 setup_file = UCR_sas_name,
                                 select_columns = 1))
  expect_silent(read_ascii_setup(data = UCR_dataset_name,
                                 setup_file = UCR_sas_name,
                                 select_columns = 1200))
  expect_silent(read_ascii_setup(data = UCR_dataset_name,
                                 setup_file = UCR_sas_name,
                                 select_columns = c("ID_CODE",
                                                    "NUMERIC_STATE_CODE",
                                                    "ORI_CODE",
                                                    "CORE_CITY_INDICATION",
                                                    "DIVISION",
                                                    "NUMBER_OF_MONTHS_REPORTED",
                                                    "FOLLOW_UP_INDICATION",
                                                    "SPECIAL_MAILING_GROUP",
                                                    "JAN_MONTH_INCLUDED_IN",
                                                    "JAN_CARD_0_TYPE")))

  expect_silent(read_ascii_setup(data = NIBRS_dataset_name,
                                 setup_file = NIBRS_sas_name,
                                 select_columns = 1))
  expect_silent(read_ascii_setup(data = NIBRS_dataset_name,
                                 setup_file = NIBRS_sas_name,
                                 select_columns = 1:3))
  expect_silent(read_ascii_setup(data = NIBRS_dataset_name,
                                 setup_file = NIBRS_sas_name,
                                 select_columns = 3))

  expect_silent(read_ascii_setup(data = weimar_dataset_name,
                                 setup_file = weimar_sas_name))
  expect_silent(read_ascii_setup(data = weimar_dataset_name,
                                 setup_file = weimar_sas_name,
                                 select_columns = 4))
  expect_silent(read_ascii_setup(data = weimar_dataset_name,
                                 setup_file = weimar_sas_name,
                                 select_columns = 3))

  expect_silent(read_ascii_setup(data = NIBRS_dataset_name,
                                 setup_file = NIBRS_sas_name))
  expect_silent(read_ascii_setup(data = UCR_dataset_name,
                                 setup_file = UCR_sas_name))
  expect_silent(read_ascii_setup(data = SHR_dataset_name,
                                 setup_file = SHR_sas_name))
})
