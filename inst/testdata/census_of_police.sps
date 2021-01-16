*-------------------------------------------------------------------------*
*                                                                          
*                     SPSS SETUP FILE FOR ICPSR 27681
*            CENSUS OF STATE AND LOCAL LAW ENFORCEMENT AGENCIES
*                              (CSLLEA), 2008
* 
*
*  SPSS setup sections are provided for the ASCII version of this data
*  collection.  These sections are listed below:
*
*  DATA LIST:  assigns the name, type, decimal specification (if any),
*  and specifies the beginning and ending column locations for each
*  variable in the data file. Users must replace the "data-filename"
*  in the DATA LIST statement with a filename specifying the directory
*  on the user's computer system in which the downloaded and unzipped
*  data file is physically located (e.g., "c:\temp\27681-0001-data.txt").
*
*  VARIABLE LABELS:  assigns descriptive labels to all variables.
*  Labels and variable names may be identical for some data files.
*
*  MISSING VALUES: declares user-defined missing values. Not all
*  variables in this data set necessarily have user-defined missing
*  values. These values can be treated specially in data transformations,
*  statistical calculations, and case selection.
*
*  VALUE LABELS: assigns descriptive labels to codes found in the data
*  file.  Not all codes necessarily have assigned value labels.
*
*  NOTE:  Users should modify this setup file to suit their specific 
*  needs. The MISSING VALUES section has been commented out (i.e., '*').
*  To include the MISSING VALUES section in the final SPSS setup, remove 
*  the comment indicators from the desired section.
*
*  CREATING A PERMANENT SPSS DATA FILE: If users wish to create and save
*  an SPSS data file for further analysis using SPSS for Windows, the
*  necessary "SAVE OUTFILE" command is provided in the last line of
*  this file.  To activate the command, users must delete the leading
*  asterisk (*) and replace "spss-filename" with a filename specifying
*  the location on the user's computer system to which the new data file
*  will be saved (e.g., SAVE OUTFILE="c:\spsswin\data\da27681-0001.sav").
*
*-------------------------------------------------------------------------.

* SPSS FILE HANDLE AND DATA LIST COMMANDS.

FILE HANDLE DATA / NAME="data-filename" LRECL=721.
DATA LIST FILE=DATA /
         CSLLEA08_ID 1-8           AGCYTYPE 9-12
          SUBTYPE1 13-20          SUBTYPE2 21-28               TRIBAL 29
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
              Q1F1 96-97              Q1F2 98-99            Q1F3 100-101
            Q1F4 102-103            Q1F5 104-105            Q1F6 106-107
            Q1G1 108-109            Q1G2 110-111            Q1G3 112-113
            Q1G4 114-115            Q1G5 116-117            Q1G6 118-119
            Q1G7 120-121      Q1GOTH 122-221 (A)            Q1H1 222-223
            Q1H2 224-225            Q1H3 226-227            Q1H4 228-229
            Q1H5 230-231            Q1H6 232-233            Q1H7 234-235
            Q1H8 236-237      Q1HOTH 238-337 (A)             Q2A 338-340
             Q2B 341-343             Q2C 344-346              Q3 347-359
           Q3EST 360-361         FTSWORN 362-366           FTCIV 367-371
         PTSWORN 372-374           PTCIV 375-378         Q5A 379-386 (2)
             Q5B 387-390             Q5C 391-393             Q6A 394-398
             Q6B 399-402             Q6C 403-406             Q6D 407-410
             Q6E 411-414             Q6F 415-417             Q6G 418-420
             Q6H 421-423             Q6I 424-427          Q6_TOT 428-432
    AGCYNAME 433-504 (A)       ADDR1 505-543 (A)       ADDR2 544-618 (A)
        CITY 619-644 (A)       STATE 645-646 (A)         ZIP 647-668 (A)
   STATENAME 669-688 (A)      COUNTY 689-713 (A)            FIPS 714-721

   .

* SPSS VARIABLE LABELS COMMAND.

VARIABLE LABELS
   CSLLEA08_ID 'AGENCY IDENTIFIER' /
   AGCYTYPE  'TYPE OF AGENCY' /
   SUBTYPE1  'SPECIAL JURISDICTION - GENERAL TYPE' /
   SUBTYPE2  'SPECIAL JURISDICTION - SPECIFIC TYPE' /
   TRIBAL    'TRIBAL AGENCY INDICATOR' /
   Q1A1      'Q1A1-FIRST RESPONSE TO CRIMINAL INCIDENTS' /
   Q1A2      'Q1A2-ROUTINE PATROL SERVICES' /
   Q1A3      'Q1A3-RESPOND TO CITIZEN REQUEST FOR SERVICE' /
   Q1A4      'Q1A4-ARREST OF CRIMINAL SUSPECTS' /
   Q1A5      'Q1A5-SPECIAL EVENTS/CROWD CONTROL' /
   Q1A6      'Q1A6-DISPATCHING CALLS FOR SERVICE' /
   Q1A7      'Q1A7-NONE OF THE ABOVE-PATROL & RESPONSE' /
   Q1B1      'Q1B1-HOMICIDE INVESTIGATIONS' /
   Q1B2      'Q1B2-ARSON INVESTIGATIONS' /
   Q1B3      'Q1B3-CYBERCRIME INVESTIGATIONS' /
   Q1B4      'Q1B4-OTHER TYPES OF CRIME INVESTIGATIONS' /
   Q1B5      'Q1B5-FORENSIC PROCESSING OF CRIME SCENES' /
   Q1B6      'Q1B6-NONE OF THE ABOVE-CRIMINAL INVESTIGATION' /
   Q1C1      'Q1C1-TRAFFIC DIRECTION/CONTROL' /
   Q1C2      'Q1C2-ACCIDENT INVESTIGATION' /
   Q1C3      'Q1C3-PARKING ENFORCEMENT AND CONTROL' /
   Q1C4      'Q1C4-COMMERCIAL VEHICLE ENFORCEMENT' /
   Q1C5      'Q1C5-TRAFFIC LAW ENFORCEMENT' /
   Q1C6      'Q1C6-NONE OF THE ABOVE-TRAFFIC & VEHICLE' /
   Q1D1      'Q1D1-OPERATING A JAIL' /
   Q1D2      'Q1D2-BOOKING AND RELEASE OF INMATES' /
   Q1D3      'Q1D3-OPERATING TEMP HOLDING CELL-OVERNIGHT' /
   Q1D4      'Q1D4-OPERATING TEMP HOLDING CELL-NO OVRERNIGHT' /
   Q1D5      'Q1D5-INMATE TRANSPORT' /
   Q1D6      'Q1D6-NONE OF THE ABOVE-DETENTION RELATED' /
   Q1E1      'Q1E1-PROVIDING COURT SECURITY' /
   Q1E2      'Q1E2-SERVING PROCESS' /
   Q1E3      'Q1E3-EXECUTING ARREST WARRANTS' /
   Q1E4      'Q1E4-SERVING EVICTION NOTICES' /
   Q1E5      'Q1E5-ENFORCING PROTECTION ORDERS' /
   Q1E6      'Q1E6-ENFORCING CHILD SUPPORT ORDERS' /
   Q1E7      'Q1E7-APPREHENSION OF FUGITIVES' /
   Q1E8      'Q1E8-NONE OF THE ABOVE-COURT RELATED' /
   Q1F1      'Q1F1-ANIMAL CONTROL' /
   Q1F2      'Q1F2-SCHOOL CROSSING SERVICES' /
   Q1F3      'Q1F3-EMERGENCY MEDICAL SERVICES' /
   Q1F4      'Q1F4-FIRE SERVICES' /
   Q1F5      'Q1F5-EMERGENCY MANAGEMENT' /
   Q1F6      'Q1F6-NONE OF THE ABOVE-PUBLIC SAFETY' /
   Q1G1      'Q1G1-DRUG TRAFFICKING' /
   Q1G2      'Q1G2-GANGS' /
   Q1G3      'Q1G3-HUMAN TRAFFICKING' /
   Q1G4      'Q1G4-VIOLENT CRIME' /
   Q1G5      'Q1G5-ANTI-TERRORISM' /
   Q1G6      'Q1G6-OTHER-TASK FORCE PARTICIPATION' /
   Q1G7      'Q1G7-NONE OF THE ABOVE-TASK FORCE PARTICIPATION' /
   Q1GOTH    'Q1GOTH-TASK FORCE PARTICIPATION-OTHER-SPECIFY' /
   Q1H1      'Q1H1-BOMB/EXPLOSIVES DISPOSAL' /
   Q1H2      'Q1H2-SEARCH AND RESCUE' /
   Q1H3      'Q1H3-TACTICAL OPERATIONS' /
   Q1H4      'Q1H4-UNDERWATER RECOVERY' /
   Q1H5      'Q1H5-OPERATING A BASIC TRAINING ACADEMY' /
   Q1H6      'Q1H6-OPERATING A FORENSIC CRIME LAB' /
   Q1H7      'Q1H7-OTHER-SPECIALIZED FUNCTIONS' /
   Q1H8      'Q1H8-NONE OF THE ABOVE' /
   Q1HOTH    'Q1HOTH-SPECIALIZED FUNCTIONS-OTHER-SPECIFY' /
   Q2A       'Q2A-DISTRICT/PRECINCT/DIVISION STATIONS' /
   Q2B       'Q2B-FIXED-SITE NEIGHBORHOOD/COMMUNITY SUBSTATIONS' /
   Q2C       'Q2C-MOBILE NEIGHBORHOOD/COMMUNITY SUBSTATIONS' /
   Q3        'Q3-TOTAL OPERATING BUDGET' /
   Q3EST     'Q3-EST-BUDGET AN ESTIMATE' /
   FTSWORN   'Q4A-FT-SWORN PERSONNEL W/ FULL ARREST POWERS' /
   FTCIV     'FULL-TIME CIVILIAN EMPLOYEES' /
   PTSWORN   'Q4A-PT-SWORN PERSONNEL W/ FULL ARREST POWERS' /
   PTCIV     'PART-TIME CIVILIAN EMPLOYEES' /
   Q5A       'Q5A-ASSIGNED DUTIES INCLUDE CITIZEN CALLS FOR SERVICE' /
   Q5B       'Q5B-COMMUNITY POLICING OFFICERS' /
   Q5C       'Q5C-SCHOOL RESOURCE OFFICERS/SCHOOL SAFETY' /
   Q6A       'Q6A-LAW ENFORCEMENT DUTIES' /
   Q6B       'Q6B-JAIL-RELATED DUTIES' /
   Q6C       'Q6C-COURT-RELATED DUTIES' /
   Q6D       'Q6D-OTHER DUTY AREA' /
   Q6E       'Q6E-LAW ENFORCEMENT, JAIL AND COURT DUTIES' /
   Q6F       'Q6F-LAW ENFORCEMENT AND JAIL-RELATED DUTIES' /
   Q6G       'Q6G-LAW ENFORCEMENT AND COURT-RELATED DUTIES' /
   Q6H       'Q6H-JAIL AND COURT-RELATED DUTIES' /
   Q6I       'Q6I-OTHER SPLIT-DUTY COMBINATION' /
   Q6_TOT    'Q6J-TOTAL NUMBER OF FULL-TIME SWORN PERSONNEL' /
   AGCYNAME  'NAME OF AGENCY' /
   ADDR1     'ADDRESS OF AGENCY - LINE 1' /
   ADDR2     'ADDRESS OF AGENCY - LINE 2' /
   CITY      'CITY' /
   STATE     'STATE CODE' /
   ZIP       'ZIP' /
   STATENAME 'NAME OF STATE' /
   COUNTY    'COUNTY NAME' /
   FIPS      'FIPS CODE' /
   .


* SPSS VALUE LABELS COMMAND.

VALUE LABELS
   AGCYTYPE  0 'Local police department' 1 'Sheriff''s office'
             5 'Primary state law enforcement agency'
             6 'Special jurisdiction' 7 'Constable/marshal' /
   SUBTYPE1  1 'Public buildings/facilities'
             2 'Natural resources/parks and recreation'
             3 'Transportation systems/facilities'
             4 'Criminal investigations' 5 'Special enforcement'
             888 'Not applicable' /
   SUBTYPE2  11 'Four-year university' 12 'Two-year college'
             13 'Medical school' 14 'Public school district'
             15 'Public health/rehabilitative services facility'
             16 'Public housing' 17 'State government buildings'
             19 'Other state-owned facilities'
             21 'Fish and wildlife enforcement'
             22 'Parks and recreational facilities'
             23 'Marine law enforcement' 24 'Environmental law enforcement'
             25 'Forest resources law enforcement'
             26 'Sanitation law enforcement'
             27 'Water resources law enforcement' 28 'Levee district'
             29 'Multi-function natural resources enforcement'
             31 'Mass transit/railroad system' 32 'Airport'
             34 'Port/harbor facilities' 35 'Commercial vehicle enforcement'
             36 'Bridges, tunnels, roadways'
             39 'Multi-type transportation facilities'
             41 'County investigations bureau'
             42 'State bureau of investigations'
             43 'Fire marshal/arson investigations' 44 'Fraud investigations'
             45 'Tax/revenue enforcement'
             49 'Other, multiple types of investigations'
             51 'Alcohol enforcement' 52 'Agricultural enforcement'
             53 'Gaming enforcement' 54 'Narcotics enforcement'
             55 'Racing enforcement' 888 'Not applicable' /
   TRIBAL    0 'Not a tribal agency' 1 'Yes, a tribal agency' /
   Q1A1      -9 'Blank' 1 'Yes' 2 'No' /
   Q1A2      -9 'Blank' 1 'Yes' 2 'No' /
   Q1A3      -9 'Blank' 1 'Yes' 2 'No' /
   Q1A4      -9 'Blank' 1 'Yes' 2 'No' /
   Q1A5      -9 'Blank' 1 'Yes' 2 'No' /
   Q1A6      -9 'Blank' 1 'Yes' 2 'No' /
   Q1A7      -9 'Blank' 1 'Yes' 2 'No' /
   Q1B1      -9 'Blank' 1 'Yes' 2 'No' /
   Q1B2      -9 'Blank' 1 'Yes' 2 'No' /
   Q1B3      -9 'Blank' 1 'Yes' 2 'No' /
   Q1B4      -9 'Blank' 1 'Yes' 2 'No' /
   Q1B5      -9 'Blank' 1 'Yes' 2 'No' /
   Q1B6      -9 'Blank' 1 'Yes' 2 'No' /
   Q1C1      -9 'Blank' 1 'Yes' 2 'No' /
   Q1C2      -9 'Blank' 1 'Yes' 2 'No' /
   Q1C3      -9 'Blank' 1 'Yes' 2 'No' /
   Q1C4      -9 'Blank' 1 'Yes' 2 'No' /
   Q1C5      -9 'Blank' 1 'Yes' 2 'No' /
   Q1C6      -9 'Blank' 1 'Yes' 2 'No' /
   Q1D1      -9 'Blank' 1 'Yes' 2 'No' /
   Q1D2      -9 'Blank' 1 'Yes' 2 'No' /
   Q1D3      -9 'Blank' 1 'Yes' 2 'No' /
   Q1D4      -9 'Blank' 1 'Yes' 2 'No' /
   Q1D5      -9 'Blank' 1 'Yes' 2 'No' /
   Q1D6      -9 'Blank' 1 'Yes' 2 'No' /
   Q1E1      -9 'Blank' 1 'Yes' 2 'No' /
   Q1E2      -9 'Blank' 1 'Yes' 2 'No' /
   Q1E3      -9 'Blank' 1 'Yes' 2 'No' /
   Q1E4      -9 'Blank' 1 'Yes' 2 'No' /
   Q1E5      -9 'Blank' 1 'Yes' 2 'No' /
   Q1E6      -9 'Blank' 1 'Yes' 2 'No' /
   Q1E7      -9 'Blank' 1 'Yes' 2 'No' /
   Q1E8      -9 'Blank' 1 'Yes' 2 'No' /
   Q1F1      -9 'Blank' 1 'Yes' 2 'No' /
   Q1F2      -9 'Blank' 1 'Yes' 2 'No' /
   Q1F3      -9 'Blank' 1 'Yes' 2 'No' /
   Q1F4      -9 'Blank' 1 'Yes' 2 'No' /
   Q1F5      -9 'Blank' 1 'Yes' 2 'No' /
   Q1F6      -9 'Blank' 1 'Yes' 2 'No' /
   Q1G1      -9 'Blank' 1 'Yes' 2 'No' /
   Q1G2      -9 'Blank' 1 'Yes' 2 'No' /
   Q1G3      -9 'Blank' 1 'Yes' 2 'No' /
   Q1G4      -9 'Blank' 1 'Yes' 2 'No' /
   Q1G5      -9 'Blank' 1 'Yes' 2 'No' /
   Q1G6      -9 'Blank' 1 'Yes' 2 'No' /
   Q1G7      -9 'Blank' 1 'Yes' 2 'No' /
   Q1H1      -9 'Blank' 1 'Yes' 2 'No' /
   Q1H2      -9 'Blank' 1 'Yes' 2 'No' /
   Q1H3      -9 'Blank' 1 'Yes' 2 'No' /
   Q1H4      -9 'Blank' 1 'Yes' 2 'No' /
   Q1H5      -9 'Blank' 1 'Yes' 2 'No' /
   Q1H6      -9 'Blank' 1 'Yes' 2 'No' /
   Q1H7      -9 'Blank' 1 'Yes' 2 'No' /
   Q1H8      -9 'Blank' 1 'Yes' 2 'No' /
   Q2A       -9 'Blank' /
   Q2B       -9 'Blank' /
   Q2C       -9 'Blank' /
   Q3        -9 'Blank' /
   Q3EST     -9 'Blank' -2 'Don''t know' 1 'Yes' 2 'No' /
   Q5A       -9 'Blank' /
   Q5B       -9 'Blank' /
   Q5C       -9 'Blank' /
   Q6A       -9 'Blank' /
   Q6B       -9 'Blank' /
   Q6C       -9 'Blank' /
   Q6D       -9 'Blank' /
   Q6E       -9 'Blank' /
   Q6F       -9 'Blank' /
   Q6G       -9 'Blank' /
   Q6H       -9 'Blank' /
   Q6I       -9 'Blank' /
   Q6_TOT    -9 'Blank' /
   .

* SPSS MISSING VALUES COMMAND.

* MISSING VALUES
     SUBTYPE1 (888) /
     SUBTYPE2 (888) /
     Q1A1 (-9) /
     Q1A2 (-9) /
     Q1A3 (-9) /
     Q1A4 (-9) /
     Q1A5 (-9) /
     Q1A6 (-9) /
     Q1A7 (-9) /
     Q1B1 (-9) /
     Q1B2 (-9) /
     Q1B3 (-9) /
     Q1B4 (-9) /
     Q1B5 (-9) /
     Q1B6 (-9) /
     Q1C1 (-9) /
     Q1C2 (-9) /
     Q1C3 (-9) /
     Q1C4 (-9) /
     Q1C5 (-9) /
     Q1C6 (-9) /
     Q1D1 (-9) /
     Q1D2 (-9) /
     Q1D3 (-9) /
     Q1D4 (-9) /
     Q1D5 (-9) /
     Q1D6 (-9) /
     Q1E1 (-9) /
     Q1E2 (-9) /
     Q1E3 (-9) /
     Q1E4 (-9) /
     Q1E5 (-9) /
     Q1E6 (-9) /
     Q1E7 (-9) /
     Q1E8 (-9) /
     Q1F1 (-9) /
     Q1F2 (-9) /
     Q1F3 (-9) /
     Q1F4 (-9) /
     Q1F5 (-9) /
     Q1F6 (-9) /
     Q1G1 (-9) /
     Q1G2 (-9) /
     Q1G3 (-9) /
     Q1G4 (-9) /
     Q1G5 (-9) /
     Q1G6 (-9) /
     Q1G7 (-9) /
     Q1H1 (-9) /
     Q1H2 (-9) /
     Q1H3 (-9) /
     Q1H4 (-9) /
     Q1H5 (-9) /
     Q1H6 (-9) /
     Q1H7 (-9) /
     Q1H8 (-9) /
     Q2A (-9) /
     Q2B (-9) /
     Q2C (-9) /
     Q3 (-9) /
     Q3EST (-9) /
     Q5A (-9.00) /
     Q5B (-9) /
     Q5C (-9) /
     Q6A (-9) /
     Q6B (-9) /
     Q6C (-9) /
     Q6D (-9) /
     Q6E (-9) /
     Q6F (-9) /
     Q6G (-9) /
     Q6H (-9) /
     Q6I (-9) /
     Q6_TOT (-9) /
   .

EXECUTE.

* Create SPSS system file.

*SAVE OUTFILE="spss-filename.sav".
