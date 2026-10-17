sas_with_option <- function(format_line) {
  sas <- readLines(SHR_sas_name)
  stopifnot(any(grepl(format_line, sas, fixed = TRUE)))
  file <- tempfile(fileext = ".sas")
  writeLines(sub(format_line, paste(format_line, "(default=30)"), sas,
                 fixed = TRUE), file)
  file
}

test_that("options after a SAS numeric format name are ignored", {
  file <- sas_with_option("VALUE v1ffffff")
  expect_equal(parse_setup(file)$value_labels,
               parse_setup(SHR_sas_name)$value_labels)
  unlink(file)
})

test_that("options after a SAS character format name are ignored", {
  file <- sas_with_option("VALUE $v20fffff")
  expect_equal(parse_setup(file)$value_labels,
               parse_setup(SHR_sas_name)$value_labels)
  unlink(file)
})
