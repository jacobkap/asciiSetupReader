/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 25504
 |       NATIONAL HEALTH AND NUTRITION EXAMINATION SURVEY (NHANES),
 |                               2005-2006
 |                      (DATASET 0001: DEMOGRAPHICS)
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
 | "c:\temp\25504-0001-data.txt").
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
  VALUE sddsrvyr  4='(4) NHANES 2005-2006 Public Release' ;
  VALUE ridstatr  1='(1) Interviewed Only.' 2='(2) Both Interviewed and MEC examined' ;
  VALUE ridexmon  1='(1) November 1 through April 30'
                  2='(2) May 1 through October 31' ;
  VALUE riagendr  1='(1) Male' 2='(2) Female' ;
  VALUE ridageyr  85='(85) >= 85 years of age' ;
  VALUE ridrethf  1='(1) Mexican American' 2='(2) Other Hispanic'
                  3='(3) Non-Hispanic White' 4='(4) Non-Hispanic Black'
                  5='(5) Other Race - Including Multi-Racial' ;
  VALUE dmqmilit  1='(1) Yes' 2='(2) No' 7='(7) Refused' 9='(9) Don''t know' ;
  VALUE dmdborn   1='(1) Born in 50 US States or Washington, DC'
                  2='(2) Born in Mexico' 3='(3) Born Elsewhere' 7='(7) Refused' ;
  VALUE dmdcitzn  1='(1) Citizen by birth or naturalization'
                  2='(2) Not a citizen of the US' 7='(7) Refused' 9='(9) Don''t know' ;
  VALUE dmdyrsus  1='(1) Less than 1 year' 2='(2) 1 yr., less than 5 yrs.'
                  3='(3) 5 yrs., less than 10 yrs.'
                  4='(4) 10 yrs., less than 15 yrs.'
                  5='(5) 15 yrs., less than 20 yrs.'
                  6='(6) 20 yrs., less than 30 yrs.'
                  7='(7) 30 yrs., less than 40 yrs.'
                  8='(8) 40 yrs., less than 50 yrs.' 9='(9) 50 years or more'
                  77='(77) Refused' 99='(99) Don''t know' ;
  VALUE dmdeducf  0='(0) Never Attended / Kindergarten Only' 1='(1) 1st Grade'
                  2='(2) 2nd Grade' 3='(3) 3rd Grade' 4='(4) 4th Grade' 5='(5) 5th Grade'
                  6='(6) 6th Grade' 7='(7) 7th Grade' 8='(8) 8th Grade' 9='(9) 9th Grade'
                  10='(10) 10th Grade' 11='(11) 11th Grade' 12='(12) 12th Grade, No Diploma'
                  13='(13) High School Graduate' 14='(14) GED or Equivalent'
                  15='(15) More than high school' 55='(55) Less Than 5th Grade'
                  66='(66) Less Than 9th Grade' 77='(77) Refused' 99='(99) Don''t know' ;
  VALUE dmdedu0f  1='(1) Less Than 9th Grade'
                  2='(2) 9-11th Grade (Includes 12th grade with no diploma)'
                  3='(3) High School Grad/GED or Equivalent'
                  4='(4) Some College or AA degree' 5='(5) College Graduate or above'
                  7='(7) Refused' 9='(9) Don''t Know' ;
  VALUE dmdschol  1='(1) In school' 2='(2) On vacation from school (between grades)'
                  3='(3) Neither in school or on vacation from school (btwn grades)'
                  7='(7) Refused' 9='(9) Don''t know' ;
  VALUE dmdmartl  1='(1) Married' 2='(2) Widowed' 3='(3) Divorced' 4='(4) Separated'
                  5='(5) Never married' 6='(6) Living with partner' 77='(77) Refused'
                  99='(99) Don''t know' ;
  VALUE dmdhhsiz  7='(7) 7 or more people in the Household' ;
  VALUE dmdfmsiz  7='(7) 7 or more people in the Family' ;
  VALUE indhhinc  1='(1) $ 0 to $ 4,999' 2='(2) $ 5,000 to $ 9,999'
                  3='(3) $10,000 to $14,999' 4='(4) $15,000 to $19,999'
                  5='(5) $20,000 to $24,999' 6='(6) $25,000 to $34,999'
                  7='(7) $35,000 to $44,999' 8='(8) $45,000 to $54,999'
                  9='(9) $55,000 to $64,999' 10='(10) $65,000 to $74,999'
                  11='(11) $75,000 and Over' 12='(12) Over $20,000' 13='(13) Under $20,000'
                  77='(77) Refused' 99='(99) Don''t know' ;
  VALUE indfminc  1='(1) $ 0 to $ 4,999' 2='(2) $ 5,000 to $ 9,999'
                  3='(3) $10,000 to $14,999' 4='(4) $15,000 to $19,999'
                  5='(5) $20,000 to $24,999' 6='(6) $25,000 to $34,999'
                  7='(7) $35,000 to $44,999' 8='(8) $45,000 to $54,999'
                  9='(9) $55,000 to $64,999' 10='(10) $65,000 to $74,999'
                  11='(11) $75,000 and Over' 12='(12) Over $20,000' 13='(13) Under $20,000'
                  77='(77) Refused' 99='(99) Don''t know' ;
  VALUE indfmpir  5='(5) PIR value greater than or equal to 5.00' ;
  VALUE ridexprg
                  1='(1) Yes, positive lab pregnancy test or self-reported pregnant'
                  2='(2) SP not pregnant at exam'
                  3='(3) Cannot ascertain if SP is pregnant at exam' ;
  VALUE dmdhrgnd  1='(1) Male' 2='(2) Female' ;
  VALUE dmdhrage  85='(85) >= 85 years of age' ;
  VALUE dmdhrbrn  1='(1) Born in 50 US States or Washington, DC'
                  2='(2) Born in Mexico' 3='(3) Born Elsewhere' 7='(7) Refused'
                  9='(9) Don''t know' ;
  VALUE dmdhredu  1='(1) Less Than 9th Grade'
                  2='(2) 9-11th Grade (Includes 12th grade with no diploma)'
                  3='(3) High School Grad/GED or equivalent'
                  4='(4) Some College or AA degree' 5='(5) College Graduate or above'
                  7='(7) Refused' 9='(9) Don''t know' ;
  VALUE dmdhrmar  1='(1) Married' 2='(2) Widowed' 3='(3) Divorced' 4='(4) Separated'
                  5='(5) Never married' 6='(6) Living with partner' 77='(77) Refused'
                  99='(99) Don''t know' ;
  VALUE dmdhsedu  1='(1) Less Than 9th Grade'
                  2='(2) 9-11th Grade (Includes 12th grade with no diploma)'
                  3='(3) High School Grad/GED or equivalent'
                  4='(4) Some College or AA degree' 5='(5) College Graduate or above'
                  7='(7) Refused' 9='(9) Don''t know' ;
  VALUE sialang   1='(1) English' 2='(2) Spanish' ;
  VALUE siaproxy  1='(1) Yes' 2='(2) No' ;
  VALUE siaintrp  1='(1) Yes' 2='(2) No' ;
  VALUE fialang   1='(1) English' 2='(2) Spanish' ;
  VALUE fiaproxy  1='(1) Yes' 2='(2) No' ;
  VALUE fiaintrp  1='(1) Yes' 2='(2) No' ;
  VALUE mialang   1='(1) English' 2='(2) Spanish' ;
  VALUE miaproxy  1='(1) Yes' 2='(2) No' ;
  VALUE miaintrp  1='(1) Yes' 2='(2) No' ;
  VALUE aialang   1='(1) English' 2='(2) Spanish' ;
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA;
INFILE "data-filename" LRECL=157;
INPUT
       SEQN 1-5                SDDSRVYR 6-8
        RIDSTATR 9-11           RIDEXMON 12-14          RIAGENDR 15-17
        RIDAGEYR 18-20          RIDAGEMN 21-24          RIDAGEEX 25-28
        RIDRETH1 29-31          DMQMILIT 32-34          DMDBORN 35-37
        DMDCITZN 38-40          DMDYRSUS 41-43          DMDEDUC3 44-46
        DMDEDUC2 47-49          DMDSCHOL 50-52          DMDMARTL 53-55
        DMDHHSIZ 56-58          DMDFMSIZ 59-61          INDHHINC 62-64
        INDFMINC 65-67          INDFMPIR 68-72 .2       RIDEXPRG 73-75
        DMDHRGND 76-78          DMDHRAGE 79-81          DMDHRBRN 82-84
        DMDHREDU 85-87          DMDHRMAR 88-90          DMDHSEDU 91-93
        SIALANG 94-96           SIAPROXY 97-99          SIAINTRP 100-102
        FIALANG 103-105         FIAPROXY 106-108        FIAINTRP 109-111
        MIALANG 112-114         MIAPROXY 115-117        MIAINTRP 118-120
        AIALANG 121-123         WTINT2YR 124-137 .6     WTMEC2YR 138-151 .6
        SDMVPSU 152-154         SDMVSTRA 155-157        ;


* SAS LABEL STATEMENT;

LABEL
   SEQN    = 'Respondent sequence number'
   SDDSRVYR= 'Data Release Number'
   RIDSTATR= 'Interview/Examination Status'
   RIDEXMON= 'Six month time period'
   RIAGENDR= 'Gender'
   RIDAGEYR= 'Age at Screening Adjudicated - Recode'
   RIDAGEMN= 'Age in Months - Recode'
   RIDAGEEX= 'Exam Age in Months - Recode'
   RIDRETH1= 'Race/Ethnicity - Recode'
   DMQMILIT= 'Veteran/Military Status'
   DMDBORN = 'Country of Birth - Recode'
   DMDCITZN= 'Citizenship Status'
   DMDYRSUS= 'Length of time in US'
   DMDEDUC3= 'Education Level - Children/Youth 6-19'
   DMDEDUC2= 'Education Level - Adults 20+'
   DMDSCHOL= 'Now attending school?'
   DMDMARTL= 'Marital Status'
   DMDHHSIZ= 'Total number of people in the Household'
   DMDFMSIZ= 'Total number of people in the Family'
   INDHHINC= 'Annual Household Income'
   INDFMINC= 'Annual Family Income'
   INDFMPIR= 'Family PIR'
   RIDEXPRG= 'Pregnancy Status at Exam - Recode'
   DMDHRGND= 'HH Ref Person Gender'
   DMDHRAGE= 'HH Ref Person Age'
   DMDHRBRN= 'HH Ref Person Country of Birth'
   DMDHREDU= 'HH Ref Person Education Level'
   DMDHRMAR= 'HH Ref Person Marital Status'
   DMDHSEDU= 'HH Ref Person''s Spouse Education Level'
   SIALANG = 'Language of SP Interview'
   SIAPROXY= 'Proxy used in SP Interview?'
   SIAINTRP= 'Interpreter used in SP Interview?'
   FIALANG = 'Language of Family Interview'
   FIAPROXY= 'Proxy used in Family Interview?'
   FIAINTRP= 'Interpreter used in Family Interview?'
   MIALANG = 'Language of MEC Interview'
   MIAPROXY= 'Proxy used in MEC Interview?'
   MIAINTRP= 'Interpreter used in MEC Interview?'
   AIALANG = 'Language of ACASI Interview'
   WTINT2YR= 'Full Sample 2 Year Interview Weight'
   WTMEC2YR= 'Full Sample 2 Year MEC Exam Weight'
   SDMVPSU = 'Masked Variance Pseudo-PSU'
   SDMVSTRA= 'Masked Variance Pseudo-Stratum'
        ;


* SAS FORMAT STATEMENT;

/*
  FORMAT SDDSRVYR sddsrvyr. RIDSTATR ridstatr. RIDEXMON ridexmon.
         RIAGENDR riagendr. RIDAGEYR ridageyr. RIDRETH1 ridrethf.
         DMQMILIT dmqmilit. DMDBORN dmdborn. DMDCITZN dmdcitzn.
         DMDYRSUS dmdyrsus. DMDEDUC3 dmdeducf. DMDEDUC2 dmdedu0f.
         DMDSCHOL dmdschol. DMDMARTL dmdmartl. DMDHHSIZ dmdhhsiz.
         DMDFMSIZ dmdfmsiz. INDHHINC indhhinc. INDFMINC indfminc.
         INDFMPIR indfmpir. RIDEXPRG ridexprg. DMDHRGND dmdhrgnd.
         DMDHRAGE dmdhrage. DMDHRBRN dmdhrbrn. DMDHREDU dmdhredu.
         DMDHRMAR dmdhrmar. DMDHSEDU dmdhsedu. SIALANG sialang.
         SIAPROXY siaproxy. SIAINTRP siaintrp. FIALANG fialang.
         FIAPROXY fiaproxy. FIAINTRP fiaintrp. MIALANG mialang.
         MIAPROXY miaproxy. MIAINTRP miaintrp. AIALANG aialang.
          ;
*/

RUN ;
