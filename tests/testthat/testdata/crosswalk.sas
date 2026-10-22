*-------------------------------------------------------------------------*
|              SAS DATA DEFINITION STATEMENTS FOR ICPSR 2876              |
|                                                                         |
|    LAW ENFORCEMENT AGENCY IDENTIFIERS CROSSWALK [UNITED STATES], 1996   |
|                                                                         |
|                         FIRST ICPSR EDITION                             |
|                            FEBRUARY 2000                                |
|                                                                         |
|                                                                         |
| This SAS setup file contains the following statements:                  |
|                                                                         |
| PROC FORMAT:  Creates user-defined formats. Formats replace original    |
| value codes with value code descriptions. Formats may not be present    |
| for all variables in the data file.                                     |
|                                                                         |
| DATA:  Begins a SAS data step and names an output SAS data set.         |
|                                                                         |
| INFILE:  Specifies the input data file to be read with the input        |
| statement. Users must replace "file-specification" with a complete      |
| statement of the location of the data file.                             |
|                                                                         |
| INPUT:  Assigns the name, type, decimal specification (if any), and     |
| identifies variable beginning and ending column locations.              |
|                                                                         |
| LABEL:  Assigns descriptive labels to variables. Variable labels and    |
| variable names may be identical for certain variables.                  |
|                                                                         |
| FORMAT:  Associates the formats created by the PROC FORMAT step with    |
| the variables named in the INPUT statement. Format statements may not   |
| be present for all variables in the data file.                          |
|                                                                         |
| MISSING VALUE RECODES:  Sets user-defined numeric missing values to     |
| missing as interpreted by the SAS system. Missing value recodes may not |
| be present for all variables in the data file.                          |
|                                                                         |
| NOTE:  Users should modify this SAS setup file to suit their specific   |
| needs. PROC FORMAT, FORMAT, and MISSING VALUE RECODES sections have     |
| been marked by SAS comment statements. To include these sections in a   |
| final SAS setup, users should remove the SAS comment statements from    |
| the desired section(s).                                                 |
*-------------------------------------------------------------------------;
                                                                           
* SAS PROC FORMAT;                                                         
                                                                           
/*                                                                         
PROC FORMAT;                                                               
   VALUE V1FT (MAX=40)                                                     
   0 = "Other"                                                             
   1 = "UCR only"                                                          
   2 = "DLEA only"                                                         
   3 = "UCR and DLEA";                                                     
   VALUE $V3FT                                                             
   "M" = "Unknown";                                                        
   VALUE $V5FT                                                             
   "*" = "ORI rpts thru other ORI";                                        
   VALUE $V6FT                                                             
   "*" = "ORI in > 1 county";                                              
   VALUE V7FT (MAX=40)                                                     
   1 = "Alabama"                                                           
   2 = "Arizona"                                                           
   3 = "Arkansas"                                                          
   4 = "California"                                                        
   5 = "Colorado"                                                          
   6 = "Connecticut"                                                       
   7 = "Delaware"                                                          
   8 = "District of Columbia"                                              
   9 = "Florida"                                                           
   10 = "Georgia"                                                          
   11 = "Idaho"                                                            
   12 = "Illinois"                                                         
   13 = "Indiana"                                                          
   14 = "Iowa"                                                             
   15 = "Kansas"                                                           
   16 = "Kentucky"                                                         
   17 = "Louisiana"                                                        
   18 = "Maine"                                                            
   19 = "Maryland"                                                         
   20 = "Massachusetts"                                                    
   21 = "Michigan"                                                         
   22 = "Minnesota"                                                        
   23 = "Mississippi"                                                      
   24 = "Missouri"                                                         
   25 = "Montana"                                                          
   26 = "Nebraska"                                                         
   27 = "Nevada"                                                           
   28 = "New Hampshire"                                                    
   29 = "New Jersey"                                                       
   30 = "New Mexico"                                                       
   31 = "New York"                                                         
   32 = "North Carolina"                                                   
   33 = "North Dakota"                                                     
   34 = "Ohio"                                                             
   35 = "Oklahoma"                                                         
   36 = "Oregon"                                                           
   37 = "Pennsylvania"                                                     
   38 = "Rhode Island"                                                     
   39 = "South Carolina"                                                   
   40 = "South Dakota"                                                     
   41 = "Tennessee"                                                        
   42 = "Texas"                                                            
   43 = "Utah"                                                             
   44 = "Vermont"                                                          
   45 = "Virginia"                                                         
   46 = "Washington"                                                       
   47 = "West Virginia"                                                    
   48 = "Wisconsin"                                                        
   49 = "Wyoming"                                                          
   50 = "Alaska"                                                           
   51 = "Hawaii"                                                           
   52 = "Canal Zone"                                                       
   53 = "Puerto Rico"                                                      
   55 = "Guam";                                                            
   VALUE V8FT (MAX=40)                                                     
   0 = "Inap"                                                              
   999 = "Unknown";                                                        
   VALUE V10FT (MAX=40)                                                    
   0 = "Inap"                                                              
   999 = "Unknown/ not an MSA";                                            
   VALUE $V11FT                                                            
   "M" = "Unknown"                                                         
   "0" = "Possessions"                                                     
   "1" = "All cities 250,000 or over"                                      
   "1A" = "Cities 1,000,000 or over"                                       
   "1B" = "Cities from 500,000 thru 999,000"                               
   "1C" = "Cities from 250,000 thru 499,999"                               
   "2" = "Cities from 100,000 thru 249,000"                                
   "3" = "Cities from 50,000 thru 99,999"                                  
   "4" = "Cities from 25,000 thru 49,999"                                  
   "5" = "Cities from 10,000 thru 24,999"                                  
   "6" = "Cities from 2,500 thru 9,999"                                    
   "7" = "Cities under 2,500"                                              
   "8" = "Non-MSA counties"                                                
   "8A" = "Non-MSA counties 100,000 or over"                               
   "8B" = "Non-MSA counties from 25,000 thru 99,999"                       
   "8C" = "Non-MSA counties from 10,000 thru 24,999"                       
   "8D" = "Non-MSA counties under 10,000"                                  
   "8E" = "Non-MSA State Police"                                           
   "9" = "MSA counties"                                                    
   "9A" = "MSA counties 100,000 or over"                                   
   "9B" = "MSA counties from 25,000 thru 99,999"                           
   "9C" = "MSA counties from 10,000 thru 24,999"                           
   "9D" = "MSA counties under 10,000"                                      
   "9E" = "MSA State Police";                                              
   VALUE V12FT (MAX=40)                                                    
   9999999 = "Unknown";                                                    
   VALUE V17FT (MAX=40)                                                    
   99999 = "Unknown";                                                      
   VALUE V18FT (MAX=40)                                                    
   1 = "Alabama"                                                           
   2 = "Alaska"                                                            
   3 = "Arizona"                                                           
   4 = "Arkansas"                                                          
   5 = "California"                                                        
   6 = "Colorado"                                                          
   7 = "Connecticut"                                                       
   8 = "Delaware"                                                          
   9 = "District of Columbia"                                              
   10 = "Florida"                                                          
   11 = "Georgia"                                                          
   12 = "Hawaii"                                                           
   13 = "Idaho"                                                            
   14 = "Illinois"                                                         
   15 = "Indiana"                                                          
   16 = "Iowa"                                                             
   17 = "Kansas"                                                           
   18 = "Kentucky"                                                         
   19 = "Louisiana"                                                        
   20 = "Maine"                                                            
   21 = "Maryland"                                                         
   22 = "Massachusetts"                                                    
   23 = "Michigan"                                                         
   24 = "Minnesota"                                                        
   25 = "Mississippi"                                                      
   26 = "Missouri"                                                         
   27 = "Montana"                                                          
   28 = "Nebraska"                                                         
   29 = "Nevada"                                                           
   30 = "New Hampshire"                                                    
   31 = "New Jersey"                                                       
   32 = "New Mexico"                                                       
   33 = "New York"                                                         
   34 = "North Carolina"                                                   
   35 = "North Dakota"                                                     
   36 = "Ohio"                                                             
   37 = "Oklahoma"                                                         
   38 = "Oregon"                                                           
   39 = "Pennsylvania"                                                     
   40 = "Rhode Island"                                                     
   41 = "South Carolina"                                                   
   42 = "South Dakota"                                                     
   43 = "Tennessee"                                                        
   44 = "Texas"                                                            
   45 = "Utah"                                                             
   46 = "Vermont"                                                          
   47 = "Virginia"                                                         
   48 = "Washington"                                                       
   49 = "West Virginia"                                                    
   50 = "Wisconsin"                                                        
   51 = "Wyoming"                                                          
   52 = "American Samoa"                                                   
   53 = "Guam"                                                             
   54 = "Northern Mariana Islands"                                         
   55 = "Puerto Rico"                                                      
   56 = "Virgin Islands"                                                   
   57 = "Canal Zone";                                                      
   VALUE V19FT (MAX=40)                                                    
   999999999 = "Unknown";                                                  
   VALUE V21FT (MAX=40)                                                    
   0 = "State"                                                             
   1 = "County"                                                            
   2 = "Municipal"                                                         
   3 = "Township"                                                          
   4 = "Special district"                                                  
   5 = "Independent school district"                                       
   6 = "Federal agency"                                                    
   7 = "Tribal"                                                            
   8 = "Railroad police"                                                   
   9 = "College/university"                                                
   99 = "Unknown";                                                         
   VALUE V23FT (MAX=40)                                                    
   99999999 = "Unknown";                                                   
   VALUE V24FT (MAX=40)                                                    
   1 = "Alabama"                                                           
   2 = "Alaska"                                                            
   4 = "Arizona"                                                           
   5 = "Arkansas"                                                          
   6 = "California"                                                        
   8 = "Colorado"                                                          
   9 = "Connecticut"                                                       
   10 = "Delaware"                                                         
   11 = "District of Columbia"                                             
   12 = "Florida"                                                          
   13 = "Georgia"                                                          
   15 = "Hawaii"                                                           
   16 = "Idaho"                                                            
   17 = "Illinois"                                                         
   18 = "Indiana"                                                          
   19 = "Iowa"                                                             
   20 = "Kansas"                                                           
   21 = "Kentucky"                                                         
   22 = "Louisiana"                                                        
   23 = "Maine"                                                            
   24 = "Maryland"                                                         
   25 = "Massachusetts"                                                    
   26 = "Michigan"                                                         
   27 = "Minnesota"                                                        
   28 = "Mississippi"                                                      
   29 = "Missouri"                                                         
   30 = "Montana"                                                          
   31 = "Nebraska"                                                         
   32 = "Nevada"                                                           
   33 = "New Hampshire"                                                    
   34 = "New Jersey"                                                       
   35 = "New Mexico"                                                       
   36 = "New York"                                                         
   37 = "North Carolina"                                                   
   38 = "North Dakota"                                                     
   39 = "Ohio"                                                             
   40 = "Oklahoma"                                                         
   41 = "Oregon"                                                           
   42 = "Pennsylvania"                                                     
   44 = "Rhode Island"                                                     
   45 = "South Carolina"                                                   
   46 = "South Dakota"                                                     
   47 = "Tennessee"                                                        
   48 = "Texas"                                                            
   49 = "Utah"                                                             
   50 = "Vermont"                                                          
   51 = "Virginia"                                                         
   53 = "Washington"                                                       
   54 = "West Virginia"                                                    
   55 = "Wisconsin"                                                        
   56 = "Wyoming"                                                          
   66 = "Guam"                                                             
   72 = "Puerto Rico"                                                      
   99 = "Unknown";                                                         
   VALUE V25FT (MAX=40)                                                    
   999 = "Unknown";                                                        
   VALUE V26FT (MAX=40)                                                    
   97000 = "Tribes"                                                        
   98000 = "State HQ"                                                      
   999999 = "Unknown";                                                     
   VALUE V27FT (MAX=40)                                                    
   9999 = "Unknown/ no MSA";                                               
   VALUE V29FT (MAX=40)                                                    
   999 = "Unknown";                                                        
*/                                                                         
                                                                           
* SAS DATA, INFILE, INPUT STATEMENTS;                                      
                                                                           
DATA;                                                                      
INFILE "file-specification" LRECL=393;                                     
INPUT                                                                      
   SOURCE 1-1               STATE $ 2-3              UORI $ 4-11           
   UAGENCY $ 12-59          UCORI $ 60-60            UMULTICO $ 61-61      
   USTATENO 62-63           UCOUNTY 64-66            UCTYNAME $ 67-97      
   UMSA 98-100              UPOPGRP $ 101-102        UPOPCOV 103-111       
   UADD1 $ 112-141          UADD2 $ 142-171          UADD3 $ 172-201       
   UADD4 $ 202-231          UADD5 232-236            CSTATENO 237-238      
   CGOVIDNU 239-247         CGOVIDST $ 248-256       CGOVTYPE 257-258      
   CNAME $ 259-322          CPOP94 323-330           FSTATE 331-332        
   FCOUNTY 333-335          FPLACE 336-341           FMSA 342-345          
   FMSANAME $ 346-390       FCMSA 391-393;                                 
                                                                           
* SAS LABEL STATEMENT;                                                     
                                                                           
LABEL                                                                      
   SOURCE = "SOURCE OF THE RECORD"                                         
   STATE = "CHARACTER STATE ABBREVIATION"                                  
   UORI = "UCR: ORIGINATING AGENCY IDENTIFIER"                             
   UAGENCY = "UCR: AGENCY NAME"                                            
   UCORI = "UCR: AGENCY COVERED BY ANOTHER ORI FLAG"                       
   UMULTICO = "UCR: MULTIPLE COUNTY FLAG"                                  
   USTATENO = "UCR: STATE CODE"                                            
   UCOUNTY = "UCR: COUNTY CODE"                                            
   UCTYNAME = "UCR: COUNTY NAME"                                           
   UMSA = "UCR: METROPOLITAN STATISTICAL AREA"                             
   UPOPGRP = "UCR: POPULATION GROUP CODE"                                  
   UPOPCOV = "UCR: POPULATION COVERED"                                     
   UADD1 = "UCR: REPORTING AGENCY ADDRESS FIELD #1"                        
   UADD2 = "UCR: REPORTING AGENCY ADDRESS FIELD #2"                        
   UADD3 = "UCR: REPORTING AGENCY ADDRESS FIELD #3"                        
   UADD4 = "UCR: REPORTING AGENCY ADDRESS FIELD #4"                        
   UADD5 = "UCR: REPORTING AGENCY ZIP CODE"                                
   CSTATENO = "BOC: GOVERNMENTS DIVISION STATE NUMBER"                     
   CGOVIDNU = "BOC: GOVERNMENT ID (NUMERIC)"                               
   CGOVIDST = "BOC: GOVERNMENT ID (STRING)"                                
   CGOVTYPE = "BOC: CENSUS GOVT TYPE (OR BJS ASSIGNED)"                    
   CNAME = "BOC: GOVERNMENT NAME"                                          
   CPOP94 = "BOC: POPULATION 1994"                                         
   FSTATE = "FIPS: STATE CODE"                                             
   FCOUNTY = "FIPS: COUNTY CODE"                                           
   FPLACE = "FIPS: PLACE CODE"                                             
   FMSA = "FIPS: METROPOLITAN STATISTICAL AREA CODE"                       
   FMSANAME = "FIPS: MSA NAME"                                             
   FCMSA = "FIPS: CONSOLIDATED METROPOLITAN STATISTI";                     
                                                                           
* SAS FORMAT STATEMENT;                                                    
                                                                           
/*                                                                         
FORMAT                                                                     
   SOURCE V1FT.           UORI $V3FT.            UCORI $V5FT.              
   UMULTICO $V6FT.        USTATENO V7FT.         UCOUNTY V8FT.             
   UMSA V10FT.            UPOPGRP $V11FT.        UPOPCOV V12FT.            
   UADD5 V17FT.           CSTATENO V18FT.        CGOVIDNU V19FT.           
   CGOVTYPE V21FT.        CPOP94 V23FT.          FSTATE V24FT.             
   FCOUNTY V25FT.         FPLACE V26FT.          FMSA V27FT.               
   FCMSA V29FT.;                                                           
*/                                                                         
                                                                           
* USER-DEFINED MISSING VALUE RECODE TO SAS SYSMIS;                         
                                                                           
/*                                                                         
   IF UORI='' THEN UORI= " ";          IF UCOUNTY=999 THEN UCOUNTY=.;      
   IF UMSA=999 THEN UMSA=.;            IF UPOPGRP='' THEN UPOPGRP= " ";    
   IF UADD5=99999 THEN UADD5=.;                                            
   IF CGOVIDNU=999999999 THEN CGOVIDNU=.;                                  
   IF CGOVTYPE=99 THEN CGOVTYPE=.;     IF FSTATE=99 THEN FSTATE=.;         
   IF FCOUNTY=999 THEN FCOUNTY=.;      IF FPLACE=999999 THEN FPLACE=.;     
   IF FMSA=9999 THEN FMSA=.;           IF FCMSA=999 THEN FCMSA=.;          
                                                                           
*/                                                                         
