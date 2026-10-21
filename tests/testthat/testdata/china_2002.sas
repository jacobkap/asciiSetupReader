/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 21741
 |                 CHINESE HOUSEHOLD INCOME PROJECT, 2002
 |              (DATASET 0005: VILLAGE ADMINISTRATIVE DATA)
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
 | "c:\temp\21741-0005-data.txt").
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
  VALUE v3_1ffff  1='(1) plain (basin)' 2='(2) hilly area' 3='(3) mountainous area' ;
  VALUE v3_2ffff  1='(1) Yes' 2='(2) No' ;
  VALUE v3_3ffff  1='(1) Yes' 2='(2) No' ;
  VALUE v3_4ffff  1='(1) Yes' 2='(2) No' ;
  VALUE v3_101ff  1='(1) before 1969' 2='(2) 1970-79' 3='(3) 1980-89' 4='(4) 1990-98'
                  5='(5) after 1999' 6='(6) not yet' ;
  VALUE v3_102ff  1='(1) before 1969' 2='(2) 1970-79' 3='(3) 1980-89' 4='(4) 1990-98'
                  5='(5) after 1999' 6='(6) not yet' ;
  VALUE v3_103ff  1='(1) before 1969' 2='(2) 1970-79' 3='(3) 1980-89' 4='(4) 1990-98'
                  5='(5) after 1999' 6='(6) not yet' ;
  VALUE v3_104ff  1='(1) full-grade primary school(wanxiao)'
                  2='(2) ordinary primary school'
                  3='(3) educational spot (jiaoxuedian)' 4='(4) none' ;
  VALUE v3_105ff  1='(1) Yes' 2='(2) No' ;
  VALUE v3_106ff  1='(1) Yes' 2='(2) No' ;
  VALUE v3_106a   1='(1) village-collective' 2='(2) branch township hospital'
                  3='(3) private' 4='(4) other' ;
  VALUE v3_107ff  1='(1) Yes' 2='(2) No' ;
  VALUE v3_108ff  1='(1) Yes' 2='(2) No' ;
  VALUE v3_109ff  1='(1) Yes' 2='(2) No' ;
  VALUE v3_110ff  1='(1) Yes' 2='(2) No' ;
  VALUE v3_302a   1='(1) canal' 2='(2) well' ;
  VALUE v3_303a   1='(1) canal' 2='(2) well' ;
  VALUE v3_302b   1='(1) Yes' 2='(2) No' ;
  VALUE v3_303b   1='(1) Yes' 2='(2) No' ;
  VALUE v3_308d   1='(1) Yes' 2='(2) No' ;
  VALUE v3_313a   1='(1) Administrative village'
                  2='(2) Villager group/natural village' ;
  VALUE v3_313b   1='(1) none' 2='(2) once' 3='(3) twice' 4='(4) more' ;
  VALUE v3_313c   1='(1) Yes' 2='(2) No' ;
  VALUE v3_314ff  1='(1) Yes' 2='(2) No' ;
  VALUE v3_315ff  1='(1) Yes' 2='(2) No' ;
  VALUE v3_314a   1='(1) Yes' 2='(2) No' ;
  VALUE v3_315a   1='(1) Yes' 2='(2) No' ;
  VALUE v3_314b   1='(1) Yes' 2='(2) No' ;
  VALUE v3_315b   1='(1) Yes' 2='(2) No' ;
  VALUE v3_314c   1='(1) Yes' 2='(2) No' ;
  VALUE v3_315c   1='(1) Yes' 2='(2) No' ;
  VALUE v3_314d   1='(1) Yes' 2='(2) No' ;
  VALUE v3_315d   1='(1) Yes' 2='(2) No' ;
  VALUE v3_314e   1='(1) Yes' 2='(2) No' ;
  VALUE v3_315e   1='(1) Yes' 2='(2) No' ;
  VALUE v3_316ff  1='(1) No' 2='(2) Yes, township level' 3='(3) Yes, county level'
                  4='(4) Yes, province level' 5='(5) Yes, national level' ;
  VALUE v3_317ff  1='(1) No' 2='(2) Yes, township level' 3='(3) Yes, county level'
                  4='(4) Yes, province level' 5='(5) Yes, national level' ;
  VALUE v3_316a   1='(1) No' 2='(2) Yes, township level' 3='(3) Yes, county level'
                  4='(4) Yes, province level' 5='(5) Yes, national level' ;
  VALUE v3_317a   1='(1) No' 2='(2) Yes, township level' 3='(3) Yes, county level'
                  4='(4) Yes, province level' 5='(5) Yes, national level' ;
  VALUE v3_316b   1='(1) No' 2='(2) Yes, township level' 3='(3) Yes, county level'
                  4='(4) Yes, province level' 5='(5) Yes, national level' ;
  VALUE v3_317b   1='(1) No' 2='(2) Yes, township level' 3='(3) Yes, county level'
                  4='(4) Yes, province level' 5='(5) Yes, national level' ;
  VALUE v3_316c   1='(1) Yes' 2='(2) No' ;
  VALUE v3_317c   1='(1) Yes' 2='(2) No' ;
  VALUE v3_316d   1='(1) the villager' 2='(2) the village cadre'
                  3='(3) the township cadre'
                  4='(4) the county (or upper level cadre)' 5='(5) others' ;
  VALUE v3_317d   1='(1) the villager' 2='(2) the village cadre'
                  3='(3) the township cadre'
                  4='(4) the county (or upper level cadre)' 5='(5) others' ;
  VALUE v3_404ff  1='(1) Yes' 2='(2) No' ;
  VALUE v3_406ff  1='(1) decrease' 2='(2) increase' 3='(3) no change' ;
  VALUE v3_407ff  1='(1) decrease' 2='(2) increase' 3='(3) no change' ;
  VALUE v3_501ff  1='(1) Yes' 2='(2) No' ;
  VALUE v3_502ff  1='(1) Yes' 2='(2) No' ;
  VALUE v3_501a   1='(1) Yes' 2='(2) No' ;
  VALUE v3_502a   1='(1) Yes' 2='(2) No' ;
  VALUE v3_503a   1='(1) 29 and below' 2='(2) 30-34' 3='(3) 35-39' 4='(4) 40-44' 5='(5) 45-49'
                  6='(6) 50-54' 7='(7) 55 and above' ;
  VALUE v3_503b   1='(1) primary school or less' 2='(2) junior middle school'
                  3='(3) senior middle school' 4='(4) technical secondary school'
                  5='(5) college or above' ;
  VALUE v3_503c   1='(1) Yes' 2='(2) No' ;
  VALUE v3_503d   1='(1) Yes' 2='(2) No' ;
  VALUE v3_504a   1='(1) 29 and below' 2='(2) 30-34' 3='(3) 35-39' 4='(4) 40-44' 5='(5) 45-49'
                  6='(6) 50-54' 7='(7) 55 and above' ;
  VALUE v3_504b   1='(1) primary school or less' 2='(2) junior middle school'
                  3='(3) senior middle school' 4='(4) technical secondary school'
                  5='(5) college or above' ;
  VALUE v3_504c   1='(1) Yes' 2='(2) No' ;
  VALUE v3_504d   1='(1) Yes' 2='(2) No' ;
  VALUE v3_505ff  1='(1) Yes' 2='(2) No' ;
  VALUE v3_506ff  1='(1) Yes' 2='(2) No' ;
  VALUE v3_505a   0='(0) Less than once per year' ;
  VALUE v3_506a   0='(0) Less than once per year' ;
  VALUE v3_505b   0='(0) Less than once per month' ;
  VALUE v3_506b   0='(0) Less than once per month' ;
  VALUE v3_507ff  1='(1) no' 2='(2) sometimes' 3='(3) often' 4='(4) have to' 5='(5) hard to say' ;
  VALUE v3_507a   1='(1) no' 2='(2) sometimes' 3='(3) often' 4='(4) have to' 5='(5) hard to say' ;
  VALUE v3_601b   1='(1) Yes' 2='(2) No' ;
  VALUE v3_602b   1='(1) Yes' 2='(2) No' ;
  VALUE v3_603ff  1='(1) Yes' 2='(2) No' ;
  VALUE v3_603a   1='(1) Yes' 2='(2) No' ;
  VALUE v3_701ff  1='(1) Yes' 2='(2) No' ;
  VALUE v3_702ff  1='(1) Yes' 2='(2) No' ;
  VALUE v3_701b   1='(1) Yes' 2='(2) No' ;
  VALUE v3_702b   1='(1) Yes' 2='(2) No' ;
  VALUE v3_703ff  1='(1) Yes, compulsive participation'
                  2='(2) Yes, voluntary participation' 3='(3) No (skip to 704)' ;
  VALUE v3_704ff  1='(1) Yes' 2='(2) No' ;
  VALUE v3_705ff  1='(1) Yes' 2='(2) No' ;
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA;
INFILE "data-filename" LRECL=1249;
INPUT
       ORDER 1-3               SM 4-5
        COUN 6-11               VILL 12-13              V3_1 14
        V3_2 15                 V3_3 16                 V3_4 17
        V3_5 18-23 .2           V3_6 24-29 .2           V3_7 30-34 .2
        V3_9 35-41 .2           V3_10 42-46             V3_11 47-50
        V3_12 51-54             V3_101 55               V3_102 56
        V3_103 57               V3_104 58               V3_104A 59-63 .2
        V3_105 64-67 .2         V3_105A 68-72 .2        V3_106 73
        V3_106A 74              V3_106B 75-79 .2        V3_107 80
        V3_108 81               V3_109 82               V3_110 83
        V3_201 84-87            V3_202 88-91            V3_201A 92-95
        V3_202A 96-99           V3_201B 100-102         V3_202B 103-105
        V3_201C 106-108         V3_202C 109-110         V3_201D 111-112
        V3_202D 113-114         V3_201E 115-117         V3_202E 118-120
        V3_201F 121-124         V3_201G 125-127         V3_201H 128-130
        V3_201I 131-133         V3_203 134-137          V3_204 138-141
        V3_203A 142-145         V3_204A 146-149         V3_203B 150-153
        V3_203C 154-156         V3_203D 157-160         V3_203E 161-164
        V3_205 165-168          V3_206 169-172          V3_207 173-176
        V3_205A 177-180         V3_206A 181-184         V3_205B 185-188
        V3_206B 189-191         V3_208 192-198 .2       V3_301 199-206 .2
        V3_301A 207-214 .2      V3_301B 215-221 .2      V3_302 222-229 .2
        V3_303 230-237 .2       V3_302A 238-241 .2      V3_303A 242
        V3_302B 243             V3_303B 244             V3_304 245-252 .2
        V3_305 253-260 .2       V3_304A 261-268 .2      V3_305A 269-276 .2
        V3_304B 277-283 .2      V3_304C 284-288         V3_304D 289-296 .2
        V3_304E 297-303 .2      V3_305B 304-310 .2      V3_306 311-318 .2
        V3_307 319-325 .2       V3_306A 326-331 .2      V3_307A 332-337 .2
        V3_306B 338-344 .2      V3_307B 345-351 .2      V3_308 352-356 .2
        V3_308A 357-361 .2      V3_308B 362-366 .2      V3_308C 367-371 .2
        V3_308D 372             V3_309 373-382 .2       V3_310 383-392 .2
        V3_309A 393-402 .2      V3_310A 403-412 .2      V3_311 413-416
        V3_312 417-420          V3_311A 421-424         V3_312A 425-428
        V3_311B 429-432         V3_312B 433-436         V3_311C 437-439
        V3_312C 440-442         V3_311D 443-445         V3_312D 446-448
        V3_313 449-452          V3_313A 453             V3_313B 454
        V3_313C 455             V3_314 456              V3_315 457
        V3_314A 458             V3_315A 459             V3_314B 460
        V3_315B 461             V3_314C 462             V3_315C 463
        V3_314D 464             V3_315D 465             V3_314E 466
        V3_315E 467             V3_316 468              V3_317 469
        V3_316A 470             V3_317A 471             V3_316B 472
        V3_317B 473             V3_316C 474             V3_317C 475
        V3_316D 476             V3_317D 477             V3_318 478-487 .2
        V3_319 488-497 .2       V3_318A 498-507 .2      V3_319A 508-517 .2
        V3_401 518-527 .2       V3_402 528-537 .2       V3_401A 538-547 .2
        V3_402A 548-557 .2      V3_401B 558-566 .2      V3_402B 567-575 .2
        V3_401C 576-584 .2      V3_402C 585-594 .2      V3_401D 595-603 .2
        V3_402D 604-612 .2      V3_401E 613-622 .2      V3_402E 623-632 .2
        V3_401F 633-642 .2      V3_402F 643-652 .2      V3_401G 653-661 .2
        V3_402G 662-671 .2      V3_401H 672-681 .2      V3_402H 682-690 .2
        V3_401I 691-700 .2      V3_402I 701-710 .2      V3_403 711-719 .2
        V3_403A 720-729 .2      V3_404 730              V3_405 731-734
        V3_405A 735-742 .2      V3_405B 743-750 .2      V3_406 751
        V3_406A 752-759 .2      V3_406B 760-765 .2      V3_407 766
        V3_407A 767-771 .2      V3_407B 772-777 .2      V3_408 778-788 .2
        V3_408A 789-799 .2      V3_408B 800-806         V3_408C 807-815 .2
        V3_408D 816-825 .2      V3_408E 826-834 .2      V3_408F 835-843 .2
        V3_408G 844-852 .2      V3_408H 853-858         V3_409 859-869 .2
        V3_409A 870-880 .2      V3_409B 881-890 .2      V3_409C 891-900 .2
        V3_409D 901-909 .2      V3_409E 910-919 .2      V3_409F 920-928 .2
        V3_409G 929-937 .2      V3_409H 938-946 .2      V3_409I 947-952
        V3_409J 953-958         V3_410 959-969 .2       V3_410A 970-980 .2
        V3_410B 981-987         V3_410C 988-997 .2      V3_410D 998-1006 .2
        V3_410E 1007-1016 .2    V3_410F 1017-1025 .2    V3_410G 1026-1034 .2
        V3_410H 1035-1043 .2    V3_410I 1044-1052 .2    V3_410J 1053-1061 .2
        V3_501 1062             V3_502 1063             V3_501A 1064
        V3_502A 1065            V3_501B 1066-1067       V3_502B 1068-1069
        V3_501C 1070-1071       V3_502C 1072-1073       V3_503 1074-1078 .2
        V3_503A 1079            V3_503B 1080            V3_503C 1081
        V3_503D 1082            V3_503E 1083-1089 .2    V3_504 1090-1094 .2
        V3_504A 1095            V3_504B 1096            V3_504C 1097
        V3_504D 1098            V3_504E 1099-1105 .2    V3_505 1106
        V3_506 1107             V3_505A 1108-1109       V3_506A 1110-1114 .2
        V3_505B 1115-1120 .2    V3_506B 1121-1122       V3_507 1123
        V3_507A 1124            V3_601 1125-1127        V3_602 1128-1130
        V3_601A 1131-1134       V3_602A 1135-1137       V3_601B 1138
        V3_602B 1139            V3_603 1140             V3_603A 1141
        V3_701 1142             V3_702 1143             V3_701A 1144-1148 .2
        V3_702A 1149-1151       V3_701B 1152            V3_702B 1153
        V3_703 1154             V3_703A 1155-1159 .2    V3_703B 1160-1164 .2
        V3_703C 1165-1169       V3_704 1170             V3_704A 1171-1176 .2
        V3_704B 1177-1182 .2    V3_705 1183             V3_706A 1184-1186
        V3_706B 1187-1195 .2    V3_707A 1196-1198       V3_707B 1199-1205
        V3_708A 1206-1208       V3_708B 1209-1214       V3_709A 1215-1217
        V3_709B 1218-1223       V3_710A 1224-1227       V3_710B 1228-1233
        V3_8OLD 1234-1241 .2    V3_8NEW 1242-1249 .2    ;


* SAS LABEL STATEMENT;

LABEL
   ORDER   = 'ORDER'
   SM      = 'SM'
   COUN    = 'County Number'
   VILL    = 'Village Number'
   V3_1    = 'Geographical condition'
   V3_2    = 'Suburb of large/middle city (jiaoqu)'
   V3_3    = 'Ethnic minority area'
   V3_4    = 'Used to be rural base of CCP (laoqu)'
   V3_5    = 'Distance from nearest county seat (km)'
   V3_6    = 'Distance from nearest township government (km)'
   V3_7    = 'Distance from nearest bus terminals, train stations, or wharfs (km)'
   V3_9    = 'Orchard (mu)'
   V3_10   = 'Forest (mu)'
   V3_11   = 'Pasture land (mu)'
   V3_12   = 'Fish-breeding pond (mu)'
   V3_101  = 'The time when the road opened'
   V3_102  = 'The time when electricity was available'
   V3_103  = 'The time when telephone was available'
   V3_104  = 'Any primary schools in the village?'
   V3_104A = 'Distance from the nearest full-grade primary school (km)'
   V3_105  = 'Any junior middle schools in the village?'
   V3_105A = 'If not, distance from the nearest junior middle school (km)'
   V3_106  = 'Any clinics in the village'
   V3_106A = 'What kind of clinic in village'
   V3_106B = 'Distance from the village to the nearest clinic (km)'
   V3_107  = 'Does the village operate community and team enterprise (SheDui Qiye) in 1970s?'
   V3_108  = 'Does the county (the village in) is the national level poverty county?'
   V3_109  = 'Does the county (the village in) is the province level poverty county?'
   V3_110  = 'Does the township (Xiang) (the village in) is the province level poverty county?'
   V3_201  = 'Total population (year-end) in 2002'
   V3_202  = 'Total population (year-end) in 1998'
   V3_201A = 'Total number of household (year-end) in 2002'
   V3_202A = 'Total number of household (year-end) in 1998'
   V3_201B = 'Nonagricultural family business in 2002'
   V3_202B = 'Nonagricultural family business in 1998'
   V3_201C = 'Cadre household in 2002'
   V3_202C = 'Cadre household in 1998'
   V3_201D = 'Cadre & family business household in 2002'
   V3_202D = 'Cadre & family business household in 1998'
   V3_201E = 'Specialized farming households in 2002'
   V3_202E = 'Specialized farming households in 1998'
   V3_201F = 'Ethnic minority household in 2002'
   V3_201G = 'Households with the Party member in 2002'
   V3_201H = 'Old or disabled household getting public assistance (wubaohu) in 2002'
   V3_201I = 'The household migrated at the beginning of 1999'
   V3_203  = 'Total number of labor force (year-end) in 2002'
   V3_204  = 'Total number of labor force (year-end) in 1998'
   V3_203A = 'Labor force mainly engaged in agricultural, forestry, animal husbandry, and fishery in 2002'
   V3_204A = 'Labor force mainly engaged in agricultural, forestry, animal husbandry, and fishery in 1998'
   V3_203B = 'Labor force engaged in manufacturing in 2002'
   V3_203C = 'Labor force engaged in construction in 2002'
   V3_203D = 'Labor force engaged in wholesale, retail and food services in 2002'
   V3_203E = 'Labor force engaged in other industry in 2002'
   V3_205  = 'Labor force who worked out of Township more than one month in 2002'
   V3_206  = 'Labor force who worked out of Township more than one month in 1998'
   V3_207  = 'Labor force who worked out of Township more than one month in 1990'
   V3_205A = 'Of which, working out of township more than six months (2002)'
   V3_206A = 'Of which, working out of township more than six months (1998)'
   V3_205B = 'Working out of the province (2002)'
   V3_206B = 'Working out of the province (1998)'
   V3_208  = 'Daily wage for the local labor in the village and town (Yuan/day)'
   V3_301  = 'Net income per capita in the village (2002)'
   V3_301A = 'Net income per capita in the village (1998)'
   V3_301B = 'Net income per capita in the village (1990)'
   V3_302  = 'Total irrigated land (year-end) in 2002 (mu)'
   V3_303  = 'Total irrigated land (year-end) in 1998 (mu)'
   V3_302A = 'Major irrigation method in 2002'
   V3_303A = 'Major irrigation method in 1998'
   V3_302B = 'Collectively owned irrigation facilities? (2002)'
   V3_303B = 'Collectively owned irrigation facilities? (1998)'
   V3_304  = 'Total planting area in 2002 (mu)'
   V3_305  = 'Total planting area in 1998 (mu)'
   V3_304A = 'Planting area for grain in 2002 (mu)'
   V3_305A = 'Planting area for grain in 1998 (mu)'
   V3_304B = 'Planting area for grain in 2002: rice (mu)'
   V3_304C = 'Planting area for grain in 2002: wheat (mu)'
   V3_304D = 'Planting area for grain in 2002: maize (mu)'
   V3_304E = 'Planting area for vegetable in 2002 (mu)'
   V3_305B = 'Planting area for vegetable in 1998 (mu)'
   V3_306  = 'Yield per Mu for Grain in 2002: rice (kg/mu)'
   V3_307  = 'Yield per Mu for Grain in 1998: rice (kg/mu)'
   V3_306A = 'Yield per Mu for Grain in 2002: wheat (kg/mu)'
   V3_307A = 'Yield per Mu for Grain in 1998: wheat (kg/mu)'
   V3_306B = 'Yield per Mu for Grain in 2002: maize (kg/mu)'
   V3_307B = 'Yield per Mu for Grain in 1998: maize (kg/mu)'
   V3_308  = 'Protecting Price for grain in 2002: Rice (yuan/kg)'
   V3_308A = 'Protecting Price for grain in 2002: Wheat (yuan/kg)'
   V3_308B = 'Protecting Price for grain in 2002: Maize (yuan/kg)'
   V3_308C = 'Protecting Price for grain in 2002: Potato etc. (yuan/kg)'
   V3_308D = 'Any compulsory grain quota in 2002'
   V3_309  = 'Total revenue by all the TVEs in the village (2002) - 10,000 yuan'
   V3_310  = 'Total revenue by all the TVEs in the village (1998) - 10,000 yuan'
   V3_309A = 'Village level collective owned TVEs (2002) - 10,000 yuan'
   V3_310A = 'Village level collective owned TVEs (1998) - 10,000 yuan'
   V3_311  = 'Total number of employees in TVEs (year-end) (2002)'
   V3_312  = 'Total number of employees in TVEs (year-end) (1998)'
   V3_311A = 'TVE employees: village level collective (2002)'
   V3_312A = 'TVE employees: village level collective (1998)'
   V3_311B = 'TVE employees: private enterprise (2002)'
   V3_312B = 'TVE employees: private enterprise (1998)'
   V3_311C = 'TVE employees: Joint venture/foreign invested (2002)'
   V3_312C = 'TVE employees: Joint venture/foreign invested (1998)'
   V3_311D = 'TVE employees: Others (2002)'
   V3_312D = 'TVE employees: Others (1998)'
   V3_313  = 'Starting year of the last round of household contract responsibility system (19__)'
   V3_313A = 'Does the reallocation in land base on administrative village or natural village/villager group?'
   V3_313B = 'Any re-allocation (''adjustment'') of land in the village or villager group since 1998'
   V3_313C = 'Any land retained by collective for re-allocation (jidong tian) in 2002 for population increasing?'
   V3_314  = 'Collectively managed irrigation/evacuation? (2002)'
   V3_315  = 'Collectively managed irrigation/evacuation? (1998)'
   V3_314A = 'Mechanized cultivating using collectively owned machines? (2002)'
   V3_315A = 'Mechanized cultivating using collectively owned machines? (1998)'
   V3_314B = 'Does the collective prevent and cure the plant disease and insect pests unified? (2002)'
   V3_315B = 'Does the collective prevent and cure the plant disease and insect pests unified? (1998)'
   V3_314C = 'Does the collective provide the service of purchasing agriculture inputs unified? (2002)'
   V3_315C = 'Does the collective provide the service of purchasing agriculture inputs unified? (1998)'
   V3_314D = 'Does the collective make program on planting? (2002)'
   V3_315D = 'Does the collective make program on planting? (1998)'
   V3_314E = 'Does the collective organize the labor force to work out? (2002)'
   V3_315E = 'Does the collective organize the labor force to work out? (1998)'
   V3_316  = 'Does the village be appointed as a pilot village for productive or economic reason? (2002)'
   V3_317  = 'Does the village be appointed as a pilot village for productive or economic reason? (1998)'
   V3_316A = 'Does the village be appointed as a pilot village for non-economic reason? (2002)'
   V3_317A = 'Does the village be appointed as a pilot village for non-economic reason? (1998)'
   V3_316B = 'Does the village be appointed as ''production base'' or ''specialized village''? (2002)'
   V3_317B = 'Does the village be appointed as ''production base'' or ''specialized village''? (1988)'
   V3_316C = 'Does the village have the foreign/domestic investment project? (2002)'
   V3_317C = 'Does the village have the foreign/domestic investment project? (1998)'
   V3_316D = 'If answered ''yes'' in the above question, who introduced the project? (2002)'
   V3_317D = 'If answered ''yes'' in the above question, who introduced the project? (1998)'
   V3_318  = 'The original value of the village productive fixed assets at the end of the year (2002) - 10,000
yuan'
   V3_319  = 'The original value of the village productive fixed assets at the end of the year (1998) - 10,000
yuan'
   V3_318A = 'Productive fixed assets collective owned by the village and villager group (2002) - 10,000 yuan'
   V3_319A = 'Productive fixed assets collective owned by the village and villager group (1998) - 10,000 yuan'
   V3_401  = 'Total collective finance expenditure (2002)'
   V3_402  = 'Total collective finance expenditure (1998)'
   V3_401A = 'Collective finance expenditure used in enlarging collectively operated reproduction (2002) (yuan)'
   V3_402A = 'Collective finance expenditure used in enlarging collectively operated reproduction (1998) (yuan)'
   V3_401B = 'Collective finance expenditure used in providing productive service for household (2002) (yuan)'
   V3_402B = 'Collective finance expenditure used in providing productive service for household (1998) (yuan)'
   V3_401C = 'Collective finance expenditure used in education (2002) (yuan)'
   V3_402C = 'Collective finance expenditure used in education (1998) (yuan)'
   V3_401D = 'Collective finance expenditure used in medical treatment and sanitation (2002) (yuan)'
   V3_402D = 'Collective finance expenditure used in medical treatment and sanitation (1998) (yuan)'
   V3_401E = 'Collective finance expenditure used in infrastructure (2002) (yuan)'
   V3_402E = 'Collective finance expenditure used in infrastructure (1998) (yuan)'
   V3_401F = 'Collective finance expenditure: other commonweal expenditure (2002) (yuan)'
   V3_402F = 'Collective finance expenditure: other commonweal expenditure (1998) (yuan)'
   V3_401G = 'Collective finance expenditure: wage and subsidies for village and group cadre (2002) (yuan)'
   V3_402G = 'Collective finance expenditure: wage and subsidies for village and group cadre (1998) (yuan)'
   V3_401H = 'Collective finance expenditure: other administrative expenditure (2002) (yuan)'
   V3_402H = 'Collective finance expenditure: other administrative expenditure (1998) (yuan)'
   V3_401I = 'Collective finance expenditure: other expenditures (2002) (yuan)'
   V3_402I = 'Collective finance expenditure: other expenditures (1998) (yuan)'
   V3_403  = 'Accumulative total amount of credit of village committee (year-end 2002) - 10,000 yuan'
   V3_403A = 'Accumulative Total amount of debt of village committee (year-end 2002) - 10,000 yuan'
   V3_404  = 'By the end of 2002, already conducted ''taxes and fees reform''?'
   V3_405  = 'The year of taxes and fees reform'
   V3_405A = 'Taxable land acreage (2002) (mu)'
   V3_405B = 'Agricultural tax, special agricultural tax, and additional fee for the two tax in 2002 paid by the
villager (yuan per mu)'
   V3_406  = 'Direction of change of the budget actually usable for education after the reform'
   V3_406A = 'Direction of education budget change (If decreased) decreased approximately --%'
   V3_406B = 'Direction of education budget change (If increased) increased approximately --%'
   V3_407  = 'Direction of change of the budget actually usable for administrative cost (salary for cadres etc.)'
   V3_407A = 'Direction of administrative budget change (If decreased) decreased approximately --%'
   V3_407B = 'Direction of administrative budget change (If increased) increased approximately --%'
   V3_408  = 'Total collective revenue in the village(Yuan)'
   V3_408A = 'Collective operated revenue in the village (including the revenue turned in by collective
enterprises) (yuan)'
   V3_408B = 'Revenue turned in by other enterprises or economic entities excluding the collective enterprises
(yuan)'
   V3_408C = 'Fundraising from ''one issue, one discussion'' in the village (yuan)'
   V3_408D = 'Other revenue in the village (yuan)'
   V3_408E = 'Appropriate founds from the superior government (yuan)'
   V3_408F = 'Total revenue turned in to the superior government (Yuan)'
   V3_408G = 'Revenue turned in: All kinds of fundraising (yuan)'
   V3_408H = 'Revenue turned in: Other fees turned in (such as forfeit) (yuan)'
   V3_409  = 'Total collective revenue in the village(Yuan)'
   V3_409A = 'Collective operated revenue in the village (including the revenue turned in by collective
enterprises) (yuan)'
   V3_409B = 'Revenue turned in by other enterprises or economic entities excluding the collective enterprises
(yuan)'
   V3_409C = 'Drawing by the village (Cun Tiliu) (yuan)'
   V3_409D = 'Fundraising by the village (yuan)'
   V3_409E = 'Other revenue in the village (yuan)'
   V3_409F = 'Appropriate founds from the superior government (yuan)'
   V3_409G = 'Total revenue turned in to the superior government (yuan)'
   V3_409H = 'Revenue turned in: Fees planned as a whole in the township (Xiangzhen Tongchou) (yuan)'
   V3_409I = 'Revenue turned in: All kinds of fundraising (yuan)'
   V3_409J = 'Revenue turned in: Other fees turned in (such as forfeit) (yuan)'
   V3_410  = 'Total collective revenue in the village(Yuan) (1998)'
   V3_410A = 'Collective operated revenue in the village (including the revenue turned in by collective
enterprises) (yuan) (1998)'
   V3_410B = 'Revenue turned in by other enterprises or economic entities excluding the collective enterprises
(yuan) (1998)'
   V3_410C = 'Drawing by the village (Cun Tiliu) (yuan) (1998)'
   V3_410D = 'Fundraising by the village (yuan) (1998)'
   V3_410E = 'Other revenue in the village (yuan) (1998)'
   V3_410F = 'Appropriate founds from the superior government (yuan) (1998)'
   V3_410G = 'Total revenue turned in to the superior government (yuan) (1998)'
   V3_410H = 'Revenue turned in: Fees planned as a whole in the township (Xiangzhen Tongchou) (yuan) (1998)'
   V3_410I = 'Revenue turned in: All kinds of fundraising (yuan) (1998)'
   V3_410J = 'Revenue turned in: Other fees turned in (such as forfeit) (yuan) (1998)'
   V3_501  = 'Does the village practice the direct election (or HaiXuan)? (2002)'
   V3_502  = 'Does the village practice the direct election (or HaiXuan)? (1998)'
   V3_501A = 'Does the candidate of the village committee members be nominated directly by the villagers? (2002)'
   V3_502A = 'Does the candidate of the village committee members be nominated directly by the villagers? (1998)'
   V3_501B = 'How many times is the congress of the villager convened during the year? (2002)'
   V3_502B = 'How many times is the congress of the villager convened during the year? (1998)'
   V3_501C = 'Number of village cadres who receive salary (2002)'
   V3_502C = 'Number of village cadres who receive salary (1998)'
   V3_503  = 'How many years does the Party secretary be in office?'
   V3_503A = 'The age of the Party secretary'
   V3_503B = 'Educational level of the Party secretary'
   V3_503C = 'Does the Party secretary have the experience of enterprise management?'
   V3_503D = 'Does the Party secretary have the experience of operating nonagricultural family businesses?'
   V3_503E = 'Monthly salary for the Party secretary (Yuan/Month)'
   V3_504  = 'How many years does the director of the village committee (village head) be in office?'
   V3_504A = 'The age of the village head'
   V3_504B = 'Educational level of the village head'
   V3_504C = 'Does the village head have the experience of enterprise management?'
   V3_504D = 'Does the village head have the experience of operating nonagricultural family businesses?'
   V3_504E = 'Monthly salary for the village head (Yuan/Month)'
   V3_505  = 'Any county level or upper level officials originated from this village? (1999-2002)'
   V3_506  = 'Any county level or upper level officials originated from this village? (1990-1998)'
   V3_505A = 'Frequency of inspection tours by county level or upper level officials (average times/year) (1999-
2002)'
   V3_506A = 'Frequency of inspection tours by county level or upper level officials (average times/year) (1990-
1998)'
   V3_505B = 'Times/month Party secretary or village head attended township or cadre meeting (1999-2002)'
   V3_506B = 'Times/month Party secretary or village head attended township or cadre meeting (1990-1998)'
   V3_507  = 'Should the village government balance the different interests of the villager group or natural
villages?'
   V3_507A = 'Should the village government balance the different interests of lineages?'
   V3_601  = 'How many households participate in any specialization organization? (approximate) (2002)'
   V3_602  = 'How many households participate in any specialization organization? (approximate) (1998)'
   V3_601A = 'How many households participate in group-loan (microfinance, xiao''e xindai) (2002)'
   V3_602A = 'How many households participate in group-loan (microfinance, xiao''e xindai) (1998)'
   V3_601B = 'Any community-level organization for arranging funerals, weddings, and other social events? (2002)'
   V3_602B = 'Any community-level organization for arranging funerals, weddings, and other social events? (1998)'
   V3_603  = 'Is the percentage of the largest surname households to total number of households more than 50%?'
   V3_603A = 'Is the percentage of the five largest surnames to total number of households more than 50%?'
   V3_701  = 'Any natural disaster during the year? (2002)'
   V3_702  = 'Any natural disaster during the year? (1998)'
   V3_701A = 'If ''yes'', how much percentage reduced than ordinary years? (2002)'
   V3_702A = 'If ''yes'', how much percentage reduced than ordinary years? (1998)'
   V3_701B = 'Any tax-cut? (2002)'
   V3_702B = 'Any tax-cut? (1998)'
   V3_703  = 'Any collective system of medical insurance in the village?'
   V3_703A = 'If there is cooperative medical system, how much insurance premium per month per capita?
(yuan/month)'
   V3_703B = 'If there is cooperative medical system, maximum percentage of medical expenses which can be written
off'
   V3_703C = 'If there is cooperative medical system, how much can be written off per capita per year at most?
(yuan/month)'
   V3_704  = 'Does the village participate in the ageing insurance system in rural?'
   V3_704A = 'If ''yes'', how much insurance premium per month per capita paid by the participator? (yuan/month)'
   V3_704B = 'If ''yes'', how much subsided by the collective per month per capita? (yuan/month)'
   V3_705  = 'Does the household in the village get any kind of loan for poverty relief during 1997-2001?'
   V3_706A = 'The amount loan for poverty relief in 2001'
   V3_706B = 'The amount loan for poverty relief in 2001'
   V3_707A = 'The amount loan for poverty relief in 2000'
   V3_707B = 'The amount loan for poverty relief in 2000'
   V3_708A = 'The amount loan for poverty relief in 1999'
   V3_708B = 'The amount loan for poverty relief in 1999'
   V3_709A = 'The amount loan for poverty relief in 1998'
   V3_709B = 'The amount loan for poverty relief in 1998'
   V3_710A = 'The amount loan for poverty relief in 1997'
   V3_710B = 'The amount loan for poverty relief in 1997'
   V3_8OLD = 'V3_8OLD'
   V3_8NEW = 'V3_8NEW'
        ;


* SAS FORMAT STATEMENT;

/*
  FORMAT V3_1 v3_1ffff. V3_2 v3_2ffff. V3_3 v3_3ffff.
         V3_4 v3_4ffff. V3_101 v3_101ff. V3_102 v3_102ff.
         V3_103 v3_103ff. V3_104 v3_104ff. V3_105 v3_105ff.
         V3_106 v3_106ff. V3_106A v3_106a. V3_107 v3_107ff.
         V3_108 v3_108ff. V3_109 v3_109ff. V3_110 v3_110ff.
         V3_302A v3_302a. V3_303A v3_303a. V3_302B v3_302b.
         V3_303B v3_303b. V3_308D v3_308d. V3_313A v3_313a.
         V3_313B v3_313b. V3_313C v3_313c. V3_314 v3_314ff.
         V3_315 v3_315ff. V3_314A v3_314a. V3_315A v3_315a.
         V3_314B v3_314b. V3_315B v3_315b. V3_314C v3_314c.
         V3_315C v3_315c. V3_314D v3_314d. V3_315D v3_315d.
         V3_314E v3_314e. V3_315E v3_315e. V3_316 v3_316ff.
         V3_317 v3_317ff. V3_316A v3_316a. V3_317A v3_317a.
         V3_316B v3_316b. V3_317B v3_317b. V3_316C v3_316c.
         V3_317C v3_317c. V3_316D v3_316d. V3_317D v3_317d.
         V3_404 v3_404ff. V3_406 v3_406ff. V3_407 v3_407ff.
         V3_501 v3_501ff. V3_502 v3_502ff. V3_501A v3_501a.
         V3_502A v3_502a. V3_503A v3_503a. V3_503B v3_503b.
         V3_503C v3_503c. V3_503D v3_503d. V3_504A v3_504a.
         V3_504B v3_504b. V3_504C v3_504c. V3_504D v3_504d.
         V3_505 v3_505ff. V3_506 v3_506ff. V3_505A v3_505a.
         V3_506A v3_506a. V3_505B v3_505b. V3_506B v3_506b.
         V3_507 v3_507ff. V3_507A v3_507a. V3_601B v3_601b.
         V3_602B v3_602b. V3_603 v3_603ff. V3_603A v3_603a.
         V3_701 v3_701ff. V3_702 v3_702ff. V3_701B v3_701b.
         V3_702B v3_702b. V3_703 v3_703ff. V3_704 v3_704ff.
         V3_705 v3_705ff.  ;
*/

RUN ;
