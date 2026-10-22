                                                                              
 /*                                                                           
 *-------------------------------------------------------------------------*  
 |              SAS DATA DEFINITION STATEMENTS FOR ICPSR 6706              |  
 |                   THE INDONESIA FAMILY LIFE SURVEY, 1993                |  
 |                                                                         |  
 |                      REVISED AND RESTRUCTURED VERSION                   |  
 |                                                                         |  
 | The LRECL data should be read using the data definition statements      |  
 | provided.                                                               |  
 |                                                                         |  
 | INFILE identifies the input file to be read with the input  statement.  |  
 | Users may need to modify the "INFILE= " with the approrpriate filename. |  
 |                                                                         |  
 | INPUT  assigns  the  name,  type,  decimal specification (if any), and  |  
 | specifies the beginning and ending column locations for each variable.  |  
 |                                                                         |  
 | LABEL  assigns  descriptive  labels to all variables.  Variable labels  |  
 | and variable names may be identical for some data files.                |  
 |                                                                         |  
 | FORMAT  associates  the  formats  created by the PROC FORMAT step with  |  
 | the variables named in the INPUT statement. Users should refer to the   |  
 | codebook for a complete description of formats.                         |  
 |                                                                         |  
 | NOTE:  Users should modify these data definition statements to suit     |  
 | their specific needs.                                                   |  
 *-------------------------------------------------------------------------*  
 */                                                                           
                                                                              
                                                                              
* SAS DATA, INFILE, INPUT STATEMENTS;                                         
                                                                              
DATA;                                                                         
INFILE 'da6706.p9' LRECL=64;                                                  
INPUT                                                                         
  CASE 1-8 .2                                                                 
  NCOMB 9-16 .2                                                               
  ITEM $ 17-18                                                                
  KS01 $ 19-20                                                                
  KS02RP 21-28 .2                                                             
  NCOMB1A 29-36 .2                                                            
  KS03RP 37-44 .2                                                             
  HHID93 $ 45-51                                                              
  HHID $ 52-60                                                                
  COMMID93 $ 61-64                                                            
  ;                                                                           
                                                                              
* SAS LABEL;                                                                  
                                                                              
LABEL                                                                         
  CASE='IFLS HHLD NUMBER'                                                     
  NCOMB='TOTAL # OF ITEMS CONSUMED'                                           
  ITEM='TYPES OF STAPLE FOODS LISTED'                                         
  KS01='COMBINATION CODE'                                                     
  KS02RP='NUMERIC VALUE: TOTAL EXPENSE IN PAST WEE'                           
  NCOMB1A='TOTAL # ITEMS SELF PRODUCED'                                       
  KS03RP='NUMERIC VALUE: TOTAL SELF PRODUCED/CONSU'                           
  HHID93='HHID(93) EA+HHNUM+00'                                               
  HHID='HHID(=case)'                                                          
  COMMID93='COMMUNITY ID TO MATCH IFLS2 COMMID93'                             
  ;                                                                           
