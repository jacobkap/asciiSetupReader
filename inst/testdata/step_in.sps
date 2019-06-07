*-------------------------------------------------------------------------*
*                                                                          
*                     SPSS SETUP FILE FOR ICPSR 30221
*         CRIMINAL JUSTICE DRUG ABUSE TREATMENT STUDIES (CJDATS):
*                  STEP 'N OUT, 2002-2006 [UNITED STATES]
*            (DATASET 0003: ADMINISTRATIVE DATA ON ARRESTS AND
*                              INCARCERATION)
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
*  data file is physically located (e.g., "c:\temp\30221-0003-data.txt").
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
*  will be saved (e.g., SAVE OUTFILE="c:\spsswin\data\da30221-0003.sav").
*
*-------------------------------------------------------------------------.

* SPSS FILE HANDLE AND DATA LIST COMMANDS.

FILE HANDLE DATA / NAME="data-filename" LRECL=39.
DATA LIST FILE=DATA /
                 CID 1-4                RCTR 5-6
         FSDATE 7-17 (A)    EVENT_DATE 18-30 (A)           NR_DAYS 31-34
        NO_RECORD 35 (A)                EVENT 36            CHARGE 37-39

   .

* SPSS VARIABLE LABELS COMMAND.

VARIABLE LABELS
   CID       'CID' /
   RCTR      'RCTR' /
   FSDATE    'FSDATE' /
   EVENT_DATE 'EVENT_DATE' /
   NR_DAYS   'NR_DAYS' /
   NO_RECORD 'NO_RECORD' /
   EVENT     'EVENT' /
   CHARGE    'CHARGE' /
   .


* SPSS VALUE LABELS COMMAND.

VALUE LABELS
   NR_DAYS
 -99 'missing value (date of release (event = 2) is unknown or client was still incarcerated at the time of data collection)'
             /
   NO_RECORD '1' 'arrest data not available' /
   EVENT     1 'arrest that leads to incarceration'
             2 'release from jail/prison after arrest (EVENT = 1)'
             3 'arrest that does not lead to incarceration' /
   CHARGE    -99 'missing value: type of charge is unknown'
 1 'violent: use of dangerous weapon, robbery, assault, battery, homicide, attempted homicide, manslaughter, mugging, kidnap'
 2 'property: theft, identity theft, burglary, possession stolen vehicle, unauthorized use of vehicle, credit card forgery,'
 3 'drug: drug possession, drug distribution, public intoxication, DUI, drug use, poss. to distribute, drug paraphernalia, m'
             4 'parole violation'
 5 'other: failure to appear, possession of firearm, harassment, criminal driving, false police report, child endangerment,'
            6 'sex: prostitution, pimping, rape, sexual assault, sex w/minor'
             /
   .

* SPSS MISSING VALUES COMMAND.

* MISSING VALUES
     NR_DAYS (-99) /
     CHARGE (-99) /
   .

EXECUTE.

* Create SPSS system file.

*SAVE OUTFILE="spss-filename.sav".
