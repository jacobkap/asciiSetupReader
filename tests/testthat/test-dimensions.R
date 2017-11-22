context("Proper dimensions")

dataset_name <- system.file("extdata", "example_data.txt",
                            package = "asciiSetupReader")
sps_name <- system.file("extdata", "example_setup.sps",
                        package = "asciiSetupReader")
example <- spss_ascii_reader(dataset_name = dataset_name,
                             sps_name = sps_name)
example2 <- spss_ascii_reader(dataset_name = dataset_name,
                              sps_name = sps_name, keep_columns = 1:5)
example3 <- spss_ascii_reader(dataset_name = dataset_name,
                              sps_name = sps_name, keep_columns = c(1, 5, 50:55, 100:121, 152))


test_that("number of columns is correct", {
  expect_equal(ncol(example), 152)
  expect_equal(ncol(example2), 5)
  expect_equal(ncol(example3), 31)
})


test_that("number of rows is correct", {
  expect_equal(nrow(example), 13844)
  expect_equal(nrow(example2), 13844)
  expect_equal(nrow(example3), 13844)
})
