[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/asciiSetupReader)](https://cran.r-project.org/package=asciiSetupReader.png)
[![Travis-CI Build
Status](https://travis-ci.org/jacobkap/asciiSetupReader.png?branch=master)](https://travis-ci.org/jacobkap/asciiSetupReader)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/jacobkap/asciiSetupReader?branch=master&svg=true)](https://ci.appveyor.com/project/jacobkap/asciiSetupReader)
[![Coverage
status](https://codecov.io/gh/jacobkap/asciiSetupReader/branch/master/graph/badge.svg)](https://codecov.io/github/jacobkap/asciiSetupReader?branch=master)
[![](https://cranlogs.r-pkg.org/badges/asciiSetupReader)](https://cran.rstudio.com/web/packages/asciiSetupReader/index.html)
[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)

Overview
--------

Some (usually older) data sets are only available in fixed-width ASCII
files (.txt or .dat) that have an .sps (SPSS) or .sas (SAS) setup file
explaining to the software how to read that file. These file
combinations are sometimes referred to as .txt+.sps, .txt+.sas,
.dat+.sps, .dat+.sas. This package allows you to read in the data if you
have both the fixed-width file and its accompanying setup file.

Installation
------------

``` r
To install this package, use the code
install.packages("asciiSetupReader")


# The development version is available on Github.
# install.packages("devtools")
devtools::install_github("jacobkap/asciiSetupReader")
```

Usage
-----

These parameters `data` and `setup_file` are the only ones requires to
run the package though three optional parameters allow you to customize
results.

`data` - A string containing the name of the data file `setup_file` - A
string containing the name of the data file

Both files must be in your working directory or the string must contain
the path to the file. Below is an example of reading in the example
dataset - the original data and setup files can be found
[here](https://www.icpsr.umich.edu/icpsrweb/NACJD/studies/9327?q=&restrictionType%5B0%5D=Public+Use&classification%5B0%5D=NACJD.IX.*&dataFormat%5B0%5D=SPSS).

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
