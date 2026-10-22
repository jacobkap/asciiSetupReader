* A small SPSS setup file for tab-delimited data, written for the tests.
* It has the same layout as the file attached to GitHub issue #13.
GET DATA  /TYPE = TXT /FILE = 'data.dat' /DELCASE = LINE /DELIMITERS = "\t" /ARRANGEMENT = DELIMITED /FIRSTCASE = 2 /IMPORTCASE = ALL /VARIABLES =
ID A6
VISIT_DATE ADATE10
SCORE F10.0
.
VARIABLE LABELS
ID "Participant ID" /
VISIT_DATE "Visit date" /
SCORE "Score" /
.
VALUE LABELS
SCORE '1' "Low" /
.
EXECUTE.
