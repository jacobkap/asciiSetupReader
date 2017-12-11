                                                                               
/*                                                                             
/*             SPSS DATA DEFINITION STATEMENTS FOR ICPSR 0042                  
/*                 GERMAN WEIMAR REPUBLIC DATA, 1919-1933                      
/*                           DATASET 0001: 1919  	                             
/*                          JANUARY 1978 VERSION                               
/*                                                                             
/*   The following SPSS setup sections appear in this file for the LRECL       
/*   version of this data collection.  These sections are listed below:        
/*                                                                             
/*   DATA LIST contains the SPSS statements which assign the variable names    
/*   and specify the beginning and ending column locations for each variable.  
/*                                                                             
/*   VARIABLE LABELS assigns variable labels for all variables in the data     
/*   file.                                                                     
/*                                                                             
/*   MISSING VALUES contains SPSS program statements which set the values      
/*   that are interpreted as missing by the SPSS system.  Please note that     
/*   the MISSING VALUES section has been commented out (i.e., '*').            
/*   To include this section in the final SPSS setup, remove the comment       
/*   indicators from the section.                                              
/*                                                                             
/*   VALUE LABELS:  assign descriptive labels to codes in the data file.       
/*   Not all variables necessarily have assigned value labels.                 
/*                                                                             
/*   Users may combine and modify these sections or parts of these sections    
/*   to suit their specific needs.  Users will also need to change the         
/*   file-specification in the DATA LIST statement to an appropriate filename  
/*   for their system.                                                         
/*                                                                             
*******************************************************************************
*                                                                              
                                                                               
                                                                               
* SPSS DATA LIST COMMAND.                                                      
                                                                               
FILE HANDLE DATA / NAME="file-specification" LRECL=155.                        
DATA LIST FILE=DATA /                                                          
   V1 1-2                   V2 3-4                   V3 5-5                    
   V4 6-22 (A)              V5 23-29                 V6 30-36                  
   V7 37-43 (1)             V8 44-50                 V9 51-57                  
   V10 58-64                V11 65-71 (1)            V12 72-78                 
   V13 79-85 (1)            V14 86-92                V15 93-99 (1)             
   V16 100-106              V17 107-113 (1)          V18 114-120               
   V19 121-127 (1)          V20 128-134              V21 135-141 (1)           
   V22 142-148              V23 149-155 (1).                                   
                                                                               
* SPSS VARIABLE LABELS COMMAND.                                                
                                                                               
VARIABLE LABELS                                                                
   V1 "WAHLKREISCODE"                                                          
   V2 "LAND/REGIERUNGSBEZ CODE"                                                
   V3 "DATA TYPE CODE"                                                         
   V4 "UNIT OF ANALYSIS NAME"                                                  
   V5 "1919 RT NR ELIGIBLE VTRS"                                               
   V6 "1919 RT NR VOTES CAST"                                                  
   V7 "1919 RT % VOTES CAST"                                                   
   V8 "1919 RT NR INVALID VOTES"                                               
   V9 "1919 RT NR VALID VOTES"                                                 
   V10 "1919 RT GERMNAT PP VOTE"                                               
   V11 "1919 RT % GERMNAT PP"                                                  
   V12 "1919 RT GERM P PARTY"                                                  
   V13 "1919 RT % GERM P PARTY"                                                
   V14 "1919 RT CHRIST P PARTY"                                                
   V15 "1919 RT % CHRIST P PARTY"                                              
   V16 "1919 RT GERMDEM PTY"                                                   
   V17 "1919 RT % GERMDEM PTY"                                                 
   V18 "1919 RT SOCDEM PARTY"                                                  
   V19 "1919 RT % SOCDEM PARTY"                                                
   V20 "1919 RT IND SOCDEM PARTY"                                              
   V21 "1919 RT % IND SOCDEM PTY"                                              
   V22 "1919 RT OTHER PARTIES"                                                 
   V23 "1919 RT % OTHER PARTIES".                                              
                                                                               
* SPSS MISSING VALUES COMMAND.                                                 
                                                                               
* MISSING VALUES                                                               
   V5 (9999999)                        V6 (9999999)                            
   V7 (999999.)                        V8 (9999999)                            
   V9 (9999999)                        V10 (9999999)                           
   V11 (999999.)                       V12 (9999999)                           
   V13 (999999.)                       V14 (9999999)                           
   V15 (999999.)                       V16 (9999999)                           
   V17 (999999.)                       V18 (9999999)                           
   V19 (999999.)                       V20 (9999999)                           
   V21 (999999.)                       V22 (9999999)                           
   V23 (999999.).                                                              
