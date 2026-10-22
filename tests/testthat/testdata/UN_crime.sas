/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 26462
 |        UNITED NATIONS SURVEYS OF CRIME TRENDS AND OPERATIONS OF
 |         CRIMINAL JUSTICE SYSTEMS SERIES, WAVES 1-10, 1970-2006
 |                   (DATASET 0001: WAVE 1, 1970-1975)
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
 | "c:\temp\26462-0001-data.txt").
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
  VALUE nnhom70n  -9='Blank' ;
  VALUE nnhom71n  -9='Blank' ;
  VALUE nnhom72n  -9='Blank' ;
  VALUE nnhom73n  -9='Blank' ;
  VALUE nnhom74n  -9='Blank' ;
  VALUE nnhom75n  -9='Blank' ;
  VALUE as70ffff  -9='Blank' ;
  VALUE as71ffff  -9='Blank' ;
  VALUE as72ffff  -9='Blank' ;
  VALUE as73ffff  -9='Blank' ;
  VALUE as74ffff  -9='Blank' ;
  VALUE as75x     -9='Blank' ;
  VALUE sex70fff  -9='Blank' ;
  VALUE sex71fff  -9='Blank' ;
  VALUE sex72fff  -9='Blank' ;
  VALUE sex73fff  -9='Blank' ;
  VALUE sex74fff  -9='Blank' ;
  VALUE sex75fff  -9='Blank' ;
  VALUE rob70fff  -9='Blank' ;
  VALUE rob71fff  -9='Blank' ;
  VALUE rob72fff  -9='Blank' ;
  VALUE rob73fff  -9='Blank' ;
  VALUE rob74fff  -9='Blank' ;
  VALUE rob75x    -9='Blank' ;
  VALUE theft70f  -9='Blank' ;
  VALUE theft71f  -9='Blank' ;
  VALUE theft72f  -9='Blank' ;
  VALUE theft73f  -9='Blank' ;
  VALUE theft74f  -9='Blank' ;
  VALUE theft75x  -9='Blank' ;
  VALUE fraud70f  -9='Blank' ;
  VALUE fraud71f  -9='Blank' ;
  VALUE fraud72f  -9='Blank' ;
  VALUE fraud73f  -9='Blank' ;
  VALUE fraud74f  -9='Blank' ;
  VALUE fraud75x  -9='Blank' ;
  VALUE kid70fff  -9='Blank' ;
  VALUE kid71fff  -9='Blank' ;
  VALUE kid72fff  -9='Blank' ;
  VALUE kid73fff  -9='Blank' ;
  VALUE kid74fff  -9='Blank' ;
  VALUE kid75x    -9='Blank' ;
  VALUE totc70ff  -9='Blank' ;
  VALUE totc71ff  -9='Blank' ;
  VALUE totc72ff  -9='Blank' ;
  VALUE totc73ff  -9='Blank' ;
  VALUE totc74ff  -9='Blank' ;
  VALUE totc75x   -9='Blank' ;
  VALUE dabuse7f  -9='Blank' ;
  VALUE dabuse0f  -9='Blank' ;
  VALUE dabuse1f  -9='Blank' ;
  VALUE dabuse2f  -9='Blank' ;
  VALUE dabuse3f  -9='Blank' ;
  VALUE dabuse4f  -9='Blank' ;
  VALUE tdrug70n  -9='Blank' ;
  VALUE tdrug71n  -9='Blank' ;
  VALUE tdrug72n  -9='Blank' ;
  VALUE tdrug73n  -9='Blank' ;
  VALUE tdrug74n  -9='Blank' ;
  VALUE tdrug75n  -9='Blank' ;
  VALUE brib70n   -9='Blank' ;
  VALUE brib71n   -9='Blank' ;
  VALUE brib72n   -9='Blank' ;
  VALUE brib73n   -9='Blank' ;
  VALUE brib74n   -9='Blank' ;
  VALUE brib75n   -9='Blank' ;
  VALUE ao70n     -9='Blank' ;
  VALUE ao71n     -9='Blank' ;
  VALUE ao72n     -9='Blank' ;
  VALUE ao73n     -9='Blank' ;
  VALUE ao74n     -9='Blank' ;
  VALUE ao75n     -9='Blank' ;
  VALUE jd70n     -9='Blank' ;
  VALUE jd71n     -9='Blank' ;
  VALUE jd72n     -9='Blank' ;
  VALUE jd73n     -9='Blank' ;
  VALUE jd74n     -9='Blank' ;
  VALUE jd75n     -9='Blank' ;
  VALUE pol73fff  -9='Blank' ;
  VALUE jug1973f  -9='Blank' ;
  VALUE pro73fff  -9='Blank' ;
  VALUE tcon701f  -9='Blank' ;
  VALUE tcon723f  -9='Blank' ;
  VALUE tcon745f  -9='Blank' ;
  VALUE mcon701f  -9='Blank' ;
  VALUE mcon723f  -9='Blank' ;
  VALUE mcon745f  -9='Blank' ;
  VALUE acon701f  -9='Blank' ;
  VALUE acon723f  -9='Blank' ;
  VALUE acon745f  -9='Blank' ;
  VALUE robc701f  -9='Blank' ;
  VALUE robc723f  -9='Blank' ;
  VALUE robc745f  -9='Blank' ;
  VALUE rapc701f  -9='Blank' ;
  VALUE rapc723f  -9='Blank' ;
  VALUE rapc745f  -9='Blank' ;
  VALUE thec701f  -9='Blank' ;
  VALUE thec723f  -9='Blank' ;
  VALUE thec745f  -9='Blank' ;
  VALUE frac701f  -9='Blank' ;
  VALUE frac723f  -9='Blank' ;
  VALUE frac745f  -9='Blank' ;
  VALUE drgc701f  -9='Blank' ;
  VALUE drgc723f  -9='Blank' ;
  VALUE drgc745f  -9='Blank' ;
  VALUE juvc701f  -9='Blank' ;
  VALUE juvc723f  -9='Blank' ;
  VALUE juvc745f  -9='Blank' ;
  VALUE pris701f  -9='Blank' ;
  VALUE pris723f  -9='Blank' ;
  VALUE pris745f  -9='Blank' ;
  VALUE pstf701f  -9='Blank' ;
  VALUE pstf723f  -9='Blank' ;
  VALUE pstf745f  -9='Blank' ;
  VALUE x2ffffff  -9='Blank' ;
  VALUE x3ffffff  -9='Blank' ;
  VALUE x4ffffff  -9='Blank' ;
  VALUE x5ffffff  -9='Blank' ;
  VALUE x6ffffff  -9='Blank' ;
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA;
INFILE "data-filename" LRECL=630;
INPUT
       ID 1-3                  COUNTRY $4-17
        NNHOM70N 18-22          NNHOM71N 23-27          NNHOM72N 28-32
        NNHOM73N 33-37          NNHOM74N 38-42          NNHOM75N 43-47
        AS70 48-53              AS71 54-59              AS72 60-65
        AS73 66-71              AS74 72-77              AS75X 78-83
        SEX70 84-88             SEX71 89-93             SEX72 94-98
        SEX73 99-103            SEX74 104-108           SEX75 109-113
        ROB70 114-119           ROB71 120-125           ROB72 126-131
        ROB73 132-137           ROB74 138-143           ROB75X 144-149
        THEFT70 150-156         THEFT71 157-163         THEFT72 164-170
        THEFT73 171-177         THEFT74 178-184         THEFT75X 185-192
        FRAUD70 193-198         FRAUD71 199-204         FRAUD72 205-210
        FRAUD73 211-216         FRAUD74 217-222         FRAUD75X 223-228
        KID70 229-232           KID71 233-236           KID72 237-240
        KID73 241-244           KID74 245-249           KID75X 250-253
        TOTC70 254-260          TOTC71 261-267          TOTC72 268-274
        TOTC73 275-281          TOTC74 282-288          TOTC75X 289-295
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
        POL73 460-465           JUG1973 466-470         PRO73 471-475
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
        X5 621-625              X6 626-630              ;


* SAS LABEL STATEMENT;

LABEL
   ID      = 'ID'
   COUNTRY = 'COUNTRY'
   NNHOM70N= 'MURDER CONVICTIONS, 1970'
   NNHOM71N= 'MURDER CONVICTIONS, 1971'
   NNHOM72N= 'MURDER CONVICTIONS, 1972'
   NNHOM73N= 'MURDER CONVICTIONS, 1973'
   NNHOM74N= 'MURDER CONVICTIONS, 1974'
   NNHOM75N= 'MURDER CONVICTIONS, 1975'
   AS70    = 'ASSAULT CONVICTIONS, 1970'
   AS71    = 'ASSAULT CONVICTIONS, 1971'
   AS72    = 'ASSAULT CONVICTIONS, 1972'
   AS73    = 'ASSAULT CONVICTIONS, 1973'
   AS74    = 'ASSAULT CONVICTIONS, 1974'
   AS75X   = 'ASSAULT CONVICTIONS, 1975'
   SEX70   = 'SEX CRIME CONVICTIONS, 1970'
   SEX71   = 'SEX CRIME CONVICTIONS, 1971'
   SEX72   = 'SEX CRIME CONVICTIONS, 1972'
   SEX73   = 'SEX CRIME CONVICTIONS, 1973'
   SEX74   = 'SEX CRIME CONVICTIONS, 1974'
   SEX75   = 'SEX CRIME CONVICTIONS, 1975'
   ROB70   = 'ROBBERY CONVICTIONS, 1970'
   ROB71   = 'ROBBERY CONVICTIONS, 1971'
   ROB72   = 'ROBBERY CONVICTIONS, 1972'
   ROB73   = 'ROBBERY CONVICTIONS, 1973'
   ROB74   = 'ROBBERY CONVICTIONS, 1974'
   ROB75X  = 'ROBBERY CONVICTIONS, 1975'
   THEFT70 = 'THEFT CONVICTIONS, 1970'
   THEFT71 = 'THEFT CONVICTIONS, 1971'
   THEFT72 = 'THEFT CONVICTIONS, 1972'
   THEFT73 = 'THEFT CONVICTIONS, 1973'
   THEFT74 = 'THEFT CONVICTIONS, 1974'
   THEFT75X= 'THEFT CONVICTIONS, 1975'
   FRAUD70 = 'FRAUD CONVICTIONS, 1970'
   FRAUD71 = 'FRAUD CONVICTIONS, 1971'
   FRAUD72 = 'FRAUD CONVICTIONS, 1972'
   FRAUD73 = 'FRAUD CONVICTIONS, 1973'
   FRAUD74 = 'FRAUD CONVICTIONS, 1974'
   FRAUD75X= 'FRAUD CONVICTIONS, 1975'
   KID70   = 'KIDNAPPING CONVICTIONS, 1970'
   KID71   = 'KIDNAPPING CONVICTIONS, 1971'
   KID72   = 'KIDNAPPING CONVICTIONS, 1972'
   KID73   = 'KIDNAPPING CONVICTIONS, 1973'
   KID74   = 'KIDNAPPING CONVICTIONS, 1974'
   KID75X  = 'KIDNAPPING CONVICTIONS, 1975'
   TOTC70  = 'TOTAL CRIME CONVICTIONS, 1970'
   TOTC71  = 'TOTAL CRIME CONVICTIONS, 1971'
   TOTC72  = 'TOTAL CRIME CONVICTIONS, 1972'
   TOTC73  = 'TOTAL CRIME CONVICTIONS, 1973'
   TOTC74  = 'TOTAL CRIME CONVICTIONS, 1974'
   TOTC75X = 'TOTAL CRIME CONVICTIONS, 1975'
   DABUSE70= 'DRUG USE CONVICTIONS, 1970'
   DABUSE71= 'DRUG USE CONVICTIONS, 1971'
   DABUSE72= 'DRUG USE CONVICTIONS, 1972'
   DABUSE73= 'DRUG USE CONVICTIONS, 1973'
   DABUSE74= 'DRUG USE CONVICTIONS, 1974'
   DABUSE75= 'DRUG USE CONVICTIONS, 1975'
   TDRUG70N= 'DRUG TRAFFICKING CONVICTIONS, 1970'
   TDRUG71N= 'DRUG TRAFFICKING CONVICTIONS, 1971'
   TDRUG72N= 'DRUG TRAFFICKING CONVICTIONS, 1972'
   TDRUG73N= 'DRUG TRAFFICKING CONVICTIONS, 1973'
   TDRUG74N= 'DRUG TRAFFICKING CONVICTIONS, 1974'
   TDRUG75N= 'DRUG TRAFFICKING CONVICTIONS, 1975'
   BRIB70N = 'BRIBERY CONVICTIONS, 1970'
   BRIB71N = 'BRIBERY CONVICTIONS, 1971'
   BRIB72N = 'BRIBERY CONVICTIONS, 1972'
   BRIB73N = 'BRIBERY CONVICTIONS, 1973'
   BRIB74N = 'BRIBERY CONVICTIONS, 1974'
   BRIB75N = 'BRIBERY CONVICTIONS, 1975'
   AO70N   = 'OFFENDER CONVICTIONS, 1970'
   AO71N   = 'OFFENDER CONVICTIONS, 1971'
   AO72N   = 'OFFENDER CONVICTIONS, 1972'
   AO73N   = 'OFFENDER CONVICTIONS, 1973'
   AO74N   = 'OFFENDER CONVICTIONS, 1974'
   AO75N   = 'OFFENDER CONVICTIONS, 1975'
   JD70N   = 'JUVENILE CONVICTIONS, 1970'
   JD71N   = 'JUVENILE CONVICTIONS, 1971'
   JD72N   = 'JUVENILE CONVICTIONS, 1972'
   JD73N   = 'JUVENILE CONVICTIONS, 1973'
   JD74N   = 'JUVENILE CONVICTIONS, 1974'
   JD75N   = 'JUVENILE CONVICTIONS, 1975'
   POL73   = 'POLICE, 1973'
   JUG1973 = 'JUDGES, 1973'
   PRO73   = 'PROSECUTORS, 1973'
   TCON701 = 'TOTAL CONVICTIONS, 1970-1971'
   TCON723 = 'TOTAL CONVICTIONS, 1972-1973'
   TCON745 = 'TOTAL CONVICTIONS, 1974-1975'
   MCON701 = 'TOTAL MALE CONVICTIONS, 1970-1971'
   MCON723 = 'TOTAL MALE CONVICTIONS, 1972-1973'
   MCON745 = 'TOTAL MALE CONVICTIONS, 1974-1975'
   ACON701 = 'TOTAL ADULT CONVICTIONS, 1970-1971'
   ACON723 = 'TOTAL ADULT CONVICTIONS, 1972-1973'
   ACON745 = 'TOTAL ADULT CONVICTIONS, 1974-1975'
   ROBC701 = 'ROBBERY CONVICTIONS, 1970-1971'
   ROBC723 = 'ROBBERY CONVICTIONS, 1972-1973'
   ROBC745 = 'ROBBERY CONVICTIONS, 1974-1975'
   RAPC701 = 'RAPE CONVICTIONS, 1970-1971'
   RAPC723 = 'RAPE CONVICTIONS, 1972-1973'
   RAPC745 = 'RAPE CONVICTIONS, 1974-1975'
   THEC701 = 'THEFT CONVICTIONS, 1970-1971'
   THEC723 = 'THEFT CONVICTIONS, 1972-1973'
   THEC745 = 'THEFT CONVICTIONS, 1974-1975'
   FRAC701 = 'FRAUD CONVICTIONS, 1970-1971'
   FRAC723 = 'FRAUD CONVICTIONS, 1972-1973'
   FRAC745 = 'FRAUD CONVICTIONS, 1974-1975'
   DRGC701 = 'DRUG CRIME CONVICTIONS, 1970-1971'
   DRGC723 = 'DRUG CRIME CONVICTIONS, 1972-1973'
   DRGC745 = 'DRUG CRIME CONVICTIONS, 1974-1975'
   JUVC701 = 'TOTAL JUVENILE CONVICTIONS, 1970-1971'
   JUVC723 = 'TOTAL JUVENILE CONVICTIONS, 1972-1973'
   JUVC745 = 'TOTAL JUVENILE CONVICTIONS, 1974-1975'
   PRIS701 = 'DAILY AVERAGE PRISON POPULATION, 1970-1971'
   PRIS723 = 'DAILY AVERAGE PRISON POPULATION, 1972-1973'
   PRIS745 = 'DAILY AVERAGE PRISON POPULATION, 1974-1975'
   PSTF701 = 'PRISON STAFF, 1970-1971'
   PSTF723 = 'PRISON STAFF, 1972-1973'
   PSTF745 = 'PRISON STAFF, 1974-1975'
   X2      = 'X2'
   X3      = 'X3'
   X4      = 'X4'
   X5      = 'X5'
   X6      = 'X6'
        ;


* USER-DEFINED MISSING VALUES RECODE TO SAS SYSMIS;

/*
   IF (NNHOM70N = -2 OR NNHOM70N = -3 OR NNHOM70N = -9) THEN NNHOM70N = .;
   IF (NNHOM71N = -2 OR NNHOM71N = -3 OR NNHOM71N = -9) THEN NNHOM71N = .;
   IF (NNHOM72N = -2 OR NNHOM72N = -3 OR NNHOM72N = -9) THEN NNHOM72N = .;
   IF (NNHOM73N = -2 OR NNHOM73N = -3 OR NNHOM73N = -9) THEN NNHOM73N = .;
   IF (NNHOM74N = -2 OR NNHOM74N = -3 OR NNHOM74N = -9) THEN NNHOM74N = .;
   IF (NNHOM75N = -2 OR NNHOM75N = -3 OR NNHOM75N = -9) THEN NNHOM75N = .;
   IF (AS70 = -2 OR AS70 = -3 OR AS70 = -9) THEN AS70 = .;
   IF (AS71 = -2 OR AS71 = -3 OR AS71 = -9) THEN AS71 = .;
   IF (AS72 = -2 OR AS72 = -3 OR AS72 = -9) THEN AS72 = .;
   IF (AS73 = -2 OR AS73 = -3 OR AS73 = -9) THEN AS73 = .;
   IF (AS74 = -2 OR AS74 = -3 OR AS74 = -9) THEN AS74 = .;
   IF (AS75X = -2 OR AS75X = -3 OR AS75X = -9) THEN AS75X = .;
   IF (SEX70 = -2 OR SEX70 = -3 OR SEX70 = -9) THEN SEX70 = .;
   IF (SEX71 = -2 OR SEX71 = -3 OR SEX71 = -9) THEN SEX71 = .;
   IF (SEX72 = -2 OR SEX72 = -3 OR SEX72 = -9) THEN SEX72 = .;
   IF (SEX73 = -2 OR SEX73 = -3 OR SEX73 = -9) THEN SEX73 = .;
   IF (SEX74 = -2 OR SEX74 = -3 OR SEX74 = -9) THEN SEX74 = .;
   IF (SEX75 = -2 OR SEX75 = -3 OR SEX75 = -9) THEN SEX75 = .;
   IF (ROB70 = -2 OR ROB70 = -3 OR ROB70 = -9) THEN ROB70 = .;
   IF (ROB71 = -2 OR ROB71 = -3 OR ROB71 = -9) THEN ROB71 = .;
   IF (ROB72 = -2 OR ROB72 = -3 OR ROB72 = -9) THEN ROB72 = .;
   IF (ROB73 = -2 OR ROB73 = -3 OR ROB73 = -9) THEN ROB73 = .;
   IF (ROB74 = -2 OR ROB74 = -3 OR ROB74 = -9) THEN ROB74 = .;
   IF (ROB75X = -2 OR ROB75X = -3 OR ROB75X = -9) THEN ROB75X = .;
   IF (THEFT70 = -2 OR THEFT70 = -3 OR THEFT70 = -9) THEN THEFT70 = .;
   IF (THEFT71 = -2 OR THEFT71 = -3 OR THEFT71 = -9) THEN THEFT71 = .;
   IF (THEFT72 = -2 OR THEFT72 = -3 OR THEFT72 = -9) THEN THEFT72 = .;
   IF (THEFT73 = -2 OR THEFT73 = -3 OR THEFT73 = -9) THEN THEFT73 = .;
   IF (THEFT74 = -2 OR THEFT74 = -3 OR THEFT74 = -9) THEN THEFT74 = .;
   IF (THEFT75X = -2 OR THEFT75X = -3 OR THEFT75X = -9) THEN THEFT75X = .;
   IF (FRAUD70 = -2 OR FRAUD70 = -3 OR FRAUD70 = -9) THEN FRAUD70 = .;
   IF (FRAUD71 = -2 OR FRAUD71 = -3 OR FRAUD71 = -9) THEN FRAUD71 = .;
   IF (FRAUD72 = -2 OR FRAUD72 = -3 OR FRAUD72 = -9) THEN FRAUD72 = .;
   IF (FRAUD73 = -2 OR FRAUD73 = -3 OR FRAUD73 = -9) THEN FRAUD73 = .;
   IF (FRAUD74 = -2 OR FRAUD74 = -3 OR FRAUD74 = -9) THEN FRAUD74 = .;
   IF (FRAUD75X = -2 OR FRAUD75X = -3 OR FRAUD75X = -9) THEN FRAUD75X = .;
   IF (KID70 = -2 OR KID70 = -3 OR KID70 = -9) THEN KID70 = .;
   IF (KID71 = -2 OR KID71 = -3 OR KID71 = -9) THEN KID71 = .;
   IF (KID72 = -2 OR KID72 = -3 OR KID72 = -9) THEN KID72 = .;
   IF (KID73 = -2 OR KID73 = -3 OR KID73 = -9) THEN KID73 = .;
   IF (KID74 = -2 OR KID74 = -3 OR KID74 = -9) THEN KID74 = .;
   IF (KID75X = -2 OR KID75X = -3 OR KID75X = -9) THEN KID75X = .;
   IF (TOTC70 = -2 OR TOTC70 = -3 OR TOTC70 = -9) THEN TOTC70 = .;
   IF (TOTC71 = -2 OR TOTC71 = -3 OR TOTC71 = -9) THEN TOTC71 = .;
   IF (TOTC72 = -2 OR TOTC72 = -3 OR TOTC72 = -9) THEN TOTC72 = .;
   IF (TOTC73 = -2 OR TOTC73 = -3 OR TOTC73 = -9) THEN TOTC73 = .;
   IF (TOTC74 = -2 OR TOTC74 = -3 OR TOTC74 = -9) THEN TOTC74 = .;
   IF (TOTC75X = -2 OR TOTC75X = -3 OR TOTC75X = -9) THEN TOTC75X = .;
   IF (DABUSE70 = -2 OR DABUSE70 = -3 OR DABUSE70 = -9) THEN DABUSE70 = .;
   IF (DABUSE71 = -2 OR DABUSE71 = -3 OR DABUSE71 = -9) THEN DABUSE71 = .;
   IF (DABUSE72 = -2 OR DABUSE72 = -3 OR DABUSE72 = -9) THEN DABUSE72 = .;
   IF (DABUSE73 = -2 OR DABUSE73 = -3 OR DABUSE73 = -9) THEN DABUSE73 = .;
   IF (DABUSE74 = -2 OR DABUSE74 = -3 OR DABUSE74 = -9) THEN DABUSE74 = .;
   IF (DABUSE75 = -2 OR DABUSE75 = -3 OR DABUSE75 = -9) THEN DABUSE75 = .;
   IF (TDRUG70N = -2 OR TDRUG70N = -3 OR TDRUG70N = -9) THEN TDRUG70N = .;
   IF (TDRUG71N = -2 OR TDRUG71N = -3 OR TDRUG71N = -9) THEN TDRUG71N = .;
   IF (TDRUG72N = -2 OR TDRUG72N = -3 OR TDRUG72N = -9) THEN TDRUG72N = .;
   IF (TDRUG73N = -2 OR TDRUG73N = -3 OR TDRUG73N = -9) THEN TDRUG73N = .;
   IF (TDRUG74N = -2 OR TDRUG74N = -3 OR TDRUG74N = -9) THEN TDRUG74N = .;
   IF (TDRUG75N = -2 OR TDRUG75N = -3 OR TDRUG75N = -9) THEN TDRUG75N = .;
   IF (BRIB70N = -2 OR BRIB70N = -3 OR BRIB70N = -9) THEN BRIB70N = .;
   IF (BRIB71N = -2 OR BRIB71N = -3 OR BRIB71N = -9) THEN BRIB71N = .;
   IF (BRIB72N = -2 OR BRIB72N = -3 OR BRIB72N = -9) THEN BRIB72N = .;
   IF (BRIB73N = -2 OR BRIB73N = -3 OR BRIB73N = -9) THEN BRIB73N = .;
   IF (BRIB74N = -2 OR BRIB74N = -3 OR BRIB74N = -9) THEN BRIB74N = .;
   IF (BRIB75N = -2 OR BRIB75N = -3 OR BRIB75N = -9) THEN BRIB75N = .;
   IF (AO70N = -2 OR AO70N = -3 OR AO70N = -9) THEN AO70N = .;
   IF (AO71N = -2 OR AO71N = -3 OR AO71N = -9) THEN AO71N = .;
   IF (AO72N = -2 OR AO72N = -3 OR AO72N = -9) THEN AO72N = .;
   IF (AO73N = -2 OR AO73N = -3 OR AO73N = -9) THEN AO73N = .;
   IF (AO74N = -2 OR AO74N = -3 OR AO74N = -9) THEN AO74N = .;
   IF (AO75N = -2 OR AO75N = -3 OR AO75N = -9) THEN AO75N = .;
   IF (JD70N = -2 OR JD70N = -3 OR JD70N = -9) THEN JD70N = .;
   IF (JD71N = -2 OR JD71N = -3 OR JD71N = -9) THEN JD71N = .;
   IF (JD72N = -2 OR JD72N = -3 OR JD72N = -9) THEN JD72N = .;
   IF (JD73N = -2 OR JD73N = -3 OR JD73N = -9) THEN JD73N = .;
   IF (JD74N = -2 OR JD74N = -3 OR JD74N = -9) THEN JD74N = .;
   IF (JD75N = -2 OR JD75N = -3 OR JD75N = -9) THEN JD75N = .;
   IF (POL73 = -2 OR POL73 = -3 OR POL73 = -9) THEN POL73 = .;
   IF (JUG1973 = -2 OR JUG1973 = -3 OR JUG1973 = -9) THEN JUG1973 = .;
   IF (PRO73 = -2 OR PRO73 = -3 OR PRO73 = -9) THEN PRO73 = .;
   IF (TCON701 = -2 OR TCON701 = -3 OR TCON701 = -9) THEN TCON701 = .;
   IF (TCON723 = -2 OR TCON723 = -3 OR TCON723 = -9) THEN TCON723 = .;
   IF (TCON745 = -2 OR TCON745 = -3 OR TCON745 = -9) THEN TCON745 = .;
   IF (MCON701 = -2 OR MCON701 = -3 OR MCON701 = -9) THEN MCON701 = .;
   IF (MCON723 = -2 OR MCON723 = -3 OR MCON723 = -9) THEN MCON723 = .;
   IF (MCON745 = -2 OR MCON745 = -3 OR MCON745 = -9) THEN MCON745 = .;
   IF (ACON701 = -2 OR ACON701 = -3 OR ACON701 = -9) THEN ACON701 = .;
   IF (ACON723 = -2 OR ACON723 = -3 OR ACON723 = -9) THEN ACON723 = .;
   IF (ACON745 = -2 OR ACON745 = -3 OR ACON745 = -9) THEN ACON745 = .;
   IF (ROBC701 = -2 OR ROBC701 = -3 OR ROBC701 = -9) THEN ROBC701 = .;
   IF (ROBC723 = -2 OR ROBC723 = -3 OR ROBC723 = -9) THEN ROBC723 = .;
   IF (ROBC745 = -2 OR ROBC745 = -3 OR ROBC745 = -9) THEN ROBC745 = .;
   IF (RAPC701 = -2 OR RAPC701 = -3 OR RAPC701 = -9) THEN RAPC701 = .;
   IF (RAPC723 = -2 OR RAPC723 = -3 OR RAPC723 = -9) THEN RAPC723 = .;
   IF (RAPC745 = -2 OR RAPC745 = -3 OR RAPC745 = -9) THEN RAPC745 = .;
   IF (THEC701 = -2 OR THEC701 = -3 OR THEC701 = -9) THEN THEC701 = .;
   IF (THEC723 = -2 OR THEC723 = -3 OR THEC723 = -9) THEN THEC723 = .;
   IF (THEC745 = -2 OR THEC745 = -3 OR THEC745 = -9) THEN THEC745 = .;
   IF (FRAC701 = -2 OR FRAC701 = -3 OR FRAC701 = -9) THEN FRAC701 = .;
   IF (FRAC723 = -2 OR FRAC723 = -3 OR FRAC723 = -9) THEN FRAC723 = .;
   IF (FRAC745 = -2 OR FRAC745 = -3 OR FRAC745 = -9) THEN FRAC745 = .;
   IF (DRGC701 = -2 OR DRGC701 = -3 OR DRGC701 = -9) THEN DRGC701 = .;
   IF (DRGC723 = -2 OR DRGC723 = -3 OR DRGC723 = -9) THEN DRGC723 = .;
   IF (DRGC745 = -2 OR DRGC745 = -3 OR DRGC745 = -9) THEN DRGC745 = .;
   IF (JUVC701 = -2 OR JUVC701 = -3 OR JUVC701 = -9) THEN JUVC701 = .;
   IF (JUVC723 = -2 OR JUVC723 = -3 OR JUVC723 = -9) THEN JUVC723 = .;
   IF (JUVC745 = -2 OR JUVC745 = -3 OR JUVC745 = -9) THEN JUVC745 = .;
   IF (PRIS701 = -2 OR PRIS701 = -3 OR PRIS701 = -9) THEN PRIS701 = .;
   IF (PRIS723 = -2 OR PRIS723 = -3 OR PRIS723 = -9) THEN PRIS723 = .;
   IF (PRIS745 = -2 OR PRIS745 = -3 OR PRIS745 = -9) THEN PRIS745 = .;
   IF (PSTF701 = -2 OR PSTF701 = -3 OR PSTF701 = -9) THEN PSTF701 = .;
   IF (PSTF723 = -2 OR PSTF723 = -3 OR PSTF723 = -9) THEN PSTF723 = .;
   IF (PSTF745 = -2 OR PSTF745 = -3 OR PSTF745 = -9) THEN PSTF745 = .;
   IF (X2 = -2 OR X2 = -3 OR X2 = -9) THEN X2 = .;
   IF (X3 = -2 OR X3 = -3 OR X3 = -9) THEN X3 = .;
   IF (X4 = -2 OR X4 = -3 OR X4 = -9) THEN X4 = .;
   IF (X5 = -2 OR X5 = -3 OR X5 = -9) THEN X5 = .;
   IF (X6 = -2 OR X6 = -3 OR X6 = -9) THEN X6 = .;
*/


* SAS FORMAT STATEMENT;

/*
  FORMAT NNHOM70N nnhom70n. NNHOM71N nnhom71n. NNHOM72N nnhom72n.
         NNHOM73N nnhom73n. NNHOM74N nnhom74n. NNHOM75N nnhom75n.
         AS70 as70ffff. AS71 as71ffff. AS72 as72ffff.
         AS73 as73ffff. AS74 as74ffff. AS75X as75x.
         SEX70 sex70fff. SEX71 sex71fff. SEX72 sex72fff.
         SEX73 sex73fff. SEX74 sex74fff. SEX75 sex75fff.
         ROB70 rob70fff. ROB71 rob71fff. ROB72 rob72fff.
         ROB73 rob73fff. ROB74 rob74fff. ROB75X rob75x.
         THEFT70 theft70f. THEFT71 theft71f. THEFT72 theft72f.
         THEFT73 theft73f. THEFT74 theft74f. THEFT75X theft75x.
         FRAUD70 fraud70f. FRAUD71 fraud71f. FRAUD72 fraud72f.
         FRAUD73 fraud73f. FRAUD74 fraud74f. FRAUD75X fraud75x.
         KID70 kid70fff. KID71 kid71fff. KID72 kid72fff.
         KID73 kid73fff. KID74 kid74fff. KID75X kid75x.
         TOTC70 totc70ff. TOTC71 totc71ff. TOTC72 totc72ff.
         TOTC73 totc73ff. TOTC74 totc74ff. TOTC75X totc75x.
         DABUSE70 dabuse7f. DABUSE71 dabuse0f. DABUSE72 dabuse1f.
         DABUSE73 dabuse2f. DABUSE74 dabuse3f. DABUSE75 dabuse4f.
         TDRUG70N tdrug70n. TDRUG71N tdrug71n. TDRUG72N tdrug72n.
         TDRUG73N tdrug73n. TDRUG74N tdrug74n. TDRUG75N tdrug75n.
         BRIB70N brib70n. BRIB71N brib71n. BRIB72N brib72n.
         BRIB73N brib73n. BRIB74N brib74n. BRIB75N brib75n.
         AO70N ao70n. AO71N ao71n. AO72N ao72n.
         AO73N ao73n. AO74N ao74n. AO75N ao75n.
         JD70N jd70n. JD71N jd71n. JD72N jd72n.
         JD73N jd73n. JD74N jd74n. JD75N jd75n.
         POL73 pol73fff. JUG1973 jug1973f. PRO73 pro73fff.
         TCON701 tcon701f. TCON723 tcon723f. TCON745 tcon745f.
         MCON701 mcon701f. MCON723 mcon723f. MCON745 mcon745f.
         ACON701 acon701f. ACON723 acon723f. ACON745 acon745f.
         ROBC701 robc701f. ROBC723 robc723f. ROBC745 robc745f.
         RAPC701 rapc701f. RAPC723 rapc723f. RAPC745 rapc745f.
         THEC701 thec701f. THEC723 thec723f. THEC745 thec745f.
         FRAC701 frac701f. FRAC723 frac723f. FRAC745 frac745f.
         DRGC701 drgc701f. DRGC723 drgc723f. DRGC745 drgc745f.
         JUVC701 juvc701f. JUVC723 juvc723f. JUVC745 juvc745f.
         PRIS701 pris701f. PRIS723 pris723f. PRIS745 pris745f.
         PSTF701 pstf701f. PSTF723 pstf723f. PSTF745 pstf745f.
         X2 x2ffffff. X3 x3ffffff. X4 x4ffffff.
         X5 x5ffffff. X6 x6ffffff.  ;
*/

RUN ;
