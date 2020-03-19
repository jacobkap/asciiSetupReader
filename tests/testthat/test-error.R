test_that("error handling works", {
  expect_error(parse_setup(starting_number_bigger_than_ending_number))
})
