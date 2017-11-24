context("Proper column names")

dataset_name <- system.file("extdata", "example_data.txt",
                            package = "asciiSetupReader")
sps_name <- system.file("extdata", "example_setup.sps",
                        package = "asciiSetupReader")
example <- spss_ascii_reader(dataset_name = dataset_name,
                             sps_name = sps_name)
example2 <- spss_ascii_reader(dataset_name = dataset_name,
                             sps_name = sps_name,
                             real_names = FALSE)


test_that("Fixed (real names) columns are correct", {
  expect_equal(names(example)[1], "IDENTIFIER_CODE")
  expect_equal(names(example)[33], "VICTIM_2_AGE")
  expect_equal(names(example)[45], "VICTIM_5_AGE")
  expect_equal(names(example)[72], "VICTIM_11_ETHNIC_ORIGIN")
  expect_equal(names(example)[100], "OFFENDER_5_ETHNIC_ORIGIN")
  expect_equal(names(example)[152], "OFFENDER_11_SUB_CIRCUMSTANCE")

})


test_that("Not fixed columns are correct", {
  expect_equal(names(example2)[1], "V1")
  expect_equal(names(example2)[33], "V33")
  expect_equal(names(example2)[45], "V45")
  expect_equal(names(example2)[72], "V72")
  expect_equal(names(example2)[100], "V100")
  expect_equal(names(example2)[152], "V152")

})
