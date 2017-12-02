*-------------------------------------------------------------------------*
|              SAS DATA DEFINITION STATEMENTS FOR ICPSR 3449              |
|                                                                         |
|             NATIONAL INCIDENT-BASED REPORTING SYSTEM, 2000              |
|                                                                         |
|                  PART 1: BATCH HEADER SEGMENT - B1                      |
|                                                                         |
|                                                                         |
| This SAS setup file contains the following statements:                  |
|                                                                         |
| PROC FORMAT:  Creates user-defined formats. Formats replace original    |
| value codes with value code descriptions. Formats may not be present    |
| for all variables in the data file.                                     |
|                                                                         |
| DATA:  Begins a SAS data step and names an output SAS data set.         |
|                                                                         |
| INFILE:  Specifies the input data file to be read with the input        |
| statement. Users must replace "file-specification" with a complete      |
| statement of the location of the data file.                             |
|                                                                         |
| INPUT:  Assigns the name, type, decimal specification (if any), and     |
| identifies variable beginning and ending column locations.              |
|                                                                         |
| LABEL:  Assigns descriptive labels to variables. Variable labels and    |
| variable names may be identical for certain variables.                  |
|                                                                         |
| FORMAT:  Associates the formats created by the PROC FORMAT step with    |
| the variables named in the INPUT statement. Format statements may not   |
| be present for all variables in the data file.                          |
*-------------------------------------------------------------------------;

* SAS PROC FORMAT;
/*
PROC FORMAT;
   VALUE $V1FT
   "B1" = "Batch header 1";
   VALUE V2FT (MAX=40)
   1 = "AL"
   2 = "AZ"
   3 = "AR"
   4 = "CA"
   5 = "CO"
   6 = "CT"
   7 = "DE"
   8 = "DC"
   9 = "FL"
   10 = "GA"
   11 = "ID"
   12 = "IL"
   13 = "IN"
   14 = "IA"
   15 = "KS"
   16 = "KY"
   17 = "LA"
   18 = "ME"
   19 = "MD"
   20 = "MA"
   21 = "MI"
   22 = "MN"
   23 = "MS"
   24 = "MO"
   25 = "MT"
   26 = "NB"
   27 = "NV"
   28 = "NH"
   29 = "NJ"
   30 = "NM"
   31 = "NY"
   32 = "NC"
   33 = "ND"
   34 = "OH"
   35 = "OK"
   36 = "OR"
   37 = "PA"
   38 = "RI"
   39 = "SC"
   40 = "SD"
   41 = "TN"
   42 = "TX"
   43 = "UT"
   44 = "VT"
   45 = "VA"
   46 = "WA"
   47 = "WV"
   48 = "WI"
   49 = "WY"
   50 = "AK"
   51 = "HI"
   52 = "CZ"
   53 = "PR"
   54 = "AS"
   55 = "GM"
   62 = "VI";
   VALUE $V9FT
   "0" = "Possessions"
   "1" = "Cities 250,000+"
   "1A" = "Cities 1,000,000+"
   "1B" = "Cities 500,000-999,999"
   "1C" = "Cities 250,000-499,999"
   "2" = "Cities 100,000-249,999"
   "3" = "Cities 50,000-99,999"
   "4" = "Cities 25,000-49,999"
   "5" = "Cities 10,000-24,999"
   "6" = "Cities 2,500-9,999"
   "7" = "Cites < 2,500"
   "8" = "Non-MSA Counties"
   "8A" = "Non-MSA Counties 100,000+"
   "8B" = "Non-MSA Counties 25,000-99,999"
   "8C" = "Non-MSA Counties 10,000-24,999"
   "8D" = "Non-MSA Counties < 10,000"
   "8E" = "Non-MSA State Police"
   "9" = "MSA Counties"
   "9A" = "MSA Counties 100,000+"
   "9B" = "MSA Counties 25,000-99,999"
   "9C" = "MSA Counties 10,000-24,999"
   "9D" = "MSA Counties < 10,000"
   "9E" = "MSA State Police";
   VALUE V10FT (MAX=40)
   0 = "Possessions"
   1 = "New England"
   2 = "Middle Atlantic"
   3 = "East North Central"
   4 = "West North Central"
   5 = "South Atlantic"
   6 = "East South Central"
   7 = "West South Central"
   8 = "Mountain"
   9 = "Pacific";
   VALUE V11FT (MAX=40)
   1 = "North East"
   2 = "North Central"
   3 = "South"
   4 = "West";
   VALUE V12FT (MAX=40)
   0 = "Covered by another agency"
   1 = "City"
   2 = "County"
   3 = "University or college"
   4 = "State Police"
   5 = "Special Agency";
   VALUE $V13FT
   "N" = "No"
   "Y" = "Yes";
   VALUE V15FT (MAX=40)
   9999 = "Blanked";
   VALUE $V17FT
   " " = "Inactive"
   "A" = "Active";*/

* SAS DATA, INFILE, INPUT STATEMENTS;

DATA;
INFILE "file-specification" LRECL=135;
INPUT
   B1001 $ 1-2              B1002 3-4                B1003 $ 5-13
   B1004 $ 14-25            B1005 26-33              B1006 34-41
   B1007 $ 42-71            B1008 $ 72-73            B1009 $ 74-75
   B1010 76-76              B1011 77-77              B1012 78-78
   B1013 $ 79-79            B1014 $ 80-88            B1015 89-92
   B1016 $ 93-96            B1017 $ 97-97            B1018 98-105
   B1019 106-132            B1020 133-135;

* SAS LABEL STATEMENT;

LABEL
   B1001 = "SEGMENT LEVEL"
   B1002 = "NUMERIC STATE CODE"
   B1003 = "ORIGINATING AGENCY IDENTIFIER"
   B1004 = "INCIDENT NUMBER"
   B1005 = "DATE ORI WAS ADDED"
   B1006 = "DATE ORI WENT NIBRS"
   B1007 = "CITY NAME"
   B1008 = "STATE ABBREVIATION"
   B1009 = "POPULATION GROUP"
   B1010 = "COUNTRY DIVISION"
   B1011 = "COUNTRY REGION"
   B1012 = "AGENCY INDICATOR"
   B1013 = "CORE CITY"
   B1014 = "COVERED BY ORI"
   B1015 = "FBI FIELD OFFICE"
   B1016 = "JUDICIAL DISTRICT"
   B1017 = "AGENCY NIBRS FLAG"
   B1018 = "AGENCY INACTIVE DATE"
   B1019 = "FILLER BLANKS"
   B1020 = "N RECORDS PER ORI-INCIDENT NUMBER";

* SAS FORMAT STATEMENT;
/*
FORMAT
   B1001 $V1FT.           B1002 V2FT.            B1009 $V9FT.
   B1010 V10FT.           B1011 V11FT.           B1012 V12FT.
   B1013 $V13FT.          B1015 V15FT.           B1017 $V17FT.;*/
