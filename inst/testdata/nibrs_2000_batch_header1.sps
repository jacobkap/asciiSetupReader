*-------------------------------------------------------------------------*
 |           SPSS DATA DEFINITION STATEMENTS FOR ICPSR 3449               |
 |                                                                        |
 |           NATIONAL INCIDENT-BASED REPORTING SYSTEM, 2000               |
 |                                                                        |
 |                 PART 1: BATCH HEADER SEGMENT - B1                      |
 |                                                                        |
 |                                                                        |
 | This SPSS setup file contains the following statements:                |
 |                                                                        |
 | DATA LIST:  Specifies the input data file to be read and assigns the   |
 | name, type, decimal specification (if any) and identifies variable     |
 | beginning and ending column locations. Users must replace              |
 | "file-specification" with a complete statement of the data file's      |
 | location.                                                              |
 |                                                                        |
 | VARIABLE LABELS:  Assigns descriptive labels to variables. Variable    |
 | labels and variable names may be identical for certain variables.      |
 |                                                                        |
 | VALUE LABELS:  Assigns descriptive labels to codes in the data file.   |
 | Value labels may not be present for all variables in the data file.    |
 |                                                                        |
*-------------------------------------------------------------------------.

DATA LIST file="file-specification" /
  B1001  1-2(A)           B1002  3-4              B1003  5-13(A)
  B1004  14-25(A)         B1005  26-33            B1006  34-41
  B1007  42-71(A)         B1008  72-73(A)         B1009  74-75(A)
  B1010  76               B1011  77               B1012  78
  B1013  79(A)            B1014  80-88(A)         B1015  89-92
  B1016  93-96(A)         B1017  97(A)            B1018  98-105
  B1019  106-132          B1020  133-135
.

VARIABLE LABELS
  B1001  "SEGMENT LEVEL"
  B1002  "NUMERIC STATE CODE"
  B1003  "ORIGINATING AGENCY IDENTIFIER"
  B1004  "INCIDENT NUMBER"
  B1005  "DATE ORI WAS ADDED"
  B1006  "DATE ORI WENT NIBRS"
  B1007  "CITY NAME"
  B1008  "STATE ABBREVIATION"
  B1009  "POPULATION GROUP"
  B1010  "COUNTRY DIVISION"
  B1011  "COUNTRY REGION"
  B1012  "AGENCY INDICATOR"
  B1013  "CORE CITY"
  B1014  "COVERED BY ORI"
  B1015  "FBI FIELD OFFICE"
  B1016  "JUDICIAL DISTRICT"
  B1017  "AGENCY NIBRS FLAG"
  B1018  "AGENCY INACTIVE DATE"
  B1019  "FILLER BLANKS"
  B1020  "N RECORDS PER ORI-INCIDENT NUMBER"
.

VALUE LABELS
  B1001
        "B1" "Batch header 1"
        /
  B1002
        50 "AK"
        01 "AL"
        03 "AR"
        54 "AS"
        02 "AZ"
        04 "CA"
        05 "CO"
        06 "CT"
        52 "CZ"
        08 "DC"
        07 "DE"
        09 "FL"
        10 "GA"
        55 "GM"
        51 "HI"
        14 "IA"
        11 "ID"
        12 "IL"
        13 "IN"
        15 "KS"
        16 "KY"
        17 "LA"
        20 "MA"
        19 "MD"
        18 "ME"
        21 "MI"
        22 "MN"
        24 "MO"
        23 "MS"
        25 "MT"
        26 "NB"
        32 "NC"
        33 "ND"
        28 "NH"
        29 "NJ"
        30 "NM"
        27 "NV"
        31 "NY"
        34 "OH"
        35 "OK"
        36 "OR"
        37 "PA"
        53 "PR"
        38 "RI"
        39 "SC"
        40 "SD"
        41 "TN"
        42 "TX"
        43 "UT"
        62 "VI"
        45 "VA"
        44 "VT"
        46 "WA"
        48 "WI"
        47 "WV"
        49 "WY"
        /
  B1009
        "0" "Possessions"
        "1" "Cities 250,000+"
        "1A" "Cities 1,000,000+"
        "1B" "Cities 500,000-999,999"
        "1C" "Cities 250,000-499,999"
        "2" "Cities 100,000-249,999"
        "3" "Cities 50,000-99,999"
        "4" "Cities 25,000-49,999"
        "5" "Cities 10,000-24,999"
        "6" "Cities 2,500-9,999"
        "7" "Cites < 2,500"
        "8" "Non-MSA Counties"
        "8A" "Non-MSA Counties 100,000+"
        "8B" "Non-MSA Counties 25,000-99,999"
        "8C" "Non-MSA Counties 10,000-24,999"
        "8D" "Non-MSA Counties < 10,000"
        "8E" "Non-MSA State Police"
        "9" "MSA Counties"
        "9A" "MSA Counties 100,000+"
        "9B" "MSA Counties 25,000-99,999"
        "9C" "MSA Counties 10,000-24,999"
        "9D" "MSA Counties < 10,000"
        "9E" "MSA State Police"
        /
  B1010
        0 "Possessions"
        1 "New England"
        2 "Middle Atlantic"
        3 "East North Central"
        4 "West North Central"
        5 "South Atlantic"
        6 "East South Central"
        7 "West South Central"
        8 "Mountain"
        9 "Pacific"
        /
  B1011
        1 "North East"
        2 "North Central"
        3 "South"
        4 "West"
        /
  B1012
        0 "Covered by another agency"
        1 "City"
        2 "County"
        3 "University or college"
        4 "State Police"
        5 "Special Agency"
        /
  B1013
        "Y" "Yes"
        "N" "No"
        /
  B1015
        9999 "Blanked"
        /
  B1017
        " " "Inactive"
        "A" "Active"
        /
.
EXECUTE.
