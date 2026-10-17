test_that("spss_ascii_reader() gives the same result as read_ascii_setup()", {
  expect_identical(
    spss_ascii_reader(SHR_dataset_name, SHR_sps_name, keep_columns = 1:20),
    read_ascii_setup(SHR_dataset_name, SHR_sps_name, select_columns = 1:20))
  expect_identical(
    spss_ascii_reader(SHR_dataset_name, SHR_sps_name, value_label_fix = FALSE,
                      real_names = FALSE, keep_columns = 1:20,
                      coerce_numeric = FALSE),
    read_ascii_setup(SHR_dataset_name, SHR_sps_name, use_value_labels = FALSE,
                     use_clean_names = FALSE, select_columns = 1:20,
                     coerce_numeric = FALSE))
})

test_that("sas_ascii_reader() gives the same result as read_ascii_setup()", {
  expect_identical(
    sas_ascii_reader(SHR_dataset_name, SHR_sas_name, keep_columns = 1:20),
    read_ascii_setup(SHR_dataset_name, SHR_sas_name, select_columns = 1:20))
  expect_identical(
    sas_ascii_reader(SHR_dataset_name, SHR_sas_name, value_label_fix = FALSE,
                     real_names = FALSE, keep_columns = 1:20,
                     coerce_numeric = FALSE),
    read_ascii_setup(SHR_dataset_name, SHR_sas_name, use_value_labels = FALSE,
                     use_clean_names = FALSE, select_columns = 1:20,
                     coerce_numeric = FALSE))
})
