[![HitCount](http://hits.dwyl.io/jacobkap/asciiSetupReader.svg)](http://hits.dwyl.io/jacobkap/asciiSetupReader)

[![Build Status](https://travis-ci.org/jacobkap/asciiSetupReader.png?branch=master)](https://travis-ci.org/jacobkap/asciiSetupReader)

Introduction to asciiSetupReader
================================

Some datasets are only available in fixed-width delimited (this means the each row has the same number of characters) text files (.txt) that have an SPSS setup file (.sps) that tells the SPSS software how to read in the data. This package allows R to read in this type of data by mimicking SPSS' process. To use it you need a text file containing data and the corresponding SPSS setup file. SPSS setup files come with the file extention .sps but changing it to .txt will work the same.

To use the spss\_ascii\_reader function, all that is needed is to provide a string with the name of the dataset (the .txt) file and a string with the name of the SPSS setup file (the .sps) including the file extention. The files must be in the working directory. Below is an example of reading in the example dataset - the original can be found [here](https://www.icpsr.umich.edu/icpsrweb/NACJD/studies/9327?q=&restrictionType%5B0%5D=Public+Use&classification%5B0%5D=NACJD.IX.*&dataFormat%5B0%5D=SPSS).

``` r
data_name <- system.file("extdata", "example_data.zip",
             package = "asciiSetupReader")
sps_name <- system.file("extdata", "example_setup.sps",
             package = "asciiSetupReader")

example <- asciiSetupReader::spss_ascii_reader(dataset_name = data_name,
sps_name = sps_name)
example[1:6, 1:4] # Look at first 6 rows and first 4 columns
```

    ##   IDENTIFIER_CODE NUMERIC_STATE_CODE ORI_CODE             GROUP
    ## 1 SHR master file            Alabama  AL00112 Cit 50,000-99,999
    ## 2 SHR master file            Alabama  AL00112 Cit 50,000-99,999
    ## 3 SHR master file            Alabama  AL00112 Cit 50,000-99,999
    ## 4 SHR master file            Arizona  AZ00189       Cit < 2,500
    ## 5 SHR master file            Arizona  AZ00189       Cit < 2,500
    ## 6 SHR master file            Arizona  AZ00189       Cit < 2,500

There are two optional parameters: value\_label\_fix and real\_names. The default for both is TRUE.

value\_label\_fix
-----------------

Fixed-width delimited text files are designed to be as compressed as possible. One way of doing this is having letters or numbers represent values. For example, instead of writing "male" or "female" in a column about gender, it will be "A" or "B" (or more commonly 0 or 1). The SPSS setup file gives the actual value of these repesentations. The parameter "value\_label\_fix" will give the real values if TRUE, otherwise it will keep the representation. This parameter is the most time consuming part of the function so if you have a very large dataset but only a few variables you are interested in, it may be wise to set it as FALSE.

``` r
example <- asciiSetupReader::spss_ascii_reader(dataset_name = data_name,
sps_name = sps_name,
value_label_fix = FALSE)
example[1:6, 1:4] # Look at first 6 rows and first 4 columns
```

    ##   IDENTIFIER_CODE NUMERIC_STATE_CODE ORI_CODE GROUP
    ## 1               6                  1  AL00112     3
    ## 2               6                  1  AL00112     3
    ## 3               6                  1  AL00112     3
    ## 4               6                  2  AZ00189     7
    ## 5               6                  2  AZ00189     7
    ## 6               6                  2  AZ00189     7

real\_names
-----------

Column names are similar to how there are both value representations and value labels for values in a column. The columns may have an undescriptive name (e.g. V1, V2) or a descriptive one (e.g. CITY, GENDER). When real\_names is FALSE (which is the default), the undescriptive is given. When real\_names is TRUE, the descriptive name is given.

``` r
example <- asciiSetupReader::spss_ascii_reader(dataset_name = data_name,
sps_name = sps_name,
real_names = FALSE)
example[1:6, 1:4] # Look at first 6 rows and first 4 columns
```

    ##                V1      V2      V3                V4
    ## 1 SHR master file Alabama AL00112 Cit 50,000-99,999
    ## 2 SHR master file Alabama AL00112 Cit 50,000-99,999
    ## 3 SHR master file Alabama AL00112 Cit 50,000-99,999
    ## 4 SHR master file Arizona AZ00189       Cit < 2,500
    ## 5 SHR master file Arizona AZ00189       Cit < 2,500
    ## 6 SHR master file Arizona AZ00189       Cit < 2,500

keep\_columns
-------------

When reading a file of this type into SPSS, you can specify which columns (if you don't want every column) to include. This has the same ability by allowing you to specify the columns you want. This parameter can accept the column number, the undescriptive column name (see above) or the descriptive column name. You cannot mix and match. To get the column names, please consult with the data's documentation.

This gets only the first two columns of data and specifies the columns by number.

``` r
example <- asciiSetupReader::spss_ascii_reader(dataset_name = data_name,
sps_name = sps_name, 
keep_columns = 1:2) # Gets only the first 2 columns
example[1:6, 1:2] # Look at first 6 rows and first 4 columns
```

    ##   IDENTIFIER_CODE NUMERIC_STATE_CODE
    ## 1 SHR master file            Alabama
    ## 2 SHR master file            Alabama
    ## 3 SHR master file            Alabama
    ## 4 SHR master file            Arizona
    ## 5 SHR master file            Arizona
    ## 6 SHR master file            Arizona

This gets only the first two columns of data and specifies the columns by descriptive name.

``` r
example <- asciiSetupReader::spss_ascii_reader(dataset_name = data_name,
sps_name = sps_name, 
keep_columns = c("IDENTIFIER_CODE", "NUMERIC_STATE_CODE")) # Gets only the first 2 columns
example[1:6, 1:2] # Look at first 6 rows and first 4 columns
```

    ##   IDENTIFIER_CODE NUMERIC_STATE_CODE
    ## 1 SHR master file            Alabama
    ## 2 SHR master file            Alabama
    ## 3 SHR master file            Alabama
    ## 4 SHR master file            Arizona
    ## 5 SHR master file            Arizona
    ## 6 SHR master file            Arizona
