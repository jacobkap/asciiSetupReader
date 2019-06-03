*-------------------------------------------------------------------------*
*                                                                          
*                     SPSS SETUP FILE FOR ICPSR 25504
*        NATIONAL HEALTH AND NUTRITION EXAMINATION SURVEY (NHANES),
*                                2005-2006
*                       (DATASET 0001: DEMOGRAPHICS)
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
*  data file is physically located (e.g., "c:\temp\25504-0001-data.txt").
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
*  will be saved (e.g., SAVE OUTFILE="c:\spsswin\data\da25504-0001.sav").
*
*-------------------------------------------------------------------------.

* SPSS FILE HANDLE AND DATA LIST COMMANDS.

FILE HANDLE DATA / NAME="data-filename" LRECL=157.
DATA LIST FILE=DATA /
                SEQN 1-5            SDDSRVYR 6-8
           RIDSTATR 9-11          RIDEXMON 12-14          RIAGENDR 15-17
          RIDAGEYR 18-20          RIDAGEMN 21-24          RIDAGEEX 25-28
          RIDRETH1 29-31          DMQMILIT 32-34           DMDBORN 35-37
          DMDCITZN 38-40          DMDYRSUS 41-43          DMDEDUC3 44-46
          DMDEDUC2 47-49          DMDSCHOL 50-52          DMDMARTL 53-55
          DMDHHSIZ 56-58          DMDFMSIZ 59-61          INDHHINC 62-64
          INDFMINC 65-67      INDFMPIR 68-72 (2)          RIDEXPRG 73-75
          DMDHRGND 76-78          DMDHRAGE 79-81          DMDHRBRN 82-84
          DMDHREDU 85-87          DMDHRMAR 88-90          DMDHSEDU 91-93
           SIALANG 94-96          SIAPROXY 97-99        SIAINTRP 100-102
         FIALANG 103-105        FIAPROXY 106-108        FIAINTRP 109-111
         MIALANG 112-114        MIAPROXY 115-117        MIAINTRP 118-120
         AIALANG 121-123    WTINT2YR 124-137 (6)    WTMEC2YR 138-151 (6)
         SDMVPSU 152-154        SDMVSTRA 155-157
   .

* SPSS VARIABLE LABELS COMMAND.

VARIABLE LABELS
   SEQN      'Respondent sequence number' /
   SDDSRVYR  'Data Release Number' /
   RIDSTATR  'Interview/Examination Status' /
   RIDEXMON  'Six month time period' /
   RIAGENDR  'Gender' /
   RIDAGEYR  'Age at Screening Adjudicated - Recode' /
   RIDAGEMN  'Age in Months - Recode' /
   RIDAGEEX  'Exam Age in Months - Recode' /
   RIDRETH1  'Race/Ethnicity - Recode' /
   DMQMILIT  'Veteran/Military Status' /
   DMDBORN   'Country of Birth - Recode' /
   DMDCITZN  'Citizenship Status' /
   DMDYRSUS  'Length of time in US' /
   DMDEDUC3  'Education Level - Children/Youth 6-19' /
   DMDEDUC2  'Education Level - Adults 20+' /
   DMDSCHOL  'Now attending school?' /
   DMDMARTL  'Marital Status' /
   DMDHHSIZ  'Total number of people in the Household' /
   DMDFMSIZ  'Total number of people in the Family' /
   INDHHINC  'Annual Household Income' /
   INDFMINC  'Annual Family Income' /
   INDFMPIR  'Family PIR' /
   RIDEXPRG  'Pregnancy Status at Exam - Recode' /
   DMDHRGND  'HH Ref Person Gender' /
   DMDHRAGE  'HH Ref Person Age' /
   DMDHRBRN  'HH Ref Person Country of Birth' /
   DMDHREDU  'HH Ref Person Education Level' /
   DMDHRMAR  'HH Ref Person Marital Status' /
   DMDHSEDU  'HH Ref Person''s Spouse Education Level' /
   SIALANG   'Language of SP Interview' /
   SIAPROXY  'Proxy used in SP Interview?' /
   SIAINTRP  'Interpreter used in SP Interview?' /
   FIALANG   'Language of Family Interview' /
   FIAPROXY  'Proxy used in Family Interview?' /
   FIAINTRP  'Interpreter used in Family Interview?' /
   MIALANG   'Language of MEC Interview' /
   MIAPROXY  'Proxy used in MEC Interview?' /
   MIAINTRP  'Interpreter used in MEC Interview?' /
   AIALANG   'Language of ACASI Interview' /
   WTINT2YR  'Full Sample 2 Year Interview Weight' /
   WTMEC2YR  'Full Sample 2 Year MEC Exam Weight' /
   SDMVPSU   'Masked Variance Pseudo-PSU' /
   SDMVSTRA  'Masked Variance Pseudo-Stratum' /
   .


* SPSS VALUE LABELS COMMAND.

VALUE LABELS
   SDDSRVYR  4 'NHANES 2005-2006 Public Release' /
   RIDSTATR  1 'Interviewed Only.' 2 'Both Interviewed and MEC examined' /
   RIDEXMON  1 'November 1 through April 30' 2 'May 1 through October 31' /
   RIAGENDR  1 'Male' 2 'Female' /
   RIDAGEYR  85 '>= 85 years of age' /
   RIDRETH1  1 'Mexican American' 2 'Other Hispanic' 3 'Non-Hispanic White'
             4 'Non-Hispanic Black' 5 'Other Race - Including Multi-Racial' /
   DMQMILIT  1 'Yes' 2 'No' 7 'Refused' 9 'Don''t know' /
   DMDBORN   1 'Born in 50 US States or Washington, DC' 2 'Born in Mexico'
             3 'Born Elsewhere' 7 'Refused' /
   DMDCITZN  1 'Citizen by birth or naturalization'
             2 'Not a citizen of the US' 7 'Refused' 9 'Don''t know' /
   DMDYRSUS  1 'Less than 1 year' 2 '1 yr., less than 5 yrs.'
             3 '5 yrs., less than 10 yrs.' 4 '10 yrs., less than 15 yrs.'
             5 '15 yrs., less than 20 yrs.' 6 '20 yrs., less than 30 yrs.'
             7 '30 yrs., less than 40 yrs.' 8 '40 yrs., less than 50 yrs.'
             9 '50 years or more' 77 'Refused' 99 'Don''t know' /
   DMDEDUC3  0 'Never Attended / Kindergarten Only' 1 '1st Grade'
             2 '2nd Grade' 3 '3rd Grade' 4 '4th Grade' 5 '5th Grade'
             6 '6th Grade' 7 '7th Grade' 8 '8th Grade' 9 '9th Grade'
             10 '10th Grade' 11 '11th Grade' 12 '12th Grade, No Diploma'
             13 'High School Graduate' 14 'GED or Equivalent'
             15 'More than high school' 55 'Less Than 5th Grade'
             66 'Less Than 9th Grade' 77 'Refused' 99 'Don''t know' /
   DMDEDUC2  1 'Less Than 9th Grade'
             2 '9-11th Grade (Includes 12th grade with no diploma)'
             3 'High School Grad/GED or Equivalent'
             4 'Some College or AA degree' 5 'College Graduate or above'
             7 'Refused' 9 'Don''t Know' /
   DMDSCHOL  1 'In school' 2 'On vacation from school (between grades)'
             3 'Neither in school or on vacation from school (btwn grades)'
             7 'Refused' 9 'Don''t know' /
   DMDMARTL  1 'Married' 2 'Widowed' 3 'Divorced' 4 'Separated'
             5 'Never married' 6 'Living with partner' 77 'Refused'
             99 'Don''t know' /
   DMDHHSIZ  7 '7 or more people in the Household' /
   DMDFMSIZ  7 '7 or more people in the Family' /
   INDHHINC  1 '$ 0 to $ 4,999' 2 '$ 5,000 to $ 9,999' 3 '$10,000 to $14,999'
             4 '$15,000 to $19,999' 5 '$20,000 to $24,999'
             6 '$25,000 to $34,999' 7 '$35,000 to $44,999'
             8 '$45,000 to $54,999' 9 '$55,000 to $64,999'
             10 '$65,000 to $74,999' 11 '$75,000 and Over' 12 'Over $20,000'
             13 'Under $20,000' 77 'Refused' 99 'Don''t know' /
   INDFMINC  1 '$ 0 to $ 4,999' 2 '$ 5,000 to $ 9,999' 3 '$10,000 to $14,999'
             4 '$15,000 to $19,999' 5 '$20,000 to $24,999'
             6 '$25,000 to $34,999' 7 '$35,000 to $44,999'
             8 '$45,000 to $54,999' 9 '$55,000 to $64,999'
             10 '$65,000 to $74,999' 11 '$75,000 and Over' 12 'Over $20,000'
             13 'Under $20,000' 77 'Refused' 99 'Don''t know' /
   INDFMPIR  5 'PIR value greater than or equal to 5.00' /
   RIDEXPRG  1 'Yes, positive lab pregnancy test or self-reported pregnant'
             2 'SP not pregnant at exam'
             3 'Cannot ascertain if SP is pregnant at exam' /
   DMDHRGND  1 'Male' 2 'Female' /
   DMDHRAGE  85 '>= 85 years of age' /
   DMDHRBRN  1 'Born in 50 US States or Washington, DC' 2 'Born in Mexico'
             3 'Born Elsewhere' 7 'Refused' 9 'Don''t know' /
   DMDHREDU  1 'Less Than 9th Grade'
             2 '9-11th Grade (Includes 12th grade with no diploma)'
             3 'High School Grad/GED or equivalent'
             4 'Some College or AA degree' 5 'College Graduate or above'
             7 'Refused' 9 'Don''t know' /
   DMDHRMAR  1 'Married' 2 'Widowed' 3 'Divorced' 4 'Separated'
             5 'Never married' 6 'Living with partner' 77 'Refused'
             99 'Don''t know' /
   DMDHSEDU  1 'Less Than 9th Grade'
             2 '9-11th Grade (Includes 12th grade with no diploma)'
             3 'High School Grad/GED or equivalent'
             4 'Some College or AA degree' 5 'College Graduate or above'
             7 'Refused' 9 'Don''t know' /
   SIALANG   1 'English' 2 'Spanish' /
   SIAPROXY  1 'Yes' 2 'No' /
   SIAINTRP  1 'Yes' 2 'No' /
   FIALANG   1 'English' 2 'Spanish' /
   FIAPROXY  1 'Yes' 2 'No' /
   FIAINTRP  1 'Yes' 2 'No' /
   MIALANG   1 'English' 2 'Spanish' /
   MIAPROXY  1 'Yes' 2 'No' /
   MIAINTRP  1 'Yes' 2 'No' /
   AIALANG   1 'English' 2 'Spanish' /
   .

EXECUTE.

* Create SPSS system file.

*SAVE OUTFILE="spss-filename.sav".
