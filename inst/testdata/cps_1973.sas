/*                                                                             
                 SAS DATA DEFINITION STATEMENTS FOR ICPSR 7616                 
              CURRENT POPULATION SURVEY, 1973, AND SOCIAL SECURITY             
                         RECORDS:  EXACT MATCH DATA                            
                            SPRING 1984 RELEASE                                
                                                                               
   The following SAS setup sections appear in this file for the LRECL          
   version of this data collection.  These sections are listed below:          
                                                                               
   PROC FORMAT:  creates user-defined formats for the variables.  Formats      
   replace original value codes with the value code descriptions.  Not all     
   variables necessarily have user-defined formats.                            
                                                                               
   DATA begins a SAS data step and names an output SAS dataset.                
                                                                               
   INFILE identifies the input file to be read with the input statement.       
   Users must replace the "physical-filename" with host computer-specific      
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
INFILE "file-specification" LRECL=582;                                         
INPUT                                                                          
   V1001 1-1                V1002 2-10               V1003 11-11               
   V1004 12-12              V1005 13-13              V1006 14-14               
   V1007 15-16              V1008 17-17              V1009 18-18               
   V1010 19-27              V1011 28-36              V1012 37-37               
   V1013 38-38              V1014 39-39              V1015 40-40               
   V1016 41-41              V1017 42-42              V1018 43-46               
   V1019 47-47              V1020 48-48              V1021 49-49               
   V1022 50-50              V1023 51-51              V1024 52-52               
   V1025 53-53              V1026 54-54              V1027 55-55               
   V1028 56-56              V1029 57-57              V1030 58-59               
   V1031 60-61              V1032 62-62              V1033 63-64               
   V1034 65-66              V1035 67-68              V1036 69-69               
   V1037 70-70              V1038 71-71              V1039 72-72               
   V1040 73-74              V1041 75-75              V1042 76-76               
   V1043 77-77              V1044 78-78              V1045 79-80               
   V1046 81-81              V1047 82-82              V1048 83-83               
   V1049 84-85              V1050 86-87              V1051 88-89               
   V1052 90-90              V1053 91-92              V1054 93-94               
   V1055 95-96              V1056 97-97              V1057 98-98               
   V1058 99-99              V1059 100-100            V1060 101-102             
   V1061 103-103            V1062 104-104            V1063 105-105             
   V1064 106-106            V1065 107-109            V1066 110-112             
   V1067 113-113            V1068 114-114            V1069 115-115             
   V1070 116-117            V1071 118-118            V1072 119-119             
   V1073 120-120            V1074 121-126            V1075 127-127             
   V1076 128-128            V1077 129-129            V1078 130-134             
   V1079 135-135            V1080 136-136            V1081 137-137             
   V1082 138-142            V1083 143-143            V1084 144-144             
   V1085 145-145            V1086 146-146            V1087 147-147             
   V1088 148-152            V1089 153-153            V1090 154-154             
   V1091 155-155            V1092 156-156            V1093 157-157             
   V1094 158-158            V1095 159-163            V1096 164-164             
   V1097 165-165            V1098 166-166            V1099 167-167             
   V1100 168-172            V1101 173-173            V1102 174-174             
   V1103 175-175            V1104 176-176            V1105 177-177             
   V1106 178-178            V1107 179-179            V1108 180-184             
   V1109 185-185            V1110 186-186            V1111 187-187             
   V1112 188-188            V1113 189-189            V1114 190-190             
   V1115 191-191            V1116 192-196            V1117 197-197             
   V1118 198-198            V1119 199-204            V1120 205-205             
   V1121 206-206            V1122 207-212            V1123 213-213             
   V1124 214-214            V1125 215-215            V1126 216-216             
   V1127 217-217            V1128 218-218            V1129 219-220             
   V1130 221-222            V1131 223-227            V1132 228-228             
   V1133 229-229            V1134 230-230            V1135 231-231             
   V1136 232-232            V1137 233-233            V1138 234-234             
   V1139 235-235            V1140 236-240            V1141 241-241             
   V1142 242-242            V1143 243-243            V1144 244-244             
   V1145 245-245            V1146 246-246            V1147 247-247             
   V1148 248-248            V1149 249-253            V1150 254-255             
   V1151 256-260            V1152 261-265            V1153 266-270             
   V1154 271-273            V1155 274-276            V1156 277-279             
   V1157 280-281            V1158 282-284            V1159 285-286             
   V1160 287-288            V1161 289-290            V1162 291-292             
   V1163 293-294            V1164 295-296            V1165 297-301             
   V1166 302-306            V1167 307-311            V1168 312-316             
   V1169 317-321            V1170 322-322            V1171 323-327             
   V1172 328-329            V1173 330-337            V1174 338-345             
   V1175 346-352            V1176 353-359            V1177 360-360             
   V1178 361-361            V1179 362-362            V1180 363-364             
   V1181 365-365            V1182 366-367            V1183 368-369             
   V1184 370-370            V1185 371-371            V1186 372-373             
   V1187 374-374            V1188 375-376            V1189 377-377             
   V1190 378-378            V1191 379-380            V1192 381-382             
   V1193 383-386            V1194 387-388            V1195 389-392             
   V1196 393-394            V1197 395-398            V1198 399-400             
   V1199 401-404            V1200 405-406            V1201 407-407             
   V1202 408-409            V1203 410-410            V1204 411-411             
   V1205 412-412            V1206 413-413            V1207 414-415             
   V1208 416-417            V1209 418-421            V1210 422-423             
   V1211 424-424            V1212 425-428            V1213 429-432             
   V1214 433-436            V1215 437-437            V1216 438-439             
   V1217 440-440            V1218 441-442            V1219 443-444             
   V1220 445-445            V1221 446-447            V1222 448-449             
   V1223 450-450            V1224 451-452            V1225 453-454             
   V1226 455-456            V1227 457-458            V1228 459-460             
   V1229 461-464            V1230 465-468            V1231 469-472             
   V1232 473-474            V1233 475-475            V1234 476-476             
   V1235 477-477            V1236 478-478            V1237 479-480             
   V1238 481-481            V1239 482-482            V1240 483-484             
   V1241 485-485            V1242 486-486            V1243 487-487             
   V1244 488-488            V1245 489-489            V1246 490-491             
   V1247 492-492            V1248 493-493            V1249 494-495             
   V1250 496-496            V1251 497-497            V1252 498-498             
   V1253 499-499            V1254 500-500            V1255 501-501             
   V1256 502-502            V1257 503-511            V1258 512-518             
   V1259 519-525            V1260 526-532            V1261 533-539             
   V1262 540-546            V1263 547-553            V1264 554-560             
   V1265 561-567            V1266 568-574            V1267 575-578             
   V1268 579-579            V1269 580-582;                                     
                                                                               
* SAS LABEL STATEMENT;                                                         
                                                                               
LABEL                                                                          
   V1001 = "SMON"                                                              
   V1002 = "HHSEQNUM"                                                          
   V1003 = "HNUM"                                                              
   V1004 = "SUBH"                                                              
   V1005 = "STATS1"                                                            
   V1006 = "STATS2"                                                            
   V1007 = "HSEQ"                                                              
   V1008 = "FMEM"                                                              
   V1009 = "SFMEM"                                                             
   V1010 = "SSN"                                                               
   V1011 = "CAN"                                                               
   V1012 = "SEGREP"                                                            
   V1013 = "MINT"                                                              
   V1014 = "JINT"                                                              
   V1015 = "RSID"                                                              
   V1016 = "MINH"                                                              
   V1017 = "MRRH"                                                              
   V1018 = "INTID"                                                             
   V1019 = "MJINT"                                                             
   V1020 = "MNINT"                                                             
   V1021 = "MINR"                                                              
   V1022 = "MINTR"                                                             
   V1023 = "REGION"                                                            
   V1024 = "DIVISION"                                                          
   V1025 = "FARM"                                                              
   V1026 = "SMSA"                                                              
   V1027 = "QUARTS"                                                            
   V1028 = "CRMRC"                                                             
   V1029 = "TENURE"                                                            
   V1030 = "HINC"                                                              
   V1031 = "MINSEQ"                                                            
   V1032 = "DINSEG"                                                            
   V1033 = "CMONTH"                                                            
   V1034 = "CDAY"                                                              
   V1035 = "CYEAR"                                                             
   V1036 = "CSEX"                                                              
   V1037 = "CRACE"                                                             
   V1038 = "CMAR"                                                              
   V1039 = "CAFS"                                                              
   V1040 = "MAGE"                                                              
   V1041 = "MSEX"                                                              
   V1042 = "MRACE"                                                             
   V1043 = "MMAR"                                                              
   V1044 = "MPOP"                                                              
   V1045 = "MSTAT"                                                             
   V1046 = "VETS"                                                              
   V1047 = "ETNCIT"                                                            
   V1048 = "LWACT"                                                             
   V1049 = "LWCLAS"                                                            
   V1050 = "LWOCC"                                                             
   V1051 = "LWIND"                                                             
   V1052 = "MPLOY"                                                             
   V1053 = "HOURS"                                                             
   V1054 = "NOWORK"                                                            
   V1055 = "WORK3"                                                             
   V1056 = "FYWORK"                                                            
   V1057 = "WLOOK"                                                             
   V1058 = "WILF1"                                                             
   V1059 = "WILF2"                                                             
   V1060 = "WUNEMP"                                                            
   V1061 = "SUNEMP"                                                            
   V1062 = "WALLOC"                                                            
   V1063 = "WWORK"                                                             
   V1064 = "WCLASS"                                                            
   V1065 = "WOCC"                                                              
   V1066 = "WIND"                                                              
   V1067 = "PFTIME"                                                            
   V1068 = "PYEAR"                                                             
   V1069 = "NOWORK"                                                            
   V1070 = "SCHOOL"                                                            
   V1071 = "SWAGE1"                                                            
   V1072 = "SWAGE2"                                                            
   V1073 = "SWAGE3"                                                            
   V1074 = "WAGE"                                                              
   V1075 = "SWFARM1"                                                           
   V1076 = "SWFARM2"                                                           
   V1077 = "SWFARM3"                                                           
   V1078 = "NFARM"                                                             
   V1079 = "SFARM1"                                                            
   V1080 = "SFARM2"                                                            
   V1081 = "SFARM3"                                                            
   V1082 = "FARM"                                                              
   V1083 = "SBENY1"                                                            
   V1084 = "SBENY2"                                                            
   V1085 = "SBENY3"                                                            
   V1086 = "SBENY4"                                                            
   V1087 = "SBENY5"                                                            
   V1088 = "BENEFIT"                                                           
   V1089 = "SFROP1"                                                            
   V1090 = "SFROP2"                                                            
   V1091 = "SFROP3"                                                            
   V1092 = "SFROP4"                                                            
   V1093 = "SFROP5"                                                            
   V1094 = "SFROP6"                                                            
   V1095 = "PROP"                                                              
   V1096 = "SWELF1"                                                            
   V1097 = "SWELF2"                                                            
   V1098 = "SWELF3"                                                            
   V1099 = "SWELF4"                                                            
   V1100 = "WELF"                                                              
   V1101 = "OTRANS1"                                                           
   V1102 = "OTRANS2"                                                           
   V1103 = "OTRANS3"                                                           
   V1104 = "OTRANS4"                                                           
   V1105 = "OTRANS5"                                                           
   V1106 = "OTRANS6"                                                           
   V1107 = "OTRANS7"                                                           
   V1108 = "TRANS"                                                             
   V1109 = "SOINK1"                                                            
   V1110 = "SOINK2"                                                            
   V1111 = "SOINK3"                                                            
   V1112 = "SOINK4"                                                            
   V1113 = "SOINK5"                                                            
   V1114 = "SOINK6"                                                            
   V1115 = "SOINK7"                                                            
   V1116 = "OINK"                                                              
   V1117 = "STINK1"                                                            
   V1118 = "STINK2"                                                            
   V1119 = "TINK"                                                              
   V1120 = "SPINK1"                                                            
   V1121 = "SPINK2"                                                            
   V1122 = "TFINK"                                                             
   V1123 = "POOR"                                                              
   V1124 = "SIRQ1"                                                             
   V1125 = "SIRQ2"                                                             
   V1126 = "MANI"                                                              
   V1127 = "SEX"                                                               
   V1128 = "RACE"                                                              
   V1129 = "AGE"                                                               
   V1130 = "BMONTH"                                                            
   V1131 = "EARN72"                                                            
   V1132 = "PQ72"                                                              
   V1133 = "SQ72"                                                              
   V1134 = "TQ72"                                                              
   V1135 = "LQ72"                                                              
   V1136 = "AG72"                                                              
   V1137 = "SE72"                                                              
   V1138 = "TE72"                                                              
   V1139 = "QCOV72"                                                            
   V1140 = "EARN71"                                                            
   V1141 = "PQ71"                                                              
   V1142 = "SQ71"                                                              
   V1143 = "TQ71"                                                              
   V1144 = "LQ71"                                                              
   V1145 = "AG71"                                                              
   V1146 = "SE71"                                                              
   V1147 = "TE71"                                                              
   V1148 = "ISURE"                                                             
   V1149 = "TAXTOT"                                                            
   V1150 = "NBWSE"                                                             
   V1151 = "LOASI"                                                             
   V1152 = "EOASI"                                                             
   V1153 = "EARN50"                                                            
   V1154 = "AME36"                                                             
   V1155 = "AME50"                                                             
   V1156 = "AMEB5"                                                             
   V1157 = "CYEAR"                                                             
   V1158 = "TQNW"                                                              
   V1159 = "TQAG"                                                              
   V1160 = "TQSE"                                                              
   V1161 = "FEAR"                                                              
   V1162 = "LEAR"                                                              
   V1163 = "PATTOT"                                                            
   V1164 = "PATT25"                                                            
   V1165 = "LPQ72"                                                             
   V1166 = "ASQ72"                                                             
   V1167 = "ATQ72"                                                             
   V1168 = "ALQ72"                                                             
   V1169 = "EXT72"                                                             
   V1170 = "SUME"                                                              
   V1171 = "M2WAGE"                                                            
   V1172 = "NEMPR"                                                             
   V1173 = "AGI"                                                               
   V1174 = "IWAGE"                                                             
   V1175 = "IDIVD"                                                             
   V1176 = "IINT"                                                              
   V1177 = "ISCE1"                                                             
   V1178 = "ISCE2"                                                             
   V1179 = "RTYPE"                                                             
   V1180 = "EXEMPT1"                                                           
   V1181 = "EXEMPT2"                                                           
   V1182 = "EXEMPT3"                                                           
   V1183 = "EXEMPT4"                                                           
   V1184 = "EXEMPT5"                                                           
   V1185 = "EXEMPT6"                                                           
   V1186 = "EXEMPT7"                                                           
   V1187 = "EXEMPT8"                                                           
   V1188 = "EXEMPT9"                                                           
   V1189 = "LRACE"                                                             
   V1190 = "LSEX"                                                              
   V1191 = "LDOB"                                                              
   V1192 = "LAGE"                                                              
   V1193 = "MAY73"                                                             
   V1194 = "NOBMAY"                                                            
   V1195 = "BEN73"                                                             
   V1196 = "MON73"                                                             
   V1197 = "BEN72"                                                             
   V1198 = "MON72"                                                             
   V1199 = "BENE71"                                                            
   V1200 = "MON71"                                                             
   V1201 = "LCLAIM"                                                            
   V1202 = "TBIC"                                                              
   V1203 = "PAY74"                                                             
   V1204 = "RRAIL"                                                             
   V1205 = "BRACE"                                                             
   V1206 = "BSEX"                                                              
   V1207 = "BMON"                                                              
   V1208 = "BAGE"                                                              
   V1209 = "BEN72P"                                                            
   V1210 = "NOM72P"                                                            
   V1211 = "CSTAT"                                                             
   V1212 = "MBA"                                                               
   V1213 = "PIA"                                                               
   V1214 = "FSAX"                                                              
   V1215 = "DEDUCE"                                                            
   V1216 = "CYEAR"                                                             
   V1217 = "DUAL"                                                              
   V1218 = "FMON"                                                              
   V1219 = "FYEAR"                                                             
   V1220 = "BCLAIM"                                                            
   V1221 = "BBIC"                                                              
   V1222 = "TBEGIN"                                                            
   V1223 = "PAY72"                                                             
   V1224 = "BBENE1"                                                            
   V1225 = "BBENE2"                                                            
   V1226 = "NBENE14"                                                           
   V1227 = "NOBENE14"                                                          
   V1228 = "NBENE18"                                                           
   V1229 = "BENAM1"                                                            
   V1230 = "BENAM2"                                                            
   V1231 = "BENAM3"                                                            
   V1232 = "OCLAIM"                                                            
   V1233 = "SANUM"                                                             
   V1234 = "SCAN"                                                              
   V1235 = "SORIGN"                                                            
   V1236 = "SFINAL"                                                            
   V1237 = "ENAGR"                                                             
   V1238 = "ERS1"                                                              
   V1239 = "ERS2"                                                              
   V1240 = "EAGE"                                                              
   V1241 = "EMON"                                                              
   V1242 = "ITADD1"                                                            
   V1243 = "ITADD2"                                                            
   V1244 = "ITADD3"                                                            
   V1245 = "ITADD4"                                                            
   V1246 = "BNAME"                                                             
   V1247 = "BRS1"                                                              
   V1248 = "BRS2"                                                              
   V1249 = "BAGE"                                                              
   V1250 = "BMON"                                                              
   V1251 = "ADEAT"                                                             
   V1252 = "SERMAT"                                                            
   V1253 = "IRSMAT"                                                            
   V1254 = "BIFMAT"                                                            
   V1255 = "SSIRSMAT"                                                          
   V1256 = "FAMAT"                                                             
   V1257 = "SWAIT"                                                             
   V1258 = "BLWAIT"                                                            
   V1259 = "MSWAIT"                                                            
   V1260 = "CWAIT1"                                                            
   V1261 = "CWAIT3"                                                            
   V1262 = "AWAIT1"                                                            
   V1263 = "AWAIT2"                                                            
   V1264 = "AWAIT3"                                                            
   V1265 = "AWAIT4"                                                            
   V1266 = "AWAIT5"                                                            
   V1267 = "ICPSR STUDY NUMBER-7616"                                           
   V1268 = "ICPSR EDITION NUMBER-1"                                            
   V1269 = "ICPSR PART NUMBER-001";                                            
                                                                               
* USER-DEFINED MISSING VALUE RECODE TO SAS SYSMIS;                             
                                                                               
/*                                                                             
   IF V1013=0000000 THEN V1013=.;      IF V1014=0000000 THEN V1014=.;          
   IF V1020=0000000 THEN V1020=.;      IF V1021=0000000 THEN V1021=.;          
   IF V1022=0000000 THEN V1022=.;      IF V1029=0000000 THEN V1029=.;          
   IF V1030=0000000 THEN V1030=.;      IF V1031=0000000 THEN V1031=.;          
   IF V1032=0000009 THEN V1032=.;      IF V1033=0000000 THEN V1033=.;          
   IF V1034=0000000 THEN V1034=.;      IF V1035=-000009 THEN V1035=.;          
   IF V1036=0000000 THEN V1036=.;      IF V1037=0000009 THEN V1037=.;          
   IF V1038=0000000 THEN V1038=.;      IF V1039=0000000 THEN V1039=.;          
   IF V1043=0000000 THEN V1043=.;      IF V1046=0000000 THEN V1046=.;          
   IF V1047=0000000 THEN V1047=.;      IF V1048=0000000 THEN V1048=.;          
   IF V1049=0000099 THEN V1049=.;      IF V1050=0000099 THEN V1050=.;          
   IF V1051=0000099 THEN V1051=.;      IF V1052=0000009 THEN V1052=.;          
   IF V1053=0000000 THEN V1053=.;      IF V1054=0000000 THEN V1054=.;          
   IF V1055=0000099 THEN V1055=.;      IF V1056=0000000 THEN V1056=.;          
   IF V1057=0000000 THEN V1057=.;      IF V1058=0000000 THEN V1058=.;          
   IF V1059=0000000 THEN V1059=.;      IF V1060=-000009 THEN V1060=.;          
   IF V1061=0000000 THEN V1061=.;      IF V1062=0000000 THEN V1062=.;          
   IF V1063=0000000 THEN V1063=.;      IF V1064=0000000 THEN V1064=.;          
   IF V1065=0000000 THEN V1065=.;      IF V1066=0000000 THEN V1066=.;          
   IF V1067=0000000 THEN V1067=.;      IF V1068=0000000 THEN V1068=.;          
   IF V1069=0000000 THEN V1069=.;      IF V1070=0000000 THEN V1070=.;          
   IF V1071=0000000 THEN V1071=.;      IF V1072=0000000 THEN V1072=.;          
   IF V1073=0000000 THEN V1073=.;      IF V1074=0999999 THEN V1074=.;          
   IF V1075=0000000 THEN V1075=.;      IF V1076=0000000 THEN V1076=.;          
   IF V1077=0000000 THEN V1077=.;      IF V1078=0099999 THEN V1078=.;          
   IF V1079=0000000 THEN V1079=.;      IF V1080=0000000 THEN V1080=.;          
   IF V1081=0000000 THEN V1081=.;      IF V1082=0099999 THEN V1082=.;          
   IF V1083=0000000 THEN V1083=.;      IF V1084=0000000 THEN V1084=.;          
   IF V1085=0000000 THEN V1085=.;      IF V1086=0000000 THEN V1086=.;          
   IF V1087=0000000 THEN V1087=.;      IF V1088=0099999 THEN V1088=.;          
   IF V1089=0000000 THEN V1089=.;      IF V1090=0000000 THEN V1090=.;          
   IF V1091=0000000 THEN V1091=.;      IF V1092=0000000 THEN V1092=.;          
   IF V1093=0000000 THEN V1093=.;      IF V1094=0000000 THEN V1094=.;          
   IF V1095=0099999 THEN V1095=.;      IF V1096=0000000 THEN V1096=.;          
   IF V1097=0000000 THEN V1097=.;      IF V1098=0000000 THEN V1098=.;          
   IF V1099=0000000 THEN V1099=.;      IF V1100=0099999 THEN V1100=.;          
   IF V1101=0000000 THEN V1101=.;      IF V1102=0000000 THEN V1102=.;          
   IF V1103=0000000 THEN V1103=.;      IF V1104=0000000 THEN V1104=.;          
   IF V1105=0000000 THEN V1105=.;      IF V1106=0000000 THEN V1106=.;          
   IF V1107=0000000 THEN V1107=.;      IF V1108=0099999 THEN V1108=.;          
   IF V1109=0000000 THEN V1109=.;      IF V1110=0000000 THEN V1110=.;          
   IF V1111=0000000 THEN V1111=.;      IF V1112=0000000 THEN V1112=.;          
   IF V1113=0000000 THEN V1113=.;      IF V1114=0000000 THEN V1114=.;          
   IF V1115=0000000 THEN V1115=.;      IF V1116=0099999 THEN V1116=.;          
   IF V1117=0000000 THEN V1117=.;      IF V1118=0000000 THEN V1118=.;          
   IF V1119=0999999 THEN V1119=.;      IF V1120=0000000 THEN V1120=.;          
   IF V1121=0000000 THEN V1121=.;      IF V1122=0099999 THEN V1122=.;          
   IF V1123=0000000 THEN V1123=.;      IF V1126=0000000 THEN V1126=.;          
   IF V1127=0000000 THEN V1127=.;      IF V1128=0000000 THEN V1128=.;          
   IF V1129=-000009 THEN V1129=.;      IF V1130=0000000 THEN V1130=.;          
   IF V1131=0099999 THEN V1131=.;      IF V1132=0000009 THEN V1132=.;          
   IF V1133=0000009 THEN V1133=.;      IF V1134=0000009 THEN V1134=.;          
   IF V1135=0000009 THEN V1135=.;      IF V1136=0000009 THEN V1136=.;          
   IF V1137=0000009 THEN V1137=.;      IF V1138=0000009 THEN V1138=.;          
   IF V1139=0000009 THEN V1139=.;      IF V1140=0099999 THEN V1140=.;          
   IF V1141=0000009 THEN V1141=.;      IF V1142=0000009 THEN V1142=.;          
   IF V1143=0000009 THEN V1143=.;      IF V1144=0000009 THEN V1144=.;          
   IF V1145=0000009 THEN V1145=.;      IF V1146=0000009 THEN V1146=.;          
   IF V1147=0000009 THEN V1147=.;      IF V1148=0000009 THEN V1148=.;          
   IF V1149=0099999 THEN V1149=.;      IF V1150=0000099 THEN V1150=.;          
   IF V1151=0099999 THEN V1151=.;      IF V1152=0099999 THEN V1152=.;          
   IF V1153=0099999 THEN V1153=.;      IF V1154=-000099 THEN V1154=.;          
   IF V1155=-000099 THEN V1155=.;      IF V1156=-000099 THEN V1156=.;          
   IF V1157=-000009 THEN V1157=.;      IF V1158=-000099 THEN V1158=.;          
   IF V1159=-000009 THEN V1159=.;      IF V1160=-000009 THEN V1160=.;          
   IF V1161=0000099 THEN V1161=.;      IF V1162=0000099 THEN V1162=.;          
   IF V1163=0000099 THEN V1163=.;      IF V1164=0000099 THEN V1164=.;          
   IF V1165=0099999 THEN V1165=.;      IF V1166=0099999 THEN V1166=.;          
   IF V1167=0099999 THEN V1167=.;      IF V1168=0099999 THEN V1168=.;          
   IF V1169=0099999 THEN V1169=.;      IF V1170=0000009 THEN V1170=.;          
   IF V1171=0099999 THEN V1171=.;      IF V1172=0000099 THEN V1172=.;          
   IF V1173=9999999 THEN V1173=.;      IF V1174=9999999 THEN V1174=.;          
   IF V1175=9999999 THEN V1175=.;      IF V1176=9999999 THEN V1176=.;          
   IF V1177=0000009 THEN V1177=.;      IF V1178=0000009 THEN V1178=.;          
   IF V1179=0000009 THEN V1179=.;      IF V1180=0000099 THEN V1180=.;          
   IF V1181=0000009 THEN V1181=.;      IF V1182=0000099 THEN V1182=.;          
   IF V1183=0000099 THEN V1183=.;      IF V1184=0000009 THEN V1184=.;          
   IF V1185=0000009 THEN V1185=.;      IF V1186=0000099 THEN V1186=.;          
   IF V1187=0000009 THEN V1187=.;      IF V1188=0000099 THEN V1188=.;          
   IF V1189=0000000 THEN V1189=.;      IF V1190=0000000 THEN V1190=.;          
   IF V1191=0000000 THEN V1191=.;      IF V1192=-000009 THEN V1192=.;          
   IF V1193=-000999 THEN V1193=.;      IF V1194=0000099 THEN V1194=.;          
   IF V1195=-000999 THEN V1195=.;      IF V1196=0000099 THEN V1196=.;          
   IF V1197=-000999 THEN V1197=.;      IF V1198=0000099 THEN V1198=.;          
   IF V1199=-000999 THEN V1199=.;      IF V1200=0000099 THEN V1200=.;          
   IF V1201=0000000 THEN V1201=.;      IF V1202=0000000 THEN V1202=.;          
   IF V1203=0000000 THEN V1203=.;      IF V1204=0000000 THEN V1204=.;          
   IF V1205=0000000 THEN V1205=.;      IF V1206=0000000 THEN V1206=.;          
   IF V1207=0000000 THEN V1207=.;      IF V1208=-000009 THEN V1208=.;          
   IF V1209=-000999 THEN V1209=.;      IF V1210=0000099 THEN V1210=.;          
   IF V1211=0000000 THEN V1211=.;      IF V1212=-000999 THEN V1212=.;          
   IF V1213=-000999 THEN V1213=.;      IF V1214=-000999 THEN V1214=.;          
   IF V1215=0000000 THEN V1215=.;      IF V1216=0000000 THEN V1216=.;          
   IF V1217=0000000 THEN V1217=.;      IF V1218=0000000 THEN V1218=.;          
   IF V1219=0000000 THEN V1219=.;      IF V1220=0000000 THEN V1220=.;          
   IF V1221=0000000 THEN V1221=.;      IF V1222=0000000 THEN V1222=.;          
   IF V1223=0000000 THEN V1223=.;      IF V1224=0000099 THEN V1224=.;          
   IF V1225=0000099 THEN V1225=.;      IF V1226=0000099 THEN V1226=.;          
   IF V1227=0000099 THEN V1227=.;      IF V1228=0000099 THEN V1228=.;          
   IF V1229=-000999 THEN V1229=.;      IF V1230=-000999 THEN V1230=.;          
   IF V1231=-000999 THEN V1231=.;      IF V1232=0000000 THEN V1232=.;          
   IF V1233=0000000 THEN V1233=.;      IF V1234=0000000 THEN V1234=.;          
   IF V1235=0000000 THEN V1235=.;      IF V1236=0000000 THEN V1236=.;          
   IF V1237=0000000 THEN V1237=.;      IF V1238=0000000 THEN V1238=.;          
   IF V1239=0000000 THEN V1239=.;      IF V1240=0000099 THEN V1240=.;          
   IF V1241=0000000 THEN V1241=.;      IF V1242=0000000 THEN V1242=.;          
   IF V1243=0000000 THEN V1243=.;      IF V1244=0000000 THEN V1244=.;          
   IF V1245=0000000 THEN V1245=.;      IF V1246=0000000 THEN V1246=.;          
   IF V1247=0000000 THEN V1247=.;      IF V1248=0000000 THEN V1248=.;          
   IF V1249=0000099 THEN V1249=.;      IF V1250=0000000 THEN V1250=.;          
   IF V1251=0000000 THEN V1251=.;      IF V1252=0000009 THEN V1252=.;          
   IF V1253=0000009 THEN V1253=.;      IF V1254=0000009 THEN V1254=.;          
   IF V1255=0000009 THEN V1255=.;      IF V1256=0000009 THEN V1256=.;          
   IF V1257=0999999 THEN V1257=.;      IF V1258=0999999 THEN V1258=.;          
   IF V1260=-999999 THEN V1260=.;      IF V1261=-999999 THEN V1261=.;          
   IF V1262=-999999 THEN V1262=.;      IF V1263=-999999 THEN V1263=.;          
   IF V1264=-999999 THEN V1264=.;      IF V1265=-999999 THEN V1265=.;          
   IF V1266=-999999 THEN V1266=.;                                              
*/                                                                             
