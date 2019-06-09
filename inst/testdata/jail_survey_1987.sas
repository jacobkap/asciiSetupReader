*-------------------------------------------------------------------------*
|                                                                         |
|             SAS DATA DEFINITION STATEMENTS FOR ICPSR 9074               |
|          ANNUAL SURVEY OF JAILS: JURISDICTION-LEVEL DATA, 1987          |
|                          2nd ICPSR EDITION                              |
|                           NOVEMBER, 2001                                |
|                                                                         |
| PROC FORMAT:  creates user-defined formats for the variables. Formats   |
| replace original value codes with value code descriptions. Not all      |
| variables necessarily have user-defined formats.                        |
|                                                                         |
| DATA:  begins a SAS data step and names an output SAS data set.         |
|                                                                         |
| INFILE:  identifies the input file to be read with the input statement. |
| Users must replace the "physical-filename" with host computer specific  |
| input file specifications.                                              |
|                                                                         |
| INPUT:  assigns the name, type, decimal specification (if any), and     |
| specifies the beginning and ending column locations for each variable   |
| in the data file.                                                       |
|                                                                         |
| LABEL:  assigns descriptive labels to all variables. Variable labels    |
| and variable names may be identical for some variables.                 |
|                                                                         |
| MISSING VALUE RECODES:  sets user-defined numeric missing values to     |
| missing as interpreted by the SAS system. Only variables with           |
| user-defined missing values are included in the statements.             |
|                                                                         |
| FORMAT:  associates the formats created by the PROC FORMAT step with    |
| the variables named in the INPUT statement.                             |
|                                                                         |
| NOTE:  Users should modify these data definition statements to suit     |
| their specific needs. PROC FORMAT, FORMAT, and MISSING VALUE RECODES    |
| sections have been marked by SAS comment statements. To include these   |
| sections in a final SAS setup, users should remove the SAS comment      |
| statements from the desired section(s).                                 |
|                                                                         |
| These data definition statements have been tested for compatability     |
| with SAS Release 6.11 for UNIX and/or SAS Release 6.11 for Windows.     |
|                                                                         |
*-------------------------------------------------------------------------;
                                                                           
* SAS PROC FORMAT;                                                         
                                                                           
/*                                                                         
PROC FORMAT;                                                               
   VALUE V1FT (MAX=40)                                                     
   9074 = "ICPSR NUMBER";                                                  
   VALUE V2FT (MAX=40)                                                     
   1 = "SPRING,1989";                                                      
   VALUE V6FT (MAX=40)                                                     
   1 = "ALABAMA"                                                           
   2 = "ALASKA"                                                            
   3 = "ARIZONA"                                                           
   4 = "ARKANSAS"                                                          
   5 = "CALIFORNIA"                                                        
   6 = "COLORADO"                                                          
   7 = "CONNECTICUT"                                                       
   8 = "DELAWARE"                                                          
   9 = "DIST OF COLUMBIA"                                                  
   10 = "FLORIDA"                                                          
   11 = "GEORGIA"                                                          
   12 = "HAWAII"                                                           
   13 = "IDAHO"                                                            
   14 = "ILLINOIS"                                                         
   15 = "INDIANA"                                                          
   16 = "IOWA"                                                             
   17 = "KANSAS"                                                           
   18 = "KENTUCKY"                                                         
   19 = "LOUISIANA"                                                        
   20 = "MAINE"                                                            
   21 = "MARYLAND"                                                         
   22 = "MASSACHUSETTS"                                                    
   23 = "MICHIGAN"                                                         
   24 = "MINNESOTA"                                                        
   25 = "MISSISSIPPI"                                                      
   26 = "MISSOURI"                                                         
   27 = "MONTANA"                                                          
   28 = "NORTH CAROLINA"                                                   
   29 = "NORTH DAKOTA"                                                     
   30 = "NEBRASKA"                                                         
   31 = "NEVADA"                                                           
   32 = "NEW HAMPSHIRE"                                                    
   33 = "NEW JERSEY"                                                       
   34 = "NEW MEXICO"                                                       
   35 = "NEW YORK"                                                         
   36 = "OHIO"                                                             
   37 = "OKLAHOMA"                                                         
   38 = "OREGON"                                                           
   39 = "PENNSYLVANIA"                                                     
   40 = "RHODE ISLAND"                                                     
   41 = "SOUTH CAROLINA"                                                   
   42 = "SOUTH DAKOTA"                                                     
   43 = "TENNESSEE"                                                        
   44 = "TEXAS"                                                            
   45 = "UTAH"                                                             
   46 = "VIRGINIA"                                                         
   47 = "VERMONT"                                                          
   48 = "WASHINGTON"                                                       
   49 = "WISCONSIN"                                                        
   50 = "WEST VIRGINIA"                                                    
   51 = "WYOMING";                                                         
   VALUE V7FT (MAX=40)                                                     
   1 = "COUNTY LEVEL"                                                      
   2 = "CITY LEVEL";                                                       
   VALUE V13FT (MAX=40)                                                    
   1 = "CERTAINTY UNIT"                                                    
   2 = "SAMPLE UNIT"                                                       
   3 = "SAMPLE UNIT"                                                       
   4 = "SAMPLE UNIT";                                                      
   VALUE V162FT (MAX=40)                                                   
   1 = "YES"                                                               
   2 = "NO";                                                               
   VALUE V163FT (MAX=40)                                                   
   1 = "YES";                                                              
   VALUE V164FT (MAX=40)                                                   
   2 = "YES";                                                              
   VALUE V165FT (MAX=40)                                                   
   3 = "YES";                                                              
   VALUE V166FT (MAX=40)                                                   
   4 = "YES";                                                              
   VALUE V167FT (MAX=40)                                                   
   5 = "YES";                                                              
   VALUE V168FT (MAX=40)                                                   
   6 = "YES";                                                              
   VALUE V169FT (MAX=40)                                                   
   7 = "YES";                                                              
   VALUE V170FT (MAX=40)                                                   
   8 = "YES";                                                              
   VALUE V171FT (MAX=40)                                                   
   9 = "YES";                                                              
   VALUE V172FT (MAX=40)                                                   
   10 = "YES";                                                             
   VALUE V173FT (MAX=40)                                                   
   11 = "YES";                                                             
   VALUE V174FT (MAX=40)                                                   
   12 = "YES";                                                             
   VALUE V175FT (MAX=40)                                                   
   13 = "YES";                                                             
   VALUE V176FT (MAX=40)                                                   
   0 = "CENSUS CODE";                                                      
*/                                                                         
                                                                           
* SAS DATA, INFILE, INPUT STATEMENTS;                                      
                                                                           
DATA;                                                                      
INFILE "physical-filename" LRECL=642;                                      
INPUT                                                                      
   V1 1-4                   V2 5-5                   V3 6-6                
   V4 7-9                   V5 10-12                 V6 13-14              
   V7 15-15                 V8 16-18                 V9 19-21              
   V10 22-22                V11 23-28                V12 29-30             
   V13 31-31                V14 32-35 .3             V15 36-40             
   V16 41-45                V17 46-50                V18 51-55             
   V19 56-60                V20 61-65                V21 66-70             
   V22 71-75                V23 76-80                V24 81-85             
   V25 86-90                V26 91-95                V27 96-100            
   V28 101-105              V29 106-110              V30 111-115           
   V31 116-120              V32 121-125              V33 126-130           
   V34 131-135              V35 136-140              V36 141-145           
   V37 146-150              V38 151-155              V39 156-160           
   V40 161-165              V41 166-170              V42 171-175           
   V43 176-180              V44 181-185              V45 186-190           
   V46 191-195              V47 196-200              V48 201-205           
   V49 206-210              V50 211-215              V51 216-220           
   V52 221-225              V53 226-230              V54 231-235           
   V55 236-240              V56 241-245              V57 246-250           
   V58 251-255              V59 256-260              V60 261-265           
   V61 266-270              V62 271-275              V63 276-280           
   V64 281-285              V65 286-290              V66 291-295           
   V67 296-300              V68 301-305              V69 306-310           
   V70 311-315              V71 316-320              V72 321-325           
   V73 326-330              V74 331-335              V75 336-340           
   V76 341-345              V77 346-350              V78 351-355           
   V79 356-360              V80 361-365              V81 366-370           
   V82 371-375              V83 376-380              V84 381-385           
   V85 386-390              V86 391-395              V87 396-400           
   V88 401-405              V89 406-410              V90 411-415           
   V91 416-420              V92 421-425              V93 426-430           
   V94 431-435              V95 436-440              V96 441-445           
   V97 446-450              V98 451-455              V99 456-460           
   V100 461-465             V101 466-470             V102 471-475          
   V103 476-480             V104 481-485             V105 486-490          
   V106 491-495             V107 496-500             V108 501-505          
   V109 506-511             V110 512-517             V111 518-522          
   V112 523-526             V113 527-530             V114 531-536          
   V115 537-542             V116 543-547             V117 548-552          
   V118 553-557             V119 558-559             V120 560-561          
   V121 562-562             V122 563-563             V123 564-564          
   V124 565-566             V125 567-568             V126 569-569          
   V127 570-570             V128 571-571             V129 572-572          
   V130 573-573             V131 574-574             V132 575-575          
   V133 576-576             V134 577-577             V135 578-578          
   V136 579-579             V137 580-580             V138 581-581          
   V139 582-582             V140 583-583             V141 584-584          
   V142 585-585             V143 586-586             V144 587-588          
   V145 589-590             V146 591-591             V147 592-592          
   V148 593-593             V149 594-594             V150 595-595          
   V151 596-596             V152 597-597             V153 598-598          
   V154 599-603             V155 604-608             V156 609-609          
   V157 610-613             V158 614-617             V159 618-620          
   V160 621-622             V161 623-623             V162 624-624          
   V163 625-625             V164 626-626             V165 627-627          
   V166 628-628             V167 629-629             V168 630-630          
   V169 631-631             V170 632-632             V171 633-633          
   V172 634-635             V173 636-637             V174 638-639          
   V175 640-641             V176 642-642;                                  
                                                                           
* SAS LABEL STATEMENT;                                                     
                                                                           
LABEL                                                                      
   V1 = "ICPSR STUDY NUMBER-9074"                                          
   V2 = "ICPSR EDITION NUMBER 1"                                           
   V3 = "ICPSR PART NUMBER 1"                                              
   V4 = "ICPSR SEQUENCE NUMBER"                                            
   V5 = "FORM NUMBER"                                                      
   V6 = "STATE CODE"                                                       
   V7 = "GOVERNMENT CODE"                                                  
   V8 = "COUNTY CODE"                                                      
   V9 = "UNIT NUMBERS"                                                     
   V10 = "REGION CODE"                                                     
   V11 = "REFERENCE DATE"                                                  
   V12 = "JAIL COUNTER"                                                    
   V13 = "STRATUM CODE"                                                    
   V14 = "WEIGHT"                                                          
   V15 = "INMATES-TOTAL"                                                   
   V16 = "INMATES-ADULT MALE"                                              
   V17 = "INMATES-ADULT FEMALE"                                            
   V18 = "INMATES-JUVENILE MALE"                                           
   V19 = "INMATES-JUV FEMALE"                                              
   V20 = "AWAIT ARRAIGNMNT-TOTAL"                                          
   V21 = "AWAIT ARRGNMNT-ADLT MALE"                                        
   V22 = "AWAIT ARRGNMNT-ADLT FMAL"                                        
   V23 = "AWAIT ARRGNMNT-JUV MALE"                                         
   V24 = "AWAIT ARRGNMNT-JUV FMALE"                                        
   V25 = "CONVICTED-TOTAL"                                                 
   V26 = "CONVICTED-ADULT MALE"                                            
   V27 = "CONVICTED-ADULT FEMALE"                                          
   V28 = "CONVICTED-JUV MALE"                                              
   V29 = "CONVICTED-JUV FEMALE"                                            
   V30 = "SRVING SENTENCE-TOTAL"                                           
   V31 = "SRVING SENTNCE-ADLT MALE"                                        
   V32 = "SRVNG SENTNCE-ADLT FMALE"                                        
   V33 = "SRVING SENTENCE-JUV MALE"                                        
   V34 = "SRVING SENTNCE-JUV FMALE"                                        
   V35 = "TECH VIOL-TOTAL"                                                 
   V36 = "TECH VIOL-ADULT MALE"                                            
   V37 = "TECH VIOL-ADULT FEMALE"                                          
   V38 = "TECH VIOL-JUV MALE"                                              
   V39 = "TECH VIOL-JUV FEMALE"                                            
   V40 = "JUV AUTHOR-TOTAL"                                                
   V41 = "JUV AUTHOR-MALE"                                                 
   V42 = "JUV AUTHOR-FEMALE"                                               
   V43 = "OTHER - TOTAL"                                                   
   V44 = "OTHER - ADULT MALE"                                              
   V45 = "OTHER - ADULT FEMALE"                                            
   V46 = "OTHER - JUVENILE MALE"                                           
   V47 = "OTHER - JUVENILE FEMALE"                                         
   V48 = "RACE - TOTAL"                                                    
   V49 = "RACE - ADULT MALE"                                               
   V50 = "RACE - ADULT FEMALE"                                             
   V51 = "RACE - JUVENILE MALE"                                            
   V52 = "RACE - JUVENILE FEMALE"                                          
   V53 = "WHITE NNHISPANIC-TOTAL"                                          
   V54 = "WHITE NNHSPNIC-ADLT MALE"                                        
   V55 = "WHITE NNHSPNC-ADLT FMALE"                                        
   V56 = "WHITE NNHSPANIC-JUV MALE"                                        
   V57 = "WHITE NNHISPNC-JUV FMALE"                                        
   V58 = "BLACK NNHISPANIC-TOTAL"                                          
   V59 = "BLACK NNHSPNIC-ADLT MALE"                                        
   V60 = "BLACK NNHSPNC-ADLT FMALE"                                        
   V61 = "BLACK NNHSPANIC-JUV MALE"                                        
   V62 = "BLACK NNHSPNIC-JUV FMALE"                                        
   V63 = "HISPANIC-TOTAL"                                                  
   V64 = "HISPANIC-ADULT MALE"                                             
   V65 = "HISPANIC-ADULT FEMALE"                                           
   V66 = "HISPANIC-JUVENILE MALE"                                          
   V67 = "HISPANIC-JUVENILE FEMALE"                                        
   V68 = "WHITE HISPANIC-TOTAL"                                            
   V69 = "WHITE HISPANIC-ADLT MALE"                                        
   V70 = "WHITE HISPNIC-ADLT FMALE"                                        
   V71 = "WHITE HISPANIC-JUV MALE"                                         
   V72 = "WHITE HISPANIC-JUV FMALE"                                        
   V73 = "BLACK HISPANIC-TOTAL"                                            
   V74 = "BLACK HISPANIC-ADLT MALE"                                        
   V75 = "BLACK HISPNIC-ADLT FMALE"                                        
   V76 = "BLACK HISPANIC-JUV MALE"                                         
   V77 = "BLACK HISPANIC-JUV FMALE"                                        
   V78 = "INDIAN/ALASKAN-TOTAL"                                            
   V79 = "INDIAN/ALASKAN-ADLT MALE"                                        
   V80 = "INDIAN/ALSKAN-ADLT FMALE"                                        
   V81 = "INDIAN/ALASKAN-JUV MALE"                                         
   V82 = "INDIAN/ALASKAN-JUV FMALE"                                        
   V83 = "ASIAN/PACIFIC-TOTAL"                                             
   V84 = "ASIAN/PACIFIC-ADULT MALE"                                        
   V85 = "ASIAN/PACIFIC-ADLT FMALE"                                        
   V86 = "ASIAN/PACIFIC-JUV MALE"                                          
   V87 = "ASIAN/PACIFIC-JUV FEMALE"                                        
   V88 = "HELD FR FED-ILLGL ALIENS"                                        
   V89 = "HELD FR FED-OTHER"                                               
   V90 = "HELD FOR STATE"                                                  
   V91 = "HELD FOR OTHER LOCAL"                                            
   V92 = "OVERCROWDNG-ILLGL ALIENS"                                        
   V93 = "OVERCROWDING-OTHER FED"                                          
   V94 = "OVERCROWDING-STATE"                                              
   V95 = "OVERCROWDING-OTHER LOCAL"                                        
   V96 = "ERLY TRNSFR-ILLGL ALIENS"                                        
   V97 = "ERLY TRNSFR-OTHER FED"                                           
   V98 = "ERLY TRNSFR-STATE"                                               
   V99 = "ERLY TRNSFR-OTHER LOCAL"                                         
   V100 = "OTH RESNS-ILLGL ALIENS"                                         
   V101 = "OTH REASONS-OTH FED"                                            
   V102 = "OTH REASONS-STATE"                                              
   V103 = "OTH REASONS-OTH LOCAL"                                          
   V104 = "ADP-TOTAL"                                                      
   V105 = "ADP-ADULT MALE"                                                 
   V106 = "ADP-ADULT FEMALE"                                               
   V107 = "ADP-JUVENILE MALE"                                              
   V108 = "ADP-JUVENILE FEMALE"                                            
   V109 = "ADMISSIONS-TOTAL"                                               
   V110 = "ADMISSIONS-ADULT MALE"                                          
   V111 = "ADMISSIONS-ADULT FEMALE"                                        
   V112 = "ADMISSIONS-JUVENILE MALE"                                       
   V113 = "ADMISSIONS-JUV FEMALE"                                          
   V114 = "DISCHARGES-TOTAL"                                               
   V115 = "DISCHARGES-ADULT MALE"                                          
   V116 = "DISCHARGES-ADULT FEMALE"                                        
   V117 = "DISCHARGES-JUVENILE MALE"                                       
   V118 = "DISCHARGES-JUV FEMALE"                                          
   V119 = "DEATHS-TOTAL"                                                   
   V120 = "DEATHS-ADULT MALE"                                              
   V121 = "DEATHS-ADULT FEMALE"                                            
   V122 = "DEATHS-JUVENILE MALE"                                           
   V123 = "DEATHS-JUVENILE FEMALE"                                         
   V124 = "ILLNESS/NATURAL-TOTAL"                                          
   V125 = "ILLNESS/NATRL-ADLT MALE"                                        
   V126 = "ILLNESS/NATRL-ADLT FMALE"                                       
   V127 = "ILLNESS/NATRL-JUV MALE"                                         
   V128 = "ILLNESS/NATRL-JUV FMALE"                                        
   V129 = "SUICIDE-TOTAL"                                                  
   V130 = "SUICIDE-ADULT MALE"                                             
   V131 = "SUICIDE-ADULT FEMALE"                                           
   V132 = "SUICIDE-JUVENILE MALE"                                          
   V133 = "SUICIDE-JUVENILE FEMALE"                                        
   V134 = "HOMICIDE-TOTAL"                                                 
   V135 = "HOMICIDE-ADULT MALE"                                            
   V136 = "HOMICIDE-ADULT FEMALE"                                          
   V137 = "HOMICIDE-JUVENILE MALE"                                         
   V138 = "HOMICIDE-JUVENILE FEMALE"                                       
   V139 = "HOMICIDE OTH-TOTAL"                                             
   V140 = "HOMICIDE OTH-ADULT MALE"                                        
   V141 = "HOMICIDE OTH-ADULT FMALE"                                       
   V142 = "HOMICIDE 0TH-JUV MALE"                                          
   V143 = "HOMICIDE OTH-JUV FEMALE"                                        
   V144 = "AIDS-TOTAL"                                                     
   V145 = "AIDS-ADULT MALE"                                                
   V146 = "AIDS-ADULT FEMALE"                                              
   V147 = "AIDS-JUVENILE MALE"                                             
   V148 = "AIDS-JUVENILE FEMALE"                                           
   V149 = "OTHER DEATH-TOTAL"                                              
   V150 = "OTHER DEATH-ADULT MALE"                                         
   V151 = "OTHER DEATH-ADULT FEMALE"                                       
   V152 = "OTHER DEATH-JUV MALE"                                           
   V153 = "OTHER DEATH-JUV FEMALE"                                         
   V154 = "RATED CAPACITY"                                                 
   V155 = "DESIGN CAPACITY"                                                
   V156 = "COURT ORDER CROWDING"                                           
   V157 = "MAX INMATES-TOTAL"                                              
   V158 = "MAX INMATES-ADULT MALE"                                         
   V159 = "MAX INMATES-ADLT FEMALE"                                        
   V160 = "MAX INMATES-JUV MALE"                                           
   V161 = "MAX INMATES-JUV FEMALE"                                         
   V162 = "COURT ORDER CONDITIONS"                                         
   V163 = "COURT ORDER-CROWDED"                                            
   V164 = "COURT ORDER-ADMIN SEG"                                          
   V165 = "COURT ORDER-DISCIPL POL"                                        
   V166 = "COURT ORDER-GRVNCE PROC"                                        
   V167 = "COURT ORDER-MED FACIL"                                          
   V168 = "COURT ORDER-REC FACILTY"                                        
   V169 = "COURT ORDER-VISIT POLICY"                                       
   V170 = "COURT ORDER-FIRE HAZARDS"                                       
   V171 = "COURT ORDER-STAFF PATTRN"                                       
   V172 = "COURT ORDER-ED/TRAINING"                                        
   V173 = "COURT ORDER-COUNSELLING"                                        
   V174 = "COURT ORDER-FOOD SERVICE"                                       
   V175 = "COURT ORDER-OTHER"                                              
   V176 = "CENSUS USE BOX";                                                
                                                                           
* SAS FORMAT STATEMENT;                                                    
                                                                           
/*                                                                         
FORMAT                                                                     
   V1 V1FT.               V2 V2FT.               V6 V6FT.                  
   V7 V7FT.               V13 V13FT.             V162 V162FT.              
   V163 V163FT.           V164 V164FT.           V165 V165FT.              
   V166 V166FT.           V167 V167FT.           V168 V168FT.              
   V169 V169FT.           V170 V170FT.           V171 V171FT.              
   V172 V172FT.           V173 V173FT.           V174 V174FT.              
   V175 V175FT.           V176 V176FT.;                                    
*/                                                                         
                                                                           
* USER-DEFINED MISSING VALUE RECODE TO SAS SYSMIS;                         
                                                                           
/*                                                                         
   IF V156=9 THEN V156=.;              IF V162=9 THEN V162=.;              
   IF V163=9 THEN V163=.;              IF V164=9 THEN V164=.;              
   IF V165=9 THEN V165=.;              IF V166=9 THEN V166=.;              
   IF V167=9 THEN V167=.;              IF V168=9 THEN V168=.;              
   IF V169=9 THEN V169=.;              IF V170=9 THEN V170=.;              
   IF V171=0 THEN V171=.;              IF V172=99 THEN V172=.;             
   IF V173=99 THEN V173=.;             IF V174=99 THEN V174=.;             
   IF V175=99 THEN V175=.;                                                 
*/                                                                         
                                                                           
* USER-DEFINED MISSING VALUE RECODE TO SAS SYSMIS;                         
                                                                           
/*                                                                         
   IF V156=0000009 THEN V156=.;        IF V162=0000009 THEN V162=.;        
   IF V163=0000009 THEN V163=.;        IF V164=0000009 THEN V164=.;        
   IF V165=0000009 THEN V165=.;        IF V166=0000009 THEN V166=.;        
   IF V167=0000009 THEN V167=.;        IF V168=0000009 THEN V168=.;        
   IF V169=0000009 THEN V169=.;        IF V170=0000009 THEN V170=.;        
   IF V171=0000000 THEN V171=.;        IF V172=0000099 THEN V172=.;        
   IF V173=0000099 THEN V173=.;        IF V174=0000099 THEN V174=.;        
   IF V175=0000099 THEN V175=.;                                            
*/                                                                         
