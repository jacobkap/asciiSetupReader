# asciiSetupReader 2.6.0

## Bug fixes

* `coerce_numeric = TRUE` now checks every row before converting a column to
  numeric. Previously files over 50,000 rows only had a random sample of rows
  checked (and a file of exactly 50,000 rows only 5,000), so a column with
  rare text values could be converted to numeric, silently turning those
  values into `NA`, differently on every run. The sampling also changed the
  user's random number stream.
* Values with bytes that are invalid in the current locale no longer cause
  an error when checking for numeric columns (the column stays character)
  or when applying open-ended missing value ranges.
* `make_sps_setup()` works again on R >= 4.5.0 (it failed with "NA in
  coercion to boolean"), works when `col_labels` isn't given, and no longer
  leaves a `sink()` open if it fails. A `file_name` ending in ".SPS" no
  longer gets a second extension, and one merely ending in "sps" (e.g.
  "datasps") is no longer cut short.
* Missing values given as "X thru highest" no longer fail with "`labels`
  must be unique" when the value X itself appears in the data.
* Open-ended missing value ranges now match zero-padded data (e.g.
  "0000012" for "0000009 THRU HI"). Previously those values were left in
  the data.
* Missing value ranges written "LO THRU X" or "LOWEST THRU X" are now
  applied. Previously only "low thru" was recognized, so these were ignored.
* `make_sps_setup()`'s `missing_values` accepts column names as well as
  labels. Previously a column name was treated as a missing value of the
  column before it.
* SPSS setup files whose first line is `DATA LIST` can now be read.

## Speed

* Parsing setup files is much faster, especially for files with many columns
  (e.g. PSID setup files: from about 2 minutes to under 10 seconds).
* Reading data is faster: the data is no longer copied twice, and value
  labels and missing values are applied with a direct lookup.

## Other changes

* `spss_ascii_reader()` and `sas_ascii_reader()` now call
  `read_ascii_setup()`; results and arguments are unchanged.
* Data files are read with vroom only. If vroom failed, the package used to
  retry silently with readr, which since readr 2.0 reads with vroom too, so
  the retry rarely helped and hid vroom's error. Now vroom's error is shown.
* The package no longer depends on haven or zoo.
* Requires R >= 3.6.0 (as vroom already did).
* Examples now run, and the code is commented.
* Adds a GitHub Actions R CMD check workflow, replacing Travis and AppVeyor.

# asciiSetupReader 2.5.3

* Misc bug fixes

# asciiSetupReader 2.5.2

* Removes startup message

# asciiSetupReader 2.5.1

* Adds startup message

# asciiSetupReader 2.5.0

* In column names now replaces "<" with "_under_", ">" with "_over_", 
 "$" with "_dollar_", "+" with "_plus_", "@" with "_at_".  Previously
 these values would be replaced by "_". 

# asciiSetupReader 2.4.0

* Adds functionality to handle "low thru" missing values.
* "low thru" and "thru high" missing values are now less (more) than and equal
  to rather than just less (more) than the value.

# asciiSetupReader 2.3.2

* Fix bug on reading an atypical .sps file.

# asciiSetupReader 2.3.1

* Fix bug caused by `vroom` not handling embedded nulls.
* Fix bug where code would run even if start column number > end column number, but would crash code later.
* Fix bug where code wouldn't run if .sps setup file read MISSING VALUE rather than MISSING VALUES.
* Fix bug when value label is "X thru highest value". Now will change all values >= X to be NA. 


# asciiSetupReader 2.3.0

* Misc. bug fixes.
* Change package to read in fixed-width files from `readr` to `vroom` to 
  significantly increase read time.

# asciiSetupReader 2.2.0

* Adds an addin to use the `read_ascii_setup()` function interactively. This allows
  users to select every option in the popup window. 

# asciiSetupReader 2.1.0

* Reorder list of value labels returned from `parse_setup` to be in same order
  as in setup file.
* Misc. bug fixes and many new tests.

# asciiSetupReader 2.0.2

* Misc. bug fixes.

# asciiSetupReader 2.0.1

* Fix problem where package didn't work with dev version of Haven.

# asciiSetupReader 2.0.0

## Major Changes

* Adds a single function (`read_ascii_setup`) that will read in data for both
  .dat+.sps and .dat+.sas pairs. This is just a helper function that calls
  `spss_ascii_reader` or `sas_ascii_reader`.
* Adds function to create sps setup files.
* Adds capacity for .sas reader to handle missing values.
* Adds a function for users to parse the setup file (.sps or .sas) and get results. 
An accompanying vignette explains this function.
* Adds a function to make your own .sps files (not .sas yet).

## Minor Changes
* Adds option to not coerce potentially numeric columns into numeric type. Useful in cases like dealing with Census FIPS codes that have leading zeros. 
* Miscellaneous bug fixes.
* Fixes bug when missing values are an interval (e.g. -1 thru -8).

# asciiSetupReader 1.4.0
* Adds capacity to the SPSS reader to handle Missing Values.
* Fixes bug where function fails if no value-labels are detected.
    + Applies both when setup file has no value-labels and if only select columns that have no value-labels.
* Adds a huge number of tests.
* Changes factor column to character columns.
