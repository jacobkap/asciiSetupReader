test_that("vroom's error reaches the user", {
  setup <- parse_setup(NIBRS_sps_name)
  local_mocked_bindings(vroom_fwf = function(...) stop("simulated failure"),
                        .package = "vroom")
  expect_error(read_data(NIBRS_dataset_name, setup), "simulated failure")
})

test_that("reading the data gives no message", {
  setup <- parse_setup(NIBRS_sps_name)
  expect_no_message(read_data(NIBRS_dataset_name, setup))
})
