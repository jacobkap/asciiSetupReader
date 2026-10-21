# asciiSetupReader 3.0.0

## Changes that can affect your results

Read these before upgrading: some numbers, names, labels and missing values
are now different (and correct).

* **Implied decimal places are applied.** Columns that the setup file gives
  implied decimal places (`V7 37-43 (1)` in SPSS, `V7 37-43 .1` in SAS)
  used to be read as whole numbers, so a value of `0000785` was 785 rather
  than 78.5. They now get their decimal point, with a message listing each
  column and its number of decimal places. With `coerce_numeric = FALSE`
  the point is added to the text ("000078.5"). Values that already have a
  decimal point are kept as they are, as in SPSS and SAS. Value labels and
  missing values of these columns, which setup files write as numbers
  (`1.0`, `-9.00`), are now matched by value. `parse_setup()$setup` has a
  new `decimals` column.
* **Column names are always unique.** When two columns would get the same
  clean name, the later ones get their short name added, e.g. the second
  "CLOTHING" column, V93, is now `CLOTHING_V93`, and PSID's repeated
  "RELEASE NUMBER" becomes `RELEASE_NUMBER_TA050001` for the 2005 wave.
  Before, the data had duplicate names, so `data$CLOTHING` only gave the
  first of them and dplyr and data.table stopped with an error. A message
  lists the renamed columns.
* **An `=` inside a label no longer cuts the name short.** "SEP FROM FATHER
  < OR = 5" was named `X5`; it is now `SEP_FROM_FATHER_under_OR_5`.
* **`%` in a label becomes `_percent_`** in the name, as `<` already became
  `_under_` (e.g. "1919 RT % VOTES CAST" is `X1919_RT_percent_VOTES_CAST`,
  not `X1919_RT_VOTES_CAST`, which "1919 RT VOTES CAST" could also be).
* **Missing values are matched by value**, as SPSS and SAS do: a missing
  value written `9`, `09` or `0000009` matches any of them in the data.
  Before, they had to be written exactly as in the data, so
  `IF V156=0000009 THEN V156=.;` never matched the `9`s in a 1-column field.
  Columns the setup file says are text (SPSS `(A)`, SAS `$`) still need
  exactly the same text.
* **Value labels of number columns are matched by value** too, so a label
  for `0` now labels data written `0000000` (e.g. 7,997 "Not updated"
  values in the 1960 UCR file that used to stay as `0000000`).
* **Blanks and the letters `NA` in text columns are values, not missing**,
  as in SPSS and SAS, so their labels are used: e.g. 166,650 blanks in the
  1960 UCR file are now "No return received" and 15,555 in the 2000 NIBRS
  batch header "Inactive", where they used to be `NA`. Blank text values
  without a label are still `NA`. In number columns a blank, `NA` or a lone
  `.` is missing (a lone `.` used to be kept).
* **Columns without a label in VARIABLE LABELS or LABEL are kept**, named
  by their short name; they used to be dropped.
* **A SAS label continued on the next line is read in full**, so names that
  used to be cut short at the line's end are longer: e.g. the prisoners
  file's `LFM` and `LFF` were `..._LOCAL_AUTHORITY` and
  `..._LOCAL_AUTHORITY_LFF` (one name, made unique) and are now
  `..._LOCAL_AUTHORITY_MALE` and `..._LOCAL_AUTHORITY_FEMALE`. 24 names in 6
  of the 157 setup files the package is tested on changed this way.
* **A later VALUE LABELS command replaces a column's earlier labels**, as
  in SPSS (`ADD VALUE LABELS` adds to them instead). Before, the first set
  was kept. A message lists the columns whose earlier, different labels were
  replaced.
* **SPSS GET DATA files are read at the right positions.** Their column
  positions count from 0, so every column used to be read one position too
  early. As in SPSS, GET DATA formats such as `F7.1` don't imply decimal
  places.
* Setup files that aren't valid UTF-8 are read as Windows-1252, so curly
  quotes and dashes in labels are read correctly (see below).
* asciiSetupReader now needs R 4.1.0 or later (its dependencies vroom,
  readr and stringr already did).

## New features

* `read_ascii_setup()`, `spss_ascii_reader()` and `sas_ascii_reader()` have
  a `missing_values` argument. Many setup files have their missing values
  section commented out (`* MISSING VALUES` in SPSS, inside `/* */` in SAS)
  so the codes stay in the data unless you choose otherwise:
  `"all"` (the default, as before) uses every missing value in the file,
  `"active"` only those that aren't commented out, and `"none"` none of
  them. When commented-out missing values are used, a message says where
  they are and how many values they made NA. `parse_setup()$missing` has a
  new `commented` column.
* Messages tell you about implied decimal places, commented-out missing
  values, renamed columns, replaced value labels and setup files that aren't
  UTF-8. They have the class `"asciiSetupReader_message"` (and one for each
  kind), so they can be silenced with `suppressMessages()`. Missing values
  that also have a value label keep the label (as before); the
  documentation now says so.
* More SPSS and SAS syntax is understood: VALUE LABELS and MISSING VALUES
  for lists of variables (`V1 V2 1 'Yes'`, `V1 TO V5 (9)`) and starting on
  the command's own line, `ADD VALUE LABELS`, several MISSING VALUES
  sections in one file, commented-out VALUE LABELS between other sections,
  variables named VALUE or LABELS, and SAS formatted input
  (`@1 V1 $CHAR2. @3 V2 4.1`).
* Setup files that aren't valid UTF-8 are read as Windows-1252 (Latin-1
  plus curly quotes and dashes), with a message, instead of failing with
  "input string 3 is invalid" (GitHub #5).
* SPSS MISSING VALUES follow SPSS's rules more closely: a later command
  replaces a column's missing values, `V1 ()` clears them, `ALL` means
  every column, `/` can separate columns on one line, `THRU` can be in any
  case, and long or decimal ranges (`1000000 THRU 9999999`,
  `99.5 THRU 99.9`) are compared as numbers instead of being listed one
  value at a time.
* SAS missing value recodes are read as whole statements, from every
  section after INPUT: `>=`/`GE` alone (`98 thru highest`), `<=`/`LE`,
  `GE a AND LE b`, `EQ`, lower-case names and statements over several
  lines. Statements that aren't "IF v = ... THEN v = .;" (e.g. a recode to
  another value, or a condition on another column) used to be misread as
  missing values; they're now skipped, with a message.
* Statements that change values rather than mark them missing (SAS
  `IF v = 1 THEN v = 5;`, SPSS `RECODE v (1=5)`) aren't applied; a message
  lists them. Only a setup file's layout, names, labels and missing values
  are used, as before, but such statements used to be misread.
* `SKIP` (SPSS DATA LIST), `/FIRSTCASE` (GET DATA) and `FIRSTOBS` (SAS
  INFILE) skip header lines in the data.
* SAS formatted input without `@` pointers (`INPUT V1 2. V2 $3.;`), INPUT on
  the same line as the first column, blank lines inside INPUT and
  commented-out INPUT statements are handled.
* Setup files the package can't read now say why, with an error of class
  `"asciiSetupReader_error"`: a file for delimited data
  (`GET DATA /ARRANGEMENT = DELIMITED`, `DATA LIST FREE` or `LIST`, or SAS
  `DLM=`/`DSD`, GitHub #13), a
  file of value labels without column positions (such as PSID's separate
  formats files), a file without a DATA LIST or INPUT section, or a layout
  the package can't read: several records per case (`RECORDS=`, `/2`,
  SAS `#2`), columns given by format only (`ID (F3) NAME (A5)`) or SAS variable lists in
  parentheses. These used to fail with "invalid 'row.names' length" or
  "argument of length 0", or read the wrong columns.
* SAS FORMAT statements are read as whole statements: one format for a list
  of columns (`FORMAT V1 V2 YNF.;`), numbered and positional lists
  (`V1-V5`, `V1--V5`), formats without value labels (`8.2`, `DATE9.`) and
  `ATTRIB ... FORMAT=`. Format names match in any case, and a format defined
  twice uses the later definition, as in SAS.
* Column labels are read by their quoting, so they can be laid out any way
  SPSS and SAS allow: in SPSS VARIABLE LABELS (or `VAR LABELS`), several
  columns on one line, `/` between columns, the first column on the
  command's own line and labels joined with `+`; in SAS LABEL, several
  columns on one line, blank lines, labels over several lines, a `;` inside
  a label, LABEL after another statement on its line, and
  `ATTRIB V1 V2 LABEL = '...'` (for every column listed) whatever else
  ATTRIB sets. A LABEL statement inside a `/* */` comment isn't used.
* SAS code lists (`VALUE F 1, 2, 3 = 'Low';`) give each code the label.
  Value ranges (`1 - 97 = 'Actual hours'`) and `OTHER` aren't applied, so
  the real numbers are kept; a message lists them.
* SPSS DATA LIST is read token by token, so its spacing and layout don't
  matter: tightly spaced columns (`AA 1-4(A) BB 5-8(A)`), formats and
  decimals anywhere on a line (`V1 1-5 (F,2) V2 6-7`), columns on the DATA
  LIST line itself, a name and its position on different lines, `/* */`
  comments, names with `@`, `#`, `$` or `.`, and a missing closing period.
  As in SPSS, names listed before one range share it equally (`A B C 1-6`,
  `Q1 TO Q3 3-5`). GET DATA formats such as `AUTO` and `ADATE10` and
  `/VARIABLES=` without spaces are read, and a second record given by a
  bare `/` stops with the several-records error. All 157 setup files the
  package is tested on are read exactly as before.

## Package

* The setup and data files used only by the tests moved from
  `inst/testdata` to `tests/testthat/testdata`, so they're no longer
  installed with the package (about 4 MB less).

## Bug fixes

* A missing value range that no value in the data falls in (SPSS
  `97 THRU HI`, `LO THRU -1`, SAS `IF V1 >= 97 THEN V1 = .;`) no longer
  stops `read_ascii_setup()` with "'names' attribute [1] must be the same
  length as the vector [0]".
* Every missing value range is compared with the data as numbers, so values
  between whole numbers are in it too: 97.5 is missing for `97 THRU 99`.
  `parse_setup()$missing` still lists a range of whole numbers value by
  value.
* Value labels keep apostrophes. Labels are now read by their quoting, so a
  quote character inside a label is part of the label: before, an apostrophe
  became a space or was dropped (`"anti-jehovah's witness"` became
  "anti-jehovah s witness" and `'Don''t know'` became "Dont know"). This
  affected both SPSS and SAS setup files.
* Value labels are kept exactly as written between their quotes in other
  ways too: a double quote inside a single-quoted label (`'Wife/"Wife"'`) is
  kept, and so are `=` and `;`, which used to become a space or be dropped.
* A variable whose value labels are written more than once in a setup file
  no longer gets its name added to a label (e.g. "msa state police V9").
  Within one VALUE LABELS command, later copies only add codes that weren't
  already labelled; a later command replaces the labels (see above).
* Fixed labels being assigned to the wrong codes in some setup files: a
  label of just 'Wife' (`2 'Wife' 3 'Common-law husband'` gave a code
  "2 Wife 3"), a code written `''''`, quoted words inside a label
  (`'farmer, ''profits'''`, `'Twelfth grade, "High School", GED'`), and
  SAS labels split over several quoted pieces, whose end became a separate
  code.
* SPSS value labels continued with `+` (at the end of a line or the start
  of the next) are joined into one label, and a double-quoted code followed
  by more pairs on the same line (`"02" "two" 3 'three'`) no longer runs
  into the next pair.
* The 2017 YRBS SADC SAS setup file, which failed with "NA/NaN argument",
  can be read.
* A label of only punctuation (e.g. "...") no longer ends the list of
  column names early; that column keeps its short name.
* A setup file that only mentions MISSING VALUES in a comment no longer
  fails.
* SAS setup files with many value labels (such as PSID's) are parsed faster.

# asciiSetupReader 2.6.0

## Bug fixes

* `coerce_numeric = TRUE` now checks every row before converting a column to
  numeric. Previously files over 50,000 rows only had a random sample of rows
  checked (and a file of exactly 50,000 rows only 5,000), so a column with
  rare text values could be converted to numeric, silently turning those
  values into `NA`, differently on every run. The sampling also changed the
  user's random number stream.
* Values with bytes that are invalid in the current locale no longer cause
  an error when checking for numeric columns (the column stays character)
  or when applying open-ended missing value ranges.
* `make_sps_setup()` works again on R >= 4.5.0 (it failed with "NA in
  coercion to boolean"), works when `col_labels` isn't given, and no longer
  leaves a `sink()` open if it fails. A `file_name` ending in ".SPS" no
  longer gets a second extension, and one merely ending in "sps" (e.g.
  "datasps") is no longer cut short.
* Missing values given as "X thru highest" no longer fail with "`labels`
  must be unique" when the value X itself appears in the data.
* Open-ended missing value ranges now match zero-padded data (e.g.
  "0000012" for "0000009 THRU HI"). Previously those values were left in
  the data.
* Missing value ranges written "LO THRU X" or "LOWEST THRU X" are now
  applied. Previously only "low thru" was recognized, so these were ignored.
* `make_sps_setup()`'s `missing_values` accepts column names as well as
  labels. Previously a column name was treated as a missing value of the
  column before it.
* SPSS setup files whose first line is `DATA LIST` can now be read.

## Speed

* Parsing setup files is much faster, especially for files with many columns
  (e.g. PSID setup files: from about 2 minutes to under 10 seconds).
* Reading data is faster: the data is no longer copied twice, and value
  labels and missing values are applied with a direct lookup.

## Other changes

* `spss_ascii_reader()` and `sas_ascii_reader()` now call
  `read_ascii_setup()`; results and arguments are unchanged.
* Data files are read with vroom only. If vroom failed, the package used to
  retry silently with readr, which since readr 2.0 reads with vroom too, so
  the retry rarely helped and hid vroom's error. Now vroom's error is shown.
* The package no longer depends on haven or zoo.
* Requires R >= 3.6.0 (as vroom already did).
* Examples now run, and the code is commented.
* Adds a GitHub Actions R CMD check workflow, replacing Travis and AppVeyor.

# asciiSetupReader 2.5.3

* Misc bug fixes

# asciiSetupReader 2.5.2

* Removes startup message

# asciiSetupReader 2.5.1

* Adds startup message

# asciiSetupReader 2.5.0

* In column names now replaces "<" with "_under_", ">" with "_over_", 
 "$" with "_dollar_", "+" with "_plus_", "@" with "_at_".  Previously
 these values would be replaced by "_". 

# asciiSetupReader 2.4.0

* Adds functionality to handle "low thru" missing values.
* "low thru" and "thru high" missing values are now less (more) than and equal
  to rather than just less (more) than the value.

# asciiSetupReader 2.3.2

* Fix bug on reading an atypical .sps file.

# asciiSetupReader 2.3.1

* Fix bug caused by `vroom` not handling embedded nulls.
* Fix bug where code would run even if start column number > end column number, but would crash code later.
* Fix bug where code wouldn't run if .sps setup file read MISSING VALUE rather than MISSING VALUES.
* Fix bug when value label is "X thru highest value". Now will change all values >= X to be NA. 


# asciiSetupReader 2.3.0

* Misc. bug fixes.
* Change package to read in fixed-width files from `readr` to `vroom` to 
  significantly increase read time.

# asciiSetupReader 2.2.0

* Adds an addin to use the `read_ascii_setup()` function interactively. This allows
  users to select every option in the popup window. 

# asciiSetupReader 2.1.0

* Reorder list of value labels returned from `parse_setup` to be in same order
  as in setup file.
* Misc. bug fixes and many new tests.

# asciiSetupReader 2.0.2

* Misc. bug fixes.

# asciiSetupReader 2.0.1

* Fix problem where package didn't work with dev version of Haven.

# asciiSetupReader 2.0.0

## Major Changes

* Adds a single function (`read_ascii_setup`) that will read in data for both
  .dat+.sps and .dat+.sas pairs. This is just a helper function that calls
  `spss_ascii_reader` or `sas_ascii_reader`.
* Adds function to create sps setup files.
* Adds capacity for .sas reader to handle missing values.
* Adds a function for users to parse the setup file (.sps or .sas) and get results. 
An accompanying vignette explains this function.
* Adds a function to make your own .sps files (not .sas yet).

## Minor Changes
* Adds option to not coerce potentially numeric columns into numeric type. Useful in cases like dealing with Census FIPS codes that have leading zeros. 
* Miscellaneous bug fixes.
* Fixes bug when missing values are an interval (e.g. -1 thru -8).

# asciiSetupReader 1.4.0
* Adds capacity to the SPSS reader to handle Missing Values.
* Fixes bug where function fails if no value-labels are detected.
    + Applies both when setup file has no value-labels and if only select columns that have no value-labels.
* Adds a huge number of tests.
* Changes factor column to character columns.
