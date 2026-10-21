* NOTE: If you have put this file in a different folder 
* from the associated data file, you will have to change the FILE 
* location on the line below to point to the physical location of your data file.
GET DATA  /TYPE = TXT/FILE = 'SPSS_DAT.dat' /DELCASE = LINE /DELIMITERS = "\t" /ARRANGEMENT = DELIMITED /FIRSTCASE = 2 /IMPORTCASE = ALL /VARIABLES =
StudySubjectID A6
ProtocolID A13
SubjectStatus A9
CRFVersionID_E2_C7 A1
 date_E2_C7  ADATE10
 knee_E2_C7  A4000
 symp_duration_yr_E2_C7  F10.0
 limp_E2_C7  A4000
 support_E2_C7  A4000
 walking_E2_C7  A4000
 stairs_E2_C7  A4000
 squatting_E2_C7  A4000
 running_E2_C7  A4000
 jumping_E2_C7  A4000
 prolonged_sitting_E2_C7  A4000
 pain_E2_C7  A4000
 swelling_E2_C7  A4000
 abnormal_sublux_E2_C7  A4000
 thigh_atrophy_E2_C7  A4000
 flexion_def_E2_C7  A4000
 total_score_E2_C7  A4000
 today_dat_E2_C7  ADATE10
 total_score_screening_E2_C7  A4000
 total_score_6week_E2_C7  A4000
 total_score_3month_E2_C7  A4000
 total_score_6month_E2_C7  A4000
 total_score_1year_E2_C7  A4000
.
VARIABLE LABELS
StudySubjectID "Participant ID" /
ProtocolID "Protocol ID" /
SubjectStatus "Participant Status" /
CRFVersionID_E2_C7 "Version Name For Screening Visit" /
 date_E2_C7  "" /
 knee_E2_C7  "" /
 symp_duration_yr_E2_C7  "" /
 limp_E2_C7  "" /
 support_E2_C7  "" /
 walking_E2_C7  "" /
 stairs_E2_C7  "" /
 squatting_E2_C7  "" /
 running_E2_C7  "" /
 jumping_E2_C7  "" /
 prolonged_sitting_E2_C7  "" /
 pain_E2_C7  "" /
 swelling_E2_C7  "" /
 abnormal_sublux_E2_C7  "" /
 thigh_atrophy_E2_C7  "" /
 flexion_def_E2_C7  "" /
 total_score_E2_C7  "" /
 today_dat_E2_C7  "" /
 total_score_screening_E2_C7  "" /
 total_score_6week_E2_C7  "" /
 total_score_3month_E2_C7  "" /
 total_score_6month_E2_C7  "" /
 total_score_1year_E2_C7  "" /
.
VALUE LABELS
knee_E2_C7
'1' "L"
'2' "R"
/
limp_E2_C7
'5' "(a) None"
'3' "(b) Slight or periodical"
'0' "(c) Constant"
/
support_E2_C7
'5' "(a) Full support without pain"
'3' "(b) Painful"
'0' "(c) Weight bearing impossible"
/
walking_E2_C7
'5' "(a) Unlimited"
'3' "(b) More than 2 km"
'2' "(c) 1-2 km"
'0' "(d) Unable"
/
stairs_E2_C7
'10' "(a) No difficulty"
'8' "(b) Slight pain when descending"
'5' "(c) Pain both when descending and ascending"
'0' "(d) Unable"
/
squatting_E2_C7
'5' "(a) No difficulty"
'4' "(b) Repeated squatting painful"
'3' "(c) Painful each time"
'2' "(d) Possible with partial weight bearing"
'0' "(e) Unable"
/
running_E2_C7
'10' "(a) No difficulty"
'8' "(b) Pain after more than 2 km"
'6' "(c) Slight pain from start"
'3' "(d) Severe pain"
'0' "(e) Unable"
/
jumping_E2_C7
'10' "(a) No difficulty"
'7' "(b) Slight difficulty"
'2' "(c) Constant pain"
'0' "(d) Unable"
/
prolonged_sitting_E2_C7
'10' "(a) No difficulty"
'8' "(b) Pain after exercise"
'6' "(c) Constant pain"
'4' "(d) Severe pain"
'0' "(e) Unable"
/
pain_E2_C7
'10' "(a) None"
'8' "(b) Slight and occasional"
'6' "(c) Interferes with sleep"
'3' "(d) Occasionally severe"
'0' "(e) Constant and severe"
/
swelling_E2_C7
'10' "(a) None"
'8' "(b) After severe exertion"
'6' "(c) After daily activities"
'4' "(d) Every morning"
'0' "(e) Constant"
/
abnormal_sublux_E2_C7
'10' "(a) None"
'6' "(b) Occasionally in sports activities"
'4' "(c) Occasionally in daily activities"
'2' "(d) At least one documented dislocation"
'0' "(e) More than two dislocations"
/
thigh_atrophy_E2_C7
'5' "(a) None"
'3' "(b) Slight"
'0' "(c) Severe"
/
flexion_def_E2_C7
'5' "(a) None"
'3' "(b) Slight"
'0' "(c) Severe"
/
.
EXECUTE.