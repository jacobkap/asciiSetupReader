*                                                                              
*               SPSS DATA DEFINITON STATEMENTS FOR ICPSR 9028                  
*                                                                              
*            UNIFORM CRIME REPORTING PROGRAM DATA: [UNITED STATES]             
*                    PART 7: Supplementary Homicide Reports, 1981              
*                                                                              
*                           2nd ICPSR Edition                                  
*                              May 2000                                        
*                                                                              
*                                                                              
*   Five SPSS setup sections are provided for this data collection.            
*   These sections are briefly described below:                                
*                                                                              
*   DATA LIST contains the SPSS statement which assigns the variable           
*   names, identifies the variable type as either character or                 
*   numeric, and specifies the beginning and ending column locations           
*   for each variable.                                                         
*                                                                              
*   VARIABLE LABELS assigns variable labels for all variables in the           
*   data file.                                                                 
*                                                                              
*   VALUE LABELS assigns value labels to the values found in the data          
*   file.                                                                      
*                                                                              
*   MISSING VALUE RECODES contains SPSS program statements which               
*   convert missing values to the SPSS system missing values.                  
*                                                                              
*   MISSING VALUES declares user-defined missing values. Each                  
*   user-defined missing value is interpreted as missing by the SPSS           
*   system.  These values can then be treated specially in data                
*   transformations, statistical calculations, and case selection.             
*                                                                              
*   Users should combine and modify these sections or parts of these           
*   sections to suit their specific needs.  Users will also need to            
*   change the file-specification in the DATA LIST statement to an             
*   appropriate filename for their system.                                     
*                                                                              
*   PLEASE NOTE: The SPSS setup sections for MISSING VALUE RECODE and          
*   MISSING VALUES have been 'commented out' (i.e., preceded by                
*   asterisks).  As you cannot use both MISSING VALUES and MISSING             
*   VALUE RECODE sections within the same setup, at least one of these         
*   sections must be commented out. Simply remove the comment                  
*   indicators from the section you wish to include in your final              
*   setup.                                                                     
*                                                                              
                                                                               
                                                                               
* SPSS DATA LIST FOR 9028                                                      
                                                                               
DATA LIST FILE='file-specification' /                                          
  V1 1-4                                                                       
  V2 5                                                                         
  V3 6                                                                         
  V4 7-11                                                                      
  V5 12                                                                        
  V6 13-14                                                                     
  V7 15-21 (A)                                                                 
  V8 22-23                                                                     
  V9 24                                                                        
  V10 25-26                                                                    
  V11 27-33                                                                    
  V12 34-36                                                                    
  V13 37-39                                                                    
  V14 40                                                                       
  V15 41-64 (A)                                                                
  V16 65-70 (A)                                                                
  V17 71-72                                                                    
  V18 73-78                                                                    
  V19 79                                                                       
  V20 80                                                                       
  V21 81-83                                                                    
  V22 84                                                                       
  V23 85                                                                       
  V24 86                                                                       
  V25 87-89                                                                    
  V26 90                                                                       
  V27 91                                                                       
  V28 92                                                                       
  V29 93-95                                                                    
  V30 96                                                                       
  V31 97                                                                       
  V32 98                                                                       
  V33 99-101                                                                   
  V34 102                                                                      
  V35 103                                                                      
  V36 104                                                                      
  V37 105-107                                                                  
  V38 108                                                                      
  V39 109                                                                      
  V40 110                                                                      
  V41 111-113                                                                  
  V42 114                                                                      
  V43 115                                                                      
  V44 116                                                                      
  V45 117-119                                                                  
  V46 120                                                                      
  V47 121                                                                      
  V48 122                                                                      
  V49 123-125                                                                  
  V50 126                                                                      
  V51 127                                                                      
  V52 128                                                                      
  V53 129-131                                                                  
  V54 132                                                                      
  V55 133                                                                      
  V56 134                                                                      
  V57 135-137                                                                  
  V58 138                                                                      
  V59 139                                                                      
  V60 140                                                                      
  V61 141-143                                                                  
  V62 144                                                                      
  V63 145                                                                      
  V64 146                                                                      
  V65 147-149                                                                  
  V66 150                                                                      
  V67 151                                                                      
  V68 152                                                                      
  V69 153-155                                                                  
  V70 156                                                                      
  V71 157                                                                      
  V72 158                                                                      
  V73 159-160                                                                  
  V74 161-162                                                                  
  V75 163-164                                                                  
  V76 165                                                                      
  V77 166-168                                                                  
  V78 169                                                                      
  V79 170                                                                      
  V80 171                                                                      
  V81 172-173                                                                  
  V82 174-175                                                                  
  V83 176-177                                                                  
  V84 178                                                                      
  V85 179-181                                                                  
  V86 182                                                                      
  V87 183                                                                      
  V88 184                                                                      
  V89 185-186                                                                  
  V90 187-188                                                                  
  V91 189-190                                                                  
  V92 191                                                                      
  V93 192-194                                                                  
  V94 195                                                                      
  V95 196                                                                      
  V96 197                                                                      
  V97 198-199                                                                  
  V98 200-201                                                                  
  V99 202-203                                                                  
  V100 204                                                                     
  V101 205-207                                                                 
  V102 208                                                                     
  V103 209                                                                     
  V104 210                                                                     
  V105 211-212                                                                 
  V106 213-214                                                                 
  V107 215-216                                                                 
  V108 217                                                                     
  V109 218-220                                                                 
  V110 221                                                                     
  V111 222                                                                     
  V112 223                                                                     
  V113 224-225                                                                 
  V114 226-227                                                                 
  V115 228-229                                                                 
  V116 230                                                                     
  V117 231-233                                                                 
  V118 234                                                                     
  V119 235                                                                     
  V120 236                                                                     
  V121 237-238                                                                 
  V122 239-240                                                                 
  V123 241-242                                                                 
  V124 243                                                                     
  V125 244-246                                                                 
  V126 247                                                                     
  V127 248                                                                     
  V128 249                                                                     
  V129 250-251                                                                 
  V130 252-253                                                                 
  V131 254-255                                                                 
  V132 256                                                                     
  V133 257-259                                                                 
  V134 260                                                                     
  V135 261                                                                     
  V136 262                                                                     
  V137 263-264                                                                 
  V138 265-266                                                                 
  V139 267-268                                                                 
  V140 269                                                                     
  V141 270-272                                                                 
  V142 273                                                                     
  V143 274                                                                     
  V144 275                                                                     
  V145 276-277                                                                 
  V146 278-279                                                                 
  V147 280-281                                                                 
  V148 282                                                                     
  V149 283-285                                                                 
  V150 286                                                                     
  V151 287                                                                     
  V152 288                                                                     
  V153 289-290                                                                 
  V154 291-292                                                                 
  V155 293-294                                                                 
  V156 295 .                                                                   
                                                                               
                                                                               
* SPSS VARIABLE LABELS FOR 9028                                                
                                                                               
VARIABLE LABELS                                                                
  V1 "ICPSR STUDY NUMBER"                                                      
  V2 "ICPSR EDITION NUMBER"                                                    
  V3 "ICPSR PART NUMBER"                                                       
  V4 "ICPSR SEQ ID NUMBER"                                                     
  V5 "IDENTIFIER CODE"                                                         
  V6 "NUMERIC STATE CODE"                                                      
  V7 "ORI CODE"                                                                
  V8 "GROUP"                                                                   
  V9 "GEOGRAPHIC DIVISION"                                                     
  V10 "YEAR"                                                                   
  V11 "POPULATION"                                                             
  V12 "COUNTY"                                                                 
  V13 "MSA CODE"                                                               
  V14 "MSA INDICATION"                                                         
  V15 "AGENCY NAME"                                                            
  V16 "STATE NAME"                                                             
  V17 "MONTH OF OFFENSE"                                                       
  V18 "LAST UPDATE"                                                            
  V19 "TYPE OF ACTION"                                                         
  V20 "TYPE OF OFFENSE:HOMICIDE"                                               
  V21 "INCIDENT NUMBER"                                                        
  V22 "SITUATION"                                                              
  V23 "VICTIM COUNT-ADDL VICTIM"                                               
  V24 "OFFNDR COUNT-ADDL OFFNDR"                                               
  V25 "VICTIM 1: AGE"                                                          
  V26 "VICTIM 1: SEX"                                                          
  V27 "VICTIM 1: RACE"                                                         
  V28 "VICTIM 1: ETHNIC ORIGIN"                                                
  V29 "VICTIM 2: AGE"                                                          
  V30 "VICTIM 2: SEX"                                                          
  V31 "VICTIM 2: RACE"                                                         
  V32 "VICTIM 2: ETHNIC ORIGIN"                                                
  V33 "VICTIM 3: AGE"                                                          
  V34 "VICTIM 3: SEX"                                                          
  V35 "VICTIM 3: RACE"                                                         
  V36 "VICTIM 3: ETHNIC ORIGIN"                                                
  V37 "VICTIM 4: AGE"                                                          
  V38 "VICTIM 4: SEX"                                                          
  V39 "VICTIM 4: RACE"                                                         
  V40 "VICTIM 4: ETHNIC ORIGIN"                                                
  V41 "VICTIM 5: AGE"                                                          
  V42 "VICTIM 5: SEX"                                                          
  V43 "VICTIM 5: RACE"                                                         
  V44 "VICTIM 5: ETHNIC ORIGIN"                                                
  V45 "VICTIM 6: AGE"                                                          
  V46 "VICTIM 6: SEX"                                                          
  V47 "VICTIM 6: RACE"                                                         
  V48 "VICTIM 6: ETHNIC ORIGIN"                                                
  V49 "VICTIM 7: AGE"                                                          
  V50 "VICTIM 7: SEX"                                                          
  V51 "VICTIM 7: RACE"                                                         
  V52 "VICTIM 7: ETHNIC ORIGIN"                                                
  V53 "VICTIM 8: AGE"                                                          
  V54 "VICTIM 8: SEX"                                                          
  V55 "VICTIM 8: RACE"                                                         
  V56 "VICTIM 8: ETHNIC ORIGIN"                                                
  V57 "VICTIM 9: AGE"                                                          
  V58 "VICTIM 9: SEX"                                                          
  V59 "VICTIM 9: RACE"                                                         
  V60 "VICTIM 9: ETHNIC ORIGIN"                                                
  V61 "VICTIM 10: AGE"                                                         
  V62 "VICTIM 10: SEX"                                                         
  V63 "VICTIM 10: RACE"                                                        
  V64 "VICTIM 10: ETHNIC ORIGIN"                                               
  V65 "VICTIM 11: AGE"                                                         
  V66 "VICTIM 11: SEX"                                                         
  V67 "VICTIM 11: RACE"                                                        
  V68 "VICTIM 11: ETHNIC ORIGIN"                                               
  V69 "OFFENDER 1: AGE"                                                        
  V70 "OFFENDER 1: SEX"                                                        
  V71 "OFFENDER 1: RACE"                                                       
  V72 "OFFENDER 1: ETHNIC ORIGN"                                               
  V73 "OFFENDER 1: WEAPON"                                                     
  V74 "OFFENDER 1: RELATIONSHIP"                                               
  V75 "OFFENDER 1: CIRCUMSTANCE"                                               
  V76 "OFFENDER 1: SUBCIRCMSTNC"                                               
  V77 "OFFENDER 2: AGE"                                                        
  V78 "OFFENDER 2: SEX"                                                        
  V79 "OFFENDER 2: RACE"                                                       
  V80 "OFFENDER 2: ETHNIC ORIGN"                                               
  V81 "OFFENDER 2: WEAPON"                                                     
  V82 "OFFENDER 2: RELATIONSHIP"                                               
  V83 "OFFENDER 2: CIRCUMSTANCE"                                               
  V84 "OFFENDER 2: SUBCIRCMSTNC"                                               
  V85 "OFFENDER 3: AGE"                                                        
  V86 "OFFENDER 3: SEX"                                                        
  V87 "OFFENDER 3: RACE"                                                       
  V88 "OFFENDER 3: ETHNIC ORIGN"                                               
  V89 "OFFENDER 3: WEAPON"                                                     
  V90 "OFFENDER 3: RELATIONSHIP"                                               
  V91 "OFFENDER 3: CIRCUMSTANCE"                                               
  V92 "OFFENDER 3: SUBCIRCMSTNC"                                               
  V93 "OFFENDER 4: AGE"                                                        
  V94 "OFFENDER 4: SEX"                                                        
  V95 "OFFENDER 4: RACE"                                                       
  V96 "OFFENDER 4: ETHNIC ORIGN"                                               
  V97 "OFFENDER 4: WEAPON"                                                     
  V98 "OFFENDER 4: RELATIONSHIP"                                               
  V99 "OFFENDER 4: CIRCUMSTANCE"                                               
  V100 "OFFENDER 4: SUBCIRCMSTNC"                                              
  V101 "OFFENDER 5: AGE"                                                       
  V102 "OFFENDER 5: SEX"                                                       
  V103 "OFFENDER 5: RACE"                                                      
  V104 "OFFENDER 5: ETHNIC ORIGN"                                              
  V105 "OFFENDER 5: WEAPON"                                                    
  V106 "OFFENDER 5: RELATIONSHIP"                                              
  V107 "OFFENDER 5: CIRCUMSTANCE"                                              
  V108 "OFFENDER 5: SUBCIRCMSTNC"                                              
  V109 "OFFENDER 6: AGE"                                                       
  V110 "OFFENDER 6: SEX"                                                       
  V111 "OFFENDER 6: RACE"                                                      
  V112 "OFFENDER 6: ETHNIC ORIGN"                                              
  V113 "OFFENDER 6: WEAPON"                                                    
  V114 "OFFENDER 6: RELATIONSHIP"                                              
  V115 "OFFENDER 6: CIRCUMSTANCE"                                              
  V116 "OFFENDER 6: SUBCIRCMSTNC"                                              
  V117 "OFFENDER 7: AGE"                                                       
  V118 "OFFENDER 7: SEX"                                                       
  V119 "OFFENDER 7: RACE"                                                      
  V120 "OFFENDER 7: ETHNIC ORIGN"                                              
  V121 "OFFENDER 7: WEAPON"                                                    
  V122 "OFFENDER 7: RELATIONSHIP"                                              
  V123 "OFFENDER 7: CIRCUMSTANCE"                                              
  V124 "OFFENDER 7: SUBCIRCMSTNC"                                              
  V125 "OFFENDER 8: AGE"                                                       
  V126 "OFFENDER 8: SEX"                                                       
  V127 "OFFENDER 8: RACE"                                                      
  V128 "OFFENDER 8: ETHNIC ORIGN"                                              
  V129 "OFFENDER 8: WEAPON"                                                    
  V130 "OFFENDER 8: RELATIONSHIP"                                              
  V131 "OFFENDER 8: CIRCUMSTANCE"                                              
  V132 "OFFENDER 8: SUBCIRCMSTNC"                                              
  V133 "OFFENDER 9: AGE"                                                       
  V134 "OFFENDER 9: SEX"                                                       
  V135 "OFFENDER 9: RACE"                                                      
  V136 "OFFENDER 9: ETHNIC ORIGN"                                              
  V137 "OFFENDER 9: WEAPON"                                                    
  V138 "OFFENDER 9: RELATIONSHIP"                                              
  V139 "OFFENDER 9: CIRCUMSTANCE"                                              
  V140 "OFFENDER 9: SUBCIRCMSTNC"                                              
  V141 "OFFENDER 10: AGE"                                                      
  V142 "OFFENDER 10: SEX"                                                      
  V143 "OFFENDER 10: RACE"                                                     
  V144 "OFFENDER 10: ETHNC ORIGN"                                              
  V145 "OFFENDER 10: WEAPON"                                                   
  V146 "OFFENDER 10: RELATIONSHP"                                              
  V147 "OFFENDER 10: CIRCUMSTANC"                                              
  V148 "OFFENDER 10: SUBCRCMSTNC"                                              
  V149 "OFFENDER 11: AGE"                                                      
  V150 "OFFENDER 11: SEX"                                                      
  V151 "OFFENDER 11: RACE"                                                     
  V152 "OFFENDER 11: ETHNC ORIGN"                                              
  V153 "OFFENDER 11: WEAPON"                                                   
  V154 "OFFENDER 11: RELATIONSHP"                                              
  V155 "OFFENDER 11: CIRCUMSTANC"                                              
  V156 "OFFENDER 11: SUBCRCMSTNC".                                             
                                                                               
                                                                               
* SPSS VALUE LABELS FOR 9028                                                   
                                                                               
VALUE LABELS                                                                   
 V1    9028  "ICPSR Study Number"                                              
       /                                                                       
 V2    2  "Second edition, February 1994"                                      
       /                                                                       
 V3    7  "Part 7: SHR 1981"                                                   
       /                                                                       
 V5    6  "SHR master file"                                                    
       /                                                                       
 V6    01  "Alabama"                                                           
       02  "Arizona"                                                           
       03  "Arkansas"                                                          
       04  "California"                                                        
       05  "Colorado"                                                          
       06  "Connecticut"                                                       
       07  "Delaware"                                                          
       08  "Washington, D.C"                                                   
       09  "Florida"                                                           
       10  "Georgia"                                                           
       11  "Idaho"                                                             
       12  "Illinois"                                                          
       13  "Indiana"                                                           
       14  "Iowa"                                                              
       15  "Kansas"                                                            
       16  "Kentucky"                                                          
       17  "Louisiana"                                                         
       18  "Maine"                                                             
       19  "Maryland"                                                          
       20  "Massachusetts"                                                     
       21  "Michigan"                                                          
       22  "Minnesota"                                                         
       23  "Mississippi"                                                       
       24  "Missouri"                                                          
       25  "Montana"                                                           
       26  "Nebraska"                                                          
       27  "Nevada"                                                            
       28  "New Hampshire"                                                     
       29  "New Jersey"                                                        
       30  "New Mexico"                                                        
       31  "New York"                                                          
       32  "North Carolina"                                                    
       33  "North Dakota"                                                      
       34  "Ohio"                                                              
       35  "Oklahoma"                                                          
       36  "Oregon"                                                            
       37  "Pennsylvania"                                                      
       38  "Rhode Island"                                                      
       39  "South Carolina"                                                    
       40  "South Dakota"                                                      
       41  "Tennessee"                                                         
       42  "Texas"                                                             
       43  "Utah"                                                              
       44  "Vermont"                                                           
       45  "Virginia"                                                          
       46  "Washington"                                                        
       47  "West Virginia"                                                     
       48  "Wisconsin"                                                         
       49  "Wyoming"                                                           
       50  "Alaska"                                                            
       51  "Hawaii"                                                            
       52  "Canal Zone"                                                        
       53  "Puerto Rico"                                                       
       54  "American Samoa"                                                    
       55  "Guam"                                                              
       62  "Virgin Islands"                                                    
       /                                                                       
 V8    0  "Possessions"                                                        
       11  "All cities 1,000,000 or over"                                      
       12  "Cities 500,000 thru 999,999"                                       
       13  "Cities 250,000 thru 499,999"                                       
       20  "Cities 100,000 thru 249,999"                                       
       30  "Cities 50,000 thru 99,999"                                         
       40  "Cities 25,000 thru 49,999"                                         
       50  "Cities 10,000 thru 24,999"                                         
       60  "Cities 2,500 thru 9,999"                                           
       70  "Cities under 2,500"                                                
       81  "Non-MSA counties 100,000 or over"                                  
       82  "Non-MSA counties 25,000 thru 99,999"                               
       83  "Non-MSA counties 10,000 thru 24,999"                               
       84  "Non-MSA counties under 10,000"                                     
       85  "Non-MSA State Police"                                              
       91  "MSA counties 100,000 or over"                                      
       92  "MSA counties 25,000 thru 99,999"                                   
       93  "MSA counties 10,000 thru 24,999"                                   
       94  "MSA counties under 10,000"                                         
       95  "MSA State Police"                                                  
       /                                                                       
 V9    0  "Possessions"                                                        
       1  "New England States"                                                 
       2  "Middle Atlantic States"                                             
       3  "East North Central States"                                          
       4  "West North Central States"                                          
       5  "South Atlantic States"                                              
       6  "East South Central States"                                          
       7  "West South Central States"                                          
       8  "Mountain States"                                                    
       9  "Pacific States"                                                     
       /                                                                       
 V10   81  "1981"                                                              
       /                                                                       
 V11   0  "Unknown or not reported"                                            
       /                                                                       
 V12   0  "Inapplicable"                                                       
       /                                                                       
 V13   0  "Inapplicable"                                                       
       /                                                                       
 V14   0  "Non-suburban"                                                       
       1  "Suburban"                                                           
       /                                                                       
 V17   1  "January"                                                            
       2  "February"                                                           
       3  "March"                                                              
       4  "April"                                                              
       5  "May"                                                                
       6  "June"                                                               
       7  "July"                                                               
       8  "August"                                                             
       9  "September"                                                          
       10  "October"                                                           
       11  "November"                                                          
       12  "December"                                                          
       /                                                                       
 V19   0  "Normal update"                                                      
       1  "Adjustment"                                                         
       /                                                                       
 V20   1  "Murder and non-negligent manslaughter"                              
       2  "Manslaughter by negligence"                                         
       /                                                                       
 V22   1  "Single victim/single offender"                                      
       2  "Single victim/unknown offender(s)"                                  
       3  "Single victim/multiple offenders"                                   
       4  "Multiple victims/single offender"                                   
       5  "Multiple victims/multiple offenders"                                
       6  "Multiple victims/unknown offender(s)"                               
       /                                                                       
 V25   100  "Birth to 6 days old"                                              
       101  "7 days old to 364 days old"                                       
       1  "1 year old"                                                         
       99  "99 years old or more"                                              
       999  "Unknown"                                                          
       900  "Out of Universe"                                                  
       /                                                                       
 V26   1  "Male"                                                               
       2  "Female"                                                             
       9  "Unknown"                                                            
       /                                                                       
 V27   1  "White"                                                              
       2  "Black"                                                              
       3  "American Indian or Alaskan Native"                                  
       4  "Asian or Pacific Islander"                                          
       9  "Unknown"                                                            
       /                                                                       
 V28   1  "Hispanic origin"                                                    
       2  "Not of Hispanic origin"                                             
       9  "Unknown"                                                            
       /                                                                       
 V29   100  "Birth to 6 days old"                                              
       101  "7 days old to 364 days old"                                       
       001  "1 year old"                                                       
       099  "99 years old or more"                                             
       998  "Inap, only one victim"                                            
       999  "Unknown"                                                          
       /                                                                       
 V30   1  "Male"                                                               
       2  "Female"                                                             
       8  "Inap, only one victim"                                              
       9  "Unknown"                                                            
       /                                                                       
 V31   1  "White"                                                              
       2  "Black"                                                              
       3  "American Indian or Alaskan Native"                                  
       4  "Asian or Pacific Islander"                                          
       8  "Inap, only one victim"                                              
       9  "Unknown"                                                            
       /                                                                       
 V32   1  "Hispanic origin"                                                    
       2  "Not of Hispanic origin"                                             
       8  "Inap, only one victim"                                              
       9  "Unknown"                                                            
       /                                                                       
 V33   100  "Birth to 6 days old"                                              
       101  "7 days old to 364 days old"                                       
       001  "1 year old"                                                       
       099  "99 years old or more"                                             
       998  "Inap, less than 3 victims"                                        
       999  "Unknown"                                                          
       /                                                                       
 V34   1  "Male"                                                               
       2  "Female"                                                             
       8  "Inap, less than 3 victims"                                          
       9  "Unknown"                                                            
       /                                                                       
 V35   1  "White"                                                              
       2  "Black"                                                              
       3  "American Indian or Alaskan Native"                                  
       4  "Asian or Pacific Islander"                                          
       8  "Inap, less than 3 victims"                                          
       9  "Unknown"                                                            
       /                                                                       
 V36   1  "Hispanic origin"                                                    
       2  "Not of Hispanic origin"                                             
       8  "Inap, less than 3 victims"                                          
       9  "Unknown"                                                            
       /                                                                       
 V37   100  "Birth to 6 days old"                                              
       101  "7 days old to 364 days old"                                       
       001  "1 year old"                                                       
       099  "99 years old or more"                                             
       998  "Inap, less than 4 victims"                                        
       999  "Unknown"                                                          
       /                                                                       
 V38   1  "Male"                                                               
       2  "Female"                                                             
       8  "Inap, less than 4 victims"                                          
       9  "Unknown"                                                            
       /                                                                       
 V39   1  "White"                                                              
       2  "Black"                                                              
       3  "American Indian or Alaskan Native"                                  
       4  "Asian or Pacific Islander"                                          
       8  "Inap, less than 4 victims"                                          
       9  "Unknown"                                                            
       /                                                                       
 V40   1  "Hispanic origin"                                                    
       2  "Not of Hispanic origin"                                             
       8  "Inap, less than 4 victims"                                          
       9  "Unknown"                                                            
       /                                                                       
 V41   100  "Birth to 6 days old"                                              
       101  "7 days old to 364 days old"                                       
       001  "1 year old"                                                       
       099  "99 years old or more"                                             
       998  "Inap, less than 5 victims"                                        
       999  "Unknown"                                                          
       /                                                                       
 V42   1  "Male"                                                               
       2  "Female"                                                             
       8  "Inap, less than 5 victims"                                          
       9  "Unknown"                                                            
       /                                                                       
 V43   1  "White"                                                              
       2  "Black"                                                              
       3  "American Indian or Alaskan Native"                                  
       4  "Asian or Pacific Islander"                                          
       8  "Inap, less than 5 victims"                                          
       9  "Unknown"                                                            
       /                                                                       
 V44   1  "Hispanic origin"                                                    
       2  "Not of Hispanic origin"                                             
       8  "Inap, less than 5 victims"                                          
       9  "Unknown"                                                            
       /                                                                       
 V45   100  "Birth to 6 days old"                                              
       101  "7 days old to 364 days old"                                       
       001  "1 year old"                                                       
       099  "99 years old or more"                                             
       998  "Inap, less than 6 victims"                                        
       999  "Unknown"                                                          
       /                                                                       
 V46   1  "Male"                                                               
       2  "Female"                                                             
       8  "Inap, less than 6 victims"                                          
       9  "Unknown"                                                            
       /                                                                       
 V47   1  "White"                                                              
       2  "Black"                                                              
       3  "American Indian or Alaskan Native"                                  
       4  "Asian or Pacific Islander"                                          
       8  "Inap, less than 6 victims"                                          
       9  "Unknown"                                                            
       /                                                                       
 V48   1  "Hispanic origin"                                                    
       2  "Not of Hispanic origin"                                             
       8  "Inap, less than 6 victims"                                          
       9  "Unknown"                                                            
       /                                                                       
 V49   100  "Birth to 6 days old"                                              
       101  "7 days old to 364 days old"                                       
       001  "1 year old"                                                       
       099  "99 years old or more"                                             
       998  "Inap, less than 7 victims"                                        
       999  "Unknown"                                                          
       /                                                                       
 V50   1  "Male"                                                               
       2  "Female"                                                             
       8  "Inap, less than 7 victims"                                          
       9  "Unknown"                                                            
       /                                                                       
 V51   1  "White"                                                              
       2  "Black"                                                              
       3  "American Indian or Alaskan Native"                                  
       4  "Asian or Pacific Islander"                                          
       8  "Inap, less than 7 victims"                                          
       9  "Unknown"                                                            
       /                                                                       
 V52   1  "Hispanic origin"                                                    
       2  "Not of Hispanic origin"                                             
       8  "Inap, less than 7 victims"                                          
       9  "Unknown"                                                            
       /                                                                       
 V53   100  "Birth to 6 days old"                                              
       101  "7 days old to 364 days old"                                       
       001  "1 year old"                                                       
       099  "99 years old or more"                                             
       998  "Inap, less than 8 victims"                                        
       999  "Unknown"                                                          
       /                                                                       
 V54   1  "Male"                                                               
       2  "Female"                                                             
       8  "Inap, less than 8 victims"                                          
       9  "Unknown"                                                            
       /                                                                       
 V55   1  "White"                                                              
       2  "Black"                                                              
       3  "American Indian or Alaskan Native"                                  
       4  "Asian or Pacific Islander"                                          
       8  "Inap, less than 8 victims"                                          
       9  "Unknown"                                                            
       /                                                                       
 V56   1  "Hispanic origin"                                                    
       2  "Not of Hispanic origin"                                             
       8  "Inap, less than 8 victims"                                          
       9  "Unknown"                                                            
       /                                                                       
 V57   100  "Birth to 6 days old"                                              
       101  "7 days old to 364 days old"                                       
       001  "1 year old"                                                       
       099  "99 years old or more"                                             
       998  "Inap, less than 9 victims"                                        
       999  "Unknown"                                                          
       /                                                                       
 V58   1  "Male"                                                               
       2  "Female"                                                             
       8  "Inap, less than 9 victims"                                          
       9  "Unknown"                                                            
       /                                                                       
 V59   1  "White"                                                              
       2  "Black"                                                              
       3  "American Indian or Alaskan Native"                                  
       4  "Asian or Pacific Islander"                                          
       8  "Inap, less than 9 victims"                                          
       9  "Unknown"                                                            
       /                                                                       
 V60   1  "Hispanic origin"                                                    
       2  "Not of Hispanic origin"                                             
       8  "Inap, less than 9 victims"                                          
       9  "Unknown"                                                            
       /                                                                       
 V61   100  "Birth to 6 days old"                                              
       101  "7 days old to 364 days old"                                       
       001  "1 year old"                                                       
       099  "99 years old or more"                                             
       998  "Inap, less than 10 victims"                                       
       999  "Unknown"                                                          
       /                                                                       
 V62   1  "Male"                                                               
       2  "Female"                                                             
       8  "Inap, less than 10 victims"                                         
       9  "Unknown"                                                            
       /                                                                       
 V63   1  "White"                                                              
       2  "Black"                                                              
       3  "American Indian or Alaskan Native"                                  
       4  "Asian or Pacific Islander"                                          
       8  "Inap, less than 10 victims"                                         
       9  "Unknown"                                                            
       /                                                                       
 V64   1  "Hispanic origin"                                                    
       2  "Not of Hispanic origin"                                             
       8  "Inap, less than 10 victims"                                         
       9  "Unknown"                                                            
       /                                                                       
 V65   100  "Birth to 6 days old"                                              
       101  "7 days old to 364 days old"                                       
       001  "1 year old"                                                       
       099  "99 years old or more"                                             
       998  "Inap, less than 11 victims"                                       
       999  "Unknown"                                                          
       /                                                                       
 V66   1  "Male"                                                               
       2  "Female"                                                             
       8  "Inap, less than 11 victims"                                         
       9  "Unknown"                                                            
       /                                                                       
 V67   1  "White"                                                              
       2  "Black"                                                              
       3  "American Indian or Alaskan Native"                                  
       4  "Asian or Pacific Islander"                                          
       8  "Inap, less than 11 victims"                                         
       9  "Unknown"                                                            
       /                                                                       
 V68   1  "Hispanic origin"                                                    
       2  "Not of Hispanic origin"                                             
       8  "Inap, less than 11 victims"                                         
       9  "Unknown"                                                            
       /                                                                       
 V69   999  "Age unknown"                                                      
       /                                                                       
 V70   1  "Male"                                                               
       2  "Female"                                                             
       9  "Unknown"                                                            
       /                                                                       
 V71   1  "White"                                                              
       2  "Black"                                                              
       3  "American Indian or Alaskan Native"                                  
       4  "Asian or Pacific Islander"                                          
       9  "Unknown"                                                            
       /                                                                       
 V72   1  "Hispanic origin"                                                    
       2  "Not of Hispanic origin"                                             
       9  "Unknown"                                                            
       /                                                                       
 V73   11  "Firearm, type not stated"                                          
       12  "Handgun - pistol, revolver, etc"                                   
       13  "Rifle"                                                             
       14  "Shotgun"                                                           
       15  "Other gun"                                                         
       20  "Knife or cutting instrument"                                       
       30  "Blunt object"                                                      
       40  "Personal weapons"                                                  
       50  "Poison - does not include gas"                                     
       55  "Pushed or thrown out window"                                       
       60  "Explosives"                                                        
       65  "Fire"                                                              
       70  "Narcotics or drugs"                                                
       75  "Drowning"                                                          
       80  "Strangulation - hanging"                                           
       85  "Asphyxiation - includes death by gas"                              
       90  "Other - type of weapon not designated"                             
       /                                                                       
 V74   01  "Husband"                                                           
       02  "Wife"                                                              
       03  "Common-law husband"                                                
       04  "Common-law wife"                                                   
       05  "Mother"                                                            
       06  "Father"                                                            
       07  "Son"                                                               
       08  "Daughter"                                                          
       09  "Brother"                                                           
       10  "Sister"                                                            
       11  "In-law"                                                            
       12  "Stepfather"                                                        
       13  "Stepmother"                                                        
       14  "Stepson"                                                           
       15  "Stepdaughter"                                                      
       16  "Other family"                                                      
       17  "Neighbor"                                                          
       18  "Acquaintance"                                                      
       19  "Boyfriend"                                                         
       20  "Girlfriend"                                                        
       21  "Ex-husband"                                                        
       22  "Ex-wife"                                                           
       23  "Employee"                                                          
       24  "Employer"                                                          
       25  "Friend"                                                            
       26  "Homosexual relationship"                                           
       27  "Other - known to victim"                                           
       28  "Stranger"                                                          
       99  "Relationship not determined"                                       
       /                                                                       
 V75   02  "Rape"                                                              
       03  "Robbery"                                                           
       05  "Burglary"                                                          
       06  "Larceny"                                                           
       07  "Motor vehicle theft"                                               
       09  "Arson"                                                             
       10  "Prostitution and commercialized vice"                              
       17  "Other sex offense"                                                 
       32  "Abortion"                                                          
       18  "Narcotic drug laws"                                                
       19  "Gambling"                                                          
       26  "Other - not specified"                                             
       40  "Lover's triangle"                                                  
       41  "Child killed by babysitter"                                        
       42  "Brawl due to influence of alcohol"                                 
       43  "Brawl due to influence of narcotics"                               
       44  "Argument over money or property"                                   
       45  "Other arguments"                                                   
       46  "Gangland killings"                                                 
       47  "Juvenile gang killings"                                            
       48  "Institutional killings"                                            
       49  "Sniper attack"                                                     
       60  "Other"                                                             
       70  "All suspected felony type"                                         
       80  "Felon killed by private citizen"                                   
       81  "Felon killed by police"                                            
       99  "Circumstances undetermined"                                        
       /                                                                       
 V76   1  "Felon attacked police officer"                                      
       2  "Felon attacked fellow police officer"                               
       3  "Felon attacked a civilian"                                          
       4  "Felon attempted flight from a crime"                                
       5  "Felon killed in commission of a crime"                              
       6  "Felon resisted arrest"                                              
       7  "Not enough information to determine"                                
       9  "Inap, not a justifiable homicide"                                   
       /                                                                       
 V77   998  "Inap, only one offender"                                          
       999  "Unknown"                                                          
       /                                                                       
 V78   1  "Male"                                                               
       2  "Female"                                                             
       8  "Inap, only one offender"                                            
       9  "Unknown"                                                            
       /                                                                       
 V79   1  "White"                                                              
       2  "Black"                                                              
       3  "American Indian or Alaskan Native"                                  
       4  "Asian or Pacific Islander"                                          
       8  "Inap, only one offender"                                            
       9  "Unknown"                                                            
       /                                                                       
 V80   1  "Hispanic origin"                                                    
       2  "Not of Hispanic origin"                                             
       8  "Inap, only one offender"                                            
       9  "Unknown"                                                            
       /                                                                       
 V81   11  "Firearm, type not stated"                                          
       12  "Handgun - pistol, revolver, etc"                                   
       13  "Rifle"                                                             
       14  "Shotgun"                                                           
       15  "Other gun"                                                         
       20  "Knife or cutting instrument"                                       
       30  "Blunt object"                                                      
       40  "Personal weapons"                                                  
       50  "Poison - does not include gas"                                     
       55  "Pushed or thrown out window"                                       
       60  "Explosives"                                                        
       65  "Fire"                                                              
       70  "Narcotics or drugs"                                                
       75  "Drowning"                                                          
       80  "Strangulation - hanging"                                           
       85  "Asphyxiation - includes death by gas"                              
       98  "Inap, only one offender"                                           
       90  "Other - type of weapon not designated"                             
       /                                                                       
 V82   01  "Husband"                                                           
       02  "Wife"                                                              
       03  "Common-law husband"                                                
       04  "Common-law wife"                                                   
       05  "Mother"                                                            
       06  "Father"                                                            
       07  "Son"                                                               
       08  "Daughter"                                                          
       09  "Brother"                                                           
       10  "Sister"                                                            
       11  "In-law"                                                            
       12  "Stepfather"                                                        
       13  "Stepmother"                                                        
       14  "Stepson"                                                           
       15  "Stepdaughter"                                                      
       16  "Other family"                                                      
       17  "Neighbor"                                                          
       18  "Acquaintance"                                                      
       19  "Boyfriend"                                                         
       20  "Girlfriend"                                                        
       21  "Ex-husband"                                                        
       22  "Ex-wife"                                                           
       23  "Employee"                                                          
       24  "Employer"                                                          
       25  "Friend"                                                            
       26  "Homosexual relationship"                                           
       27  "Other - known to victim"                                           
       28  "Stranger"                                                          
       98  "Inap, only one offender"                                           
       99  "Relationship not determined"                                       
       /                                                                       
 V83   02  "Rape"                                                              
       03  "Robbery"                                                           
       05  "Burglary"                                                          
       06  "Larceny"                                                           
       07  "Motor vehicle theft"                                               
       09  "Arson"                                                             
       10  "Prostitution and commercialized vice"                              
       17  "Other sex offense"                                                 
       32  "Abortion"                                                          
       18  "Narcotic drug laws"                                                
       19  "Gambling"                                                          
       26  "Other felony type - not specified"                                 
       40  "Lover's triangle"                                                  
       41  "Child killed by babysitter"                                        
       42  "Brawl due to influence of alcohol"                                 
       43  "Brawl due to influence of narcotics"                               
       44  "Argument over money or property"                                   
       45  "Other arguments"                                                   
       46  "Gangland killings"                                                 
       47  "Juvenile gang killings"                                            
       48  "Institutional killings"                                            
       49  "Sniper attack"                                                     
       60  "Other non-felony type homicide"                                    
       70  "All suspected felony type"                                         
       80  "Felon killed by private citizen"                                   
       81  "Felon killed by police"                                            
       98  "Inap, only one offender"                                           
       99  "Circumstances undetermined"                                        
       /                                                                       
 V84   1  "Felon attacked police officer"                                      
       2  "Felon attacked fellow police officer"                               
       3  "Felon attacked a civilian"                                          
       4  "Felon attempted flight from a crime"                                
       5  "Felon killed in commission of a crime"                              
       6  "Felon resisted arrest"                                              
       7  "Not enough information to determine"                                
       8  "Inap, only one offender"                                            
       9  "Inap, not a justifiable homicide"                                   
       /                                                                       
 V85   998  "Inap, less than 3 offenders"                                      
       999  "Unknown"                                                          
       /                                                                       
 V86   1  "Male"                                                               
       2  "Female"                                                             
       8  "Inap, less than 3 offenders"                                        
       9  "Unknown"                                                            
       /                                                                       
 V87   1  "White"                                                              
       2  "Black"                                                              
       3  "American Indian or Alaskan Native"                                  
       4  "Asian or Pacific Islander"                                          
       8  "Inap, less than 3 offenders"                                        
       9  "Unknown"                                                            
       /                                                                       
 V88   1  "Hispanic origin"                                                    
       2  "Not of Hispanic origin"                                             
       8  "Inap, less than 3 offenders"                                        
       9  "Unknown"                                                            
       /                                                                       
 V89   11  "Firearm, type not stated"                                          
       12  "Handgun - pistol, revolver, etc"                                   
       13  "Rifle"                                                             
       14  "Shotgun"                                                           
       15  "Other gun"                                                         
       20  "Knife or cutting instrument"                                       
       30  "Blunt object"                                                      
       40  "Personal weapons"                                                  
       50  "Poison - does not include gas"                                     
       55  "Pushed or thrown out window"                                       
       60  "Explosives"                                                        
       65  "Fire"                                                              
       70  "Narcotics or drugs"                                                
       75  "Drowning"                                                          
       80  "Strangulation - hanging"                                           
       85  "Asphyxiation - includes death by gas"                              
       98  "Inap, less than 3 offenders"                                       
       90  "Other - type of weapon not designated"                             
       /                                                                       
 V90   01  "Husband"                                                           
       02  "Wife"                                                              
       03  "Common-law husband"                                                
       04  "Common-law wife"                                                   
       05  "Mother"                                                            
       06  "Father"                                                            
       07  "Son"                                                               
       08  "Daughter"                                                          
       09  "Brother"                                                           
       10  "Sister"                                                            
       11  "In-law"                                                            
       12  "Stepfather"                                                        
       13  "Stepmother"                                                        
       14  "Stepson"                                                           
       15  "Stepdaughter"                                                      
       16  "Other family"                                                      
       17  "Neighbor"                                                          
       18  "Acquaintance"                                                      
       19  "Boyfriend"                                                         
       20  "Girlfriend"                                                        
       21  "Ex-husband"                                                        
       22  "Ex-wife"                                                           
       23  "Employee"                                                          
       24  "Employer"                                                          
       25  "Friend"                                                            
       26  "Homosexual relationship"                                           
       27  "Other - known to victim"                                           
       28  "Stranger"                                                          
       98  "Inap, less than 3 offenders"                                       
       99  "Relationship not determined"                                       
       /                                                                       
 V91   02  "Rape"                                                              
       03  "Robbery"                                                           
       05  "Burglary"                                                          
       06  "Larceny"                                                           
       07  "Motor vehicle theft"                                               
       09  "Arson"                                                             
       10  "Prostitution and commercialized vice"                              
       17  "Other sex offense"                                                 
       32  "Abortion"                                                          
       18  "Narcotic drug laws"                                                
       19  "Gambling"                                                          
       26  "Other felony type - not specified"                                 
       40  "Lover's triangle"                                                  
       41  "Child killed by babysitter"                                        
       42  "Brawl due to influence of alcohol"                                 
       43  "Brawl due to influence of narcotics"                               
       44  "Argument over money property"                                      
       45  "Other arguments"                                                   
       46  "Gangland killings"                                                 
       47  "Juvenile gang killings"                                            
       48  "Institutional killings"                                            
       49  "Sniper attack"                                                     
       60  "Other non-felony type homicide"                                    
       70  "All suspected felony type"                                         
       80  "Felon killed by private citizen"                                   
       81  "Felon killed by police"                                            
       98  "Inap, less than 3 offenders"                                       
       99  "Circumstances undetermined"                                        
       /                                                                       
 V92   1  "Felon attacked police officer"                                      
       2  "Felon attacked fellow police officer"                               
       3  "Felon attacked a civilian"                                          
       4  "Felon attempted flight from a crime"                                
       5  "Felon killed in commission of a crime"                              
       6  "Felon resisted arrest"                                              
       7  "Not enough information to determine"                                
       8  "Inap, less than 3 offenders"                                        
       9  "Inap, not a justifiable homicide"                                   
       /                                                                       
 V93   998  "Inap, less than 4 offenders"                                      
       999  "Unknown"                                                          
       /                                                                       
 V94   1  "Male"                                                               
       2  "Female"                                                             
       8  "Inap, less than 4 offenders"                                        
       9  "Unknown"                                                            
       /                                                                       
 V95   1  "White"                                                              
       2  "Black"                                                              
       3  "American Indian or Alaskan Native"                                  
       4  "Asian or Pacific Islander"                                          
       8  "Inap, less than 4 offenders"                                        
       9  "Unknown"                                                            
       /                                                                       
 V96   1  "Hispanic origin"                                                    
       2  "Not of Hispanic origin"                                             
       8  "Inap, less than 4 offenders"                                        
       9  "Unknown"                                                            
       /                                                                       
 V97   11  "Firearm, type not stated"                                          
       12  "Handgun - pistol, revolver, etc"                                   
       13  "Rifle"                                                             
       14  "Shotgun"                                                           
       15  "Other gun"                                                         
       20  "Knife or cutting instrument"                                       
       30  "Blunt object"                                                      
       40  "Personal weapons"                                                  
       50  "Poison - does not include gas"                                     
       55  "Pushed or thrown out window"                                       
       60  "Explosives"                                                        
       65  "Fire"                                                              
       70  "Narcotics or drugs"                                                
       75  "Drowning"                                                          
       80  "Strangulation - hanging"                                           
       85  "Asphyxiation - includes death by gas"                              
       98  "Inap, less than 4 offenders"                                       
       90  "Other - type of weapon not designated"                             
       /                                                                       
 V98   01  "Husband"                                                           
       02  "Wife"                                                              
       03  "Common-law husband"                                                
       04  "Common-law wife"                                                   
       05  "Mother"                                                            
       06  "Father"                                                            
       07  "Son"                                                               
       08  "Daughter"                                                          
       09  "Brother"                                                           
       10  "Sister"                                                            
       11  "In-law"                                                            
       12  "Stepfather"                                                        
       13  "Stepmother"                                                        
       14  "Stepson"                                                           
       15  "Stepdaughter"                                                      
       16  "Other family"                                                      
       17  "Neighbor"                                                          
       18  "Acquaintance"                                                      
       19  "Boyfriend"                                                         
       20  "Girlfriend"                                                        
       21  "Ex-husband"                                                        
       22  "Ex-wife"                                                           
       23  "Employee"                                                          
       24  "Employer"                                                          
       25  "Friend"                                                            
       26  "Homosexual relationship"                                           
       27  "Other - known to victim"                                           
       28  "Stranger"                                                          
       98  "Inap, less than 4 offenders"                                       
       99  "Relationship not determined"                                       
       /                                                                       
 V99   02  "Rape"                                                              
       03  "Robbery"                                                           
       05  "Burglary"                                                          
       06  "Larceny"                                                           
       07  "Motor vehicle theft"                                               
       09  "Arson"                                                             
       10  "Prostitution and commercialized vice"                              
       17  "Other sex offense"                                                 
       32  "Abortion"                                                          
       18  "Narcotic drug laws"                                                
       19  "Gambling"                                                          
       26  "Other felony type - not specified"                                 
       40  "Lover's triangle"                                                  
       41  "Child killed by babysitter"                                        
       42  "Brawl due to influence of alcohol"                                 
       43  "Brawl due to influence of narcotics"                               
       44  "Argument over money property"                                      
       45  "Other arguments"                                                   
       46  "Gangland killings"                                                 
       47  "Juvenile gang killings"                                            
       48  "Institutional killings"                                            
       49  "Sniper attack"                                                     
       60  "Other non-felony type homicide"                                    
       70  "All suspected felony type"                                         
       80  "Felon killed by private citizen"                                   
       81  "Felon killed by police"                                            
       98  "Inap, less than 4 offenders"                                       
       99  "Circumstances undetermined"                                        
       /                                                                       
 V100  1  "Felon attacked police officer"                                      
       2  "Felon attacked fellow police officer"                               
       3  "Felon attacked a civilian"                                          
       4  "Felon attempted flight from a crime"                                
       5  "Felon killed in commission of a crime"                              
       6  "Felon resisted arrest"                                              
       7  "Not enough information to determine"                                
       8  "Inap, less than 4 offenders"                                        
       9  "Inap, not a justifiable homicide"                                   
       /                                                                       
 V101  998  "Inap, less than 5 offenders"                                      
       999  "Unknown"                                                          
       /                                                                       
 V102  1  "Male"                                                               
       2  "Female"                                                             
       8  "Inap, less than 5 offenders"                                        
       9  "Unknown"                                                            
       /                                                                       
 V103  1  "White"                                                              
       2  "Black"                                                              
       3  "American Indian or Alaskan Native"                                  
       4  "Asian or Pacific Islander"                                          
       8  "Inap, less than 5 offenders"                                        
       9  "Unknown"                                                            
       /                                                                       
 V104  1  "Hispanic origin"                                                    
       2  "Not of Hispanic origin"                                             
       8  "Inap, less than 5 offenders"                                        
       9  "Unknown"                                                            
       /                                                                       
 V105  11  "Firearm, type not stated"                                          
       12  "Handgun - pistol, revolver, etc"                                   
       13  "Rifle"                                                             
       14  "Shotgun"                                                           
       15  "Other gun"                                                         
       20  "Knife or cutting instrument"                                       
       30  "Blunt object"                                                      
       40  "Personal weapons"                                                  
       50  "Poison - does not include gas"                                     
       55  "Pushed or thrown out window"                                       
       60  "Explosives"                                                        
       65  "Fire"                                                              
       70  "Narcotics or drugs"                                                
       75  "Drowning"                                                          
       80  "Strangulation - hanging"                                           
       85  "Asphyxiation - includes death by gas"                              
       98  "Inap, less than 5 offenders"                                       
       90  "Other - type of weapon not designated"                             
       /                                                                       
 V106  01  "Husband"                                                           
       02  "Wife"                                                              
       03  "Common-law husband"                                                
       04  "Common-law wife"                                                   
       05  "Mother"                                                            
       06  "Father"                                                            
       07  "Son"                                                               
       08  "Daughter"                                                          
       09  "Brother"                                                           
       10  "Sister"                                                            
       11  "In-law"                                                            
       12  "Stepfather"                                                        
       13  "Stepmother"                                                        
       14  "Stepson"                                                           
       15  "Stepdaughter"                                                      
       16  "Other family"                                                      
       17  "Neighbor"                                                          
       18  "Acquaintance"                                                      
       19  "Boyfriend"                                                         
       20  "Girlfriend"                                                        
       21  "Ex-husband"                                                        
       22  "Ex-wife"                                                           
       23  "Employee"                                                          
       24  "Employer"                                                          
       25  "Friend"                                                            
       26  "Homosexual relationship"                                           
       27  "Other - known to victim"                                           
       28  "Stranger"                                                          
       98  "Inap, less than 5 offenders"                                       
       99  "Relationship not determined"                                       
       /                                                                       
 V107  02  "Rape"                                                              
       03  "Robbery"                                                           
       05  "Burglary"                                                          
       06  "Larceny"                                                           
       07  "Motor vehicle theft"                                               
       09  "Arson"                                                             
       10  "Prostitution and commercialized vice"                              
       17  "Other sex offense"                                                 
       32  "Abortion"                                                          
       18  "Narcotic drug laws"                                                
       19  "Gambling"                                                          
       26  "Other felony type - not specified"                                 
       40  "Lover's triangle"                                                  
       41  "Child killed by babysitter"                                        
       42  "Brawl due to influence of alcohol"                                 
       43  "Brawl due to influence of narcotics"                               
       44  "Argument over money or property"                                   
       45  "Other arguments"                                                   
       46  "Gangland killings"                                                 
       47  "Juvenile gang killings"                                            
       48  "Institutional killings"                                            
       49  "Sniper attack"                                                     
       60  "Other non-felony type homicide"                                    
       70  "All suspected felony type"                                         
       80  "Felon killed by private citizen"                                   
       81  "Felon killed by police"                                            
       98  "Inap, less than 5 offenders"                                       
       99  "Circumstances undetermined"                                        
       /                                                                       
 V108  1  "Felon attacked police officer"                                      
       2  "Felon attacked fellow police officer"                               
       3  "Felon attacked a civilian"                                          
       4  "Felon attempted flight from a crime"                                
       5  "Felon killed in commission of a crime"                              
       6  "Felon resisted arrest"                                              
       7  "Not enough information to determine"                                
       8  "Inap, less than 5 offenders"                                        
       9  "Inap, not a justifiable homicide"                                   
       /                                                                       
 V109  998  "Inap, less than 6 offenders"                                      
       999  "Unknown"                                                          
       /                                                                       
 V110  1  "Male"                                                               
       2  "Female"                                                             
       8  "Inap, less than 6 offenders"                                        
       9  "Unknown"                                                            
       /                                                                       
 V111  1  "White"                                                              
       2  "Black"                                                              
       3  "American Indian or Alaskan Native"                                  
       4  "Asian or Pacific Islander"                                          
       8  "Inap, less than 6 offenders"                                        
       9  "Unknown"                                                            
       /                                                                       
 V112  1  "Hispanic origin"                                                    
       2  "Not of Hispanic origin"                                             
       8  "Inap, less than 6 offenders"                                        
       9  "Unknown"                                                            
       /                                                                       
 V113  11  "Firearm, type not stated"                                          
       12  "Handgun - pistol, revolver, etc"                                   
       13  "Rifle"                                                             
       14  "Shotgun"                                                           
       15  "Other gun"                                                         
       20  "Knife or cutting instrument"                                       
       30  "Blunt object"                                                      
       40  "Personal weapons"                                                  
       50  "Poison - does not include gas"                                     
       55  "Pushed or thrown out window"                                       
       60  "Explosives"                                                        
       65  "Fire"                                                              
       70  "Narcotics or drugs"                                                
       75  "Drowning"                                                          
       80  "Strangulation - hanging"                                           
       85  "Asphyxiation - includes death by gas"                              
       98  "Inap, less than 6 offenders"                                       
       90  "Other - type of weapon not designated"                             
       /                                                                       
 V114  01  "Husband"                                                           
       02  "Wife"                                                              
       03  "Common-law husband"                                                
       04  "Common-law wife"                                                   
       05  "Mother"                                                            
       06  "Father"                                                            
       07  "Son"                                                               
       08  "Daughter"                                                          
       09  "Brother"                                                           
       10  "Sister"                                                            
       11  "In-law"                                                            
       12  "Stepfather"                                                        
       13  "Stepmother"                                                        
       14  "Stepson"                                                           
       15  "Stepdaughter"                                                      
       16  "Other family"                                                      
       17  "Neighbor"                                                          
       18  "Acquaintance"                                                      
       19  "Boyfriend"                                                         
       20  "Girlfriend"                                                        
       21  "Ex-husband"                                                        
       22  "Ex-wife"                                                           
       23  "Employee"                                                          
       24  "Employer"                                                          
       25  "Friend"                                                            
       26  "Homosexual relationship"                                           
       27  "Other - known to victim"                                           
       28  "Stranger"                                                          
       98  "Inap, less than 6 offenders"                                       
       99  "Relationship not determined"                                       
       /                                                                       
 V115  02  "Rape"                                                              
       03  "Robbery"                                                           
       05  "Burglary"                                                          
       06  "Larceny"                                                           
       07  "Motor vehicle theft"                                               
       09  "Arson"                                                             
       10  "Prostitution and commercialized vice"                              
       17  "Other sex offense"                                                 
       32  "Abortion"                                                          
       18  "Narcotic drug laws"                                                
       19  "Gambling"                                                          
       26  "Other felony type - not specified"                                 
       40  "Lover's triangle"                                                  
       41  "Child killed by babysitter"                                        
       42  "Brawl due to influence of alcohol"                                 
       43  "Brawl due to influence of narcotics"                               
       44  "Argument over money or property"                                   
       45  "Other arguments"                                                   
       46  "Gangland killings"                                                 
       47  "Juvenile gang killings"                                            
       48  "Institutional killings"                                            
       49  "Sniper attack"                                                     
       60  "Other non-felony type homicide"                                    
       70  "All suspected felony type"                                         
       80  "Felon killed by private citizen"                                   
       81  "Felon killed by police"                                            
       98  "Inap, less than 6 offenders"                                       
       99  "Circumstances undetermined"                                        
       /                                                                       
 V116  1  "Felon attacked police officer"                                      
       2  "Felon attacked fellow police officer"                               
       3  "Felon attacked a civilian"                                          
       4  "Felon attempted flight from a crime"                                
       5  "Felon killed in commission of a crime"                              
       6  "Felon resisted arrest"                                              
       7  "Not enough information to determine"                                
       8  "Inap, less than 6 offenders"                                        
       9  "Inap, not a justifiable homicide"                                   
       /                                                                       
 V117  998  "Inap, less than 7 offenders"                                      
       999  "Unknown"                                                          
       /                                                                       
 V118  1  "Male"                                                               
       2  "Female"                                                             
       8  "Inap, less than 7 offenders"                                        
       9  "Unknown"                                                            
       /                                                                       
 V119  1  "White"                                                              
       2  "Black"                                                              
       3  "American Indian or Alaskan Native"                                  
       4  "Asian or Pacific Islander"                                          
       8  "Inap, less than 7 offenders"                                        
       9  "Unknown"                                                            
       /                                                                       
 V120  1  "Hispanic origin"                                                    
       2  "Not of Hispanic origin"                                             
       8  "Inap, less than 7 offenders"                                        
       9  "Unknown"                                                            
       /                                                                       
 V121  11  "Firearm, type not stated"                                          
       12  "Handgun - pistol, revolver, etc"                                   
       13  "Rifle"                                                             
       14  "Shotgun"                                                           
       15  "Other gun"                                                         
       20  "Knife or cutting instrument"                                       
       30  "Blunt object"                                                      
       40  "Personal weapons"                                                  
       50  "Poison - does not include gas"                                     
       55  "Pushed or thrown out window"                                       
       60  "Explosives"                                                        
       65  "Fire"                                                              
       70  "Narcotics or drugs"                                                
       75  "Drowning"                                                          
       80  "Strangulation - hanging"                                           
       85  "Asphyxiation - includes death by gas"                              
       98  "Inap, less than 7 offenders"                                       
       90  "Other - type of weapon not designated"                             
       /                                                                       
 V122  01  "Husband"                                                           
       02  "Wife"                                                              
       03  "Common-law husband"                                                
       04  "Common-law wife"                                                   
       05  "Mother"                                                            
       06  "Father"                                                            
       07  "Son"                                                               
       08  "Daughter"                                                          
       09  "Brother"                                                           
       10  "Sister"                                                            
       11  "In-law"                                                            
       12  "Stepfather"                                                        
       13  "Stepmother"                                                        
       14  "Stepson"                                                           
       15  "Stepdaughter"                                                      
       16  "Other family"                                                      
       17  "Neighbor"                                                          
       18  "Acquaintance"                                                      
       19  "Boyfriend"                                                         
       20  "Girlfriend"                                                        
       21  "Ex-husband"                                                        
       22  "Ex-wife"                                                           
       23  "Employee"                                                          
       24  "Employer"                                                          
       25  "Friend"                                                            
       26  "Homosexual relationship"                                           
       27  "Other - known to victim"                                           
       28  "Stranger"                                                          
       98  "Inap, less than 7 offenders"                                       
       99  "Relationship not determined"                                       
       /                                                                       
 V123  02  "Rape"                                                              
       03  "Robbery"                                                           
       05  "Burglary"                                                          
       06  "Larceny"                                                           
       07  "Motor vehicle theft"                                               
       09  "Arson"                                                             
       10  "Prostitution and commercialized vice"                              
       17  "Other sex offense"                                                 
       32  "Abortion"                                                          
       18  "Narcotic drug laws"                                                
       19  "Gambling"                                                          
       26  "Other felony type - not specified"                                 
       40  "Lover's triangle"                                                  
       41  "Child killed by babysitter"                                        
       42  "Brawl due to influence of alcohol"                                 
       43  "Brawl due to influence of narcotics"                               
       44  "Argument over money or property"                                   
       45  "Other arguments"                                                   
       46  "Gangland killings"                                                 
       47  "Juvenile gang killings"                                            
       48  "Institutional killings"                                            
       49  "Sniper attack"                                                     
       60  "Other non-felony type homicide"                                    
       70  "All suspected felony type"                                         
       80  "Felon killed by private citizen"                                   
       81  "Felon killed by police"                                            
       98  "Inap, less than 7 offenders"                                       
       99  "Circumstances undetermined"                                        
       /                                                                       
 V124  1  "Felon attacked police officer"                                      
       2  "Felon attacked fellow police officer"                               
       3  "Felon attacked a civilian"                                          
       4  "Felon attempted flight from a crime"                                
       5  "Felon killed in commission of a crime"                              
       6  "Felon resisted arrest"                                              
       7  "Not enough information to determine"                                
       8  "Inap, less than 7 offenders"                                        
       9  "Inap, not a justifiable homicide"                                   
       /                                                                       
 V125  998  "Inap, less than 8 offenders"                                      
       999  "Unknown"                                                          
       /                                                                       
 V126  1  "Male"                                                               
       2  "Female"                                                             
       8  "Inap, less than 8 offenders"                                        
       9  "Unknown"                                                            
       /                                                                       
 V127  1  "White"                                                              
       2  "Black"                                                              
       3  "American Indian or Alaskan Native"                                  
       4  "Asian or Pacific Islander"                                          
       8  "Inap, less than 8 offenders"                                        
       9  "Unknown"                                                            
       /                                                                       
 V128  1  "Hispanic origin"                                                    
       2  "Not of Hispanic origin"                                             
       8  "Inap, less than 8 offenders"                                        
       9  "Unknown"                                                            
       /                                                                       
 V129  11  "Firearm, type not stated"                                          
       12  "Handgun - pistol, revolver, etc"                                   
       13  "Rifle"                                                             
       14  "Shotgun"                                                           
       15  "Other gun"                                                         
       20  "Knife or cutting instrument"                                       
       30  "Blunt object"                                                      
       40  "Personal weapons"                                                  
       50  "Poison - does not include gas"                                     
       55  "Pushed or thrown out window"                                       
       60  "Explosives"                                                        
       65  "Fire"                                                              
       70  "Narcotics or drugs"                                                
       75  "Drowning"                                                          
       80  "Strangulation - hanging"                                           
       85  "Asphyxiation - includes death by gas"                              
       98  "Inap, less than 8 offenders"                                       
       90  "Other - type of weapon not designated"                             
       /                                                                       
 V130  01  "Husband"                                                           
       02  "Wife"                                                              
       03  "Common-law husband"                                                
       04  "Common-law wife"                                                   
       05  "Mother"                                                            
       06  "Father"                                                            
       07  "Son"                                                               
       08  "Daughter"                                                          
       09  "Brother"                                                           
       10  "Sister"                                                            
       11  "In-law"                                                            
       12  "Stepfather"                                                        
       13  "Stepmother"                                                        
       14  "Stepson"                                                           
       15  "Stepdaughter"                                                      
       16  "Other family"                                                      
       17  "Neighbor"                                                          
       18  "Acquaintance"                                                      
       19  "Boyfriend"                                                         
       20  "Girlfriend"                                                        
       21  "Ex-husband"                                                        
       22  "Ex-wife"                                                           
       23  "Employee"                                                          
       24  "Employer"                                                          
       25  "Friend"                                                            
       26  "Homosexual relationship"                                           
       27  "Other - known to victim"                                           
       28  "Stranger"                                                          
       98  "Inap, less than 8 offenders"                                       
       99  "Relationship not determined"                                       
       /                                                                       
 V131  02  "Rape"                                                              
       03  "Robbery"                                                           
       05  "Burglary"                                                          
       06  "Larceny"                                                           
       07  "Motor vehicle theft"                                               
       09  "Arson"                                                             
       10  "Prostitution and commercialized vice"                              
       17  "Other sex offense"                                                 
       32  "Abortion"                                                          
       18  "Narcotic drug laws"                                                
       19  "Gambling"                                                          
       26  "Other felony type - not specified"                                 
       40  "Lover's triangle"                                                  
       41  "Child killed by babysitter"                                        
       42  "Brawl due to influence of alcohol"                                 
       43  "Brawl due to influence of narcotics"                               
       44  "Argument over money or property"                                   
       45  "Other arguments"                                                   
       46  "Gangland killings"                                                 
       47  "Juvenile gang killings"                                            
       48  "Institutional killings"                                            
       49  "Sniper attack"                                                     
       60  "Other non-felony type homicide"                                    
       70  "All suspected felony type"                                         
       80  "Felon killed by private citizen"                                   
       81  "Felon killed by police"                                            
       98  "Inap, less than 8 offenders"                                       
       99  "Circumstances undetermined"                                        
       /                                                                       
 V132  1  "Felon attacked police officer"                                      
       2  "Felon attacked fellow police officer"                               
       3  "Felon attacked a civilian"                                          
       4  "Felon attempted flight from a crime"                                
       5  "Felon killed in commission of a crime"                              
       6  "Felon resisted arrest"                                              
       7  "Not enough information to determine"                                
       8  "Inap, less than 8 offenders"                                        
       9  "Inap, not a justifiable homicide"                                   
       /                                                                       
 V133  998  "Inap, less than 9 offenders"                                      
       999  "Unknown"                                                          
       /                                                                       
 V134  1  "Male"                                                               
       2  "Female"                                                             
       8  "Inap, less than 9 offenders"                                        
       9  "Unknown"                                                            
       /                                                                       
 V135  1  "White"                                                              
       2  "Black"                                                              
       3  "American Indian or Alaskan Native"                                  
       4  "Asian or Pacific Islander"                                          
       8  "Inap, less than 9 offenders"                                        
       9  "Unknown"                                                            
       /                                                                       
 V136  1  "Hispanic origin"                                                    
       2  "Not of Hispanic origin"                                             
       8  "Inap, less than 9 offenders"                                        
       9  "Unknown"                                                            
       /                                                                       
 V137  11  "Firearm, type not stated"                                          
       12  "Handgun - pistol, revolver, etc"                                   
       13  "Rifle"                                                             
       14  "Shotgun"                                                           
       15  "Other gun"                                                         
       20  "Knife or cutting instrument"                                       
       30  "Blunt object"                                                      
       40  "Personal weapons"                                                  
       50  "Poison - does not include gas"                                     
       55  "Pushed or thrown out window"                                       
       60  "Explosives"                                                        
       65  "Fire"                                                              
       70  "Narcotics or drugs"                                                
       75  "Drowning"                                                          
       80  "Strangulation - hanging"                                           
       85  "Asphyxiation - includes death by gas"                              
       98  "Inap, less than 9 offenders"                                       
       90  "Other - type of weapon not designated"                             
       /                                                                       
 V138  01  "Husband"                                                           
       02  "Wife"                                                              
       03  "Common-law husband"                                                
       04  "Common-law wife"                                                   
       05  "Mother"                                                            
       06  "Father"                                                            
       07  "Son"                                                               
       08  "Daughter"                                                          
       09  "Brother"                                                           
       10  "Sister"                                                            
       11  "In-law"                                                            
       12  "Stepfather"                                                        
       13  "Stepmother"                                                        
       14  "Stepson"                                                           
       15  "Stepdaughter"                                                      
       16  "Other family"                                                      
       17  "Neighbor"                                                          
       18  "Acquaintance"                                                      
       19  "Boyfriend"                                                         
       20  "Girlfriend"                                                        
       21  "Ex-husband"                                                        
       22  "Ex-wife"                                                           
       23  "Employee"                                                          
       24  "Employer"                                                          
       25  "Friend"                                                            
       26  "Homosexual relationship"                                           
       27  "Other - known to victim"                                           
       28  "Stranger"                                                          
       98  "Inap, less than 9 offenders"                                       
       99  "Relationship not determined"                                       
       /                                                                       
 V139  02  "Rape"                                                              
       03  "Robbery"                                                           
       05  "Burglary"                                                          
       06  "Larceny"                                                           
       07  "Motor vehicle theft"                                               
       09  "Arson"                                                             
       10  "Prostitution and commercialized vice"                              
       17  "Other sex offense"                                                 
       32  "Abortion"                                                          
       18  "Narcotic drug laws"                                                
       19  "Gambling"                                                          
       26  "Other felony type - not specified"                                 
       40  "Lover's triangle"                                                  
       41  "Child killed by babysitter"                                        
       42  "Brawl due to influence of alcohol"                                 
       43  "Brawl due to influence of narcotics"                               
       44  "Argument over money or property"                                   
       45  "Other arguments"                                                   
       46  "Gangland killings"                                                 
       47  "Juvenile gang killings"                                            
       48  "Institutional killings"                                            
       49  "Sniper attack"                                                     
       60  "Other non-felony type homicide"                                    
       70  "All suspected felony type"                                         
       80  "Felon killed by private citizen"                                   
       81  "Felon killed by police"                                            
       98  "Inap, less than 9 offenders"                                       
       99  "Circumstances undetermined"                                        
       /                                                                       
 V140  1  "Felon attacked police officer"                                      
       2  "Felon attacked fellow police officer"                               
       3  "Felon attacked a civilian"                                          
       4  "Felon attempted flight from a crime"                                
       5  "Felon killed in commission of a crime"                              
       6  "Felon resisted arrest"                                              
       7  "Not enough information to determine"                                
       8  "Inap, less than 9 offenders"                                        
       9  "Inap, not a justifiable homicide"                                   
       /                                                                       
 V141  998  "Inap, less than 10 offenders"                                     
       999  "Unknown"                                                          
       /                                                                       
 V142  1  "Male"                                                               
       2  "Female"                                                             
       8  "Inap, less than 10 offenders"                                       
       9  "Unknown"                                                            
       /                                                                       
 V143  1  "White"                                                              
       2  "Black"                                                              
       3  "American Indian or Alaskan Native"                                  
       4  "Asian or Pacific Islander"                                          
       8  "Inap, less than 10 offenders"                                       
       9  "Unknown"                                                            
       /                                                                       
 V144  1  "Hispanic origin"                                                    
       2  "Not of Hispanic origin"                                             
       8  "Inap, less than 10 offenders"                                       
       9  "Unknown"                                                            
       /                                                                       
 V145  11  "Firearm, type not stated"                                          
       12  "Handgun - pistol, revolver, etc"                                   
       13  "Rifle"                                                             
       14  "Shotgun"                                                           
       15  "Other gun"                                                         
       20  "Knife or cutting instrument"                                       
       30  "Blunt object"                                                      
       40  "Personal weapons"                                                  
       50  "Poison - does not include gas"                                     
       55  "Pushed or thrown out window"                                       
       60  "Explosives"                                                        
       65  "Fire"                                                              
       70  "Narcotics or drugs"                                                
       75  "Drowning"                                                          
       80  "Strangulation - hanging"                                           
       85  "Asphyxiation - includes death by gas"                              
       98  "Inap, less than 10 offenders"                                      
       90  "Other - type of weapon not designated"                             
       /                                                                       
 V146  01  "Husband"                                                           
       02  "Wife"                                                              
       03  "Common-law husband"                                                
       04  "Common-law wife"                                                   
       05  "Mother"                                                            
       06  "Father"                                                            
       07  "Son"                                                               
       08  "Daughter"                                                          
       09  "Brother"                                                           
       10  "Sister"                                                            
       11  "In-law"                                                            
       12  "Stepfather"                                                        
       13  "Stepmother"                                                        
       14  "Stepson"                                                           
       15  "Stepdaughter"                                                      
       16  "Other family"                                                      
       17  "Neighbor"                                                          
       18  "Acquaintance"                                                      
       19  "Boyfriend"                                                         
       20  "Girlfriend"                                                        
       21  "Ex-husband"                                                        
       22  "Ex-wife"                                                           
       23  "Employee"                                                          
       24  "Employer"                                                          
       25  "Friend"                                                            
       26  "Homosexual relationship"                                           
       27  "Other - known to victim"                                           
       28  "Stranger"                                                          
       98  "Inap, less than 10 offenders"                                      
       99  "Relationship not determined"                                       
       /                                                                       
 V147  02  "Rape"                                                              
       03  "Robbery"                                                           
       05  "Burglary"                                                          
       06  "Larceny"                                                           
       07  "Motor vehicle theft"                                               
       09  "Arson"                                                             
       10  "Prostitution and commercialized vice"                              
       17  "Other sex offense"                                                 
       32  "Abortion"                                                          
       18  "Narcotic drug laws"                                                
       19  "Gambling"                                                          
       26  "Other felony type - not specified"                                 
       40  "Lover's triangle"                                                  
       41  "Child killed by babysitter"                                        
       42  "Brawl due to influence of alcohol"                                 
       43  "Brawl due to influence of narcotics"                               
       44  "Argument over money or property"                                   
       45  "Other arguments"                                                   
       46  "Gangland killings"                                                 
       47  "Juvenile gang killings"                                            
       48  "Institutional killings"                                            
       49  "Sniper attack"                                                     
       60  "Other non-felony type homicide"                                    
       70  "All suspected felony type"                                         
       80  "Felon killed by private citizen"                                   
       81  "Felon killed by police"                                            
       98  "Inap, less than 10 offenders"                                      
       99  "Circumstances undetermined"                                        
       /                                                                       
 V148  1  "Felon attacked police officer"                                      
       2  "Felon attacked fellow police officer"                               
       3  "Felon attacked a civilian"                                          
       4  "Felon attempted flight from a crime"                                
       5  "Felon killed in commission of a crime"                              
       6  "Felon resisted arrest"                                              
       7  "Not enough information to determine"                                
       8  "Inap, less than 10 offenders"                                       
       9  "Inap, not a justifiable homicide"                                   
       /                                                                       
 V149  998  "Inap, less than 11 offenders"                                     
       999  "Unknown"                                                          
       /                                                                       
 V150  1  "Male"                                                               
       2  "Female"                                                             
       8  "Inap, less than 11 offenders"                                       
       9  "Unknown"                                                            
       /                                                                       
 V151  1  "White"                                                              
       2  "Black"                                                              
       3  "American Indian or Alaskan Native"                                  
       4  "Asian or Pacific Islander"                                          
       8  "Inap, less than 11 offenders"                                       
       9  "Unknown"                                                            
       /                                                                       
 V152  1  "Hispanic origin"                                                    
       2  "Not of Hispanic origin"                                             
       8  "Inap, less than 11 offenders"                                       
       9  "Unknown"                                                            
       /                                                                       
 V153  11  "Firearm, type not stated"                                          
       12  "Handgun - pistol, revolver, etc"                                   
       13  "Rifle"                                                             
       14  "Shotgun"                                                           
       15  "Other gun"                                                         
       20  "Knife or cutting instrument"                                       
       30  "Blunt object"                                                      
       40  "Personal weapons"                                                  
       50  "Poison - does not include gas"                                     
       55  "Pushed or thrown out window"                                       
       60  "Explosives"                                                        
       65  "Fire"                                                              
       70  "Narcotics or drugs"                                                
       75  "Drowning"                                                          
       80  "Strangulation - hanging"                                           
       85  "Asphyxiation - includes death by gas"                              
       98  "Inap, less than 11 offenders"                                      
       90  "Other - type of weapon not designated"                             
       /                                                                       
 V154  01  "Husband"                                                           
       02  "Wife"                                                              
       03  "Common-law husband"                                                
       04  "Common-law wife"                                                   
       05  "Mother"                                                            
       06  "Father"                                                            
       07  "Son"                                                               
       08  "Daughter"                                                          
       09  "Brother"                                                           
       10  "Sister"                                                            
       11  "In-law"                                                            
       12  "Stepfather"                                                        
       13  "Stepmother"                                                        
       14  "Stepson"                                                           
       15  "Stepdaughter"                                                      
       16  "Other family"                                                      
       17  "Neighbor"                                                          
       18  "Acquaintance"                                                      
       19  "Boyfriend"                                                         
       20  "Girlfriend"                                                        
       21  "Ex-husband"                                                        
       22  "Ex-wife"                                                           
       23  "Employee"                                                          
       24  "Employer"                                                          
       25  "Friend"                                                            
       26  "Homosexual relationship"                                           
       27  "Other - known to victim"                                           
       28  "Stranger"                                                          
       98  "Inap, less than 11 offenders"                                      
       99  "Relationship not determined"                                       
       /                                                                       
 V155  02  "Rape"                                                              
       03  "Robbery"                                                           
       05  "Burglary"                                                          
       06  "Larceny"                                                           
       07  "Motor vehicle theft"                                               
       09  "Arson"                                                             
       10  "Prostitution and commercialized vice"                              
       17  "Other sex offense"                                                 
       32  "Abortion"                                                          
       18  "Narcotic drug laws"                                                
       19  "Gambling"                                                          
       26  "Other felony type - not specified"                                 
       40  "Lover's triangle"                                                  
       41  "Child killed by babysitter"                                        
       42  "Brawl due to influence of alcohol"                                 
       43  "Brawl due to influence of narcotics"                               
       44  "Argument over money or property"                                   
       45  "Other arguments"                                                   
       46  "Gangland killings"                                                 
       47  "Juvenile gang killings"                                            
       48  "Institutional killings"                                            
       49  "Sniper attack"                                                     
       60  "Other non-felony type homicide"                                    
       70  "All suspected felony type"                                         
       80  "Felon killed by private citizen"                                   
       81  "Felon killed by police"                                            
       98  "Inap, less than 11 offenders"                                      
       99  "Circumstances undetermined"                                        
       /                                                                       
 V156  1  "Felon attacked police officer"                                      
       2  "Felon attacked fellow police officer"                               
       3  "Felon attacked a civilian"                                          
       4  "Felon attempted flight from a crime"                                
       5  "Felon killed in commission of a crime"                              
       6  "Felon resisted arrest"                                              
       7  "Not enough information to determine"                                
       8  "Inap, less than 11 offenders"                                       
       9  "Inap, not a justifiable homicide"                                   
       /.                                                                      
                                                                               
* SPSS MISSING VALUE RECODE FOR 9028                                           
*RECODE                                                                        
 V11 (0=SYSMIS) /                                                              
 V12 (0=SYSMIS) /                                                              
 V13 (0=SYSMIS) /                                                              
 V25 (999=SYSMIS) /                                                            
 V25 (900=SYSMIS) /                                                            
 V26 (9=SYSMIS) /                                                              
 V27 (9=SYSMIS) /                                                              
 V28 (9=SYSMIS) /                                                              
 V29 (998=SYSMIS) /                                                            
 V29 (999=SYSMIS) /                                                            
 V30 (8=SYSMIS) /                                                              
 V30 (9=SYSMIS) /                                                              
 V31 (8=SYSMIS) /                                                              
 V31 (9=SYSMIS) /                                                              
 V32 (8=SYSMIS) /                                                              
 V32 (9=SYSMIS) /                                                              
 V33 (998=SYSMIS) /                                                            
 V33 (999=SYSMIS) /                                                            
 V34 (8=SYSMIS) /                                                              
 V34 (9=SYSMIS) /                                                              
 V35 (8=SYSMIS) /                                                              
 V35 (9=SYSMIS) /                                                              
 V36 (8=SYSMIS) /                                                              
 V36 (9=SYSMIS) /                                                              
 V37 (998=SYSMIS) /                                                            
 V37 (999=SYSMIS) /                                                            
 V38 (8=SYSMIS) /                                                              
 V38 (9=SYSMIS) /                                                              
 V39 (8=SYSMIS) /                                                              
 V39 (9=SYSMIS) /                                                              
 V40 (8=SYSMIS) /                                                              
 V40 (9=SYSMIS) /                                                              
 V41 (998=SYSMIS) /                                                            
 V41 (999=SYSMIS) /                                                            
 V42 (8=SYSMIS) /                                                              
 V42 (9=SYSMIS) /                                                              
 V43 (8=SYSMIS) /                                                              
 V43 (9=SYSMIS) /                                                              
 V44 (8=SYSMIS) /                                                              
 V44 (9=SYSMIS) /                                                              
 V45 (998=SYSMIS) /                                                            
 V45 (999=SYSMIS) /                                                            
 V46 (8=SYSMIS) /                                                              
 V46 (9=SYSMIS) /                                                              
 V47 (8=SYSMIS) /                                                              
 V47 (9=SYSMIS) /                                                              
 V48 (8=SYSMIS) /                                                              
 V48 (9=SYSMIS) /                                                              
 V49 (998=SYSMIS) /                                                            
 V49 (999=SYSMIS) /                                                            
 V50 (8=SYSMIS) /                                                              
 V50 (9=SYSMIS) /                                                              
 V51 (8=SYSMIS) /                                                              
 V51 (9=SYSMIS) /                                                              
 V52 (8=SYSMIS) /                                                              
 V52 (9=SYSMIS) /                                                              
 V53 (998=SYSMIS) /                                                            
 V53 (999=SYSMIS) /                                                            
 V54 (8=SYSMIS) /                                                              
 V54 (9=SYSMIS) /                                                              
 V55 (8=SYSMIS) /                                                              
 V55 (9=SYSMIS) /                                                              
 V56 (8=SYSMIS) /                                                              
 V56 (9=SYSMIS) /                                                              
 V57 (998=SYSMIS) /                                                            
 V57 (999=SYSMIS) /                                                            
 V58 (8=SYSMIS) /                                                              
 V58 (9=SYSMIS) /                                                              
 V59 (8=SYSMIS) /                                                              
 V59 (9=SYSMIS) /                                                              
 V60 (8=SYSMIS) /                                                              
 V60 (9=SYSMIS) /                                                              
 V61 (998=SYSMIS) /                                                            
 V61 (999=SYSMIS) /                                                            
 V62 (8=SYSMIS) /                                                              
 V62 (9=SYSMIS) /                                                              
 V63 (8=SYSMIS) /                                                              
 V63 (9=SYSMIS) /                                                              
 V64 (8=SYSMIS) /                                                              
 V64 (9=SYSMIS) /                                                              
 V65 (998=SYSMIS) /                                                            
 V65 (999=SYSMIS) /                                                            
 V66 (8=SYSMIS) /                                                              
 V66 (9=SYSMIS) /                                                              
 V67 (8=SYSMIS) /                                                              
 V67 (9=SYSMIS) /                                                              
 V68 (8=SYSMIS) /                                                              
 V68 (9=SYSMIS) /                                                              
 V69 (999=SYSMIS) /                                                            
 V70 (9=SYSMIS) /                                                              
 V71 (9=SYSMIS) /                                                              
 V72 (9=SYSMIS) /                                                              
 V73 (90=SYSMIS) /                                                             
 V74 (99=SYSMIS) /                                                             
 V75 (99=SYSMIS) /                                                             
 V76 (7=SYSMIS) /                                                              
 V76 (9=SYSMIS) /                                                              
 V77 (998=SYSMIS) /                                                            
 V77 (999=SYSMIS) /                                                            
 V78 (8=SYSMIS) /                                                              
 V78 (9=SYSMIS) /                                                              
 V79 (8=SYSMIS) /                                                              
 V79 (9=SYSMIS) /                                                              
 V80 (8=SYSMIS) /                                                              
 V80 (9=SYSMIS) /                                                              
 V81 (98=SYSMIS) /                                                             
 V81 (90=SYSMIS) /                                                             
 V82 (98=SYSMIS) /                                                             
 V82 (99=SYSMIS) /                                                             
 V83 (98=SYSMIS) /                                                             
 V83 (99=SYSMIS) /                                                             
 V84 (7=SYSMIS) /                                                              
 V84 (8=SYSMIS) /                                                              
 V84 (9=SYSMIS) /                                                              
 V85 (998=SYSMIS) /                                                            
 V85 (999=SYSMIS) /                                                            
 V86 (8=SYSMIS) /                                                              
 V86 (9=SYSMIS) /                                                              
 V87 (8=SYSMIS) /                                                              
 V87 (9=SYSMIS) /                                                              
 V88 (8=SYSMIS) /                                                              
 V88 (9=SYSMIS) /                                                              
 V89 (98=SYSMIS) /                                                             
 V89 (90=SYSMIS) /                                                             
 V90 (98=SYSMIS) /                                                             
 V90 (99=SYSMIS) /                                                             
 V91 (98=SYSMIS) /                                                             
 V91 (99=SYSMIS) /                                                             
 V92 (7=SYSMIS) /                                                              
 V92 (8=SYSMIS) /                                                              
 V92 (9=SYSMIS) /                                                              
 V93 (998=SYSMIS) /                                                            
 V93 (999=SYSMIS) /                                                            
 V94 (8=SYSMIS) /                                                              
 V94 (9=SYSMIS) /                                                              
 V95 (8=SYSMIS) /                                                              
 V95 (9=SYSMIS) /                                                              
 V96 (8=SYSMIS) /                                                              
 V96 (9=SYSMIS) /                                                              
 V97 (98=SYSMIS) /                                                             
 V97 (90=SYSMIS) /                                                             
 V98 (98=SYSMIS) /                                                             
 V98 (99=SYSMIS) /                                                             
 V99 (98=SYSMIS) /                                                             
 V99 (99=SYSMIS) /                                                             
 V100 (7=SYSMIS) /                                                             
 V100 (8=SYSMIS) /                                                             
 V100 (9=SYSMIS) /                                                             
 V101 (998=SYSMIS) /                                                           
 V101 (999=SYSMIS) /                                                           
 V102 (8=SYSMIS) /                                                             
 V102 (9=SYSMIS) /                                                             
 V103 (8=SYSMIS) /                                                             
 V103 (9=SYSMIS) /                                                             
 V104 (8=SYSMIS) /                                                             
 V104 (9=SYSMIS) /                                                             
 V105 (98=SYSMIS) /                                                            
 V105 (90=SYSMIS) /                                                            
 V106 (98=SYSMIS) /                                                            
 V106 (99=SYSMIS) /                                                            
 V107 (98=SYSMIS) /                                                            
 V107 (99=SYSMIS) /                                                            
 V108 (7=SYSMIS) /                                                             
 V108 (8=SYSMIS) /                                                             
 V108 (9=SYSMIS) /                                                             
 V109 (998=SYSMIS) /                                                           
 V109 (999=SYSMIS) /                                                           
 V110 (8=SYSMIS) /                                                             
 V110 (9=SYSMIS) /                                                             
 V111 (8=SYSMIS) /                                                             
 V111 (9=SYSMIS) /                                                             
 V112 (8=SYSMIS) /                                                             
 V112 (9=SYSMIS) /                                                             
 V113 (98=SYSMIS) /                                                            
 V113 (90=SYSMIS) /                                                            
 V114 (98=SYSMIS) /                                                            
 V114 (99=SYSMIS) /                                                            
 V115 (98=SYSMIS) /                                                            
 V115 (99=SYSMIS) /                                                            
 V116 (7=SYSMIS) /                                                             
 V116 (8=SYSMIS) /                                                             
 V116 (9=SYSMIS) /                                                             
 V117 (998=SYSMIS) /                                                           
 V117 (999=SYSMIS) /                                                           
 V118 (8=SYSMIS) /                                                             
 V118 (9=SYSMIS) /                                                             
 V119 (8=SYSMIS) /                                                             
 V119 (9=SYSMIS) /                                                             
 V120 (8=SYSMIS) /                                                             
 V120 (9=SYSMIS) /                                                             
 V121 (98=SYSMIS) /                                                            
 V121 (90=SYSMIS) /                                                            
 V122 (98=SYSMIS) /                                                            
 V122 (99=SYSMIS) /                                                            
 V123 (98=SYSMIS) /                                                            
 V123 (99=SYSMIS) /                                                            
 V124 (7=SYSMIS) /                                                             
 V124 (8=SYSMIS) /                                                             
 V124 (9=SYSMIS) /                                                             
 V125 (998=SYSMIS) /                                                           
 V125 (999=SYSMIS) /                                                           
 V126 (8=SYSMIS) /                                                             
 V126 (9=SYSMIS) /                                                             
 V127 (8=SYSMIS) /                                                             
 V127 (9=SYSMIS) /                                                             
 V128 (8=SYSMIS) /                                                             
 V128 (9=SYSMIS) /                                                             
 V129 (98=SYSMIS) /                                                            
 V129 (90=SYSMIS) /                                                            
 V130 (98=SYSMIS) /                                                            
 V130 (99=SYSMIS) /                                                            
 V131 (98=SYSMIS) /                                                            
 V131 (99=SYSMIS) /                                                            
 V132 (7=SYSMIS) /                                                             
 V132 (8=SYSMIS) /                                                             
 V132 (9=SYSMIS) /                                                             
 V133 (998=SYSMIS) /                                                           
 V133 (999=SYSMIS) /                                                           
 V134 (8=SYSMIS) /                                                             
 V134 (9=SYSMIS) /                                                             
 V135 (8=SYSMIS) /                                                             
 V135 (9=SYSMIS) /                                                             
 V136 (8=SYSMIS) /                                                             
 V136 (9=SYSMIS) /                                                             
 V137 (98=SYSMIS) /                                                            
 V137 (90=SYSMIS) /                                                            
 V138 (98=SYSMIS) /                                                            
 V138 (99=SYSMIS) /                                                            
 V139 (98=SYSMIS) /                                                            
 V139 (99=SYSMIS) /                                                            
 V140 (7=SYSMIS) /                                                             
 V140 (8=SYSMIS) /                                                             
 V140 (9=SYSMIS) /                                                             
 V141 (998=SYSMIS) /                                                           
 V141 (999=SYSMIS) /                                                           
 V142 (8=SYSMIS) /                                                             
 V142 (9=SYSMIS) /                                                             
 V143 (8=SYSMIS) /                                                             
 V143 (9=SYSMIS) /                                                             
 V144 (8=SYSMIS) /                                                             
 V144 (9=SYSMIS) /                                                             
 V145 (98=SYSMIS) /                                                            
 V145 (90=SYSMIS) /                                                            
 V146 (98=SYSMIS) /                                                            
 V146 (99=SYSMIS) /                                                            
 V147 (98=SYSMIS) /                                                            
 V147 (99=SYSMIS) /                                                            
 V148 (7=SYSMIS) /                                                             
 V148 (8=SYSMIS) /                                                             
 V148 (9=SYSMIS) /                                                             
 V149 (998=SYSMIS) /                                                           
 V149 (999=SYSMIS) /                                                           
 V150 (8=SYSMIS) /                                                             
 V150 (9=SYSMIS) /                                                             
 V151 (8=SYSMIS) /                                                             
 V151 (9=SYSMIS) /                                                             
 V152 (8=SYSMIS) /                                                             
 V152 (9=SYSMIS) /                                                             
 V153 (98=SYSMIS) /                                                            
 V153 (90=SYSMIS) /                                                            
 V154 (98=SYSMIS) /                                                            
 V154 (99=SYSMIS) /                                                            
 V155 (98=SYSMIS) /                                                            
 V155 (99=SYSMIS) /                                                            
 V156 (7=SYSMIS) /                                                             
 V156 (8=SYSMIS) /                                                             
 V156 (9=SYSMIS) / .                                                           
                                                                               
                                                                               
* SPSS MISSING VALUE STATEMENT FOR 9028                                        
MISSING VALUES                                                                 
 V11 (0)                                                                       
 V12 (0)                                                                       
 V13 (0)                                                                       
 V25 (999, 900)                                                                
 V26 (9)                                                                       
 V27 (9)                                                                       
 V28 (9)                                                                       
 V29 (998, 999)                                                                
 V30 (8, 9)                                                                    
 V31 (8, 9)                                                                    
 V32 (8, 9)                                                                    
 V33 (998, 999)                                                                
 V34 (8, 9)                                                                    
 V35 (8, 9)                                                                    
 V36 (8, 9)                                                                    
 V37 (998, 999)                                                                
 V38 (8, 9)                                                                    
 V39 (8, 9)                                                                    
 V40 (8, 9)                                                                    
 V41 (998, 999)                                                                
 V42 (8, 9)                                                                    
 V43 (8, 9)                                                                    
 V44 (8, 9)                                                                    
 V45 (998, 999)                                                                
 V46 (8, 9)                                                                    
 V47 (8, 9)                                                                    
 V48 (8, 9)                                                                    
 V49 (998, 999)                                                                
 V50 (8, 9)                                                                    
 V51 (8, 9)                                                                    
 V52 (8, 9)                                                                    
 V53 (998, 999)                                                                
 V54 (8, 9)                                                                    
 V55 (8, 9)                                                                    
 V56 (8, 9)                                                                    
 V57 (998, 999)                                                                
 V58 (8, 9)                                                                    
 V59 (8, 9)                                                                    
 V60 (8, 9)                                                                    
 V61 (998, 999)                                                                
 V62 (8, 9)                                                                    
 V63 (8, 9)                                                                    
 V64 (8, 9)                                                                    
 V65 (998, 999)                                                                
 V66 (8, 9)                                                                    
 V67 (8, 9)                                                                    
 V68 (8, 9)                                                                    
 V69 (999)                                                                     
 V70 (9)                                                                       
 V71 (9)                                                                       
 V72 (9)                                                                       
 V73 (90)                                                                      
 V74 (99)                                                                      
 V75 (99)                                                                      
 V76 (7, 9)                                                                    
 V77 (998, 999)                                                                
 V78 (8, 9)                                                                    
 V79 (8, 9)                                                                    
 V80 (8, 9)                                                                    
 V81 (98, 90)                                                                  
 V82 (98, 99)                                                                  
 V83 (98, 99)                                                                  
 V84 (7, 8, 9)                                                                 
 V85 (998, 999)                                                                
 V86 (8, 9)                                                                    
 V87 (8, 9)                                                                    
 V88 (8, 9)                                                                    
 V89 (98, 90)                                                                  
 V90 (98, 99)                                                                  
 V91 (98, 99)                                                                  
 V92 (7, 8, 9)                                                                 
 V93 (998, 999)                                                                
 V94 (8, 9)                                                                    
 V95 (8, 9)                                                                    
 V96 (8, 9)                                                                    
 V97 (98, 90)                                                                  
 V98 (98, 99)                                                                  
 V99 (98, 99)                                                                  
 V100 (7, 8, 9)                                                                
 V101 (998, 999)                                                               
 V102 (8, 9)                                                                   
 V103 (8, 9)                                                                   
 V104 (8, 9)                                                                   
 V105 (98, 90)                                                                 
 V106 (98, 99)                                                                 
 V107 (98, 99)                                                                 
 V108 (7, 8, 9)                                                                
 V109 (998, 999)                                                               
 V110 (8, 9)                                                                   
 V111 (8, 9)                                                                   
 V112 (8, 9)                                                                   
 V113 (98, 90)                                                                 
 V114 (98, 99)                                                                 
 V115 (98, 99)                                                                 
 V116 (7, 8, 9)                                                                
 V117 (998, 999)                                                               
 V118 (8, 9)                                                                   
 V119 (8, 9)                                                                   
 V120 (8, 9)                                                                   
 V121 (98, 90)                                                                 
 V122 (98, 99)                                                                 
 V123 (98, 99)                                                                 
 V124 (7, 8, 9)                                                                
 V125 (998, 999)                                                               
 V126 (8, 9)                                                                   
 V127 (8, 9)                                                                   
 V128 (8, 9)                                                                   
 V129 (98, 90)                                                                 
 V130 (98, 99)                                                                 
 V131 (98, 99)                                                                 
 V132 (7, 8, 9)                                                                
 V133 (998, 999)                                                               
 V134 (8, 9)                                                                   
 V135 (8, 9)                                                                   
 V136 (8, 9)                                                                   
 V137 (98, 90)                                                                 
 V138 (98, 99)                                                                 
 V139 (98, 99)                                                                 
 V140 (7, 8, 9)                                                                
 V141 (998, 999)                                                               
 V142 (8, 9)                                                                   
 V143 (8, 9)                                                                   
 V144 (8, 9)                                                                   
 V145 (98, 90)                                                                 
 V146 (98, 99)                                                                 
 V147 (98, 99)                                                                 
 V148 (7, 8, 9)                                                                
 V149 (998, 999)                                                               
 V150 (8, 9)                                                                   
 V151 (8, 9)                                                                   
 V152 (8, 9)                                                                   
 V153 (98, 90)                                                                 
 V154 (98, 99)                                                                 
 V155 (98, 99)                                                                 
 V156 (7, 8, 9)  .                                                             
                                                                               
                                                                               
