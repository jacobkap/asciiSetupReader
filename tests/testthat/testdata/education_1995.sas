/*             SAS DATA DEFINITION STATEMENTS FOR ICPSR 2470              
    COMMON CORE OF DATA: PUBLIC SCHOOL UNIVERSE DATA, 1995-1996           
                          1ST ICPSR VERSION                               
                             OCOTBER 1999                                 
                                                                          
DATA:  begins a SAS data step and names an output SAS data set.           
                                                                          
INFILE:  identifies the input file to be read with the input statement.   
Users must replace the "physical-filename" with host computer specific    
input file specifications.                                                
                                                                          
INPUT:  assigns the name, type, decimal specification (if any), and       
specifies the beginning and ending column locations for each variable     
in the data file.                                                         
                                                                          
LABEL:  assigns descriptive labels to all variables.  Variable labels     
and variable names may be identical for some variables. */                
                                                                          
DATA;                                                                     
INFILE "physical-filename" LRECL=336 MISSOVER PAD;                        
MISSING M N;                                                              
INPUT                                                                     
  FIPST      $ 001-002                                                    
  AGENCY     $ 003-007                                                    
  SCHNO      $ 008-012                                                    
  STID95     $ 013-026                                                    
  LEANM95    $ 027-056                                                    
  SEASCH95   $ 057-076                                                    
  SCHNAM95   $ 077-106                                                    
  STREET95   $ 107-136                                                    
  CITY95     $ 137-154                                                    
  ST95       $ 155-156                                                    
  ZIP95      $ 157-161                                                    
  ZIP495     $ 162-165                                                    
  AREA95     $ 166-168                                                    
  NUMBER95   $ 169-175                                                    
  TYPE95     $ 176-176                                                    
  STATUS95   $ 177-177                                                    
  LOCALE95   $ 178-178                                                    
  FTE95        179-183 .1                                                 
  GSLO95     $ 184-185                                                    
  GSHI95     $ 186-187                                                    
  UG95         188-192                                                    
  PK95         193-197                                                    
  KG95         198-202                                                    
  G0195        203-207                                                    
  G0295        208-212                                                    
  G0395        213-217                                                    
  G0495        218-222                                                    
  G0595        223-227                                                    
  G0695        228-232                                                    
  G0795        233-237                                                    
  G0895        238-242                                                    
  G0995        243-247                                                    
  G1095        248-252                                                    
  G1195        253-257                                                    
  G1295        258-262                                                    
  MEMBER95     263-268                                                    
  FLE95        269-274                                                    
  IND95        275-279                                                    
  ASIAN95      280-284                                                    
  HISP95       285-289                                                    
  BLACK95      290-294                                                    
  WHITE95      295-299                                                    
  TOTETH95     300-305                                                    
  PUPTCH95     306-311 .1                                                 
  IFTE95     $ 312-312                                                    
  IUG95      $ 313-313                                                    
  IPK95      $ 314-314                                                    
  IKG95      $ 315-315                                                    
  IG0195     $ 316-316                                                    
  IG0295     $ 317-317                                                    
  IG0395     $ 318-318                                                    
  IG0495     $ 319-319                                                    
  IG0595     $ 320-320                                                    
  IG0695     $ 321-321                                                    
  IG0795     $ 322-322                                                    
  IG0895     $ 323-323                                                    
  IG0995     $ 324-324                                                    
  IG1095     $ 325-325                                                    
  IG1195     $ 326-326                                                    
  IG1295     $ 327-327                                                    
  IMEMB95    $ 328-328                                                    
  IFLE95     $ 329-329                                                    
  IIND95     $ 330-330                                                    
  IASIAN95   $ 331-331                                                    
  IHISP95    $ 332-332                                                    
  IBLACK95   $ 333-333                                                    
  IWHITE95   $ 334-334                                                    
  IETH95     $ 335-335                                                    
  IPUTCH95   $ 336-336                                                    
 ;                                                                        
                                                                          
LABEL                                                                     
  FIPST   = "FIPS STATE CODE FOR LOCATION OF SCHOOL"                      
  AGENCY  = "UNIQUE SYSTEM ID (NCES ASSIGNED)"                            
  SCHNO   = "SCHOOL NUMBER WITHIN STATE (NCES)"                           
  STID95  = "STATE AGENCY ID"                                             
  LEANM95 = "NAME OF OPERATING AGENCY"                                    
  SEASCH95= "STATE SCHOOL ID"                                             
  SCHNAM95= "SCHOOL NAME"                                                 
  STREET95= "MAILING ADDRESS OF SCHOOL"                                   
  CITY95  = "CITY NAME (MAILING ADDRESS)"                                 
  ST95    = "STATE ABBREVIATION (POSTAL SERVICE)"                         
  ZIP95   = "5-DIGIT ZIP CODE"                                            
  ZIP495  = "ZIP+4 IF ASSIGNED"                                           
  AREA95  = "AREA CODE OF SCHOOL"                                         
  NUMBER95= "EXCHANGE AND NUMBER OF SCHOOL"                               
  TYPE95  = "SCHOOL TYPE CODE"                                            
  STATUS95= "OPERATIONAL STATUS CODE"                                     
  LOCALE95= "TYPE OF LOCALE CODE"                                         
  FTE95   = "CLASSROOM TEACHERS (FTE)"                                    
  GSLO95  = "SCHOOL LOW GRADE (FROM GRADE ENROLLMENT)"                    
  GSHI95  = "SCHOOL HIGH GRADE (FROM GRADE ENROLLMT)"                     
  UG95    = "STUDENTS IN UNGRADED CLASSES"                                
  PK95    = "PREKINDERGARTEN STUDENTS"                                    
  KG95    = "KINDERGARTEN STUDENTS"                                       
  G0195   = "1ST  GRADE STUDENTS"                                         
  G0295   = "2ND  GRADE STUDENTS"                                         
  G0395   = "3RD  GRADE STUDENTS"                                         
  G0495   = "4TH  GRADE STUDENTS"                                         
  G0595   = "5TH  GRADE STUDENTS"                                         
  G0695   = "6TH  GRADE STUDENTS"                                         
  G0795   = "7TH  GRADE STUDENTS"                                         
  G0895   = "8TH  GRADE STUDENTS"                                         
  G0995   = "9TH  GRADE STUDENTS"                                         
  G1095   = "10TH GRADE STUDENTS"                                         
  G1195   = "11TH GRADE STUDENTS"                                         
  G1295   = "12TH GRADE STUDENTS"                                         
  MEMBER95= "TOTAL MEMBERSHIP (SUM OF GRADES)"                            
  FLE95   = "FREE-LUNCH ELIGIBLE STUDENTS"                                
  IND95   = "AM INDIAN/ALASKAN STUDENTS"                                  
  ASIAN95 = "ASIAN/PACIFIC ISLANDER STUDENTS"                             
  HISP95  = "HISPANIC STUDENTS"                                           
  BLACK95 = "BLACK NON-HISPANIC STUDENTS"                                 
  WHITE95 = "WHITE NON-HISPANIC STUDENTS"                                 
  TOTETH95= "TOTAL ETHNIC"                                                
  PUPTCH95= "PUPIL TEACHER RATIO"                                         
  IFTE95  = "ADJUSTED TEACHERS FLAG"                                      
  IUG95   = "ADJUSTED UNGRADED STUDENTS FLAG"                             
  IPK95   = "ADJUSTED PREKINDERGARTEN STUDENTS FLAG"                      
  IKG95   = "ADJUSTED KINDERGARTEN STUDENTS FLAG"                         
  IG0195  = "ADJUSTED 1ST  GRADE STUDENTS FLAG"                           
  IG0295  = "ADJUSTED 2ND  GRADE STUDENTS FLAG"                           
  IG0395  = "ADJUSTED 3RD  GRADE STUDENTS FLAG"                           
  IG0495  = "ADJUSTED 4TH  GRADE STUDENTS FLAG"                           
  IG0595  = "ADJUSTED 5TH  GRADE STUDENTS FLAG"                           
  IG0695  = "ADJUSTED 6TH  GRADE STUDENTS FLAG"                           
  IG0795  = "ADJUSTED 7TH  GRADE STUDENTS FLAG"                           
  IG0895  = "ADJUSTED 8TH  GRADE STUDENTS FLAG"                           
  IG0995  = "ADJUSTED 9TH  GRADE STUDENTS FLAG"                           
  IG1095  = "ADJUSTED 10TH GRADE STUDENTS FLAG"                           
  IG1195  = "ADJUSTED 11TH GRADE STUDENTS FLAG"                           
  IG1295  = "ADJUSTED 12TH GRADE STUDENTS FLAG"                           
  IMEMB95 = "ADJUSTED TOTAL STUDENTS FLAG"                                
  IFLE95  = "ADJUSTED FREE-LUNCH ELIGIBLE FLAG"                           
  IIND95  = "ADJUSTED AM INDIAN/ALASKAN STUDENTS FLAG"                    
  IASIAN95= "ADJUSTED ASIAN/PACIFIC ISLANDER STU FLAG"                    
  IHISP95 = "ADJUSTED HISPANIC STUDENTS FLAG"                             
  IBLACK95= "ADJUSTED BLACK NON-HISPANIC STUDENT FLAG"                    
  IWHITE95= "ADJUSTED WHITE NON-HISPANIC STUDENT FLAG"                    
  IETH95  = "ADJUSTED ETHNICITY FLAG"                                     
  IPUTCH95= "ADJUSTED PUPIL TEACHER RATIO FLAG"                           
 ;                                                                        
