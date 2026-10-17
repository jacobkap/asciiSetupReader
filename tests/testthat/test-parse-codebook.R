test_that("an SPSS file can start with DATA LIST", {
  # The DATA LIST line itself used to be dropped when it was the first line
  setup_file <- tempfile(fileext = ".sps")
  writeLines(c("DATA LIST FILE = 'data.txt'",
               "  V1 1-2  V2 4",
               ".",
               "VARIABLE LABELS",
               "  V1 'first'",
               "  V2 'second'",
               ".",
               "EXECUTE."), setup_file)
  setup <- parse_setup(setup_file)
  expect_equal(setup$setup$column_number, c("V1", "V2"))
  expect_equal(setup$setup$column_name, c("first", "second"))
  expect_equal(setup$setup$begin, c(1, 4))
  expect_equal(setup$setup$end, c(2, 4))
  unlink(setup_file)
})

test_that("lines before DATA LIST are dropped", {
  codebook_file <- tempfile(fileext = ".sps")
  writeLines(c("* comment", "* more", "DATA LIST FILE = 'x'", "  V1 1-2"),
             codebook_file)
  expect_equal(parse_codebook(codebook_file, type = "sps"),
               c("DATA LIST FILE = 'x'", "V1 1-2"))
  unlink(codebook_file)
})
