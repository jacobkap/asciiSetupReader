*-------------------------------------------------------------------------*
*                                                                          
*                     SPSS SETUP FILE FOR ICPSR 36151
*           INDIA HUMAN DEVELOPMENT SURVEY-II (IHDS-II), 2011-12
*                        (DATASET 0001: INDIVIDUAL)
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
*  data file is physically located (e.g., "c:\temp\36151-0001-data.txt").
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
*  will be saved (e.g., SAVE OUTFILE="c:\spsswin\data\da36151-0001.sav").
*
*-------------------------------------------------------------------------.

* SPSS FILE HANDLE AND DATA LIST COMMANDS.

FILE HANDLE DATA / NAME="data-filename" LRECL=1030.
DATA LIST FILE=DATA /
                SURVEY 1             STATEID 2-3
              DISTID 4-5               PSUID 6-7               HHID 8-10
            HHSPLITID 11          PERSONID 12-13             IDPSU 14-19
          IDHH 20-29 (A)      IDPERSON 30-41 (A)            WT 42-56 (8)
               FWT 57-62            DIST01 63-64          DISTRICT 65-68
                  RO3 69               RO4 70-71               RO5 72-73
                  RO6 74               RO7 75-76               RO8 77-78
               RO9 79-80              RO10 81-82                  FM1 83
                FM36Y 84              FM37 85-87              FM38 88-89
           FMHOURS 90-93               WKFARM 94               FM39AY 95
                  AN1 96                 AN5Y 97                  AN6 98
                 AN7Y 99                 NF1 100               NFBN1 101
                 NF9 102            NF12 103-105            NF13 106-107
               NF15Y 108              NFBN21 109                NF29 110
            NF32 111-113            NF33 114-115               NF35Y 116
              NFBN41 117                NF49 118            NF52 119-121
            NF53 122-123          NFDAYS 124-126         NFHOURS 127-130
               NF55Y 131              IN11S1 132          IN13S1 133-137
              IN11S2 138          IN13S2 139-143              IN11S3 144
          IN13S3 145-149              IN11S4 150          IN13S4 151-155
              IN11S5 156          IN13S5 157-161              IN11S6 162
          IN13S6 163-167              IN11S7 168          IN13S7 169-173
              IN11S8 174          IN13S8 175-179                IN18 180
            IN19 181-182            IN20 183-185            IN21 186-188
                IN22 189            IN23 190-191            IN24 192-193
                 ED2 194                 ED3 195                 ED4 196
                 ED5 197             ED6 198-199           EDUC7 200-201
            EDUNDER1 202                 ED7 203         ED8 204-206 (A)
                 ED9 207                ED10 208                ED11 209
                ED12 210        ED13 211-213 (A)                MM7Y 214
                 MM8 215                 MM9 216               MM12Y 217
                MM13 218                MM14 219                 TA3 220
                 TA4 221                 TA5 222                 TA6 223
            TA8A 224-225                TA8B 226            TA9A 227-228
                TA9B 229           TA10A 230-231               TA10B 232
                 CS3 233                CS3Y 234             CS4 235-236
             CS5 237-238             CS6 239-240             CS7 241-242
             CS8 243-244             CS9 245-246            CS10 247-248
            CS11 249-250            CS12 251-252            CS13 253-254
            CS16 255-256            CS17 257-258                CS18 259
                CS19 260            CS20 261-262                CS21 263
                CS22 264                CS23 265            CS24 266-270
            CS25 271-276            CS26 277-281            CS27 282-286
            CS28 287-291                 CH2 292             CH3 293-294
                CH4A 295                CH4B 296                 CH5 297
                 CH6 298                 CH7 299                 CH8 300
                 CH9 301                CH10 302                CH11 303
                CH12 304                CH13 305            CH14 306-307
                CH15 308                CH16 309                CH17 310
                CH18 311                CH19 312                CH20 313
                CH22 314             SM3 315-316                 SM4 317
                 SM5 318                 SM6 319                 SM7 320
                 SM8 321                 SM9 322                SM10 323
            SM11 324-325                SM12 326               SM14A 327
               SM14B 328               SM15A 329               SM15B 330
                SM16 331            SM17 332-334            SM18 335-339
                SM19 340            SM20 341-344            SM21 345-348
            SM22 349-352                 MB3 353                 MB4 354
                 MB5 355                 MB6 356                 MB7 357
                 MB8 358                 MB9 359                MB10 360
                MB11 361                MB12 362                MB13 363
                MB14 364                MB15 365                MB16 366
                MB17 367            MB18 368-370                MB19 371
               MB21A 372               MB21B 373               MB22A 374
               MB22B 375                MB23 376            MB24 377-379
            MB25 380-385                MB26 386            MB27 387-391
            MB28 392-396            MB29 397-401                 AD3 402
                 AD4 403                 AD5 404                 AD6 405
                 AD7 406                 AD8 407                 AD9 408
                 TO3 409                 TO4 410                 TO5 411
                 TO6 412                 AP2 413             AP3 414-415
        AP5 416-430 (11)        AP6 431-445 (11)                 AP7 446
        AP8 447-461 (11)        AP9 462-476 (11)                EW3Y 477
           URBAN2011 478         URBAN4_2011 479               METRO 480
              METRO6 481 POVLINE2005 482-496 (11)     POVLINE2012 497-500
   DEFLATOR 501-515 (13)        NPERSONS 516-517          EWELIGIBLE 518
         EWQELIGIBLE 519                ID11 520                ID13 521
              GROUPS 522             NF5 523-530            NF25 531-537
            NF45 538-543     COTOTAL 544-558 (7)        COPC 559-573 (7)
          ASSETS 574-575      ASSETS2005 576-577     INCCROP 578-588 (2)
       INCAGPROP 589-594   INCANIMAL 595-609 (7)       INCAG 610-624 (6)
          INCBUS 625-632        INCOTHER 633-639         INCEARN 640-646
     INCBENEFITS 647-652        INCREMIT 653-658      INCOME 659-673 (6)
    INCOMEPC 674-688 (7)            WKANIMAL 689          WKBUSINESS 690
       WS3NM 691-730 (A)             WS4 731-733             WS5 734-735
             WS7 736-738  WS7MONTHS 739-753 (12)             WS8 754-755
         WS8YEAR 756-759                 WS9 760            WS10 761-766
  WS10ANNUAL 767-781 (7)          WSEARN 782-788 WSEARNHOURLY 789-803 (10)
                WS11 804           WS11MEALS 805           WS11HOUSE 806
     WS11MEALSRS 807-810     WS11HOUSERS 811-816            WS12 817-821
                WS13 822                WS14 823            WS15 824-826
        WS7AGLAB 827-829        WS8AGLAB 830-833     WSEARNAGLAB 834-839
             WKAGLAB 840        WS7NONAG 841-843        WS8NONAG 844-847
     WSEARNNONAG 848-853             WKNONAG 854       WS7SALARY 855-857
       WS8SALARY 858-861    WSEARNSALARY 862-868            WKSALARY 869
        WS7NREGA 870-872        WS8NREGA 873-876     WSEARNNREGA 877-881
             WKNREGA 882          WKDAYS 883-885         WKHOURS 886-889
              WKANY5 890    RSUNEARN 891-905 (6)        MHEADAGE 906-907
        FHEADAGE 908-909             NADULTM 910             NADULTF 911
         NCHILDM 912-913         NCHILDF 914-915              NTEENM 916
              NTEENF 917             NELDERM 918             NELDERF 919
           NMARRIEDM 920           NMARRIEDF 921            NWKNONAG 922
            NWKAGLAB 923           NWKSALARY 924         NWKBUSINESS 925
         NWKFARM 926-927           NWKANIMAL 928            NWKNREGA 929
           NWKNREGA4 930         NWKNONNREGA 931         NWKANY5 932-933
        INCNONAG 934-939        INCAGLAB 940-945       INCSALARY 946-952
        INCNREGA 953-958     INCNONNREGA 959-964                 NNR 965
          HHEDUC 966-967         HHEDUCM 968-969         HHEDUCF 970-971
                 MG4 972                 MG5 973                 MG6 974
             MG7 975-976                 MG8 977      MG9NM 978-1017 (A)
          MG10 1018-1020               MG11 1021            MGYEAR5 1022
         NMIG5 1023-1024     MGMONTHS5 1025-1026            MGYEAR1 1027
              NMIG1 1028     MGMONTHS1 1029-1030
   .

* SPSS VARIABLE LABELS COMMAND

VARIABLE LABELS
   SURVEY    'IHDS-I (2005) or IHDS-II (2012)' /
   STATEID   'State code' /
   DISTID    'District code' /
   PSUID     'PSU: village/neighborhood code' /
   HHID      'Household ID (3-digit)' /
   HHSPLITID 'Split household ID' /
   PERSONID  'HQ4 2.1 Roster ID within 2012 household' /
   IDPSU     'PSU id unique 6 digit long int =cluster' /
   IDHH      'Household id, unique 10 byte string' /
   IDPERSON  'Person id, unique 12 byte' /
   WT        'Weights for 2012' /
   FWT       'Integer weights for 2012' /
   DIST01    'H1sp: District ID Census 2001' /
   DISTRICT  '2001 Census state id + district id, labeled' /
   RO3       'HQ4 2.3 Sex' /
   RO4       'HQ4 2.4 Relationship to head' /
   RO5       'HQ4 2.5 Age' /
   RO6       'HQ4 2.6 Marital Status' /
   RO7       'HQ4 2.7 Primary Activity Status' /
   RO8       'HQ4 2.8 Spouse''s ID' /


   RO9       'HQ4 2.9 Father''s ID' /
   RO10      'HQ4 2.1 Mother''s ID' /
   FM1       'HQ7 5.1 Any owned or cultivated' /
   FM36Y     'HQ10 5.36 Own farm work' /
   FM37      'HQ10 5.37 Farm labour: days/year' /
   FM38      'HQ10 5.38 Farm: hours/day max=16' /
   FMHOURS   'HQ10 5.37-38 Farm: hours/year max=4000' /
   WKFARM    'HQ14-16 fm12+ work participation farm' /
   FM39AY    'HQ10 5.39a Farm work: is decision maker' /
   AN1       'HQ11 6.1 Owns livestock' /
   AN5Y      'HQ11 6.5 Animal care work' /
   AN6       'HQ11 6.6 Animal care: Frequency' /
   AN7Y      'HQ11 6.7 Animal care: is decision maker' /
   NF1       'HQ14 8.1 Any non-farm business, corrected' /
   NFBN1     'HQ14 8(1) Business1: 1st business' /
   NF9       'HQ14 8.9 Business1: is worker' /
   NF12      'HQ16 8.52 Business1: days max=365' /
   NF13      'HQ14 8.13 Business1: hours/day max=16' /
   NF15Y     'HQ14 8.15 Business #1: is decision maker' /
   NFBN21    'HQ15 8(2) Business2: 2nd business' /


   NF29      'HQ15 8.29 Business2: is worker' /
   NF32      'HQ15 8.32 Business1: days max=365' /
   NF33      'HQ15 8.33 Business2: hours/day max=16' /
   NF35Y     'HQ15 8.35 Business #2: is decision maker' /
   NFBN41    'HQ16 8(3) Business3: 3rd business' /
   NF49      'HQ16 8.49 Business3: is worker' /
   NF52      'HQ16 8.52 Business3: days/year' /
   NF53      'HQ16 8.53 Business3: hours/day max=16' /
   NFDAYS    'HQ14-16 nf12+ days per year all businesses' /
   NFHOURS   'HQ14-16 nf12+ hours per year all businesses' /
   NF55Y     'HQ16 8.55 Business #3: is decision maker' /
   IN11S1    'HQ17 9.11-1 Old Age Pension any income' /
   IN13S1    'HQ17 9.13-1 Old Age Pension Rs' /
   IN11S2    'HQ17 9.11-2 Widows Pension any income' /
   IN13S2    'HQ17 9.13-2 Widows Pension Rs. year' /
   IN11S3    'HQ17 9.11-3 Maternity Benefit any income' /
   IN13S3    'HQ17 9.13-3 Maternity Benefit Rs' /
   IN11S4    'HQ17 9.11-4 Disability Pension any income' /
   IN13S4    'HQ17 9.13-4 Disability Pension Rs' /
   IN11S5    'HQ17 9.11-5 Annapurna any income' /



   IN13S5    'HQ17 9.13-5 Annapurna Rs' /
   IN11S6    'HQ17 9.11-6 Other Government any income' /
   IN13S6    'HQ17 9.13-6 Other Government Rs' /
   IN11S7    'HQ17 9.11-7 NGOs any income' /
   IN13S7    'HQ17 9.13-7 NGOs Rs' /
   IN11S8    'HQ17 9.11-8 other' /
   IN13S8    'HQ17 9.13-8 other Rs' /
   IN18      'HQ18 9.18 NREGA card number' /
   IN19      'HQ18 9.19 NREGA: N members on card' /
   IN20      'HQ18 9.20 NREGA: N days eligible' /
   IN21      'HQ18 9.21 NREGA: N days worked' /
   IN22      'HQ18 9.22 NREGA: why not worked' /
   IN23      'HQ18 9.23 NREGA: 1st worker' /
   IN24      'HQ18 9.24 NREGA: 2nd worker' /
   ED2       'HQ19 11.2 Education: Literacy' /
   ED3       'HQ19 11.3 Education: English ability' /
   ED4       'HQ19 11.4 Education: Attended school' /
   ED5       'HQ19 11.5 Education: Enrolled now' /
   ED6       'HQ19 11.6 Education: Completed Years, never,<1=0' /
   EDUC7     'HQ19 11.4,6 Education: Completed Years, 7cats' /


   EDUNDER1  'HQ19 11.6 Education: under 1 year' /
   ED7       'HQ19 11.7 Education: Ever repeated' /
   ED8       'HQ19 11.8 Education: Secondary class' /
   ED9       'HQ19 11.9 Education: post secondary' /
   ED10      'HQ19 11.1 Education: Post 2nd subject' /
   ED11      'HQ19 11.11 Education: College/vocational school' /
   ED12      'HQ19 11.12 Education: Highest degree' /
   ED13      'HQ19 11.13 Education: Degree class' /
   MM7Y      'HQ22 13.7 uses computer' /
   MM8       'HQ22 13.8 Computer: internet, e-mail' /
   MM9       'HQ22 13.9 Computer: Mostly where?' /
   MM12Y     'HQ22 13.12 owns mobile' /
   MM13      'HQ22 13.13 Mobile: internet, e-mail' /
   MM14      'HQ22 13.14 Mobile: SMS' /
   TA3       'HQ34 26.3 Test child: Ever school' /
   TA4       'HQ34 26.4 Test child: Class' /
   TA5       'HQ34 26.5 Test child: Enjoys school' /
   TA6       'HQ34 26.6 Test child: Teacher nice' /
   TA8A      'HQ34 26.8 Test: Reading language' /
   TA8B      'HQ34 26.8 Test: Reading level' /


   TA9A      'HQ34 26.9 Test: Math language' /
   TA9B      'HQ34 26.9 Test: Math level' /
   TA10A     'HQ34 26.10 Test: Writing language' /
   TA10B     'HQ34 26.10 Test: Writing level' /
   CS3       'EQ4 2.3 In School / College' /
   CS3Y      'EQ4 2.3 In School/ College, yes/no' /
   CS4       'EQ4 2.4 School type' /
   CS5       'EQ4 2.5 School distance (Km)' /
   CS6       'EQ4 2.6 Standard (years) <1=0' /
   CS7       'EQ4 2.7 Course of study if above 10 standard' /
   CS8       'EQ4 2.8 Medium of instruction' /
   CS9       'EQ4 2.9 Year English taught' /
   CS10      'EQ4 2.10 School hours/week' /
   CS11      'EQ4 2.11 Homework hours/week' /
   CS12      'EQ4 2.12 private Tuition hours/week' /
   CS13      'EQ4 2.13 Days/month absent' /
   CS16      'EQ5 2.16 Vocational Classes hours/week' /
   CS17      'EQ5 2.17 Standard completed' /
   CS18      'EQ5 2.18 Current Prog type' /
   CS19      'EQ5 2.19 Institution type' /


   CS20      'EQ5 2.20 Vocational course' /
   CS21      'EQ5 2.21 Free books' /
   CS22      'EQ5 2.22 School fees by Government' /
   CS23      'EQ5 2.23 Free uniform' /
   CS24      'EQ5 2.24 Scholarship (rupees)' /
   CS25      'EQ5 2.25 School fees (in rupees)' /
   CS26      'EQ5 2.26 Books uniform Rs' /
   CS27      'EQ5 2.27 Bus Rs' /
   CS28      'EQ5 2.28 private tuition Rs' /
   CH2       'EQ6 3.2 Child: School enrollment' /
   CH3       'EQ6 3.3 Child: Start Age in years' /
   CH4A      'EQ6 3.4 Child: School choice reason 1' /
   CH4B      'EQ6 3.4 Child: School choice reason 2' /
   CH5       'EQ6 3.5 Child: School admission difficult' /
   CH6       'EQ6 3.6 Child: Teacher attendance' /
   CH7       'EQ6 3.7 Child: Teacher gender' /
   CH8       'EQ6 3.8 Child: Local teacher' /
   CH9       'EQ6 3.9 Child: Fair Teacher' /
   CH10      'EQ6 3.10 Child: Good Teacher' /
   CH11      'EQ6 3.11 Child: Biased Teacher' /


   CH12      'EQ6 3.12 Child: PTA participation' /
   CH13      'EQ6 3.13 Child: PTA attendance' /
   CH14      'EQ6 3.14 Child: # teacher discuss' /
   CH15      'EQ6 3.15 Child: Average student' /
   CH16      'EQ6 3.16 Child: School enjoyment' /
   CH17      'EQ6 3.17 Child: # Repeats' /
   CH18      'EQ6 3.18 Child: Ever praised' /
   CH19      'EQ6 3.19 Child: Ever beaten' /
   CH20      'EQ6 3.20 Child: Ever scolded' /
   CH22      'EQ6 3.22 Child: School code' /
   SM3       'EQ12 8.3 Short Term Morbidity Days ill last 30 days' /
   SM4       'EQ12 8.4 Short Term Morbidity Fever last 30 days' /
   SM5       'EQ12 8.5 Short Term Morbidity Cough last 30 days' /
   SM6       'EQ12 8.6 Short Term Morbidity Cough with short breaths' /
   SM7       'EQ12 8.7 Diarrhea' /
   SM8       'EQ12 8.8 Diarrhea with blood' /
   SM9       'EQ12 8.9 Liquid intake if Diarrhea' /
   SM10      'EQ12 8.10 ORS given if Diarrhea' /
   SM11      'EQ12 8.11 Short Term Morbidity How many days disabled in last 30 days' /
   SM12      'EQ12 8.12 Short Term Morbidity Received advice or treatment in last month' /


   SM14A     'EQ13 8.14a Short Term Morbidity Who gave advice or treatment 1st' /
   SM14B     'EQ13 8.14b Short Term Morbidity Where received advice or treatment 1st' /
   SM15A     'EQ13 8.15a Short Term Morbidity Who gave advice or treatment 2nd' /
   SM15B     'EQ13 8.15b Short Term Morbidity Where received advice or treatment 2nd' /
   SM16      'EQ13 8.16 Short Term Morbidity Treatment type' /
   SM17      'EQ13 8.17 Short Term Morbidity Days hospitalized' /
   SM18      'EQ13 8.18 Short Term Morbidity Total cost for inpatient/outpatient (doctor, hospital, surgery) Rs' /
   SM19      'EQ13 8.19 Short Term Morbidity Tests and medicines included in fees' /
   SM20      'EQ13 8.20 Short Term Morbidity Cost for medicines/tests/expenses not included in doctor/hospital fees Rs' /
   SM21      'EQ13 8.21 Short Term Morbidity Treatment travel expenses Rs' /
   SM22      'EQ13 8.22 Short Term Morbidity Expenditures covered by medical Insurance Rs' /
   MB3       'EQ14 9.3 Major Morbidity Cataract' /
   MB4       'EQ14 9.4 Major Morbidity Tuberculosis (TB)' /
   MB5       'EQ14 9.5 Major Morbidity High Blood Pressure' /
   MB6       'EQ14 9.6 Major Morbidity Heart disease' /
   MB7       'EQ14 9.7 Major Morbidity Diabetes' /
   MB8       'EQ14 9.8 Major Morbidity Leprosy' /
   MB9       'EQ14 9.9 Major Morbidity Cancer' /
   MB10      'EQ14 9.10 Major Morbidity Asthma' /
   MB11      'EQ14 9.11 Major Morbidity Polio' /


   MB12      'EQ14 9.12 Major Morbidity Paralysis' /
   MB13      'EQ14 9.13 Major Morbidity Epilepsy' /
   MB14      'EQ14 9.14 Major Morbidity Mental illness' /
   MB15      'EQ14 9.15 Major Morbidity STD or AIDS' /
   MB16      'EQ14 9.16 Major Morbidity Accident' /
   MB17      'EQ14 9.17 Major Morbidity Other long term' /
   MB18      'EQ14 9.18 Major Morbidity How many days disabled in last 12 months' /
   MB19      'EQ14 9.19 Major Morbidity Received advice or treatment in last 12 months' /
   MB21A     'EQ15 9.21 Major Morbidity Who gave advice or treatment 1st' /
   MB21B     'EQ15 9.21 Major Morbidity Where received advice or treatment 1st' /
   MB22A     'EQ15 9.22 Major Morbidity Who gave advice or treatment 2nd' /
   MB22B     'EQ15 9.22 Major Morbidity Where received advice or treatment 2nd' /
   MB23      'EQ15 9.23 Major Morbidity Treatment type' /
   MB24      'EQ15 9.24 Major Morbidity Days hospitalized' /
   MB25      'EQ15 9.25 Major morbidity Cost Dr/hosp (in rupees)' /
   MB26      'EQ15 9.26 Major Morbidity Tests and medicines included in fees' /
   MB27      'EQ15 9.27 Major morbidity Cost Medicine (in rupees)' /
   MB28      'EQ15 9.28 Major morbidity Cost Travel (in rupees)' /
   MB29      'EQ15 9.29 Major Morbidity Expenditures covered by medical Insurance Rs' /
   AD3       'EQ16 10.3 Difficulty Walking 1km' /


   AD4       'EQ16 10.4 Difficulty Toilet' /
   AD5       'EQ16 10.5 Difficulty Dressing' /
   AD6       'EQ16 10.6 Difficulty Hearing' /
   AD7       'EQ16 10.7 Difficulty Speaking' /
   AD8       'EQ16 10.8 Difficulty Far sight' /
   AD9       'EQ16 10.9 Difficulty Short sight' /
   TO3       'EQ17 12.3 Smoke cigarettes' /
   TO4       'EQ17 12.4 Smoke bidis or hukkah' /
   TO5       'EQ17 12.5 Chew tobacco / gutkha' /
   TO6       'EQ17 12.6 Drink alcohol' /
   AP2       'EQ36 25.2 Eligible woman questionnaire' /
   AP3       'EQ36 25.3 Anthropometry Birth ID' /
   AP5       'EQ36 25.5 Anthropometry Height 1st' /
   AP6       'EQ36 25.6 Anthropometry Height 2nd' /
   AP7       'EQ36 25.7 Anthropometry Position' /
   AP8       'EQ36 25.8 Anthropometry Weight 1st' /
   AP9       'EQ36 25.9 Anthropometry Weight 2nd' /
   EW3Y      'EQ19 14.3 Respondent is Eligible Woman' /
   URBAN2011 'Urban residence from census 2011' /
   URBAN4_2011 '4-cat urban/rural from 2011 census & IHDS-II vill q' /



   METRO     'Largest 6 metro areas 0/1' /
   METRO6    'Largest 6 metro areas 1-6' /
   POVLINE2005 'Poverty cutoff specific for state/urban sector Tendulkar 2004-05 line' /
   POVLINE2012 'Poverty cut off Tendulkar Method, adjusted for interview date' /
   DEFLATOR  'Deflator for converting 2012 prices, CPI based, month adj.' /
   NPERSONS  'HQ4 2.0 N in household' /
   EWELIGIBLE 'HH4 2.3,5,6 Woman 15-49 ever married' /
   EWQELIGIBLE 'HH4 2.3,5,6 EW q and 15-49 ever married' /
   ID11      'HQ3 1.11 Religion' /
   ID13      'HQ3 1.13 Caste category' /
   GROUPS    'HQ3 1.13-15 Caste & religion' /
   NF5       'HQ14 8.5 Business 1: Net income (rupees)' /
   NF25      'HQ15 8.25 Business 2: Net income (rupees)' /
   NF45      'HQ16 8.45 Business 3: Net income (rupees)' /
   COTOTAL   'HQ23 14. Total household consumption expenditure' /
   COPC      'HQ23 14. household expenditure /capita' /
   ASSETS    'Total household assets (0-33)' /
   ASSETS2005 'Total household assets, same as IHDS 2005' /
   INCCROP   'HQ7-10 Income from crops minus expenses' /
   INCAGPROP 'HQ7 5.14,41 Rs land, other rented out' /



   INCANIMAL 'HQ11,23 mkt + home - cost' /
   INCAG     'HQ7-10 Income from agriculture minus expenses' /
   INCBUS    'HQ14-16 8.5,25,45 All businesses: Net income' /
   INCOTHER  'HQ17 9.1-3 Income from property, pensions (rupees)' /
   INCEARN   'HQ13 7.10-12 annual household wage and salary earnings with bonuses' /
   INCBENEFITS 'HQ17 9.5+13,1-8 all Government benefits Rs' /
   INCREMIT  'HQ5 3.13a Rs received by household from non-resident last year' /
   INCOME    'HQ Total income' /
   INCOMEPC  'HQ per capita income' /
   WKANIMAL  'HQ11 an5+ work participation animals' /
   WKBUSINESS 'HQ14-16 nf12+ work participation business' /
   WS3NM     'HQ12 7.3 Job description -job1' /
   WS4       'HQ12 7.4 Occupation -job1' /
   WS5       'HQ12 7.5 Industry -job1' /
   WS7       'HQ13 7.7 Working days -person total' /
   WS7MONTHS 'HQ13 7.7 Work months last year' /
   WS8       'HQ13 7.8 Work hours/day -job1' /
   WS8YEAR   'HQ13 7.5&6.6 Work hours/year -person total' /
   WS9       'HQ13 7.9 Pay period -job1' /
   WS10      'HQ13 7.10 Pay rate -job1 (rupees)' /


   WS10ANNUAL 'HQ13 7.8 annual cash wages' /
   WSEARN    'HQ13 7.10 annual earnings -person total' /
   WSEARNHOURLY 'HQ13 7.10 hourly wage & bonuses, max=10000' /
   WS11      'HQ13 7.11 Meals/housing -person total' /
   WS11MEALS 'HQ13 7.11 Meals benefit -any job' /
   WS11HOUSE 'HQ13 7.11 Housing benefit -any job' /
   WS11MEALSRS 'HQ13 7.11 Meals benefit Rs person total' /
   WS11HOUSERS 'HQ13 7.11 Housing benefit Rs person total' /
   WS12      'HQ13 7.12 Bonus -person total' /
   WS13      'HQ13 7.13 Casual -job1' /
   WS14      'HQ13 7.14 Government, NREGA, private' /
   WS15      'HQ13 7.15 Minutes to workplace' /
   WS7AGLAB  'HQ13 7.5 agricultural labour: days/year' /
   WS8AGLAB  'HQ13 7.5, agricultural labour: hours/year' /
   WSEARNAGLAB 'HQ13 7.8+ agricultural labour: annual earnings' /
   WKAGLAB   'HQ13 7.3 Farm wage labour (5cat)' /
   WS7NONAG  'HQ13 7.5 non-agricultural labour: days/year' /
   WS8NONAG  'HQ13 7.5, non-agricultural labour: hours/year' /
   WSEARNNONAG 'HQ13 7.8+ non-agricultural labour: annual wages' /
   WKNONAG   'HQ13 7.3 non-agricultural wage labour (5cat)' /



   WS7SALARY 'HQ13 7.5 salary position: days/year' /
   WS8SALARY 'HQ13 7.5, salary position: hours/year' /
   WSEARNSALARY 'HQ13 7.8+ salary position: annual wages' /
   WKSALARY  'HQ13 7.3 Salary position (5cat)' /
   WS7NREGA  'HQ13 7.5 NREGA position: days/year' /
   WS8NREGA  'HQ13 7.5, NREGA position: hours/year' /
   WSEARNNREGA 'HQ13 7.8+ NREGA position: annual wages' /
   WKNREGA   'HQ13 7.3 NREGA work (5cat)' /
   WKDAYS    'HQ work days /year (farm, business, wage|salary)' /
   WKHOURS   'HQ work hours /year (farm, business, wage|salary)' /
   WKANY5    'HQ work participation (farm, business, wage|salary)' /
   RSUNEARN  'ind: other Household income' /
   MHEADAGE  'HQ4 2.5 ro5 Age of male head' /
   FHEADAGE  'HQ4 2.5 ro5 Age of female head' /
   NADULTM   'HQ4 2.5 # 21+ men in Household' /
   NADULTF   'HQ4 2.5 N 21+ women in Household' /
   NCHILDM   'HQ4 2.5 # 0-14 boys in Household' /
   NCHILDF   'HQ4 2.5 # 0-14 girls in Household' /
   NTEENM    'HQ4 2.5 # 15-20 boys in Household' /
   NTEENF    'HQ4 2.5 # 15-20 girls in Household' /


   NELDERM   'HQ4 2.5 # 60+ men in Household' /
   NELDERF   'HQ4 2.5 # 60+ women in household' /
   NMARRIEDM 'HQ4 2.6 N married men in Household' /
   NMARRIEDF 'HQ4 2.6 N married women in Household' /
   NWKNONAG  'HQ13 7.3 Number of workers (>=240hrs): non-agricultural wage' /
   NWKAGLAB  'HQ13 7.3 Number of workers (>=240hrs): farm wage' /
   NWKSALARY 'HQ13 7.3 Number of workers (>=240hrs): salary position' /
   NWKBUSINESS 'HQ14-16 nf12,13 Number of workers (>=240hrs): business' /
   NWKFARM   'HQ10 fm37,38 Number of workers (>=240hrs): farm' /
   NWKANIMAL 'HQ11 an5 Number of workers (often): animal' /
   NWKNREGA  'HQ13 7.3 Number of workers (>=240hrs): NREGA' /
   NWKNREGA4 'HQ13 7.3 Number of workers, any hours: NREGA' /
   NWKNONNREGA 'HQ13 7.3 Number of workers (>=240hrs): non-agricultural wage not NREGA' /
   NWKANY5   'HQ10-16 Number of workers (>=240hrs): any job' /
   INCNONAG  'HQ13 7.3 income: non-agricultural wage' /
   INCAGLAB  'HQ13 7.3 income: farm wage' /
   INCSALARY 'HQ13 7.3 income: salary position' /
   INCNREGA  'HQ13 7.3 income: NREGA' /
   INCNONNREGA 'HQ13 7.3 income: non-agricultural wage not NREGA' /
   NNR       'HQ5 3.0 # Household nonresidents' /


   HHEDUC    'HQ19 11.6 Highest adult Education' /
   HHEDUCM   'HQ19 11.6 Highest male adult education' /
   HHEDUCF   'HQ19 11.6 Highest female adult education' /
   MG4       'HQ6 4.4 Place of migration' /
   MG5       'HQ6 4.5 Rural/ Urban' /
   MG6       'HQ6 4.6 Gone alone or with family?' /
   MG7       'HQ6 4.7 Gone for how many months?' /
   MG8       'HQ6 4.8 How many years ago?' /
   MG9NM     'HQ6 4.9 Type of work' /
   MG10      'HQ6 4.10 Occupation code' /
   MG11      'HQ6 4.11 Name migrated through' /
   MGYEAR5   'HQ6 4.1 Migrant five years ago or less' /
   NMIG5     'HQ6 4.1 # migrations in last 5 years' /
   MGMONTHS5 'HQ6 4.7 total months gone in last 5 years' /
   MGYEAR1   'HQ6 4.8 Migrant one year ago or less' /
   NMIG1     'HQ6 4.1 # migrations in last 1 year' /
   MGMONTHS1 'HQ6 4.7 total months gone in last 1 year' /
   .


* SPSS VALUE LABELS COMMAND.

VALUE LABELS
   SURVEY    1 'IHDS-I 1' 2 'IHDS-II 2' /
   STATEID   1 'Jammu & Kashmir 01' 2 'Himachal Pradesh 02' 3 'Punjab 03'
             4 'Chandigarh 04' 5 'Uttarakhand 05' 6 'Haryana 06' 7 'Delhi 07'
             8 'Rajasthan 08' 9 'Uttar Pradesh 09' 10 'Bihar 10'
             11 'Sikkim 11' 12 'Arunachal Pradesh 12' 13 'Nagaland 13'
             14 'Manipur 14' 15 'Mizoram 15' 16 'Tripura 16'
             17 'Meghalaya 17' 18 'Assam 18' 19 'West Bengal 19'
             20 'Jharkhand 20' 21 'Orissa 21' 22 'Chhattisgarh 22'
             23 'Madhya Pradesh 23' 24 'Gujarat 24' 25 'Daman & Diu 25'
             26 'Dadra+Nagar Haveli 26' 27 'Maharashtra 27'
             28 'Andhra Pradesh 28' 29 'Karnataka 29' 30 'Goa 30'
             31 'Lakshadweep 31' 32 'Kerala 32' 33 'Tamil Nadu 33'
             34 'Pondicherry 34' 35 'Anadman/Nicobar 35' /
   DISTRICT  102 'Baramula' 103 'Srinagar' 105 'Pulwama' 112 'Rajauri'
             113 'Jammu' 201 'Chamba' 202 'Kangra' 204 'Kullu' 205 'Mandi'
             206 'Hamirpur' 208 'Bilaspur' 209 'Solan' 210 'Sirmaur'
             211 'Shimla' 301 'Gurdaspur' 302 'Amritsar' 303 'Kapurthala'
             304 'Jalandhar' 305 'Hoshiarpur' 306 'Nawanshahr' 307 'Rupnagar'
             308 'Fatehgarh' 309 'Ludhiana' 310 'Moga' 311 'Firozpur'
             316 'Sangrur' 317 'Patiala' 400 'Chandigarh' 505 'Dehradun'
             508 'Bageshwar' 509 'Almora' 511 'Nainital'
             512 'Udham Singh Nagar' 513 'Hardwar' 601 'Panchkula'
             602 'Ambala' 603 'Yamunanagar' 604 'Kurukshetra' 605 'Kaithal'
             606 'Karnal' 608 'Sonipat' 609 'Jind' 610 'Fatehabad'
             612 'Hissar' 613 'Bhiwani' 617 'Rewari' 618 'Gurgaon'
             619 'Faridabad' 700 'Delhi' 701 'Delhi North West'
             702 'Delhi North' 703 'Delhi North East' 704 'Delhi East'
             707 'Delhi West' 708 'Delhi South West' 709 'Delhi South'
             710 'Delhi Municipal Corp' 711 'New Delhi Municipal Council'
             803 'Bikaner' 804 'Churu' 805 'Jhunjhunu' 806 'Alwar'
             807 'Bharatpur' 808 'Dhaulpur' 809 'Karauli'
             810 'Sawai Madhopur' 811 'Dausa' 812 'Jaipur' 813 'Sikar'
             814 'Nagaur' 815 'Jodhpur' 818 'Jalor' 820 'Pali' 821 'Ajmer'
             824 'Bhilwara' 825 'Rajsamand' 826 'Udaipur' 829 'Chittaurgarh'
             830 'Kota' 831 'Baran' 832 'Jhalawar' 901 'Saharanpur'
             902 'Muzaffarnagar' 903 'Bijnor' 904 'Moradabad' 905 'Rampur'
             906 'Jyotiva Phule Nagar' 907 'Meerut' 909 'Ghaziabad'
             910 'Gautam Buddha Nagar' 913 'Hathras' 914 'Mathura' 915 'Agra'
             919 'Budaun' 920 'Bareilly' 923 'Kheri' 924 'Sitapur'
             927 'Lucknow' 929 'Farrukabad' 930 'Kannauj' 933 'Kanpur Dehat'
             934 'Kanpur Nagar' 936 'Jhansi' 940 'Banda' 941 'Chitrakoot'
             942 'Fatehpur' 944 'Kaushambi' 945 'Allahabad' 946 'Barabanki'
             947 'Faizabad' 948 'Ambedkar Nagar' 949 'Sultanpur'
             950 'Bahraich' 951 'Sharawasti' 954 'Siddharathnagar'
             958 'Gorakhpur' 959 'Kushinagar' 960 'Deoria' 962 'Mau'
             963 'Baliya' 965 'Ghazipur' 966 'Chandauli' 967 'Varanasi'
             968 'Sant Ravidas Nagar' 1002 'Purbi Champaran' 1005 'Madhubani'
             1006 'Supaul' 1009 'Purnia' 1012 'Saharsa' 1014 'Muzaffar Pur'
             1016 'Siwan' 1017 'Saran' 1022 'Bhagal Pur' 1023 'Banka'
             1026 'Sheikhpura' 1027 'Nalanda' 1028 'Patna' 1030 'Buxar'
             1031 'Kaimur (Bhabua)' 1032 'Rohtas' 1035 'Gaya' 1100 'Sikkim'
             1200 'Arunachal' 1300 'Nagaland' 1400 'Manipur' 1500 'Mizoram'
             1600 'Tripura' 1700 'Meghalaya' 1802 'Dhubri' 1803 'Goalpara'
             1806 'Kamrup' 1809 'Marigaon' 1814 'Tinsukia' 1817 'Jorhat'
             1819 'Karbi Amglong' 1821 'Cachar' 1901 'Darjiling'
             1902 'Jalapiguri' 1904 'Uttar Dinajpur' 1906 'Maldah'
             1907 'Murshidabad' 1908 'Birbhum' 1909 'Barddhaman' 1910 'Nadia'
             1911 'North 24 Parganas' 1912 'Hugli' 1913 'Bankura'
             1916 'Haora' 1917 'Kolkata' 1918 'South 24 Parganas'
             2002 'Palamu' 2012 'Dhanbad' 2013 'Bokaro' 2014 'Ranchi'
             2017 'Pashchimi Singbhum' 2018 'Purbi Singhbhum' 2101 'Bargarh'
             2102 'Jharsuguda' 2103 'Sambalpur' 2105 'Sundargarh'
             2106 'Kendujhar' 2107 'Mayurbhanj' 2108 'Baleshwar'
             2109 'Bhadrak' 2112 'Cuttack' 2113 'Jajapur' 2114 'Dhenkanal'
             2115 'Anugul' 2116 'Nayagarh' 2117 'Khordha' 2118 'Puri'
             2119 'Ganjam' 2120 'Gajapati' 2121 'Kandhamal' 2122 'Baudh'
             2123 'Sonapur' 2124 'Balangir' 2126 'Kalahandi' 2127 'Rayagada'
             2128 'Nabarangapur' 2129 'Koraput' 2130 'Malkangiri'
             2201 'Koriya' 2202 'Sarguja' 2203 'Jashpur' 2204 'Raigarh'
             2205 'Korba' 2206 'Janjgir' 2207 'Bilas Pur' 2208 'Kawardha'
             2209 'Rajnandgaon' 2210 'Durg' 2211 'Raipur' 2212 'Mahasamund'
             2213 'Dhamtari' 2214 'Kanker' 2215 'Bastar' 2301 'Sheopur'
             2302 'Morena' 2304 'Gwalior' 2305 'Datia' 2308 'Tikamgarh'
             2309 'Chhatarpur' 2310 'Panna' 2312 'Damoh' 2313 'Satna'
             2315 'Umaria' 2316 'Shahdol' 2317 'Sidhi' 2320 'Ratlam'
             2321 'Ujjain' 2322 'Shajapur' 2323 'Dewas' 2325 'Dhar'
             2326 'Indore' 2327 'West Nimar' 2328 'Barwani' 2329 'East Nimar'
             2330 'Rajgarh' 2332 'Bhopal' 2335 'Betul' 2336 'Harda'
             2337 'Hoshangabad' 2338 'Katni' 2339 'Jabalpur' 2341 'Dindori'
             2342 'Mandla' 2344 'Seoni' 2401 'Kachchh' 2403 'Patan'
             2404 'Mahesana' 2406 'Gandhinagar' 2407 'Ahmedabad'
             2408 'Surendranagar' 2409 'Rajkot' 2410 'Jamnagar'
             2412 'Junagadh' 2413 'Amreli' 2414 'Bhavnagar' 2415 'Anand'
             2416 'Kheda' 2419 'Vadodara' 2420 'Narmada' 2421 'Bharuch'
             2422 'Surat' 2500 'Daman & Diu' 2600 'Dadra & Nagar Haveli'
             2701 'Nandurbar' 2702 'Dhule' 2703 'Jalgaon' 2705 'Akola'
             2706 'Washim' 2707 'Amarawti' 2708 'Wardha' 2709 'Nagpur'
             2710 'Bhandara' 2711 'Gondiya' 2713 'Chandrapur' 2714 'Yavatmal'
             2715 'Nanded' 2716 'Hingoli' 2717 'Parbhani' 2718 'Jalna'
             2720 'Nasik' 2721 'Thane' 2722 'Mumbai (suburban)' 2723 'Mumbai'
             2725 'Pune' 2726 'Ahmadnagar' 2727 'Bid' 2729 'Osmanabad'
             2730 'Solapur' 2731 'Satara' 2732 'Ratnagiri' 2734 'Kolhapur'
             2801 'Adilabad' 2802 'Nizamabad' 2803 'Karimnagar' 2804 'Medak'
             2805 'Hyderabad' 2806 'Rangareddi' 2807 'Mahbubnagar'
             2810 'Khammam' 2813 'Visakhapatnam' 2814 'East Godavari'
             2815 'West Godavari' 2816 'Krishna' 2817 'Guntur'
             2818 'Prakasam' 2819 'Nellore' 2820 'Cuddapah' 2821 'Kurnool'
             2822 'Anantapur' 2823 'Chittoor' 2901 'Belgaum' 2902 'Bagalkot'
             2903 'Bijapur' 2905 'Bidar' 2906 'Raichur' 2907 'Koppal'
             2908 'Gadag' 2909 'Dharwad' 2910 'Uttar Kannad' 2911 'Haveri'
             2912 'Bellary' 2913 'Chitradurga' 2914 'Davanagere'
             2915 'Shimoga' 2916 'Udupi' 2917 'Chikmagalur' 2918 'Tumkur'
             2919 'Kolar' 2920 'Bangalore' 2921 'Bangalore Rural'
             2922 'Mandya' 2924 'Dakshin Kannada' 2925 'Kodagu' 2926 'Mysore'
             2927 'Chamarajanagar' 3001 'North Goa' 3002 'South Goa'
             3202 'Kannur' 3204 'Kozhikode' 3205 'Malappuram' 3206 'Palakkad'
             3207 'Thrissur' 3208 'Ernakulam' 3209 'Idukki' 3210 'Kottayam'
             3211 'Alappuzha' 3212 'Pathanamthitta' 3213 'Kollam'
             3214 'Thiruvananthapuram' 3301 'Thiruvallur' 3302 'Chennai'
             3303 'Kancheepuram' 3304 'Vellore' 3305 'Dharampuri'
             3306 'Tiruvannamalai' 3309 'Namakkal' 3310 'Erode'
             3312 'Coimbatore' 3313 'Dindigul' 3314 'Karur'
             3315 'Tiruchchirappalli' 3316 'Perambalur' 3317 'Ariyalur'
             3323 'Sivaganga' 3324 'Madurai' 3325 'Theni'
             3327 'Ramanathapuram' 3328 'Thoothukkudi' 3329 'Tirunelveli'
             3330 'Kanniyakumari' 3400 'Pondicherry' /
   RO3       1 'Male 1' 2 'Female 2' /
   RO4       1 'Head 1' 2 'Wife/Husband 2' 3 'Son/Daughter 3'
             4 'Child-in-Law 4' 5 'Grandchild 5' 6 'Father/Mother 6'
             7 'Brother/Sister 7' 8 'Parent-in-Law 8' 9 'Nephew/Niece 9'
             10 'Sib-in-Law 10' 11 'Other rel 11' 12 'Servant/Others 12' /
   RO6       0 'Married, spouse absent' 1 'Married 1' 2 'Unmarried 2'
             3 'Widowed 3' 4 'Separated/Divorced 4' 5 'Married no gauna 5' /
   RO7       1 'Cultivation 1' 2 'Allied ag 2' 3 'Ag wage labour 3'
             4 'Nonag wage labour 4' 5 'Artisan/indpt work 5'
             6 'Small business 6' 7 'Organized Business 7' 8 'Salaried 8'
             9 'Profession 9' 10 'Retired 10' 11 'Housework 11'
             12 'Student 12' 13 'Unemployed 13' 14 'Too young/Unfit 14'
             15 'Others 15' /
   RO8       69 'IF Spouse/Parent outside for more than 6 months' 75 'Dead' /
   RO9       69 'IF Spouse/Parent outside for more than 6 months' 75 'Dead' /
   RO10      69 'IF Spouse/Parent outside for more than 6 months' 75 'Dead' /
   FM1       0 'No 0' 1 'Yes 1' /
   FM36Y     0 'No 0' 1 'Yes 1' /
   WKFARM    0 'none 0' 1 'missing hours 1' 2 '<240hrs 2' 3 'parttime 3'
             4 'ft yr (250 days/year or more AND 2000 hours/year or more)' /
   FM39AY    0 'No 0' 1 'Yes 1' /
   AN1       0 'No 0' 1 'Yes 1' /
   AN5Y      0 'No 0' 1 'Yes 1' /
   AN6       0 'No 0' 1 'Sometimes 1' 2 'Usually 2' /
   AN7Y      0 'No 0' 1 'Yes 1' /
   NF1       0 'No 0' 1 'Yes 1' /
   NFBN1     0 'no 1st hh business' 1 'hh has 1st business' /
   NF9       0 'does not work in 1st hh business'
             1 'works in 1st hh business' /
   NF15Y     0 'No 0' 1 'Yes 1' /
   NFBN21    0 'no 2nd hh business' 2 'hh has 2nd business' /
   NF29      0 'does not work in 2nd hh business'
             1 'works in 2nd hh business' /
   NF35Y     0 'No 0' 1 'Yes 1' /
   NFBN41    0 'no 3rd hh business' 3 'hh has 3rd business' /
   NF49      0 'does not work in 3rd hh business'
             1 'works in 3rd hh business' /
   NF55Y     0 'No 0' 1 'Yes 1' /
   IN11S1    0 'No 0' 1 'Yes 1' /
   IN11S2    0 'No 0' 1 'Yes 1' /
   IN11S3    0 'No 0' 1 'Yes 1' /
   IN11S4    0 'No 0' 1 'Yes 1' /
   IN11S5    0 'No 0' 1 'Yes 1' /
   IN11S6    0 'No 0' 1 'Yes 1' /
   IN11S7    0 'No 0' 1 'Yes 1' /
   IN11S8    0 'No 0' 1 'Yes 1' /
   IN22      1 'Not Interested 1' 2 'No work 2' 3 'Payment problem 3'
             4 'Low wage 4' 5 'Paid, no work 5' 6 'Others 6' /
   ED2       0 'No 0' 1 'Yes 1' /
   ED3       0 'none' 1 'Little 1' 2 'Fluent 2' /
   ED4       0 'No 0' 1 'Yes 1' /
   ED5       0 'No 0' 1 'Yes 1' /
   ED6       0 'none 0' 1 '1st class 1' 2 '2nd class 2' 3 '3rd class 3'
             4 '4th class 4' 5 '5th class 5' 6 '6th class 6' 7 '7th class 7'
             8 '8th class 8' 9 '9th class 9' 10 'Secondary 10'
             11 '11th Class 11' 12 'High Secondary 12'
             13 '1 year post-secondary' 14 '2 years post-secondary'
             15 'Bachelors 15' 16 'Above Bachelors 16' 55 '<1 class 55' /
   EDUC7     0 'none 0' 3 '1-4 3' 5 'primary 5' 8 '6-9 8'
             10 'Secondary(&11) 10' 12 'Higher sec(&13,14) 12'
             15 'graduate 15' 16 'some post-grad 16' /
   EDUNDER1  0 'No 0' 1 'Yes 1' /
   ED7       0 'No 0' 1 'Yes 1' /
   ED9       1 'regular school 1' 2 'study privately 2' 3 'distance educ 3'
             4 'Diploma <3 years pvt 4' 5 'Diploma <3 years govt 5'
             6 'Diploma 3+ years pvt 6' 7 'Diploma 3+ years govt 7'
             9 'Finished 9' /
   ED10      1 'Arts 1' 2 'Commerce 2' 3 'Science 3' 4 'Engineering 4'
             5 'Agriculture 5' 6 'Home science/Craft/Design 6'
             7 'Other Tech/Vocational 7' 8 'others 8' /
   ED11      0 'No 0' 1 'College 1' 2 'Technical 2' /
   ED12      1 'Incomplete 1' 2 'BA,BSc,BCom,etc. 2' 3 'BE,B.Tech. 3'
             4 'MBBS/BAMS 4' 5 'Masters,Ph.D. 5' 6 'MD, Law, MBA, CA etc. 6'
             7 'Diploma <3 years 7' 8 'Diploma 3+ years 8' 9 'other 9' /
   MM7Y      0 'No 0' 1 'Yes 1' /
   MM8       0 'No 0' 1 'Yes 1' /
   MM9       1 'Home 1' 2 'Cyber cafe 2' 3 'Office 3' 4 'School/Collage 4'
             5 'E-chaupal/Panchayat 5' 6 'Relative/Friends 6' 7 'Others 7' /
   MM12Y     0 'No 0' 1 'Yes 1' /
   MM13      0 'No 0' 1 'Yes 1' /
   MM14      0 'No 0' 1 'Yes 1' /
   TA3       0 'Never 0' 1 'Yes, currently 1' 2 'Yes, in the past 2' /
   TA5       0 'No 0' 1 'Yes 1' /
   TA6       1 'Nicely 1' 2 'Somewhat nicely 2' 3 'Not nicely 3' /
   TA8A      1 'Hindi 1' 2 'Assamese 2' 3 'Bangla 3' 4 'Gujarati 4'
             5 'Marathi 5' 6 'Oriya 6' 7 'Kannada 7' 8 'Malayalam 8'
             9 'Tamil 9' 10 'Telegu 10' 11 'English 11' 12 'Punjabi 12'
             13 'Urdu 13' 14 'Others 14' /
   TA8B      0 'Cannot read 0' 1 'Letters 1' 2 'Words 2' 3 'Paragraph 3'
             4 'Story 4' /
   TA9A      1 'Hindi 1' 2 'Assamese 2' 3 'Bangla 3' 4 'Gujarati 4'
             5 'Marathi 5' 6 'Oriya 6' 7 'Kannada 7' 8 'Malayalam 8'
             9 'Tamil 9' 10 'Telegu 10' 11 'English 11' 12 'Punjabi 12'
             13 'Urdu 13' 14 'Others 14' /
   TA9B      0 'Cannot recognise 0' 1 'Numbers 1' 2 'Subtraction 2'
             3 'Division 3' /
   TA10A     1 'Hindi 1' 2 'Assamese 2' 3 'Bangla 3' 4 'Gujarati 4'
             5 'Marathi 5' 6 'Oriya 6' 7 'Kannada 7' 8 'Malayalam 8'
             9 'Tamil 9' 10 'Telegu 10' 11 'English 11' 12 'Punjabi 12'
             13 'Urdu 13' 14 'Others 14' /
   TA10B     0 'Cannot write 0' 1 '1-2 mistakes 1' 2 'No mistake 2' /
   CS3       1 'School 1' 2 'College 2' 3 'School+Vocational 3'
             4 'College+Vocational 4' 5 'Vocational only 5' 6 'No longer 6' /
   CS3Y      0 'No 0' 1 'Yes 1' /
   CS4       1 'EGS 1' 2 'Government 2' 3 'Govt. Aided 3' 4 'Private 4'
             5 'Convent 5' 6 'Madrassa 6' 7 'Other/Open school 7'
             8 'Junior college 8' 9 'College 9' 10 'Postgraduate 10'
             11 'Technical Inst. 11' 12 'Private vocational programme 12'
             13 'Govt. vocational programme 13' /
   CS6       0 'none 0' 1 '1st class 1' 2 '2nd class 2' 3 '3rd class 3'
             4 '4th class 4' 5 '5th class 5' 6 '6th class 6' 7 '7th class 7'
             8 '8th class 8' 9 '9th class 9' 10 'Secondary 10'
             11 '11th Class 11' 12 'High Secondary 12'
             13 '1 year post-secondary' 14 '2 years post-secondary'
             15 'Bachelors 15' 16 'Above Bachelors 16' 55 '<1 class 55' /
   CS7       1 'Arts 1' 2 'Commerce/Business management 2' 3 'Science 3'
             4 'Engineering 4' 5 'Information Technology (IT) 5'
             6 'Medical 6' 7 'Agriculture 7' 8 'Other technology 8'
             9 'Law/CA/Other Professional 9'
             10 'Home sciences/ Craft/Design 10' 11 'Vocational (NEC) 11'
             12 'Others 12' /
   CS8       1 'Hindi 1' 2 'Assamese 2' 3 'Bangla 3' 4 'Gujarati 4'
             5 'Marathi 5' 6 'Oriya 6' 7 'Kannada 7' 8 'Malayalam 8'
             9 'Tamil 9' 10 'Telegu 10' 11 'English 11' 12 'Punjabi 12'
             13 'Urdu 13' 14 'Others 14' /
   CS9       0 'none 0' 1 '1st class 1' 2 '2nd class 2' 3 '3rd class 3'
             4 '4th class 4' 5 '5th class 5' 6 '6th class 6' 7 '7th class 7'
             8 '8th class 8' 9 '9th class 9' 10 'Secondary 10'
             11 '11th Class 11' 12 'High Secondary 12'
             13 '1 year post-secondary' 14 '2 years post-secondary'
             15 'Bachelors 15' 16 'Above Bachelors 16' 55 '<1 class 55' /
   CS17      0 'none 0' 1 '1st class 1' 2 '2nd class 2' 3 '3rd class 3'
             4 '4th class 4' 5 '5th class 5' 6 '6th class 6' 7 '7th class 7'
             8 '8th class 8' 9 '9th class 9' 10 'Secondary 10'
             11 '11th Class 11' 12 'High Secondary 12'
             13 '1 year post-secondary 13' 14 '2 years post-secondary 14'
             15 'Bachelors 15' 16 'Above Bachelors 16' /
   CS18      1 'Voc: <1 yr 1' 2 'Voc: 1-2 years 2' 3 'Voc: 3+ years 3'
             4 'Others 4' /
   CS19      1 'Govt. 1' 2 'Private 2' /
   CS20      1 'Paramedic 1' 2 'Art/Craft/Design 2' 3 'Electrical 3'
             4 'Computer 4' 5 'Other Tech 5' 6 'Auto mechanic 6' 7 'Photog 7'
             8 'Plumbing/Carpentry 8' 9 'Fashion 9' 10 'Hotel 10'
             11 'Business 11' 12 'Architect 12' 13 'Cooking 13'
             14 'Others 14' /
   CS21      0 'No 0' 1 'Yes 1' /
   CS22      0 'No 0' 1 'Yes 1' /
   CS23      0 'No 0' 1 'Yes 1' /
   CH2       0 'No 0' 1 'Yes, in the past 1' 2 'Yes, currently 2' /
   CH4A      1 'Only available 1' 2 'Close to home 2' 3 'Better Education 3'
             4 'Siblings 4' 5 'English medium 5' 6 'Affordable 6'
             7 'Single sex 7' 8 'No admission else 8' 9 'Others 9' /
   CH4B      1 'Only available 1' 2 'Close to home 2' 3 'Better Education 3'
             4 'Siblings 4' 5 'English medium 5' 6 'Affordable 6'
             7 'Single sex 7' 8 'No admission else 8' 9 'Others 9' /
   CH5       0 'No 0' 1 'Yes 1' /
   CH6       1 'Rarely/Never 1' 2 'Sometimes 2' 3 'Often 3' /
   CH7       1 'Male 1' 2 'Female 2' /
   CH8       0 'No 0' 1 'Yes 1' /
   CH9       1 'Rarely/Never 1' 2 'Sometimes 2' 3 'Often 3' /
   CH10      1 'Excellent 1' 2 'Good 2' 3 'Fair 3' 4 'Poor 4' /
   CH11      1 'Rarely/Never 1' 2 'Sometimes 2' 3 'Often 3' /
   CH12      0 'No 0' 1 'Yes 1' /
   CH13      0 'No 0' 1 'Yes 1' /
   CH15      1 'Below average 1' 2 'Average 2' 3 'Better than average 3' /
   CH16      1 'Rarely 1' 2 'Sometimes 2' 3 'Usually 3' 4 'Always 4' /
   CH18      0 'No 0' 1 'Yes 1' /
   CH19      0 'No 0' 1 'Yes 1' /
   CH20      0 'No 0' 1 'Yes 1' /
   SM4       0 'No 0' 1 'Yes 1' /
   SM5       0 'No 0' 1 'Yes 1' /
   SM6       0 'No 0' 1 'Yes 1' /
   SM7       0 'No 0' 1 'Yes 1' /
   SM8       0 'No 0' 1 'Yes 1' /
   SM9       1 'More' 2 'Same' 3 'Less' /
   SM10      0 'No 0' 1 'Yes 1' /
   SM12      0 'No 0' 1 'Yes 1' /
   SM14A     1 'Govt Doc/Nurse 1' 2 'Govt Doc/Nurse in Pvt 2'
             3 'Pvt Doc/Nurse 3' 4 'Chemist4' 5 'Vaidhya/Hakim 5'
             6 'Witch craft 6' 7 'Others 7' /
   SM14B     1 'Home' 2 'This village or Town' 3 'Another Village'
             4 'Other Town' 5 'District Town' 6 'Metro City'
             7 'Abroad/Others' /
   SM15A     1 'Govt Doc/Nurse 1' 2 'Govt Doc/Nurse in Pvt 2'
             3 'Pvt Doc/Nurse 3' 4 'Chemist4' 5 'Vaidhya/Hakim 5'
             6 'Witch craft 6' 7 'Others 7' /
   SM15B     1 'Home' 2 'This village or Town' 3 'Another Village'
             4 'Other Town' 5 'District Town' 6 'Metro City'
             7 'Abroad/Others' /
   SM16      1 'Pain killer/Cough syrup 1' 2 'Antibiotic 2'
             3 'Other Allopathic 3' 4 'Ayurvedic 4' 5 'Homeopathy 5'
             6 'Home/Herbal remedy 6' 7 'Surgery 7' 8 'Others 8' /
   SM19      0 'No 0' 1 'Yes 1' /
   MB3       0 'No 0' 1 'Cured 1' 2 'Yes 2' /
   MB4       0 'No 0' 1 'Cured 1' 2 'Yes 2' /
   MB5       0 'No 0' 1 'Cured 1' 2 'Yes 2' /
   MB6       0 'No 0' 1 'Cured 1' 2 'Yes 2' /
   MB7       0 'No 0' 1 'Cured 1' 2 'Yes 2' /
   MB8       0 'No 0' 1 'Cured 1' 2 'Yes 2' /
   MB9       0 'No 0' 1 'Cured 1' 2 'Yes 2' /
   MB10      0 'No 0' 1 'Cured 1' 2 'Yes 2' /
   MB11      0 'No 0' 1 'Cured 1' 2 'Yes 2' /
   MB12      0 'No 0' 1 'Cured 1' 2 'Yes 2' /
   MB13      0 'No 0' 1 'Cured 1' 2 'Yes 2' /
   MB14      0 'No 0' 1 'Cured 1' 2 'Yes 2' /
   MB15      0 'No 0' 1 'Cured 1' 2 'Yes 2' /
   MB16      0 'No 0' 1 'Cured 1' 2 'Yes 2' /
   MB17      0 'No 0' 1 'Cured 1' 2 'Yes 2' /
   MB19      0 'No 0' 1 'Yes 1' /
   MB21A     1 'Govt Doc/Nurse 1' 2 'Govt Doc/Nurse in Pvt 2'
             3 'Pvt Doc/Nurse 3' 4 'Chemist4' 5 'Vaidhya/Hakim 5'
             6 'Witch craft 6' 7 'Others 7' /
   MB21B     1 'Home' 2 'This village or Neighbourhood' 3 'Another Village'
             4 'Other Town' 5 'District Town' 6 'Metro City'
             7 'Abroad/Others' 8 'Don''t know' /
   MB22A     1 'Govt Doc/Nurse 1' 2 'Govt Doc/Nurse in Pvt 2'
             3 'Pvt Doc/Nurse 3' 4 'Chemist4' 5 'Vaidhya/Hakim 5'
             6 'Witch craft 6' 7 'Others 7' /
   MB22B     1 'Home' 2 'This village or Neighbourhood' 3 'Another Village'
             4 'Other Town' 5 'District Town' 6 'Metro City'
             7 'Abroad/Others' /
   MB23      1 'Pain killer/Cough syrup 1' 2 'Antibiotic 2'
             3 'Other Allopathic 3' 4 'Ayurvedic 4' 5 'Homeopathy 5'
             6 'Home/Herbal remedy 6' 7 'Surgery 7' 8 'Others 8' /
   MB26      0 'No 0' 1 'Yes 1' /
   AD3       0 'No Difficulty 0' 1 'with difficulty 1' 2 'Unable to do it 2'
             /
   AD4       0 'No Difficulty 0' 1 'with difficulty 1' 2 'Unable to do it 2'
             /
   AD5       0 'No Difficulty 0' 1 'with difficulty 1' 2 'Unable to do it 2'
             /
   AD6       0 'No Difficulty 0' 1 'with difficulty 1' 2 'Unable to do it 2'
             /
   AD7       0 'No Difficulty 0' 1 'with difficulty 1' 2 'Unable to do it 2'
             /
   AD8       0 'No Difficulty 0' 1 'with difficulty 1' 2 'Unable to do it 2'
             /
   AD9       0 'No Difficulty 0' 1 'with difficulty 1' 2 'Unable to do it 2'
             /
   TO3       1 'Never 1' 2 'Rarely 2' 3 'Sometimes 3' 4 'Daily 4' /
   TO4       1 'Never 1' 2 'Rarely 2' 3 'Sometimes 3' 4 'Daily 4' /
   TO5       1 'Never 1' 2 'Rarely 2' 3 'Sometimes 3' 4 'Daily 4' /
   TO6       1 'Never 1' 2 'Rarely 2' 3 'Sometimes 3' 4 'Daily 4' /
   AP2       1 'Main quest. 1' 2 'Additional quest 2' /
   AP7       1 'Lying 1' 2 'Standing 2' /
   EW3Y      0 'No 0' 1 'Yes 1' /
   URBAN2011 0 'rural 0' 1 'urban 1' /
   URBAN4_2011 0 'metro urban 0' 1 'other urban 1' 2 'more dev vill 2'
             3 'less dev vill 3' /
   METRO     0 'non-metro' 1 'largest six metro areas' /
   METRO6    1 'Mumbai 1' 2 'Delhi 2' 3 'Kolkata 3' 4 'Chennai 4'
             5 'Bangalore 5' 6 'Hyderabad 6' /
   EWELIGIBLE 0 'No 0' 1 'Yes 1' /
   EWQELIGIBLE 0 'No 0' 1 'Yes 1' /
   ID11      1 'Hindu 1' 2 'Muslim 2' 3 'Christian 3' 4 'Sikh 4'
             5 'Buddhist 5' 6 'Jain 6' 7 'Tribal 7' 8 'Others 8' 9 'None 9' /
   ID13      1 'Brahmin 1' 2 'Forward/General (except Brahmin) 2'
             3 'Other Backward Castes (OBC) 3' 4 'Scheduled Castes (SC) 4'
             5 'Scheduled Tribes (ST) 5' 6 'Others 6' /
   GROUPS    1 'Brahmin 1' 2 'Forward caste 2' 3 'OBC 3' 4 'Dalit 4'
             5 'Adivasi 5' 6 'Muslim 6' 7 'Christian, Sikh, Jain 7' /
   WKANIMAL  0 'none 0' 1 'missing hours 1' 2 '<240hrs 2' 3 'parttime 3'
             4 'ft yr 4' /
   WKBUSINESS 0 'none 0' 1 'missing hours 1' 2 '<240hrs 2' 3 'parttime 3'
             4 'ft yr 4' /
   WS4       0 'Physical scientists 0' 1 'Physical sci tech 1'
             2 'Engineers 2' 3 'Eng. tech 3' 4 'Air/ship officers 4'
             5 'Life scientists 5' 6 'Life science tech 6' 7 'Physicians 7'
             8 'Nursing 8' 9 'Other scientific 9' 10 'Statisticians 10'
             11 'Economists 11' 12 'Accountants 12' 13 'Social scientists 13'
             14 'Lawyers 14' 15 'Teachers 15' 16 'Journalists 16'
             17 'Artists 17' 18 'Performers 18' 19 'Professional nec 19'
             20 'Elected officials 20' 21 'Govt officials 21'
             22 'Mgr Whsl/retail 22' 23 'Mgr finance 23' 24 'Mgr manf 24'
             25 'Mgr transp/commun 25' 26 'Mgr service 26'
             29 'Managerial nec 29' 30 'Clerical supe 30'
             31 'Village officials 31' 32 'Typists 32' 33 'Book-keepers 33'
             34 'Computing op 34' 35 'Clerical nec 35'
             36 'Transp/commun supe 36' 37 'Transp conductors 37'
             38 'Mail distributors 38' 39 'Telephone op 39'
             40 'Shopkeepers 40' 41 'Manuf agents 41' 42 'Technical sales 42'
             43 'Sales, shop 43' 44 'FIRE sales 44' 45 'Money lenders 45'
             49 'Sales, nec 49' 50 'Hotel/restaurant 50'
             51 'House keepers 51' 52 'Cooks/waiters 52' 53 'Maids 53'
             54 'Sweepers 54' 55 'Launderers 55' 56 'Barbers 56'
             57 'Police 57' 59 'Service nec 59' 60 'Farm manager 60'
             61 'Cultivators 61' 62 'Other farmers 62' 63 'Ag labour 63'
             64 'Plantation lab 64' 65 'Other farm 65' 66 'Forestry 66'
             67 'Hunters 67' 68 'Fishermen 68' 71 'Miners 71'
             72 'Metal workers 72' 73 'Wood/paper 73' 74 'Chemical 74'
             75 'Textile 75' 76 'Tanners 76' 77 'Food 77' 78 'Tobacco 78'
             79 'Tailors 79' 80 'Shoe makers 80' 81 'Carpenters 81'
             82 'Stone cutters 82' 83 'Machine tool op 83' 84 'Assemblers 84'
             85 'Electrical 85' 86 'Cinema op 86' 87 'Plumbers/welders 87'
             88 'Jewellery 88' 89 'Potters 89' 90 'Rubber/plastic 90'
             91 'Paper 91' 92 'Printing 92' 93 'Painters 93'
             94 'Production nec 94' 95 'Construction 95' 96 'Boilermen 96'
             97 'Loaders 97' 98 'Drivers 98' 99 'Labour nec 99'
             100 'New workers X0' 101 'Unidentifiable occ X1'
             109 'No occupation X9' 111 'Housewife AA'
             112 'Student/ too young BB' 113 'Retired/ too old CC'
             114 'Disabled DD' 115 'Out of labour force EE' 119 'Other XI' /
   WS5       0 'Agriculture 0' 1 'Plantations 1' 2 'Livestock 2'
             3 'Ag services 3' 4 'Hunting 4' 5 'Forestry 5' 6 'Fishing 6'
             10 'Coal mining 10' 11 'Petroleum extract 11'
             12 'Iron mining 12' 13 'Other metal mining 13'
             14 'Uranium mining 14' 15 'Nonmetal mining 15'
             19 'Mining services 19' 20 'Manf food products 20'
             22 'Manf bev/tobacco 22' 23 'Manf cotton textiles 23'
             24 'Manf wool/silk/etc 24' 25 'Manf jute 25'
             26 'Manf apparel 26' 27 'Manf wood/furniture 27'
             28 'Manf paper/publish 28' 29 'Manf leather 29'
             30 'Manf chemicals 30' 31 'Manf rubber/plastic 31'
             32 'Manf mineral 32' 33 'Manf basic metal 33'
             34 'Manf metal products 34' 35 'Manf machinery 35'
             37 'Manf transport equip 37' 38 'Manf other 38'
             39 'Repair capital goods 39' 40 'Electricity 40'
             41 'Gas/steam 41' 42 'Water works 42' 43 'Other energy 43'
             50 'Construction 50' 51 'Allied construction 51'
             60 'Whsl ag/textiles 60' 61 'Whsl basic goods 61'
             62 'Whsl machinery 62' 63 'Whsl nec 63' 64 'Manf agents 64'
             65 'Retail food 65' 66 'Retail textiles 66'
             67 'Retail household 67' 68 'Retail nec 68'
             69 'Restaurants/hotels 69' 70 'Land transport 70'
             71 'Water transport 71' 72 'Air transport 72'
             73 'Transport nec 73' 74 'Storage 74' 75 'Communication 75'
             80 'Banking 80' 81 'Insurance 81' 82 'Real estate 82'
             83 'Legal 83' 84 'Lotteries 84' 85 'Renting 85'
             89 'Business services 89' 90 'Public admin 90' 91 'Sanitary 91'
             92 'Education 92' 93 'Medical 93' 94 'Community 94'
             95 'Rec/culture 95' 96 'Personal services 96'
             97 'Repair services 97' 98 'International 98'
             99 'Services nec 99' /
   WS9       1 'Per Day 1' 2 'Per Month 2' 3 'Fixed 3' /
   WS11      0 'No' 1 'Yes meal' 2 'Yes house' 3 'Yes both' /
   WS11MEALS 0 'No 0' 1 'Yes 1' /
   WS11HOUSE 0 'No 0' 1 'Yes 1' /
   WS13      1 'Casual daily 1' 2 'Casual piecework 2' 3 'Contract <1yr 3'
             4 'Regular/Permanent/Longer contract' /
   WS14      1 'Govt/PSU 1' 2 'Private firm 2' 3 'Private employer 3'
             4 'MGNREGA 4' 5 'Other govt. programs' 6 'Other 6' /
   WKAGLAB   0 'none 0' 1 'missing hours 1' 2 '<240hrs 2' 3 'parttime 3'
             4 'ft yr (250 days/year or more AND 2000 hours/year or more)' /
   WKNONAG   0 'none 0' 1 'missing hours 1' 2 '<240hrs 2' 3 'parttime 3'
             4 'ft yr (250 days/year or more AND 2000 hours/year or more)' /
   WKSALARY  0 'none 0' 1 'missing hours 1' 2 '<240hrs 2' 3 'parttime 3'
             4 'ft yr (250 days/year or more AND 2000 hours/year or more)' /
   WKNREGA   0 'none 0' 1 'missing hours 1' 2 '<240hrs 2' 3 'parttime 3'
             4 'ft yr (250 days/year or more AND 2000 hours/year or more)' /
   WKANY5    0 'none 0' 1 'missing hours 1' 2 '<240hrs 2' 3 'parttime 3'
             4 'ft yr 4' /
   HHEDUC    0 'none 0' 1 '1st class 1' 2 '2nd class 2' 3 '3rd class 3'
             4 '4th class 4' 5 '5th class 5' 6 '6th class 6' 7 '7th class 7'
             8 '8th class 8' 9 '9th class 9' 10 'Secondary 10'
             11 '11th Class 11' 12 'High Secondary 12'
             13 '1 year post-secondary' 14 '2 years post-secondary'
             15 'Bachelors 15' 16 'Above Bachelors 16' 55 '<1 class 55' /
   HHEDUCM   0 'none 0' 1 '1st class 1' 2 '2nd class 2' 3 '3rd class 3'
             4 '4th class 4' 5 '5th class 5' 6 '6th class 6' 7 '7th class 7'
             8 '8th class 8' 9 '9th class 9' 10 'Secondary 10'
             11 '11th Class 11' 12 'High Secondary 12'
             13 '1 year post-secondary' 14 '2 years post-secondary'
             15 'Bachelors 15' 16 'Above Bachelors 16' 55 '<1 class 55' /
   HHEDUCF   0 'none 0' 1 '1st class 1' 2 '2nd class 2' 3 '3rd class 3'
             4 '4th class 4' 5 '5th class 5' 6 '6th class 6' 7 '7th class 7'
             8 '8th class 8' 9 '9th class 9' 10 'Secondary 10'
             11 '11th Class 11' 12 'High Secondary 12'
             13 '1 year post-secondary' 14 '2 years post-secondary'
             15 'Bachelors 15' 16 'Above Bachelors 16' 55 '<1 class 55' /
   MG4       1 'same state 1' 2 'another state 2' 3 'abroad 3' /
   MG5       0 'rural 0' 1 'urban 1' /
   MG6       1 'Alone 1' 2 'With Spouse 2' 3 'With Spouse & children 3'
             4 'With others 4' /
   MG10      0 'Physical scientists 0' 1 'Physical sci tech 1'
             2 'Engineers 2' 3 'Eng. tech 3' 4 'Air/ship officers 4'
             5 'Life scientists 5' 6 'Life science tech 6' 7 'Physicians 7'
             8 'Nursing 8' 9 'Other scientific 9' 10 'Statisticians 10'
             11 'Economists 11' 12 'Accountants 12' 13 'Social scientists 13'
             14 'Lawyers 14' 15 'Teachers 15' 16 'Journalists 16'
             17 'Artists 17' 18 'Performers 18' 19 'Professional nec 19'
             20 'Elected officials 20' 21 'Govt officials 21'
             22 'Mgr Whsl/retail 22' 23 'Mgr finance 23' 24 'Mgr manf 24'
             25 'Mgr transp/commun 25' 26 'Mgr service 26'
             29 'Managerial nec 29' 30 'Clerical supe 30'
             31 'Village officials 31' 32 'Typists 32' 33 'Book-keepers 33'
             34 'Computing op 34' 35 'Clerical nec 35'
             36 'Transp/commun supe 36' 37 'Transp conductors 37'
             38 'Mail distributors 38' 39 'Telephone op 39'
             40 'Shopkeepers 40' 41 'Manuf agents 41' 42 'Technical sales 42'
             43 'Sales, shop 43' 44 'FIRE sales 44' 45 'Money lenders 45'
             49 'Sales, nec 49' 50 'Hotel/restaurant 50'
             51 'House keepers 51' 52 'Cooks/waiters 52' 53 'Maids 53'
             54 'Sweepers 54' 55 'Launderers 55' 56 'Barbers 56'
             57 'Police 57' 59 'Service nec 59' 60 'Farm manager 60'
             61 'Cultivators 61' 62 'Other farmers 62' 63 'Ag labour 63'
             64 'Plantation lab 64' 65 'Other farm 65' 66 'Forestry 66'
             67 'Hunters 67' 68 'Fishermen 68' 71 'Miners 71'
             72 'Metal workers 72' 73 'Wood/paper 73' 74 'Chemical 74'
             75 'Textile 75' 76 'Tanners 76' 77 'Food 77' 78 'Tobacco 78'
             79 'Tailors 79' 80 'Shoe makers 80' 81 'Carpenters 81'
             82 'Stone cutters 82' 83 'Machine tool op 83' 84 'Assemblers 84'
             85 'Electrical 85' 86 'Cinema op 86' 87 'Plumbers/welders 87'
             88 'Jewellery 88' 89 'Potters 89' 90 'Rubber/plastic 90'
             91 'Paper 91' 92 'Printing 92' 93 'Painters 93'
             94 'Production nec 94' 95 'Construction 95' 96 'Boilermen 96'
             97 'Loaders 97' 98 'Drivers 98' 99 'Labour nec 99'
             100 'New workers X0' 101 'Unidentifiable occ X1'
             109 'No occupation X9' 111 'Housewife AA'
             112 'Student/ too young BB' 113 'Retired/ too old CC'
             114 'Disabled DD' 115 'Out of labour force EE' 119 'Other XI' /
   MG11      1 'Contractor 1' 2 'With a job or Self Employed 2'
             3 'Without a job 3' /
   MGYEAR5   0 'No 0' 1 'Yes 1' /
   MGYEAR1   0 'No 0' 1 'Yes 1' /
   .

* SPSS MISSING VALUES COMMAND.

* MISSING VALUES
     MB21B (8) /
   .

EXECUTE.

* SPSS VARIABLE LEVEL COMMAND.

VARIABLE LEVEL
   DISTID
   PSUID
   HHID
   HHSPLITID
   PERSONID
   IDPSU
   WT
   FWT
   DIST01
   RO5
   RO8
   RO9
   RO10
   FM37
   FM38
   FMHOURS
   NF12
   NF13
   NF32
   NF33
   NF52
   NF53
   NFDAYS
   NFHOURS
   IN13S1
   IN13S2
   IN13S3
   IN13S4
   IN13S5
   IN13S6
   IN13S7
   IN13S8
   IN18
   IN19
   IN20
   IN21
   IN23
   IN24
   TA4
   CS5
   CS10
   CS11
   CS12
   CS13
   CS16
   CS24
   CS25
   CS26
   CS27
   CS28
   CH3
   CH14
   CH17
   CH22
   SM3
   SM11
   SM17
   SM18
   SM20
   SM21
   SM22
   MB18
   MB24
   MB25
   MB27
   MB28
   MB29
   AP3
   AP5
   AP6
   AP8
   AP9
   POVLINE2005
   POVLINE2012
   DEFLATOR
   NPERSONS
   NF5
   NF25
   NF45
   COTOTAL
   COPC
   ASSETS
   ASSETS2005
   INCCROP
   INCAGPROP
   INCANIMAL
   INCAG
   INCBUS
   INCOTHER
   INCEARN
   INCBENEFITS
   INCREMIT
   INCOME
   INCOMEPC
   WS7
   WS7MONTHS
   WS8
   WS8YEAR
   WS10
   WS10ANNUAL
   WSEARN
   WSEARNHOURLY
   WS11MEALSRS
   WS11HOUSERS
   WS12
   WS15
   WS7AGLAB
   WS8AGLAB
   WSEARNAGLAB
   WS7NONAG
   WS8NONAG
   WSEARNNONAG
   WS7SALARY
   WS8SALARY
   WSEARNSALARY
   WS7NREGA
   WS8NREGA
   WSEARNNREGA
   WKDAYS
   WKHOURS
   RSUNEARN
   MHEADAGE
   FHEADAGE
   NADULTM
   NADULTF
   NCHILDM
   NCHILDF
   NTEENM
   NTEENF
   NELDERM
   NELDERF
   NMARRIEDM
   NMARRIEDF
   NWKNONAG
   NWKAGLAB
   NWKSALARY
   NWKBUSINESS
   NWKFARM
   NWKANIMAL
   NWKNREGA
   NWKNREGA4
   NWKNONNREGA
   NWKANY5
   INCNONAG
   INCAGLAB
   INCSALARY
   INCNREGA
   INCNONNREGA
   NNR
   MG7
   MG8
   NMIG5
   MGMONTHS5
   NMIG1
   MGMONTHS1
    (scale).

VARIABLE LEVEL
   SURVEY
   STATEID
   IDHH
   IDPERSON
   DISTRICT
   RO3
   RO4
   RO6
   RO7
   FM1
   FM36Y
   WKFARM
   FM39AY
   AN1
   AN5Y
   AN6
   AN7Y
   NF1
   NFBN1
   NF9
   NF15Y
   NFBN21
   NF29
   NF35Y
   NFBN41
   NF49
   NF55Y
   IN11S1
   IN11S2
   IN11S3
   IN11S4
   IN11S5
   IN11S6
   IN11S7
   IN11S8
   IN22
   ED2
   ED3
   ED4
   ED5
   ED6
   EDUC7
   EDUNDER1
   ED7
   ED8
   ED9
   ED10
   ED11
   ED12
   ED13
   MM7Y
   MM8
   MM9
   MM12Y
   MM13
   MM14
   TA3
   TA5
   TA6
   TA8A
   TA8B
   TA9A
   TA9B
   TA10A
   TA10B
   CS3
   CS3Y
   CS4
   CS6
   CS7
   CS8
   CS9
   CS17
   CS18
   CS19
   CS20
   CS21
   CS22
   CS23
   CH2
   CH4A
   CH4B
   CH5
   CH6
   CH7
   CH8
   CH9
   CH10
   CH11
   CH12
   CH13
   CH15
   CH16
   CH18
   CH19
   CH20
   SM4
   SM5
   SM6
   SM7
   SM8
   SM9
   SM10
   SM12
   SM14A
   SM14B
   SM15A
   SM15B
   SM16
   SM19
   MB3
   MB4
   MB5
   MB6
   MB7
   MB8
   MB9
   MB10
   MB11
   MB12
   MB13
   MB14
   MB15
   MB16
   MB17
   MB19
   MB21A
   MB21B
   MB22A
   MB22B
   MB23
   MB26
   AD3
   AD4
   AD5
   AD6
   AD7
   AD8
   AD9
   TO3
   TO4
   TO5
   TO6
   AP2
   AP7
   EW3Y
   URBAN2011
   URBAN4_2011
   METRO
   METRO6
   EWELIGIBLE
   EWQELIGIBLE
   ID11
   ID13
   GROUPS
   WKANIMAL
   WKBUSINESS
   WS3NM
   WS4
   WS5
   WS9
   WS11
   WS11MEALS
   WS11HOUSE
   WS13
   WS14
   WKAGLAB
   WKNONAG
   WKSALARY
   WKNREGA
   WKANY5
   HHEDUC
   HHEDUCM
   HHEDUCF
   MG4
   MG5
   MG6
   MG9NM
   MG10
   MG11
   MGYEAR5
   MGYEAR1
    (nominal).

* SPSS PRINT FORMAT COMMAND.

PRINT FORMAT
   SURVEY (F1)
   STATEID (F2)
   DISTID (F2)
   PSUID (F2)
   HHID (F3)
   HHSPLITID (F1)
   PERSONID (F2)
   IDPSU (F6)
   WT (F15.8)
   FWT (F6)
   DIST01 (F2)
   DISTRICT (F4)
   RO3 (F1)
   RO4 (F2)
   RO5 (F2)
   RO6 (F1)
   RO7 (F2)
   RO8 (F2)
   RO9 (F2)
   RO10 (F2)
   FM1 (F1)
   FM36Y (F1)
   FM37 (F3)
   FM38 (F2)
   FMHOURS (F4)
   WKFARM (F1)
   FM39AY (F1)
   AN1 (F1)
   AN5Y (F1)
   AN6 (F1)
   AN7Y (F1)
   NF1 (F1)
   NFBN1 (F1)
   NF9 (F1)
   NF12 (F3)
   NF13 (F2)
   NF15Y (F1)
   NFBN21 (F1)
   NF29 (F1)
   NF32 (F3)
   NF33 (F2)
   NF35Y (F1)
   NFBN41 (F1)
   NF49 (F1)
   NF52 (F3)
   NF53 (F2)
   NFDAYS (F3)
   NFHOURS (F4)
   NF55Y (F1)
   IN11S1 (F1)
   IN13S1 (F5)
   IN11S2 (F1)
   IN13S2 (F5)
   IN11S3 (F1)
   IN13S3 (F5)
   IN11S4 (F1)
   IN13S4 (F5)
   IN11S5 (F1)
   IN13S5 (F5)
   IN11S6 (F1)
   IN13S6 (F5)
   IN11S7 (F1)
   IN13S7 (F5)
   IN11S8 (F1)
   IN13S8 (F5)
   IN18 (F1)
   IN19 (F2)
   IN20 (F3)
   IN21 (F3)
   IN22 (F1)
   IN23 (F2)
   IN24 (F2)
   ED2 (F1)
   ED3 (F1)
   ED4 (F1)
   ED5 (F1)
   ED6 (F2)
   EDUC7 (F2)
   EDUNDER1 (F1)
   ED7 (F1)
   ED9 (F1)
   ED10 (F1)
   ED11 (F1)
   ED12 (F1)
   MM7Y (F1)
   MM8 (F1)
   MM9 (F1)
   MM12Y (F1)
   MM13 (F1)
   MM14 (F1)
   TA3 (F1)
   TA4 (F1)
   TA5 (F1)
   TA6 (F1)
   TA8A (F2)
   TA8B (F1)
   TA9A (F2)
   TA9B (F1)
   TA10A (F2)
   TA10B (F1)
   CS3 (F1)
   CS3Y (F1)
   CS4 (F2)
   CS5 (F2)
   CS6 (F2)
   CS7 (F2)
   CS8 (F2)
   CS9 (F2)
   CS10 (F2)
   CS11 (F2)
   CS12 (F2)
   CS13 (F2)
   CS16 (F2)
   CS17 (F2)
   CS18 (F1)
   CS19 (F1)
   CS20 (F2)
   CS21 (F1)
   CS22 (F1)
   CS23 (F1)
   CS24 (F5)
   CS25 (F6)
   CS26 (F5)
   CS27 (F5)
   CS28 (F5)
   CH2 (F1)
   CH3 (F2)
   CH4A (F1)
   CH4B (F1)
   CH5 (F1)
   CH6 (F1)
   CH7 (F1)
   CH8 (F1)
   CH9 (F1)
   CH10 (F1)
   CH11 (F1)
   CH12 (F1)
   CH13 (F1)
   CH14 (F2)
   CH15 (F1)
   CH16 (F1)
   CH17 (F1)
   CH18 (F1)
   CH19 (F1)
   CH20 (F1)
   CH22 (F1)
   SM3 (F2)
   SM4 (F1)
   SM5 (F1)
   SM6 (F1)
   SM7 (F1)
   SM8 (F1)
   SM9 (F1)
   SM10 (F1)
   SM11 (F2)
   SM12 (F1)
   SM14A (F1)
   SM14B (F1)
   SM15A (F1)
   SM15B (F1)
   SM16 (F1)
   SM17 (F3)
   SM18 (F5)
   SM19 (F1)
   SM20 (F4)
   SM21 (F4)
   SM22 (F4)
   MB3 (F1)
   MB4 (F1)
   MB5 (F1)
   MB6 (F1)
   MB7 (F1)
   MB8 (F1)
   MB9 (F1)
   MB10 (F1)
   MB11 (F1)
   MB12 (F1)
   MB13 (F1)
   MB14 (F1)
   MB15 (F1)
   MB16 (F1)
   MB17 (F1)
   MB18 (F3)
   MB19 (F1)
   MB21A (F1)
   MB21B (F1)
   MB22A (F1)
   MB22B (F1)
   MB23 (F1)
   MB24 (F3)
   MB25 (F6)
   MB26 (F1)
   MB27 (F5)
   MB28 (F5)
   MB29 (F5)
   AD3 (F1)
   AD4 (F1)
   AD5 (F1)
   AD6 (F1)
   AD7 (F1)
   AD8 (F1)
   AD9 (F1)
   TO3 (F1)
   TO4 (F1)
   TO5 (F1)
   TO6 (F1)
   AP2 (F1)
   AP3 (F2)
   AP5 (F15.11)
   AP6 (F15.11)
   AP7 (F1)
   AP8 (F15.11)
   AP9 (F15.11)
   EW3Y (F1)
   URBAN2011 (F1)
   URBAN4_2011 (F1)
   METRO (F1)
   METRO6 (F1)
   POVLINE2005 (F15.11)
   POVLINE2012 (F4)
   DEFLATOR (F15.13)
   NPERSONS (F2)
   EWELIGIBLE (F1)
   EWQELIGIBLE (F1)
   ID11 (F1)
   ID13 (F1)
   GROUPS (F1)
   NF5 (F8)
   NF25 (F7)
   NF45 (F6)
   COTOTAL (F15.7)
   COPC (F15.7)
   ASSETS (F2)
   ASSETS2005 (F2)
   INCCROP (F11.2)
   INCAGPROP (F6)
   INCANIMAL (F15.7)
   INCAG (F15.6)
   INCBUS (F8)
   INCOTHER (F7)
   INCEARN (F7)
   INCBENEFITS (F6)
   INCREMIT (F6)
   INCOME (F15.6)
   INCOMEPC (F15.7)
   WKANIMAL (F1)
   WKBUSINESS (F1)
   WS4 (F3)
   WS5 (F2)
   WS7 (F3)
   WS7MONTHS (F15.12)
   WS8 (F2)
   WS8YEAR (F4)
   WS9 (F1)
   WS10 (F6)
   WS10ANNUAL (F15.7)
   WSEARN (F7)
   WSEARNHOURLY (F15.10)
   WS11 (F1)
   WS11MEALS (F1)
   WS11HOUSE (F1)
   WS11MEALSRS (F4)
   WS11HOUSERS (F6)
   WS12 (F5)
   WS13 (F1)
   WS14 (F1)
   WS15 (F3)
   WS7AGLAB (F3)
   WS8AGLAB (F4)
   WSEARNAGLAB (F6)
   WKAGLAB (F1)
   WS7NONAG (F3)
   WS8NONAG (F4)
   WSEARNNONAG (F6)
   WKNONAG (F1)
   WS7SALARY (F3)
   WS8SALARY (F4)
   WSEARNSALARY (F7)
   WKSALARY (F1)
   WS7NREGA (F3)
   WS8NREGA (F4)
   WSEARNNREGA (F5)
   WKNREGA (F1)
   WKDAYS (F3)
   WKHOURS (F4)
   WKANY5 (F1)
   RSUNEARN (F15.6)
   MHEADAGE (F2)
   FHEADAGE (F2)
   NADULTM (F1)
   NADULTF (F1)
   NCHILDM (F2)
   NCHILDF (F2)
   NTEENM (F1)
   NTEENF (F1)
   NELDERM (F1)
   NELDERF (F1)
   NMARRIEDM (F1)
   NMARRIEDF (F1)
   NWKNONAG (F1)
   NWKAGLAB (F1)
   NWKSALARY (F1)
   NWKBUSINESS (F1)
   NWKFARM (F2)
   NWKANIMAL (F1)
   NWKNREGA (F1)
   NWKNREGA4 (F1)
   NWKNONNREGA (F1)
   NWKANY5 (F2)
   INCNONAG (F6)
   INCAGLAB (F6)
   INCSALARY (F7)
   INCNREGA (F6)
   INCNONNREGA (F6)
   NNR (F1)
   HHEDUC (F2)
   HHEDUCM (F2)
   HHEDUCF (F2)
   MG4 (F1)
   MG5 (F1)
   MG6 (F1)
   MG7 (F2)
   MG8 (F1)
   MG10 (F3)
   MG11 (F1)
   MGYEAR5 (F1)
   NMIG5 (F2)
   MGMONTHS5 (F2)
   MGYEAR1 (F1)
   NMIG1 (F1)
   MGMONTHS1 (F2)
  .

* Create SPSS system file.

*SAVE OUTFILE="spss-filename.sav".
