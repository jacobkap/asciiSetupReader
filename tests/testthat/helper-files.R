# Writes lines to a new file in R's temporary directory (removed when the
# R session ends) and returns its path.
temp_file <- function(lines, fileext) {
  path <- tempfile(fileext = fileext)
  writeLines(lines, path)
  path
}

fixture <- function(name) test_path("fixtures", name)
