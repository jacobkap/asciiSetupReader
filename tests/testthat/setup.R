# The fixture objects below are read when a test first uses them
# (delayedAssign()), so tests that are skipped, e.g. on CRAN, don't
# pay for them. Messages from reading them (e.g. implied decimals) are
# tested in test-messages.R, so they are kept out of the test log here.
suppressMessages({

SHR_dataset_name      <- system.file("extdata",
                                     "example_data.zip",
                                     package = "asciiSetupReader")
SHR_sps_name          <- system.file("extdata",
                                     "example_setup.sps",
                                     package = "asciiSetupReader")
SHR_sas_name          <- system.file("extdata",
                                     "example_setup.sas",
                                     package = "asciiSetupReader")
UCR_dataset_name      <- test_path("testdata",
                                     "ucr1960.zip")
UCR_sps_name          <- test_path("testdata",
                                     "ucr1960_sps.zip")
UCR_sas_name          <- test_path("testdata",
                                     "ucr1960_sas.zip")
NIBRS_dataset_name    <- test_path("testdata",
                                     "nibrs_2000_batch_header1.zip")
NIBRS_sps_name        <- test_path("testdata",
                                     "nibrs_2000_batch_header1_sps.zip")
NIBRS_sas_name        <- test_path("testdata",
                                     "nibrs_2000_batch_header1_sas.zip")
weimar_dataset_name   <- test_path("testdata",
                                     "weimar.txt")
weimar_sps_name       <- test_path("testdata",
                                     "weimar_sps.zip")
weimar_sas_name       <- test_path("testdata",
                                     "weimar_sas.zip")
# crosswalk_dataset_name     <- system.file("testdata",
#                                           "crosswalk.zip",
#                                           package = "asciiSetupReader")
crosswalk_sps_name         <- test_path("testdata",
                                          "crosswalk.sps")
ucr1985_sps_name           <- test_path("testdata",
                                          "1985_UCR_offenses_known_sps.zip")
ucr1986_sps_name           <- test_path("testdata",
                                          "1986_UCR_offenses_known_sps.zip")
ucr2000_sps_name           <- test_path("testdata",
                                          "2000_UCR_offenses_known_sps.zip")
ucr2006_sps_name           <- test_path("testdata",
                                          "2006_UCR_offenses_known_sps.zip")
sac_sps_name               <- test_path("testdata",
                                          "sacramento_sps.zip")
sex_offender_sps_name      <- test_path("testdata",
                                          "sex_offender_notification.sps")
ucr1960_sps_name           <- test_path("testdata",
                                          "ucr1960_sps.zip")
acs_sps_name               <- test_path("testdata",
                                          "acs_sps.zip")
nibrs_sps_name             <- test_path("testdata",
                                          "nibrs_2000_batch_header1_sps.zip")
prisoners_sps_name         <- test_path("testdata",
                                          "prisoners_sps.zip")
SHR1987_sps_name           <- test_path("testdata",
                                          "1987_SHR_sps.zip")
SHR1988_sps_name           <- test_path("testdata",
                                          "1988_SHR_sps.zip")
SHR1981_sps_name           <- test_path("testdata",
                                          "1981_SHR_sps.zip")
ca_vital_sps_name          <- test_path("testdata",
                                          "ca_vital.sps")
parole_sps_name            <- test_path("testdata",
                                          "parole_survey.sps")
parole_survey_dataset_name <- test_path("testdata",
                                          "parole_survey.txt")
SHR1987_sps_name           <- test_path("testdata",
                                          "1987_SHR_sps.zip")
SHR1988_sps_name           <- test_path("testdata",
                                          "1988_SHR_sps.zip")
SHR1981_sps_name           <- test_path("testdata",
                                          "1981_SHR_sps.zip")
leoka1980_sps_name         <- test_path("testdata",
                                          "1980_leoka_sps.zip")
property_stolen_sps_name   <- test_path("testdata",
                                          "ucr_property_stolen_1998_sps.zip")
ncvs_sps_name              <- test_path("testdata",
                                          "ncvs_1979_sps.zip")
jail_1987_sps_name         <- test_path("testdata",
                                          "jail_survey_1987.sps")
jail_2010_sps_name         <- test_path("testdata",
                                          "jail_survey_2010.sps")
jail_1987_dataset_name     <- test_path("testdata",
                                          "jail_survey_1987.zip")
corrections_sps_name       <- test_path("testdata",
                                          "corrections_prison_admissions_1991_2016.sps")
sadc_sps_name              <- test_path("testdata",
                                          "2017_sadc_spss_input_program.sps")
crosswalk2012_sps_name     <- test_path("testdata",
                                          "crosswalk2012.sps")
dutch_election_sps_name    <- test_path("testdata",
                                          "dutch_election_study_sps.zip")
well_being_sps_name        <- test_path("testdata",
                                          "WB2016.sps")
escolar_sps_name           <- test_path("testdata",
                                          "escolar.SPS")

ad_health_sps_name        <- test_path("testdata",
                                         "study_of_adolescent_health.sps")
health_nutrition_sps_name <- test_path("testdata",
                                         "health_and_nutrition.sps")
india_human_sps_name  <- test_path("testdata",
                                     "india_human_development_sps.zip")
british_crime_teen_sps_name  <- test_path("testdata",
                                            "british_crime_teen_sps.zip")
drug_abuse_sps_name          <- test_path("testdata",
                                            "drug_abuse_sps.zip")
worry_sps_name               <- test_path("testdata",
                                            "worry_sps.zip")
cps_1973_sps_name            <- test_path("testdata",
                                            "cps_1973_sps.zip")
cps_2004_sps_name           <- test_path("testdata",
                                           "cps_2004_sps.zip")
census_police_sps_name      <- test_path("testdata",
                                           "census_of_police.sps")
detroit_sps_name            <- test_path("testdata",
                                           "detroit_sps.zip")
step_in_sps_name            <- test_path("testdata",
                                           "step_in.sps")
cambridge_sps_name     <- test_path("testdata",
                                      "cambridge_sps.zip")
guam_sps_name          <- test_path("testdata",
                                      "guam_sps.zip")
china_2002_sps_name    <- test_path("testdata",
                                      "china_2002.sps")
china_1995_sps_name    <- test_path("testdata",
                                      "china_1995.sps")
china_1998_sps_name    <- test_path("testdata",
                                      "china_1998.sps")
indonesia_sps_name     <- test_path("testdata",
                                      "indonesia.sps")
UN_crime_sps_name      <- test_path("testdata",
                                      "UN_crime.sps")
county_arrest_sps_name <- test_path("testdata",
                                      "county_arrest.sps")
escolar_2006_sps_name <- test_path("testdata",
                                     "escolar_2006_sps.zip")
mtf_1999_sps_name     <- test_path("testdata",
                                     "monitoring_the_future_1999_sps.zip")
mtf_2003_sps_name     <- test_path("testdata",
                                     "monitoring_the_future_2003_sps.zip")
mtf_1990_sps_name     <- test_path("testdata",
                                     "monitoring_the_future_1990_sps.zip")
mtf_1989_sps_name     <- test_path("testdata",
                                     "monitoring_the_future_1989_sps.zip")
mtf_2004_sps_name     <- test_path("testdata",
                                     "monitoring_the_future_2004_sps.zip")
mtf_2002_sps_name     <- test_path("testdata",
                                     "monitoring_the_future_2002_sps.zip")
mtf_1993_sps_name     <- test_path("testdata",
                                     "monitoring_the_future_1993_sps.zip")
mtf_1991_sps_name     <- test_path("testdata",
                                     "monitoring_the_future_1991_sps.zip")
mtf_1992_sps_name     <- test_path("testdata",
                                     "monitoring_the_future_1992_sps.zip")
mtf_1979_sps_name     <- test_path("testdata",
                                     "monitoring_the_future_1979_sps.zip")
missing_value_no_s_name  <- test_path("testdata",
                                        "missing_value_no_s_setup_sps.zip")
ca_sedd_2005_ahal_sps_name     <- test_path("testdata",
                                     "CA_SEDD_2005_AHAL.sps")
mtf_2019_sps_name     <- test_path("testdata",
                                     "mtf_2019_8_10_sps.zip")


cambridge_sas_name     <- test_path("testdata",
                                      "cambridge_sas.zip")
guam_sas_name          <- test_path("testdata",
                                      "guam_sas.zip")
china_2002_sas_name    <- test_path("testdata",
                                      "china_2002.sas")
china_1995_sas_name    <- test_path("testdata",
                                      "china_1995.sas")
china_1998_sas_name    <- test_path("testdata",
                                      "china_1998.sas")
indonesia_sas_name     <- test_path("testdata",
                                      "indonesia.sas")
UN_crime_sas_name      <- test_path("testdata",
                                      "UN_crime.sas")
county_arrest_sas_name <- test_path("testdata",
                                      "county_arrest.sas")





british_crime_teen_sas_name  <- test_path("testdata",
                                            "british_crime_teen_sas.zip")
drug_abuse_sas_name          <- test_path("testdata",
                                            "drug_abuse_sas.zip")
worry_sas_name               <- test_path("testdata",
                                            "worry_sas.zip")
cps_1973_sas_name            <- test_path("testdata",
                                            "cps_1973_sas.zip")
education_1985_sas_name     <- test_path("testdata",
                                           "education_1985.sas")
education_1995_sas_name     <- test_path("testdata",
                                           "education_1995.sas")
cps_2004_sas_name           <- test_path("testdata",
                                           "cps_2004_sas.zip")
census_police_sas_name      <- test_path("testdata",
                                           "census_of_police.sas")
detroit_sas_name            <- test_path("testdata",
                                           "detroit_sas.zip")
step_in_sas_name            <- test_path("testdata",
                                           "step_in.sas")
psid_toy_sas_name          <- test_path("testdata",
                                          "psid_toy.sas")

health_nutrition_sas_name  <- test_path("testdata",
                                          "health_and_nutrition.sas")
india_human_sas_name       <- test_path("testdata",
                                          "india_human_development_sas.zip")
well_being_sas_name        <- test_path("testdata",
                                          "WB2016.sas")
crosswalk_sas_name         <- test_path("testdata",
                                          "crosswalk.sas")
ucr1985_sas_name           <- test_path("testdata",
                                          "1985_UCR_offenses_known_sas.zip")
ucr1986_sas_name           <- test_path("testdata",
                                          "1986_UCR_offenses_known_sas.zip")
ucr2000_sas_name           <- test_path("testdata",
                                          "2000_UCR_offenses_known_sas.zip")
ucr2006_sas_name           <- test_path("testdata",
                                          "2006_UCR_offenses_known_sas.zip")
sac_sas_name               <- test_path("testdata",
                                          "sacramento_sas.zip")
sex_offender_sas_name      <- test_path("testdata",
                                          "sex_offender_notification.sas")
ucr1960_sas_name           <- test_path("testdata",
                                          "ucr1960_sas.zip")
acs_sas_name               <- test_path("testdata",
                                          "acs_sas.zip")
nibrs_sas_name             <- test_path("testdata",
                                          "nibrs_2000_batch_header1_sas.zip")
prisoners_sas_name         <- test_path("testdata",
                                          "prisoners_sas.zip")
SHR1987_sas_name           <- test_path("testdata",
                                          "1987_SHR_sas.zip")
SHR1988_sas_name           <- test_path("testdata",
                                          "1988_SHR_sas.zip")
SHR1981_sas_name           <- test_path("testdata",
                                          "1981_SHR_sas.zip")
ca_vital_sas_name          <- test_path("testdata",
                                          "ca_vital.sas")
parole_sas_name            <- test_path("testdata",
                                          "parole_survey.sas")
SHR1987_sas_name           <- test_path("testdata",
                                          "1987_SHR_sas.zip")
SHR1988_sas_name           <- test_path("testdata",
                                          "1988_SHR_sas.zip")
SHR1981_sas_name           <- test_path("testdata",
                                          "1981_SHR_sas.zip")
leoka1980_sas_name         <- test_path("testdata",
                                          "1980_leoka_sas.zip")
property_stolen_sas_name   <- test_path("testdata",
                                          "ucr_property_stolen_1998_sas.zip")
ncvs_sas_name              <- test_path("testdata",
                                          "ncvs_1979_sas.zip")
jail_1987_sas_name         <- test_path("testdata",
                                          "jail_survey_1987.sas")
jail_2010_sas_name         <- test_path("testdata",
                                          "jail_survey_2010.sas")
jail_1987_dataset_name     <- test_path("testdata",
                                          "jail_survey_1987.zip")
corrections_sas_name       <- test_path("testdata",
                                          "corrections_prison_admissions_1991_2016.sas")
sadc_sas_name              <- test_path("testdata",
                                          "2017_sadc_sas_input_program.sas")
starting_number_bigger_than_ending_number <- test_path("testdata",
                                          "starting_number_bigger_than_ending_number.sps")


delayedAssign("parole", suppressMessages(read_ascii_setup(data = parole_survey_dataset_name,
                           setup_file = parole_sps_name,
                           use_clean_names = FALSE)))

delayedAssign("SHR2", suppressMessages(read_ascii_setup(data = SHR_dataset_name,
                         setup_file = SHR_sps_name, select_columns = 1:5)))
delayedAssign("SHR3", suppressMessages(read_ascii_setup(data = SHR_dataset_name,
                         setup_file = SHR_sps_name,
                         select_columns = c(1, 5, 50:55, 100:121, 152))))
delayedAssign("UCR2", suppressMessages(read_ascii_setup(data = UCR_dataset_name,
                         setup_file = UCR_sps_name,
                         select_columns = c("V1", "V50", "V100", "V111",
                                            "V1000"))))
delayedAssign("NIBRS2", suppressMessages(read_ascii_setup(data = NIBRS_dataset_name,
                           setup_file = NIBRS_sps_name,
                           select_columns = c("B1001", "B1005", "B1010",
                                              "B1016", "B1019"))))

# Read SAS ====================================================================
delayedAssign("SHR2_sas", suppressMessages(read_ascii_setup(data = SHR_dataset_name,
                               setup_file = SHR_sas_name, select_columns = 1:5)))
delayedAssign("SHR3_sas", suppressMessages(read_ascii_setup(data = SHR_dataset_name,
                               setup_file = SHR_sas_name,
                               select_columns = c(1, 5, 50:55, 100:121, 152))))
delayedAssign("UCR2_sas", suppressMessages(read_ascii_setup(data = UCR_dataset_name,
                               setup_file = UCR_sas_name,
                               select_columns = c("V1", "V50", "V100",
                                                  "V111", "V1000"))))
delayedAssign("NIBRS2_sas", suppressMessages(read_ascii_setup(data = NIBRS_dataset_name,
                               setup_file = NIBRS_sas_name,
                               select_columns = c("B1001", "B1005",
                                                  "B1010", "B1016", "B1019"))))

delayedAssign("SHR", suppressMessages(read_ascii_setup(data = SHR_dataset_name,
                               setup_file = SHR_sps_name)))
delayedAssign("UCR", suppressMessages(read_ascii_setup(data = UCR_dataset_name,
                               setup_file = UCR_sps_name,
                               select_columns = 1:150)))
delayedAssign("NIBRS", suppressMessages(read_ascii_setup(data = NIBRS_dataset_name,
                               setup_file = NIBRS_sps_name)))
delayedAssign("SHR_sas", suppressMessages(read_ascii_setup(data = SHR_dataset_name,
                               setup_file = SHR_sas_name)))
delayedAssign("UCR_sas", suppressMessages(read_ascii_setup(data = UCR_dataset_name,
                               setup_file = UCR_sas_name,
                               select_columns = 1:150)))
delayedAssign("NIBRS_sas", suppressMessages(read_ascii_setup(data = NIBRS_dataset_name,
                               setup_file = NIBRS_sas_name)))
delayedAssign("weimar", suppressMessages(read_ascii_setup(data = weimar_dataset_name,
                               setup_file = weimar_sps_name)))
delayedAssign("weimar_sas", suppressMessages(read_ascii_setup(data = weimar_dataset_name,
                               setup_file = weimar_sas_name)))



delayedAssign("SHR_names", suppressMessages(read_ascii_setup(data = SHR_dataset_name,
                                 setup_file = SHR_sps_name,
                                 select_columns = c(1, 33, 45, 72, 100, 152))))
delayedAssign("SHR2_names", suppressMessages(read_ascii_setup(data = SHR_dataset_name,
                                 setup_file = SHR_sps_name,
                                 use_clean_names = FALSE,
                                 select_columns = c(1, 33, 45, 72, 100, 152))))
delayedAssign("UCR_names", suppressMessages(read_ascii_setup(data = UCR_dataset_name,
                                 setup_file = UCR_sps_name,
                                 select_columns = c(1, 33, 345, 572, 1000, 1400))))
delayedAssign("UCR2_names", suppressMessages(read_ascii_setup(data = UCR_dataset_name,
                                 setup_file = UCR_sps_name,
                                 select_columns = c(1, 33, 345, 572, 1000, 1400),
                                 use_clean_names = FALSE)))
delayedAssign("NIBRS_names", suppressMessages(read_ascii_setup(data = NIBRS_dataset_name,
                                  setup_file = NIBRS_sps_name,
                                  select_columns = c(1, 3, 5, 7, 10, 15))))
delayedAssign("NIBRS2_names", suppressMessages(read_ascii_setup(data = NIBRS_dataset_name,
                                  setup_file = NIBRS_sps_name,
                                  use_clean_names = FALSE,
                                  select_columns = c(1, 3, 5, 7, 10, 15))))

delayedAssign("weimar_names", suppressMessages(read_ascii_setup(data = weimar_dataset_name,
                                  setup_file = weimar_sps_name,
                                  select_columns = c(1:7, 23))))
delayedAssign("weimar2_names", suppressMessages(read_ascii_setup(data = weimar_dataset_name,
                                  setup_file = weimar_sps_name,
                                  use_clean_names = FALSE)))


# Read SAS ===============================================================
delayedAssign("SHR_sas_names", suppressMessages(read_ascii_setup(data = SHR_dataset_name,
                                      setup_file = SHR_sas_name,
                                      select_columns = c(1, 33, 45, 72, 100, 152))))
delayedAssign("SHR2_sas_names", suppressMessages(read_ascii_setup(data = SHR_dataset_name,
                                      setup_file = SHR_sas_name,
                                      use_clean_names = FALSE,
                                      select_columns = c(1, 33, 45,
                                                         72, 100, 152))))
delayedAssign("UCR_sas_names", suppressMessages(read_ascii_setup(data = UCR_dataset_name,
                                      setup_file = UCR_sas_name,
                                      select_columns = c(1, 33, 345,
                                                         572, 1000, 1400))))
delayedAssign("UCR2_sas_names", suppressMessages(read_ascii_setup(data = UCR_dataset_name,
                                      setup_file = UCR_sas_name,
                                      select_columns = c(1, 33, 345,
                                                         572, 1000, 1400),
                                      use_clean_names = FALSE)))
delayedAssign("NIBRS_sas_names", suppressMessages(read_ascii_setup(data = NIBRS_dataset_name,
                                      setup_file = NIBRS_sas_name,
                                      select_columns = c(1, 3, 5, 7, 10, 15))))
delayedAssign("NIBRS2_sas_names", suppressMessages(read_ascii_setup(data = NIBRS_dataset_name,
                                      setup_file = NIBRS_sas_name,
                                      use_clean_names = FALSE,
                                      select_columns = c(1, 3, 5, 7, 10, 15))))

delayedAssign("weimar_sas_names", suppressMessages(read_ascii_setup(data = weimar_dataset_name,
                                      setup_file = weimar_sas_name,
                                      select_columns = c(1:7, 23))))
delayedAssign("weimar2_sas_names", suppressMessages(read_ascii_setup(data = weimar_dataset_name,
                                      setup_file = weimar_sas_name,
                                      use_clean_names = FALSE)))
# crosswalk         <- read_ascii_setup(data = crosswalk_dataset_name,
#                                       setup_file = crosswalk_sps_name,
#                                       use_clean_names = FALSE)

delayedAssign("parole_parsed_sps", suppressMessages(parse_setup(parole_sps_name)))
delayedAssign("sac_parsed_sps", suppressMessages(parse_setup(sac_sps_name)))
delayedAssign("sex_offender_parsed_sps", suppressMessages(parse_setup(sex_offender_sps_name)))
delayedAssign("ucr1960_parsed_sps", suppressMessages(parse_setup(ucr1960_sps_name)))
delayedAssign("weimar_parsed_sps", suppressMessages(parse_setup(weimar_sps_name)))
delayedAssign("acs_parsed_sps", suppressMessages(parse_setup(acs_sps_name)))
delayedAssign("nibrs_parsed_sps", suppressMessages(parse_setup(nibrs_sps_name)))
delayedAssign("prisoners_parsed_sps", suppressMessages(parse_setup(prisoners_sps_name)))
delayedAssign("ca_vital_parsed_sps", suppressMessages(parse_setup(ca_vital_sps_name)))
delayedAssign("crosswalk_parsed_sps", suppressMessages(parse_setup(crosswalk_sps_name)))
delayedAssign("ucr1985_parsed_sps", suppressMessages(parse_setup(ucr1985_sps_name)))
delayedAssign("ucr1986_parsed_sps", suppressMessages(parse_setup(ucr1986_sps_name)))
delayedAssign("ucr2000_parsed_sps", suppressMessages(parse_setup(ucr2000_sps_name)))
#ucr2006_parsed_sps         <- parse_setup(ucr2006_sps_name)
delayedAssign("SHR1987_parsed_sps", suppressMessages(parse_setup(SHR1987_sps_name)))
delayedAssign("SHR1988_parsed_sps", suppressMessages(parse_setup(SHR1988_sps_name)))
delayedAssign("SHR1981_parsed_sps", suppressMessages(parse_setup(SHR1981_sps_name)))
delayedAssign("leoka1980_parsed_sps", suppressMessages(parse_setup(leoka1980_sps_name)))
delayedAssign("property_stolen_parsed_sps", suppressMessages(parse_setup(property_stolen_sps_name)))
delayedAssign("ncvs_parsed_sps", suppressMessages(parse_setup(ncvs_sps_name)))
delayedAssign("jail_1987_parsed_sps", suppressMessages(parse_setup(jail_1987_sps_name)))
delayedAssign("jail_2010_parsed_sps", suppressMessages(parse_setup(jail_2010_sps_name)))
delayedAssign("corrections_parsed_sps", suppressMessages(parse_setup(corrections_sps_name)))
delayedAssign("sadc_parsed_sps", suppressMessages(parse_setup(sadc_sps_name)))
delayedAssign("crosswalk2012_parsed_sps", suppressMessages(parse_setup(crosswalk2012_sps_name)))
delayedAssign("dutch_election_parsed_sps", suppressMessages(parse_setup(dutch_election_sps_name)))
delayedAssign("well_being_parsed_sps", suppressMessages(parse_setup(well_being_sps_name)))
delayedAssign("escolar_parsed_sps", suppressMessages(parse_setup(escolar_sps_name)))
delayedAssign("ad_health_parsed_sps", suppressMessages(parse_setup(ad_health_sps_name)))
delayedAssign("health_nutrition_parsed_sps", suppressMessages(parse_setup(health_nutrition_sps_name)))
delayedAssign("india_human_parsed_sps", suppressMessages(parse_setup(india_human_sps_name)))
delayedAssign("step_in_parsed_sps", suppressMessages(parse_setup(step_in_sps_name)))
delayedAssign("cps_1973_parsed_sps", suppressMessages(parse_setup(cps_1973_sps_name)))
delayedAssign("census_police_parsed_sps", suppressMessages(parse_setup(census_police_sps_name)))
delayedAssign("british_crime_teen_parsed_sps", suppressMessages(parse_setup(british_crime_teen_sps_name)))
delayedAssign("drug_abuse_parsed_sps", suppressMessages(parse_setup(drug_abuse_sps_name)))
delayedAssign("detroit_parsed_sps", suppressMessages(parse_setup(detroit_sps_name)))
delayedAssign("worry_parsed_sps", suppressMessages(parse_setup(worry_sps_name)))
delayedAssign("cps_2004_parsed_sps", suppressMessages(parse_setup(cps_2004_sps_name)))
delayedAssign("cambridge_parsed_sps", suppressMessages(parse_setup(cambridge_sps_name)))
delayedAssign("guam_parsed_sps", suppressMessages(parse_setup(guam_sps_name)))
delayedAssign("china_2002_parsed_sps", suppressMessages(parse_setup(china_2002_sps_name)))
delayedAssign("china_1995_parsed_sps", suppressMessages(parse_setup(china_1995_sps_name)))
delayedAssign("china_1998_parsed_sps", suppressMessages(parse_setup(china_1998_sps_name)))
delayedAssign("indonesia_parsed_sps", suppressMessages(parse_setup(indonesia_sps_name)))
delayedAssign("UN_crime_parsed_sps", suppressMessages(parse_setup(UN_crime_sps_name)))
delayedAssign("county_arrest_parsed_sps", suppressMessages(parse_setup(county_arrest_sps_name)))
delayedAssign("cambridge_parsed_sas", suppressMessages(parse_setup(cambridge_sas_name)))
delayedAssign("guam_parsed_sas", suppressMessages(parse_setup(guam_sas_name)))
delayedAssign("china_2002_parsed_sas", suppressMessages(parse_setup(china_2002_sas_name)))
delayedAssign("china_1995_parsed_sas", suppressMessages(parse_setup(china_1995_sas_name)))
delayedAssign("china_1998_parsed_sas", suppressMessages(parse_setup(china_1998_sas_name)))
delayedAssign("indonesia_parsed_sas", suppressMessages(parse_setup(indonesia_sas_name)))
delayedAssign("UN_crime_parsed_sas", suppressMessages(parse_setup(UN_crime_sas_name)))
delayedAssign("county_arrest_parsed_sas", suppressMessages(parse_setup(county_arrest_sas_name)))
delayedAssign("escolar_2006_parsed_sps", suppressMessages(parse_setup(escolar_2006_sps_name)))
delayedAssign("mtf_1999_parsed_sps", suppressMessages(parse_setup(mtf_1999_sps_name)))
delayedAssign("mtf_2003_parsed_sps", suppressMessages(parse_setup(mtf_2003_sps_name)))
delayedAssign("mtf_1990_parsed_sps", suppressMessages(parse_setup(mtf_1990_sps_name)))
delayedAssign("mtf_1989_parsed_sps", suppressMessages(parse_setup(mtf_1989_sps_name)))
delayedAssign("mtf_2004_parsed_sps", suppressMessages(parse_setup(mtf_2004_sps_name)))
delayedAssign("mtf_2002_parsed_sps", suppressMessages(parse_setup(mtf_2002_sps_name)))
delayedAssign("mtf_1993_parsed_sps", suppressMessages(parse_setup(mtf_1993_sps_name)))
delayedAssign("mtf_1991_parsed_sps", suppressMessages(parse_setup(mtf_1991_sps_name)))
delayedAssign("mtf_1992_parsed_sps", suppressMessages(parse_setup(mtf_1992_sps_name)))
delayedAssign("mtf_1979_parsed_sps", suppressMessages(parse_setup(mtf_1979_sps_name)))
delayedAssign("missing_value_no_s_parsed_sps", suppressMessages(parse_setup(missing_value_no_s_name)))
delayedAssign("ca_sedd_2005_ahal_parsed_sps", suppressMessages(parse_setup(ca_sedd_2005_ahal_sps_name)))
delayedAssign("mtf_2019_parsed_sps", suppressMessages(parse_setup(mtf_2019_sps_name)))


delayedAssign("british_crime_teen_parsed_sas", suppressMessages(parse_setup(british_crime_teen_sas_name)))
delayedAssign("drug_abuse_parsed_sas", suppressMessages(parse_setup(drug_abuse_sas_name)))
delayedAssign("detroit_parsed_sas", suppressMessages(parse_setup(detroit_sas_name)))
delayedAssign("worry_parsed_sas", suppressMessages(parse_setup(worry_sas_name)))
delayedAssign("cps_2004_parsed_sas", suppressMessages(parse_setup(cps_2004_sas_name)))
delayedAssign("step_in_parsed_sas", suppressMessages(parse_setup(step_in_sas_name)))
delayedAssign("education_1985_parsed_sas", suppressMessages(parse_setup(education_1985_sas_name)))
delayedAssign("education_1995_parsed_sas", suppressMessages(parse_setup(education_1995_sas_name)))
delayedAssign("cps_1973_parsed_sas", suppressMessages(parse_setup(cps_1973_sas_name)))
delayedAssign("census_police_parsed_sas", suppressMessages(parse_setup(census_police_sas_name)))
delayedAssign("psid_toy_parsed_sas", suppressMessages(parse_setup(psid_toy_sas_name)))
delayedAssign("health_nutrition_parsed_sas", suppressMessages(parse_setup(health_nutrition_sas_name)))
delayedAssign("india_human_parsed_sas", suppressMessages(parse_setup(india_human_sas_name)))
delayedAssign("well_being_parsed_sas", suppressMessages(parse_setup(well_being_sas_name)))
delayedAssign("parole_parsed_sas", suppressMessages(parse_setup(parole_sas_name)))
delayedAssign("sac_parsed_sas", suppressMessages(parse_setup(sac_sas_name)))
delayedAssign("sex_offender_parsed_sas", suppressMessages(parse_setup(sex_offender_sas_name)))
delayedAssign("ucr1960_parsed_sas", suppressMessages(parse_setup(ucr1960_sas_name)))
delayedAssign("weimar_parsed_sas", suppressMessages(parse_setup(weimar_sas_name)))
delayedAssign("acs_parsed_sas", suppressMessages(parse_setup(acs_sas_name)))
delayedAssign("nibrs_parsed_sas", suppressMessages(parse_setup(nibrs_sas_name)))
delayedAssign("prisoners_parsed_sas", suppressMessages(parse_setup(prisoners_sas_name)))
delayedAssign("ca_vital_parsed_sas", suppressMessages(parse_setup(ca_vital_sas_name)))
delayedAssign("crosswalk_parsed_sas", suppressMessages(parse_setup(crosswalk_sas_name)))
delayedAssign("ucr1985_parsed_sas", suppressMessages(parse_setup(ucr1985_sas_name)))
delayedAssign("ucr1986_parsed_sas", suppressMessages(parse_setup(ucr1986_sas_name)))
delayedAssign("ucr2000_parsed_sas", suppressMessages(parse_setup(ucr2000_sas_name)))
#ucr2006_parsed_sas         <- parse_setup(ucr2006_sas_name)
delayedAssign("SHR1987_parsed_sas", suppressMessages(parse_setup(SHR1987_sas_name)))
delayedAssign("SHR1988_parsed_sas", suppressMessages(parse_setup(SHR1988_sas_name)))
delayedAssign("SHR1981_parsed_sas", suppressMessages(parse_setup(SHR1981_sas_name)))
delayedAssign("leoka1980_parsed_sas", suppressMessages(parse_setup(leoka1980_sas_name)))
delayedAssign("property_stolen_parsed_sas", suppressMessages(parse_setup(property_stolen_sas_name)))
delayedAssign("ncvs_parsed_sas", suppressMessages(parse_setup(ncvs_sas_name)))
delayedAssign("jail_1987_parsed_sas", suppressMessages(parse_setup(jail_1987_sas_name)))
delayedAssign("jail_2010_parsed_sas", suppressMessages(parse_setup(jail_2010_sas_name)))
delayedAssign("corrections_parsed_sas", suppressMessages(parse_setup(corrections_sas_name)))
delayedAssign("SHR_parsed_sas", suppressMessages(parse_setup(SHR_sas_name)))
#sadc_parsed_sas            <- parse_setup(sadc_sas_name)


})
