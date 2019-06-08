# asciiSetupReader 2.0.3

* Misc. bug fixes and many new tests.
* Reorder list of value labels returned from `parse_setup` to be in same order
  as in setup file.

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
