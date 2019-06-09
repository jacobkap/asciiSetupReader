/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 09836
 |                 CHINESE HOUSEHOLD INCOME PROJECT, 1988
 |                 (DATASET 0001: RURAL INDIVIDUAL DATA)
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
 | "c:\temp\09836-0001-data.txt").
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
  VALUE relation  1='Self' 2='Spouse' 3='Child' 4='Grandchild' 5='Parent'
                  6='Grandparent' 7='Other Relative' 8='Not Related'
                  9='Missing' ;
  VALUE gender    0='Male' 1='Female' 9='Missing' ;
  VALUE age       999='Missing' ;
  VALUE student   0='No' 1='Yes' 9='Missing' ;
  VALUE income8f  0='No' 1='Yes' 9='Missing' ;
  VALUE residenc  1='Living With Head of Household (HH)'
                  2='Not Living with HH but in Same Village'
                  3='Not Living in Same Village With HH' 9='Missing' ;
  VALUE educatio  1='College or Above' 2='Professional School'
                  3='Upper Middle School' 4='Lower Middle School'
                  5='Primary School Graduate'
                  6='Three Years or More of Primary School'
                  7='One to Three Years of Primary School' 8='Illiterate'
                  9='Missing' ;
  VALUE party     0='No' 1='Yes' 9='Missing' ;
  VALUE minority  0='No' 1='Yes' 9='Missing' ;
  VALUE employ    1='Working' 2='Disabled' 3='Retired'
                  4='Currently a Student' 5='Homemaker' 6='Other' 9='Missing' ;
  VALUE ownsect   1='State-owned. Operated by Center or Province'
                  2='Local State-owned' 3='Co-operative'
                  4='Private or Individually-owned'
                  5='Sino-foreign Joint Venture' 6='Foreign-owned'
                  7='Farming Under Household Responsibility System' 8='Other'
                  9='Not Currently Employed' 99='Missing' ;
  VALUE emsect    1='Agriculture' 2='Forestry' 3='Raising Livestock'
                  4='Fishery' 5='Family Sideline' 6='Industry'
                  7='Handicrafts' 8='Trade' 9='Construction' 10='Transport'
                  11='Catering-serving Food' 12='Other Services'
                  13='Post & Telecommunications' 14='Finance, Insurance'
                  15='Culture, Education, Health'
                  16='Party, Government or Social Organizations' 99='Missing' ;
  VALUE typeem    1='Official of Party or Government Office or Institution'
                  2='Technical Worker'
                  3='Leading Official of State or Collective Enterprise'
                  4='Ordinary Cadre of Party or GOvernment Office or Institution'
                  5='Owner and Manager of Private or Individual Enterprise'
                  6='Township or Village Cadre' 7='Ordinary Worker'
                  8='Temporary or Short-term Contract Worker' 9='Farmer'
                  10='Worker in Town or Township Enterprise'
                  11='Principal Official of Town or Township-operated Enterprise'
                  99='Missing' ;
  VALUE sj        0='No' 1='Yes' 9='Missing' ;
  VALUE soccc     1='State-owned. Operated by Center or Province'
                  2='Local State-owned' 3='Co-operative'
                  4='Private or Individually-owned'
                  5='Sino-foreign Joint Venture' 6='Foreign-owned'
                  7='Farming Under Household Responsibility System' 8='Other'
                  9='Not Currently Employed' 99='Missing' ;
  VALUE sownsect  1='Agriculture' 2='Forestry' 3='Raising Livestock'
                  4='Fishery' 5='Family Sideline' 6='Industry'
                  7='Handicrafts' 8='Trade' 9='Construction' 10='Transport'
                  11='Catering-serving Food' 12='Other Services'
                  13='Post & Telecommunications' 14='Finance, Insurance'
                  15='Culture, Education, Health'
                  16='Party, Government or Social Organizations' 99='Missing' ;
  VALUE semsect   1='Official of Party or Government Office or Institution'
                  2='Technical Worker'
                  3='Leading Official of State or Collective Enterprise'
                  4='Ordinary Cadre of Party or GOvernment Office or Institution'
                  5='Owner and Manager of Private or Individual Enterprise'
                  6='Township or Village Cadre' 7='Ordinary Worker'
                  8='Temporary or Short-term Contract Worker' 9='Farmer'
                  10='Worker in Town or Township Enterprise'
                  11='Principal Official of Town or Township-operated Enterprise'
                  99='Missing' ;
  VALUE retire    0='No' 1='Yes' 9='Missing' ;
  VALUE wage      0='No' 1='Yes' 9='Missing' ;
  VALUE tnri88ff  99999999='Missing' ;
  VALUE oci88fff  99999999='Missing' ;
  VALUE olci88ff  99999999='Missing' ;
  VALUE ink88fff  0='No' 1='Yes' 9='Missing' ;
  VALUE it01t     1='Food' 2='Daily Use Article' 3='Consumer Durables'
                  4='Other' 9='Missing' ;
  VALUE it01m     99999='Missing' ;
  VALUE it01e     99999='Missing' ;
  VALUE it02t     1='Food' 2='Daily Use Article' 3='Consumer Durables'
                  4='Other' 9='Missing' ;
  VALUE it02m     99999='Missing' ;
  VALUE it02e     99999='Missing' ;
  VALUE it03t     1='Food' 2='Daily Use Article' 3='Consumer Durables'
                  4='Other' 9='Missing' ;
  VALUE it03m     99999='Missing' ;
  VALUE it03e     99999='Missing' ;
  VALUE it04t     1='Food' 2='Daily Use Article' 3='Consumer Durables'
                  4='Other' 9='Missing' ;
  VALUE it04m     99999='Missing' ;
  VALUE it04e     99999='Missing' ;
  VALUE it05t     1='Food' 2='Daily Use Article' 3='Consumer Durables'
                  4='Other' 9='Missing' ;
  VALUE it05m     99999='Missing' ;
  VALUE it05e     99999='Missing' ;
  VALUE it06t     1='Food' 2='Daily Use Article' 3='Consumer Durables'
                  4='Other' 9='Missing' ;
  VALUE it06m     99999='Missing' ;
  VALUE it06e     99999='Missing' ;
  VALUE it07t     1='Food' 2='Daily Use Article' 3='Consumer Durables'
                  4='Other' 9='Missing' ;
  VALUE it07m     99999='Missing' ;
  VALUE it07e     99999='Missing' ;
  VALUE it08t     1='Food' 2='Daily Use Article' 3='Consumer Durables'
                  4='Other' 9='Missing' ;
  VALUE it08m     99999='Missing' ;
  VALUE it08e     99999='Missing' ;
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA;
INFILE "data-filename" LRECL=165;
INPUT
       UCODE 1-9               RELATION 10
        GENDER 11               AGE 12-14               STUDENT 15
        INCOME88 16             RESIDENC 17             EDUCATIO 18
        PARTY 19                MINORITY 20             EMPLOY 21
        OWNSECT 22-23           EMSECT 24-25            TYPEEM 26-27
        SJ 28                   SOCCC 29-30             SOWNSECT 31-32
        SEMSECT 33-34           RETIRE 35               MPEN 36-42 .1
        WAGE 43                 AMI88 44-50 .1          TNRI88 51-58
        OCI88 59-66             OLCI88 67-74            INK88 75
        IT01T 76                IT01M 77-81             IT01E 82-86
        IT02T 87                IT02M 88-92             IT02E 93-97
        IT03T 98                IT03M 99-103            IT03E 104-108
        IT04T 109               IT04M 110-114           IT04E 115-119
        IT05T 120               IT05M 121-125           IT05E 126-130
        IT06T 131               IT06M 132-136           IT06E 137-141
        IT07T 142               IT07M 143-147           IT07E 148-152
        IT08T 153               IT08M 154-158           IT08E 159-163
        NHHMEM 164-165          ;


* SAS LABEL STATEMENT;

LABEL
   UCODE   = 'HOUSEHOLD CODE'
   RELATION= 'RELATIONSHIP TO HEAD OF HOUSEHOLD'
   GENDER  = 'SEX OF HOUSEHOLD MEMBER'
   AGE     = 'AGE OF HOUSEHOLD MEMBER'
   STUDENT = 'STUDENT STATUS OF HOUSEHOLD MEMBER'
   INCOME88= 'INCOME RECIPIENT IN 1988'
   RESIDENC= 'LOCATION OF RESIDENCE'
   EDUCATIO= 'EDUCATION STATUS OF HOUSEHOLD MEMBER'
   PARTY   = 'MEMBER OF COMMUNIST PARTY'
   MINORITY= 'NATIONAL MINORITY'
   EMPLOY  = 'WORK SITUATION OF MEMBER'
   OWNSECT = 'EMPLOYER IN PRIMARY OCCUPATION'
   EMSECT  = 'SECTOR OF PRIMARY OCCUPATION'
   TYPEEM  = 'NATURE OF PRIMARY OCCUPATION'
   SJ      = 'SECOND JOB'
   SOCCC   = 'EMPLOYER IN SECOND OCCUPATION'
   SOWNSECT= 'SECTOR OF SECOND OCCUPATION'
   SEMSECT = 'NATURE OF SECOND OCCUPATION'
   RETIRE  = 'RETIRED IN OR BEFORE 1988'
   MPEN    = 'RETIREMENT PENSION/MONTH, 1988'
   WAGE    = 'WAGE STATUS, 1988'
   AMI88   = 'REGULAR COMPENSATION/MONTH 1988'
   TNRI88  = 'TOTAL NON-REGULAR INCOME, 1988'
   OCI88   = 'OTHER CASH INCOME FROM WORK UNIT, 1988'
   OLCI88  = 'OTHER CASH INCOME FROM WORKING, 1988'
   INK88   = 'INCOME IN KIND FROM WORK UNIT, 1988'
   IT01T   = 'ITEM TYPE'
   IT01M   = 'ESTIMATED MARKET PRICE (YUAN)'
   IT01E   = 'AMOUNT PAID BY MEMBER (YUAN)'
   IT02T   = 'ITEM TYPE'
   IT02M   = 'ESTIMATED MARKET PRICE (YUAN)'
   IT02E   = 'AMOUNT PAID BY MEMBER (YUAN)'
   IT03T   = 'ITEM TYPE'
   IT03M   = 'ESTIMATED MARKET PRICE (YUAN)'
   IT03E   = 'AMOUNT PAID BY MEMBER (YUAN)'
   IT04T   = 'ITEM TYPE'
   IT04M   = 'ESTIMATED MARKET PRICE (YUAN)'
   IT04E   = 'AMOUNT PAID BY MEMBER (YUAN)'
   IT05T   = 'ITEM TYPE'
   IT05M   = 'ESTIMATED MARKET PRICE (YUAN)'
   IT05E   = 'AMOUNT PAID BY MEMBER (YUAN)'
   IT06T   = 'ITEM TYPE'
   IT06M   = 'ESTIMATED MARKET PRICE (YUAN)'
   IT06E   = 'AMOUNT PAID BY MEMBER (YUAN)'
   IT07T   = 'ITEM TYPE'
   IT07M   = 'ESTIMATED MARKET PRICE (YUAN)'
   IT07E   = 'AMOUNT PAID BY MEMBER (YUAN)'
   IT08T   = 'ITEM TYPE'
   IT08M   = 'ESTIMATED MARKET PRICE (YUAN)'
   IT08E   = 'AMOUNT PAID BY MEMBER (YUAN)'
   NHHMEM  = '# OF MEMBERS IN HOUSEHOLD'
        ;


* USER-DEFINED MISSING VALUES RECODE TO SAS SYSMIS;

/*
   IF (RELATION = 9) THEN RELATION = .;
   IF (GENDER = 9) THEN GENDER = .;
   IF (AGE = 999) THEN AGE = .;
   IF (STUDENT = 9) THEN STUDENT = .;
   IF (INCOME88 = 9) THEN INCOME88 = .;
   IF (RESIDENC = 9) THEN RESIDENC = .;
   IF (EDUCATIO = 9) THEN EDUCATIO = .;
   IF (PARTY = 9) THEN PARTY = .;
   IF (MINORITY = 9) THEN MINORITY = .;
   IF (EMPLOY = 9) THEN EMPLOY = .;
   IF (OWNSECT = 99) THEN OWNSECT = .;
   IF (EMSECT = 99) THEN EMSECT = .;
   IF (TYPEEM = 99) THEN TYPEEM = .;
   IF (SJ = 9) THEN SJ = .;
   IF (SOCCC = 99) THEN SOCCC = .;
   IF (SOWNSECT = 99) THEN SOWNSECT = .;
   IF (SEMSECT = 99) THEN SEMSECT = .;
   IF (RETIRE = 9) THEN RETIRE = .;
   IF (WAGE = 9) THEN WAGE = .;
   IF (TNRI88 = 99999999) THEN TNRI88 = .;
   IF (OCI88 = 99999999) THEN OCI88 = .;
   IF (OLCI88 = 99999999) THEN OLCI88 = .;
   IF (INK88 = 9) THEN INK88 = .;
   IF (IT01T = 9) THEN IT01T = .;
   IF (IT01M = 99999) THEN IT01M = .;
   IF (IT01E = 99999) THEN IT01E = .;
   IF (IT02T = 9) THEN IT02T = .;
   IF (IT02M = 99999) THEN IT02M = .;
   IF (IT02E = 99999) THEN IT02E = .;
   IF (IT03T = 9) THEN IT03T = .;
   IF (IT03M = 99999) THEN IT03M = .;
   IF (IT03E = 99999) THEN IT03E = .;
   IF (IT04T = 9) THEN IT04T = .;
   IF (IT04M = 99999) THEN IT04M = .;
   IF (IT04E = 99999) THEN IT04E = .;
   IF (IT05T = 9) THEN IT05T = .;
   IF (IT05M = 99999) THEN IT05M = .;
   IF (IT05E = 99999) THEN IT05E = .;
   IF (IT06T = 9) THEN IT06T = .;
   IF (IT06M = 99999) THEN IT06M = .;
   IF (IT06E = 99999) THEN IT06E = .;
   IF (IT07T = 9) THEN IT07T = .;
   IF (IT07M = 99999) THEN IT07M = .;
   IF (IT07E = 99999) THEN IT07E = .;
   IF (IT08T = 9) THEN IT08T = .;
   IF (IT08M = 99999) THEN IT08M = .;
   IF (IT08E = 99999) THEN IT08E = .;
*/


* SAS FORMAT STATEMENT;

/*
  FORMAT RELATION relation. GENDER gender. AGE age.
         STUDENT student. INCOME88 income8f. RESIDENC residenc.
         EDUCATIO educatio. PARTY party. MINORITY minority.
         EMPLOY employ. OWNSECT ownsect. EMSECT emsect.
         TYPEEM typeem. SJ sj. SOCCC soccc.
         SOWNSECT sownsect. SEMSECT semsect. RETIRE retire.
         WAGE wage. TNRI88 tnri88ff. OCI88 oci88fff.
         OLCI88 olci88ff. INK88 ink88fff. IT01T it01t.
         IT01M it01m. IT01E it01e. IT02T it02t.
         IT02M it02m. IT02E it02e. IT03T it03t.
         IT03M it03m. IT03E it03e. IT04T it04t.
         IT04M it04m. IT04E it04e. IT05T it05t.
         IT05M it05m. IT05E it05e. IT06T it06t.
         IT06M it06m. IT06E it06e. IT07T it07t.
         IT07M it07m. IT07E it07e. IT08T it08t.
         IT08M it08m. IT08E it08e.  ;
*/

RUN ;
