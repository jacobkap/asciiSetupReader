## Release summary

This is a bug-fix release. Value labels that contain an apostrophe (or
other quote character) are now kept as written in the setup file, instead
of having the apostrophe turned into a space; a few related value-label
parsing errors are also fixed.

## Test environments

* local Windows 11 install, R 4.6.1

## R CMD check results

0 errors | 0 warnings | 1 note

* Days since last update: 2

  This release fixes value labels that were silently altered when reading
  data (an apostrophe in a label became a space, and some labels gained a
  variable name), so users get incorrect labels until it's updated.

## Reverse dependencies

There is 1 reverse dependency (psidread). R CMD check of psidread 1.0.7
with this version of asciiSetupReader returns Status: OK.
