# Parsing an .sps or .sas file

The `parse_setup` function is what this packages uses to convert the
.sps or .sas setup files into an usable format for R.

This will return a list of length 3 containing the objects “setup”,
“value_labels”, and “missing”.

``` r
# Using the example .sps setup file included with the package
sps_name <- system.file("extdata", "example_setup.sps",
                          package = "asciiSetupReader")
example <- asciiSetupReader::parse_setup(sps_name)
```

## setup

The first object in the returned list is a data.frame with 5 columns and
as many rows as there are columns in the data. The “column_number”
column is the non-descriptive name of the column while the “column_name”
is the descriptive name of the column. In `read_ascii_setup`, setting
`use_clean_names` to TRUE will set the data column names to the
“column_name” names, otherwise it will remain as the “column_number”
names. Since the data is in fixed-width format, you need to know the
location of each column. The “begin” and “end” columns in this object
provide that location for each column in the data. The “decimals” column
gives each column’s implied decimal places: a value of 0000785 in a
column with 1 implied decimal place is 78.5.

``` r
head(example$setup)
#>   column_number         column_name begin end decimals
#> 1            V1     IDENTIFIER_CODE     1   1        0
#> 2            V2  NUMERIC_STATE_CODE     2   3        0
#> 3            V3            ORI_CODE     4  10        0
#> 4            V4               GROUP    11  12        0
#> 5            V5 GEOGRAPHIC_DIVISION    13  13        0
#> 6            V6                YEAR    14  17        0
```

## value_labels

To make the data more compact, the data often provides values that
represent a label. For example, in a column about participant’s gender
it may only include “M” and “F” which stands for “Male” and “Female”.
The setup file will say the M = Male and F = Female. The value labels
tell us that we need to convert M to Male in the given column. This is a
list of named vectors indicating the value and its corresponding label.
If there are no value labels this object will be NULL.

``` r
example$value_labels[1:3]
#> $V1
#> SHR master file 
#>             "6" 
#> 
#> $V2
#>         Alabama         Arizona        Arkansas      California        Colorado 
#>             "1"             "2"             "3"             "4"             "5" 
#>     Connecticut        Delaware Washington, D.C         Florida         Georgia 
#>             "6"             "7"             "8"             "9"            "10" 
#>           Idaho        Illinois         Indiana            Iowa          Kansas 
#>            "11"            "12"            "13"            "14"            "15" 
#>        Kentucky       Louisiana           Maine        Maryland   Massachusetts 
#>            "16"            "17"            "18"            "19"            "20" 
#>        Michigan       Minnesota     Mississippi        Missouri         Montana 
#>            "21"            "22"            "23"            "24"            "25" 
#>        Nebraska          Nevada   New Hampshire      New Jersey      New Mexico 
#>            "26"            "27"            "28"            "29"            "30" 
#>        New York  North Carolina    North Dakota            Ohio        Oklahoma 
#>            "31"            "32"            "33"            "34"            "35" 
#>          Oregon    Pennsylvania    Rhode Island  South Carolina    South Dakota 
#>            "36"            "37"            "38"            "39"            "40" 
#>       Tennessee           Texas            Utah         Vermont        Virginia 
#>            "41"            "42"            "43"            "44"            "45" 
#>      Washington   West Virginia       Wisconsin         Wyoming          Alaska 
#>            "46"            "47"            "48"            "49"            "50" 
#>          Hawaii      Canal Zone     Puerto Rico  American Samoa            Guam 
#>            "51"            "52"            "53"            "54"            "55" 
#>  Virgin Islands 
#>            "62" 
#> 
#> $V4
#>               Possessions         ALL cit 250,000 +       Cit 100,000-249,999 
#>                       "0"                       "1"                       "2" 
#>         Cit 50,000-99,999         Cit 25,000-49,999         Cit 10,000-24,999 
#>                       "3"                       "4"                       "5" 
#>           Cit 2,500-9,999               Cit < 2,500               Non-MSA co. 
#>                       "6"                       "7"                       "8" 
#>              MSA counties           Cit 1,000,000 +       Cit 500,000-999,999 
#>                       "9"                      "1A"                      "1B" 
#>       Cit 250,000-499,999     Non-MSA co. 100,000 + Non-MSA co. 25,000-99,999 
#>                      "1C"                      "8A"                      "8B" 
#> Non-MSA co. 10,000-24,999      Non-MSA co. < 10,000         Non-MSA St Police 
#>                      "8C"                      "8D"                      "8E" 
#>         MSA co. 100,000 +     MSA co. 25,000-99,999     MSA co. 10,000-24,999 
#>                      "9A"                      "9B"                      "9C" 
#>          MSA co. < 10,000             MSA St Police 
#>                      "9D"                      "9E"
```

There is one named vector for each column in the data that has value
labels. We can see how many there are using
[`length()`](https://rdrr.io/r/base/length.html).

``` r
length(example$value_labels)
#> [1] 141
```

## missing

The final object in the list a data.frame with three columns and as many
rows as there are missing values in the data. The column “variable”
indicates the column in the data and the column “values” says that the
value in that row is to be replaced with NA. The column “commented” is
TRUE for missing values from a part of the setup file that is commented
out (see the `missing_values` parameter of
[`read_ascii_setup()`](https://jacobkap.github.io/asciiSetupReader/reference/read_ascii_setup.md)).
For example, if there are 10 columns in the data with missing values and
each column has two missing values (e.g. -8 and -9) there will be 20
rows in this data.frame. A missing value is when the data includes a
value that should be replaced with NA. For example, data often includes
negative values such as -8 or -9 mean that that value is missing and
should be NA. If there are no missing values this object will be NULL.

``` r
head(example$missing)
#> NULL
```
