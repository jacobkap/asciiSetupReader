/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 27681
 |           CENSUS OF STATE AND LOCAL LAW ENFORCEMENT AGENCIES
 |                             (CSLLEA), 2008
 |
 |
 | SAS setup sections are provided for the ASCII version of this data
 | collection.  These sections are listed below:
 |
 | PROC FORMAT:  creates user-defined formats for the variables. Formats
 | replace original value codes with value code descriptions. Only
 | variables with user-defined formats are included in this section.
 |
 | DATA:  begins a SAS data step and names an output SAS data set.
 |
 | INFILE:  identifies the input file to be read with the input statement.
 | Users must replace the "data-filename" with a filename specifying the
 | directory on the user's computer system in which the downloaded and
 | unzipped data file is physically located (e.g.,
 | "c:\temp\27681-0001-data.txt").
 |
 | INPUT:  assigns the name, type, decimal specification (if any), and
 | specifies the beginning and ending column locations for each variable
 | in the data file.
 |
 | LABEL:  assigns descriptive labels to all variables. Variable labels
 | and variable names may be identical for some variables.
 |
 | MISSING VALUE RECODES:  sets user-defined numeric missing values to
 | missing as interpreted by the SAS system. Only variables with
 | user-defined missing values are included in this section.
 |
 | If any variables have more than one missing value, they are assigned
 | to the standard missing value of a single period (.) in the statement
 | below. To maintain the original meaning of missing codes, users may want
 | to take advantage of the SAS missing values (the letters A-Z or an
 | underscore preceded by a period).
 |
 | An example of a standard missing value recode:
 |
 |   IF (RELATION = 98 OR RELATION = 99) THEN RELATION = .; 
 |
 | The same example using special missing value recodes:
 |
 |    IF RELATION = 98 THEN RELATION = .A;
 |    IF RELATION = 99 THEN RELATION = .B;
 |
 | FORMAT:  associates the formats created by the PROC FORMAT step with
 | the variables named in the INPUT statement.
 |
 | NOTE:  Users should modify this setup file to suit their specific needs.
 | Sections for PROC FORMAT, FORMAT, and MISSING VALUE RECODES have been
 | commented out (i.e., '/*'). To include these sections in the final SAS
 | setup, users should remove the SAS comment indicators from the desired
 | section(s).
 |
 |------------------------------------------------------------------------*/

* SAS PROC FORMAT;

/*
PROC FORMAT;
  VALUE agcytype  0='(0) Local police department' 1='(1) Sheriff''s office'
                  5='(5) Primary state law enforcement agency'
                  6='(6) Special jurisdiction' 7='(7) Constable/marshal' ;
  VALUE subtypef  1='(1) Public buildings/facilities'
                  2='(2) Natural resources/parks and recreation'
                  3='(3) Transportation systems/facilities'
                  4='(4) Criminal investigations' 5='(5) Special enforcement'
                  888='(888) Not applicable' ;
  VALUE subtyp0f  11='(11) Four-year university' 12='(12) Two-year college'
                  13='(13) Medical school' 14='(14) Public school district'
                  15='(15) Public health/rehabilitative services facility'
                  16='(16) Public housing' 17='(17) State government buildings'
                  19='(19) Other state-owned facilities'
                  21='(21) Fish and wildlife enforcement'
                  22='(22) Parks and recreational facilities'
                  23='(23) Marine law enforcement'
                  24='(24) Environmental law enforcement'
                  25='(25) Forest resources law enforcement'
                  26='(26) Sanitation law enforcement'
                  27='(27) Water resources law enforcement' 28='(28) Levee district'
                  29='(29) Multi-function natural resources enforcement'
                  31='(31) Mass transit/railroad system' 32='(32) Airport'
                  34='(34) Port/harbor facilities'
                  35='(35) Commercial vehicle enforcement'
                  36='(36) Bridges, tunnels, roadways'
                  39='(39) Multi-type transportation facilities'
                  41='(41) County investigations bureau'
                  42='(42) State bureau of investigations'
                  43='(43) Fire marshal/arson investigations'
                  44='(44) Fraud investigations' 45='(45) Tax/revenue enforcement'
                  49='(49) Other, multiple types of investigations'
                  51='(51) Alcohol enforcement' 52='(52) Agricultural enforcement'
                  53='(53) Gaming enforcement' 54='(54) Narcotics enforcement'
                  55='(55) Racing enforcement' 888='(888) Not applicable' ;
  VALUE tribal    0='(0) Not a tribal agency' 1='(1) Yes, a tribal agency' ;
  VALUE q1a1ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1a2ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1a3ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1a4ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1a5ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1a6ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1a7ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1b1ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1b2ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1b3ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1b4ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1b5ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1b6ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1c1ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1c2ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1c3ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1c4ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1c5ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1c6ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1d1ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1d2ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1d3ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1d4ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1d5ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1d6ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1e1ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1e2ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1e3ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1e4ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1e5ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1e6ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1e7ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1e8ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1f1ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1f2ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1f3ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1f4ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1f5ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1f6ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1g1ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1g2ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1g3ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1g4ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1g5ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1g6ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1g7ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1h1ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1h2ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1h3ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1h4ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1h5ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1h6ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1h7ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q1h8ffff  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE q2a       -9='(-9) Blank' ;
  VALUE q2b       -9='(-9) Blank' ;
  VALUE q2c       -9='(-9) Blank' ;
  VALUE q3ffffff  -9='(-9) Blank' ;
  VALUE q3est     -9='(-9) Blank' -2='(-2) Don''t know' 1='(1) Yes' 2='(2) No' ;
  VALUE q5a       -9='(-9) Blank' ;
  VALUE q5b       -9='(-9) Blank' ;
  VALUE q5c       -9='(-9) Blank' ;
  VALUE q6a       -9='(-9) Blank' ;
  VALUE q6b       -9='(-9) Blank' ;
  VALUE q6c       -9='(-9) Blank' ;
  VALUE q6d       -9='(-9) Blank' ;
  VALUE q6e       -9='(-9) Blank' ;
  VALUE q6f       -9='(-9) Blank' ;
  VALUE q6g       -9='(-9) Blank' ;
  VALUE q6h       -9='(-9) Blank' ;
  VALUE q6i       -9='(-9) Blank' ;
  VALUE q6_tot    -9='(-9) Blank' ;
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA;
INFILE "data-filename" LRECL=721;
INPUT
       CSLLEA08_ID 1-8         AGCYTYPE 9-12
        SUBTYPE1 13-20          SUBTYPE2 21-28          TRIBAL 29
        Q1A1 30-31              Q1A2 32-33              Q1A3 34-35
        Q1A4 36-37              Q1A5 38-39              Q1A6 40-41
        Q1A7 42-43              Q1B1 44-45              Q1B2 46-47
        Q1B3 48-49              Q1B4 50-51              Q1B5 52-53
        Q1B6 54-55              Q1C1 56-57              Q1C2 58-59
        Q1C3 60-61              Q1C4 62-63              Q1C5 64-65
        Q1C6 66-67              Q1D1 68-69              Q1D2 70-71
        Q1D3 72-73              Q1D4 74-75              Q1D5 76-77
        Q1D6 78-79              Q1E1 80-81              Q1E2 82-83
        Q1E3 84-85              Q1E4 86-87              Q1E5 88-89
        Q1E6 90-91              Q1E7 92-93              Q1E8 94-95
        Q1F1 96-97              Q1F2 98-99              Q1F3 100-101
        Q1F4 102-103            Q1F5 104-105            Q1F6 106-107
        Q1G1 108-109            Q1G2 110-111            Q1G3 112-113
        Q1G4 114-115            Q1G5 116-117            Q1G6 118-119
        Q1G7 120-121            Q1GOTH $122-221         Q1H1 222-223
        Q1H2 224-225            Q1H3 226-227            Q1H4 228-229
        Q1H5 230-231            Q1H6 232-233            Q1H7 234-235
        Q1H8 236-237            Q1HOTH $238-337         Q2A 338-340
        Q2B 341-343             Q2C 344-346             Q3 347-359
        Q3EST 360-361           FTSWORN 362-366         FTCIV 367-371
        PTSWORN 372-374         PTCIV 375-378           Q5A 379-386 .2
        Q5B 387-390             Q5C 391-393             Q6A 394-398
        Q6B 399-402             Q6C 403-406             Q6D 407-410
        Q6E 411-414             Q6F 415-417             Q6G 418-420
        Q6H 421-423             Q6I 424-427             Q6_TOT 428-432
        AGCYNAME $433-504       ADDR1 $505-543          ADDR2 $544-618
        CITY $619-644           STATE $645-646          ZIP $647-668
        STATENAME $669-688      COUNTY $689-713         FIPS 714-721
        ;


* SAS LABEL STATEMENT;

LABEL
   CSLLEA08_ID= 'AGENCY IDENTIFIER'
   AGCYTYPE= 'TYPE OF AGENCY'
   SUBTYPE1= 'SPECIAL JURISDICTION - GENERAL TYPE'
   SUBTYPE2= 'SPECIAL JURISDICTION - SPECIFIC TYPE'
   TRIBAL  = 'TRIBAL AGENCY INDICATOR'
   Q1A1    = 'Q1A1-FIRST RESPONSE TO CRIMINAL INCIDENTS'
   Q1A2    = 'Q1A2-ROUTINE PATROL SERVICES'
   Q1A3    = 'Q1A3-RESPOND TO CITIZEN REQUEST FOR SERVICE'
   Q1A4    = 'Q1A4-ARREST OF CRIMINAL SUSPECTS'
   Q1A5    = 'Q1A5-SPECIAL EVENTS/CROWD CONTROL'
   Q1A6    = 'Q1A6-DISPATCHING CALLS FOR SERVICE'
   Q1A7    = 'Q1A7-NONE OF THE ABOVE-PATROL & RESPONSE'
   Q1B1    = 'Q1B1-HOMICIDE INVESTIGATIONS'
   Q1B2    = 'Q1B2-ARSON INVESTIGATIONS'
   Q1B3    = 'Q1B3-CYBERCRIME INVESTIGATIONS'
   Q1B4    = 'Q1B4-OTHER TYPES OF CRIME INVESTIGATIONS'
   Q1B5    = 'Q1B5-FORENSIC PROCESSING OF CRIME SCENES'
   Q1B6    = 'Q1B6-NONE OF THE ABOVE-CRIMINAL INVESTIGATION'
   Q1C1    = 'Q1C1-TRAFFIC DIRECTION/CONTROL'
   Q1C2    = 'Q1C2-ACCIDENT INVESTIGATION'
   Q1C3    = 'Q1C3-PARKING ENFORCEMENT AND CONTROL'
   Q1C4    = 'Q1C4-COMMERCIAL VEHICLE ENFORCEMENT'
   Q1C5    = 'Q1C5-TRAFFIC LAW ENFORCEMENT'
   Q1C6    = 'Q1C6-NONE OF THE ABOVE-TRAFFIC & VEHICLE'
   Q1D1    = 'Q1D1-OPERATING A JAIL'
   Q1D2    = 'Q1D2-BOOKING AND RELEASE OF INMATES'
   Q1D3    = 'Q1D3-OPERATING TEMP HOLDING CELL-OVERNIGHT'
   Q1D4    = 'Q1D4-OPERATING TEMP HOLDING CELL-NO OVRERNIGHT'
   Q1D5    = 'Q1D5-INMATE TRANSPORT'
   Q1D6    = 'Q1D6-NONE OF THE ABOVE-DETENTION RELATED'
   Q1E1    = 'Q1E1-PROVIDING COURT SECURITY'
   Q1E2    = 'Q1E2-SERVING PROCESS'
   Q1E3    = 'Q1E3-EXECUTING ARREST WARRANTS'
   Q1E4    = 'Q1E4-SERVING EVICTION NOTICES'
   Q1E5    = 'Q1E5-ENFORCING PROTECTION ORDERS'
   Q1E6    = 'Q1E6-ENFORCING CHILD SUPPORT ORDERS'
   Q1E7    = 'Q1E7-APPREHENSION OF FUGITIVES'
   Q1E8    = 'Q1E8-NONE OF THE ABOVE-COURT RELATED'
   Q1F1    = 'Q1F1-ANIMAL CONTROL'
   Q1F2    = 'Q1F2-SCHOOL CROSSING SERVICES'
   Q1F3    = 'Q1F3-EMERGENCY MEDICAL SERVICES'
   Q1F4    = 'Q1F4-FIRE SERVICES'
   Q1F5    = 'Q1F5-EMERGENCY MANAGEMENT'
   Q1F6    = 'Q1F6-NONE OF THE ABOVE-PUBLIC SAFETY'
   Q1G1    = 'Q1G1-DRUG TRAFFICKING'
   Q1G2    = 'Q1G2-GANGS'
   Q1G3    = 'Q1G3-HUMAN TRAFFICKING'
   Q1G4    = 'Q1G4-VIOLENT CRIME'
   Q1G5    = 'Q1G5-ANTI-TERRORISM'
   Q1G6    = 'Q1G6-OTHER-TASK FORCE PARTICIPATION'
   Q1G7    = 'Q1G7-NONE OF THE ABOVE-TASK FORCE PARTICIPATION'
   Q1GOTH  = 'Q1GOTH-TASK FORCE PARTICIPATION-OTHER-SPECIFY'
   Q1H1    = 'Q1H1-BOMB/EXPLOSIVES DISPOSAL'
   Q1H2    = 'Q1H2-SEARCH AND RESCUE'
   Q1H3    = 'Q1H3-TACTICAL OPERATIONS'
   Q1H4    = 'Q1H4-UNDERWATER RECOVERY'
   Q1H5    = 'Q1H5-OPERATING A BASIC TRAINING ACADEMY'
   Q1H6    = 'Q1H6-OPERATING A FORENSIC CRIME LAB'
   Q1H7    = 'Q1H7-OTHER-SPECIALIZED FUNCTIONS'
   Q1H8    = 'Q1H8-NONE OF THE ABOVE'
   Q1HOTH  = 'Q1HOTH-SPECIALIZED FUNCTIONS-OTHER-SPECIFY'
   Q2A     = 'Q2A-DISTRICT/PRECINCT/DIVISION STATIONS'
   Q2B     = 'Q2B-FIXED-SITE NEIGHBORHOOD/COMMUNITY SUBSTATIONS'
   Q2C     = 'Q2C-MOBILE NEIGHBORHOOD/COMMUNITY SUBSTATIONS'
   Q3      = 'Q3-TOTAL OPERATING BUDGET'
   Q3EST   = 'Q3-EST-BUDGET AN ESTIMATE'
   FTSWORN = 'Q4A-FT-SWORN PERSONNEL W/ FULL ARREST POWERS'
   FTCIV   = 'FULL-TIME CIVILIAN EMPLOYEES'
   PTSWORN = 'Q4A-PT-SWORN PERSONNEL W/ FULL ARREST POWERS'
   PTCIV   = 'PART-TIME CIVILIAN EMPLOYEES'
   Q5A     = 'Q5A-ASSIGNED DUTIES INCLUDE CITIZEN CALLS FOR SERVICE'
   Q5B     = 'Q5B-COMMUNITY POLICING OFFICERS'
   Q5C     = 'Q5C-SCHOOL RESOURCE OFFICERS/SCHOOL SAFETY'
   Q6A     = 'Q6A-LAW ENFORCEMENT DUTIES'
   Q6B     = 'Q6B-JAIL-RELATED DUTIES'
   Q6C     = 'Q6C-COURT-RELATED DUTIES'
   Q6D     = 'Q6D-OTHER DUTY AREA'
   Q6E     = 'Q6E-LAW ENFORCEMENT, JAIL AND COURT DUTIES'
   Q6F     = 'Q6F-LAW ENFORCEMENT AND JAIL-RELATED DUTIES'
   Q6G     = 'Q6G-LAW ENFORCEMENT AND COURT-RELATED DUTIES'
   Q6H     = 'Q6H-JAIL AND COURT-RELATED DUTIES'
   Q6I     = 'Q6I-OTHER SPLIT-DUTY COMBINATION'
   Q6_TOT  = 'Q6J-TOTAL NUMBER OF FULL-TIME SWORN PERSONNEL'
   AGCYNAME= 'NAME OF AGENCY'
   ADDR1   = 'ADDRESS OF AGENCY - LINE 1'
   ADDR2   = 'ADDRESS OF AGENCY - LINE 2'
   CITY    = 'CITY'
   STATE   = 'STATE CODE'
   ZIP     = 'ZIP'
   STATENAME= 'NAME OF STATE'
   COUNTY  = 'COUNTY NAME'
   FIPS    = 'FIPS CODE'
        ;


* USER-DEFINED MISSING VALUES RECODE TO SAS SYSMIS;

/*
   IF (SUBTYPE1 = 888) THEN SUBTYPE1 = .;
   IF (SUBTYPE2 = 888) THEN SUBTYPE2 = .;
   IF (Q1A1 = -9) THEN Q1A1 = .;
   IF (Q1A2 = -9) THEN Q1A2 = .;
   IF (Q1A3 = -9) THEN Q1A3 = .;
   IF (Q1A4 = -9) THEN Q1A4 = .;
   IF (Q1A5 = -9) THEN Q1A5 = .;
   IF (Q1A6 = -9) THEN Q1A6 = .;
   IF (Q1A7 = -9) THEN Q1A7 = .;
   IF (Q1B1 = -9) THEN Q1B1 = .;
   IF (Q1B2 = -9) THEN Q1B2 = .;
   IF (Q1B3 = -9) THEN Q1B3 = .;
   IF (Q1B4 = -9) THEN Q1B4 = .;
   IF (Q1B5 = -9) THEN Q1B5 = .;
   IF (Q1B6 = -9) THEN Q1B6 = .;
   IF (Q1C1 = -9) THEN Q1C1 = .;
   IF (Q1C2 = -9) THEN Q1C2 = .;
   IF (Q1C3 = -9) THEN Q1C3 = .;
   IF (Q1C4 = -9) THEN Q1C4 = .;
   IF (Q1C5 = -9) THEN Q1C5 = .;
   IF (Q1C6 = -9) THEN Q1C6 = .;
   IF (Q1D1 = -9) THEN Q1D1 = .;
   IF (Q1D2 = -9) THEN Q1D2 = .;
   IF (Q1D3 = -9) THEN Q1D3 = .;
   IF (Q1D4 = -9) THEN Q1D4 = .;
   IF (Q1D5 = -9) THEN Q1D5 = .;
   IF (Q1D6 = -9) THEN Q1D6 = .;
   IF (Q1E1 = -9) THEN Q1E1 = .;
   IF (Q1E2 = -9) THEN Q1E2 = .;
   IF (Q1E3 = -9) THEN Q1E3 = .;
   IF (Q1E4 = -9) THEN Q1E4 = .;
   IF (Q1E5 = -9) THEN Q1E5 = .;
   IF (Q1E6 = -9) THEN Q1E6 = .;
   IF (Q1E7 = -9) THEN Q1E7 = .;
   IF (Q1E8 = -9) THEN Q1E8 = .;
   IF (Q1F1 = -9) THEN Q1F1 = .;
   IF (Q1F2 = -9) THEN Q1F2 = .;
   IF (Q1F3 = -9) THEN Q1F3 = .;
   IF (Q1F4 = -9) THEN Q1F4 = .;
   IF (Q1F5 = -9) THEN Q1F5 = .;
   IF (Q1F6 = -9) THEN Q1F6 = .;
   IF (Q1G1 = -9) THEN Q1G1 = .;
   IF (Q1G2 = -9) THEN Q1G2 = .;
   IF (Q1G3 = -9) THEN Q1G3 = .;
   IF (Q1G4 = -9) THEN Q1G4 = .;
   IF (Q1G5 = -9) THEN Q1G5 = .;
   IF (Q1G6 = -9) THEN Q1G6 = .;
   IF (Q1G7 = -9) THEN Q1G7 = .;
   IF (Q1H1 = -9) THEN Q1H1 = .;
   IF (Q1H2 = -9) THEN Q1H2 = .;
   IF (Q1H3 = -9) THEN Q1H3 = .;
   IF (Q1H4 = -9) THEN Q1H4 = .;
   IF (Q1H5 = -9) THEN Q1H5 = .;
   IF (Q1H6 = -9) THEN Q1H6 = .;
   IF (Q1H7 = -9) THEN Q1H7 = .;
   IF (Q1H8 = -9) THEN Q1H8 = .;
   IF (Q2A = -9) THEN Q2A = .;
   IF (Q2B = -9) THEN Q2B = .;
   IF (Q2C = -9) THEN Q2C = .;
   IF (Q3 = -9) THEN Q3 = .;
   IF (Q3EST = -9) THEN Q3EST = .;
   IF (Q5A = -9.00) THEN Q5A = .;
   IF (Q5B = -9) THEN Q5B = .;
   IF (Q5C = -9) THEN Q5C = .;
   IF (Q6A = -9) THEN Q6A = .;
   IF (Q6B = -9) THEN Q6B = .;
   IF (Q6C = -9) THEN Q6C = .;
   IF (Q6D = -9) THEN Q6D = .;
   IF (Q6E = -9) THEN Q6E = .;
   IF (Q6F = -9) THEN Q6F = .;
   IF (Q6G = -9) THEN Q6G = .;
   IF (Q6H = -9) THEN Q6H = .;
   IF (Q6I = -9) THEN Q6I = .;
   IF (Q6_TOT = -9) THEN Q6_TOT = .;
*/


* SAS FORMAT STATEMENT;

/*
  FORMAT AGCYTYPE agcytype. SUBTYPE1 subtypef. SUBTYPE2 subtyp0f.
         TRIBAL tribal. Q1A1 q1a1ffff. Q1A2 q1a2ffff.
         Q1A3 q1a3ffff. Q1A4 q1a4ffff. Q1A5 q1a5ffff.
         Q1A6 q1a6ffff. Q1A7 q1a7ffff. Q1B1 q1b1ffff.
         Q1B2 q1b2ffff. Q1B3 q1b3ffff. Q1B4 q1b4ffff.
         Q1B5 q1b5ffff. Q1B6 q1b6ffff. Q1C1 q1c1ffff.
         Q1C2 q1c2ffff. Q1C3 q1c3ffff. Q1C4 q1c4ffff.
         Q1C5 q1c5ffff. Q1C6 q1c6ffff. Q1D1 q1d1ffff.
         Q1D2 q1d2ffff. Q1D3 q1d3ffff. Q1D4 q1d4ffff.
         Q1D5 q1d5ffff. Q1D6 q1d6ffff. Q1E1 q1e1ffff.
         Q1E2 q1e2ffff. Q1E3 q1e3ffff. Q1E4 q1e4ffff.
         Q1E5 q1e5ffff. Q1E6 q1e6ffff. Q1E7 q1e7ffff.
         Q1E8 q1e8ffff. Q1F1 q1f1ffff. Q1F2 q1f2ffff.
         Q1F3 q1f3ffff. Q1F4 q1f4ffff. Q1F5 q1f5ffff.
         Q1F6 q1f6ffff. Q1G1 q1g1ffff. Q1G2 q1g2ffff.
         Q1G3 q1g3ffff. Q1G4 q1g4ffff. Q1G5 q1g5ffff.
         Q1G6 q1g6ffff. Q1G7 q1g7ffff. Q1H1 q1h1ffff.
         Q1H2 q1h2ffff. Q1H3 q1h3ffff. Q1H4 q1h4ffff.
         Q1H5 q1h5ffff. Q1H6 q1h6ffff. Q1H7 q1h7ffff.
         Q1H8 q1h8ffff. Q2A q2a. Q2B q2b.
         Q2C q2c. Q3 q3ffffff. Q3EST q3est.
         Q5A q5a. Q5B q5b. Q5C q5c.
         Q6A q6a. Q6B q6b. Q6C q6c.
         Q6D q6d. Q6E q6e. Q6F q6f.
         Q6G q6g. Q6H q6h. Q6I q6i.
         Q6_TOT q6_tot.  ;
*/

RUN ;
