*-------------------------------------------------------------------------*
 |             SPSS DATA DEFINITION STATEMENTS FOR ICPSR 2876             |
 |                                                                        |
 |   LAW ENFORCEMENT AGENCY IDENTIFIERS CROSSWALK [UNITED STATES], 1996   |
 |                                                                        |
 |                        FIRST ICPSR EDITION                             |
 |                           FEBRUARY 2000                                |
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
 | MISSING VALUE RECODE:  Sets user-defined numeric missing values to     |
 | missing as interpreted by the SPSS system. Missing value recodes may   |
 | not be present for all variables in the data file.                     |
 |                                                                        |
 | NOTE:  Users should modify this SPSS setup to suit their specific      |
 | needs. MISSING VALUES and MISSING VALUE RECODE sections have been      |
 | marked by SPSS comment statements. To include these sections in a      |
 | final SPSS setup, users should remove the SPSS comment statements from |
 | the desired section(s).                                                |
 *------------------------------------------------------------------------.
                                                                           
* SPSS DATA LIST COMMMAND.                                                 
                                                                           
DATA LIST FILE="file-specification" /                                      
   SOURCE 1-1               STATE 2-3 (A)            UORI 4-11 (A)         
   UAGENCY 12-59 (A)        UCORI 60-60 (A)          UMULTICO 61-61 (A)    
   USTATENO 62-63           UCOUNTY 64-66            UCTYNAME 67-97 (A)    
   UMSA 98-100              UPOPGRP 101-102 (A)      UPOPCOV 103-111       
   UADD1 112-141 (A)        UADD2 142-171 (A)        UADD3 172-201 (A)     
   UADD4 202-231 (A)        UADD5 232-236            CSTATENO 237-238      
   CGOVIDNU 239-247         CGOVIDST 248-256 (A)     CGOVTYPE 257-258      
   CNAME 259-322 (A)        CPOP94 323-330           FSTATE 331-332        
   FCOUNTY 333-335          FPLACE 336-341           FMSA 342-345          
   FMSANAME 346-390 (A)     FCMSA 391-393.                                 
                                                                           
* SPSS VARIABLE LABELS COMMAND.                                            
                                                                           
VARIABLE LABELS                                                            
   SOURCE "SOURCE OF THE RECORD"                                           
   STATE "CHARACTER STATE ABBREVIATION"                                    
   UORI "UCR: ORIGINATING AGENCY IDENTIFIER"                               
   UAGENCY "UCR: AGENCY NAME"                                              
   UCORI "UCR: AGENCY COVERED BY ANOTHER ORI FLAG"                         
   UMULTICO "UCR: MULTIPLE COUNTY FLAG"                                    
   USTATENO "UCR: STATE CODE"                                              
   UCOUNTY "UCR: COUNTY CODE"                                              
   UCTYNAME "UCR: COUNTY NAME"                                             
   UMSA "UCR: METROPOLITAN STATISTICAL AREA"                               
   UPOPGRP "UCR: POPULATION GROUP CODE"                                    
   UPOPCOV "UCR: POPULATION COVERED"                                       
   UADD1 "UCR: REPORTING AGENCY ADDRESS FIELD #1"                          
   UADD2 "UCR: REPORTING AGENCY ADDRESS FIELD #2"                          
   UADD3 "UCR: REPORTING AGENCY ADDRESS FIELD #3"                          
   UADD4 "UCR: REPORTING AGENCY ADDRESS FIELD #4"                          
   UADD5 "UCR: REPORTING AGENCY ZIP CODE"                                  
   CSTATENO "BOC: GOVERNMENTS DIVISION STATE NUMBER"                       
   CGOVIDNU "BOC: GOVERNMENT ID (NUMERIC)"                                 
   CGOVIDST "BOC: GOVERNMENT ID (STRING)"                                  
   CGOVTYPE "BOC: CENSUS GOVT TYPE (OR BJS ASSIGNED)"                      
   CNAME "BOC: GOVERNMENT NAME"                                            
   CPOP94 "BOC: POPULATION 1994"                                           
   FSTATE "FIPS: STATE CODE"                                               
   FCOUNTY "FIPS: COUNTY CODE"                                             
   FPLACE "FIPS: PLACE CODE"                                               
   FMSA "FIPS: METROPOLITAN STATISTICAL AREA CODE"                         
   FMSANAME "FIPS: MSA NAME"                                               
   FCMSA "FIPS: CONSOLIDATED METROPOLITAN STATISTICAL AREA".               
                                                                           
* SPSS VALUE LABELS COMMAND.                                               
                                                                           
VALUE LABELS                                                               
   SOURCE                                                                  
   0 "Other"                                                               
   1 "UCR only"                                                            
   2 "DLEA only"                                                           
   3 "UCR and DLEA" /                                                      
   UORI                                                                    
   "M"  "Unknown" /                                                        
   UCORI                                                                   
   "*"  "ORI rpts thru other ORI" /                                        
   UMULTICO                                                                
   "*"  "ORI in > 1 county" /                                              
   USTATENO                                                                
   1 "Alabama"                                                             
   2 "Arizona"                                                             
   3 "Arkansas"                                                            
   4 "California"                                                          
   5 "Colorado"                                                            
   6 "Connecticut"                                                         
   7 "Delaware"                                                            
   8 "District of Columbia"                                                
   9 "Florida"                                                             
   10 "Georgia"                                                            
   11 "Idaho"                                                              
   12 "Illinois"                                                           
   13 "Indiana"                                                            
   14 "Iowa"                                                               
   15 "Kansas"                                                             
   16 "Kentucky"                                                           
   17 "Louisiana"                                                          
   18 "Maine"                                                              
   19 "Maryland"                                                           
   20 "Massachusetts"                                                      
   21 "Michigan"                                                           
   22 "Minnesota"                                                          
   23 "Mississippi"                                                        
   24 "Missouri"                                                           
   25 "Montana"                                                            
   26 "Nebraska"                                                           
   27 "Nevada"                                                             
   28 "New Hampshire"                                                      
   29 "New Jersey"                                                         
   30 "New Mexico"                                                         
   31 "New York"                                                           
   32 "North Carolina"                                                     
   33 "North Dakota"                                                       
   34 "Ohio"                                                               
   35 "Oklahoma"                                                           
   36 "Oregon"                                                             
   37 "Pennsylvania"                                                       
   38 "Rhode Island"                                                       
   39 "South Carolina"                                                     
   40 "South Dakota"                                                       
   41 "Tennessee"                                                          
   42 "Texas"                                                              
   43 "Utah"                                                               
   44 "Vermont"                                                            
   45 "Virginia"                                                           
   46 "Washington"                                                         
   47 "West Virginia"                                                      
   48 "Wisconsin"                                                          
   49 "Wyoming"                                                            
   50 "Alaska"                                                             
   51 "Hawaii"                                                             
   52 "Canal Zone"                                                         
   53 "Puerto Rico"                                                        
   55 "Guam" /                                                             
   UCOUNTY                                                                 
   0 "Inap"                                                                
   999 "Unknown" /                                                         
   UMSA                                                                    
   0 "Inap"                                                                
   999 "Unknown/ not an MSA" /                                             
   UPOPGRP                                                                 
   "M"  "Unknown"                                                          
   "0"  "Possessions"                                                      
   "1"  "All cities 250,000 or over"                                       
   "1A"  "Cities 1,000,000 or over"                                        
   "1B"  "Cities from 500,000 thru 999,000"                                
   "1C"  "Cities from 250,000 thru 499,999"                                
   "2"  "Cities from 100,000 thru 249,000"                                 
   "3"  "Cities from 50,000 thru 99,999"                                   
   "4"  "Cities from 25,000 thru 49,999"                                   
   "5"  "Cities from 10,000 thru 24,999"                                   
   "6"  "Cities from 2,500 thru 9,999"                                     
   "7"  "Cities under 2,500"                                               
   "8"  "Non-MSA counties"                                                 
   "8A"  "Non-MSA counties 100,000 or over"                                
   "8B"  "Non-MSA counties from 25,000 thru 99,999"                        
   "8C"  "Non-MSA counties from 10,000 thru 24,999"                        
   "8D"  "Non-MSA counties under 10,000"                                   
   "8E"  "Non-MSA State Police"                                            
   "9"  "MSA counties"                                                     
   "9A"  "MSA counties 100,000 or over"                                    
   "9B"  "MSA counties from 25,000 thru 99,999"                            
   "9C"  "MSA counties from 10,000 thru 24,999"                            
   "9D"  "MSA counties under 10,000"                                       
   "9E"  "MSA State Police" /                                              
   UPOPCOV                                                                 
   9999999 "Unknown" /                                                     
   UADD5                                                                   
   99999 "Unknown" /                                                       
   CSTATENO                                                                
   1 "Alabama"                                                             
   2 "Alaska"                                                              
   3 "Arizona"                                                             
   4 "Arkansas"                                                            
   5 "California"                                                          
   6 "Colorado"                                                            
   7 "Connecticut"                                                         
   8 "Delaware"                                                            
   9 "District of Columbia"                                                
   10 "Florida"                                                            
   11 "Georgia"                                                            
   12 "Hawaii"                                                             
   13 "Idaho"                                                              
   14 "Illinois"                                                           
   15 "Indiana"                                                            
   16 "Iowa"                                                               
   17 "Kansas"                                                             
   18 "Kentucky"                                                           
   19 "Louisiana"                                                          
   20 "Maine"                                                              
   21 "Maryland"                                                           
   22 "Massachusetts"                                                      
   23 "Michigan"                                                           
   24 "Minnesota"                                                          
   25 "Mississippi"                                                        
   26 "Missouri"                                                           
   27 "Montana"                                                            
   28 "Nebraska"                                                           
   29 "Nevada"                                                             
   30 "New Hampshire"                                                      
   31 "New Jersey"                                                         
   32 "New Mexico"                                                         
   33 "New York"                                                           
   34 "North Carolina"                                                     
   35 "North Dakota"                                                       
   36 "Ohio"                                                               
   37 "Oklahoma"                                                           
   38 "Oregon"                                                             
   39 "Pennsylvania"                                                       
   40 "Rhode Island"                                                       
   41 "South Carolina"                                                     
   42 "South Dakota"                                                       
   43 "Tennessee"                                                          
   44 "Texas"                                                              
   45 "Utah"                                                               
   46 "Vermont"                                                            
   47 "Virginia"                                                           
   48 "Washington"                                                         
   49 "West Virginia"                                                      
   50 "Wisconsin"                                                          
   51 "Wyoming"                                                            
   52 "American Samoa"                                                     
   53 "Guam"                                                               
   54 "Northern Mariana Islands"                                           
   55 "Puerto Rico"                                                        
   56 "Virgin Islands"                                                     
   57 "Canal Zone" /                                                       
   CGOVIDNU                                                                
   999999999 "Unknown" /                                                   
   CGOVTYPE                                                                
   0 "State"                                                               
   1 "County"                                                              
   2 "Municipal"                                                           
   3 "Township"                                                            
   4 "Special district"                                                    
   5 "Independent school district"                                         
   6 "Federal agency"                                                      
   7 "Tribal"                                                              
   8 "Railroad police"                                                     
   9 "College/university"                                                  
   99 "Unknown" /                                                          
   CPOP94                                                                  
   99999999 "Unknown" /                                                    
   FSTATE                                                                  
   1 "Alabama"                                                             
   2 "Alaska"                                                              
   4 "Arizona"                                                             
   5 "Arkansas"                                                            
   6 "California"                                                          
   8 "Colorado"                                                            
   9 "Connecticut"                                                         
   10 "Delaware"                                                           
   11 "District of Columbia"                                               
   12 "Florida"                                                            
   13 "Georgia"                                                            
   15 "Hawaii"                                                             
   16 "Idaho"                                                              
   17 "Illinois"                                                           
   18 "Indiana"                                                            
   19 "Iowa"                                                               
   20 "Kansas"                                                             
   21 "Kentucky"                                                           
   22 "Louisiana"                                                          
   23 "Maine"                                                              
   24 "Maryland"                                                           
   25 "Massachusetts"                                                      
   26 "Michigan"                                                           
   27 "Minnesota"                                                          
   28 "Mississippi"                                                        
   29 "Missouri"                                                           
   30 "Montana"                                                            
   31 "Nebraska"                                                           
   32 "Nevada"                                                             
   33 "New Hampshire"                                                      
   34 "New Jersey"                                                         
   35 "New Mexico"                                                         
   36 "New York"                                                           
   37 "North Carolina"                                                     
   38 "North Dakota"                                                       
   39 "Ohio"                                                               
   40 "Oklahoma"                                                           
   41 "Oregon"                                                             
   42 "Pennsylvania"                                                       
   44 "Rhode Island"                                                       
   45 "South Carolina"                                                     
   46 "South Dakota"                                                       
   47 "Tennessee"                                                          
   48 "Texas"                                                              
   49 "Utah"                                                               
   50 "Vermont"                                                            
   51 "Virginia"                                                           
   53 "Washington"                                                         
   54 "West Virginia"                                                      
   55 "Wisconsin"                                                          
   56 "Wyoming"                                                            
   66 "Guam"                                                               
   72 "Puerto Rico"                                                        
   99 "Unknown" /                                                          
   FCOUNTY                                                                 
   999 "Unknown" /                                                         
   FPLACE                                                                  
   97000 "Tribes"                                                          
   98000 "State HQ"                                                        
   999999 "Unknown" /                                                      
   FMSA                                                                    
   9999 "Unknown/ no MSA" /                                                
   FCMSA                                                                   
   999 "Unknown" /.                                                        
                                                                           
* SPSS MISSING VALUES COMMAND.                                             
                                                                           
* MISSING VALUES                                                           
   UORI ('')                           UCOUNTY (999)                       
   UMSA (999)                          UPOPGRP ('')                        
   UADD5 (99999)                       CGOVIDNU (999999999)                
   CGOVTYPE (99)                       FSTATE (99)                         
   FCOUNTY (999)                       FPLACE (999999)                     
   FMSA (9999)                         FCMSA (999).                        
                                                                           
                                                                           
execute.                                                                   
