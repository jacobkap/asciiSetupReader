context("Proper column names")

SHR_dataset_name <- system.file("extdata", "example_data.zip",
                                package = "asciiSetupReader")
weimar_dataset_name <- system.file("testdata", "weimar.txt",
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

weimar_sps_name <- system.file("testdata", "weimar_sps.zip",
                            package = "asciiSetupReader")
weimar_sas_name <- system.file("testdata", "weimar_sas.zip",
                              package = "asciiSetupReader")

SHR <- spss_ascii_reader(dataset_name = SHR_dataset_name,
                             sps_name = SHR_sps_name,
                         keep_columns = c(1, 33, 45, 72, 100, 152))
SHR2 <- spss_ascii_reader(dataset_name = SHR_dataset_name,
                             sps_name = SHR_sps_name,
                             real_names = FALSE,
                          keep_columns = c(1, 33, 45, 72, 100, 152))
UCR <- spss_ascii_reader(dataset_name = UCR_dataset_name,
                          sps_name = UCR_sps_name,
                          keep_columns = c(1, 33, 345, 572, 1000, 1400))
UCR2 <- spss_ascii_reader(dataset_name = UCR_dataset_name,
                          sps_name = UCR_sps_name,
                          keep_columns = c(1, 33, 345, 572, 1000, 1400),
                          real_names = FALSE)
NIBRS <- spss_ascii_reader(dataset_name = NIBRS_dataset_name,
                           sps_name = NIBRS_sps_name,
                           keep_columns = c(1, 3, 5, 7, 10, 15))
NIBRS2 <- spss_ascii_reader(dataset_name = NIBRS_dataset_name,
                            sps_name = NIBRS_sps_name,
                            real_names = FALSE,
                            keep_columns = c(1, 3, 5, 7, 10, 15))

weimar <- spss_ascii_reader(dataset_name = weimar_dataset_name,
                            sps_name = weimar_sps_name,
                            keep_columns = c(1:7, 23))
weimar2 <- spss_ascii_reader(dataset_name = weimar_dataset_name,
                            sps_name = weimar_sps_name,
                            real_names = FALSE)


# Read SAS ===============================================================
SHR_sas <- sas_ascii_reader(dataset_name = SHR_dataset_name,
                         sas_name = SHR_sas_name,
                         keep_columns = c(1, 33, 45, 72, 100, 152))
SHR2_sas <- sas_ascii_reader(dataset_name = SHR_dataset_name,
                              sas_name = SHR_sas_name,
                          real_names = FALSE,
                          keep_columns = c(1, 33, 45, 72, 100, 152))
UCR_sas <- sas_ascii_reader(dataset_name = UCR_dataset_name,
                             sas_name = UCR_sas_name,
                         keep_columns = c(1, 33, 345, 572, 1000, 1400))
UCR2_sas <- sas_ascii_reader(dataset_name = UCR_dataset_name,
                              sas_name = UCR_sas_name,
                          keep_columns = c(1, 33, 345, 572, 1000, 1400),
                          real_names = FALSE)
NIBRS_sas <- sas_ascii_reader(dataset_name = NIBRS_dataset_name,
                               sas_name = NIBRS_sas_name,
                              keep_columns = c(1, 3, 5, 7, 10, 15))
NIBRS2_sas <- sas_ascii_reader(dataset_name = NIBRS_dataset_name,
                               sas_name = NIBRS_sas_name,
                               real_names = FALSE,
                               keep_columns = c(1, 3, 5, 7, 10, 15))

weimar_sas <- sas_ascii_reader(dataset_name = weimar_dataset_name,
                           sas_name = weimar_sas_name,
                           keep_columns = c(1:7, 23))
weimar2_sas <- sas_ascii_reader(dataset_name = weimar_dataset_name,
                            sas_name = weimar_sas_name,
                             real_names = FALSE)



test_that("Fixed (real names) columns are correct - SPSS", {

  expect_named(SHR, c("IDENTIFIER_CODE", "VICTIM_2_AGE",
                      "VICTIM_5_AGE",
                      "VICTIM_11_ETHNIC_ORIGIN",
                      "OFFENDER_5_ETHNIC_ORIGIN",
                      "OFFENDER_11_SUB_CIRCUMSTANCE"))

  expect_named(NIBRS, c("SEGMENT_LEVEL", "ORIGINATING_AGENCY_IDENTIFIER",
                      "DATE_ORI_WAS_ADDED",
                      "CITY_NAME",
                      "COUNTRY_DIVISION",
                      "FBI_FIELD_OFFICE"))

  expect_named(UCR, c("ID_CODE", "JAN_MONTH_INCLUDED_IN",
                      "MAR_TOT_CLR_OTH_WPN_ASLT",
                      "MAY_TOT_CLR_ATMPTD_RAPE",
                      "SEP_UNFOUND_KNIFE_ASSL",
                      "DEC_TOT_CLR_GUN_ROBBER"))

  expect_named(weimar[1:8], c("WAHLKREISCODE", "LAND_REGIERUNGSBEZ_CODE",
                             "DATA_TYPE_CODE", "UNIT_OF_ANALYSIS_NAME",
                             "X1919_RT_NR_ELIGIBLE_VTRS",
                             "X1919_RT_NR_VOTES_CAST",
                             "X1919_RT_VOTES_CAST",
                             "X1919_RT_OTHER_PARTIES"))

})


test_that("Not fixed column names are correct - SPSS", {

  expect_named(SHR2, c("V1", "V33", "V45", "V72", "V100", "V152"))

  expect_named(NIBRS2, c("B1001", "B1003", "B1005",
                             "B1007", "B1010", "B1015"))

  expect_named(UCR2, c("V1", "V33", "V345", "V572", "V1000", "V1400"))

  expect_named(weimar2, c("V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8",
                          "V9", "V10", "V11", "V12", "V13", "V14", "V15",
                          "V16", "V17", "V18", "V19", "V20", "V21", "V22",
                          "V23"))

})

# Test SAS ============================================================
test_that("Fixed (real names) columns are correct - SAS", {
  expect_named(SHR_sas, c("IDENTIFIER_CODE", "VICTIM_2_AGE",
                      "VICTIM_5_AGE",
                      "VICTIM_11_ETHNIC_ORIGIN",
                      "OFFENDER_5_ETHNIC_ORIGIN",
                      "OFFENDER_11_SUB_CIRCUMSTANCE"))

  expect_named(NIBRS_sas, c("SEGMENT_LEVEL", "ORIGINATING_AGENCY_IDENTIFIER",
                        "DATE_ORI_WAS_ADDED",
                        "CITY_NAME",
                        "COUNTRY_DIVISION",
                        "FBI_FIELD_OFFICE"))

  expect_named(UCR_sas, c("ID_CODE", "JAN_MONTH_INCLUDED_IN",
                      "MAR_TOT_CLR_OTH_WPN_ASLT",
                      "MAY_TOT_CLR_ATMPTD_RAPE",
                      "SEP_UNFOUND_KNIFE_ASSL",
                      "DEC_TOT_CLR_GUN_ROBBER"))

  expect_named(weimar_sas, c("WAHLKREISCODE", "LAND_REGIERUNGSBEZ_CODE",
                             "DATA_TYPE_CODE", "UNIT_OF_ANALYSIS_NAME",
                             "X1919_RT_NR_ELIGIBLE_VTRS",
                             "X1919_RT_NR_VOTES_CAST",
                             "X1919_RT_VOTES_CAST",
                             "X1919_RT_OTHER_PARTIES"))


})


test_that("Not fixed column names are correct - SAS", {
  expect_named(SHR2_sas, c("V1", "V33", "V45", "V72", "V100", "V152"))

  expect_named(NIBRS2_sas, c("B1001", "B1003", "B1005",
                             "B1007", "B1010", "B1015"))

  expect_named(UCR2_sas, c("V1", "V33", "V345", "V572", "V1000", "V1400"))

  expect_named(weimar2_sas, c("V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8",
                          "V9", "V10", "V11", "V12", "V13", "V14", "V15",
                          "V16", "V17", "V18", "V19", "V20", "V21", "V22",
                          "V23"))

})
