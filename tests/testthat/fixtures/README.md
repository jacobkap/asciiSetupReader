# Test fixtures

Setup files (and small extracts of their data) that the tests read. Except
`delimited_get_data.sps`, which was written for the tests, every file is a
byte-for-byte copy of its source, zipped where it is large; the data files
are records of the source data, unchanged. Files from third parties remain
their owners'; they're included unmodified, only as test inputs.

| File | Source | Used in |
|---|---|---|
| `ucr_hate_crimes_incident_report.sps`, `ucr_hate_crimes_batch_header.sps`, `nibrs_offense_segment.sps`, `nibrs_batch_header_1.sps`, `arrests_monthly_header_1980_present.sps` | Setup files from the Crime Data Analysis Project (cdap). FBI data, public domain. | test-value-labels-real-files.R |
| `hate_crimes_2024_incident_report.txt`, `hate_crimes_2024_batch_header.txt`, `nibrs_2024_offense_segment.txt`, `nibrs_2024_batch_header.txt`, `arrests_2024_monthly_header.txt` | Records from the 2024 FBI files those setup files read. | test-value-labels-real-files.R |
| `supplementary_homicide_reports_1976.sps.zip` | ICPSR setup file for the FBI's 1976 Supplementary Homicide Reports. Its MISSING VALUES section is commented out. | test-missing-values-argument.R, test-messages.R |
| `supplementary_homicide_reports_1976.zip` | The first 600 records of the 1976 Supplementary Homicide Reports (FBI, public domain). | test-missing-values-argument.R, test-messages.R |
| `delimited_get_data.sps` | Written for the tests: an SPSS setup file for tab-delimited data (`GET DATA /ARRANGEMENT = DELIMITED`), laid out like the file attached to GitHub issue #13. | test-setup-files.R |
| `INPUT_SAS_CENSOESC.sas.zip`, `INPUT_SPSS_CENSOESC.SPS.zip` | Attached to GitHub issue #5: the Brazilian school census layouts (Latin-1 text; SAS formatted input with `@` pointers; SPSS `GET DATA` with columns counted from 0). | test-setup-files.R |
| `J260682.sas.zip`, `J260682_format.sas.zip`, `J260813_formats.sps.zip` | Setup files from the PSID Data Center attached to a GitHub issue. The `_format`/`_formats` files only have value labels. PSID's data files are not included: PSID's conditions of use don't allow them to be redistributed. | test-setup-files.R |
