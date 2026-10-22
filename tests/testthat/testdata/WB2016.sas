
/*************************************************************************
   Label           : 2016: Wellbeing and Daily Life Supplement
   Rows            : 8341
   Columns         : 312
   ASCII File Date : April 14, 2017
*************************************************************************/

DATA WB2016 ; 
   ATTRIB 
      WB16REL    LABEL="RELEASE NUMBER"                              format=f1.
      WB16YRID   LABEL="2015 FAMILY INTERVIEW (ID) NUMBER"           format=f5.
      WB16SN     LABEL="SEQUENCE NUMBER 15"                          format=f2.
      WB16SEX    LABEL="SEX OF R"                                    format=f1.
      WB16AGE    LABEL="AGE OF R ON DEC 31 2015"                     format=f3.
      WB16IWMODE LABEL="MODE OF INTERVIEW"                           format=f1.
      WB16IWMO   LABEL="MONTH CURRENT IW"                            format=f2.
      WB16IWYR   LABEL="YEAR CURRENT IW"                             format=f4.
      WB16A1     LABEL="A1 SATISFIED W/ LIFE AS WHOLE"               format=f1.
      WB16A2     LABEL="A2 WHICH STEP OF LADDER"                     format=f2.
      WB16A3A    LABEL="A3A LIFE CLOSE TO IDEAL"                     format=f1.
      WB16A3B    LABEL="A3B LIFE CONDITIONS EXCELLENT"               format=f1.
      WB16A3C    LABEL="A3C SATISFIED W/ LIFE"                       format=f1.
      WB16A3D    LABEL="A3D GOTTEN IMPORTANT THINGS"                 format=f1.
      WB16A3E    LABEL="A3E CHANGE ALMOST NOTHING"                   format=f1.
      WB16A4A    LABEL="A4A HOW IMPORTANT HOUSE/APT I LIKE"          format=f1.
      WB16A4B    LABEL="A4B HOW IMPORTANT CITY I LIKE"               format=f1.
      WB16A4C    LABEL="A4C HOW IMPORTANT INTERESTING JOB"           format=f1.
      WB16A4D    LABEL="A4D HOW IMPORTANT FINANCIAL SECURITY"        format=f1.
      WB16A4E    LABEL="A4E HOW IMPORTANT HOBBIES OUTSIDE WORK"      format=f1.
      WB16A4F    LABEL="A4F HOW IMPORTANT HAPPY RELATIONSHIP"        format=f1.
      WB16A4G    LABEL="A4G HOW IMPORTANT GOOD FAMILY LIFE"          format=f1.
      WB16A4H    LABEL="A4H HOW IMPORTANT GOOD FRIENDS"              format=f1.
      WB16A4I    LABEL="A4I HOW IMPORTANT GOOD HEALTH"               format=f1.
      WB16A4J    LABEL="A4J HOW IMPORTANT STRONG RELIGIOUS FAITH"    format=f1.
      WB16A5A    LABEL="A5A HOW SATISFIED W/ HOUSE/APT"              format=f1.
      WB16A5B    LABEL="A5B HOW SATISFIED W/ CITY"                   format=f1.
      WB16A5C    LABEL="A5C HOW SATISFIED W/ JOB"                    format=f1.
      WB16A5D    LABEL="A5D HOW SATISFIED W/ FINANCIAL SITUATION"    format=f1.
      WB16A5E    LABEL="A5E HOW SATISFIED W/ HOBBIES"                format=f1.
      WB16A5F    LABEL="A5F HOW SATISFIED W/ RELATIONSHIP"           format=f1.
      WB16A5G    LABEL="A5G HOW SATISFIED W/ FAMILY LIFE"            format=f1.
      WB16A5H    LABEL="A5H HOW SATISFIED W/ FRIENDSHIPS"            format=f1.
      WB16A5I    LABEL="A5I HOW SATISFIED W/ HEALTH"                 format=f1.
      WB16A5J    LABEL="A5J HOW SATISFIED W/ FAITH"                  format=f1.
      WB16A6A    LABEL="A6A LEAD PURPOSEFUL LIFE"                    format=f1.
      WB16A6B    LABEL="A6B RELATIONSHIPS SUPPORTIVE"                format=f1.
      WB16A6C    LABEL="A6C ENGAGED IN DAILY ACTIVITIES"             format=f1.
      WB16A6D    LABEL="A6D CONTRIBUTE HAPPINESS OTHERS"             format=f1.
      WB16A6E    LABEL="A6E CAPABLE IN IMPORTANT ACTIVITIES"         format=f1.
      WB16A6F    LABEL="A6F GOOD PERSON GOOD LIFE"                   format=f1.
      WB16A6G    LABEL="A6G OPTIMISTIC ABOUT FUTURE"                 format=f1.
      WB16A6H    LABEL="A6H PEOPLE RESPECT ME"                       format=f1.
      WB16B1A    LABEL="B1A PAST 30 DAYS FELT CHEERFUL"              format=f1.
      WB16B1B    LABEL="B1B PAST 30 DAYS FELT IN GOOD SPIRITS"       format=f1.
      WB16B1C    LABEL="B1C PAST 30 DAYS FELT EXTREMELY HAPPY"       format=f1.
      WB16B1D    LABEL="B1D PAST 30 DAYS FELT CALM PEACEFUL"         format=f1.
      WB16B1E    LABEL="B1E PAST 30 DAYS FELT SATISFIED"             format=f1.
      WB16B1F    LABEL="B1F PAST 30 DAYS FELT FULL OF LIFE"          format=f1.
      WB16B2A    LABEL="B2A PAST 30 DAYS COULD NOT CHEER UP"         format=f1.
      WB16B2B    LABEL="B2B PAST 30 DAYS FELT NERVOUS"               format=f1.
      WB16B2C    LABEL="B2C PAST 30 DAYS FELT RESTLESS FIDGETY"      format=f1.
      WB16B2D    LABEL="B2D PAST 30 DAYS FELT HOPELESS"              format=f1.
      WB16B2E    LABEL="B2E PAST 30 DAYS EVERYTHING EFFORT"          format=f1.
      WB16B2F    LABEL="B2F PAST 30 DAYS FELT WORTHLESS"             format=f1.
      WB16C1     LABEL="C1 WHAT DAY OF WEEK YESTERDAY"               format=f1.
      WB16C2A    LABEL="C2A HOUR WOKE UP YESTERDAY"                  format=f2.
      WB16C2B    LABEL="C2B MINUTE WOKE UP YESTERDAY"                format=f2.
      WB16C2C    LABEL="C2C WOKE UP AM/PM YESTERDAY"                 format=f1.
      WB16C2ACC  LABEL="ACCURACY OF TIME WOKE UP"                    format=f1.
      WB16C3A    LABEL="C3A HOUR WENT TO SLEEP YESTERDAY"            format=f2.
      WB16C3B    LABEL="C3B MINUTE WENT TO SLEEP YESTERDAY"          format=f2.
      WB16C3C    LABEL="C3C WENT TO SLEEP AM/PM YESTERDAY"           format=f1.
      WB16C3ACC  LABEL="ACCURACY OF TIME WENT TO SLEEP"              format=f1.
      WB16C4A    LABEL="C4 MEALS ATE YESTERDAY - BREAKFAST"          format=f1.
      WB16C4B    LABEL="C4 MEALS ATE YESTERDAY - LUNCH"              format=f1.
      WB16C4C    LABEL="C4 MEALS ATE YESTERDAY - DINNER"             format=f1.
      WB16C4D    LABEL="C4 MEALS ATE YESTERDAY - SNACK"              format=f1.
      WB16C4E    LABEL="C4 MEALS ATE YESTERDAY - NONE OF ABOVE"      format=f1.
      WB16C4ACC  LABEL="ACCURACY OF MEALS ATE YESTERDAY"             format=f1.
      WB16C5A    LABEL="C5 WORK SCHOOL ACTIVITY - WORK"              format=f1.
      WB16C5B    LABEL="C5 WORK SCHOOL ACTIVITY - VOLUNTEER"         format=f1.
      WB16C5C    LABEL="C5 WORK SCHOOL ACTIVITY - SCHOOL"            format=f1.
      WB16C5D    LABEL="C5 WORK SCHOOL ACTIVITY - LEARN NEW"         format=f1.
      WB16C5E    LABEL="C5 WORK SCHOOL ACTIVITY - NONE OF ABOVE"     format=f1.
      WB16C5ACC  LABEL="ACCURACY OF WORK SCHOOL ACTIVITY"            format=f1.
      WB16C6A    LABEL="C6 HH ACTIVITY - COOKED"                     format=f1.
      WB16C6B    LABEL="C6 HH ACTIVITY - CLEANED UP KITCHEN"         format=f1.
      WB16C6C    LABEL="C6 HH ACTIVITY - LAUNDRY"                    format=f1.
      WB16C6D    LABEL="C6 HH ACTIVITY - CLEANED HOUSE"              format=f1.
      WB16C6E    LABEL="C6 HH ACTIVITY - YARD WORK"                  format=f1.
      WB16C6F    LABEL="C6 HH ACTIVITY - CAR REPAIR"                 format=f1.
      WB16C6G    LABEL="C6 HH ACTIVITY - SHOP/RAN ERRANDS"           format=f1.
      WB16C6H    LABEL="C6 HH ACTIVITY - PAID BILLS/MANAGED FIN"     format=f1.
      WB16C6I    LABEL="C6 HH ACTIVITY - NONE OF ABOVE"              format=f1.
      WB16C6ACC  LABEL="ACCURACY OF HH ACTIVITY"                     format=f1.
      WB16C7A    LABEL="C7 HEALTH ACTIVITY - TOOK MEDICATION"        format=f1.
      WB16C7B    LABEL="C7 HEALTH ACTIVITY - SAW PRO MED"            format=f1.
      WB16C7C    LABEL="C7 HEALTH ACTIVITY - NONE OF ABOVE"          format=f1.
      WB16C7ACC  LABEL="ACCURACY OF HEALTH ACTIVITY"                 format=f1.
      WB16C8A    LABEL="C8 CARE ACTIVITY - HELP FRIEND/RELATIVE"     format=f1.
      WB16C8B    LABEL="C8 CARE ACTIVITY - CHILD CARE"               format=f1.
      WB16C8C    LABEL="C8 CARE ACTIVITY - CARE FOR ADULT"           format=f1.
      WB16C8D    LABEL="C8 CARE ACTIVITY - PET CARE"                 format=f1.
      WB16C8E    LABEL="C8 CARE ACTIVITY - NONE OF ABOVE"            format=f1.
      WB16C8ACC  LABEL="ACCURACY OF CARE ACTIVITY"                   format=f1.
      WB16C9A    LABEL="C9 PHYSICAL ACTIVITY - WALKED"               format=f1.
      WB16C9B    LABEL="C9 PHYSICAL ACTIVITY - SPORTS/WORKED OUT"    format=f1.
      WB16C9C    LABEL="C9 PHYSICAL ACTIVITY - OUTDOOR REC"          format=f1.
      WB16C9D    LABEL="C9 PHYSICAL ACTIVITY - NONE OF ABOVE"        format=f1.
      WB16C9ACC  LABEL="ACCURACY OF PHYSICAL ACTIVITY"               format=f1.
      WB16C10A   LABEL="C10 SOCIAL ACTIVITY - SOCIAL IN PERSON"      format=f1.
      WB16C10B   LABEL="C10 SOCIAL ACTIVITY - TALK ON PHONE"         format=f1.
      WB16C10C   LABEL="C10 SOCIAL ACTIVITY - TEXT/EMAIL"            format=f1.
      WB16C10D   LABEL="C10 SOCIAL ACTIVITY - SOCIAL NETWORKING"     format=f1.
      WB16C10E   LABEL="C10 SOCIAL ACTIVITY - NONE OF ABOVE"         format=f1.
      WB16C10ACC LABEL="ACCURACY OF SOCIAL ACTIVITY"                 format=f1.
      WB16C11A   LABEL="C11 LEISURE ACTIVITY - WATCH TV/MOVIE"       format=f1.
      WB16C11B   LABEL="C11 LEISURE ACTIVITY - READ"                 format=f1.
      WB16C11C   LABEL="C11 LEISURE ACTIVITY - HOBBIES/GAMES"        format=f1.
      WB16C11D   LABEL="C11 LEISURE ACTIVITY - ATTEND EVENT"         format=f1.
      WB16C11E   LABEL="C11 LEISURE ACTIVITY - MEDITATE/PRAY"        format=f1.
      WB16C11F   LABEL="C11 LEISURE ACTIVITY - NONE OF ABOVE"        format=f1.
      WB16C11ACC LABEL="ACCURACY OF LEISURE ACTIVITY"                format=f1.
      WB16C12A   LABEL="C12 TRANSPORT ACTIVITY - DROVE WORK"         format=f1.
      WB16C12B   LABEL="C12 TRANSPORT ACTIVITY - DROVE OTHER"        format=f1.
      WB16C12C   LABEL="C12 TRANSPORT ACTIVITY - PUBLIC TRANSIT"     format=f1.
      WB16C12D   LABEL="C12 TRANSPORT ACTIVITY - STUCK TRAFFIC"      format=f1.
      WB16C12E   LABEL="C12 TRANSPORT ACTIVITY - NONE OF ABOVE"      format=f1.
      WB16C12ACC LABEL="ACCURACY OF TRANSPORT ACTIVITY"              format=f1.
      WB16C13A   LABEL="C13 SPENT TIME WITH SELF/ALONE"              format=f1.
      WB16C13B   LABEL="C13 SPENT TIME WITH SPOUSE/PARTNER"          format=f1.
      WB16C13C   LABEL="C13 SPENT TIME WITH CHILDREN"                format=f1.
      WB16C13D   LABEL="C13 SPENT TIME WITH PARENTS/STEP"            format=f1.
      WB16C13E   LABEL="C13 SPENT TIME WITH FRIENDS"                 format=f1.
      WB16C13F   LABEL="C13 SPENT TIME WITH CO-WORKER/CLIENT"        format=f1.
      WB16C13G   LABEL="C13 SPENT TIME WITH PET"                     format=f1.
      WB16C13H   LABEL="C13 SPENT TIME WITH SOMEONE ELSE"            format=f1.
      WB16C13ACC LABEL="ACCURACY OF TIME SPENT WITH OTHERS"          format=f1.
      WB16C14A   LABEL="C14A HOW MUCH OF DAY FEEL CALM"              format=f1.
      WB16C14B   LABEL="C14B HOW MUCH OF DAY FEEL HAPPY"             format=f1.
      WB16C14C   LABEL="C14C HOW MUCH OF DAY FEEL ENTHUSIASTIC"      format=f1.
      WB16C14D   LABEL="C14D HOW MUCH OF DAY FEEL CONTENT"           format=f1.
      WB16C14E   LABEL="C14E HOW MUCH OF DAY FEEL INTERESTED"        format=f1.
      WB16C15A   LABEL="C15A HOW MUCH OF DAY FEEL ANGRY"             format=f1.
      WB16C15B   LABEL="C15B HOW MUCH OF DAY FEEL FRUSTRATED"        format=f1.
      WB16C15C   LABEL="C15C HOW MUCH OF DAY FEEL SAD"               format=f1.
      WB16C15D   LABEL="C15D HOW MUCH OF DAY FEEL STRESSED"          format=f1.
      WB16C15E   LABEL="C15E HOW MUCH OF DAY FEEL LONELY"            format=f1.
      WB16C15F   LABEL="C15F HOW MUCH OF DAY FEEL WORRIED"           format=f1.
      WB16C15G   LABEL="C15G HOW MUCH OF DAY FEEL BORED"             format=f1.
      WB16C16A   LABEL="C16A HOW MUCH OF DAY FEEL TIRED"             format=f1.
      WB16C16B   LABEL="C16B HOW MUCH OF DAY FEEL PAIN"              format=f1.
      WB16C17A   LABEL="C17A FELT WELL RESTED WHEN WOKE UP"          format=f1.
      WB16C17B   LABEL="C17B FINISHED EVERYTHING SET OUT TO DO"      format=f1.
      WB16C17C   LABEL="C17C WAS RUNNING LATE"                       format=f1.
      WB16C17D   LABEL="C17D HAD FREE TIME ON MY HANDS"              format=f1.
      WB16C17E   LABEL="C17E HAD MORE TO DO COULD ACCOMPLISH"        format=f1.
      WB16C17F   LABEL="C17F FELT EXHAUSTED WHEN WENT TO BED"        format=f1.
      WB16C18A   LABEL="C18A FOLLOW SAME ROUTINE MOST WEEKDAYS"      format=f1.
      WB16C18B   LABEL="C18B FOLLOW SAME ROUTINE MOST WEEKENDS"      format=f1.
      WB16C18C   LABEL="C18C YESTERDAY WAS TYPICAL DAY"              format=f1.
      WB16D1A    LABEL="D1A THOROUGH JOB"                            format=f1.
      WB16D1B    LABEL="D1B TALKATIVE"                               format=f1.
      WB16D1C    LABEL="D1C RUDE TO OTHERS"                          format=f1.
      WB16D1D    LABEL="D1D NEW IDEAS"                               format=f1.
      WB16D1E    LABEL="D1E WORRISOME"                               format=f1.
      WB16D1F    LABEL="D1F FORGIVING NATURE"                        format=f1.
      WB16D1G    LABEL="D1G LAZINESS"                                format=f1.
      WB16D1H    LABEL="D1H SOCIABLE"                                format=f1.
      WB16D1I    LABEL="D1I VALUES ARTISTIC EXPERIENCES"             format=f1.
      WB16D1J    LABEL="D1J EASILY NERVOUS"                          format=f1.
      WB16D1K    LABEL="D1K EFFICIENT"                               format=f1.
      WB16D1L    LABEL="D1L RESERVED"                                format=f1.
      WB16D1M    LABEL="D1M CONSIDERATE AND KIND"                    format=f1.
      WB16D1N    LABEL="D1N ACTIVE IMAGINATION"                      format=f1.
      WB16D1O    LABEL="D1O HANDLES STRESS"                          format=f1.
      WB16E1     LABEL="E1 SURE LIFE WORK OUT"                       format=f1.
      WB16E2     LABEL="E2 PLAN OR DAY-DAY"                          format=f1.
      WB16E3     LABEL="E3 CARRY OUT PLANS OR"                       format=f1.
      WB16E4     LABEL="E4 FINISH THINGS OR NOT"                     format=f1.
      WB16E5     LABEL="E5 RATHER SPEND OR SAVE"                     format=f1.
      WB16E6     LABEL="E6 THINK ABOUT FUTURE"                       format=f1.
      WB16E7     LABEL="E7 GET ANGRY EASILY"                         format=f1.
      WB16F1     LABEL="F1 MATTER OTHERS THINK"                      format=f1.
      WB16F2     LABEL="F2 TRUST MOST OTHERS?"                       format=f1.
      WB16F3     LABEL="F3 AV MAN GETTING BETTER"                    format=f1.
      WB16F4     LABEL="F4 LOT GOOD DONT DESERVE"                    format=f1.
      WB16G1     LABEL="G1 WHY QUIT? DIFFICULT/CHALLENGING"          format=f1.
      WB16G2     LABEL="G2 CHILD POPULAR OR LEADER"                  format=f1.
      WB16G3     LABEL="G3 CHILD - DO WHAT EXPECT"                   format=f1.
      WB16G4     LABEL="G4 MORE FRIENDS OR BETTER"                   format=f1.
      WB16G5     LABEL="G5 MORE ATTENTION OR BETTER"                 format=f1.
      WB16G6     LABEL="G6 JOB - THINK OR PEOPLE"                    format=f1.
      WB16G7     LABEL="G7 JOB - THINK FOR SELF"                     format=f1.
      WB16G8     LABEL="G8 OPINION IMPORTANT OR LIKE"                format=f1.
      WB16G9     LABEL="G9 LIKE OR DO ANYTHING"                      format=f1.
      WB16G10    LABEL="G10 FUN OR ADVICE"                           format=f1.
      WB16H1     LABEL="H1 AN APPLE A DAY (SCORE)"                   format=f1.
      WB16H2     LABEL="H2 MAKE GOOD DAMAGES (SCORE)"                format=f1.
      WB16H3     LABEL="H3 FALSE FACTS (SCORE)"                      format=f1.
      WB16H4     LABEL="H4 WINDS AND WAVES (SCORE)"                  format=f1.
      WB16H5     LABEL="H5 THINK LONG (SCORE)"                       format=f1.
      WB16H6     LABEL="H6 COWARD THREATENS (SCORE)"                 format=f1.
      WB16I1     LABEL="I1 CONFIDENT FILLING OUT MED FORMS"          format=f1.
      WB16I2A    LABEL="I2A TAKE NEXT PILL - HOUR"                   format=f2.
      WB16I2B    LABEL="I2B TAKE NEXT PILL - MINUTE"                 format=f2.
      WB16I2C    LABEL="I2C TAKE NEXT PILL - AM/PM"                  format=f1.
      WB16I2SCR  LABEL="I2 TAKE NEXT PILL (SCORE)"                   format=f1.
      WB16I2ACC  LABEL="ACCURACY OF TIME TO TAKE NEXT PILL"          format=f1.
      WB16I3     LABEL="I3 NORMAL BLOOD SUGAR RESULT (SCORE)"        format=f1.
      WB16I4A    LABEL="I4A MEDS AFTER MEAL - HOUR"                  format=f2.
      WB16I4B    LABEL="I4B MEDS AFTER MEAL - MINUTE"                format=f2.
      WB16I4C    LABEL="I4C MEDS AFTER MEAL - AM/PM"                 format=f1.
      WB16I4SCR  LABEL="I4 MEDS AFTER MEAL (SCORE)"                  format=f1.
      WB16I4ACC  LABEL="ACCURACY OF TAKING PILL BEFORE MEAL"         format=f1.
      WB16J11    LABEL="J11 BLOCK 1 #1 (SCORE)"                      format=f1.
      WB16J12    LABEL="J12 BLOCK 1 #2 (SCORE)"                      format=f1.
      WB16J13    LABEL="J13 BLOCK 1 #3 (SCORE)"                      format=f1.
      WB16FUB    LABEL="FOLLOWUP BLOCK (SCORE)"                      format=f1.
      WB16J21    LABEL="J21 WEB BLOCK 2 #4 (SCORE)"                  format=f1.
      WB16J22    LABEL="J22 WEB BLOCK 2 #5 (SCORE)"                  format=f1.
      WB16J23    LABEL="J23 WEB BLOCK 2 #6 (SCORE)"                  format=f1.
      WB16J31    LABEL="J31 WEB BLOCK 3 #4 (SCORE)"                  format=f1.
      WB16J32    LABEL="J32 WEB BLOCK 3 #5 (SCORE)"                  format=f1.
      WB16J33    LABEL="J33 WEB BLOCK 3 #6 (SCORE)"                  format=f1.
      WB16J41    LABEL="J41 WEB BLOCK 4 #4 (SCORE)"                  format=f1.
      WB16J42    LABEL="J42 WEB BLOCK 4 #5 (SCORE)"                  format=f1.
      WB16J43    LABEL="J43 WEB BLOCK 4 #6 (SCORE)"                  format=f1.
      WB16J51    LABEL="J51 WEB BLOCK 5 #4 (SCORE)"                  format=f1.
      WB16J52    LABEL="J52 WEB BLOCK 5 #5 (SCORE)"                  format=f1.
      WB16J53    LABEL="J53 WEB BLOCK 5 #6 (SCORE)"                  format=f1.
      WB16J61    LABEL="J61 PAPI/PHONE BLOCK 2 #5 (SCORE)"           format=f1.
      WB16J62    LABEL="J62 PAPI/PHONE BLOCK 3 #5 (SCORE)"           format=f1.
      WB16J63    LABEL="J63 PAPI/PHONE BLOCK 4 #5 (SCORE)"           format=f1.
      WB16J64    LABEL="J64 PAPI/PHONE BLOCK 5 #5 (SCORE)"           format=f1.
      WB16TMJ11  LABEL="TIME (IN SECONDS) SPENT ITEM J11"            format=f4.
      WB16TMJ12  LABEL="TIME (IN SECONDS) SPENT ITEM J12"            format=f4.
      WB16TMJ13  LABEL="TIME (IN SECONDS) SPENT ITEM J13"            format=f4.
      WB16TMJ21  LABEL="TIME (IN SECONDS) SPENT ITEM J21"            format=f4.
      WB16TMJ22  LABEL="TIME (IN SECONDS) SPENT ITEM J22"            format=f4.
      WB16TMJ23  LABEL="TIME (IN SECONDS) SPENT ITEM J23"            format=f4.
      WB16TMJ31  LABEL="TIME (IN SECONDS) SPENT ITEM J31"            format=f4.
      WB16TMJ32  LABEL="TIME (IN SECONDS) SPENT ITEM J32"            format=f4.
      WB16TMJ33  LABEL="TIME (IN SECONDS) SPENT ITEM J33"            format=f4.
      WB16TMJ41  LABEL="TIME (IN SECONDS) SPENT ITEM J41"            format=f4.
      WB16TMJ42  LABEL="TIME (IN SECONDS) SPENT ITEM J42"            format=f4.
      WB16TMJ43  LABEL="TIME (IN SECONDS) SPENT ITEM J43"            format=f4.
      WB16TMJ51  LABEL="TIME (IN SECONDS) SPENT ITEM J51"            format=f4.
      WB16TMJ52  LABEL="TIME (IN SECONDS) SPENT ITEM J52"            format=f4.
      WB16TMJ53  LABEL="TIME (IN SECONDS) SPENT ITEM J53"            format=f4.
      WB16TOJ11  LABEL="WTR TIMED OUT ITEM J11"                      format=f1.
      WB16TOJ12  LABEL="WTR TIMED OUT ITEM J12"                      format=f1.
      WB16TOJ13  LABEL="WTR TIMED OUT ITEM J13"                      format=f1.
      WB16TOJ21  LABEL="WTR TIMED OUT ITEM J21"                      format=f1.
      WB16TOJ22  LABEL="WTR TIMED OUT ITEM J22"                      format=f1.
      WB16TOJ23  LABEL="WTR TIMED OUT ITEM J23"                      format=f1.
      WB16TOJ31  LABEL="WTR TIMED OUT ITEM J31"                      format=f1.
      WB16TOJ32  LABEL="WTR TIMED OUT ITEM J32"                      format=f1.
      WB16TOJ33  LABEL="WTR TIMED OUT ITEM J33"                      format=f1.
      WB16TOJ41  LABEL="WTR TIMED OUT ITEM J41"                      format=f1.
      WB16TOJ42  LABEL="WTR TIMED OUT ITEM J42"                      format=f1.
      WB16TOJ43  LABEL="WTR TIMED OUT ITEM J43"                      format=f1.
      WB16TOJ51  LABEL="WTR TIMED OUT ITEM J51"                      format=f1.
      WB16TOJ52  LABEL="WTR TIMED OUT ITEM J52"                      format=f1.
      WB16TOJ53  LABEL="WTR TIMED OUT ITEM J53"                      format=f1.
      WB16BKJ11  LABEL="WTR BACKED UP ITEM J11"                      format=f1.
      WB16BKJ12  LABEL="WTR BACKED UP ITEM J12"                      format=f1.
      WB16BKJ13  LABEL="WTR BACKED UP ITEM J13"                      format=f1.
      WB16BKJ21  LABEL="WTR BACKED UP ITEM J21"                      format=f1.
      WB16BKJ22  LABEL="WTR BACKED UP ITEM J22"                      format=f1.
      WB16BKJ23  LABEL="WTR BACKED UP ITEM J23"                      format=f1.
      WB16BKJ31  LABEL="WTR BACKED UP ITEM J31"                      format=f1.
      WB16BKJ32  LABEL="WTR BACKED UP ITEM J32"                      format=f1.
      WB16BKJ33  LABEL="WTR BACKED UP ITEM J33"                      format=f1.
      WB16BKJ41  LABEL="WTR BACKED UP ITEM J41"                      format=f1.
      WB16BKJ42  LABEL="WTR BACKED UP ITEM J42"                      format=f1.
      WB16BKJ43  LABEL="WTR BACKED UP ITEM J43"                      format=f1.
      WB16BKJ51  LABEL="WTR BACKED UP ITEM J51"                      format=f1.
      WB16BKJ52  LABEL="WTR BACKED UP ITEM J52"                      format=f1.
      WB16BKJ53  LABEL="WTR BACKED UP ITEM J53"                      format=f1.
      WB16K1     LABEL="K1 HOW MUCH CHANGE BACK (SCORE)"             format=f1.
      WB16K2     LABEL="K2 HOW MUCH SOFA COST ON SALE (SCORE)"       format=f1.
      WB16K3     LABEL="K3 EXPECTED NUM TO GET DISEASE (SCORE)"      format=f1.
      WB16K4     LABEL="K4 HOW MUCH CAR COST NEW (SCORE)"            format=f1.
      WB16K5     LABEL="K5 HOW MUCH LOTTERY WINNINGS (SCORE)"        format=f1.
      WB16K6     LABEL="K6 MONEY IN ACCOUNT AFTER 2 YRS (SCORE)"     format=f1.
      WB16TMSECA LABEL="TIME (IN SECONDS) SPENT SECTION A"           format=f4.
      WB16TMSECB LABEL="TIME (IN SECONDS) SPENT SECTION B"           format=f4.
      WB16TMSECC LABEL="TIME (IN SECONDS) SPENT SECTION C"           format=f4.
      WB16TMSECD LABEL="TIME (IN SECONDS) SPENT SECTION D"           format=f4.
      WB16TMSECE LABEL="TIME (IN SECONDS) SPENT SECTION E"           format=f4.
      WB16TMSECF LABEL="TIME (IN SECONDS) SPENT SECTION F"           format=f4.
      WB16TMSECG LABEL="TIME (IN SECONDS) SPENT SECTION G"           format=f4.
      WB16TMSECH LABEL="TIME (IN SECONDS) SPENT SECTION H"           format=f4.
      WB16TMSECI LABEL="TIME (IN SECONDS) SPENT SECTION I"           format=f4.
      WB16TMSECJ LABEL="TIME (IN SECONDS) SPENT SECTION J"           format=f4.
      WB16TMSECK LABEL="TIME (IN SECONDS) SPENT SECTION K"           format=f4.
      WB16TOSECA LABEL="WTR TIMED OUT SECTION A"                     format=f1.
      WB16TOSECB LABEL="WTR TIMED OUT SECTION B"                     format=f1.
      WB16TOSECC LABEL="WTR TIMED OUT SECTION C"                     format=f1.
      WB16TOSECD LABEL="WTR TIMED OUT SECTION D"                     format=f1.
      WB16TOSECE LABEL="WTR TIMED OUT SECTION E"                     format=f1.
      WB16TOSECF LABEL="WTR TIMED OUT SECTION F"                     format=f1.
      WB16TOSECG LABEL="WTR TIMED OUT SECTION G"                     format=f1.
      WB16TOSECH LABEL="WTR TIMED OUT SECTION H"                     format=f1.
      WB16TOSECI LABEL="WTR TIMED OUT SECTION I"                     format=f1.
      WB16TOSECJ LABEL="WTR TIMED OUT SECTION J"                     format=f1.
      WB16TOSECK LABEL="WTR TIMED OUT SECTION K"                     format=f1.
      WB16BKSECA LABEL="WTR BACKED UP SECTION A"                     format=f1.
      WB16BKSECB LABEL="WTR BACKED UP SECTION B"                     format=f1.
      WB16BKSECC LABEL="WTR BACKED UP SECTION C"                     format=f1.
      WB16BKSECD LABEL="WTR BACKED UP SECTION D"                     format=f1.
      WB16BKSECE LABEL="WTR BACKED UP SECTION E"                     format=f1.
      WB16BKSECF LABEL="WTR BACKED UP SECTION F"                     format=f1.
      WB16BKSECG LABEL="WTR BACKED UP SECTION G"                     format=f1.
      WB16BKSECH LABEL="WTR BACKED UP SECTION H"                     format=f1.
      WB16BKSECI LABEL="WTR BACKED UP SECTION I"                     format=f1.
      WB16BKSECJ LABEL="WTR BACKED UP SECTION J"                     format=f1.
      WB16BKSECK LABEL="WTR BACKED UP SECTION K"                     format=f1.
      WB16WT     LABEL="WELLBEING CROSS-SECTIONAL WEIGHT"            format=f9.3
      WB16DEV    LABEL="DEVICE TYPE FOR WEB LOGIN"                   format=f2.
   ;
   INFILE '[PATH]\WB2016.txt' LRECL = 419 ; 
   INPUT 
      WB16REL         1 - 1         WB16YRID        2 - 6         WB16SN          7 - 8    
      WB16SEX         9 - 9         WB16AGE        10 - 12        WB16IWMODE     13 - 13   
      WB16IWMO       14 - 15        WB16IWYR       16 - 19        WB16A1         20 - 20   
      WB16A2         21 - 22        WB16A3A        23 - 23        WB16A3B        24 - 24   
      WB16A3C        25 - 25        WB16A3D        26 - 26        WB16A3E        27 - 27   
      WB16A4A        28 - 28        WB16A4B        29 - 29        WB16A4C        30 - 30   
      WB16A4D        31 - 31        WB16A4E        32 - 32        WB16A4F        33 - 33   
      WB16A4G        34 - 34        WB16A4H        35 - 35        WB16A4I        36 - 36   
      WB16A4J        37 - 37        WB16A5A        38 - 38        WB16A5B        39 - 39   
      WB16A5C        40 - 40        WB16A5D        41 - 41        WB16A5E        42 - 42   
      WB16A5F        43 - 43        WB16A5G        44 - 44        WB16A5H        45 - 45   
      WB16A5I        46 - 46        WB16A5J        47 - 47        WB16A6A        48 - 48   
      WB16A6B        49 - 49        WB16A6C        50 - 50        WB16A6D        51 - 51   
      WB16A6E        52 - 52        WB16A6F        53 - 53        WB16A6G        54 - 54   
      WB16A6H        55 - 55        WB16B1A        56 - 56        WB16B1B        57 - 57   
      WB16B1C        58 - 58        WB16B1D        59 - 59        WB16B1E        60 - 60   
      WB16B1F        61 - 61        WB16B2A        62 - 62        WB16B2B        63 - 63   
      WB16B2C        64 - 64        WB16B2D        65 - 65        WB16B2E        66 - 66   
      WB16B2F        67 - 67        WB16C1         68 - 68        WB16C2A        69 - 70   
      WB16C2B        71 - 72        WB16C2C        73 - 73        WB16C2ACC      74 - 74   
      WB16C3A        75 - 76        WB16C3B        77 - 78        WB16C3C        79 - 79   
      WB16C3ACC      80 - 80        WB16C4A        81 - 81        WB16C4B        82 - 82   
      WB16C4C        83 - 83        WB16C4D        84 - 84        WB16C4E        85 - 85   
      WB16C4ACC      86 - 86        WB16C5A        87 - 87        WB16C5B        88 - 88   
      WB16C5C        89 - 89        WB16C5D        90 - 90        WB16C5E        91 - 91   
      WB16C5ACC      92 - 92        WB16C6A        93 - 93        WB16C6B        94 - 94   
      WB16C6C        95 - 95        WB16C6D        96 - 96        WB16C6E        97 - 97   
      WB16C6F        98 - 98        WB16C6G        99 - 99        WB16C6H       100 - 100  
      WB16C6I       101 - 101       WB16C6ACC     102 - 102       WB16C7A       103 - 103  
      WB16C7B       104 - 104       WB16C7C       105 - 105       WB16C7ACC     106 - 106  
      WB16C8A       107 - 107       WB16C8B       108 - 108       WB16C8C       109 - 109  
      WB16C8D       110 - 110       WB16C8E       111 - 111       WB16C8ACC     112 - 112  
      WB16C9A       113 - 113       WB16C9B       114 - 114       WB16C9C       115 - 115  
      WB16C9D       116 - 116       WB16C9ACC     117 - 117       WB16C10A      118 - 118  
      WB16C10B      119 - 119       WB16C10C      120 - 120       WB16C10D      121 - 121  
      WB16C10E      122 - 122       WB16C10ACC    123 - 123       WB16C11A      124 - 124  
      WB16C11B      125 - 125       WB16C11C      126 - 126       WB16C11D      127 - 127  
      WB16C11E      128 - 128       WB16C11F      129 - 129       WB16C11ACC    130 - 130  
      WB16C12A      131 - 131       WB16C12B      132 - 132       WB16C12C      133 - 133  
      WB16C12D      134 - 134       WB16C12E      135 - 135       WB16C12ACC    136 - 136  
      WB16C13A      137 - 137       WB16C13B      138 - 138       WB16C13C      139 - 139  
      WB16C13D      140 - 140       WB16C13E      141 - 141       WB16C13F      142 - 142  
      WB16C13G      143 - 143       WB16C13H      144 - 144       WB16C13ACC    145 - 145  
      WB16C14A      146 - 146       WB16C14B      147 - 147       WB16C14C      148 - 148  
      WB16C14D      149 - 149       WB16C14E      150 - 150       WB16C15A      151 - 151  
      WB16C15B      152 - 152       WB16C15C      153 - 153       WB16C15D      154 - 154  
      WB16C15E      155 - 155       WB16C15F      156 - 156       WB16C15G      157 - 157  
      WB16C16A      158 - 158       WB16C16B      159 - 159       WB16C17A      160 - 160  
      WB16C17B      161 - 161       WB16C17C      162 - 162       WB16C17D      163 - 163  
      WB16C17E      164 - 164       WB16C17F      165 - 165       WB16C18A      166 - 166  
      WB16C18B      167 - 167       WB16C18C      168 - 168       WB16D1A       169 - 169  
      WB16D1B       170 - 170       WB16D1C       171 - 171       WB16D1D       172 - 172  
      WB16D1E       173 - 173       WB16D1F       174 - 174       WB16D1G       175 - 175  
      WB16D1H       176 - 176       WB16D1I       177 - 177       WB16D1J       178 - 178  
      WB16D1K       179 - 179       WB16D1L       180 - 180       WB16D1M       181 - 181  
      WB16D1N       182 - 182       WB16D1O       183 - 183       WB16E1        184 - 184  
      WB16E2        185 - 185       WB16E3        186 - 186       WB16E4        187 - 187  
      WB16E5        188 - 188       WB16E6        189 - 189       WB16E7        190 - 190  
      WB16F1        191 - 191       WB16F2        192 - 192       WB16F3        193 - 193  
      WB16F4        194 - 194       WB16G1        195 - 195       WB16G2        196 - 196  
      WB16G3        197 - 197       WB16G4        198 - 198       WB16G5        199 - 199  
      WB16G6        200 - 200       WB16G7        201 - 201       WB16G8        202 - 202  
      WB16G9        203 - 203       WB16G10       204 - 204       WB16H1        205 - 205  
      WB16H2        206 - 206       WB16H3        207 - 207       WB16H4        208 - 208  
      WB16H5        209 - 209       WB16H6        210 - 210       WB16I1        211 - 211  
      WB16I2A       212 - 213       WB16I2B       214 - 215       WB16I2C       216 - 216  
      WB16I2SCR     217 - 217       WB16I2ACC     218 - 218       WB16I3        219 - 219  
      WB16I4A       220 - 221       WB16I4B       222 - 223       WB16I4C       224 - 224  
      WB16I4SCR     225 - 225       WB16I4ACC     226 - 226       WB16J11       227 - 227  
      WB16J12       228 - 228       WB16J13       229 - 229       WB16FUB       230 - 230  
      WB16J21       231 - 231       WB16J22       232 - 232       WB16J23       233 - 233  
      WB16J31       234 - 234       WB16J32       235 - 235       WB16J33       236 - 236  
      WB16J41       237 - 237       WB16J42       238 - 238       WB16J43       239 - 239  
      WB16J51       240 - 240       WB16J52       241 - 241       WB16J53       242 - 242  
      WB16J61       243 - 243       WB16J62       244 - 244       WB16J63       245 - 245  
      WB16J64       246 - 246       WB16TMJ11     247 - 250       WB16TMJ12     251 - 254  
      WB16TMJ13     255 - 258       WB16TMJ21     259 - 262       WB16TMJ22     263 - 266  
      WB16TMJ23     267 - 270       WB16TMJ31     271 - 274       WB16TMJ32     275 - 278  
      WB16TMJ33     279 - 282       WB16TMJ41     283 - 286       WB16TMJ42     287 - 290  
      WB16TMJ43     291 - 294       WB16TMJ51     295 - 298       WB16TMJ52     299 - 302  
      WB16TMJ53     303 - 306       WB16TOJ11     307 - 307       WB16TOJ12     308 - 308  
      WB16TOJ13     309 - 309       WB16TOJ21     310 - 310       WB16TOJ22     311 - 311  
      WB16TOJ23     312 - 312       WB16TOJ31     313 - 313       WB16TOJ32     314 - 314  
      WB16TOJ33     315 - 315       WB16TOJ41     316 - 316       WB16TOJ42     317 - 317  
      WB16TOJ43     318 - 318       WB16TOJ51     319 - 319       WB16TOJ52     320 - 320  
      WB16TOJ53     321 - 321       WB16BKJ11     322 - 322       WB16BKJ12     323 - 323  
      WB16BKJ13     324 - 324       WB16BKJ21     325 - 325       WB16BKJ22     326 - 326  
      WB16BKJ23     327 - 327       WB16BKJ31     328 - 328       WB16BKJ32     329 - 329  
      WB16BKJ33     330 - 330       WB16BKJ41     331 - 331       WB16BKJ42     332 - 332  
      WB16BKJ43     333 - 333       WB16BKJ51     334 - 334       WB16BKJ52     335 - 335  
      WB16BKJ53     336 - 336       WB16K1        337 - 337       WB16K2        338 - 338  
      WB16K3        339 - 339       WB16K4        340 - 340       WB16K5        341 - 341  
      WB16K6        342 - 342       WB16TMSECA    343 - 346       WB16TMSECB    347 - 350  
      WB16TMSECC    351 - 354       WB16TMSECD    355 - 358       WB16TMSECE    359 - 362  
      WB16TMSECF    363 - 366       WB16TMSECG    367 - 370       WB16TMSECH    371 - 374  
      WB16TMSECI    375 - 378       WB16TMSECJ    379 - 382       WB16TMSECK    383 - 386  
      WB16TOSECA    387 - 387       WB16TOSECB    388 - 388       WB16TOSECC    389 - 389  
      WB16TOSECD    390 - 390       WB16TOSECE    391 - 391       WB16TOSECF    392 - 392  
      WB16TOSECG    393 - 393       WB16TOSECH    394 - 394       WB16TOSECI    395 - 395  
      WB16TOSECJ    396 - 396       WB16TOSECK    397 - 397       WB16BKSECA    398 - 398  
      WB16BKSECB    399 - 399       WB16BKSECC    400 - 400       WB16BKSECD    401 - 401  
      WB16BKSECE    402 - 402       WB16BKSECF    403 - 403       WB16BKSECG    404 - 404  
      WB16BKSECH    405 - 405       WB16BKSECI    406 - 406       WB16BKSECJ    407 - 407  
      WB16BKSECK    408 - 408       WB16WT        409 - 417       WB16DEV       418 - 419  
   ;
RUN ;
