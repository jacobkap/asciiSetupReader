/* PSID DATA CENTER *****************************************************
   JOBID            : 260564                            
   DATA_DOMAIN      : FAM                               
   USER_WHERE       : NULL                              
   FILE_TYPE        : NULL                              
   OUTPUT_DATA_TYPE : ASCII                             
   STATEMENTS       : SAS Statements                    
   CODEBOOK_TYPE    : PDF                               
   N_OF_VARIABLES   : 3                                 
   N_OF_OBSERVATIONS: 9607                              
   MAX_REC_LENGTH   : 13                                
   DATE & TIME      : May 31, 2019 @ 17:40:14
************************************************************************/

FILENAME J260564 "[C:\Users\ozgu\Documents\J260564.txt" ;

DATA J260564 ;
   ATTRIB
      ER66001       LABEL="RELEASE NUMBER"                           FORMAT=F1.  
      ER66002       LABEL="2017 FAMILY INTERVIEW (ID) NUMBER"        FORMAT=F5.  
      ER71426       LABEL="TOTAL FAMILY INCOME-2016"                 FORMAT=F7.  
   ;
   INFILE J260564 LRECL = 13 ; 
   INPUT 
      ER66001              1 - 1           ER66002              2 - 6           ER71426              7 - 13    
   ;
run ;
