/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 36790
 |          UNIFORM CRIME REPORTING PROGRAM DATA: SUPPLEMENTARY
 |                         HOMICIDE REPORTS, 2015
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
 | "c:\temp\36790-0001-data.txt").
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
VALUE v27fffff  11='(11) Firearm, type not stated'
                12='(12) Handgun - pistol, revolver, etc' 13='(13) Rifle' 14='(14) Shotgun'
                15='(15) Other gun' 20='(20) Knife or cutting instrument'
                30='(30) Blunt object - hammer, club, etc' 40='(40) Personal weapons, includes beating'
                50='(50) Poison - does not include gas' 55='(55) Pushed or thrown out window'
                60='(60) Explosives' 65='(65) Fire' 70='(70) Narcotics or drugs, sleeping pills'
                75='(75) Drowning' 80='(80) Strangulation - hanging'
                85='(85) Asphyxiation - includes death by gas' 90='(90) Other or type unknown';
VALUE v1ffffff  6='(6) SHR master file';
VALUE $v20fffff  'F'='(F) Female' 'M'='(M) Male' 'U'='(U) Unknown';
VALUE v5ffffff  0='(0) Possessions' 1='(1) New England States'
                2='(2) Middle Atlantic States' 3='(3) East North Central States'
                4='(4) West North Central States' 5='(5) South Atlantic States'
                6='(6) East South Central States' 7='(7) West South Central States'
                8='(8) Mountain States' 9='(9) Pacific States';
VALUE $v19fffff  '00'='(00) Unknown' '1'='(1) 1 year old' '99'='(99) 99 years old or more'
                'BB'='(BB) 7 days old to 364 days old' 'NB'='(NB) Birth to 6 days old';
VALUE v13fffff  1='(01) January' 2='(02) February' 3='(03) March' 4='(04) April'
                5='(05) May' 6='(06) June' 7='(07) July' 8='(08) August' 9='(09) September'
                10='(10) October' 11='(11) November' 12='(12) December';
VALUE $v26fffff  'H'='(H) Hispanic or Latino' 'N'='(N) Not Hispanic or Latino'
                'U'='(U) Unknown';
VALUE $v23fffff  '0'='(0) Unknown' '1'='(1) 1 year old' '99'='(99) 99 years old or more'
                'BB'='(BB) 7 days old to 364 days old' 'NB'='(NB) birth to 6 days old';
VALUE v10fffff  0='(0) Non-suburban' 1='(1) Suburban';
VALUE $v21fffff  'A'='(A) Asian' 'B'='(B) Black or African American'
                'I'='(I) American Indian or Alaska Native'
                'P'='(P) Native Hawaiian or Other Pacific Islander' 'U'='(U) Unknown' 'W'='(W) White';
VALUE v29fffff  2='(02) Rape' 3='(03) Robbery' 5='(05) Burglary' 6='(06) Larceny'
                7='(07) Motor vehicle theft' 9='(09) Arson'
                10='(10) Prostitution and commercialized vice' 17='(17) Other sex offense'
                18='(18) Narcotic drug laws' 19='(19) Gambling' 26='(26) Other - not specified'
                32='(32) Abortion' 40='(40) Lovers triangle' 41='(41) Child killed by babysitter'
                42='(42) Brawl due to influence of alcohol' 43='(43) Brawl due to influence of narcotics'
                44='(44) Argument over money or property' 45='(45) Other arguments'
                46='(46) Gangland killings' 47='(47) Juvenile gang killings'
                48='(48) Institutional killings' 49='(49) Sniper attack'
                50='(50) Victim shot in hunting accident' 51='(51) Gun-cleaning death - other than self'
                52='(52) Children playing with gun' 53='(53) Other negligent handling of gun'
                59='(59) All other manslaughter by negligence' 60='(60) Other'
                70='(70) All suspected felony type' 80='(80) Felon killed by private citizen'
                81='(81) Felon killed by police' 99='(99) Circumstances undetermined';
VALUE v15fffff  0='(0) Normal update' 1='(1) Adjustment';
VALUE $v28fffff  'AQ'='(AQ) Acquaintance' 'BF'='(BF) Boyfriend' 'BR'='(BR) Brother'
                'CH'='(CH) Common-law husband' 'CW'='(CW) Common-law wife' 'DA'='(DA) Daughter'
                'EE'='(EE) Employee' 'ER'='(ER) Employer' 'FA'='(FA) Father' 'FR'='(FR) Friend'
                'GF'='(GF) Girlfriend' 'HO'='(HO) Homosexual relationship' 'HU'='(HU) Husband'
                'IL'='(IL) In-law' 'MO'='(MO) Mother' 'NE'='(NE) Neighbor' 'OF'='(OF) Other family'
                'OK'='(OK) Other - known to victim' 'SD'='(SD) Stepdaughter' 'SF'='(SF) Stepfather'
                'SI'='(SI) Sister' 'SM'='(SM) Stepmother' 'SO'='(SO) Son' 'SS'='(SS) Stepson'
                'ST'='(ST) Stranger' 'UN'='(UN) Relationship not determined' 'WI'='(WI) Wife'
                'XH'='(XH) Ex-husband' 'XW'='(XW) Ex-wife';
VALUE $v16fffff  'A'='(A) Murder and non-negligent manslaughter'
                'B'='(B) Manslaughter by negligence';
VALUE $v22fffff  'H'='(H) Hispanic or Latino' 'N'='(N) Not Hispanic or Latino'
                'U'='(U) Unknown or not reported';
VALUE v81fffff  0='(00) Unknown' 1='(01) 1 year old' 99='(99) 99 years old or more';
VALUE v2ffffff  1='(01) Alabama' 2='(02) Arizona' 3='(03) Arkansas' 4='(04) California'
                5='(05) Colorado' 6='(06) Connecticut' 7='(07) Delaware' 8='(08) Washington, D.C'
                9='(09) Florida' 10='(10) Georgia' 11='(11) Idaho' 12='(12) Illinois' 13='(13) Indiana'
                14='(14) Iowa' 15='(15) Kansas' 16='(16) Kentucky' 17='(17) Louisiana' 18='(18) Maine'
                19='(19) Maryland' 20='(20) Massachusetts' 21='(21) Michigan' 22='(22) Minnesota'
                23='(23) Mississippi' 24='(24) Missouri' 25='(25) Montana' 26='(26) Nebraska'
                27='(27) Nevada' 28='(28) New Hampshire' 29='(29) New Jersey' 30='(30) New Mexico'
                31='(31) New York' 32='(32) North Carolina' 33='(33) North Dakota' 34='(34) Ohio'
                35='(35) Oklahoma' 36='(36) Oregon' 37='(37) Pennsylvania' 38='(38) Rhode Island'
                39='(39) South Carolina' 40='(40) South Dakota' 41='(41) Tennessee' 42='(42) Texas'
                43='(43) Utah' 44='(44) Vermont' 45='(45) Virginia' 46='(46) Washington'
                47='(47) West Virginia' 48='(48) Wisconsin' 49='(49) Wyoming' 50='(50) Alaska'
                51='(51) Hawaii' 52='(52) Canal Zone' 53='(53) Puerto Rico' 54='(54) American Samoa'
                55='(55) Guam' 62='(62) Virgin Islands';
VALUE $v18fffff  'A'='(A) Single victim/single offender'
                'B'='(B) Single victim/unknown offender(s)' 'C'='(C) Single victim/multiple offenders'
                'D'='(D) Multiple victims/single offender' 'E'='(E) Multiple victims/multiple offenders'
                'F'='(F) Multiple victims/unknown offender(s)';
VALUE $v30fffff  'A'='(A) Felon attacked police officer'
                'B'='(B) Felon attacked fellow police officer' 'C'='(C) Felon attacked a civilian'
                'D'='(D) Felon attempted flight from a crime'
                'E'='(E) Felon killed in commission of a crime' 'F'='(F) Felon resisted arrest'
                'G'='(G) Not enough information to determine';
VALUE $v4ffffff  '0'='(0) Possessions' '1'='(1) ALL cit 250,000 +'
                '1A'='(1A) Cit 1,000,000 +' '1B'='(1B) Cit 500,000-999,999'
                '1C'='(1C) Cit 250,000-499,999' '2'='(2) Cit 100,000-249,999' '3'='(3) Cit 50,000-99,999'
                '4'='(4) Cit 25,000-49,999' '5'='(5) Cit 10,000-24,999' '6'='(6) Cit 2,500-9,999'
                '7'='(7) Cit < 2,500' '8'='(8) Non-MSA co.' '8A'='(8A) Non-MSA co. 100,000 +'
                '8B'='(8B) Non-MSA co. 25,000-99,999' '8C'='(8C) Non-MSA co. 10,000-24,999'
                '8D'='(8D) Non-MSA co. < 10,000' '8E'='(8E) Non-MSA St Police' '9'='(9) MSA counties'
                '9A'='(9A) MSA co. 100,000 +' '9B'='(9B) MSA co. 25,000-99,999'
                '9C'='(9C) MSA co. 10,000-24,999' '9D'='(9D) MSA co. < 10,000' '9E'='(9E) MSA St Police';
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA;
INFILE "data-filename" LRECL=270;
INPUT
       V1 1                    V2 2-3
        V3 $4-10                V4 $11-12               V5 13
        V6 14-17                V7 18-26                V8 27-29
        V9 30-32                V10 33                  V11 $34-57
        V12 $58-63              V13 64-65               V14 66-71
        V15 72                  V16 $73                 V17 74-76
        V18 $77                 V19 $78-79              V20 $80
        V21 $81                 V22 $82                 V23 $83-84
        V24 $85                 V25 $86                 V26 $87
        V27 88-89               V28 $90-91              V29 92-93
        V30 $94                 V31 95-97               V32 98-100
        V33 $101-102            V34 $103                V35 $104
        V36 $105                V37 $106-107            V38 $108
        V39 $109                V40 $110                V41 $111-112
        V42 $113                V43 $114                V44 $115
        V45 $116-117            V46 $118                V47 $119
        V48 $120                V49 $121-122            V50 $123
        V51 $124                V52 $125                V53 $126-127
        V54 $128                V55 $129                V56 $130
        V57 $131-132            V58 $133                V59 $134
        V60 $135                V61 $136-137            V62 $138
        V63 $139                V64 $140                V65 $141-142
        V66 $143                V67 $144                V68 $145
        V69 $146-147            V70 $148                V71 $149
        V72 $150                V73 $151-152            V74 $153
        V75 $154                V76 $155                V77 156-157
        V78 $158-159            V79 160-161             V80 $162
        V81 163-164             V82 $165                V83 $166
        V84 $167                V85 168-169             V86 $170-171
        V87 172-173             V88 $174                V89 175-176
        V90 $177                V91 $178                V92 $179
        V93 180-181             V94 $182-183            V95 184-185
        V96 $186                V97 187-188             V98 $189
        V99 $190                V100 $191               V101 192-193
        V102 $194-195           V103 196-197            V104 $198
        V105 199-200            V106 $201               V107 $202
        V108 $203               V109 204-205            V110 $206-207
        V111 208-209            V112 $210               V113 211-212
        V114 $213               V115 $214               V116 $215
        V117 216-217            V118 $218-219           V119 220-221
        V120 $222               V121 223-224            V122 $225
        V123 $226               V124 $227               V125 228-229
        V126 $230-231           V127 232-233            V128 $234
        V129 235-236            V130 $237               V131 $238
        V132 $239               V133 240-241            V134 $242-243
        V135 244-245            V136 $246               V137 247-248
        V138 $249               V139 $250               V140 $251
        V141 252-253            V142 $254-255           V143 256-257
        V144 $258               V145 259-260            V146 $261
        V147 $262               V148 $263               V149 264-265
        V150 $266-267           V151 268-269            V152 $270
        ;


* SAS LABEL STATEMENT;

LABEL 
   V1      = 'IDENTIFIER CODE' 
   V2      = 'NUMERIC STATE CODE' 
   V3      = 'ORI CODE' 
   V4      = 'GROUP' 
   V5      = 'GEOGRAPHIC DIVISION' 
   V6      = 'YEAR' 
   V7      = 'POPULATION' 
   V8      = 'COUNTY' 
   V9      = 'MSA CODE' 
   V10     = 'MSA INDICATION' 
   V11     = 'AGENCY NAME' 
   V12     = 'STATE NAME' 
   V13     = 'MONTH OF OFFENSE' 
   V14     = 'LAST UPDATE' 
   V15     = 'TYPE OF ACTION' 
   V16     = 'TYPE OF OFFENSE:HOMICIDE' 
   V17     = 'INCIDENT NUMBER' 
   V18     = 'SITUATION' 
   V19     = 'VICTIM 1: AGE' 
   V20     = 'VICTIM 1: SEX' 
   V21     = 'VICTIM 1: RACE' 
   V22     = 'VICTIM 1: ETHNIC ORIGIN' 
   V23     = 'OFFENDER 1: AGE' 
   V24     = 'OFFENDER 1: SEX' 
   V25     = 'OFFENDER 1: RACE' 
   V26     = 'OFFENDER 1: ETHNIC ORIGIN' 
   V27     = 'OFFENDER 1: WEAPON' 
   V28     = 'OFFENDER 1: RELATIONSHIP TO FIRST VICTIM' 
   V29     = 'OFFENDER 1: CIRCUMSTANCE' 
   V30     = 'OFFENDER 1: SUB-CIRCUMSTANCE' 
   V31     = 'ADDITIONAL VICTIM COUNT' 
   V32     = 'ADDITIONAL OFFENDER COUNT' 
   V33     = 'VICTIM 2: AGE' 
   V34     = 'VICTIM 2: SEX' 
   V35     = 'VICTIM 2: RACE' 
   V36     = 'VICTIM 2: ETHNIC ORIGIN' 
   V37     = 'VICTIM 3: AGE' 
   V38     = 'VICTIM 3: SEX' 
   V39     = 'VICTIM 3: RACE' 
   V40     = 'VICTIM 3: ETHNIC ORIGIN' 
   V41     = 'VICTIM 4: AGE' 
   V42     = 'VICTIM 4: SEX' 
   V43     = 'VICTIM 4: RACE' 
   V44     = 'VICTIM 4: ETHNIC ORIGIN' 
   V45     = 'VICTIM 5: AGE' 
   V46     = 'VICTIM 5: SEX' 
   V47     = 'VICTIM 5: RACE' 
   V48     = 'VICTIM 5: ETHNIC ORIGIN' 
   V49     = 'VICTIM 6: AGE' 
   V50     = 'VICTIM 6: SEX' 
   V51     = 'VICTIM 6: RACE' 
   V52     = 'VICTIM 6: ETHNIC ORIGIN' 
   V53     = 'VICTIM 7: AGE' 
   V54     = 'VICTIM 7: SEX' 
   V55     = 'VICTIM 7: RACE' 
   V56     = 'VICTIM 7: ETHNIC ORIGIN' 
   V57     = 'VICTIM 8: AGE' 
   V58     = 'VICTIM 8: SEX' 
   V59     = 'VICTIM 8: RACE' 
   V60     = 'VICTIM 8: ETHNIC ORIGIN' 
   V61     = 'VICTIM 9: AGE' 
   V62     = 'VICTIM 9: SEX' 
   V63     = 'VICTIM 9: RACE' 
   V64     = 'VICTIM 9: ETHNIC ORIGIN' 
   V65     = 'VICTIM 10: AGE' 
   V66     = 'VICTIM 10: SEX' 
   V67     = 'VICTIM 10: RACE' 
   V68     = 'VICTIM 10: ETHNIC ORIGIN' 
   V69     = 'VICTIM 11: AGE' 
   V70     = 'VICTIM 11: SEX' 
   V71     = 'VICTIM 11: RACE' 
   V72     = 'VICTIM 11: ETHNIC ORIGIN' 
   V73     = 'OFFENDER 2: AGE' 
   V74     = 'OFFENDER 2: SEX' 
   V75     = 'OFFENDER 2: RACE' 
   V76     = 'OFFENDER 2: ETHNIC ORIGIN' 
   V77     = 'OFFENDER 2: WEAPON' 
   V78     = 'OFFENDER 2: RELATIONSHIP TO FIRST VICTIM' 
   V79     = 'OFFENDER 2: CIRCUMSTANCE' 
   V80     = 'OFFENDER 2: SUB-CIRCUMSTANCE' 
   V81     = 'OFFENDER 3: AGE' 
   V82     = 'OFFENDER 3: SEX' 
   V83     = 'OFFENDER 3: RACE' 
   V84     = 'OFFENDER 3: ETHNIC ORIGIN' 
   V85     = 'OFFENDER 3: WEAPON' 
   V86     = 'OFFENDER 3: RELATIONSHIP TO FIRST VICTIM' 
   V87     = 'OFFENDER 3: CIRCUMSTANCE' 
   V88     = 'OFFENDER 3: SUB-CIRCUMSTANCE' 
   V89     = 'OFFENDER 4: AGE' 
   V90     = 'OFFENDER 4: SEX' 
   V91     = 'OFFENDER 4: RACE' 
   V92     = 'OFFENDER 4: ETHNIC ORIGIN' 
   V93     = 'OFFENDER 4: WEAPON' 
   V94     = 'OFFENDER 4: RELATIONSHIP TO FIRST VICTIM' 
   V95     = 'OFFENDER 4: CIRCUMSTANCE' 
   V96     = 'OFFENDER 4: SUB-CIRCUMSTANCE' 
   V97     = 'OFFENDER 5: AGE' 
   V98     = 'OFFENDER 5: SEX' 
   V99     = 'OFFENDER 5: RACE' 
   V100    = 'OFFENDER 5: ETHNIC ORIGIN' 
   V101    = 'OFFENDER 5: WEAPON' 
   V102    = 'OFFENDER 5: RELATIONSHIP TO FIRST VICTIM' 
   V103    = 'OFFENDER 5: CIRCUMSTANCE' 
   V104    = 'OFFENDER 5: SUB-CIRCUMSTANCE' 
   V105    = 'OFFENDER 6: AGE' 
   V106    = 'OFFENDER 6: SEX' 
   V107    = 'OFFENDER 6: RACE' 
   V108    = 'OFFENDER 6: ETHNIC ORIGIN' 
   V109    = 'OFFENDER 6: WEAPON' 
   V110    = 'OFFENDER 6: RELATIONSHIP TO FIRST VICTIM' 
   V111    = 'OFFENDER 6: CIRCUMSTANCE' 
   V112    = 'OFFENDER 6: SUB-CIRCUMSTANCE' 
   V113    = 'OFFENDER 7: AGE' 
   V114    = 'OFFENDER 7: SEX' 
   V115    = 'OFFENDER 7: RACE' 
   V116    = 'OFFENDER 7: ETHNIC ORIGIN' 
   V117    = 'OFFENDER 7: WEAPON' 
   V118    = 'OFFENDER 7: RELATIONSHIP TO FIRST VICTIM' 
   V119    = 'OFFENDER 7: CIRCUMSTANCE' 
   V120    = 'OFFENDER 7: SUB-CIRCUMSTANCE' 
   V121    = 'OFFENDER 8: AGE' 
   V122    = 'OFFENDER 8: SEX' 
   V123    = 'OFFENDER 8: RACE' 
   V124    = 'OFFENDER 8: ETHNIC ORIGIN' 
   V125    = 'OFFENDER 8: WEAPON' 
   V126    = 'OFFENDER 8: RELATIONSHIP TO FIRST VICTIM' 
   V127    = 'OFFENDER 8: CIRCUMSTANCE' 
   V128    = 'OFFENDER 8: SUB-CIRCUMSTANCE' 
   V129    = 'OFFENDER 9: AGE' 
   V130    = 'OFFENDER 9: SEX' 
   V131    = 'OFFENDER 9: RACE' 
   V132    = 'OFFENDER 9: ETHNIC ORIGIN' 
   V133    = 'OFFENDER 9: WEAPON' 
   V134    = 'OFFENDER 9: RELATIONSHIP TO FIRST VICTIM' 
   V135    = 'OFFENDER 9: CIRCUMSTANCE' 
   V136    = 'OFFENDER 9: SUB-CIRCUMSTANCE' 
   V137    = 'OFFENDER 10: AGE' 
   V138    = 'OFFENDER 10: SEX' 
   V139    = 'OFFENDER 10: RACE' 
   V140    = 'OFFENDER 10: ETHNIC ORIGIN' 
   V141    = 'OFFENDER 10: WEAPON' 
   V142    = 'OFFENDER 10: RELATIONSHIP TO FIRST VICTIM' 
   V143    = 'OFFENDER 10: CIRCUMSTANCE' 
   V144    = 'OFFENDER 10: SUB-CIRCUMSTANCE' 
   V145    = 'OFFENDER 11: AGE' 
   V146    = 'OFFENDER 11: SEX' 
   V147    = 'OFFENDER 11: RACE' 
   V148    = 'OFFENDER 11: ETHNIC ORIGIN' 
   V149    = 'OFFENDER 11: WEAPON' 
   V150    = 'OFFENDER 11: RELATIONSHIP TO FIRST VICTIM' 
   V151    = 'OFFENDER 11: CIRCUMSTANCE' 
   V152    = 'OFFENDER 11: SUB-CIRCUMSTANCE' 
        ; 


* SAS FORMAT STATEMENT;

/*
   FORMAT
         V1 v1ffffff. V10 v10fffff. V100 $v22fffff.
         V101 v27fffff. V102 $v28fffff. V103 v29fffff.
         V104 $v30fffff. V105 v81fffff. V106 $v20fffff.
         V107 $v21fffff. V108 $v22fffff. V109 v27fffff.
         V110 $v28fffff. V111 v29fffff. V112 $v30fffff.
         V113 v81fffff. V114 $v20fffff. V115 $v21fffff.
         V116 $v22fffff. V117 v27fffff. V118 $v28fffff.
         V119 v29fffff. V120 $v30fffff. V121 v81fffff.
         V122 $v20fffff. V123 $v21fffff. V124 $v22fffff.
         V125 v27fffff. V126 $v28fffff. V127 v29fffff.
         V128 $v30fffff. V129 v81fffff. V13 v13fffff.
         V130 $v20fffff. V131 $v21fffff. V132 $v22fffff.
         V133 v27fffff. V134 $v28fffff. V135 v29fffff.
         V136 $v30fffff. V137 v81fffff. V138 $v20fffff.
         V139 $v21fffff. V140 $v22fffff. V141 v27fffff.
         V142 $v28fffff. V143 v29fffff. V144 $v30fffff.
         V145 v81fffff. V146 $v20fffff. V147 $v21fffff.
         V148 $v22fffff. V149 v27fffff. V15 v15fffff.
         V150 $v28fffff. V151 v29fffff. V152 $v30fffff.
         V16 $v16fffff. V18 $v18fffff. V19 $v19fffff.
         V2 v2ffffff. V20 $v20fffff. V21 $v21fffff.
         V22 $v22fffff. V23 $v23fffff. V24 $v20fffff.
         V25 $v21fffff. V26 $v26fffff. V27 v27fffff.
         V28 $v28fffff. V29 v29fffff. V30 $v30fffff.
         V33 $v19fffff. V34 $v20fffff. V35 $v21fffff.
         V36 $v22fffff. V37 $v19fffff. V38 $v20fffff.
         V39 $v21fffff. V4 $v4ffffff. V40 $v22fffff.
         V41 $v19fffff. V42 $v20fffff. V43 $v21fffff.
         V44 $v22fffff. V45 $v19fffff. V46 $v20fffff.
         V47 $v21fffff. V48 $v22fffff. V49 $v19fffff.
         V5 v5ffffff. V50 $v20fffff. V51 $v21fffff.
         V52 $v22fffff. V53 $v19fffff. V54 $v20fffff.
         V55 $v21fffff. V56 $v22fffff. V57 $v19fffff.
         V58 $v20fffff. V59 $v21fffff. V60 $v22fffff.
         V61 $v19fffff. V62 $v20fffff. V63 $v21fffff.
         V64 $v22fffff. V65 $v19fffff. V66 $v20fffff.
         V67 $v21fffff. V68 $v22fffff. V69 $v19fffff.
         V70 $v20fffff. V71 $v21fffff. V72 $v22fffff.
         V73 $v23fffff. V74 $v20fffff. V75 $v21fffff.
         V76 $v22fffff. V77 v27fffff. V78 $v28fffff.
         V79 v29fffff. V80 $v30fffff. V81 v81fffff.
         V82 $v20fffff. V83 $v21fffff. V84 $v22fffff.
         V85 v27fffff. V86 $v28fffff. V87 v29fffff.
         V88 $v30fffff. V89 v81fffff. V90 $v20fffff.
         V91 $v21fffff. V92 $v22fffff. V93 v27fffff.
         V94 $v28fffff. V95 v29fffff. V96 $v30fffff.
         V97 v81fffff. V98 $v20fffff. V99 $v21fffff.
    ;
*/

RUN ;
