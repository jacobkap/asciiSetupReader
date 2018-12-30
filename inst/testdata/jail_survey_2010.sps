*-------------------------------------------------------------------------*
*                                                                          
*                     SPSS SETUP FILE FOR ICPSR 31261
*              ANNUAL SURVEY OF JAILS: JAIL-LEVEL DATA, 2010
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
*  data file is physically located (e.g., "c:\temp\31261-0001-data.txt").
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
*  will be saved (e.g., SAVE OUTFILE="c:\spsswin\data\da31261-0001.sav").
*
*-------------------------------------------------------------------------.

* SPSS FILE HANDLE AND DATA LIST COMMANDS.

FILE HANDLE DATA / NAME="data-filename" LRECL=1150.
DATA LIST FILE=DATA /
       FACLID21 1-21 (A)        JURDID 22-30 (A)
             STATE 31-32        COUNTY 33-77 (A)     FACLNAME 78-122 (A)
        CITY 123-154 (A)        ZIPP 155-159 (A)         STRATUM 160-161
 FINALWEIGHT 162-169 (4)      WEIGHT 170-176 (4)         CONFPOP 177-182
            CONFPOPF 183         NCONPOP 184-189            NCONPOPF 190
          TOTPOP 191-196             TOTPOPF 197         NONCITZ 198-203
        NONCITZF 204-205            WEEK 206-207           WEEKN 208-213
               WEEKF 214          ADULTM 215-220             ADULTMF 221
          ADULTF 222-227             ADULTFF 228            JUVM 229-234
               JUVMF 235            JUVF 236-241               JUVFF 242
       TOTGENDER 243-248          TOTGENDERF 249         ADLTJUV 250-255
            ADLTJUVF 256            CONV 257-262               CONVF 263
      CONVUNSENT 264-269         CONVUNSENTF 270        CONVSENT 271-276
           CONVSENTF 277          UNCONV 278-283             UNCONVF 284
     UNCONVTRIAL 285-290        UNCONVTRIALF 291      UNCONVHOLD 292-297
         UNCONVHOLDF 298     UNCONVOTHER 299-304        UNCONVOTHERF 305
         S2QII3C 306-311            S2QII3CF 312           WHITE 313-318
              WHITEF 319           BLACK 320-325              BLACKF 326
            HISP 327-332               HISPF 333            AIAN 334-339
               AIANF 340           ASIAN 341-346              ASIANF 347
           NHOPI 348-353              NHOPIF 354         TWORACE 355-360
            TWORACEF 361 OTHERRACESPEC 362-461 (A)       OTHERRACE 462-467
          OTHERRACEF 468          RACEDK 469-474             RACEDKF 475
       RACETOTAL 476-481          RACETOTALF 482        MARSHALS 483-488
           MARSHALSF 489             BOP 490-495                BOPF 496
             ICE 497-502                ICEF 503             BIA 504-509
                BIAF 510 S2QII5A5SPEC 511-610 (A)        S2QII5A5 611-616
           S2QII5A5F 617     INSTATEPRIS 618-623        INSTATEPRISF 624
    OUTSTATEPRIS 625-630       OUTSTATEPRISF 631     INSTATEJAIL 632-637
        INSTATEJAILF 638    OUTSTATEJAIL 639-644       OUTSTATEJAILF 645
         S2QII5D 646-651            S2QII5DF 652        PEAKDATE 653-654
         PEAKPOP 655-660            PEAKPOPF 661             ADP 662-667
                ADPF 668           RATED 669-674              RATEDF 675
       OPERATION 676-681          OPERATIONF 682          DESIGN 683-688
             DESIGNF 689           ADMIS 690-695              ADMISF 696
         RELEASE 697-702            RELEASEF 703       CONVII10A 704-709
      CONVII10AF 710-711     UNCONVII10A 712-717    UNCONVII10AF 718-719
       CONVII10B 720-725      CONVII10BF 726-727     UNCONVII10B 728-733
    UNCONVII10BF 734-735       CONVII10C 736-741      CONVII10CF 742-743
     UNCONVII10C 744-749    UNCONVII10CF 750-751       CONVII10D 752-757
      CONVII10DF 758-759     UNCONVII10D 760-765    UNCONVII10DF 766-767
       CONVII10E 768-773      CONVII10EF 774-775     UNCONVII10E 776-781
    UNCONVII10EF 782-783       CONVII10F 784-789      CONVFII10F 790-791
     UNCONVII10F 792-797    UNCONVII10FF 798-799     S2II10GCONV 800-805
    S2II10GCONVF 806-807  S2II10GFUNCONV 808-813 S2II10GFUNCONVF 814-815
        EMONITOR 816-821           EMONITORF 822        HOMEDETN 823-828
           HOMEDETNF 829         COMMSRV 830-835            COMMSRVF 836
       DAYREPORT 837-842          DAYREPORTF 843        PRETRIAL 844-849
           PRETRIALF 850         ALTWORK 851-856            ALTWORKF 857
       TREATMENT 858-863          TREATMENTF 864 OTRNONCONFS 865-964 (A)
      OTRNONCONF 965-970         OTRNONCONFF 971        NONCONFD 972-977
           NONCONFDF 978        ADMLNCNF 979-984           ADMLNCNFF 985
        ADFMNCNF 986-991           ADFMNCNFF 992        JVMLNCNF 993-998
           JVMLNCNFF 999      JVFMNCNF 1000-1005          JVFMNCNFF 1006
      NCNFGNDR 1007-1012          NCNFGNDRF 1013      CONVNCNF 1014-1019
          CONVNCNFF 1020      UNCNVNCF 1021-1026          UNCNVNCFF 1027
      TOTCNVST 1028-1033          TOTCNVSTF 1034     CORRSTAFF 1035-1040
    CORRSTAFFF 1041-1042    OTHERSTAFF 1043-1048   OTHERSTAFFF 1049-1050
       S4QIV1C 1051-1056      S4QIV1CF 1057-1058 ASSAULTSTAFFYN 1059-1060
   ASSAULTCORR 1061-1066  ASSAULTCORRF 1067-1068 ASSAULTOTRSTAFF 1069-1074
 ASSAULTOTRSTAFFF 1075-1076  DEATHSTAFFYN 1077-1078     DEATHCORR 1079-1080
    DEATHCORRF 1081-1082 DEATHOTRSTAFF 1083-1084 DEATHOTRSTAFFF 1085-1086
   PHYSASSAULT 1087-1092  PHYSASSAULTF 1093-1094       DRUGVIO 1095-1100
      DRUGVIOF 1101-1102       ALCOVIO 1103-1108      ALCOVIOF 1109-1110
        WEAPON 1111-1116       WEAPONF 1117-1118    STOLENPROP 1119-1124
   STOLENPROPF 1125-1126        ESCAPE 1127-1132       ESCAPEF 1133-1134
   OTHERMAJVIO 1135-1140  OTHERMAJVIOF 1141-1142      NCONPOP2 1143-1150

   .

* SPSS VARIABLE LABELS COMMAND.

VARIABLE LABELS
   FACLID21  'AGENCY ID' /
   JURDID    'JURISDICTION ID' /
   STATE     'STATE' /
   COUNTY    'COUNTY NAME' /
   FACLNAME  'FACILITY NAME' /
   CITY      'CITY' /
   ZIPP      'ZIP CODE' /
   STRATUM   'STRATUM' /
   FINALWEIGHT 'FINAL WEIGHT POST NON REPONSE WEIGHT ADJUSTMENT' /
   WEIGHT    'WEIGHT PRIOR TO NON REPONSE WEIGHT ADJUSTMENT' /
   CONFPOP   'CONFINED PERSONS' /
   CONFPOPF  'CONFINED PERSONS FLAG' /
   NCONPOP   'NONCONFINED PERSONS' /
   NCONPOPF  'NONCONFINED PERSONS FLAG' /
   TOTPOP    'TOTAL POPULATION' /
   TOTPOPF   'TOTAL POPULATION FLAG' /
   NONCITZ   'NON-U.S. CITIZENS' /
   NONCITZF  'NON-U.S. CITIZENS FLAG' /
   WEEK      'WEEKEND PROGRAM' /
   WEEKN     'NUMBER OF WEEKENDERS' /
   WEEKF     'WEEKENDERS FLAG' /
   ADULTM    'ADULT MALES' /
   ADULTMF   'ADULT MALES FLAG' /
   ADULTF    'ADULT FEMALES' /
   ADULTFF   'ADULT FEMALES FLAG' /
   JUVM      'MALES UNDER AGE 18' /
   JUVMF     'MALES UNDER AGE 18 FLAG' /
   JUVF      'FEMALES UNDER AGE 18' /
   JUVFF     'FEMALES UNDER AGE 18 FLAG' /
   TOTGENDER 'TOTAL INMATES BY SEX' /
   TOTGENDERF 'TOTAL INMATES BY SEX FLAG' /
   ADLTJUV   'ADULT JUVENILES' /
   ADLTJUVF  'ADULT JUVENILES FLAG' /
   CONV      'CONVICTION STATUS: TOTAL CONVICTED' /
   CONVF     'CONVICTION STATUS: TOTAL CONVICTED FLAG' /
   CONVUNSENT 'CONVICTION STATUS: CONVICTED: UNSENTENCED INMATES OR'+
     ' AWAITING SENTENCING'/
   CONVUNSENTF 'CONVICTION STATUS: CONVICTED: UNSENTENCED INMATES OR'+
     ' AWAITING SENTENCING FLAG'/
   CONVSENT  'CONVICTION STATUS: CONVICTED:  SENTENCED INMATES' /
   CONVSENTF 'CONVICTION STATUS: CONVICTED: SENTENCED INMATES FLAG' /
   UNCONV    'CONVICTION STATUS: TOTAL UNCONVICTED' /
   UNCONVF   'CONVICTION STATUS: TOTAL UNCONVICTED FLAG' /
   UNCONVTRIAL 'CONVICTION STATUS: UNCONVICTED:  AWAITING TRIAL/ARRAIGNMENT' /
   UNCONVTRIALF 'CONVICTION STATUS: UNCONVICTED:  AWAITING TRIAL/ARRAIGNMENT'+
     ' FLAG'/
   UNCONVHOLD 'CONVICTION STATUS: UNCONVICTED:  AWAITING TRANSFER/HOLD'+
     ' FOR OTHER AUTHORITIES'/
   UNCONVHOLDF 'CONVICTION STATUS: UNCONVICTED:  AWAITING TRANSFER/HOLD'+
     ' FOR OTHER AUTHORITIES FLAG'/
   UNCONVOTHER 'CONVICTION STATUS: UNCONVICTED:  OTHER' /
   UNCONVOTHERF 'CONVICTION STATUS: UNCONVICTED:  OTHER FLAG' /
   S2QII3C   'TOTAL CONVICTION STATUS' /
   S2QII3CF  'TOTAL CONVICTION STATUS FLAG' /
   WHITE     'WHITE' /
   WHITEF    'WHITE FLAG' /
   BLACK     'BLACK OR AFRICAN AMERICAN' /
   BLACKF    'BLACK OR AFRICAN AMERICAN FLAG' /
   HISP      'HISPANIC OR LATINO' /
   HISPF     'HISPANIC OR LATINO FLAG' /
   AIAN      'AMERICAN INDIAN/ALASKA NATIVE' /
   AIANF     'AMERICAN INDIAN/ALASKA NATIVE FLAG' /
   ASIAN     'ASIAN' /
   ASIANF    'ASIAN FLAG' /
   NHOPI     'NATIVE HAWAIIAN/OTHER PACIFIC ISLANDER' /
   NHOPIF    'NATIVE HAWAIIAN/OTHER PACIFIC ISLANDER FLAG' /
   TWORACE   'TWO OR MORE RACES' /
   TWORACEF  'TWO OR MORE RACES FLAG' /
   OTHERRACESPEC 'ADDITIONAL RACE CATEGORIES IN YOUR INFORMATION SYSTEM'+
     ' SPECIFY - ALPHA'/
   OTHERRACE 'ADDITIONAL RACE CATEGORIES IN YOUR INFORMATION SYSTEM SPECIFY' /
   OTHERRACEF 'ADDITIONAL RACE CATEGORIES IN YOUR INFORMATION SYSTEM'+
     ' SPECIFY FLAG'/
   RACEDK    'RACE NOT KNOWN' /
   RACEDKF   'RACE NOT KNOWN FLAG' /
   RACETOTAL 'TOTAL INMATE RACE' /
   RACETOTALF 'TOTAL INMATE RACE FLAG' /
   MARSHALS  'U.S. MARSHAL''S SERVICE' /
   MARSHALSF 'U.S. MARSHAL''S SERVICE FLAG' /
   BOP       'FEDERAL BUREAU OF PRISONS' /
   BOPF      'FEDERAL BUREAU OF PRISONS FLAG' /
   ICE       'U.S. IMMIGRATION AND CUSTOMS EMFORCEMENT' /
   ICEF      'U.S. IMMIGRATION AND CUSTOMS ENFORCEMENT FLAG' /
   BIA       'BUREAU OF INDIAN AFFAIRS' /
   BIAF      'BUREAU OF INDIAN AFFAIRS FLAG' /
   S2QII5A5SPEC 'OTHER FEDERAL AUTHORITIES - SPECIFY' /
   S2QII5A5  'OTHER FEDERAL AUTHORITIES' /
   S2QII5A5F 'OTHER FEDERAL AUTHORITIES FLAG' /
   INSTATEPRIS 'STATE: FOR YOUR STATE' /
   INSTATEPRISF 'STATE: FOR YOUR STATE FLAG' /
   OUTSTATEPRIS 'STATE: FOR OTHER STATES' /
   OUTSTATEPRISF 'STATE: FOR OTHER STATES FLAG' /
   INSTATEJAIL 'LOCAL: WITHIN YOUR STATE' /
   INSTATEJAILF 'LOCAL: WITHIN YOUR STATE FLAG' /
   OUTSTATEJAIL 'LOCAL: OUTSIDE YOUR STATE' /
   OUTSTATEJAILF 'LOCAL: OUTSIDE YOUR STATE FLAG' /
   S2QII5D   'TOTAL OTHER AUTHORITIES' /
   S2QII5DF  'TOTAL OTHER AUTHORITIES FLAG' /
   PEAKDATE  'WHAT DAY - GREATEST NUMBER OF INMATES' /
   PEAKPOP   '30-DAY (MOST HELD)' /
   PEAKPOPF  '30-DAY FLAG' /
   ADP       'AVERAGE DAILY POPULATION' /
   ADPF      'AVERAGE DAILY POPULATION FLAG' /
   RATED     'RATED CAPACITY' /
   RATEDF    'RATED CAPACITY FLAG' /
   OPERATION 'OPERATIONAL CAPACITY' /
   OPERATIONF 'OPERATIONAL CAPACITY FLAG' /
   DESIGN    'DESIGN CAPACITY' /
   DESIGNF   'DESIGN CAPACITY FLAG' /
   ADMIS     'NEW ADMISSIONS' /
   ADMISF    'NEW ADMISSIONS FLAG' /
   RELEASE   'FINAL DISCHARGES' /
   RELEASEF  'FINAL DISCHARGES FLAG' /
   CONVII10A 'DISCHARGED:  TIME SERVED LESS THAN 1 DAY - CONVICTED' /
   CONVII10AF 'DISCHARGED:  TIME SERVED LESS THAN 1 DAY - CONVICTED FLAG' /
   UNCONVII10A 'DISCHARGED:  TIME SERVED LESS THAN 1 DAY - UNCONVICTED' /
   UNCONVII10AF 'DISCHARGED:  TIME SERVED LESS THAN 1 DAY - UNCONVICTED FLAG' /
   CONVII10B 'DISCHARGED: TIME SERVED 1 TO 2 DAYS - CONVICTED' /
   CONVII10BF 'DISCHARGED: TIME SERVED 1 TO 2 DAYS - CONVICTED FLAG' /
   UNCONVII10B 'DISCHARGED: TIME SERVED 1 TO 2 DAYS - UNCONVICTED' /
   UNCONVII10BF 'DISCHARGED: TIME SERVED 1 TO 2 DAYS - UNCONVICTED FLAG' /
   CONVII10C 'DISCHARGED:  TIME SERVED 3 TO 7 DAYS - CONVICTED' /
   CONVII10CF 'DISCHARGED:  TIME SERVED 3 TO 7 DAYS - CONVICTED FLAG' /
   UNCONVII10C 'DISCHARGED:  TIME SERVED 3 TO 7 DAYS - UNCONVICTED' /
   UNCONVII10CF 'DISCHARGED:  TIME SERVED 3 TO 7 DAYS - UNCONVICTED FLAG' /
   CONVII10D 'DISCHARGED:  TIME SERVED 8 TO 30 DAYS - CONVICTED' /
   CONVII10DF 'DISCHARGED:  TIME SERVED 8 TO 30 DAYS - CONVICTED FLAG' /
   UNCONVII10D 'DISCHARGED:  TIME SERVED 8 TO 30 DAYS - UNCONVICTED' /
   UNCONVII10DF 'DISCHARGED:  TIME SERVED 8 TO 30 DAYS - UNCONVICTED FLAG' /
   CONVII10E 'DISCHARGED:  TIME SERVED 31 TO 180 DAYS - CONVICTED' /
   CONVII10EF 'DISCHARGED:  TIME SERVED 31 TO 180 DAYS - CONVICTED FLAG' /
   UNCONVII10E 'DISCHARGED:  TIME SERVED 31 TO 180 DAYS - UNCONVICTED' /
   UNCONVII10EF 'DISCHARGED:  TIME SERVED 31 TO 180 DAYS - UNCONVICTED FLAG' /
   CONVII10F 'DISCHARGED:  TIME SERVED MORE THAN 180 DAYS - CONVICTED' /
   CONVFII10F 'DISCHARGED:  TIME SERVED MORE THAN 180 DAYS - CONVICTED FLAG' /
   UNCONVII10F 'DISCHARGED:  TIME SERVED MORE THAN 180 DAYS - UNCONVICTED' /
   UNCONVII10FF 'DISCHARGED:  TIME SERVED MORE THAN 180 DAYS - UNCONVICTED'+
     ' FLAG'/
   S2II10GCONV 'DISCHARGED:  TIME SERVED TOTAL - CONVICTED' /
   S2II10GCONVF 'DISCHARGED:  TIME SERVED TOTAL - CONVICTED FLAG' /
   S2II10GFUNCONV 'DISCHARGED:  TIME SERVED TOTAL - UNCONVICTED' /
   S2II10GFUNCONVF 'DISCHARGED:  TIME SERVED TOTAL - UNCONVICTED FLAG' /
   EMONITOR  'NUMBER OF PEOPLE PARTICIPATED IN ELECTRONIC MONITORING PROGRAM' /
   EMONITORF 'ELECTRONIC MONITORING FLAG' /
   HOMEDETN  'NUMBER OF PEOPLE PARTICIPATED IN HOME DETENTION' /
   HOMEDETNF 'HOME DETENTION FLAG' /
   COMMSRV   'NUMBER OF PEOPLE PARTICIPATED IN COMMUNITY SERVICE' /
   COMMSRVF  'COMMUNITY SERVICE FLAG' /
   DAYREPORT 'NUMBER OF PEOPLE PARTICIPATED IN DAY REPORTING' /
   DAYREPORTF 'DAY REPORTING FLAG' /
   PRETRIAL  'NUMBER OF PEOPLE PARTICIPATED IN OTHER PRETRIAL SUPERVISION' /
   PRETRIALF 'OTHER PRETRIAL SUPERVISION FLAG' /
   ALTWORK   'NUMBER OF PEOPLE PARTICIPATED IN OTHER ALTERNATIVE WORK'+
     ' PROGRAMS'/
   ALTWORKF  'OTHER ALTERNATIVE WORK PROGRAMS FLAG' /
   TREATMENT 'NUMBER OF PEOPLE PARTICIPATED IN ALCOHOL/DRUG TREATMENT'+
     ' PROGRAMS'/
   TREATMENTF 'ALCOHOL/DRUG TREATMENT PROGRAMS FLAG' /
   OTRNONCONFS 'NUMBER OF PEOPLE PARTICIPATED IN OTHER NONCONFINED PROGRAMS'+
     ' - SPECIFY'/
   OTRNONCONF 'NUMBER OF PEOPLE PARTICIPATED IN OTHER NONCONFINED PROGRAMS' /
   OTRNONCONFF 'OTHER NONCONFINED PROGRAMS FLAG' /
   NONCONFD  'TOTAL NONCONFINED PERSONS' /
   NONCONFDF 'TOTAL NONCONFINED PERSONS FLAG' /
   ADMLNCNF  'ADULT MALE NONCONFINED' /
   ADMLNCNFF 'ADULT MALE NONCONFINED FLAG' /
   ADFMNCNF  'ADULT FEMALE NONCONFINED' /
   ADFMNCNFF 'ADULT FEMALE NONCONFINED FLAG' /
   JVMLNCNF  'NONCONFINED MALES UNDER AGE 18' /
   JVMLNCNFF 'NONCONFINED MALES UNDER AGE 18 FLAG' /
   JVFMNCNF  'NONCONFINED FEMALES UNDER AGE 18' /
   JVFMNCNFF 'NONCONFINED FEMALES UNDER AGE 18 FLAG' /
   NCNFGNDR  'TOTAL NONCONFINED SEX' /
   NCNFGNDRF 'TOTAL NONCONFINED SEX FLAG' /
   CONVNCNF  'CONVICTED NONCONFINED' /
   CONVNCNFF 'CONVICTED NONCONFINED FLAG' /
   UNCNVNCF  'UNCONVICTED NONCONFINED' /
   UNCNVNCFF 'UNCONVICTED NONCONFINED FLAG' /
   TOTCNVST  'TOTAL NONCONFINED CONVICTION STATUS' /
   TOTCNVSTF 'TOTAL NONCONFINED CONVICTION STATUS FLAG' /
   CORRSTAFF 'S4QIV.1A: NUMBER OF STAFF : CORRECTIONAL OFFICERS' /
   CORRSTAFFF 'NUMBER OF STAFF : CORRECTIONAL OFFICERS FLAG' /
   OTHERSTAFF 'S4QIV.1B: NUMBER OF STAFF : ALL OTHER STAFF' /
   OTHERSTAFFF 'NUMBER OF STAFF : ALL OTHER STAFF FLAG' /
   S4QIV1C   'S4QIV.1C: NUMBER OF STAFF : TOTAL STAFF' /
   S4QIV1CF  'NUMBER OF STAFF : TOTAL STAFF FLAG' /
   ASSAULTSTAFFYN 'S4QIV.2: INMATE-INFLICTED PHYSICAL OR SEXUAL ASSAULTS'+
     ' ON FACILITY STAFF'/
   ASSAULTCORR 'S4QIV.2.1A: ASSAULTS ON CORRECTIONAL OFFICERS' /
   ASSAULTCORRF 'ASSAULTS ON CORRECTIONAL OFFICERS FLAG' /
   ASSAULTOTRSTAFF 'S4QIV.2.1B: ASSAULTS ON ALL OTHER STAFF' /
   ASSAULTOTRSTAFFF 'ASSAULTS ON ALL OTHER STAFF FLAG' /
   DEATHSTAFFYN 'S4QIV.3: STAFF DEATHS AS A RESULT OF ASSAULTS BY INMATES?' /
   DEATHCORR 'S4QIV.3.1A: CORRECTIONAL OFFICER DEATHS INFLICTED BY INMATES' /
   DEATHCORRF 'CORRECTIONAL OFFICER DEATHS INFLICTED BY INMATES FLAG' /
   DEATHOTRSTAFF 'S4QIV.3.1B: ALL OTHER STAFF DEATHS INFLICTED BY INMATES' /
   DEATHOTRSTAFFF 'ALL OTHER STAFF DEATHS INFLICTED BY INMATES FLAG' /
   PHYSASSAULT 'S4QIV.4.1A: PHYSICAL ASSAULT ON ANOTHER INMATE' /
   PHYSASSAULTF 'PHYSICAL ASSAULT ON ANOTHER INMATE FLAG' /
   DRUGVIO   'S4QIV.4.1B: DRUG VIOLATION, SUCH AS USE, POSSESSION, OR'+
     ' DEALING DRUGS'/
   DRUGVIOF  'DRUG VIOLATION, SUCH AS USE, POSSESSION, OR DEALING DRUGS FLAG' /
   ALCOVIO   'S4QIV.4.1C: ALCOHOL VIOLATION, INCLUDING UNAUTHORIZED'+
     ' POSSESSION, USE, OR SALE'/
   ALCOVIOF  'ALCOHOL VIOLATION, INCLUDING UNAUTHORIZED POSSESSION, USE,'+
     ' OR SALE FLAG'/
   WEAPON    'S4QIV.4.1D: POSSESSION OF A WEAPON' /
   WEAPONF   'POSSESSION OF A WEAPON FLAG' /
   STOLENPROP 'S4QIV.4.1E: POSSESSION OF STOLEN PROPERTY' /
   STOLENPROPF 'POSSESSION OF STOLEN PROPERTY FLAG' /
   ESCAPE    'S4QIV.4.1F: ESCAPE OR ATTEMPTED ESCAPE' /
   ESCAPEF   'ESCAPE OR ATTEMPTED ESCAPE FLAG' /
   OTHERMAJVIO 'S4QIV.4.1G: ANY OTHER MAJOR VIOLATION, INCLUDING WORK'+
     ' SLOWDOWNS, FOOD STRIKES, SETTING FIRE, RIOTING, ETC.'/
   OTHERMAJVIOF 'ANY OTHER MAJOR VIOLATION, INCLUDING WORK SLOWDOWNS,'+
     ' FOOD STRIKES, SETTING FIRE, RIOTING, ETC. FLAG'/
   NCONPOP2  'NONCONFINED POPULATION CALCULATED' /
   .


* SPSS VALUE LABELS COMMAND.

VALUE LABELS
   STATE     1 'AL' 3 'AZ' 4 'AR' 5 'CA' 6 'CO' 7 'CT' 8 'DE' 9 'DC' 10 'FL'
             11 'GA' 13 'ID' 14 'IL' 15 'IN' 16 'IA' 17 'KS' 18 'KY' 19 'LA'
             20 'ME' 21 'MD' 22 'MA' 23 'MI' 24 'MN' 25 'MS' 26 'MO' 27 'MT'
             28 'NE' 29 'NV' 30 'NH' 31 'NJ' 32 'NM' 33 'NY' 34 'NC' 35 'ND'
             36 'OH' 37 'OK' 38 'OR' 39 'PA' 41 'SC' 42 'SD' 43 'TN' 44 'TX'
             45 'UT' 47 'VA' 48 'WA' 49 'WV' 50 'WI' 51 'WY' /
   CONFPOPF  0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   NCONPOPF  0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   TOTPOPF   0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   NONCITZF  -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   WEEK      -9 'Blank' 1 'Yes' 2 'No' /
   WEEKF     0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   ADULTMF   0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   ADULTFF   0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   JUVMF     0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   JUVFF     0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   TOTGENDERF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   ADLTJUVF  0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   CONVF     0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   CONVUNSENTF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   CONVSENTF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   UNCONVF   0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   UNCONVTRIALF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   UNCONVHOLDF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   UNCONVOTHERF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   S2QII3CF  0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   WHITEF    0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   BLACKF    0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   HISPF     0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   AIANF     0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   ASIANF    0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   NHOPIF    0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   TWORACEF  0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   OTHERRACEF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   RACEDKF   0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   RACETOTALF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   MARSHALSF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   BOPF      0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   ICEF      0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   BIAF      0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   S2QII5A5F 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   INSTATEPRISF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   OUTSTATEPRISF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know'
             /
   INSTATEJAILF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   OUTSTATEJAILF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know'
             /
   S2QII5DF  0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   PEAKPOPF  0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   ADPF      0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   RATEDF    0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   OPERATIONF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   DESIGNF   0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   ADMISF    0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   RELEASEF  0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   CONVII10A -9 'Blank' /
   CONVII10AF -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   UNCONVII10A -9 'Blank' /
   UNCONVII10AF -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   CONVII10B -9 'Blank' /
   CONVII10BF -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   UNCONVII10B -9 'Blank' /
   UNCONVII10BF -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   CONVII10C -9 'Blank' /
   CONVII10CF -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   UNCONVII10C -9 'Blank' /
   UNCONVII10CF -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   CONVII10D -9 'Blank' /
   CONVII10DF -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   UNCONVII10D -9 'Blank' /
   UNCONVII10DF -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   CONVII10E -9 'Blank' /
   CONVII10EF -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   UNCONVII10E -9 'Blank' /
   UNCONVII10EF -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   CONVII10F -9 'Blank' /
   CONVFII10F -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   UNCONVII10F -9 'Blank' /
   UNCONVII10FF -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   S2II10GCONV -9 'Blank' /
   S2II10GCONVF -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   S2II10GFUNCONV -9 'Blank' /
   S2II10GFUNCONVF -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   EMONITORF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   HOMEDETNF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   COMMSRVF  0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   DAYREPORTF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   PRETRIALF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   ALTWORKF  0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   TREATMENTF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   OTRNONCONFF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   NONCONFDF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   ADMLNCNFF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   ADFMNCNFF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   JVMLNCNFF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   JVFMNCNFF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   NCNFGNDRF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   CONVNCNFF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   UNCNVNCFF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   TOTCNVSTF 0 'Actual' 1 'Estimated' 8 'Not applicable' 9 'Don''t know' /
   CORRSTAFF -9 'Blank' /
   CORRSTAFFF -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   OTHERSTAFF -9 'Blank' /
   OTHERSTAFFF -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   S4QIV1C   -9 'Blank' /
   S4QIV1CF  -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   ASSAULTSTAFFYN -9 'Blank' 1 'Yes' 2 'No' /
   ASSAULTCORR -9 'Blank' /
   ASSAULTCORRF -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   ASSAULTOTRSTAFF -9 'Blank' /
   ASSAULTOTRSTAFFF -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   DEATHSTAFFYN -9 'Blank' 1 'Yes' 2 'No' /
   DEATHCORR -9 'Blank' /
   DEATHCORRF -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   DEATHOTRSTAFF -9 'Blank' /
   DEATHOTRSTAFFF -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   PHYSASSAULT -9 'Blank' /
   PHYSASSAULTF -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   DRUGVIO   -9 'Blank' /
   DRUGVIOF  -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   ALCOVIO   -9 'Blank' /
   ALCOVIOF  -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   WEAPON    -9 'Blank' /
   WEAPONF   -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   STOLENPROP -9 'Blank' /
   STOLENPROPF -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   ESCAPE    -9 'Blank' /
   ESCAPEF   -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   OTHERMAJVIO -9 'Blank' /
   OTHERMAJVIOF -9 'Blank' 0 'Actual' 1 'Estimated' 8 'Not applicable'
             9 'Don''t know' /
   .

* SPSS MISSING VALUES COMMAND.

* MISSING VALUES
     NONCITZF (-9) /
     WEEK (-9) /
     CONVII10A (-9) /
     CONVII10AF (-9) /
     UNCONVII10A (-9) /
     UNCONVII10AF (-9) /
     CONVII10B (-9) /
     CONVII10BF (-9) /
     UNCONVII10B (-9) /
     UNCONVII10BF (-9) /
     CONVII10C (-9) /
     CONVII10CF (-9) /
     UNCONVII10C (-9) /
     UNCONVII10CF (-9) /
     CONVII10D (-9) /
     CONVII10DF (-9) /
     UNCONVII10D (-9) /
     UNCONVII10DF (-9) /
     CONVII10E (-9) /
     CONVII10EF (-9) /
     UNCONVII10E (-9) /
     UNCONVII10EF (-9) /
     CONVII10F (-9) /
     CONVFII10F (-9) /
     UNCONVII10F (-9) /
     UNCONVII10FF (-9) /
     S2II10GCONV (-9) /
     S2II10GCONVF (-9) /
     S2II10GFUNCONV (-9) /
     S2II10GFUNCONVF (-9) /
     CORRSTAFF (-9) /
     CORRSTAFFF (-9) /
     OTHERSTAFF (-9) /
     OTHERSTAFFF (-9) /
     S4QIV1C (-9) /
     S4QIV1CF (-9) /
     ASSAULTSTAFFYN (-9) /
     ASSAULTCORR (-9) /
     ASSAULTCORRF (-9) /
     ASSAULTOTRSTAFF (-9) /
     ASSAULTOTRSTAFFF (-9) /
     DEATHSTAFFYN (-9) /
     DEATHCORR (-9) /
     DEATHCORRF (-9) /
     DEATHOTRSTAFF (-9) /
     DEATHOTRSTAFFF (-9) /
     PHYSASSAULT (-9) /
     PHYSASSAULTF (-9) /
     DRUGVIO (-9) /
     DRUGVIOF (-9) /
     ALCOVIO (-9) /
     ALCOVIOF (-9) /
     WEAPON (-9) /
     WEAPONF (-9) /
     STOLENPROP (-9) /
     STOLENPROPF (-9) /
     ESCAPE (-9) /
     ESCAPEF (-9) /
     OTHERMAJVIO (-9) /
     OTHERMAJVIOF (-9) /
   .

EXECUTE.

* Create SPSS system file.

*SAVE OUTFILE="spss-filename.sav".
