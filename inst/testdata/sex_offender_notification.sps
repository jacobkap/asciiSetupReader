*-------------------------------------------------------------------------*
 |                                                                        |
 |              SPSS DATA DEFINITION STATEMENTS FOR ICPSR 3015            |
 |             IMPACT ASSESSMENT OF SEX OFFENDER NOTIFICATION             |
 |                      ON WISCONSIN COMMUNITIES, 1998                    |
 |              (PART 1: COMMUNITY NOTIFICATION MEETING DATA)             |
 |                          FIRST ICPSR VERSION                           |
 |                                MAY 2001                                |
 |                                                                        |
 | SPSS setup sections are provided for the LRECL version  of  this  data |
 | collection.  These sections are listed below:                          |
 |                                                                        |
 | DATA LIST  assigns the name, type, and decimal specification (if any), |
 | and  specifies  the  beginning  and  ending  column  location for each |
 | variable.  Users must replace the "physical-filename" in the DATA LIST |
 | statement with an appropriate filename for their system.               |
 |                                                                        |
 | VARIABLE LABELS  assigns descriptive labels to all variables. Variable |
 | labels and variable names may be identical for some data files.        |
 |                                                                        |
 | MISSING VALUES declares user-defined missing values. Not all variables |
 | in  this  data set necessarily have user-defined missing values. These |
 | values  can  be treated specially in data transformations, statistical |
 | calculations, and case selection.                                      |
 |                                                                        |
 | VALUE LABELS  assigns  descriptive  labels  to codes found in the data |
 | file.  Not all codes necessarily have assigned value labels.           |
 |                                                                        |
 | PLEASE NOTE:  Users  should  combine  and modify these data definition |
 | statements  to  suit their specific needs.  The MISSING VALUES section |
 | has been commented out  (i.e., '*').  To include the MISSING VALUES in |
 | the final SPSS setup, remove the comment indicator.                    |
 |                                                                        |
 | These  data definition statements were tested using SPSS version  6.13 |
 | for UNIX.                                                              |
 |                                                                        |
*-------------------------------------------------------------------------.
                                                                           
* SPSS DATA LIST FOR 3015,                                                 
* IMPACT ASSESSMENT OF SEX OFFENDER NOTIFICATION                           
* ON WISCONSIN COMMUNITIES, 1998 .                                         
                                                                           
DATA LIST FILE="physical-filename" /                                       
   ID       1-3                       MEETING  4-5                         
   DATE     6-12                      CITY     13-26 (A)                   
   Q1       27-28                     Q2A      29-29                       
   Q2B      30-30                     Q2C      31-31                       
   Q2D      32-32                     Q2E      33-33                       
   Q2F      34-34                     Q2G      35-35                       
   Q3       36-37                     Q4       38-39                       
   Q5       40-41                     Q6A      42-42                       
   Q6B      43-43                     Q6C      44-44                       
   Q6D      45-45                     Q6E      46-46                       
   Q6F      47-47                     Q7       48-49                       
   Q8A      50-51                     Q8B      52-53                       
   Q9A      54-55                     Q9B      56-57                       
   Q9C      58-59                     Q9D      60-61                       
   Q9E      62-63                     Q9F      64-65                       
   Q9G      66-67                     Q10      68-69                       
   INDEX    70-70                     NEWQ9G   71-71.                      
                                                                           
* SPSS VARIABLE LABELS FOR 3015,                                           
* IMPACT ASSESSMENT OF SEX OFFENDER NOTIFICATION                           
* ON WISCONSIN COMMUNITIES, 1998 .                                         
                                                                           
VARIABLE LABELS                                                            
  ID        "SEQUENTIAL ID NUMBER"                                         
  MEETING   "WHICH MEETING"                                                
  DATE      "DATE OF MEETING"                                              
  CITY      "WHICH CITY"                                                   
  Q1        "FIRST FIND OUT ABOUT MEETING"                                 
  Q2A       "PURPOSE - LEGAL REQUIREMENTS"                                 
  Q2B       "PURPOSE - RIGHTS/RESPONSIBILITIES"                            
  Q2C       "PURPOSE - SEX OFFENDER BEHAVIOR"                              
  Q2D       "PURPOSE - SPECIFIC OFFENDER"                                  
  Q2E       "PURPOSE - SAFEGUARD"                                          
  Q2F       "PURPOSE - SOFTEN REACTION"                                    
  Q2G       "PURPOSE - OTHER"                                              
  Q3        "HOW CLEARLY PURPOSE OF MEETING STATED"                        
  Q4        "YOUR OPINION ABOUT HOW THIS MEETING WENT"                     
  Q5        "YOUR OPINION ABOUT HOW MEETING WAS RUN"                       
  Q6A       "OUTCOME - INFORMATION FOR SAFEGUARD"                          
  Q6B       "OUTCOME - RESTRICT OFFENDER"                                  
  Q6C       "OUTCOME - PLACE BLAME NEIGHBORHD CHOICE"                      
  Q6D       "OUTCOME - REMOVE/PREVENT OFFENDER RESIDE"                     
  Q6E       "OUTCOME - OTHER"                                              
  Q6F       "OUTCOME - NOT SURE"                                           
  Q7        "RATE INFORMATION PRESENTED AT MEETING"                        
  Q8A       "HANDOUT MATERIALS PROVIDED"                                   
  Q8B       "MATERIALS HELPFUL"                                            
  Q9A       "AMOUNT OF INFO.-SEX OFFENDER IN QUESTION"                     
  Q9B       "AMOUNT OF INFO. - OTHER SEX OFFENDERS"                        
  Q9C       "AMOUNT OF INFO. - LAWS ON SEX OFFENDERS"                      
  Q9D       "AMOUNT INFO. - ENFORCEMENT RESPONSIBILIT"                     
  Q9E       "AMOUNT INFO. - OFFENDER RESPONSIBILITIES"                     
  Q9F       "AMOUNT INFO. - COMMUNITY LAWFUL OPTIONS"                      
  Q9G       "Q9G: UNDOCUMENTED VARIABLE"                                   
  Q10       "LEVEL OF CONCERN NOW"                                         
  INDEX     "RECODED Q10"                                                  
  NEWQ9G    "RECODED Q9G" .                                                
                                                                           
* SPSS MISSING VALUE COMMAND FOR 3015,                                     
* IMPACT ASSESSMENT OF SEX OFFENDER NOTIFICATION                           
* ON WISCONSIN COMMUNITIES, 1998 .                                         
                                                                           
*MISSING VALUES                                                            
   DATE (8888888)           Q1 (99)                  Q3 (99)               
   Q4 (99)                  Q5 (99)                  Q7 (99)               
   Q8A (99)                 Q8B (99)                 Q9A (99)              
   Q9B (99)                 Q9C (99)                 Q9D (99)              
   Q9E (99)                 Q9F (99)                 Q9G (99)              
   Q10 (99)                 INDEX (9)                NEWQ9G (9).           
                                                                           
* SPSS VALUE LABELS FOR 3015,                                              
* IMPACT ASSESSMENT OF SEX OFFENDER NOTIFICATION                           
* ON WISCONSIN COMMUNITIES, 1998 .                                         
                                                                           
VALUE LABELS                                                               
  MEETING  1 "1"                                                           
           2 "2"                                                           
           3 "3"                                                           
           4 "4"                                                           
           5 "5"                                                           
           6 "6"                                                           
           7 "7"                                                           
           8 "8"                                                           
           9 "9"                                                           
           10 "10"                                                         
           11 "11"                                                         
           12 "12"                                                         
           13 "13"                                                         
           14 "14"                                                         
           15 "15"                                                         
           16 "16"                                                         
           17 "17"                                                         
           18 "18"                                                         
           19 "19"                                                         
           20 "20"                                                         
           21 "21"                                                         
           22 "22"                                                         
           /                                                               
  DATE     8888888 "Blanked"                                               
           /                                                               
  Q1       1 "Media"                                                       
           2 "Flyers"                                                      
           3 "Local official"                                              
           4 "Friend, etc."                                                
           5 "Other"                                                       
           6 "Not sure"                                                    
           9 "Multiple response"                                           
           99 "Blank"                                                      
           /                                                               
  Q2A      1 "Checked"                                                     
           9 "Blank"                                                       
           /                                                               
  Q2B      1 "Checked"                                                     
           9 "Blank"                                                       
           /                                                               
  Q2C      1 "Checked"                                                     
           9 "Blank"                                                       
           /                                                               
  Q2D      1 "Checked"                                                     
           9 "Blank"                                                       
           /                                                               
  Q2E      1 "Checked"                                                     
           9 "Blank"                                                       
           /                                                               
  Q2F      1 "Checked"                                                     
           9 "Blank"                                                       
           /                                                               
  Q2G      1 "Checked"                                                     
           9 "Blank"                                                       
           /                                                               
  Q3       1 "Very clear"                                                  
           2 "Moderate clear"                                              
           3 "Neutral"                                                     
           4 "Somewhat clear"                                              
           5 "Very unclear"                                                
           6 "Not sure"                                                    
           9 "Multiple response"                                           
           99 "Blank"                                                      
           /                                                               
  Q4       1 "High marks"                                                  
           2 "Some value"                                                  
           3 "Neutral"                                                     
           4 "Little value"                                                
           5 "No value"                                                    
           9 "Multiple response"                                           
           99 "Blank"                                                      
           /                                                               
  Q5       1 "Well organized"                                              
           2 "Somewhat organized"                                          
           3 "Neutral"                                                     
           4 "Somewhat disorganized"                                       
           5 "High disorganized"                                           
           9 "Multiple response"                                           
           99 "Blank"                                                      
           /                                                               
  Q6A      1 "Checked"                                                     
           9 "Blank"                                                       
           /                                                               
  Q6B      1 "Checked"                                                     
           9 "Blank"                                                       
           /                                                               
  Q6C      1 "Checked"                                                     
           9 "Blank"                                                       
           /                                                               
  Q6D      1 "Checked"                                                     
           9 "Blank"                                                       
           /                                                               
  Q6E      1 "Checked"                                                     
           9 "Blank"                                                       
           /                                                               
  Q6F      1 "Checked"                                                     
           9 "Blank"                                                       
           /                                                               
  Q7       1 "Very helpful"                                                
           2 "Somewhat helpful"                                            
           3 "Neutral"                                                     
           4 "Generally unhelpful"                                         
           5 "Not helpful"                                                 
           9 "Multiple response"                                           
           99 "Blank"                                                      
           /                                                               
  Q8A      1 "Yes"                                                         
           2 "No"                                                          
           3 "Not sure"                                                    
           9 "Multiple response"                                           
           99 "Blank"                                                      
           /                                                               
  Q8B      1 "Yes"                                                         
           2 "No"                                                          
           3 "Not applicable"                                              
           9 "Multiple response"                                           
           99 "Blank"                                                      
           /                                                               
  Q9A      0 "No opinion"                                                  
           1 "Totally lacking"                                             
           2 "Not near enough"                                             
           3 "Adequate"                                                    
           4 "Just about right"                                            
           5 "Very thorough"                                               
           9 "Multiple response"                                           
           99 "Blank"                                                      
           /                                                               
  Q9B      0 "No opinion"                                                  
           1 "Totally lacking"                                             
           2 "Not near enough"                                             
           3 "Adequate"                                                    
           4 "Just about right"                                            
           5 "Very thorough"                                               
           9 "Multiple response"                                           
           99 "Blank"                                                      
           /                                                               
  Q9C      0 "No opinion"                                                  
           1 "Totally lacking"                                             
           2 "Not near enough"                                             
           3 "Adequate"                                                    
           4 "Just about right"                                            
           5 "Very thorough"                                               
           9 "Multiple response"                                           
           99 "Blank"                                                      
           /                                                               
  Q9D      0 "No opinion"                                                  
           1 "Totally lacking"                                             
           2 "Not near enough"                                             
           3 "Adequate"                                                    
           4 "Just about right"                                            
           5 "Very thorough"                                               
           9 "Multiple response"                                           
           99 "Blank"                                                      
           /                                                               
  Q9E      0 "No opinion"                                                  
           1 "Totally lacking"                                             
           2 "Not near enough"                                             
           3 "Adequate"                                                    
           4 "Just about right"                                            
           5 "Very thorough"                                               
           9 "Multiple response"                                           
           99 "Blank"                                                      
           /                                                               
  Q9F      0 "No opinion"                                                  
           1 "Totally lacking"                                             
           2 "Not near enough"                                             
           3 "Adequate"                                                    
           4 "Just about right"                                            
           5 "Very thorough"                                               
           9 "Multiple response"                                           
           99 "Blank"                                                      
           /                                                               
  Q9G      0 "No opinion"                                                  
           1 "Totally lacking"                                             
           2 "Not near enough"                                             
           3 "Adequate"                                                    
           4 "Just about right"                                            
           5 "Very thorough"                                               
           9 "Multiple response"                                           
           99 "Blank"                                                      
           /                                                               
  Q10      1 "More anxious"                                                
           2 "Very anxious"                                                
           3 "Neutral"                                                     
           4 "Somewhat less"                                               
           5 "Relieved"                                                    
           6 "No opinion"                                                  
           7 "Not sure"                                                    
           9 "Multiple response"                                           
           99 "Blank"                                                      
           /                                                               
  INDEX    1 "More concerned"                                              
           2 "Neutral"                                                     
           3 "Less concerned"                                              
           9 "Blank"                                                       
           /                                                               
  NEWQ9G   1 "Inadequate"                                                  
           2 "Adequate +"                                                  
           9 "Blank"  .                                                    
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
                                                                           
