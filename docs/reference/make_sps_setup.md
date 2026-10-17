# Create an SPSS setup file (.sps) to use for reading in fixed-width text files

make_sps_setup() is used to create the setup file used in reading in
fixed-width text files. Often the setup file comes with the data file
but in some cases (usually with government data) you will need to create
the setup file yourself.

## Usage

``` r
make_sps_setup(
  file_name,
  col_positions,
  col_names = NULL,
  col_labels = NULL,
  value_labels = NULL,
  missing_values = NULL
)
```

## Arguments

- file_name:

  Name (or path) of the file to be saved (e.g. "setup_file1"). The .sps
  extension is added if it isn't already there.

- col_positions:

  Either a vector of strings indicating the start and end position of
  each column (e.g. "1-3", "4-5") or a vector of the widths of the
  columns (e.g. 3, 2).

- col_names:

  A vector of names for the columns. If none are provided, will
  automatically create names based on column number (e.g. V1, V2, V3).

- col_labels:

  A vector of labels for the columns. These are often longer and more
  descriptive than the col_names. These are the values used as column
  names if use_clean_names = TRUE in
  [`read_ascii_setup`](https://jacobkap.github.io/asciiSetupReader/reference/read_ascii_setup.md).

- value_labels:

  A vector with the value first, then an ' = ' then the label. Each new
  column should have the column name (or label) followed by ' ='.

- missing_values:

  A vector of strings with the column name or label followed by the
  values to be replaced by NA, e.g. c("var1", "9", "-8", "var2", "-8").

## Value

`NULL`, invisibly. Called to write the .sps file.

## Examples

``` r
value_labels <- c("var1 = ",
                  "1 = label 1",
                  "2 = label 2",
                  "3 = label 3",
                  "4 = label 4",
                  "5 = label 5",
                  "var3 = ",
                  "1A = alpha",
                  "1B = bravo",
                  "1C = cat")
missing_values <- c("state name", "9", "-8", "county", "-8")
file_name <- file.path(tempdir(), "example_name")
make_sps_setup(file_name      = file_name,
               col_positions  = c(1, 3, 4, 2),
               col_names      = c("var1", "var2", "var3", "var4"),
               col_labels     = c("state name", "county",
                                  "population", "census region code"),
               value_labels   = value_labels,
               missing_values = missing_values)

# The new setup file can be used with parse_setup() and read_ascii_setup()
parse_setup(paste0(file_name, ".sps"))
#> $setup
#>   column_number        column_name begin end
#> 1          var1         state_name     1   1
#> 2          var2             county     2   4
#> 3          var3         population     5   8
#> 4          var4 census_region_code     9  10
#> 
#> $value_labels
#> $value_labels$var1
#> label 1 label 2 label 3 label 4 label 5 
#>     "1"     "2"     "3"     "4"     "5" 
#> 
#> $value_labels$var3
#> alpha bravo   cat 
#>  "1A"  "1B"  "1C" 
#> 
#> 
#> $missing
#>   variable values
#> 1     var1      9
#> 2     var1     -8
#> 3     var2     -8
#> 
```
