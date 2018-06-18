*-------------------------------------------------------------------------*
*                                                                          
*                     SPSS SETUP FILE FOR ICPSR 36790
*           UNIFORM CRIME REPORTING PROGRAM DATA: SUPPLEMENTARY
*                          HOMICIDE REPORTS, 2015
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
*  data file is physically located (e.g., "c:\temp\36790-0001-data.txt").
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
*  will be saved (e.g., SAVE OUTFILE="c:\spsswin\data\da36790-0001.sav").
*
*-------------------------------------------------------------------------.

* SPSS FILE HANDLE AND DATA LIST COMMANDS.

FILE HANDLE DATA / NAME="data-filename" LRECL=270.
DATA LIST FILE=DATA /
                    V1 1                  V2 2-3
             V3 4-10 (A)            V4 11-12 (A)                   V5 13
                V6 14-17                V7 18-26                V8 27-29
                V9 30-32                  V10 33           V11 34-57 (A)
           V12 58-63 (A)               V13 64-65               V14 66-71
                  V15 72              V16 73 (A)               V17 74-76
              V18 77 (A)           V19 78-79 (A)              V20 80 (A)
              V21 81 (A)              V22 82 (A)           V23 83-84 (A)
              V24 85 (A)              V25 86 (A)              V26 87 (A)
               V27 88-89           V28 90-91 (A)               V29 92-93
              V30 94 (A)               V31 95-97              V32 98-100
         V33 101-102 (A)             V34 103 (A)             V35 104 (A)
             V36 105 (A)         V37 106-107 (A)             V38 108 (A)
             V39 109 (A)             V40 110 (A)         V41 111-112 (A)
             V42 113 (A)             V43 114 (A)             V44 115 (A)
         V45 116-117 (A)             V46 118 (A)             V47 119 (A)
             V48 120 (A)         V49 121-122 (A)             V50 123 (A)
             V51 124 (A)             V52 125 (A)         V53 126-127 (A)
             V54 128 (A)             V55 129 (A)             V56 130 (A)
         V57 131-132 (A)             V58 133 (A)             V59 134 (A)
             V60 135 (A)         V61 136-137 (A)             V62 138 (A)
             V63 139 (A)             V64 140 (A)         V65 141-142 (A)
             V66 143 (A)             V67 144 (A)             V68 145 (A)
         V69 146-147 (A)             V70 148 (A)             V71 149 (A)
             V72 150 (A)         V73 151-152 (A)             V74 153 (A)
             V75 154 (A)             V76 155 (A)             V77 156-157
         V78 158-159 (A)             V79 160-161             V80 162 (A)
             V81 163-164             V82 165 (A)             V83 166 (A)
             V84 167 (A)             V85 168-169         V86 170-171 (A)
             V87 172-173             V88 174 (A)             V89 175-176
             V90 177 (A)             V91 178 (A)             V92 179 (A)
             V93 180-181         V94 182-183 (A)             V95 184-185
             V96 186 (A)             V97 187-188             V98 189 (A)
             V99 190 (A)            V100 191 (A)            V101 192-193
        V102 194-195 (A)            V103 196-197            V104 198 (A)
            V105 199-200            V106 201 (A)            V107 202 (A)
            V108 203 (A)            V109 204-205        V110 206-207 (A)
            V111 208-209            V112 210 (A)            V113 211-212
            V114 213 (A)            V115 214 (A)            V116 215 (A)
            V117 216-217        V118 218-219 (A)            V119 220-221
            V120 222 (A)            V121 223-224            V122 225 (A)
            V123 226 (A)            V124 227 (A)            V125 228-229
        V126 230-231 (A)            V127 232-233            V128 234 (A)
            V129 235-236            V130 237 (A)            V131 238 (A)
            V132 239 (A)            V133 240-241        V134 242-243 (A)
            V135 244-245            V136 246 (A)            V137 247-248
            V138 249 (A)            V139 250 (A)            V140 251 (A)
            V141 252-253        V142 254-255 (A)            V143 256-257
            V144 258 (A)            V145 259-260            V146 261 (A)
            V147 262 (A)            V148 263 (A)            V149 264-265
        V150 266-267 (A)            V151 268-269            V152 270 (A)
   .

* SPSS VARIABLE LABELS COMMAND

VARIABLE LABELS
   V1        'IDENTIFIER CODE' /
   V2        'NUMERIC STATE CODE' /
   V3        'ORI CODE' /
   V4        'GROUP' /
   V5        'GEOGRAPHIC DIVISION' /
   V6        'YEAR' /
   V7        'POPULATION' /
   V8        'COUNTY' /
   V9        'MSA CODE' /
   V10       'MSA INDICATION' /
   V11       'AGENCY NAME' /
   V12       'STATE NAME' /
   V13       'MONTH OF OFFENSE' /
   V14       'LAST UPDATE' /
   V15       'TYPE OF ACTION' /
   V16       'TYPE OF OFFENSE:HOMICIDE' /
   V17       'INCIDENT NUMBER' /
   V18       'SITUATION' /
   V19       'VICTIM 1: AGE' /
   V20       'VICTIM 1: SEX' /
   V21       'VICTIM 1: RACE' /
   V22       'VICTIM 1: ETHNIC ORIGIN' /
   V23       'OFFENDER 1: AGE' /
   V24       'OFFENDER 1: SEX' /
   V25       'OFFENDER 1: RACE' /
   V26       'OFFENDER 1: ETHNIC ORIGIN' /
   V27       'OFFENDER 1: WEAPON' /
   V28       'OFFENDER 1: RELATIONSHIP TO FIRST VICTIM' /
   V29       'OFFENDER 1: CIRCUMSTANCE' /
   V30       'OFFENDER 1: SUB-CIRCUMSTANCE' /
   V31       'ADDITIONAL VICTIM COUNT' /
   V32       'ADDITIONAL OFFENDER COUNT' /
   V33       'VICTIM 2: AGE' /
   V34       'VICTIM 2: SEX' /
   V35       'VICTIM 2: RACE' /
   V36       'VICTIM 2: ETHNIC ORIGIN' /
   V37       'VICTIM 3: AGE' /
   V38       'VICTIM 3: SEX' /
   V39       'VICTIM 3: RACE' /
   V40       'VICTIM 3: ETHNIC ORIGIN' /
   V41       'VICTIM 4: AGE' /
   V42       'VICTIM 4: SEX' /
   V43       'VICTIM 4: RACE' /
   V44       'VICTIM 4: ETHNIC ORIGIN' /
   V45       'VICTIM 5: AGE' /
   V46       'VICTIM 5: SEX' /
   V47       'VICTIM 5: RACE' /
   V48       'VICTIM 5: ETHNIC ORIGIN' /
   V49       'VICTIM 6: AGE' /
   V50       'VICTIM 6: SEX' /
   V51       'VICTIM 6: RACE' /
   V52       'VICTIM 6: ETHNIC ORIGIN' /
   V53       'VICTIM 7: AGE' /
   V54       'VICTIM 7: SEX' /
   V55       'VICTIM 7: RACE' /
   V56       'VICTIM 7: ETHNIC ORIGIN' /
   V57       'VICTIM 8: AGE' /
   V58       'VICTIM 8: SEX' /
   V59       'VICTIM 8: RACE' /
   V60       'VICTIM 8: ETHNIC ORIGIN' /
   V61       'VICTIM 9: AGE' /
   V62       'VICTIM 9: SEX' /
   V63       'VICTIM 9: RACE' /
   V64       'VICTIM 9: ETHNIC ORIGIN' /
   V65       'VICTIM 10: AGE' /
   V66       'VICTIM 10: SEX' /
   V67       'VICTIM 10: RACE' /
   V68       'VICTIM 10: ETHNIC ORIGIN' /
   V69       'VICTIM 11: AGE' /
   V70       'VICTIM 11: SEX' /
   V71       'VICTIM 11: RACE' /
   V72       'VICTIM 11: ETHNIC ORIGIN' /
   V73       'OFFENDER 2: AGE' /
   V74       'OFFENDER 2: SEX' /
   V75       'OFFENDER 2: RACE' /
   V76       'OFFENDER 2: ETHNIC ORIGIN' /
   V77       'OFFENDER 2: WEAPON' /
   V78       'OFFENDER 2: RELATIONSHIP TO FIRST VICTIM' /
   V79       'OFFENDER 2: CIRCUMSTANCE' /
   V80       'OFFENDER 2: SUB-CIRCUMSTANCE' /
   V81       'OFFENDER 3: AGE' /
   V82       'OFFENDER 3: SEX' /
   V83       'OFFENDER 3: RACE' /
   V84       'OFFENDER 3: ETHNIC ORIGIN' /
   V85       'OFFENDER 3: WEAPON' /
   V86       'OFFENDER 3: RELATIONSHIP TO FIRST VICTIM' /
   V87       'OFFENDER 3: CIRCUMSTANCE' /
   V88       'OFFENDER 3: SUB-CIRCUMSTANCE' /
   V89       'OFFENDER 4: AGE' /
   V90       'OFFENDER 4: SEX' /
   V91       'OFFENDER 4: RACE' /
   V92       'OFFENDER 4: ETHNIC ORIGIN' /
   V93       'OFFENDER 4: WEAPON' /
   V94       'OFFENDER 4: RELATIONSHIP TO FIRST VICTIM' /
   V95       'OFFENDER 4: CIRCUMSTANCE' /
   V96       'OFFENDER 4: SUB-CIRCUMSTANCE' /
   V97       'OFFENDER 5: AGE' /
   V98       'OFFENDER 5: SEX' /
   V99       'OFFENDER 5: RACE' /
   V100      'OFFENDER 5: ETHNIC ORIGIN' /
   V101      'OFFENDER 5: WEAPON' /
   V102      'OFFENDER 5: RELATIONSHIP TO FIRST VICTIM' /
   V103      'OFFENDER 5: CIRCUMSTANCE' /
   V104      'OFFENDER 5: SUB-CIRCUMSTANCE' /
   V105      'OFFENDER 6: AGE' /
   V106      'OFFENDER 6: SEX' /
   V107      'OFFENDER 6: RACE' /
   V108      'OFFENDER 6: ETHNIC ORIGIN' /
   V109      'OFFENDER 6: WEAPON' /
   V110      'OFFENDER 6: RELATIONSHIP TO FIRST VICTIM' /
   V111      'OFFENDER 6: CIRCUMSTANCE' /
   V112      'OFFENDER 6: SUB-CIRCUMSTANCE' /
   V113      'OFFENDER 7: AGE' /
   V114      'OFFENDER 7: SEX' /
   V115      'OFFENDER 7: RACE' /
   V116      'OFFENDER 7: ETHNIC ORIGIN' /
   V117      'OFFENDER 7: WEAPON' /
   V118      'OFFENDER 7: RELATIONSHIP TO FIRST VICTIM' /
   V119      'OFFENDER 7: CIRCUMSTANCE' /
   V120      'OFFENDER 7: SUB-CIRCUMSTANCE' /
   V121      'OFFENDER 8: AGE' /
   V122      'OFFENDER 8: SEX' /
   V123      'OFFENDER 8: RACE' /
   V124      'OFFENDER 8: ETHNIC ORIGIN' /
   V125      'OFFENDER 8: WEAPON' /
   V126      'OFFENDER 8: RELATIONSHIP TO FIRST VICTIM' /
   V127      'OFFENDER 8: CIRCUMSTANCE' /
   V128      'OFFENDER 8: SUB-CIRCUMSTANCE' /
   V129      'OFFENDER 9: AGE' /
   V130      'OFFENDER 9: SEX' /
   V131      'OFFENDER 9: RACE' /
   V132      'OFFENDER 9: ETHNIC ORIGIN' /
   V133      'OFFENDER 9: WEAPON' /
   V134      'OFFENDER 9: RELATIONSHIP TO FIRST VICTIM' /
   V135      'OFFENDER 9: CIRCUMSTANCE' /
   V136      'OFFENDER 9: SUB-CIRCUMSTANCE' /
   V137      'OFFENDER 10: AGE' /
   V138      'OFFENDER 10: SEX' /
   V139      'OFFENDER 10: RACE' /
   V140      'OFFENDER 10: ETHNIC ORIGIN' /
   V141      'OFFENDER 10: WEAPON' /
   V142      'OFFENDER 10: RELATIONSHIP TO FIRST VICTIM' /
   V143      'OFFENDER 10: CIRCUMSTANCE' /
   V144      'OFFENDER 10: SUB-CIRCUMSTANCE' /
   V145      'OFFENDER 11: AGE' /
   V146      'OFFENDER 11: SEX' /
   V147      'OFFENDER 11: RACE' /
   V148      'OFFENDER 11: ETHNIC ORIGIN' /
   V149      'OFFENDER 11: WEAPON' /
   V150      'OFFENDER 11: RELATIONSHIP TO FIRST VICTIM' /
   V151      'OFFENDER 11: CIRCUMSTANCE' /
   V152      'OFFENDER 11: SUB-CIRCUMSTANCE' /
   .


* SPSS VALUE LABELS COMMAND.

VALUE LABELS
   V1        6 'SHR master file' /
   V2        1 'Alabama' 2 'Arizona' 3 'Arkansas' 4 'California' 5 'Colorado'
             6 'Connecticut' 7 'Delaware' 8 'Washington, D.C' 9 'Florida'
             10 'Georgia' 11 'Idaho' 12 'Illinois' 13 'Indiana' 14 'Iowa'
             15 'Kansas' 16 'Kentucky' 17 'Louisiana' 18 'Maine'
             19 'Maryland' 20 'Massachusetts' 21 'Michigan' 22 'Minnesota'
             23 'Mississippi' 24 'Missouri' 25 'Montana' 26 'Nebraska'
             27 'Nevada' 28 'New Hampshire' 29 'New Jersey' 30 'New Mexico'
             31 'New York' 32 'North Carolina' 33 'North Dakota' 34 'Ohio'
             35 'Oklahoma' 36 'Oregon' 37 'Pennsylvania' 38 'Rhode Island'
             39 'South Carolina' 40 'South Dakota' 41 'Tennessee' 42 'Texas'
             43 'Utah' 44 'Vermont' 45 'Virginia' 46 'Washington'
             47 'West Virginia' 48 'Wisconsin' 49 'Wyoming' 50 'Alaska'
             51 'Hawaii' 52 'Canal Zone' 53 'Puerto Rico' 54 'American Samoa'
             55 'Guam' 62 'Virgin Islands' /
   V4        '0' 'Possessions' '1' 'ALL cit 250,000 +'
             '2' 'Cit 100,000-249,999' '3' 'Cit 50,000-99,999'
             '4' 'Cit 25,000-49,999' '5' 'Cit 10,000-24,999'
             '6' 'Cit 2,500-9,999' '7' 'Cit < 2,500' '8' 'Non-MSA co.'
             '9' 'MSA counties' '1A' 'Cit 1,000,000 +'
             '1B' 'Cit 500,000-999,999' '1C' 'Cit 250,000-499,999'
             '8A' 'Non-MSA co. 100,000 +' '8B' 'Non-MSA co. 25,000-99,999'
             '8C' 'Non-MSA co. 10,000-24,999' '8D' 'Non-MSA co. < 10,000'
             '8E' 'Non-MSA St Police' '9A' 'MSA co. 100,000 +'
             '9B' 'MSA co. 25,000-99,999' '9C' 'MSA co. 10,000-24,999'
             '9D' 'MSA co. < 10,000' '9E' 'MSA St Police' /
   V5        0 'Possessions' 1 'New England States'
             2 'Middle Atlantic States' 3 'East North Central States'
             4 'West North Central States' 5 'South Atlantic States'
             6 'East South Central States' 7 'West South Central States'
             8 'Mountain States' 9 'Pacific States' /
   V10       0 'Non-suburban' 1 'Suburban' /
   V13       1 'January' 2 'February' 3 'March' 4 'April' 5 'May' 6 'June'
             7 'July' 8 'August' 9 'September' 10 'October' 11 'November'
             12 'December' /
   V15       0 'Normal update' 1 'Adjustment' /
   V16       'A' 'Murder and non-negligent manslaughter'
             'B' 'Manslaughter by negligence' /
   V18       'A' 'Single victim/single offender'
             'B' 'Single victim/unknown offender(s)'
             'C' 'Single victim/multiple offenders'
             'D' 'Multiple victims/single offender'
             'E' 'Multiple victims/multiple offenders'
             'F' 'Multiple victims/unknown offender(s)' /
   V19       '00' 'Unknown' '1' '1 year old' '99' '99 years old or more'
             'BB' '7 days old to 364 days old' 'NB' 'Birth to 6 days old' /
   V20       'F' 'Female' 'M' 'Male' 'U' 'Unknown' /
   V21       'A' 'Asian' 'B' 'Black or African American'
             'I' 'American Indian or Alaska Native'
             'P' 'Native Hawaiian or Other Pacific Islander' 'U' 'Unknown'
             'W' 'White' /
   V22       'H' 'Hispanic or Latino' 'N' 'Not Hispanic or Latino'
             'U' 'Unknown or not reported' /
   V23       '0' 'Unknown' '1' '1 year old' '99' '99 years old or more'
             'BB' '7 days old to 364 days old' 'NB' 'birth to 6 days old' /
   V24       'F' 'Female' 'M' 'Male' 'U' 'Unknown' /
   V25       'A' 'Asian' 'B' 'Black or African American'
             'I' 'American Indian or Alaska Native'
             'P' 'Native Hawaiian or Other Pacific Islander' 'U' 'Unknown'
             'W' 'White' /
   V26       'H' 'Hispanic or Latino' 'N' 'Not Hispanic or Latino'
             'U' 'Unknown' /
   V27       11 'Firearm, type not stated'
             12 'Handgun - pistol, revolver, etc' 13 'Rifle' 14 'Shotgun'
             15 'Other gun' 20 'Knife or cutting instrument'
             30 'Blunt object - hammer, club, etc'
             40 'Personal weapons, includes beating'
             50 'Poison - does not include gas'
             55 'Pushed or thrown out window' 60 'Explosives' 65 'Fire'
             70 'Narcotics or drugs, sleeping pills' 75 'Drowning'
             80 'Strangulation - hanging'
             85 'Asphyxiation - includes death by gas'
             90 'Other or type unknown' /
   V28       'AQ' 'Acquaintance' 'BF' 'Boyfriend' 'BR' 'Brother'
             'CH' 'Common-law husband' 'CW' 'Common-law wife' 'DA' 'Daughter'
             'EE' 'Employee' 'ER' 'Employer' 'FA' 'Father' 'FR' 'Friend'
             'GF' 'Girlfriend' 'HO' 'Homosexual relationship' 'HU' 'Husband'
             'IL' 'In-law' 'MO' 'Mother' 'NE' 'Neighbor' 'OF' 'Other family'
             'OK' 'Other - known to victim' 'SD' 'Stepdaughter'
             'SF' 'Stepfather' 'SI' 'Sister' 'SM' 'Stepmother' 'SO' 'Son'
             'SS' 'Stepson' 'ST' 'Stranger'
             'UN' 'Relationship not determined' 'WI' 'Wife' 'XH' 'Ex-husband'
             'XW' 'Ex-wife' /
   V29       2 'Rape' 3 'Robbery' 5 'Burglary' 6 'Larceny'
             7 'Motor vehicle theft' 9 'Arson'
             10 'Prostitution and commercialized vice' 17 'Other sex offense'
             18 'Narcotic drug laws' 19 'Gambling' 26 'Other - not specified'
             32 'Abortion' 40 'Lovers triangle'
             41 'Child killed by babysitter'
             42 'Brawl due to influence of alcohol'
             43 'Brawl due to influence of narcotics'
             44 'Argument over money or property' 45 'Other arguments'
             46 'Gangland killings' 47 'Juvenile gang killings'
             48 'Institutional killings' 49 'Sniper attack'
             50 'Victim shot in hunting accident'
             51 'Gun-cleaning death - other than self'
             52 'Children playing with gun'
             53 'Other negligent handling of gun'
             59 'All other manslaughter by negligence' 60 'Other'
             70 'All suspected felony type'
             80 'Felon killed by private citizen' 81 'Felon killed by police'
             99 'Circumstances undetermined' /
   V30       'A' 'Felon attacked police officer'
             'B' 'Felon attacked fellow police officer'
             'C' 'Felon attacked a civilian'
             'D' 'Felon attempted flight from a crime'
             'E' 'Felon killed in commission of a crime'
             'F' 'Felon resisted arrest'
             'G' 'Not enough information to determine' /
   V33       '00' 'Unknown' '1' '1 year old' '99' '99 years old or more'
             'BB' '7 days old to 364 days old' 'NB' 'Birth to 6 days old' /
   V34       'F' 'Female' 'M' 'Male' 'U' 'Unknown' /
   V35       'A' 'Asian' 'B' 'Black or African American'
             'I' 'American Indian or Alaska Native'
             'P' 'Native Hawaiian or Other Pacific Islander' 'U' 'Unknown'
             'W' 'White' /
   V36       'H' 'Hispanic or Latino' 'N' 'Not Hispanic or Latino'
             'U' 'Unknown or not reported' /
   V37       '00' 'Unknown' '1' '1 year old' '99' '99 years old or more'
             'BB' '7 days old to 364 days old' 'NB' 'Birth to 6 days old' /
   V38       'F' 'Female' 'M' 'Male' 'U' 'Unknown' /
   V39       'A' 'Asian' 'B' 'Black or African American'
             'I' 'American Indian or Alaska Native'
             'P' 'Native Hawaiian or Other Pacific Islander' 'U' 'Unknown'
             'W' 'White' /
   V40       'H' 'Hispanic or Latino' 'N' 'Not Hispanic or Latino'
             'U' 'Unknown or not reported' /
   V41       '00' 'Unknown' '1' '1 year old' '99' '99 years old or more'
             'BB' '7 days old to 364 days old' 'NB' 'Birth to 6 days old' /
   V42       'F' 'Female' 'M' 'Male' 'U' 'Unknown' /
   V43       'A' 'Asian' 'B' 'Black or African American'
             'I' 'American Indian or Alaska Native'
             'P' 'Native Hawaiian or Other Pacific Islander' 'U' 'Unknown'
             'W' 'White' /
   V44       'H' 'Hispanic or Latino' 'N' 'Not Hispanic or Latino'
             'U' 'Unknown or not reported' /
   V45       '00' 'Unknown' '1' '1 year old' '99' '99 years old or more'
             'BB' '7 days old to 364 days old' 'NB' 'Birth to 6 days old' /
   V46       'F' 'Female' 'M' 'Male' 'U' 'Unknown' /
   V47       'A' 'Asian' 'B' 'Black or African American'
             'I' 'American Indian or Alaska Native'
             'P' 'Native Hawaiian or Other Pacific Islander' 'U' 'Unknown'
             'W' 'White' /
   V48       'H' 'Hispanic or Latino' 'N' 'Not Hispanic or Latino'
             'U' 'Unknown or not reported' /
   V49       '00' 'Unknown' '1' '1 year old' '99' '99 years old or more'
             'BB' '7 days old to 364 days old' 'NB' 'Birth to 6 days old' /
   V50       'F' 'Female' 'M' 'Male' 'U' 'Unknown' /
   V51       'A' 'Asian' 'B' 'Black or African American'
             'I' 'American Indian or Alaska Native'
             'P' 'Native Hawaiian or Other Pacific Islander' 'U' 'Unknown'
             'W' 'White' /
   V52       'H' 'Hispanic or Latino' 'N' 'Not Hispanic or Latino'
             'U' 'Unknown or not reported' /
   V53       '00' 'Unknown' '1' '1 year old' '99' '99 years old or more'
             'BB' '7 days old to 364 days old' 'NB' 'Birth to 6 days old' /
   V54       'F' 'Female' 'M' 'Male' 'U' 'Unknown' /
   V55       'A' 'Asian' 'B' 'Black or African American'
             'I' 'American Indian or Alaska Native'
             'P' 'Native Hawaiian or Other Pacific Islander' 'U' 'Unknown'
             'W' 'White' /
   V56       'H' 'Hispanic or Latino' 'N' 'Not Hispanic or Latino'
             'U' 'Unknown or not reported' /
   V57       '00' 'Unknown' '1' '1 year old' '99' '99 years old or more'
             'BB' '7 days old to 364 days old' 'NB' 'Birth to 6 days old' /
   V58       'F' 'Female' 'M' 'Male' 'U' 'Unknown' /
   V59       'A' 'Asian' 'B' 'Black or African American'
             'I' 'American Indian or Alaska Native'
             'P' 'Native Hawaiian or Other Pacific Islander' 'U' 'Unknown'
             'W' 'White' /
   V60       'H' 'Hispanic or Latino' 'N' 'Not Hispanic or Latino'
             'U' 'Unknown or not reported' /
   V61       '00' 'Unknown' '1' '1 year old' '99' '99 years old or more'
             'BB' '7 days old to 364 days old' 'NB' 'Birth to 6 days old' /
   V62       'F' 'Female' 'M' 'Male' 'U' 'Unknown' /
   V63       'A' 'Asian' 'B' 'Black or African American'
             'I' 'American Indian or Alaska Native'
             'P' 'Native Hawaiian or Other Pacific Islander' 'U' 'Unknown'
             'W' 'White' /
   V64       'H' 'Hispanic or Latino' 'N' 'Not Hispanic or Latino'
             'U' 'Unknown or not reported' /
   V65       '00' 'Unknown' '1' '1 year old' '99' '99 years old or more'
             'BB' '7 days old to 364 days old' 'NB' 'Birth to 6 days old' /
   V66       'F' 'Female' 'M' 'Male' 'U' 'Unknown' /
   V67       'A' 'Asian' 'B' 'Black or African American'
             'I' 'American Indian or Alaska Native'
             'P' 'Native Hawaiian or Other Pacific Islander' 'U' 'Unknown'
             'W' 'White' /
   V68       'H' 'Hispanic or Latino' 'N' 'Not Hispanic or Latino'
             'U' 'Unknown or not reported' /
   V69       '00' 'Unknown' '1' '1 year old' '99' '99 years old or more'
             'BB' '7 days old to 364 days old' 'NB' 'Birth to 6 days old' /
   V70       'F' 'Female' 'M' 'Male' 'U' 'Unknown' /
   V71       'A' 'Asian' 'B' 'Black or African American'
             'I' 'American Indian or Alaska Native'
             'P' 'Native Hawaiian or Other Pacific Islander' 'U' 'Unknown'
             'W' 'White' /
   V72       'H' 'Hispanic or Latino' 'N' 'Not Hispanic or Latino'
             'U' 'Unknown or not reported' /
   V73       '0' 'Unknown' '1' '1 year old' '99' '99 years old or more'
             'BB' '7 days old to 364 days old' 'NB' 'birth to 6 days old' /
   V74       'F' 'Female' 'M' 'Male' 'U' 'Unknown' /
   V75       'A' 'Asian' 'B' 'Black or African American'
             'I' 'American Indian or Alaska Native'
             'P' 'Native Hawaiian or Other Pacific Islander' 'U' 'Unknown'
             'W' 'White' /
   V76       'H' 'Hispanic or Latino' 'N' 'Not Hispanic or Latino'
             'U' 'Unknown or not reported' /
   V77       11 'Firearm, type not stated'
             12 'Handgun - pistol, revolver, etc' 13 'Rifle' 14 'Shotgun'
             15 'Other gun' 20 'Knife or cutting instrument'
             30 'Blunt object - hammer, club, etc'
             40 'Personal weapons, includes beating'
             50 'Poison - does not include gas'
             55 'Pushed or thrown out window' 60 'Explosives' 65 'Fire'
             70 'Narcotics or drugs, sleeping pills' 75 'Drowning'
             80 'Strangulation - hanging'
             85 'Asphyxiation - includes death by gas'
             90 'Other or type unknown' /
   V78       'AQ' 'Acquaintance' 'BF' 'Boyfriend' 'BR' 'Brother'
             'CH' 'Common-law husband' 'CW' 'Common-law wife' 'DA' 'Daughter'
             'EE' 'Employee' 'ER' 'Employer' 'FA' 'Father' 'FR' 'Friend'
             'GF' 'Girlfriend' 'HO' 'Homosexual relationship' 'HU' 'Husband'
             'IL' 'In-law' 'MO' 'Mother' 'NE' 'Neighbor' 'OF' 'Other family'
             'OK' 'Other - known to victim' 'SD' 'Stepdaughter'
             'SF' 'Stepfather' 'SI' 'Sister' 'SM' 'Stepmother' 'SO' 'Son'
             'SS' 'Stepson' 'ST' 'Stranger'
             'UN' 'Relationship not determined' 'WI' 'Wife' 'XH' 'Ex-husband'
             'XW' 'Ex-wife' /
   V79       2 'Rape' 3 'Robbery' 5 'Burglary' 6 'Larceny'
             7 'Motor vehicle theft' 9 'Arson'
             10 'Prostitution and commercialized vice' 17 'Other sex offense'
             18 'Narcotic drug laws' 19 'Gambling' 26 'Other - not specified'
             32 'Abortion' 40 'Lovers triangle'
             41 'Child killed by babysitter'
             42 'Brawl due to influence of alcohol'
             43 'Brawl due to influence of narcotics'
             44 'Argument over money or property' 45 'Other arguments'
             46 'Gangland killings' 47 'Juvenile gang killings'
             48 'Institutional killings' 49 'Sniper attack'
             50 'Victim shot in hunting accident'
             51 'Gun-cleaning death - other than self'
             52 'Children playing with gun'
             53 'Other negligent handling of gun'
             59 'All other manslaughter by negligence' 60 'Other'
             70 'All suspected felony type'
             80 'Felon killed by private citizen' 81 'Felon killed by police'
             99 'Circumstances undetermined' /
   V80       'A' 'Felon attacked police officer'
             'B' 'Felon attacked fellow police officer'
             'C' 'Felon attacked a civilian'
             'D' 'Felon attempted flight from a crime'
             'E' 'Felon killed in commission of a crime'
             'F' 'Felon resisted arrest'
             'G' 'Not enough information to determine' /
   V81       0 'Unknown' 1 '1 year old' 99 '99 years old or more' /
   V82       'F' 'Female' 'M' 'Male' 'U' 'Unknown' /
   V83       'A' 'Asian' 'B' 'Black or African American'
             'I' 'American Indian or Alaska Native'
             'P' 'Native Hawaiian or Other Pacific Islander' 'U' 'Unknown'
             'W' 'White' /
   V84       'H' 'Hispanic or Latino' 'N' 'Not Hispanic or Latino'
             'U' 'Unknown or not reported' /
   V85       11 'Firearm, type not stated'
             12 'Handgun - pistol, revolver, etc' 13 'Rifle' 14 'Shotgun'
             15 'Other gun' 20 'Knife or cutting instrument'
             30 'Blunt object - hammer, club, etc'
             40 'Personal weapons, includes beating'
             50 'Poison - does not include gas'
             55 'Pushed or thrown out window' 60 'Explosives' 65 'Fire'
             70 'Narcotics or drugs, sleeping pills' 75 'Drowning'
             80 'Strangulation - hanging'
             85 'Asphyxiation - includes death by gas'
             90 'Other or type unknown' /
   V86       'AQ' 'Acquaintance' 'BF' 'Boyfriend' 'BR' 'Brother'
             'CH' 'Common-law husband' 'CW' 'Common-law wife' 'DA' 'Daughter'
             'EE' 'Employee' 'ER' 'Employer' 'FA' 'Father' 'FR' 'Friend'
             'GF' 'Girlfriend' 'HO' 'Homosexual relationship' 'HU' 'Husband'
             'IL' 'In-law' 'MO' 'Mother' 'NE' 'Neighbor' 'OF' 'Other family'
             'OK' 'Other - known to victim' 'SD' 'Stepdaughter'
             'SF' 'Stepfather' 'SI' 'Sister' 'SM' 'Stepmother' 'SO' 'Son'
             'SS' 'Stepson' 'ST' 'Stranger'
             'UN' 'Relationship not determined' 'WI' 'Wife' 'XH' 'Ex-husband'
             'XW' 'Ex-wife' /
   V87       2 'Rape' 3 'Robbery' 5 'Burglary' 6 'Larceny'
             7 'Motor vehicle theft' 9 'Arson'
             10 'Prostitution and commercialized vice' 17 'Other sex offense'
             18 'Narcotic drug laws' 19 'Gambling' 26 'Other - not specified'
             32 'Abortion' 40 'Lovers triangle'
             41 'Child killed by babysitter'
             42 'Brawl due to influence of alcohol'
             43 'Brawl due to influence of narcotics'
             44 'Argument over money or property' 45 'Other arguments'
             46 'Gangland killings' 47 'Juvenile gang killings'
             48 'Institutional killings' 49 'Sniper attack'
             50 'Victim shot in hunting accident'
             51 'Gun-cleaning death - other than self'
             52 'Children playing with gun'
             53 'Other negligent handling of gun'
             59 'All other manslaughter by negligence' 60 'Other'
             70 'All suspected felony type'
             80 'Felon killed by private citizen' 81 'Felon killed by police'
             99 'Circumstances undetermined' /
   V88       'A' 'Felon attacked police officer'
             'B' 'Felon attacked fellow police officer'
             'C' 'Felon attacked a civilian'
             'D' 'Felon attempted flight from a crime'
             'E' 'Felon killed in commission of a crime'
             'F' 'Felon resisted arrest'
             'G' 'Not enough information to determine' /
   V89       0 'Unknown' 1 '1 year old' 99 '99 years old or more' /
   V90       'F' 'Female' 'M' 'Male' 'U' 'Unknown' /
   V91       'A' 'Asian' 'B' 'Black or African American'
             'I' 'American Indian or Alaska Native'
             'P' 'Native Hawaiian or Other Pacific Islander' 'U' 'Unknown'
             'W' 'White' /
   V92       'H' 'Hispanic or Latino' 'N' 'Not Hispanic or Latino'
             'U' 'Unknown or not reported' /
   V93       11 'Firearm, type not stated'
             12 'Handgun - pistol, revolver, etc' 13 'Rifle' 14 'Shotgun'
             15 'Other gun' 20 'Knife or cutting instrument'
             30 'Blunt object - hammer, club, etc'
             40 'Personal weapons, includes beating'
             50 'Poison - does not include gas'
             55 'Pushed or thrown out window' 60 'Explosives' 65 'Fire'
             70 'Narcotics or drugs, sleeping pills' 75 'Drowning'
             80 'Strangulation - hanging'
             85 'Asphyxiation - includes death by gas'
             90 'Other or type unknown' /
   V94       'AQ' 'Acquaintance' 'BF' 'Boyfriend' 'BR' 'Brother'
             'CH' 'Common-law husband' 'CW' 'Common-law wife' 'DA' 'Daughter'
             'EE' 'Employee' 'ER' 'Employer' 'FA' 'Father' 'FR' 'Friend'
             'GF' 'Girlfriend' 'HO' 'Homosexual relationship' 'HU' 'Husband'
             'IL' 'In-law' 'MO' 'Mother' 'NE' 'Neighbor' 'OF' 'Other family'
             'OK' 'Other - known to victim' 'SD' 'Stepdaughter'
             'SF' 'Stepfather' 'SI' 'Sister' 'SM' 'Stepmother' 'SO' 'Son'
             'SS' 'Stepson' 'ST' 'Stranger'
             'UN' 'Relationship not determined' 'WI' 'Wife' 'XH' 'Ex-husband'
             'XW' 'Ex-wife' /
   V95       2 'Rape' 3 'Robbery' 5 'Burglary' 6 'Larceny'
             7 'Motor vehicle theft' 9 'Arson'
             10 'Prostitution and commercialized vice' 17 'Other sex offense'
             18 'Narcotic drug laws' 19 'Gambling' 26 'Other - not specified'
             32 'Abortion' 40 'Lovers triangle'
             41 'Child killed by babysitter'
             42 'Brawl due to influence of alcohol'
             43 'Brawl due to influence of narcotics'
             44 'Argument over money or property' 45 'Other arguments'
             46 'Gangland killings' 47 'Juvenile gang killings'
             48 'Institutional killings' 49 'Sniper attack'
             50 'Victim shot in hunting accident'
             51 'Gun-cleaning death - other than self'
             52 'Children playing with gun'
             53 'Other negligent handling of gun'
             59 'All other manslaughter by negligence' 60 'Other'
             70 'All suspected felony type'
             80 'Felon killed by private citizen' 81 'Felon killed by police'
             99 'Circumstances undetermined' /
   V96       'A' 'Felon attacked police officer'
             'B' 'Felon attacked fellow police officer'
             'C' 'Felon attacked a civilian'
             'D' 'Felon attempted flight from a crime'
             'E' 'Felon killed in commission of a crime'
             'F' 'Felon resisted arrest'
             'G' 'Not enough information to determine' /
   V97       0 'Unknown' 1 '1 year old' 99 '99 years old or more' /
   V98       'F' 'Female' 'M' 'Male' 'U' 'Unknown' /
   V99       'A' 'Asian' 'B' 'Black or African American'
             'I' 'American Indian or Alaska Native'
             'P' 'Native Hawaiian or Other Pacific Islander' 'U' 'Unknown'
             'W' 'White' /
   V100      'H' 'Hispanic or Latino' 'N' 'Not Hispanic or Latino'
             'U' 'Unknown or not reported' /
   V101      11 'Firearm, type not stated'
             12 'Handgun - pistol, revolver, etc' 13 'Rifle' 14 'Shotgun'
             15 'Other gun' 20 'Knife or cutting instrument'
             30 'Blunt object - hammer, club, etc'
             40 'Personal weapons, includes beating'
             50 'Poison - does not include gas'
             55 'Pushed or thrown out window' 60 'Explosives' 65 'Fire'
             70 'Narcotics or drugs, sleeping pills' 75 'Drowning'
             80 'Strangulation - hanging'
             85 'Asphyxiation - includes death by gas'
             90 'Other or type unknown' /
   V102      'AQ' 'Acquaintance' 'BF' 'Boyfriend' 'BR' 'Brother'
             'CH' 'Common-law husband' 'CW' 'Common-law wife' 'DA' 'Daughter'
             'EE' 'Employee' 'ER' 'Employer' 'FA' 'Father' 'FR' 'Friend'
             'GF' 'Girlfriend' 'HO' 'Homosexual relationship' 'HU' 'Husband'
             'IL' 'In-law' 'MO' 'Mother' 'NE' 'Neighbor' 'OF' 'Other family'
             'OK' 'Other - known to victim' 'SD' 'Stepdaughter'
             'SF' 'Stepfather' 'SI' 'Sister' 'SM' 'Stepmother' 'SO' 'Son'
             'SS' 'Stepson' 'ST' 'Stranger'
             'UN' 'Relationship not determined' 'WI' 'Wife' 'XH' 'Ex-husband'
             'XW' 'Ex-wife' /
   V103      2 'Rape' 3 'Robbery' 5 'Burglary' 6 'Larceny'
             7 'Motor vehicle theft' 9 'Arson'
             10 'Prostitution and commercialized vice' 17 'Other sex offense'
             18 'Narcotic drug laws' 19 'Gambling' 26 'Other - not specified'
             32 'Abortion' 40 'Lovers triangle'
             41 'Child killed by babysitter'
             42 'Brawl due to influence of alcohol'
             43 'Brawl due to influence of narcotics'
             44 'Argument over money or property' 45 'Other arguments'
             46 'Gangland killings' 47 'Juvenile gang killings'
             48 'Institutional killings' 49 'Sniper attack'
             50 'Victim shot in hunting accident'
             51 'Gun-cleaning death - other than self'
             52 'Children playing with gun'
             53 'Other negligent handling of gun'
             59 'All other manslaughter by negligence' 60 'Other'
             70 'All suspected felony type'
             80 'Felon killed by private citizen' 81 'Felon killed by police'
             99 'Circumstances undetermined' /
   V104      'A' 'Felon attacked police officer'
             'B' 'Felon attacked fellow police officer'
             'C' 'Felon attacked a civilian'
             'D' 'Felon attempted flight from a crime'
             'E' 'Felon killed in commission of a crime'
             'F' 'Felon resisted arrest'
             'G' 'Not enough information to determine' /
   V105      0 'Unknown' 1 '1 year old' 99 '99 years old or more' /
   V106      'F' 'Female' 'M' 'Male' 'U' 'Unknown' /
   V107      'A' 'Asian' 'B' 'Black or African American'
             'I' 'American Indian or Alaska Native'
             'P' 'Native Hawaiian or Other Pacific Islander' 'U' 'Unknown'
             'W' 'White' /
   V108      'H' 'Hispanic or Latino' 'N' 'Not Hispanic or Latino'
             'U' 'Unknown or not reported' /
   V109      11 'Firearm, type not stated'
             12 'Handgun - pistol, revolver, etc' 13 'Rifle' 14 'Shotgun'
             15 'Other gun' 20 'Knife or cutting instrument'
             30 'Blunt object - hammer, club, etc'
             40 'Personal weapons, includes beating'
             50 'Poison - does not include gas'
             55 'Pushed or thrown out window' 60 'Explosives' 65 'Fire'
             70 'Narcotics or drugs, sleeping pills' 75 'Drowning'
             80 'Strangulation - hanging'
             85 'Asphyxiation - includes death by gas'
             90 'Other or type unknown' /
   V110      'AQ' 'Acquaintance' 'BF' 'Boyfriend' 'BR' 'Brother'
             'CH' 'Common-law husband' 'CW' 'Common-law wife' 'DA' 'Daughter'
             'EE' 'Employee' 'ER' 'Employer' 'FA' 'Father' 'FR' 'Friend'
             'GF' 'Girlfriend' 'HO' 'Homosexual relationship' 'HU' 'Husband'
             'IL' 'In-law' 'MO' 'Mother' 'NE' 'Neighbor' 'OF' 'Other family'
             'OK' 'Other - known to victim' 'SD' 'Stepdaughter'
             'SF' 'Stepfather' 'SI' 'Sister' 'SM' 'Stepmother' 'SO' 'Son'
             'SS' 'Stepson' 'ST' 'Stranger'
             'UN' 'Relationship not determined' 'WI' 'Wife' 'XH' 'Ex-husband'
             'XW' 'Ex-wife' /
   V111      2 'Rape' 3 'Robbery' 5 'Burglary' 6 'Larceny'
             7 'Motor vehicle theft' 9 'Arson'
             10 'Prostitution and commercialized vice' 17 'Other sex offense'
             18 'Narcotic drug laws' 19 'Gambling' 26 'Other - not specified'
             32 'Abortion' 40 'Lovers triangle'
             41 'Child killed by babysitter'
             42 'Brawl due to influence of alcohol'
             43 'Brawl due to influence of narcotics'
             44 'Argument over money or property' 45 'Other arguments'
             46 'Gangland killings' 47 'Juvenile gang killings'
             48 'Institutional killings' 49 'Sniper attack'
             50 'Victim shot in hunting accident'
             51 'Gun-cleaning death - other than self'
             52 'Children playing with gun'
             53 'Other negligent handling of gun'
             59 'All other manslaughter by negligence' 60 'Other'
             70 'All suspected felony type'
             80 'Felon killed by private citizen' 81 'Felon killed by police'
             99 'Circumstances undetermined' /
   V112      'A' 'Felon attacked police officer'
             'B' 'Felon attacked fellow police officer'
             'C' 'Felon attacked a civilian'
             'D' 'Felon attempted flight from a crime'
             'E' 'Felon killed in commission of a crime'
             'F' 'Felon resisted arrest'
             'G' 'Not enough information to determine' /
   V113      0 'Unknown' 1 '1 year old' 99 '99 years old or more' /
   V114      'F' 'Female' 'M' 'Male' 'U' 'Unknown' /
   V115      'A' 'Asian' 'B' 'Black or African American'
             'I' 'American Indian or Alaska Native'
             'P' 'Native Hawaiian or Other Pacific Islander' 'U' 'Unknown'
             'W' 'White' /
   V116      'H' 'Hispanic or Latino' 'N' 'Not Hispanic or Latino'
             'U' 'Unknown or not reported' /
   V117      11 'Firearm, type not stated'
             12 'Handgun - pistol, revolver, etc' 13 'Rifle' 14 'Shotgun'
             15 'Other gun' 20 'Knife or cutting instrument'
             30 'Blunt object - hammer, club, etc'
             40 'Personal weapons, includes beating'
             50 'Poison - does not include gas'
             55 'Pushed or thrown out window' 60 'Explosives' 65 'Fire'
             70 'Narcotics or drugs, sleeping pills' 75 'Drowning'
             80 'Strangulation - hanging'
             85 'Asphyxiation - includes death by gas'
             90 'Other or type unknown' /
   V118      'AQ' 'Acquaintance' 'BF' 'Boyfriend' 'BR' 'Brother'
             'CH' 'Common-law husband' 'CW' 'Common-law wife' 'DA' 'Daughter'
             'EE' 'Employee' 'ER' 'Employer' 'FA' 'Father' 'FR' 'Friend'
             'GF' 'Girlfriend' 'HO' 'Homosexual relationship' 'HU' 'Husband'
             'IL' 'In-law' 'MO' 'Mother' 'NE' 'Neighbor' 'OF' 'Other family'
             'OK' 'Other - known to victim' 'SD' 'Stepdaughter'
             'SF' 'Stepfather' 'SI' 'Sister' 'SM' 'Stepmother' 'SO' 'Son'
             'SS' 'Stepson' 'ST' 'Stranger'
             'UN' 'Relationship not determined' 'WI' 'Wife' 'XH' 'Ex-husband'
             'XW' 'Ex-wife' /
   V119      2 'Rape' 3 'Robbery' 5 'Burglary' 6 'Larceny'
             7 'Motor vehicle theft' 9 'Arson'
             10 'Prostitution and commercialized vice' 17 'Other sex offense'
             18 'Narcotic drug laws' 19 'Gambling' 26 'Other - not specified'
             32 'Abortion' 40 'Lovers triangle'
             41 'Child killed by babysitter'
             42 'Brawl due to influence of alcohol'
             43 'Brawl due to influence of narcotics'
             44 'Argument over money or property' 45 'Other arguments'
             46 'Gangland killings' 47 'Juvenile gang killings'
             48 'Institutional killings' 49 'Sniper attack'
             50 'Victim shot in hunting accident'
             51 'Gun-cleaning death - other than self'
             52 'Children playing with gun'
             53 'Other negligent handling of gun'
             59 'All other manslaughter by negligence' 60 'Other'
             70 'All suspected felony type'
             80 'Felon killed by private citizen' 81 'Felon killed by police'
             99 'Circumstances undetermined' /
   V120      'A' 'Felon attacked police officer'
             'B' 'Felon attacked fellow police officer'
             'C' 'Felon attacked a civilian'
             'D' 'Felon attempted flight from a crime'
             'E' 'Felon killed in commission of a crime'
             'F' 'Felon resisted arrest'
             'G' 'Not enough information to determine' /
   V121      0 'Unknown' 1 '1 year old' 99 '99 years old or more' /
   V122      'F' 'Female' 'M' 'Male' 'U' 'Unknown' /
   V123      'A' 'Asian' 'B' 'Black or African American'
             'I' 'American Indian or Alaska Native'
             'P' 'Native Hawaiian or Other Pacific Islander' 'U' 'Unknown'
             'W' 'White' /
   V124      'H' 'Hispanic or Latino' 'N' 'Not Hispanic or Latino'
             'U' 'Unknown or not reported' /
   V125      11 'Firearm, type not stated'
             12 'Handgun - pistol, revolver, etc' 13 'Rifle' 14 'Shotgun'
             15 'Other gun' 20 'Knife or cutting instrument'
             30 'Blunt object - hammer, club, etc'
             40 'Personal weapons, includes beating'
             50 'Poison - does not include gas'
             55 'Pushed or thrown out window' 60 'Explosives' 65 'Fire'
             70 'Narcotics or drugs, sleeping pills' 75 'Drowning'
             80 'Strangulation - hanging'
             85 'Asphyxiation - includes death by gas'
             90 'Other or type unknown' /
   V126      'AQ' 'Acquaintance' 'BF' 'Boyfriend' 'BR' 'Brother'
             'CH' 'Common-law husband' 'CW' 'Common-law wife' 'DA' 'Daughter'
             'EE' 'Employee' 'ER' 'Employer' 'FA' 'Father' 'FR' 'Friend'
             'GF' 'Girlfriend' 'HO' 'Homosexual relationship' 'HU' 'Husband'
             'IL' 'In-law' 'MO' 'Mother' 'NE' 'Neighbor' 'OF' 'Other family'
             'OK' 'Other - known to victim' 'SD' 'Stepdaughter'
             'SF' 'Stepfather' 'SI' 'Sister' 'SM' 'Stepmother' 'SO' 'Son'
             'SS' 'Stepson' 'ST' 'Stranger'
             'UN' 'Relationship not determined' 'WI' 'Wife' 'XH' 'Ex-husband'
             'XW' 'Ex-wife' /
   V127      2 'Rape' 3 'Robbery' 5 'Burglary' 6 'Larceny'
             7 'Motor vehicle theft' 9 'Arson'
             10 'Prostitution and commercialized vice' 17 'Other sex offense'
             18 'Narcotic drug laws' 19 'Gambling' 26 'Other - not specified'
             32 'Abortion' 40 'Lovers triangle'
             41 'Child killed by babysitter'
             42 'Brawl due to influence of alcohol'
             43 'Brawl due to influence of narcotics'
             44 'Argument over money or property' 45 'Other arguments'
             46 'Gangland killings' 47 'Juvenile gang killings'
             48 'Institutional killings' 49 'Sniper attack'
             50 'Victim shot in hunting accident'
             51 'Gun-cleaning death - other than self'
             52 'Children playing with gun'
             53 'Other negligent handling of gun'
             59 'All other manslaughter by negligence' 60 'Other'
             70 'All suspected felony type'
             80 'Felon killed by private citizen' 81 'Felon killed by police'
             99 'Circumstances undetermined' /
   V128      'A' 'Felon attacked police officer'
             'B' 'Felon attacked fellow police officer'
             'C' 'Felon attacked a civilian'
             'D' 'Felon attempted flight from a crime'
             'E' 'Felon killed in commission of a crime'
             'F' 'Felon resisted arrest'
             'G' 'Not enough information to determine' /
   V129      0 'Unknown' 1 '1 year old' 99 '99 years old or more' /
   V130      'F' 'Female' 'M' 'Male' 'U' 'Unknown' /
   V131      'A' 'Asian' 'B' 'Black or African American'
             'I' 'American Indian or Alaska Native'
             'P' 'Native Hawaiian or Other Pacific Islander' 'U' 'Unknown'
             'W' 'White' /
   V132      'H' 'Hispanic or Latino' 'N' 'Not Hispanic or Latino'
             'U' 'Unknown or not reported' /
   V133      11 'Firearm, type not stated'
             12 'Handgun - pistol, revolver, etc' 13 'Rifle' 14 'Shotgun'
             15 'Other gun' 20 'Knife or cutting instrument'
             30 'Blunt object - hammer, club, etc'
             40 'Personal weapons, includes beating'
             50 'Poison - does not include gas'
             55 'Pushed or thrown out window' 60 'Explosives' 65 'Fire'
             70 'Narcotics or drugs, sleeping pills' 75 'Drowning'
             80 'Strangulation - hanging'
             85 'Asphyxiation - includes death by gas'
             90 'Other or type unknown' /
   V134      'AQ' 'Acquaintance' 'BF' 'Boyfriend' 'BR' 'Brother'
             'CH' 'Common-law husband' 'CW' 'Common-law wife' 'DA' 'Daughter'
             'EE' 'Employee' 'ER' 'Employer' 'FA' 'Father' 'FR' 'Friend'
             'GF' 'Girlfriend' 'HO' 'Homosexual relationship' 'HU' 'Husband'
             'IL' 'In-law' 'MO' 'Mother' 'NE' 'Neighbor' 'OF' 'Other family'
             'OK' 'Other - known to victim' 'SD' 'Stepdaughter'
             'SF' 'Stepfather' 'SI' 'Sister' 'SM' 'Stepmother' 'SO' 'Son'
             'SS' 'Stepson' 'ST' 'Stranger'
             'UN' 'Relationship not determined' 'WI' 'Wife' 'XH' 'Ex-husband'
             'XW' 'Ex-wife' /
   V135      2 'Rape' 3 'Robbery' 5 'Burglary' 6 'Larceny'
             7 'Motor vehicle theft' 9 'Arson'
             10 'Prostitution and commercialized vice' 17 'Other sex offense'
             18 'Narcotic drug laws' 19 'Gambling' 26 'Other - not specified'
             32 'Abortion' 40 'Lovers triangle'
             41 'Child killed by babysitter'
             42 'Brawl due to influence of alcohol'
             43 'Brawl due to influence of narcotics'
             44 'Argument over money or property' 45 'Other arguments'
             46 'Gangland killings' 47 'Juvenile gang killings'
             48 'Institutional killings' 49 'Sniper attack'
             50 'Victim shot in hunting accident'
             51 'Gun-cleaning death - other than self'
             52 'Children playing with gun'
             53 'Other negligent handling of gun'
             59 'All other manslaughter by negligence' 60 'Other'
             70 'All suspected felony type'
             80 'Felon killed by private citizen' 81 'Felon killed by police'
             99 'Circumstances undetermined' /
   V136      'A' 'Felon attacked police officer'
             'B' 'Felon attacked fellow police officer'
             'C' 'Felon attacked a civilian'
             'D' 'Felon attempted flight from a crime'
             'E' 'Felon killed in commission of a crime'
             'F' 'Felon resisted arrest'
             'G' 'Not enough information to determine' /
   V137      0 'Unknown' 1 '1 year old' 99 '99 years old or more' /
   V138      'F' 'Female' 'M' 'Male' 'U' 'Unknown' /
   V139      'A' 'Asian' 'B' 'Black or African American'
             'I' 'American Indian or Alaska Native'
             'P' 'Native Hawaiian or Other Pacific Islander' 'U' 'Unknown'
             'W' 'White' /
   V140      'H' 'Hispanic or Latino' 'N' 'Not Hispanic or Latino'
             'U' 'Unknown or not reported' /
   V141      11 'Firearm, type not stated'
             12 'Handgun - pistol, revolver, etc' 13 'Rifle' 14 'Shotgun'
             15 'Other gun' 20 'Knife or cutting instrument'
             30 'Blunt object - hammer, club, etc'
             40 'Personal weapons, includes beating'
             50 'Poison - does not include gas'
             55 'Pushed or thrown out window' 60 'Explosives' 65 'Fire'
             70 'Narcotics or drugs, sleeping pills' 75 'Drowning'
             80 'Strangulation - hanging'
             85 'Asphyxiation - includes death by gas'
             90 'Other or type unknown' /
   V142      'AQ' 'Acquaintance' 'BF' 'Boyfriend' 'BR' 'Brother'
             'CH' 'Common-law husband' 'CW' 'Common-law wife' 'DA' 'Daughter'
             'EE' 'Employee' 'ER' 'Employer' 'FA' 'Father' 'FR' 'Friend'
             'GF' 'Girlfriend' 'HO' 'Homosexual relationship' 'HU' 'Husband'
             'IL' 'In-law' 'MO' 'Mother' 'NE' 'Neighbor' 'OF' 'Other family'
             'OK' 'Other - known to victim' 'SD' 'Stepdaughter'
             'SF' 'Stepfather' 'SI' 'Sister' 'SM' 'Stepmother' 'SO' 'Son'
             'SS' 'Stepson' 'ST' 'Stranger'
             'UN' 'Relationship not determined' 'WI' 'Wife' 'XH' 'Ex-husband'
             'XW' 'Ex-wife' /
   V143      2 'Rape' 3 'Robbery' 5 'Burglary' 6 'Larceny'
             7 'Motor vehicle theft' 9 'Arson'
             10 'Prostitution and commercialized vice' 17 'Other sex offense'
             18 'Narcotic drug laws' 19 'Gambling' 26 'Other - not specified'
             32 'Abortion' 40 'Lovers triangle'
             41 'Child killed by babysitter'
             42 'Brawl due to influence of alcohol'
             43 'Brawl due to influence of narcotics'
             44 'Argument over money or property' 45 'Other arguments'
             46 'Gangland killings' 47 'Juvenile gang killings'
             48 'Institutional killings' 49 'Sniper attack'
             50 'Victim shot in hunting accident'
             51 'Gun-cleaning death - other than self'
             52 'Children playing with gun'
             53 'Other negligent handling of gun'
             59 'All other manslaughter by negligence' 60 'Other'
             70 'All suspected felony type'
             80 'Felon killed by private citizen' 81 'Felon killed by police'
             99 'Circumstances undetermined' /
   V144      'A' 'Felon attacked police officer'
             'B' 'Felon attacked fellow police officer'
             'C' 'Felon attacked a civilian'
             'D' 'Felon attempted flight from a crime'
             'E' 'Felon killed in commission of a crime'
             'F' 'Felon resisted arrest'
             'G' 'Not enough information to determine' /
   V145      0 'Unknown' 1 '1 year old' 99 '99 years old or more' /
   V146      'F' 'Female' 'M' 'Male' 'U' 'Unknown' /
   V147      'A' 'Asian' 'B' 'Black or African American'
             'I' 'American Indian or Alaska Native'
             'P' 'Native Hawaiian or Other Pacific Islander' 'U' 'Unknown'
             'W' 'White' /
   V148      'H' 'Hispanic or Latino' 'N' 'Not Hispanic or Latino'
             'U' 'Unknown or not reported' /
   V149      11 'Firearm, type not stated'
             12 'Handgun - pistol, revolver, etc' 13 'Rifle' 14 'Shotgun'
             15 'Other gun' 20 'Knife or cutting instrument'
             30 'Blunt object - hammer, club, etc'
             40 'Personal weapons, includes beating'
             50 'Poison - does not include gas'
             55 'Pushed or thrown out window' 60 'Explosives' 65 'Fire'
             70 'Narcotics or drugs, sleeping pills' 75 'Drowning'
             80 'Strangulation - hanging'
             85 'Asphyxiation - includes death by gas'
             90 'Other or type unknown' /
   V150      'AQ' 'Acquaintance' 'BF' 'Boyfriend' 'BR' 'Brother'
             'CH' 'Common-law husband' 'CW' 'Common-law wife' 'DA' 'Daughter'
             'EE' 'Employee' 'ER' 'Employer' 'FA' 'Father' 'FR' 'Friend'
             'GF' 'Girlfriend' 'HO' 'Homosexual relationship' 'HU' 'Husband'
             'IL' 'In-law' 'MO' 'Mother' 'NE' 'Neighbor' 'OF' 'Other family'
             'OK' 'Other - known to victim' 'SD' 'Stepdaughter'
             'SF' 'Stepfather' 'SI' 'Sister' 'SM' 'Stepmother' 'SO' 'Son'
             'SS' 'Stepson' 'ST' 'Stranger'
             'UN' 'Relationship not determined' 'WI' 'Wife' 'XH' 'Ex-husband'
             'XW' 'Ex-wife' /
   V151      2 'Rape' 3 'Robbery' 5 'Burglary' 6 'Larceny'
             7 'Motor vehicle theft' 9 'Arson'
             10 'Prostitution and commercialized vice' 17 'Other sex offense'
             18 'Narcotic drug laws' 19 'Gambling' 26 'Other - not specified'
             32 'Abortion' 40 'Lovers triangle'
             41 'Child killed by babysitter'
             42 'Brawl due to influence of alcohol'
             43 'Brawl due to influence of narcotics'
             44 'Argument over money or property' 45 'Other arguments'
             46 'Gangland killings' 47 'Juvenile gang killings'
             48 'Institutional killings' 49 'Sniper attack'
             50 'Victim shot in hunting accident'
             51 'Gun-cleaning death - other than self'
             52 'Children playing with gun'
             53 'Other negligent handling of gun'
             59 'All other manslaughter by negligence' 60 'Other'
             70 'All suspected felony type'
             80 'Felon killed by private citizen' 81 'Felon killed by police'
             99 'Circumstances undetermined' /
   V152      'A' 'Felon attacked police officer'
             'B' 'Felon attacked fellow police officer'
             'C' 'Felon attacked a civilian'
             'D' 'Felon attempted flight from a crime'
             'E' 'Felon killed in commission of a crime'
             'F' 'Felon resisted arrest'
             'G' 'Not enough information to determine' /
   .

EXECUTE.

* SPSS VARIABLE LEVEL COMMAND.

VARIABLE LEVEL
   V6
   V7
   V8
   V9
   V17
   V31
   V32
   V81
   V89
   V97
   V105
   V113
   V121
   V129
   V145
   V149
   V151
    (scale).

VARIABLE LEVEL
   V1
   V2
   V3
   V4
   V5
   V10
   V11
   V12
   V13
   V14
   V15
   V16
   V18
   V19
   V20
   V21
   V22
   V23
   V24
   V25
   V26
   V27
   V28
   V29
   V30
   V33
   V34
   V35
   V36
   V37
   V38
   V39
   V40
   V41
   V42
   V43
   V44
   V45
   V46
   V47
   V48
   V49
   V50
   V51
   V52
   V53
   V54
   V55
   V56
   V57
   V58
   V59
   V60
   V61
   V62
   V63
   V64
   V65
   V66
   V67
   V68
   V69
   V70
   V71
   V72
   V73
   V74
   V75
   V76
   V77
   V78
   V79
   V80
   V82
   V83
   V84
   V85
   V86
   V87
   V88
   V90
   V91
   V92
   V93
   V94
   V95
   V96
   V98
   V99
   V100
   V101
   V102
   V103
   V104
   V106
   V107
   V108
   V109
   V110
   V111
   V112
   V114
   V115
   V116
   V117
   V118
   V119
   V120
   V122
   V123
   V124
   V125
   V126
   V127
   V128
   V130
   V131
   V132
   V133
   V134
   V135
   V136
   V137
   V138
   V139
   V140
   V141
   V142
   V143
   V144
   V146
   V147
   V148
   V150
   V152
    (nominal).

* SPSS FORMAT COMMAND.

FORMAT
    V1 (F1.0) /
    V2 (F2.0) /
    V3 (A7) /
    V4 (A2) /
    V5 (F1.0) /
    V6 (F4.0) /
    V7 (F9.0) /
    V8 (F3.0) /
    V9 (F3.0) /
    V10 (F1.0) /
    V11 (A24) /
    V12 (A6) /
    V13 (F2.0) /
    V14 (F6.0) /
    V15 (F1.0) /
    V16 (A1) /
    V17 (F3.0) /
    V18 (A1) /
    V19 (A2) /
    V20 (A1) /
    V21 (A1) /
    V22 (A1) /
    V23 (A2) /
    V24 (A1) /
    V25 (A1) /
    V26 (A1) /
    V27 (F2.0) /
    V28 (A2) /
    V29 (F2.0) /
    V30 (A1) /
    V31 (F3.0) /
    V32 (F3.0) /
    V33 (A2) /
    V34 (A1) /
    V35 (A1) /
    V36 (A1) /
    V37 (A2) /
    V38 (A1) /
    V39 (A1) /
    V40 (A1) /
    V41 (A2) /
    V42 (A1) /
    V43 (A1) /
    V44 (A1) /
    V45 (A2) /
    V46 (A1) /
    V47 (A1) /
    V48 (A1) /
    V49 (A2) /
    V50 (A1) /
    V51 (A1) /
    V52 (A1) /
    V53 (A2) /
    V54 (A1) /
    V55 (A1) /
    V56 (A1) /
    V57 (A2) /
    V58 (A1) /
    V59 (A1) /
    V60 (A1) /
    V61 (A2) /
    V62 (A1) /
    V63 (A1) /
    V64 (A1) /
    V65 (A2) /
    V66 (A1) /
    V67 (A1) /
    V68 (A1) /
    V69 (A2) /
    V70 (A1) /
    V71 (A1) /
    V72 (A1) /
    V73 (A2) /
    V74 (A1) /
    V75 (A1) /
    V76 (A1) /
    V77 (F2.0) /
    V78 (A2) /
    V79 (F2.0) /
    V80 (A1) /
    V81 (F2.0) /
    V82 (A1) /
    V83 (A1) /
    V84 (A1) /
    V85 (F2.0) /
    V86 (A2) /
    V87 (F2.0) /
    V88 (A1) /
    V89 (F2.0) /
    V90 (A1) /
    V91 (A1) /
    V92 (A1) /
    V93 (F2.0) /
    V94 (A2) /
    V95 (F2.0) /
    V96 (A1) /
    V97 (F2.0) /
    V98 (A1) /
    V99 (A1) /
    V100 (A1) /
    V101 (F2.0) /
    V102 (A2) /
    V103 (F2.0) /
    V104 (A1) /
    V105 (F2.0) /
    V106 (A1) /
    V107 (A1) /
    V108 (A1) /
    V109 (F2.0) /
    V110 (A2) /
    V111 (F2.0) /
    V112 (A1) /
    V113 (F2.0) /
    V114 (A1) /
    V115 (A1) /
    V116 (A1) /
    V117 (F2.0) /
    V118 (A2) /
    V119 (F2.0) /
    V120 (A1) /
    V121 (F2.0) /
    V122 (A1) /
    V123 (A1) /
    V124 (A1) /
    V125 (F2.0) /
    V126 (A2) /
    V127 (F2.0) /
    V128 (A1) /
    V129 (F2.0) /
    V130 (A1) /
    V131 (A1) /
    V132 (A1) /
    V133 (F2.0) /
    V134 (A2) /
    V135 (F2.0) /
    V136 (A1) /
    V137 (F2.0) /
    V138 (A1) /
    V139 (A1) /
    V140 (A1) /
    V141 (F2.0) /
    V142 (A2) /
    V143 (F2.0) /
    V144 (A1) /
    V145 (F2.0) /
    V146 (A1) /
    V147 (A1) /
    V148 (A1) /
    V149 (F2.0) /
    V150 (A2) /
    V151 (F2.0) /
    V152 (A1) /

* Create SPSS system file.

*SAVE OUTFILE="spss-filename.sav".
