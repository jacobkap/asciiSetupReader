/*                                                                             
               SAS DATA DEFINITION STATEMENTS FOR ICPSR 0042                   
                  GERMAN WEIMAR REPUBLIC DATA, 1919-1933                       
                             DATASET 0001: 1919                                
                           JANUARY 1978 VERSION                                
                                                                               
   The following SAS setup sections appear in this file for the LRECL          
   version of this data collection.  These sections are listed below:          
                                                                               
   PROC FORMAT:  creates user-defined formats for the variables.  Formats      
   replace original value codes with the value code descriptions.  Not all     
   variables necessarily have user-defined formats.                            
                                                                               
   DATA begins a SAS data step and names an output SAS dataset.                
                                                                               
   INFILE identifies the input file to be read with the input statement.       
   Users must replace the "file-specification" with host computer-specific     
   input file specifications.                                                  
                                                                               
   INPUT contains the SAS statements which assign the variable names and       
   specify the beginning and ending column locations in the LRECL data         
   file for each variable.                                                     
                                                                               
   LABEL assigns variable labels for all variables in the data file.           
   Variable labels and variable names may be identical for some data           
   files.                                                                      
                                                                               
   MISSING VALUE RECODE sets user-defined numeric missing values to            
   missing as interpreted by the SAS system.  Only variables with              
   user-defined missing values are included in these statements.               
                                                                               
   Users may combine and modify these sections or parts of these sections      
   to suit their specific needs.  Users will also need to change the           
   file-specification in the INFILE statement to an appropriate filename       
   for their system.  Please note that the MISSING VALUE RECODE section        
   has been commented out (i.e., '/*').  To include the MISSING VALUE          
   RECODE section in the final SAS setup, remove the comment indicators        
   from the section.                                                           
                                                                               
**************************************************************************** */
                                                                               
                                                                               
* SAS DATA, INFILE, INPUT STATEMENTS;                                          
                                                                               
DATA;                                                                          
INFILE "file-specification" LRECL=155;                                         
INPUT                                                                          
   V1 1-2                   V2 3-4                   V3 5-5                    
   V4 $ 6-22                V5 23-29                 V6 30-36                  
   V7 37-43 .1              V8 44-50                 V9 51-57                  
   V10 58-64                V11 65-71 .1             V12 72-78                 
   V13 79-85 .1             V14 86-92                V15 93-99 .1              
   V16 100-106              V17 107-113 .1           V18 114-120               
   V19 121-127 .1           V20 128-134              V21 135-141 .1            
   V22 142-148              V23 149-155 .1;                                    
                                                                               
* SAS LABEL STATEMENT;                                                         
                                                                               
LABEL                                                                          
   V1 = "WAHLKREISCODE"                                                        
   V2 = "LAND/REGIERUNGSBEZ CODE"                                              
   V3 = "DATA TYPE CODE"                                                       
   V4 = "UNIT OF ANALYSIS NAME"                                                
   V5 = "1919 RT NR ELIGIBLE VTRS"                                             
   V6 = "1919 RT NR VOTES CAST"                                                
   V7 = "1919 RT % VOTES CAST"                                                 
   V8 = "1919 RT NR INVALID VOTES"                                             
   V9 = "1919 RT NR VALID VOTES"                                               
   V10 = "1919 RT GERMNAT PP VOTE"                                             
   V11 = "1919 RT % GERMNAT PP"                                                
   V12 = "1919 RT GERM P PARTY"                                                
   V13 = "1919 RT % GERM P PARTY"                                              
   V14 = "1919 RT CHRIST P PARTY"                                              
   V15 = "1919 RT % CHRIST P PARTY"                                            
   V16 = "1919 RT GERMDEM PTY"                                                 
   V17 = "1919 RT % GERMDEM PTY"                                               
   V18 = "1919 RT SOCDEM PARTY"                                                
   V19 = "1919 RT % SOCDEM PARTY"                                              
   V20 = "1919 RT IND SOCDEM PARTY"                                            
   V21 = "1919 RT % IND SOCDEM PTY"                                            
   V22 = "1919 RT OTHER PARTIES"                                               
   V23 = "1919 RT % OTHER PARTIES";                                            
                                                                               
* USER-DEFINED MISSING VALUE RECODE TO SAS SYSMIS;                             
                                                                               
/*                                                                             
   IF V5=9999999 THEN V5=.;            IF V6=9999999 THEN V6=.;                
   IF V7=999999. THEN V7=.;            IF V8=9999999 THEN V8=.;                
   IF V9=9999999 THEN V9=.;            IF V10=9999999 THEN V10=.;              
   IF V11=999999. THEN V11=.;          IF V12=9999999 THEN V12=.;              
   IF V13=999999. THEN V13=.;          IF V14=9999999 THEN V14=.;              
   IF V15=999999. THEN V15=.;          IF V16=9999999 THEN V16=.;              
   IF V17=999999. THEN V17=.;          IF V18=9999999 THEN V18=.;              
   IF V19=999999. THEN V19=.;          IF V20=9999999 THEN V20=.;              
   IF V21=999999. THEN V21=.;          IF V22=9999999 THEN V22=.;              
   IF V23=999999. THEN V23=.;                                                  
*/                                                                             
