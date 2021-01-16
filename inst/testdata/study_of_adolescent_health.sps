*-------------------------------------------------------------------------*
*                                                                          
*                     SPSS SETUP FILE FOR ICPSR 21600
*        NATIONAL LONGITUDINAL STUDY OF ADOLESCENT TO ADULT HEALTH
*                   (ADD HEALTH), 1994-2008 [PUBLIC USE]
*               (DATASET 0031: WAVE IV: PUBLIC USE WEIGHTS)
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
*  data file is physically located (e.g., "c:\temp\21600-0031-data.txt").
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
*  will be saved (e.g., SAVE OUTFILE="c:\spsswin\data\da21600-0031.sav").
*
*-------------------------------------------------------------------------.

* SPSS FILE HANDLE AND DATA LIST COMMANDS.

FILE HANDLE DATA / NAME="data-filename" LRECL=56.
DATA LIST FILE=DATA /
             AID 1-8 (A)           CLUSTER2 9-11
        GSWGT4 12-26 (9)      GSWGT4_2 27-41 (9)      GSWGT134 42-56 (9)
   .

* SPSS VARIABLE LABELS COMMAND

VARIABLE LABELS
   AID       'RESPONDENT IDENTIFIER' /
   CLUSTER2  'Sample cluster' /
   GSWGT4    'Post stratified untrimmed longitudinal grand sample weight' /
   GSWGT4_2  'Post stratified untrimmed cross-sectional grand sample weight' /
   GSWGT134  'Post stratified untrimmed longitudinal grand sample weight for Waves I, III, and IV' /
   .

EXECUTE.

* SPSS VARIABLE LEVEL COMMAND.

VARIABLE LEVEL
   CLUSTER2
   GSWGT4
   GSWGT4_2
   GSWGT134
    (scale).

VARIABLE LEVEL
   AID
    (nominal).

* SPSS PRINT FORMAT COMMAND.

PRINT FORMAT
   CLUSTER2 (F3)
   GSWGT4 (F15.9)
   GSWGT4_2 (F15.9)
   GSWGT134 (F15.9)
  .

* Create SPSS system file.

*SAVE OUTFILE="spss-filename.sav".
