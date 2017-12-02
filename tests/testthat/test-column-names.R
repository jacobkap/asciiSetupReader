context("Proper column names")

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

SHR <- spss_ascii_reader(dataset_name = SHR_dataset_name,
                             sps_name = SHR_sps_name)
SHR2 <- spss_ascii_reader(dataset_name = SHR_dataset_name,
                             sps_name = SHR_sps_name,
                             real_names = FALSE)
UCR <- spss_ascii_reader(dataset_name = UCR_dataset_name,
                          sps_name = UCR_sps_name,
                          keep_columns = c(1,33,345,572,1000,1400))
UCR2 <- spss_ascii_reader(dataset_name = UCR_dataset_name,
                          sps_name = UCR_sps_name,
                          keep_columns = c(1,33,345,572,1000,1400),
                          real_names = FALSE)
NIBRS <- spss_ascii_reader(dataset_name = NIBRS_dataset_name,
                           sps_name = NIBRS_sps_name)
NIBRS2 <- spss_ascii_reader(dataset_name = NIBRS_dataset_name,
                            sps_name = NIBRS_sps_name,
                            real_names = FALSE)
# Read SAS ===============================================================
SHR_sas <- sas_ascii_reader(dataset_name = SHR_dataset_name,
                         sas_name = SHR_sas_name)
SHR2_sas <- sas_ascii_reader(dataset_name = SHR_dataset_name,
                              sas_name = SHR_sas_name,
                          real_names = FALSE)
SHR3_sas <- sas_ascii_reader(dataset_name = SHR_dataset_name,
                             sas_name = SHR_sas_name)
SHR4_sas <- sas_ascii_reader(dataset_name = SHR_dataset_name,
                             sas_name = SHR_sas_name,
                         real_names = FALSE)

UCR_sas <- sas_ascii_reader(dataset_name = UCR_dataset_name,
                             sas_name = UCR_sas_name,
                         keep_columns = c(1,33,345,572,1000,1400))
UCR2_sas <- sas_ascii_reader(dataset_name = UCR_dataset_name,
                              sas_name = UCR_sas_name,
                          keep_columns = c(1,33,345,572,1000,1400),
                          real_names = FALSE)
NIBRS_sas <- sas_ascii_reader(dataset_name = NIBRS_dataset_name,
                               sas_name = NIBRS_sas_name)
NIBRS2_sas <- sas_ascii_reader(dataset_name = NIBRS_dataset_name,
                                sas_name = NIBRS_sas_name,
                            real_names = FALSE)



test_that("Fixed (real names) columns are correct - SPSS", {
  expect_equal(names(SHR)[1], "IDENTIFIER_CODE")
  expect_equal(names(SHR)[33], "VICTIM_2_AGE")
  expect_equal(names(SHR)[45], "VICTIM_5_AGE")
  expect_equal(names(SHR)[72], "VICTIM_11_ETHNIC_ORIGIN")
  expect_equal(names(SHR)[100], "OFFENDER_5_ETHNIC_ORIGIN")
  expect_equal(names(SHR)[152], "OFFENDER_11_SUB_CIRCUMSTANCE")


  expect_equal(names(NIBRS)[1], "SEGMENT_LEVEL")
  expect_equal(names(NIBRS)[3], "ORIGINATING_AGENCY_IDENTIFIER")
  expect_equal(names(NIBRS)[5], "DATE_ORI_WAS_ADDED")
  expect_equal(names(NIBRS)[7], "CITY_NAME")
  expect_equal(names(NIBRS)[10], "COUNTRY_DIVISION")
  expect_equal(names(NIBRS)[15], "FBI_FIELD_OFFICE")

  expect_equal(names(UCR)[1], "ID_CODE")
  expect_equal(names(UCR)[2], "JAN_MONTH_INCLUDED_IN")
  expect_equal(names(UCR)[3], "MAR_TOT_CLR_OTH_WPN_ASLT")
  expect_equal(names(UCR)[4], "MAY_TOT_CLR_ATMPTD_RAPE")
  expect_equal(names(UCR)[5], "SEP_UNFOUND_KNIFE_ASSL")
  expect_equal(names(UCR)[6], "DEC_TOT_CLR_GUN_ROBBER")


})


test_that("Not fixed columns are correct - SPSS", {
  expect_equal(names(SHR2)[1], "V1")
  expect_equal(names(SHR2)[33], "V33")
  expect_equal(names(SHR2)[45], "V45")
  expect_equal(names(SHR2)[72], "V72")
  expect_equal(names(SHR2)[100], "V100")
  expect_equal(names(SHR2)[152], "V152")

  expect_equal(names(NIBRS2)[1], "B1001")
  expect_equal(names(NIBRS2)[3], "B1003")
  expect_equal(names(NIBRS2)[5], "B1005")
  expect_equal(names(NIBRS2)[7], "B1007")
  expect_equal(names(NIBRS2)[10], "B1010")
  expect_equal(names(NIBRS2)[15], "B1015")

  expect_equal(names(UCR2)[1], "V1")
  expect_equal(names(UCR2)[2], "V33")
  expect_equal(names(UCR2)[3], "V345")
  expect_equal(names(UCR2)[4], "V572")
  expect_equal(names(UCR2)[5], "V1000")
  expect_equal(names(UCR2)[6], "V1400")
})

# Test SAS ============================================================
test_that("Fixed (real names) columns are correct - SAS", {
  expect_equal(names(SHR_sas)[1], "IDENTIFIER_CODE")
  expect_equal(names(SHR_sas)[33], "VICTIM_2_AGE")
  expect_equal(names(SHR_sas)[45], "VICTIM_5_AGE")
  expect_equal(names(SHR_sas)[72], "VICTIM_11_ETHNIC_ORIGIN")
  expect_equal(names(SHR_sas)[100], "OFFENDER_5_ETHNIC_ORIGIN")
  expect_equal(names(SHR_sas)[152], "OFFENDER_11_SUB_CIRCUMSTANCE")


  expect_equal(names(NIBRS_sas)[1], "SEGMENT_LEVEL")
  expect_equal(names(NIBRS_sas)[3], "ORIGINATING_AGENCY_IDENTIFIER")
  expect_equal(names(NIBRS_sas)[5], "DATE_ORI_WAS_ADDED")
  expect_equal(names(NIBRS_sas)[7], "CITY_NAME")
  expect_equal(names(NIBRS_sas)[10], "COUNTRY_DIVISION")
  expect_equal(names(NIBRS_sas)[15], "FBI_FIELD_OFFICE")

  expect_equal(names(UCR_sas)[1], "ID_CODE")
  expect_equal(names(UCR_sas)[2], "JAN_MONTH_INCLUDED_IN")
  expect_equal(names(UCR_sas)[3], "MAR_TOT_CLR_OTH_WPN_ASLT")
  expect_equal(names(UCR_sas)[4], "MAY_TOT_CLR_ATMPTD_RAPE")
  expect_equal(names(UCR_sas)[5], "SEP_UNFOUND_KNIFE_ASSL")
  expect_equal(names(UCR_sas)[6], "DEC_TOT_CLR_GUN_ROBBER")

})


test_that("Not fixed columns are correct - SAS", {
  expect_equal(names(SHR2_sas)[1], "V1")
  expect_equal(names(SHR2_sas)[33], "V33")
  expect_equal(names(SHR2_sas)[45], "V45")
  expect_equal(names(SHR2_sas)[72], "V72")
  expect_equal(names(SHR2_sas)[100], "V100")
  expect_equal(names(SHR2_sas)[152], "V152")

  expect_equal(names(NIBRS2_sas)[1], "B1001")
  expect_equal(names(NIBRS2_sas)[3], "B1003")
  expect_equal(names(NIBRS2_sas)[5], "B1005")
  expect_equal(names(NIBRS2_sas)[7], "B1007")
  expect_equal(names(NIBRS2_sas)[10], "B1010")
  expect_equal(names(NIBRS2_sas)[15], "B1015")

  expect_equal(names(UCR2_sas)[1], "V1")
  expect_equal(names(UCR2_sas)[2], "V33")
  expect_equal(names(UCR2_sas)[3], "V345")
  expect_equal(names(UCR2_sas)[4], "V572")
  expect_equal(names(UCR2_sas)[5], "V1000")
  expect_equal(names(UCR2_sas)[6], "V1400")
})
