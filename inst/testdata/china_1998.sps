*-------------------------------------------------------------------------*
*                                                                          
*                     SPSS SETUP FILE FOR ICPSR 09836
*                  CHINESE HOUSEHOLD INCOME PROJECT, 1988
*                  (DATASET 0001: RURAL INDIVIDUAL DATA)
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
*  data file is physically located (e.g., "c:\temp\09836-0001-data.txt").
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
*  will be saved (e.g., SAVE OUTFILE="c:\spsswin\data\da09836-0001.sav").
*
*-------------------------------------------------------------------------.

* SPSS FILE HANDLE AND DATA LIST COMMANDS.

FILE HANDLE DATA / NAME="data-filename" LRECL=165.
DATA LIST FILE=DATA /
               UCODE 1-9             RELATION 10
               GENDER 11               AGE 12-14              STUDENT 15
             INCOME88 16             RESIDENC 17             EDUCATIO 18
                PARTY 19             MINORITY 20               EMPLOY 21
           OWNSECT 22-23            EMSECT 24-25            TYPEEM 26-27
                   SJ 28             SOCCC 29-30          SOWNSECT 31-32
           SEMSECT 33-34               RETIRE 35          MPEN 36-42 (1)
                 WAGE 43         AMI88 44-50 (1)            TNRI88 51-58
             OCI88 59-66            OLCI88 67-74                INK88 75
                IT01T 76             IT01M 77-81             IT01E 82-86
                IT02T 87             IT02M 88-92             IT02E 93-97
                IT03T 98            IT03M 99-103           IT03E 104-108
               IT04T 109           IT04M 110-114           IT04E 115-119
               IT05T 120           IT05M 121-125           IT05E 126-130
               IT06T 131           IT06M 132-136           IT06E 137-141
               IT07T 142           IT07M 143-147           IT07E 148-152
               IT08T 153           IT08M 154-158           IT08E 159-163
          NHHMEM 164-165
   .

* SPSS VARIABLE LABELS COMMAND.

VARIABLE LABELS
   UCODE     'HOUSEHOLD CODE' /
   RELATION  'RELATIONSHIP TO HEAD OF HOUSEHOLD' /
   GENDER    'SEX OF HOUSEHOLD MEMBER' /
   AGE       'AGE OF HOUSEHOLD MEMBER' /
   STUDENT   'STUDENT STATUS OF HOUSEHOLD MEMBER' /
   INCOME88  'INCOME RECIPIENT IN 1988' /
   RESIDENC  'LOCATION OF RESIDENCE' /
   EDUCATIO  'EDUCATION STATUS OF HOUSEHOLD MEMBER' /
   PARTY     'MEMBER OF COMMUNIST PARTY' /
   MINORITY  'NATIONAL MINORITY' /
   EMPLOY    'WORK SITUATION OF MEMBER' /
   OWNSECT   'EMPLOYER IN PRIMARY OCCUPATION' /
   EMSECT    'SECTOR OF PRIMARY OCCUPATION' /
   TYPEEM    'NATURE OF PRIMARY OCCUPATION' /
   SJ        'SECOND JOB' /
   SOCCC     'EMPLOYER IN SECOND OCCUPATION' /
   SOWNSECT  'SECTOR OF SECOND OCCUPATION' /
   SEMSECT   'NATURE OF SECOND OCCUPATION' /
   RETIRE    'RETIRED IN OR BEFORE 1988' /
   MPEN      'RETIREMENT PENSION/MONTH, 1988' /
   WAGE      'WAGE STATUS, 1988' /
   AMI88     'REGULAR COMPENSATION/MONTH 1988' /
   TNRI88    'TOTAL NON-REGULAR INCOME, 1988' /
   OCI88     'OTHER CASH INCOME FROM WORK UNIT, 1988' /
   OLCI88    'OTHER CASH INCOME FROM WORKING, 1988' /
   INK88     'INCOME IN KIND FROM WORK UNIT, 1988' /
   IT01T     'ITEM TYPE' /
   IT01M     'ESTIMATED MARKET PRICE (YUAN)' /
   IT01E     'AMOUNT PAID BY MEMBER (YUAN)' /
   IT02T     'ITEM TYPE' /
   IT02M     'ESTIMATED MARKET PRICE (YUAN)' /
   IT02E     'AMOUNT PAID BY MEMBER (YUAN)' /
   IT03T     'ITEM TYPE' /
   IT03M     'ESTIMATED MARKET PRICE (YUAN)' /
   IT03E     'AMOUNT PAID BY MEMBER (YUAN)' /
   IT04T     'ITEM TYPE' /
   IT04M     'ESTIMATED MARKET PRICE (YUAN)' /
   IT04E     'AMOUNT PAID BY MEMBER (YUAN)' /
   IT05T     'ITEM TYPE' /
   IT05M     'ESTIMATED MARKET PRICE (YUAN)' /
   IT05E     'AMOUNT PAID BY MEMBER (YUAN)' /
   IT06T     'ITEM TYPE' /
   IT06M     'ESTIMATED MARKET PRICE (YUAN)' /
   IT06E     'AMOUNT PAID BY MEMBER (YUAN)' /
   IT07T     'ITEM TYPE' /
   IT07M     'ESTIMATED MARKET PRICE (YUAN)' /
   IT07E     'AMOUNT PAID BY MEMBER (YUAN)' /
   IT08T     'ITEM TYPE' /
   IT08M     'ESTIMATED MARKET PRICE (YUAN)' /
   IT08E     'AMOUNT PAID BY MEMBER (YUAN)' /
   NHHMEM    '# OF MEMBERS IN HOUSEHOLD' /
   .


* SPSS VALUE LABELS COMMAND.

VALUE LABELS
   RELATION  1 'Self' 2 'Spouse' 3 'Child' 4 'Grandchild' 5 'Parent'
             6 'Grandparent' 7 'Other Relative' 8 'Not Related' 9 'Missing' /
   GENDER    0 'Male' 1 'Female' 9 'Missing' /
   AGE       999 'Missing' /
   STUDENT   0 'No' 1 'Yes' 9 'Missing' /
   INCOME88  0 'No' 1 'Yes' 9 'Missing' /
   RESIDENC  1 'Living With Head of Household (HH)'
             2 'Not Living with HH but in Same Village'
             3 'Not Living in Same Village With HH' 9 'Missing' /
   EDUCATIO  1 'College or Above' 2 'Professional School'
             3 'Upper Middle School' 4 'Lower Middle School'
             5 'Primary School Graduate'
             6 'Three Years or More of Primary School'
             7 'One to Three Years of Primary School' 8 'Illiterate'
             9 'Missing' /
   PARTY     0 'No' 1 'Yes' 9 'Missing' /
   MINORITY  0 'No' 1 'Yes' 9 'Missing' /
   EMPLOY    1 'Working' 2 'Disabled' 3 'Retired' 4 'Currently a Student'
             5 'Homemaker' 6 'Other' 9 'Missing' /
   OWNSECT   1 'State-owned. Operated by Center or Province'
             2 'Local State-owned' 3 'Co-operative'
             4 'Private or Individually-owned' 5 'Sino-foreign Joint Venture'
             6 'Foreign-owned'
             7 'Farming Under Household Responsibility System' 8 'Other'
             9 'Not Currently Employed' 99 'Missing' /
   EMSECT    1 'Agriculture' 2 'Forestry' 3 'Raising Livestock' 4 'Fishery'
             5 'Family Sideline' 6 'Industry' 7 'Handicrafts' 8 'Trade'
             9 'Construction' 10 'Transport' 11 'Catering-serving Food'
             12 'Other Services' 13 'Post & Telecommunications'
             14 'Finance, Insurance' 15 'Culture, Education, Health'
             16 'Party, Government or Social Organizations' 99 'Missing' /
   TYPEEM    1 'Official of Party or Government Office or Institution'
             2 'Technical Worker'
             3 'Leading Official of State or Collective Enterprise'
             4 'Ordinary Cadre of Party or GOvernment Office or Institution'
             5 'Owner and Manager of Private or Individual Enterprise'
             6 'Township or Village Cadre' 7 'Ordinary Worker'
             8 'Temporary or Short-term Contract Worker' 9 'Farmer'
             10 'Worker in Town or Township Enterprise'
             11 'Principal Official of Town or Township-operated Enterprise'
             99 'Missing' /
   SJ        0 'No' 1 'Yes' 9 'Missing' /
   SOCCC     1 'State-owned. Operated by Center or Province'
             2 'Local State-owned' 3 'Co-operative'
             4 'Private or Individually-owned' 5 'Sino-foreign Joint Venture'
             6 'Foreign-owned'
             7 'Farming Under Household Responsibility System' 8 'Other'
             9 'Not Currently Employed' 99 'Missing' /
   SOWNSECT  1 'Agriculture' 2 'Forestry' 3 'Raising Livestock' 4 'Fishery'
             5 'Family Sideline' 6 'Industry' 7 'Handicrafts' 8 'Trade'
             9 'Construction' 10 'Transport' 11 'Catering-serving Food'
             12 'Other Services' 13 'Post & Telecommunications'
             14 'Finance, Insurance' 15 'Culture, Education, Health'
             16 'Party, Government or Social Organizations' 99 'Missing' /
   SEMSECT   1 'Official of Party or Government Office or Institution'
             2 'Technical Worker'
             3 'Leading Official of State or Collective Enterprise'
             4 'Ordinary Cadre of Party or GOvernment Office or Institution'
             5 'Owner and Manager of Private or Individual Enterprise'
             6 'Township or Village Cadre' 7 'Ordinary Worker'
             8 'Temporary or Short-term Contract Worker' 9 'Farmer'
             10 'Worker in Town or Township Enterprise'
             11 'Principal Official of Town or Township-operated Enterprise'
             99 'Missing' /
   RETIRE    0 'No' 1 'Yes' 9 'Missing' /
   WAGE      0 'No' 1 'Yes' 9 'Missing' /
   TNRI88    99999999 'Missing' /
   OCI88     99999999 'Missing' /
   OLCI88    99999999 'Missing' /
   INK88     0 'No' 1 'Yes' 9 'Missing' /
   IT01T     1 'Food' 2 'Daily Use Article' 3 'Consumer Durables' 4 'Other'
             9 'Missing' /
   IT01M     99999 'Missing' /
   IT01E     99999 'Missing' /
   IT02T     1 'Food' 2 'Daily Use Article' 3 'Consumer Durables' 4 'Other'
             9 'Missing' /
   IT02M     99999 'Missing' /
   IT02E     99999 'Missing' /
   IT03T     1 'Food' 2 'Daily Use Article' 3 'Consumer Durables' 4 'Other'
             9 'Missing' /
   IT03M     99999 'Missing' /
   IT03E     99999 'Missing' /
   IT04T     1 'Food' 2 'Daily Use Article' 3 'Consumer Durables' 4 'Other'
             9 'Missing' /
   IT04M     99999 'Missing' /
   IT04E     99999 'Missing' /
   IT05T     1 'Food' 2 'Daily Use Article' 3 'Consumer Durables' 4 'Other'
             9 'Missing' /
   IT05M     99999 'Missing' /
   IT05E     99999 'Missing' /
   IT06T     1 'Food' 2 'Daily Use Article' 3 'Consumer Durables' 4 'Other'
             9 'Missing' /
   IT06M     99999 'Missing' /
   IT06E     99999 'Missing' /
   IT07T     1 'Food' 2 'Daily Use Article' 3 'Consumer Durables' 4 'Other'
             9 'Missing' /
   IT07M     99999 'Missing' /
   IT07E     99999 'Missing' /
   IT08T     1 'Food' 2 'Daily Use Article' 3 'Consumer Durables' 4 'Other'
             9 'Missing' /
   IT08M     99999 'Missing' /
   IT08E     99999 'Missing' /
   .

* SPSS MISSING VALUES COMMAND.

* MISSING VALUES
     RELATION (9) /
     GENDER (9) /
     AGE (999) /
     STUDENT (9) /
     INCOME88 (9) /
     RESIDENC (9) /
     EDUCATIO (9) /
     PARTY (9) /
     MINORITY (9) /
     EMPLOY (9) /
     OWNSECT (99) /
     EMSECT (99) /
     TYPEEM (99) /
     SJ (9) /
     SOCCC (99) /
     SOWNSECT (99) /
     SEMSECT (99) /
     RETIRE (9) /
     WAGE (9) /
     TNRI88 (99999999) /
     OCI88 (99999999) /
     OLCI88 (99999999) /
     INK88 (9) /
     IT01T (9) /
     IT01M (99999) /
     IT01E (99999) /
     IT02T (9) /
     IT02M (99999) /
     IT02E (99999) /
     IT03T (9) /
     IT03M (99999) /
     IT03E (99999) /
     IT04T (9) /
     IT04M (99999) /
     IT04E (99999) /
     IT05T (9) /
     IT05M (99999) /
     IT05E (99999) /
     IT06T (9) /
     IT06M (99999) /
     IT06E (99999) /
     IT07T (9) /
     IT07M (99999) /
     IT07E (99999) /
     IT08T (9) /
     IT08M (99999) /
     IT08E (99999) /
   .

EXECUTE.

* Create SPSS system file.

*SAVE OUTFILE="spss-filename.sav".
