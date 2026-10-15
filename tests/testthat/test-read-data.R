test_that("falling back from vroom to readr says so", {
  setup <- parse_setup(NIBRS_sps_name)
  # readr >= 2.0 reads with vroom too, so this makes both attempts fail
  local_mocked_bindings(vroom_fwf = function(...) stop("simulated failure"),
                        .package = "vroom")
  expect_error(
    expect_message(read_data(NIBRS_dataset_name, setup),
                   "vroom couldn't read 'nibrs_2000_batch_header1.zip' \\(simulated failure\\)"),
    "simulated failure")
})

test_that("reading with vroom gives no message", {
  setup <- parse_setup(NIBRS_sps_name)
  expect_no_message(read_data(NIBRS_dataset_name, setup))
})
