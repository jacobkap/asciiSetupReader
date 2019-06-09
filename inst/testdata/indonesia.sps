*--------------------------------------------------------------------------* 
 |              SPSS DATA DEFINITION STATEMENTS FOR ICPSR 6706             | 
 |                   THE INDONESIA FAMILY LIFE SURVEY, 1993                | 
 |                                                                         | 
 |                      REVISED AND RESTRUCTURED VERSION                   | 
 |                                                                         | 
 | The LRECL data should be read using the data definition statements      | 
 | provided.                                                               | 
 |                                                                         | 
 | SPSS setup sections are provided for the LRECL version of this data     | 
 | collection.  These sections are listed below:                           | 
 |                                                                         | 
 | DATA LIST  assigns the name, type, and decimal specification (if any),  | 
 | and  specifies  the  beginning  and  ending  column  location for each  | 
 | variable.  Users may need to modify the "FILE= " in the DATA LIST       | 
 | statement with the appropriate filename.                                | 
 |                                                                         | 
 | VARIABLE LABELS  assigns descriptive labels to numeric variables.       | 
 |                                                                         | 
 | VALUE LABELS  assigns descriptive labels to values but users            | 
 | should refer to the codebook for a complete description of values.      | 
 |                                                                         | 
 | NOTE:  Users should modify these data definition statements to suit     | 
 | their specific needs.                                                   | 
 *-------------------------------------------------------------------------*.
                                                                             
                                                                             
                                                                             
* SPSS DATA LIST.                                                            
                                                                             
DATA LIST FILE="da6706.p9" /                                                 
  CASE 1-8 (2)                                                               
  NCOMB 9-16 (2)                                                             
  ITEM 17-18 (A)                                                             
  KS01 19-20 (A)                                                             
  KS02RP 21-28 (2)                                                           
  NCOMB1A 29-36 (2)                                                          
  KS03RP 37-44 (2)                                                           
  HHID93 45-51 (A)                                                           
  HHID 52-60 (A)                                                             
  COMMID93 61-64 (A)                                                         
  .                                                                          
                                                                             
* SPSS VARIABLE LABELS.                                                      
                                                                             
VARIABLE LABELS                                                              
  CASE "IFLS HHLD NUMBER"                                                    
  NCOMB "TOTAL # OF ITEMS CONSUMED"                                          
  ITEM "TYPES OF STAPLE FOODS LISTED"                                        
  KS01 "COMBINATION CODE"                                                    
  KS02RP "NUMERIC VALUE: TOTAL EXPENSE IN PAST WEE"                          
  NCOMB1A "TOTAL # ITEMS SELF PRODUCED"                                      
  KS03RP "NUMERIC VALUE: TOTAL SELF PRODUCED/CONSU"                          
  HHID93 "HHID(93) EA+HHNUM+00"                                              
  HHID "HHID(=case)"                                                         
  COMMID93 "COMMUNITY ID TO MATCH IFLS2 COMMID93"                            
  .                                                                          
