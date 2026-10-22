*-------------------------------------------------------------------------*
*                                                                          
*                     SPSS SETUP FILE FOR ICPSR 37021
*            NATIONAL CORRECTIONS REPORTING PROGRAM, 1991-2016:
*                            SELECTED VARIABLES
*                    (DATASET 0002: PRISON ADMISSIONS)
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
*  data file is physically located (e.g., "c:\temp\37021-0002-data.txt").
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
*  will be saved (e.g., SAVE OUTFILE="c:\spsswin\data\da37021-0002.sav").
*
*-------------------------------------------------------------------------.

* SPSS FILE HANDLE AND DATA LIST COMMANDS.

FILE HANDLE DATA / NAME="data-filename" LRECL=31.
DATA LIST FILE=DATA /
                   SEX 1             RPTYEAR 2-5
               STATE 6-7             EDUCATION 8               ADMTYPE 9
           OFFGENERAL 10 
MAND_PRISREL_YEAR 11-14
 PROJ_PRISREL_YEAR 15-18
      PARELIG_YEAR 19-22           ADMITYR 23-26             SENTLGTH 27
         OFFDETAIL 28-29                 RACE 30             AGEADMIT 31
   .

* SPSS VARIABLE LABELS COMMAND

VARIABLE LABELS
   SEX       'SEX OF INMATE' /
   RPTYEAR   'YEAR DATA WERE SUBMITTED TO NCRP' /
   STATE     'STATE WITH CUSTODY OF INMATE' /
   EDUCATION 'HIGHEST LEVEL OF EDUCATION OF INMATE' /
   ADMTYPE   'TYPE OF PRISON ADMISSION' /
   OFFGENERAL '5-LEVEL CATEGORIZATION OF MOST SERIOUS SENTENCED OFFENSE' /
   MAND_PRISREL_YEAR 'YEAR OF MANDATORY PRISON RELEASE' /
   PROJ_PRISREL_YEAR 'YEAR OF PROJECTED PRISON RELEASE' /
   PARELIG_YEAR 'YEAR OF PAROLE ELIGIBILITY' /
   ADMITYR   'YEAR INMATE WAS ADMITTED TO PRISON' /
   SENTLGTH  'MAXIMUM SENTENCE LENGTH FOR INMATE' /
   OFFDETAIL 'DETAILED CATEGORIZATION OF MOST SERIOUS SENTENCED OFFENSE' /
   RACE      'RACE/HISPANIC ETHNICITY OF INMATE' /
   AGEADMIT  'AGE AT ADMISSION' /
   .


* SPSS VALUE LABELS COMMAND.

VALUE LABELS
   SEX       1 'Male' 2 'Female' /
   STATE     1 'Alabama' 2 'Alaska' 4 'Arizona' 5 'Arkansas' 6 'California'
             8 'Colorado' 9 'Connecticut' 10 'Delaware'
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
   EDUCATION 1 '<HS diploma/GED' 2 'HS diploma/GED' 3 'Any college'
             9 'Ungraded/unknown' /
   ADMTYPE   1 'New court commitment' 2 'Parole return/revocation'
   3 'Other admission (including unsentenced, transfer, AWOL/escapee return)'
             9 'Missing' /
   OFFGENERAL 1 'Violent' 2 'Property' 3 'Drugs' 4 'Public order'
             5 'Other/unspecified' 9 'Missing' /
   SENTLGTH  0 '< 1 year' 1 '1-1.9 years' 2 '2-4.9 years' 3 '5-9.9 years'
             4 '10-24.9 years' 5 '>=25 years'
             6 'Life, LWOP, Life plus additional years, Death' 9 'Missing' /
   OFFDETAIL 1 'Murder (including non-negligent manslaughter)'
             2 'Negligent manslaughter' 3 'Rape/sexual assault' 4 'Robbery'
             5 'Aggravated or simple assault' 6 'Other violent offenses'
             7 'Burglary' 8 'Larceny' 9 'Motor vehicle theft' 10 'Fraud'
             11 'Other property offenses'
           12 'Drugs (includes possession, distribution, trafficking, other)'
             13 'Public order' 14 'Other/unspecified' 99 'Missing' /
   RACE      1 'White, non-Hispanic' 2 'Black, non-Hispanic'
             3 'Hispanic, any race' 4 'Other race(s), non-Hispanic'
             9 'Missing' /
   AGEADMIT  1 '18-24 years' 2 '25-34 years' 3 '35-44 years' 4 '45-54 years'
             5 '55+ years' 9 'Missing' /
   .

* SPSS MISSING VALUES COMMAND.

* MISSING VALUES
     EDUCATION (9) /
     ADMTYPE (9) /
     OFFGENERAL (9) /
     SENTLGTH (9) /
     OFFDETAIL (99) /
     RACE (9) /
     AGEADMIT (9) /
   .

EXECUTE.

* SPSS VARIABLE LEVEL COMMAND.

VARIABLE LEVEL
   RPTYEAR
   MAND_PRISREL_YEAR
   PROJ_PRISREL_YEAR
   PARELIG_YEAR
   ADMITYR
    (scale).

VARIABLE LEVEL
   SEX
   STATE
   EDUCATION
   ADMTYPE
   OFFGENERAL
   SENTLGTH
   OFFDETAIL
   RACE
   AGEADMIT
    (nominal).

* SPSS PRINT FORMAT COMMAND.

PRINT FORMAT
   SEX (F1)
   RPTYEAR (F4)
   STATE (F2)
   EDUCATION (F1)
   ADMTYPE (F1)
   OFFGENERAL (F1)
   MAND_PRISREL_YEAR (F4)
   PROJ_PRISREL_YEAR (F4)
   PARELIG_YEAR (F4)
   ADMITYR (F4)
   SENTLGTH (F1)
   OFFDETAIL (F2)
   RACE (F1)
   AGEADMIT (F1)
  .

* Create SPSS system file.

*SAVE OUTFILE="spss-filename.sav".
