*-------------------------------------------------------------------------* 
 |            SPSS DATA DEFINITION STATEMENTS FOR ICPSR 8703              | 
 |                                                                        | 
 |        UNIFORM CRIME REPORTING PROGRAM DATA [UNITED STATES:            | 
 |          COUNTY LEVEL ARREST AND OFFENSES DATA, 1977-1983              | 
 |                                                                        | 
 |                        PARTS 1,3,5,7,9,11,13                           | 
 |                                                                        | 
 |                       FILE GENERATED: 08JUL98                          | 
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
 | MISSING VALUES:  Declares user-defined missing values. These values    | 
 | can be treated specially in data transformations, statistical          | 
 | calculations, and case selection. Missing values may not be present    | 
 | for all variables in the data file.                                    | 
 |                                                                        | 
 | NOTE:  Users should modify this SPSS setup to suit their specific      | 
 | needs. MISSING VALUES and MISSING VALUE RECODE sections have been      | 
 | marked by SPSS comment statements. To include these sections in a      | 
 | final SPSS setup, users should remove the SPSS comment statements from | 
 | the desired section(s).                                                | 
 *-------------------------------------------------------------------------.
*VARIABLE DESCRIPTION FOR UCR COUNTY ARREST FILES .                         
*(Parts 1,3,5,7,9,11,13) .                                                  
                                                                            
DATA LIST FILE="da8703f13" /                                                
                                                                            
  v1 1-4                                                                    
  v2 5                                                                      
  v3 6-7                                                                    
  v4 8-11                                                                   
  v5 12-13                                                                  
  v6 14-16                                                                  
  v7   17-23                                                                
  v8 24-30                                                                  
  v9 31-36                                                                  
  v10 37-41                                                                 
  v11 42-46                                                                 
  v12 47-50                                                                 
  v13 51-54                                                                 
  v14 55-59                                                                 
  v15 60-64                                                                 
  v16 65-69                                                                 
  v17 70-74                                                                 
  v18 75-79                                                                 
  v19 80-83.                                                                
VARIABLE LABELS                                                             
                                                                            
  V1 "ICPSR STUDY NUMBER"                                                   
  V2 "ICPSR EDITION NUMBER"                                                 
  V3 "ICPSR PART NUMBER"                                                    
  V4 "ICPSR SEQUENCE NUMber"                                                
  V5 "STATE CODE"                                                           
  V6 "COUNTY CODE"                                                          
  V7 "POPULATION"                                                           
  V8 "GRAND TOTAL"                                                          
  V9 "PART 1 TOTAL"                                                         
  V10 "VIOLENT CRIMES"                                                      
  V11 "PROPERTY CRIMES"                                                     
  V12 "MURDER"                                                              
  V13 "RAPE"                                                                
  V14 "ROBBERY"                                                             
  V15 "ASSAULT"                                                             
  V16 "BURGLARY"                                                            
  V17 "LARCENY"                                                             
  V18 "VEHICLE THEFT"                                                       
  V19 "ARSON".                                                              
                                                                            
MISSING VALUES                                                              
                                                                            
  V7 (9999999)                                                              
  V8 (9999999)                                                              
  V9 (999999)                                                               
  V10 (99999)                                                               
  V11 (99999)                                                               
  V12 (9999)                                                                
  V13 (9999)                                                                
  V14 (99999)                                                               
  V15 (99999)                                                               
  V16 (99999)                                                               
  V17 (99999)                                                               
  V18 (99999)                                                               
  V19 (9999)                                                                
