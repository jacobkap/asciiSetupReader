*-------------------------------------------------------------------------*
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 03482
 |        CALIFORNIA VITAL STATISTICS AND HOMICIDE DATA, 1990-1999
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
 | "c:\temp\03482-0001-data.txt").
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
 | FORMAT:  associates the formats created by the PROC FORMAT step with
 | the variables named in the INPUT statement.
 |
 | NOTE:  Users should modify this setup file to suit their specific needs.
 | Sections for PROC FORMAT, FORMAT, and MISSING VALUE RECODES have been
 | commented out (i.e., '/*'). To include these sections in the final SAS
 | setup, users should remove the SAS comment indicators from the desired
 | section(s).
 |
 *------------------------------------------------------------------------;

* SAS PROC FORMAT;

/*
PROC FORMAT;
  VALUE CNTYJUR   1='Alameda' 2='Alpine' 3='Amador' 4='Butte' 5='Calaveras'
                  6='Colusa' 7='Contra Costa' 8='Del Norte' 9='El Dorado'
                  10='Fresno' 11='Glenn' 12='Humbolt' 13='Imperial' 14='Inyo'
                  15='Kern' 16='Kings' 17='Lake' 18='Lassen' 19='Los Angeles'
                  20='Madera' 21='Marin' 22='Mariposa' 23='Mendocino'
                  24='Merced' 25='Modoc' 26='Mono' 27='Monterey' 28='Napa'
                  29='Nevada' 30='Orange' 31='Placer' 32='Plumas'
                  33='Riverside' 34='Sacramento' 35='San Benito'
                  36='San Bernardino' 37='San Diego' 38='San Francisco'
                  39='San Joaquin' 40='San Luis Obispo' 41='San Mateo'
                  42='Santa Barbara' 43='Santa Clara' 44='Santa Cruz'
                  45='Shasta' 46='Sierra' 47='Siskiyou' 48='Solano'
                  49='Sonoma' 50='Stanislaus' 51='Sutter' 52='Tehama'
                  53='Trinity' 54='Tulare' 55='Tuolumne' 56='Ventura'
                  57='Yolo' 58='Yuba' ;
  VALUE VICSEX    0='Unknown' 1='Male' 2='Female' ;
  VALUE $VICRACE  '0'='Unknown' '1'='White (not Hispanic)' '2'='Hispanic'
                  '3'='Black' '4'='American Indian' '5'='Chinese'
                  '6'='Japanese' '7'='Filipino' '8'='Other'
                  '9'='Pacific Islander' 'A'='Other Asian' 'B'='Black'
                  'C'='Chinese' 'D'='Cambodian' 'F'='Filipino'
                  'G'='Guamanian' 'H'='Hispanic' 'I'='American Indian'
                  'J'='Japanese' 'K'='Korean' 'L'='Laotian' 'O'='Other'
                  'P'='Pacific Islander' 'S'='Samoan' 'U'='Hawaiian'
                  'V'='Vietnamese' 'W'='White' 'X'='Unknown' 'Z'='Asian' ;
  VALUE CRIMEST   1='Actual' 2='Justifiable - private citizen'
                  3='Manslaughter' 4='Justifiable - peace officer' ;
  VALUE RELATN1f  1='Husband' 2='Wife' 3='Common-law husband'
                  4='Common-law wife' 5='Mother' 6='Father' 7='Son'
                  8='Daughter' 9='Brother' 10='Sister' 11='In-law'
                  12='Stepfather' 13='Stepmother' 14='Stepson'
                  15='Stepdaughter' 16='Other family' 20='Neighbor'
                  21='Acquaintance' 22='Boyfriend' 23='Girlfriend'
                  24='Ex-husband' 25='Ex-wife' 26='Employee' 27='Employer'
                  28='Friend' 29='Homosexual relationship'
                  30='Other - known to victim' 40='Stranger'
                  45='Gang Member (Beginning in 1992)'
                  50='Can''t be determined' ;
  VALUE RELATN2f  1='Husband' 2='Wife' 3='Common-law husband'
                  4='Common-law wife' 5='Mother' 6='Father' 7='Son'
                  8='Daughter' 9='Brother' 10='Sister' 11='In-law'
                  12='Stepfather' 13='Stepmother' 14='Stepson'
                  15='Stepdaughter' 16='Other family' 20='Neighbor'
                  21='Acquaintance' 22='Boyfriend' 23='Girlfriend'
                  24='Ex-husband' 25='Ex-wife' 26='Employee' 27='Employer'
                  28='Friend' 29='Homosexual relationship'
                  30='Other - known to victim' 40='Stranger'
                  45='Gang Member (Beginning in 1992)'
                  50='Can''t be determined' ;
  VALUE RELATN3f  1='Husband' 2='Wife' 3='Common-law husband'
                  4='Common-law wife' 5='Mother' 6='Father' 7='Son'
                  8='Daughter' 9='Brother' 10='Sister' 11='In-law'
                  12='Stepfather' 13='Stepmother' 14='Stepson'
                  15='Stepdaughter' 16='Other family' 20='Neighbor'
                  21='Acquaintance' 22='Boyfriend' 23='Girlfriend'
                  24='Ex-husband' 25='Ex-wife' 26='Employee' 27='Employer'
                  28='Friend' 29='Homosexual relationship'
                  30='Other - known to victim' 40='Stranger'
                  45='Gang Member (Beginning in 1992)'
                  50='Can''t be determined' ;
  VALUE RELATN4f  1='Husband' 2='Wife' 3='Common-law husband'
                  4='Common-law wife' 5='Mother' 6='Father' 7='Son'
                  8='Daughter' 9='Brother' 10='Sister' 11='In-law'
                  12='Stepfather' 13='Stepmother' 14='Stepson'
                  15='Stepdaughter' 16='Other family' 20='Neighbor'
                  21='Acquaintance' 22='Boyfriend' 23='Girlfriend'
                  24='Ex-husband' 25='Ex-wife' 26='Employee' 27='Employer'
                  28='Friend' 29='Homosexual relationship'
                  30='Other - known to victim' 40='Stranger'
                  45='Gang Member (Beginning in 1992)'
                  50='Can''t be determined' ;
  VALUE INCDDAY   0='Unknown' 1='Sunday' 2='Monday' 3='Tuesday' 4='Wednesday'
                  5='Thursday' 6='Friday' 7='Saturday' ;
  VALUE WEAPON    0='Unknown' 1='Firearm (unknown whether handgun, rifle'
                  2='Handgun (pistol, revolver)' 3='Rifle' 4='Shotgun'
                  5='Other firearm'
                  6='Knife or other cutting or stabbing instr'
                  7='Blunt object (bludgeon, club, etc.)'
                  8='Personal weapons (hands, feet, teeth, et'
                  9='Poison (includes carbon monoxide)'
                  10='Drugs or narcotics (overdose)'
                  11='Ropes or garrote (strangulation/hanging'
                  13='Arson, fire' 14='Explosion' 15='Other' 16='Neglect'
                  17='Pellet gun' 20='Drowning' 25='Asphyxiation' ;
  VALUE LOCATION  0='Unknown' 1='Hotel, motel or other commercial short-t'
                  2='Victims residence (includes the yard of'
                  3='Residence of offender'
                  4='Service station, convenience store, fast'
                  5='Liquor store' 6='Parking lot area'
                  7='Other commercial business' 8='Financial institution'
                  12='Warehouse, other storage facility'
                  13='Other residence besides victims or offe'
                  14='Bar or cocktail lounge or restaurant' 15='Any vehicle'
                  16='Street or sidewalk' 17='Highway or freeway'
                  18='Park, public use area (park, beach)'
                  19='Vacant field (non-recreational area), ru' 20='Jail'
                  21='CYA' 22='Department of Corrections'
                  24='Shared residence' 25='School or school grounds'
                  99='Other' ;
  VALUE PRECIP1f  2='Rape' 3='Robbery' 5='Burglary' 6='Larceny'
                  7='Motor vehicle theft' 9='Arson'
                  10='Prostitution and commercial vice'
                  17='Other sex offense'
                  18='Narcotic drug laws (not overdose)' 19='Gambling'
                  26='Other felony - not specified' 32='Abortion'
                  40='Lover''s triangle' 41='Child killed by babysitter'
                  42='Brawl due to alcohol influence'
                  43='Brawl due to narcotics influence'
                  44='Argument over money or property' 45='Other arguments'
                  46='Gangland killing(s) -execution killings'
                  47='Gang killing(s) - street gangs, motorcyc'
                  48='Institutional killing(s) - jail, prison,'
                  49='Sniper attack' 50='Victim killed accidentally hunting'
                  51='Nonself-inflicted gun cleaning'
                  52='Children under 15 playing with gun'
                  53='Negligent gun handling'
                  59='Other manslaughter by negligence'
                  60='Other - nonfelony mercy killings, suicid'
                  61='Child abuse' 62='Domestic violence (beginning 1992)'
                  63='Drive-by shooting (unspecified)'
                  70='Other - suspected felony type'
                  80='Felon attacked peace officer'
                  82='Felon attacked a civilian'
                  83='Felon attempted flight from a crime'
                  84='Felon killed in commission of a crime'
                  85='Felon resisted arrest'
                  86='Not enough information to determine'
                  90='Felon attacked peace officer'
                  91='Felon attacked another peace officer'
                  92='Felon attacked civilian'
                  93='Felon attempted flight from a crime'
                  94='Felon killed in commission of a crime'
                  95='Felon resisted arrest'
                  96='Not enough information to determine'
                  99='Inst. don''t permit determination' ;
  VALUE PRECIP2f  2='Rape' 3='Robbery' 5='Burglary' 6='Larceny'
                  7='Motor vehicle theft' 9='Arson'
                  10='Prostitution and commercial vice'
                  17='Other sex offense'
                  18='Narcotic drug laws (not overdose)' 19='Gambling'
                  26='Other felony - not specified' 32='Abortion'
                  40='Lover''s triangle' 41='Child killed by babysitter'
                  42='Brawl due to alcohol influence'
                  43='Brawl due to narcotics influence'
                  44='Argument over money or property' 45='Other arguments'
                  46='Gangland killing(s) -execution killings'
                  47='Gang killing(s) - street gangs, motorcyc'
                  48='Institutional killing(s) - jail, prison,'
                  49='Sniper attack' 50='Victim killed accidentally hunting'
                  51='Nonself-inflicted gun cleaning'
                  52='Children under 15 playing with gun'
                  53='Negligent gun handling'
                  59='Other manslaughter by negligence'
                  60='Other - nonfelony mercy killings, suicid'
                  61='Child abuse' 62='Domestic violence (beginning 1992)'
                  63='Drive-by shooting (unspecified)'
                  70='Other - suspected felony type'
                  80='Felon attacked peace officer'
                  82='Felon attacked a civilian'
                  83='Felon attempted flight from a crime'
                  84='Felon killed in commission of a crime'
                  85='Felon resisted arrest'
                  86='Not enough information to determine'
                  90='Felon attacked peace officer'
                  91='Felon attacked another peace officer'
                  92='Felon attacked civilian'
                  93='Felon attempted flight from a crime'
                  94='Felon killed in commission of a crime'
                  95='Felon resisted arrest'
                  96='Not enough information to determine'
                  99='Inst. don''t permit determination' ;
  VALUE PRECIP3f  2='Rape' 3='Robbery' 5='Burglary' 6='Larceny'
                  7='Motor vehicle theft' 9='Arson'
                  10='Prostitution and commercial vice'
                  17='Other sex offense'
                  18='Narcotic drug laws (not overdose)' 19='Gambling'
                  26='Other felony - not specified' 32='Abortion'
                  40='Lover''s triangle' 41='Child killed by babysitter'
                  42='Brawl due to alcohol influence'
                  43='Brawl due to narcotics influence'
                  44='Argument over money or property' 45='Other arguments'
                  46='Gangland killing(s) -execution killings'
                  47='Gang killing(s) - street gangs, motorcyc'
                  48='Institutional killing(s) - jail, prison,'
                  49='Sniper attack' 50='Victim killed accidentally hunting'
                  51='Nonself-inflicted gun cleaning'
                  52='Children under 15 playing with gun'
                  53='Negligent gun handling'
                  59='Other manslaughter by negligence'
                  60='Other - nonfelony mercy killings, suicid'
                  61='Child abuse' 62='Domestic violence (beginning 1992)'
                  63='Drive-by shooting (unspecified)'
                  70='Other - suspected felony type'
                  80='Felon attacked peace officer'
                  82='Felon attacked a civilian'
                  83='Felon attempted flight from a crime'
                  84='Felon killed in commission of a crime'
                  85='Felon resisted arrest'
                  86='Not enough information to determine'
                  90='Felon attacked peace officer'
                  91='Felon attacked another peace officer'
                  92='Felon attacked civilian'
                  93='Felon attempted flight from a crime'
                  94='Felon killed in commission of a crime'
                  95='Felon resisted arrest'
                  96='Not enough information to determine'
                  99='Inst. don''t permit determination' ;
  VALUE SUS1SEX   0='Unknown' 1='Male' 2='Female' ;
  VALUE $SUS1RAf  '0'='Unknown' '1'='White (not Hispanic)' '2'='Hispanic'
                  '3'='Black' '4'='American Indian' '5'='Chinese'
                  '6'='Japanese' '7'='Filipino' '8'='Other'
                  '9'='Pacific Islander' 'A'='Other Asian' 'B'='Black'
                  'C'='Chinese' 'D'='Cambodian' 'F'='Filipino'
                  'G'='Guamanian' 'H'='Hispanic' 'I'='American Indian'
                  'J'='Japanese' 'K'='Korean' 'L'='Laotian' 'O'='Other'
                  'P'='Pacific Islander' 'S'='Samoan' 'U'='Hawaiian'
                  'V'='Vietnamese' 'W'='White' 'X'='Unknown' 'Z'='Asian' ;
  VALUE SUS2SEX   0='Unknown' 1='Male' 2='Female' ;
  VALUE $SUS2RAf  '0'='Unknown' '1'='White (not Hispanic)' '2'='Hispanic'
                  '3'='Black' '4'='American Indian' '5'='Chinese'
                  '6'='Japanese' '7'='Filipino' '8'='Other'
                  '9'='Pacific Islander' 'A'='Other Asian' 'B'='Black'
                  'C'='Chinese' 'D'='Cambodian' 'F'='Filipino'
                  'G'='Guamanian' 'H'='Hispanic' 'I'='American Indian'
                  'J'='Japanese' 'K'='Korean' 'L'='Laotian' 'O'='Other'
                  'P'='Pacific Islander' 'S'='Samoan' 'U'='Hawaiian'
                  'V'='Vietnamese' 'W'='White' 'X'='Unknown' 'Z'='Asian' ;
  VALUE SUS3SEX   0='Unknown' 1='Male' 2='Female' ;
  VALUE $SUS3RAf  '0'='Unknown' '1'='White (not Hispanic)' '2'='Hispanic'
                  '3'='Black' '4'='American Indian' '5'='Chinese'
                  '6'='Japanese' '7'='Filipino' '8'='Other'
                  '9'='Pacific Islander' 'A'='Other Asian' 'B'='Black'
                  'C'='Chinese' 'D'='Cambodian' 'F'='Filipino'
                  'G'='Guamanian' 'H'='Hispanic' 'I'='American Indian'
                  'J'='Japanese' 'K'='Korean' 'L'='Laotian' 'O'='Other'
                  'P'='Pacific Islander' 'S'='Samoan' 'U'='Hawaiian'
                  'V'='Vietnamese' 'W'='White' 'X'='Unknown' 'Z'='Asian' ;
  VALUE SUS4SEX   0='Unknown' 1='Male' 2='Female' ;
  VALUE $SUS4RAf  '0'='Unknown' '1'='White (not Hispanic)' '2'='Hispanic'
                  '3'='Black' '4'='American Indian' '5'='Chinese'
                  '6'='Japanese' '7'='Filipino' '8'='Other'
                  '9'='Pacific Islander' 'A'='Other Asian' 'B'='Black'
                  'C'='Chinese' 'D'='Cambodian' 'F'='Filipino'
                  'G'='Guamanian' 'H'='Hispanic' 'I'='American Indian'
                  'J'='Japanese' 'K'='Korean' 'L'='Laotian' 'O'='Other'
                  'P'='Pacific Islander' 'S'='Samoan' 'U'='Hawaiian'
                  'V'='Vietnamese' 'W'='White' 'X'='Unknown' 'Z'='Asian' ;
  VALUE $BIRTHPL  'AK'='Alaska' 'AL'='Alabama' 'AR'='Arkansas' 'AZ'='Arizona'
                  'CA'='California' 'CH'='China' 'CN'='Canada'
                  'CO'='Colorado' 'CT'='Connecticut' 'CU'='Cuba'
                  'DC'='Dist. Of Columbia' 'DE'='Delaware' 'FL'='Florida'
                  'GA'='Georgia' 'GU'='Guam' 'HI'='Hawaii' 'IA'='Iowa'
                  'ID'='Idaho' 'IL'='Illinois' 'IN'='Indiana' 'JA'='Japan'
                  'KS'='Kansas' 'KY'='Kentucky' 'LA'='Louisiana'
                  'MA'='Massachusetts' 'MD'='Maryland' 'ME'='Maine'
                  'MI'='Michigan' 'MN'='Minnesota' 'MO'='Missouri'
                  'MS'='Mississippi' 'MT'='Montana' 'MX'='Mexico'
                  'NA'='Unknown' 'NB'='Nebraska' 'NC'='North Carolina'
                  'ND'='North Dakota' 'NH'='New Hampshire' 'NJ'='New Jersey'
                  'NM'='New Mexico' 'NV'='Nevada' 'NY'='New York' 'OH'='Ohio'
                  'OK'='Oklahoma' 'OR'='Oregon' 'PA'='Pennsylvania'
                  'PI'='Philippines' 'PR'='Puerto Rico' 'RE'='Rest (other)'
                  'RI'='Rhode Island' 'SC'='South Carolina'
                  'SD'='South Dakota' 'TN'='Tennessee' 'TX'='Texas'
                  'UT'='Utah' 'VA'='Virginia' 'VI'='Virgin Islands'
                  'VN'='Vietnam' 'VT'='Vermont' 'WA'='Washington'
                  'WI'='Wisconsin' 'WV'='West Virginia' 'WY'='Wyoming' ;
  VALUE $PLDEATH  '01'='Alameda' '02'='Alpine' '03'='Amador' '04'='Butte'
                  '05'='Calaveras' '06'='Colusa' '07'='Contra Costa'
                  '08'='Del Norte' '09'='El Dorado' '10'='Fresno'
                  '11'='Glenn' '12'='Humbolt' '13'='Imperial' '14'='Inyo'
                  '15'='Kern' '16'='Kings' '17'='Lake' '18'='Lassen'
                  '19'='Los Angeles' '20'='Madera' '21'='Marin'
                  '22'='Mariposa' '23'='Mendocino' '24'='Merced' '25'='Modoc'
                  '26'='Mono' '27'='Monterey' '28'='Napa' '29'='Nevada'
                  '30'='Orange' '31'='Placer' '32'='Plumas' '33'='Riverside'
                  '34'='Sacramento' '35'='San Benito' '36'='San Bernardino'
                  '37'='San Diego' '38'='San Francisco' '39'='San Joaquin'
                  '40'='San Luis Obispo' '41'='San Mateo'
                  '42'='Santa Barbara' '43'='Santa Clara' '44'='Santa Cruz'
                  '45'='Shasta' '46'='Sierra' '47'='Siskiyou' '48'='Solano'
                  '49'='Sonoma' '50'='Stanislaus' '51'='Sutter' '52'='Tehama'
                  '53'='Trinity' '54'='Tulare' '55'='Tuolumne' '56'='Ventura'
                  '57'='Yolo' '58'='Yuba' 'NV'='Nevada' ;
  VALUE WORKINJ   1='Yes' 2='No' 9='Unknown' ;
  VALUE $CNTYRES  '01'='Alameda' '02'='Alpine' '03'='Amador' '04'='Butte'
                  '05'='Calaveras' '06'='Colusa' '07'='Contra Costa'
                  '08'='Del Norte' '09'='El Dorado' '10'='Fresno'
                  '11'='Glenn' '12'='Humbolt' '13'='Imperial' '14'='Inyo'
                  '15'='Kern' '16'='Kings' '17'='Lake' '18'='Lassen'
                  '19'='Los Angeles' '20'='Madera' '21'='Marin'
                  '22'='Mariposa' '23'='Mendocino' '24'='Merced' '25'='Modoc'
                  '26'='Mono' '27'='Monterey' '28'='Napa' '29'='Nevada'
                  '30'='Orange' '31'='Placer' '32'='Plumas' '33'='Riverside'
                  '34'='Sacramento' '35'='San Benito' '36'='San Bernardino'
                  '37'='San Diego' '38'='San Francisco' '39'='San Joaquin'
                  '40'='San Luis Obispo' '41'='San Mateo'
                  '42'='Santa Barbara' '43'='Santa Clara' '44'='Santa Cruz'
                  '45'='Shasta' '46'='Sierra' '47'='Siskiyou' '48'='Solano'
                  '49'='Sonoma' '50'='Stanislaus' '51'='Sutter' '52'='Tehama'
                  '53'='Trinity' '54'='Tulare' '55'='Tuolumne' '56'='Ventura'
                  '57'='Yolo' '58'='Yuba' '91'='Canada' '92'='Mexico'
                  '93'='Other countries' '94'='Guam' '95'='Puerto Rico'
                  '96'='Virgin Islands' '97'='Cuba' 'AK'='Alaska'
                  'AL'='Alabama' 'AR'='Arkansas' 'AZ'='Arizona'
                  'CO'='Colorado' 'CT'='Connecticut' 'DC'='Dist. Of Columbia'
                  'DE'='Delaware' 'FL'='Florida' 'GA'='Georgia' 'HI'='Hawaii'
                  'IA'='Iowa' 'ID'='Idaho' 'IL'='Illinois' 'IN'='Indiana'
                  'KS'='Kansas' 'Ky'='Kentucky' 'LA'='Louisiana'
                  'MA'='Massachusetts' 'MD'='Maryland' 'ME'='Maine'
                  'MI'='Michigan' 'MN'='Minnesota' 'MO'='Missouri'
                  'MS'='Mississippi' 'MT'='Montana' 'NB'='Nebraska'
                  'NC'='North Carolina' 'ND'='North Dakota'
                  'NH'='New Hampshire' 'NJ'='New Jersey' 'NM'='New Mexico'
                  'NV'='Nevada' 'NY'='New York' 'OH'='Ohio' 'OK'='Oklahoma'
                  'OR'='Oregon' 'PA'='Pennsylvania' 'RI'='Rhode Island'
                  'SC'='South Carolina' 'SD'='South Dakota' 'TN'='Tennessee'
                  'TX'='Texas' 'UT'='Utah' 'VA'='Virginia' 'VT'='Vermont'
                  'WA'='Washington' 'WI'='Wisconsin' 'WV'='West Virginia'
                  'WY'='Wyoming' ;
  VALUE EDUCATN   13='1 year of college' 14='2 years of college'
                  15='3 years of college' 16='4 years of college'
                  17='5+ years of college' 99='Unknown or not available' ;
  VALUE AGEYEARS  99='Unknown or not reported' ;
  VALUE VICAGE    999='Unknown or not reported' ;
  VALUE FLAG      0='No estimate (incident day as reported)'
                  1='Estimate (incident day set to 01)' ;
  VALUE RACE      10='White' 20='Black' 30='American Indian'
                  40='Asian-unspecified' 41='Asian-specified'
                  42='Asian-Chinese' 43='Asian-Japanese' 44='Asian-Korean'
                  45='Asian-Vietnamese' 46='Asian-Cambodian' 47='Asian-Thai'
                  48='Asian-Laotian' 51='Other-specified'
                  52='Indian (excludes American Indian, Aleut' 53='Filipino'
                  54='Hawaiian' 55='Guamanian' 56='Samoan' 57='Eskimo'
                  58='Aleut' 59='Pacific Islander(excludes Hawaiian, Guam'
                  98='Refused to state' 99='Unknown' ;
  VALUE SEX       0='Unknown' 1='Male' 2='Female' ;
  VALUE STATERES  1='Alabama' 2='Alaska' 3='Arizona' 4='Arkansas'
                  5='California' 6='Colorado' 7='Connecticut' 8='Delaware'
                  9='Dist. Of Columbia' 10='Florida' 11='Georgia' 12='Hawaii'
                  13='Idaho' 14='Illinois' 15='Indiana' 16='Iowa' 17='Kansas'
                  18='Kentucky' 19='Louisiana' 20='Maine' 21='Maryland'
                  22='Massachusetts' 23='Michigan' 24='Minnesota'
                  25='Mississippi' 26='Missouri' 27='Montana' 28='Nebraska'
                  29='Nevada' 30='New Hampshire' 31='New Jersey'
                  32='New Mexico' 33='New York' 34='North Carolina'
                  35='North Dakota' 36='Ohio' 37='Oklahoma' 38='Oregon'
                  39='Pennsylvania' 40='Rhode Island' 41='South Carolina'
                  42='South Dakota' 43='Tennessee' 44='Texas' 45='Utah'
                  46='Vermont' 47='Virginia' 48='Washington'
                  49='West Virginia' 50='Wisconsin' 51='Wyoming'
                  52='Puerto Rico' 53='Virgin Islands' 54='Guam' 55='Canada'
                  56='Cuba' 57='Mexico' 59='Rest of world' ;
  VALUE MARSTAT   1='Married' 2='Single, never married' 3='Annulled'
                  4='Divorced' 5='Widowed' 9='Unknown/not stated' ;
  VALUE HISPANIC  1='Not Spanish/Hispanic'
                  2='Mexican/Mexican-American/Chicano' 3='Puerto Rican'
                  4='Cuban' 5='Central/So. American'
                  6='(Born outside U.S.),other Spanish/Hispan'
                  7='Code not used'
                  8='(Born in the U.S.), other Spanish/Hispan'
                  9='Unknown or unreported' ;
  VALUE MATCH     0='Death record did not match with homicide'
                  1='Death record matched with homicide recor' ;
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA;
INFILE "data-filename" LRECL=189;
INPUT
        CNTYJUR 1-2             JURISDIC $3-6
        BCSNUM 7-11             TOTVICT 12-13           TOTOFFEN 14-15
        VICSEX 16               VICRACE $17             CRIMEST 18
        RELATN1 19-20           RELATN2 21-22           RELATN3 23-24
        RELATN4 25-26           INCDTIME 27-28          INCDDAY 29
        DEATHYR 30-33           WEAPON 34-35            LOCATION 36-37
        PRECIP1 38-39           PRECIP2 40-41           PRECIP3 42-43
        SUS1SEX 44              SUS1RACE $45            SUS1AGE 46-47
        SUS2SEX 48              SUS2RACE $49            SUS2AGE 50-51
        SUS3SEX 52              SUS3RACE $53            SUS3AGE 54-55
        SUS4SEX 56              SUS4RACE $57            SUS4AGE 58-59
        BIRTHPL $60-61          PLDEATH $62-63          WORKINJ 64
        CNTYRES $65-66          ICD9 $67-70             INJTODTH 71-73
        EDUCATN 74-75           ZIPCODE 76-80           AGEYEARS 81-82
        CENSUS 83-86            ICD10 $87-90            DOB $91-101
        VICAGE 102-103          DOD $104-114            ARRDATE1 $115-125
        ARRDATE2 $126-136       ARRDATE3 $137-147       ARRDATE4 $148-158
        FLAG 159                INCDDATE $160-170       INJDATE $171-181
        RACE 182-183            SEX 184                 STATERES 185-186
        MARSTAT 187             HISPANIC 188            MATCH 189
        ;


* SAS LABEL STATEMENT;

LABEL
   CNTYJUR = 'JURISDICTION COUNTY'
   JURISDIC= 'LAW ENFORCEMENT AGENCY JURISDICTION'
   BCSNUM  = 'UNIQUE CODE FOR EACH INCIDENT'
   TOTVICT = 'TOTAL NUMBER OF VICTIMS KILLED'
   TOTOFFEN= 'TOTAL NUMBER OF OFFENDERS INVOLVED'
   VICSEX  = 'SEX OF VICTIM'
   VICRACE = 'RACE OF VICTIM'
   CRIMEST = 'CRIME STATUS'
   RELATN1 = 'VICTIM''S RELATIONSHIP TO SUSPECT #1'
   RELATN2 = 'VICTIM''S RELATIONSHIP TO SUSPECT #2'
   RELATN3 = 'VICTIM''S RELATIONSHIP TO SUSPECT #3'
   RELATN4 = 'VICTIM''S RELATIONSHIP TO SUSPECT #4'
   INCDTIME= 'TIME OF INCIDENT IN MILITARY HOURS'
   INCDDAY = 'DAY OF WEEK OF INCIDENT'
   DEATHYR = 'YEAR OF DEATH'
   WEAPON  = 'WEAPON USED IN HOMICIDE'
   LOCATION= 'LOCATION OF INCIDENT'
   PRECIP1 = '1ST PROMINENT PRECIPITATING EVENT'
   PRECIP2 = '2ND MOST PROMINENT PRECIPITATING EVENT'
   PRECIP3 = '3RD MOST PROMINENT PRECIPITATING EVENT'
   SUS1SEX = 'SEX OF FIRST LISTED SUSPECT'
   SUS1RACE= 'RACE OF FIRST LISTED SUSPECT'
   SUS1AGE = 'AGE OF FIRST LISTED SUSPECT'
   SUS2SEX = 'SEX OF SECOND LISTED SUSPECT'
   SUS2RACE= 'RACE OF SECOND LISTED SUSPECT'
   SUS2AGE = 'AGE OF SECOND LISTED SUSPECT'
   SUS3SEX = 'SEX OF THIRD LISTED SUSPECT'
   SUS3RACE= 'RACE OF THIRD LISTED SUSPECT'
   SUS3AGE = 'AGE OF THIRD LISTED SUSPECT'
   SUS4SEX = 'SEX OF FOURTH LISTED SUSPECT'
   SUS4RACE= 'RACE OF FOURTH LISTED SUSPECT'
   SUS4AGE = 'AGE OF FOURTH LISTED SUSPECT'
   BIRTHPL = 'VS - PLACE OF BIRTH'
   PLDEATH = 'VS - COUNTY OF OCCURRENCE'
   WORKINJ = 'INJURY CAUSED AT WORK'
   CNTYRES = 'VS - COUNTY OF VICTIM''S RESIDENCE'
   ICD9    = 'VS - CAUSE OF DEATH E-CODE FOR 1990-98'
   INJTODTH= 'VS - TIME FROM INJURY TO DEATH IN DAYS'
   EDUCATN = 'VS - EDUCATION LEVEL'
   ZIPCODE = 'ZIP CODE OF VICTIM''S RESIDENCE'
   AGEYEARS= 'VS - AGE IN YEARS'
   CENSUS  = 'VS - CENSUS CODE OF RESIDENCE'
   ICD10   = 'VS - CAUSE OF DEATH E-CODE FOR 1999'
   DOB     = 'VS - DATE OF BIRTH'
   VICAGE  = 'AGE OF VICTIM'
   DOD     = 'VS - DATE OF DEATH'
   ARRDATE1= 'DATE OF ARREST FOR FIRST SUSPECT'
   ARRDATE2= 'DATE OF ARREST FOR SECOND SUSPECT'
   ARRDATE3= 'DATE OF ARREST FOR THIRD SUSPECT'
   ARRDATE4= 'DATE OF ARREST FOR FOURTH SUSPECT'
   FLAG    = 'ESTIMATE - IF INCIDENT DAY UNKNOWN THEN'
   INCDDATE= 'DATE OF INCIDENT'
   INJDATE = 'VS - DATE OF INJURY'
   RACE    = 'VS - RACE OF VICTIM'
   SEX     = 'VS - SEX OF VICTIM'
   STATERES= 'VS - STATE OF RESIDENCE'
   MARSTAT = 'VS - MARITAL STATUS OF VICTIM'
   HISPANIC= 'VS - VICTIM OF HISPANIC ETHNICITY'
   MATCH   = 'SUPPLEMENTAL HOMICIDE REPORT MATCH'
        ;


* SAS FORMAT STATEMENT;

/*
  FORMAT CNTYJUR CNTYJUR. VICSEX VICSEX. VICRACE $VICRACE.
         CRIMEST CRIMEST. RELATN1 RELATN1f. RELATN2 RELATN2f.
         RELATN3 RELATN3f. RELATN4 RELATN4f. INCDDAY INCDDAY.
         WEAPON WEAPON. LOCATION LOCATION. PRECIP1 PRECIP1f.
         PRECIP2 PRECIP2f. PRECIP3 PRECIP3f. SUS1SEX SUS1SEX.
         SUS1RACE $SUS1RAf. SUS2SEX SUS2SEX. SUS2RACE $SUS2RAf.
         SUS3SEX SUS3SEX. SUS3RACE $SUS3RAf. SUS4SEX SUS4SEX.
         SUS4RACE $SUS4RAf. BIRTHPL $BIRTHPL. PLDEATH $PLDEATH.
         WORKINJ WORKINJ. CNTYRES $CNTYRES. EDUCATN EDUCATN.
         AGEYEARS AGEYEARS. VICAGE VICAGE. FLAG FLAG.
         RACE RACE. SEX SEX. STATERES STATERES.
         MARSTAT MARSTAT. HISPANIC HISPANIC. MATCH MATCH.
          ;
*/

RUN ;
