*-------------------------------------------------------------------------*
*                                                                          
*                     SPSS SETUP FILE FOR ICPSR 29662
*                        ANNUAL PAROLE SURVEY, 1994
*                             (DATASET 0001: )
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
*  data file is physically located (e.g., "c:\temp\29662-0001-data.txt").
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
*  will be saved (e.g., SAVE OUTFILE="c:\spsswin\data\da29662-0001.sav").
*
*-------------------------------------------------------------------------.

* SPSS FILE HANDLE AND DATA LIST COMMANDS.

FILE HANDLE DATA / NAME="data-filename" LRECL=301.
DATA LIST FILE=DATA /
             STATEID 1-2           STATE 3-4 (A)
             TOTBEG 5-10          ENDISREL 11-16          ENMANREL 17-22
          ENREINST 23-28             OTHEN 29-34             TOTEN 35-40
             EXCOM 41-46          EXINCNEW 47-52          EXINCREV 53-58
          EXINCOTH 59-64           EXTRANS 65-70             EXDTH 71-76
             EXOTH 77-82             TOTEX 83-88            TOTEND 89-94
             MALE 95-100            FEML 101-106         TOTGEND 107-112
           WHITE 113-118           BLACK 119-124         AMINALK 125-130
        ASHAWPAC 131-136         ADDRACE 137-142         TOTRACE 143-148
            HISP 149-154         NONHISP 155-160         TOTHISP 161-166
         MAXYEAR 167-172         MAXMORE 173-178          TOTMAX 179-184
          ACTIVE 185-190        INACTIVE 191-196           ABSND 197-202
        OUTSTATE 203-208         OTHSTAT 209-214         TOTSTAT 215-220
             ISP 221 (A)          ISPNUM 222-227       ISPIN 228-229 (A)
              EM 230 (A)           EMNUM 231-236        EMIN 237-238 (A)
            BOOT 239 (A)         BOOTNUM 240-245      BOOTIN 246-247 (A)
     LOCJAIL 248-249 (A)   LOCJAILIN 250-251 (A)      OTHPAR 252-253 (A)
   ENDOFYEAR 254-255 (A)           UNKEN 256-261           UNKEX 262-267
         UNKGEND 268-273        UNKRACE2 274-279         UNKHISP 280-285
          UNKMAX 286-291         UNKSTAT 292-297        SUPVRATE 298-301
   .

* SPSS VARIABLE LABELS COMMAND.

VARIABLE LABELS
   STATEID   'STATE FIPS IDENTIFICATION CODE' /
   STATE     'STATE TWO-CHARACTER IDENTIFICATION ABBREVIATION' /
   TOTBEG    'PAROLE POPULATION BEGINNING OF YEAR' /
   ENDISREL  'ENTRIES TO PAROLE BY DISCRETIONARY RELEASE FROM PRISON' /
   ENMANREL  'ENTRIES TO PAROLE BY MANDATORY RELEASE FROM PRISON' /
   ENREINST  'ENTRIES TO PAROLE BY REINSTATEMENT' /
   OTHEN     'OTHER ENTRIES TO PAROLE' /
   TOTEN     'TOTAL ENTRIES TO PAROLE' /
   EXCOM     'COMPLETIONS' /
   EXINCNEW  'RETURNED TO INCARCERATION WITH NEW SENTENCE' /
   EXINCREV  'RETURNED TO INCARCERATION WITH REVOCATION, NO NEW SENTENCE' /
   EXINCOTH  'OTHER RETURNED TO INCARCERATION' /
   EXTRANS   'TRANSFERRED TO ANOTHER PAROLE JURISDICTION' /
   EXDTH     'DEATH' /
   EXOTH     'OTHER DISCHARGES' /
   TOTEX     'TOTAL DISCHARGES' /
   TOTEND    'PAROLE POPULATION END OF YEAR' /
   MALE      'MALE' /
   FEML      'FEMALE' /
   TOTGEND   'TOTAL GENDER' /
   WHITE     'WHITE' /
   BLACK     'BLACK' /
   AMINALK   'AMERICAN INDIAN/ALASKA NATIVE' /
   ASHAWPAC  'ASIAN/PACIFIC ISLANDER' /
   ADDRACE   'ADDITIONAL CATEGORIES FOR RACE' /
   TOTRACE   'TOTAL RACE' /
   HISP      'HISPANIC ORIGIN' /
   NONHISP   'NOT OF HISPANIC ORIGIN' /
   TOTHISP   'TOTAL HISPANIC OR NON-HISPANIC ORIGIN' /
   MAXYEAR   'MAXIMUM INCARCERATION SENTENCE ONE YEAR OR LESS' /
   MAXMORE   'MAXIMUM INCARCERATION SENTENCE MORE THAN ONE YEAR' /
   TOTMAX    'TOTAL MAXIMUM INCARCERATION SENTENCE' /
   ACTIVE    'ACTIVE SUPERVISION STATUS' /
   INACTIVE  'INACTIVE STATUS' /
   ABSND     'ABSCONDER STATUS' /
   OUTSTATE  'SUPERVISED OUT OF STATE STATUS' /
   OTHSTAT   'OTHER STATUS' /
   TOTSTAT   'TOTAL SUPERVISION STATUS' /
   ISP       'INTENSIVE SUPERVISION PROGRAM (ISP)' /
   ISPNUM    'NUMBER OF PAROLEES IN ISP' /
   ISPIN     'NUMBER OF PAROLEES IN ISP, INCLUDED IN ITEM4' /
   EM        'ELECTRONIC MONITORING (EM)' /
   EMNUM     'NUMBER OF PAROLEES ON EM' /
   EMIN      'NUMBER OF PAROLEES ON EM, INCLUDED IN ITEM4' /
   BOOT      'BOOTCAMP PROGRAM' /
   BOOTNUM   'NUMBER OF PAROLEES IN BOOTCAMP PROGRAM' /
   BOOTIN    'NUMBER OF PAROLEES IN BOOTCAMP PROGRAM, INCLUDED IN ITEM4' /
   LOCJAIL   'SUPERVISED FROM LOCAL JAILS' /
   LOCJAILIN 'NUMBER OF PAROLEES FROM LOCAL JAILS, INCLUDED IN ITEM4' /
   OTHPAR    'OTHER PAROLEES' /
   ENDOFYEAR 'INFORMATION REPRESENTS END-OF-YEAR DATA' /
   UNKEN     'CALCULATED UNKNOWNS FOR ENTRIES (ITEM 2)' /
   UNKEX     'CALCULATED UNKNOWNS FOR EXITS (ITEM 3)' /
   UNKGEND   'CALCULATED UNKNOWNS FOR GENDER (ITEM 5)' /
   UNKRACE2  'CALCULATED UNKNOWNS FOR RACE (ITEM 6)' /
   UNKHISP   'CALCULATED UNKNOWNS FOR HISPANIC CATEGORY (ITEM 7)' /
   UNKMAX    'CALCULATED UNKNOWNS FOR MAXIMUM INCARCERATION SENTENCE'+
     ' (ITEM 8)'/
   UNKSTAT   'CALCULATED UNKNOWNS FOR SUPERVISION STATUS (ITEM 9)' /
   SUPVRATE  'CALCULATED RATE, NUMBER ON PAROLE ON 12/31/1994 PER 100,000'+
     ' RESIDENTS'/
   .


* SPSS VALUE LABELS COMMAND.

VALUE LABELS
   STATEID   0 'Federal' 1 'Alabama' 2 'Alaska' 4 'Arizona' 5 'Arkansas'
             6 'California' 8 'Colorado' 9 'Connecticut' 10 'Delaware'
             11 'District of Columbia' 12 'Florida' 13 'Georgia' 15 'Hawaii'
             16 'Idaho' 17 'Illinois' 18 'Indiana' 19 'Iowa' 20 'Kansas'
             21 'Kentucky' 22 'Louisiana' 23 'Maine' 24 'Maryland'
             25 'Massachusetts' 26 'Michigan' 27 'Minnesota' 28 'Mississippi'
             29 'Missouri' 30 'Montana' 31 'Nebraska' 32 'Nevada'
             33 'New Hampshire' 34 'New Jersey' 35 'New Mexico' 36 'New York'
             37 'North Carolina' 38 'North Dakota' 39 'Ohio' 40 'Oklahoma'
             41 'Oregon' 42 'Pennsylvania' 44 'Rhode Island'
             45 'South Carolina' 46 'South Dakota' 47 'Tennessee' 48 'Texas'
             49 'Utah' 50 'Vermont' 51 'Virginia' 53 'Washington'
             54 'West Virginia' 55 'Wisconsin' 56 'Wyoming' /
   STATE     'AK' 'Alaska' 'AL' 'Alabama' 'AR' 'Arkansas' 'AZ' 'Arizona'
             'CA' 'California' 'CO' 'Colorado' 'CT' 'Connecticut'
             'DC' 'District of Columbia' 'DE' 'Delaware' 'FE' 'Federal'
             'FL' 'Florida' 'GA' 'Georgia' 'HI' 'Hawaii' 'IA' 'Iowa'
             'ID' 'Idaho' 'IL' 'Illinois' 'IN' 'Indiana' 'KS' 'Kansas'
             'KY' 'Kentucky' 'LA' 'Louisiana' 'MA' 'Massachusetts'
             'MD' 'Maryland' 'ME' 'Maine' 'MI' 'Michigan' 'MN' 'Minnesota'
             'MO' 'Missouri' 'MS' 'Mississippi' 'MT' 'Montana'
             'NC' 'North Carolina' 'ND' 'North Dakota' 'NE' 'Nebraska'
             'NH' 'New Hampshire' 'NJ' 'New Jersey' 'NM' 'New Mexico'
             'NV' 'Nevada' 'NY' 'New York' 'OH' 'Ohio' 'OK' 'Oklahoma'
             'OR' 'Oregon' 'PA' 'Pennsylvania' 'RI' 'Rhode Island'
             'SC' 'South Carolina' 'SD' 'South Dakota' 'TN' 'Tennessee'
             'TX' 'Texas' 'UT' 'Utah' 'VA' 'Virginia' 'VT' 'Vermont'
             'WA' 'Washington' 'WI' 'Wisconsin' 'WV' 'West Virginia'
             'WY' 'Wyoming' /
   TOTBEG    -9 'Not known/Don''t know' -8 'Not applicable' /
   ENDISREL  -9 'Not known/Don''t know' -8 'Not applicable' /
   ENMANREL  -9 'Not known/Don''t know' -8 'Not applicable' /
   ENREINST  -9 'Not known/Don''t know' -8 'Not applicable' /
   OTHEN     -9 'Not known/Don''t know' -8 'Not applicable' /
   TOTEN     -9 'Not known/Don''t know' -8 'Not applicable' /
   EXCOM     -9 'Not known/Don''t know' -8 'Not applicable' /
   EXINCNEW  -9 'Not known/Don''t know' -8 'Not applicable' /
   EXINCREV  -9 'Not known/Don''t know' -8 'Not applicable' /
   EXINCOTH  -9 'Not known/Don''t know' -8 'Not applicable' /
   EXTRANS   -9 'Not known/Don''t know' -8 'Not applicable' /
   EXDTH     -9 'Not known/Don''t know' -8 'Not applicable' /
   EXOTH     -9 'Not known/Don''t know' -8 'Not applicable' /
   TOTEX     -9 'Not known/Don''t know' -8 'Not applicable' /
   TOTEND    -9 'Not known/Don''t know' -8 'Not applicable' /
   MALE      -9 'Not known/Don''t know' -8 'Not applicable' /
   FEML      -9 'Not known/Don''t know' -8 'Not applicable' /
   TOTGEND   -9 'Not known/Don''t know' -8 'Not applicable' /
   WHITE     -9 'Not known/Don''t know' -8 'Not applicable' /
   BLACK     -9 'Not known/Don''t know' -8 'Not applicable' /
   AMINALK   -9 'Not known/Don''t know' -8 'Not applicable' /
   ASHAWPAC  -9 'Not known/Don''t know' -8 'Not applicable' /
   ADDRACE   -9 'Not known/Don''t know' -8 'Not applicable' /
   TOTRACE   -9 'Not known/Don''t know' -8 'Not applicable' /
   HISP      -9 'Not known/Don''t know' -8 'Not applicable' /
   NONHISP   -9 'Not known/Don''t know' -8 'Not applicable' /
   TOTHISP   -9 'Not known/Don''t know' -8 'Not applicable' /
   MAXYEAR   -9 'Not known/Don''t know' -8 'Not applicable' /
   MAXMORE   -9 'Not known/Don''t know' -8 'Not applicable' /
   TOTMAX    -9 'Not known/Don''t know' -8 'Not applicable' /
   ACTIVE    -9 'Not known/Don''t know' -8 'Not applicable' /
   INACTIVE  -9 'Not known/Don''t know' -8 'Not applicable' /
   ABSND     -9 'Not known/Don''t know' -8 'Not applicable' /
   OUTSTATE  -9 'Not known/Don''t know' -8 'Not applicable' /
   OTHSTAT   -9 'Not known/Don''t know' -8 'Not applicable' /
   TOTSTAT   -9 'Not known/Don''t know' -8 'Not applicable' /
   ISP       'N' 'No program' 'Y' 'Yes' /
   ISPNUM    -9 'Not known/Don''t know' -8 'Not applicable' /
   ISPIN     'DK' 'Not known/Don''t know' 'N' 'No' 'NA' 'Not applicable'
             'Y' 'Yes' /
   EM        'N' 'No program' 'Y' 'Yes' /
   EMNUM     -9 'Not known/Don''t know' -8 'Not applicable' /
   EMIN      'DK' 'Not known/Don''t know' 'N' 'No' 'NA' 'Not applicable'
             'Y' 'Yes' /
   BOOT      'N' 'No program' 'Y' 'Yes' /
   BOOTNUM   -9 'Not known/Don''t know' -8 'Not applicable' /
   BOOTIN    'DK' 'Not known/Don''t know' 'N' 'No' 'NA' 'Not applicable'
             'Y' 'Yes' /
   LOCJAIL   'DK' 'Not known/Don''t know' 'N' 'No' 'Y' 'Yes' /
   LOCJAILIN 'DK' 'Not known/Don''t know' 'N' 'No' 'NA' 'Not applicable'
             'Y' 'Yes' /
   OTHPAR    'DK' 'Not known/Don''t know' 'N' 'No' 'Y' 'Yes' /
   ENDOFYEAR 'DK' 'Not known/Don''t know' 'N' 'No' 'Y' 'Yes' /
   .

* SPSS MISSING VALUES COMMAND.

* MISSING VALUES
     TOTBEG (-8, -9) /
     ENDISREL (-8, -9) /
     ENMANREL (-8, -9) /
     ENREINST (-8, -9) /
     OTHEN (-8, -9) /
     TOTEN (-8, -9) /
     EXCOM (-8, -9) /
     EXINCNEW (-8, -9) /
     EXINCREV (-8, -9) /
     EXINCOTH (-8, -9) /
     EXTRANS (-8, -9) /
     EXDTH (-8, -9) /
     EXOTH (-8, -9) /
     TOTEX (-8, -9) /
     TOTEND (-8, -9) /
     MALE (-8, -9) /
     FEML (-8, -9) /
     TOTGEND (-8, -9) /
     WHITE (-8, -9) /
     BLACK (-8, -9) /
     AMINALK (-8, -9) /
     ASHAWPAC (-8, -9) /
     ADDRACE (-8, -9) /
     TOTRACE (-8, -9) /
     HISP (-8, -9) /
     NONHISP (-8, -9) /
     TOTHISP (-8, -9) /
     MAXYEAR (-8, -9) /
     MAXMORE (-8, -9) /
     TOTMAX (-8, -9) /
     ACTIVE (-8, -9) /
     INACTIVE (-8, -9) /
     ABSND (-8, -9) /
     OUTSTATE (-8, -9) /
     OTHSTAT (-8, -9) /
     TOTSTAT (-8, -9) /
     ISPNUM (-8, -9) /
     ISPIN ('DK','NA') /
     EMNUM (-8, -9) /
     EMIN ('DK','NA') /
     BOOTNUM (-8, -9) /
     BOOTIN ('DK','NA') /
     LOCJAIL ('DK') /
     LOCJAILIN ('DK','NA') /
     OTHPAR ('DK') /
     ENDOFYEAR ('DK') /
   .

EXECUTE.

* Create SPSS system file.

*SAVE OUTFILE="spss-filename.sav".
