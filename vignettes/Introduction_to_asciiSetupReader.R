## -----------------------------------------------------------------------------
data <- system.file("extdata", "example_data.zip",
             package = "asciiSetupReader")
setup_file <- system.file("extdata", "example_setup.sps",
             package = "asciiSetupReader")

example <- asciiSetupReader::read_ascii_setup(data = data,
setup_file = setup_file)
example[1:6, 1:4] # Look at first 6 rows and first 4 columns

## -----------------------------------------------------------------------------
example <- asciiSetupReader::read_ascii_setup(data = data,
setup_file = setup_file,
use_value_labels = FALSE)
example[1:6, 1:4] # Look at first 6 rows and first 4 columns

## -----------------------------------------------------------------------------
example <- asciiSetupReader::read_ascii_setup(data = data,
setup_file = setup_file,
use_clean_names = FALSE)
example[1:6, 1:4] # Look at first 6 rows and first 4 columns

## -----------------------------------------------------------------------------
example <- asciiSetupReader::read_ascii_setup(data = data,
setup_file = setup_file, 
select_columns = 1:2) # Gets only the first 2 columns
head(example)

## -----------------------------------------------------------------------------
example <- asciiSetupReader::read_ascii_setup(data = data,
setup_file = setup_file, 
select_columns = c("IDENTIFIER_CODE", "NUMERIC_STATE_CODE")) # Gets only the first 2 columns
head(example)

## -----------------------------------------------------------------------------
example <- asciiSetupReader::read_ascii_setup(data = data,
setup_file = setup_file, 
select_columns = "V1") # Gets only the first columnss
head(example)

