x <- Sys.time()
SHR_dataset_name      <- system.file("extdata", "example_data.zip",
                                     package = "asciiSetupReader")
SHR_sps_name          <- system.file("extdata", "example_setup.sps",
                                     package = "asciiSetupReader")
SHR_sas_name          <- system.file("extdata", "example_setup.sas",
                                     package = "asciiSetupReader")
UCR_dataset_name      <- system.file("testdata", "ucr1960.zip",
                                     package = "asciiSetupReader")
UCR_sps_name          <- system.file("testdata", "ucr1960_sps.zip",
                                     package = "asciiSetupReader")
UCR_sas_name          <- system.file("testdata", "ucr1960_sas.zip",
                                     package = "asciiSetupReader")
NIBRS_dataset_name    <- system.file("testdata", "nibrs_2000_batch_header1.zip",
                                     package = "asciiSetupReader")
NIBRS_sps_name        <- system.file("testdata", "nibrs_2000_batch_header1_sps.zip",
                                     package = "asciiSetupReader")
NIBRS_sas_name        <- system.file("testdata", "nibrs_2000_batch_header1_sas.zip",
                                     package = "asciiSetupReader")
weimar_dataset_name   <- system.file("testdata", "weimar.txt",
                                     package = "asciiSetupReader")
weimar_sps_name       <- system.file("testdata", "weimar_sps.zip",
                                     package = "asciiSetupReader")
weimar_sas_name       <- system.file("testdata", "weimar_sas.zip",
                                     package = "asciiSetupReader")
crosswalk_dataset_name <- system.file("testdata", "crosswalk.zip",
                                      package = "asciiSetupReader")
crosswalk_sps_name    <- system.file("testdata", "crosswalk_sps.zip",
                                     package = "asciiSetupReader")
ucr1985_sps_name      <- system.file("testdata", "1985_UCR_offenses_known_sps.zip",
                                     package = "asciiSetupReader")
ucr1986_sps_name      <- system.file("testdata", "1986_UCR_offenses_known_sps.zip",
                                     package = "asciiSetupReader")
ucr2000_sps_name      <- system.file("testdata", "2000_UCR_offenses_known_sps.zip",
                                     package = "asciiSetupReader")
ucr2006_sps_name      <- system.file("testdata", "2006_UCR_offenses_known_sps.zip",
                                     package = "asciiSetupReader")
sac_sps_name          <- system.file("testdata", "sacramento_sps.zip",
                                     package = "asciiSetupReader")
sex_offender_sps_name <- system.file("testdata", "sex_offender_notification_sps.zip",
                                     package = "asciiSetupReader")
ucr1960_sps_name      <- system.file("testdata", "ucr1960_sps.zip",
                                     package = "asciiSetupReader")
acs_sps_name          <- system.file("testdata", "acs_sps.zip",
                                     package = "asciiSetupReader")
nibrs_sps_name        <- system.file("testdata", "nibrs_2000_batch_header1_sps.zip",
                                     package = "asciiSetupReader")
prisoners_sps_name    <- system.file("testdata", "prisoners_sps.zip",
                                     package = "asciiSetupReader")
SHR1987_sps_name      <- system.file("testdata", "1987_SHR_sps.zip",
                                     package = "asciiSetupReader")
SHR1988_sps_name      <- system.file("testdata", "1988_SHR_sps.zip",
                                     package = "asciiSetupReader")
SHR1981_sps_name      <- system.file("testdata", "1981_SHR_sps.zip",
                                     package = "asciiSetupReader")
ca_vital_sps_name     <- system.file("testdata", "ca_vital_sps.zip",
                                     package = "asciiSetupReader")
parole_sps_name       <- system.file("testdata", "parole_survey_sps.zip",
                                     package = "asciiSetupReader")
parole_survey_dataset_name <- system.file("testdata", "parole_survey.txt",
                                          package = "asciiSetupReader")
parole_survey_sps_name     <- system.file("testdata", "parole_survey_sps.zip",
                                          package = "asciiSetupReader")
SHR1987_sps_name           <- system.file("testdata", "1987_SHR_sps.zip",
                                        package = "asciiSetupReader")
SHR1988_sps_name           <- system.file("testdata", "1988_SHR_sps.zip",
                                        package = "asciiSetupReader")
SHR1981_sps_name           <- system.file("testdata", "1981_SHR_sps.zip",
                                        package = "asciiSetupReader")
leoka1980_sps_name         <- system.file("testdata", "1980_leoka.zip",
                                        package = "asciiSetupReader")
property_stolen_sps_name   <- system.file("testdata", "ucr_property_stolen_1998_sps.zip",
                                        package = "asciiSetupReader")


parole <- spss_ascii_reader(dataset_name = parole_survey_dataset_name,
                            sps_name = parole_sps_name,
                            real_names = FALSE)

SHR2 <- spss_ascii_reader(dataset_name = SHR_dataset_name,
                          sps_name = SHR_sps_name, keep_columns = 1:5)
SHR3 <- spss_ascii_reader(dataset_name = SHR_dataset_name,
                          sps_name = SHR_sps_name,
                          keep_columns = c(1, 5, 50:55, 100:121, 152))


UCR2 <- spss_ascii_reader(dataset_name = UCR_dataset_name,
                          sps_name = UCR_sps_name,
                          keep_columns = c("V1", "V50", "V100", "V111",
                                           "V1000"))
NIBRS2 <- spss_ascii_reader(dataset_name = NIBRS_dataset_name,
                            sps_name = NIBRS_sps_name,
                            keep_columns = c("B1001", "B1005", "B1010",
                                             "B1016", "B1019"))

# Read SAS ====================================================================
SHR2_sas <- sas_ascii_reader(dataset_name = SHR_dataset_name,
                             sas_name = SHR_sas_name, keep_columns = 1:5)
SHR3_sas <- sas_ascii_reader(dataset_name = SHR_dataset_name,
                             sas_name = SHR_sas_name,
                             keep_columns = c(1, 5, 50:55, 100:121, 152))
UCR2_sas <- sas_ascii_reader(dataset_name = UCR_dataset_name,
                             sas_name = UCR_sas_name,
                             keep_columns = c("V1", "V50", "V100",
                                              "V111", "V1000"))
NIBRS2_sas <- sas_ascii_reader(dataset_name = NIBRS_dataset_name,
                               sas_name = NIBRS_sas_name,
                               keep_columns = c("B1001", "B1005",
                                                "B1010", "B1016", "B1019"))

SHR <- spss_ascii_reader(dataset_name = SHR_dataset_name,
                         sps_name = SHR_sps_name)
UCR <- spss_ascii_reader(dataset_name = UCR_dataset_name,
                         sps_name = UCR_sps_name,
                         keep_columns = 1:150)
NIBRS <- spss_ascii_reader(dataset_name = NIBRS_dataset_name,
                           sps_name = NIBRS_sps_name)
SHR_sas <- sas_ascii_reader(dataset_name = SHR_dataset_name,
                            sas_name = SHR_sas_name)
UCR_sas <- sas_ascii_reader(dataset_name = UCR_dataset_name,
                            sas_name = UCR_sas_name,
                            keep_columns = 1:150)
NIBRS_sas <- sas_ascii_reader(dataset_name = NIBRS_dataset_name,
                              sas_name = NIBRS_sas_name)
weimar <- spss_ascii_reader(dataset_name = weimar_dataset_name,
                            sps_name = weimar_sps_name)
weimar_sas <- sas_ascii_reader(dataset_name = weimar_dataset_name,
                               sas_name = weimar_sas_name)



SHR_names <- spss_ascii_reader(dataset_name = SHR_dataset_name,
                               sps_name = SHR_sps_name,
                               keep_columns = c(1, 33, 45, 72, 100, 152))
SHR2_names <- spss_ascii_reader(dataset_name = SHR_dataset_name,
                                sps_name = SHR_sps_name,
                                real_names = FALSE,
                                keep_columns = c(1, 33, 45, 72, 100, 152))
UCR_names <- spss_ascii_reader(dataset_name = UCR_dataset_name,
                               sps_name = UCR_sps_name,
                               keep_columns = c(1, 33, 345, 572, 1000, 1400))
UCR2_names <- spss_ascii_reader(dataset_name = UCR_dataset_name,
                                sps_name = UCR_sps_name,
                                keep_columns = c(1, 33, 345, 572, 1000, 1400),
                                real_names = FALSE)
NIBRS_names <- spss_ascii_reader(dataset_name = NIBRS_dataset_name,
                                 sps_name = NIBRS_sps_name,
                                 keep_columns = c(1, 3, 5, 7, 10, 15))
NIBRS2_names <- spss_ascii_reader(dataset_name = NIBRS_dataset_name,
                                  sps_name = NIBRS_sps_name,
                                  real_names = FALSE,
                                  keep_columns = c(1, 3, 5, 7, 10, 15))

weimar_names <- spss_ascii_reader(dataset_name = weimar_dataset_name,
                                  sps_name = weimar_sps_name,
                                  keep_columns = c(1:7, 23))
weimar2_names <- spss_ascii_reader(dataset_name = weimar_dataset_name,
                                   sps_name = weimar_sps_name,
                                   real_names = FALSE)


# Read SAS ===============================================================
SHR_sas_names <- sas_ascii_reader(dataset_name = SHR_dataset_name,
                                  sas_name = SHR_sas_name,
                                  keep_columns = c(1, 33, 45, 72, 100, 152))
SHR2_sas_names <- sas_ascii_reader(dataset_name = SHR_dataset_name,
                                   sas_name = SHR_sas_name,
                                   real_names = FALSE,
                                   keep_columns = c(1, 33, 45, 72, 100, 152))
UCR_sas_names <- sas_ascii_reader(dataset_name = UCR_dataset_name,
                                  sas_name = UCR_sas_name,
                                  keep_columns = c(1, 33, 345, 572, 1000, 1400))
UCR2_sas_names <- sas_ascii_reader(dataset_name = UCR_dataset_name,
                                   sas_name = UCR_sas_name,
                                   keep_columns = c(1, 33, 345, 572, 1000, 1400),
                                   real_names = FALSE)
NIBRS_sas_names <- sas_ascii_reader(dataset_name = NIBRS_dataset_name,
                                    sas_name = NIBRS_sas_name,
                                    keep_columns = c(1, 3, 5, 7, 10, 15))
NIBRS2_sas_names <- sas_ascii_reader(dataset_name = NIBRS_dataset_name,
                                     sas_name = NIBRS_sas_name,
                                     real_names = FALSE,
                                     keep_columns = c(1, 3, 5, 7, 10, 15))

weimar_sas_names <- sas_ascii_reader(dataset_name = weimar_dataset_name,
                                     sas_name = weimar_sas_name,
                                     keep_columns = c(1:7, 23))
weimar2_sas_names <- sas_ascii_reader(dataset_name = weimar_dataset_name,
                                      sas_name = weimar_sas_name,
                                      real_names = FALSE)
crosswalk <- spss_ascii_reader(dataset_name = crosswalk_dataset_name,
                               sps_name = crosswalk_sps_name,
                               real_names = FALSE)

parole_parsed          <- parse_spss(parole_sps_name)
sac_parsed             <- parse_spss(sac_sps_name)
sex_offender_parsed    <- parse_spss(sex_offender_sps_name)
ucr1960_parsed         <- parse_spss(ucr1960_sps_name)
weimar_parsed          <- parse_spss(weimar_sps_name)
acs_parsed             <- parse_spss(acs_sps_name)
nibrs_parsed           <- parse_spss(nibrs_sps_name)
prisoners_parsed       <- parse_spss(prisoners_sps_name)
ca_vital_parsed        <- parse_spss(ca_vital_sps_name)
crosswalk_parsed       <- parse_spss(crosswalk_sps_name)
ucr1985_parsed         <- parse_spss(ucr1985_sps_name)
ucr1986_parsed         <- parse_spss(ucr1986_sps_name)
ucr2000_parsed         <- parse_spss(ucr2000_sps_name)
#ucr2006_parsed         <- parse_spss(ucr2006_sps_name)
SHR1987_parsed         <- parse_spss(SHR1987_sps_name)
SHR1988_parsed         <- parse_spss(SHR1988_sps_name)
SHR1981_parsed         <- parse_spss(SHR1981_sps_name)
leoka1980_parsed       <- parse_spss(leoka1980_sps_name)
property_stolen_parsed <- parse_spss(property_stolen_sps_name)
y <- Sys.time()
y - x
