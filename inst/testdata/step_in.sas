/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 30221
 |        CRIMINAL JUSTICE DRUG ABUSE TREATMENT STUDIES (CJDATS):
 |                 STEP 'N OUT, 2002-2006 [UNITED STATES]
 |           (DATASET 0003: ADMINISTRATIVE DATA ON ARRESTS AND
 |                             INCARCERATION)
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
 | "c:\temp\30221-0003-data.txt").
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
  VALUE nr_days
                  -99='(-99) missing value (date of release (event = 2) is unknown or client was still incarcerated at the time of data collection)' ;
  VALUE $no_recf  '1'='(1) arrest data not available' ;
  VALUE event     1='(1) arrest that leads to incarceration'
                  2='(2) release from jail/prison after arrest (EVENT = 1)'
                  3='(3) arrest that does not lead to incarceration' ;
  VALUE charge    -99='(-99) missing value: type of charge is unknown'
                  1='(1) violent: use of dangerous weapon, robbery, assault, battery, homicide, attempted homicide, manslaughter, mugging, kidnap'
                  2='(2) property: theft, identity theft, burglary, possession stolen vehicle, unauthorized use of vehicle, credit card forgery,'
                  3='(3) drug: drug possession, drug distribution, public intoxication, DUI, drug use, poss. to distribute, drug paraphernalia, m'
                  4='(4) parole violation'
                  5='(5) other: failure to appear, possession of firearm, harassment, criminal driving, false police report, child endangerment,'
                  6='(6) sex: prostitution, pimping, rape, sexual assault, sex w/minor' ;
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA;
INFILE "data-filename" LRECL=39;
INPUT
       CID 1-4                 RCTR 5-6
        FSDATE $7-17            EVENT_DATE $18-30       NR_DAYS 31-34
        NO_RECORD $35           EVENT 36                CHARGE 37-39
        ;


* SAS LABEL STATEMENT;

LABEL
   CID     = 'CID'
   RCTR    = 'RCTR'
   FSDATE  = 'FSDATE'
   EVENT_DATE= 'EVENT_DATE'
   NR_DAYS = 'NR_DAYS'
   NO_RECORD= 'NO_RECORD'
   EVENT   = 'EVENT'
   CHARGE  = 'CHARGE'
        ;


* USER-DEFINED MISSING VALUES RECODE TO SAS SYSMIS;

/*
   IF (NR_DAYS = -99) THEN NR_DAYS = .;
   IF (CHARGE = -99) THEN CHARGE = .;
*/


* SAS FORMAT STATEMENT;

/*
  FORMAT NR_DAYS nr_days. NO_RECORD $no_recf. EVENT event.
         CHARGE charge.  ;
*/

RUN ;
