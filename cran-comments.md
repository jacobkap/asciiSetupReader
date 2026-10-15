## Release summary

This release fixes bugs (including `make_sps_setup()` failing on R >= 4.5.0
and numeric columns being decided from a random sample of rows), makes
reading much faster, drops the haven and zoo dependencies, and makes all
examples runnable.

## Test environments

* local Windows 11 install, R 4.6.1

## R CMD check results

0 errors | 0 warnings | 0 notes

## Reverse dependencies

There is 1 reverse dependency (psidread). R CMD check of psidread 1.0.7
with this version of asciiSetupReader returns Status: OK.
