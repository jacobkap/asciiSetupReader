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
