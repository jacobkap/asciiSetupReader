/*              SAS DATA DEFINITION STATEMENTS FOR ICPSR 2136                  
   COMMON CORE OF DATA: ELEMENTARY/SECONDARY EDUCATION AGENCIES, 1985-1986     
                           1ST ICPSR VERSION                                   
                              AUGUST, 1999                                     
                                                                               
 DATA:  begins a SAS data step and names an output SAS data set.               
                                                                               
 INFILE:  identifies the input file to be read with the input statement.       
 Users must replace the "physical-filename" with host computer specific        
 input file specifications.                                                    
                                                                               
 INPUT:  assigns the name, type, decimal specification (if any), and           
 specifies the beginning and ending column locations for each variable         
 in the data file.                                                             
                                                                               
 These data definition statements have been tested for compatability           
 with SAS Release 6.11 for UNIX and/or SAS Release 6.11 for Windows. */        
                                                                               
data;                                                                          
infile "physical-filename" lrecl=152 missover pad;                             
input                                                                          
  FIPST         001-002                                                        
  AGENCY        003-007                                                        
  STID85      $ 008-021                                                        
  NAME85      $ 022-051                                                        
  STREET85    $ 052-076                                                        
  CITY85      $ 077-094                                                        
  ZIP85         095-099                                                        
  ZIP485        100-103                                                        
  OUTST85     $ 104-105                                                        
  CONUM85       106-108                                                        
  CONAME      $ 109-133                                                        
  OPCODE85      134-134                                                        
  TYPE85        135-135                                                        
  UNION85       136-138                                                        
  GSLO85      $ 139-140                                                        
  GSHI85      $ 141-142                                                        
  FISCAL85      143-143                                                        
  BOARD85       144-144                                                        
  CMSA85        145-150                                                        
  MSC85         151-151                                                        
  BOUND85       152-152                                                        
 ;                                                                             
