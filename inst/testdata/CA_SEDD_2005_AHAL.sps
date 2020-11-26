/*******************************************************************
*   CA_SEDD_2005_AHAL.SPS:                                        
*      THE SPSS CODE SHOWN BELOW WILL LOAD THE ASCII                
*      INPATIENT STAY AHAL FILE INTO SPSS                         
*******************************************************************/


*******************************.
*  Define the data file       *.
*******************************.

DATA LIST FILE = 'CA_SEDD_2005_AHAL.ASC' FIXED / 
 AHAID                      1-   7 (A)
 DSHOSPID                   8-  20 (A)
 HOSPID                    21-  25
 HOSPST                    26-  27 (A)
 HOSPSTCO                  28-  32
 YEAR                      33-  36.


***  Specify write formats  ***.
FORMATS
 HOSPID                  (F4.0) /
 HOSPSTCO                (F4.0) /
 YEAR                    (F3.0) .


***  Assign labels to the variables ***.
VARIABLE LABELS 
 AHAID     "AHA hospital identifier with the leading 6"
 DSHOSPID  "Data source hospital identifier"
 HOSPID    "HCUP hospital identification number"
 HOSPST    "Hospital state postal code"
 HOSPSTCO  "Hospital modified FIPS state/county code"
 YEAR      "Calendar year" .


**********************************************************.
*    Convert missing data to system missing values       *.
**********************************************************.

RECODE HOSPSTCO
 (-9999,-8888,-6666,-5555=SYSMIS).



SAVE OUTFILE = 'CA_SEDD_2005_AHAL.SAV' /COMPRESSED.
