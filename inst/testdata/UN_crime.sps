*-------------------------------------------------------------------------*
*                                                                          
*                     SPSS SETUP FILE FOR ICPSR 26462
*         UNITED NATIONS SURVEYS OF CRIME TRENDS AND OPERATIONS OF
*          CRIMINAL JUSTICE SYSTEMS SERIES, WAVES 1-10, 1970-2006
*                    (DATASET 0001: WAVE 1, 1970-1975)
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
*  data file is physically located (e.g., "c:\temp\26462-0001-data.txt").
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
*  will be saved (e.g., SAVE OUTFILE="c:\spsswin\data\da26462-0001.sav").
*
*-------------------------------------------------------------------------.

* SPSS FILE HANDLE AND DATA LIST COMMANDS.

FILE HANDLE DATA / NAME="data-filename" LRECL=630.
DATA LIST FILE=DATA /
                  ID 1-3        COUNTRY 4-17 (A)
          NNHOM70N 18-22          NNHOM71N 23-27          NNHOM72N 28-32
          NNHOM73N 33-37          NNHOM74N 38-42          NNHOM75N 43-47
              AS70 48-53              AS71 54-59              AS72 60-65
              AS73 66-71              AS74 72-77             AS75X 78-83
             SEX70 84-88             SEX71 89-93             SEX72 94-98
            SEX73 99-103           SEX74 104-108           SEX75 109-113
           ROB70 114-119           ROB71 120-125           ROB72 126-131
           ROB73 132-137           ROB74 138-143          ROB75X 144-149
         THEFT70 150-156         THEFT71 157-163         THEFT72 164-170
         THEFT73 171-177         THEFT74 178-184        THEFT75X 185-192
         FRAUD70 193-198         FRAUD71 199-204         FRAUD72 205-210
         FRAUD73 211-216         FRAUD74 217-222        FRAUD75X 223-228
           KID70 229-232           KID71 233-236           KID72 237-240
           KID73 241-244           KID74 245-249          KID75X 250-253
          TOTC70 254-260          TOTC71 261-267          TOTC72 268-274
          TOTC73 275-281          TOTC74 282-288         TOTC75X 289-295
        DABUSE70 296-301        DABUSE71 302-307        DABUSE72 308-313
        DABUSE73 314-319        DABUSE74 320-325        DABUSE75 326-331
        TDRUG70N 332-335        TDRUG71N 336-339        TDRUG72N 340-343
        TDRUG73N 344-347        TDRUG74N 348-352        TDRUG75N 353-357
         BRIB70N 358-361         BRIB71N 362-363         BRIB72N 364-367
         BRIB73N 368-369         BRIB74N 370-373         BRIB75N 374-375
           AO70N 376-382           AO71N 383-389           AO72N 390-396
           AO73N 397-403           AO74N 404-410           AO75N 411-417
           JD70N 418-424           JD71N 425-431           JD72N 432-438
           JD73N 439-445           JD74N 446-452           JD75N 453-459
           POL73 460-465         JUG1973 466-470           PRO73 471-475
         TCON701 476-482         TCON723 483-489         TCON745 490-496
         MCON701 497-498         MCON723 499-500         MCON745 501-504
         ACON701 505-506         ACON723 507-508         ACON745 509-513
         ROBC701 514-515         ROBC723 516-517         ROBC745 518-521
         RAPC701 522-523         RAPC723 524-525         RAPC745 526-529
         THEC701 530-531         THEC723 532-533         THEC745 534-539
         FRAC701 540-541         FRAC723 542-543         FRAC745 544-548
         DRGC701 549-550         DRGC723 551-552         DRGC745 553-557
         JUVC701 558-562         JUVC723 563-566         JUVC745 567-572
         PRIS701 573-577         PRIS723 578-583         PRIS745 584-589
         PSTF701 590-594         PSTF723 595-599         PSTF745 600-605
              X2 606-610              X3 611-615              X4 616-620
              X5 621-625              X6 626-630
   .

* SPSS VARIABLE LABELS COMMAND.

VARIABLE LABELS
   ID        'ID' /
   COUNTRY   'COUNTRY' /
   NNHOM70N  'MURDER CONVICTIONS, 1970' /
   NNHOM71N  'MURDER CONVICTIONS, 1971' /
   NNHOM72N  'MURDER CONVICTIONS, 1972' /
   NNHOM73N  'MURDER CONVICTIONS, 1973' /
   NNHOM74N  'MURDER CONVICTIONS, 1974' /
   NNHOM75N  'MURDER CONVICTIONS, 1975' /
   AS70      'ASSAULT CONVICTIONS, 1970' /
   AS71      'ASSAULT CONVICTIONS, 1971' /
   AS72      'ASSAULT CONVICTIONS, 1972' /
   AS73      'ASSAULT CONVICTIONS, 1973' /
   AS74      'ASSAULT CONVICTIONS, 1974' /
   AS75X     'ASSAULT CONVICTIONS, 1975' /
   SEX70     'SEX CRIME CONVICTIONS, 1970' /
   SEX71     'SEX CRIME CONVICTIONS, 1971' /
   SEX72     'SEX CRIME CONVICTIONS, 1972' /
   SEX73     'SEX CRIME CONVICTIONS, 1973' /
   SEX74     'SEX CRIME CONVICTIONS, 1974' /
   SEX75     'SEX CRIME CONVICTIONS, 1975' /
   ROB70     'ROBBERY CONVICTIONS, 1970' /
   ROB71     'ROBBERY CONVICTIONS, 1971' /
   ROB72     'ROBBERY CONVICTIONS, 1972' /
   ROB73     'ROBBERY CONVICTIONS, 1973' /
   ROB74     'ROBBERY CONVICTIONS, 1974' /
   ROB75X    'ROBBERY CONVICTIONS, 1975' /
   THEFT70   'THEFT CONVICTIONS, 1970' /
   THEFT71   'THEFT CONVICTIONS, 1971' /
   THEFT72   'THEFT CONVICTIONS, 1972' /
   THEFT73   'THEFT CONVICTIONS, 1973' /
   THEFT74   'THEFT CONVICTIONS, 1974' /
   THEFT75X  'THEFT CONVICTIONS, 1975' /
   FRAUD70   'FRAUD CONVICTIONS, 1970' /
   FRAUD71   'FRAUD CONVICTIONS, 1971' /
   FRAUD72   'FRAUD CONVICTIONS, 1972' /
   FRAUD73   'FRAUD CONVICTIONS, 1973' /
   FRAUD74   'FRAUD CONVICTIONS, 1974' /
   FRAUD75X  'FRAUD CONVICTIONS, 1975' /
   KID70     'KIDNAPPING CONVICTIONS, 1970' /
   KID71     'KIDNAPPING CONVICTIONS, 1971' /
   KID72     'KIDNAPPING CONVICTIONS, 1972' /
   KID73     'KIDNAPPING CONVICTIONS, 1973' /
   KID74     'KIDNAPPING CONVICTIONS, 1974' /
   KID75X    'KIDNAPPING CONVICTIONS, 1975' /
   TOTC70    'TOTAL CRIME CONVICTIONS, 1970' /
   TOTC71    'TOTAL CRIME CONVICTIONS, 1971' /
   TOTC72    'TOTAL CRIME CONVICTIONS, 1972' /
   TOTC73    'TOTAL CRIME CONVICTIONS, 1973' /
   TOTC74    'TOTAL CRIME CONVICTIONS, 1974' /
   TOTC75X   'TOTAL CRIME CONVICTIONS, 1975' /
   DABUSE70  'DRUG USE CONVICTIONS, 1970' /
   DABUSE71  'DRUG USE CONVICTIONS, 1971' /
   DABUSE72  'DRUG USE CONVICTIONS, 1972' /
   DABUSE73  'DRUG USE CONVICTIONS, 1973' /
   DABUSE74  'DRUG USE CONVICTIONS, 1974' /
   DABUSE75  'DRUG USE CONVICTIONS, 1975' /
   TDRUG70N  'DRUG TRAFFICKING CONVICTIONS, 1970' /
   TDRUG71N  'DRUG TRAFFICKING CONVICTIONS, 1971' /
   TDRUG72N  'DRUG TRAFFICKING CONVICTIONS, 1972' /
   TDRUG73N  'DRUG TRAFFICKING CONVICTIONS, 1973' /
   TDRUG74N  'DRUG TRAFFICKING CONVICTIONS, 1974' /
   TDRUG75N  'DRUG TRAFFICKING CONVICTIONS, 1975' /
   BRIB70N   'BRIBERY CONVICTIONS, 1970' /
   BRIB71N   'BRIBERY CONVICTIONS, 1971' /
   BRIB72N   'BRIBERY CONVICTIONS, 1972' /
   BRIB73N   'BRIBERY CONVICTIONS, 1973' /
   BRIB74N   'BRIBERY CONVICTIONS, 1974' /
   BRIB75N   'BRIBERY CONVICTIONS, 1975' /
   AO70N     'OFFENDER CONVICTIONS, 1970' /
   AO71N     'OFFENDER CONVICTIONS, 1971' /
   AO72N     'OFFENDER CONVICTIONS, 1972' /
   AO73N     'OFFENDER CONVICTIONS, 1973' /
   AO74N     'OFFENDER CONVICTIONS, 1974' /
   AO75N     'OFFENDER CONVICTIONS, 1975' /
   JD70N     'JUVENILE CONVICTIONS, 1970' /
   JD71N     'JUVENILE CONVICTIONS, 1971' /
   JD72N     'JUVENILE CONVICTIONS, 1972' /
   JD73N     'JUVENILE CONVICTIONS, 1973' /
   JD74N     'JUVENILE CONVICTIONS, 1974' /
   JD75N     'JUVENILE CONVICTIONS, 1975' /
   POL73     'POLICE, 1973' /
   JUG1973   'JUDGES, 1973' /
   PRO73     'PROSECUTORS, 1973' /
   TCON701   'TOTAL CONVICTIONS, 1970-1971' /
   TCON723   'TOTAL CONVICTIONS, 1972-1973' /
   TCON745   'TOTAL CONVICTIONS, 1974-1975' /
   MCON701   'TOTAL MALE CONVICTIONS, 1970-1971' /
   MCON723   'TOTAL MALE CONVICTIONS, 1972-1973' /
   MCON745   'TOTAL MALE CONVICTIONS, 1974-1975' /
   ACON701   'TOTAL ADULT CONVICTIONS, 1970-1971' /
   ACON723   'TOTAL ADULT CONVICTIONS, 1972-1973' /
   ACON745   'TOTAL ADULT CONVICTIONS, 1974-1975' /
   ROBC701   'ROBBERY CONVICTIONS, 1970-1971' /
   ROBC723   'ROBBERY CONVICTIONS, 1972-1973' /
   ROBC745   'ROBBERY CONVICTIONS, 1974-1975' /
   RAPC701   'RAPE CONVICTIONS, 1970-1971' /
   RAPC723   'RAPE CONVICTIONS, 1972-1973' /
   RAPC745   'RAPE CONVICTIONS, 1974-1975' /
   THEC701   'THEFT CONVICTIONS, 1970-1971' /
   THEC723   'THEFT CONVICTIONS, 1972-1973' /
   THEC745   'THEFT CONVICTIONS, 1974-1975' /
   FRAC701   'FRAUD CONVICTIONS, 1970-1971' /
   FRAC723   'FRAUD CONVICTIONS, 1972-1973' /
   FRAC745   'FRAUD CONVICTIONS, 1974-1975' /
   DRGC701   'DRUG CRIME CONVICTIONS, 1970-1971' /
   DRGC723   'DRUG CRIME CONVICTIONS, 1972-1973' /
   DRGC745   'DRUG CRIME CONVICTIONS, 1974-1975' /
   JUVC701   'TOTAL JUVENILE CONVICTIONS, 1970-1971' /
   JUVC723   'TOTAL JUVENILE CONVICTIONS, 1972-1973' /
   JUVC745   'TOTAL JUVENILE CONVICTIONS, 1974-1975' /
   PRIS701   'DAILY AVERAGE PRISON POPULATION, 1970-1971' /
   PRIS723   'DAILY AVERAGE PRISON POPULATION, 1972-1973' /
   PRIS745   'DAILY AVERAGE PRISON POPULATION, 1974-1975' /
   PSTF701   'PRISON STAFF, 1970-1971' /
   PSTF723   'PRISON STAFF, 1972-1973' /
   PSTF745   'PRISON STAFF, 1974-1975' /
   X2        'X2' /
   X3        'X3' /
   X4        'X4' /
   X5        'X5' /
   X6        'X6' /
   .


* SPSS VALUE LABELS COMMAND.

VALUE LABELS
   NNHOM70N  -9 'Blank' /
   NNHOM71N  -9 'Blank' /
   NNHOM72N  -9 'Blank' /
   NNHOM73N  -9 'Blank' /
   NNHOM74N  -9 'Blank' /
   NNHOM75N  -9 'Blank' /
   AS70      -9 'Blank' /
   AS71      -9 'Blank' /
   AS72      -9 'Blank' /
   AS73      -9 'Blank' /
   AS74      -9 'Blank' /
   AS75X     -9 'Blank' /
   SEX70     -9 'Blank' /
   SEX71     -9 'Blank' /
   SEX72     -9 'Blank' /
   SEX73     -9 'Blank' /
   SEX74     -9 'Blank' /
   SEX75     -9 'Blank' /
   ROB70     -9 'Blank' /
   ROB71     -9 'Blank' /
   ROB72     -9 'Blank' /
   ROB73     -9 'Blank' /
   ROB74     -9 'Blank' /
   ROB75X    -9 'Blank' /
   THEFT70   -9 'Blank' /
   THEFT71   -9 'Blank' /
   THEFT72   -9 'Blank' /
   THEFT73   -9 'Blank' /
   THEFT74   -9 'Blank' /
   THEFT75X  -9 'Blank' /
   FRAUD70   -9 'Blank' /
   FRAUD71   -9 'Blank' /
   FRAUD72   -9 'Blank' /
   FRAUD73   -9 'Blank' /
   FRAUD74   -9 'Blank' /
   FRAUD75X  -9 'Blank' /
   KID70     -9 'Blank' /
   KID71     -9 'Blank' /
   KID72     -9 'Blank' /
   KID73     -9 'Blank' /
   KID74     -9 'Blank' /
   KID75X    -9 'Blank' /
   TOTC70    -9 'Blank' /
   TOTC71    -9 'Blank' /
   TOTC72    -9 'Blank' /
   TOTC73    -9 'Blank' /
   TOTC74    -9 'Blank' /
   TOTC75X   -9 'Blank' /
   DABUSE70  -9 'Blank' /
   DABUSE71  -9 'Blank' /
   DABUSE72  -9 'Blank' /
   DABUSE73  -9 'Blank' /
   DABUSE74  -9 'Blank' /
   DABUSE75  -9 'Blank' /
   TDRUG70N  -9 'Blank' /
   TDRUG71N  -9 'Blank' /
   TDRUG72N  -9 'Blank' /
   TDRUG73N  -9 'Blank' /
   TDRUG74N  -9 'Blank' /
   TDRUG75N  -9 'Blank' /
   BRIB70N   -9 'Blank' /
   BRIB71N   -9 'Blank' /
   BRIB72N   -9 'Blank' /
   BRIB73N   -9 'Blank' /
   BRIB74N   -9 'Blank' /
   BRIB75N   -9 'Blank' /
   AO70N     -9 'Blank' /
   AO71N     -9 'Blank' /
   AO72N     -9 'Blank' /
   AO73N     -9 'Blank' /
   AO74N     -9 'Blank' /
   AO75N     -9 'Blank' /
   JD70N     -9 'Blank' /
   JD71N     -9 'Blank' /
   JD72N     -9 'Blank' /
   JD73N     -9 'Blank' /
   JD74N     -9 'Blank' /
   JD75N     -9 'Blank' /
   POL73     -9 'Blank' /
   JUG1973   -9 'Blank' /
   PRO73     -9 'Blank' /
   TCON701   -9 'Blank' /
   TCON723   -9 'Blank' /
   TCON745   -9 'Blank' /
   MCON701   -9 'Blank' /
   MCON723   -9 'Blank' /
   MCON745   -9 'Blank' /
   ACON701   -9 'Blank' /
   ACON723   -9 'Blank' /
   ACON745   -9 'Blank' /
   ROBC701   -9 'Blank' /
   ROBC723   -9 'Blank' /
   ROBC745   -9 'Blank' /
   RAPC701   -9 'Blank' /
   RAPC723   -9 'Blank' /
   RAPC745   -9 'Blank' /
   THEC701   -9 'Blank' /
   THEC723   -9 'Blank' /
   THEC745   -9 'Blank' /
   FRAC701   -9 'Blank' /
   FRAC723   -9 'Blank' /
   FRAC745   -9 'Blank' /
   DRGC701   -9 'Blank' /
   DRGC723   -9 'Blank' /
   DRGC745   -9 'Blank' /
   JUVC701   -9 'Blank' /
   JUVC723   -9 'Blank' /
   JUVC745   -9 'Blank' /
   PRIS701   -9 'Blank' /
   PRIS723   -9 'Blank' /
   PRIS745   -9 'Blank' /
   PSTF701   -9 'Blank' /
   PSTF723   -9 'Blank' /
   PSTF745   -9 'Blank' /
   X2        -9 'Blank' /
   X3        -9 'Blank' /
   X4        -9 'Blank' /
   X5        -9 'Blank' /
   X6        -9 'Blank' /
   .

* SPSS MISSING VALUES COMMAND.

* MISSING VALUES
     NNHOM70N (-2, -3, -9) /
     NNHOM71N (-2, -3, -9) /
     NNHOM72N (-2, -3, -9) /
     NNHOM73N (-2, -3, -9) /
     NNHOM74N (-2, -3, -9) /
     NNHOM75N (-2, -3, -9) /
     AS70 (-2, -3, -9) /
     AS71 (-2, -3, -9) /
     AS72 (-2, -3, -9) /
     AS73 (-2, -3, -9) /
     AS74 (-2, -3, -9) /
     AS75X (-2, -3, -9) /
     SEX70 (-2, -3, -9) /
     SEX71 (-2, -3, -9) /
     SEX72 (-2, -3, -9) /
     SEX73 (-2, -3, -9) /
     SEX74 (-2, -3, -9) /
     SEX75 (-2, -3, -9) /
     ROB70 (-2, -3, -9) /
     ROB71 (-2, -3, -9) /
     ROB72 (-2, -3, -9) /
     ROB73 (-2, -3, -9) /
     ROB74 (-2, -3, -9) /
     ROB75X (-2, -3, -9) /
     THEFT70 (-2, -3, -9) /
     THEFT71 (-2, -3, -9) /
     THEFT72 (-2, -3, -9) /
     THEFT73 (-2, -3, -9) /
     THEFT74 (-2, -3, -9) /
     THEFT75X (-2, -3, -9) /
     FRAUD70 (-2, -3, -9) /
     FRAUD71 (-2, -3, -9) /
     FRAUD72 (-2, -3, -9) /
     FRAUD73 (-2, -3, -9) /
     FRAUD74 (-2, -3, -9) /
     FRAUD75X (-2, -3, -9) /
     KID70 (-2, -3, -9) /
     KID71 (-2, -3, -9) /
     KID72 (-2, -3, -9) /
     KID73 (-2, -3, -9) /
     KID74 (-2, -3, -9) /
     KID75X (-2, -3, -9) /
     TOTC70 (-2, -3, -9) /
     TOTC71 (-2, -3, -9) /
     TOTC72 (-2, -3, -9) /
     TOTC73 (-2, -3, -9) /
     TOTC74 (-2, -3, -9) /
     TOTC75X (-2, -3, -9) /
     DABUSE70 (-2, -3, -9) /
     DABUSE71 (-2, -3, -9) /
     DABUSE72 (-2, -3, -9) /
     DABUSE73 (-2, -3, -9) /
     DABUSE74 (-2, -3, -9) /
     DABUSE75 (-2, -3, -9) /
     TDRUG70N (-2, -3, -9) /
     TDRUG71N (-2, -3, -9) /
     TDRUG72N (-2, -3, -9) /
     TDRUG73N (-2, -3, -9) /
     TDRUG74N (-2, -3, -9) /
     TDRUG75N (-2, -3, -9) /
     BRIB70N (-2, -3, -9) /
     BRIB71N (-2, -3, -9) /
     BRIB72N (-2, -3, -9) /
     BRIB73N (-2, -3, -9) /
     BRIB74N (-2, -3, -9) /
     BRIB75N (-2, -3, -9) /
     AO70N (-2, -3, -9) /
     AO71N (-2, -3, -9) /
     AO72N (-2, -3, -9) /
     AO73N (-2, -3, -9) /
     AO74N (-2, -3, -9) /
     AO75N (-2, -3, -9) /
     JD70N (-2, -3, -9) /
     JD71N (-2, -3, -9) /
     JD72N (-2, -3, -9) /
     JD73N (-2, -3, -9) /
     JD74N (-2, -3, -9) /
     JD75N (-2, -3, -9) /
     POL73 (-2, -3, -9) /
     JUG1973 (-2, -3, -9) /
     PRO73 (-2, -3, -9) /
     TCON701 (-2, -3, -9) /
     TCON723 (-2, -3, -9) /
     TCON745 (-2, -3, -9) /
     MCON701 (-2, -3, -9) /
     MCON723 (-2, -3, -9) /
     MCON745 (-2, -3, -9) /
     ACON701 (-2, -3, -9) /
     ACON723 (-2, -3, -9) /
     ACON745 (-2, -3, -9) /
     ROBC701 (-2, -3, -9) /
     ROBC723 (-2, -3, -9) /
     ROBC745 (-2, -3, -9) /
     RAPC701 (-2, -3, -9) /
     RAPC723 (-2, -3, -9) /
     RAPC745 (-2, -3, -9) /
     THEC701 (-2, -3, -9) /
     THEC723 (-2, -3, -9) /
     THEC745 (-2, -3, -9) /
     FRAC701 (-2, -3, -9) /
     FRAC723 (-2, -3, -9) /
     FRAC745 (-2, -3, -9) /
     DRGC701 (-2, -3, -9) /
     DRGC723 (-2, -3, -9) /
     DRGC745 (-2, -3, -9) /
     JUVC701 (-2, -3, -9) /
     JUVC723 (-2, -3, -9) /
     JUVC745 (-2, -3, -9) /
     PRIS701 (-2, -3, -9) /
     PRIS723 (-2, -3, -9) /
     PRIS745 (-2, -3, -9) /
     PSTF701 (-2, -3, -9) /
     PSTF723 (-2, -3, -9) /
     PSTF745 (-2, -3, -9) /
     X2 (-2, -3, -9) /
     X3 (-2, -3, -9) /
     X4 (-2, -3, -9) /
     X5 (-2, -3, -9) /
     X6 (-2, -3, -9) /
   .

EXECUTE.

* Create SPSS system file.

*SAVE OUTFILE="spss-filename.sav".
