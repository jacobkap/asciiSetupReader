context("Proper column names")

SHR_dataset_name <- system.file("extdata", "example_data.zip",
                                package = "asciiSetupReader")
SHR_sps_name <- system.file("extdata", "example_setup.sps",
                            package = "asciiSetupReader")
UCR_dataset_name <- system.file("testdata", "ucr1960.zip",
                                package = "asciiSetupReader")
UCR_sps_name <- system.file("testdata", "ucr1960.sps",
                            package = "asciiSetupReader")
NIBRS_dataset_name <- system.file("testdata", "nibrs_2000_batch_header1.zip",
                                  package = "asciiSetupReader")
NIBRS_sps_name <- system.file("testdata", "nibrs_2000_batch_header1.sps",
                              package = "asciiSetupReader")
example <- spss_ascii_reader(dataset_name = SHR_dataset_name,
                             sps_name = SHR_sps_name)
example2 <- spss_ascii_reader(dataset_name = SHR_dataset_name,
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



test_that("Fixed (real names) columns are correct", {
  expect_equal(names(example)[1], "IDENTIFIER_CODE")
  expect_equal(names(example)[33], "VICTIM_2_AGE")
  expect_equal(names(example)[45], "VICTIM_5_AGE")
  expect_equal(names(example)[72], "VICTIM_11_ETHNIC_ORIGIN")
  expect_equal(names(example)[100], "OFFENDER_5_ETHNIC_ORIGIN")
  expect_equal(names(example)[152], "OFFENDER_11_SUB_CIRCUMSTANCE")

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


test_that("Not fixed columns are correct", {
  expect_equal(names(example2)[1], "V1")
  expect_equal(names(example2)[33], "V33")
  expect_equal(names(example2)[45], "V45")
  expect_equal(names(example2)[72], "V72")
  expect_equal(names(example2)[100], "V100")
  expect_equal(names(example2)[152], "V152")

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
