context("There are no warning or error messages")


test_that("parse_setup is silent", {
  skip_on_cran()
  expect_silent(parse_setup(crosswalk_sas_name))
  expect_silent(parse_setup(parole_sas_name))
  expect_silent(parse_setup(ucr1985_sas_name))
  expect_silent(parse_setup(ucr1986_sas_name))
  expect_silent(parse_setup(ucr2000_sas_name))
  #  expect_silent(parse_setup(ucr2006_sas_name))
  expect_silent(parse_setup(sac_sas_name))
  expect_silent(parse_setup(sex_offender_sas_name))
  expect_silent(parse_setup(ucr1960_sas_name))
  expect_silent(parse_setup(weimar_sas_name))
  expect_silent(parse_setup(acs_sas_name))
  expect_silent(parse_setup(nibrs_sas_name))
  expect_silent(parse_setup(prisoners_sas_name))
  expect_silent(parse_setup(SHR1987_sas_name))
  expect_silent(parse_setup(SHR1988_sas_name))
  expect_silent(parse_setup(SHR1981_sas_name))
  expect_silent(parse_setup(ca_vital_sas_name))
  expect_silent(parse_setup(ncvs_sas_name))
  expect_silent(parse_setup(jail_1987_sas_name))
  expect_silent(parse_setup(jail_2010_sas_name))
  expect_silent(parse_setup(corrections_sas_name))
  expect_silent(parse_setup(well_being_sas_name))
  expect_silent(parse_setup(psid_toy_sas_name))
  #expect_silent(parse_setup(escolar_sas_name))
  expect_silent(parse_setup(health_nutrition_sas_name))
  expect_silent(parse_setup(psid_core_sas_name))
  expect_silent(parse_setup(india_human_sas_name))
  expect_silent(parse_setup(psid_supplement_sas_name))
  expect_silent(parse_setup(step_in_sas_name))
  expect_silent(parse_setup(education_1985_sas_name))
  expect_silent(parse_setup(education_1995_sas_name))
  expect_silent(parse_setup(cps_1973_sas_name))
  expect_silent(parse_setup(census_police_sas_name))
  expect_silent(parse_setup(cambridge_sas_name))
  expect_silent(parse_setup(guam_sas_name))
  expect_silent(parse_setup(china_2002_sas_name))
  expect_silent(parse_setup(china_1995_sas_name))
  expect_silent(parse_setup(china_1998_sas_name))
  expect_silent(parse_setup(indonesia_sas_name))
  expect_silent(parse_setup(UN_crime_sas_name))
  expect_silent(parse_setup(county_arrest_sas_name))


})

test_that("parse_setup is silent", {
  skip_on_cran()
  expect_silent(parse_setup(crosswalk_sps_name))
  expect_silent(parse_setup(parole_sps_name))
  expect_silent(parse_setup(ucr1985_sps_name))
  expect_silent(parse_setup(ucr1986_sps_name))
  expect_silent(parse_setup(ucr2000_sps_name))
  #  expect_silent(parse_setup(ucr2006_sps_name))
  expect_silent(parse_setup(sac_sps_name))
  expect_silent(parse_setup(sex_offender_sps_name))
  expect_silent(parse_setup(ucr1960_sps_name))
  expect_silent(parse_setup(weimar_sps_name))
  expect_silent(parse_setup(acs_sps_name))
  expect_silent(parse_setup(nibrs_sps_name))
  expect_silent(parse_setup(prisoners_sps_name))
  expect_silent(parse_setup(SHR1987_sps_name))
  expect_silent(parse_setup(SHR1988_sps_name))
  expect_silent(parse_setup(SHR1981_sps_name))
  expect_silent(parse_setup(ca_vital_sps_name))
  expect_silent(parse_setup(ncvs_sps_name))
  expect_silent(parse_setup(jail_1987_sps_name))
  expect_silent(parse_setup(jail_2010_sps_name))
  expect_silent(parse_setup(corrections_sps_name))
  expect_silent(parse_setup(sadc_sps_name))
  expect_silent(parse_setup(crosswalk2012_sps_name))
  expect_silent(parse_setup(dutch_election_sps_name))
  expect_silent(parse_setup(well_being_sps_name))
  expect_silent(parse_setup(psid_supplement_sps_name))
  expect_silent(parse_setup(health_nutrition_sps_name))
  expect_silent(parse_setup(ad_health_sps_name))
  expect_silent(parse_setup(india_human_sps_name))
  expect_silent(parse_setup(psid_core_sps_name))
  expect_silent(parse_setup(step_in_sps_name))
  expect_silent(parse_setup(cps_1973_sps_name))
  expect_silent(parse_setup(census_police_sps_name))
  expect_silent(parse_setup(psid_core_sps_name))
  expect_silent(parse_setup(step_in_sps_name))
  expect_silent(parse_setup(cps_1973_sps_name))
  expect_silent(parse_setup(census_police_sps_name))
  expect_silent(parse_setup(escolar_sps_name))
  expect_silent(parse_setup(british_crime_teen_sps_name))
  expect_silent(parse_setup(drug_abuse_sps_name))
  expect_silent(parse_setup(detroit_sps_name))
  expect_silent(parse_setup(worry_sps_name))
  expect_silent(parse_setup(cps_2004_sps_name))
  expect_silent(parse_setup(cambridge_sps_name))
  expect_silent(parse_setup(guam_sps_name))
  expect_silent(parse_setup(china_2002_sps_name))
  expect_silent(parse_setup(china_1995_sps_name))
  expect_silent(parse_setup(china_1998_sps_name))
  expect_silent(parse_setup(indonesia_sps_name))
  expect_silent(parse_setup(UN_crime_sps_name))
  expect_silent(parse_setup(county_arrest_sps_name))
  expect_silent(parse_setup(escolar_2006_sps_name))

})

test_that("No messages or warnings or errors for PSID Main", {
  # PSID main take SUPER LONG so they are separate and
  # skipped on both CRAN and TravisCI
  skip_on_cran()
  skip_on_travis()

  expect_silent(parse_setup(psid_main_sps_name))
  expect_silent(parse_setup(psid_main_sas_name))
})


test_that("No messages or warnings or errors for file loads - SPSS", {
  skip_on_cran()
  skip_on_travis()

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




  expect_silent(read_ascii_setup(data = parole_survey_dataset_name,
                                 setup_file = parole_sps_name,
                                 select_columns = 4))
  expect_silent(read_ascii_setup(data = parole_survey_dataset_name,
                                 setup_file = parole_sps_name,
                                 use_clean_names = FALSE))

  expect_silent(read_ascii_setup(data = UCR_dataset_name,
                                 setup_file = UCR_sps_name))
  expect_silent(read_ascii_setup(data = parole_survey_dataset_name,
                                 setup_file = parole_sps_name))
  expect_silent(read_ascii_setup(data = SHR_dataset_name,
                                 setup_file = SHR_sps_name))
})

test_that("No messages or warnings or errors for file loads - SAS", {
  skip_on_cran()
  skip_on_travis()


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
