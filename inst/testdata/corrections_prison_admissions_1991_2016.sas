/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 37021
 |           NATIONAL CORRECTIONS REPORTING PROGRAM, 1991-2016:
 |                           SELECTED VARIABLES
 |                   (DATASET 0002: PRISON ADMISSIONS)
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
 | "c:\temp\37021-0002-data.txt").
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
VALUE raceffff  1='(1) White, non-Hispanic' 2='(2) Black, non-Hispanic'
                3='(3) Hispanic, any race' 4='(4) Other race(s), non-Hispanic' 9='(9) Missing';
VALUE statefff  1='(01) Alabama' 2='(02) Alaska' 4='(04) Arizona' 5='(05) Arkansas'
                6='(06) California' 8='(08) Colorado' 9='(09) Connecticut' 10='(10) Delaware'
                11='(11) District of Columbia' 12='(12) Florida' 13='(13) Georgia' 15='(15) Hawaii'
                16='(16) Idaho' 17='(17) Illinois' 18='(18) Indiana' 19='(19) Iowa' 20='(20) Kansas'
                21='(21) Kentucky' 22='(22) Louisiana' 23='(23) Maine' 24='(24) Maryland'
                25='(25) Massachusetts' 26='(26) Michigan' 27='(27) Minnesota' 28='(28) Mississippi'
                29='(29) Missouri' 30='(30) Montana' 31='(31) Nebraska' 32='(32) Nevada'
                33='(33) New Hampshire' 34='(34) New Jersey' 35='(35) New Mexico' 36='(36) New York'
                37='(37) North Carolina' 38='(38) North Dakota' 39='(39) Ohio' 40='(40) Oklahoma'
                41='(41) Oregon' 42='(42) Pennsylvania' 44='(44) Rhode Island' 45='(45) South Carolina'
                46='(46) South Dakota' 47='(47) Tennessee' 48='(48) Texas' 49='(49) Utah'
                50='(50) Vermont' 51='(51) Virginia' 53='(53) Washington' 54='(54) West Virginia'
                55='(55) Wisconsin' 56='(56) Wyoming';
VALUE admtypef  1='(1) New court commitment' 2='(2) Parole return/revocation'
                3='(3) Other admission (including unsentenced, transfer, AWOL/escapee return)'
                9='(9) Missing';
VALUE sexfffff  1='(1) Male' 2='(2) Female';
VALUE ageadmif  1='(1) 18-24 years' 2='(2) 25-34 years' 3='(3) 35-44 years'
                4='(4) 45-54 years' 5='(5) 55+ years' 9='(9) Missing';
VALUE sentlgtf  0='(0) < 1 year' 1='(1) 1-1.9 years' 2='(2) 2-4.9 years'
                3='(3) 5-9.9 years' 4='(4) 10-24.9 years' 5='(5) >=25 years'
                6='(6) Life, LWOP, Life plus additional years, Death' 9='(9) Missing';
VALUE offdetaf  1='(01) Murder (including non-negligent manslaughter)'
                2='(02) Negligent manslaughter' 3='(03) Rape/sexual assault' 4='(04) Robbery'
                5='(05) Aggravated or simple assault' 6='(06) Other violent offenses' 7='(07) Burglary'
                8='(08) Larceny' 9='(09) Motor vehicle theft' 10='(10) Fraud'
                11='(11) Other property offenses'
                12='(12) Drugs (includes possession, distribution, trafficking, other)'
                13='(13) Public order' 14='(14) Other/unspecified' 99='(99) Missing';
VALUE educatif  1='(1) <HS diploma/GED' 2='(2) HS diploma/GED' 3='(3) Any college'
                9='(9) Ungraded/unknown';
VALUE offgenef  1='(1) Violent' 2='(2) Property' 3='(3) Drugs' 4='(4) Public order'
                5='(5) Other/unspecified' 9='(9) Missing';
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA;
INFILE "data-filename" LRECL=31;
INPUT
       SEX 1                   RPTYEAR 2-5
        STATE 6-7               EDUCATION 8             ADMTYPE 9
        OFFGENERAL 10           MAND_PRISREL_YEAR 11-14 PROJ_PRISREL_YEAR 15-18
        PARELIG_YEAR 19-22      ADMITYR 23-26           SENTLGTH 27
        OFFDETAIL 28-29         RACE 30                 AGEADMIT 31
        ;


* SAS LABEL STATEMENT;

LABEL 
   SEX     = 'SEX OF INMATE' 
   RPTYEAR = 'YEAR DATA WERE SUBMITTED TO NCRP' 
   STATE   = 'STATE WITH CUSTODY OF INMATE' 
   EDUCATION= 'HIGHEST LEVEL OF EDUCATION OF INMATE' 
   ADMTYPE = 'TYPE OF PRISON ADMISSION' 
   OFFGENERAL= '5-LEVEL CATEGORIZATION OF MOST SERIOUS SENTENCED OFFENSE' 
   MAND_PRISREL_YEAR= 'YEAR OF MANDATORY PRISON RELEASE' 
   PROJ_PRISREL_YEAR= 'YEAR OF PROJECTED PRISON RELEASE' 
   PARELIG_YEAR= 'YEAR OF PAROLE ELIGIBILITY' 
   ADMITYR = 'YEAR INMATE WAS ADMITTED TO PRISON' 
   SENTLGTH= 'MAXIMUM SENTENCE LENGTH FOR INMATE' 
   OFFDETAIL= 'DETAILED CATEGORIZATION OF MOST SERIOUS SENTENCED OFFENSE' 
   RACE    = 'RACE/HISPANIC ETHNICITY OF INMATE' 
   AGEADMIT= 'AGE AT ADMISSION' 
        ; 


* USER-DEFINED MISSING VALUES RECODE TO SAS SYSMIS;

/*
   IF (EDUCATION = 9) THEN EDUCATION = .;
   IF (ADMTYPE = 9) THEN ADMTYPE = .;
   IF (OFFGENERAL = 9) THEN OFFGENERAL = .;
   IF (SENTLGTH = 9) THEN SENTLGTH = .;
   IF (OFFDETAIL = 99) THEN OFFDETAIL = .;
   IF (RACE = 9) THEN RACE = .;
   IF (AGEADMIT = 9) THEN AGEADMIT = .;
*/


* SAS FORMAT STATEMENT;

/*
   FORMAT
         ADMTYPE admtypef. AGEADMIT ageadmif. EDUCATION educatif.
         OFFDETAIL offdetaf. OFFGENERAL offgenef. RACE raceffff.
         SENTLGTH sentlgtf. SEX sexfffff. STATE statefff.
    ;
*/

RUN ;
