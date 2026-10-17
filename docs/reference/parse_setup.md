# Parse the setup file (.sps or .sas).

Parse the setup file (.sps or .sas).

## Usage

``` r
parse_setup(setup_file)
```

## Arguments

- setup_file:

  Name of the SPSS or SAS setup file - should be a .sps or .sas (.txt
  also accepted as are these files in zipped format). Whether it is SPSS
  or SAS is determined from the file name: names ending in .sps
  (optionally followed by .zip or .txt) are SPSS and everything else is
  SAS.

## Value

A list of length 3. The first object ("setup") is a data frame with 4
columns: column_number, the non-descriptive name of each column (e.g.
V1); column_name, its descriptive name; and begin and end, the first and
last character position of the column in the fixed-width data file.

The second object ("value_labels") is a list of named vectors for the
value labels, one per column with value labels. The vector's values are
the codes in the data and its names are the labels. If there are no
value labels, this will be NULL.

The third object ("missing") is a data.frame with two columns. The first
column (variable) says the column name and the second (values) says the
value that is missing and will be replaced with NA. If there are no
missing values, this will be NULL.

## Examples

``` r
sas_name <- system.file("extdata", "example_setup.sas",
                         package = "asciiSetupReader")
sas_example <- parse_setup(sas_name)

sps_name <- system.file("extdata", "example_setup.sps",
                         package = "asciiSetupReader")
sps_example <- parse_setup(sps_name)
head(sps_example$setup)
#>   column_number         column_name begin end
#> 1            V1     IDENTIFIER_CODE     1   1
#> 2            V2  NUMERIC_STATE_CODE     2   3
#> 3            V3            ORI_CODE     4  10
#> 4            V4               GROUP    11  12
#> 5            V5 GEOGRAPHIC_DIVISION    13  13
#> 6            V6                YEAR    14  17
```
