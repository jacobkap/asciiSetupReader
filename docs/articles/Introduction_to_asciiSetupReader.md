# Introduction to asciiSetupReader

Some (usually older) data sets are only available in fixed-width ASCII
files (.txt or .dat) that have an .sps (SPSS) or .sas (SAS) setup file
explaining to the software how to read that file. This package allows
you to read in the data if you have both the fixed-width file and its
accompanying setup file. These parameters `data` and `setup_file` are
the only ones requires to run the package though five optional
parameters allow you to customize results.

`data` - A string containing the name of the data file

`setup_file` - A string containing the name of the data file

Both files must be in your working directory or the string must contain
the path to the file. Below is an example of reading in the example
dataset - the original data and setup files can be found
[here](https://www.icpsr.umich.edu/web/NACJD/studies/9327).

Please note that I am only using
[`system.file()`](https://rdrr.io/r/base/system.file.html) here so the
vignette builds in the package even not on my own computer. You will not
use this in the function. Instead you’d simply input
`data = "example_data.zip"` and `setup_file = "example_setup.sps"`. The
data file does not have to be in a zip folder, it is only in a zip
folder here to reduce the size of this package. In most cases it will be
a .dat or a .txt file.

``` r
data <- system.file("extdata", "example_data.zip",
             package = "asciiSetupReader")
setup_file <- system.file("extdata", "example_setup.sps",
             package = "asciiSetupReader")

example <- asciiSetupReader::read_ascii_setup(data = data,
setup_file = setup_file)
example[1:6, 1:4] # Look at first 6 rows and first 4 columns
```

    ##   IDENTIFIER_CODE NUMERIC_STATE_CODE ORI_CODE             GROUP
    ## 1 SHR master file            Alabama  AL00112 Cit 50,000-99,999
    ## 2 SHR master file            Alabama  AL00112 Cit 50,000-99,999
    ## 3 SHR master file            Alabama  AL00112 Cit 50,000-99,999
    ## 4 SHR master file            Arizona  AZ00189       Cit < 2,500
    ## 5 SHR master file            Arizona  AZ00189       Cit < 2,500
    ## 6 SHR master file            Arizona  AZ00189       Cit < 2,500

There are five optional parameters: `use_value_labels`,
`use_clean_names`, `select_columns`, `coerce_numeric` and
`missing_values`.

## `use_value_labels`

Fixed-width delimited text files are designed to be as compressed as
possible. One way of doing this is having letters or numbers represent
values. For example, instead of writing “male” or “female” in a column
about gender, it will be “0” or “1” (or “M” and “F”). The setup file
gives the actual value of these representations. When the parameter
`use_value_labels` is TRUE (which it is by default) it will give the
value labels; otherwise it will give only the representation. This
parameter is the most time consuming part of the function so if you have
a very large dataset but only a few variables you are interested in, it
may be wise to set it as FALSE (or use the parameter `select_columns` to
get only those columns).

``` r
example <- asciiSetupReader::read_ascii_setup(data = data,
setup_file = setup_file,
use_value_labels = FALSE)
example[1:6, 1:4] # Look at first 6 rows and first 4 columns
```

    ##   IDENTIFIER_CODE NUMERIC_STATE_CODE ORI_CODE GROUP
    ## 1               6                  1  AL00112     3
    ## 2               6                  1  AL00112     3
    ## 3               6                  1  AL00112     3
    ## 4               6                  2  AZ00189     7
    ## 5               6                  2  AZ00189     7
    ## 6               6                  2  AZ00189     7

## `use_clean_names`

Column names are similar to how there are both value representations and
value labels for values in a column. The columns may have a
non-descriptive name (e.g. V1, V2) or a descriptive one (e.g. CITY,
GENDER). When `use_clean_names` is TRUE (which it is by), the
descriptive name is given; otherwise the non-descriptive name is given.

``` r
example <- asciiSetupReader::read_ascii_setup(data = data,
setup_file = setup_file,
use_clean_names = FALSE)
example[1:6, 1:4] # Look at first 6 rows and first 4 columns
```

    ##                V1      V2      V3                V4
    ## 1 SHR master file Alabama AL00112 Cit 50,000-99,999
    ## 2 SHR master file Alabama AL00112 Cit 50,000-99,999
    ## 3 SHR master file Alabama AL00112 Cit 50,000-99,999
    ## 4 SHR master file Arizona AZ00189       Cit < 2,500
    ## 5 SHR master file Arizona AZ00189       Cit < 2,500
    ## 6 SHR master file Arizona AZ00189       Cit < 2,500

## `select_columns`

This parameter allows you to return only the specific columns you want.
It is very useful when dealing with a large file which you only want
part of. It accepts 3 inputs: column numbers, the non-descriptive column
names, or the descriptive column names - you can only choose one input
type, cannot mix them together. To get the column names and numbers,
consult with the g documentation.

This gets only the first two columns of data and specifies the columns
by number.

``` r
example <- asciiSetupReader::read_ascii_setup(data = data,
setup_file = setup_file, 
select_columns = 1:2) # Gets only the first 2 columns
head(example)
```

    ##   IDENTIFIER_CODE NUMERIC_STATE_CODE
    ## 1 SHR master file            Alabama
    ## 2 SHR master file            Alabama
    ## 3 SHR master file            Alabama
    ## 4 SHR master file            Arizona
    ## 5 SHR master file            Arizona
    ## 6 SHR master file            Arizona

This gets only the first two columns of data and specifies the columns
by descriptive names.

``` r
example <- asciiSetupReader::read_ascii_setup(data = data,
setup_file = setup_file, 
select_columns = c("IDENTIFIER_CODE", "NUMERIC_STATE_CODE")) # Gets only the first 2 columns
head(example)
```

    ##   IDENTIFIER_CODE NUMERIC_STATE_CODE
    ## 1 SHR master file            Alabama
    ## 2 SHR master file            Alabama
    ## 3 SHR master file            Alabama
    ## 4 SHR master file            Arizona
    ## 5 SHR master file            Arizona
    ## 6 SHR master file            Arizona

This gets only the first column of data and specifies the column by
non-descriptive names.

``` r
example <- asciiSetupReader::read_ascii_setup(data = data,
setup_file = setup_file,
select_columns = "V1") # Gets only the first columnss
head(example)
```

    ##   IDENTIFIER_CODE
    ## 1 SHR master file
    ## 2 SHR master file
    ## 3 SHR master file
    ## 4 SHR master file
    ## 5 SHR master file
    ## 6 SHR master file

## `coerce_numeric`

When `coerce_numeric` is TRUE (the default), columns whose values are
all numbers become numeric columns. Columns the setup file says are text
(SPSS “(A)”, SAS “\$”) always stay text, so codes such as ZIP codes keep
their leading zeros. Set it to FALSE to keep every column as text.

## `missing_values`

Setup files often list codes, such as -9 or 999, that mean a value is
missing; these become NA. Many setup files have their missing values
section commented out. `missing_values = "all"` (the default) uses every
missing value in the file, as earlier versions did; `"active"` uses only
those that aren’t commented out; and `"none"` uses none of them, so the
codes stay in the data.
