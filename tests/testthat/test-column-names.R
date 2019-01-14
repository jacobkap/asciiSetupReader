context("Proper column names")



test_that("Fixed (real names) columns are correct - SPSS", {

  expect_named(SHR_names, c("IDENTIFIER_CODE",
                            "VICTIM_2_AGE",
                            "VICTIM_5_AGE",
                            "VICTIM_11_ETHNIC_ORIGIN",
                            "OFFENDER_5_ETHNIC_ORIGIN",
                            "OFFENDER_11_SUB_CIRCUMSTANCE"))

  expect_named(NIBRS_names, c("SEGMENT_LEVEL",
                              "ORIGINATING_AGENCY_IDENTIFIER",
                              "DATE_ORI_WAS_ADDED",
                              "CITY_NAME",
                              "COUNTRY_DIVISION",
                              "FBI_FIELD_OFFICE"))

  expect_named(UCR_names, c("ID_CODE",
                            "JAN_MONTH_INCLUDED_IN",
                            "MAR_TOT_CLR_OTH_WPN_ASLT",
                            "MAY_TOT_CLR_ATMPTD_RAPE",
                            "SEP_UNFOUND_KNIFE_ASSL",
                            "DEC_TOT_CLR_GUN_ROBBER"))

  expect_named(weimar_names[1:8], c("WAHLKREISCODE",
                                    "LAND_REGIERUNGSBEZ_CODE",
                                    "DATA_TYPE_CODE",
                                    "UNIT_OF_ANALYSIS_NAME",
                                    "X1919_RT_NR_ELIGIBLE_VTRS",
                                    "X1919_RT_NR_VOTES_CAST",
                                    "X1919_RT_VOTES_CAST",
                                    "X1919_RT_OTHER_PARTIES"))

})


test_that("Not fixed column names are correct - SPSS", {

  expect_named(SHR2_names, c("V1", "V33", "V45",
                             "V72", "V100", "V152"))

  expect_named(NIBRS2_names, c("B1001", "B1003", "B1005",
                               "B1007", "B1010", "B1015"))

  expect_named(UCR2_names, c("V1", "V33", "V345",
                             "V572", "V1000", "V1400"))

  expect_named(weimar2_names, c("V1", "V2", "V3",
                                "V4", "V5", "V6",
                                "V7", "V8", "V9",
                                "V10", "V11", "V12",
                                "V13", "V14", "V15",
                                "V16", "V17", "V18",
                                "V19", "V20", "V21",
                                "V22", "V23"))

})

# Test SAS ============================================================
test_that("Fixed (real names) columns are correct - SAS", {
  expect_named(SHR_sas_names, c("IDENTIFIER_CODE",
                                "VICTIM_2_AGE",
                                "VICTIM_5_AGE",
                                "VICTIM_11_ETHNIC_ORIGIN",
                                "OFFENDER_5_ETHNIC_ORIGIN",
                                "OFFENDER_11_SUB_CIRCUMSTANCE"))

  expect_named(NIBRS_sas_names, c("SEGMENT_LEVEL",
                                  "ORIGINATING_AGENCY_IDENTIFIER",
                                  "DATE_ORI_WAS_ADDED",
                                  "CITY_NAME",
                                  "COUNTRY_DIVISION",
                                  "FBI_FIELD_OFFICE"))

  expect_named(UCR_sas_names, c("ID_CODE",
                                "JAN_MONTH_INCLUDED_IN",
                                "MAR_TOT_CLR_OTH_WPN_ASLT",
                                "MAY_TOT_CLR_ATMPTD_RAPE",
                                "SEP_UNFOUND_KNIFE_ASSL",
                                "DEC_TOT_CLR_GUN_ROBBER"))

  expect_named(weimar_sas_names, c("WAHLKREISCODE",
                                   "LAND_REGIERUNGSBEZ_CODE",
                                   "DATA_TYPE_CODE",
                                   "UNIT_OF_ANALYSIS_NAME",
                                   "X1919_RT_NR_ELIGIBLE_VTRS",
                                   "X1919_RT_NR_VOTES_CAST",
                                   "X1919_RT_VOTES_CAST",
                                   "X1919_RT_OTHER_PARTIES"))


})


test_that("Not fixed column names are correct - SAS", {
  expect_named(SHR2_sas_names, c("V1", "V33", "V45",
                                 "V72", "V100", "V152"))

  expect_named(NIBRS2_sas_names, c("B1001", "B1003", "B1005",
                                   "B1007", "B1010", "B1015"))

  expect_named(UCR2_sas_names, c("V1", "V33", "V345",
                                 "V572", "V1000", "V1400"))

  expect_named(weimar2_sas_names, c("V1", "V2", "V3",
                                    "V4", "V5", "V6",
                                    "V7", "V8", "V9",
                                    "V10", "V11", "V12",
                                    "V13", "V14", "V15",
                                    "V16", "V17", "V18",
                                    "V19", "V20", "V21",
                                    "V22", "V23"))

})
