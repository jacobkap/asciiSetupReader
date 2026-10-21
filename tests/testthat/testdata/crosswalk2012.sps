*-------------------------------------------------------------------------*
*                                                                          
*                     SPSS SETUP FILE FOR ICPSR 35158
*           LAW ENFORCEMENT AGENCY INDENTIFIERS CROSSWALK, 2012
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
*  data file is physically located (e.g., "c:\temp\35158-0001-data.txt").
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
*  VARIABLE LEVEL: assigns measurement level to each variable (scale,
*  nominal, or ordinal).
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
*  will be saved (e.g., SAVE OUTFILE="c:\spsswin\data\da35158-0001.sav").
*
*-------------------------------------------------------------------------.

* SPSS FILE HANDLE AND DATA LIST COMMANDS.

FILE HANDLE DATA / NAME="data-filename" LRECL=1355.
DATA LIST FILE=DATA /
              FSTATE 1-2             FCOUNTY 3-5
             FPLACE 6-10       FIPS_ST 11-12 (A)   FIPS_COUNTY 13-15 (A)
          FIPS 16-20 (A)          ORI9 21-29 (A)          ORI7 30-36 (A)
          NAME 37-86 (A)                UA 87-91    STATENAME 92-116 (A)
  COUNTYNAME 117-166 (A)      UANAME 167-223 (A)          PARTOF 224-231
        AGCYTYPE 232-235        SUBTYPE1 236-239        SUBTYPE2 240-243
           GOVID 244-252     LG_NAME 253-302 (A) ADDRESS_NAME 303-377 (A)
 ADDRESS_STR1 378-452 (A) ADDRESS_STR2 453-527 (A) ADDRESS_CITY 528-602 (A)
 ADDRESS_STATE 603-612 (A) ADDRESS_ZIP 613-622 (A)     REPORT_FLAG 623-624
     CSLLEA08_ID 625-632    LEMAS_ID 633-648 (A)       U_STATENO 649-650
          U_CNTY 651-653    U_POPGRP 654-655 (A)          U_TPOP 656-664
   LG_POPULATION 665-673      CSLLEA_SUB 674-675    COMMENT 676-1175 (A)
  INTPTLAT 1176-1186 (6) INTPTLONG 1187-1197 (6) CONGDIST1 1198-1199 (A)
 CONGDIST2_18 1200-1299 (A)  DISTNAME 1300-1349 (A)  SOURCE_CSLLEA2008 1350
     SOURCE_UCR2010 1351     SOURCE_UCR2011 1352     SOURCE_UCR2012 1353
    SOURCE_NCIC2012 1354      SOURCE_VENDOR 1355
   .

* SPSS VARIABLE LABELS COMMAND

VARIABLE LABELS
   FSTATE    'FIPS STATE CODE' /
   FCOUNTY   'FIPS COUNTY CODE' /
   FPLACE    'FIPS PLACE CODE' /
   FIPS_ST   'FIPS STATE CODE - ALPHANUMERIC' /
   FIPS_COUNTY 'FIPS COUNTY CODE - ALPHANUMERIC' /
   FIPS      'FIPS STATE-COUNTY CODE - ALPHANUMERIC' /
   ORI9      'ORIGINATING AGENCY IDENTIFIER (9 CHARACTERS) FROM UCR AND NCIC FILES' /
   ORI7      'ORIGINATING AGENCY IDENTIFIER (7 CHARACTERS) FROM UCR FILES' /
   NAME      'AGENCY NAME' /
   UA        'URBAN AREA/URBAN CLUSTER CODE' /
   STATENAME 'STATE NAME' /
   COUNTYNAME 'COUNTY NAME' /
   UANAME    'URBAN AREA/URBAN CLUSTER NAME' /
   PARTOF    'AGENCY/ORI IS PART OF LARGER PARENT AGENCY' /
   AGCYTYPE  'AGENCY TYPE' /
   SUBTYPE1  'AGENCY SUB-TYPE 1' /
   SUBTYPE2  'AGENCY SUB-TYPE 2' /
   GOVID     'GOVERNMENT ID (CENSUS)' /
   LG_NAME   'CENSUS NAME' /
   ADDRESS_NAME 'ADDRESS - NAME' /
   ADDRESS_STR1 'ADDRESS - STREET LINE 1' /
   ADDRESS_STR2 'ADDRESS - STREET LINE 2' /
   ADDRESS_CITY 'ADDRESS - CITY' /
   ADDRESS_STATE 'ADDRESS - STATE' /
   ADDRESS_ZIP 'ADDRESS - ZIP CODE' /
   REPORT_FLAG 'ORI REPORTED 1 OR MORE OFFENSES 1985 - 2012' /
   CSLLEA08_ID 'CSLLEA 2008 AGENCY IDENTIFIER' /
   LEMAS_ID  'LEMAS FILES ID' /
   U_STATENO 'UCR NUMERIC STATE CODE (UCR CODING)' /
   U_CNTY    'UCR COUNTY (UCR CODING)' /
   U_POPGRP  'GROUP NUMBER (AS OF 2012)' /
   U_TPOP    'UCR TOTAL POPULATION (AS OF 2012)' /
   LG_POPULATION 'CENSUS POPULATION' /
   CSLLEA_SUB 'FLAG VARIABLE TO SUBSET THE LEAIC TO APPROXIMATE THE CSLLEA' /
   COMMENT   'COMMENTS - TYPICALLY LISTING INFORMATION ON MULTI-JURISDICTION AGENCIES' /
   INTPTLAT  'LATITUDE' /
   INTPTLONG 'LONGITUDE' /
   CONGDIST1 'CONGRESSIONAL DISTRICT 1 (AS OF 2010)' /
   CONGDIST2_18 'CONGRESSIONAL DISTRICTS 2 THROUGH 18 (AS OF 2010)' /
   DISTNAME  'FEDERAL JUDICIAL DISTRICT NAME' /
   SOURCE_CSLLEA2008 'SOURCE FILE FLAG: CSLLEA 2008' /
   SOURCE_UCR2010 'SOURCE FILE FLAG: UCR 2010' /
   SOURCE_UCR2011 'SOURCE FILE FLAG: UCR 2011' /
   SOURCE_UCR2012 'SOURCE FILE FLAG: UCR 2012' /
   SOURCE_NCIC2012 'SOURCE FILE FLAG: NCIC 2012' /
   SOURCE_VENDOR 'SOURCE FILE FLAG: VENDOR FILE 2012' /
   .


* SPSS VALUE LABELS COMMAND.

VALUE LABELS
   FSTATE    1 'Alabama' 2 'Alaska' 4 'Arizona' 5 'Arkansas' 6 'California'
             8 'Colorado' 9 'Connecticut' 10 'Delaware'
             11 'District of Columbia' 12 'Florida' 13 'Georgia' 15 'Hawaii'
             16 'Idaho' 17 'Illinois' 18 'Indiana' 19 'Iowa' 20 'Kansas'
             21 'Kentucky' 22 'Louisiana' 23 'Maine' 24 'Maryland'
             25 'Massachusetts' 26 'Michigan' 27 'Minnesota' 28 'Mississippi'
             29 'Missouri' 30 'Montana' 31 'Nebraska' 32 'Nevada'
             33 'New Hampshire' 34 'New Jersey' 35 'New Mexico' 36 'New York'
             37 'North Carolina' 38 'North Dakota' 39 'Ohio' 40 'Oklahoma'
             41 'Oregon' 42 'Pennsylvania' 44 'Rhodes Island'
             45 'South Carolina' 46 'South Dakota' 47 'Tennessee' 48 'Texas'
             49 'Utah' 50 'Vermont' 51 'Virginia' 53 'Washington'
             54 'West Virginia' 55 'Wisconsin' 56 'Wyoming' 57 'Canal Zone'
             66 'Guam' 72 'Puerto Rico' 78 'Virgin Islands'
             99 'Not a state or territory' /
   FCOUNTY   991 'Multi-jurisdiction (see COMMENTS)' 997 'Federal agency'
             999 'Undetermined' /
   FPLACE    99991 'Multi-jurisdiction (see COMMENTS)' 99999 'Undetermined' /
   ORI9      '-1' 'Not in UCR/NCIC' /
   ORI7      '-1' 'Not in UCR' /
   UA        -1 'Not a Census place' /
   PARTOF    0 'Parent agency' 1 'Part of larger agency' /
   AGCYTYPE  0 'Local police department' 1 'Sheriff''s office'
             5 'State law enforcement agency' 6 'Special jurisdiction'
             7 'Constable/Marshal' 997 'Federal' /
   SUBTYPE1  1 'Public buildings/facilities'
             2 'Natural resources/parks and recreation'
             3 'Transportation systems/facilities'
             4 'Criminal investigations' 5 'Special enforcement'
             888 'Not applicable' /
   SUBTYPE2  11 'Four-year university' 12 'Two-year college'
             13 'Medical school' 14 'Public school district'
 15 'Public health/rehabilitative services facility (hospitals, mental health)'
             16 'Public housing' 17 'Government buildings'
             19 'Other facilities' 21 'Fish and wildlife enforcement'
             22 'Parks and recreational facilities'
             23 'Marine law enforcement' 24 'Environmental law enforcement'
             25 'Forest resources law enforcement'
             26 'Sanitation law enforcement'
             27 'Water resources law enforcement' 28 'Levee district'
             29 'Multi-function natural resources enforcement'
             31 'Mass transit/railroad system' 32 'Airport'
             34 'Port/harbor facilities'
             35 'Commercial/motor vehicle enforcement'
             36 'Bridges, tunnels, roadways'
             39 'Multi-type transportation facilities'
             41 'County investigations bureau'
             42 'State bureau of investigations'
             43 'Fire marshal/arson investigations' 44 'Fraud investigations'
             45 'Tax/revenue enforcement'
             49 'Other, multiple types of investigations'
             51 'Alcohol/tobacco enforcement'
             52 'Agricultural/livestock enforcement' 53 'Gaming enforcement'
             54 'Narcotics enforcement' 55 'Racing enforcement'
             56 'Vice (NACJD added category)'
             59 'Other enforcement (NACJD added category)'
             888 'Not applicable' /
   GOVID     999999991 'Multi-jurisdiction (see COMMENTS)'
             999999999 'Undetermined' /
   REPORT_FLAG 0 'Record has no ORI' 1 'ORI reported 1+ offenses'
             2 'ORI reported 0 offenses or did not report' /
   CSLLEA08_ID -1 'Not in CSLLEA 2008' /
   LEMAS_ID  '-1' 'Not in LEMAS Files' /
   U_STATENO -1 'Not in UCR' 1 'Alabama' 2 'Arizona' 3 'Arkansas'
             4 'California' 5 'Colorado' 6 'Connecticut' 7 'Delaware'
             8 'District of Columbia' 9 'Florida' 10 'Georgia' 11 'Idaho'
             12 'Illinois' 13 'Indiana' 14 'Iowa' 15 'Kansas' 16 'Kentucky'
             17 'Louisiana' 18 'Maine' 19 'Maryland' 20 'Massachusetts'
             21 'Michigan' 22 'Minnesota' 23 'Mississippi' 24 'Missouri'
             25 'Montana' 26 'Nebraska' 27 'Nevada' 28 'New Hampshire'
             29 'New Jersey' 30 'New Mexico' 31 'New York'
             32 'North Carolina' 33 'North Dakota' 34 'Ohio' 35 'Oklahoma'
             36 'Oregon' 37 'Pennsylvania' 38 'Rhode Island'
             39 'South Carolina' 40 'South Dakota' 41 'Tennessee' 42 'Texas'
             43 'Utah' 44 'Vermont' 45 'Virginia' 46 'Washington'
             47 'West Virginia' 48 'Wisconsin' 49 'Wyoming' 50 'Alaska'
             51 'Hawaii' 52 'Canal Zone' 53 'Puerto Rico' 54 'American Samoa'
             55 'Guam' 62 'Virgin Islands' /
   U_CNTY    -2 'In UCR - no UCR county code' -1 'Not in UCR' /
   U_POPGRP  '-1' 'Not in UCR' '0' 'Possessions' '1' 'ALL cit 250,000 +'
             '2' 'Cit 100,000-249,999' '3' 'Cit 50,000-99,999'
             '4' 'Cit 25,000-49,999' '5' 'Cit 10,000-24,999'
             '6' 'Cit 2,500-9,999' '7' 'Cit < 2,500' '8' 'Non-MSA co.'
             '9' 'MSA counties' '1A' 'Cit 1,000,000 +'
             '1B' 'Cit 500,000-999,999' '1C' 'Cit 250,000-499,999'
             '8A' 'Non-MSA co. 100,000 +' '8B' 'Non-MSA co. 25,000-99,999'
             '8C' 'Non-MSA co. 10,000-24,999' '8D' 'Non-MSA co. < 10,000'
             '8E' 'Non-MSA St Police' '9A' 'MSA co. 100,000 +'
             '9B' 'MSA co. 25,000-99,999' '9C' 'MSA co. 10,000-24,999'
             '9D' 'MSA co. < 10,000' '9E' 'MSA St Police' /
   U_TPOP    -1 'Not in UCR' /
   LG_POPULATION 888888888 'Not local or sheriff agency'
             999999999 'Undetermined' /
   CSLLEA_SUB 0 'Exclude record' 1 'Include record to appoximate CSLLEA' /
   INTPTLAT  -9 'Undetermined' /
   INTPTLONG -9 'Undetermined' /
   CONGDIST1 '-9' 'Undetermined' /
   .

EXECUTE.

* SPSS VARIABLE LEVEL COMMAND.

VARIABLE LEVEL
   UA
   CSLLEA08_ID
   U_CNTY
   U_TPOP
   LG_POPULATION
   INTPTLAT
   INTPTLONG
   SOURCE_CSLLEA2008
   SOURCE_UCR2010
   SOURCE_UCR2011
   SOURCE_UCR2012
   SOURCE_NCIC2012
   SOURCE_VENDOR
    (scale).

VARIABLE LEVEL
   FSTATE
   FCOUNTY
   FPLACE
   FIPS_ST
   FIPS_COUNTY
   FIPS
   ORI9
   ORI7
   NAME
   STATENAME
   COUNTYNAME
   UANAME
   PARTOF
   AGCYTYPE
   SUBTYPE1
   SUBTYPE2
   GOVID
   LG_NAME
   ADDRESS_NAME
   ADDRESS_STR1
   ADDRESS_STR2
   ADDRESS_CITY
   ADDRESS_STATE
   ADDRESS_ZIP
   REPORT_FLAG
   LEMAS_ID
   U_STATENO
   U_POPGRP
   CSLLEA_SUB
   COMMENT
   CONGDIST1
   CONGDIST2_18
   DISTNAME
    (nominal).

* SPSS FORMAT COMMAND.

FORMAT
    FSTATE (F2.0) /
    FCOUNTY (F3.0) /
    FPLACE (F5.0) /
    FIPS_ST (A2) /
    FIPS_COUNTY (A3) /
    FIPS (A5) /
    ORI9 (A9) /
    ORI7 (A7) /
    NAME (A50) /
    UA (F5.0) /
    STATENAME (A25) /
    COUNTYNAME (A50) /
    UANAME (A57) /
    PARTOF (F8.0) /
    AGCYTYPE (F4.0) /
    SUBTYPE1 (F4.0) /
    SUBTYPE2 (F4.0) /
    GOVID (F9.0) /
    LG_NAME (A50) /
    ADDRESS_NAME (A75) /
    ADDRESS_STR1 (A75) /
    ADDRESS_STR2 (A75) /
    ADDRESS_CITY (A75) /
    ADDRESS_STATE (A10) /
    ADDRESS_ZIP (A10) /
    REPORT_FLAG (F2.0) /
    CSLLEA08_ID (F8.0) /
    LEMAS_ID (A16) /
    U_STATENO (F2.0) /
    U_CNTY (F3.0) /
    U_POPGRP (A2) /
    U_TPOP (F9.0) /
    LG_POPULATION (F9.0) /
    CSLLEA_SUB (F2.0) /
    COMMENT (A500) /
    INTPTLAT (F11.6) /
    INTPTLONG (F11.6) /
    CONGDIST1 (A2) /
    CONGDIST2_18 (A100) /
    DISTNAME (A50) /
    SOURCE_CSLLEA2008 (F1.0) /
    SOURCE_UCR2010 (F1.0) /
    SOURCE_UCR2011 (F1.0) /
    SOURCE_UCR2012 (F1.0) /
    SOURCE_NCIC2012 (F1.0) /
    SOURCE_VENDOR (F1.0) /

* Create SPSS system file.

*SAVE OUTFILE="spss-filename.sav".
