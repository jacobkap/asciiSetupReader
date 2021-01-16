/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 31261
 |             ANNUAL SURVEY OF JAILS: JAIL-LEVEL DATA, 2010
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
 | "c:\temp\31261-0001-data.txt").
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
  VALUE state     1='(1) AL' 3='(3) AZ' 4='(4) AR' 5='(5) CA' 6='(6) CO' 7='(7) CT' 8='(8) DE' 9='(9) DC'
                  10='(10) FL' 11='(11) GA' 13='(13) ID' 14='(14) IL' 15='(15) IN' 16='(16) IA' 17='(17) KS'
                  18='(18) KY' 19='(19) LA' 20='(20) ME' 21='(21) MD' 22='(22) MA' 23='(23) MI' 24='(24) MN'
                  25='(25) MS' 26='(26) MO' 27='(27) MT' 28='(28) NE' 29='(29) NV' 30='(30) NH' 31='(31) NJ'
                  32='(32) NM' 33='(33) NY' 34='(34) NC' 35='(35) ND' 36='(36) OH' 37='(37) OK' 38='(38) OR'
                  39='(39) PA' 41='(41) SC' 42='(42) SD' 43='(43) TN' 44='(44) TX' 45='(45) UT' 47='(47) VA'
                  48='(48) WA' 49='(49) WV' 50='(50) WI' 51='(51) WY' ;
  VALUE confpopf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE nconpopf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE totpopf   0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE noncitzf  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE week      -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE weekf     0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE adultmf   0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE adultff   0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE juvmf     0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE juvff     0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE totgendf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE adltjuvf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE convf     0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE convunsf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE convsenf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE unconvf   0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE unconvtf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE unconvhf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE unconvof  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE s2qii3cf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE whitef    0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE blackf    0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE hispf     0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE aianf     0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE asianf    0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE nhopif    0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE tworacef  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE otherraf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE racedkf   0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE racetotf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE marshalf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE bopf      0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE icef      0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE biaf      0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE s2qii5af  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE instatef  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE outstatf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE instat0f  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE outsta0f  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE s2qii5df  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE peakpopf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE adpf      0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE ratedf    0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE operatif  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE designf   0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE admisf    0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE releasef  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE convii1f  -9='(-9) Blank' ;
  VALUE convii0f  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE unconvif  -9='(-9) Blank' ;
  VALUE unconv0f  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE convii2f  -9='(-9) Blank' ;
  VALUE convii3f  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE unconv1f  -9='(-9) Blank' ;
  VALUE unconv2f  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE convii4f  -9='(-9) Blank' ;
  VALUE convii5f  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE unconv3f  -9='(-9) Blank' ;
  VALUE unconv4f  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE convii6f  -9='(-9) Blank' ;
  VALUE convii7f  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE unconv5f  -9='(-9) Blank' ;
  VALUE unconv6f  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE convii8f  -9='(-9) Blank' ;
  VALUE convii9f  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE unconv7f  -9='(-9) Blank' ;
  VALUE unconv8f  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE convi10f  -9='(-9) Blank' ;
  VALUE convfiif  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE unconv9f  -9='(-9) Blank' ;
  VALUE uncon10f  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE s2ii10gf  -9='(-9) Blank' ;
  VALUE s2ii100f  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE s2ii101f  -9='(-9) Blank' ;
  VALUE s2ii102f  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE emonitof  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE homedetf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE commsrvf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE dayrepof  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE pretriaf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE altworkf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE treatmef  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE otrnoncf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE nonconff  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE admlncnf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE adfmncnf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE jvmlncnf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE jvfmncnf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE ncnfgndf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE convncnf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE uncnvncf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE totcnvsf  0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable' 9='(9) Don''t know' ;
  VALUE corrstaf  -9='(-9) Blank' ;
  VALUE corrst0f  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE otherstf  -9='(-9) Blank' ;
  VALUE others0f  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE s4qiv1c   -9='(-9) Blank' ;
  VALUE s4qiv1cf  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE assaultf  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE assaul0f  -9='(-9) Blank' ;
  VALUE assaul1f  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE assaul2f  -9='(-9) Blank' ;
  VALUE assaul3f  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE deathstf  -9='(-9) Blank' 1='(1) Yes' 2='(2) No' ;
  VALUE deathcof  -9='(-9) Blank' ;
  VALUE deathc0f  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE deathotf  -9='(-9) Blank' ;
  VALUE deatho0f  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE physassf  -9='(-9) Blank' ;
  VALUE physas0f  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE drugvio   -9='(-9) Blank' ;
  VALUE drugviof  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE alcovio   -9='(-9) Blank' ;
  VALUE alcoviof  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE weapon    -9='(-9) Blank' ;
  VALUE weaponf   -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE stolenpf  -9='(-9) Blank' ;
  VALUE stolen0f  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE escape    -9='(-9) Blank' ;
  VALUE escapef   -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
  VALUE othermaf  -9='(-9) Blank' ;
  VALUE otherm0f  -9='(-9) Blank' 0='(0) Actual' 1='(1) Estimated' 8='(8) Not applicable'
                  9='(9) Don''t know' ;
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA;
INFILE "data-filename" LRECL=1150;
INPUT
       FACLID21 $1-21          JURDID $22-30
        STATE 31-32             COUNTY $33-77           FACLNAME $78-122
        CITY $123-154           ZIPP $155-159           STRATUM 160-161
        FINALWEIGHT 162-169 .4  WEIGHT 170-176 .4       CONFPOP 177-182
        CONFPOPF 183            NCONPOP 184-189         NCONPOPF 190
        TOTPOP 191-196          TOTPOPF 197             NONCITZ 198-203
        NONCITZF 204-205        WEEK 206-207            WEEKN 208-213
        WEEKF 214               ADULTM 215-220          ADULTMF 221
        ADULTF 222-227          ADULTFF 228             JUVM 229-234
        JUVMF 235               JUVF 236-241            JUVFF 242
        TOTGENDER 243-248       TOTGENDERF 249          ADLTJUV 250-255
        ADLTJUVF 256            CONV 257-262            CONVF 263
        CONVUNSENT 264-269      CONVUNSENTF 270         CONVSENT 271-276
        CONVSENTF 277           UNCONV 278-283          UNCONVF 284
        UNCONVTRIAL 285-290     UNCONVTRIALF 291        UNCONVHOLD 292-297
        UNCONVHOLDF 298         UNCONVOTHER 299-304     UNCONVOTHERF 305
        S2QII3C 306-311         S2QII3CF 312            WHITE 313-318
        WHITEF 319              BLACK 320-325           BLACKF 326
        HISP 327-332            HISPF 333               AIAN 334-339
        AIANF 340               ASIAN 341-346           ASIANF 347
        NHOPI 348-353           NHOPIF 354              TWORACE 355-360
        TWORACEF 361            OTHERRACESPEC $362-461  OTHERRACE 462-467
        OTHERRACEF 468          RACEDK 469-474          RACEDKF 475
        RACETOTAL 476-481       RACETOTALF 482          MARSHALS 483-488
        MARSHALSF 489           BOP 490-495             BOPF 496
        ICE 497-502             ICEF 503                BIA 504-509
        BIAF 510                S2QII5A5SPEC $511-610   S2QII5A5 611-616
        S2QII5A5F 617           INSTATEPRIS 618-623     INSTATEPRISF 624
        OUTSTATEPRIS 625-630    OUTSTATEPRISF 631       INSTATEJAIL 632-637
        INSTATEJAILF 638        OUTSTATEJAIL 639-644    OUTSTATEJAILF 645
        S2QII5D 646-651         S2QII5DF 652            PEAKDATE 653-654
        PEAKPOP 655-660         PEAKPOPF 661            ADP 662-667
        ADPF 668                RATED 669-674           RATEDF 675
        OPERATION 676-681       OPERATIONF 682          DESIGN 683-688
        DESIGNF 689             ADMIS 690-695           ADMISF 696
        RELEASE 697-702         RELEASEF 703            CONVII10A 704-709
        CONVII10AF 710-711      UNCONVII10A 712-717     UNCONVII10AF 718-719
        CONVII10B 720-725       CONVII10BF 726-727      UNCONVII10B 728-733
        UNCONVII10BF 734-735    CONVII10C 736-741       CONVII10CF 742-743
        UNCONVII10C 744-749     UNCONVII10CF 750-751    CONVII10D 752-757
        CONVII10DF 758-759      UNCONVII10D 760-765     UNCONVII10DF 766-767
        CONVII10E 768-773       CONVII10EF 774-775      UNCONVII10E 776-781
        UNCONVII10EF 782-783    CONVII10F 784-789       CONVFII10F 790-791
        UNCONVII10F 792-797     UNCONVII10FF 798-799    S2II10GCONV 800-805
        S2II10GCONVF 806-807    S2II10GFUNCONV 808-813  S2II10GFUNCONVF 814-815
        EMONITOR 816-821        EMONITORF 822           HOMEDETN 823-828
        HOMEDETNF 829           COMMSRV 830-835         COMMSRVF 836
        DAYREPORT 837-842       DAYREPORTF 843          PRETRIAL 844-849
        PRETRIALF 850           ALTWORK 851-856         ALTWORKF 857
        TREATMENT 858-863       TREATMENTF 864          OTRNONCONFS $865-964
        OTRNONCONF 965-970      OTRNONCONFF 971         NONCONFD 972-977
        NONCONFDF 978           ADMLNCNF 979-984        ADMLNCNFF 985
        ADFMNCNF 986-991        ADFMNCNFF 992           JVMLNCNF 993-998
        JVMLNCNFF 999           JVFMNCNF 1000-1005      JVFMNCNFF 1006
        NCNFGNDR 1007-1012      NCNFGNDRF 1013          CONVNCNF 1014-1019
        CONVNCNFF 1020          UNCNVNCF 1021-1026      UNCNVNCFF 1027
        TOTCNVST 1028-1033      TOTCNVSTF 1034          CORRSTAFF 1035-1040
        CORRSTAFFF 1041-1042    OTHERSTAFF 1043-1048    OTHERSTAFFF 1049-1050
        S4QIV1C 1051-1056       S4QIV1CF 1057-1058      ASSAULTSTAFFYN 1059-1060
        ASSAULTCORR 1061-1066   ASSAULTCORRF 1067-1068  ASSAULTOTRSTAFF 1069-1074
        ASSAULTOTRSTAFFF 1075-1076 DEATHSTAFFYN 1077-1078  DEATHCORR 1079-1080
        DEATHCORRF 1081-1082    DEATHOTRSTAFF 1083-1084 DEATHOTRSTAFFF 1085-1086
        PHYSASSAULT 1087-1092   PHYSASSAULTF 1093-1094  DRUGVIO 1095-1100
        DRUGVIOF 1101-1102      ALCOVIO 1103-1108       ALCOVIOF 1109-1110
        WEAPON 1111-1116        WEAPONF 1117-1118       STOLENPROP 1119-1124
        STOLENPROPF 1125-1126   ESCAPE 1127-1132        ESCAPEF 1133-1134
        OTHERMAJVIO 1135-1140   OTHERMAJVIOF 1141-1142  NCONPOP2 1143-1150
        ;


* SAS LABEL STATEMENT;

LABEL
   FACLID21= 'AGENCY ID'
   JURDID  = 'JURISDICTION ID'
   STATE   = 'STATE'
   COUNTY  = 'COUNTY NAME'
   FACLNAME= 'FACILITY NAME'
   CITY    = 'CITY'
   ZIPP    = 'ZIP CODE'
   STRATUM = 'STRATUM'
   FINALWEIGHT= 'FINAL WEIGHT POST NON REPONSE WEIGHT ADJUSTMENT'
   WEIGHT  = 'WEIGHT PRIOR TO NON REPONSE WEIGHT ADJUSTMENT'
   CONFPOP = 'CONFINED PERSONS'
   CONFPOPF= 'CONFINED PERSONS FLAG'
   NCONPOP = 'NONCONFINED PERSONS'
   NCONPOPF= 'NONCONFINED PERSONS FLAG'
   TOTPOP  = 'TOTAL POPULATION'
   TOTPOPF = 'TOTAL POPULATION FLAG'
   NONCITZ = 'NON-U.S. CITIZENS'
   NONCITZF= 'NON-U.S. CITIZENS FLAG'
   WEEK    = 'WEEKEND PROGRAM'
   WEEKN   = 'NUMBER OF WEEKENDERS'
   WEEKF   = 'WEEKENDERS FLAG'
   ADULTM  = 'ADULT MALES'
   ADULTMF = 'ADULT MALES FLAG'
   ADULTF  = 'ADULT FEMALES'
   ADULTFF = 'ADULT FEMALES FLAG'
   JUVM    = 'MALES UNDER AGE 18'
   JUVMF   = 'MALES UNDER AGE 18'
   JUVF    = 'FEMALES UNDER AGE 18'
   JUVFF   = 'FEMALES UNDER AGE 18 FLAG'
   TOTGENDER= 'TOTAL INMATES BY SEX'
   TOTGENDERF= 'TOTAL INMATES BY SEX FLAG'
   ADLTJUV = 'ADULT JUVENILES'
   ADLTJUVF= 'ADULT JUVENILES FLAG'
   CONV    = 'CONVICTION STATUS: TOTAL CONVICTED'
   CONVF   = 'CONVICTION STATUS: TOTAL CONVICTED FLAG'
   CONVUNSENT= 'CONVICTION STATUS: CONVICTED: UNSENTENCED INMATES OR AWAITING SENTENCING'
   CONVUNSENTF= 'CONVICTION STATUS: CONVICTED: UNSENTENCED INMATES OR AWAITING SENTENCING FLAG'
   CONVSENT= 'CONVICTION STATUS: CONVICTED:  SENTENCED INMATES'
   CONVSENTF= 'CONVICTION STATUS: CONVICTED: SENTENCED INMATES FLAG'
   UNCONV  = 'CONVICTION STATUS: TOTAL UNCONVICTED'
   UNCONVF = 'CONVICTION STATUS: TOTAL UNCONVICTED FLAG'
   UNCONVTRIAL= 'CONVICTION STATUS: UNCONVICTED:  AWAITING TRIAL/ARRAIGNMENT'
   UNCONVTRIALF= 'CONVICTION STATUS: UNCONVICTED:  AWAITING TRIAL/ARRAIGNMENT FLAG'
   UNCONVHOLD= 'CONVICTION STATUS: UNCONVICTED:  AWAITING TRANSFER/HOLD FOR OTHER AUTHORITIES'
   UNCONVHOLDF= 'CONVICTION STATUS: UNCONVICTED:  AWAITING TRANSFER/HOLD FOR OTHER AUTHORITIES FLAG'
   UNCONVOTHER= 'CONVICTION STATUS: UNCONVICTED:  OTHER'
   UNCONVOTHERF= 'CONVICTION STATUS: UNCONVICTED:  OTHER FLAG'
   S2QII3C = 'TOTAL CONVICTION STATUS'
   S2QII3CF= 'TOTAL CONVICTION STATUS FLAG'
   WHITE   = 'WHITE'
   WHITEF  = 'WHITE FLAG'
   BLACK   = 'BLACK OR AFRICAN AMERICAN'
   BLACKF  = 'BLACK OR AFRICAN AMERICAN FLAG'
   HISP    = 'HISPANIC OR LATINO'
   HISPF   = 'HISPANIC OR LATINO FLAG'
   AIAN    = 'AMERICAN INDIAN/ALASKA NATIVE'
   AIANF   = 'AMERICAN INDIAN/ALASKA NATIVE FLAG'
   ASIAN   = 'ASIAN'
   ASIANF  = 'ASIAN FLAG'
   NHOPI   = 'NATIVE HAWAIIAN/OTHER PACIFIC ISLANDER'
   NHOPIF  = 'NATIVE HAWAIIAN/OTHER PACIFIC ISLANDER FLAG'
   TWORACE = 'TWO OR MORE RACES'
   TWORACEF= 'TWO OR MORE RACES FLAG'
   OTHERRACESPEC= 'ADDITIONAL RACE CATEGORIES IN YOUR INFORMATION SYSTEM SPECIFY - ALPHA'
   OTHERRACE= 'ADDITIONAL RACE CATEGORIES IN YOUR INFORMATION SYSTEM SPECIFY'
   OTHERRACEF= 'ADDITIONAL RACE CATEGORIES IN YOUR INFORMATION SYSTEM SPECIFY FLAG'
   RACEDK  = 'RACE NOT KNOWN'
   RACEDKF = 'RACE NOT KNOWN FLAG'
   RACETOTAL= 'TOTAL INMATE RACE'
   RACETOTALF= 'TOTAL INMATE RACE FLAG'
   MARSHALS= 'U.S. MARSHAL''S SERVICE'
   MARSHALSF= 'U.S. MARSHAL''S SERVICE FLAG'
   BOP     = 'FEDERAL BUREAU OF PRISONS'
   BOPF    = 'FEDERAL BUREAU OF PRISONS FLAG'
   ICE     = 'U.S. IMMIGRATION AND CUSTOMS EMFORCEMENT'
   ICEF    = 'U.S. IMMIGRATION AND CUSTOMS ENFORCEMENT FLAG'
   BIA     = 'BUREAU OF INDIAN AFFAIRS'
   BIAF    = 'BUREAU OF INDIAN AFFAIRS FLAG'
   S2QII5A5SPEC= 'OTHER FEDERAL AUTHORITIES - SPECIFY'
   S2QII5A5= 'OTHER FEDERAL AUTHORITIES'
   S2QII5A5F= 'OTHER FEDERAL AUTHORITIES FLAG'
   INSTATEPRIS= 'STATE: FOR YOUR STATE'
   INSTATEPRISF= 'STATE: FOR YOUR STATE FLAG'
   OUTSTATEPRIS= 'STATE: FOR OTHER STATES'
   OUTSTATEPRISF= 'STATE: FOR OTHER STATES FLAG'
   INSTATEJAIL= 'LOCAL: WITHIN YOUR STATE'
   INSTATEJAILF= 'LOCAL: WITHIN YOUR STATE FLAG'
   OUTSTATEJAIL= 'LOCAL: OUTSIDE YOUR STATE'
   OUTSTATEJAILF= 'LOCAL: OUTSIDE YOUR STATE FLAG'
   S2QII5D = 'TOTAL OTHER AUTHORITIES'
   S2QII5DF= 'TOTAL OTHER AUTHORITIES FLAG'
   PEAKDATE= 'WHAT DAY - GREATEST NUMBER OF INMATES'
   PEAKPOP = '30-DAY (MOST HELD)'
   PEAKPOPF= '30-DAY FLAG'
   ADP     = 'AVERAGE DAILY POPULATION'
   ADPF    = 'AVERAGE DAILY POPULATION FLAG'
   RATED   = 'RATED CAPACITY'
   RATEDF  = 'RATED CAPACITY FLAG'
   OPERATION= 'OPERATIONAL CAPACITY'
   OPERATIONF= 'OPERATIONAL CAPACITY FLAG'
   DESIGN  = 'DESIGN CAPACITY'
   DESIGNF = 'DESIGN CAPACITY FLAG'
   ADMIS   = 'NEW ADMISSIONS'
   ADMISF  = 'NEW ADMISSIONS FLAG'
   RELEASE = 'FINAL DISCHARGES'
   RELEASEF= 'FINAL DISCHARGES FLAG'
   CONVII10A= 'DISCHARGED:  TIME SERVED LESS THAN 1 DAY - CONVICTED'
   CONVII10AF= 'DISCHARGED:  TIME SERVED LESS THAN 1 DAY - CONVICTED FLAG'
   UNCONVII10A= 'DISCHARGED:  TIME SERVED LESS THAN 1 DAY - UNCONVICTED'
   UNCONVII10AF= 'DISCHARGED:  TIME SERVED LESS THAN 1 DAY - UNCONVICTED FLAG'
   CONVII10B= 'DISCHARGED: TIME SERVED 1 TO 2 DAYS - CONVICTED'
   CONVII10BF= 'DISCHARGED: TIME SERVED 1 TO 2 DAYS - CONVICTED FLAG'
   UNCONVII10B= 'DISCHARGED: TIME SERVED 1 TO 2 DAYS - UNCONVICTED'
   UNCONVII10BF= 'DISCHARGED: TIME SERVED 1 TO 2 DAYS - UNCONVICTED FLAG'
   CONVII10C= 'DISCHARGED:  TIME SERVED 3 TO 7 DAYS - CONVICTED'
   CONVII10CF= 'DISCHARGED:  TIME SERVED 3 TO 7 DAYS - CONVICTED FLAG'
   UNCONVII10C= 'DISCHARGED:  TIME SERVED 3 TO 7 DAYS - UNCONVICTED'
   UNCONVII10CF= 'DISCHARGED:  TIME SERVED 3 TO 7 DAYS - UNCONVICTED FLAG'
   CONVII10D= 'DISCHARGED:  TIME SERVED 8 TO 30 DAYS - CONVICTED'
   CONVII10DF= 'DISCHARGED:  TIME SERVED 8 TO 30 DAYS - CONVICTED FLAG'
   UNCONVII10D= 'DISCHARGED:  TIME SERVED 8 TO 30 DAYS - UNCONVICTED'
   UNCONVII10DF= 'DISCHARGED:  TIME SERVED 8 TO 30 DAYS - UNCONVICTED FLAG'
   CONVII10E= 'DISCHARGED:  TIME SERVED 31 TO 180 DAYS - CONVICTED'
   CONVII10EF= 'DISCHARGED:  TIME SERVED 31 TO 180 DAYS - CONVICTED FLAG'
   UNCONVII10E= 'DISCHARGED:  TIME SERVED 31 TO 180 DAYS - UNCONVICTED'
   UNCONVII10EF= 'DISCHARGED:  TIME SERVED 31 TO 180 DAYS - UNCONVICTED FLAG'
   CONVII10F= 'DISCHARGED:  TIME SERVED MORE THAN 180 DAYS - CONVICTED'
   CONVFII10F= 'DISCHARGED:  TIME SERVED MORE THAN 180 DAYS - CONVICTED FLAG'
   UNCONVII10F= 'DISCHARGED:  TIME SERVED MORE THAN 180 DAYS - UNCONVICTED'
   UNCONVII10FF= 'DISCHARGED:  TIME SERVED MORE THAN 180 DAYS - UNCONVICTED FLAG'
   S2II10GCONV= 'DISCHARGED:  TIME SERVED TOTAL - CONVICTED'
   S2II10GCONVF= 'DISCHARGED:  TIME SERVED TOTAL - CONVICTED FLAG'
   S2II10GFUNCONV= 'DISCHARGED:  TIME SERVED TOTAL - UNCONVICTED'
   S2II10GFUNCONVF= 'DISCHARGED:  TIME SERVED TOTAL - UNCONVICTED FLAG'
   EMONITOR= 'NUMBER OF PEOPLE PARTICIPATED IN ELECTRONIC MONITORING PROGRAM'
   EMONITORF= 'ELECTRONIC MONITORING FLAG'
   HOMEDETN= 'NUMBER OF PEOPLE PARTICIPATED IN HOME DETENTION'
   HOMEDETNF= 'HOME DETENTION FLAG'
   COMMSRV = 'NUMBER OF PEOPLE PARTICIPATED IN COMMUNITY SERVICE'
   COMMSRVF= 'COMMUNITY SERVICE FLAG'
   DAYREPORT= 'NUMBER OF PEOPLE PARTICIPATED IN DAY REPORTING'
   DAYREPORTF= 'DAY REPORTING FLAG'
   PRETRIAL= 'NUMBER OF PEOPLE PARTICIPATED IN OTHER PRETRIAL SUPERVISION'
   PRETRIALF= 'OTHER PRETRIAL SUPERVISION FLAG'
   ALTWORK = 'NUMBER OF PEOPLE PARTICIPATED IN OTHER ALTERNATIVE WORK PROGRAMS'
   ALTWORKF= 'OTHER ALTERNATIVE WORK PROGRAMS FLAG'
   TREATMENT= 'NUMBER OF PEOPLE PARTICIPATED IN ALCOHOL/DRUG TREATMENT PROGRAMS'
   TREATMENTF= 'ALCOHOL/DRUG TREATMENT PROGRAMS FLAG'
   OTRNONCONFS= 'NUMBER OF PEOPLE PARTICIPATED IN OTHER NONCONFINED PROGRAMS - SPECIFY'
   OTRNONCONF= 'NUMBER OF PEOPLE PARTICIPATED IN OTHER NONCONFINED PROGRAMS'
   OTRNONCONFF= 'OTHER NONCONFINED PROGRAMS FLAG'
   NONCONFD= 'TOTAL NONCONFINED PERSONS'
   NONCONFDF= 'TOTAL NONCONFINED PERSONS FLAG'
   ADMLNCNF= 'ADULT MALE NONCONFINED'
   ADMLNCNFF= 'ADULT MALE NONCONFINED FLAG'
   ADFMNCNF= 'ADULT FEMALE NONCONFINED'
   ADFMNCNFF= 'ADULT FEMALE NONCONFINED FLAG'
   JVMLNCNF= 'NONCONFINED MALES UNDER AGE 18'
   JVMLNCNFF= 'NONCONFINED MALES UNDER AGE 18 FLAG'
   JVFMNCNF= 'NONCONFINED FEMALES UNDER AGE 18'
   JVFMNCNFF= 'NONCONFINED FEMALES UNDER AGE 18 FLAG'
   NCNFGNDR= 'TOTAL NONCONFINED SEX'
   NCNFGNDRF= 'TOTAL NONCONFINED SEX FLAG'
   CONVNCNF= 'CONVICTED NONCONFINED'
   CONVNCNFF= 'CONVICTED NONCONFINED FLAG'
   UNCNVNCF= 'UNCONVICTED NONCONFINED'
   UNCNVNCFF= 'UNCONVICTED NONCONFINED FLAG'
   TOTCNVST= 'TOTAL NONCONFINED CONVICTION STATUS'
   TOTCNVSTF= 'TOTAL NONCONFINED CONVICTION STATUS FLAG'
   CORRSTAFF= 'S4QIV.1A: NUMBER OF STAFF : CORRECTIONAL OFFICERS'
   CORRSTAFFF= 'NUMBER OF STAFF : CORRECTIONAL OFFICERS FLAG'
   OTHERSTAFF= 'S4QIV.1B: NUMBER OF STAFF : ALL OTHER STAFF'
   OTHERSTAFFF= 'NUMBER OF STAFF : ALL OTHER STAFF FLAG'
   S4QIV1C = 'S4QIV.1C: NUMBER OF STAFF : TOTAL STAFF'
   S4QIV1CF= 'NUMBER OF STAFF : TOTAL STAFF FLAG'
   ASSAULTSTAFFYN= 'S4QIV.2: INMATE-INFLICTED PHYSICAL OR SEXUAL ASSAULTS ON FACILITY STAFF'
   ASSAULTCORR= 'S4QIV.2.1A: ASSAULTS ON CORRECTIONAL OFFICERS'
   ASSAULTCORRF= 'ASSAULTS ON CORRECTIONAL OFFICERS FLAG'
   ASSAULTOTRSTAFF= 'S4QIV.2.1B: ASSAULTS ON ALL OTHER STAFF'
   ASSAULTOTRSTAFFF= 'ASSAULTS ON ALL OTHER STAFF FLAG'
   DEATHSTAFFYN= 'S4QIV.3: STAFF DEATHS AS A RESULT OF ASSAULTS BY INMATES?'
   DEATHCORR= 'S4QIV.3.1A: CORRECTIONAL OFFICER DEATHS INFLICTED BY INMATES'
   DEATHCORRF= 'CORRECTIONAL OFFICER DEATHS INFLICTED BY INMATES FLAG'
   DEATHOTRSTAFF= 'S4QIV.3.1B: ALL OTHER STAFF DEATHS INFLICTED BY INMATES'
   DEATHOTRSTAFFF= 'ALL OTHER STAFF DEATHS INFLICTED BY INMATES FLAG'
   PHYSASSAULT= 'S4QIV.4.1A: PHYSICAL ASSAULT ON ANOTHER INMATE'
   PHYSASSAULTF= 'PHYSICAL ASSAULT ON ANOTHER INMATE FLAG'
   DRUGVIO = 'S4QIV.4.1B: DRUG VIOLATION, SUCH AS USE, POSSESSION, OR DEALING DRUGS'
   DRUGVIOF= 'DRUG VIOLATION, SUCH AS USE, POSSESSION, OR DEALING DRUGS FLAG'
   ALCOVIO = 'S4QIV.4.1C: ALCOHOL VIOLATION, INCLUDING UNAUTHORIZED POSSESSION, USE, OR SALE'
   ALCOVIOF= 'ALCOHOL VIOLATION, INCLUDING UNAUTHORIZED POSSESSION, USE, OR SALE FLAG'
   WEAPON  = 'S4QIV.4.1D: POSSESSION OF A WEAPON'
   WEAPONF = 'POSSESSION OF A WEAPON FLAG'
   STOLENPROP= 'S4QIV.4.1E: POSSESSION OF STOLEN PROPERTY'
   STOLENPROPF= 'POSSESSION OF STOLEN PROPERTY FLAG'
   ESCAPE  = 'S4QIV.4.1F: ESCAPE OR ATTEMPTED ESCAPE'
   ESCAPEF = 'ESCAPE OR ATTEMPTED ESCAPE FLAG'
   OTHERMAJVIO= 'S4QIV.4.1G: ANY OTHER MAJOR VIOLATION, INCLUDING WORK SLOWDOWNS, FOOD STRIKES, SETTING FIRE,
RIOTING, ETC.'
   OTHERMAJVIOF= 'ANY OTHER MAJOR VIOLATION, INCLUDING WORK SLOWDOWNS, FOOD STRIKES, SETTING FIRE, RIOTING, ETC. FLAG'
   NCONPOP2= 'NONCONFINED POPULATION CALCULATED'
        ;


* USER-DEFINED MISSING VALUES RECODE TO SAS SYSMIS;

/*
   IF (NONCITZF = -9) THEN NONCITZF = .;
   IF (WEEK = -9) THEN WEEK = .;
   IF (CONVII10A = -9) THEN CONVII10A = .;
   IF (CONVII10AF = -9) THEN CONVII10AF = .;
   IF (UNCONVII10A = -9) THEN UNCONVII10A = .;
   IF (UNCONVII10AF = -9) THEN UNCONVII10AF = .;
   IF (CONVII10B = -9) THEN CONVII10B = .;
   IF (CONVII10BF = -9) THEN CONVII10BF = .;
   IF (UNCONVII10B = -9) THEN UNCONVII10B = .;
   IF (UNCONVII10BF = -9) THEN UNCONVII10BF = .;
   IF (CONVII10C = -9) THEN CONVII10C = .;
   IF (CONVII10CF = -9) THEN CONVII10CF = .;
   IF (UNCONVII10C = -9) THEN UNCONVII10C = .;
   IF (UNCONVII10CF = -9) THEN UNCONVII10CF = .;
   IF (CONVII10D = -9) THEN CONVII10D = .;
   IF (CONVII10DF = -9) THEN CONVII10DF = .;
   IF (UNCONVII10D = -9) THEN UNCONVII10D = .;
   IF (UNCONVII10DF = -9) THEN UNCONVII10DF = .;
   IF (CONVII10E = -9) THEN CONVII10E = .;
   IF (CONVII10EF = -9) THEN CONVII10EF = .;
   IF (UNCONVII10E = -9) THEN UNCONVII10E = .;
   IF (UNCONVII10EF = -9) THEN UNCONVII10EF = .;
   IF (CONVII10F = -9) THEN CONVII10F = .;
   IF (CONVFII10F = -9) THEN CONVFII10F = .;
   IF (UNCONVII10F = -9) THEN UNCONVII10F = .;
   IF (UNCONVII10FF = -9) THEN UNCONVII10FF = .;
   IF (S2II10GCONV = -9) THEN S2II10GCONV = .;
   IF (S2II10GCONVF = -9) THEN S2II10GCONVF = .;
   IF (S2II10GFUNCONV = -9) THEN S2II10GFUNCONV = .;
   IF (S2II10GFUNCONVF = -9) THEN S2II10GFUNCONVF = .;
   IF (CORRSTAFF = -9) THEN CORRSTAFF = .;
   IF (CORRSTAFFF = -9) THEN CORRSTAFFF = .;
   IF (OTHERSTAFF = -9) THEN OTHERSTAFF = .;
   IF (OTHERSTAFFF = -9) THEN OTHERSTAFFF = .;
   IF (S4QIV1C = -9) THEN S4QIV1C = .;
   IF (S4QIV1CF = -9) THEN S4QIV1CF = .;
   IF (ASSAULTSTAFFYN = -9) THEN ASSAULTSTAFFYN = .;
   IF (ASSAULTCORR = -9) THEN ASSAULTCORR = .;
   IF (ASSAULTCORRF = -9) THEN ASSAULTCORRF = .;
   IF (ASSAULTOTRSTAFF = -9) THEN ASSAULTOTRSTAFF = .;
   IF (ASSAULTOTRSTAFFF = -9) THEN ASSAULTOTRSTAFFF = .;
   IF (DEATHSTAFFYN = -9) THEN DEATHSTAFFYN = .;
   IF (DEATHCORR = -9) THEN DEATHCORR = .;
   IF (DEATHCORRF = -9) THEN DEATHCORRF = .;
   IF (DEATHOTRSTAFF = -9) THEN DEATHOTRSTAFF = .;
   IF (DEATHOTRSTAFFF = -9) THEN DEATHOTRSTAFFF = .;
   IF (PHYSASSAULT = -9) THEN PHYSASSAULT = .;
   IF (PHYSASSAULTF = -9) THEN PHYSASSAULTF = .;
   IF (DRUGVIO = -9) THEN DRUGVIO = .;
   IF (DRUGVIOF = -9) THEN DRUGVIOF = .;
   IF (ALCOVIO = -9) THEN ALCOVIO = .;
   IF (ALCOVIOF = -9) THEN ALCOVIOF = .;
   IF (WEAPON = -9) THEN WEAPON = .;
   IF (WEAPONF = -9) THEN WEAPONF = .;
   IF (STOLENPROP = -9) THEN STOLENPROP = .;
   IF (STOLENPROPF = -9) THEN STOLENPROPF = .;
   IF (ESCAPE = -9) THEN ESCAPE = .;
   IF (ESCAPEF = -9) THEN ESCAPEF = .;
   IF (OTHERMAJVIO = -9) THEN OTHERMAJVIO = .;
   IF (OTHERMAJVIOF = -9) THEN OTHERMAJVIOF = .;
*/


* SAS FORMAT STATEMENT;

/*
  FORMAT STATE state. CONFPOPF confpopf. NCONPOPF nconpopf.
         TOTPOPF totpopf. NONCITZF noncitzf. WEEK week.
         WEEKF weekf. ADULTMF adultmf. ADULTFF adultff.
         JUVMF juvmf. JUVFF juvff. TOTGENDERF totgendf.
         ADLTJUVF adltjuvf. CONVF convf. CONVUNSENTF convunsf.
         CONVSENTF convsenf. UNCONVF unconvf. UNCONVTRIALF unconvtf.
         UNCONVHOLDF unconvhf. UNCONVOTHERF unconvof. S2QII3CF s2qii3cf.
         WHITEF whitef. BLACKF blackf. HISPF hispf.
         AIANF aianf. ASIANF asianf. NHOPIF nhopif.
         TWORACEF tworacef. OTHERRACEF otherraf. RACEDKF racedkf.
         RACETOTALF racetotf. MARSHALSF marshalf. BOPF bopf.
         ICEF icef. BIAF biaf. S2QII5A5F s2qii5af.
         INSTATEPRISF instatef. OUTSTATEPRISF outstatf. INSTATEJAILF instat0f.
         OUTSTATEJAILF outsta0f. S2QII5DF s2qii5df. PEAKPOPF peakpopf.
         ADPF adpf. RATEDF ratedf. OPERATIONF operatif.
         DESIGNF designf. ADMISF admisf. RELEASEF releasef.
         CONVII10A convii1f. CONVII10AF convii0f. UNCONVII10A unconvif.
         UNCONVII10AF unconv0f. CONVII10B convii2f. CONVII10BF convii3f.
         UNCONVII10B unconv1f. UNCONVII10BF unconv2f. CONVII10C convii4f.
         CONVII10CF convii5f. UNCONVII10C unconv3f. UNCONVII10CF unconv4f.
         CONVII10D convii6f. CONVII10DF convii7f. UNCONVII10D unconv5f.
         UNCONVII10DF unconv6f. CONVII10E convii8f. CONVII10EF convii9f.
         UNCONVII10E unconv7f. UNCONVII10EF unconv8f. CONVII10F convi10f.
         CONVFII10F convfiif. UNCONVII10F unconv9f. UNCONVII10FF uncon10f.
         S2II10GCONV s2ii10gf. S2II10GCONVF s2ii100f. S2II10GFUNCONV s2ii101f.
         S2II10GFUNCONVF s2ii102f. EMONITORF emonitof. HOMEDETNF homedetf.
         COMMSRVF commsrvf. DAYREPORTF dayrepof. PRETRIALF pretriaf.
         ALTWORKF altworkf. TREATMENTF treatmef. OTRNONCONFF otrnoncf.
         NONCONFDF nonconff. ADMLNCNFF admlncnf. ADFMNCNFF adfmncnf.
         JVMLNCNFF jvmlncnf. JVFMNCNFF jvfmncnf. NCNFGNDRF ncnfgndf.
         CONVNCNFF convncnf. UNCNVNCFF uncnvncf. TOTCNVSTF totcnvsf.
         CORRSTAFF corrstaf. CORRSTAFFF corrst0f. OTHERSTAFF otherstf.
         OTHERSTAFFF others0f. S4QIV1C s4qiv1c. S4QIV1CF s4qiv1cf.
         ASSAULTSTAFFYN assaultf. ASSAULTCORR assaul0f. ASSAULTCORRF assaul1f.
         ASSAULTOTRSTAFF assaul2f. ASSAULTOTRSTAFFF assaul3f. DEATHSTAFFYN deathstf.
         DEATHCORR deathcof. DEATHCORRF deathc0f. DEATHOTRSTAFF deathotf.
         DEATHOTRSTAFFF deatho0f. PHYSASSAULT physassf. PHYSASSAULTF physas0f.
         DRUGVIO drugvio. DRUGVIOF drugviof. ALCOVIO alcovio.
         ALCOVIOF alcoviof. WEAPON weapon. WEAPONF weaponf.
         STOLENPROP stolenpf. STOLENPROPF stolen0f. ESCAPE escape.
         ESCAPEF escapef. OTHERMAJVIO othermaf. OTHERMAJVIOF otherm0f.
          ;
*/

RUN ;
