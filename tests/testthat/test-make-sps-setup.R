test_that("make_sps_setup() writes a setup file that parse_setup() reads", {
  file_name <- file.path(tempdir(), "make_sps_setup_test")
  value_labels <- c("state name = ",
                    "1 = label 1",
                    "2 = label 2",
                    "population = ",
                    "1A = alpha",
                    "1B = bravo")
  make_sps_setup(file_name      = file_name,
                 col_positions  = c(1, 3, 4, 2),
                 col_names      = c("var1", "var2", "var3", "var4"),
                 col_labels     = c("state name", "county",
                                    "population", "census region code"),
                 value_labels   = value_labels,
                 missing_values = c("state name", "9", "-8", "county", "-8"))
  sps <- paste0(file_name, ".sps")
  expect_true(file.exists(sps))

  setup <- parse_setup(sps)
  expect_equal(setup$setup$column_number, c("var1", "var2", "var3", "var4"))
  expect_equal(setup$setup$column_name,
               c("state_name", "county", "population", "census_region_code"))
  expect_equal(setup$setup$begin, c(1, 2, 5, 9))
  expect_equal(setup$setup$end, c(1, 4, 8, 10))
  expect_equal(unname(setup$value_labels$var1), c("1", "2"))
  expect_equal(names(setup$value_labels$var3), c("alpha", "bravo"))
  expect_equal(setup$missing$values[setup$missing$variable == "var1"],
               c("9", "-8"))
  unlink(sps)
})

test_that("make_sps_setup() doesn't add a second .sps extension", {
  file_name <- file.path(tempdir(), "make_sps_setup_ext.sps")
  make_sps_setup(file_name, col_positions = c("1-2", "3-5"))
  expect_true(file.exists(file_name))
  expect_false(file.exists(paste0(file_name, ".sps")))
  unlink(file_name)
})

test_that("make_sps_setup() handles .SPS and names ending in 'sps'", {
  upper <- file.path(tempdir(), "make_sps_setup_upper.SPS")
  make_sps_setup(upper, col_positions = c("1-2", "3-5"))
  expect_false(file.exists(paste0(upper, ".sps")))
  expect_true(file.exists(file.path(tempdir(), "make_sps_setup_upper.sps")))

  # Only a real ".sps" extension is removed, not any 4 characters ending
  # in "sps"
  ends_in_sps <- file.path(tempdir(), "make_sps_setup_datasps")
  make_sps_setup(ends_in_sps, col_positions = c("1-2", "3-5"))
  expect_true(file.exists(paste0(ends_in_sps, ".sps")))
  unlink(c(file.path(tempdir(), "make_sps_setup_upper.sps"),
           paste0(ends_in_sps, ".sps")))
})

test_that("make_sps_setup() works without column labels", {
  file_name <- file.path(tempdir(), "make_sps_setup_no_labels")
  sinks <- sink.number()
  expect_no_error(make_sps_setup(file_name, col_positions = c(2, 3)))
  expect_equal(sink.number(), sinks)

  setup <- parse_setup(paste0(file_name, ".sps"))
  expect_equal(setup$setup$column_number, c("V1", "V2"))
  expect_equal(setup$setup$begin, c(1, 3))
  expect_equal(setup$setup$end, c(2, 5))
  unlink(paste0(file_name, ".sps"))
})

test_that("missing_values accepts column names as well as labels", {
  file_name <- file.path(tempdir(), "make_sps_setup_missing_names")
  make_sps_setup(file_name,
                 col_positions  = c(2, 2, 2),
                 col_names      = c("v1", "v2", "v3"),
                 col_labels     = c("first", "second", "third"),
                 missing_values = c("first", "9", "v3", "7", "-1", "v2", "0"))
  missing <- parse_setup(paste0(file_name, ".sps"))$missing
  expect_equal(missing$values[missing$variable == "v1"], "9")
  expect_equal(missing$values[missing$variable == "v2"], "0")
  expect_equal(missing$values[missing$variable == "v3"], c("7", "-1"))
  unlink(paste0(file_name, ".sps"))
})
