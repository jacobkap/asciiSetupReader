/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 04347
 |         CURRENT POPULATION SURVEY, 2004: CELL PHONE SUPPLEMENT
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
 | "c:\temp\04347-0001-data.txt").
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
  VALUE hurespli  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE' ;
  VALUE hufinal   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  0='(0) NEW INTERVIEW - NOT CONTACTED'
                  1='(1) FULLY COMPLETE CATI INTERVIEW'
                  2='(2) PARTIALLY COMPLETED CATI INTERVIEW'
                  4='(4) PARTIAL CATI -NO COMPLETE AT CLOSEOUT'
                  5='(5) LABOR FORCE COMPLETE, SUPPLEMENT INCOMPLETE - CATI'
                  24='(24) HH OCCUPIED ENTIRELY BY ARMED FORCES MEMBERS'
                  115='(115) PARTIAL INTERVIEW WITH CALLBACK PLANNED - CATI'
                  200='(200) NEW INTERVIEW - CONTACTED' 201='(201) CAPI COMPLETE'
                  202='(202) CALLBACK NEEDED'
                  203='(203) SUFFICIENT PARTIAL - PRECLOSEOUT'
                  204='(204) SUFFICIENT PARTIAL - AT CLOSEOUT'
                  205='(205) LABOR FORCE COMPLETE, - SUPPL. INCOMPLETE - CAPI'
                  210='(210) CAPI COMPLETE REINTERVIEW' 216='(216) NO ONE HOME'
                  217='(217) TEMPORARILY ABSENT' 218='(218) REFUSED'
                  219='(219) OTHER OCCUPIED - SPECIFY'
                  224='(224) ARMED FORCES OCCUPIED OR UNDER AGE 14'
                  225='(225) TEMP. OCCUPIED W/PERSONS WITH URE'
                  226='(226) VACANT REGULAR'
                  227='(227) VACANT - STORAGE OF HHLD FURNITURE'
                  228='(228) UNFIT, TO BE DEMOLISHED'
                  229='(229) UNDER CONSTRUCTION, NOT READY'
                  230='(230) CONVERTED TO TEMP BUSINESS OR STORAGE'
                  231='(231) UNOCCUPIED TENT OR TRAILER SITE'
                  232='(232) PERMIT GRANTED - CONSTRUCTION NOT STARTED'
                  233='(233) OTHER - SPECIFY' 240='(240) DEMOLISHED'
                  241='(241) HOUSE OR TRAILER MOVED' 242='(242) OUTSIDE SEGMENT'
                  243='(243) CONVERTED TO PERM. BUSINESS OR STORAGE' 244='(244) MERGED'
                  245='(245) CONDEMNED' 246='(246) BUILT AFTER APRIL 1, 1980'
                  247='(247) UNUSED SERIAL NO./LISTING SHEET LINE'
                  248='(248) OTHER - SPECIFY' ;
  VALUE huspnish  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) SPANISH ONLY LANGUAGE SPOKEN' ;
  VALUE hetenure  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) OWNED OR BEING BOUGHT BY A HH MEMBER'
                  2='(2) RENTED FOR CASH'
                  3='(3) OCCUPIED WITHOUT PAYMENT OF CASH RENT' ;
  VALUE hehousut  0='(0) OTHER UNIT' 1='(1) HOUSE, APARTMENT, FLAT'
                  2='(2) HU IN NONTRANSIENT HOTEL, MOTEL, ETC.'
                  3='(3) HU PERMANENT IN TRANSIENT HOTEL, MOTEL'
                  4='(4) HU IN ROOMING HOUSE'
                  5='(5) MOBILE HOME OR TRAILER W/NO PERM. ROOM ADDED'
                  6='(6) MOBILE HOME OR TRAILER W/1 OR MORE PERM. ROOMS ADDED'
                  7='(7) HU NOT SPECIFIED ABOVE'
                  8='(8) QUARTERS NOT HU IN ROOMING OR BRDING HS'
                  9='(9) UNIT NOT PERM. IN TRANSIENT HOTL, MOTL'
                  10='(10) UNOCCUPIED TENT SITE OR TRLR SITE'
                  11='(11) STUDENT QUARTERS IN COLLEGE DORM'
                  12='(12) OTHER UNIT NOT SPECIFIED ABOVE' ;
  VALUE hetelhhd  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE hetelavl  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE hephoneo  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  0='(0) UNKNOWN' 1='(1) YES' 2='(2) NO' ;
  VALUE hufaminc  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) LESS THAN $5,000' 2='(2) 5,000 TO 7,499' 3='(3) 7,500 TO 9,999'
                  4='(4) 10,000 TO 12,499' 5='(5) 12,500 TO 14,999'
                  6='(6) 15,000 TO 19,999' 7='(7) 20,000 TO 24,999'
                  8='(8) 25,000 TO 29,999' 9='(9) 30,000 TO 34,999'
                  10='(10) 35,000 TO 39,999' 11='(11) 40,000 TO 49,999'
                  12='(12) 50,000 TO 59,999' 13='(13) 60,000 TO 74,999'
                  14='(14) 75,000 OR MORE' 15='(15) 15: UNDOCUMENTED CODE'
                  16='(16) 16: UNDOCUMENTED CODE' ;
  VALUE hrintsta  1='(1) INTERVIEW' 2='(2) TYPE A NON-INTERVIEW'
                  3='(3) TYPE B NON-INTERVIEW' 4='(4) TYPE C NON-INTERVIEW' ;
  VALUE hrhtype   0='(0) NON-INTERVIEW HOUSEHOLD'
                  1='(1) HUSBAND/WIFE PRIMARY FAMILY (NEITHER AF)'
                  2='(2) HUSB/WIFE PRIM. FAMILY (EITHER/BOTH AF)'
                  3='(3) UNMARRIED CIVILIAN MALE-PRIM. FAM HHLDER'
                  4='(4) UNMARRIED CIV. FEMALE-PRIM FAM HHLDER'
                  5='(5) PRIMARY FAMILY HHLDER-RP IN AF, UNMAR.'
                  6='(6) CIVILIAN MALE PRIMARY INDIVIDUAL'
                  7='(7) CIVILIAN FEMALE PRIMARY INDIVIDUAL'
                  8='(8) PRIMARY INDIVIDUAL HHLD-RP IN AF'
                  9='(9) GROUP QUARTERS WITH FAMILY'
                  10='(10) GROUP QUARTERS WITHOUT FAMILY' ;
  VALUE huinttyp  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  0='(0) NONINTERVIEW/INDETERMINATE' 1='(1) PERSONAL' 2='(2) TELEPHONE' ;
  VALUE huprscnt  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE' ;
  VALUE hrlonglk  0='(0) MIS 1 OR REPLACEMENT HH (NO LINK)'
                  2='(2) MIS 2-4 OR MIS 6-8' 3='(3) MIS 5' ;
  VALUE huhhnum   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE' ;
  VALUE hubus     -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE hubusl1f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE' ;
  VALUE hubusl2f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE' ;
  VALUE hubusl3f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE' ;
  VALUE hubusl4f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE' ;
  VALUE gereg     1='(1) NORTHEAST' 2='(2) MIDWEST (FORMERLY NORTH CENTRAL)'
                  3='(3) SOUTH' 4='(4) WEST' ;
  VALUE gestcen   11='(11) ME' 12='(12) NH' 13='(13) VT' 14='(14) MA' 15='(15) RI' 16='(16) CT' 21='(21) NY'
                  22='(22) NJ' 23='(23) PA' 31='(31) OH' 32='(32) IN' 33='(33) IL' 34='(34) MI' 35='(35) WI'
                  41='(41) MN' 42='(42) IA' 43='(43) MO' 44='(44) ND' 45='(45) SD' 46='(46) NE' 47='(47) KS'
                  51='(51) DE' 52='(52) MD' 53='(53) DC' 54='(54) VA' 55='(55) WV' 56='(56) NC' 57='(57) SC'
                  58='(58) GA' 59='(59) FL' 61='(61) KY' 62='(62) TN' 63='(63) AL' 64='(64) MS' 71='(71) AR'
                  72='(72) LA' 73='(73) OK' 74='(74) TX' 81='(81) MT' 82='(82) ID' 83='(83) WY' 84='(84) CO'
                  85='(85) NM' 86='(86) AZ' 87='(87) UT' 88='(88) NV' 91='(91) WA' 92='(92) OR' 93='(93) CA'
                  94='(94) AK' 95='(95) HI' ;
  VALUE gestfips  1='(1) AL' 2='(2) AK' 4='(4) AZ' 5='(5) AR' 6='(6) CA' 8='(8) CO' 9='(9) CT' 10='(10) DE'
                  11='(11) DC' 12='(12) FL' 13='(13) GA' 15='(15) HI' 16='(16) ID' 17='(17) IL' 18='(18) IN'
                  19='(19) IA' 20='(20) KS' 21='(21) KY' 22='(22) LA' 23='(23) ME' 24='(24) MD' 25='(25) MA'
                  26='(26) MI' 27='(27) MN' 28='(28) MS' 29='(29) MO' 30='(30) MT' 31='(31) NE' 32='(32) NV'
                  33='(33) NH' 34='(34) NJ' 35='(35) NM' 36='(36) NY' 37='(37) NC' 38='(38) ND' 39='(39) OH'
                  40='(40) OK' 41='(41) OR' 42='(42) PA' 44='(44) RI' 45='(45) SC' 46='(46) SD' 47='(47) TN'
                  48='(48) TX' 49='(49) UT' 50='(50) VT' 51='(51) VA' 53='(53) WA' 54='(54) WV' 55='(55) WI'
                  56='(56) WY' ;
  VALUE pupelig   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) ELIGIBLE FOR INTERVIEW' 2='(2) LABOR FORCE FULLY COMPLETE'
                  3='(3) MISSING LABOR FORCE DATA FOR PERSON' 4='(4) (NOT USED)'
                  5='(5) ASSIGNED IF AGE IS BLANK' 6='(6) ARMED FORCES MEMBER'
                  7='(7) UNDER 15 YEARS OLD' 8='(8) NOT A HH MEMBER' 9='(9) DELETED'
                  10='(10) DECEASED' 11='(11) END OF LIST' 12='(12) AFTER END OF LIST' ;
  VALUE perrp     -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) REFERENCE PERSON W/RELS.' 2='(2) REFERENCE PERSON W/O RELS.'
                  3='(3) SPOUSE' 4='(4) CHILD' 5='(5) GRANDCHILD' 6='(6) PARENT'
                  7='(7) BROTHER/SISTER' 8='(8) OTHER REL. OR REF. PERSON'
                  9='(9) FOSTER CHILD' 10='(10) NONREL. OF REF. PERSON W/RELS.'
                  11='(11) NOT USED' 12='(12) NONREL. OF REF. PERSON W/O RELS.'
                  13='(13) UNMARRIED PARTNER W/RELS.'
                  14='(14) UNMARRIED PARTNER W/OUT RELS.'
                  15='(15) HOUSEMATE/ROOMMATE W/RELS.'
                  16='(16) HOUSEMATE/ROOMMATE W/OUT RELS.'
                  17='(17) ROOMER/BOARDER W/RELS.' 18='(18) ROOMER/BOARDER W/OUT RELS.' ;
  VALUE peparent  -1='(-1) NO PARENT' ;
  VALUE peage     -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE' ;
  VALUE ptage     0='(0) NO TOP CODE' 1='(1) TOP CODED VALUE FOR AGE' ;
  VALUE pemaritl  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) MARRIED - SPOUSE PRESENT' 2='(2) MARRIED - SPOUSE ABSENT'
                  3='(3) WIDOWED' 4='(4) DIVORCED' 5='(5) SEPARATED' 6='(6) NEVER MARRIED' ;
  VALUE pespouse  -1='(-1) NO SPOUSE' ;
  VALUE pesex     -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) MALE' 2='(2) FEMALE' ;
  VALUE puafever  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE peafwhen  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) VIETNAM ERA (8/64-4/75)' 2='(2) KOREAN WAR (6/50-1/55)'
                  3='(3) WORLD WAR II (9/40-7/47)' 4='(4) WORLD WAR I (4/17-11/18)'
                  5='(5) OTHER SERVICE (ALL OTHER PERIODS)' 6='(6) NONVETERAN' ;
  VALUE peafnow   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE peeduca   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  31='(31) LESS THAN 1ST GRADE' 32='(32) 1ST, 2ND, 3RD OR 4TH GRADE'
                  33='(33) 5TH OR 6TH GRADE' 34='(34) 7TH OR 8TH GRADE' 35='(35) 9TH GRADE'
                  36='(36) 10TH GRADE' 37='(37) 11TH GRADE' 38='(38) 12TH GRADE NO DIPLOMA'
                  39='(39) HIGH SCHOOL GRAD-DIPLOMA OR EQUIV (GED)'
                  40='(40) SOME COLLEGE BUT NO DEGREE'
                  41='(41) ASSOCIATE DEGREE-OCCUPATIONAL/ VOCATIONAL'
                  42='(42) ASSOCIATE DEGREE-ACADEMIC PROGRAM'
                  43='(43) BACHELOR''S DEGREE (EX: BA, AB, BS)'
                  44='(44) MASTER''S DEGREE (EX: MA, MS, MEng, MEd, MSW)'
                  45='(45) PROFESSIONAL SCHOOL DEG (EX: MD,DDS, DVM)'
                  46='(46) DOCTORATE DEGREE (EX: PhD, EdD)' ;
  VALUE prdtrace  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) WHITE ONLY' 2='(2) BLACK ONLY'
                  3='(3) AMERICAN INDIAN, ALASKAN NATIVE ONLY' 4='(4) ASIAN ONLY'
                  5='(5) HAWAIIAN/PACIFIC ISLANDER ONLY' 6='(6) WHITE-BLACK'
                  7='(7) WHITE-AI' 8='(8) WHITE-ASIAN' 9='(9) WHITE-HAWAIIAN'
                  10='(10) BLACK-AI' 11='(11) BLACK-ASIAN' 12='(12) BLACK-HP' 13='(13) AI-ASIAN'
                  14='(14) ASIAN-HP' 15='(15) W-B-AI' 16='(16) W-B-A' 17='(17) W-AI-A'
                  18='(18) W-A-HP' 19='(19) W-B-AI-A' 20='(20) 2 OR 3 RACES'
                  21='(21) 4 OR 5 RACES' ;
  VALUE prdthsp   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) MEXICAN' 2='(2) PUERTO RICAN' 3='(3) CUBAN'
                  4='(4) CENTRAL/SOUTH AMERICAN' 5='(5) OTHER SPANISH' ;
  VALUE puchinhh  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) PERSON ADDED' 2='(2) PERSON ADDED - URE'
                  3='(3) PERSON UNDELETED' 4='(4) PERSON DIED'
                  5='(5) DELETED FOR REASON OTHER THAN DEATH'
                  6='(6) PERSON JOINED ARMED FORCES' 7='(7) PERSON NO LONGER IN AF'
                  9='(9) CHANGE IN DEMOGRAPHIC INFORMATION' ;
  VALUE purelflg  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  0='(0) NOT OWNER OR RELATED TO OWNER'
                  1='(1) OWNER OF BUS OR RELATED TO OWNER OF BUS' ;
  VALUE pulineno  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE' ;
  VALUE prfamnum  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  0='(0) NOT A FAMILY MEMBER' 1='(1) PRIMARY FAMILY MEMBER ONLY'
                  2='(2) SUBFAMILY NO. 2 MEMBER' 3='(3) SUBFAMILY NO. 3 MEMBER'
                  4='(4) SUBFAMILY NO. 4 MEMBER' 5='(5) SUBFAMILY NO. 5 MEMBER'
                  6='(6) SUBFAMILY NO. 6 MEMBER' 7='(7) SUBFAMILY NO. 7 MEMBER'
                  8='(8) SUBFAMILY NO. 8 MEMBER' 9='(9) SUBFAMILY NO. 9 MEMBER'
                  10='(10) SUBFAMILY NO. 10 MEMBER' 11='(11) SUBFAMILY NO. 11 MEMBER'
                  12='(12) SUBFAMILY NO. 12 MEMBER' 13='(13) SUBFAMILY NO. 13 MEMBER'
                  14='(14) SUBFAMILY NO. 14 MEMBER' 15='(15) SUBFAMILY NO. 15 MEMBER'
                  16='(16) SUBFAMILY NO. 16 MEMBER' 17='(17) SUBFAMILY NO. 17 MEMBER'
                  18='(18) SUBFAMILY NO. 18 MEMBER' 19='(19) SUBFAMILY NO. 19 MEMBER' ;
  VALUE prfamrel  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  0='(0) NOT A FAMILY MEMBER' 1='(1) REFERENCE PERSON' 2='(2) SPOUSE'
                  3='(3) CHILD' 4='(4) OTHER RELATIVE (PRIMARY FAMILY & UNREL)' ;
  VALUE prfamtyp  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) PRIMARY FAMILY' 2='(2) PRIMARY INDIVIDUAL'
                  3='(3) RELATED SUBFAMILY' 4='(4) UNRELATED SUBFAMILY'
                  5='(5) SECONDARY INDIVIDUAL' ;
  VALUE pehspnon  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) HISPANIC' 2='(2) NON-HIPSANIC' ;
  VALUE prmarsta  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) MARRIED, CIVILIAN SPOUSE PRESENT'
                  2='(2) MARRIED, ARMED FORCES SPOUSE PRESENT'
                  3='(3) MARRIED, SPOUSE ABSENT (EXC. SEPARATED)' 4='(4) WIDOWED'
                  5='(5) DIVORCED' 6='(6) SEPARATED' 7='(7) NEVER MARRIED' ;
  VALUE prpertyp  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) CHILD HOUSEHOLD MEMBER'
                  2='(2) ADULT CIVILIAN HOUSEHOLD MEMBER'
                  3='(3) ADULT ARMED FORCES HOUSEHOLD MEMBER' ;
  VALUE penatvty  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  57='(57) UNITED STATES' 72='(72) PUERTO RICO' 96='(96) U.S. OUTLYING AREA'
                  555='(555) ABROAD, COUNTRY NOT KNOWN' ;
  VALUE pemntvty  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  57='(57) UNITED STATES' 72='(72) PUERTO RICO' 96='(96) U.S. OUTLYING AREA'
                  555='(555) ABROAD, COUNTRY NOT KNOWN' ;
  VALUE pefntvty  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  57='(57) UNITED STATES' 72='(72) PUERTO RICO' 96='(96) U.S. OUTLYING AREA'
                  555='(555) ABROAD, COUNTRY NOT KNOWN' ;
  VALUE prcitshp  1='(1) NATIVE, BORN IN THE UNITED STATES'
                  2='(2) NATIVE, BORN IN PUERTO RICO OR U.S. OUTLYING AREA'
                  3='(3) NATIVE, BORN ABROAD OF AMERICAN PARENT OR PARENTS'
                  4='(4) FOREIGN BORN, U.S. CITIZEN BY NATURALIZATION'
                  5='(5) FOREIGN BORN, NOT A CITIZEN OF THE UNITED STATES' ;
  VALUE prcitflg  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE prinusyr  -1='(-1) NOT IN UNIVERSE (BORN IN U.S.)' 0='(0) NOT FOREIGN BORN'
                  1='(1) BEFORE 1950' 2='(2) 1950-1959' 3='(3) 1960-1964' 4='(4) 1965-1969'
                  5='(5) 1970-1974' 6='(6) 1975-1979' 7='(7) 1980-1981' 8='(8) 1982-1983'
                  9='(9) 1984-1985' 10='(10) 1986-1987' 11='(11) 1988-1989' 12='(12) 1990-1991'
                  13='(13) 1992-1993' 14='(14) 1994-1995' 15='(15) 1996-1997' 16='(16) 1998-1999'
                  17='(17) 2000-2001' 18='(18) 2002-2003' 19='(19) 2004-2007' ;
  VALUE puslfprx  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) SELF' 2='(2) PROXY' 3='(3) BOTH SELF AND PROXY' ;
  VALUE pemlr     -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) EMPLOYED-AT WORK' 2='(2) EMPLOYED-ABSENT'
                  3='(3) UNEMPLOYED-ON LAYOFF' 4='(4) UNEMPLOYED-LOOKING'
                  5='(5) NOT IN LABOR FORCE-RETIRED'
                  6='(6) NOT IN LABOR FORCE-DISABLED'
                  7='(7) NOT IN LABOR FORCE-OTHER' ;
  VALUE puwk      -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' 3='(3) RETIRED' 4='(4) DISABLED' 5='(5) UNABLE TO WORK' ;
  VALUE pubus1ff  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE pubus2ot  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE pubusckf  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) GOTO PUBUS1' 2='(2) GOTO PURETCK1' ;
  VALUE pubusc0f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) GOTO PUHRUSL1' 2='(2) GOTO PUBUS2' ;
  VALUE pubusc1f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) GOTO PUABSRSN' 2='(2) GOTO PULAY' ;
  VALUE pubusc2f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) GOTO PUHRUSL1' 2='(2) GOTO PUABSPD' ;
  VALUE puretot   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' 3='(3) WAS NOT RETIRED LAST MONTH' ;
  VALUE pudis     -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' 3='(3) DID NOT HAVE DISABILITY LAST MONTH' ;
  VALUE peret1ff  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' 3='(3) HAS A JOB' ;
  VALUE pudis1ff  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE pudis2ff  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE puabsot   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' 3='(3) RETIRED' 4='(4) DISABLED' 5='(5) UNABLE TO WORK' ;
  VALUE pulay     -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' 3='(3) RETIRED' 4='(4) DISABLED' 5='(5) UNABLE TO WORK' ;
  VALUE peabsrsn  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) ON LAYOFF' 2='(2) SLACK WORK/BUSINESS CONDITIONS'
                  3='(3) WAITING FOR A NEW JOB TO BEGIN'
                  4='(4) VACATION/PERSONAL DAYS'
                  5='(5) OWN ILLNESS/INJURY/MEDICAL PROBLEMS'
                  6='(6) CHILD CARE PROBLEMS'
                  7='(7) OTHER FAMILY/PERSONAL OBLIGATION'
                  8='(8) MATERNITY/PATERNITY LEAVE' 9='(9) LABOR DISPUTE'
                  10='(10) WEATHER AFFECTED JOB' 11='(11) SCHOOL/TRAINING'
                  12='(12) CIVIC/MILITARY DUTY' 13='(13) DOES NOT WORK IN THE BUSINESS'
                  14='(14) OTHER (SPECIFY)' ;
  VALUE peabspdo  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE pemjot    -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE pemjnum   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  2='(2) 2 JOBS' 3='(3) 3 JOBS' 4='(4) 4 OR MORE JOBS' ;
  VALUE pehruslf  -4='(-4) HOURS VARY' -3='(-3) REFUSED' -2='(-2) DON''T KNOW'
                  -1='(-1) BLANK OR NOT IN UNIVERSE' ;
  VALUE pehrus0f  -4='(-4) HOURS VARY' -3='(-3) REFUSED' -2='(-2) DON''T KNOW'
                  -1='(-1) BLANK OR NOT IN UNIVERSE' ;
  VALUE pehrftpt  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' 3='(3) HOURS VARY' ;
  VALUE pehruslt  -4='(-4) VARIES' -3='(-3) REFUSED' -2='(-2) DON''T KNOW'
                  -1='(-1) BLANK OR NOT IN UNIVERSE' ;
  VALUE pehrwant  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' 3='(3) REGULAR HOURS ARE FULL-TIME' ;
  VALUE pehrrsnf  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) SLACK WORK/BUSINESS CONDITIONS'
                  2='(2) COULD ONLY FIND PART-TIME WORK' 3='(3) SEASONAL WORK'
                  4='(4) CHILD CARE PROBLEMS'
                  5='(5) OTHER FAMILY/PERSONAL OBLIGATIONS'
                  6='(6) HEALTH/MEDICAL LIMITATIONS' 7='(7) SCHOOL/TRAINING'
                  8='(8) RETIRED/SOCIAL SECURITY LIMIT ON EARNINGS'
                  9='(9) FULL-TIME WORKWEEK IS LESS THAN 35 HRS'
                  10='(10) OTHER - SPECIFY' ;
  VALUE pehrrs0f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) CHILD CARE PROBLEMS'
                  2='(2) OTHER FAMILY/PERSONAL OBLIGATIONS'
                  3='(3) HEALTH/MEDICAL LIMITATIONS' 4='(4) SCHOOL/TRAINING'
                  5='(5) RETIRED/SOCIAL SECURITY LIMIT ON EARNINGS'
                  6='(6) FULL-TIME WORKWEEK LESS THAN 35 HOURS'
                  7='(7) OTHER - SPECIFY' ;
  VALUE pehrrs1f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) SLACK WORK/BUSINESS CONDITIONS' 2='(2) SEASONAL WORK'
                  3='(3) JOB STARTED OR ENDED DURING WEEK'
                  4='(4) VACATION/PERSONAL DAY'
                  5='(5) OWN ILLNESS/INJURY/MEDICAL APPOINTMENT'
                  6='(6) HOLIDAY (LEGAL OR RELIGIOUS)' 7='(7) CHILD CARE PROBLEMS'
                  8='(8) OTHER FAMILY/PERSONAL OBLIGATIONS' 9='(9) LABOR DISPUTE'
                  10='(10) WEATHER AFFECTED JOB' 11='(11) SCHOOL/TRAINING'
                  12='(12) CIVIC/MILITARY DUTY' 13='(13) OTHER REASON' ;
  VALUE puhrofff  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE puhrof0f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE' ;
  VALUE puhrot1f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE puhrot2f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE' ;
  VALUE pehractf  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE' ;
  VALUE pehrac0f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE' ;
  VALUE pehractt  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE' ;
  VALUE pehravl   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE puhrck1f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) GOTO PUHRUSL2' 2='(2) GOTO PUHRUSLT' ;
  VALUE puhrck2f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) IF ENTRY OF 1 IN MJ AND ENTRY OF D, R OR V IN HRUSL1 AND ENTRY OF D, R, V OR 0-34 IN HRUSL2 GOTO HRFTPT'
                  2='(2) IF ENTRY OF 1 IN MJ AND ENTRY OF D, R OR V IN HRUSL2 AND ENTRY OF D, R V OR 0-34 IN HRUSL1 GOTO HRFTPT'
                  3='(3) IF ENTRY OF 2, D OR R IN MJ AND ENTRY OF D, R OR V IN HRUSL1 GOTO HRFTPT'
                  4='(4) IF ENTRY OF 1 IN BUS1 AND ENTRY OF D, R OR V IN HRUSL1 THEN GOTO HRFTPT'
                  5='(5) ALL OTHERS GOTO HRCK3-C' ;
  VALUE puhrck3f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) IF ENTRY OF 1 IN ABSOT OR (ENTRY OR 2 IN ABSOT AND ENTRY OF 1 IN BUS AND CURRENT R_P EQUALS BUSLST) THEN GOTO HRCK8'
                  2='(2) IF ENTRY OF 3 IN RET1 GOTO HRCK8'
                  3='(3) IF ENTRY IN HRUSLT IS 0-34 HOURS GO TO HRCK4-C'
                  4='(4) IF ENTRY IN HRUSLT IS 35+ GOTO HROFF1'
                  5='(5) ALL OTHERS GOTO HRCK4-C' 6='(6) GOTO PUHRCK4' ;
  VALUE puhrck4f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) IF ENTRY OF 1, D, R OR V IN HRFTPT THEN GOTO HRACT1'
                  2='(2) IF ENTRY OF 2, D OR R IN BUS2 THEN GOTO HROFF1'
                  3='(3) IF HRUSLT IS 0-34 THEN GOTO HRWANT'
                  4='(4) IF ENTRY OF 2 IN HRFTPT THEN GOTO HRWANT'
                  5='(5) ALL OTHERS GOTO HRACT1' ;
  VALUE puhrck5f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) IF ENTRY OF 1 IN MJOT GOTO HRACT2'
                  2='(2) ALL OTHERS GOTO HRCK6-C' ;
  VALUE puhrck6f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) IF HRACT1 AND HRACT2 EQ 0 AND ENTRY OF 2, D, R IN BUS2 THEN GOTO LK'
                  2='(2) IF HRACT1 AND HRACT2 EQ 0 THEN STORE 1 IN ABSOT AND GOTO ABSRSN'
                  3='(3) ALL OTHERS GOTO HRACTT-C' ;
  VALUE puhrck7f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) (IF ENTRY OF 2, D OR R IN BUS2) AND (HRACT1 LESS THAN 15 OR D) GOTO HRCK8'
                  2='(2) (IF ENTRY OF 2, D OR R IN BUS2) AND (HRACT1 IS 15+) GOTO HRCK8'
                  3='(3) (IF HRUSLT IS 35+ OR IF ENTRY OF 1 IN HRFTPT) AND (HRACTT < 35) AND ENTRY IN HRACT1 OR HRACT2 ISN''T D OR R THEN GOTO HRR'
                  4='(4) IF ENTRY OF 1 IN HRWANT AND HRACTT < 35 AND (ENTRY OF 1, 2, 3 IN HRRSN1) GOTO HRAVL'
                  5='(5) ALL OTHERS GOTO HRCK8' ;
  VALUE puhrck0f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) IF ENTRY OF 2, D OR R IN BUS2 AND HRACTT IS LESS THAN 15 OR D GOTO LK'
                  2='(2) ALL OTHERS GOTO IOCK1' ;
  VALUE pulaydt   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE pulay6m   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE pelayavl  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE pulayavr  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) OWN TEMPORARY ILLNESS' 2='(2) GOING TO SCHOOL' 3='(3) OTHER' ;
  VALUE pelaylk   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE pelaydur  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE' ;
  VALUE pelayfto  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE pulayckf  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) GOTO PULAYCK3' 2='(2) GOTO PULAYFT' 3='(3) GOTO PULAYDR' ;
  VALUE pulayc0f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) GOTO PULAYDR3' 2='(2) GOTO PULAYFT' ;
  VALUE pulayc1f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) MISCK = 5 GOTO IO1INT'
                  2='(2) I-ICR = 1 OR I-OCR = 1, GOTO IO1INT'
                  3='(3) ALL OTHERS GOTO SCHCK' ;
  VALUE pulk      -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' 3='(3) RETIRED' 4='(4) DISABLED' 5='(5) UNABLE TO WORK' ;
  VALUE pelkm1ff  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) CONTACTED EMPLOYER DIRECTLY/ INTERVIEW'
                  2='(2) CONTACTED PUBLIC EMPLOYMENT AGENCY'
                  3='(3) CONTACTED PRIVATE EMPLOYMENT AGENCY'
                  4='(4) CONTACTED FRIENDS OR RELATIVES'
                  5='(5) CONTACTED SCHOOL/UNIVERSITY EMPL CENTER'
                  6='(6) SENT OUT RESUMES/FILLED OUT APPLICATION'
                  7='(7) CHECKED UNION/PROFESSIONAL\ REGISTERS'
                  8='(8) PLACED OR ANSWERED ADS' 9='(9) OTHER ACTIVE'
                  10='(10) LOOKED AT ADS'
                  11='(11) ATTENDED JOB TRAINING PROGRAMS/COURSES' 12='(12) NOTHING'
                  13='(13) OTHER PASSIVE' ;
  VALUE pulkm2ff  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) CONTACTED EMPLOYER DIRECTLY/ INTERVIEW'
                  2='(2) CONTACTED PUBLIC EMPLOYMEN AGENCY'
                  3='(3) CONTACTED PRIVATE EMPLOYMENT AGENCY'
                  4='(4) CONTACTED FRIENDS OR RELATIVES'
                  5='(5) CONTACTED SCHOOL/UNIVERSITY EM CENTER'
                  6='(6) SENT OUT RESUMES/FILLED OUT APPLICATION'
                  7='(7) CHECKED UNION/PROFESSIONAL REGISTERS'
                  8='(8) PLACED OR ANSWERED ADS' 9='(9) OTHER ACTIVE'
                  10='(10) LOOKED AT ADS'
                  11='(11) ATTENDED JOB TRAINING PROGRAMS/COURSES' 12='(12) NOTHING'
                  13='(13) OTHER PASSIVE' ;
  VALUE pulkm3ff  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) CONTACTED EMPLOYER DIRECTLY/ INTERVIEW'
                  2='(2) CONTACTED PUBLIC EMPLOYMENT AGENCY'
                  3='(3) CONTACTED PRIVATE EMPLOYMENT AGENCY'
                  4='(4) CONTACTED FRIENDS OR RELATIVES'
                  5='(5) CONTACTED SCHOOL/UNIVERSITY EMPL CENTER'
                  6='(6) SENT OUT RESUMES/FILLED OUT APPLICATION'
                  7='(7) CHECKED UNION/PROFESSIONAL REGISTERS'
                  8='(8) PLACED OR ANSWERED ADS' 9='(9) OTHER ACTIVE'
                  10='(10) LOOKED AT ADS'
                  11='(11) ATTENDED JOB TRAINING PROGRAMS/COURSES' 12='(12) NOTHING'
                  13='(13) OTHER PASSIVE' ;
  VALUE pulkm4ff  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) CONTACTED EMPLOYER DIRECTLY/ INTERVIEW'
                  2='(2) CONTACTED PUBLIC EMPLOYMENT AGENCY'
                  3='(3) CONTACTED PRIVATE EMPLOYMENT AGENCY'
                  4='(4) CONTACTED FRIENDS OR RELATIVES'
                  5='(5) CONTACTED SCHOOL/UNIVERSITY EMPL CENTER'
                  6='(6) SENT OUT RESUMES/FILLED OUT APPLICATION'
                  7='(7) CHECKED UNION/PROFESSIONAL REGISTERS'
                  8='(8) PLACED OR ANSWERED ADS' 9='(9) OTHER ACTIVE'
                  10='(10) LOOKED AT ADS'
                  11='(11) ATTENDED JOB TRAINING PROGRAMS/COURSES' 12='(12) NOTHING'
                  13='(13) OTHER PASSIVE' ;
  VALUE pulkm5ff  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) CONTACTED EMPLOYER DIRECTLY/ INTERVIEW'
                  2='(2) CONTACTED PUBLIC EMPLOYMENT AGENCY'
                  3='(3) CONTACTED PRIVATE EMPLOYMENT AGENCY'
                  4='(4) CONTACTED FRIENDS OR RELATIVES'
                  5='(5) CONTACTED SCHOOL/UNIVERSITY EMPL CENTER'
                  6='(6) SENT OUT RESUMES/FILLED OUT APPLICATION'
                  7='(7) CHECKED UNION/PROFESSIONAL REGISTERS'
                  8='(8) PLACED OR ANSWERED ADS' 9='(9) OTHER ACTIVE'
                  10='(10) LOOKED AT ADS'
                  11='(11) ATTENDED JOB TRAINING PROGRAMS/COURSES' 12='(12) NOTHING'
                  13='(13) OTHER PASSIVE' ;
  VALUE pulkm6ff  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) CONTACTED EMPLOYER DIRECTLY/ INTERVIEW'
                  2='(2) CONTACTED PUBLIC EMPLOYMENT AGENCY'
                  3='(3) CONTACTED PRIVATE EMPLOYMENT AGENCY'
                  4='(4) CONTACTED FRIENDS OR RELATIVES'
                  5='(5) CONTACTED SCHOOL/UNIVERSITY EMPL CENTER'
                  6='(6) SENT OUT RESUMES/FILLED OUT APPLICATION'
                  7='(7) CHECKED UNION/PROFESSIONAL REGISTERS'
                  8='(8) PLACED OR ANSWERED ADS' 9='(9) OTHER ACTIVE'
                  10='(10) LOOKED AT ADS'
                  11='(11) ATTENDED JOB TRAINING PROGRAMS/COURSES' 12='(12) NOTHING'
                  13='(13) OTHER PASSIVE' ;
  VALUE pulkdk1f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) CONTACTED EMPLOYER DIRECTLY/ INTERVIEW'
                  2='(2) CONTACTED PUBLIC EMPLOYMENT AGENCY'
                  3='(3) CONTACTED PRIVATE EMPLOYMENT AGENCY'
                  4='(4) CONTACTED FRIENDS OR RELATIVES CENTER'
                  6='(6) SENT OUT RESUMES/FILLED OUT APPLICATION'
                  7='(7) CHECKED UNION/PROFESSIONAL REGISTERS'
                  8='(8) PLACED OR ANSWERED ADS' 9='(9) OTHER ACTIVE'
                  10='(10) LOOKED AT ADS'
                  11='(11) ATTENDED JOB TRAINING PROGRAM COURSES' 12='(12) NOTHING'
                  13='(13) OTHER PASSIVE' ;
  VALUE pulkdk2f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) CONTACTED EMPLOYER DIRECTLY/ INTERVIEW'
                  2='(2) CONTACTED PUBLIC EMPLOYMENT AGENCY'
                  3='(3) CONTACTED PRIVATE EMPLOYMENT AGENCY'
                  4='(4) CONTACTED FRIENDS OR RELATIVES'
                  5='(5) CONTACTED SCHOOL/UNIVERSITY EMPL CENTER APPLICATION'
                  7='(7) CHECKED UNION/PROFESSIONAL REGISTERS'
                  8='(8) PLACED OR ANSWERED ADS' 9='(9) OTHER ACTIVE'
                  10='(10) LOOKED AT ADS'
                  11='(11) ATTENDED JOB TRAINING PROGRAMS/COURSES' 12='(12) NOTHING'
                  13='(13) OTHER PASSIVE' ;
  VALUE pulkdk3f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) CONTACTED EMPLOYER DIRECTLY/ INTERVIEW AGENCY'
                  3='(3) CONTACTED PRIVATE EMPLOYME AGENCY'
                  4='(4) CONTACTED FRIENDS OR RELATIVES'
                  5='(5) CONTACTED SCHOOL/UNIVERSITY EMPL CENTER'
                  6='(6) SENT OUT RESUMES/FILLED OUT APPLICATION'
                  7='(7) CHECKED UNION/PROFESSIONAL REGISTERS'
                  8='(8) PLACED OR ANSWERED ADS' 9='(9) OTHER ACTIVE'
                  10='(10) LOOKED AT ADS'
                  11='(11) ATTENDED JOB TRAINING PROGRAMS/COURSES' 12='(12) NOTHING'
                  13='(13) OTHER PASSIVE' ;
  VALUE pulkdk4f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) CONTACTED EMPLOYER DIRECTLY INTERVIEW'
                  2='(2) CONTACTED PUBLIC EMPLOYMENT AGENCY'
                  3='(3) CONTACTED PRIVATE EMPLOYMENT AGENCY'
                  4='(4) CONTACTED FRIENDS OR RELATIVES'
                  5='(5) CONTACTED SCHOOL/UNIVERSITY EMPL CENTER'
                  6='(6) SENT OUT RESUMES/FILLED OUT APPLICATION'
                  7='(7) CHECKED UNION/PROFESSIONAL REGISTERS'
                  8='(8) PLACED OR ANSWERED ADS' 9='(9) OTHER ACTIVE'
                  10='(10) LOOKED AT ADS'
                  11='(11) ATTENDED JOB TRAINING PROGRAMS/COURSES' 12='(12) NOTHING'
                  13='(13) OTHER PASSIVE' ;
  VALUE pulkdk5f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) CONTACTED EMPLOYER DIRECTLY/ INTERVIEW'
                  2='(2) CONTACTED PUBLIC EMPLOYMENT AGENCY'
                  3='(3) CONTACTED PRIVATE EMPLOYMENT AGENCY'
                  4='(4) CONTACTED FRIENDS OR RELATIVES'
                  5='(5) CONTACTED SCHOOL/UNIVERSITY EM CENTER'
                  6='(6) SENT OUT RESUMES/FILLED OUT APPLICATION'
                  7='(7) CHECKED UNION/PROFESSIONAL REGISTERS'
                  8='(8) PLACED OR ANSWERED ADS' 9='(9) OTHER ACTIVE'
                  10='(10) LOOKED AT ADS'
                  11='(11) ATTENDED JOB TRAINING PROGRAMS/COURSES' 12='(12) NOTHING'
                  13='(13) OTHER PASSIVE' ;
  VALUE pulkdk6f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) CONTACTED EMPLOYER DIRECTLY/ INTERVIEW'
                  2='(2) CONTACTED PUBLIC EMPLOYMENT AGENCY'
                  3='(3) CONTACTED PRIVATE EMPLOYMENT AGENCY'
                  4='(4) CONTACTED FRIENDS OR RELATIVES'
                  5='(5) CONTACTED SCHOOL/UNIVERSITY EMPL CENTER'
                  6='(6) SENT OUT RESUMES/FILLED OUT APPLICATION REGISTERS'
                  8='(8) PLACED OR ANSWERED ADS' 9='(9) OTHER ACTIVE'
                  10='(10) LOOKED AT ADS'
                  11='(11) ATTENDED JOB TRAINING PROGRAMS COURSES' 12='(12) NOTHING'
                  13='(13) OTHER PASSIVE' ;
  VALUE pulkps1f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) CONTACTED EMPLOYER DIRECTLY/ INTERVIEW'
                  2='(2) CONTACTED PUBLIC EMPLOYMENT AGENCY'
                  3='(3) CONTACTED PRIVATE EMPLOYMENT AGENCY'
                  4='(4) CONTACTED FRIENDS OR RELATIVES'
                  5='(5) CONTACTED SCHOOL/UNIVERSITY EMPL CENTER'
                  6='(6) SENT OUT RESUMES/FILLED OUT APPLICATION'
                  7='(7) CHECKED UNION/PROFESSIONAL REGISTERS'
                  8='(8) PLACED OR ANSWERED ADS' 9='(9) OTHER ACTIVE'
                  10='(10) LOOKED AT ADS'
                  11='(11) ATTENDED JOB TRAINING PROGRAMS/COURSES' 12='(12) NOTHING'
                  13='(13) OTHER PASSIVE' ;
  VALUE pulkps2f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) CONTACTED EMPLOYER DIRECTLY/ INTERVIEW'
                  2='(2) CONTACTED PUBLIC EMPLOYMENT AGENCY'
                  3='(3) CONTACTED PRIVATE EMPLOYMENT AGENCY'
                  4='(4) CONTACTED FRIENDS OR RELATIVES'
                  5='(5) CONTACTED SCHOOL/UNIVERSITY EMPL CENTER'
                  6='(6) SENT OUT RESUMES/FILLED OUT APPLICATION'
                  7='(7) CHECKED UNION/PROFESSIONAL REGISTERS'
                  8='(8) PLACED OR ANSWERED ADS' 9='(9) OTHER ACTIVE'
                  10='(10) LOOKED AT ADS'
                  11='(11) ATTENDED JOB TRAINING PROGRAMS/COURSES' 12='(12) NOTHING'
                  13='(13) OTHER PASSIVE' ;
  VALUE pulkps3f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) CONTACTED EMPLOYER DIRECTLY/ INTERVIEW'
                  2='(2) CONTACTED PUBLIC EMPLOYMENT AGENCY'
                  3='(3) CONTACTED PRIVATE EMPLOYMENT AGENCY'
                  4='(4) CONTACTED FRIENDS OR RELATIVES'
                  5='(5) CONTACTED SCHOOL/UNIVERSITY EMPL CENTER'
                  6='(6) SENT OUT RESUMES/FILLED OUT APPLICATION'
                  7='(7) CHECKED UNION/PROFESSIONAL REGISTERS'
                  8='(8) PLACED OR ANSWERED ADS' 9='(9) OTHER ACTIVE'
                  10='(10) LOOKED AT ADS'
                  11='(11) ATTENDED JOB TRAINING PROGRAMS/COURSES' 12='(12) NOTHING'
                  13='(13) OTHER PASSIVE' ;
  VALUE pulkps4f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) CONTACTED EMPLOYER DIRECTLY/ INTERVIEW'
                  2='(2) CONTACTED PUBLIC EMPLOYMEN AGENCY'
                  3='(3) CONTACTED PRIVATE EMPLOYMENT AGENCY'
                  4='(4) CONTACTED FRIENDS OR RELATIVES'
                  5='(5) CONTACTED SCHOOL/UNIVERSITY EM CENTER'
                  6='(6) SENT OUT RESUMES/FILLED OUT APPLICATION'
                  7='(7) CHECKED UNION/PROFESSIONAL REGISTERS'
                  8='(8) PLACED OR ANSWERED ADS' 9='(9) OTHER ACTIVE'
                  10='(10) LOOKED AT ADS'
                  11='(11) ATTENDED JOB TRAINING PROGRAMS/COURSES' 12='(12) NOTHING'
                  13='(13) OTHER PASSIVE' ;
  VALUE pulkps5f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) CONTACTED EMPLOYER DIRECTLY/ INTERVIEW'
                  2='(2) CONTACTED PUBLIC EMPLOYMENT AGENCY'
                  3='(3) CONTACTED PRIVATE EMPLOYMENT AGENCY'
                  4='(4) CONTACTED FRIENDS OR RELATIVES'
                  5='(5) CONTACTED SCHOOL/UNIVERSITY EMPL CENTER'
                  6='(6) SENT OUT RESUMES/FILLED OU APPLICATION REGISTERS'
                  8='(8) PLACED OR ANSWERED ADS' 9='(9) OTHER ACTIVE'
                  10='(10) LOOKED AT ADS'
                  11='(11) ATTENDED JOB TRAINING PROGRAMS COURSES' 12='(12) NOTHING'
                  13='(13) OTHER PASSIVE' ;
  VALUE pulkps6f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) CONTACTED EMPLOYER DIRECTLY/ INTERVIEW'
                  2='(2) CONTACTED PUBLIC EMPLOYMENT AGENCY'
                  3='(3) CONTACTED PRIVATE EMPLOYMENT AGENCY'
                  4='(4) CONTACTED FRIENDS OR RELATIVES'
                  5='(5) CONTACTED SCHOOL/UNIVERSITY EMPL CENTER'
                  6='(6) SENT OUT RESUMES/FILLED OUT APPLICATION'
                  7='(7) CHECKED UNION/PROFESSIONAL REGISTERS'
                  8='(8) PLACED OR ANSWERED ADS' 9='(9) OTHER ACTIVE'
                  10='(10) LOOKED AT ADS'
                  11='(11) ATTENDED JOB TRAINING PROGRAMS/COURSES' 12='(12) NOTHING'
                  13='(13) OTHER PASSIVE' ;
  VALUE pelkavl   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE pulkavr   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) WAITING FOR NEW JOB TO BEGIN' 2='(2) OWN TEMPORARY ILLNESS'
                  3='(3) GOING TO SCHOOL' 4='(4) OTHER - SPECIFY' ;
  VALUE pelkll1o  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) WORKING' 2='(2) SCHOOL' 3='(3) LEFT MILITARY SERVICE'
                  4='(4) SOMETHING ELSE' ;
  VALUE pelkll2o  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) LOST JOB' 2='(2) QUIT JOB' 3='(3) TEMPORARY JOB ENDED' ;
  VALUE pelklwo   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) WITHIN THE LAST 12 MONTHS' 2='(2) MORE THAN 12 MONTHS AGO'
                  3='(3) NEVER WORKED' ;
  VALUE pelkdur   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE' ;
  VALUE pelkfto   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' 3='(3) DOESN''T MATTER' ;
  VALUE pedwwnto  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES, OR MAYBE, IT DEPENDS' 2='(2) NO' 3='(3) RETIRED'
                  4='(4) DISABLED' 5='(5) UNABLE' ;
  VALUE pedwrsn   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) BELIEVES NO WORK AVAILABLE IN AREA OF EXPERTISE'
                  2='(2) COULDN''T FIND ANY WORK'
                  3='(3) LACKS NECESSARY SCHOOLING/TRAINING'
                  4='(4) EMPLOYERS THINK TOO YOUNG OR TOO OLD'
                  5='(5) OTHER TYPES OF DISCRIMINATION'
                  6='(6) CAN''T ARRANGE CHILD CARE' 7='(7) FAMILY RESPONSIBILITIES'
                  8='(8) IN SCHOOL OR OTHER TRAINING'
                  9='(9) ILL-HEALTH, PHYSICAL DISABILITY'
                  10='(10) TRANSPORTATION PROBLEMS' 11='(11) OTHER - SPECIFY' ;
  VALUE pedwlko   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE pedwwk    -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE pedw4wk   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE pedwlkwk  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE pedwavl   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE pedwavr   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) OWN TEMPORARY ILLNESS' 2='(2) GOING TO SCHOOL' 3='(3) OTHER' ;
  VALUE pudwck1f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) IF ENTRY OF 2 IN BUS2 GOTO PUSCHCK'
                  2='(2) IF ENTRY OF 3 ON ABSRSN GOTO PUNLFCK1'
                  3='(3) IF ENTRY OF 1 IN RET1, STORE 1 IN DWWNTO AND GOTO PUDWCK4'
                  4='(4) ALL OTHERS GOTO PUDWWNT' ;
  VALUE pudwck2f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) IF ENTRY IN DIS1 OR DIS2 GOTO PUJHCK1-C'
                  2='(2) IF ENTRY OF 4 IN DWWNT GOTO PUDIS1'
                  3='(3) IF ENTRY OF 5 IN DWWNT GOTO PUDIS2'
                  4='(4) ALL OTHERS GOTO PUDWCK4' ;
  VALUE pudwck3f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) IF AGERNG EQUALS 1-4 OR 9 GOTO PUDWCK4'
                  2='(2) ALL OTHERS GOTO PUNLFCK2' ;
  VALUE pudwck4f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) IF ENTRY OF 10 AND/OR 11 AND/OR 13 ONLY IN LKM1-LKM3 GOTO PUDWCK5'
                  2='(2) IF ENTRY OF 10 AND/OR 11 AND/OR 13 ONLY IN LKDK1-LKDK3 GOTO PUDWCK5'
                  3='(3) IF ENTRY OF 10 AND/OR 11 AND/OR 13 ONLY IN LKPS1-LKPS3 GOTO PUDWCK5'
                  4='(4) ALL OTHERS GOTO PUDWRSN' ;
  VALUE pudwck5f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) IF ENTRY OF 1 IN LK THEN STORE 1 IN DWLKO AND GOTO PUDWWK'
                  2='(2) ALL OTHERS GOTO PUDWLK' ;
  VALUE prabsrea  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) FT PAID-VACATION' 2='(2) FT PAID-OWN ILLNESS'
                  3='(3) FT PAID-CHILD CARE PROBLEMS'
                  4='(4) FT PAID-OTHER FAMILY/PERSONAL OBLIG.'
                  5='(5) FT PAID-MATERNITY/PATERNITY LEAVE'
                  6='(6) FT PAID-LABOR DISPUTE' 7='(7) FT PAID-WEATHER AFFECTED JOB'
                  8='(8) FT PAID-SCHOOL/TRAINING' 9='(9) FT PAID-CIVIC/MILITARY DUTY'
                  10='(10) FT PAID-OTHER' 11='(11) FT UNPAID-VACATION'
                  12='(12) FT UNPAID-OWN ILLNESS'
                  13='(13) FT UNPAID-CHILD CARE PROBLEMS'
                  14='(14) FT UNPAID-OTHER FAM/PERSONAL OBLIGATION'
                  15='(15) FT UNPAID-MATERNITY/PATERNITY LEAVE'
                  16='(16) FT UNPAID-LABOR DISPUTE'
                  17='(17) FT UNPAID-WEATHER AFFECTED JOB'
                  18='(18) FT UNPAID-SCHOOL/TRAINING'
                  19='(19) FT UNPAID-CIVIC/MILITARY DUTY' 20='(20) FT UNPAID-OTHER'
                  21='(21) PT PAID-VACATION' 22='(22) PT PAID-OWN ILLNESS'
                  23='(23) PT PAID-CHILD CARE PROBLEMS'
                  24='(24) PT PAID-OTHER FAMILY/PERSONAL OBLIG.'
                  25='(25) PT PAID-MATERNITY/PATERNITY LEAVE'
                  26='(26) PT PAID-LABOR DISPUTE'
                  27='(27) PT PAID-WEATHER AFFECTED JOB'
                  28='(28) PT PAID-SCHOOL/TRAINING'
                  29='(29) PT PAID-CIVIC/MILITARY DUTY' 30='(30) PT PAID-OTHER'
                  31='(31) PT UNPAID-VACATION' 32='(32) PT UNPAID-OWN ILLNESS'
                  33='(33) PT UNPAID-CHILD CARE PROBLEMS'
                  34='(34) PT UNPAID-OTHER FAM/PERSONAL OBLIGATION'
                  35='(35) PT UNPAID-MATERNITY/PATERNITY LEAVE'
                  36='(36) PT UNPAID-LABOR DISPUTE'
                  37='(37) PT UNPAID-WEATHER AFFECTED JOB'
                  38='(38) PT UNPAID-SCHOOL/TRAINING'
                  39='(39) PT UNPAID-CIVIC/MILITARY DUTY' 40='(40) PT UNPAID-OTHER' ;
  VALUE prcivlf   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) IN CIVILIAN LABOR FORCE' 2='(2) NOT IN CIVILIAN LABOR FORCE' ;
  VALUE prdisc    -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) DISCOURAGED WORKER' 2='(2) CONDITIONALLY INTERESTED'
                  3='(3) NOT AVAILABLE' ;
  VALUE premphrs  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  0='(0) UNEMPLOYED AND NILF' 1='(1) W/JOB, NOT AT WORK-ILLNESS'
                  2='(2) W/JOB, NOT AT WORK-VACATION'
                  3='(3) W/JOB, NOT AT WORK-WEATHER AFFECTED JOB'
                  4='(4) W/JOB, NOT AT WORK-LABOR DISPUTE'
                  5='(5) W/JOB, NOT AT WORK-CHILD CARE PROBLEMS'
                  6='(6) W/JOB, NOT AT WORK-FAM/PERS OBLIGATION'
                  7='(7) W/JOB, NOT AT WORK-MATERNITY/ PATERNITY'
                  8='(8) W/JOB, NOT AT WORK-SCHOOL/ TRAINING'
                  9='(9) W/JOB, NOT AT WORK-CIVI MILITARY DUTY'
                  10='(10) W/JOB, NOT AT WORK-DOES NOT WORK IN BUS'
                  11='(11) W/JOB, NOT AT WORK-OTHER' 12='(12) AT WORK- 1-4 HRS'
                  13='(13) AT WORK- 5-14 HRS' 14='(14) AT WORK- 15-21 HRS'
                  15='(15) AT WORK- 22-29 HRS' 16='(16) AT WORK- 30-34 HRS'
                  17='(17) AT WORK- 35-39 HRS' 18='(18) AT WORK- 40 HRS'
                  19='(19) AT WORK- 41-47 HRS' 20='(20) AT WORK- 48 HRS'
                  21='(21) AT WORK- 49-59 HRS' 22='(22) AT WORK- 60 HRS OR MORE' ;
  VALUE prempnot  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) EMPLOYED' 2='(2) UNEMPLOYED'
                  3='(3) NOT IN LABOR FORCE (NILF)- DISCOURAGED'
                  4='(4) NOT IN LABOR FORCE (NILF)- OTHER' ;
  VALUE prexplf   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) EMPLOYED' 2='(2) UNEMPLOYED' ;
  VALUE prftlf    -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) FULL TIME LABOR FORCE' 2='(2) PART TIME LABOR FORCE' ;
  VALUE prhrusl   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) 0-20 HRS' 2='(2) 21-34 HRS' 3='(3) 35-39 HRS' 4='(4) 40 HRS'
                  5='(5) 41-49 HRS' 6='(6) 50 OR MORE HRS' 7='(7) VARIES-FULL TIME'
                  8='(8) VARIES-PART TIME' ;
  VALUE prjobsea  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) LOOKED LAST 4 WEEKS - NOT WORKED'
                  2='(2) LOOKED LAST 4 WEEKS - WORKED'
                  3='(3) LOOKED LAST 4 WEEKS - LAYOFF'
                  4='(4) UNAVAILABLE JOB SEEKERS' 5='(5) NO RECENT JOB SEARCH' ;
  VALUE prpthrs   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  0='(0) USUALY FT, PT FOR NONECONOMIC REASONS'
                  1='(1) USU.FT, PT ECON REASONS; 1-4 HRS'
                  2='(2) USU.FT, PT ECON REASONS; 5-14 HRS'
                  3='(3) USU.FT, PT ECON REASONS; 15-29 HRS'
                  4='(4) USU.FT, PT ECON REASONS; 30-34 HRS'
                  5='(5) USU.PT, ECON REASONS; 1-4 HRS'
                  6='(6) USU.PT, ECON REASONS; 5-14 HRS'
                  7='(7) USU.PT, ECON REASONS; 15-29 HRS'
                  8='(8) USU.PT, ECON REASONS; 30-34 HRS'
                  9='(9) USU.PT, NON-ECON REASONS; 1-4 HRS'
                  10='(10) USU.PT, NON-ECON REASONS; 5-14 HRS'
                  11='(11) USU.PT, NON-ECON REASONS; 15- 29 HRS'
                  12='(12) USU.PT, NON-ECON REASONS; 30- 34 HRS' ;
  VALUE prptrea   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) USU. FT-SLACK WORK/BUSINESS CONDITIONS'
                  2='(2) USU. FT-SEASONAL WORK'
                  3='(3) USU. FT-JOB STARTED/ENDED DURING WEEK'
                  4='(4) USU. FT-VACATION/PERSONAL DAY'
                  5='(5) USU. FT-OWN ILLNESS/ INJURY/MEDICAL APPOINTMENT'
                  6='(6) USU. FT-HOLIDAY (RELIGIOUS OR LEGAL)'
                  7='(7) USU. FT-CHILD CARE PROBLEMS'
                  8='(8) USU. FT-OTHER FAM/PERS OBLIGATIONS'
                  9='(9) USU. FT-LABOR DISPUTE' 10='(10) USU. FT-WEATHER AFFECTED JOB'
                  11='(11) USU. FT-SCHOOL/TRAINING'
                  12='(12) USU. FT-CIVIC/MILITARY DUTY' 13='(13) USU. FT-OTHER REASON'
                  14='(14) USU. PT-SLACK WORK/BUSINESS CONDITIONS'
                  15='(15) USU. PT-COULD ONLY FIND PT WORK'
                  16='(16) USU. PT-SEASONAL WORK' 17='(17) USU. PT-CHILD CARE PROBLEMS'
                  18='(18) USU. PT-OTHER FAM/PERS OBLIGATIONS'
                  19='(19) USU. PT-HEALTH/MEDICAL LIMITATIONS'
                  20='(20) USU. PT-SCHOOL/TRAINING'
                  21='(21) USU. PT-RETIRED/S.S. LIMIT ON EARNINGS'
                  22='(22) USU. PT-WORKWEEK <35 HOURS' 23='(23) USU. PT-OTHER REASON' ;
  VALUE prunedur  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE' ;
  VALUE pruntype  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) JOB LOSER/ON LAYOFF' 2='(2) OTHER JOB LOSER'
                  3='(3) TEMPORARY JOB ENDED' 4='(4) JOB LEAVER' 5='(5) RE-ENTRANT'
                  6='(6) NEW-ENTRANT' ;
  VALUE prwksch   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  0='(0) NOT IN LABOR FORCE' 1='(1) AT WORK'
                  2='(2) WITH JOB, NOT AT WORK' 3='(3) UNEMPLOYED, SEEKS FT'
                  4='(4) UNEMPLOYED, SEEKS PT' ;
  VALUE prwkstat  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) NOT IN LABOR FORCE' 2='(2) FT HOURS (35+), USUALLY FT'
                  3='(3) PT FOR ECONOMIC REASONS, USUALLY FT'
                  4='(4) PT FOR NON-ECONOMIC REASONS, USUALLY FT'
                  5='(5) NOT AT WORK, USUALLY FT'
                  6='(6) PT HRS, USUALLY PT FOR ECONOMIC REASONS'
                  7='(7) PT HRS, USUALLY PT FOR NON- ECONOMIC REASONS'
                  8='(8) FT HOURS, USUALLY PT FOR ECONOMIC REASONS'
                  9='(9) FT HOURS, USUALLY PT FOR NON-ECONOMIC'
                  10='(10) NOT AT WORK, USUALLY PART-TIME' 11='(11) UNEMPLOYED FT'
                  12='(12) UNEMPLOYED PT' ;
  VALUE prwntjob  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) WANT A JOB' 2='(2) OTHER NOT IN LABOR FORCE' ;
  VALUE puiodp1f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE puiodp2f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE puiodp3f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE peio1cow  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) GOVERNMENT - FEDERAL' 2='(2) GOVERNMENT - STATE'
                  3='(3) GOVERNMENT - LOCAL' 4='(4) PRIVATE, FOR PROFIT'
                  5='(5) PRIVATE, NONPROFIT' 6='(6) SELF-EMPLOYED, INCORPORATED'
                  7='(7) SELF-EMPLOYED, UNINCORPORATED' 8='(8) WITHOUT PAY' ;
  VALUE puio1mfg  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) MANUFACTURING' 2='(2) RETAIL TRADE' 3='(3) WHOLESALE TRADE'
                  4='(4) SOMETHING ELSE' ;
  VALUE puiock1f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) IF {MISCK EQ 1 OR 5) OR MISCK EQ 2-4, 6-8 AND I-MLR EQ 3-7) AND ENTRY OF 1 IN ABS} THEN GOTO PUIO1INT'
                  2='(2) IF (MISCK EQ 1 OR 5) OR {(MISCK EQ 2-4, 6-8 AND I-MLR EQ 3-7) AND ( ENTRY OF 1 IN WK OR HRCK7-C IS BLANK, 1-3)}GOTO PUIO'
                  3='(3) IF I-IO1NAM IS D, R OR BLANK THEN GOTO PUIO1INT'
                  4='(4) ALL OTHERS GOTO PUIODP1' ;
  VALUE puiock2f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) IF I-IO1ICR EQ 1 THEN GOTO PUIO1IND'
                  2='(2) IF I-IO1OCR EQ 1 THEN GOTO PUIO1OCC'
                  3='(3) ALL OTHERS GOTO PUIODP2' ;
  VALUE puiock3f  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) IF I-IO1OCC EQUALS D, R OR BLANK THEN GOTO PUIO1OCC'
                  2='(2) IF I-IO1DT1 IS D, R OR BLANK THEN GOTO PUIO1OCC'
                  3='(3) ALL OTHERS GOTO PUIODP3' ;
  VALUE prioelg   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  0='(0) NOT ELIGIBLE FOR EDIT' 1='(1) ELIGIBLE FOR EDIT' ;
  VALUE pragna    -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) AGRICULTURAL' 2='(2) NON-AGRICULTURAL' ;
  VALUE prcow1ff  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) FEDERAL GOVT' 2='(2) STATE GOVT' 3='(3) LOCAL GOVT'
                  4='(4) PRIVATE (INCL. SELF- EMPLOYED INCORP.)'
                  5='(5) SELF-EMPLOYED, UNINCORP.' 6='(6) WITHOUT PAY' ;
  VALUE prcowpg   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) PRIVATE' 2='(2) GOVERNMENT' ;
  VALUE prdtcowf  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) AGRI., WAGE & SALARY, PRIVATE'
                  2='(2) AGRI., WAGE & SALARY, GOVERNMENT'
                  3='(3) AGRI., SELF-EMPLOYED' 4='(4) AGRI., UNPAID'
                  5='(5) NONAG, WS, PRIVATE, PRIVATE HHLDS'
                  6='(6) NONAG, WS, PRIVATE, OTHER PRIVATE'
                  7='(7) NONAG, WS, GOVT, FEDERAL' 8='(8) NONAG, WS, GOVT, STATE'
                  9='(9) NONAG, WS, GOVT, LOCAL' 10='(10) NONAG, SELF-EMPLOYED'
                  11='(11) NONAG, UNPAID' ;
  VALUE prdtindf  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) AGRICULTURE'
                  2='(2) FORESTRY, LOGGING, FISHING, HUNTING, AND TRAPPING'
                  3='(3) MINING' 4='(4) CONSTRUCTION'
                  5='(5) NONMETALLIC MINERAL PRODUCT MANUFACTURING'
                  6='(6) PRIMARY METALS AND FABRICATED METAL PRODUCTS'
                  7='(7) MACHINERY MANUFACTURING'
                  8='(8) COMPUTER AND ELECTRONIC PRODUCT MANUFACTURING'
                  9='(9) ELECTRICAL EQUIPMENT, APPLIANCE MANUFACTURING'
                  10='(10) TRANSPORTATION EQUIPMENT MANUFACTURING'
                  11='(11) WOOD PRODUCTS'
                  12='(12) FURNITURE AND FIXTURES MANUFACTURING'
                  13='(13) MISCELLANEOUS AND NOT SPECIFIED MANUFACTURING'
                  14='(14) FOOD MANUFACTURING' 15='(15) BEVERAGE AND TOBACCO PRODUCTS'
                  16='(16) TEXTILE, APPAREL, AND LEATHER MANUFACTURING'
                  17='(17) PAPER AND PRINTING'
                  18='(18) PETROLEUM AND COAL PRODUCTS MANUFACTURING'
                  19='(19) CHEMICAL MANUFACTURING'
                  20='(20) PLASTICS AND RUBBER PRODUCTS' 21='(21) WHOLESALE TRADE'
                  22='(22) RETAIL TRADE' 23='(23) TRANSPORTATION AND WAREHOUSING'
                  24='(24) UTILITIES' 25='(25) PUBLISHING INDUSTRIES (EXCEPT INTERNET)'
                  26='(26) MOTION PICTURE AND SOUND RECORDING INDUSTRIES'
                  27='(27) BROADCASTING (EXCEPT INTERNET)'
                  28='(28) INTERNET PUBLISHING AND BROADCASTING'
                  29='(29) TELECOMMUNICATIONS'
                  30='(30) INTERNET SERVICE PROVIDERS AND DATA PROCESSING SERVICES'
                  31='(31) OTHER INFORMATION SERVICES' 32='(32) FINANCE' 33='(33) INSURANCE'
                  34='(34) REAL ESTATE' 35='(35) RENTAL AND LEASING SERVICES'
                  36='(36) PROFESSIONAL AND TECHNICAL SERVICES'
                  37='(37) MANAGEMENT OF COMPANIES AND ENTERPRISES'
                  38='(38) ADMINISTRATIVE AND SUPPORT SERVICES'
                  39='(39) WASTE MANAGEMENT AND REMEDIATION SERVICES'
                  40='(40) EDUCATIONAL SERVICES' 41='(41) HOSPITALS'
                  42='(42) HEALTH CARE SERVICES, EXCEPT HOSPITALS'
                  43='(43) SOCIAL ASSISTANCE'
                  44='(44) ARTS, ENTERTAINMENT, AND RECREATION' 45='(45) ACCOMMODATION'
                  46='(46) FOOD SERVICES AND DRINKING PLACES'
                  47='(47) REPAIR AND MAINTENANCE'
                  48='(48) PERSONAL AND LAUNDRY SERVICES'
                  49='(49) MEMBERSHIP ASSOCIATIONS AND ORGANIZATIONS'
                  50='(50) PRIVATE HOUSEHOLDS' 51='(51) PUBLIC ADMINISTRATION'
                  52='(52) ARMED FORCES' ;
  VALUE prdtoccf  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) MANAGEMENT OCCUPATIONS'
                  2='(2) BUSINESS AND FINANCIAL OPERATIONS OCCUPATIONS'
                  3='(3) COMPUTER AND MATHEMATICAL SCIENCE OCCUPATIONS'
                  4='(4) ARCHITECTURE AND ENGINEERING OCCUPATIONS'
                  5='(5) LIFE, PHYSICAL, AND SOCIAL SCIENCE OCCUPATIONS'
                  6='(6) COMMUNITY AND SOCIAL SERVICE OCCUPATIONS'
                  7='(7) LEGAL OCCUPATIONS'
                  8='(8) EDUCATION, TRAINING, AND LIBRARY OCCUPATIONS'
                  9='(9) ARTS, DESIGN, ENTERTAINMENT, SPORTS, AND MEDIA OCCUPATIONS'
                  10='(10) HEALTHCARE PRACTITIONER AND TECHNICAL OCCUPATIONS'
                  11='(11) HEALTHCARE SUPPORT OCCUPATIONS'
                  12='(12) PROTECTIVE SERVICE OCCUPATIONS'
                  13='(13) FOOD PREPARATION AND SERVING RELATED OCCUPATIONS'
                  14='(14) BUILDING AND GROUNDS CLEANING AND MAINTENANCE OCCUPATIONS'
                  15='(15) PERSONAL CARE AND SERVICE OCCUPATIONS'
                  16='(16) SALES AND RELATED OCCUPATIONS'
                  17='(17) OFFICE AND ADMINISTRATIVE SUPPORT OCCUPATIONS'
                  18='(18) FARMING, FISHING, AND FORESTRY OCCUPATIONS'
                  19='(19) CONSTRUCTION AND EXTRACTION OCCUPATIONS'
                  20='(20) INSTALLATION, MAINTENANCE, AND REPAIR OCCUPATIONS'
                  21='(21) PRODUCTION OCCUPATIONS'
                  22='(22) TRANSPORTATION AND MATERIAL MOVING OCCUPATIONS'
                  23='(23) ARMED FORCES' ;
  VALUE premp     -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) EMPLOYED PERSONS (EXC. FARM & PRIV HH)' ;
  VALUE prmjindf  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) AGRICULTURE, FORESTRY, FISHING, AND HUNTING' 2='(2) MINING'
                  3='(3) CONSTRUCTION' 4='(4) MANUFACTURING'
                  5='(5) WHOLESALE AND RETAIL TRADE'
                  6='(6) TRANSPORTATION AND UTILITIES' 7='(7) INFORMATION'
                  8='(8) FINANCIAL ACTIVITIES'
                  9='(9) PROFESSIONAL AND BUSINESS SERVICES'
                  10='(10) EDUCATIONAL AND HEALTH SERVICES'
                  11='(11) LEISURE AND HOSPITALITY' 12='(12) OTHER SERVICES'
                  13='(13) PUBLIC ADMINISTRATION' 14='(14) ARMED FORCES' ;
  VALUE prmjoccf  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) MANAGEMENT, BUSINESS, AND FINANCIAL OCCUPATIONS'
                  2='(2) PROFESSIONAL AND RELATED OCCUPATIONS'
                  3='(3) SERVICE OCCUPATIONS' 4='(4) SALES AND RELATED OCCUPATIONS'
                  5='(5) OFFICE AND ADMINISTRATIVE SUPPORT OCCUPATIONS'
                  6='(6) FARMING, FISHING, AND FORESTRY OCCUPATIONS'
                  7='(7) CONSTRUCTION AND EXTRACTION OCCUPATIONS'
                  8='(8) INSTALLATION, MAINTENANCE, AND REPAIR OCCUPATIONS'
                  9='(9) PRODUCTION OCCUPATIONS'
                  10='(10) TRANSPORTATION AND MATERIAL MOVING OCCUPATIONS'
                  11='(11) ARMED FORCES' ;
  VALUE prmjocgr  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) MANAGEMENT, PROFESSIONAL, AND RELATED OCCUPATIONS'
                  2='(2) SERVICE OCCUPATIONS' 3='(3) SALES AND OFFICE OCCUPATIONS'
                  4='(4) FARMING, FISHING, AND FORESTRY OCCUPATIONS'
                  5='(5) CONSTRUCTION, AND MAINTENANCE OCCUPATIONS'
                  6='(6) PRODUCTION, TRANSPORTATION, AND MATERIAL MOVING OCCUPATIONS'
                  7='(7) ARMED FORCES' ;
  VALUE prnagpws  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) NON-AG PRIV WAGE & SALARY' ;
  VALUE prnagws   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) NON-AG WAGE AND SALARY WORKERS' ;
  VALUE prsjmj    -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) SINGLE JOBHOLDER' 2='(2) MULTIPLE JOBHOLDER' ;
  VALUE peschenr  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) YES' 2='(2) NO' ;
  VALUE peschft   -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) FULL-TIME' 2='(2) PART-TIME' ;
  VALUE peschlvl  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) HIGH SCHOOL' 2='(2) COLLEGE OR UNIVERSITY' ;
  VALUE prnlfsch  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) IN SCHOOL' 2='(2) NOT IN SCHOOL' ;
  VALUE prchld    -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) NIU (NOT A PARENT)'
                  0='(0) NO OWN CHILDREN UNDER 18 YEARS OF AGE'
                  1='(1) ALL OWN CHILDREN 0- 2 YEARS OF AGE'
                  2='(2) ALL OWN CHILDREN 3- 5 YEARS OF AGE'
                  3='(3) ALL OWN CHILDREN 6-13 YEARS OF AGE'
                  4='(4) ALL OWN CHILDREN 14-17 YEARS OF AGE'
                  5='(5) OWN CHILDREN 0- 2 AND 3- 5 YEARS OF AGE (NONE 6-17)'
                  6='(6) OWN CHILDREN 0- 2 AND 6-13 YEARS OF AGE (NONE 3- 5 OR 14-17)'
                  7='(7) OWN CHILDREN 0- 2 AND 14-17 YEARS OF AGE (NONE 3-13)'
                  8='(8) OWN CHILDREN 3- 5 AND 6-13 YEARS OF AGE (NONE 0- 2 OR 14-17)'
                  9='(9) OWN CHILDREN 3- 5 AND 14-17 YEARS OF AGE (NONE 0- 2 OR 6-13)'
                  10='(10) OWN CHILDREN 6-13 AND 14-17 YEARS OF AGE (NONE 0- 5)'
                  11='(11) OWN CHILDREN 0- 2, 3- 5, AND 6-13 YEARS OF AGE (NONE 14-17)'
                  12='(12) OWN CHILDREN 0- 2, 3- 5, AND 14-17 YEARS OF AGE (NONE 6-13)'
                  13='(13) OWN CHILDREN 0- 2, 6-13, AND 14-17 YEARS OF AGE (NONE 3- 5)'
                  14='(14) OWN CHILDREN 3- 5, 6-13, AND 14-17 YEARS OF AGE (NONE 0- 2)'
                  15='(15) OWN CHILDREN FROM ALL AGE GROUPS' ;
  VALUE prnmchld  -1='(-1) NIU (NOT A PARENT)' ;
  VALUE hxtenure  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE hxhousut  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE hxtelhhd  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE hxtelavl  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE hxphoneo  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxinusyr  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxrrp     -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxparent  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxage     -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxmaritl  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxspouse  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxsex     -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxafwhen  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxafnow   -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxeduca   -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxrace1f  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxnatvty  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxmntvty  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxfntvty  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxhspnon  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxmlr     -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxret1ff  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxabsrsn  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxabspdo  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxmjot    -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxmjnum   -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxhruslf  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxhrus0f  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxhrftpt  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxhruslt  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxhrwant  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxhrrsnf  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxhrrs0f  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxhractf  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxhrac0f  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxhractt  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxhrrs1f  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxhravl   -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxlayavl  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxlaylk   -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxlaydur  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxlayfto  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxlkm1ff  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxlkavl   -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxlkll1o  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxlkll2o  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxlklwo   -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxlkdur   -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxlkfto   -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxdwwnto  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxdwrsn   -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxdwlko   -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxdwwk    -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxdw4wk   -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxdwlkwk  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxdwavl   -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxdwavr   -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxio1cow  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxio1icd  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxio1ocd  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxschenr  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxschft   -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxschlvl  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pedipged  -1='(-1) NOT IN UNIVERSE' 1='(1) GRADUATION FROM HIGH SCHOOL'
                  2='(2) GED OR OTHER EQUIVALENT' ;
  VALUE pehgcomp  -1='(-1) NOT IN UNIVERSE' 1='(1) LESS THAN 1ST GRADE'
                  2='(2) 1ST, 2ND, 3RD, OR 4TH GRADE' 3='(3) 5TH OR 6TH GRADE'
                  4='(4) 7TH OR 8TH GRADE' 5='(5) 9TH GRADE' 6='(6) 10TH GRADE'
                  7='(7) 11TH GRADE' 8='(8) 12TH GRADE (NO DIPLOMA)' ;
  VALUE pecyc     -1='(-1) NOT IN UNIVERSE'
                  1='(1) LESS THAN 1 YEAR (INCLUDES 0 YEARS COMPLETED)'
                  2='(2) THE FIRST OR FRESHMAN YEAR'
                  3='(3) THE SECOND OR SOPHOMORE YEAR'
                  4='(4) THE THIRD OR JUNIOR YEAR' 5='(5) FOUR OR MORE YEARS' ;
  VALUE pegrprof  -1='(-1) NOT IN UNIVERSE' 1='(1) YES' 2='(2) NO' ;
  VALUE pegr6cor  -1='(-1) NOT IN UNIVERSE' 1='(1) YES' 2='(2) NO' ;
  VALUE pems123f  -1='(-1) NOT IN UNIVERSE' 1='(1) 1 YEAR PROGRAM' 2='(2) 2 YEAR PROGRAM'
                  3='(3) 3 YEAR PROGRAM' ;
  VALUE pxdipged  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxhgcomp  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxcyc     -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxgrprof  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxgr6cor  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE pxms123f  -1='(-1) NOT ALLOCATED' 0='(0) VALUE - NO CHANGE'
                  1='(1) BLANK - NO CHANGE' 2='(2) DON''T KNOW - NO CHANGE'
                  3='(3) REFUSED - NO CHANGE' 10='(10) VALUE TO VALUE'
                  11='(11) BLANK TO VALUE' 12='(12) DON''T KNOW TO VALUE'
                  13='(13) REFUSED TO VALUE' 20='(20) VALUE TO LONGITUDINAL VALUE'
                  21='(21) BLANK TO LONGITUDINAL VALUE'
                  22='(22) DON''T KNOW TO LONGITUDINAL VALUE'
                  23='(23) REFUSED TO LONGITUDINAL VALUE'
                  30='(30) VALUE TO ALLOCATED VALUE LONG.'
                  31='(31) BLANK TO ALLOCATED VALUE LONG.'
                  32='(32) DON''T KNOW TO ALLOCATED VALUE LONG.'
                  33='(33) REFUSED TO ALLOCATED VALUE LONG.'
                  40='(40) VALUE TO ALLOCATED VALUE' 41='(41) BLANK TO ALLOCATED VALUE'
                  42='(42) DON''T KNOW TO ALLOCATED VALUE'
                  43='(43) REFUSED TO ALLOCATED VALUE' 50='(50) VALUE TO BLANK'
                  52='(52) DON''T KNOW TO BLANK' 53='(53) REFUSED TO BLANK' ;
  VALUE peio1icd  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE' ;
  VALUE peio1ocd  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE' ;
  VALUE primindf  -3='(-3) REFUSED' -2='(-2) DON''T KNOW' -1='(-1) BLANK OR NOT IN UNIVERSE'
                  1='(1) AGRICULTURE, FORESTRY, FISHING, and HUNTING' 2='(2) MINING'
                  3='(3) CONSTRUCTION' 4='(4) MANUFACTURING - DURABLE GOODS'
                  5='(5) MANUFACTURING - NON-DURABLE GOODS' 6='(6) WHOLESALE TRADE'
                  7='(7) RETAIL TRADE' 8='(8) TRANSPORTATION AND WAREHOUSING'
                  9='(9) UTILITIES' 10='(10) INFORMATION' 11='(11) FINANCE AND INSURANCE'
                  12='(12) REAL ESTATE AND RENTAL AND LEASING'
                  13='(13) PROFESSIONAL AND TECHNICAL SERVICES'
                  14='(14) MANAGEMENT, ADMINISTRATIVE AND WASTE MANAGEMENT SERVICES'
                  15='(15) EDUCATIONAL SERVICES'
                  16='(16) HEALTH CARE AND SOCIAL SERVICES'
                  17='(17) ARTS, ENTERTAINMENT, AND RECREATION'
                  18='(18) ACCOMMODATION AND FOOD SERVICES'
                  19='(19) PRIVATE HOUSEHOLDS'
                  20='(20) OTHER SERVICES, EXCEPT PRIVATE HOUSEHOLDS'
                  21='(21) PUBLIC ADMINISTRATION' 22='(22) ARMED FORCES' ;
  VALUE heport    -9='(-9) No response' -3='(-3) Refused' -2='(-2) Don''t know'
                  -1='(-1) Blank or Not in Universe' 1='(1) Personal' 2='(2) Telephone' ;
  VALUE heq1ffff  -9='(-9) No response' -3='(-3) Refused' -2='(-2) Don''t know'
                  -1='(-1) Blank or Not in Universe' ;
  VALUE heq1a     -9='(-9) No response' -3='(-3) Refused' -2='(-2) Don''t know'
                  -1='(-1) Blank or Not in Universe' ;
  VALUE heq1b     -9='(-9) No response' -3='(-3) Refused' -2='(-2) Don''t know'
                  -1='(-1) Blank or Not in Universe' 1='(1) Yes' 2='(2) No' ;
  VALUE heq2ffff  -9='(-9) No response' -3='(-3) Refused' -2='(-2) Don''t know'
                  -1='(-1) Blank or Not in Universe' 1='(1) Yes' 2='(2) No' ;
  VALUE heq2a     -9='(-9) No response' -3='(-3) Refused' -2='(-2) Don''t know'
                  -1='(-1) Blank or Not in Universe' ;
  VALUE heq2b     -9='(-9) No response' -3='(-3) Refused' -2='(-2) Don''t know'
                  -1='(-1) Blank or Not in Universe' ;
  VALUE heq2c     -9='(-9) No response' -3='(-3) Refused' -2='(-2) Don''t know'
                  -1='(-1) Blank or Not in Universe' ;
  VALUE heq2d     -9='(-9) No response' -3='(-3) Refused' -2='(-2) Don''t know'
                  -1='(-1) Blank or Not in Universe' 1='(1) Yes' 2='(2) No' ;
  VALUE heq2e     -9='(-9) No response' -3='(-3) Refused' -2='(-2) Don''t know'
                  -1='(-1) Blank or Not in Universe' 1='(1) Yes' 2='(2) No' ;
  VALUE heq3ffff  -9='(-9) No response' -3='(-3) Refused' -2='(-2) Don''t know'
                  -1='(-1) Blank or Not in Universe' 1='(1) All or almost all calls,'
                  2='(2) More than half,' 3='(3) Less than half, or'
                  4='(4) Very few or none?' ;
  VALUE hrsupint  1='(1) Interview' 2='(2) Noninterview' ;
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA;
INFILE "data-filename" LRECL=608;
INPUT
       HRHHID $1-15            HRYEAR4 16-19
        HURESPLI 20-21          HUFINAL 22-24           HUSPNISH 25-26
        HETENURE 27-28          HEHOUSUT 29-30          HETELHHD 31-32
        HETELAVL 33-34          HEPHONEO 35-36          HUFAMINC 37-38
        HRINTSTA 39-40          HRNUMHOU 41-42          HRHTYPE 43-44
        HUINTTYP 45-46          HUPRSCNT 47-48          HRLONGLK 49-50
        HRSAMPLE $51-54         HRSERSUF $55-56         HUHHNUM 57-58
        HUBUS 59-60             HUBUSL1 61-62           HUBUSL2 63-64
        HUBUSL3 65-66           HUBUSL4 67-68           GEREG 69-70
        GESTCEN 71-72           GESTFIPS 73-74          PUPELIG 75-76
        PERRP 77-78             PEPARENT 79-80          PEAGE 81-82
        PTAGE 83                PEMARITL 84-85          PESPOUSE 86-87
        PESEX 88-89             PUAFEVER 90-91          PEAFWHEN 92-93
        PEAFNOW 94-95           PEEDUCA 96-97           PRDTRACE 98-99
        PRDTHSP 100-101         PUCHINHH 102-103        PURELFLG 104-105
        PULINENO 106-107        PRFAMNUM 108-109        PRFAMREL 110-111
        PRFAMTYP 112-113        PEHSPNON 114-115        PRMARSTA 116-117
        PRPERTYP 118-119        PENATVTY 120-122        PEMNTVTY 123-125
        PEFNTVTY 126-128        PRCITSHP 129-130        PRCITFLG 131-132
        PRINUSYR 133-134        PUSLFPRX 135-136        PEMLR 137-138
        PUWK 139-140            PUBUS1 141-142          PUBUS2OT 143-144
        PUBUSCK1 145-146        PUBUSCK2 147-148        PUBUSCK3 149-150
        PUBUSCK4 151-152        PURETOT 153-154         PUDIS 155-156
        PERET1 157-158          PUDIS1 159-160          PUDIS2 161-162
        PUABSOT 163-164         PULAY 165-166           PEABSRSN 167-168
        PEABSPDO 169-170        PEMJOT 171-172          PEMJNUM 173-174
        PEHRUSL1 175-176        PEHRUSL2 177-178        PEHRFTPT 179-180
        PEHRUSLT 181-183        PEHRWANT 184-185        PEHRRSN1 186-187
        PEHRRSN2 188-189        PEHRRSN3 190-191        PUHROFF1 192-193
        PUHROFF2 194-195        PUHROT1 196-197         PUHROT2 198-199
        PEHRACT1 200-201        PEHRACT2 202-203        PEHRACTT 204-206
        PEHRAVL 207-208         PUHRCK1 209-210         PUHRCK2 211-212
        PUHRCK3 213-214         PUHRCK4 215-216         PUHRCK5 217-218
        PUHRCK6 219-220         PUHRCK7 221-222         PUHRCK12 223-224
        PULAYDT 225-226         PULAY6M 227-228         PELAYAVL 229-230
        PULAYAVR 231-232        PELAYLK 233-234         PELAYDUR 235-237
        PELAYFTO 238-239        PULAYCK1 240-241        PULAYCK2 242-243
        PULAYCK3 244-245        PULK 246-247            PELKM1 248-249
        PULKM2 250-251          PULKM3 252-253          PULKM4 254-255
        PULKM5 256-257          PULKM6 258-259          PULKDK1 260-261
        PULKDK2 262-263         PULKDK3 264-265         PULKDK4 266-267
        PULKDK5 268-269         PULKDK6 270-271         PULKPS1 272-273
        PULKPS2 274-275         PULKPS3 276-277         PULKPS4 278-279
        PULKPS5 280-281         PULKPS6 282-283         PELKAVL 284-285
        PULKAVR 286-287         PELKLL1O 288-289        PELKLL2O 290-291
        PELKLWO 292-293         PELKDUR 294-296         PELKFTO 297-298
        PEDWWNTO 299-300        PEDWRSN 301-302         PEDWLKO 303-304
        PEDWWK 305-306          PEDW4WK 307-308         PEDWLKWK 309-310
        PEDWAVL 311-312         PEDWAVR 313-314         PUDWCK1 315-316
        PUDWCK2 317-318         PUDWCK3 319-320         PUDWCK4 321-322
        PUDWCK5 323-324         PRABSREA 325-326        PRCIVLF 327-328
        PRDISC 329-330          PREMPHRS 331-332        PREMPNOT 333-334
        PREXPLF 335-336         PRFTLF 337-338          PRHRUSL 339-340
        PRJOBSEA 341-342        PRPTHRS 343-344         PRPTREA 345-346
        PRUNEDUR 347-349        PRUNTYPE 350-351        PRWKSCH 352-353
        PRWKSTAT 354-355        PRWNTJOB 356-357        PUIODP1 358-359
        PUIODP2 360-361         PUIODP3 362-363         PEIO1COW 364-365
        PUIO1MFG 366-367        PUIOCK1 368-369         PUIOCK2 370-371
        PUIOCK3 372-373         PRIOELG 374-375         PRAGNA 376-377
        PRCOW1 378-379          PRCOWPG 380-381         PRDTCOW1 382-383
        PRDTIND1 384-385        PRDTOCC1 386-387        PREMP 388-389
        PRMJIND1 390-391        PRMJOCC1 392-393        PRMJOCGR 394-395
        PRNAGPWS 396-397        PRNAGWS 398-399         PRSJMJ 400-401
        PESCHENR 402-403        PESCHFT 404-405         PESCHLVL 406-407
        PRNLFSCH 408-409        PRCHLD 410-411          PRNMCHLD 412-413
        HXTENURE 414-415        HXHOUSUT 416-417        HXTELHHD 418-419
        HXTELAVL 420-421        HXPHONEO 422-423        PXINUSYR 424-425
        PXRRP 426-427           PXPARENT 428-429        PXAGE 430-431
        PXMARITL 432-433        PXSPOUSE 434-435        PXSEX 436-437
        PXAFWHEN 438-439        PXAFNOW 440-441         PXEDUCA 442-443
        PXRACE1 444-445         PXNATVTY 446-447        PXMNTVTY 448-449
        PXFNTVTY 450-451        PXHSPNON 452-453        PXMLR 454-455
        PXRET1 456-457          PXABSRSN 458-459        PXABSPDO 460-461
        PXMJOT 462-463          PXMJNUM 464-465         PXHRUSL1 466-467
        PXHRUSL2 468-469        PXHRFTPT 470-471        PXHRUSLT 472-473
        PXHRWANT 474-475        PXHRRSN1 476-477        PXHRRSN2 478-479
        PXHRACT1 480-481        PXHRACT2 482-483        PXHRACTT 484-485
        PXHRRSN3 486-487        PXHRAVL 488-489         PXLAYAVL 490-491
        PXLAYLK 492-493         PXLAYDUR 494-495        PXLAYFTO 496-497
        PXLKM1 498-499          PXLKAVL 500-501         PXLKLL1O 502-503
        PXLKLL2O 504-505        PXLKLWO 506-507         PXLKDUR 508-509
        PXLKFTO 510-511         PXDWWNTO 512-513        PXDWRSN 514-515
        PXDWLKO 516-517         PXDWWK 518-519          PXDW4WK 520-521
        PXDWLKWK 522-523        PXDWAVL 524-525         PXDWAVR 526-527
        PXIO1COW 528-529        PXIO1ICD 530-531        PXIO1OCD 532-533
        PXSCHENR 534-535        PXSCHFT 536-537         PXSCHLVL 538-539
        OCCURNUM $540-541       PEDIPGED 542-543        PEHGCOMP 544-545
        PECYC 546-547           PEGRPROF 548-549        PEGR6COR 550-551
        PEMS123 552-553         PXDIPGED 554-555        PXHGCOMP 556-557
        PXCYC 558-559           PXGRPROF 560-561        PXGR6COR 562-563
        PXMS123 564-565         PEIO1ICD 566-569        PEIO1OCD 570-573
        PRIMIND1 574-575        HEPORT 576-577          HEQ1 578-579
        HEQ1A 580-581           HEQ1B 582-583           HEQ2 584-585
        HEQ2A 586-587           HEQ2B 588-589           HEQ2C 590-591
        HEQ2D 592-593           HEQ2E 594-595           HEQ3 596-597
        HRSUPINT 598            HWSUPWGT 599-608        ;


* SAS LABEL STATEMENT;

LABEL
   HRHHID  = 'HRHHID'
   HRYEAR4 = 'HRYEAR4'
   HURESPLI= 'HURESPLI'
   HUFINAL = 'HUFINAL'
   HUSPNISH= 'HUSPNISH'
   HETENURE= 'HETENURE'
   HEHOUSUT= 'HEHOUSUT'
   HETELHHD= 'HETELHHD'
   HETELAVL= 'HETELAVL'
   HEPHONEO= 'HEPHONEO'
   HUFAMINC= 'HUFAMINC'
   HRINTSTA= 'HRINTSTA'
   HRNUMHOU= 'HRNUMHOU'
   HRHTYPE = 'HRHTYPE'
   HUINTTYP= 'HUINTTYP'
   HUPRSCNT= 'HUPRSCNT'
   HRLONGLK= 'HRLONGLK'
   HRSAMPLE= 'HRSAMPLE'
   HRSERSUF= 'HRSERSUF'
   HUHHNUM = 'HUHHNUM'
   HUBUS   = 'HUBUS'
   HUBUSL1 = 'HUBUSL1'
   HUBUSL2 = 'HUBUSL2'
   HUBUSL3 = 'HUBUSL3'
   HUBUSL4 = 'HUBUSL4'
   GEREG   = 'GEREG'
   GESTCEN = 'GESTCEN'
   GESTFIPS= 'GESTFIPS'
   PUPELIG = 'PUPELIG'
   PERRP   = 'PERRP'
   PEPARENT= 'PEPARENT'
   PEAGE   = 'PEAGE'
   PTAGE   = 'PTAGE'
   PEMARITL= 'PEMARITL'
   PESPOUSE= 'PESPOUSE'
   PESEX   = 'PESEX'
   PUAFEVER= 'PUAFEVER'
   PEAFWHEN= 'PEAFWHEN'
   PEAFNOW = 'PEAFNOW'
   PEEDUCA = 'PEEDUCA'
   PRDTRACE= 'PRDTRACE'
   PRDTHSP = 'PRDTHSP'
   PUCHINHH= 'PUCHINHH'
   PURELFLG= 'PURELFLG'
   PULINENO= 'PULINENO'
   PRFAMNUM= 'PRFAMNUM'
   PRFAMREL= 'PRFAMREL'
   PRFAMTYP= 'PRFAMTYP'
   PEHSPNON= 'PEHSPNON'
   PRMARSTA= 'PRMARSTA'
   PRPERTYP= 'PRPERTYP'
   PENATVTY= 'PENATVTY'
   PEMNTVTY= 'PEMNTVTY'
   PEFNTVTY= 'PEFNTVTY'
   PRCITSHP= 'PRCITSHP'
   PRCITFLG= 'PRCITFLG'
   PRINUSYR= 'PRINUSYR'
   PUSLFPRX= 'PUSLFPRX'
   PEMLR   = 'PEMLR'
   PUWK    = 'PUWK'
   PUBUS1  = 'PUBUS1'
   PUBUS2OT= 'PUBUS2OT'
   PUBUSCK1= 'PUBUSCK1'
   PUBUSCK2= 'PUBUSCK2'
   PUBUSCK3= 'PUBUSCK3'
   PUBUSCK4= 'PUBUSCK4'
   PURETOT = 'PURETOT'
   PUDIS   = 'PUDIS'
   PERET1  = 'PERET1'
   PUDIS1  = 'PUDIS1'
   PUDIS2  = 'PUDIS2'
   PUABSOT = 'PUABSOT'
   PULAY   = 'PULAY'
   PEABSRSN= 'PEABSRSN'
   PEABSPDO= 'PEABSPDO'
   PEMJOT  = 'PEMJOT'
   PEMJNUM = 'PEMJNUM'
   PEHRUSL1= 'PEHRUSL1'
   PEHRUSL2= 'PEHRUSL2'
   PEHRFTPT= 'PEHRFTPT'
   PEHRUSLT= 'PEHRUSLT'
   PEHRWANT= 'PEHRWANT'
   PEHRRSN1= 'PEHRRSN1'
   PEHRRSN2= 'PEHRRSN2'
   PEHRRSN3= 'PEHRRSN3'
   PUHROFF1= 'PUHROFF1'
   PUHROFF2= 'PUHROFF2'
   PUHROT1 = 'PUHROT1'
   PUHROT2 = 'PUHROT2'
   PEHRACT1= 'PEHRACT1'
   PEHRACT2= 'PEHRACT2'
   PEHRACTT= 'PEHRACTT'
   PEHRAVL = 'PEHRAVL'
   PUHRCK1 = 'PUHRCK1'
   PUHRCK2 = 'PUHRCK2'
   PUHRCK3 = 'PUHRCK3'
   PUHRCK4 = 'PUHRCK4'
   PUHRCK5 = 'PUHRCK5'
   PUHRCK6 = 'PUHRCK6'
   PUHRCK7 = 'PUHRCK7'
   PUHRCK12= 'PUHRCK12'
   PULAYDT = 'PULAYDT'
   PULAY6M = 'PULAY6M'
   PELAYAVL= 'PELAYAVL'
   PULAYAVR= 'PULAYAVR'
   PELAYLK = 'PELAYLK'
   PELAYDUR= 'PELAYDUR'
   PELAYFTO= 'PELAYFTO'
   PULAYCK1= 'PULAYCK1'
   PULAYCK2= 'PULAYCK2'
   PULAYCK3= 'PULAYCK3'
   PULK    = 'PULK'
   PELKM1  = 'PELKM1'
   PULKM2  = 'PULKM2'
   PULKM3  = 'PULKM3'
   PULKM4  = 'PULKM4'
   PULKM5  = 'PULKM5'
   PULKM6  = 'PULKM6'
   PULKDK1 = 'PULKDK1'
   PULKDK2 = 'PULKDK2'
   PULKDK3 = 'PULKDK3'
   PULKDK4 = 'PULKDK4'
   PULKDK5 = 'PULKDK5'
   PULKDK6 = 'PULKDK6'
   PULKPS1 = 'PULKPS1'
   PULKPS2 = 'PULKPS2'
   PULKPS3 = 'PULKPS3'
   PULKPS4 = 'PULKPS4'
   PULKPS5 = 'PULKPS5'
   PULKPS6 = 'PULKPS6'
   PELKAVL = 'PELKAVL'
   PULKAVR = 'PULKAVR'
   PELKLL1O= 'PELKLL1O'
   PELKLL2O= 'PELKLL2O'
   PELKLWO = 'PELKLWO'
   PELKDUR = 'PELKDUR'
   PELKFTO = 'PELKFTO'
   PEDWWNTO= 'PEDWWNTO'
   PEDWRSN = 'PEDWRSN'
   PEDWLKO = 'PEDWLKO'
   PEDWWK  = 'PEDWWK'
   PEDW4WK = 'PEDW4WK'
   PEDWLKWK= 'PEDWLKWK'
   PEDWAVL = 'PEDWAVL'
   PEDWAVR = 'PEDWAVR'
   PUDWCK1 = 'PUDWCK1'
   PUDWCK2 = 'PUDWCK2'
   PUDWCK3 = 'PUDWCK3'
   PUDWCK4 = 'PUDWCK4'
   PUDWCK5 = 'PUDWCK5'
   PRABSREA= 'PRABSREA'
   PRCIVLF = 'PRCIVLF'
   PRDISC  = 'PRDISC'
   PREMPHRS= 'PREMPHRS'
   PREMPNOT= 'PREMPNOT'
   PREXPLF = 'PREXPLF'
   PRFTLF  = 'PRFTLF'
   PRHRUSL = 'PRHRUSL'
   PRJOBSEA= 'PRJOBSEA'
   PRPTHRS = 'PRPTHRS'
   PRPTREA = 'PRPTREA'
   PRUNEDUR= 'PRUNEDUR'
   PRUNTYPE= 'PRUNTYPE'
   PRWKSCH = 'PRWKSCH'
   PRWKSTAT= 'PRWKSTAT'
   PRWNTJOB= 'PRWNTJOB'
   PUIODP1 = 'PUIODP1'
   PUIODP2 = 'PUIODP2'
   PUIODP3 = 'PUIODP3'
   PEIO1COW= 'PEIO1COW'
   PUIO1MFG= 'PUIO1MFG'
   PUIOCK1 = 'PUIOCK1'
   PUIOCK2 = 'PUIOCK2'
   PUIOCK3 = 'PUIOCK3'
   PRIOELG = 'PRIOELG'
   PRAGNA  = 'PRAGNA'
   PRCOW1  = 'PRCOW1'
   PRCOWPG = 'PRCOWPG'
   PRDTCOW1= 'PRDTCOW1'
   PRDTIND1= 'PRDTIND1'
   PRDTOCC1= 'PRDTOCC1'
   PREMP   = 'PREMP'
   PRMJIND1= 'PRMJIND1'
   PRMJOCC1= 'PRMJOCC1'
   PRMJOCGR= 'PRMJOCGR'
   PRNAGPWS= 'PRNAGPWS'
   PRNAGWS = 'PRNAGWS'
   PRSJMJ  = 'PRSJMJ'
   PESCHENR= 'PESCHENR'
   PESCHFT = 'PESCHFT'
   PESCHLVL= 'PESCHLVL'
   PRNLFSCH= 'PRNLFSCH'
   PRCHLD  = 'PRCHLD'
   PRNMCHLD= 'PRNMCHLD'
   HXTENURE= 'HXTENURE'
   HXHOUSUT= 'HXHOUSUT'
   HXTELHHD= 'HXTELHHD'
   HXTELAVL= 'HXTELAVL'
   HXPHONEO= 'HXPHONEO'
   PXINUSYR= 'PXINUSYR'
   PXRRP   = 'PXRRP'
   PXPARENT= 'PXPARENT'
   PXAGE   = 'PXAGE'
   PXMARITL= 'PXMARITL'
   PXSPOUSE= 'PXSPOUSE'
   PXSEX   = 'PXSEX'
   PXAFWHEN= 'PXAFWHEN'
   PXAFNOW = 'PXAFNOW'
   PXEDUCA = 'PXEDUCA'
   PXRACE1 = 'PXRACE1'
   PXNATVTY= 'PXNATVTY'
   PXMNTVTY= 'PXMNTVTY'
   PXFNTVTY= 'PXFNTVTY'
   PXHSPNON= 'PXHSPNON'
   PXMLR   = 'PXMLR'
   PXRET1  = 'PXRET1'
   PXABSRSN= 'PXABSRSN'
   PXABSPDO= 'PXABSPDO'
   PXMJOT  = 'PXMJOT'
   PXMJNUM = 'PXMJNUM'
   PXHRUSL1= 'PXHRUSL1'
   PXHRUSL2= 'PXHRUSL2'
   PXHRFTPT= 'PXHRFTPT'
   PXHRUSLT= 'PXHRUSLT'
   PXHRWANT= 'PXHRWANT'
   PXHRRSN1= 'PXHRRSN1'
   PXHRRSN2= 'PXHRRSN2'
   PXHRACT1= 'PXHRACT1'
   PXHRACT2= 'PXHRACT2'
   PXHRACTT= 'PXHRACTT'
   PXHRRSN3= 'PXHRRSN3'
   PXHRAVL = 'PXHRAVL'
   PXLAYAVL= 'PXLAYAVL'
   PXLAYLK = 'PXLAYLK'
   PXLAYDUR= 'PXLAYDUR'
   PXLAYFTO= 'PXLAYFTO'
   PXLKM1  = 'PXLKM1'
   PXLKAVL = 'PXLKAVL'
   PXLKLL1O= 'PXLKLL1O'
   PXLKLL2O= 'PXLKLL2O'
   PXLKLWO = 'PXLKLWO'
   PXLKDUR = 'PXLKDUR'
   PXLKFTO = 'PXLKFTO'
   PXDWWNTO= 'PXDWWNTO'
   PXDWRSN = 'PXDWRSN'
   PXDWLKO = 'PXDWLKO'
   PXDWWK  = 'PXDWWK'
   PXDW4WK = 'PXDW4WK'
   PXDWLKWK= 'PXDWLKWK'
   PXDWAVL = 'PXDWAVL'
   PXDWAVR = 'PXDWAVR'
   PXIO1COW= 'PXIO1COW'
   PXIO1ICD= 'PXIO1ICD'
   PXIO1OCD= 'PXIO1OCD'
   PXSCHENR= 'PXSCHENR'
   PXSCHFT = 'PXSCHFT'
   PXSCHLVL= 'PXSCHLVL'
   OCCURNUM= 'OCCURNUM'
   PEDIPGED= 'PEDIPGED'
   PEHGCOMP= 'PEHGCOMP'
   PECYC   = 'PECYC'
   PEGRPROF= 'PEGRPROF'
   PEGR6COR= 'PEGR6COR'
   PEMS123 = 'PEMS123'
   PXDIPGED= 'PXDIPGED'
   PXHGCOMP= 'PXHGCOMP'
   PXCYC   = 'PXCYC'
   PXGRPROF= 'PXGRPROF'
   PXGR6COR= 'PXGR6COR'
   PXMS123 = 'PXMS123'
   PEIO1ICD= 'PEIO1ICD'
   PEIO1OCD= 'PEIO1OCD'
   PRIMIND1= 'PRIMIND1'
   HEPORT  = 'HEPORT'
   HEQ1    = 'HEQ1'
   HEQ1A   = 'HEQ1A'
   HEQ1B   = 'HEQ1B'
   HEQ2    = 'HEQ2'
   HEQ2A   = 'HEQ2A'
   HEQ2B   = 'HEQ2B'
   HEQ2C   = 'HEQ2C'
   HEQ2D   = 'HEQ2D'
   HEQ2E   = 'HEQ2E'
   HEQ3    = 'HEQ3'
   HRSUPINT= 'HRSUPINT'
   HWSUPWGT= 'HWSUPWGT'
        ;


* SAS FORMAT STATEMENT;

/*
  FORMAT HURESPLI hurespli. HUFINAL hufinal. HUSPNISH huspnish.
         HETENURE hetenure. HEHOUSUT hehousut. HETELHHD hetelhhd.
         HETELAVL hetelavl. HEPHONEO hephoneo. HUFAMINC hufaminc.
         HRINTSTA hrintsta. HRHTYPE hrhtype. HUINTTYP huinttyp.
         HUPRSCNT huprscnt. HRLONGLK hrlonglk. HUHHNUM huhhnum.
         HUBUS hubus. HUBUSL1 hubusl1f. HUBUSL2 hubusl2f.
         HUBUSL3 hubusl3f. HUBUSL4 hubusl4f. GEREG gereg.
         GESTCEN gestcen. GESTFIPS gestfips. PUPELIG pupelig.
         PERRP perrp. PEPARENT peparent. PEAGE peage.
         PTAGE ptage. PEMARITL pemaritl. PESPOUSE pespouse.
         PESEX pesex. PUAFEVER puafever. PEAFWHEN peafwhen.
         PEAFNOW peafnow. PEEDUCA peeduca. PRDTRACE prdtrace.
         PRDTHSP prdthsp. PUCHINHH puchinhh. PURELFLG purelflg.
         PULINENO pulineno. PRFAMNUM prfamnum. PRFAMREL prfamrel.
         PRFAMTYP prfamtyp. PEHSPNON pehspnon. PRMARSTA prmarsta.
         PRPERTYP prpertyp. PENATVTY penatvty. PEMNTVTY pemntvty.
         PEFNTVTY pefntvty. PRCITSHP prcitshp. PRCITFLG prcitflg.
         PRINUSYR prinusyr. PUSLFPRX puslfprx. PEMLR pemlr.
         PUWK puwk. PUBUS1 pubus1ff. PUBUS2OT pubus2ot.
         PUBUSCK1 pubusckf. PUBUSCK2 pubusc0f. PUBUSCK3 pubusc1f.
         PUBUSCK4 pubusc2f. PURETOT puretot. PUDIS pudis.
         PERET1 peret1ff. PUDIS1 pudis1ff. PUDIS2 pudis2ff.
         PUABSOT puabsot. PULAY pulay. PEABSRSN peabsrsn.
         PEABSPDO peabspdo. PEMJOT pemjot. PEMJNUM pemjnum.
         PEHRUSL1 pehruslf. PEHRUSL2 pehrus0f. PEHRFTPT pehrftpt.
         PEHRUSLT pehruslt. PEHRWANT pehrwant. PEHRRSN1 pehrrsnf.
         PEHRRSN2 pehrrs0f. PEHRRSN3 pehrrs1f. PUHROFF1 puhrofff.
         PUHROFF2 puhrof0f. PUHROT1 puhrot1f. PUHROT2 puhrot2f.
         PEHRACT1 pehractf. PEHRACT2 pehrac0f. PEHRACTT pehractt.
         PEHRAVL pehravl. PUHRCK1 puhrck1f. PUHRCK2 puhrck2f.
         PUHRCK3 puhrck3f. PUHRCK4 puhrck4f. PUHRCK5 puhrck5f.
         PUHRCK6 puhrck6f. PUHRCK7 puhrck7f. PUHRCK12 puhrck0f.
         PULAYDT pulaydt. PULAY6M pulay6m. PELAYAVL pelayavl.
         PULAYAVR pulayavr. PELAYLK pelaylk. PELAYDUR pelaydur.
         PELAYFTO pelayfto. PULAYCK1 pulayckf. PULAYCK2 pulayc0f.
         PULAYCK3 pulayc1f. PULK pulk. PELKM1 pelkm1ff.
         PULKM2 pulkm2ff. PULKM3 pulkm3ff. PULKM4 pulkm4ff.
         PULKM5 pulkm5ff. PULKM6 pulkm6ff. PULKDK1 pulkdk1f.
         PULKDK2 pulkdk2f. PULKDK3 pulkdk3f. PULKDK4 pulkdk4f.
         PULKDK5 pulkdk5f. PULKDK6 pulkdk6f. PULKPS1 pulkps1f.
         PULKPS2 pulkps2f. PULKPS3 pulkps3f. PULKPS4 pulkps4f.
         PULKPS5 pulkps5f. PULKPS6 pulkps6f. PELKAVL pelkavl.
         PULKAVR pulkavr. PELKLL1O pelkll1o. PELKLL2O pelkll2o.
         PELKLWO pelklwo. PELKDUR pelkdur. PELKFTO pelkfto.
         PEDWWNTO pedwwnto. PEDWRSN pedwrsn. PEDWLKO pedwlko.
         PEDWWK pedwwk. PEDW4WK pedw4wk. PEDWLKWK pedwlkwk.
         PEDWAVL pedwavl. PEDWAVR pedwavr. PUDWCK1 pudwck1f.
         PUDWCK2 pudwck2f. PUDWCK3 pudwck3f. PUDWCK4 pudwck4f.
         PUDWCK5 pudwck5f. PRABSREA prabsrea. PRCIVLF prcivlf.
         PRDISC prdisc. PREMPHRS premphrs. PREMPNOT prempnot.
         PREXPLF prexplf. PRFTLF prftlf. PRHRUSL prhrusl.
         PRJOBSEA prjobsea. PRPTHRS prpthrs. PRPTREA prptrea.
         PRUNEDUR prunedur. PRUNTYPE pruntype. PRWKSCH prwksch.
         PRWKSTAT prwkstat. PRWNTJOB prwntjob. PUIODP1 puiodp1f.
         PUIODP2 puiodp2f. PUIODP3 puiodp3f. PEIO1COW peio1cow.
         PUIO1MFG puio1mfg. PUIOCK1 puiock1f. PUIOCK2 puiock2f.
         PUIOCK3 puiock3f. PRIOELG prioelg. PRAGNA pragna.
         PRCOW1 prcow1ff. PRCOWPG prcowpg. PRDTCOW1 prdtcowf.
         PRDTIND1 prdtindf. PRDTOCC1 prdtoccf. PREMP premp.
         PRMJIND1 prmjindf. PRMJOCC1 prmjoccf. PRMJOCGR prmjocgr.
         PRNAGPWS prnagpws. PRNAGWS prnagws. PRSJMJ prsjmj.
         PESCHENR peschenr. PESCHFT peschft. PESCHLVL peschlvl.
         PRNLFSCH prnlfsch. PRCHLD prchld. PRNMCHLD prnmchld.
         HXTENURE hxtenure. HXHOUSUT hxhousut. HXTELHHD hxtelhhd.
         HXTELAVL hxtelavl. HXPHONEO hxphoneo. PXINUSYR pxinusyr.
         PXRRP pxrrp. PXPARENT pxparent. PXAGE pxage.
         PXMARITL pxmaritl. PXSPOUSE pxspouse. PXSEX pxsex.
         PXAFWHEN pxafwhen. PXAFNOW pxafnow. PXEDUCA pxeduca.
         PXRACE1 pxrace1f. PXNATVTY pxnatvty. PXMNTVTY pxmntvty.
         PXFNTVTY pxfntvty. PXHSPNON pxhspnon. PXMLR pxmlr.
         PXRET1 pxret1ff. PXABSRSN pxabsrsn. PXABSPDO pxabspdo.
         PXMJOT pxmjot. PXMJNUM pxmjnum. PXHRUSL1 pxhruslf.
         PXHRUSL2 pxhrus0f. PXHRFTPT pxhrftpt. PXHRUSLT pxhruslt.
         PXHRWANT pxhrwant. PXHRRSN1 pxhrrsnf. PXHRRSN2 pxhrrs0f.
         PXHRACT1 pxhractf. PXHRACT2 pxhrac0f. PXHRACTT pxhractt.
         PXHRRSN3 pxhrrs1f. PXHRAVL pxhravl. PXLAYAVL pxlayavl.
         PXLAYLK pxlaylk. PXLAYDUR pxlaydur. PXLAYFTO pxlayfto.
         PXLKM1 pxlkm1ff. PXLKAVL pxlkavl. PXLKLL1O pxlkll1o.
         PXLKLL2O pxlkll2o. PXLKLWO pxlklwo. PXLKDUR pxlkdur.
         PXLKFTO pxlkfto. PXDWWNTO pxdwwnto. PXDWRSN pxdwrsn.
         PXDWLKO pxdwlko. PXDWWK pxdwwk. PXDW4WK pxdw4wk.
         PXDWLKWK pxdwlkwk. PXDWAVL pxdwavl. PXDWAVR pxdwavr.
         PXIO1COW pxio1cow. PXIO1ICD pxio1icd. PXIO1OCD pxio1ocd.
         PXSCHENR pxschenr. PXSCHFT pxschft. PXSCHLVL pxschlvl.
         PEDIPGED pedipged. PEHGCOMP pehgcomp. PECYC pecyc.
         PEGRPROF pegrprof. PEGR6COR pegr6cor. PEMS123 pems123f.
         PXDIPGED pxdipged. PXHGCOMP pxhgcomp. PXCYC pxcyc.
         PXGRPROF pxgrprof. PXGR6COR pxgr6cor. PXMS123 pxms123f.
         PEIO1ICD peio1icd. PEIO1OCD peio1ocd. PRIMIND1 primindf.
         HEPORT heport. HEQ1 heq1ffff. HEQ1A heq1a.
         HEQ1B heq1b. HEQ2 heq2ffff. HEQ2A heq2a.
         HEQ2B heq2b. HEQ2C heq2c. HEQ2D heq2d.
         HEQ2E heq2e. HEQ3 heq3ffff. HRSUPINT hrsupint.
          ;
*/

RUN ;
