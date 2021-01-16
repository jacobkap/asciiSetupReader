options ls=80;                                                                
/*                                                                            
***************************************************************************** 
*                                                                             
*               SAS DATA DEFINITION STATEMENTS FOR ICPSR 3202                 
*           Panel Study of Income Dynamics, 1968-1999: Supplemental Files     
*             PART 17: Active Savings, 1989-1994 (Wave 27)                    
*                           1ST ICPSR VERSION                                 
*                             August, 2002                                    
*                                                                             
***************************************************************************** 
*  Typical SAS data definition statements (setup files) contain some or       
*  all of the following statements:                                           
*                                                                             
*  PROC FORMAT:  creates user-defined formats for the variables. Formats      
*  replace original value codes with value code descriptions. Not all         
*  variables necessarily have user-defined formats.                           
*                                                                             
*  DATA:  begins a SAS data step and names an output SAS data set.            
*                                                                             
*  INFILE:  identifies the input file to be read with the input statement.    
*  Users must replace the "physical-filename" with host computer specific     
*  input file specifications.                                                 
*                                                                             
*  INPUT:  assigns the name, type, decimal specification (if any) and         
*  identifies the beginning and ending column locations for each variable     
*  in the data file.                                                          
*                                                                             
*  LABEL: assigns  descriptive  labels to all variables.  Variable labels     
*  may be identical to variable names for some data files.                    
*                                                                             
*  MISSING VALUE RECODES:  sets user-defined numeric missing values to        
*  missing as interpreted by the SAS system. Only variables with              
*  user-defined missing values are included in the statements.                
*                                                                             
*  FORMAT:  associates the formats created by the PROC FORMAT step with       
*  the variables named in the INPUT statement.                                
*                                                                             
*  NOTE:  Users should modify these data definition statements to suit        
*  their specific needs. PROC FORMAT, FORMAT, and MISSING VALUE RECODES       
*  sections (when included) have been marked by SAS comment statements.       
*  To include these sections in a final SAS setup, users should remove        
*  the SAS comment statements from the desired section(s).                    
*                                                                             
*  These data definition statements have been tested for compatibility        
*  with SAS Release 8.1 for UNIX and/or SAS Release 7.00 for Windows.         
***************************************************************************** 
* SAS DATA, INFILE, INPUT STATEMENTS;                                         
*/                                                                            
                                                                              
DATA;                                                                         
INFILE "physical-filename" LRECL=117;                                         
INPUT                                                                         
   ID94 1-5 VIANN_94 6-12 VOANN_94 13-19 VSHOM_94 20-26 VBREL_94 27-33        
   VSREL_94 34-40 VHIMP_94 41-47 VBBUS_94 48-54 VSBUS_94 55-61 VOASS_94 62-68 
   VODEB_94 69-75 VIASS_94 76-82 VIDEB_94 83-89 VINHA_94 90-96 VINHB_94 97-103
   VINHC_94 104-110 VSTOC_94 111-117;                                         
                                                                              
* Assign variable labels;                                                     
                                                                              
LABEL                                                                         
   ID94="1994 INTERVIEW NUMBER"                                               
   VIANN_94="PUT INTO ANNUITY 94"                                             
   VOANN_94="CASH IN ANNUITY 94"                                              
   VSHOM_94="SELL MAIN HOME 94"                                               
   VBREL_94="BUY REAL ESTATE 94"                                              
   VSREL_94="SELL REAL ESTATE 94"                                             
   VHIMP_94="HOME IMPROVEMENT 94"                                             
   VBBUS_94="BUY BUSINESS 94"                                                 
   VSBUS_94="SELL BUSINESS 94"                                                
   VOASS_94="ASSETS MOVE OUT 94"                                              
   VODEB_94="DEBTS MOVE OUT 94"                                               
   VIASS_94="ASSETS BROUGHT IN 94"                                            
   VIDEB_94="DEBTS BROUGHT IN 94"                                             
   VINHA_94="FIRST GIFT/INHERITANCE 94"                                       
   VINHB_94="SECOND GIFT/INHERITANCE 94"                                      
   VINHC_94="THIRD GIFT/INHERITANCE 94"                                       
   VSTOC_94="NET INTO STOCK 94";                                              
                                                                              
* Recode user-defined numeric missing data codes                              
to SAS sysmis code;                                                           
                                                                              
/*                                                                            
                                                                              
IF VIANN_94=0 THEN VIANN_94=.;                                                
IF VOANN_94=0 THEN VOANN_94=.;                                                
IF VSHOM_94=0 THEN VSHOM_94=.;                                                
IF VBREL_94=0 THEN VBREL_94=.;                                                
IF VSREL_94=0 THEN VSREL_94=.;                                                
IF VHIMP_94=0 THEN VHIMP_94=.;                                                
IF VBBUS_94=0 THEN VBBUS_94=.;                                                
IF VSBUS_94=0 THEN VSBUS_94=.;                                                
IF VOASS_94=0 THEN VOASS_94=.;                                                
IF VODEB_94=0 THEN VODEB_94=.;                                                
IF VIASS_94=0 THEN VIASS_94=.;                                                
IF VIDEB_94=0 THEN VIDEB_94=.;                                                
IF VINHA_94=0 THEN VINHA_94=.;                                                
IF VINHB_94=0 THEN VINHB_94=.;                                                
IF VINHC_94=0 THEN VINHC_94=.;                                                
IF VSTOC_94=0 THEN VSTOC_94=.;                                                
*/                                                                            
