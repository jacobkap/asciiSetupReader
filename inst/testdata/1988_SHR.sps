*-------------------------------------------------------------------------*
 |             SPSS DATA DEFINITION STATEMENTS FOR ICPSR 9028             |
 |                                                                        |
 |            UNIFORM CRIME REPORTING PROGRAM DATA: [UNITED STATES]       |
 |                                                                        |
 |                Part 61: Supplementary Homicide Report, 1988            |
 |                                                                        |
 |                                                                        |
 | This SPSS setup file contains the following statements:                |
 |                                                                        |
 | DATA LIST:  Specifies the input data file to be read and assigns the   |
 | name, type, decimal specification (if any), and identifies variable    |
 | beginning and ending column locations. Users must replace              |
 | "file-specification" with a complete statement of the location of the  |
 | data file.                                                             |
 |                                                                        |
 | VARIABLE LABELS:  Assigns descriptive labels to variables. Variable    |
 | labels and variable names may be identical for certain variables.      |
 |                                                                        |
 | VALUE LABELS:  Assigns descriptive labels to codes in the data file.   |
 | Value labels may not be present for all variables in the data file.    |
 |                                                                        |
 | MISSING VALUES:  Declares user-defined missing values. These values    |
 | can be treated specially in data transformations, statistical          |
 | calculations, and case selection. Missing values may not be present    |
 | for all variables in the data file.                                    |
 |                                                                        |
 | NOTE:  Users should modify this SPSS setup to suit their specific      |
 | needs. MISSING VALUES sections have been marked by SPSS comment        |
 | statements. To include these sections in a final SPSS setup, users     |
 | should remove the SPSS comment statements from the desired section(s). |
 *------------------------------------------------------------------------.
                                                                           
* SPSS DATA LIST COMMMAND.                                                 
                                                                           
DATA LIST FILE="file-specification" /                                      
   V1 1-4                   V2 5-5                   V3 6-7                
   V4 8-12                  V5 13-14                 V6 15-21 (A)          
   V7 22-22                 V8 23-24                 V9 25-25              
   V10 26-27                V11 28-35                V12 36-38             
   V13 39-41                V14 42-42                V15 43-66 (A)         
   V16 67-72 (A)            V17 73-74                V18 75-80             
   V19 81-81                V20 82-82                V21 83-85             
   V22 86-86                V23 87-88                V24 89-90             
   V25 91-93                V26 94-94                V27 95-95             
   V28 96-96                V29 97-99                V30 100-100           
   V31 101-101              V32 102-102              V33 103-105           
   V34 106-106              V35 107-107              V36 108-108           
   V37 109-111              V38 112-112              V39 113-113           
   V40 114-114              V41 115-117              V42 118-118           
   V43 119-119              V44 120-120              V45 121-123           
   V46 124-124              V47 125-125              V48 126-126           
   V49 127-129              V50 130-130              V51 131-131           
   V52 132-132              V53 133-135              V54 136-136           
   V55 137-137              V56 138-138              V57 139-141           
   V58 142-142              V59 143-143              V60 144-144           
   V61 145-147              V62 148-148              V63 149-149           
   V64 150-150              V65 151-153              V66 154-154           
   V67 155-155              V68 156-156              V69 157-159           
   V70 160-160              V71 161-161              V72 162-162           
   V73 163-164              V74 165-166              V75 167-168           
   V76 169-169              V77 170-172              V78 173-173           
   V79 174-174              V80 175-175              V81 176-177           
   V82 178-179              V83 180-181              V84 182-182           
   V85 183-185              V86 186-186              V87 187-187           
   V88 188-188              V89 189-190              V90 191-192           
   V91 193-194              V92 195-195              V93 196-198           
   V94 199-199              V95 200-200              V96 201-201           
   V97 202-203              V98 204-205              V99 206-207           
   V100 208-208             V101 209-211             V102 212-212          
   V103 213-213             V104 214-214             V105 215-216          
   V106 217-218             V107 219-220             V108 221-221          
   V109 222-224             V110 225-225             V111 226-226          
   V112 227-227             V113 228-229             V114 230-231          
   V115 232-233             V116 234-234             V117 235-237          
   V118 238-238             V119 239-239             V120 240-240          
   V121 241-242             V122 243-244             V123 245-246          
   V124 247-247             V125 248-250             V126 251-251          
   V127 252-252             V128 253-253             V129 254-255          
   V130 256-257             V131 258-259             V132 260-260          
   V133 261-263             V134 264-264             V135 265-265          
   V136 266-266             V137 267-268             V138 269-270          
   V139 271-272             V140 273-273             V141 274-276          
   V142 277-277             V143 278-278             V144 279-279          
   V145 280-281             V146 282-283             V147 284-285          
   V148 286-286             V149 287-289             V150 290-290          
   V151 291-291             V152 292-292             V153 293-294          
   V154 295-296             V155 297-298             V156 299-299.         
                                                                           
* SPSS VARIABLE LABELS COMMAND.                                            
                                                                           
VARIABLE LABELS                                                            
   V1 "ICPSR STUDY NUMBER-9028"                                            
   V2 "ICPSR VERSION NUMBER-1"                                             
   V3 "ICPSR PART NUMBER"                                                  
   V4 "ICPSR SEQUENTIAL ID"                                                
   V5 "NUMERIC STATE CODE"                                                 
   V6 "AGENCY CODE"                                                        
   V7 "GROUP"                                                              
   V8 "SUB GROUP"                                                          
   V9 "GEOGRAPHIC DIVISION"                                                
   V10 "YEAR"                                                              
   V11 "POPULATION"                                                        
   V12 "COUNTY"                                                            
   V13 "MSA CODE"                                                          
   V14 "MSA INDICATION"                                                    
   V15 "AGENCY NAME"                                                       
   V16 "AGENCY STATE"                                                      
   V17 "MONTH OF OFFENSE"                                                  
   V18 "LAST UPDATE"                                                       
   V19 "TYPE OF ACTION"                                                    
   V20 "TYPE OF OFFENSE -HOMICD-"                                          
   V21 "INCIDENT NUMBER"                                                   
   V22 "SITUATION"                                                         
   V23 "VICTIM COUNT - ADDL VICT"                                          
   V24 "OFFNDR COUNT - ADD-L"                                              
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
   V72 "OFFENDER 1: ETHNC ORIGIN"                                          
   V73 "OFFENDER 1: WEAPON"                                                
   V74 "OFFENDER 1: RELATIONSHIP"                                          
   V75 "OFFENDER 1: CIRCUMSTANCE"                                          
   V76 "OFFENDER 1: SUBCIRCUMST"                                           
   V77 "OFFENDER 2: AGE"                                                   
   V78 "OFFENDER 2: SEX"                                                   
   V79 "OFFENDER 2: RACE"                                                  
   V80 "OFFENDER 2: ETHNC ORIGIN"                                          
   V81 "OFFENDER 2: WEAPON"                                                
   V82 "OFFENDER 2: RELATIONSHIP"                                          
   V83 "OFFENDER 2: CIRCUMSTNCES"                                          
   V84 "OFFENDER 2: SUBCIRCUM"                                             
   V85 "OFFENDER 3: AGE"                                                   
   V86 "OFFENDER 3: SEX"                                                   
   V87 "OFFENDER 3: RACE"                                                  
   V88 "OFFENDER 3: ETHNC ORIGIN"                                          
   V89 "OFFENDER 3: WEAPON"                                                
   V90 "OFFENDER 3: RELATIONSHIP"                                          
   V91 "OFFENDER 3: CIRCUMSTNCES"                                          
   V92 "OFFENDER 3: SUBCIRCUM"                                             
   V93 "OFFENDER 4: AGE"                                                   
   V94 "OFFENDER 4: SEX"                                                   
   V95 "OFFENDER 4: RACE"                                                  
   V96 "OFFENDER 4: ETHNC ORIGIN"                                          
   V97 "OFFENDER 4: WEAPON"                                                
   V98 "OFFENDER 4: RELATIONSHIP"                                          
   V99 "OFFENDER 4: CIRCUMSTNCES"                                          
   V100 "OFFENDER 4: SUBCIRCUM"                                            
   V101 "OFFENDER 5: AGE"                                                  
   V102 "OFFENDER 5: SEX"                                                  
   V103 "OFFENDER 5: RACE"                                                 
   V104 "OFFENDER 5: ETHNC ORIGIN"                                         
   V105 "OFFENDER 5: WEAPON"                                               
   V106 "OFFENDER 5: RELATIONSHIP"                                         
   V107 "OFFENDER 5: CIRCUMSTNCES"                                         
   V108 "OFFENDER 5: SUBCIRCUM"                                            
   V109 "OFFENDER 6: AGE"                                                  
   V110 "OFFENDER 6: SEX"                                                  
   V111 "OFFENDER 6: RACE"                                                 
   V112 "OFFENDER 6: ETHNC ORIGIN"                                         
   V113 "OFFENDER 6: WEAPON"                                               
   V114 "OFFENDER 6: RELATIONSHIP"                                         
   V115 "OFFENDER 6: CIRCUMSTNCES"                                         
   V116 "OFFENDER 6: SUBCIRCUM"                                            
   V117 "OFFENDER 7: AGE"                                                  
   V118 "OFFENDER 7: SEX"                                                  
   V119 "OFFENDER 7: RACE"                                                 
   V120 "OFFENDER 7: ETHNC ORIGIN"                                         
   V121 "OFFENDER 7: WEAPON"                                               
   V122 "OFFENDER 7: RELATIONSHIP"                                         
   V123 "OFFENDER 7: CIRCUMSTNCES"                                         
   V124 "OFFENDER 7: SUBCIRCUM"                                            
   V125 "OFFENDER 8: AGE"                                                  
   V126 "OFFENDER 8: SEX"                                                  
   V127 "OFFENDER 8: RACE"                                                 
   V128 "OFFENDER 8: ETHNC ORIGIN"                                         
   V129 "OFFENDER 8: WEAPON"                                               
   V130 "OFFENDER 8: RELATIONSHIP"                                         
   V131 "OFFENDER 8: CIRCUMSTNCES"                                         
   V132 "OFFENDER 8: SUBCIRCUM"                                            
   V133 "OFFENDER 9: AGE"                                                  
   V134 "OFFENDER 9: SEX"                                                  
   V135 "OFFENDER 9: RACE"                                                 
   V136 "OFFENDER 9: ETHNC ORIGIN"                                         
   V137 "OFFENDER 9: WEAPON"                                               
   V138 "OFFENDER 9: RELATIONSHIP"                                         
   V139 "OFFENDER 9: CIRCUMSTNCES"                                         
   V140 "OFFENDER 9: SUBCIRCUM"                                            
   V141 "OFFENDER 10: AGE"                                                 
   V142 "OFFENDER 10: SEX"                                                 
   V143 "OFFENDER 10: RACE"                                                
   V144 "OFFENDER 10: ETHNC ORGIN"                                         
   V145 "OFFENDER 10: WEAPON"                                              
   V146 "OFFENDER 10: RELATIONSHP"                                         
   V147 "OFFENDER 10: CIRCUMSTNCS"                                         
   V148 "OFFENDER 10: SUBCIRCUM"                                           
   V149 "OFFENDER 11: AGE"                                                 
   V150 "OFFENDER 11: SEX"                                                 
   V151 "OFFENDER 11: RACE"                                                
   V152 "OFFENDER 11: ETHNC ORGIN"                                         
   V153 "OFFENDER 11: WEAPON"                                              
   V154 "OFFENDER 11: RELATIONSHP"                                         
   V155 "OFFENDER 11: CIRCUMSTNCS"                                         
   V156 "OFFENDER 11: SUBCIRCUM".                                          
                                                                           
* SPSS VALUE LABELS COMMAND.                                               
                                                                           
VALUE LABELS                                                               
   V1                                                                      
   9028 "STUDY NUMBER" /                                                   
   V2                                                                      
   1 "JUNE 1990" /                                                         
   V5                                                                      
   1 "ALABAMA"                                                             
   2 "ARIZONA"                                                             
   3 "ARKANSAS"                                                            
   4 "CALIFORNIA"                                                          
   5 "COLORADO"                                                            
   6 "CONNECTICUT"                                                         
   7 "DELAWARE"                                                            
   8 "WASHINGTON, D.C"                                                     
   9 "FLORIDA"                                                             
   10 "GEORGIA"                                                            
   11 "IDAHO"                                                              
   12 "ILLINOIS"                                                           
   13 "INDIANA"                                                            
   14 "IOWA"                                                               
   15 "KANSAS"                                                             
   16 "KENTUCKY"                                                           
   17 "LOUISIANA"                                                          
   18 "MAINE"                                                              
   19 "MARYLAND"                                                           
   20 "MASSACHUSETTS"                                                      
   21 "MICHIGAN"                                                           
   22 "MINNESOTA"                                                          
   23 "MISSISSIPPI"                                                        
   24 "MISSOURI"                                                           
   25 "MONTANA"                                                            
   26 "NEBRASKA"                                                           
   27 "NEVADA"                                                             
   28 "NEW HAMPSHIRE"                                                      
   29 "NEW JERSEY"                                                         
   30 "NEW MEXICO"                                                         
   31 "NEW YORK"                                                           
   32 "NORTH CAROLINA"                                                     
   33 "NORTH DAKOTA"                                                       
   34 "OHIO"                                                               
   35 "OKLAHOMA"                                                           
   36 "OREGON"                                                             
   37 "PENNSYLVANIA"                                                       
   38 "RHODE ISLAND"                                                       
   39 "SOUTH CAROLINA"                                                     
   40 "SOUTH DAKOTA"                                                       
   41 "TENNESSEE"                                                          
   42 "TEXAS"                                                              
   43 "UTAH"                                                               
   44 "VERMONT"                                                            
   45 "VIRGINIA"                                                           
   46 "WASHINGTON"                                                         
   47 "WEST VIRGINIA"                                                      
   48 "WISCONSIN"                                                          
   49 "WYOMING"                                                            
   50 "ALASKA"                                                             
   51 "HAWAII" /                                                           
   V7                                                                      
   0 "POSSESSIONS"                                                         
   1 "ALL CITIES 250K+"                                                    
   2 "CIT BT 100K-250K"                                                    
   3 "CITI BET 50K-99K"                                                    
   4 "CITS BET 25K-50K"                                                    
   5 "CITI BET 10K-25K"                                                    
   6 "CIT BT 2.5K-9.9K"                                                    
   7 "CITIE UNDER 2.5K"                                                    
   8 "NON-MSA CNTIES"                                                      
   9 "MSA COUNTIES" /                                                      
   V8                                                                      
   11 "ALL CITIES 1M+"                                                     
   12 "CIT BT 500K-999K"                                                   
   13 "CIT BET 250-500K"                                                   
   20 "CIT BT 100K-250K"                                                   
   30 "CITI BT 50K-100K"                                                   
   40 "CITIE BT 25K-50K"                                                   
   50 "CITIE BT 10K-25K"                                                   
   60 "CIT BET 2.5K-10K"                                                   
   70 "CITIE UNDER 2.5K"                                                   
   81 "NON-MSA 100K+"                                                      
   82 "NON-MSA 25K-100K"                                                   
   83 "NON-MSA 10K-25K"                                                    
   84 "NON-MSA <10K"                                                       
   91 "MSA 100K+"                                                          
   92 "MSA 25K-100K"                                                       
   93 "MSA 10K-25K"                                                        
   94 "MSA COUNT <10K" /                                                   
   V9                                                                      
   1 "NEW ENGLND STS"                                                      
   2 "MID-ATL STATES"                                                      
   3 "E N.CENT STATES"                                                     
   4 "W N.CENT STATES"                                                     
   5 "STH ATL STATES"                                                      
   6 "E S.CENT STATES"                                                     
   7 "W S.CENT STATES"                                                     
   8 "MOUNTAIN STATES"                                                     
   9 "PACIFIC STATES" /                                                    
   V12                                                                     
   0 "INAP" /                                                              
   V13                                                                     
   0 "INAP" /                                                              
   V14                                                                     
   0 "NON-SUBURBAN"                                                        
   1 "SUBURBAN" /                                                          
   V17                                                                     
   1 "JANUARY"                                                             
   2 "FEBRUARY"                                                            
   3 "MARCH"                                                               
   4 "APRIL"                                                               
   5 "MAY"                                                                 
   6 "JUNE"                                                                
   7 "JULY"                                                                
   8 "AUGUST"                                                              
   9 "SEPTEMBER"                                                           
   10 "OCTOBER"                                                            
   11 "NOVEMBER"                                                           
   12 "DECEMBER" /                                                         
   V19                                                                     
   0 "NORMAL UPDATE"                                                       
   1 "ADJUSTMENT" /                                                        
   V20                                                                     
   1 "MURDER NONNEGLIG"                                                    
   2 "MANSL BY NEGLIG" /                                                   
   V22                                                                     
   1 "SNGL VICT-1 OFFE"                                                    
   2 "SNGL VIC UNK OFF"                                                    
   3 "SINGL VIC-MUL OF"                                                    
   4 "MULT VIC-SIN OFF"                                                    
   5 "MULTIPLE VIC-OFF"                                                    
   6 "MULT VIC-UNK OFF" /                                                  
   V25                                                                     
   0 "AGE UNKNOWN"                                                         
   1 "BIRTH TO 1 YEAR"                                                     
   99 "99 YRS OR MORE" /                                                   
   V26                                                                     
   1 "MALE"                                                                
   2 "FEMALE"                                                              
   9 "UNKNOWN" /                                                           
   V27                                                                     
   1 "WHITE"                                                               
   2 "BLACK"                                                               
   3 "AMERICAN INDIAN"                                                     
   4 "ASIAN-PAC ISLAND"                                                    
   9 "UNKNOWN" /                                                           
   V28                                                                     
   1 "HISPANIC ORIGIN"                                                     
   2 "NOT HISPANIC"                                                        
   9 "UNKNOWN-NOT REPT" /                                                  
   V29                                                                     
   0 "AGE UNKNOWN"                                                         
   1 "BIRTH TO 1 YEAR"                                                     
   99 "99 YRS OR MORE"                                                     
   999 "INAP" /                                                            
   V30                                                                     
   1 "MALE"                                                                
   2 "FEMALE"                                                              
   8 "INAP"                                                                
   9 "UNKNOWN" /                                                           
   V31                                                                     
   1 "WHITE"                                                               
   2 "BLACK"                                                               
   3 "AMERICAN INDIAN"                                                     
   4 "ASIAN-PAC ISLAND"                                                    
   8 "INAP"                                                                
   9 "UNKNOWN" /                                                           
   V32                                                                     
   1 "HISPANIC ORIGIN"                                                     
   2 "NOT HISPANIC"                                                        
   9 "UNKNOWN-NOT REPT" /                                                  
   V33                                                                     
   0 "AGE UNKNOWN"                                                         
   1 "BIRTH TO 1 YEAR"                                                     
   99 "99 YRS OR MORE"                                                     
   999 "INAP" /                                                            
   V34                                                                     
   1 "MALE"                                                                
   2 "FEMALE"                                                              
   8 "INAP"                                                                
   9 "UNKNOWN" /                                                           
   V35                                                                     
   1 "WHITE"                                                               
   2 "BLACK"                                                               
   3 "AMERICAN INDIAN"                                                     
   4 "ASIAN-PAC ISLAND"                                                    
   8 "INAP"                                                                
   9 "UNKNOWN" /                                                           
   V36                                                                     
   1 "HISPANIC ORIGIN"                                                     
   2 "NOT HISPANIC"                                                        
   9 "UNKNOWN-NOT REPT" /                                                  
   V37                                                                     
   0 "AGE UNKNOWN"                                                         
   1 "BIRTH TO 1 YEAR"                                                     
   99 "99 YRS OR MORE"                                                     
   999 "INAP" /                                                            
   V38                                                                     
   1 "MALE"                                                                
   2 "FEMALE"                                                              
   8 "INAP"                                                                
   9 "UNKNOWN" /                                                           
   V39                                                                     
   1 "WHITE"                                                               
   2 "BLACK"                                                               
   3 "AMERICAN INDIAN"                                                     
   4 "ASIAN-PAC ISLAND"                                                    
   8 "INAP"                                                                
   9 "UNKNOWN" /                                                           
   V40                                                                     
   1 "HISPANIC ORIGIN"                                                     
   2 "NOT HISPANIC"                                                        
   9 "UNKNOWN-NOT REPT" /                                                  
   V41                                                                     
   0 "AGE UNKNOWN"                                                         
   1 "BIRTH TO 1 YEAR"                                                     
   99 "99 YRS OR MORE"                                                     
   999 "INAP" /                                                            
   V42                                                                     
   1 "MALE"                                                                
   2 "FEMALE"                                                              
   8 "INAP"                                                                
   9 "UNKNOWN" /                                                           
   V43                                                                     
   1 "WHITE"                                                               
   2 "BLACK"                                                               
   3 "AMERICAN INDIAN"                                                     
   4 "ASIAN-PAC ISLAND"                                                    
   8 "INAP"                                                                
   9 "UNKNOWN" /                                                           
   V44                                                                     
   1 "HISPANIC ORIGIN"                                                     
   2 "NOT HISPANIC"                                                        
   9 "UNKNOWN-NOT REPT" /                                                  
   V45                                                                     
   0 "AGE UNKNOWN"                                                         
   1 "BIRTH TO 1 YEAR"                                                     
   99 "99 YRS OR MORE"                                                     
   999 "INAP" /                                                            
   V46                                                                     
   1 "MALE"                                                                
   2 "FEMALE"                                                              
   8 "INAP"                                                                
   9 "UNKNOWN" /                                                           
   V47                                                                     
   1 "WHITE"                                                               
   2 "BLACK"                                                               
   3 "AMERICAN INDIAN"                                                     
   4 "ASIAN-PAC ISLAND"                                                    
   8 "INAP"                                                                
   9 "UNKNOWN" /                                                           
   V48                                                                     
   1 "HISPANIC ORIGIN"                                                     
   2 "NOT HISPANIC"                                                        
   9 "UNKNOWN-NOT REPT" /                                                  
   V49                                                                     
   0 "AGE UNKNOWN"                                                         
   1 "BIRTH TO 1 YEAR"                                                     
   99 "99 YRS OR MORE"                                                     
   999 "INAP" /                                                            
   V50                                                                     
   1 "MALE"                                                                
   2 "FEMALE"                                                              
   8 "INAP"                                                                
   9 "UNKNOWN" /                                                           
   V51                                                                     
   1 "WHITE"                                                               
   2 "BLACK"                                                               
   3 "AMERICAN INDIAN"                                                     
   4 "ASIAN-PAC ISLAND"                                                    
   8 "INAP"                                                                
   9 "UNKNOWN" /                                                           
   V52                                                                     
   1 "HISPANIC ORIGIN"                                                     
   2 "NOT HISPANIC"                                                        
   9 "UNKNOWN-NOT REPT" /                                                  
   V53                                                                     
   0 "AGE UNKNOWN"                                                         
   1 "BIRTH TO 1 YEAR"                                                     
   99 "99 YRS OR MORE"                                                     
   999 "INAP" /                                                            
   V54                                                                     
   1 "MALE"                                                                
   2 "FEMALE"                                                              
   8 "INAP"                                                                
   9 "UNKNOWN" /                                                           
   V55                                                                     
   1 "WHITE"                                                               
   2 "BLACK"                                                               
   3 "AMERICAN INDIAN"                                                     
   4 "ASIAN-PAC ISLAND"                                                    
   8 "INAP"                                                                
   9 "UNKNOWN" /                                                           
   V56                                                                     
   1 "HISPANIC ORIGIN"                                                     
   2 "NOT HISPANIC"                                                        
   9 "UNKNOWN-NOT REPT" /                                                  
   V57                                                                     
   0 "AGE UNKNOWN"                                                         
   1 "BIRTH TO 1 YEAR"                                                     
   99 "99 YRS OR MORE"                                                     
   999 "INAP" /                                                            
   V58                                                                     
   1 "MALE"                                                                
   2 "FEMALE"                                                              
   8 "INAP"                                                                
   9 "UNKNOWN" /                                                           
   V59                                                                     
   1 "WHITE"                                                               
   2 "BLACK"                                                               
   3 "AMERICAN INDIAN"                                                     
   4 "ASIAN-PAC ISLAND"                                                    
   8 "INAP"                                                                
   9 "UNKNOWN" /                                                           
   V60                                                                     
   1 "HISPANIC ORIGIN"                                                     
   2 "NOT HISPANIC"                                                        
   9 "UNKNOWN-NOT REPT" /                                                  
   V61                                                                     
   0 "AGE UNKNOWN"                                                         
   1 "BIRTH TO 1 YEAR"                                                     
   99 "99 YRS OR MORE"                                                     
   999 "INAP" /                                                            
   V62                                                                     
   1 "MALE"                                                                
   2 "FEMALE"                                                              
   8 "INAP"                                                                
   9 "UNKNOWN" /                                                           
   V63                                                                     
   1 "WHITE"                                                               
   2 "BLACK"                                                               
   3 "AMERICAN INDIAN"                                                     
   4 "ASIAN-PAC ISLAND"                                                    
   8 "INAP"                                                                
   9 "UNKNOWN" /                                                           
   V64                                                                     
   1 "HISPANIC ORIGIN"                                                     
   2 "NOT HISPANIC"                                                        
   9 "UNKNOWN-NOT REPT" /                                                  
   V65                                                                     
   0 "AGE UNKNOWN"                                                         
   1 "BIRTH TO 1 YEAR"                                                     
   99 "99 YRS OR MORE"                                                     
   999 "INAP" /                                                            
   V66                                                                     
   1 "MALE"                                                                
   2 "FEMALE"                                                              
   8 "INAP"                                                                
   9 "UNKNOWN" /                                                           
   V67                                                                     
   1 "WHITE"                                                               
   2 "BLACK"                                                               
   3 "AMERICAN INDIAN"                                                     
   4 "ASIAN-PAC ISLAND"                                                    
   8 "INAP"                                                                
   9 "UNKNOWN" /                                                           
   V68                                                                     
   1 "HISPANIC ORIGIN"                                                     
   2 "NOT HISPANIC"                                                        
   9 "UNKNOWN-NOT REPT" /                                                  
   V69                                                                     
   0 "AGE UNKNOWN"                                                         
   1 "BIRTH TO 1 YEAR"                                                     
   99 "99 YRS OR MORE" /                                                   
   V70                                                                     
   1 "MALE"                                                                
   2 "FEMALE"                                                              
   9 "UNKNOWN" /                                                           
   V71                                                                     
   1 "WHITE"                                                               
   2 "BLACK"                                                               
   3 "AMERICAN INDIAN"                                                     
   4 "ASIAN-PAC ISLAND"                                                    
   9 "UNKNOWN" /                                                           
   V72                                                                     
   1 "HISPANIC ORIGIN"                                                     
   2 "NOT HISPANIC"                                                        
   9 "UNKNOWN-NOT REPT" /                                                  
   V73                                                                     
   11 "FIREARM,TYPE UNK"                                                   
   12 "HANDGUN-PSTL,ETC"                                                   
   13 "RIFLE"                                                              
   14 "SHOTGUN"                                                            
   15 "OTHER GUN"                                                          
   20 "KNIFE-CUT INST"                                                     
   30 "BLUNT OBJECT"                                                       
   40 "PERSONAL WEAPONS"                                                   
   50 "POISON - NOT GAS"                                                   
   55 "PUSHD OUT WNDW"                                                     
   60 "EXPLOSIVES"                                                         
   65 "FIRE"                                                               
   70 "NARCOTICS DRUGS"                                                    
   75 "DROWNING"                                                           
   80 "STRANGULATN-HANG"                                                   
   85 "ASPHYXIATION-GAS"                                                   
   90 "OTH -TYPE UNK" /                                                    
   V74                                                                     
   1 "HUSBAND"                                                             
   2 "WIFE"                                                                
   3 "COMMON-LAW HUSB"                                                     
   4 "COMMON-LAW WIFE"                                                     
   5 "MOTHER"                                                              
   6 "FATHER"                                                              
   7 "SON"                                                                 
   8 "DAUGHTER"                                                            
   9 "BROTHER"                                                             
   10 "SISTER"                                                             
   11 "IN-LAW"                                                             
   12 "STEPFATHER"                                                         
   13 "STEPMOTHER"                                                         
   14 "STEPSON"                                                            
   15 "STEPDAUGHTER"                                                       
   16 "OTHER FAMILY"                                                       
   17 "NEIGHBOR"                                                           
   18 "ACQUAINTANCE"                                                       
   19 "BOYFRIEND"                                                          
   20 "GIRLFRIEND"                                                         
   21 "EX-HUSBAND"                                                         
   22 "EX-WIFE"                                                            
   23 "EMPLOYEE"                                                           
   24 "EMPLOYER"                                                           
   25 "FRIEND"                                                             
   26 "HOMOSEXUAL RELAT"                                                   
   27 "OTH-VIC KNOWS"                                                      
   28 "STRANGER"                                                           
   99 "REL NOT DETERMND" /                                                 
   V75                                                                     
   2 "RAPE"                                                                
   3 "ROBBERY"                                                             
   5 "BURGLARY"                                                            
   6 "LARCENY"                                                             
   7 "MOTOR VEHI THEFT"                                                    
   9 "ARSON"                                                               
   10 "PROSTIT,COM-VICE"                                                   
   17 "OTH SEX OFFENSE"                                                    
   18 "NARC DRUG LAW"                                                      
   19 "GAMBLING"                                                           
   20 "ABORTION"                                                           
   26 "OTH -FELONY TYPE"                                                   
   40 "LOVER-S TRIANGLE"                                                   
   41 "SITTER KLLD CHLD"                                                   
   42 "BRAWL-ALCOHOL"                                                      
   43 "BRAWL-NARCOTICS"                                                    
   44 "ARGUMENT - MONEY"                                                   
   45 "OTHER ARGUMENTS"                                                    
   46 "GANGLAND KLLINGS"                                                   
   47 "JUV GANG KILLNGS"                                                   
   48 "INSTITUT KILLNGS"                                                   
   49 "SNIPER ATTACK"                                                      
   50 "VIC SHOT HUNT AC"                                                   
   51 "GUN-CLEANING DTH"                                                   
   52 "KIDS PLAY WITH GUN"                                                 
   53 "OTH NEGLIGEN-GUN"                                                   
   59 "ALL OTH MANSLAUG"                                                   
   60 "OTH NON-FEL TYPE"                                                   
   70 "ALL SUSPECT FELO"                                                   
   80 "JUSTIF HOMI-CIVIL"                                                  
   81 "JUSTIF HOMI-POLI"                                                   
   99 "REL NOT DETERMND" /                                                 
   V76                                                                     
   1 "FEL ATTACK POLIC"                                                    
   2 "FEL ATTACK POLIC"                                                    
   3 "FEL ATTACK PERS"                                                     
   4 "FEL ATTEM FLIGHT"                                                    
   5 "KILLD DURING CRM"                                                    
   6 "FEL RESIST ARRES"                                                    
   7 "NOT ENOUGH INFOR"                                                    
   9 "INAP" /                                                              
   V77                                                                     
   0 "AGE UNKNOWN"                                                         
   1 "BIRTH TO 1 YEAR"                                                     
   99 "99 YRS OR MORE"                                                     
   999 "INAP" /                                                            
   V78                                                                     
   1 "MALE"                                                                
   2 "FEMALE"                                                              
   8 "INAP"                                                                
   9 "UNKNOWN" /                                                           
   V79                                                                     
   1 "WHITE"                                                               
   2 "BLACK"                                                               
   3 "AMERICAN INDIAN"                                                     
   4 "ASIAN-PAC ISLAND"                                                    
   8 "INAP"                                                                
   9 "UNKNOWN" /                                                           
   V80                                                                     
   1 "HISPANIC ORIGIN"                                                     
   2 "NOT HISPANIC"                                                        
   9 "UNKNOWN-NOT REPT" /                                                  
   V81                                                                     
   11 "FIREARM,TYPE UNK"                                                   
   12 "HANDGUN-PSTL,ETC"                                                   
   13 "RIFLE"                                                              
   14 "SHOTGUN"                                                            
   15 "OTHER GUN"                                                          
   20 "KNIFE - CUTTING"                                                    
   30 "BLUNT OBJECT"                                                       
   40 "PERSONAL WEAPONS"                                                   
   50 "POISON - NOT GAS"                                                   
   55 "PUSHD OUT WNDW"                                                     
   60 "EXPLOSIVES"                                                         
   65 "FIRE"                                                               
   70 "NARCOTICS DRUGS"                                                    
   75 "DROWNING"                                                           
   80 "STRANGULATN-HANG"                                                   
   85 "ASPHYXIATION-GAS"                                                   
   90 "OTH -TYPE UNK"                                                      
   99 "INAP" /                                                             
   V82                                                                     
   1 "HUSBAND"                                                             
   2 "WIFE"                                                                
   3 "COMMON-LAW HUSB"                                                     
   4 "COMMON-LAW WIFE"                                                     
   5 "MOTHER"                                                              
   6 "FATHER"                                                              
   7 "SON"                                                                 
   8 "DAUGHTER"                                                            
   9 "BROTHER"                                                             
   10 "SISTER"                                                             
   11 "IN-LAW"                                                             
   12 "STEPFATHER"                                                         
   13 "STEPMOTHER"                                                         
   14 "STEPSON"                                                            
   15 "STEPDAUGHTER"                                                       
   16 "OTHER FAMILY"                                                       
   17 "NEIGHBOR"                                                           
   18 "ACQUAINTANCE"                                                       
   19 "BOYFRIEND"                                                          
   20 "GIRLFRIEND"                                                         
   21 "EX-HUSBAND"                                                         
   22 "EX-WIFE"                                                            
   23 "EMPLOYEE"                                                           
   24 "EMPLOYER"                                                           
   25 "FRIEND"                                                             
   26 "HOMOSEXUAL RELAT"                                                   
   27 "OTH-VIC KNOWS"                                                      
   28 "STRANGER"                                                           
   98 "INAP"                                                               
   99 "REL NOT DETERMND" /                                                 
   V83                                                                     
   2 "RAPE"                                                                
   3 "ROBBERY"                                                             
   5 "BURGLARY"                                                            
   6 "LARCENY"                                                             
   7 "MOTOR VEHI THEFT"                                                    
   9 "ARSON"                                                               
   10 "PROSTIT,COM-VICE"                                                   
   17 "OTH SEX OFFENSE"                                                    
   18 "NARC DRUG LAW"                                                      
   19 "GAMBLING"                                                           
   26 "OTH FELONY TYPE"                                                    
   32 "ABORTION"                                                           
   40 "LOVER-S TRIANGLE"                                                   
   41 "SITTER KLLD CHLD"                                                   
   42 "BRAWL-ALCOHOL"                                                      
   43 "BRAWL-NARCOTICS"                                                    
   44 "ARGUMENT - MONEY"                                                   
   45 "OTHER ARGUMENTS"                                                    
   46 "GANGLAND KLLINGS"                                                   
   47 "JUV GANG KILLNGS"                                                   
   48 "INSTITUT KILLNGS"                                                   
   49 "SNIPER ATTACK"                                                      
   50 "VIC SHOT HUNT AC"                                                   
   51 "GUN-CLEANING DTH"                                                   
   52 "KIDS PLAY WITH GUN"                                                 
   53 "OTH NEGLIGEN-GUN"                                                   
   59 "ALL OTH MANSLAUG"                                                   
   60 "OTH NON-FELONY"                                                     
   70 "ALL SUSPECT FELO"                                                   
   80 "JUSTIF HOMI-CIVIL"                                                  
   81 "JUSTIF HOM-POLIC"                                                   
   98 "INAP"                                                               
   99 "REL NOT DETERMND" /                                                 
   V84                                                                     
   1 "FEL ATTACK POLIC"                                                    
   2 "FEL ATTACK POLIC"                                                    
   3 "FEL ATTACK PERS"                                                     
   4 "FEL ATTEM FLIGHT"                                                    
   5 "KILLED DURNG CRM"                                                    
   6 "FEL RESIST ARRES"                                                    
   7 "NOT ENOUGH INFOR"                                                    
   8 "INAP  1 OFFNDR"                                                      
   9 "INAP  JUSTIFABLE" /                                                  
   V85                                                                     
   0 "AGE UNKNOWN"                                                         
   1 "BIRTH TO 1 YEAR"                                                     
   99 "99 YRS OR MORE"                                                     
   999 "INAP" /                                                            
   V86                                                                     
   1 "MALE"                                                                
   2 "FEMALE"                                                              
   8 "INAP FEWR OFFNDS"                                                    
   9 "UNKNOWN" /                                                           
   V87                                                                     
   1 "WHITE"                                                               
   2 "BLACK"                                                               
   3 "AMERICAN INDIAN"                                                     
   4 "ASIAN-PAC ISLAND"                                                    
   8 "INAP FEWR OFFNDS"                                                    
   9 "UNKNOWN" /                                                           
   V88                                                                     
   1 "HISPANIC ORIGIN"                                                     
   2 "NOT HISPANIC"                                                        
   9 "UNKNOWN-NOT REPT" /                                                  
   V89                                                                     
   11 "FIREARM,TYPE UNK"                                                   
   12 "HANDGUN-PSTL,ETC"                                                   
   13 "RIFLE"                                                              
   14 "SHOTGUN"                                                            
   15 "OTHER GUN"                                                          
   20 "KNIFE - CUTTING"                                                    
   30 "BLUNT OBJECT"                                                       
   40 "PERSONAL WEAPONS"                                                   
   50 "POISON - NOT GAS"                                                   
   55 "PUSHD OUT WNDW"                                                     
   60 "EXPLOSIVES"                                                         
   65 "FIRE"                                                               
   70 "NARCOTICS DRUGS"                                                    
   75 "DROWNING"                                                           
   80 "STRANGULATN-HANG"                                                   
   85 "ASPHYXIATION-GAS"                                                   
   90 "OTH -TYPE UNK"                                                      
   99 "INAP" /                                                             
   V90                                                                     
   1 "HUSBAND"                                                             
   2 "WIFE"                                                                
   3 "COMMON-LAW HUSB"                                                     
   4 "COMMON-LAW WIFE"                                                     
   5 "MOTHER"                                                              
   6 "FATHER"                                                              
   7 "SON"                                                                 
   8 "DAUGHTER"                                                            
   9 "BROTHER"                                                             
   10 "SISTER"                                                             
   11 "IN-LAW"                                                             
   12 "STEPFATHER"                                                         
   13 "STEPMOTHER"                                                         
   14 "STEPSON"                                                            
   15 "STEPDAUGHTER"                                                       
   16 "OTHER FAMILY"                                                       
   17 "NEIGHBOR"                                                           
   18 "ACQUAINTANCE"                                                       
   19 "BOYFRIEND"                                                          
   20 "GIRLFRIEND"                                                         
   21 "EX-HUSBAND"                                                         
   22 "EX-WIFE"                                                            
   23 "EMPLOYEE"                                                           
   24 "EMPLOYER"                                                           
   25 "FRIEND"                                                             
   26 "HOMOSEXUAL RELAT"                                                   
   27 "OTH-VIC KNOWS"                                                      
   28 "STRANGER"                                                           
   98 "INAP"                                                               
   99 "REL NOT DETERMND" /                                                 
   V91                                                                     
   2 "RAPE"                                                                
   3 "ROBBERY"                                                             
   5 "BURGLARY"                                                            
   6 "LARCENY"                                                             
   7 "MOTOR VEHI THEFT"                                                    
   9 "ARSON"                                                               
   10 "PROSTIT,COM-VICE"                                                   
   17 "OTH SEX OFFENSE"                                                    
   18 "NARC DRUG LAW"                                                      
   19 "GAMBLING"                                                           
   26 "OTH FELONY TYPE"                                                    
   32 "ABORTION"                                                           
   40 "LOVER-S TRIANGLE"                                                   
   41 "SITTER KLLD CHLD"                                                   
   42 "BRAWL-ALCOHOL"                                                      
   43 "BRAWL-NARCOTICS"                                                    
   44 "ARGUMENT - MONEY"                                                   
   45 "OTHER ARGUMENTS"                                                    
   46 "GANGLAND KLLINGS"                                                   
   47 "JUV GANG KILLNGS"                                                   
   48 "INSTITUT KILLNGS"                                                   
   49 "SNIPER ATTACK"                                                      
   50 "VIC SHOT HUNT AC"                                                   
   51 "GUN-CLEANING DTH"                                                   
   52 "KIDS PLAY WITH GUN"                                                 
   53 "OTH NEGLIGEN-GUN"                                                   
   59 "ALL OTH MANSLAUG"                                                   
   60 "OTH NON-FELONY"                                                     
   70 "ALL SUSPECT FELO"                                                   
   80 "JUSTIF HOMI-CIVIL"                                                  
   81 "JUSTIF HOM-POLIC"                                                   
   98 "INAP"                                                               
   99 "REL NOT DETERMND" /                                                 
   V92                                                                     
   1 "FEL ATTACK POLIC"                                                    
   2 "FEL ATTACK POLIC"                                                    
   3 "FEL ATTACK PERS"                                                     
   4 "FEL ATTEM FLIGHT"                                                    
   5 "KILLED DURNG CRM"                                                    
   6 "FEL RESIST ARRES"                                                    
   7 "NOT ENOUGH INFOR"                                                    
   8 "INAP FEWR OFFNDS"                                                    
   9 "INAP JUSTIF HOM" /                                                   
   V93                                                                     
   0 "AGE UNKNOWN"                                                         
   1 "BIRTH TO 1 YEAR"                                                     
   99 "99 YRS OR MORE"                                                     
   999 "INAP" /                                                            
   V94                                                                     
   1 "MALE"                                                                
   2 "FEMALE"                                                              
   8 "INAP FEWR OFFNDS"                                                    
   9 "UNKNOWN" /                                                           
   V95                                                                     
   1 "WHITE"                                                               
   2 "BLACK"                                                               
   3 "AMERICAN INDIAN"                                                     
   4 "ASIAN-PAC ISLAND"                                                    
   8 "INAP FEWR OFFNDS"                                                    
   9 "UNKNOWN" /                                                           
   V96                                                                     
   1 "HISPANIC ORIGIN"                                                     
   2 "NOT HISPANIC"                                                        
   9 "UNKNOWN-NOT REPT" /                                                  
   V97                                                                     
   11 "FIREARM,TYPE UNK"                                                   
   12 "HANDGUN-PSTL,ETC"                                                   
   13 "RIFLE"                                                              
   14 "SHOTGUN"                                                            
   15 "OTHER GUN"                                                          
   20 "KNIFE - CUTTING"                                                    
   30 "BLUNT OBJECT"                                                       
   40 "PERSONAL WEAPONS"                                                   
   50 "POISON - NOT GAS"                                                   
   55 "PUSHD OUT WNDW"                                                     
   60 "EXPLOSIVES"                                                         
   65 "FIRE"                                                               
   70 "NARCOTICS DRUGS"                                                    
   75 "DROWNING"                                                           
   80 "STRANGULATN-HANG"                                                   
   85 "ASPHYXIATION-GAS"                                                   
   90 "OTH -TYPE UNK"                                                      
   99 "INAP" /                                                             
   V98                                                                     
   1 "HUSBAND"                                                             
   2 "WIFE"                                                                
   3 "COMMON-LAW HUSB"                                                     
   4 "COMMON-LAW WIFE"                                                     
   5 "MOTHER"                                                              
   6 "FATHER"                                                              
   7 "SON"                                                                 
   8 "DAUGHTER"                                                            
   9 "BROTHER"                                                             
   10 "SISTER"                                                             
   11 "IN-LAW"                                                             
   12 "STEPFATHER"                                                         
   13 "STEPMOTHER"                                                         
   14 "STEPSON"                                                            
   15 "STEPDAUGHTER"                                                       
   16 "OTHER FAMILY"                                                       
   17 "NEIGHBOR"                                                           
   18 "ACQUAINTANCE"                                                       
   19 "BOYFRIEND"                                                          
   20 "GIRLFRIEND"                                                         
   21 "EX-HUSBAND"                                                         
   22 "EX-WIFE"                                                            
   23 "EMPLOYEE"                                                           
   24 "EMPLOYER"                                                           
   25 "FRIEND"                                                             
   26 "HOMOSEXUAL RELAT"                                                   
   27 "OTH-VIC KNOWS"                                                      
   28 "STRANGER"                                                           
   98 "INAP"                                                               
   99 "REL NOT DETERMND" /                                                 
   V99                                                                     
   2 "RAPE"                                                                
   3 "ROBBERY"                                                             
   5 "BURGLARY"                                                            
   6 "LARCENY"                                                             
   7 "MOTOR VEHI THEFT"                                                    
   9 "ARSON"                                                               
   10 "PROSTIT,COM-VICE"                                                   
   17 "OTH SEX OFFENSE"                                                    
   18 "NARC DRUG LAW"                                                      
   19 "GAMBLING"                                                           
   26 "OTH FELONY TYPE"                                                    
   32 "ABORTION"                                                           
   40 "LOVER-S TRIANGLE"                                                   
   41 "SITTER KLLD CHLD"                                                   
   42 "BRAWL-ALCOHOL"                                                      
   43 "BRAWL-NARCOTICS"                                                    
   44 "ARGUMENT - MONEY"                                                   
   45 "OTHER ARGUMENTS"                                                    
   46 "GANGLAND KLLINGS"                                                   
   47 "JUV GANG KILLNGS"                                                   
   48 "INSTITUT KILLNGS"                                                   
   49 "SNIPER ATTACK"                                                      
   50 "VIC SHOT HUNT AC"                                                   
   51 "GUN-CLEANING DTH"                                                   
   52 "KIDS PLAY WITH GUN"                                                 
   53 "OTH NEGLIGEN-GUN"                                                   
   59 "ALL OTH MANSLAUG"                                                   
   60 "OTH NON-FELONY"                                                     
   70 "ALL SUSPECT FELO"                                                   
   80 "JUSTIF HOMI-CIVIL"                                                  
   81 "JUSTIF HOM-POLIC"                                                   
   98 "INAP"                                                               
   99 "REL NOT DETERMND" /                                                 
   V100                                                                    
   1 "FEL ATTACK POLIC"                                                    
   2 "FEL ATTACK POLIC"                                                    
   3 "FEL ATTACK PERS"                                                     
   4 "FEL ATTEM FLIGHT"                                                    
   5 "KILLED DURNG CRM"                                                    
   6 "FEL RESIST ARRES"                                                    
   7 "NOT ENOUGH INFOR"                                                    
   8 "INAP FEWR OFFNDS"                                                    
   9 "INAP JUSTIF HOM" /                                                   
   V101                                                                    
   0 "AGE UNKNOWN"                                                         
   1 "BIRTH TO 1 YEAR"                                                     
   99 "99 YRS OR MORE"                                                     
   999 "INAP" /                                                            
   V102                                                                    
   1 "MALE"                                                                
   2 "FEMALE"                                                              
   8 "INAP FEWR OFFNDS"                                                    
   9 "UNKNOWN" /                                                           
   V103                                                                    
   1 "WHITE"                                                               
   2 "BLACK"                                                               
   3 "AMERICAN INDIAN"                                                     
   4 "ASIAN-PAC ISLAND"                                                    
   8 "INAP FEWR OFFNDS"                                                    
   9 "UNKNOWN" /                                                           
   V104                                                                    
   1 "HISPANIC ORIGIN"                                                     
   2 "NOT HISPANIC"                                                        
   9 "UNKNOWN-NOT REPT" /                                                  
   V105                                                                    
   11 "FIREARM,TYPE UNK"                                                   
   12 "HANDGUN-PSTL,ETC"                                                   
   13 "RIFLE"                                                              
   14 "SHOTGUN"                                                            
   15 "OTHER GUN"                                                          
   20 "KNIFE - CUTTING"                                                    
   30 "BLUNT OBJECT"                                                       
   40 "PERSONAL WEAPONS"                                                   
   50 "POISON - NOT GAS"                                                   
   55 "PUSHD OUT WNDW"                                                     
   60 "EXPLOSIVES"                                                         
   65 "FIRE"                                                               
   70 "NARCOTICS DRUGS"                                                    
   75 "DROWNING"                                                           
   80 "STRANGULATN-HANG"                                                   
   85 "ASPHYXIATION-GAS"                                                   
   90 "OTH -TYPE UNK" /                                                    
   V106                                                                    
   1 "HUSBAND"                                                             
   2 "WIFE"                                                                
   3 "COMMON-LAW HUSB"                                                     
   4 "COMMON-LAW WIFE"                                                     
   5 "MOTHER"                                                              
   6 "FATHER"                                                              
   7 "SON"                                                                 
   8 "DAUGHTER"                                                            
   9 "BROTHER"                                                             
   10 "SISTER"                                                             
   11 "IN-LAW"                                                             
   12 "STEPFATHER"                                                         
   13 "STEPMOTHER"                                                         
   14 "STEPSON"                                                            
   15 "STEPDAUGHTER"                                                       
   16 "OTHER FAMILY"                                                       
   17 "NEIGHBOR"                                                           
   18 "ACQUAINTANCE"                                                       
   19 "BOYFRIEND"                                                          
   20 "GIRLFRIEND"                                                         
   21 "EX-HUSBAND"                                                         
   22 "EX-WIFE"                                                            
   23 "EMPLOYEE"                                                           
   24 "EMPLOYER"                                                           
   25 "FRIEND"                                                             
   26 "HOMOSEXUAL RELAT"                                                   
   27 "OTH-VIC KNOWS"                                                      
   28 "STRANGER"                                                           
   98 "INAP"                                                               
   99 "REL NOT DETERMND" /                                                 
   V107                                                                    
   2 "RAPE"                                                                
   3 "ROBBERY"                                                             
   5 "BURGLARY"                                                            
   6 "LARCENY"                                                             
   7 "MOTOR VEHI THEFT"                                                    
   9 "ARSON"                                                               
   10 "PROSTIT,COM-VICE"                                                   
   17 "OTH SEX OFFENSE"                                                    
   18 "NARC DRUG LAW"                                                      
   19 "GAMBLING"                                                           
   26 "OTH FELONY TYPE"                                                    
   32 "ABORTION"                                                           
   40 "LOVER-S TRIANGLE"                                                   
   41 "SITTER KLLD CHLD"                                                   
   42 "BRAWL-ALCOHOL"                                                      
   43 "BRAWL-NARCOTICS"                                                    
   44 "ARGUMENT - MONEY"                                                   
   45 "OTHER ARGUMENTS"                                                    
   46 "GANGLAND KLLINGS"                                                   
   47 "JUV GANG KILLNGS"                                                   
   48 "INSTITUT KILLNGS"                                                   
   49 "SNIPER ATTACK"                                                      
   50 "VIC SHOT HUNT AC"                                                   
   51 "GUN-CLEANING DTH"                                                   
   52 "KIDS PLAY WITH GUN"                                                 
   53 "OTH NEGLIGEN-GUN"                                                   
   59 "ALL OTH MANSLAUG"                                                   
   60 "OTH NON-FELONY"                                                     
   70 "ALL SUSPECT FELO"                                                   
   80 "JUSTIF HOMI-CIVIL"                                                  
   81 "JUSTIF HOM-POLIC"                                                   
   98 "INAP"                                                               
   99 "REL NOT DETERMND" /                                                 
   V108                                                                    
   1 "FEL ATTACK POLIC"                                                    
   2 "FEL ATTACK POLIC"                                                    
   3 "FEL ATTACK PERS"                                                     
   4 "FEL ATTEM FLIGHT"                                                    
   5 "KILLED DURNG CRM"                                                    
   6 "FEL RESIST ARRES"                                                    
   7 "NOT ENOUGH INFOR"                                                    
   8 "INAP FEWR OFFNDS"                                                    
   9 "INAP JUSTIF HOM" /                                                   
   V109                                                                    
   0 "AGE UNKNOWN"                                                         
   1 "BIRTH TO 1 YEAR"                                                     
   99 "99 YRS OR MORE"                                                     
   999 "INAP" /                                                            
   V110                                                                    
   1 "MALE"                                                                
   2 "FEMALE"                                                              
   8 "INAP FEWR OFFNDS"                                                    
   9 "UNKNOWN" /                                                           
   V111                                                                    
   1 "WHITE"                                                               
   2 "BLACK"                                                               
   3 "AMERICAN INDIAN"                                                     
   4 "ASIAN-PAC ISLAND"                                                    
   8 "INAP FEWR OFFNDS"                                                    
   9 "UNKNOWN" /                                                           
   V112                                                                    
   1 "HISPANIC ORIGIN"                                                     
   2 "NOT HISPANIC"                                                        
   9 "UNKNOWN-NOT REPT" /                                                  
   V113                                                                    
   11 "FIREARM,TYPE UNK"                                                   
   12 "HANDGUN-PSTL,ETC"                                                   
   13 "RIFLE"                                                              
   14 "SHOTGUN"                                                            
   15 "OTHER GUN"                                                          
   20 "KNIFE - CUTTING"                                                    
   30 "BLUNT OBJECT"                                                       
   40 "PERSONAL WEAPONS"                                                   
   50 "POISON - NOT GAS"                                                   
   55 "PUSHD OUT WNDW"                                                     
   60 "EXPLOSIVES"                                                         
   65 "FIRE"                                                               
   70 "NARCOTICS DRUGS"                                                    
   75 "DROWNING"                                                           
   80 "STRANGULATN-HANG"                                                   
   85 "ASPHYXIATION-GAS"                                                   
   90 "OTH -TYPE UNK"                                                      
   99 "INAP" /                                                             
   V114                                                                    
   1 "HUSBAND"                                                             
   2 "WIFE"                                                                
   3 "COMMON-LAW HUSB"                                                     
   4 "COMMON-LAW WIFE"                                                     
   5 "MOTHER"                                                              
   6 "FATHER"                                                              
   7 "SON"                                                                 
   8 "DAUGHTER"                                                            
   9 "BROTHER"                                                             
   10 "SISTER"                                                             
   11 "IN-LAW"                                                             
   12 "STEPFATHER"                                                         
   13 "STEPMOTHER"                                                         
   14 "STEPSON"                                                            
   15 "STEPDAUGHTER"                                                       
   16 "OTHER FAMILY"                                                       
   17 "NEIGHBOR"                                                           
   18 "ACQUAINTANCE"                                                       
   19 "BOYFRIEND"                                                          
   20 "GIRLFRIEND"                                                         
   21 "EX-HUSBAND"                                                         
   22 "EX-WIFE"                                                            
   23 "EMPLOYEE"                                                           
   24 "EMPLOYER"                                                           
   25 "FRIEND"                                                             
   26 "HOMOSEXUAL RELAT"                                                   
   27 "OTH-VIC KNOWS"                                                      
   28 "STRANGER"                                                           
   98 "INAP"                                                               
   99 "REL NOT DETERMND" /                                                 
   V115                                                                    
   2 "RAPE"                                                                
   3 "ROBBERY"                                                             
   5 "BURGLARY"                                                            
   6 "LARCENY"                                                             
   7 "MOTOR VEHI THEFT"                                                    
   9 "ARSON"                                                               
   10 "PROSTIT,COM-VICE"                                                   
   17 "OTH SEX OFFENSE"                                                    
   18 "NARC DRUG LAW"                                                      
   19 "GAMBLING"                                                           
   26 "OTH FELONY TYPE"                                                    
   32 "ABORTION"                                                           
   40 "LOVER-S TRIANGLE"                                                   
   41 "SITTER KLLD CHLD"                                                   
   42 "BRAWL-ALCOHOL"                                                      
   43 "BRAWL-NARCOTICS"                                                    
   44 "ARGUMENT - MONEY"                                                   
   45 "OTHER ARGUMENTS"                                                    
   46 "GANGLAND KLLINGS"                                                   
   47 "JUV GANG KILLNGS"                                                   
   48 "INSTITUT KILLNGS"                                                   
   49 "SNIPER ATTACK"                                                      
   50 "VIC SHOT HUNT AC"                                                   
   51 "GUN-CLEANING DTH"                                                   
   52 "KIDS PLAY WITH GUN"                                                 
   53 "OTH NEGLIGEN-GUN"                                                   
   59 "ALL OTH MANSLAUG"                                                   
   60 "OTH NON-FELONY"                                                     
   70 "ALL SUSPECT FELO"                                                   
   80 "JUSTIF HOMI-CIVIL"                                                  
   81 "JUSTIF HOM-POLIC"                                                   
   98 "INAP"                                                               
   99 "REL NOT DETERMND" /                                                 
   V116                                                                    
   1 "FEL ATTACK POLIC"                                                    
   2 "FEL ATTACK POLIC"                                                    
   3 "FEL ATTACK PERS"                                                     
   4 "FEL ATTEM FLIGHT"                                                    
   5 "KILLED DURNG CRM"                                                    
   6 "FEL RESIST ARRES"                                                    
   7 "NOT ENOUGH INFOR"                                                    
   8 "INAP FEWR OFFNDS"                                                    
   9 "INAP JUSTIF HOM" /                                                   
   V117                                                                    
   0 "AGE UNKNOWN"                                                         
   1 "BIRTH TO 1 YEAR"                                                     
   99 "99 YRS OR MORE"                                                     
   999 "INAP" /                                                            
   V118                                                                    
   1 "MALE"                                                                
   2 "FEMALE"                                                              
   8 "INAP FEWR OFFNDS"                                                    
   9 "UNKNOWN" /                                                           
   V119                                                                    
   1 "WHITE"                                                               
   2 "BLACK"                                                               
   3 "AMERICAN INDIAN"                                                     
   4 "ASIAN-PAC ISLAND"                                                    
   8 "INAP FEWR OFFNDS"                                                    
   9 "UNKNOWN" /                                                           
   V120                                                                    
   1 "HISPANIC ORIGIN"                                                     
   2 "NOT HISPANIC"                                                        
   9 "UNKNOWN-NOT REPT" /                                                  
   V121                                                                    
   11 "FIREARM,TYPE UNK"                                                   
   12 "HANDGUN-PSTL,ETC"                                                   
   13 "RIFLE"                                                              
   14 "SHOTGUN"                                                            
   15 "OTHER GUN"                                                          
   20 "KNIFE - CUTTING"                                                    
   30 "BLUNT OBJECT"                                                       
   40 "PERSONAL WEAPONS"                                                   
   50 "POISON - NOT GAS"                                                   
   55 "PUSHD OUT WNDW"                                                     
   60 "EXPLOSIVES"                                                         
   65 "FIRE"                                                               
   70 "NARCOTICS DRUGS"                                                    
   75 "DROWNING"                                                           
   80 "STRANGULATN-HANG"                                                   
   85 "ASPHYXIATION-GAS"                                                   
   90 "OTH -TYPE UNK"                                                      
   99 "INAP" /                                                             
   V122                                                                    
   1 "HUSBAND"                                                             
   2 "WIFE"                                                                
   3 "COMMON-LAW HUSB"                                                     
   4 "COMMON-LAW WIFE"                                                     
   5 "MOTHER"                                                              
   6 "FATHER"                                                              
   7 "SON"                                                                 
   8 "DAUGHTER"                                                            
   9 "BROTHER"                                                             
   10 "SISTER"                                                             
   11 "IN-LAW"                                                             
   12 "STEPFATHER"                                                         
   13 "STEPMOTHER"                                                         
   14 "STEPSON"                                                            
   15 "STEPDAUGHTER"                                                       
   16 "OTHER FAMILY"                                                       
   17 "NEIGHBOR"                                                           
   18 "ACQUAINTANCE"                                                       
   19 "BOYFRIEND"                                                          
   20 "GIRLFRIEND"                                                         
   21 "EX-HUSBAND"                                                         
   22 "EX-WIFE"                                                            
   23 "EMPLOYEE"                                                           
   24 "EMPLOYER"                                                           
   25 "FRIEND"                                                             
   26 "HOMOSEXUAL RELAT"                                                   
   27 "OTH-VIC KNOWS"                                                      
   28 "STRANGER"                                                           
   98 "INAP"                                                               
   99 "REL NOT DETERMND" /                                                 
   V123                                                                    
   2 "RAPE"                                                                
   3 "ROBBERY"                                                             
   5 "BURGLARY"                                                            
   6 "LARCENY"                                                             
   7 "MOTOR VEHI THEFT"                                                    
   9 "ARSON"                                                               
   10 "PROSTIT,COM-VICE"                                                   
   17 "OTH SEX OFFENSE"                                                    
   18 "NARC DRUG LAW"                                                      
   19 "GAMBLING"                                                           
   26 "OTH FELONY TYPE"                                                    
   32 "ABORTION"                                                           
   40 "LOVER-S TRIANGLE"                                                   
   41 "SITTER KLLD CHLD"                                                   
   42 "BRAWL-ALCOHOL"                                                      
   43 "BRAWL-NARCOTICS"                                                    
   44 "ARGUMENT - MONEY"                                                   
   45 "OTHER ARGUMENTS"                                                    
   46 "GANGLAND KLLINGS"                                                   
   47 "JUV GANG KILLNGS"                                                   
   48 "INSTITUT KILLNGS"                                                   
   49 "SNIPER ATTACK"                                                      
   50 "VIC SHOT HUNT AC"                                                   
   51 "GUN-CLEANING DTH"                                                   
   52 "KIDS PLAY WITH GUN"                                                 
   53 "OTH NEGLIGEN-GUN"                                                   
   59 "ALL OTH MANSLAUG"                                                   
   60 "OTH NON-FELONY"                                                     
   70 "ALL SUSPECT FELO"                                                   
   80 "JUSTIF HOMI-CIVIL"                                                  
   81 "JUSTIF HOM-POLIC"                                                   
   98 "INAP"                                                               
   99 "REL NOT DETERMND" /                                                 
   V124                                                                    
   1 "FEL ATTACK POLIC"                                                    
   2 "FEL ATTACK POLIC"                                                    
   3 "FEL ATTACK PERS"                                                     
   4 "FEL ATTEM FLIGHT"                                                    
   5 "KILLED DURNG CRM"                                                    
   6 "FEL RESIST ARRES"                                                    
   7 "NOT ENOUGH INFOR"                                                    
   8 "INAP FEWR OFFNDS"                                                    
   9 "INAP JUSTIF HOM" /                                                   
   V125                                                                    
   0 "AGE UNKNOWN"                                                         
   1 "BIRTH TO 1 YEAR"                                                     
   99 "99 YRS OR MORE"                                                     
   999 "INAP" /                                                            
   V126                                                                    
   1 "MALE"                                                                
   2 "FEMALE"                                                              
   8 "INAP FEWR OFFNDS"                                                    
   9 "UNKNOWN" /                                                           
   V127                                                                    
   1 "WHITE"                                                               
   2 "BLACK"                                                               
   3 "AMERICAN INDIAN"                                                     
   4 "ASIAN-PAC ISLAND"                                                    
   8 "INAP FEWR OFFNDS"                                                    
   9 "UNKNOWN" /                                                           
   V128                                                                    
   1 "HISPANIC ORIGIN"                                                     
   2 "NOT HISPANIC"                                                        
   9 "UNKNOWN-NOT REPT" /                                                  
   V129                                                                    
   11 "FIREARM,TYPE UNK"                                                   
   12 "HANDGUN-PSTL,ETC"                                                   
   13 "RIFLE"                                                              
   14 "SHOTGUN"                                                            
   15 "OTHER GUN"                                                          
   20 "KNIFE - CUTTING"                                                    
   30 "BLUNT OBJECT"                                                       
   40 "PERSONAL WEAPONS"                                                   
   50 "POISON - NOT GAS"                                                   
   55 "PUSHD OUT WNDW"                                                     
   60 "EXPLOSIVES"                                                         
   65 "FIRE"                                                               
   70 "NARCOTICS DRUGS"                                                    
   75 "DROWNING"                                                           
   80 "STRANGULATN-HANG"                                                   
   85 "ASPHYXIATION-GAS"                                                   
   90 "OTH -TYPE UNK"                                                      
   99 "INAP" /                                                             
   V130                                                                    
   1 "HUSBAND"                                                             
   2 "WIFE"                                                                
   3 "COMMON-LAW HUSB"                                                     
   4 "COMMON-LAW WIFE"                                                     
   5 "MOTHER"                                                              
   6 "FATHER"                                                              
   7 "SON"                                                                 
   8 "DAUGHTER"                                                            
   9 "BROTHER"                                                             
   10 "SISTER"                                                             
   11 "IN-LAW"                                                             
   12 "STEPFATHER"                                                         
   13 "STEPMOTHER"                                                         
   14 "STEPSON"                                                            
   15 "STEPDAUGHTER"                                                       
   16 "OTHER FAMILY"                                                       
   17 "NEIGHBOR"                                                           
   18 "ACQUAINTANCE"                                                       
   19 "BOYFRIEND"                                                          
   20 "GIRLFRIEND"                                                         
   21 "EX-HUSBAND"                                                         
   22 "EX-WIFE"                                                            
   23 "EMPLOYEE"                                                           
   24 "EMPLOYER"                                                           
   25 "FRIEND"                                                             
   26 "HOMOSEXUAL RELAT"                                                   
   27 "OTH-VIC KNOWS"                                                      
   28 "STRANGER"                                                           
   98 "INAP"                                                               
   99 "REL NOT DETERMND" /                                                 
   V131                                                                    
   2 "RAPE"                                                                
   3 "ROBBERY"                                                             
   5 "BURGLARY"                                                            
   6 "LARCENY"                                                             
   7 "MOTOR VEHI THEFT"                                                    
   9 "ARSON"                                                               
   10 "PROSTIT,COM-VICE"                                                   
   17 "OTH SEX OFFENSE"                                                    
   18 "NARC DRUG LAW"                                                      
   19 "GAMBLING"                                                           
   26 "OTH FELONY TYPE"                                                    
   32 "ABORTION"                                                           
   40 "LOVER-S TRIANGLE"                                                   
   41 "SITTER KLLD CHLD"                                                   
   42 "BRAWL-ALCOHOL"                                                      
   43 "BRAWL-NARCOTICS"                                                    
   44 "ARGUMENT - MONEY"                                                   
   45 "OTHER ARGUMENTS"                                                    
   46 "GANGLAND KLLINGS"                                                   
   47 "JUV GANG KILLNGS"                                                   
   48 "INSTITUT KILLNGS"                                                   
   49 "SNIPER ATTACK"                                                      
   50 "VIC SHOT HUNT AC"                                                   
   51 "GUN-CLEANING DTH"                                                   
   52 "KIDS PLAY WITH GUN"                                                 
   53 "OTH NEGLIGEN-GUN"                                                   
   59 "ALL OTH MANSLAUG"                                                   
   60 "OTH NON-FELONY"                                                     
   70 "ALL SUSPECT FELO"                                                   
   80 "JUSTIF HOMI-CIVIL"                                                  
   81 "JUSTIF HOM-POLIC"                                                   
   98 "INAP"                                                               
   99 "REL NOT DETERMND" /                                                 
   V132                                                                    
   1 "FEL ATTACK POLIC"                                                    
   2 "FEL ATTACK POLIC"                                                    
   3 "FEL ATTACK PERS"                                                     
   4 "FEL ATTEM FLIGHT"                                                    
   5 "KILLED DURNG CRM"                                                    
   6 "FEL RESIST ARRES"                                                    
   7 "NOT ENOUGH INFOR"                                                    
   8 "INAP FEWR OFFNDS"                                                    
   9 "INAP JUSTIF HOM" /                                                   
   V133                                                                    
   0 "AGE UNKNOWN"                                                         
   1 "BIRTH TO 1 YEAR"                                                     
   99 "99 YRS OR MORE"                                                     
   999 "INAP" /                                                            
   V134                                                                    
   1 "MALE"                                                                
   2 "FEMALE"                                                              
   8 "INAP FEWR OFFNDS"                                                    
   9 "UNKNOWN" /                                                           
   V135                                                                    
   1 "WHITE"                                                               
   2 "BLACK"                                                               
   3 "AMERICAN INDIAN"                                                     
   4 "ASIAN-PAC ISLAND"                                                    
   8 "INAP FEWR OFFNDS"                                                    
   9 "UNKNOWN" /                                                           
   V136                                                                    
   1 "HISPANIC ORIGIN"                                                     
   2 "NOT HISPANIC"                                                        
   9 "UNKNOWN-NOT REPT" /                                                  
   V137                                                                    
   11 "FIREARM,TYPE UNK"                                                   
   12 "HANDGUN-PSTL,ETC"                                                   
   13 "RIFLE"                                                              
   14 "SHOTGUN"                                                            
   15 "OTHER GUN"                                                          
   20 "KNIFE - CUTTING"                                                    
   30 "BLUNT OBJECT"                                                       
   40 "PERSONAL WEAPONS"                                                   
   50 "POISON - NOT GAS"                                                   
   55 "PUSHD OUT WNDW"                                                     
   60 "EXPLOSIVES"                                                         
   65 "FIRE"                                                               
   70 "NARCOTICS DRUGS"                                                    
   75 "DROWNING"                                                           
   80 "STRANGULATN-HANG"                                                   
   85 "ASPHYXIATION-GAS"                                                   
   90 "OTH -TYPE UNK"                                                      
   99 "INAP" /                                                             
   V138                                                                    
   1 "HUSBAND"                                                             
   2 "WIFE"                                                                
   3 "COMMON-LAW HUSB"                                                     
   4 "COMMON-LAW WIFE"                                                     
   5 "MOTHER"                                                              
   6 "FATHER"                                                              
   7 "SON"                                                                 
   8 "DAUGHTER"                                                            
   9 "BROTHER"                                                             
   10 "SISTER"                                                             
   11 "IN-LAW"                                                             
   12 "STEPFATHER"                                                         
   13 "STEPMOTHER"                                                         
   14 "STEPSON"                                                            
   15 "STEPDAUGHTER"                                                       
   16 "OTHER FAMILY"                                                       
   17 "NEIGHBOR"                                                           
   18 "ACQUAINTANCE"                                                       
   19 "BOYFRIEND"                                                          
   20 "GIRLFRIEND"                                                         
   21 "EX-HUSBAND"                                                         
   22 "EX-WIFE"                                                            
   23 "EMPLOYEE"                                                           
   24 "EMPLOYER"                                                           
   25 "FRIEND"                                                             
   26 "HOMOSEXUAL RELAT"                                                   
   27 "OTH-VIC KNOWS"                                                      
   28 "STRANGER"                                                           
   98 "INAP"                                                               
   99 "REL NOT DETERMND" /                                                 
   V139                                                                    
   2 "RAPE"                                                                
   3 "ROBBERY"                                                             
   5 "BURGLARY"                                                            
   6 "LARCENY"                                                             
   7 "MOTOR VEHI THEFT"                                                    
   9 "ARSON"                                                               
   10 "PROSTIT,COM-VICE"                                                   
   17 "OTH SEX OFFENSE"                                                    
   18 "NARC DRUG LAW"                                                      
   19 "GAMBLING"                                                           
   26 "OTH FELONY TYPE"                                                    
   32 "ABORTION"                                                           
   40 "LOVER-S TRIANGLE"                                                   
   41 "SITTER KLLD CHLD"                                                   
   42 "BRAWL-ALCOHOL"                                                      
   43 "BRAWL-NARCOTICS"                                                    
   44 "ARGUMENT - MONEY"                                                   
   45 "OTHER ARGUMENTS"                                                    
   46 "GANGLAND KLLINGS"                                                   
   47 "JUV GANG KILLNGS"                                                   
   48 "INSTITUT KILLNGS"                                                   
   49 "SNIPER ATTACK"                                                      
   50 "VIC SHOT HUNT AC"                                                   
   51 "GUN-CLEANING DTH"                                                   
   52 "KIDS PLAY WITH GUN"                                                 
   53 "OTH NEGLIGEN-GUN"                                                   
   59 "ALL OTH MANSLAUG"                                                   
   60 "OTH NON-FELONY"                                                     
   70 "ALL SUSPECT FELO"                                                   
   80 "JUSTIF HOMI-CIVIL"                                                  
   81 "JUSTIF HOM-POLIC"                                                   
   98 "INAP"                                                               
   99 "REL NOT DETERMND" /                                                 
   V140                                                                    
   1 "FEL ATTACK POLIC"                                                    
   2 "FEL ATTACK POLIC"                                                    
   3 "FEL ATTACK PERS"                                                     
   4 "FEL ATTEM FLIGHT"                                                    
   5 "KILLED DURNG CRM"                                                    
   6 "FEL RESIST ARRES"                                                    
   7 "NOT ENOUGH INFOR"                                                    
   8 "INAP FEWR OFFNDS"                                                    
   9 "INAP JUSTIF HOM" /                                                   
   V141                                                                    
   0 "AGE UNKNOWN"                                                         
   1 "BIRTH TO 1 YEAR"                                                     
   99 "99 YRS OR MORE"                                                     
   999 "INAP" /                                                            
   V142                                                                    
   1 "MALE"                                                                
   2 "FEMALE"                                                              
   8 "INAP FEWR OFFNDS"                                                    
   9 "UNKNOWN" /                                                           
   V143                                                                    
   1 "WHITE"                                                               
   2 "BLACK"                                                               
   3 "AMERICAN INDIAN"                                                     
   4 "ASIAN-PAC ISLAND"                                                    
   8 "INAP FEWR OFFNDS"                                                    
   9 "UNKNOWN" /                                                           
   V144                                                                    
   1 "HISPANIC ORIGIN"                                                     
   2 "NOT HISPANIC"                                                        
   9 "UNKNOWN-NOT REPT" /                                                  
   V145                                                                    
   11 "FIREARM,TYPE UNK"                                                   
   12 "HANDGUN-PSTL,ETC"                                                   
   13 "RIFLE"                                                              
   14 "SHOTGUN"                                                            
   15 "OTHER GUN"                                                          
   20 "KNIFE - CUTTING"                                                    
   30 "BLUNT OBJECT"                                                       
   40 "PERSONAL WEAPONS"                                                   
   50 "POISON - NOT GAS"                                                   
   55 "PUSHD OUT WNDW"                                                     
   60 "EXPLOSIVES"                                                         
   65 "FIRE"                                                               
   70 "NARCOTICS DRUGS"                                                    
   75 "DROWNING"                                                           
   80 "STRANGULATN-HANG"                                                   
   85 "ASPHYXIATION-GAS"                                                   
   90 "OTH -TYPE UNK"                                                      
   99 "INAP" /                                                             
   V146                                                                    
   1 "HUSBAND"                                                             
   2 "WIFE"                                                                
   3 "COMMON-LAW HUSB"                                                     
   4 "COMMON-LAW WIFE"                                                     
   5 "MOTHER"                                                              
   6 "FATHER"                                                              
   7 "SON"                                                                 
   8 "DAUGHTER"                                                            
   9 "BROTHER"                                                             
   10 "SISTER"                                                             
   11 "IN-LAW"                                                             
   12 "STEPFATHER"                                                         
   13 "STEPMOTHER"                                                         
   14 "STEPSON"                                                            
   15 "STEPDAUGHTER"                                                       
   16 "OTHER FAMILY"                                                       
   17 "NEIGHBOR"                                                           
   18 "ACQUAINTANCE"                                                       
   19 "BOYFRIEND"                                                          
   20 "GIRLFRIEND"                                                         
   21 "EX-HUSBAND"                                                         
   22 "EX-WIFE"                                                            
   23 "EMPLOYEE"                                                           
   24 "EMPLOYER"                                                           
   25 "FRIEND"                                                             
   26 "HOMOSEXUAL RELAT"                                                   
   27 "OTH-VIC KNOWS"                                                      
   28 "STRANGER"                                                           
   98 "INAP"                                                               
   99 "REL NOT DETERMND" /                                                 
   V147                                                                    
   2 "RAPE"                                                                
   3 "ROBBERY"                                                             
   5 "BURGLARY"                                                            
   6 "LARCENY"                                                             
   7 "MOTOR VEHI THEFT"                                                    
   9 "ARSON"                                                               
   10 "PROSTIT,COM-VICE"                                                   
   17 "OTH SEX OFFENSE"                                                    
   18 "NARC DRUG LAW"                                                      
   19 "GAMBLING"                                                           
   26 "OTH FELONY TYPE"                                                    
   32 "ABORTION"                                                           
   40 "LOVER-S TRIANGLE"                                                   
   41 "SITTER KLLD CHLD"                                                   
   42 "BRAWL-ALCOHOL"                                                      
   43 "BRAWL-NARCOTICS"                                                    
   44 "ARGUMENT - MONEY"                                                   
   45 "OTHER ARGUMENTS"                                                    
   46 "GANGLAND KLLINGS"                                                   
   47 "JUV GANG KILLNGS"                                                   
   48 "INSTITUT KILLNGS"                                                   
   49 "SNIPER ATTACK"                                                      
   50 "VIC SHOT HUNT AC"                                                   
   51 "GUN-CLEANING DTH"                                                   
   52 "KIDS PLAY WITH GUN"                                                 
   53 "OTH NEGLIGEN-GUN"                                                   
   59 "ALL OTH MANSLAUG"                                                   
   60 "OTH NON-FELONY"                                                     
   70 "ALL SUSPECT FELO"                                                   
   80 "JUSTIF HOMI-CIVIL"                                                  
   81 "JUSTIF HOM-POLIC"                                                   
   98 "INAP"                                                               
   99 "REL NOT DETERMND" /                                                 
   V148                                                                    
   1 "FEL ATTACK POLIC"                                                    
   2 "FEL ATTACK POLIC"                                                    
   3 "FEL ATTACK PERS"                                                     
   4 "FEL ATTEM FLIGHT"                                                    
   5 "KILLED DURNG CRM"                                                    
   6 "FEL RESIST ARRES"                                                    
   7 "NOT ENOUGH INFOR"                                                    
   8 "INAP FEWR OFFNDS"                                                    
   9 "INAP JUSTIF HOM" /                                                   
   V149                                                                    
   0 "AGE UNKNOWN"                                                         
   1 "BIRTH TO 1 YEAR"                                                     
   99 "99 YRS OR MORE"                                                     
   999 "INAP" /                                                            
   V150                                                                    
   1 "MALE"                                                                
   2 "FEMALE"                                                              
   8 "INAP FEWR OFFNDS"                                                    
   9 "UNKNOWN" /                                                           
   V151                                                                    
   1 "WHITE"                                                               
   2 "BLACK"                                                               
   3 "AMERICAN INDIAN"                                                     
   4 "ASIAN-PAC ISLAND"                                                    
   8 "INAP FEWR OFFNDS"                                                    
   9 "UNKNOWN" /                                                           
   V152                                                                    
   1 "HISPANIC ORIGIN"                                                     
   2 "NOT HISPANIC"                                                        
   9 "UNKNOWN-NOT REPT" /                                                  
   V153                                                                    
   11 "FIREARM,TYPE UNK"                                                   
   12 "HANDGUN-PSTL,ETC"                                                   
   13 "RIFLE"                                                              
   14 "SHOTGUN"                                                            
   15 "OTHER GUN"                                                          
   20 "KNIFE - CUTTING"                                                    
   30 "BLUNT OBJECT"                                                       
   40 "PERSONAL WEAPONS"                                                   
   50 "POISON - NOT GAS"                                                   
   55 "PUSHD OUT WNDW"                                                     
   60 "EXPLOSIVES"                                                         
   65 "FIRE"                                                               
   70 "NARCOTICS DRUGS"                                                    
   75 "DROWNING"                                                           
   80 "STRANGULATN-HANG"                                                   
   85 "ASPHYXIATION-GAS"                                                   
   90 "OTH -TYPE UNK"                                                      
   99 "INAP" /                                                             
   V154                                                                    
   1 "HUSBAND"                                                             
   2 "WIFE"                                                                
   3 "COMMON-LAW HUSB"                                                     
   4 "COMMON-LAW WIFE"                                                     
   5 "MOTHER"                                                              
   6 "FATHER"                                                              
   7 "SON"                                                                 
   8 "DAUGHTER"                                                            
   9 "BROTHER"                                                             
   10 "SISTER"                                                             
   11 "IN-LAW"                                                             
   12 "STEPFATHER"                                                         
   13 "STEPMOTHER"                                                         
   14 "STEPSON"                                                            
   15 "STEPDAUGHTER"                                                       
   16 "OTHER FAMILY"                                                       
   17 "NEIGHBOR"                                                           
   18 "ACQUAINTANCE"                                                       
   19 "BOYFRIEND"                                                          
   20 "GIRLFRIEND"                                                         
   21 "EX-HUSBAND"                                                         
   22 "EX-WIFE"                                                            
   23 "EMPLOYEE"                                                           
   24 "EMPLOYER"                                                           
   25 "FRIEND"                                                             
   26 "HOMOSEXUAL RELAT"                                                   
   27 "OTH-VIC KNOWS"                                                      
   28 "STRANGER"                                                           
   98 "INAP"                                                               
   99 "REL NOT DETERMND" /                                                 
   V155                                                                    
   2 "RAPE"                                                                
   3 "ROBBERY"                                                             
   5 "BURGLARY"                                                            
   6 "LARCENY"                                                             
   7 "MOTOR VEHI THEFT"                                                    
   9 "ARSON"                                                               
   10 "PROSTIT,COM-VICE"                                                   
   17 "OTH SEX OFFENSE"                                                    
   18 "NARC DRUG LAW"                                                      
   19 "GAMBLING"                                                           
   26 "OTH FELONY TYPE"                                                    
   32 "ABORTION"                                                           
   40 "LOVER-S TRIANGLE"                                                   
   41 "SITTER KLLD CHLD"                                                   
   42 "BRAWL-ALCOHOL"                                                      
   43 "BRAWL-NARCOTICS"                                                    
   44 "ARGUMENT - MONEY"                                                   
   45 "OTHER ARGUMENTS"                                                    
   46 "GANGLAND KLLINGS"                                                   
   47 "JUV GANG KILLNGS"                                                   
   48 "INSTITUT KILLNGS"                                                   
   49 "SNIPER ATTACK"                                                      
   50 "VIC SHOT HUNT AC"                                                   
   51 "GUN-CLEANING DTH"                                                   
   52 "KIDS PLAY WITH GUN"                                                 
   53 "OTH NEGLIGEN-GUN"                                                   
   59 "ALL OTH MANSLAUG"                                                   
   60 "OTH NON-FELONY"                                                     
   70 "ALL SUSPECT FELO"                                                   
   80 "JUSTIF HOMI-CIVIL"                                                  
   81 "JUSTIF HOM-POLIC"                                                   
   98 "INAP"                                                               
   99 "REL NOT DETERMND" /                                                 
   V156                                                                    
   1 "FEL ATTACK POLIC"                                                    
   2 "FEL ATTACK POLIC"                                                    
   3 "FEL ATTACK PERS"                                                     
   4 "FEL ATTEM FLIGHT"                                                    
   5 "KILLED DURNG CRM"                                                    
   6 "FEL RESIST ARRES"                                                    
   7 "NOT ENOUGH INFOR"                                                    
   8 "INAP FEWR OFFNDS"                                                    
   9 "INAP JUSTIF HOM" /.                                                  
                                                                           
* SPSS MISSING VALUES COMMAND.                                             
                                                                           
* MISSING VALUES                                                           
   V12 (0)                             V13 (0)                             
   V25 (0)                             V26 (9)                             
   V27 (9)                             V28 (9)                             
   V29 (0, 999)                        V30 (8, 9)                          
   V31 (8, 9)                          V32 (9)                             
   V33 (0, 999)                        V34 (8, 9)                          
   V35 (8, 9)                          V36 (9)                             
   V37 (0, 999)                        V38 (8, 9)                          
   V39 (8, 9)                          V40 (9)                             
   V41 (0, 999)                        V42 (8, 9)                          
   V43 (8, 9)                          V44 (9)                             
   V45 (0, 999)                        V46 (8, 9)                          
   V47 (8, 9)                          V48 (9)                             
   V49 (0, 999)                        V50 (8, 9)                          
   V51 (8, 9)                          V52 (9)                             
   V53 (0, 999)                        V54 (8, 9)                          
   V55 (8, 9)                          V56 (9)                             
   V57 (0, 999)                        V58 (8, 9)                          
   V59 (8, 9)                          V60 (9)                             
   V61 (0, 999)                        V62 (8, 9)                          
   V63 (8, 9)                          V64 (9)                             
   V65 (0, 999)                        V66 (8, 9)                          
   V67 (8, 9)                          V68 (9)                             
   V69 (0, 999)                        V70 (8, 9)                          
   V71 (8, 9)                          V72 (9)                             
   V73 (90)                            V74 (99)                            
   V75 (99)                            V76 (7, 9)                          
   V77 (0, 999)                        V78 (8, 9)                          
   V79 (8, 9)                          V80 (9)                             
   V81 (90, 99)                        V82 (98, 99)                        
   V83 (98, 99)                        V84 (8 THRU HI, 7)                  
   V85 (0, 999)                        V86 (8, 9)                          
   V87 (8, 9)                          V88 (9)                             
   V89 (90, 99)                        V90 (98, 99)                        
   V91 (98, 99)                        V92 (8 THRU HI, 7)                  
   V93 (0, 999)                        V94 (8, 9)                          
   V95 (8, 9)                          V96 (9)                             
   V97 (90, 99)                        V98 (98, 99)                        
   V99 (98, 99)                        V100 (8 THRU HI, 7)                 
   V101 (0, 999)                       V102 (8, 9)                         
   V103 (8, 9)                         V104 (9)                            
   V105 (90, 99)                       V106 (98, 99)                       
   V107 (98, 99)                       V108 (8 THRU HI, 7)                 
   V109 (0, 999)                       V110 (8, 9)                         
   V111 (8, 9)                         V112 (9)                            
   V113 (90, 99)                       V114 (98, 99)                       
   V115 (98, 99)                       V116 (8 THRU HI, 7)                 
   V117 (0, 999)                       V118 (8, 9)                         
   V119 (8, 9)                         V120 (9)                            
   V121 (90, 99)                       V122 (98, 99)                       
   V123 (98, 99)                       V124 (8 THRU HI, 7)                 
   V125 (0, 999)                       V126 (8, 9)                         
   V127 (8, 9)                         V128 (9)                            
   V129 (90, 99)                       V130 (98, 99)                       
   V131 (98, 99)                       V132 (8 THRU HI, 7)                 
   V133 (0, 999)                       V134 (8, 9)                         
   V135 (8, 9)                         V136 (9)                            
   V137 (90, 99)                       V138 (98, 99)                       
   V139 (98, 99)                       V140 (8 THRU HI, 7)                 
   V141 (0, 999)                       V142 (8, 9)                         
   V143 (8, 9)                         V144 (9)                            
   V145 (90, 99)                       V146 (98, 99)                       
   V147 (98, 99)                       V148 (8 THRU HI, 7)                 
   V149 (0, 999)                       V150 (8, 9)                         
   V151 (8, 9)                         V152 (9)                            
   V153 (90, 99)                       V154 (98, 99)                       
   V155 (98, 99)                       V156 (8 THRU HI, 7).                
