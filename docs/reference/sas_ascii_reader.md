# Read fixed-width ASCII file using SAS Setup file

sas_ascii_reader() and spss_ascii_reader() are used when you need to
read a fixed-width ASCII (text) file that comes with a setup file. These
file combinations are sometimes referred to as .txt+.sps, .txt+.sas,
.dat+.sps, or .dat+.sas. The setup file provides instructions on how to
create and name the columns, and fix the key-value pairs (sometimes
called value labels). This is common in government data, particularly
data produced before 2010.

## Usage

``` r
sas_ascii_reader(
  dataset_name,
  sas_name,
  value_label_fix = TRUE,
  real_names = TRUE,
  keep_columns = NULL,
  coerce_numeric = TRUE,
  missing_values = c("all", "active", "none")
)
```

## Arguments

- dataset_name:

  Name of the ASCII (.txt) file that contains the data. This file may be
  zipped with a file extension of .zip.

- sas_name:

  Name of the SAS Setup file - should be a .sas or .txt file.

- value_label_fix:

  If TRUE, fixes value labels of the data. e.g. If a column is "sex" and
  has values of 0 or 1, and the setup file says 0 = male and 1 = female,
  it will make that change.

- real_names:

  If TRUE fixes column names from default column name in the SPSS setup
  file (e.g. V1, V2) to the name it says the column is called (e.g. age,
  sex, etc.).

- keep_columns:

  Specify which columns from the dataset you want. If NULL, will return
  all columns. Accepts the column number (e.g. 1:5), column name (e.g.
  V1, V2, etc.) or column label (e.g. VICTIM_NAME, CITY, etc.).

- coerce_numeric:

  If TRUE (default) will make columns where all values can be made
  numeric into numeric columns. Every value is checked, so a column with
  any text value stays character. Useful as FALSE if variables have
  leading zeros - such as US Census FIPS codes. See
  [`read_ascii_setup`](https://jacobkap.github.io/asciiSetupReader/reference/read_ascii_setup.md)
  for how implied decimal places are handled.

- missing_values:

  Which of the setup file's missing values to set to NA. Setup files
  often have their missing values section commented out (e.g. "\*
  MISSING VALUES" in SPSS or inside `/* */` in SAS) so that the codes
  stay in the data unless the user chooses otherwise.

  "all"

  :   (default) Use every missing value in the setup file, ignoring
      whether it is commented out. This is what earlier versions did.

  "active"

  :   Use only the missing values that aren't commented out, as SPSS and
      SAS would.

  "none"

  :   Don't use any missing values; every code is kept.

  Missing values are matched by value, as in SPSS and SAS, so a missing
  value written 9 also matches 09 or 0000009 in the data, except in
  columns the setup file says are text (SPSS "(A)", SAS "\$"), where it
  must be the same text. Value labels are applied first, so a missing
  value that also has a value label (e.g. 9 = "Unknown") keeps its label
  rather than becoming NA unless `use_value_labels = FALSE`.

## Value

Data.frame of the data from the ASCII file

## Details

sas_ascii_reader() gives the same result as
[`read_ascii_setup`](https://jacobkap.github.io/asciiSetupReader/reference/read_ascii_setup.md),
which reads both SPSS and SAS setup files; its arguments just have older
names.

## See also

[`read_ascii_setup`](https://jacobkap.github.io/asciiSetupReader/reference/read_ascii_setup.md),
[`spss_ascii_reader`](https://jacobkap.github.io/asciiSetupReader/reference/spss_ascii_reader.md)
For using an SPSS setup file

Other ASCII Reader functions:
[`spss_ascii_reader()`](https://jacobkap.github.io/asciiSetupReader/reference/spss_ascii_reader.md)

## Examples

``` r
# Text file is zipped to save space.
dataset_name <- system.file("extdata", "example_data.zip",
  package = "asciiSetupReader")
sas_name <- system.file("extdata", "example_setup.sas",
  package = "asciiSetupReader")

example <- sas_ascii_reader(dataset_name = dataset_name,
  sas_name = sas_name)

# Only returns the first 5 columns
example2 <- sas_ascii_reader(dataset_name = dataset_name,
  sas_name = sas_name, keep_columns = 1:5)
```
