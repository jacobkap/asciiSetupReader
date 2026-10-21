## Release summary

This release fixes how setup files are read: value labels keep apostrophes
and other characters, columns with implied decimal places get their
decimal point, column names are always unique, SPSS GET DATA positions are
no longer off by one, and setup files that can't be read give a clear
error. It adds a `missing_values` argument for setup files whose missing
values are commented out. Changes that affect results are listed first in
NEWS.md.

## Test environments

* local Windows 11 install, R 4.6.1

## R CMD check results

0 errors | 0 warnings | 1 note

* Days since last update: 4

  This release fixes values that were silently read wrongly: numbers with
  implied decimal places (e.g. 78.5 read as 785), value labels with an
  apostrophe, and columns read one position off. Users get wrong data
  until it's updated.

## Reverse dependencies

There is 1 reverse dependency (psidread). R CMD check of psidread 1.0.7
with this version of asciiSetupReader returns Status: OK.
