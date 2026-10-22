SET WIDTH=80.                                                                 
***************************************************************************** 
*                                                                             
*              SPSS DATA DEFINITION STATEMENTS FOR ICPSR 3202                 
*        Panel Study of Income Dynamics, 1968-1999: Supplemental Files        
*               PART 17: Active Savings, 1989-1994 (Wave 27)                  
*                           1ST ICPSR VERSION                                 
*                             August, 2002                                    
*                                                                             
***************************************************************************** 
*   Typical SPSS data definition statements (setup files) contain some or     
*   all of the following statements:                                          
*                                                                             
*   FILE HANDLE: assigns a unique file "handle" to a physical file and        
*   supplies operating system specifications for the file. A file handle      
*   is needed when the LRECL is longer than 1024 bytes and is used with       
*   the FILE, OUTFILE, MATRIX, or WRITE commands.                             
*                                                                             
*   DATA LIST:  assigns the name, type, decimal specification (if any)        
*   and specifies the beginning and ending column locations for each          
*   variable in the data file. Users must replace the "physical-filename"     
*   with host computer specific input file specifications.                    
*                                                                             
*   DOCUMENT:  saves a block of text of any length in an SPSS system file.    
*   The text documents information about the system file. The documentation   
*   can later be exhibited with the DISPLAY command.                          
*                                                                             
*   VARIABLE LABELS:  assigns descriptive labels to all variables. A          
*   variable label may be identical to the variable name for some             
*   variables.                                                                
*                                                                             
*   VALUE LABELS:  assigns descriptive labels to codes in the data file.      
*   Not all variables necessarily have assigned value labels.                 
*                                                                             
*   MISSING VALUES:  declares user-defined missing values. Not all            
*   variables necessarily have user-defined missing values. These values      
*   can be treated specially in data transformations, statistical             
*   calculations, and case selection.                                         
*                                                                             
*   RECODE: [a.k.a., MISSING VALUE RECODE] sets user-defined numeric          
*   missing values to missing as interpreted by the SPSS system.              
*   Only variables with user-defined missing values are included in           
*   these statements.                                                         
*                                                                             
*   NOTE:  Users should modify these data definition statements to suit       
*   their specific needs. MISSING VALUES and MISSING VALUE RECODE             
*   sections (when included) have been marked by SPSS comment statements.     
*   To include these sections in a final SPSS setup, users should remove      
*   the SPSS comment statements from the desired section(s).                  
*                                                                             
*   These data definition statements have been tested for compatibility       
*   with SPSS Release 6.14 for UNIX and/or SPSS Release 10.0 for Windows.     
***************************************************************************** 
* SPSS FILE HANDLE, DATA LIST COMMANDS.                                       
                                                                              
FILE HANDLE DATA / NAME="physical-filename" LRECL=117.                        
DATA LIST FILE=DATA /                                                         
   ID94 1-5 VIANN_94 6-12 VOANN_94 13-19 VSHOM_94 20-26 VBREL_94 27-33        
   VSREL_94 34-40 VHIMP_94 41-47 VBBUS_94 48-54 VSBUS_94 55-61 VOASS_94 62-68 
   VODEB_94 69-75 VIASS_94 76-82 VIDEB_94 83-89 VINHA_94 90-96 VINHB_94 97-103
   VINHC_94 104-110 VSTOC_94 111-117.                                         
                                                                              
* Assign variable labels.                                                     
                                                                              
VARIABLE LABELS                                                               
   ID94 "1994 INTERVIEW NUMBER"                                               
   VIANN_94 "PUT INTO ANNUITY 94"                                             
   VOANN_94 "CASH IN ANNUITY 94"                                              
   VSHOM_94 "SELL MAIN HOME 94"                                               
   VBREL_94 "BUY REAL ESTATE 94"                                              
   VSREL_94 "SELL REAL ESTATE 94"                                             
   VHIMP_94 "HOME IMPROVEMENT 94"                                             
   VBBUS_94 "BUY BUSINESS 94"                                                 
   VSBUS_94 "SELL BUSINESS 94"                                                
   VOASS_94 "ASSETS MOVE OUT 94"                                              
   VODEB_94 "DEBTS MOVE OUT 94"                                               
   VIASS_94 "ASSETS BROUGHT IN 94"                                            
   VIDEB_94 "DEBTS BROUGHT IN 94"                                             
   VINHA_94 "FIRST GIFT/INHERITANCE 94"                                       
   VINHB_94 "SECOND GIFT/INHERITANCE 94"                                      
   VINHC_94 "THIRD GIFT/INHERITANCE 94"                                       
   VSTOC_94 "NET INTO STOCK 94".                                              
                                                                              
* Assign user-defined missing values.                                         
                                                                              
* MISSING VALUES                                                              
*    VIANN_94 (0)                                                             
*    VOANN_94 (0)                                                             
*    VSHOM_94 (0)                                                             
*    VBREL_94 (0)                                                             
*    VSREL_94 (0)                                                             
*    VHIMP_94 (0)                                                             
*    VBBUS_94 (0)                                                             
*    VSBUS_94 (0)                                                             
*    VOASS_94 (0)                                                             
*    VODEB_94 (0)                                                             
*    VIASS_94 (0)                                                             
*    VIDEB_94 (0)                                                             
*    VINHA_94 (0)                                                             
*    VINHB_94 (0)                                                             
*    VINHC_94 (0)                                                             
*    VSTOC_94 (0).                                                            
