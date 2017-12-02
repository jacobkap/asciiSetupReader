*-------------------------------------------------------------------------*
|              SAS DATA DEFINITION STATEMENTS FOR ICPSR 4188              |
|                                                                         |
|          UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES]:          |
|              OFFENSES KNOWN AND CLEARANCES BY ARREST, 1960              |
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
   1 = "Offenses known";                                                   
   VALUE V2FT (MAX=40)                                                     
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
   54 = "American Samoa"                                                   
   55 = "Guam"                                                             
   62 = "Virgin Islands";                                                  
   VALUE $V4FT                                                             
   "0" = "Possessions"                                                     
   "1" = "ALL cit 250,000 +"                                               
   "1A" = "Cit 1,000,000 +"                                                
   "1B" = "Cit 500,000-999,999"                                            
   "1C" = "Cit 250,000-499,999"                                            
   "2" = "Cit 100,000-249,999"                                             
   "3" = "Cit 50,000-99,999"                                               
   "4" = "Cit 25,000-49,999"                                               
   "5" = "Cit 10,000-24,999"                                               
   "6" = "Cit 2,500-9,999"                                                 
   "7" = "Cit < 2,500"                                                     
   "8" = "Non-MSA co."                                                     
   "8A" = "Non-MSA co. 100,000 +"                                          
   "8B" = "Non-MSA co. 25,000-99,999"                                      
   "8C" = "Non-MSA co. 10,000-24,999"                                      
   "8D" = "Non-MSA co. < 10,000"                                           
   "8E" = "Non-MSA St Police"                                              
   "9" = "MSA counties"                                                    
   "9A" = "MSA co. 100,000 +"                                              
   "9B" = "MSA co. 25,000-99,999"                                          
   "9C" = "MSA co. 10,000-24,999"                                          
   "9D" = "MSA co. < 10,000"                                               
   "9E" = "MSA St Police";                                                 
   VALUE V5FT (MAX=40)                                                     
   0 = "Possessions"                                                       
   1 = "New Eng1and States"                                                
   2 = "Middle Atlantic States"                                            
   3 = "East North Central States"                                         
   4 = "West North Central States"                                         
   5 = "South Atlantic States"                                             
   6 = "East South Central States"                                         
   7 = "West South Central States"                                         
   8 = "Mountain States"                                                   
   9 = "Pacific States";                                                   
   VALUE $V8FT                                                             
   "N" = "No, not core city of MSA"                                        
   "Y" = "Yes, core city of MSA";                                          
   VALUE V12FT (MAX=40)                                                    
   0 = "No months reported"                                                
   1 = "Jan last reported"                                                 
   2 = "Feb last reported"                                                 
   3 = "March last reported"                                               
   4 = "April last reported"                                               
   5 = "May last reported"                                                 
   6 = "June last reported"                                                
   7 = "July last reported"                                                
   8 = "August last reported"                                              
   9 = "Sep last reported"                                                 
   10 = "Oct last reported"                                                
   11 = "Nov last reported"                                                
   12 = "Dec last reported";                                               
   VALUE V13FT (MAX=40)                                                    
   0 = "US Park &  State Police"                                           
   1 = "All other agencies";                                               
   VALUE $V23FT                                                            
   "N" = "No, do not send a follow-up"                                     
   "Y" = "Yes, send a follow-up";                                          
   VALUE V24FT (MAX=40)                                                    
   0 = "Not special mail group agency"                                     
   1 = "Return sent to another agency"                                     
   2 = "Small city sent a large city form"                                 
   7 = "Agency-non-contributor, not sent form"                             
   9 = "Agency-contributor, not on mail list";                             
   VALUE $V25FT                                                            
   "N" = "Not a special mailing address"                                   
   "Y" = "Special mailing address";                                        
   VALUE V33FT (MAX=40)                                                    
   0 = "Jan not w oth month"                                               
   1 = "Reported with Jan"                                                 
   2 = "Reported with Feb"                                                 
   3 = "Reported with Mar"                                                 
   4 = "Reported with Apr"                                                 
   5 = "Reported with May"                                                 
   6 = "Reported with Jun"                                                 
   7 = "Reported with Jul"                                                 
   8 = "Reported with Aug"                                                 
   9 = "Reported with Sep"                                                 
   10 = "Reported with Oct"                                                
   11 = "Reported with Nov"                                                
   12 = "Reported with Dec";                                               
   VALUE V34FT (MAX=40)                                                    
   0 = "Not updated";                                                      
   VALUE V35FT (MAX=40)                                                    
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V36FT (MAX=40)                                                    
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V37FT (MAX=40)                                                    
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V38FT (MAX=40)                                                    
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V39FT (MAX=40)                                                    
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE $V40FT                                                            
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V41FT                                                            
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V42FT                                                            
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V43FT                                                            
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE V151FT (MAX=40)                                                   
   0 = "Feb not w oth month"                                               
   1 = "Reported with Jan"                                                 
   2 = "Reported with Feb"                                                 
   3 = "Reported with Mar"                                                 
   4 = "Reported with Apr"                                                 
   5 = "Reported with May"                                                 
   6 = "Reported with Jun"                                                 
   7 = "Reported with Jul"                                                 
   8 = "Reported with Aug"                                                 
   9 = "Reported with Sep"                                                 
   10 = "Reported with Oct"                                                
   11 = "Reported with Nov"                                                
   12 = "Reported with Dec";                                               
   VALUE V152FT (MAX=40)                                                   
   0 = "Not updated";                                                      
   VALUE V153FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V154FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V155FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V156FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V157FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE $V158FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V159FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V160FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V161FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE V269FT (MAX=40)                                                   
   0 = "Mar not w oth month"                                               
   1 = "Reported with Jan"                                                 
   2 = "Reported with Feb"                                                 
   3 = "Reported with Mar"                                                 
   4 = "Reported with Apr"                                                 
   5 = "Reported with May"                                                 
   6 = "Reported with Jun"                                                 
   7 = "Reported with Jul"                                                 
   8 = "Reported with Aug"                                                 
   9 = "Reported with Sep"                                                 
   10 = "Reported with Oct"                                                
   11 = "Reported with Nov"                                                
   12 = "Reported with Dec";                                               
   VALUE V270FT (MAX=40)                                                   
   0 = "Not updated";                                                      
   VALUE V271FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V272FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V273FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V274FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V275FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE $V276FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V277FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V278FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V279FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE V387FT (MAX=40)                                                   
   0 = "Apr not w oth month"                                               
   1 = "Reported with Jan"                                                 
   2 = "Reported with Feb"                                                 
   3 = "Reported with Mar"                                                 
   4 = "Reported with Apr"                                                 
   5 = "Reported with May"                                                 
   6 = "Reported with Jun"                                                 
   7 = "Reported with Jul"                                                 
   8 = "Reported with Aug"                                                 
   9 = "Reported with Sep"                                                 
   10 = "Reported with Oct"                                                
   11 = "Reported with Nov"                                                
   12 = "Reported with Dec";                                               
   VALUE V388FT (MAX=40)                                                   
   0 = "Not updated";                                                      
   VALUE V389FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V390FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V391FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V392FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V393FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE $V394FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V395FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V396FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V397FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE V505FT (MAX=40)                                                   
   0 = "May not w oth month"                                               
   1 = "Reported with Jan"                                                 
   2 = "Reported with Feb"                                                 
   3 = "Reported with Mar"                                                 
   4 = "Reported with Apr"                                                 
   5 = "Reported with May"                                                 
   6 = "Reported with Jun"                                                 
   7 = "Reported with Jul"                                                 
   8 = "Reported with Aug"                                                 
   9 = "Reported with Sep"                                                 
   10 = "Reported with Oct"                                                
   11 = "Reported with Nov"                                                
   12 = "Reported with Dec";                                               
   VALUE V506FT (MAX=40)                                                   
   0 = "Not updated";                                                      
   VALUE V507FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V508FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V509FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V510FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V511FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE $V512FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V513FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V514FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V515FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE V623FT (MAX=40)                                                   
   0 = "June not w oth month"                                              
   1 = "Reported with Jan"                                                 
   2 = "Reported with Feb"                                                 
   3 = "Reported with Mar"                                                 
   4 = "Reported with Apr"                                                 
   5 = "Reported with May"                                                 
   6 = "Reported with Jun"                                                 
   7 = "Reported with Jul"                                                 
   8 = "Reported with Aug"                                                 
   9 = "Reported with Sep"                                                 
   10 = "Reported with Oct"                                                
   11 = "Reported with Nov"                                                
   12 = "Reported with Dec";                                               
   VALUE V624FT (MAX=40)                                                   
   0 = "Not updated";                                                      
   VALUE V625FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V626FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V627FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V628FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V629FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE $V630FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V631FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V632FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V633FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE V741FT (MAX=40)                                                   
   0 = "July not w oth month"                                              
   1 = "Reported with Jan"                                                 
   2 = "Reported with Feb"                                                 
   3 = "Reported with Mar"                                                 
   4 = "Reported with Apr"                                                 
   5 = "Reported with May"                                                 
   6 = "Reported with Jun"                                                 
   7 = "Reported with Jul"                                                 
   8 = "Reported with Aug"                                                 
   9 = "Reported with Sep"                                                 
   10 = "Reported with Oct"                                                
   11 = "Reported with Nov"                                                
   12 = "Reported with Dec";                                               
   VALUE V742FT (MAX=40)                                                   
   0 = "Not updated";                                                      
   VALUE V743FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V744FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V745FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V746FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V747FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE $V748FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V749FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V750FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V751FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE V859FT (MAX=40)                                                   
   0 = "Aug not w oth month"                                               
   1 = "Reported with Jan"                                                 
   2 = "Reported with Feb"                                                 
   3 = "Reported with Mar"                                                 
   4 = "Reported with Apr"                                                 
   5 = "Reported with May"                                                 
   6 = "Reported with Jun"                                                 
   7 = "Reported with Jul"                                                 
   8 = "Reported with Aug"                                                 
   9 = "Reported with Sep"                                                 
   10 = "Reported with Oct"                                                
   11 = "Reported with Nov"                                                
   12 = "Reported with Dec";                                               
   VALUE V860FT (MAX=40)                                                   
   0 = "Not updated";                                                      
   VALUE V861FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V862FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V863FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V864FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V865FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE $V866FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V867FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V868FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V869FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE V977FT (MAX=40)                                                   
   0 = "Sep not w oth month"                                               
   1 = "Reported with Jan"                                                 
   2 = "Reported with Feb"                                                 
   3 = "Reported with Mar"                                                 
   4 = "Reported with Apr"                                                 
   5 = "Reported with May"                                                 
   6 = "Reported with Jun"                                                 
   7 = "Reported with Jul"                                                 
   8 = "Reported with Aug"                                                 
   9 = "Reported with Sep"                                                 
   10 = "Reported with Oct"                                                
   11 = "Reported with Nov"                                                
   12 = "Reported with Dec";                                               
   VALUE V978FT (MAX=40)                                                   
   0 = "Not updated";                                                      
   VALUE V979FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V980FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V981FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V982FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V983FT (MAX=40)                                                   
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE $V984FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V985FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V986FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V987FT                                                           
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE V1095FT (MAX=40)                                                  
   0 = "Oct not w oth month"                                               
   1 = "Reported with Jan"                                                 
   2 = "Reported with Feb"                                                 
   3 = "Reported with Mar"                                                 
   4 = "Reported with Apr"                                                 
   5 = "Reported with May"                                                 
   6 = "Reported with Jun"                                                 
   7 = "Reported with Jul"                                                 
   8 = "Reported with Aug"                                                 
   9 = "Reported with Sep"                                                 
   10 = "Reported with Oct"                                                
   11 = "Reported with Nov"                                                
   12 = "Reported with Dec";                                               
   VALUE V1096FT (MAX=40)                                                  
   0 = "Not updated";                                                      
   VALUE V1097FT (MAX=40)                                                  
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V1098FT (MAX=40)                                                  
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V1099FT (MAX=40)                                                  
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V1100FT (MAX=40)                                                  
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V1101FT (MAX=40)                                                  
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE $V1102FT                                                          
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V1103FT                                                          
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V1104FT                                                          
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V1105FT                                                          
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE V1213FT (MAX=40)                                                  
   0 = "Nov not w oth month"                                               
   1 = "Reported with Jan"                                                 
   2 = "Reported with Feb"                                                 
   3 = "Reported with Mar"                                                 
   4 = "Reported with Apr"                                                 
   5 = "Reported with May"                                                 
   6 = "Reported with Jun"                                                 
   7 = "Reported with Jul"                                                 
   8 = "Reported with Aug"                                                 
   9 = "Reported with Sep"                                                 
   10 = "Reported with Oct"                                                
   11 = "Reported with Nov"                                                
   12 = "Reported with Dec";                                               
   VALUE V1214FT (MAX=40)                                                  
   0 = "Not updated";                                                      
   VALUE V1215FT (MAX=40)                                                  
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V1216FT (MAX=40)                                                  
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V1217FT (MAX=40)                                                  
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V1218FT (MAX=40)                                                  
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V1219FT (MAX=40)                                                  
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE $V1220FT                                                          
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V1221FT                                                          
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V1222FT                                                          
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V1223FT                                                          
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE V1331FT (MAX=40)                                                  
   0 = "Dec not w oth month"                                               
   1 = "Reported with Jan"                                                 
   2 = "Reported with Feb"                                                 
   3 = "Reported with Mar"                                                 
   4 = "Reported with Apr"                                                 
   5 = "Reported with May"                                                 
   6 = "Reported with Jun"                                                 
   7 = "Reported with Jul"                                                 
   8 = "Reported with Aug"                                                 
   9 = "Reported with Sep"                                                 
   10 = "Reported with Oct"                                                
   11 = "Reported with Nov"                                                
   12 = "Reported with Dec";                                               
   VALUE V1332FT (MAX=40)                                                  
   0 = "Not updated";                                                      
   VALUE V1333FT (MAX=40)                                                  
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V1334FT (MAX=40)                                                  
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V1335FT (MAX=40)                                                  
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V1336FT (MAX=40)                                                  
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE V1337FT (MAX=40)                                                  
   0 = "Not updated"                                                       
   2 = "Adjustment"                                                        
   4 = "Not available"                                                     
   5 = "Normal return";                                                    
   VALUE $V1338FT                                                          
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V1339FT                                                          
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V1340FT                                                          
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
   VALUE $V1341FT                                                          
   " " = "No return received"                                              
   "0" = "Missing"                                                         
   "P" = "Breakdown offenses"                                              
   "T" = "Totals only";                                                    
*/                                                                         
                                                                           
* SAS DATA, INFILE, INPUT STATEMENTS;                                      
                                                                           
DATA;                                                                      
INFILE "file-specification" LRECL=1955;                                    
INPUT                                                                      
   V1 1-1                   V2 2-3                   V3 $ 4-10             
   V4 $ 11-12               V5 13-13                 V6 14-17              
   V7 18-22                 V8 $ 23-23               V9 $ 24-30            
   V10 31-37                V11 38-41                V12 42-43             
   V13 44-44                V14 45-51                V15 52-54             
   V16 55-57                V17 58-62                V18 63-65             
   V19 66-68                V20 69-72                V21 73-74             
   V22 75-77                V23 $ 78-78              V24 79-79             
   V25 $ 80-80              V26 $ 81-102             V27 $ 103-108         
   V28 $ 109-125            V29 $ 126-153            V30 $ 154-177         
   V31 $ 178-178            V32 179-183              V33 184-184           
   V34 185-191              V35 192-192              V36 193-193           
   V37 194-194              V38 195-195              V39 196-196           
   V40 $ 197-197            V41 $ 198-198            V42 $ 199-199         
   V43 $ 200-200            V44 201-201              V45 202-202           
   V46 203-203              V47 204-204              V48 205-205           
   V49 206-206              V50 207-207              V51 208-208           
   V52 209-209              V53 210-210              V54 211-211           
   V55 212-212              V56 213-213              V57 214-214           
   V58 215-215              V59 216-216              V60 217-217           
   V61 218-218              V62 219-219              V63 220-220           
   V64 221-221              V65 222-222              V66 223-223           
   V67 224-224              V68 225-225              V69 226-226           
   V70 227-228              V71 229-230              V72 231-232           
   V73 233-233              V74 234-234              V75 235-237           
   V76 238-238              V77 239-239              V78 240-240           
   V79 241-241              V80 242-244              V81 245-245           
   V82 246-246              V83 247-247              V84 248-248           
   V85 249-249              V86 250-253              V87 254-254           
   V88 255-255              V89 256-256              V90 257-260           
   V91 261-264              V92 265-268              V93 269-269           
   V94 270-270              V95 271-275              V96 276-276           
   V97 277-277              V98 278-278              V99 279-279           
   V100 280-280             V101 281-281             V102 282-282          
   V103 283-283             V104 284-284             V105 285-285          
   V106 286-286             V107 287-287             V108 288-288          
   V109 289-289             V110 290-290             V111 291-291          
   V112 292-292             V113 293-293             V114 294-294          
   V115 295-295             V116 296-296             V117 297-297          
   V118 298-298             V119 299-299             V120 300-300          
   V121 301-301             V122 302-302             V123 303-303          
   V124 304-304             V125 305-305             V126 306-306          
   V127 307-307             V128 308-308             V129 309-309          
   V130 310-310             V131 311-311             V132 312-312          
   V133 313-313             V134 314-314             V135 315-315          
   V136 316-316             V137 317-317             V138 318-318          
   V139 319-319             V140 320-320             V141 321-321          
   V142 322-322             V143 323-323             V144 324-324          
   V145 325-325             V146 326-326             V147 327-327          
   V148 328-328             V149 329-329             V150 330-330          
   V151 331-331             V152 332-338             V153 339-339          
   V154 340-340             V155 341-341             V156 342-342          
   V157 343-343             V158 $ 344-344           V159 $ 345-345        
   V160 $ 346-346           V161 $ 347-347           V162 348-348          
   V163 349-349             V164 350-350             V165 351-351          
   V166 352-352             V167 353-353             V168 354-354          
   V169 355-355             V170 356-356             V171 357-357          
   V172 358-358             V173 359-359             V174 360-360          
   V175 361-361             V176 362-362             V177 363-363          
   V178 364-364             V179 365-365             V180 366-366          
   V181 367-367             V182 368-368             V183 369-369          
   V184 370-370             V185 371-371             V186 372-372          
   V187 373-373             V188 374-375             V189 376-377          
   V190 378-379             V191 380-380             V192 381-381          
   V193 382-384             V194 385-385             V195 386-386          
   V196 387-387             V197 388-388             V198 389-391          
   V199 392-392             V200 393-393             V201 394-394          
   V202 395-395             V203 396-396             V204 397-400          
   V205 401-401             V206 402-402             V207 403-403          
   V208 404-407             V209 408-411             V210 412-415          
   V211 416-416             V212 417-417             V213 418-422          
   V214 423-423             V215 424-424             V216 425-425          
   V217 426-426             V218 427-427             V219 428-428          
   V220 429-429             V221 430-430             V222 431-431          
   V223 432-432             V224 433-433             V225 434-434          
   V226 435-435             V227 436-436             V228 437-437          
   V229 438-438             V230 439-439             V231 440-440          
   V232 441-441             V233 442-442             V234 443-443          
   V235 444-444             V236 445-445             V237 446-446          
   V238 447-447             V239 448-448             V240 449-449          
   V241 450-450             V242 451-451             V243 452-452          
   V244 453-453             V245 454-454             V246 455-455          
   V247 456-456             V248 457-457             V249 458-458          
   V250 459-459             V251 460-460             V252 461-461          
   V253 462-462             V254 463-463             V255 464-464          
   V256 465-465             V257 466-466             V258 467-467          
   V259 468-468             V260 469-469             V261 470-470          
   V262 471-471             V263 472-472             V264 473-473          
   V265 474-474             V266 475-475             V267 476-476          
   V268 477-477             V269 478-478             V270 479-485          
   V271 486-486             V272 487-487             V273 488-488          
   V274 489-489             V275 490-490             V276 $ 491-491        
   V277 $ 492-492           V278 $ 493-493           V279 $ 494-494        
   V280 495-495             V281 496-496             V282 497-497          
   V283 498-498             V284 499-499             V285 500-500          
   V286 501-501             V287 502-502             V288 503-503          
   V289 504-504             V290 505-505             V291 506-506          
   V292 507-507             V293 508-508             V294 509-509          
   V295 510-510             V296 511-511             V297 512-512          
   V298 513-513             V299 514-514             V300 515-515          
   V301 516-516             V302 517-517             V303 518-518          
   V304 519-519             V305 520-520             V306 521-522          
   V307 523-524             V308 525-526             V309 527-527          
   V310 528-528             V311 529-531             V312 532-532          
   V313 533-533             V314 534-534             V315 535-535          
   V316 536-538             V317 539-539             V318 540-540          
   V319 541-541             V320 542-542             V321 543-543          
   V322 544-547             V323 548-548             V324 549-549          
   V325 550-550             V326 551-554             V327 555-558          
   V328 559-562             V329 563-563             V330 564-564          
   V331 565-569             V332 570-570             V333 571-571          
   V334 572-572             V335 573-573             V336 574-574          
   V337 575-575             V338 576-576             V339 577-577          
   V340 578-578             V341 579-579             V342 580-580          
   V343 581-581             V344 582-582             V345 583-583          
   V346 584-584             V347 585-585             V348 586-586          
   V349 587-587             V350 588-588             V351 589-589          
   V352 590-590             V353 591-591             V354 592-592          
   V355 593-593             V356 594-594             V357 595-595          
   V358 596-596             V359 597-597             V360 598-598          
   V361 599-599             V362 600-600             V363 601-601          
   V364 602-602             V365 603-603             V366 604-604          
   V367 605-605             V368 606-606             V369 607-607          
   V370 608-608             V371 609-609             V372 610-610          
   V373 611-611             V374 612-612             V375 613-613          
   V376 614-614             V377 615-615             V378 616-616          
   V379 617-617             V380 618-618             V381 619-619          
   V382 620-620             V383 621-621             V384 622-622          
   V385 623-623             V386 624-624             V387 625-625          
   V388 626-632             V389 633-633             V390 634-634          
   V391 635-635             V392 636-636             V393 637-637          
   V394 $ 638-638           V395 $ 639-639           V396 $ 640-640        
   V397 $ 641-641           V398 642-642             V399 643-643          
   V400 644-644             V401 645-645             V402 646-646          
   V403 647-647             V404 648-648             V405 649-649          
   V406 650-650             V407 651-651             V408 652-652          
   V409 653-653             V410 654-654             V411 655-655          
   V412 656-656             V413 657-657             V414 658-658          
   V415 659-659             V416 660-660             V417 661-661          
   V418 662-662             V419 663-663             V420 664-664          
   V421 665-665             V422 666-666             V423 667-667          
   V424 668-669             V425 670-671             V426 672-674          
   V427 675-675             V428 676-676             V429 677-679          
   V430 680-680             V431 681-681             V432 682-682          
   V433 683-683             V434 684-686             V435 687-687          
   V436 688-688             V437 689-689             V438 690-690          
   V439 691-691             V440 692-695             V441 696-696          
   V442 697-697             V443 698-698             V444 699-702          
   V445 703-706             V446 707-710             V447 711-711          
   V448 712-712             V449 713-717             V450 718-718          
   V451 719-719             V452 720-720             V453 721-721          
   V454 722-722             V455 723-723             V456 724-724          
   V457 725-725             V458 726-726             V459 727-727          
   V460 728-728             V461 729-729             V462 730-730          
   V463 731-731             V464 732-732             V465 733-733          
   V466 734-734             V467 735-735             V468 736-736          
   V469 737-737             V470 738-738             V471 739-739          
   V472 740-740             V473 741-741             V474 742-742          
   V475 743-743             V476 744-744             V477 745-745          
   V478 746-746             V479 747-747             V480 748-748          
   V481 749-749             V482 750-750             V483 751-751          
   V484 752-752             V485 753-753             V486 754-754          
   V487 755-755             V488 756-756             V489 757-757          
   V490 758-758             V491 759-759             V492 760-760          
   V493 761-761             V494 762-762             V495 763-763          
   V496 764-764             V497 765-765             V498 766-766          
   V499 767-767             V500 768-768             V501 769-769          
   V502 770-770             V503 771-771             V504 772-772          
   V505 773-773             V506 774-780             V507 781-781          
   V508 782-782             V509 783-783             V510 784-784          
   V511 785-785             V512 $ 786-786           V513 $ 787-787        
   V514 $ 788-788           V515 $ 789-789           V516 790-790          
   V517 791-791             V518 792-792             V519 793-793          
   V520 794-794             V521 795-795             V522 796-796          
   V523 797-797             V524 798-798             V525 799-799          
   V526 800-800             V527 801-801             V528 802-802          
   V529 803-803             V530 804-804             V531 805-805          
   V532 806-806             V533 807-807             V534 808-808          
   V535 809-809             V536 810-810             V537 811-811          
   V538 812-812             V539 813-813             V540 814-814          
   V541 815-815             V542 816-817             V543 818-819          
   V544 820-821             V545 822-822             V546 823-823          
   V547 824-826             V548 827-827             V549 828-828          
   V550 829-829             V551 830-830             V552 831-834          
   V553 835-835             V554 836-836             V555 837-837          
   V556 838-838             V557 839-839             V558 840-843          
   V559 844-844             V560 845-845             V561 846-846          
   V562 847-850             V563 851-854             V564 855-858          
   V565 859-859             V566 860-860             V567 861-865          
   V568 866-866             V569 867-867             V570 868-868          
   V571 869-869             V572 870-870             V573 871-871          
   V574 872-872             V575 873-873             V576 874-874          
   V577 875-875             V578 876-876             V579 877-877          
   V580 878-878             V581 879-879             V582 880-880          
   V583 881-881             V584 882-882             V585 883-883          
   V586 884-884             V587 885-885             V588 886-886          
   V589 887-887             V590 888-888             V591 889-889          
   V592 890-890             V593 891-891             V594 892-892          
   V595 893-893             V596 894-894             V597 895-895          
   V598 896-896             V599 897-897             V600 898-898          
   V601 899-899             V602 900-900             V603 901-901          
   V604 902-902             V605 903-903             V606 904-904          
   V607 905-905             V608 906-906             V609 907-907          
   V610 908-908             V611 909-909             V612 910-910          
   V613 911-911             V614 912-912             V615 913-913          
   V616 914-914             V617 915-915             V618 916-916          
   V619 917-917             V620 918-918             V621 919-919          
   V622 920-920             V623 921-921             V624 922-928          
   V625 929-929             V626 930-930             V627 931-931          
   V628 932-932             V629 933-933             V630 $ 934-934        
   V631 $ 935-935           V632 $ 936-936           V633 $ 937-937        
   V634 938-938             V635 939-939             V636 940-940          
   V637 941-941             V638 942-942             V639 943-943          
   V640 944-944             V641 945-945             V642 946-946          
   V643 947-947             V644 948-948             V645 949-949          
   V646 950-950             V647 951-951             V648 952-952          
   V649 953-953             V650 954-954             V651 955-955          
   V652 956-956             V653 957-957             V654 958-958          
   V655 959-959             V656 960-960             V657 961-961          
   V658 962-962             V659 963-963             V660 964-965          
   V661 966-967             V662 968-969             V663 970-970          
   V664 971-971             V665 972-974             V666 975-975          
   V667 976-976             V668 977-977             V669 978-978          
   V670 979-982             V671 983-983             V672 984-984          
   V673 985-985             V674 986-986             V675 987-987          
   V676 988-991             V677 992-992             V678 993-993          
   V679 994-994             V680 995-998             V681 999-1002         
   V682 1003-1006           V683 1007-1007           V684 1008-1008        
   V685 1009-1013           V686 1014-1014           V687 1015-1015        
   V688 1016-1016           V689 1017-1017           V690 1018-1018        
   V691 1019-1019           V692 1020-1020           V693 1021-1021        
   V694 1022-1022           V695 1023-1023           V696 1024-1024        
   V697 1025-1025           V698 1026-1026           V699 1027-1027        
   V700 1028-1028           V701 1029-1029           V702 1030-1030        
   V703 1031-1031           V704 1032-1032           V705 1033-1033        
   V706 1034-1034           V707 1035-1035           V708 1036-1036        
   V709 1037-1037           V710 1038-1038           V711 1039-1039        
   V712 1040-1040           V713 1041-1041           V714 1042-1042        
   V715 1043-1043           V716 1044-1044           V717 1045-1045        
   V718 1046-1046           V719 1047-1047           V720 1048-1048        
   V721 1049-1049           V722 1050-1050           V723 1051-1051        
   V724 1052-1052           V725 1053-1053           V726 1054-1054        
   V727 1055-1055           V728 1056-1056           V729 1057-1057        
   V730 1058-1058           V731 1059-1059           V732 1060-1060        
   V733 1061-1061           V734 1062-1062           V735 1063-1063        
   V736 1064-1064           V737 1065-1065           V738 1066-1066        
   V739 1067-1067           V740 1068-1068           V741 1069-1069        
   V742 1070-1076           V743 1077-1077           V744 1078-1078        
   V745 1079-1079           V746 1080-1080           V747 1081-1081        
   V748 $ 1082-1082         V749 $ 1083-1083         V750 $ 1084-1084      
   V751 $ 1085-1085         V752 1086-1086           V753 1087-1087        
   V754 1088-1088           V755 1089-1089           V756 1090-1090        
   V757 1091-1091           V758 1092-1092           V759 1093-1093        
   V760 1094-1094           V761 1095-1095           V762 1096-1096        
   V763 1097-1097           V764 1098-1098           V765 1099-1099        
   V766 1100-1100           V767 1101-1101           V768 1102-1102        
   V769 1103-1103           V770 1104-1104           V771 1105-1105        
   V772 1106-1106           V773 1107-1107           V774 1108-1108        
   V775 1109-1109           V776 1110-1110           V777 1111-1111        
   V778 1112-1113           V779 1114-1115           V780 1116-1117        
   V781 1118-1118           V782 1119-1119           V783 1120-1122        
   V784 1123-1123           V785 1124-1124           V786 1125-1125        
   V787 1126-1126           V788 1127-1130           V789 1131-1131        
   V790 1132-1132           V791 1133-1133           V792 1134-1134        
   V793 1135-1135           V794 1136-1139           V795 1140-1140        
   V796 1141-1141           V797 1142-1142           V798 1143-1146        
   V799 1147-1150           V800 1151-1154           V801 1155-1155        
   V802 1156-1156           V803 1157-1161           V804 1162-1162        
   V805 1163-1163           V806 1164-1164           V807 1165-1165        
   V808 1166-1166           V809 1167-1167           V810 1168-1168        
   V811 1169-1169           V812 1170-1170           V813 1171-1171        
   V814 1172-1172           V815 1173-1173           V816 1174-1174        
   V817 1175-1175           V818 1176-1176           V819 1177-1177        
   V820 1178-1178           V821 1179-1179           V822 1180-1180        
   V823 1181-1181           V824 1182-1182           V825 1183-1183        
   V826 1184-1184           V827 1185-1185           V828 1186-1186        
   V829 1187-1187           V830 1188-1188           V831 1189-1189        
   V832 1190-1190           V833 1191-1191           V834 1192-1192        
   V835 1193-1193           V836 1194-1194           V837 1195-1195        
   V838 1196-1196           V839 1197-1197           V840 1198-1198        
   V841 1199-1199           V842 1200-1200           V843 1201-1201        
   V844 1202-1202           V845 1203-1203           V846 1204-1204        
   V847 1205-1205           V848 1206-1206           V849 1207-1207        
   V850 1208-1208           V851 1209-1209           V852 1210-1210        
   V853 1211-1211           V854 1212-1212           V855 1213-1213        
   V856 1214-1214           V857 1215-1215           V858 1216-1216        
   V859 1217-1217           V860 1218-1224           V861 1225-1225        
   V862 1226-1226           V863 1227-1227           V864 1228-1228        
   V865 1229-1229           V866 $ 1230-1230         V867 $ 1231-1231      
   V868 $ 1232-1232         V869 $ 1233-1233         V870 1234-1234        
   V871 1235-1235           V872 1236-1236           V873 1237-1237        
   V874 1238-1238           V875 1239-1239           V876 1240-1240        
   V877 1241-1241           V878 1242-1242           V879 1243-1243        
   V880 1244-1244           V881 1245-1245           V882 1246-1246        
   V883 1247-1247           V884 1248-1248           V885 1249-1249        
   V886 1250-1250           V887 1251-1251           V888 1252-1252        
   V889 1253-1253           V890 1254-1254           V891 1255-1255        
   V892 1256-1256           V893 1257-1257           V894 1258-1258        
   V895 1259-1259           V896 1260-1261           V897 1262-1263        
   V898 1264-1266           V899 1267-1267           V900 1268-1268        
   V901 1269-1271           V902 1272-1272           V903 1273-1273        
   V904 1274-1274           V905 1275-1275           V906 1276-1279        
   V907 1280-1280           V908 1281-1281           V909 1282-1282        
   V910 1283-1283           V911 1284-1284           V912 1285-1288        
   V913 1289-1289           V914 1290-1290           V915 1291-1291        
   V916 1292-1295           V917 1296-1299           V918 1300-1303        
   V919 1304-1304           V920 1305-1305           V921 1306-1310        
   V922 1311-1311           V923 1312-1312           V924 1313-1313        
   V925 1314-1314           V926 1315-1315           V927 1316-1316        
   V928 1317-1317           V929 1318-1318           V930 1319-1319        
   V931 1320-1320           V932 1321-1321           V933 1322-1322        
   V934 1323-1323           V935 1324-1324           V936 1325-1325        
   V937 1326-1326           V938 1327-1327           V939 1328-1328        
   V940 1329-1329           V941 1330-1330           V942 1331-1331        
   V943 1332-1332           V944 1333-1333           V945 1334-1334        
   V946 1335-1335           V947 1336-1336           V948 1337-1337        
   V949 1338-1338           V950 1339-1339           V951 1340-1340        
   V952 1341-1341           V953 1342-1342           V954 1343-1343        
   V955 1344-1344           V956 1345-1345           V957 1346-1346        
   V958 1347-1347           V959 1348-1348           V960 1349-1349        
   V961 1350-1350           V962 1351-1351           V963 1352-1352        
   V964 1353-1353           V965 1354-1354           V966 1355-1355        
   V967 1356-1356           V968 1357-1357           V969 1358-1358        
   V970 1359-1359           V971 1360-1360           V972 1361-1361        
   V973 1362-1362           V974 1363-1363           V975 1364-1364        
   V976 1365-1365           V977 1366-1366           V978 1367-1373        
   V979 1374-1374           V980 1375-1375           V981 1376-1376        
   V982 1377-1377           V983 1378-1378           V984 $ 1379-1379      
   V985 $ 1380-1380         V986 $ 1381-1381         V987 $ 1382-1382      
   V988 1383-1383           V989 1384-1384           V990 1385-1385        
   V991 1386-1386           V992 1387-1387           V993 1388-1388        
   V994 1389-1389           V995 1390-1390           V996 1391-1391        
   V997 1392-1392           V998 1393-1393           V999 1394-1394        
   V1000 1395-1395          V1001 1396-1396          V1002 1397-1397       
   V1003 1398-1398          V1004 1399-1399          V1005 1400-1400       
   V1006 1401-1401          V1007 1402-1402          V1008 1403-1403       
   V1009 1404-1404          V1010 1405-1405          V1011 1406-1406       
   V1012 1407-1407          V1013 1408-1408          V1014 1409-1410       
   V1015 1411-1412          V1016 1413-1414          V1017 1415-1415       
   V1018 1416-1416          V1019 1417-1419          V1020 1420-1420       
   V1021 1421-1421          V1022 1422-1422          V1023 1423-1423       
   V1024 1424-1426          V1025 1427-1427          V1026 1428-1428       
   V1027 1429-1429          V1028 1430-1430          V1029 1431-1431       
   V1030 1432-1435          V1031 1436-1436          V1032 1437-1437       
   V1033 1438-1438          V1034 1439-1442          V1035 1443-1446       
   V1036 1447-1450          V1037 1451-1451          V1038 1452-1452       
   V1039 1453-1457          V1040 1458-1458          V1041 1459-1459       
   V1042 1460-1460          V1043 1461-1461          V1044 1462-1462       
   V1045 1463-1463          V1046 1464-1464          V1047 1465-1465       
   V1048 1466-1466          V1049 1467-1467          V1050 1468-1468       
   V1051 1469-1469          V1052 1470-1470          V1053 1471-1471       
   V1054 1472-1472          V1055 1473-1473          V1056 1474-1474       
   V1057 1475-1475          V1058 1476-1476          V1059 1477-1477       
   V1060 1478-1478          V1061 1479-1479          V1062 1480-1480       
   V1063 1481-1481          V1064 1482-1482          V1065 1483-1483       
   V1066 1484-1484          V1067 1485-1485          V1068 1486-1486       
   V1069 1487-1487          V1070 1488-1488          V1071 1489-1489       
   V1072 1490-1490          V1073 1491-1491          V1074 1492-1492       
   V1075 1493-1493          V1076 1494-1494          V1077 1495-1495       
   V1078 1496-1496          V1079 1497-1497          V1080 1498-1498       
   V1081 1499-1499          V1082 1500-1500          V1083 1501-1501       
   V1084 1502-1502          V1085 1503-1503          V1086 1504-1504       
   V1087 1505-1505          V1088 1506-1506          V1089 1507-1507       
   V1090 1508-1508          V1091 1509-1509          V1092 1510-1510       
   V1093 1511-1511          V1094 1512-1512          V1095 1513-1514       
   V1096 1515-1521          V1097 1522-1522          V1098 1523-1523       
   V1099 1524-1524          V1100 1525-1525          V1101 1526-1526       
   V1102 $ 1527-1527        V1103 $ 1528-1528        V1104 $ 1529-1529     
   V1105 $ 1530-1530        V1106 1531-1531          V1107 1532-1532       
   V1108 1533-1533          V1109 1534-1534          V1110 1535-1535       
   V1111 1536-1536          V1112 1537-1537          V1113 1538-1538       
   V1114 1539-1539          V1115 1540-1540          V1116 1541-1541       
   V1117 1542-1542          V1118 1543-1543          V1119 1544-1544       
   V1120 1545-1545          V1121 1546-1546          V1122 1547-1547       
   V1123 1548-1548          V1124 1549-1549          V1125 1550-1550       
   V1126 1551-1551          V1127 1552-1552          V1128 1553-1553       
   V1129 1554-1554          V1130 1555-1555          V1131 1556-1556       
   V1132 1557-1558          V1133 1559-1560          V1134 1561-1562       
   V1135 1563-1563          V1136 1564-1564          V1137 1565-1567       
   V1138 1568-1568          V1139 1569-1569          V1140 1570-1570       
   V1141 1571-1571          V1142 1572-1574          V1143 1575-1575       
   V1144 1576-1576          V1145 1577-1577          V1146 1578-1578       
   V1147 1579-1579          V1148 1580-1583          V1149 1584-1584       
   V1150 1585-1585          V1151 1586-1586          V1152 1587-1590       
   V1153 1591-1594          V1154 1595-1598          V1155 1599-1599       
   V1156 1600-1600          V1157 1601-1605          V1158 1606-1606       
   V1159 1607-1607          V1160 1608-1608          V1161 1609-1609       
   V1162 1610-1610          V1163 1611-1611          V1164 1612-1612       
   V1165 1613-1613          V1166 1614-1614          V1167 1615-1615       
   V1168 1616-1616          V1169 1617-1617          V1170 1618-1618       
   V1171 1619-1619          V1172 1620-1620          V1173 1621-1621       
   V1174 1622-1622          V1175 1623-1623          V1176 1624-1624       
   V1177 1625-1625          V1178 1626-1626          V1179 1627-1627       
   V1180 1628-1628          V1181 1629-1629          V1182 1630-1630       
   V1183 1631-1631          V1184 1632-1632          V1185 1633-1633       
   V1186 1634-1634          V1187 1635-1635          V1188 1636-1636       
   V1189 1637-1637          V1190 1638-1638          V1191 1639-1639       
   V1192 1640-1640          V1193 1641-1641          V1194 1642-1642       
   V1195 1643-1643          V1196 1644-1644          V1197 1645-1645       
   V1198 1646-1646          V1199 1647-1647          V1200 1648-1648       
   V1201 1649-1649          V1202 1650-1650          V1203 1651-1651       
   V1204 1652-1652          V1205 1653-1653          V1206 1654-1654       
   V1207 1655-1655          V1208 1656-1656          V1209 1657-1657       
   V1210 1658-1658          V1211 1659-1659          V1212 1660-1660       
   V1213 1661-1662          V1214 1663-1669          V1215 1670-1670       
   V1216 1671-1671          V1217 1672-1672          V1218 1673-1673       
   V1219 1674-1674          V1220 $ 1675-1675        V1221 $ 1676-1676     
   V1222 $ 1677-1677        V1223 $ 1678-1678        V1224 1679-1679       
   V1225 1680-1680          V1226 1681-1681          V1227 1682-1682       
   V1228 1683-1683          V1229 1684-1684          V1230 1685-1685       
   V1231 1686-1686          V1232 1687-1687          V1233 1688-1688       
   V1234 1689-1689          V1235 1690-1690          V1236 1691-1691       
   V1237 1692-1692          V1238 1693-1693          V1239 1694-1694       
   V1240 1695-1695          V1241 1696-1696          V1242 1697-1697       
   V1243 1698-1698          V1244 1699-1699          V1245 1700-1700       
   V1246 1701-1701          V1247 1702-1702          V1248 1703-1703       
   V1249 1704-1704          V1250 1705-1706          V1251 1707-1708       
   V1252 1709-1710          V1253 1711-1711          V1254 1712-1712       
   V1255 1713-1715          V1256 1716-1716          V1257 1717-1717       
   V1258 1718-1718          V1259 1719-1719          V1260 1720-1722       
   V1261 1723-1723          V1262 1724-1724          V1263 1725-1725       
   V1264 1726-1726          V1265 1727-1727          V1266 1728-1731       
   V1267 1732-1732          V1268 1733-1733          V1269 1734-1734       
   V1270 1735-1738          V1271 1739-1742          V1272 1743-1746       
   V1273 1747-1747          V1274 1748-1748          V1275 1749-1753       
   V1276 1754-1754          V1277 1755-1755          V1278 1756-1756       
   V1279 1757-1757          V1280 1758-1758          V1281 1759-1759       
   V1282 1760-1760          V1283 1761-1761          V1284 1762-1762       
   V1285 1763-1763          V1286 1764-1764          V1287 1765-1765       
   V1288 1766-1766          V1289 1767-1767          V1290 1768-1768       
   V1291 1769-1769          V1292 1770-1770          V1293 1771-1771       
   V1294 1772-1772          V1295 1773-1773          V1296 1774-1774       
   V1297 1775-1775          V1298 1776-1776          V1299 1777-1777       
   V1300 1778-1778          V1301 1779-1779          V1302 1780-1780       
   V1303 1781-1781          V1304 1782-1782          V1305 1783-1783       
   V1306 1784-1784          V1307 1785-1785          V1308 1786-1786       
   V1309 1787-1787          V1310 1788-1788          V1311 1789-1789       
   V1312 1790-1790          V1313 1791-1791          V1314 1792-1792       
   V1315 1793-1793          V1316 1794-1794          V1317 1795-1795       
   V1318 1796-1796          V1319 1797-1797          V1320 1798-1798       
   V1321 1799-1799          V1322 1800-1800          V1323 1801-1801       
   V1324 1802-1802          V1325 1803-1803          V1326 1804-1804       
   V1327 1805-1805          V1328 1806-1806          V1329 1807-1807       
   V1330 1808-1808          V1331 1809-1809          V1332 1810-1816       
   V1333 1817-1817          V1334 1818-1818          V1335 1819-1819       
   V1336 1820-1820          V1337 1821-1821          V1338 $ 1822-1822     
   V1339 $ 1823-1823        V1340 $ 1824-1824        V1341 $ 1825-1825     
   V1342 1826-1826          V1343 1827-1827          V1344 1828-1828       
   V1345 1829-1829          V1346 1830-1830          V1347 1831-1831       
   V1348 1832-1832          V1349 1833-1833          V1350 1834-1834       
   V1351 1835-1835          V1352 1836-1836          V1353 1837-1837       
   V1354 1838-1838          V1355 1839-1839          V1356 1840-1840       
   V1357 1841-1841          V1358 1842-1842          V1359 1843-1843       
   V1360 1844-1844          V1361 1845-1845          V1362 1846-1846       
   V1363 1847-1847          V1364 1848-1848          V1365 1849-1849       
   V1366 1850-1850          V1367 1851-1851          V1368 1852-1853       
   V1369 1854-1855          V1370 1856-1857          V1371 1858-1858       
   V1372 1859-1859          V1373 1860-1862          V1374 1863-1863       
   V1375 1864-1864          V1376 1865-1865          V1377 1866-1866       
   V1378 1867-1869          V1379 1870-1870          V1380 1871-1871       
   V1381 1872-1872          V1382 1873-1873          V1383 1874-1874       
   V1384 1875-1878          V1385 1879-1879          V1386 1880-1880       
   V1387 1881-1881          V1388 1882-1885          V1389 1886-1889       
   V1390 1890-1893          V1391 1894-1894          V1392 1895-1895       
   V1393 1896-1900          V1394 1901-1901          V1395 1902-1902       
   V1396 1903-1903          V1397 1904-1904          V1398 1905-1905       
   V1399 1906-1906          V1400 1907-1907          V1401 1908-1908       
   V1402 1909-1909          V1403 1910-1910          V1404 1911-1911       
   V1405 1912-1912          V1406 1913-1913          V1407 1914-1914       
   V1408 1915-1915          V1409 1916-1916          V1410 1917-1917       
   V1411 1918-1918          V1412 1919-1919          V1413 1920-1920       
   V1414 1921-1921          V1415 1922-1922          V1416 1923-1923       
   V1417 1924-1924          V1418 1925-1925          V1419 1926-1926       
   V1420 1927-1927          V1421 1928-1928          V1422 1929-1929       
   V1423 1930-1930          V1424 1931-1931          V1425 1932-1932       
   V1426 1933-1933          V1427 1934-1934          V1428 1935-1935       
   V1429 1936-1936          V1430 1937-1937          V1431 1938-1938       
   V1432 1939-1939          V1433 1940-1940          V1434 1941-1941       
   V1435 1942-1942          V1436 1943-1943          V1437 1944-1944       
   V1438 1945-1945          V1439 1946-1946          V1440 1947-1947       
   V1441 1948-1948          V1442 1949-1949          V1443 1950-1950       
   V1444 1951-1951          V1445 1952-1952          V1446 1953-1953       
   V1447 1954-1954          V1448 1955-1955;                               
                                                                           
* SAS LABEL STATEMENT;                                                     
                                                                           
LABEL                                                                      
   V1 = "ID CODE"                                                          
   V2 = "NUMERIC STATE CODE"                                               
   V3 = "ORI CODE"                                                         
   V4 = "GROUP NUMBER"                                                     
   V5 = "DIVISION"                                                         
   V6 = "YEAR"                                                             
   V7 = "CITY SEQUENCE NUMBER"                                             
   V8 = "CORE CITY INDICATION"                                             
   V9 = "COVERED BY CODE"                                                  
   V10 = "LAST UPDATE"                                                     
   V11 = "FIELD OFFICE"                                                    
   V12 = "NUMBER OF MONTHS REPORTED"                                       
   V13 = "AGENCY COUNT"                                                    
   V14 = "POPULATION 1"                                                    
   V15 = "COUNTY 1"                                                        
   V16 = "MSA 1"                                                           
   V17 = "POPULATION 2"                                                    
   V18 = "COUNTY 2"                                                        
   V19 = "MSA 2"                                                           
   V20 = "POPULATION 3"                                                    
   V21 = "COUNTY 3"                                                        
   V22 = "MSA 3"                                                           
   V23 = "FOLLOW-UP INDICATION"                                            
   V24 = "SPECIAL MAILING GROUP"                                           
   V25 = "SPECIAL MAILING ADDRESS"                                         
   V26 = "AGENCY NAME"                                                     
   V27 = "AGENCY STATE NAME"                                               
   V28 = "MAILING ADDRESS-LINE 1"                                          
   V29 = "MAILING ADDRESS-LINE 2"                                          
   V30 = "MAILING ADDRESS-LINE 3"                                          
   V31 = "MAILING ADDRESS-LINE 4"                                          
   V32 = "ZIP CODE"                                                        
   V33 = "JAN: MONTH INCLUDED IN"                                          
   V34 = "JAN: LAST UPDATE"                                                
   V35 = "JAN: CARD 0 TYPE"                                                
   V36 = "JAN: CARD 1 TYPE"                                                
   V37 = "JAN: CARD 2 TYPE"                                                
   V38 = "JAN: CARD 3 TYPE"                                                
   V39 = "JAN: CARD 4 TYPE"                                                
   V40 = "JAN: CARD 0 P/T"                                                 
   V41 = "JAN: CARD 1 P/T"                                                 
   V42 = "JAN: CARD 2 P/T"                                                 
   V43 = "JAN: CARD 3 P/T"                                                 
   V44 = "JAN: UNFOUNDED MURDER"                                           
   V45 = "JAN: UNFOUNDED MANSLGHTR"                                        
   V46 = "JAN: UNFOUNDED RAPE TOTL"                                        
   V47 = "JAN: UNFOUNDED FORC RAPE"                                        
   V48 = "JAN: UNFOUND ATMPTD RAPE"                                        
   V49 = "JAN: UNFOUND ROBBRY TOTL"                                        
   V50 = "JAN: UNFOUND GUN ROBBERY"                                        
   V51 = "JAN: UNFOUNDED KNIFE ROB"                                        
   V52 = "JAN: UNFND OTHR WEAP ROB"                                        
   V53 = "JAN: UNFND STRNG-ARM ROB"                                        
   V54 = "JAN: UNFOUND ASSLT TOTAL"                                        
   V55 = "JAN: UNFOUND GUN ASSLT"                                          
   V56 = "JAN: UNFOUND KNIFE ASSLT"                                        
   V57 = "JAN: UNFND OTH WPN ASLT"                                         
   V58 = "JAN: UNFND HND/FEET ASLT"                                        
   V59 = "JAN: UNFND SIMPL ASSAULT"                                        
   V60 = "JAN: UNFOUND BURG TOTAL"                                         
   V61 = "JAN: UNFOUND FORCE ENTRY"                                        
   V62 = "JAN: UNFND ENTRY-NO FORC"                                        
   V63 = "JAN: UNFND ATT BURGLARY"                                         
   V64 = "JAN: UNFOUND LARCNY TOTL"                                        
   V65 = "JAN: UF TOT MTR VHC THFT"                                        
   V66 = "JAN: UNFOUND AUTO THEFT"                                         
   V67 = "JAN: UF TRUCK/BUS THEFT"                                         
   V68 = "JAN: UNFND OTH VHC THEFT"                                        
   V69 = "JAN: UNFOUND ALL FIELDS"                                         
   V70 = "JAN: ACT NUM MURDER"                                             
   V71 = "JAN: ACT NUM MANSLGHTR"                                          
   V72 = "JAN: ACT NUM RAPE TOTL"                                          
   V73 = "JAN: ACT NUM FORC RAPE"                                          
   V74 = "JAN: ACT NUM ATMPTD RAPE"                                        
   V75 = "JAN: ACT NUM ROBBRY TOTL"                                        
   V76 = "JAN: ACT NUM GUN ROBBERY"                                        
   V77 = "JAN: ACT NUM KNIFE ROBRY"                                        
   V78 = "JAN: ACT NUM OTH WPN ROB"                                        
   V79 = "JAN: ACT NUM STR ARM ROB"                                        
   V80 = "JAN: ACT NUM ASSLT TOTAL"                                        
   V81 = "JAN: ACT NUM GUN ASSAULT"                                        
   V82 = "JAN: ACT NUM KNIFE ASSLT"                                        
   V83 = "JAN: ACT # OTH WPN ASSLT"                                        
   V84 = "JAN: ACT # HND/FEET ASLT"                                        
   V85 = "JAN: ACT # SIMPLE ASSLT"                                         
   V86 = "JAN: ACT # BURGLARY TOTL"                                        
   V87 = "JAN: ACT # FORCE ENTRY"                                          
   V88 = "JAN: ACT # ENTRY-NO FORC"                                        
   V89 = "JAN: ACT # ATT BURGLARY"                                         
   V90 = "JAN: ACT # LARCENY TOTAL"                                        
   V91 = "JAN: ACT # VHC THEFT TOT"                                        
   V92 = "JAN: ACT # AUTO THEFT"                                           
   V93 = "JAN: ACT # TRCK/BUS THFT"                                        
   V94 = "JAN: ACT # OTH VHC THEFT"                                        
   V95 = "JAN: ACT # ALL FIELDS"                                           
   V96 = "JAN: TOT CLR MURDER"                                             
   V97 = "JAN: TOT CLR MANSLGHTR"                                          
   V98 = "JAN: TOT CLR RAPE TOTAL"                                         
   V99 = "JAN: TOT CLR FORC RAPE"                                          
   V100 = "JAN: TOT CLR ATMPTD RAPE"                                       
   V101 = "JAN: TOT CLR TOTL ROBERY"                                       
   V102 = "JAN: TOT CLR GUN ROBBERY"                                       
   V103 = "JAN: TOT CLR KNIFE ROBRY"                                       
   V104 = "JAN: TOT CLR OTH WPN ROB"                                       
   V105 = "JAN: TOT CLR STR ARM ROB"                                       
   V106 = "JAN: TOT CLR ASSLT TOTAL"                                       
   V107 = "JAN: TOT CLR GUN ASSAULT"                                       
   V108 = "JAN: TOT CLR KNIFE ASSLT"                                       
   V109 = "JAN: TOT CLR OTH WPN ASLT"                                      
   V110 = "JAN: TOT CLR HND/FT ASLT"                                       
   V111 = "JAN: TOT CLR SIMPLE ASLT"                                       
   V112 = "JAN: TOT CLR BRGLRY TOTL"                                       
   V113 = "JAN: TOT CLR FORC ENTRY"                                        
   V114 = "JAN: TOT CLR ENTR-NO FRC"                                       
   V115 = "JAN: TOT CLR ATT BURGLRY"                                       
   V116 = "JAN: TOT CLR LARCNY TOTL"                                       
   V117 = "JAN:TOT CLR VHC THFT TOT"                                       
   V118 = "JAN: TOT CLR AUTO THEFT"                                        
   V119 = "JAN:TOT CLR TRCK/BS THFT"                                       
   V120 = "JAN:TOT CLR OTH VHC THFT"                                       
   V121 = "JAN: TOT CLR ALL FIELDS"                                        
   V122 = "JAN: CLR<18 MURDER"                                             
   V123 = "JAN: CLR<18 MANSLGHTR"                                          
   V124 = "JAN: CLR<18 RAPE TOTAL"                                         
   V125 = "JAN: CLR<18 FORCE RAPE"                                         
   V126 = "JAN: CLR<18 ATTMPTD RAPE"                                       
   V127 = "JAN: CLR<18 ROBBERY TOTL"                                       
   V128 = "JAN: CLR<18 GUN ROBBERY"                                        
   V129 = "JAN: CLR<18 KNIFE ROBBRY"                                       
   V130 = "JAN: CLR<18 OTH WPN RBRY"                                       
   V131 = "JAN: CLR<18 STR ARM ROB"                                        
   V132 = "JAN: CLR<18 ASSLT TOTAL"                                        
   V133 = "JAN: CLR<18 GUN ASSAULT"                                        
   V134 = "JAN: CLR<18 KNIFE ASSLT"                                        
   V135 = "JAN: CLR<18 OTH WPN ASLT"                                       
   V136 = "JAN: CLR<18 HND/FT ASSLT"                                       
   V137 = "JAN: CLR<18 SIMPLE ASSLT"                                       
   V138 = "JAN: CLR<18 BURGLRY TOTL"                                       
   V139 = "JAN: CLR<18 FORC ENTRY"                                         
   V140 = "JAN: CLR<18 ENTR-NO FORC"                                       
   V141 = "JAN: CLR<18 ATT BURGLARY"                                       
   V142 = "JAN: CLR<18 LARCENY TOTL"                                       
   V143 = "JAN: CLR<18 VHC THFT TOT"                                       
   V144 = "JAN: CLR<18 AUTO THEFT"                                         
   V145 = "JAN: CLR<18 TRCK/BS THFT"                                       
   V146 = "JAN: CLR<18 OTH VHC THFT"                                       
   V147 = "JAN: CLR<18 ALL FIELDS"                                         
   V148 = "JAN: OFFICRS KILL BY FEL"                                       
   V149 = "JAN: OFFICRS KILL BY ACC"                                       
   V150 = "JAN: OFFICERS ASSAULTED"                                        
   V151 = "FEB: MONTH INCLUDED IN"                                         
   V152 = "FEB: LAST UPDATE"                                               
   V153 = "FEB: CARD 0 TYPE"                                               
   V154 = "FEB: CARD 1 TYPE"                                               
   V155 = "FEB: CARD 2 TYPE"                                               
   V156 = "FEB: CARD 3 TYPE"                                               
   V157 = "FEB: CARD 4 TYPE"                                               
   V158 = "FEB: CARD 0 P/T"                                                
   V159 = "FEB: CARD 1 P/T"                                                
   V160 = "FEB: CARD 2 P/T"                                                
   V161 = "FEB: CARD 3 P/T"                                                
   V162 = "FEB: UNFOUNDED MURDER"                                          
   V163 = "FEB: UNFOUNDED MANSLGHTR"                                       
   V164 = "FEB: UNFOUNDED RAPE TOTL"                                       
   V165 = "FEB: UNFOUNDED FORC RAPE"                                       
   V166 = "FEB: UNFOUND ATMPTD RAPE"                                       
   V167 = "FEB: UNFOUND ROBBRY TOTL"                                       
   V168 = "FEB: UNFOUND GUN ROBBERY"                                       
   V169 = "FEB: UNFOUNDED KNIFE ROB"                                       
   V170 = "FEB: UNFND OTHR WEAP ROB"                                       
   V171 = "FEB: UNFND STRNG-ARM ROB"                                       
   V172 = "FEB: UNFOUND ASSLT TOTAL"                                       
   V173 = "FEB: UNFOUND GUN ASSLT"                                         
   V174 = "FEB: UNFOUND KNIFE ASSLT"                                       
   V175 = "FEB: UNFND OTH WPN ASLT"                                        
   V176 = "FEB: UNFND HND/FEET ASLT"                                       
   V177 = "FEB: UNFND SIMPL ASSAULT"                                       
   V178 = "FEB: UNFOUND BURG TOTAL"                                        
   V179 = "FEB: UNFOUND FORCE ENTRY"                                       
   V180 = "FEB: UNFND ENTRY-NO FORC"                                       
   V181 = "FEB: UNFND ATT BURGLARY"                                        
   V182 = "FEB: UNFOUND LARCNY TOTL"                                       
   V183 = "FEB: UF TOT MTR VHC THFT"                                       
   V184 = "FEB: UNFOUND AUTO THEFT"                                        
   V185 = "FEB: UF TRUCK/BUS THEFT"                                        
   V186 = "FEB: UNFND OTH VHC THEFT"                                       
   V187 = "FEB: UNFOUND ALL FIELDS"                                        
   V188 = "FEB: ACT NUM MURDER"                                            
   V189 = "FEB: ACT NUM MANSLGHTR"                                         
   V190 = "FEB: ACT NUM RAPE TOTL"                                         
   V191 = "FEB: ACT NUM FORC RAPE"                                         
   V192 = "FEB: ACT NUM ATMPTD RAPE"                                       
   V193 = "FEB: ACT NUM ROBBRY TOTL"                                       
   V194 = "FEB: ACT NUM GUN ROBBERY"                                       
   V195 = "FEB: ACT NUM KNIFE ROBRY"                                       
   V196 = "FEB: ACT NUM OTH WPN ROB"                                       
   V197 = "FEB: ACT NUM STR ARM ROB"                                       
   V198 = "FEB: ACT NUM ASSLT TOTAL"                                       
   V199 = "FEB: ACT NUM GUN ASSAULT"                                       
   V200 = "FEB: ACT NUM KNIFE ASSLT"                                       
   V201 = "FEB: ACT # OTH WPN ASSLT"                                       
   V202 = "FEB: ACT # HND/FEET ASLT"                                       
   V203 = "FEB: ACT # SIMPLE ASSLT"                                        
   V204 = "FEB: ACT # BURGLARY TOTL"                                       
   V205 = "FEB: ACT # FORCE ENTRY"                                         
   V206 = "FEB: ACT # ENTRY-NO FORC"                                       
   V207 = "FEB: ACT # ATT BURGLARY"                                        
   V208 = "FEB: ACT # LARCENY TOTAL"                                       
   V209 = "FEB: ACT # VHC THEFT TOT"                                       
   V210 = "FEB: ACT # AUTO THEFT"                                          
   V211 = "FEB: ACT # TRCK/BUS THFT"                                       
   V212 = "FEB: ACT # OTH VHC THEFT"                                       
   V213 = "FEB: ACT # ALL FIELDS"                                          
   V214 = "FEB: TOT CLR MURDER"                                            
   V215 = "FEB: TOT CLR MANSLGHTR"                                         
   V216 = "FEB: TOT CLR RAPE TOTAL"                                        
   V217 = "FEB: TOT CLR FORC RAPE"                                         
   V218 = "FEB: TOT CLR ATMPTD RAPE"                                       
   V219 = "FEB: TOT CLR TOTL ROBERY"                                       
   V220 = "FEB: TOT CLR GUN ROBBERY"                                       
   V221 = "FEB: TOT CLR KNIFE ROBRY"                                       
   V222 = "FEB: TOT CLR OTH WPN ROB"                                       
   V223 = "FEB: TOT CLR STR ARM ROB"                                       
   V224 = "FEB: TOT CLR ASSLT TOTAL"                                       
   V225 = "FEB: TOT CLR GUN ASSAULT"                                       
   V226 = "FEB: TOT CLR KNIFE ASSLT"                                       
   V227 = "FEB: TOT CLR OTH WPN ASLT"                                      
   V228 = "FEB: TOT CLR HND/FT ASLT"                                       
   V229 = "FEB: TOT CLR SIMPLE ASLT"                                       
   V230 = "FEB: TOT CLR BRGLRY TOTL"                                       
   V231 = "FEB: TOT CLR FORC ENTRY"                                        
   V232 = "FEB: TOT CLR ENTR-NO FRC"                                       
   V233 = "FEB: TOT CLR ATT BURGLRY"                                       
   V234 = "FEB: TOT CLR LARCNY TOTL"                                       
   V235 = "FEB:TOT CLR VHC THFT TOT"                                       
   V236 = "FEB: TOT CLR AUTO THEFT"                                        
   V237 = "FEB:TOT CLR TRCK/BS THFT"                                       
   V238 = "FEB:TOT CLR OTH VHC THFT"                                       
   V239 = "FEB: TOT CLR ALL FIELDS"                                        
   V240 = "FEB: CLR<18 MURDER"                                             
   V241 = "FEB: CLR<18 MANSLGHTR"                                          
   V242 = "FEB: CLR<18 RAPE TOTAL"                                         
   V243 = "FEB: CLR<18 FORCE RAPE"                                         
   V244 = "FEB: CLR<18 ATTMPTD RAPE"                                       
   V245 = "FEB: CLR<18 ROBBERY TOTL"                                       
   V246 = "FEB: CLR<18 GUN ROBBERY"                                        
   V247 = "FEB: CLR<18 KNIFE ROBBRY"                                       
   V248 = "FEB: CLR<18 OTH WPN RBRY"                                       
   V249 = "FEB: CLR<18 STR ARM ROB"                                        
   V250 = "FEB: CLR<18 ASSLT TOTAL"                                        
   V251 = "FEB: CLR<18 GUN ASSAULT"                                        
   V252 = "FEB: CLR<18 KNIFE ASSLT"                                        
   V253 = "FEB: CLR<18 OTH WPN ASLT"                                       
   V254 = "FEB: CLR<18 HND/FT ASSLT"                                       
   V255 = "FEB: CLR<18 SIMPLE ASSLT"                                       
   V256 = "FEB: CLR<18 BURGLRY TOTL"                                       
   V257 = "FEB: CLR<18 FORC ENTRY"                                         
   V258 = "FEB: CLR<18 ENTR-NO FORC"                                       
   V259 = "FEB: CLR<18 ATT BURGLARY"                                       
   V260 = "FEB: CLR<18 LARCENY TOTL"                                       
   V261 = "FEB: CLR<18 VHC THFT TOT"                                       
   V262 = "FEB: CLR<18 AUTO THEFT"                                         
   V263 = "FEB: CLR<18 TRCK/BS THFT"                                       
   V264 = "FEB: CLR<18 OTH VHC THFT"                                       
   V265 = "FEB: CLR<18 ALL FIELDS"                                         
   V266 = "FEB: OFFICRS KILL BY FEL"                                       
   V267 = "FEB: OFFICRS KILL BY ACC"                                       
   V268 = "FEB: OFFICERS ASSAULTED"                                        
   V269 = "MAR: MONTH INCLUDED IN"                                         
   V270 = "MAR: LAST UPDATE"                                               
   V271 = "MAR: CARD 0 TYPE"                                               
   V272 = "MAR: CARD 1 TYPE"                                               
   V273 = "MAR: CARD 2 TYPE"                                               
   V274 = "MAR: CARD 3 TYPE"                                               
   V275 = "MAR: CARD 4 TYPE"                                               
   V276 = "MAR: CARD 0 P/T"                                                
   V277 = "MAR: CARD 1 P/T"                                                
   V278 = "MAR: CARD 2 P/T"                                                
   V279 = "MAR: CARD 3 P/T"                                                
   V280 = "MAR: UNFOUNDED MURDER"                                          
   V281 = "MAR: UNFOUNDED MANSLGHTR"                                       
   V282 = "MAR: UNFOUNDED RAPE TOTL"                                       
   V283 = "MAR: UNFOUNDED FORC RAPE"                                       
   V284 = "MAR: UNFOUND ATMPTD RAPE"                                       
   V285 = "MAR: UNFOUND ROBBRY TOTL"                                       
   V286 = "MAR: UNFOUND GUN ROBBERY"                                       
   V287 = "MAR: UNFOUNDED KNIFE ROB"                                       
   V288 = "MAR: UNFND OTHR WEAP ROB"                                       
   V289 = "MAR: UNFND STRNG-ARM ROB"                                       
   V290 = "MAR: UNFOUND ASSLT TOTAL"                                       
   V291 = "MAR: UNFOUND GUN ASSLT"                                         
   V292 = "MAR: UNFOUND KNIFE ASSLT"                                       
   V293 = "MAR: UNFND OTH WPN ASLT"                                        
   V294 = "MAR: UNFND HND/FEET ASLT"                                       
   V295 = "MAR: UNFND SIMPL ASSAULT"                                       
   V296 = "MAR: UNFOUND BURG TOTAL"                                        
   V297 = "MAR: UNFOUND FORCE ENTRY"                                       
   V298 = "MAR: UNFND ENTRY-NO FORC"                                       
   V299 = "MAR: UNFND ATT BURGLARY"                                        
   V300 = "MAR: UNFOUND LARCNY TOTL"                                       
   V301 = "MAR: UF TOT MTR VHC THFT"                                       
   V302 = "MAR: UNFOUND AUTO THEFT"                                        
   V303 = "MAR: UF TRUCK/BUS THEFT"                                        
   V304 = "MAR: UNFND OTH VHC THEFT"                                       
   V305 = "MAR: UNFOUND ALL FIELDS"                                        
   V306 = "MAR: ACT NUM MURDER"                                            
   V307 = "MAR: ACT NUM MANSLGHTR"                                         
   V308 = "MAR: ACT NUM RAPE TOTL"                                         
   V309 = "MAR: ACT NUM FORC RAPE"                                         
   V310 = "MAR: ACT NUM ATMPTD RAPE"                                       
   V311 = "MAR: ACT NUM ROBBRY TOTL"                                       
   V312 = "MAR: ACT NUM GUN ROBBERY"                                       
   V313 = "MAR: ACT NUM KNIFE ROBRY"                                       
   V314 = "MAR: ACT NUM OTH WPN ROB"                                       
   V315 = "MAR: ACT NUM STR ARM ROB"                                       
   V316 = "MAR: ACT NUM ASSLT TOTAL"                                       
   V317 = "MAR: ACT NUM GUN ASSAULT"                                       
   V318 = "MAR: ACT NUM KNIFE ASSLT"                                       
   V319 = "MAR: ACT # OTH WPN ASSLT"                                       
   V320 = "MAR: ACT # HND/FEET ASLT"                                       
   V321 = "MAR: ACT # SIMPLE ASSLT"                                        
   V322 = "MAR: ACT # BURGLARY TOTL"                                       
   V323 = "MAR: ACT # FORCE ENTRY"                                         
   V324 = "MAR: ACT # ENTRY-NO FORC"                                       
   V325 = "MAR: ACT # ATT BURGLARY"                                        
   V326 = "MAR: ACT # LARCENY TOTAL"                                       
   V327 = "MAR: ACT # VHC THEFT TOT"                                       
   V328 = "MAR: ACT # AUTO THEFT"                                          
   V329 = "MAR: ACT # TRCK/BUS THFT"                                       
   V330 = "MAR: ACT # OTH VHC THEFT"                                       
   V331 = "MAR: ACT # ALL FIELDS"                                          
   V332 = "MAR: TOT CLR MURDER"                                            
   V333 = "MAR: TOT CLR MANSLGHTR"                                         
   V334 = "MAR: TOT CLR RAPE TOTAL"                                        
   V335 = "MAR: TOT CLR FORC RAPE"                                         
   V336 = "MAR: TOT CLR ATMPTD RAPE"                                       
   V337 = "MAR: TOT CLR TOTL ROBERY"                                       
   V338 = "MAR: TOT CLR GUN ROBBERY"                                       
   V339 = "MAR: TOT CLR KNIFE ROBRY"                                       
   V340 = "MAR: TOT CLR OTH WPN ROB"                                       
   V341 = "MAR: TOT CLR STR ARM ROB"                                       
   V342 = "MAR: TOT CLR ASSLT TOTAL"                                       
   V343 = "MAR: TOT CLR GUN ASSAULT"                                       
   V344 = "MAR: TOT CLR KNIFE ASSLT"                                       
   V345 = "MAR:TOT CLR OTH WPN ASLT"                                       
   V346 = "MAR: TOT CLR HND/FT ASLT"                                       
   V347 = "MAR: TOT CLR SIMPLE ASLT"                                       
   V348 = "MAR: TOT CLR BRGLRY TOTL"                                       
   V349 = "MAR: TOT CLR FORC ENTRY"                                        
   V350 = "MAR: TOT CLR ENTR-NO FRC"                                       
   V351 = "MAR: TOT CLR ATT BURGLRY"                                       
   V352 = "MAR: TOT CLR LARCNY TOTL"                                       
   V353 = "MAR:TOT CLR VHC THFT TOT"                                       
   V354 = "MAR: TOT CLR AUTO THEFT"                                        
   V355 = "MAR:TOT CLR TRCK/BS THFT"                                       
   V356 = "MAR:TOT CLR OTH VHC THFT"                                       
   V357 = "MAR: TOT CLR ALL FIELDS"                                        
   V358 = "MAR: CLR<18 MURDER"                                             
   V359 = "MAR: CLR<18 MANSLGHTR"                                          
   V360 = "MAR: CLR<18 RAPE TOTAL"                                         
   V361 = "MAR: CLR<18 FORCE RAPE"                                         
   V362 = "MAR: CLR<18 ATTMPTD RAPE"                                       
   V363 = "MAR: CLR<18 ROBBERY TOTL"                                       
   V364 = "MAR: CLR<18 GUN ROBBERY"                                        
   V365 = "MAR: CLR<18 KNIFE ROBBRY"                                       
   V366 = "MAR: CLR<18 OTH WPN RBRY"                                       
   V367 = "MAR: CLR<18 STR ARM ROB"                                        
   V368 = "MAR: CLR<18 ASSLT TOTAL"                                        
   V369 = "MAR: CLR<18 GUN ASSAULT"                                        
   V370 = "MAR: CLR<18 KNIFE ASSLT"                                        
   V371 = "MAR: CLR<18 OTH WPN ASLT"                                       
   V372 = "MAR: CLR<18 HND/FT ASSLT"                                       
   V373 = "MAR: CLR<18 SIMPLE ASSLT"                                       
   V374 = "MAR: CLR<18 BURGLRY TOTL"                                       
   V375 = "MAR: CLR<18 FORC ENTRY"                                         
   V376 = "MAR: CLR<18 ENTR-NO FORC"                                       
   V377 = "MAR: CLR<18 ATT BURGLARY"                                       
   V378 = "MAR: CLR<18 LARCENY TOTL"                                       
   V379 = "MAR: CLR<18 VHC THFT TOT"                                       
   V380 = "MAR: CLR<18 AUTO THEFT"                                         
   V381 = "MAR: CLR<18 TRCK/BS THFT"                                       
   V382 = "MAR: CLR<18 OTH VHC THFT"                                       
   V383 = "MAR: CLR<18 ALL FIELDS"                                         
   V384 = "MAR: OFFICRS KILL BY FEL"                                       
   V385 = "MAR: OFFICRS KILL BY ACC"                                       
   V386 = "MAR: OFFICERS ASSAULTED"                                        
   V387 = "APR: MONTH INCLUDED IN"                                         
   V388 = "APR: LAST UPDATE"                                               
   V389 = "APR: CARD 0 TYPE"                                               
   V390 = "APR: CARD 1 TYPE"                                               
   V391 = "APR: CARD 2 TYPE"                                               
   V392 = "APR: CARD 3 TYPE"                                               
   V393 = "APR: CARD 4 TYPE"                                               
   V394 = "APR: CARD 0 P/T"                                                
   V395 = "APR: CARD 1 P/T"                                                
   V396 = "APR: CARD 2 P/T"                                                
   V397 = "APR: CARD 3 P/T"                                                
   V398 = "APR: UNFOUNDED MURDER"                                          
   V399 = "APR: UNFOUNDED MANSLGHTR"                                       
   V400 = "APR: UNFOUNDED RAPE TOTL"                                       
   V401 = "APR: UNFOUNDED FORC RAPE"                                       
   V402 = "APR: UNFOUND ATMPTD RAPE"                                       
   V403 = "APR: UNFOUND ROBBRY TOTL"                                       
   V404 = "APR: UNFOUND GUN ROBBERY"                                       
   V405 = "APR: UNFOUNDED KNIFE ROB"                                       
   V406 = "APR: UNFND OTHR WEAP ROB"                                       
   V407 = "APR: UNFND STRNG-ARM ROB"                                       
   V408 = "APR: UNFOUND ASSLT TOTAL"                                       
   V409 = "APR: UNFOUND GUN ASSLT"                                         
   V410 = "APR: UNFOUND KNIFE ASSLT"                                       
   V411 = "APR: UNFND OTH WPN ASLT"                                        
   V412 = "APR: UNFND HND/FEET ASLT"                                       
   V413 = "APR: UNFND SIMPL ASSAULT"                                       
   V414 = "APR: UNFOUND BURG TOTAL"                                        
   V415 = "APR: UNFOUND FORCE ENTRY"                                       
   V416 = "APR: UNFND ENTRY-NO FORC"                                       
   V417 = "APR: UNFND ATT BURGLARY"                                        
   V418 = "APR: UNFOUND LARCNY TOTL"                                       
   V419 = "APR: UF TOT MTR VHC THFT"                                       
   V420 = "APR: UNFOUND AUTO THEFT"                                        
   V421 = "APR: UF TRUCK/BUS THEFT"                                        
   V422 = "APR: UNFND OTH VHC THEFT"                                       
   V423 = "APR: UNFOUND ALL FIELDS"                                        
   V424 = "APR: ACT NUM MURDER"                                            
   V425 = "APR: ACT NUM MANSLGHTR"                                         
   V426 = "APR: ACT NUM RAPE TOTL"                                         
   V427 = "APR: ACT NUM FORC RAPE"                                         
   V428 = "APR: ACT NUM ATMPTD RAPE"                                       
   V429 = "APR: ACT NUM ROBBRY TOTL"                                       
   V430 = "APR: ACT NUM GUN ROBBERY"                                       
   V431 = "APR: ACT NUM KNIFE ROBRY"                                       
   V432 = "APR: ACT NUM OTH WPN ROB"                                       
   V433 = "APR: ACT NUM STR ARM ROB"                                       
   V434 = "APR: ACT NUM ASSLT TOTAL"                                       
   V435 = "APR: ACT NUM GUN ASSAULT"                                       
   V436 = "APR: ACT NUM KNIFE ASSLT"                                       
   V437 = "APR: ACT # OTH WPN ASSLT"                                       
   V438 = "APR: ACT # HND/FEET ASLT"                                       
   V439 = "APR: ACT # SIMPLE ASSLT"                                        
   V440 = "APR: ACT # BURGLARY TOTL"                                       
   V441 = "APR: ACT # FORCE ENTRY"                                         
   V442 = "APR: ACT # ENTRY-NO FORC"                                       
   V443 = "APR: ACT # ATT BURGLARY"                                        
   V444 = "APR: ACT # LARCENY TOTAL"                                       
   V445 = "APR: ACT # VHC THEFT TOT"                                       
   V446 = "APR: ACT # AUTO THEFT"                                          
   V447 = "APR: ACT # TRCK/BUS THFT"                                       
   V448 = "APR: ACT # OTH VHC THEFT"                                       
   V449 = "APR: ACT # ALL FIELDS"                                          
   V450 = "APR: TOT CLR MURDER"                                            
   V451 = "APR: TOT CLR MANSLGHTR"                                         
   V452 = "APR: TOT CLR RAPE TOTAL"                                        
   V453 = "APR: TOT CLR FORC RAPE"                                         
   V454 = "APR: TOT CLR ATMPTD RAPE"                                       
   V455 = "APR: TOT CLR TOTL ROBERY"                                       
   V456 = "APR: TOT CLR GUN ROBBERY"                                       
   V457 = "APR: TOT CLR KNIFE ROBRY"                                       
   V458 = "APR: TOT CLR OTH WPN ROB"                                       
   V459 = "APR: TOT CLR STR ARM ROB"                                       
   V460 = "APR: TOT CLR ASSLT TOTAL"                                       
   V461 = "APR: TOT CLR GUN ASSAULT"                                       
   V462 = "APR: TOT CLR KNIFE ASSLT"                                       
   V463 = "APR:TOT CLR OTH WPN ASLT"                                       
   V464 = "APR: TOT CLR HND/FT ASLT"                                       
   V465 = "APR: TOT CLR SIMPLE ASLT"                                       
   V466 = "APR: TOT CLR BRGLRY TOTL"                                       
   V467 = "APR: TOT CLR FORC ENTRY"                                        
   V468 = "APR: TOT CLR ENTR-NO FRC"                                       
   V469 = "APR: TOT CLR ATT BURGLRY"                                       
   V470 = "APR: TOT CLR LARCNY TOTL"                                       
   V471 = "APR:TOT CLR VHC THFT TOT"                                       
   V472 = "APR: TOT CLR AUTO THEFT"                                        
   V473 = "APR:TOT CLR TRCK/BS THFT"                                       
   V474 = "APR:TOT CLR OTH VHC THFT"                                       
   V475 = "APR: TOT CLR ALL FIELDS"                                        
   V476 = "APR: CLR<18 MURDER"                                             
   V477 = "APR: CLR<18 MANSLGHTR"                                          
   V478 = "APR: CLR<18 RAPE TOTAL"                                         
   V479 = "APR: CLR<18 FORCE RAPE"                                         
   V480 = "APR: CLR<18 ATTMPTD RAPE"                                       
   V481 = "APR: CLR<18 ROBBERY TOTL"                                       
   V482 = "APR: CLR<18 GUN ROBBERY"                                        
   V483 = "APR: CLR<18 KNIFE ROBBRY"                                       
   V484 = "APR: CLR<18 OTH WPN RBRY"                                       
   V485 = "APR: CLR<18 STR ARM ROB"                                        
   V486 = "APR: CLR<18 ASSLT TOTAL"                                        
   V487 = "APR: CLR<18 GUN ASSAULT"                                        
   V488 = "APR: CLR<18 KNIFE ASSLT"                                        
   V489 = "APR: CLR<18 OTH WPN ASLT"                                       
   V490 = "APR: CLR<18 HND/FT ASSLT"                                       
   V491 = "APR: CLR<18 SIMPLE ASSLT"                                       
   V492 = "APR: CLR<18 BURGLRY TOTL"                                       
   V493 = "APR: CLR<18 FORC ENTRY"                                         
   V494 = "APR: CLR<18 ENTR-NO FORC"                                       
   V495 = "APR: CLR<18 ATT BURGLARY"                                       
   V496 = "APR: CLR<18 LARCENY TOTL"                                       
   V497 = "APR: CLR<18 VHC THFT TOT"                                       
   V498 = "APR: CLR<18 AUTO THEFT"                                         
   V499 = "APR: CLR<18 TRCK/BS THFT"                                       
   V500 = "APR: CLR<18 OTH VHC THFT"                                       
   V501 = "APR: CLR<18 ALL FIELDS"                                         
   V502 = "APR: OFFICRS KILL BY FEL"                                       
   V503 = "APR: OFFICRS KILL BY ACC"                                       
   V504 = "APR: OFFICERS ASSAULTED"                                        
   V505 = "MAY: MONTH INCLUDED IN"                                         
   V506 = "MAY: LAST UPDATE"                                               
   V507 = "MAY: CARD 0 TYPE"                                               
   V508 = "MAY: CARD 1 TYPE"                                               
   V509 = "MAY: CARD 2 TYPE"                                               
   V510 = "MAY: CARD 3 TYPE"                                               
   V511 = "MAY: CARD 4 TYPE"                                               
   V512 = "MAY: CARD 0 P/T"                                                
   V513 = "MAY: CARD 1 P/T"                                                
   V514 = "MAY: CARD 2 P/T"                                                
   V515 = "MAY: CARD 3 P/T"                                                
   V516 = "MAY: UNFOUNDED MURDER"                                          
   V517 = "MAY: UNFOUNDED MANSLGHTR"                                       
   V518 = "MAY: UNFOUNDED RAPE TOTL"                                       
   V519 = "MAY: UNFOUNDED FORC RAPE"                                       
   V520 = "MAY: UNFOUND ATMPTD RAPE"                                       
   V521 = "MAY: UNFOUND ROBBRY TOTL"                                       
   V522 = "MAY: UNFOUND GUN ROBBERY"                                       
   V523 = "MAY: UNFOUNDED KNIFE ROB"                                       
   V524 = "MAY: UNFND OTHR WEAP ROB"                                       
   V525 = "MAY: UNFND STRNG-ARM ROB"                                       
   V526 = "MAY: UNFOUND ASSLT TOTAL"                                       
   V527 = "MAY: UNFOUND GUN ASSLT"                                         
   V528 = "MAY: UNFOUND KNIFE ASSLT"                                       
   V529 = "MAY: UNFND OTH WPN ASLT"                                        
   V530 = "MAY: UNFND HND/FEET ASLT"                                       
   V531 = "MAY: UNFND SIMPL ASSAULT"                                       
   V532 = "MAY: UNFOUND BURG TOTAL"                                        
   V533 = "MAY: UNFOUND FORCE ENTRY"                                       
   V534 = "MAY: UNFND ENTRY-NO FORC"                                       
   V535 = "MAY: UNFND ATT BURGLARY"                                        
   V536 = "MAY: UNFOUND LARCNY TOTL"                                       
   V537 = "MAY: UF TOT MTR VHC THFT"                                       
   V538 = "MAY: UNFOUND AUTO THEFT"                                        
   V539 = "MAY: UF TRUCK/BUS THEFT"                                        
   V540 = "MAY: UNFND OTH VHC THEFT"                                       
   V541 = "MAY: UNFOUND ALL FIELDS"                                        
   V542 = "MAY: ACT NUM MURDER"                                            
   V543 = "MAY: ACT NUM MANSLGHTR"                                         
   V544 = "MAY: ACT NUM RAPE TOTL"                                         
   V545 = "MAY: ACT NUM FORC RAPE"                                         
   V546 = "MAY: ACT NUM ATMPTD RAPE"                                       
   V547 = "MAY: ACT NUM ROBBRY TOTL"                                       
   V548 = "MAY: ACT NUM GUN ROBBERY"                                       
   V549 = "MAY: ACT NUM KNIFE ROBRY"                                       
   V550 = "MAY: ACT NUM OTH WPN ROB"                                       
   V551 = "MAY: ACT NUM STR ARM ROB"                                       
   V552 = "MAY: ACT NUM ASSLT TOTAL"                                       
   V553 = "MAY: ACT NUM GUN ASSAULT"                                       
   V554 = "MAY: ACT NUM KNIFE ASSLT"                                       
   V555 = "MAY: ACT # OTH WPN ASSLT"                                       
   V556 = "MAY: ACT # HND/FEET ASLT"                                       
   V557 = "MAY: ACT # SIMPLE ASSLT"                                        
   V558 = "MAY: ACT # BURGLARY TOTL"                                       
   V559 = "MAY: ACT # FORCE ENTRY"                                         
   V560 = "MAY: ACT # ENTRY-NO FORC"                                       
   V561 = "MAY: ACT # ATT BURGLARY"                                        
   V562 = "MAY: ACT # LARCENY TOTAL"                                       
   V563 = "MAY: ACT # VHC THEFT TOT"                                       
   V564 = "MAY: ACT # AUTO THEFT"                                          
   V565 = "MAY: ACT # TRCK/BUS THFT"                                       
   V566 = "MAY: ACT # OTH VHC THEFT"                                       
   V567 = "MAY: ACT # ALL FIELDS"                                          
   V568 = "MAY: TOT CLR MURDER"                                            
   V569 = "MAY: TOT CLR MANSLGHTR"                                         
   V570 = "MAY: TOT CLR RAPE TOTAL"                                        
   V571 = "MAY: TOT CLR FORC RAPE"                                         
   V572 = "MAY: TOT CLR ATMPTD RAPE"                                       
   V573 = "MAY: TOT CLR TOTL ROBERY"                                       
   V574 = "MAY: TOT CLR GUN ROBBERY"                                       
   V575 = "MAY: TOT CLR KNIFE ROBRY"                                       
   V576 = "MAY: TOT CLR OTH WPN ROB"                                       
   V577 = "MAY: TOT CLR STR ARM ROB"                                       
   V578 = "MAY: TOT CLR ASSLT TOTAL"                                       
   V579 = "MAY: TOT CLR GUN ASSAULT"                                       
   V580 = "MAY: TOT CLR KNIFE ASSLT"                                       
   V581 = "MAY:TOT CLR OTH WPN ASLT"                                       
   V582 = "MAY: TOT CLR HND/FT ASLT"                                       
   V583 = "MAY: TOT CLR SIMPLE ASLT"                                       
   V584 = "MAY: TOT CLR BRGLRY TOTL"                                       
   V585 = "MAY: TOT CLR FORC ENTRY"                                        
   V586 = "MAY: TOT CLR ENTR-NO FRC"                                       
   V587 = "MAY: TOT CLR ATT BURGLRY"                                       
   V588 = "MAY: TOT CLR LARCNY TOTL"                                       
   V589 = "MAY:TOT CLR VHC THFT TOT"                                       
   V590 = "MAY: TOT CLR AUTO THEFT"                                        
   V591 = "MAY:TOT CLR TRCK/BS THFT"                                       
   V592 = "MAY:TOT CLR OTH VHC THFT"                                       
   V593 = "MAY: TOT CLR ALL FIELDS"                                        
   V594 = "MAY: CLR<18 MURDER"                                             
   V595 = "MAY: CLR<18 MANSLGHTR"                                          
   V596 = "MAY: CLR<18 RAPE TOTAL"                                         
   V597 = "MAY: CLR<18 FORCE RAPE"                                         
   V598 = "MAY: CLR<18 ATTMPTD RAPE"                                       
   V599 = "MAY: CLR<18 ROBBERY TOTL"                                       
   V600 = "MAY: CLR<18 GUN ROBBERY"                                        
   V601 = "MAY: CLR<18 KNIFE ROBBRY"                                       
   V602 = "MAY: CLR<18 OTH WPN RBRY"                                       
   V603 = "MAY: CLR<18 STR ARM ROB"                                        
   V604 = "MAY: CLR<18 ASSLT TOTAL"                                        
   V605 = "MAY: CLR<18 GUN ASSAULT"                                        
   V606 = "MAY: CLR<18 KNIFE ASSLT"                                        
   V607 = "MAY: CLR<18 OTH WPN ASLT"                                       
   V608 = "MAY: CLR<18 HND/FT ASSLT"                                       
   V609 = "MAY: CLR<18 SIMPLE ASSLT"                                       
   V610 = "MAY: CLR<18 BURGLRY TOTL"                                       
   V611 = "MAY: CLR<18 FORC ENTRY"                                         
   V612 = "MAY: CLR<18 ENTR-NO FORC"                                       
   V613 = "MAY: CLR<18 ATT BURGLARY"                                       
   V614 = "MAY: CLR<18 LARCENY TOTL"                                       
   V615 = "MAY: CLR<18 VHC THFT TOT"                                       
   V616 = "MAY: CLR<18 AUTO THEFT"                                         
   V617 = "MAY: CLR<18 TRCK/BS THFT"                                       
   V618 = "MAY: CLR<18 OTH VHC THFT"                                       
   V619 = "MAY: CLR<18 ALL FIELDS"                                         
   V620 = "MAY: OFFICRS KILL BY FEL"                                       
   V621 = "MAY: OFFICRS KILL BY ACC"                                       
   V622 = "MAY: OFFICERS ASSAULTED"                                        
   V623 = "JUN: MONTH INCLUDED IN"                                         
   V624 = "JUN: LAST UPDATE"                                               
   V625 = "JUN: CARD 0 TYPE"                                               
   V626 = "JUN: CARD 1 TYPE"                                               
   V627 = "JUN: CARD 2 TYPE"                                               
   V628 = "JUN: CARD 3 TYPE"                                               
   V629 = "JUN: CARD 4 TYPE"                                               
   V630 = "JUN: CARD 0 P/T"                                                
   V631 = "JUN: CARD 1 P/T"                                                
   V632 = "JUN: CARD 2 P/T"                                                
   V633 = "JUN: CARD 3 P/T"                                                
   V634 = "JUN: UNFOUNDED MURDER"                                          
   V635 = "JUN: UNFOUNDED MANSLGHTR"                                       
   V636 = "JUN: UNFOUNDED RAPE TOTL"                                       
   V637 = "JUN: UNFOUNDED FORC RAPE"                                       
   V638 = "JUN: UNFOUND ATMPTD RAPE"                                       
   V639 = "JUN: UNFOUND ROBBRY TOTL"                                       
   V640 = "JUN: UNFOUND GUN ROBBERY"                                       
   V641 = "JUN: UNFOUNDED KNIFE ROB"                                       
   V642 = "JUN: UNFND OTHR WEAP ROB"                                       
   V643 = "JUN: UNFND STRNG-ARM ROB"                                       
   V644 = "JUN: UNFOUND ASSLT TOTAL"                                       
   V645 = "JUN: UNFOUND GUN ASSLT"                                         
   V646 = "JUN: UNFOUND KNIFE ASSLT"                                       
   V647 = "JUN: UNFND OTH WPN ASLT"                                        
   V648 = "JUN: UNFND HND/FEET ASLT"                                       
   V649 = "JUN: UNFND SIMPL ASSAULT"                                       
   V650 = "JUN: UNFOUND BURG TOTAL"                                        
   V651 = "JUN: UNFOUND FORCE ENTRY"                                       
   V652 = "JUN: UNFND ENTRY-NO FORC"                                       
   V653 = "JUN: UNFND ATT BURGLARY"                                        
   V654 = "JUN: UNFOUND LARCNY TOTL"                                       
   V655 = "JUN: UF TOT MTR VHC THFT"                                       
   V656 = "JUN: UNFOUND AUTO THEFT"                                        
   V657 = "JUN: UF TRUCK/BUS THEFT"                                        
   V658 = "JUN: UNFND OTH VHC THEFT"                                       
   V659 = "JUN: UNFOUND ALL FIELDS"                                        
   V660 = "JUN: ACT NUM MURDER"                                            
   V661 = "JUN: ACT NUM MANSLGHTR"                                         
   V662 = "JUN: ACT NUM RAPE TOTL"                                         
   V663 = "JUN: ACT NUM FORC RAPE"                                         
   V664 = "JUN: ACT NUM ATMPTD RAPE"                                       
   V665 = "JUN: ACT NUM ROBBRY TOTL"                                       
   V666 = "JUN: ACT NUM GUN ROBBERY"                                       
   V667 = "JUN: ACT NUM KNIFE ROBRY"                                       
   V668 = "JUN: ACT NUM OTH WPN ROB"                                       
   V669 = "JUN: ACT NUM STR ARM ROB"                                       
   V670 = "JUN: ACT NUM ASSLT TOTAL"                                       
   V671 = "JUN: ACT NUM GUN ASSAULT"                                       
   V672 = "JUN: ACT NUM KNIFE ASSLT"                                       
   V673 = "JUN: ACT # OTH WPN ASSLT"                                       
   V674 = "JUN: ACT # HND/FEET ASLT"                                       
   V675 = "JUN: ACT # SIMPLE ASSLT"                                        
   V676 = "JUN: ACT # BURGLARY TOTL"                                       
   V677 = "JUN: ACT # FORCE ENTRY"                                         
   V678 = "JUN: ACT # ENTRY-NO FORC"                                       
   V679 = "JUN: ACT # ATT BURGLARY"                                        
   V680 = "JUN: ACT # LARCENY TOTAL"                                       
   V681 = "JUN: ACT # VHC THEFT TOT"                                       
   V682 = "JUN: ACT # AUTO THEFT"                                          
   V683 = "JUN: ACT # TRCK/BUS THFT"                                       
   V684 = "JUN: ACT # OTH VHC THEFT"                                       
   V685 = "JUN: ACT # ALL FIELDS"                                          
   V686 = "JUN: TOT CLR MURDER"                                            
   V687 = "JUN: TOT CLR MANSLGHTR"                                         
   V688 = "JUN: TOT CLR RAPE TOTAL"                                        
   V689 = "JUN: TOT CLR FORC RAPE"                                         
   V690 = "JUN: TOT CLR ATMPTD RAPE"                                       
   V691 = "JUN: TOT CLR TOTL ROBERY"                                       
   V692 = "JUN: TOT CLR GUN ROBBERY"                                       
   V693 = "JUN: TOT CLR KNIFE ROBRY"                                       
   V694 = "JUN: TOT CLR OTH WPN ROB"                                       
   V695 = "JUN: TOT CLR STR ARM ROB"                                       
   V696 = "JUN: TOT CLR ASSLT TOTAL"                                       
   V697 = "JUN: TOT CLR GUN ASSAULT"                                       
   V698 = "JUN: TOT CLR KNIFE ASSLT"                                       
   V699 = "JUN: TOT CLR OTH WPN ASLT"                                      
   V700 = "JUN: TOT CLR HND/FT ASLT"                                       
   V701 = "JUN: TOT CLR SIMPLE ASLT"                                       
   V702 = "JUN: TOT CLR BRGLRY TOTL"                                       
   V703 = "JUN: TOT CLR FORC ENTRY"                                        
   V704 = "JUN: TOT CLR ENTR-NO FRC"                                       
   V705 = "JUN: TOT CLR ATT BURGLRY"                                       
   V706 = "JUN: TOT CLR LARCNY TOTL"                                       
   V707 = "JUN: TOT CLR VHC THFT TOT"                                      
   V708 = "JUN: TOT CLR AUTO THEFT"                                        
   V709 = "JUN: TOT CLR TRCK/BS THFT"                                      
   V710 = "JUN: TOT CLR OTH VHC THFT"                                      
   V711 = "JUN: TOT CLR ALL FIELDS"                                        
   V712 = "JUN: CLR<18 MURDER"                                             
   V713 = "JUN: CLR<18 MANSLGHTR"                                          
   V714 = "JUN: CLR<18 RAPE TOTAL"                                         
   V715 = "JUN: CLR<18 FORCE RAPE"                                         
   V716 = "JUN: CLR<18 ATTMPTD RAPE"                                       
   V717 = "JUN: CLR<18 ROBBERY TOTL"                                       
   V718 = "JUN: CLR<18 GUN ROBBERY"                                        
   V719 = "JUN: CLR<18 KNIFE ROBBRY"                                       
   V720 = "JUN: CLR<18 OTH WPN RBRY"                                       
   V721 = "JUN: CLR<18 STR ARM ROB"                                        
   V722 = "JUN: CLR<18 ASSLT TOTAL"                                        
   V723 = "JUN: CLR<18 GUN ASSAULT"                                        
   V724 = "JUN: CLR<18 KNIFE ASSLT"                                        
   V725 = "JUN: CLR<18 OTH WPN ASLT"                                       
   V726 = "JUN: CLR<18 HND/FT ASSLT"                                       
   V727 = "JUN: CLR<18 SIMPLE ASSLT"                                       
   V728 = "JUN: CLR<18 BURGLRY TOTL"                                       
   V729 = "JUN: CLR<18 FORC ENTRY"                                         
   V730 = "JUN: CLR<18 ENTR-NO FORC"                                       
   V731 = "JUN: CLR<18 ATT BURGLARY"                                       
   V732 = "JUN: CLR<18 LARCENY TOTL"                                       
   V733 = "JUN: CLR<18 VHC THFT TOT"                                       
   V734 = "JUN: CLR<18 AUTO THEFT"                                         
   V735 = "JUN: CLR<18 TRCK/BS THFT"                                       
   V736 = "JUN: CLR<18 OTH VHC THFT"                                       
   V737 = "JUN: CLR<18 ALL FIELDS"                                         
   V738 = "JUN: OFFICRS KILL BY FEL"                                       
   V739 = "JUN: OFFICRS KILL BY ACC"                                       
   V740 = "JUN: OFFICERS ASSAULTED"                                        
   V741 = "JUL: MONTH INCLUDED IN"                                         
   V742 = "JUL: LAST UPDATE"                                               
   V743 = "JUL: CARD 0 TYPE"                                               
   V744 = "JUL: CARD 1 TYPE"                                               
   V745 = "JUL: CARD 2 TYPE"                                               
   V746 = "JUL: CARD 3 TYPE"                                               
   V747 = "JUL: CARD 4 TYPE"                                               
   V748 = "JUL: CARD 0 P/T"                                                
   V749 = "JUL: CARD 1 P/T"                                                
   V750 = "JUL: CARD 2 P/T"                                                
   V751 = "JUL: CARD 3 P/T"                                                
   V752 = "JUL: UNFOUNDED MURDER"                                          
   V753 = "JUL: UNFOUNDED MANSLGHTR"                                       
   V754 = "JUL: UNFOUNDED RAPE TOTL"                                       
   V755 = "JUL: UNFOUNDED FORC RAPE"                                       
   V756 = "JUL: UNFOUND ATMPTD RAPE"                                       
   V757 = "JUL: UNFOUND ROBBRY TOTL"                                       
   V758 = "JUL: UNFOUND GUN ROBBERY"                                       
   V759 = "JUL: UNFOUNDED KNIFE ROB"                                       
   V760 = "JUL: UNFND OTHR WEAP ROB"                                       
   V761 = "JUL: UNFND STRNG-ARM ROB"                                       
   V762 = "JUL: UNFOUND ASSLT TOTAL"                                       
   V763 = "JUL: UNFOUND GUN ASSLT"                                         
   V764 = "JUL: UNFOUND KNIFE ASSLT"                                       
   V765 = "JUL: UNFND OTH WPN ASLT"                                        
   V766 = "JUL: UNFND HND/FEET ASLT"                                       
   V767 = "JUL: UNFND SIMPL ASSAULT"                                       
   V768 = "JUL: UNFOUND BURG TOTAL"                                        
   V769 = "JUL: UNFOUND FORCE ENTRY"                                       
   V770 = "JUL: UNFND ENTRY-NO FORC"                                       
   V771 = "JUL: UNFND ATT BURGLARY"                                        
   V772 = "JUL: UNFOUND LARCNY TOTL"                                       
   V773 = "JUL: UF TOT MTR VHC THFT"                                       
   V774 = "JUL: UNFOUND AUTO THEFT"                                        
   V775 = "JUL: UF TRUCK/BUS THEFT"                                        
   V776 = "JUL: UNFND OTH VHC THEFT"                                       
   V777 = "JUL: UNFOUND ALL FIELDS"                                        
   V778 = "JUL: ACT NUM MURDER"                                            
   V779 = "JUL: ACT NUM MANSLGHTR"                                         
   V780 = "JUL: ACT NUM RAPE TOTL"                                         
   V781 = "JUL: ACT NUM FORC RAPE"                                         
   V782 = "JUL: ACT NUM ATMPTD RAPE"                                       
   V783 = "JUL: ACT NUM ROBBRY TOTL"                                       
   V784 = "JUL: ACT NUM GUN ROBBERY"                                       
   V785 = "JUL: ACT NUM KNIFE ROBRY"                                       
   V786 = "JUL: ACT NUM OTH WPN ROB"                                       
   V787 = "JUL: ACT NUM STR ARM ROB"                                       
   V788 = "JUL: ACT NUM ASSLT TOTAL"                                       
   V789 = "JUL: ACT NUM GUN ASSAULT"                                       
   V790 = "JUL: ACT NUM KNIFE ASSLT"                                       
   V791 = "JUL: ACT # OTH WPN ASSLT"                                       
   V792 = "JUL: ACT # HND/FEET ASLT"                                       
   V793 = "JUL: ACT # SIMPLE ASSLT"                                        
   V794 = "JUL: ACT # BURGLARY TOTL"                                       
   V795 = "JUL: ACT # FORCE ENTRY"                                         
   V796 = "JUL: ACT # ENTRY-NO FORC"                                       
   V797 = "JUL: ACT # ATT BURGLARY"                                        
   V798 = "JUL: ACT # LARCENY TOTAL"                                       
   V799 = "JUL: ACT # VHC THEFT TOT"                                       
   V800 = "JUL: ACT # AUTO THEFT"                                          
   V801 = "JUL: ACT # TRCK/BUS THFT"                                       
   V802 = "JUL: ACT # OTH VHC THEFT"                                       
   V803 = "JUL: ACT # ALL FIELDS"                                          
   V804 = "JUL: TOT CLR MURDER"                                            
   V805 = "JUL: TOT CLR MANSLGHTR"                                         
   V806 = "JUL: TOT CLR RAPE TOTAL"                                        
   V807 = "JUL: TOT CLR FORC RAPE"                                         
   V808 = "JUL: TOT CLR ATMPTD RAPE"                                       
   V809 = "JUL: TOT CLR TOTL ROBERY"                                       
   V810 = "JUL: TOT CLR GUN ROBBERY"                                       
   V811 = "JUL: TOT CLR KNIFE ROBRY"                                       
   V812 = "JUL: TOT CLR OTH WPN ROB"                                       
   V813 = "JUL: TOT CLR STR ARM ROB"                                       
   V814 = "JUL: TOT CLR ASSLT TOTAL"                                       
   V815 = "JUL: TOT CLR GUN ASSAULT"                                       
   V816 = "JUL: TOT CLR KNIFE ASSLT"                                       
   V817 = "JUL: TOT CLR OTH WPN ASLT"                                      
   V818 = "JUL: TOT CLR HND/FT ASLT"                                       
   V819 = "JUL: TOT CLR SIMPLE ASLT"                                       
   V820 = "JUL: TOT CLR BRGLRY TOTL"                                       
   V821 = "JUL: TOT CLR FORC ENTRY"                                        
   V822 = "JUL: TOT CLR ENTR-NO FRC"                                       
   V823 = "JUL: TOT CLR ATT BURGLRY"                                       
   V824 = "JUL: TOT CLR LARCNY TOTL"                                       
   V825 = "JUL: TOT CLR VHC THFT TOT"                                      
   V826 = "JUL: TOT CLR AUTO THEFT"                                        
   V827 = "JUL: TOT CLR TRCK/BS THFT"                                      
   V828 = "JUL: TOT CLR OTH VHC THFT"                                      
   V829 = "JUL: TOT CLR ALL FIELDS"                                        
   V830 = "JUL: CLR<18 MURDER"                                             
   V831 = "JUL: CLR<18 MANSLGHTR"                                          
   V832 = "JUL: CLR<18 RAPE TOTAL"                                         
   V833 = "JUL: CLR<18 FORCE RAPE"                                         
   V834 = "JUL: CLR<18 ATTMPTD RAPE"                                       
   V835 = "JUL: CLR<18 ROBBERY TOTL"                                       
   V836 = "JUL: CLR<18 GUN ROBBERY"                                        
   V837 = "JUL: CLR<18 KNIFE ROBBRY"                                       
   V838 = "JUL: CLR<18 OTH WPN RBRY"                                       
   V839 = "JUL: CLR<18 STR ARM ROB"                                        
   V840 = "JUL: CLR<18 ASSLT TOTAL"                                        
   V841 = "JUL: CLR<18 GUN ASSAULT"                                        
   V842 = "JUL: CLR<18 KNIFE ASSLT"                                        
   V843 = "JUL: CLR<18 OTH WPN ASLT"                                       
   V844 = "JUL: CLR<18 HND/FT ASSLT"                                       
   V845 = "JUL: CLR<18 SIMPLE ASSLT"                                       
   V846 = "JUL: CLR<18 BURGLRY TOTL"                                       
   V847 = "JUL: CLR<18 FORC ENTRY"                                         
   V848 = "JUL: CLR<18 ENTR-NO FORC"                                       
   V849 = "JUL: CLR<18 ATT BURGLARY"                                       
   V850 = "JUL: CLR<18 LARCENY TOTL"                                       
   V851 = "JUL: CLR<18 VHC THFT TOT"                                       
   V852 = "JUL: CLR<18 AUTO THEFT"                                         
   V853 = "JUL: CLR<18 TRCK/BS THFT"                                       
   V854 = "JUL: CLR<18 OTH VHC THFT"                                       
   V855 = "JUL: CLR<18 ALL FIELDS"                                         
   V856 = "JUL: OFFICRS KILL BY FEL"                                       
   V857 = "JUL: OFFICRS KILL BY ACC"                                       
   V858 = "JUL: OFFICERS ASSAULTED"                                        
   V859 = "AUG: MONTH INCLUDED IN"                                         
   V860 = "AUG: LAST UPDATE"                                               
   V861 = "AUG: CARD 0 TYPE"                                               
   V862 = "AUG: CARD 1 TYPE"                                               
   V863 = "AUG: CARD 2 TYPE"                                               
   V864 = "AUG: CARD 3 TYPE"                                               
   V865 = "AUG: CARD 4 TYPE"                                               
   V866 = "AUG: CARD 0 P/T"                                                
   V867 = "AUG: CARD 1 P/T"                                                
   V868 = "AUG: CARD 2 P/T"                                                
   V869 = "AUG: CARD 3 P/T"                                                
   V870 = "AUG: UNFOUNDED MURDER"                                          
   V871 = "AUG: UNFOUNDED MANSLGHTR"                                       
   V872 = "AUG: UNFOUNDED RAPE TOTL"                                       
   V873 = "AUG: UNFOUNDED FORC RAPE"                                       
   V874 = "AUG: UNFOUND ATMPTD RAPE"                                       
   V875 = "AUG: UNFOUND ROBBRY TOTL"                                       
   V876 = "AUG: UNFOUND GUN ROBBERY"                                       
   V877 = "AUG: UNFOUNDED KNIFE ROB"                                       
   V878 = "AUG: UNFND OTHR WEAP ROB"                                       
   V879 = "AUG: UNFND STRNG-ARM ROB"                                       
   V880 = "AUG: UNFOUND ASSLT TOTAL"                                       
   V881 = "AUG: UNFOUND GUN ASSLT"                                         
   V882 = "AUG: UNFOUND KNIFE ASSLT"                                       
   V883 = "AUG: UNFND OTH WPN ASLT"                                        
   V884 = "AUG: UNFND HND/FEET ASLT"                                       
   V885 = "AUG: UNFND SIMPL ASSAULT"                                       
   V886 = "AUG: UNFOUND BURG TOTAL"                                        
   V887 = "AUG: UNFOUND FORCE ENTRY"                                       
   V888 = "AUG: UNFND ENTRY-NO FORC"                                       
   V889 = "AUG: UNFND ATT BURGLARY"                                        
   V890 = "AUG: UNFOUND LARCNY TOTL"                                       
   V891 = "AUG: UF TOT MTR VHC THFT"                                       
   V892 = "AUG: UNFOUND AUTO THEFT"                                        
   V893 = "AUG: UF TRUCK/BUS THEFT"                                        
   V894 = "AUG: UNFND OTH VHC THEFT"                                       
   V895 = "AUG: UNFOUND ALL FIELDS"                                        
   V896 = "AUG: ACT NUM MURDER"                                            
   V897 = "AUG: ACT NUM MANSLGHTR"                                         
   V898 = "AUG: ACT NUM RAPE TOTL"                                         
   V899 = "AUG: ACT NUM FORC RAPE"                                         
   V900 = "AUG: ACT NUM ATMPTD RAPE"                                       
   V901 = "AUG: ACT NUM ROBBRY TOTL"                                       
   V902 = "AUG: ACT NUM GUN ROBBERY"                                       
   V903 = "AUG: ACT NUM KNIFE ROBRY"                                       
   V904 = "AUG: ACT NUM OTH WPN ROB"                                       
   V905 = "AUG: ACT NUM STR ARM ROB"                                       
   V906 = "AUG: ACT NUM ASSLT TOTAL"                                       
   V907 = "AUG: ACT NUM GUN ASSAULT"                                       
   V908 = "AUG: ACT NUM KNIFE ASSLT"                                       
   V909 = "AUG: ACT # OTH WPN ASSLT"                                       
   V910 = "AUG: ACT # HND/FEET ASLT"                                       
   V911 = "AUG: ACT # SIMPLE ASSLT"                                        
   V912 = "AUG: ACT # BURGLARY TOTL"                                       
   V913 = "AUG: ACT # FORCE ENTRY"                                         
   V914 = "AUG: ACT # ENTRY-NO FORC"                                       
   V915 = "AUG: ACT # ATT BURGLARY"                                        
   V916 = "AUG: ACT # LARCENY TOTAL"                                       
   V917 = "AUG: ACT # VHC THEFT TOT"                                       
   V918 = "AUG: ACT # AUTO THEFT"                                          
   V919 = "AUG: ACT # TRCK/BUS THFT"                                       
   V920 = "AUG: ACT # OTH VHC THEFT"                                       
   V921 = "AUG: ACT # ALL FIELDS"                                          
   V922 = "AUG: TOT CLR MURDER"                                            
   V923 = "AUG: TOT CLR MANSLGHTR"                                         
   V924 = "AUG: TOT CLR RAPE TOTAL"                                        
   V925 = "AUG: TOT CLR FORC RAPE"                                         
   V926 = "AUG: TOT CLR ATMPTD RAPE"                                       
   V927 = "AUG: TOT CLR TOTL ROBERY"                                       
   V928 = "AUG: TOT CLR GUN ROBBERY"                                       
   V929 = "AUG: TOT CLR KNIFE ROBRY"                                       
   V930 = "AUG: TOT CLR OTH WPN ROB"                                       
   V931 = "AUG: TOT CLR STR ARM ROB"                                       
   V932 = "AUG: TOT CLR ASSLT TOTAL"                                       
   V933 = "AUG: TOT CLR GUN ASSAULT"                                       
   V934 = "AUG: TOT CLR KNIFE ASSLT"                                       
   V935 = "AUG: TOT CLR OTH WPN ASLT"                                      
   V936 = "AUG: TOT CLR HND/FT ASLT"                                       
   V937 = "AUG: TOT CLR SIMPLE ASLT"                                       
   V938 = "AUG: TOT CLR BRGLRY TOTL"                                       
   V939 = "AUG: TOT CLR FORC ENTRY"                                        
   V940 = "AUG: TOT CLR ENTR-NO FRC"                                       
   V941 = "AUG: TOT CLR ATT BURGLRY"                                       
   V942 = "AUG: TOT CLR LARCNY TOTL"                                       
   V943 = "AUG: TOT CLR VHC THFT TOT"                                      
   V944 = "AUG: TOT CLR AUTO THEFT"                                        
   V945 = "AUG: TOT CLR TRCK/BS THFT"                                      
   V946 = "AUG: TOT CLR OTH VHC THFT"                                      
   V947 = "AUG: TOT CLR ALL FIELDS"                                        
   V948 = "AUG: CLR<18 MURDER"                                             
   V949 = "AUG: CLR<18 MANSLGHTR"                                          
   V950 = "AUG: CLR<18 RAPE TOTAL"                                         
   V951 = "AUG: CLR<18 FORCE RAPE"                                         
   V952 = "AUG: CLR<18 ATTMPTD RAPE"                                       
   V953 = "AUG: CLR<18 ROBBERY TOTL"                                       
   V954 = "AUG: CLR<18 GUN ROBBERY"                                        
   V955 = "AUG: CLR<18 KNIFE ROBBRY"                                       
   V956 = "AUG: CLR<18 OTH WPN RBRY"                                       
   V957 = "AUG: CLR<18 STR ARM ROB"                                        
   V958 = "AUG: CLR<18 ASSLT TOTAL"                                        
   V959 = "AUG: CLR<18 GUN ASSAULT"                                        
   V960 = "AUG: CLR<18 KNIFE ASSLT"                                        
   V961 = "AUG: CLR<18 OTH WPN ASLT"                                       
   V962 = "AUG: CLR<18 HND/FT ASSLT"                                       
   V963 = "AUG: CLR<18 SIMPLE ASSLT"                                       
   V964 = "AUG: CLR<18 BURGLRY TOTL"                                       
   V965 = "AUG: CLR<18 FORC ENTRY"                                         
   V966 = "AUG: CLR<18 ENTR-NO FORC"                                       
   V967 = "AUG: CLR<18 ATT BURGLARY"                                       
   V968 = "AUG: CLR<18 LARCENY TOTL"                                       
   V969 = "AUG: CLR<18 VHC THFT TOT"                                       
   V970 = "AUG: CLR<18 AUTO THEFT"                                         
   V971 = "AUG: CLR<18 TRCK/BS THFT"                                       
   V972 = "AUG: CLR<18 OTH VHC THFT"                                       
   V973 = "AUG: CLR<18 ALL FIELDS"                                         
   V974 = "AUG: OFFICRS KILL BY FEL"                                       
   V975 = "AUG: OFFICRS KILL BY ACC"                                       
   V976 = "AUG: OFFICERS ASSAULTED"                                        
   V977 = "SEP: MONTH INCLUDED IN"                                         
   V978 = "SEP: LAST UPDATE"                                               
   V979 = "SEP: CARD 0 TYPE"                                               
   V980 = "SEP: CARD 1 TYPE"                                               
   V981 = "SEP: CARD 2 TYPE"                                               
   V982 = "SEP: CARD 3 TYPE"                                               
   V983 = "SEP: CARD 4 TYPE"                                               
   V984 = "SEP: CARD 0 P/T"                                                
   V985 = "SEP: CARD 1 P/T"                                                
   V986 = "SEP: CARD 2 P/T"                                                
   V987 = "SEP: CARD 3 P/T"                                                
   V988 = "SEP: UNFOUNDED MURDER"                                          
   V989 = "SEP: UNFOUNDED MANSLGHTR"                                       
   V990 = "SEP: UNFOUNDED RAPE TOT"                                        
   V991 = "SEP: UNFOUNDED FORC RAP"                                        
   V992 = "SEP: UNFOUND ATMPTD RAP"                                        
   V993 = "SEP: UNFOUND ROBBRY TOT"                                        
   V994 = "SEP: UNFOUND GUN ROBBER"                                        
   V995 = "SEP: UNFOUNDED KNIFE RO"                                        
   V996 = "SEP: UNFND OTHR WEAP RO"                                        
   V997 = "SEP: UNFND STRNG-ARM RO"                                        
   V998 = "SEP: UNFOUND ASSLT TOTA"                                        
   V999 = "SEP: UNFOUND GUN ASSLT"                                         
   V1000 = "SEP: UNFOUND KNIFE ASSL"                                       
   V1001 = "SEP: UNFND OTH WPN ASLT"                                       
   V1002 = "SEP: UNFND HND/FEET ASL"                                       
   V1003 = "SEP: UNFND SIMPL ASSAUL"                                       
   V1004 = "SEP: UNFOUND BURG TOTAL"                                       
   V1005 = "SEP: UNFOUND FORCE ENTR"                                       
   V1006 = "SEP: UNFND ENTRY-NO FOR"                                       
   V1007 = "SEP: UNFND ATT BURGLARY"                                       
   V1008 = "SEP: UNFOUND LARCNY TOT"                                       
   V1009 = "SEP: UF TOT MTR VHC THF"                                       
   V1010 = "SEP: UNFOUND AUTO THEFT"                                       
   V1011 = "SEP: UF TRUCK/BUS THEFT"                                       
   V1012 = "SEP: UNFND OTH VHC THEF"                                       
   V1013 = "SEP: UNFOUND ALL FIELDS"                                       
   V1014 = "SEP: ACT NUM MURDER"                                           
   V1015 = "SEP: ACT NUM MANSLGHTR"                                        
   V1016 = "SEP: ACT NUM RAPE TOTL"                                        
   V1017 = "SEP: ACT NUM FORC RAPE"                                        
   V1018 = "SEP: ACT NUM ATMPTD RAP"                                       
   V1019 = "SEP: ACT NUM ROBBRY TOT"                                       
   V1020 = "SEP: ACT NUM GUN ROBBER"                                       
   V1021 = "SEP: ACT NUM KNIFE ROBR"                                       
   V1022 = "SEP: ACT NUM OTH WPN RO"                                       
   V1023 = "SEP: ACT NUM STR ARM RO"                                       
   V1024 = "SEP: ACT NUM ASSLT TOTA"                                       
   V1025 = "SEP: ACT NUM GUN ASSAUL"                                       
   V1026 = "SEP: ACT NUM KNIFE ASSL"                                       
   V1027 = "SEP: ACT # OTH WPN ASSL"                                       
   V1028 = "SEP: ACT # HND/FEET ASL"                                       
   V1029 = "SEP: ACT # SIMPLE ASSLT"                                       
   V1030 = "SEP: ACT # BURGLARY TOT"                                       
   V1031 = "SEP: ACT # FORCE ENTRY"                                        
   V1032 = "SEP: ACT # ENTRY-NO FOR"                                       
   V1033 = "SEP: ACT # ATT BURGLARY"                                       
   V1034 = "SEP: ACT # LARCENY TOTA"                                       
   V1035 = "SEP: ACT # VHC THEFT TO"                                       
   V1036 = "SEP: ACT # AUTO THEFT"                                         
   V1037 = "SEP: ACT # TRCK/BUS THF"                                       
   V1038 = "SEP: ACT # OTH VHC THEF"                                       
   V1039 = "SEP: ACT # ALL FIELDS"                                         
   V1040 = "SEP: TOT CLR MURDER"                                           
   V1041 = "SEP: TOT CLR MANSLGHTR"                                        
   V1042 = "SEP: TOT CLR RAPE TOTAL"                                       
   V1043 = "SEP: TOT CLR FORC RAPE"                                        
   V1044 = "SEP: TOT CLR ATMPTD RAP"                                       
   V1045 = "SEP: TOT CLR TOTL ROBER"                                       
   V1046 = "SEP: TOT CLR GUN ROBBER"                                       
   V1047 = "SEP: TOT CLR KNIFE ROBR"                                       
   V1048 = "SEP: TOT CLR OTH WPN RO"                                       
   V1049 = "SEP: TOT CLR STR ARM RO"                                       
   V1050 = "SEP: TOT CLR ASSLT TOTA"                                       
   V1051 = "SEP: TOT CLR GUN ASSAUL"                                       
   V1052 = "SEP: TOT CLR KNIFE ASSL"                                       
   V1053 = "SEP: TOT CLR OTH WPN ASL"                                      
   V1054 = "SEP: TOT CLR HND/FT ASL"                                       
   V1055 = "SEP: TOT CLR SIMPLE ASL"                                       
   V1056 = "SEP: TOT CLR BRGLRY TOT"                                       
   V1057 = "SEP: TOT CLR FORC ENTRY"                                       
   V1058 = "SEP: TOT CLR ENTR-NO FR"                                       
   V1059 = "SEP: TOT CLR ATT BURGLR"                                       
   V1060 = "SEP: TOT CLR LARCNY TOT"                                       
   V1061 = "SEP: TOT CLR VHC THFT TO"                                      
   V1062 = "SEP: TOT CLR AUTO THEFT"                                       
   V1063 = "SEP: TOT CLR TRCK/BS THF"                                      
   V1064 = "SEP: TOT CLR OTH VHC THF"                                      
   V1065 = "SEP: TOT CLR ALL FIELDS"                                       
   V1066 = "SEP: CLR<18 MURDER"                                            
   V1067 = "SEP: CLR<18 MANSLGHTR"                                         
   V1068 = "SEP: CLR<18 RAPE TOTAL"                                        
   V1069 = "SEP: CLR<18 FORCE RAPE"                                        
   V1070 = "SEP: CLR<18 ATTMPTD RAP"                                       
   V1071 = "SEP: CLR<18 ROBBERY TOT"                                       
   V1072 = "SEP: CLR<18 GUN ROBBERY"                                       
   V1073 = "SEP: CLR<18 KNIFE ROBBR"                                       
   V1074 = "SEP: CLR<18 OTH WPN RBR"                                       
   V1075 = "SEP: CLR<18 STR ARM ROB"                                       
   V1076 = "SEP: CLR<18 ASSLT TOTAL"                                       
   V1077 = "SEP: CLR<18 GUN ASSAULT"                                       
   V1078 = "SEP: CLR<18 KNIFE ASSLT"                                       
   V1079 = "SEP: CLR<18 OTH WPN ASL"                                       
   V1080 = "SEP: CLR<18 HND/FT ASSL"                                       
   V1081 = "SEP: CLR<18 SIMPLE ASSL"                                       
   V1082 = "SEP: CLR<18 BURGLRY TOT"                                       
   V1083 = "SEP: CLR<18 FORC ENTRY"                                        
   V1084 = "SEP: CLR<18 ENTR-NO FOR"                                       
   V1085 = "SEP: CLR<18 ATT BURGLAR"                                       
   V1086 = "SEP: CLR<18 LARCENY TOT"                                       
   V1087 = "SEP: CLR<18 VHC THFT TO"                                       
   V1088 = "SEP: CLR<18 AUTO THEFT"                                        
   V1089 = "SEP: CLR<18 TRCK/BS THF"                                       
   V1090 = "SEP: CLR<18 OTH VHC THF"                                       
   V1091 = "SEP: CLR<18 ALL FIELDS"                                        
   V1092 = "SEP: OFFICRS KILL BY FE"                                       
   V1093 = "SEP: OFFICRS KILL BY AC"                                       
   V1094 = "SEP: OFFICERS ASSAULTED"                                       
   V1095 = "OCT: MONTH INCLUDED IN"                                        
   V1096 = "OCT: LAST UPDATE"                                              
   V1097 = "OCT: CARD 0 TYPE"                                              
   V1098 = "OCT: CARD 1 TYPE"                                              
   V1099 = "OCT: CARD 2 TYPE"                                              
   V1100 = "OCT: CARD 3 TYPE"                                              
   V1101 = "OCT: CARD 4 TYPE"                                              
   V1102 = "OCT: CARD 0 P/T"                                               
   V1103 = "OCT: CARD 1 P/T"                                               
   V1104 = "OCT: CARD 2 P/T"                                               
   V1105 = "OCT: CARD 3 P/T"                                               
   V1106 = "OCT: UNFOUNDED MURDER"                                         
   V1107 = "OCT: UNFOUNDED MANSLGHT"                                       
   V1108 = "OCT: UNFOUNDED RAPE TOT"                                       
   V1109 = "OCT: UNFOUNDED FORC RAP"                                       
   V1110 = "OCT: UNFOUND ATMPTD RAP"                                       
   V1111 = "OCT: UNFOUND ROBBRY TOT"                                       
   V1112 = "OCT: UNFOUND GUN ROBBER"                                       
   V1113 = "OCT: UNFOUNDED KNIFE RO"                                       
   V1114 = "OCT: UNFND OTHR WEAP RO"                                       
   V1115 = "OCT: UNFND STRNG-ARM RO"                                       
   V1116 = "OCT: UNFOUND ASSLT TOTA"                                       
   V1117 = "OCT: UNFOUND GUN ASSLT"                                        
   V1118 = "OCT: UNFOUND KNIFE ASSL"                                       
   V1119 = "OCT: UNFND OTH WPN ASLT"                                       
   V1120 = "OCT: UNFND HND/FEET ASL"                                       
   V1121 = "OCT: UNFND SIMPL ASSAUL"                                       
   V1122 = "OCT: UNFOUND BURG TOTAL"                                       
   V1123 = "OCT: UNFOUND FORCE ENTR"                                       
   V1124 = "OCT: UNFND ENTRY-NO FOR"                                       
   V1125 = "OCT: UNFND ATT BURGLARY"                                       
   V1126 = "OCT: UNFOUND LARCNY TOT"                                       
   V1127 = "OCT: UF TOT MTR VHC THF"                                       
   V1128 = "OCT: UNFOUND AUTO THEFT"                                       
   V1129 = "OCT: UF TRUCK/BUS THEFT"                                       
   V1130 = "OCT: UNFND OTH VHC THEF"                                       
   V1131 = "OCT: UNFOUND ALL FIELDS"                                       
   V1132 = "OCT: ACT NUM MURDER"                                           
   V1133 = "OCT: ACT NUM MANSLGHTR"                                        
   V1134 = "OCT: ACT NUM RAPE TOTL"                                        
   V1135 = "OCT: ACT NUM FORC RAPE"                                        
   V1136 = "OCT: ACT NUM ATMPTD RAP"                                       
   V1137 = "OCT: ACT NUM ROBBRY TOT"                                       
   V1138 = "OCT: ACT NUM GUN ROBBER"                                       
   V1139 = "OCT: ACT NUM KNIFE ROBR"                                       
   V1140 = "OCT: ACT NUM OTH WPN RO"                                       
   V1141 = "OCT: ACT NUM STR ARM RO"                                       
   V1142 = "OCT: ACT NUM ASSLT TOTA"                                       
   V1143 = "OCT: ACT NUM GUN ASSAUL"                                       
   V1144 = "OCT: ACT NUM KNIFE ASSL"                                       
   V1145 = "OCT: ACT # OTH WPN ASSL"                                       
   V1146 = "OCT: ACT # HND/FEET ASL"                                       
   V1147 = "OCT: ACT # SIMPLE ASSLT"                                       
   V1148 = "OCT: ACT # BURGLARY TOT"                                       
   V1149 = "OCT: ACT # FORCE ENTRY"                                        
   V1150 = "OCT: ACT # ENTRY-NO FOR"                                       
   V1151 = "OCT: ACT # ATT BURGLARY"                                       
   V1152 = "OCT: ACT # LARCENY TOTA"                                       
   V1153 = "OCT: ACT # VHC THEFT TO"                                       
   V1154 = "OCT: ACT # AUTO THEFT"                                         
   V1155 = "OCT: ACT # TRCK/BUS THF"                                       
   V1156 = "OCT: ACT # OTH VHC THEF"                                       
   V1157 = "OCT: ACT # ALL FIELDS"                                         
   V1158 = "OCT: TOT CLR MURDER"                                           
   V1159 = "OCT: TOT CLR MANSLGHTR"                                        
   V1160 = "OCT: TOT CLR RAPE TOTAL"                                       
   V1161 = "OCT: TOT CLR FORC RAPE"                                        
   V1162 = "OCT: TOT CLR ATMPTD RAP"                                       
   V1163 = "OCT: TOT CLR TOTL ROBER"                                       
   V1164 = "OCT: TOT CLR GUN ROBBER"                                       
   V1165 = "OCT: TOT CLR KNIFE ROBR"                                       
   V1166 = "OCT: TOT CLR OTH WPN RO"                                       
   V1167 = "OCT: TOT CLR STR ARM RO"                                       
   V1168 = "OCT: TOT CLR ASSLT TOTA"                                       
   V1169 = "OCT: TOT CLR GUN ASSAUL"                                       
   V1170 = "OCT: TOT CLR KNIFE ASSL"                                       
   V1171 = "OCT: TOT CLR OTH WPN ASL"                                      
   V1172 = "OCT: TOT CLR HND/FT ASL"                                       
   V1173 = "OCT: TOT CLR SIMPLE ASL"                                       
   V1174 = "OCT: TOT CLR BRGLRY TOT"                                       
   V1175 = "OCT: TOT CLR FORC ENTRY"                                       
   V1176 = "OCT: TOT CLR ENTR-NO FR"                                       
   V1177 = "OCT: TOT CLR ATT BURGLR"                                       
   V1178 = "OCT: TOT CLR LARCNY TOT"                                       
   V1179 = "OCT: TOT CLR VHC THFT TO"                                      
   V1180 = "OCT: TOT CLR AUTO THEFT"                                       
   V1181 = "OCT: TOT CLR TRCK/BS THF"                                      
   V1182 = "OCT: TOT CLR OTH VHC THF"                                      
   V1183 = "OCT: TOT CLR ALL FIELDS"                                       
   V1184 = "OCT: CLR<18 MURDER"                                            
   V1185 = "OCT: CLR<18 MANSLGHTR"                                         
   V1186 = "OCT: CLR<18 RAPE TOTAL"                                        
   V1187 = "OCT: CLR<18 FORCE RAPE"                                        
   V1188 = "OCT: CLR<18 ATTMPTD RAP"                                       
   V1189 = "OCT: CLR<18 ROBBERY TOT"                                       
   V1190 = "OCT: CLR<18 GUN ROBBERY"                                       
   V1191 = "OCT: CLR<18 KNIFE ROBBR"                                       
   V1192 = "OCT: CLR<18 OTH WPN RBR"                                       
   V1193 = "OCT: CLR<18 STR ARM ROB"                                       
   V1194 = "OCT: CLR<18 ASSLT TOTAL"                                       
   V1195 = "OCT: CLR<18 GUN ASSAULT"                                       
   V1196 = "OCT: CLR<18 KNIFE ASSLT"                                       
   V1197 = "OCT: CLR<18 OTH WPN ASL"                                       
   V1198 = "OCT: CLR<18 HND/FT ASSL"                                       
   V1199 = "OCT: CLR<18 SIMPLE ASSL"                                       
   V1200 = "OCT: CLR<18 BURGLRY TOT"                                       
   V1201 = "OCT: CLR<18 FORC ENTRY"                                        
   V1202 = "OCT: CLR<18 ENTR-NO FOR"                                       
   V1203 = "OCT: CLR<18 ATT BURGLAR"                                       
   V1204 = "OCT: CLR<18 LARCENY TOT"                                       
   V1205 = "OCT: CLR<18 VHC THFT TO"                                       
   V1206 = "OCT: CLR<18 AUTO THEFT"                                        
   V1207 = "OCT: CLR<18 TRCK/BS THF"                                       
   V1208 = "OCT: CLR<18 OTH VHC THF"                                       
   V1209 = "OCT: CLR<18 ALL FIELDS"                                        
   V1210 = "OCT: OFFICRS KILL BY FE"                                       
   V1211 = "OCT: OFFICRS KILL BY AC"                                       
   V1212 = "OCT: OFFICERS ASSAULTED"                                       
   V1213 = "NOV: MONTH INCLUDED IN"                                        
   V1214 = "NOV: LAST UPDATE"                                              
   V1215 = "NOV: CARD 0 TYPE"                                              
   V1216 = "NOV: CARD 1 TYPE"                                              
   V1217 = "NOV: CARD 2 TYPE"                                              
   V1218 = "NOV: CARD 3 TYPE"                                              
   V1219 = "NOV: CARD 4 TYPE"                                              
   V1220 = "NOV: CARD 0 P/T"                                               
   V1221 = "NOV: CARD 1 P/T"                                               
   V1222 = "NOV: CARD 2 P/T"                                               
   V1223 = "NOV: CARD 3 P/T"                                               
   V1224 = "NOV: UNFOUNDED MURDER"                                         
   V1225 = "NOV: UNFOUNDED MANSLGHT"                                       
   V1226 = "NOV: UNFOUNDED RAPE TOT"                                       
   V1227 = "NOV: UNFOUNDED FORC RAP"                                       
   V1228 = "NOV: UNFOUND ATMPTD RAP"                                       
   V1229 = "NOV: UNFOUND ROBBRY TOT"                                       
   V1230 = "NOV: UNFOUND GUN ROBBER"                                       
   V1231 = "NOV: UNFOUNDED KNIFE RO"                                       
   V1232 = "NOV: UNFND OTHR WEAP RO"                                       
   V1233 = "NOV: UNFND STRNG-ARM RO"                                       
   V1234 = "NOV: UNFOUND ASSLT TOTA"                                       
   V1235 = "NOV: UNFOUND GUN ASSLT"                                        
   V1236 = "NOV: UNFOUND KNIFE ASSL"                                       
   V1237 = "NOV: UNFND OTH WPN ASLT"                                       
   V1238 = "NOV: UNFND HND/FEET ASL"                                       
   V1239 = "NOV: UNFND SIMPL ASSAUL"                                       
   V1240 = "NOV: UNFOUND BURG TOTAL"                                       
   V1241 = "NOV: UNFOUND FORCE ENTR"                                       
   V1242 = "NOV: UNFND ENTRY-NO FOR"                                       
   V1243 = "NOV: UNFND ATT BURGLARY"                                       
   V1244 = "NOV: UNFOUND LARCNY TOT"                                       
   V1245 = "NOV: UF TOT MTR VHC THF"                                       
   V1246 = "NOV: UNFOUND AUTO THEFT"                                       
   V1247 = "NOV: UF TRUCK/BUS THEFT"                                       
   V1248 = "NOV: UNFND OTH VHC THEF"                                       
   V1249 = "NOV: UNFOUND ALL FIELDS"                                       
   V1250 = "NOV: ACT NUM MURDER"                                           
   V1251 = "NOV: ACT NUM MANSLGHTR"                                        
   V1252 = "NOV: ACT NUM RAPE TOTL"                                        
   V1253 = "NOV: ACT NUM FORC RAPE"                                        
   V1254 = "NOV: ACT NUM ATMPTD RAP"                                       
   V1255 = "NOV: ACT NUM ROBBRY TOT"                                       
   V1256 = "NOV: ACT NUM GUN ROBBER"                                       
   V1257 = "NOV: ACT NUM KNIFE ROBR"                                       
   V1258 = "NOV: ACT NUM OTH WPN RO"                                       
   V1259 = "NOV: ACT NUM STR ARM RO"                                       
   V1260 = "NOV: ACT NUM ASSLT TOTA"                                       
   V1261 = "NOV: ACT NUM GUN ASSAUL"                                       
   V1262 = "NOV: ACT NUM KNIFE ASSL"                                       
   V1263 = "NOV: ACT # OTH WPN ASSL"                                       
   V1264 = "NOV: ACT # HND/FEET ASL"                                       
   V1265 = "NOV: ACT # SIMPLE ASSLT"                                       
   V1266 = "NOV: ACT # BURGLARY TOT"                                       
   V1267 = "NOV: ACT # FORCE ENTRY"                                        
   V1268 = "NOV: ACT # ENTRY-NO FOR"                                       
   V1269 = "NOV: ACT # ATT BURGLARY"                                       
   V1270 = "NOV: ACT # LARCENY TOTA"                                       
   V1271 = "NOV: ACT # VHC THEFT TO"                                       
   V1272 = "NOV: ACT # AUTO THEFT"                                         
   V1273 = "NOV: ACT # TRCK/BUS THF"                                       
   V1274 = "NOV: ACT # OTH VHC THEF"                                       
   V1275 = "NOV: ACT # ALL FIELDS"                                         
   V1276 = "NOV: TOT CLR MURDER"                                           
   V1277 = "NOV: TOT CLR MANSLGHTR"                                        
   V1278 = "NOV: TOT CLR RAPE TOTAL"                                       
   V1279 = "NOV: TOT CLR FORC RAPE"                                        
   V1280 = "NOV: TOT CLR ATMPTD RAP"                                       
   V1281 = "NOV: TOT CLR TOTL ROBER"                                       
   V1282 = "NOV: TOT CLR GUN ROBBER"                                       
   V1283 = "NOV: TOT CLR KNIFE ROBR"                                       
   V1284 = "NOV: TOT CLR OTH WPN RO"                                       
   V1285 = "NOV: TOT CLR STR ARM RO"                                       
   V1286 = "NOV: TOT CLR ASSLT TOTA"                                       
   V1287 = "NOV: TOT CLR GUN ASSAUL"                                       
   V1288 = "NOV: TOT CLR KNIFE ASSL"                                       
   V1289 = "NOV: TOT CLR OTH WPN ASL"                                      
   V1290 = "NOV: TOT CLR HND/FT ASL"                                       
   V1291 = "NOV: TOT CLR SIMPLE ASL"                                       
   V1292 = "NOV: TOT CLR BRGLRY TOT"                                       
   V1293 = "NOV: TOT CLR FORC ENTRY"                                       
   V1294 = "NOV: TOT CLR ENTR-NO FR"                                       
   V1295 = "NOV: TOT CLR ATT BURGLR"                                       
   V1296 = "NOV: TOT CLR LARCNY TOT"                                       
   V1297 = "NOV: TOT CLR VHC THFT TO"                                      
   V1298 = "NOV: TOT CLR AUTO THEFT"                                       
   V1299 = "NOV: TOT CLR TRCK/BS THF"                                      
   V1300 = "NOV: TOT CLR OTH VHC THF"                                      
   V1301 = "NOV: TOT CLR ALL FIELDS"                                       
   V1302 = "NOV: CLR<18 MURDER"                                            
   V1303 = "NOV: CLR<18 MANSLGHTR"                                         
   V1304 = "NOV: CLR<18 RAPE TOTAL"                                        
   V1305 = "NOV: CLR<18 FORCE RAPE"                                        
   V1306 = "NOV: CLR<18 ATTMPTD RAP"                                       
   V1307 = "NOV: CLR<18 ROBBERY TOT"                                       
   V1308 = "NOV: CLR<18 GUN ROBBERY"                                       
   V1309 = "NOV: CLR<18 KNIFE ROBBR"                                       
   V1310 = "NOV: CLR<18 OTH WPN RBR"                                       
   V1311 = "NOV: CLR<18 STR ARM ROB"                                       
   V1312 = "NOV: CLR<18 ASSLT TOTAL"                                       
   V1313 = "NOV: CLR<18 GUN ASSAULT"                                       
   V1314 = "NOV: CLR<18 KNIFE ASSLT"                                       
   V1315 = "NOV: CLR<18 OTH WPN ASL"                                       
   V1316 = "NOV: CLR<18 HND/FT ASSL"                                       
   V1317 = "NOV: CLR<18 SIMPLE ASSL"                                       
   V1318 = "NOV: CLR<18 BURGLRY TOT"                                       
   V1319 = "NOV: CLR<18 FORC ENTRY"                                        
   V1320 = "NOV: CLR<18 ENTR-NO FOR"                                       
   V1321 = "NOV: CLR<18 ATT BURGLAR"                                       
   V1322 = "NOV: CLR<18 LARCENY TOT"                                       
   V1323 = "NOV: CLR<18 VHC THFT TO"                                       
   V1324 = "NOV: CLR<18 AUTO THEFT"                                        
   V1325 = "NOV: CLR<18 TRCK/BS THF"                                       
   V1326 = "NOV: CLR<18 OTH VHC THF"                                       
   V1327 = "NOV: CLR<18 ALL FIELDS"                                        
   V1328 = "NOV: OFFICRS KILL BY FE"                                       
   V1329 = "NOV: OFFICRS KILL BY AC"                                       
   V1330 = "NOV: OFFICERS ASSAULTED"                                       
   V1331 = "DEC: MONTH INCLUDED IN"                                        
   V1332 = "DEC: LAST UPDATE"                                              
   V1333 = "DEC: CARD 0 TYPE"                                              
   V1334 = "DEC: CARD 1 TYPE"                                              
   V1335 = "DEC: CARD 2 TYPE"                                              
   V1336 = "DEC: CARD 3 TYPE"                                              
   V1337 = "DEC: CARD 4 TYPE"                                              
   V1338 = "DEC: CARD 0 P/T"                                               
   V1339 = "DEC: CARD 1 P/T"                                               
   V1340 = "DEC: CARD 2 P/T"                                               
   V1341 = "DEC: CARD 3 P/T"                                               
   V1342 = "DEC: UNFOUNDED MURDER"                                         
   V1343 = "DEC: UNFOUNDED MANSLGHT"                                       
   V1344 = "DEC: UNFOUNDED RAPE TOT"                                       
   V1345 = "DEC: UNFOUNDED FORC RAP"                                       
   V1346 = "DEC: UNFOUND ATMPTD RAP"                                       
   V1347 = "DEC: UNFOUND ROBBRY TOT"                                       
   V1348 = "DEC: UNFOUND GUN ROBBER"                                       
   V1349 = "DEC: UNFOUNDED KNIFE RO"                                       
   V1350 = "DEC: UNFND OTHR WEAP RO"                                       
   V1351 = "DEC: UNFND STRNG-ARM RO"                                       
   V1352 = "DEC: UNFOUND ASSLT TOTA"                                       
   V1353 = "DEC: UNFOUND GUN ASSLT"                                        
   V1354 = "DEC: UNFOUND KNIFE ASSL"                                       
   V1355 = "DEC: UNFND OTH WPN ASLT"                                       
   V1356 = "DEC: UNFND HND/FEET ASL"                                       
   V1357 = "DEC: UNFND SIMPL ASSAUL"                                       
   V1358 = "DEC: UNFOUND BURG TOTAL"                                       
   V1359 = "DEC: UNFOUND FORCE ENTR"                                       
   V1360 = "DEC: UNFND ENTRY-NO FOR"                                       
   V1361 = "DEC: UNFND ATT BURGLARY"                                       
   V1362 = "DEC: UNFOUND LARCNY TOT"                                       
   V1363 = "DEC: UF TOT MTR VHC THF"                                       
   V1364 = "DEC: UNFOUND AUTO THEFT"                                       
   V1365 = "DEC: UF TRUCK/BUS THEFT"                                       
   V1366 = "DEC: UNFND OTH VHC THEF"                                       
   V1367 = "DEC: UNFOUND ALL FIELDS"                                       
   V1368 = "DEC: ACT NUM MURDER"                                           
   V1369 = "DEC: ACT NUM MANSLGHTR"                                        
   V1370 = "DEC: ACT NUM RAPE TOTL"                                        
   V1371 = "DEC: ACT NUM FORC RAPE"                                        
   V1372 = "DEC: ACT NUM ATMPTD RAP"                                       
   V1373 = "DEC: ACT NUM ROBBRY TOT"                                       
   V1374 = "DEC: ACT NUM GUN ROBBER"                                       
   V1375 = "DEC: ACT NUM KNIFE ROBR"                                       
   V1376 = "DEC: ACT NUM OTH WPN RO"                                       
   V1377 = "DEC: ACT NUM STR ARM RO"                                       
   V1378 = "DEC: ACT NUM ASSLT TOTA"                                       
   V1379 = "DEC: ACT NUM GUN ASSAUL"                                       
   V1380 = "DEC: ACT NUM KNIFE ASSL"                                       
   V1381 = "DEC: ACT # OTH WPN ASSL"                                       
   V1382 = "DEC: ACT # HND/FEET ASL"                                       
   V1383 = "DEC: ACT # SIMPLE ASSLT"                                       
   V1384 = "DEC: ACT # BURGLARY TOT"                                       
   V1385 = "DEC: ACT # FORCE ENTRY"                                        
   V1386 = "DEC: ACT # ENTRY-NO FOR"                                       
   V1387 = "DEC: ACT # ATT BURGLARY"                                       
   V1388 = "DEC: ACT # LARCENY TOTA"                                       
   V1389 = "DEC: ACT # VHC THEFT TO"                                       
   V1390 = "DEC: ACT # AUTO THEFT"                                         
   V1391 = "DEC: ACT # TRCK/BUS THF"                                       
   V1392 = "DEC: ACT # OTH VHC THEF"                                       
   V1393 = "DEC: ACT # ALL FIELDS"                                         
   V1394 = "DEC: TOT CLR MURDER"                                           
   V1395 = "DEC: TOT CLR MANSLGHTR"                                        
   V1396 = "DEC: TOT CLR RAPE TOTAL"                                       
   V1397 = "DEC: TOT CLR FORC RAPE"                                        
   V1398 = "DEC: TOT CLR ATMPTD RAP"                                       
   V1399 = "DEC: TOT CLR TOTL ROBER"                                       
   V1400 = "DEC: TOT CLR GUN ROBBER"                                       
   V1401 = "DEC: TOT CLR KNIFE ROBR"                                       
   V1402 = "DEC: TOT CLR OTH WPN RO"                                       
   V1403 = "DEC: TOT CLR STR ARM RO"                                       
   V1404 = "DEC: TOT CLR ASSLT TOTA"                                       
   V1405 = "DEC: TOT CLR GUN ASSAUL"                                       
   V1406 = "DEC: TOT CLR KNIFE ASSL"                                       
   V1407 = "DEC: TOT CLR OTH WPN ASL"                                      
   V1408 = "DEC: TOT CLR HND/FT ASL"                                       
   V1409 = "DEC: TOT CLR SIMPLE ASL"                                       
   V1410 = "DEC: TOT CLR BRGLRY TOT"                                       
   V1411 = "DEC: TOT CLR FORC ENTRY"                                       
   V1412 = "DEC: TOT CLR ENTR-NO FR"                                       
   V1413 = "DEC: TOT CLR ATT BURGLR"                                       
   V1414 = "DEC: TOT CLR LARCNY TOT"                                       
   V1415 = "DEC: TOT CLR VHC THFT TO"                                      
   V1416 = "DEC: TOT CLR AUTO THEFT"                                       
   V1417 = "DEC: TOT CLR TRCK/BS THF"                                      
   V1418 = "DEC: TOT CLR OTH VHC THF"                                      
   V1419 = "DEC: TOT CLR ALL FIELDS"                                       
   V1420 = "DEC: CLR<18 MURDER"                                            
   V1421 = "DEC: CLR<18 MANSLGHTR"                                         
   V1422 = "DEC: CLR<18 RAPE TOTAL"                                        
   V1423 = "DEC: CLR<18 FORCE RAPE"                                        
   V1424 = "DEC: CLR<18 ATTMPTD RAP"                                       
   V1425 = "DEC: CLR<18 ROBBERY TOT"                                       
   V1426 = "DEC: CLR<18 GUN ROBBERY"                                       
   V1427 = "DEC: CLR<18 KNIFE ROBBR"                                       
   V1428 = "DEC: CLR<18 OTH WPN RBR"                                       
   V1429 = "DEC: CLR<18 STR ARM ROB"                                       
   V1430 = "DEC: CLR<18 ASSLT TOTAL"                                       
   V1431 = "DEC: CLR<18 GUN ASSAULT"                                       
   V1432 = "DEC: CLR<18 KNIFE ASSLT"                                       
   V1433 = "DEC: CLR<18 OTH WPN ASL"                                       
   V1434 = "DEC: CLR<18 HND/FT ASSL"                                       
   V1435 = "DEC: CLR<18 SIMPLE ASSL"                                       
   V1436 = "DEC: CLR<18 BURGLRY TOT"                                       
   V1437 = "DEC: CLR<18 FORC ENTRY"                                        
   V1438 = "DEC: CLR<18 ENTR-NO FOR"                                       
   V1439 = "DEC: CLR<18 ATT BURGLAR"                                       
   V1440 = "DEC: CLR<18 LARCENY TOT"                                       
   V1441 = "DEC: CLR<18 VHC THFT TO"                                       
   V1442 = "DEC: CLR<18 AUTO THEFT"                                        
   V1443 = "DEC: CLR<18 TRCK/BS THF"                                       
   V1444 = "DEC: CLR<18 OTH VHC THF"                                       
   V1445 = "DEC: CLR<18 ALL FIELDS"                                        
   V1446 = "DEC: OFFICRS KILL BY FE"                                       
   V1447 = "DEC: OFFICRS KILL BY AC"                                       
   V1448 = "DEC: OFFICERS ASSAULTED";                                      
                                                                           
* SAS FORMAT STATEMENT;                                                    
                                                                           
/*                                                                         
FORMAT                                                                     
   V1 V1FT.               V2 V2FT.               V4 $V4FT.                 
   V5 V5FT.               V8 $V8FT.              V12 V12FT.                
   V13 V13FT.             V23 $V23FT.            V24 V24FT.                
   V25 $V25FT.            V33 V33FT.             V34 V34FT.                
   V35 V35FT.             V36 V36FT.             V37 V37FT.                
   V38 V38FT.             V39 V39FT.             V40 $V40FT.               
   V41 $V41FT.            V42 $V42FT.            V43 $V43FT.               
   V151 V151FT.           V152 V152FT.           V153 V153FT.              
   V154 V154FT.           V155 V155FT.           V156 V156FT.              
   V157 V157FT.           V158 $V158FT.          V159 $V159FT.             
   V160 $V160FT.          V161 $V161FT.          V269 V269FT.              
   V270 V270FT.           V271 V271FT.           V272 V272FT.              
   V273 V273FT.           V274 V274FT.           V275 V275FT.              
   V276 $V276FT.          V277 $V277FT.          V278 $V278FT.             
   V279 $V279FT.          V387 V387FT.           V388 V388FT.              
   V389 V389FT.           V390 V390FT.           V391 V391FT.              
   V392 V392FT.           V393 V393FT.           V394 $V394FT.             
   V395 $V395FT.          V396 $V396FT.          V397 $V397FT.             
   V505 V505FT.           V506 V506FT.           V507 V507FT.              
   V508 V508FT.           V509 V509FT.           V510 V510FT.              
   V511 V511FT.           V512 $V512FT.          V513 $V513FT.             
   V514 $V514FT.          V515 $V515FT.          V623 V623FT.              
   V624 V624FT.           V625 V625FT.           V626 V626FT.              
   V627 V627FT.           V628 V628FT.           V629 V629FT.              
   V630 $V630FT.          V631 $V631FT.          V632 $V632FT.             
   V633 $V633FT.          V741 V741FT.           V742 V742FT.              
   V743 V743FT.           V744 V744FT.           V745 V745FT.              
   V746 V746FT.           V747 V747FT.           V748 $V748FT.             
   V749 $V749FT.          V750 $V750FT.          V751 $V751FT.             
   V859 V859FT.           V860 V860FT.           V861 V861FT.              
   V862 V862FT.           V863 V863FT.           V864 V864FT.              
   V865 V865FT.           V866 $V866FT.          V867 $V867FT.             
   V868 $V868FT.          V869 $V869FT.          V977 V977FT.              
   V978 V978FT.           V979 V979FT.           V980 V980FT.              
   V981 V981FT.           V982 V982FT.           V983 V983FT.              
   V984 $V984FT.          V985 $V985FT.          V986 $V986FT.             
   V987 $V987FT.          V1095 V1095FT.         V1096 V1096FT.            
   V1097 V1097FT.         V1098 V1098FT.         V1099 V1099FT.            
   V1100 V1100FT.         V1101 V1101FT.         V1102 $V1102FT.           
   V1103 $V1103FT.        V1104 $V1104FT.        V1105 $V1105FT.           
   V1213 V1213FT.         V1214 V1214FT.         V1215 V1215FT.            
   V1216 V1216FT.         V1217 V1217FT.         V1218 V1218FT.            
   V1219 V1219FT.         V1220 $V1220FT.        V1221 $V1221FT.           
   V1222 $V1222FT.        V1223 $V1223FT.        V1331 V1331FT.            
   V1332 V1332FT.         V1333 V1333FT.         V1334 V1334FT.            
   V1335 V1335FT.         V1336 V1336FT.         V1337 V1337FT.            
   V1338 $V1338FT.        V1339 $V1339FT.        V1340 $V1340FT.           
   V1341 $V1341FT.;                                                        
*/                                                                         
