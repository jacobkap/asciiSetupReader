*-------------------------------------------------------------------------*
 |                                                                        |
 |             SAS DATA DEFINITION STATEMENTS FOR ICPSR 3015              |
 |             IMPACT ASSESSMENT OF SEX OFFENDER NOTIFICATION             |
 |                      ON WISCONSIN COMMUNITIES, 1998                    |
 |              (PART 1: COMMUNITY NOTIFICATION MEETING DATA)             |
 |                          FIRST ICPSR VERSION                           |
 |                                MAY 2001                                |
 |                                                                        |
 | SAS setup sections are provided for the LRECL  version  of  this  data |
 | collection.  These sections are listed below:                          |
 |                                                                        |
 | PROC FORMAT creates user-defined formats  for  the  variables. Formats |
 | replace  original  value  codes  with value code descriptions. Not all |
 | variables have user-defined formats.                                   |
 |                                                                        |
 | DATA begins a SAS data step and names an output SAS data set.          |
 |                                                                        |
 | INFILE identifies the input file to be read with the input  statement. |
 | Users must replace the "physical-filename" with host computer-specific |
 | input file specifications.                                             |
 |                                                                        |
 | INPUT  assigns  the  name,  type,  decimal specification (if any), and |
 | specifies the beginning and ending column locations for each variable. |
 |                                                                        |
 | LABEL  assigns  descriptive  labels to all variables.  Variable labels |
 | and variable names may be identical for some data files.               |
 |                                                                        |
 | MISSING VALUE RECODES  sets  user-defined  numeric  missing  values to |
 | missing  as  interpreted  by  the  SAS  system.  Only  variables  with |
 | user-defined missing values are included in these statements.          |
 |                                                                        |
 | FORMAT  associates  the  formats  created by the PROC FORMAT step with |
 | the variables named in the INPUT statement.                            |
 |                                                                        |
 | PLEASE NOTE:  Users  should  combine  and modify these data definition |
 | statements  to  suit  their specific needs. Sections for PROC FORMATS, |
 | FORMATS,  and  MISSING  VALUE  RECODES  have been commented out (i.e., |
 | '/*').  To  include  the PROC FORMATS and FORMATS and/or MISSING VALUE |
 | RECODES sections in the final SAS setup, remove the comment indicators |
 | from the desired section(s).                                           |
 |                                                                        |
 | These  data definition  statements were tested using SAS  version 6.12 |
 | for UNIX.                                                              |
 |                                                                        |
*-------------------------------------------------------------------------;
                                                                           
/* SAS PROC FORMAT FOR 3015,                                               
   IMPACT ASSESSMENT OF SEX OFFENDER NOTIFICATION                          
   ON WISCONSIN COMMUNITIES, 1998  */                                      
/*                                                                         
PROC FORMAT;                                                               
VALUE MEETING                                                              
  1 ="1"                                                                   
  2 ="2"                                                                   
  3 ="3"                                                                   
  4 ="4"                                                                   
  5 ="5"                                                                   
  6 ="6"                                                                   
  7 ="7"                                                                   
  8 ="8"                                                                   
  9 ="9"                                                                   
  10 ="10"                                                                 
  11 ="11"                                                                 
  12 ="12"                                                                 
  13 ="13"                                                                 
  14 ="14"                                                                 
  15 ="15"                                                                 
  16 ="16"                                                                 
  17 ="17"                                                                 
  18 ="18"                                                                 
  19 ="19"                                                                 
  20 ="20"                                                                 
  21 ="21"                                                                 
  22 ="22"                                                                 
  ;                                                                        
VALUE DATEF                                                                
  8888888 ="Blanked"                                                       
  ;                                                                        
VALUE Q1F                                                                  
  1 ="Media"                                                               
  2 ="Flyers"                                                              
  3 ="Local official"                                                      
  4 ="Friend, etc."                                                        
  5 ="Other"                                                               
  6 ="Not sure"                                                            
  9 ="Multiple response"                                                   
  99 ="Blank"                                                              
  ;                                                                        
VALUE Q2A                                                                  
  1 ="Checked"                                                             
  9 ="Blank"                                                               
  ;                                                                        
VALUE Q2B                                                                  
  1 ="Checked"                                                             
  9 ="Blank"                                                               
  ;                                                                        
VALUE Q2C                                                                  
  1 ="Checked"                                                             
  9 ="Blank"                                                               
  ;                                                                        
VALUE Q2D                                                                  
  1 ="Checked"                                                             
  9 ="Blank"                                                               
  ;                                                                        
VALUE Q2E                                                                  
  1 ="Checked"                                                             
  9 ="Blank"                                                               
  ;                                                                        
VALUE Q2F                                                                  
  1 ="Checked"                                                             
  9 ="Blank"                                                               
  ;                                                                        
VALUE Q2G                                                                  
  1 ="Checked"                                                             
  9 ="Blank"                                                               
  ;                                                                        
VALUE Q3F                                                                  
  1 ="Very clear"                                                          
  2 ="Moderate clear"                                                      
  3 ="Neutral"                                                             
  4 ="Somewhat clear"                                                      
  5 ="Very unclear"                                                        
  6 ="Not sure"                                                            
  9 ="Multiple response"                                                   
  99 ="Blank"                                                              
  ;                                                                        
VALUE Q4F                                                                  
  1 ="High marks"                                                          
  2 ="Some value"                                                          
  3 ="Neutral"                                                             
  4 ="Little value"                                                        
  5 ="No value"                                                            
  9 ="Multiple response"                                                   
  99 ="Blank"                                                              
  ;                                                                        
VALUE Q5F                                                                  
  1 ="Well organized"                                                      
  2 ="Somewhat organized"                                                  
  3 ="Neutral"                                                             
  4 ="Somewhat disorganized"                                               
  5 ="High disorganized"                                                   
  9 ="Multiple response"                                                   
  99 ="Blank"                                                              
  ;                                                                        
VALUE Q6A                                                                  
  1 ="Checked"                                                             
  9 ="Blank"                                                               
  ;                                                                        
VALUE Q6B                                                                  
  1 ="Checked"                                                             
  9 ="Blank"                                                               
  ;                                                                        
VALUE Q6C                                                                  
  1 ="Checked"                                                             
  9 ="Blank"                                                               
  ;                                                                        
VALUE Q6D                                                                  
  1 ="Checked"                                                             
  9 ="Blank"                                                               
  ;                                                                        
VALUE Q6E                                                                  
  1 ="Checked"                                                             
  9 ="Blank"                                                               
  ;                                                                        
VALUE Q6F                                                                  
  1 ="Checked"                                                             
  9 ="Blank"                                                               
  ;                                                                        
VALUE Q7F                                                                  
  1 ="Very helpful"                                                        
  2 ="Somewhat helpful"                                                    
  3 ="Neutral"                                                             
  4 ="Generally unhelpful"                                                 
  5 ="Not helpful"                                                         
  9 ="Multiple response"                                                   
  99 ="Blank"                                                              
  ;                                                                        
VALUE Q8A                                                                  
  1 ="Yes"                                                                 
  2 ="No"                                                                  
  3 ="Not sure"                                                            
  9 ="Multiple response"                                                   
  99 ="Blank"                                                              
  ;                                                                        
VALUE Q8B                                                                  
  1 ="Yes"                                                                 
  2 ="No"                                                                  
  3 ="Not applicable"                                                      
  9 ="Multiple response"                                                   
  99 ="Blank"                                                              
  ;                                                                        
VALUE Q9A                                                                  
  0 ="No opinion"                                                          
  1 ="Totally lacking"                                                     
  2 ="Not near enough"                                                     
  3 ="Adequate"                                                            
  4 ="Just about right"                                                    
  5 ="Very thorough"                                                       
  9 ="Multiple response"                                                   
  99 ="Blank"                                                              
  ;                                                                        
VALUE Q9B                                                                  
  0 ="No opinion"                                                          
  1 ="Totally lacking"                                                     
  2 ="Not near enough"                                                     
  3 ="Adequate"                                                            
  4 ="Just about right"                                                    
  5 ="Very thorough"                                                       
  9 ="Multiple response"                                                   
  99 ="Blank"                                                              
  ;                                                                        
VALUE Q9C                                                                  
  0 ="No opinion"                                                          
  1 ="Totally lacking"                                                     
  2 ="Not near enough"                                                     
  3 ="Adequate"                                                            
  4 ="Just about right"                                                    
  5 ="Very thorough"                                                       
  9 ="Multiple response"                                                   
  99 ="Blank"                                                              
  ;                                                                        
VALUE Q9D                                                                  
  0 ="No opinion"                                                          
  1 ="Totally lacking"                                                     
  2 ="Not near enough"                                                     
  3 ="Adequate"                                                            
  4 ="Just about right"                                                    
  5 ="Very thorough"                                                       
  9 ="Multiple response"                                                   
  99 ="Blank"                                                              
  ;                                                                        
VALUE Q9E                                                                  
  0 ="No opinion"                                                          
  1 ="Totally lacking"                                                     
  2 ="Not near enough"                                                     
  3 ="Adequate"                                                            
  4 ="Just about right"                                                    
  5 ="Very thorough"                                                       
  9 ="Multiple response"                                                   
  99 ="Blank"                                                              
  ;                                                                        
VALUE Q9F                                                                  
  0 ="No opinion"                                                          
  1 ="Totally lacking"                                                     
  2 ="Not near enough"                                                     
  3 ="Adequate"                                                            
  4 ="Just about right"                                                    
  5 ="Very thorough"                                                       
  9 ="Multiple response"                                                   
  99 ="Blank"                                                              
  ;                                                                        
VALUE Q9G                                                                  
  0 ="No opinion"                                                          
  1 ="Totally lacking"                                                     
  2 ="Not near enough"                                                     
  3 ="Adequate"                                                            
  4 ="Just about right"                                                    
  5 ="Very thorough"                                                       
  9 ="Multiple response"                                                   
  99 ="Blank"                                                              
  ;                                                                        
VALUE Q10F                                                                 
  1 ="More anxious"                                                        
  2 ="Very anxious"                                                        
  3 ="Neutral"                                                             
  4 ="Somewhat less"                                                       
  5 ="Relieved"                                                            
  6 ="No opinion"                                                          
  7 ="Not sure"                                                            
  9 ="Multiple response"                                                   
  99 ="Blank"                                                              
  ;                                                                        
VALUE INDEX                                                                
  1 ="More concerned"                                                      
  2 ="Neutral"                                                             
  3 ="Less concerned"                                                      
  9 ="Blank"                                                               
  ;                                                                        
VALUE NEWQ9G                                                               
  1 ="Inadequate"                                                          
  2 ="Adequate +"                                                          
  9 ="Blank";*/                                                            
                                                                           
/* SAS INPUT FOR 3015,                                                     
   IMPACT ASSESSMENT OF SEX OFFENDER NOTIFICATION                          
   ON WISCONSIN COMMUNITIES, 1998 */                                       
                                                                           
DATA;                                                                      
INFILE "physical-filename" LRECL=71;                                       
INPUT                                                                      
   ID       1-3             MEETING  4-5             DATE     6-12         
   CITY     $ 13-26         Q1       27-28           Q2A      29-29        
   Q2B      30-30           Q2C      31-31           Q2D      32-32        
   Q2E      33-33           Q2F      34-34           Q2G      35-35        
   Q3       36-37           Q4       38-39           Q5       40-41        
   Q6A      42-42           Q6B      43-43           Q6C      44-44        
   Q6D      45-45           Q6E      46-46           Q6F      47-47        
   Q7       48-49           Q8A      50-51           Q8B      52-53        
   Q9A      54-55           Q9B      56-57           Q9C      58-59        
   Q9D      60-61           Q9E      62-63           Q9F      64-65        
   Q9G      66-67           Q10      68-69           INDEX    70-70        
   NEWQ9G   71-71 ;                                                        
                                                                           
/* SAS LABEL FOR 3015,                                                     
   IMPACT ASSESSMENT OF SEX OFFENDER NOTIFICATION                          
   ON WISCONSIN COMMUNITIES, 1998  */                                      
                                                                           
LABEL                                                                      
  ID = "SEQUENTIAL ID NUMBER"                                              
  MEETING = "WHICH MEETING"                                                
  DATE = "DATE OF MEETING"                                                 
  CITY = "WHICH CITY"                                                      
  Q1 = "FIRST FIND OUT ABOUT MEETING"                                      
  Q2A = "PURPOSE - LEGAL REQUIREMENTS"                                     
  Q2B = "PURPOSE - RIGHTS/RESPONSIBILITIES"                                
  Q2C = "PURPOSE - SEX OFFENDER BEHAVIOR"                                  
  Q2D = "PURPOSE - SPECIFIC OFFENDER"                                      
  Q2E = "PURPOSE - SAFEGUARD"                                              
  Q2F = "PURPOSE - SOFTEN REACTION"                                        
  Q2G = "PURPOSE - OTHER"                                                  
  Q3 = "HOW CLEARLY PURPOSE OF MEETING STATED"                             
  Q4 = "YOUR OPINION ABOUT HOW THIS MEETING WENT"                          
  Q5 = "YOUR OPINION ABOUT HOW MEETING WAS RUN"                            
  Q6A = "OUTCOME - INFORMATION FOR SAFEGUARD"                              
  Q6B = "OUTCOME - RESTRICT OFFENDER"                                      
  Q6C = "OUTCOME - PLACE BLAME NEIGHBORHD CHOICE"                          
  Q6D = "OUTCOME - REMOVE/PREVENT OFFENDER RESIDE"                         
  Q6E = "OUTCOME - OTHER"                                                  
  Q6F = "OUTCOME - NOT SURE"                                               
  Q7 = "RATE INFORMATION PRESENTED AT MEETING"                             
  Q8A = "HANDOUT MATERIALS PROVIDED"                                       
  Q8B = "MATERIALS HELPFUL"                                                
  Q9A = "AMOUNT OF INFO.-SEX OFFENDER IN QUESTION"                         
  Q9B = "AMOUNT OF INFO. - OTHER SEX OFFENDERS"                            
  Q9C = "AMOUNT OF INFO. - LAWS ON SEX OFFENDERS"                          
  Q9D = "AMOUNT INFO. - ENFORCEMENT RESPONSIBILIT"                         
  Q9E = "AMOUNT INFO. - OFFENDER RESPONSIBILITIES"                         
  Q9F = "AMOUNT INFO. - COMMUNITY LAWFUL OPTIONS"                          
  Q9G = "Q9G: UNDOCUMENTED VARIABLE"                                       
  Q10 = "LEVEL OF CONCERN NOW"                                             
  INDEX = "RECODED Q10"                                                    
  NEWQ9G = "RECODED Q9G" ;                                                 
                                                                           
/* SAS MISSING VALUE RECODE FOR 3015,                                      
   IMPACT ASSESSMENT OF SEX OFFENDER NOTIFICATION                          
   ON WISCONSIN COMMUNITIES, 1998  */                                      
/*                                                                         
   IF DATE=8888888 THEN DATE=.;       IF Q1=99 THEN Q1=.;                  
   IF Q3=99 THEN Q3=.;                IF Q4=99 THEN Q4=.;                  
   IF Q5=99 THEN Q5=.;                IF Q7=99 THEN Q7=.;                  
   IF Q8A=99 THEN Q8A=.;              IF Q8B=99 THEN Q8B=.;                
   IF Q9A=99 THEN Q9A=.;              IF Q9B=99 THEN Q9B=.;                
   IF Q9C=99 THEN Q9C=.;              IF Q9D=99 THEN Q9D=.;                
   IF Q9E=99 THEN Q9E=.;              IF Q9F=99 THEN Q9F=.;                
   IF Q9G=99 THEN Q9G=.;              IF Q10=99 THEN Q10=.;                
   IF INDEX=9 THEN INDEX=.;           IF NEWQ9G=9 THEN NEWQ9G=.;*/         
                                                                           
/* SAS FORMAT FOR 3015,                                                    
   IMPACT ASSESSMENT OF SEX OFFENDER NOTIFICATION                          
   ON WISCONSIN COMMUNITIES, 1998  */                                      
/*                                                                         
FORMAT                                                                     
   MEETING   MEETING.       DATE      DATEF.         Q1        Q1F.        
   Q2A       Q2A.           Q2B       Q2B.           Q2C       Q2C.        
   Q2D       Q2D.           Q2E       Q2E.           Q2F       Q2F.        
   Q2G       Q2G.           Q3        Q3F.           Q4        Q4F.        
   Q5        Q5F.           Q6A       Q6A.           Q6B       Q6B.        
   Q6C       Q6C.           Q6D       Q6D.           Q6E       Q6E.        
   Q6F       Q6F.           Q7        Q7F.           Q8A       Q8A.        
   Q8B       Q8B.           Q9A       Q9A.           Q9B       Q9B.        
   Q9C       Q9C.           Q9D       Q9D.           Q9E       Q9E.        
   Q9F       Q9F.           Q9G       Q9G.           Q10       Q10F.       
   INDEX     INDEX.         NEWQ9G    NEWQ9G. ; */                         
