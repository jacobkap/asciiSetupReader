/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 29662
 |                       ANNUAL PAROLE SURVEY, 1994
 |                            (DATASET 0001: )
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
 | "c:\temp\29662-0001-data.txt").
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
  VALUE stateid   0='(0) Federal' 1='(1) Alabama' 2='(2) Alaska' 4='(4) Arizona' 5='(5) Arkansas'
                  6='(6) California' 8='(8) Colorado' 9='(9) Connecticut' 10='(10) Delaware'
                  11='(11) District of Columbia' 12='(12) Florida' 13='(13) Georgia'
                  15='(15) Hawaii' 16='(16) Idaho' 17='(17) Illinois' 18='(18) Indiana' 19='(19) Iowa'
                  20='(20) Kansas' 21='(21) Kentucky' 22='(22) Louisiana' 23='(23) Maine'
                  24='(24) Maryland' 25='(25) Massachusetts' 26='(26) Michigan'
                  27='(27) Minnesota' 28='(28) Mississippi' 29='(29) Missouri' 30='(30) Montana'
                  31='(31) Nebraska' 32='(32) Nevada' 33='(33) New Hampshire'
                  34='(34) New Jersey' 35='(35) New Mexico' 36='(36) New York'
                  37='(37) North Carolina' 38='(38) North Dakota' 39='(39) Ohio'
                  40='(40) Oklahoma' 41='(41) Oregon' 42='(42) Pennsylvania'
                  44='(44) Rhode Island' 45='(45) South Carolina' 46='(46) South Dakota'
                  47='(47) Tennessee' 48='(48) Texas' 49='(49) Utah' 50='(50) Vermont'
                  51='(51) Virginia' 53='(53) Washington' 54='(54) West Virginia'
                  55='(55) Wisconsin' 56='(56) Wyoming' ;
  VALUE $state    'AK'='(AK) Alaska' 'AL'='(AL) Alabama' 'AR'='(AR) Arkansas' 'AZ'='(AZ) Arizona'
                  'CA'='(CA) California' 'CO'='(CO) Colorado' 'CT'='(CT) Connecticut'
                  'DC'='(DC) District of Columbia' 'DE'='(DE) Delaware' 'FE'='(FE) Federal'
                  'FL'='(FL) Florida' 'GA'='(GA) Georgia' 'HI'='(HI) Hawaii' 'IA'='(IA) Iowa'
                  'ID'='(ID) Idaho' 'IL'='(IL) Illinois' 'IN'='(IN) Indiana' 'KS'='(KS) Kansas'
                  'KY'='(KY) Kentucky' 'LA'='(LA) Louisiana' 'MA'='(MA) Massachusetts'
                  'MD'='(MD) Maryland' 'ME'='(ME) Maine' 'MI'='(MI) Michigan'
                  'MN'='(MN) Minnesota' 'MO'='(MO) Missouri' 'MS'='(MS) Mississippi'
                  'MT'='(MT) Montana' 'NC'='(NC) North Carolina' 'ND'='(ND) North Dakota'
                  'NE'='(NE) Nebraska' 'NH'='(NH) New Hampshire' 'NJ'='(NJ) New Jersey'
                  'NM'='(NM) New Mexico' 'NV'='(NV) Nevada' 'NY'='(NY) New York' 'OH'='(OH) Ohio'
                  'OK'='(OK) Oklahoma' 'OR'='(OR) Oregon' 'PA'='(PA) Pennsylvania'
                  'RI'='(RI) Rhode Island' 'SC'='(SC) South Carolina'
                  'SD'='(SD) South Dakota' 'TN'='(TN) Tennessee' 'TX'='(TX) Texas'
                  'UT'='(UT) Utah' 'VA'='(VA) Virginia' 'VT'='(VT) Vermont'
                  'WA'='(WA) Washington' 'WI'='(WI) Wisconsin' 'WV'='(WV) West Virginia'
                  'WY'='(WY) Wyoming' ;
  VALUE totbeg    -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE endisrel  -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE enmanrel  -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE enreinst  -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE othen     -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE toten     -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE excom     -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE exincnew  -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE exincrev  -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE exincoth  -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE extrans   -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE exdth     -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE exoth     -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE totex     -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE totend    -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE male      -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE feml      -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE totgend   -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE white     -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE black     -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE aminalk   -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE ashawpac  -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE addrace   -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE totrace   -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE hisp      -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE nonhisp   -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE tothisp   -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE maxyear   -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE maxmore   -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE totmax    -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE active    -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE inactive  -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE absnd     -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE outstate  -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE othstat   -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE totstat   -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE $isp      'N'='(N) No program' 'Y'='(Y) Yes' ;
  VALUE ispnum    -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE $ispin    'DK'='(DK) Not known/Don''t know' 'N'='(N) No' 'NA'='(NA) Not applicable'
                  'Y'='(Y) Yes' ;
  VALUE $em       'N'='(N) No program' 'Y'='(Y) Yes' ;
  VALUE emnum     -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE $emin     'DK'='(DK) Not known/Don''t know' 'N'='(N) No' 'NA'='(NA) Not applicable'
                  'Y'='(Y) Yes' ;
  VALUE $boot     'N'='(N) No program' 'Y'='(Y) Yes' ;
  VALUE bootnum   -9='(-9) Not known/Don''t know' -8='(-8) Not applicable' ;
  VALUE $bootin   'DK'='(DK) Not known/Don''t know' 'N'='(N) No' 'NA'='(NA) Not applicable'
                  'Y'='(Y) Yes' ;
  VALUE $locjail  'DK'='(DK) Not known/Don''t know' 'N'='(N) No' 'Y'='(Y) Yes' ;
  VALUE $locjaif  'DK'='(DK) Not known/Don''t know' 'N'='(N) No' 'NA'='(NA) Not applicable'
                  'Y'='(Y) Yes' ;
  VALUE $othpar   'DK'='(DK) Not known/Don''t know' 'N'='(N) No' 'Y'='(Y) Yes' ;
  VALUE $endofyf  'DK'='(DK) Not known/Don''t know' 'N'='(N) No' 'Y'='(Y) Yes' ;
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA;
INFILE "data-filename" LRECL=301;
INPUT
       STATEID 1-2             STATE $3-4
        TOTBEG 5-10             ENDISREL 11-16          ENMANREL 17-22
        ENREINST 23-28          OTHEN 29-34             TOTEN 35-40
        EXCOM 41-46             EXINCNEW 47-52          EXINCREV 53-58
        EXINCOTH 59-64          EXTRANS 65-70           EXDTH 71-76
        EXOTH 77-82             TOTEX 83-88             TOTEND 89-94
        MALE 95-100             FEML 101-106            TOTGEND 107-112
        WHITE 113-118           BLACK 119-124           AMINALK 125-130
        ASHAWPAC 131-136        ADDRACE 137-142         TOTRACE 143-148
        HISP 149-154            NONHISP 155-160         TOTHISP 161-166
        MAXYEAR 167-172         MAXMORE 173-178         TOTMAX 179-184
        ACTIVE 185-190          INACTIVE 191-196        ABSND 197-202
        OUTSTATE 203-208        OTHSTAT 209-214         TOTSTAT 215-220
        ISP $221                ISPNUM 222-227          ISPIN $228-229
        EM $230                 EMNUM 231-236           EMIN $237-238
        BOOT $239               BOOTNUM 240-245         BOOTIN $246-247
        LOCJAIL $248-249        LOCJAILIN $250-251      OTHPAR $252-253
        ENDOFYEAR $254-255      UNKEN 256-261           UNKEX 262-267
        UNKGEND 268-273         UNKRACE2 274-279        UNKHISP 280-285
        UNKMAX 286-291          UNKSTAT 292-297         SUPVRATE 298-301
        ;


* SAS LABEL STATEMENT;

LABEL
   STATEID = 'STATE FIPS IDENTIFICATION CODE'
   STATE   = 'STATE TWO-CHARACTER IDENTIFICATION ABBREVIATION'
   TOTBEG  = 'PAROLE POPULATION BEGINNING OF YEAR'
   ENDISREL= 'ENTRIES TO PAROLE BY DISCRETIONARY RELEASE FROM PRISON'
   ENMANREL= 'ENTRIES TO PAROLE BY MANDATORY RELEASE FROM PRISON'
   ENREINST= 'ENTRIES TO PAROLE BY REINSTATEMENT'
   OTHEN   = 'OTHER ENTRIES TO PAROLE'
   TOTEN   = 'TOTAL ENTRIES TO PAROLE'
   EXCOM   = 'COMPLETIONS'
   EXINCNEW= 'RETURNED TO INCARCERATION WITH NEW SENTENCE'
   EXINCREV= 'RETURNED TO INCARCERATION WITH REVOCATION, NO NEW SENTENCE'
   EXINCOTH= 'OTHER RETURNED TO INCARCERATION'
   EXTRANS = 'TRANSFERRED TO ANOTHER PAROLE JURISDICTION'
   EXDTH   = 'DEATH'
   EXOTH   = 'OTHER DISCHARGES'
   TOTEX   = 'TOTAL DISCHARGES'
   TOTEND  = 'PAROLE POPULATION END OF YEAR'
   MALE    = 'MALE'
   FEML    = 'FEMALE'
   TOTGEND = 'TOTAL GENDER'
   WHITE   = 'WHITE'
   BLACK   = 'BLACK'
   AMINALK = 'AMERICAN INDIAN/ALASKA NATIVE'
   ASHAWPAC= 'ASIAN/PACIFIC ISLANDER'
   ADDRACE = 'ADDITIONAL CATEGORIES FOR RACE'
   TOTRACE = 'TOTAL RACE'
   HISP    = 'HISPANIC ORIGIN'
   NONHISP = 'NOT OF HISPANIC ORIGIN'
   TOTHISP = 'TOTAL HISPANIC OR NON-HISPANIC ORIGIN'
   MAXYEAR = 'MAXIMUM INCARCERATION SENTENCE ONE YEAR OR LESS'
   MAXMORE = 'MAXIMUM INCARCERATION SENTENCE MORE THAN ONE YEAR'
   TOTMAX  = 'TOTAL MAXIMUM INCARCERATION SENTENCE'
   ACTIVE  = 'ACTIVE SUPERVISION STATUS'
   INACTIVE= 'INACTIVE STATUS'
   ABSND   = 'ABSCONDER STATUS'
   OUTSTATE= 'SUPERVISED OUT OF STATE STATUS'
   OTHSTAT = 'OTHER STATUS'
   TOTSTAT = 'TOTAL SUPERVISION STATUS'
   ISP     = 'INTENSIVE SUPERVISION PROGRAM (ISP)'
   ISPNUM  = 'NUMBER OF PAROLEES IN ISP'
   ISPIN   = 'NUMBER OF PAROLEES IN ISP, INCLUDED IN ITEM4'
   EM      = 'ELECTRONIC MONITORING (EM)'
   EMNUM   = 'NUMBER OF PAROLEES ON EM'
   EMIN    = 'NUMBER OF PAROLEES ON EM, INCLUDED IN ITEM4'
   BOOT    = 'BOOTCAMP PROGRAM'
   BOOTNUM = 'NUMBER OF PAROLEES IN BOOTCAMP PROGRAM'
   BOOTIN  = 'NUMBER OF PAROLEES IN BOOTCAMP PROGRAM, INCLUDED IN ITEM4'
   LOCJAIL = 'SUPERVISED FROM LOCAL JAILS'
   LOCJAILIN= 'NUMBER OF PAROLEES FROM LOCAL JAILS, INCLUDED IN ITEM4'
   OTHPAR  = 'OTHER PAROLEES'
   ENDOFYEAR= 'INFORMATION REPRESENTS END-OF-YEAR DATA'
   UNKEN   = 'CALCULATED UNKNOWNS FOR ENTRIES (ITEM 2)'
   UNKEX   = 'CALCULATED UNKNOWNS FOR EXITS (ITEM 3)'
   UNKGEND = 'CALCULATED UNKNOWNS FOR GENDER (ITEM 5)'
   UNKRACE2= 'CALCULATED UNKNOWNS FOR RACE (ITEM 6)'
   UNKHISP = 'CALCULATED UNKNOWNS FOR HISPANIC CATEGORY (ITEM 7)'
   UNKMAX  = 'CALCULATED UNKNOWNS FOR MAXIMUM INCARCERATION SENTENCE (ITEM 8)'
   UNKSTAT = 'CALCULATED UNKNOWNS FOR SUPERVISION STATUS (ITEM 9)'
   SUPVRATE= 'CALCULATED RATE, NUMBER ON PAROLE ON 12/31/1994 PER 100,000 RESIDENTS'
        ;


* USER-DEFINED MISSING VALUES RECODE TO SAS SYSMIS;

/*
   IF (TOTBEG = -8 OR TOTBEG = -9) THEN TOTBEG = .;
   IF (ENDISREL = -8 OR ENDISREL = -9) THEN ENDISREL = .;
   IF (ENMANREL = -8 OR ENMANREL = -9) THEN ENMANREL = .;
   IF (ENREINST = -8 OR ENREINST = -9) THEN ENREINST = .;
   IF (OTHEN = -8 OR OTHEN = -9) THEN OTHEN = .;
   IF (TOTEN = -8 OR TOTEN = -9) THEN TOTEN = .;
   IF (EXCOM = -8 OR EXCOM = -9) THEN EXCOM = .;
   IF (EXINCNEW = -8 OR EXINCNEW = -9) THEN EXINCNEW = .;
   IF (EXINCREV = -8 OR EXINCREV = -9) THEN EXINCREV = .;
   IF (EXINCOTH = -8 OR EXINCOTH = -9) THEN EXINCOTH = .;
   IF (EXTRANS = -8 OR EXTRANS = -9) THEN EXTRANS = .;
   IF (EXDTH = -8 OR EXDTH = -9) THEN EXDTH = .;
   IF (EXOTH = -8 OR EXOTH = -9) THEN EXOTH = .;
   IF (TOTEX = -8 OR TOTEX = -9) THEN TOTEX = .;
   IF (TOTEND = -8 OR TOTEND = -9) THEN TOTEND = .;
   IF (MALE = -8 OR MALE = -9) THEN MALE = .;
   IF (FEML = -8 OR FEML = -9) THEN FEML = .;
   IF (TOTGEND = -8 OR TOTGEND = -9) THEN TOTGEND = .;
   IF (WHITE = -8 OR WHITE = -9) THEN WHITE = .;
   IF (BLACK = -8 OR BLACK = -9) THEN BLACK = .;
   IF (AMINALK = -8 OR AMINALK = -9) THEN AMINALK = .;
   IF (ASHAWPAC = -8 OR ASHAWPAC = -9) THEN ASHAWPAC = .;
   IF (ADDRACE = -8 OR ADDRACE = -9) THEN ADDRACE = .;
   IF (TOTRACE = -8 OR TOTRACE = -9) THEN TOTRACE = .;
   IF (HISP = -8 OR HISP = -9) THEN HISP = .;
   IF (NONHISP = -8 OR NONHISP = -9) THEN NONHISP = .;
   IF (TOTHISP = -8 OR TOTHISP = -9) THEN TOTHISP = .;
   IF (MAXYEAR = -8 OR MAXYEAR = -9) THEN MAXYEAR = .;
   IF (MAXMORE = -8 OR MAXMORE = -9) THEN MAXMORE = .;
   IF (TOTMAX = -8 OR TOTMAX = -9) THEN TOTMAX = .;
   IF (ACTIVE = -8 OR ACTIVE = -9) THEN ACTIVE = .;
   IF (INACTIVE = -8 OR INACTIVE = -9) THEN INACTIVE = .;
   IF (ABSND = -8 OR ABSND = -9) THEN ABSND = .;
   IF (OUTSTATE = -8 OR OUTSTATE = -9) THEN OUTSTATE = .;
   IF (OTHSTAT = -8 OR OTHSTAT = -9) THEN OTHSTAT = .;
   IF (TOTSTAT = -8 OR TOTSTAT = -9) THEN TOTSTAT = .;
   IF (ISPNUM = -8 OR ISPNUM = -9) THEN ISPNUM = .;
   IF (ISPIN = 'DK' OR ISPIN = 'NA') THEN ISPIN = '';
   IF (EMNUM = -8 OR EMNUM = -9) THEN EMNUM = .;
   IF (EMIN = 'DK' OR EMIN = 'NA') THEN EMIN = '';
   IF (BOOTNUM = -8 OR BOOTNUM = -9) THEN BOOTNUM = .;
   IF (BOOTIN = 'DK' OR BOOTIN = 'NA') THEN BOOTIN = '';
   IF (LOCJAIL = 'DK') THEN LOCJAIL = '';
   IF (LOCJAILIN = 'DK' OR LOCJAILIN = 'NA') THEN LOCJAILIN = '';
   IF (OTHPAR = 'DK') THEN OTHPAR = '';
   IF (ENDOFYEAR = 'DK') THEN ENDOFYEAR = '';
*/


* SAS FORMAT STATEMENT;

/*
  FORMAT STATEID stateid. STATE $state. TOTBEG totbeg.
         ENDISREL endisrel. ENMANREL enmanrel. ENREINST enreinst.
         OTHEN othen. TOTEN toten. EXCOM excom.
         EXINCNEW exincnew. EXINCREV exincrev. EXINCOTH exincoth.
         EXTRANS extrans. EXDTH exdth. EXOTH exoth.
         TOTEX totex. TOTEND totend. MALE male.
         FEML feml. TOTGEND totgend. WHITE white.
         BLACK black. AMINALK aminalk. ASHAWPAC ashawpac.
         ADDRACE addrace. TOTRACE totrace. HISP hisp.
         NONHISP nonhisp. TOTHISP tothisp. MAXYEAR maxyear.
         MAXMORE maxmore. TOTMAX totmax. ACTIVE active.
         INACTIVE inactive. ABSND absnd. OUTSTATE outstate.
         OTHSTAT othstat. TOTSTAT totstat. ISP $isp.
         ISPNUM ispnum. ISPIN $ispin. EM $em.
         EMNUM emnum. EMIN $emin. BOOT $boot.
         BOOTNUM bootnum. BOOTIN $bootin. LOCJAIL $locjail.
         LOCJAILIN $locjaif. OTHPAR $othpar. ENDOFYEAR $endofyf.
          ;
*/

RUN ;
