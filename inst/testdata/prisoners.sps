*-------------------------------------------------------------------------*
*                                                                          
*                     SPSS SETUP FILE FOR ICPSR 36657
*                 NATIONAL PRISONER STATISTICS, 1978-2015
*                             (DATASET 0001: )
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
*  data file is physically located (e.g., "c:\temp\36657-0001-data.txt").
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
*  will be saved (e.g., SAVE OUTFILE="c:\spsswin\data\da36657-0001.sav").
*
*-------------------------------------------------------------------------.

* SPSS FILE HANDLE AND DATA LIST COMMANDS.

FILE HANDLE DATA / NAME="data-filename" LRECL=826.
DATA LIST FILE=DATA /
                YEAR 1-4             STATEID 5-6
           STATE 7-8 (A)                REGION 9           CUSGT1M 10-16
           CUSGT1F 17-21           CUSLT1M 22-26           CUSLT1F 27-30
           CUSUNSM 31-35           CUSUNSF 36-39           CUSTOTM 40-46
           CUSTOTF 47-51           CUSGT1T 52-57           CUSLT1T 58-61
           CUSUNST 62-65           CUSTOTT 66-71          CNOPRIVM 72-78
          CNOPRIVF 79-83           CWPRIVM 84-90           CWPRIVF 91-96
          JURGT1M 97-103         JURGT1F 104-109         JURLT1M 110-114
         JURLT1F 115-118         JURUNSM 119-123         JURUNSF 124-127
         JURTOTM 128-134         JURTOTF 135-140           PVINM 141-145
           PVINF 146-149          PVOTHM 150-154          PVOTHF 155-158
         PVINCLM 159-160         PVINCLF 161-162             LFM 163-167
             LFF 168-171         LFINCLM 172-173         LFINCLF 174-175
        LFCROWDM 176-180        LFCROWDF 181-184         LFCRSTM 185-186
         LFCRSTF 187-188        LFCRINCM 189-190        LFCRINCF 191-192
            FEDM 193-196            FEDF 197-199          OTHSTM 200-203
          OTHSTF 204-206        FACINCLM 207-208        FACINCLF 209-210
        FACROWDM 211-214        FACROWDF 215-217          WHITEM 218-223
          WHITEF 224-228          BLACKM 229-234          BLACKF 235-239
           HISPM 240-245           HISPF 246-250           AIANM 251-255
           AIANF 256-259          ASIANM 260-263          ASIANF 264-267
           NHPIM 268-271           NHPIF 272-274            APIM 275-278
            APIF 279-281        TWORACEM 282-284        TWORACEF 285-287
        ADDRACEM 288-293        ADDRACEF 294-297        UNKRACEM 298-303
        UNKRACEF 304-307        TOTRACEM 308-314        TOTRACEF 315-320
        NOTHISPM 321-326        NOTHISPF 327-331        UNKHISPM 332-337
        UNKHISPF 338-342        TOTHCATM 343-349        TOTHCATF 350-354
         COMMITM 355-360         COMMITF 361-365         PARNEWM 366-370
         PARNEWF 371-374          PARNOM 375-380          PARNOF 381-385
        ADCRNEWM 386-390        ADCRNEWF 391-394         ADCRNOM 395-399
         ADCRNOF 400-404        ADTRANSM 405-408        ADTRANSF 409-411
         ADAWOLM 412-415         ADAWOLF 416-418        ADESCAPM 419-422
        ADESCAPF 423-425         ADAWESM 426-430         ADAWESF 431-434
          ADRETM 435-438          ADRETF 439-441          ADOTHM 442-446
          ADOTHF 447-450          ADTOTM 451-456          ADTOTF 457-461
        RLUNEXPM 462-467        RLUNEXPF 468-472        RLUNCOMM 473-476
        RLUNCOMF 477-479        RLUNOTHM 480-484        RLUNOTHF 485-488
        RLCOPROM 489-493        RLCOPROF 494-498        RLCOSUPM 499-504
        RLCOSUPF 505-509         RLCODPM 510-515         RLCODPF 516-520
        RLCOOTHM 521-525        RLCOOTHF 526-529        RLDEATHM 530-533
        RLDEATHF 534-536         RLAWOLM 537-540         RLAWOLF 541-543
        RLESCAPM 544-547        RLESCAPF 548-550         RLAWESM 551-555
         RLAWESF 556-559         RLTRANM 560-563         RLTRANF 564-566
         RLBONDM 567-570         RLBONDF 571-573          RLOTHM 574-578
          RLOTHF 579-582          RLTOTM 583-588          RLTOTF 589-593
         FLOJANM 594-600         FLOJANF 601-606         FLOADMM 607-612
         FLOADMF 613-617          FLORLM 618-623          FLORLF 624-629
         FLODECM 630-636         FLODECF 637-642        CAPRATEM 643-648
        CAPRATEF 649-653          CAPOPM 654-660          CAPOPF 661-665
         CAPDESM 666-671         CAPDESF 672-676        CAPRATET 677-682
          CAPOPT 683-688         CAPDEST 689-694         HIVTEST 695-696
          HIVINC 697-698          HIVCUR 699-701          HIVREL 702-704
          HIVRAN 705-707         HIVCERT 708-710         HIVHIGH 711-712
          HIVREQ 713-714          HIVORD 715-716         HIVCLIN 717-718
        HIVINCID 719-720          HIVOTH 721-722        HIVASYMM 723-724
        HIVASYMF 725-726        HIVASYMT 727-728        HIVLESSM 729-730
        HIVLESSF 731-732        HIVLESST 733-734        AIDSCONM 735-736
        AIDSCONF 737-738        AIDSCONT 739-742        HIVATOTM 743-747
        HIVATOTF 748-751        HIVATOTT 752-756        CUSLT18M 757-760
        CUSLT18F 761-763        CUSCTZNM 764-768        CUSCTZNF 769-772
        DTHEXECM 773-774        DTHEXECF 775-776        DTHILLNM 777-780
        DTHILLNF 781-783        DTHAIDSM 784-786        DTHAIDSF 787-788
        DTHSUICM 789-791        DTHSUICF 792-793         DTHACCM 794-795
         DTHACCF 796-797        DTHHOMIM 798-799        DTHHOMIF 800-801
        DTHHOMOM 802-803        DTHHOMOF 804-805        DTHPERSM 806-808
        DTHPERSF 809-810         DTHOTHM 811-813         DTHOTHF 814-815
         DTHTOTM 816-819         DTHTOTF 820-822         HANDLEM 823-824
         HANDLEF 825-826
   .

* SPSS VARIABLE LABELS COMMAND

VARIABLE LABELS
   YEAR      'SURVEY YEAR' /
   STATEID   'STATE FIPS IDENTIFICATION CODE' /
   STATE     'STATE TWO-CHARACTER IDENTIFICATION ABBREVIATION' /
   REGION    'STATE REGIONAL CODE' /
   CUSGT1M   'CUSTODY WITH MAXIMUM SENTENCE GREATER THAN 1 YEAR, MALES' /
   CUSGT1F   'CUSTODY WITH MAXIMUM SENTENCE GREATER THAN 1 YEAR, FEMALES' /
   CUSLT1M   'CUSTODY WITH MAXIMUM SENTENCE 1 YEAR OR LESS, MALES' /
   CUSLT1F   'CUSTODY WITH MAXIMUM SENTENCE 1 YEAR OR LESS, FEMALES' /
   CUSUNSM   'CUSTODY UNSENTENCED, MALES' /
   CUSUNSF   'CUSTODY UNSENTENCED, FEMALES' /
   CUSTOTM   'TOTAL UNDER CUSTODY, MALES' /
   CUSTOTF   'TOTAL UNDER CUSTODY, FEMALES' /
   CUSGT1T   'CUSTODY WITH MAXIMUM SENTENCE GREATER THAN 1 YEAR, TOTAL (1978-1982 ONLY)' /
   CUSLT1T   'CUSTODY WITH MAXIMUM SENTENCE 1 YEAR OR LESS, TOTAL (1978-1982 ONLY)' /
   CUSUNST   'CUSTODY UNSENTENCED, TOTAL (1978-1982 ONLY)' /
   CUSTOTT   'TOTAL UNDER CUSTODY, TOTAL (1978-1982 ONLY)' /
   CNOPRIVM  'CUSTODY, EXCLUDING PRIVATE FACILITIES, MALE' /
   CNOPRIVF  'CUSTODY, EXCLUDING PRIVATE FACILITIES, FEMALE' /
   CWPRIVM   'CUSTODY, INCLUDING PRIVATE FACILITIES, MALE' /
   CWPRIVF   'CUSTODY, INCLUDING PRIVATE FACILITIES, FEMALE' /
   JURGT1M   'JURISDICTION WITH MAXIMUM SENTENCE GREATER THAN 1 YEAR, MALES' /
   JURGT1F   'JURISDICTION WITH MAXIMUM SENTENCE GREATER THAN 1 YEAR, FEMALES' /
   JURLT1M   'JURISDICTION WITH MAXIMUM SENTENCE 1 YEAR OR LESS, MALES' /
   JURLT1F   'JURISDICTION WITH MAXIMUM SENTENCE 1 YEAR OR LESS, FEMALES' /
   JURUNSM   'JURISDICTION UNSENTENCED, MALES' /
   JURUNSF   'JURISDICTION UNSENTENCED, FEMALES' /
   JURTOTM   'TOTAL UNDER JURISDICTION, MALES' /
   JURTOTF   'TOTAL UNDER JURISDICTION, FEMALES' /
   PVINM     'INMATES UNDER JURISDICTION HOUSED IN PRIVATELY OPERATED CORRECTIONAL FACILITY IN STATE, MALE' /
   PVINF     'INMATES UNDER JURISDICTION HOUSED IN PRIVATELY OPERATED CORRECTIONAL FACILITY IN STATE, FEMALE' /
   PVOTHM    'INMATES UNDER JURISDICTION HOUSED IN PRIVATELY OPERATED CORRECTIONAL FACILITY IN OTHER STATE, MALE' /
   PVOTHF    'INMATES UNDER JURISDICTION HOUSED IN PRIVATELY OPERATED CORRECTIONAL FACILITY IN OTHER STATE, FEMALE' /
   PVINCLM   'ARE PRIVATELY OPERATED CORRECTION FACILITY NUMBERS INCLUDED IN JURISDICTION TOTALS, MALE' /
   PVINCLF   'ARE PRIVATELY OPERATED CORRECTION FACILITY NUMBERS INCLUDED IN JURISDICTION TOTALS, FEMALE' /
   LFM       'INMATES UNDER JURISDICTION HOUSED IN LOCAL FACILITIES OPERATED BY COUNTY OR OTHER LOCAL AUTHORITY, MALE' /
   LFF       'INMATES UNDER JURISDICTION HOUSED IN LOCAL FACILITIES OPERATED BY COUNTY OR OTHER LOCAL AUTHORITY, FEMALE' /
   LFINCLM   'ARE LOCAL FACILITIES INCLUDED IN JURISDICTION TOTALS, MALE' /
   LFINCLF   'ARE LOCAL FACILITIES INCLUDED IN JURISDICTION TOTALS, FEMALE' /
   LFCROWDM  'LOCAL FACILITIES SOLELY TO EASE PRISON CROWDING, MALE' /
   LFCROWDF  'LOCAL FACILITIES SOLELY TO EASE PRISON CROWDING, FEMALE' /
   LFCRSTM   'LOCAL FACILITIES SOLELY TO EASE PRISON CROWDING, MALE (1978 ONLY)' /
   LFCRSTF   'LOCAL FACILITIES SOLELY TO EASE PRISON CROWDING, FEMALE (1978 ONLY)' /
   LFCRINCM  'LOCAL FACILITIES SOLELY TO EASE CROWDING, INCLUDED IN JURISDICTION TOTALS, MALE' /
   LFCRINCF  'LOCAL FACILITIES SOLELY TO EASE CROWDING, INCLUDED IN JURISDICTION TOTALS, FEMALE' /
   FEDM      'INMATES UNDER JURISDICTION HOUSED IN FEDERAL FACILITIES, MALE' /
   FEDF      'INMATES UNDER JURISDICTION HOUSED IN FEDERAL FACILITIES, FEMALE' /
   OTHSTM    'INMATES UNDER JURISDICTION HOUSED IN OTHER STATES'' FACILITIES, MALE' /
   OTHSTF    'INMATES UNDER JURISDICTION HOUSED IN OTHER STATES'' FACILITIES, FEMALE' /
   FACINCLM  'ARE FEDERAL OR OTHER STATES'' FACILITIES INCLUDED IN JURISDICTION TOTALS, MALE' /
   FACINCLF  'ARE FEDERAL OR OTHER STATES'' FACILITIES INCLUDED IN JURISDICTION TOTALS, FEMALE' /
   FACROWDM  'FEDERAL OR OTHER STATES'' FACILITIES SOLELY TO EASE CROWDING, MALE' /
   FACROWDF  'FEDERAL OR OTHER STATES'' FACILITIES SOLELY TO EASE CROWDING, FEMALE' /
   WHITEM    'WHITE MALE' /
   WHITEF    'WHITE FEMALE' /
   BLACKM    'BLACK MALE' /
   BLACKF    'BLACK FEMALE' /
   HISPM     'HISPANIC OR LATINO MALE' /
   HISPF     'HISPANIC OR LATINO FEMALE' /
   AIANM     'AMERICAN INDIAN OR ALASKA NATIVE MALE' /
   AIANF     'AMERICAN INDIAN OR ALASKA NATIVE FEMALE' /
   ASIANM    'ASIAN MALE' /
   ASIANF    'ASIAN FEMALE' /
   NHPIM     'NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER MALE' /
   NHPIF     'NATIVE HAWAIIAN OR OTHER PACIFIC ISLAND FEMALE' /
   APIM      'ASIAN OR PACIFIC ISLANDER MALE' /
   APIF      'ASIAN OR PACIFIC ISLANDER FEMALE' /
   TWORACEM  'TWO OR MORE RACES MALE' /
   TWORACEF  'TWO OR MORE RACES FEMALE' /
   ADDRACEM  'ADDITIONAL/OTHER CATEGORIES FOR RACE, MALE' /
   ADDRACEF  'ADDITIONAL/OTHER CATEGORIES FOR RACE, FEMALE' /
   UNKRACEM  'UNKNOWN RACE, MALE' /
   UNKRACEF  'UNKNOWN RACE, FEMALE' /
   TOTRACEM  'TOTAL RACE, MALE' /
   TOTRACEF  'TOTAL RACE, FEMALE' /
   NOTHISPM  'NOT OF HISPANIC ORIGIN, MALE' /
   NOTHISPF  'NOT OF HISPANIC ORIGIN, FEMALE' /
   UNKHISPM  'UNKNOWN HISPANIC OR LATINO ORIGIN, MALE' /
   UNKHISPF  'UNKNOWN HISPANIC OR LATINO ORIGIN, FEMALE' /
   TOTHCATM  'TOTAL HISPANIC, NON-HISPANIC, AND UNKNOWN, MALE' /
   TOTHCATF  'TOTAL HISPANIC, NON-HISPANIC, AND UNKNOWN, FEMALE' /
   COMMITM   'NEW COURT COMMITMENTS, MALE' /
   COMMITF   'NEW  COURT COMMITMENTS, FEMALE' /
   PARNEWM   'PAROLE VIOLATORS WITH NEW SENTENCE, MALE' /
   PARNEWF   'PAROLE VIOLATORS WITH NEW SENTENCE, FEMALE' /
   PARNOM    'PAROLE VIOLATORS WITHOUT NEW SENTENCE, MALE' /
   PARNOF    'PAROLE VIOLATORS WITHOUT NEW SENTENCE, FEMALE' /
   ADCRNEWM  'OTHER CONDITIONAL RELEASE VIOLATORS ADMITTED WITH NEW SENTENCE, MALE' /
   ADCRNEWF  'OTHER CONDITIONAL RELEASE VIOLATORS ADMITTED WITH NEW SENTENCE, FEMALE' /
   ADCRNOM   'OTHER CONDITIONAL RELEASE VIOLATORS ADMITTED WITHOUT NEW SENTENCE, MALE' /
   ADCRNOF   'OTHER CONDITIONAL RELEASE VIOLATORS ADMITTED WITHOUT NEW SENTENCE, FEMALE' /
   ADTRANSM  'TRANSFERS ADMITTED FROM OTHER JURISDICTIONS, MALE' /
   ADTRANSF  'TRANSFERS ADMITTED FROM OTHER JURISDICTIONS, FEMALE' /
   ADAWOLM   'AWOL RETURNS, WITH OR WITHOUT NEW SENTENCES, MALE' /
   ADAWOLF   'AWOL RETURNS, WITH OR WITHOUT NEW SENTENCES, FEMALE' /
   ADESCAPM  'ESCAPEE RETURNS, WITH OR WITHOUT NEW SENTENCES, MALE' /
   ADESCAPF  'ESCAPEE RETURNS, WITH OR WITHOUT NEW SENTENCES, FEMALE' /
   ADAWESM   'AWOL OR ESCAPEE RETURNS, COMBINED, MALE' /
   ADAWESF   'AWOL OR ESCAPEE RETURNS, COMBINED, FEMALE' /
   ADRETM    'RETURNS FROM APPEAL OR BOND, MALE' /
   ADRETF    'RETURNS FROM APPEAL OR BOND, FEMALE' /
   ADOTHM    'OTHER ADMISSIONS, MALE' /
   ADOTHF    'OTHER ADMISSIONS, FEMALE' /
   ADTOTM    'TOTAL ADMISSIONS, MALE' /
   ADTOTF    'TOTAL ADMISSIONS, FEMALE' /
   RLUNEXPM  'UNCONDITIONAL RELEASE EXPIRATIONS OF SENTENCE, MALE' /
   RLUNEXPF  'UNCONDITIONAL RELEASE EXPIRATIONS OF SENTENCE, FEMALE' /
   RLUNCOMM  'UNCONDITIONAL RELEASE COMMUTATIONS, MALE' /
   RLUNCOMF  'UNCONDITIONAL RELEASE COMMUTATIONS, FEMALE' /
   RLUNOTHM  'OTHER UNCONDITIONAL RELEASE, MALE' /
   RLUNOTHF  'OTHER UNCONDITIONAL RELEASE, FEMALE' /
   RLCOPROM  'CONDITIONAL RELEASE PROBATIONS, MALE' /
   RLCOPROF  'CONDITIONAL RELEASE PROBATIONS, FEMALE' /
   RLCOSUPM  'SUPERVISED MANDATORY RELEASE, MALE' /
   RLCOSUPF  'SUPERVISED MANDATORY RELEASE, FEMALE' /
   RLCODPM   'DISCRETIONARY PAROLE, MALE' /
   RLCODPF   'DISCRETIONARY PAROLE, FEMALE' /
   RLCOOTHM  'OTHER CONDITIONAL RELEASE, MALE' /
   RLCOOTHF  'OTHER CONDITIONAL RELEASE, FEMALE' /
   RLDEATHM  'DEATHS, MALE' /
   RLDEATHF  'DEATHS, FEMALE' /
   RLAWOLM   'AWOL RELEASE, MALE' /
   RLAWOLF   'AWOL RELEASE, FEMALE' /
   RLESCAPM  'ESCAPE FROM CONFINEMENT, MALE' /
   RLESCAPF  'ESCAPE FROM CONFINEMENT, FEMALE' /
   RLAWESM   'AWOL RELEASE OR ESCAPE, COMBINED, MALE' /
   RLAWESF   'AWOL RELEASE OR ESCAPE, COMBINED, FEMALE' /
   RLTRANM   'TRANSFERS TO OTHER JURISDICTIONS, MALE' /
   RLTRANF   'TRANSFERS TO OTHER JURISDICTIONS, FEMALE' /
   RLBONDM   'RELEASE TO APPEAL OR BOND, MALE' /
   RLBONDF   'RELEASE TO APPEAL OR BOND, FEMALE' /
   RLOTHM    'OTHER RELEASE, MALE' /
   RLOTHF    'OTHER RELEASE, FEMALE' /
   RLTOTM    'TOTAL RELEASES, MALE' /
   RLTOTF    'TOTAL RELEASES, FEMALE' /
   FLOJANM   'UNDER JURISDICTION ON JANUARY 1, [CURRENT YEAR], SENTENCE GT 1 YEAR, MALE [OR DECEMBER 31 OF PRIOR YEAR]' /
   FLOJANF   'UNDER JURISDICTION ON JANUARY 1, [CURRENT YEAR], SENTENCE GT 1 YEAR, FEMALE [OR DECEMBER 31 OF PRIOR YEAR]' /
   FLOADMM   'ADMITTED DURING CURRENT YEAR, SENTENCE GT 1 YEAR, MALE' /
   FLOADMF   'ADMITTED DURING CURRENT YEAR, SENTENCE GT 1 YEAR, FEMALE' /
   FLORLM    'RELEASED DURING CURRENT YEAR, SENTENCE GT 1 YEAR, MALE' /
   FLORLF    'RELEASED DURING CURRENT YEAR, SENTENCE GT 1 YEAR, FEMALE' /
   FLODECM   'UNDER JURISDICTION ON DECEMBER 31, [CURRENT YEAR], SENTENCE GT 1 YEAR, MALE' /
   FLODECF   'UNDER JURISDICTION ON DECEMBER 31, [CURRENT YEAR], SENTENCE GT 1 YEAR, FEMALE' /
   CAPRATEM  'RATED CAPACITY, MALE' /
   CAPRATEF  'RATED CAPACITY, FEMALE' /
   CAPOPM    'OPERATIONAL CAPACITY, MALE' /
   CAPOPF    'OPERATIONAL CAPACITY, FEMALE' /
   CAPDESM   'DESIGN CAPACITY, MALE' /
   CAPDESF   'DESIGN CAPACITY, FEMALE' /
   CAPRATET  'RATED CAPACITY, TOTAL' /
   CAPOPT    'OPERATIONAL CAPACITY, TOTAL' /
   CAPDEST   'DESIGN CAPACITY, TOTAL' /
   HIVTEST   'TESTED INMATES IN CUSTODY FOR HIV ANTIBODY' /
   HIVINC    'TESTED ALL INCOMING INMATES' /
   HIVCUR    'TESTED ALL INMATES CURRENTLY IN CUSTODY' /
   HIVREL    'TESTED ALL INMATES AT TIME OF RELEASE' /
   HIVRAN    'TESTED RANDOM SAMPLES WHILE IN CUSTODY' /
   HIVCERT   'TESTED CERTAIN INMATES' /
   HIVHIGH   'TESTED HIGH RISK GROUPS IN CUSTODY' /
   HIVREQ    'TESTED UPON INMATE REQUEST WHILE IN CUSTODY' /
   HIVORD    'TESTED UPON COURT ORDER OF INMATE IN CUSTODY' /
   HIVCLIN   'TESTED UPON CLINICAL INDICATION OF NEED OF INMATE IN CUSTODY' /
   HIVINCID  'TESTED UPON INVOLVEMENT IN INCIDENT OF INMATE IN CUSTODY' /
   HIVOTH    'TESTED INMATES IN CUSTODY UNDER OTHER CIRCUMSTANCES' /
   HIVASYMM  'ASYMPTOMATIC HIV POSITIVE, MALE' /
   HIVASYMF  'ASYMPTOMATIC HIV POSITIVE, FEMALE' /
   HIVASYMT  'ASYMPTOMATIC HIV POSITIVE, TOTAL' /
   HIVLESSM  'INFECTED WITH LESSER FORMS OF SYMPTOMATIC HIV DISEASE, MALE' /
   HIVLESSF  'INFECTED WITH LESSER FORMS OF SYMPTOMATIC HIV DISEASE,' /
   HIVLESST  'INFECTED WITH LESSER FORMS OF SYMPTOMATIC HIV DISEASE, TOTAL' /
   AIDSCONM  'CONFIRMED TO HAVE AIDS, MALE' /
   AIDSCONF  'CONFIRMED TO HAVE AIDS, FEMALE' /
   AIDSCONT  'CONFIRMED TO HAVE AIDS, TOTAL' /
   HIVATOTM  'TOTAL IN CUSTODY HIV POSITIVE OR WITH AIDS, MALE' /
   HIVATOTF  'TOTAL IN CUSTODY HIV POSITIVE OR WITH AIDS, FEMALE' /
   HIVATOTT  'TOTAL IN CUSTODY HIV POSITIVE OR WITH AIDS, TOTAL' /
   CUSLT18M  'IN CUSTODY UNDER 18 YEARS OF AGE, MALE' /
   CUSLT18F  'IN CUSTODY UNDER 18 YEARS OF AGE, FEMALE' /
   CUSCTZNM  'IN CUSTODY NOT U.S. CITIZENS, MALE' /
   CUSCTZNF  'IN CUSTODY NOT U.S. CITIZENS, FEMALE' /
   DTHEXECM  'DEATHS FROM EXECUTION, MALE' /
   DTHEXECF  'DEATHS FROM EXECUTION, FEMALE' /
   DTHILLNM  'DEATHS FROM ILLNESS OR NATURAL CAUSE, MALE' /
   DTHILLNF  'DEATHS FROM ILLNESS OR NATURAL CAUSE, FEMALE' /
   DTHAIDSM  'DEATHS FROM AIDS, MALE' /
   DTHAIDSF  'DEATHS FROM AIDS, FEMALE' /
   DTHSUICM  'DEATHS FROM SUICIDE, MALE' /
   DTHSUICF  'DEATHS FROM SUICIDE, FEMALE' /
   DTHACCM   'DEATHS FROM ACCIDENTAL INJURY TO SELF, MALE' /
   DTHACCF   'DEATHS FROM ACCIDENTAL INJURY TO SELF, FEMALE' /
   DTHHOMIM  'DEATHS FROM HOMICIDE BY OTHER INMATES, MALE' /
   DTHHOMIF  'DEATHS FROM HOMICIDE  BY OTHER INMATES, FEMALE' /
   DTHHOMOM  'DEATHS FROM OTHER HOMICIDE, MALE' /
   DTHHOMOF  'DEATHS FROM OTHER HOMICIDE, FEMALE' /
   DTHPERSM  'DEATHS CAUSED BY ANOTHER PERSON, MALE' /
   DTHPERSF  'DEATHS CAUSED BY ANOTHER PERSON, FEMALE' /
   DTHOTHM   'OTHER DEATHS, MALE' /
   DTHOTHF   'OTHER DEATHS, FEMALE' /
   DTHTOTM   'TOTAL DEATHS, MALE' /
   DTHTOTF   'TOTAL DEATHS, FEMALE' /
   HANDLEM   'TOTAL INMATES HANDLED, JURISDICTION POPULATION PLUS ADMISSIONS, MALE' /
   HANDLEF   'TOTAL INMATES HANDLED, JURISDICTION POPULATION PLUS ADMISSIONS, FEMALE' /
   .


* SPSS VALUE LABELS COMMAND.

VALUE LABELS
   STATEID   1 '01. Alabama' 2 '02. Alaska' 4 '04. Arizona' 5 '05. Arkansas'
             6 '06. California' 8 '08. Colorado' 9 '09. Connecticut'
             10 '10. Delaware' 11 '11. District of Columbia' 12 '12. Florida'
             13 '13. Georgia' 15 '15. Hawaii' 16 '16. Idaho'
             17 '17. Illinois' 18 '18. Indiana' 19 '19. Iowa' 20 '20. Kansas'
             21 '21. Kentucky' 22 '22. Louisiana' 23 '23. Maine'
             24 '24. Maryland' 25 '25. Massachusetts' 26 '26. Michigan'
             27 '27. Minnesota' 28 '28. Mississippi' 29 '29. Missouri'
             30 '30. Montana' 31 '31. Nebraska' 32 '32. Nevada'
             33 '33. New Hampshire' 34 '34. New Jersey' 35 '35. New Mexico'
             36 '36. New York' 37 '37. North Carolina' 38 '38. North Dakota'
             39 '39. Ohio' 40 '40. Oklahoma' 41 '41. Oregon'
             42 '42. Pennsylvania' 44 '44. Rhode Island'
             45 '45. South Carolina' 46 '46. South Dakota' 47 '47. Tennessee'
             48 '48. Texas' 49 '49. Utah' 50 '50. Vermont' 51 '51. Virginia'
             52 '52. Jurisdiction shared between States' 53 '53. Washington'
             54 '54. West Virginia' 55 '55. Wisconsin' 56 '56. Wyoming'
             60 'State prison total' 70 'US prison total (state+federal)'
             99 'Federal BOP' /
   REGION    1 'Northeast' 2 'Midwest' 3 'South' 4 'West' 5 'U.S. total'
             6 'Federal Bureau of Prisons' 7 'State total' /
   CUSGT1M
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CUSGT1F
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CUSLT1M
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CUSLT1F
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CUSUNSM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CUSUNSF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CUSTOTM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CUSTOTF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CUSGT1T
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CUSLT1T
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CUSUNST
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CUSTOTT
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CNOPRIVM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CNOPRIVF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CWPRIVM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CWPRIVF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   JURGT1M
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   JURGT1F
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   JURLT1M
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   JURLT1F
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   JURUNSM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   JURUNSF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   JURTOTM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   JURTOTF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   PVINM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   PVINF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   PVOTHM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   PVOTHF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   PVINCLM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' 1 'Yes' 2 'No' /
   PVINCLF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' 1 'Yes' 2 'No' /
   LFM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   LFF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   LFINCLM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' 1 'Yes' 2 'No' /
   LFINCLF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' 1 'Yes' 2 'No' /
   LFCROWDM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   LFCROWDF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   LFCRSTM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   LFCRSTF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   LFCRINCM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   LFCRINCF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   FEDM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   FEDF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   OTHSTM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   OTHSTF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   FACINCLM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' 1 'Yes' 2 'No' /
   FACINCLF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' 1 'Yes' 2 'No' /
   FACROWDM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   FACROWDF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   WHITEM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   WHITEF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   BLACKM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   BLACKF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HISPM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HISPF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   AIANM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   AIANF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   ASIANM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   ASIANF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   NHPIM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   NHPIF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   APIM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   APIF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   TWORACEM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   TWORACEF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   ADDRACEM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   ADDRACEF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   UNKRACEM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   UNKRACEF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   TOTRACEM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   TOTRACEF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   NOTHISPM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   NOTHISPF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   UNKHISPM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   UNKHISPF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   TOTHCATM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   TOTHCATF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   COMMITM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   COMMITF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   PARNEWM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   PARNEWF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   PARNOM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   PARNOF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   ADCRNEWM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   ADCRNEWF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   ADCRNOM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   ADCRNOF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   ADTRANSM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   ADTRANSF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   ADAWOLM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   ADAWOLF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   ADESCAPM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   ADESCAPF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   ADAWESM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   ADAWESF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   ADRETM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   ADRETF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   ADOTHM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   ADOTHF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   ADTOTM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   ADTOTF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLUNEXPM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLUNEXPF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLUNCOMM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLUNCOMF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLUNOTHM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLUNOTHF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLCOPROM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLCOPROF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLCOSUPM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLCOSUPF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLCODPM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLCODPF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLCOOTHM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLCOOTHF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLDEATHM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLDEATHF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLAWOLM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLAWOLF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLESCAPM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLESCAPF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLAWESM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLAWESF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLTRANM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLTRANF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLBONDM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLBONDF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLOTHM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLOTHF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLTOTM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   RLTOTF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   FLOJANM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   FLOJANF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   FLOADMM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   FLOADMF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   FLORLM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   FLORLF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   FLODECM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   FLODECF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CAPRATEM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CAPRATEF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CAPOPM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CAPOPF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CAPDESM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CAPDESF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CAPRATET
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CAPOPT
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CAPDEST
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HIVTEST
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HIVINC
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HIVCUR
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HIVREL
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HIVRAN
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HIVCERT
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HIVHIGH
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HIVREQ
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HIVORD
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HIVCLIN
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HIVINCID
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HIVOTH
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HIVASYMM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HIVASYMF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HIVASYMT
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HIVLESSM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HIVLESSF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HIVLESST
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   AIDSCONM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   AIDSCONF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   AIDSCONT
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HIVATOTM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HIVATOTF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HIVATOTT
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -7 'Item was asked for both males and females, but only the aggregate was reported'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CUSLT18M
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CUSLT18F
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CUSCTZNM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   CUSCTZNF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   DTHEXECM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   DTHEXECF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   DTHILLNM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   DTHILLNF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   DTHAIDSM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   DTHAIDSF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   DTHSUICM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   DTHSUICF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   DTHACCM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   DTHACCF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   DTHHOMIM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   DTHHOMIF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   DTHHOMOM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   DTHHOMOF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   DTHPERSM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   DTHPERSF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   DTHOTHM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   DTHOTHF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   DTHTOTM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   DTHTOTF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HANDLEM
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   HANDLEF
          -9 'Data are missing because the state did not respond to the item'
       -8 'Data are missing because the item was not applicable to the state'
 -2 'Item was asked, but only in the aggregate prison population, not by male or female'
             -1 'Item not asked in survey for this year' /
   .

* SPSS MISSING VALUES COMMAND.

* MISSING VALUES
     YEAR (-9 thru -1) /
     STATEID (-9 thru -1) /
     REGION (-9 thru -1) /
     CUSGT1M (-9 thru -1) /
     CUSGT1F (-9 thru -1) /
     CUSLT1M (-9 thru -1) /
     CUSLT1F (-9 thru -1) /
     CUSUNSM (-9 thru -1) /
     CUSUNSF (-9 thru -1) /
     CUSTOTM (-9 thru -1) /
     CUSTOTF (-9 thru -1) /
     CUSGT1T (-9 thru -1) /
     CUSLT1T (-9 thru -1) /
     CUSUNST (-9 thru -1) /
     CUSTOTT (-9 thru -1) /
     CNOPRIVM (-9 thru -1) /
     CNOPRIVF (-9 thru -1) /
     CWPRIVM (-9 thru -1) /
     CWPRIVF (-9 thru -1) /
     JURGT1M (-9 thru -1) /
     JURGT1F (-9 thru -1) /
     JURLT1M (-9 thru -1) /
     JURLT1F (-9 thru -1) /
     JURUNSM (-9 thru -1) /
     JURUNSF (-9 thru -1) /
     JURTOTM (-9 thru -1) /
     JURTOTF (-9 thru -1) /
     PVINM (-9 thru -1) /
     PVINF (-9 thru -1) /
     PVOTHM (-9 thru -1) /
     PVOTHF (-9 thru -1) /
     PVINCLM (-9 thru -1) /
     PVINCLF (-9 thru -1) /
     LFM (-9 thru -1) /
     LFF (-9 thru -1) /
     LFINCLM (-9 thru -1) /
     LFINCLF (-9 thru -1) /
     LFCROWDM (-9 thru -1) /
     LFCROWDF (-9 thru -1) /
     LFCRSTM (-9 thru -1) /
     LFCRSTF (-9 thru -1) /
     LFCRINCM (-9 thru -1) /
     LFCRINCF (-9 thru -1) /
     FEDM (-9 thru -1) /
     FEDF (-9 thru -1) /
     OTHSTM (-9 thru -1) /
     OTHSTF (-9 thru -1) /
     FACINCLM (-9 thru -1) /
     FACINCLF (-9 thru -1) /
     FACROWDM (-9 thru -1) /
     FACROWDF (-9 thru -1) /
     WHITEM (-9 thru -1) /
     WHITEF (-9 thru -1) /
     BLACKM (-9 thru -1) /
     BLACKF (-9 thru -1) /
     HISPM (-9 thru -1) /
     HISPF (-9 thru -1) /
     AIANM (-9 thru -1) /
     AIANF (-9 thru -1) /
     ASIANM (-9 thru -1) /
     ASIANF (-9 thru -1) /
     NHPIM (-9 thru -1) /
     NHPIF (-9 thru -1) /
     APIM (-9 thru -1) /
     APIF (-9 thru -1) /
     TWORACEM (-9 thru -1) /
     TWORACEF (-9 thru -1) /
     ADDRACEM (-9 thru -1) /
     ADDRACEF (-9 thru -1) /
     UNKRACEM (-9 thru -1) /
     UNKRACEF (-9 thru -1) /
     TOTRACEM (-9 thru -1) /
     TOTRACEF (-9 thru -1) /
     NOTHISPM (-9 thru -1) /
     NOTHISPF (-9 thru -1) /
     UNKHISPM (-9 thru -1) /
     UNKHISPF (-9 thru -1) /
     TOTHCATM (-9 thru -1) /
     TOTHCATF (-9 thru -1) /
     COMMITM (-9 thru -1) /
     COMMITF (-9 thru -1) /
     PARNEWM (-9 thru -1) /
     PARNEWF (-9 thru -1) /
     PARNOM (-9 thru -1) /
     PARNOF (-9 thru -1) /
     ADCRNEWM (-9 thru -1) /
     ADCRNEWF (-9 thru -1) /
     ADCRNOM (-9 thru -1) /
     ADCRNOF (-9 thru -1) /
     ADTRANSM (-9 thru -1) /
     ADTRANSF (-9 thru -1) /
     ADAWOLM (-9 thru -1) /
     ADAWOLF (-9 thru -1) /
     ADESCAPM (-9 thru -1) /
     ADESCAPF (-9 thru -1) /
     ADAWESM (-9 thru -1) /
     ADAWESF (-9 thru -1) /
     ADRETM (-9 thru -1) /
     ADRETF (-9 thru -1) /
     ADOTHM (-9 thru -1) /
     ADOTHF (-9 thru -1) /
     ADTOTM (-9 thru -1) /
     ADTOTF (-9 thru -1) /
     RLUNEXPM (-9 thru -1) /
     RLUNEXPF (-9 thru -1) /
     RLUNCOMM (-9 thru -1) /
     RLUNCOMF (-9 thru -1) /
     RLUNOTHM (-9 thru -1) /
     RLUNOTHF (-9 thru -1) /
     RLCOPROM (-9 thru -1) /
     RLCOPROF (-9 thru -1) /
     RLCOSUPM (-9 thru -1) /
     RLCOSUPF (-9 thru -1) /
     RLCODPM (-9 thru -1) /
     RLCODPF (-9 thru -1) /
     RLCOOTHM (-9 thru -1) /
     RLCOOTHF (-9 thru -1) /
     RLDEATHM (-9 thru -1) /
     RLDEATHF (-9 thru -1) /
     RLAWOLM (-9 thru -1) /
     RLAWOLF (-9 thru -1) /
     RLESCAPM (-9 thru -1) /
     RLESCAPF (-9 thru -1) /
     RLAWESM (-9 thru -1) /
     RLAWESF (-9 thru -1) /
     RLTRANM (-9 thru -1) /
     RLTRANF (-9 thru -1) /
     RLBONDM (-9 thru -1) /
     RLBONDF (-9 thru -1) /
     RLOTHM (-9 thru -1) /
     RLOTHF (-9 thru -1) /
     RLTOTM (-9 thru -1) /
     RLTOTF (-9 thru -1) /
     FLOJANM (-9 thru -1) /
     FLOJANF (-9 thru -1) /
     FLOADMM (-9 thru -1) /
     FLOADMF (-9 thru -1) /
     FLORLM (-9 thru -1) /
     FLORLF (-9 thru -1) /
     FLODECM (-9 thru -1) /
     FLODECF (-9 thru -1) /
     CAPRATEM (-9 thru -1) /
     CAPRATEF (-9 thru -1) /
     CAPOPM (-9 thru -1) /
     CAPOPF (-9 thru -1) /
     CAPDESM (-9 thru -1) /
     CAPDESF (-9 thru -1) /
     CAPRATET (-9 thru -1) /
     CAPOPT (-9 thru -1) /
     CAPDEST (-9 thru -1) /
     HIVTEST (-9 thru -1) /
     HIVINC (-9 thru -1) /
     HIVCUR (-9 thru -1) /
     HIVREL (-9 thru -1) /
     HIVRAN (-9 thru -1) /
     HIVCERT (-9 thru -1) /
     HIVHIGH (-9 thru -1) /
     HIVREQ (-9 thru -1) /
     HIVORD (-9 thru -1) /
     HIVCLIN (-9 thru -1) /
     HIVINCID (-9 thru -1) /
     HIVOTH (-9 thru -1) /
     HIVASYMM (-9 thru -1) /
     HIVASYMF (-9 thru -1) /
     HIVASYMT (-9 thru -1) /
     HIVLESSM (-9 thru -1) /
     HIVLESSF (-9 thru -1) /
     HIVLESST (-9 thru -1) /
     AIDSCONM (-9 thru -1) /
     AIDSCONF (-9 thru -1) /
     AIDSCONT (-9 thru -1) /
     HIVATOTM (-9 thru -1) /
     HIVATOTF (-9 thru -1) /
     HIVATOTT (-9 thru -1) /
     CUSLT18M (-9 thru -1) /
     CUSLT18F (-9 thru -1) /
     CUSCTZNM (-9 thru -1) /
     CUSCTZNF (-9 thru -1) /
     DTHEXECM (-9 thru -1) /
     DTHEXECF (-9 thru -1) /
     DTHILLNM (-9 thru -1) /
     DTHILLNF (-9 thru -1) /
     DTHAIDSM (-9 thru -1) /
     DTHAIDSF (-9 thru -1) /
     DTHSUICM (-9 thru -1) /
     DTHSUICF (-9 thru -1) /
     DTHACCM (-9 thru -1) /
     DTHACCF (-9 thru -1) /
     DTHHOMIM (-9 thru -1) /
     DTHHOMIF (-9 thru -1) /
     DTHHOMOM (-9 thru -1) /
     DTHHOMOF (-9 thru -1) /
     DTHPERSM (-9 thru -1) /
     DTHPERSF (-9 thru -1) /
     DTHOTHM (-9 thru -1) /
     DTHOTHF (-9 thru -1) /
     DTHTOTM (-9 thru -1) /
     DTHTOTF (-9 thru -1) /
     HANDLEM (-9 thru -1) /
     HANDLEF (-9 thru -1) /
   .

EXECUTE.

* SPSS VARIABLE LEVEL COMMAND.

VARIABLE LEVEL
   YEAR
   CUSGT1M
   CUSGT1F
   CUSLT1M
   CUSLT1F
   CUSUNSM
   CUSUNSF
   CUSTOTM
   CUSTOTF
   CUSGT1T
   CUSLT1T
   CUSUNST
   CUSTOTT
   CNOPRIVM
   CNOPRIVF
   CWPRIVM
   CWPRIVF
   JURGT1M
   JURGT1F
   JURLT1M
   JURLT1F
   JURUNSM
   JURUNSF
   JURTOTM
   JURTOTF
   PVINM
   PVINF
   PVOTHM
   PVOTHF
   LFM
   LFF
   LFCROWDM
   LFCROWDF
   LFCRSTM
   LFCRSTF
   LFCRINCM
   LFCRINCF
   FEDM
   FEDF
   OTHSTM
   OTHSTF
   FACROWDM
   FACROWDF
   WHITEM
   WHITEF
   BLACKM
   BLACKF
   HISPM
   HISPF
   AIANM
   AIANF
   ASIANM
   ASIANF
   NHPIM
   NHPIF
   APIM
   APIF
   TWORACEM
   TWORACEF
   ADDRACEM
   ADDRACEF
   UNKRACEM
   UNKRACEF
   TOTRACEM
   TOTRACEF
   NOTHISPM
   NOTHISPF
   UNKHISPM
   UNKHISPF
   TOTHCATM
   TOTHCATF
   COMMITM
   COMMITF
   PARNEWM
   PARNEWF
   PARNOM
   PARNOF
   ADCRNEWM
   ADCRNEWF
   ADCRNOM
   ADCRNOF
   ADTRANSM
   ADTRANSF
   ADAWOLM
   ADAWOLF
   ADESCAPM
   ADESCAPF
   ADAWESM
   ADAWESF
   ADRETM
   ADRETF
   ADOTHM
   ADOTHF
   ADTOTM
   ADTOTF
   RLUNEXPM
   RLUNEXPF
   RLUNCOMM
   RLUNCOMF
   RLUNOTHM
   RLUNOTHF
   RLCOPROM
   RLCOPROF
   RLCOSUPM
   RLCOSUPF
   RLCODPM
   RLCODPF
   RLCOOTHM
   RLCOOTHF
   RLDEATHM
   RLDEATHF
   RLAWOLM
   RLAWOLF
   RLESCAPM
   RLESCAPF
   RLAWESM
   RLAWESF
   RLTRANM
   RLTRANF
   RLBONDM
   RLBONDF
   RLOTHM
   RLOTHF
   RLTOTM
   RLTOTF
   FLOJANM
   FLOJANF
   FLOADMM
   FLOADMF
   FLORLM
   FLORLF
   FLODECM
   FLODECF
   CAPRATEM
   CAPRATEF
   CAPOPM
   CAPOPF
   CAPDESM
   CAPDESF
   CAPRATET
   CAPOPT
   CAPDEST
   HIVTEST
   HIVINC
   HIVCUR
   HIVREL
   HIVRAN
   HIVCERT
   HIVHIGH
   HIVREQ
   HIVORD
   HIVCLIN
   HIVINCID
   HIVOTH
   HIVASYMM
   HIVASYMF
   HIVASYMT
   HIVLESSM
   HIVLESSF
   HIVLESST
   AIDSCONM
   AIDSCONF
   AIDSCONT
   HIVATOTM
   HIVATOTF
   HIVATOTT
   CUSLT18M
   CUSLT18F
   CUSCTZNM
   CUSCTZNF
   DTHEXECM
   DTHEXECF
   DTHILLNM
   DTHILLNF
   DTHAIDSM
   DTHAIDSF
   DTHSUICM
   DTHSUICF
   DTHACCM
   DTHACCF
   DTHHOMIM
   DTHHOMIF
   DTHHOMOM
   DTHHOMOF
   DTHPERSM
   DTHPERSF
   DTHOTHM
   DTHOTHF
   DTHTOTM
   DTHTOTF
   HANDLEM
   HANDLEF
    (scale).

VARIABLE LEVEL
   STATEID
   STATE
   REGION
   PVINCLM
   PVINCLF
   LFINCLM
   LFINCLF
   FACINCLM
   FACINCLF
    (nominal).

* SPSS PRINT FORMAT COMMAND.

PRINT FORMAT
   YEAR (F4)
   STATEID (F2)
   REGION (F1)
   CUSGT1M (F7)
   CUSGT1F (F5)
   CUSLT1M (F5)
   CUSLT1F (F4)
   CUSUNSM (F5)
   CUSUNSF (F4)
   CUSTOTM (F7)
   CUSTOTF (F5)
   CUSGT1T (F6)
   CUSLT1T (F4)
   CUSUNST (F4)
   CUSTOTT (F6)
   CNOPRIVM (F7)
   CNOPRIVF (F5)
   CWPRIVM (F7)
   CWPRIVF (F6)
   JURGT1M (F7)
   JURGT1F (F6)
   JURLT1M (F5)
   JURLT1F (F4)
   JURUNSM (F5)
   JURUNSF (F4)
   JURTOTM (F7)
   JURTOTF (F6)
   PVINM (F5)
   PVINF (F4)
   PVOTHM (F5)
   PVOTHF (F4)
   PVINCLM (F2)
   PVINCLF (F2)
   LFM (F5)
   LFF (F4)
   LFINCLM (F2)
   LFINCLF (F2)
   LFCROWDM (F5)
   LFCROWDF (F4)
   LFCRSTM (F2)
   LFCRSTF (F2)
   LFCRINCM (F2)
   LFCRINCF (F2)
   FEDM (F4)
   FEDF (F3)
   OTHSTM (F4)
   OTHSTF (F3)
   FACINCLM (F2)
   FACINCLF (F2)
   FACROWDM (F4)
   FACROWDF (F3)
   WHITEM (F6)
   WHITEF (F5)
   BLACKM (F6)
   BLACKF (F5)
   HISPM (F6)
   HISPF (F5)
   AIANM (F5)
   AIANF (F4)
   ASIANM (F4)
   ASIANF (F4)
   NHPIM (F4)
   NHPIF (F3)
   APIM (F4)
   APIF (F3)
   TWORACEM (F3)
   TWORACEF (F3)
   ADDRACEM (F6)
   ADDRACEF (F4)
   UNKRACEM (F6)
   UNKRACEF (F4)
   TOTRACEM (F7)
   TOTRACEF (F6)
   NOTHISPM (F6)
   NOTHISPF (F5)
   UNKHISPM (F6)
   UNKHISPF (F5)
   TOTHCATM (F7)
   TOTHCATF (F5)
   COMMITM (F6)
   COMMITF (F5)
   PARNEWM (F5)
   PARNEWF (F4)
   PARNOM (F6)
   PARNOF (F5)
   ADCRNEWM (F5)
   ADCRNEWF (F4)
   ADCRNOM (F5)
   ADCRNOF (F5)
   ADTRANSM (F4)
   ADTRANSF (F3)
   ADAWOLM (F4)
   ADAWOLF (F3)
   ADESCAPM (F4)
   ADESCAPF (F3)
   ADAWESM (F5)
   ADAWESF (F4)
   ADRETM (F4)
   ADRETF (F3)
   ADOTHM (F5)
   ADOTHF (F4)
   ADTOTM (F6)
   ADTOTF (F5)
   RLUNEXPM (F6)
   RLUNEXPF (F5)
   RLUNCOMM (F4)
   RLUNCOMF (F3)
   RLUNOTHM (F5)
   RLUNOTHF (F4)
   RLCOPROM (F5)
   RLCOPROF (F5)
   RLCOSUPM (F6)
   RLCOSUPF (F5)
   RLCODPM (F6)
   RLCODPF (F5)
   RLCOOTHM (F5)
   RLCOOTHF (F4)
   RLDEATHM (F4)
   RLDEATHF (F3)
   RLAWOLM (F4)
   RLAWOLF (F3)
   RLESCAPM (F4)
   RLESCAPF (F3)
   RLAWESM (F5)
   RLAWESF (F4)
   RLTRANM (F4)
   RLTRANF (F3)
   RLBONDM (F4)
   RLBONDF (F3)
   RLOTHM (F5)
   RLOTHF (F4)
   RLTOTM (F6)
   RLTOTF (F5)
   FLOJANM (F7)
   FLOJANF (F6)
   FLOADMM (F6)
   FLOADMF (F5)
   FLORLM (F6)
   FLORLF (F6)
   FLODECM (F7)
   FLODECF (F6)
   CAPRATEM (F6)
   CAPRATEF (F5)
   CAPOPM (F7)
   CAPOPF (F5)
   CAPDESM (F6)
   CAPDESF (F5)
   CAPRATET (F6)
   CAPOPT (F6)
   CAPDEST (F6)
   HIVTEST (F2)
   HIVINC (F2)
   HIVCUR (F3)
   HIVREL (F3)
   HIVRAN (F3)
   HIVCERT (F3)
   HIVHIGH (F2)
   HIVREQ (F2)
   HIVORD (F2)
   HIVCLIN (F2)
   HIVINCID (F2)
   HIVOTH (F2)
   HIVASYMM (F2)
   HIVASYMF (F2)
   HIVASYMT (F2)
   HIVLESSM (F2)
   HIVLESSF (F2)
   HIVLESST (F2)
   AIDSCONM (F2)
   AIDSCONF (F2)
   AIDSCONT (F4)
   HIVATOTM (F5)
   HIVATOTF (F4)
   HIVATOTT (F5)
   CUSLT18M (F4)
   CUSLT18F (F3)
   CUSCTZNM (F5)
   CUSCTZNF (F4)
   DTHEXECM (F2)
   DTHEXECF (F2)
   DTHILLNM (F4)
   DTHILLNF (F3)
   DTHAIDSM (F3)
   DTHAIDSF (F2)
   DTHSUICM (F3)
   DTHSUICF (F2)
   DTHACCM (F2)
   DTHACCF (F2)
   DTHHOMIM (F2)
   DTHHOMIF (F2)
   DTHHOMOM (F2)
   DTHHOMOF (F2)
   DTHPERSM (F3)
   DTHPERSF (F2)
   DTHOTHM (F3)
   DTHOTHF (F2)
   DTHTOTM (F4)
   DTHTOTF (F3)
   HANDLEM (F2)
   HANDLEF (F2)
  .

* Create SPSS system file.

*SAVE OUTFILE="spss-filename.sav".
