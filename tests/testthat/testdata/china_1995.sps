*-------------------------------------------------------------------------*
*                                                                          
*                     SPSS SETUP FILE FOR ICPSR 03012
*                  CHINESE HOUSEHOLD INCOME PROJECT, 1995
*                  (DATASET 0003: URBAN INDIVIDUAL DATA)
* 
*
*  SPSS setup sections are provided for the ASCII version of this data
*  collection.  These sections are listed below:
*
*  DATA LIST:  assigns the name, type, decimal specification (if any),
*  and specifies the beginning and ending column locations for each
*  variable in the data file. Users must replace the "data-filename"
*  in the DATA LIST statement with a filename specifying the directory
*  on the user's computer system in which the downloaded and unzipped
*  data file is physically located (e.g., "c:\temp\03012-0003-data.txt").
*
*  VARIABLE LABELS:  assigns descriptive labels to all variables.
*  Labels and variable names may be identical for some data files.
*
*  MISSING VALUES: declares user-defined missing values. Not all
*  variables in this data set necessarily have user-defined missing
*  values. These values can be treated specially in data transformations,
*  statistical calculations, and case selection.
*
*  VALUE LABELS: assigns descriptive labels to codes found in the data
*  file.  Not all codes necessarily have assigned value labels.
*
*  NOTE:  Users should modify this setup file to suit their specific 
*  needs. The MISSING VALUES section has been commented out (i.e., '*').
*  To include the MISSING VALUES section in the final SPSS setup, remove 
*  the comment indicators from the desired section.
*
*  CREATING A PERMANENT SPSS DATA FILE: If users wish to create and save
*  an SPSS data file for further analysis using SPSS for Windows, the
*  necessary "SAVE OUTFILE" command is provided in the last line of
*  this file.  To activate the command, users must delete the leading
*  asterisk (*) and replace "spss-filename" with a filename specifying
*  the location on the user's computer system to which the new data file
*  will be saved (e.g., SAVE OUTFILE="c:\spsswin\data\da03012-0003.sav").
*
*-------------------------------------------------------------------------.

* SPSS FILE HANDLE AND DATA LIST COMMANDS.

FILE HANDLE DATA / NAME="data-filename" LRECL=1224.
DATA LIST FILE=DATA /
                 N1 1-12                A1 13-24
                A2 25-36                A3 37-48                A4 49-60
                A5 61-72                A6 73-84                A7 85-96
               A8 97-108              A9 109-120             A10 121-132
             A11 133-144             A12 145-156             A13 157-168
             A14 169-180             A15 181-192             A16 193-204
             A17 205-216             A18 217-228             A19 229-240
             A20 241-252             A21 253-264             A22 265-276
             A23 277-288             A24 289-300             A25 301-312
             A26 313-324             A27 325-336             A28 337-348
             A29 349-360             A30 361-372             A31 373-384
             A32 385-396             A33 397-408             A34 409-420
             A35 421-432             A36 433-444             A37 445-456
             A38 457-468             A39 469-480             A40 481-492
             A41 493-504             A42 505-516             A43 517-528
             A44 529-540             A45 541-552             A46 553-564
             A47 565-576             A48 577-588             A49 589-600
             A50 601-612             A51 613-624             A52 625-636
             A53 637-648             A54 649-660             A55 661-672
             A56 673-684             A57 685-696             A58 697-708
             A59 709-720             A60 721-732             A61 733-744
             A62 745-756             A63 757-768             A64 769-780
             A65 781-792             A66 793-804             A67 805-816
             A68 817-828             A69 829-840             A70 841-852
             A71 853-864             A72 865-876             A73 877-888
             A74 889-900             A75 901-912             A76 913-924
             A77 925-936             A78 937-948             A79 949-960
             A80 961-972             A81 973-984             A82 985-996
            A83 997-1008           A84 1009-1020           A85 1021-1032
           A86 1033-1044           A87 1045-1056           A88 1057-1068
           A89 1069-1080           A90 1081-1092           A91 1093-1104
           A92 1105-1116           A93 1117-1128           A94 1129-1140
           A95 1141-1152           A96 1153-1164           A97 1165-1176
           A98 1177-1188           A99 1189-1200      PROVINCE 1201-1212
        COUNTY 1213-1224
   .

* SPSS VARIABLE LABELS COMMAND.

VARIABLE LABELS
   N1        'N1' /
   A1        'A1' /
   A2        'A2' /
   A3        'A3' /
   A4        'A4' /
   A5        'A5' /
   A6        'A6' /
   A7        'A7' /
   A8        'A8' /
   A9        'A9' /
   A10       'A10' /
   A11       'A11' /
   A12       'A12' /
   A13       'A13' /
   A14       'A14' /
   A15       'A15' /
   A16       'A16' /
   A17       'A17' /
   A18       'A18' /
   A19       'A19' /
   A20       'A20' /
   A21       'A21' /
   A22       'A22' /
   A23       'A23' /
   A24       'A24' /
   A25       'A25' /
   A26       'A26' /
   A27       'A27' /
   A28       'A28' /
   A29       'A29' /
   A30       'A30' /
   A31       'A31' /
   A32       'A32' /
   A33       'A33' /
   A34       'A34' /
   A35       'A35' /
   A36       'A36' /
   A37       'A37' /
   A38       'A38' /
   A39       'A39' /
   A40       'A40' /
   A41       'A41' /
   A42       'A42' /
   A43       'A43' /
   A44       'A44' /
   A45       'A45' /
   A46       'A46' /
   A47       'A47' /
   A48       'A48' /
   A49       'A49' /
   A50       'A50' /
   A51       'A51' /
   A52       'A52' /
   A53       'A53' /
   A54       'A54' /
   A55       'A55' /
   A56       'A56' /
   A57       'A57' /
   A58       'A58' /
   A59       'A59' /
   A60       'A60' /
   A61       'A61' /
   A62       'A62' /
   A63       'A63' /
   A64       'A64' /
   A65       'A65' /
   A66       'A66' /
   A67       'A67' /
   A68       'A68' /
   A69       'A69' /
   A70       'A70' /
   A71       'A71' /
   A72       'A72' /
   A73       'A73' /
   A74       'A74' /
   A75       'A75' /
   A76       'A76' /
   A77       'A77' /
   A78       'A78' /
   A79       'A79' /
   A80       'A80' /
   A81       'A81' /
   A82       'A82' /
   A83       'A83' /
   A84       'A84' /
   A85       'A85' /
   A86       'A86' /
   A87       'A87' /
   A88       'A88' /
   A89       'A89' /
   A90       'A90' /
   A91       'A91' /
   A92       'A92' /
   A93       'A93' /
   A94       'A94' /
   A95       'A95' /
   A96       'A96' /
   A97       'A97' /
   A98       'A98' /
   A99       'A99' /
   PROVINCE  'PROVINCE' /
   COUNTY    'COUNTY' /
   .


* SPSS VALUE LABELS COMMAND.

VALUE LABELS
   A3        1 'self' 2 'spouse' 3 'child' 4 'child in law' 5 'grandchild'
             6 'parent' 7 'parent in law' 8 'grandparent'
             9 'brother or sister' 10 'other relative' 11 'non-relative' /
   A4        1 'male' 2 'female' /
   A6        1 'working or employed' 2 'retired'
             3 'waiting for a job or unemployed' 4 'full-time student'
             5 'full-time homemaker' 6 'pre-school child'
             7 'disable, injured or had chronic disease, unaable to work'
             8 'other' /
   A7        1 'married' 2 'never married' 3 'divorced' 4 'widow or widower'
             5 'other' /
   A8        1 'yes' 2 'no' /
   A9        1 'yes' 2 'no' /
   A11       1 'college or above' 2 'professional school'
             3 'middle level professional, technical or vocational school'
             4 'upper midle school' 5 'lower middle school'
             6 'elementary school' 7 'below elementary school' /
   A13       1 'yes' 2 'no' /
   A14       1 'through public health service' 2 'through medical insurance'
             3 'entirely self financed' 4 'other' /
   A19       0 'unknown code' 1 'yes' 2 'no' /
   A20       1 'yes' 2 'no' /
   A27       0 'unknown code' 1 'state-owned, at central or provincial level'
             2 'local publicly-owned' 3 'urban collective'
             4 'private enterprise, including partnership'
             5 'self-employed business/individual enterprise'
             6 'sino-foreign joint venture' 7 'foreign owned'
             8 'township and village enterprise' 9 'other' /
   A28       0 'unknown code' 1 'state-owned, at central or provincial level'
             2 'local publicly-owned' 3 'urban collective'
             4 'private enterprise, including partnership'
             5 'self-employed business/individual enterprise'
             6 'sino-foreign joint venture' 7 'foreign owned'
             8 'township and village enterprise' 9 'other' /
   A29       0 'unknown code' 1 'permanent worker'
             2 'long-term contract worker or employee'
             3 'temporary (including short-term contract) worker'
             4 'private enterprise proprietor or self-employed' 5 'other' /
   A30       0 'unknown code' 1 'permanent worker'
             2 'long-term contract worker or employee'
             3 'temporary (including short-term contract) worker'
             4 'private enterprise proprietor or self-employed' 5 'other' /
   A31       0 'unknown code' 1 'owner of private or individual enterprise'
             2 'owner and manager of private enterprise'
             3 'professional or technical worker' 4 'head of institution;'
             5 'division head in institution' 6 'office worker'
             7 'skilled worker' 8 'unskilled worker' 9 'other' /
   A32       0 'unknown code' 1 'owner of private or individual enterprise'
             2 'owner and manager of private enterprise'
             3 'professional or technical worker' 4 'head of institution;'
             5 'division head in institution' 6 'office worker'
             7 'skilled worker' 8 'unskilled worker' 9 'other' /
   A33       0 'unknown code' 1 'high professional title'
             2 'middle level professional title'
             3 'primary level professional title' 4 'technical personnel'
             5 'manager or upper level cadre' 6 'basic level cadre'
             7 'professional cadre' /
   A34       0 'unknown code'
             1 'agr/forestry/animal husbandry/fishing/water conservancy'
             2 'industry' 3 'mining and geological survey and prospecting'
             4 'construction'
             5 'transport/communications/posts/telecommunications'
             6 'commerce/restaurants&catering/materials supply/warehousing'
             7 'real estate/public utilities/personal & consulting services'
             8 'health, physical culture and social welfare'
             9 'education, culture, arts and broadcasting'
             10 'scientific research and technical services'
             11 'finance, insurance'
             12 'government and Party organs, social organizations'
             13 'other' /
   A35       0 'unknown code'
             1 'agr/forestry/animal husbandry/fishing/water conservancy'
             2 'industry' 3 'mining and geological survey and prospecting'
             4 'construction'
             5 'transport/communications/posts/telecommunications'
             6 'commerce/restaurants&catering/materials supply/warehousing'
             7 'real estate, public utilities, personal&consulting services'
             8 'health, physical culture and social welfare'
             9 'education, culture, arts and broadcasting'
             10 'scientific research and technical services'
             11 'finance, insurance'
             12 'government and Party organs, social organizations'
             13 'other' /
   A36       0 'unknown code' 1 'indoors (in an office or factory)'
             2 'outdoors' 3 'underground or underwater' 4 'other' /
   A37       0 'unknown code' 1 'yes' 2 'no' /
   A38       0 'unknown code' 1 'yes' 2 'no' /
   A39       0 'unknown code' 1 'not intensive' 2 'moderate'
             3 'very intensive' /
   A40       0 'unknown code' 1 'very satisfied' 2 'somewhat satisfied'
             3 'so-so' 4 'somewhat disatisfied' 5 'very disatisfied' /
   A41       0 'unknown code' 1 'assigned by government'
             2 'obtained through an employment agency' 3 'inherited it'
             4 'found it on your own' 5 'other' /
   A47       0 'unknown code' 1 'an enterprise'
             2 'a government organization or institution' 3 'other' /
   A48       0 'unknown code' 1 'yes' 2 'no' /
   A49       0 'unknown code' 1 'employed throughout the year'
             2 'unemployed some of the time'
             3 'unemployed throughout the year' /
   .

EXECUTE.

* Create SPSS system file.

*SAVE OUTFILE="spss-filename.sav".
