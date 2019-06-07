*-------------------------------------------------------------------------*
*                                                                          
*                     SPSS SETUP FILE FOR ICPSR 34988
*             CRIMINAL JUSTICE DRUG ABUSE TREATMENT STUDIES 2:
*          MEDICATION-ASSISTED THERAPY, 2010-2013 [UNITED STATES]
*             (DATASET 0001: BASELINE SURVEY OF ORGANIZATIONAL
*                 CHARACTERISTICS - MERGED TS, TD, CS, CD)
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
*  data file is physically located (e.g., "c:\temp\34988-0001-data.txt").
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
*  VARIABLE LEVEL: assigns measurement level to each variable (scale,
*  nominal, or ordinal).
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
*  will be saved (e.g., SAVE OUTFILE="c:\spsswin\data\da34988-0001.sav").
*
*-------------------------------------------------------------------------.

* SPSS FILE HANDLE AND DATA LIST COMMANDS.

FILE HANDLE DATA / NAME="data-filename" LRECL=1215.
DATA LIST FILE=DATA /
          CASEID 183-185 DEGREE_SPECIFY_OTHER 1-26 (A)    DISCIPLINE 27-52 (A)
 DISCIPLINE_OTHER 53-78 (A) STATE_CREDENTIALS_SPECIFY 79-104 (A) NATIONAL_CERTIFICATION_OT 105-130 (A)
 LICENSURE_SPECIFY 131-156 (A) CURRENT_WORK_SETTING_SPEC 157-182 (A)              ID 186-193
        RESPCODE 194-197          SITEID 198-202          CENTER 203-204
           STUDYCOND 205           STUDYCODE 206            DATE 207-208
            RESPTYPE 209          DEGREE 210-211        YEAR_DEG 212-213
 ADDICTIONS_COUNSELING 214-215 CRIMINAL_JUSTICE 216-217        MILITARY 218-219
 OTHER_COUNSELING 220-221      PSYCHOLOGY 222-223 LAW_ENFORCEMENT 224-225
       EDUCATION 226-227 SOCIAL_WORK_HUMAN_SERVICE 228-229        MEDICINE 230-231
 VOCATIONAL_REHABILITATION 232-233  ADMINISTRATION 234-235   OTHER_SPECIFY 236-237
 COUNSELING_CREDENTIALS 238-239 COUNSELING_CREDENTIALS_AL 240-241 COUNSELING_CREDENTIALS_DR 242-243
 COUNSELING_CREDENTIALS_CO 244-245 NATIONAL_CERTIFICATION 246-247 NATIONAL_CERTIFICATION_NA 248-249
 NATIONAL_CERTIFICATION_IC 250-251       LICENSURE 252-253       JOB_LEVEL 254-255
     SUBSTANCE_ABUSE 256      PROGRAM_LENGTH 257    CURRENT_EMPLOYER 258
    CURRENT_POSITION 259 REGULAR_WORK_HOURS 260-261 CLIENT_COUNSELING 262-263
 DIRECT_CONTACT_CLIENT 264-266 NUMBER_OF_CLIENTS_COUNSEL 267-269 ACTIVE_CASELOAD 270-272
 NUMBER_OF_STAFF_SUPERVISE 273-274 CURRENT_WORK_SETTING 275-276          BSOCA1 277-278
          BSOCA2 279-280          BSOCA3 281-282          BSOCA4 283-284
          BSOCA5 285-286          BSOCA6 287-288          BSOCA7 289-290
          BSOCA8 291-292          BSOCA9 293-294         BSOCA10 295-296
         BSOCA11 297-298         BSOCA12 299-300         BSOCA13 301-302
         BSOCA14 303-304         BSOCA15 305-306         BSOCA16 307-308
         BSOCA17 309-310         BSOCA18 311-312         BSOCA19 313-314
         BSOCA20 315-316         BSOCA21 317-318         BSOCA22 319-320
         BSOCA23 321-322         BSOCA24 323-324         BSOCA25 325-326
         BSOCA26 327-328         BSOCA27 329-330         BSOCA28 331-332
         BSOCA29 333-334         BSOCA30 335-336         BSOCA31 337-338
         BSOCA32 339-340         BSOCA33 341-342          BSOCB1 343-344
          BSOCB2 345-346          BSOCB3 347-348          BSOCB4 349-350
          BSOCB5 351-352          BSOCB6 353-354          BSOCB7 355-356
          BSOCB8 357-358          BSOCB9 359-360         BSOCB10 361-362
         BSOCB11 363-364         BSOCB12 365-366         BSOCB13 367-368
         BSOCB14 369-370         BSOCB15 371-372         BSOCB16 373-374
         BSOCB17 375-376         BSOCB18 377-378         BSOCB19 379-380
         BSOCB20 381-382         BSOCB21 383-384         BSOCB22 385-386
         BSOCB23 387-388         BSOCB24 389-390         BSOCB25 391-392
         BSOCB26 393-394         BSOCB27 395-396          BSOCC1 397-398
          BSOCC2 399-400          BSOCC3 401-402          BSOCC4 403-404
          BSOCC5 405-406          BSOCC6 407-408          BSOCC7 409-410
          BSOCC8 411-412          BSOCC9 413-414         BSOCC10 415-416
         BSOCC11 417-418         BSOCC12 419-420         BSOCC13 421-422
         BSOCC14 423-424         BSOCC15 425-426         BSOCC16 427-428
         BSOCC17 429-430         BSOCC18 431-432         BSOCC19 433-434
         BSOCC20 435-436         BSOCC21 437-438         BSOCC22 439-440
         BSOCC23 441-442         BSOCC24 443-444         BSOCC25 445-446
         BSOCC26 447-448         BSOCC27 449-450         BSOCC28 451-452
         BSOCC29 453-454         BSOCC30 455-456        BSOCC31A 457-458
        BSOCC31B 459-460        BSOCC31C 461-462        BSOCC31D 463-464
        BSOCC31E 465-466        BSOCC31F 467-468        BSOCC31G 469-470
        BSOCC31H 471-472        BSOCC31I 473-474        BSOCC31J 475-476
        BSOCC31K 477-478        BSOCC31L 479-480          BSOCD1 481-482
          BSOCD2 483-484          BSOCD3 485-486          BSOCD4 487-488
          BSOCD5 489-490          BSOCD6 491-492          BSOCD7 493-494
          BSOCD8 495-496          BSOCD9 497-498         BSOCD10 499-500
         BSOCD11 501-502         BSOCD12 503-504         BSOCD13 505-506
         BSOCD14 507-508         BSOCD15 509-510         BSOCD16 511-512
         BSOCD17 513-514         BSOCD18 515-516         BSOCD19 517-518
         BSOCD20 519-520         BSOCD21 521-522         BSOCD22 523-524
         BSOCD23 525-526         BSOCD24 527-528         BSOCD25 529-530
         BSOCD26 531-532         BSOCD27 533-534         BSOCD28 535-536
         BSOCD29 537-538         BSOCD30 539-540         BSOCD31 541-542
         BSOCD32 543-544         BSOCD33 545-546         BSOCD34 547-548
         BSOCD35 549-550         BSOCD36 551-552         BSOCD37 553-554
         BSOCD38 555-556         BSOCD39 557-558         BSOCD40 559-560
         BSOCD41 561-562         BSOCD42 563-564         BSOCD43 565-566
         BSOCD44 567-568         BSOCD45 569-570         BSOCD46 571-572
         BSOCD47 573-574         BSOCD48 575-576         BSOCD49 577-578
         BSOCD50 579-580         BSOCD51 581-582         BSOCD52 583-584
         BSOCD53 585-586         BSOCD54 587-588         BSOCD55 589-590
         BSOCD56 591-592         BSOCD57 593-594         BSOCD58 595-596
         BSOCD59 597-598         BSOCD60 599-600         BSOCD61 601-602
         BSOCD62 603-604         BSOCD63 605-606          BSOCE1 607-608
          BSOCE2 609-610          BSOCE3 611-612          BSOCE4 613-614
          BSOCE5 615-616          BSOCE6 617-618          BSOCE7 619-620
          BSOCE8 621-622          BSOCE9 623-624         BSOCE10 625-626
         BSOCE11 627-628         BSOCE12 629-630         BSOCE13 631-632
         BSOCE14 633-634         BSOCE15 635-636         BSOCE16 637-638
         BSOCE17 639-640         BSOCE18 641-642         BSOCE19 643-644
         BSOCE20 645-646         BSOCE21 647-648         BSOCE22 649-650
         BSOCE23 651-652         BSOCE24 653-654         BSOCE25 655-656
         BSOCE26 657-658         BSOCE27 659-660         BSOCE28 661-662
         BSOCE29 663-664         BSOCE30 665-666      BSOCE19_DC 667-668
     BSOCE19_PRO 669-670      BSOCE19_PA 671-672       BSOCE19_J 673-674
      BSOCE19_SP 675-676      BSOCE20_DC 677-678     BSOCE20_PRO 679-680
      BSOCE20_PA 681-682       BSOCE20_J 683-684      BSOCE20_SP 685-686
      BSOCE21_DC 687-688     BSOCE21_PRO 689-690      BSOCE21_PA 691-692
       BSOCE21_J 693-694      BSOCE21_SP 695-696      BSOCE22_DC 697-698
     BSOCE22_PRO 699-700      BSOCE22_PA 701-702       BSOCE22_J 703-704
      BSOCE22_SP 705-706      BSOCE23_DC 707-708     BSOCE23_PRO 709-710
      BSOCE23_PA 711-712       BSOCE23_J 713-714      BSOCE23_SP 715-716
      BSOCE24_DC 717-718     BSOCE24_PRO 719-720      BSOCE24_PA 721-722
       BSOCE24_J 723-724      BSOCE24_SP 725-726      BSOCE25_DC 727-728
     BSOCE25_PRO 729-730      BSOCE25_PA 731-732       BSOCE25_J 733-734
      BSOCE25_SP 735-736      BSOCE26_DC 737-738     BSOCE26_PRO 739-740
      BSOCE26_PA 741-742       BSOCE26_J 743-744      BSOCE26_SP 745-746
      BSOCE27_DC 747-748     BSOCE27_PRO 749-750      BSOCE27_PA 751-752
       BSOCE27_J 753-754      BSOCE27_SP 755-756      BSOCE28_DC 757-758
     BSOCE28_PRO 759-760      BSOCE28_PA 761-762       BSOCE28_J 763-764
      BSOCE28_SP 765-766      BSOCE29_DC 767-768     BSOCE29_PRO 769-770
      BSOCE29_PA 771-772       BSOCE29_J 773-774      BSOCE29_SP 775-776
      BSOCE30_DC 777-778     BSOCE30_PRO 779-780      BSOCE30_PA 781-782
       BSOCE30_J 783-784      BSOCE30_SP 785-786   ANPSTAFF 787-801 (12)
      ANPPN 802-816 (12)   ANPTRAIN 817-831 (12)     ANPPFC 832-846 (12)
   BRESTAFF 847-861 (12)   BRETRAIN 862-876 (12)     BREEQU 877-891 (12)
     BREINT 892-906 (12)     BRESUP 907-921 (12)     CSAGRO 922-936 (12)
     CSAEFF 937-951 (12)     CSAINF 952-966 (12)    CSAADPT 967-981 (12)
     CSASAT 982-996 (12)    CSABEL 997-1011 (12)        CSACOM 1012-1013
  CSABEL2 1014-1028 (12)    DOCMIS 1029-1040 (9)   DOCCOH 1041-1055 (12)
   DOCAUT 1056-1070 (12)   DOCCOM 1071-1085 (12)  DOCCOM1 1086-1100 (12)
  DOCCOM2 1101-1115 (12)  DOCSTRS 1116-1130 (12)  DOCCHNG 1131-1145 (12)
  DOCBRNT 1146-1160 (12)    DOCSUP 1161-1164 (1)  DOCLEAD 1165-1179 (12)
   EOTDIV 1180-1194 (12)   EOTTOL 1195-1209 (12)        EOTSCO 1210-1211
    EOTOPN 1212-1215 (1)
   .

* SPSS VARIABLE LABELS COMMAND

VARIABLE LABELS
   CASEID    'Case identification number' /
   DEGREE_SPECIFY_OTHER 'Degree other' /
   DISCIPLINE 'Discipline' /
   DISCIPLINE_OTHER 'Discipline: Other' /
   STATE_CREDENTIALS_SPECIFY 'State substance abuse counseling credentials (Not in CD)' /
   NATIONAL_CERTIFICATION_OT 'National certification Other (Not in CD)' /
   LICENSURE_SPECIFY 'Licensure: Specify (Not in CD)' /
   CURRENT_WORK_SETTING_SPEC 'Current work setting specify' /
   ID        'Subject Identifier' /
   RESPCODE  'Respondent Code' /
   SITEID    'Site ID' /
   CENTER    'Research Center' /
   STUDYCOND 'Study Condition' /
   STUDYCODE 'Study Code' /
   DATE      'Survey date' /
   RESPTYPE  'Respondent role' /
   DEGREE    'Degree' /
   YEAR_DEG  'Degree year' /
   ADDICTIONS_COUNSELING 'Discipline: Addictions Counseling' /
   CRIMINAL_JUSTICE 'Discipline: Criminal Justice' /
   MILITARY  'Discipline: Military' /
   OTHER_COUNSELING 'Discipline: Other Counseling' /
   PSYCHOLOGY 'Discipline: Psychology' /
   LAW_ENFORCEMENT 'Discipline: Law Enforcement' /
   EDUCATION 'Discipline: Education' /
   SOCIAL_WORK_HUMAN_SERVICE 'Discipline: Social Work Human Service' /
   MEDICINE  'Discipline: Medicine' /
   VOCATIONAL_REHABILITATION 'Discipline: Vocational Rehabilitation' /
   ADMINISTRATION 'Discipline: Administration' /
   OTHER_SPECIFY 'Discipline: Other specify' /
   COUNSELING_CREDENTIALS 'Counseling credentials (Not in CD)' /
   COUNSELING_CREDENTIALS_AL 'Counseling credentials: Alcohol (Not in CD)' /
   COUNSELING_CREDENTIALS_DR 'Counseling credentials: Drugs (Not in CD)' /
   COUNSELING_CREDENTIALS_CO 'Counseling credentials: Alcohol and drugs (Not in CD)' /
   NATIONAL_CERTIFICATION 'National certification (Not in CD)' /
   NATIONAL_CERTIFICATION_NA 'National certification: NAADAC National Certified Addiction Counselor Level 1, 2, or Master (Not in CD)' /
   NATIONAL_CERTIFICATION_IC 'National certification: ICRC Certified Alcohol and Drug Abuse Counselor (Not in CD)' /
   LICENSURE 'Licensure (Not in CD)' /
   JOB_LEVEL 'Job Level' /
   SUBSTANCE_ABUSE 'Substance abuse years' /
   PROGRAM_LENGTH 'Unit/Program years' /
   CURRENT_EMPLOYER 'Current employer years' /
   CURRENT_POSITION 'Current position year' /
   REGULAR_WORK_HOURS 'Regular work hours' /
   CLIENT_COUNSELING 'Client supervision' /
   DIRECT_CONTACT_CLIENT 'Direct contact client hours (Not in CD)' /
   NUMBER_OF_CLIENTS_COUNSEL 'Number of clients counsel (Not in CD)' /
   ACTIVE_CASELOAD 'Active caseload (Not in CD)' /
   NUMBER_OF_STAFF_SUPERVISE 'Number of staff supervise' /
   CURRENT_WORK_SETTING 'Current work setting' /
   BSOCA1    'Need guidance: Assessing client needs.' /
   BSOCA2    'Need guidance:  Using assessments to guide care' /
   BSOCA3    'Need guidance: Using assessments to document improvements' /
   BSOCA4    'Need guidance: Matching client needs with services' /
   BSOCA5    'Need guidance: Increasing program participation by clients' /
   BSOCA6    'Need guidance: Improving rapport with clients.' /
   BSOCA7    'Need guidance: Improving client thinking and problem solving skills.' /
   BSOCA8    'Need guidance: Improving behavioral management of clients' /
   BSOCA9    'Need guidance: Improving cognitive focus on clients during group counseling' /
   BSOCA10   'Need guidance: Identifying and using evidence-based  practices' /
   BSOCA11   'Organization needs guidance: Defining its mission' /
   BSOCA12   'Organization needs guidance: Setting specific goals for improving services' /
   BSOCA13   'Organization needs guidance: Assigning or clarifying staff roles' /
   BSOCA14   'Organization needs guidance: Establishing accurate job descriptions for staff' /
   BSOCA15   'Organization needs guidance: Evaluating staff performance' /
   BSOCA16   'Organization needs guidance: Improving relations among staff' /
   BSOCA17   'Organization needs guidance: Improving communications among staff' /
   BSOCA18   'Organization needs guidance: Improving record keeping and information systems' /
   BSOCA19   'Organization needs guidance: Improving funding for contracted services' /
   BSOCA20   'Need training: Basic computer skills/programs' /
   BSOCA21   'Need training: Specialized computer applications  (e.g., data systems)' /
   BSOCA22   'Need training: New methods/developments in their areas of responsibility' /
   BSOCA23   'Need training: New equipment or procedures being used or planned' /
   BSOCA24   'Need training: Obtaining certifications or promotions' /
   BSOCA25   'Need training:  New laws or regulations you need to  know about' /
   BSOCA26   'Need training: Management or supervisory responsibilities' /
   BSOCA27   'Pressure to Change: Offenders being served' /
   BSOCA28   'Pressure to Change: Other staff members' /
   BSOCA29   'Pressure to Change: Program  supervisors or managers' /
   BSOCA30   'Pressure to Change: Governmental policy makers' /
   BSOCA31   'Pressure to Change: Community groups' /
   BSOCA32   'Pressure to Change: Government funding bodies' /
   BSOCA33   'Pressure to Change: Accreditation or licensing authorities' /
   BSOCB1    'Good management team' /
   BSOCB2    'Staff turnover problem' /
   BSOCB3    'Staff training and continuing education are priorities' /
   BSOCB4    'Staff capable' /
   BSOCB5    'Policies limit staff use of internet for work needs' /
   BSOCB6    'Staff  learned new skills or techniques in past year' /
   BSOCB7    'Computer problems are usually repaired promptly at your program' /
   BSOCB8    'Much time and attention are given to  staff supervision when needed' /
   BSOCB9    'Convenient access to e-mail at work' /
   BSOCB10   'Spend time needed with clients' /
   BSOCB11   'Equiptment outdated' /
   BSOCB12   'Decisions well planned' /
   BSOCB13   'Computers are needed for staff' /
   BSOCB14   'Client records computerized' /
   BSOCB15   'Staff have skills needed' /
   BSOCB16   'Regular in service meetings' /
   BSOCB17   'Enough staff to meant client needs' /
   BSOCB18   'Staff well-trained' /
   BSOCB19   'Staff used internet recently to access treatment informtaion' /
   BSOCB20   'Confidence in decision making' /
   BSOCB21   'Easy access to internet at work' /
   BSOCB22   'Computers in personal work space' /
   BSOCB23   'Frequent meetings about client progress' /
   BSOCB24   'Larger support staff needed' /
   BSOCB25   'Budget for professional training' /
   BSOCB26   'Staff comfortable with computers' /
   BSOCB27   'Staff concerns ignored' /
   BSOCC1    'Skills for effective counseling' /
   BSOCC2    'Staff asks advice' /
   BSOCC3    'Satisfied with job' /
   BSOCC4    'Easy to learn new procedures' /
   BSOCC5    'Experienced source of advice' /
   BSOCC6    'Feel appreciated for job' /
   BSOCC7    'Professional growth encouraged' /
   BSOCC8    'Confident in doing your job' /
   BSOCC9    'Adapt quickly' /
   BSOCC10   'Skills up to date' /
   BSOCC11   'High value to work you do' /
   BSOCC12   'Influence staff decisions' /
   BSOCC13   'Accomplish goals' /
   BSOCC14   'Regularly improve skills' /
   BSOCC15   'Read professional literature' /
   BSOCC16   'Review new techniques and treatment' /
   BSOCC17   'Staff ask your opinion' /
   BSOCC18   'Willing to try new ideas' /
   BSOCC19   'Skills to work with community leaders' /
   BSOCC20   'Share knowledge with others' /
   BSOCC21   'Too slow to make change' /
   BSOCC22   'Proud of where you work' /
   BSOCC23   'Like working with people' /
   BSOCC24   'Strong leader' /
   BSOCC25   'Plan ahead and follow through' /
   BSOCC26   'Want a new job' /
   BSOCC27   'See the importance of substance abuse treatment' /
   BSOCC28   'Respect treatments staff''s work' /
   BSOCC29   'Minimize interference with treatment staff' /
   BSOCC30   'Too much reliance on computerized scoring' /
   BSOCC31A  'Best way to reduce crime: Punish drug users (CD/CO only)' /
   BSOCC31B  'Best way to reduce crime: Effective treatment (CD/CO only)' /
   BSOCC31C  'Best way to reduce crime: Keep offenders in jail (CD/CO only)' /
   BSOCC31D  'Best way to reduce crime: Eye for eye (CD/CO only)' /
   BSOCC31E  'Best way to reduce crime: Deterrence (CD/CO only)' /
   BSOCC31F  'Best way to reduce crime: Address problems (CD/CO only)' /
   BSOCC31G  'Best way to reduce crime: Match treatment to needs (CD/CO only)' /
   BSOCC31H  'Best way to reduce crime: Jail offenders (CD/CO only)' /
   BSOCC31I  'Best way to reduce crime: Provide more treatment, jobs, and educational programs (CD/CO only)' /
   BSOCC31J  'Best way to reduce crime: Jail drug users (CD/CO only)' /
   BSOCC31K  'Best way to reduce crime: Punish addicts (CD/CO only)' /
   BSOCC31L  'Best way to reduce crime: Deter future offenders by severely punishing drug users (CD/CO only)' /
   BSOCD1    'Staff confused about goals' /
   BSOCD2    'Workload reduces effectiveness' /
   BSOCD3    'Talking to offenders/clients & supervisors a waste of time' /
   BSOCD4    'Hear good ideas from staff' /
   BSOCD5    'Supervisors revise case plans' /
   BSOCD6    'Unit accepts new technology' /
   BSOCD7    'Need more open discussions' /
   BSOCD8    'Feel depressed' /
   BSOCD9    'Staff ideas given fair consideration' /
   BSOCD10   'Staff work as team' /
   BSOCD11   'Duties relate to unit/program goals' /
   BSOCD12   'Too many pressures to work effectively' /
   BSOCD13   'Overwhelmed by paperwork' /
   BSOCD14   'Staff have broad discretion' /
   BSOCD15   'Staff well informed' /
   BSOCD16   'Novel treatment ideas discouraged' /
   BSOCD17   'Feel tired' /
   BSOCD18   'Strong mutual trust/ cooperation among staff' /
   BSOCD19   'Clear goals/objectives' /
   BSOCD20   'Staff show high stress' /
   BSOCD21   'Easy to change procedures' /
   BSOCD22   'Staff try different techniques' /
   BSOCD23   'Not making a difference' /
   BSOCD24   'Staff get along well' /
   BSOCD25   'Too many rules' /
   BSOCD26   'Staff help each other' /
   BSOCD27   'Its an effort to come to work' /
   BSOCD28   'Unit communication channels work well' /
   BSOCD29   'Friction among staff' /
   BSOCD30   'Staff understand goals fit in to system' /
   BSOCD31   'Feel disillusioned and resentful' /
   BSOCD32   'Some staff do not do fair share' /
   BSOCD33   'Trust professional judgment of staff' /
   BSOCD34   'Staff free to ask questions' /
   BSOCD35   'Staff frustration common' /
   BSOCD36   'Clear plan for unit' /
   BSOCD37   'Encourage staff to try new techniques' /
   BSOCD38   'Staff have skills to work in teams' /
   BSOCD39   'No rewards for good job' /
   BSOCD40   'Support staff work' /
   BSOCD41   'Review staff progress in making change' /
   BSOCD42   'Unit success w/ offenders is a high priority' /
   BSOCD43   'Staff discuss differences' /
   BSOCD44   'Disagreements resolved fairly' /
   BSOCD45   'Staff seek out opinions' /
   BSOCD46   'Most viewpoints considered' /
   BSOCD47   'Staff not afraid to disagree' /
   BSOCD48   'Staff learn from other staff''s opinions' /
   BSOCD49   'Ask staff about client supervision issues' /
   BSOCD50   'Ask Staff about unit policies' /
   BSOCD51   'Ask staff about supervision issues' /
   BSOCD52   'Ask staff about unit policies' /
   BSOCD53   'Open to new methods' /
   BSOCD54   'Open to issues of cultural diversity' /
   BSOCD55   'As leader: Inspire others' /
   BSOCD56   'As a leader: Lead by example' /
   BSOCD57   'As leader: Get people to work together' /
   BSOCD58   'As leader: Insist on best performance' /
   BSOCD59   'As leader: Treat staff as individuals' /
   BSOCD60   'As leader: Encourage new ways' /
   BSOCD61   'As leader: Give recognition' /
   BSOCD62   'As leader: Define goals and objectives' /
   BSOCD63   'As leader: Innovate before other managers' /
   BSOCE1    'Know better than researchers how to supervise clients' /
   BSOCE2    'Research-based interventions are not useful' /
   BSOCE3    'Experience more important than manuals' /
   BSOCE4    'Would not support intervention w/ instructions/guidelines' /
   BSOCE5    'Right way and wrong way to do almost everything' /
   BSOCE6    'Every problem has solution' /
   BSOCE7    'Clear distinction between right and wrong' /
   BSOCE8    'Stick to basic rules' /
   BSOCE9    'Prefer uncertainties of psychiatry' /
   BSOCE10   'Vague pictures have little appeal' /
   BSOCE11   'Before exam, like to know how many questions' /
   BSOCE12   'Best part of jigsaw puzzle is putting in last piece' /
   BSOCE13   'Do not like to work on problems w/o answer' /
   BSOCE14   'Like to try new ideas, even when waste of time' /
   BSOCE15   'Support new supervision services to help clients (CD/TD only)' /
   BSOCE16   'Support new services even w/ manual (CD/TD only)' /
   BSOCE17   'Support services developed by researchers (CD/TD only)' /
   BSOCE18   'Support very different new services (CD/TD only)' /
   BSOCE19   'Written protocol for sharing client info (CD, CO only)' /
   BSOCE20   'Share operational oversight of treatment programs (CD, CO only)' /
   BSOCE21   'Cross train staff on substance abuse issues (CD, CO only)' /
   BSOCE22   'Written agreements provide space for substance abuse services (CD, CO only)' /
   BSOCE23   'Joint staffing, case reporting (CD, CO only)' /
   BSOCE24   'Coordinate policies, procedures (CD, CO only)' /
   BSOCE25   'Agreed to similar requirements for substance abuse service eligibility (CD, CO only)' /
   BSOCE26   'Share budgetary oversight of substance abuse services (CD, CO only)' /
   BSOCE27   'Pooled funding for offender substance abuse services (CD, CO only)' /
   BSOCE28   'Joint policy and procedure manuals (CD, CO only)' /
   BSOCE29   'Share info on offender treatment needs (CD, CO only)' /
   BSOCE30   'Hold joint staff meetings (CD, CO only)' /
   BSOCE19_DC 'Drug court: Written protocol for sharing client info (TD/TS only)' /
   BSOCE19_PRO 'Probation: Written protocol for sharing client info (TD/TS only)' /
   BSOCE19_PA 'Parole: Written protocol for sharing client info (TD/TS only)' /
   BSOCE19_J 'Jail: Written protocol for sharing client info (TD/TS only)' /
   BSOCE19_SP 'State prison: Written protocol for sharing client info (TD/TS only)' /
   BSOCE20_DC 'Drug court: Share operational oversight of treatment programs (TD/TS only)' /
   BSOCE20_PRO 'Probation: Share operational oversight of treatment programs (TD/TS only)' /
   BSOCE20_PA 'Parole: Share operational oversight of treatment programs (TD/TS only)' /
   BSOCE20_J 'Jail: Share operational oversight of treatment programs (TD/TS only)' /
   BSOCE20_SP 'State prison: Share operational oversight of treatment programs (TD/TS only)' /
   BSOCE21_DC 'Drug court: Cross train staff on substance abuse issues (TD/TS only)' /
   BSOCE21_PRO 'Probation: Cross train staff on substance abuse issues (TD/TS only)' /
   BSOCE21_PA 'Parole: Cross train staff on substance abuse issues (TD/TS only)' /
   BSOCE21_J 'Jail: Cross train staff on substance abuse issues (TD/TS only)' /
   BSOCE21_SP 'State prison: Cross train staff on substance abuse issues (TD/TS only)' /
   BSOCE22_DC 'Drug court: Written agreements provide space for substance abuse services (TD/TS only)' /
   BSOCE22_PRO 'Probation: Written agreements provide space for substance abuse services (TD/TS only)' /
   BSOCE22_PA 'Parole: Written agreements provide space for substance abuse services (TD/TS only)' /
   BSOCE22_J 'Jail: Written agreements provide space for substance abuse services (TD/TS only)' /
   BSOCE22_SP 'State prison: Written agreements provide space for substance abuse services (TD/TS only)' /
   BSOCE23_DC 'Drug court: Joint staffing, case reporting (TD/TS only)' /
   BSOCE23_PRO 'Probation: Joint staffing, case reporting (TD/TS only)' /
   BSOCE23_PA 'Parole: Joint staffing, case reporting (TD/TS only)' /
   BSOCE23_J 'Jail: Joint staffing, case reporting (TD/TS only)' /
   BSOCE23_SP 'State prison: Joint staffing, case reporting (TD/TS only)' /
   BSOCE24_DC 'Drug court: Coordinate policies, procedures (TD/TS only)' /
   BSOCE24_PRO 'Probation: Coordinate policies, procedures (TD/TS only)' /
   BSOCE24_PA 'Parole: Coordinate policies, procedures (TD/TS only)' /
   BSOCE24_J 'Jail: Coordinate policies, procedures (TD/TS only)' /
   BSOCE24_SP 'State prison: Coordinate policies, procedures (TD/TS only)' /
   BSOCE25_DC 'Drug court: Agreed to similar requirements for substance abuse service eligibility (TD/TS only)' /
   BSOCE25_PRO 'Probation: Agreed to similar requirements for substance abuse service eligibility (TD/TS only)' /
   BSOCE25_PA 'Parole: Agreed to similar requirements for substance abuse service eligibility (TD/TS only)' /
   BSOCE25_J 'Jail: Agreed to similar requirements for substance abuse service eligibility (TD/TS only)' /
   BSOCE25_SP 'State prison: Agreed to similar requirements for substance abuse service eligibility (TD/TS only)' /
   BSOCE26_DC 'Drug court: Share budgetary oversight of program (TD/TS only)' /
   BSOCE26_PRO 'Probation: Share budgetary oversight of program (TD/TS only)' /
   BSOCE26_PA 'Parole: Share budgetary oversight of program (TD/TS only)' /
   BSOCE26_J 'Jail: Share budgetary oversight of program (TD/TS only)' /
   BSOCE26_SP 'State prison: Share budgetary oversight of program (TD/TS only)' /
   BSOCE27_DC 'Drug court: Pooled funding for offender substance abuse services (TD/TS only)' /
   BSOCE27_PRO 'Probation: Pooled funding for offender substance abuse services (TD/TS only)' /
   BSOCE27_PA 'Parole: Pooled funding for offender substance abuse services (TD/TS only)' /
   BSOCE27_J 'Jail: Pooled funding for offender substance abuse services (TD/TS only)' /
   BSOCE27_SP 'State prison: Pooled funding for offender substance abuse services (TD/TS only)' /
   BSOCE28_DC 'Drug court: Developed joint policy and procedure manuals (TD/TS only)' /
   BSOCE28_PRO 'Probation:  Developed joint policy and procedure manuals (TD/TS only)' /
   BSOCE28_PA 'Parole:  Developed joint policy and procedure manuals (TD/TS only)' /
   BSOCE28_J 'Jail:  Developed joint policy and procedure manuals (TD/TS only)' /
   BSOCE28_SP 'State prison:  Developed joint policy and procedure manuals (TD/TS only)' /
   BSOCE29_DC 'Drug court: Share info on offender treatment needs (TD/TS only)' /
   BSOCE29_PRO 'Probation: Share info on offender treatment needs (TD/TS only)' /
   BSOCE29_PA 'Parole: Share info on offender treatment needs (TD/TS only)' /
   BSOCE29_J 'Jail: Share info on offender treatment needs (TD/TS only)' /
   BSOCE29_SP 'State prison: Share info on offender treatment needs (TD/TS only)' /
   BSOCE30_DC 'Drug court: Hold joint staff meetings (TD/TS only)' /
   BSOCE30_PRO 'Probation: Hold joint staff meetings (TD/TS only)' /
   BSOCE30_PA 'Parole: Hold joint staff meetings (TD/TS only)' /
   BSOCE30_J 'Jail: Hold joint staff meetings (TD/TS only)' /
   BSOCE30_SP 'State prison: Hold joint staff meetings (TD/TS only)' /
   ANPSTAFF  'Staff Needs subscale (TCU), section A' /
   ANPPN     'Program Needs subscale, section A' /
   ANPTRAIN  'Training Needs subscale (TCU), section A' /
   ANPPFC    'Pressure for Change subscale (TCU), section A' /
   BRESTAFF  'Staffing Readiness subscale (TCU), section B' /
   BRETRAIN  'Training Readiness subscale (TCU), section B' /
   BREEQU    'Equipment Readiness subscale (TCU), section B' /
   BREINT    'Internet Readiness subscale (TCU), section B' /
   BRESUP    'Supervision Subscale (TCU), section B' /
   CSAGRO    'Growth Subscale (TCU), section C' /
   CSAEFF    'Efficacy Subscale (TCU), section C' /
   CSAINF    'Influence Subscale (TCU), section C' /
   CSAADPT   'Adaptability Subscale (TCU), section C' /
   CSASAT    'Staff Satisfaction Subscale (TCU), section C' /
   CSABEL    'Rehabilitation Subscale (TCU), section C' /
   CSACOM    'Reliance on Computers Scale' /
   CSABEL2   'Belief in Rehabilitation2 Scale' /
   DOCMIS    'Mission Subscale (TCU), section D' /
   DOCCOH    'Staff Cohesion Subscale (TCU), section D' /
   DOCAUT    'Autonomy Subscale (TCU), section D' /
   DOCCOM    'Communication Scale' /
   DOCCOM1   'Communication Scale 1' /
   DOCCOM2   'Communication Scale 2' /
   DOCSTRS   'Staff Stress Subscale (TCU), section D' /
   DOCCHNG   'Change sub-scale, section D' /
   DOCBRNT   'Staff Burnout Subscale (TCU), section D' /
   DOCSUP    'Organizational Support Subscale (RAND), section D' /
   DOCLEAD   'Leadership sub-scale, section D' /
   EOTDIV    'Divergence sub-scale, section E' /
   EOTTOL    'Tolerance for ambiguity, section E' /
   EOTSCO    'Service Coordination' /
   EOTOPN    'Openness' /
   .


* SPSS VALUE LABELS COMMAND.

VALUE LABELS
   ID        -9 'Missing' /
   RESPCODE  -9 'Missing' /
   SITEID    -9 'Missing' /
   STUDYCOND 1 'Experimental' 2 'Comparison' 3 'Both' 4 'Neither' /
   STUDYCODE 1 'OPII' 2 'MATICCE' 3 'HIC-STIC' /
   DATE      -9 'Missing' 1 '2ND QTR (APR, MAY, JUN) 2010'
             2 '3RD QTR (JULY, AUG, SEPT) 2010'
             3 '4TH QTR (OCT, NOV, DEC) 2010'
             4 '1ST QTR (JAN, FEB, MAR) 2011'
             5 '2ND QTR (APR, MAY, JUN) 2011'
             6 '3RD QTR (JULY, AUG, SEPT) 2011'
             7 '4TH QTR (OCT, NOV, DEC) 2011'
             8 '1ST QTR (JAN, FEB, MAR) 2012' /
   RESPTYPE  1 'Corrections Director' 2 'Corrections Officer'
             3 'Treatment Director' 4 'Treatment Staff' /
   DEGREE    -9 'Missing' 1 'No high school diploma or equivalent'
             2 'High school diploma or equivalent'
             3 'Some college, but no degree' 4 'Associate''s degree'
             5 'Bachelor''s degree' 6 'Master''s degree'
             7 'Doctoral degree or equivalent' 8 'Other (specify)' /
   YEAR_DEG  -9 'Missing' 1 'Before 1980' 2 '1980''s' 3 '1990''s'
             4 '2000 or later' /
   ADDICTIONS_COUNSELING -9 'Missing' 0 'Not Marked' 1 'Marked' /
   CRIMINAL_JUSTICE -9 'Missing' 0 'Not Marked' 1 'Marked' /
   MILITARY  -9 'Missing' 0 'Not Marked' 1 'Marked' /
   OTHER_COUNSELING -9 'Missing' 0 'Not Marked' 1 'Marked' /
   PSYCHOLOGY -9 'Missing' 0 'Not Marked' 1 'Marked' /
   LAW_ENFORCEMENT -9 'Missing' 0 'Not Marked' 1 'Marked' /
   EDUCATION -9 'Missing' 0 'Not Marked' 1 'Marked' /
   SOCIAL_WORK_HUMAN_SERVICE -9 'Missing' 0 'Not Marked' 1 'Marked' /
   MEDICINE  -9 'Missing' 0 'Not Marked' 1 'Marked' /
   VOCATIONAL_REHABILITATION -9 'Missing' 0 'Not Marked' 1 'Marked' /
   ADMINISTRATION -9 'Missing' 0 'Not Marked' 1 'Marked' /
   OTHER_SPECIFY -9 'Missing' 0 'Not Marked' 1 'Marked' /
   COUNSELING_CREDENTIALS -9 'Blank/Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   COUNSELING_CREDENTIALS_AL -9 'Blank/Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   COUNSELING_CREDENTIALS_DR -9 'Blank/Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   COUNSELING_CREDENTIALS_CO -9 'Blank/Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   NATIONAL_CERTIFICATION -9 'Blank/Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   NATIONAL_CERTIFICATION_NA -9 'Blank/Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   NATIONAL_CERTIFICATION_IC -9 'Blank/Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   LICENSURE -9 'Blank/Not ascertained' -6 'Not asked on respondent''s form'
             1 'Yes' 2 'No' /
   JOB_LEVEL -9 'Missing' 1 'Program Director' 2 'Supervisor' 3 'Counselor'
             4 'Support/Other' /
   SUBSTANCE_ABUSE 1 'Less than 5' 2 '5 to 9.99' 3 '10 to 19.99'
             4 '20 to 29.99' 5 '30 or more' /
   PROGRAM_LENGTH 1 'Less than 5' 2 '5 to 9.99' 3 '10 to 19.99'
             4 '20 to 29.99' 5 '30 or more' /
   CURRENT_EMPLOYER 1 'Less than 5' 2 '5 to 9.99' 3 '10 to 19.99'
             4 '20 to 29.99' 5 '30 or more' /
   CURRENT_POSITION 1 'Less than 5' 2 '5 to 9.99' 3 '10 to 19.99'
             4 '20 to 29.99' 5 '30 or more' /
   REGULAR_WORK_HOURS -9 'Missing' 50 '50 or more' /
   CLIENT_COUNSELING -9 'Blank/Not ascertained' 1 'Yes' 2 'No' /
   DIRECT_CONTACT_CLIENT -9 'Missing' -6 'Not asked on respondent''s form'
             100 '100 or more' /
   NUMBER_OF_CLIENTS_COUNSEL -9 'Missing'
             -6 'Not asked on respondent''s form' 100 '100 or more' /
   ACTIVE_CASELOAD -9 'Missing' -6 'Not asked on respondent''s form'
             200 '200 or more' /
   NUMBER_OF_STAFF_SUPERVISE -9 'Missing' 1 'Less than 10' 2 '10 to 20'
             3 'More than 20' /
   CURRENT_WORK_SETTING -9 'Missing' 1 'Probation' 2 'Prison'
             3 'Prison substance abuse treatment program' 4 'Parole' 5 'TASC'
             6 'Community substance abuse treatment program'
             7 'Work release center' 8 'Community health clinic'
             9 'Other (specify)' /
   BSOCA1    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA2    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA3    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA4    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA5    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA6    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA7    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA8    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA9    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA10   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA11   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA12   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA13   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA14   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA15   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA16   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA17   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA18   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA19   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA20   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA21   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA22   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA23   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA24   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA25   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA26   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA27   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA28   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA29   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA30   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA31   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA32   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCA33   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB1    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB2    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB3    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB4    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB5    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB6    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB7    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB8    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB9    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB10   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB11   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB12   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB13   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB14   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB15   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB16   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB17   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB18   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB19   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB20   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB21   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB22   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB23   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB24   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB25   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB26   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCB27   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC1    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC2    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC3    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC4    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC5    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC6    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC7    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC8    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC9    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC10   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC11   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC12   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC13   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC14   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC15   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC16   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC17   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC18   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC19   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC20   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC21   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC22   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC23   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC24   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC25   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC26   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC27   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC28   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC29   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC30   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC31A  -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Disagree Strongly'
             2 'Disagree' 3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC31B  -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Disagree Strongly'
             2 'Disagree' 3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC31C  -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Disagree Strongly'
             2 'Disagree' 3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC31D  -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Disagree Strongly'
             2 'Disagree' 3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC31E  -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Disagree Strongly'
             2 'Disagree' 3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC31F  -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Disagree Strongly'
             2 'Disagree' 3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC31G  -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Disagree Strongly'
             2 'Disagree' 3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC31H  -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Disagree Strongly'
             2 'Disagree' 3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC31I  -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Disagree Strongly'
             2 'Disagree' 3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC31J  -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Disagree Strongly'
             2 'Disagree' 3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC31K  -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Disagree Strongly'
             2 'Disagree' 3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCC31L  -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Disagree Strongly'
             2 'Disagree' 3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD1    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD2    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD3    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD4    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD5    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD6    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD7    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD8    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD9    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD10   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD11   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD12   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD13   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD14   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD15   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD16   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD17   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD18   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD19   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD20   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD21   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD22   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD23   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD24   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD25   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD26   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD27   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD28   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD29   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD30   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD31   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD32   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD33   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD34   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD35   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD36   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD37   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD38   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD39   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD40   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD41   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD42   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD43   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD44   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD45   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD46   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD47   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD48   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD49   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD50   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD51   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD52   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD53   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD54   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD55   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD56   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD57   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD58   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD59   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD60   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD61   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD62   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCD63   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCE1    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCE2    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCE3    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCE4    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCE5    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCE6    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCE7    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCE8    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCE9    -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCE10   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCE11   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCE12   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCE13   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCE14   -9 'Blank / Not ascertained' 1 'Disagree Strongly' 2 'Disagree'
             3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCE15   -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Disagree Strongly'
             2 'Disagree' 3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCE16   -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Disagree Strongly'
             2 'Disagree' 3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCE17   -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Disagree Strongly'
             2 'Disagree' 3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCE18   -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Disagree Strongly'
             2 'Disagree' 3 'Uncertain' 4 'Agree' 5 'Agree Strongly' /
   BSOCE19   -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE20   -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE21   -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE22   -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE23   -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE24   -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE25   -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE26   -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE27   -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE28   -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE29   -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE30   -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE19_DC -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE19_PRO -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE19_PA -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE19_J -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE19_SP -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE20_DC -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE20_PRO -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE20_PA -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE20_J -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE20_SP -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE21_DC -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE21_PRO -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE21_PA -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE21_J -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE21_SP -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE22_DC -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE22_PRO -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE22_PA -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE22_J -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE22_SP -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE23_DC -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE23_PRO -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE23_PA -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE23_J -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE23_SP -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE24_DC -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE24_PRO -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE24_PA -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE24_J -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE24_SP -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE25_DC -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE25_PRO -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE25_PA -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE25_J -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE25_SP -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE26_DC -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE26_PRO -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE26_PA -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE26_J -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE26_SP -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE27_DC -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE27_PRO -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE27_PA -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE27_J -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE27_SP -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE28_DC -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE28_PRO -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE28_PA -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE28_J -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE28_SP -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE29_DC -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE29_PRO -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE29_PA -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE29_J -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE29_SP -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE30_DC -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE30_PRO -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE30_PA -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE30_J -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   BSOCE30_SP -9 'Blank / Not ascertained'
             -6 'Not asked on respondent''s form' 1 'Yes' 2 'No' /
   ANPSTAFF  -9 'Missing' /
   ANPPN     -9 'Missing' /
   ANPTRAIN  -9 'Missing' /
   ANPPFC    -9 'Missing' /
   BRESTAFF  -9 'Missing' /
   BRETRAIN  -9 'Missing' /
   BREEQU    -9 'Missing' /
   BREINT    -9 'Missing' /
   BRESUP    -9 'Missing' /
   CSAGRO    -9 'Missing' /
   CSAEFF    -9 'Missing' /
   CSAINF    -9 'Missing' /
   CSAADPT   -9 'Missing' /
   CSASAT    -9 'Missing' /
   CSABEL    -9 'Missing' -5 'Not calculated for respondent type' /
   CSACOM    -9 'Missing' -5 'Not calculated for respondent type' /
   CSABEL2   -9 'Missing' -5 'Not calculated for respondent type' /
   DOCMIS    -9 'Missing' /
   DOCCOH    -9 'Missing' /
   DOCAUT    -9 'Missing' /
   DOCCOM    -9 'Missing' /
   DOCCOM1   -9 'Missing' /
   DOCCOM2   -9 'Missing' /
   DOCSTRS   -9 'Missing' /
   DOCCHNG   -9 'Missing' /
   DOCBRNT   -9 'Missing' /
   DOCSUP    -9 'Missing' /
   DOCLEAD   -9 'Missing' /
   EOTDIV    -9 'Missing' /
   EOTTOL    -9 'Missing' /
   EOTSCO    -9 'Missing' /
   EOTOPN    -9 'Missing' -5 'Not calculated for respondent type' /
   .

* SPSS MISSING VALUES COMMAND.

* MISSING VALUES
     ID (-9) /
     RESPCODE (-9) /
     SITEID (-9) /
     DATE (-9) /
     DEGREE (-9) /
     YEAR_DEG (-9) /
     ADDICTIONS_COUNSELING (-9) /
     CRIMINAL_JUSTICE (-9) /
     MILITARY (-9) /
     OTHER_COUNSELING (-9) /
     PSYCHOLOGY (-9) /
     LAW_ENFORCEMENT (-9) /
     EDUCATION (-9) /
     SOCIAL_WORK_HUMAN_SERVICE (-9) /
     MEDICINE (-9) /
     VOCATIONAL_REHABILITATION (-9) /
     ADMINISTRATION (-9) /
     OTHER_SPECIFY (-9) /
     COUNSELING_CREDENTIALS (-6, -9) /
     COUNSELING_CREDENTIALS_AL (-6, -9) /
     COUNSELING_CREDENTIALS_DR (-6, -9) /
     COUNSELING_CREDENTIALS_CO (-6, -9) /
     NATIONAL_CERTIFICATION (-6, -9) /
     NATIONAL_CERTIFICATION_NA (-6, -9) /
     NATIONAL_CERTIFICATION_IC (-6, -9) /
     LICENSURE (-6, -9) /
     JOB_LEVEL (-9) /
     REGULAR_WORK_HOURS (-9) /
     CLIENT_COUNSELING (-9) /
     DIRECT_CONTACT_CLIENT (-6, -9) /
     NUMBER_OF_CLIENTS_COUNSEL (-6, -9) /
     ACTIVE_CASELOAD (-6, -9) /
     NUMBER_OF_STAFF_SUPERVISE (-9) /
     CURRENT_WORK_SETTING (-9) /
     BSOCA1 (-9) /
     BSOCA2 (-9) /
     BSOCA3 (-9) /
     BSOCA4 (-9) /
     BSOCA5 (-9) /
     BSOCA6 (-9) /
     BSOCA7 (-9) /
     BSOCA8 (-9) /
     BSOCA9 (-9) /
     BSOCA10 (-9) /
     BSOCA11 (-9) /
     BSOCA12 (-9) /
     BSOCA13 (-9) /
     BSOCA14 (-9) /
     BSOCA15 (-9) /
     BSOCA16 (-9) /
     BSOCA17 (-9) /
     BSOCA18 (-9) /
     BSOCA19 (-9) /
     BSOCA20 (-9) /
     BSOCA21 (-9) /
     BSOCA22 (-9) /
     BSOCA23 (-9) /
     BSOCA24 (-9) /
     BSOCA25 (-9) /
     BSOCA26 (-9) /
     BSOCA27 (-9) /
     BSOCA28 (-9) /
     BSOCA29 (-9) /
     BSOCA30 (-9) /
     BSOCA31 (-9) /
     BSOCA32 (-9) /
     BSOCA33 (-9) /
     BSOCB1 (-9) /
     BSOCB2 (-9) /
     BSOCB3 (-9) /
     BSOCB4 (-9) /
     BSOCB5 (-9) /
     BSOCB6 (-9) /
     BSOCB7 (-9) /
     BSOCB8 (-9) /
     BSOCB9 (-9) /
     BSOCB10 (-9) /
     BSOCB11 (-9) /
     BSOCB12 (-9) /
     BSOCB13 (-9) /
     BSOCB14 (-9) /
     BSOCB15 (-9) /
     BSOCB16 (-9) /
     BSOCB17 (-9) /
     BSOCB18 (-9) /
     BSOCB19 (-9) /
     BSOCB20 (-9) /
     BSOCB21 (-9) /
     BSOCB22 (-9) /
     BSOCB23 (-9) /
     BSOCB24 (-9) /
     BSOCB25 (-9) /
     BSOCB26 (-9) /
     BSOCB27 (-9) /
     BSOCC1 (-9) /
     BSOCC2 (-9) /
     BSOCC3 (-9) /
     BSOCC4 (-9) /
     BSOCC5 (-9) /
     BSOCC6 (-9) /
     BSOCC7 (-9) /
     BSOCC8 (-9) /
     BSOCC9 (-9) /
     BSOCC10 (-9) /
     BSOCC11 (-9) /
     BSOCC12 (-9) /
     BSOCC13 (-9) /
     BSOCC14 (-9) /
     BSOCC15 (-9) /
     BSOCC16 (-9) /
     BSOCC17 (-9) /
     BSOCC18 (-9) /
     BSOCC19 (-9) /
     BSOCC20 (-9) /
     BSOCC21 (-9) /
     BSOCC22 (-9) /
     BSOCC23 (-9) /
     BSOCC24 (-9) /
     BSOCC25 (-9) /
     BSOCC26 (-9) /
     BSOCC27 (-9) /
     BSOCC28 (-9) /
     BSOCC29 (-9) /
     BSOCC30 (-9) /
     BSOCC31A (-6, -9) /
     BSOCC31B (-6, -9) /
     BSOCC31C (-6, -9) /
     BSOCC31D (-6, -9) /
     BSOCC31E (-6, -9) /
     BSOCC31F (-6, -9) /
     BSOCC31G (-6, -9) /
     BSOCC31H (-6, -9) /
     BSOCC31I (-6, -9) /
     BSOCC31J (-6, -9) /
     BSOCC31K (-6, -9) /
     BSOCC31L (-6, -9) /
     BSOCD1 (-9) /
     BSOCD2 (-9) /
     BSOCD3 (-9) /
     BSOCD4 (-9) /
     BSOCD5 (-9) /
     BSOCD6 (-9) /
     BSOCD7 (-9) /
     BSOCD8 (-9) /
     BSOCD9 (-9) /
     BSOCD10 (-9) /
     BSOCD11 (-9) /
     BSOCD12 (-9) /
     BSOCD13 (-9) /
     BSOCD14 (-9) /
     BSOCD15 (-9) /
     BSOCD16 (-9) /
     BSOCD17 (-9) /
     BSOCD18 (-9) /
     BSOCD19 (-9) /
     BSOCD20 (-9) /
     BSOCD21 (-9) /
     BSOCD22 (-9) /
     BSOCD23 (-9) /
     BSOCD24 (-9) /
     BSOCD25 (-9) /
     BSOCD26 (-9) /
     BSOCD27 (-9) /
     BSOCD28 (-9) /
     BSOCD29 (-9) /
     BSOCD30 (-9) /
     BSOCD31 (-9) /
     BSOCD32 (-9) /
     BSOCD33 (-9) /
     BSOCD34 (-9) /
     BSOCD35 (-9) /
     BSOCD36 (-9) /
     BSOCD37 (-9) /
     BSOCD38 (-9) /
     BSOCD39 (-9) /
     BSOCD40 (-9) /
     BSOCD41 (-9) /
     BSOCD42 (-9) /
     BSOCD43 (-9) /
     BSOCD44 (-9) /
     BSOCD45 (-9) /
     BSOCD46 (-9) /
     BSOCD47 (-9) /
     BSOCD48 (-9) /
     BSOCD49 (-9) /
     BSOCD50 (-9) /
     BSOCD51 (-9) /
     BSOCD52 (-9) /
     BSOCD53 (-9) /
     BSOCD54 (-9) /
     BSOCD55 (-9) /
     BSOCD56 (-9) /
     BSOCD57 (-9) /
     BSOCD58 (-9) /
     BSOCD59 (-9) /
     BSOCD60 (-9) /
     BSOCD61 (-9) /
     BSOCD62 (-9) /
     BSOCD63 (-9) /
     BSOCE1 (-9) /
     BSOCE2 (-9) /
     BSOCE3 (-9) /
     BSOCE4 (-9) /
     BSOCE5 (-9) /
     BSOCE6 (-9) /
     BSOCE7 (-9) /
     BSOCE8 (-9) /
     BSOCE9 (-9) /
     BSOCE10 (-9) /
     BSOCE11 (-9) /
     BSOCE12 (-9) /
     BSOCE13 (-9) /
     BSOCE14 (-9) /
     BSOCE15 (-6, -9) /
     BSOCE16 (-6, -9) /
     BSOCE17 (-6, -9) /
     BSOCE18 (-6, -9) /
     BSOCE19 (-6, -9) /
     BSOCE20 (-6, -9) /
     BSOCE21 (-6, -9) /
     BSOCE22 (-6, -9) /
     BSOCE23 (-6, -9) /
     BSOCE24 (-6, -9) /
     BSOCE25 (-6, -9) /
     BSOCE26 (-6, -9) /
     BSOCE27 (-6, -9) /
     BSOCE28 (-6, -9) /
     BSOCE29 (-6, -9) /
     BSOCE30 (-6, -9) /
     BSOCE19_DC (-6, -9) /
     BSOCE19_PRO (-6, -9) /
     BSOCE19_PA (-6, -9) /
     BSOCE19_J (-6, -9) /
     BSOCE19_SP (-6, -9) /
     BSOCE20_DC (-6, -9) /
     BSOCE20_PRO (-6, -9) /
     BSOCE20_PA (-6, -9) /
     BSOCE20_J (-6, -9) /
     BSOCE20_SP (-6, -9) /
     BSOCE21_DC (-6, -9) /
     BSOCE21_PRO (-6, -9) /
     BSOCE21_PA (-6, -9) /
     BSOCE21_J (-6, -9) /
     BSOCE21_SP (-6, -9) /
     BSOCE22_DC (-6, -9) /
     BSOCE22_PRO (-6, -9) /
     BSOCE22_PA (-6, -9) /
     BSOCE22_J (-6, -9) /
     BSOCE22_SP (-6, -9) /
     BSOCE23_DC (-6, -9) /
     BSOCE23_PRO (-6, -9) /
     BSOCE23_PA (-6, -9) /
     BSOCE23_J (-6, -9) /
     BSOCE23_SP (-6, -9) /
     BSOCE24_DC (-6, -9) /
     BSOCE24_PRO (-6, -9) /
     BSOCE24_PA (-6, -9) /
     BSOCE24_J (-6, -9) /
     BSOCE24_SP (-6, -9) /
     BSOCE25_DC (-6, -9) /
     BSOCE25_PRO (-6, -9) /
     BSOCE25_PA (-6, -9) /
     BSOCE25_J (-6, -9) /
     BSOCE25_SP (-6, -9) /
     BSOCE26_DC (-6, -9) /
     BSOCE26_PRO (-6, -9) /
     BSOCE26_PA (-6, -9) /
     BSOCE26_J (-6, -9) /
     BSOCE26_SP (-6, -9) /
     BSOCE27_DC (-6, -9) /
     BSOCE27_PRO (-6, -9) /
     BSOCE27_PA (-6, -9) /
     BSOCE27_J (-6, -9) /
     BSOCE27_SP (-6, -9) /
     BSOCE28_DC (-6, -9) /
     BSOCE28_PRO (-6, -9) /
     BSOCE28_PA (-6, -9) /
     BSOCE28_J (-6, -9) /
     BSOCE28_SP (-6, -9) /
     BSOCE29_DC (-6, -9) /
     BSOCE29_PRO (-6, -9) /
     BSOCE29_PA (-6, -9) /
     BSOCE29_J (-6, -9) /
     BSOCE29_SP (-6, -9) /
     BSOCE30_DC (-6, -9) /
     BSOCE30_PRO (-6, -9) /
     BSOCE30_PA (-6, -9) /
     BSOCE30_J (-6, -9) /
     BSOCE30_SP (-6, -9) /
     ANPSTAFF (-9.0) /
     ANPPN (-9.0) /
     ANPTRAIN (-9.0) /
     ANPPFC (-9.0) /
     BRESTAFF (-9.0) /
     BRETRAIN (-9.0) /
     BREEQU (-9.0) /
     BREINT (-9.0) /
     BRESUP (-9.0) /
     CSAGRO (-9.0) /
     CSAEFF (-9.0) /
     CSAINF (-9.0) /
     CSAADPT (-9.0) /
     CSASAT (-9.0) /
     CSABEL (-9.0, -5.0) /
     CSACOM (-9, -5) /
     CSABEL2 (-9.0, -5.0) /
     DOCMIS (-9.0) /
     DOCCOH (-9.0) /
     DOCAUT (-9.0) /
     DOCCOM (-9.0) /
     DOCCOM1 (-9.0) /
     DOCCOM2 (-9.0) /
     DOCSTRS (-9.0) /
     DOCCHNG (-9.0) /
     DOCBRNT (-9.0) /
     DOCSUP (-9.0) /
     DOCLEAD (-9.0) /
     EOTDIV (-9.0) /
     EOTTOL (-9.0) /
     EOTSCO (-9) /
     EOTOPN (-9.0, -5.0) /
   .

EXECUTE.

* SPSS VARIABLE LEVEL COMMAND.

VARIABLE LEVEL
   CASEID
   ID
   RESPCODE
   SITEID
   CENTER
   REGULAR_WORK_HOURS
   DIRECT_CONTACT_CLIENT
   NUMBER_OF_CLIENTS_COUNSEL
   ACTIVE_CASELOAD
   ANPSTAFF
   ANPPN
   ANPTRAIN
   ANPPFC
   BRESTAFF
   BRETRAIN
   BREEQU
   BREINT
   BRESUP
   CSAGRO
   CSAEFF
   CSAINF
   CSAADPT
   CSASAT
   CSABEL
   CSACOM
   CSABEL2
   DOCMIS
   DOCCOH
   DOCAUT
   DOCCOM
   DOCCOM1
   DOCCOM2
   DOCSTRS
   DOCCHNG
   DOCBRNT
   DOCSUP
   DOCLEAD
   EOTDIV
   EOTTOL
   EOTSCO
   EOTOPN
    (scale).

VARIABLE LEVEL
   DEGREE_SPECIFY_OTHER
   DISCIPLINE
   DISCIPLINE_OTHER
   STATE_CREDENTIALS_SPECIFY
   NATIONAL_CERTIFICATION_OT
   LICENSURE_SPECIFY
   CURRENT_WORK_SETTING_SPEC
   STUDYCOND
   STUDYCODE
   DATE
   RESPTYPE
   DEGREE
   YEAR_DEG
   ADDICTIONS_COUNSELING
   CRIMINAL_JUSTICE
   MILITARY
   OTHER_COUNSELING
   PSYCHOLOGY
   LAW_ENFORCEMENT
   EDUCATION
   SOCIAL_WORK_HUMAN_SERVICE
   MEDICINE
   VOCATIONAL_REHABILITATION
   ADMINISTRATION
   OTHER_SPECIFY
   COUNSELING_CREDENTIALS
   COUNSELING_CREDENTIALS_AL
   COUNSELING_CREDENTIALS_DR
   COUNSELING_CREDENTIALS_CO
   NATIONAL_CERTIFICATION
   NATIONAL_CERTIFICATION_NA
   NATIONAL_CERTIFICATION_IC
   LICENSURE
   JOB_LEVEL
   SUBSTANCE_ABUSE
   PROGRAM_LENGTH
   CURRENT_EMPLOYER
   CURRENT_POSITION
   CLIENT_COUNSELING
   NUMBER_OF_STAFF_SUPERVISE
   CURRENT_WORK_SETTING
   BSOCA1
   BSOCA2
   BSOCA3
   BSOCA4
   BSOCA5
   BSOCA6
   BSOCA7
   BSOCA8
   BSOCA9
   BSOCA10
   BSOCA11
   BSOCA12
   BSOCA13
   BSOCA14
   BSOCA15
   BSOCA16
   BSOCA17
   BSOCA18
   BSOCA19
   BSOCA20
   BSOCA21
   BSOCA22
   BSOCA23
   BSOCA24
   BSOCA25
   BSOCA26
   BSOCA27
   BSOCA28
   BSOCA29
   BSOCA30
   BSOCA31
   BSOCA32
   BSOCA33
   BSOCB1
   BSOCB2
   BSOCB3
   BSOCB4
   BSOCB5
   BSOCB6
   BSOCB7
   BSOCB8
   BSOCB9
   BSOCB10
   BSOCB11
   BSOCB12
   BSOCB13
   BSOCB14
   BSOCB15
   BSOCB16
   BSOCB17
   BSOCB18
   BSOCB19
   BSOCB20
   BSOCB21
   BSOCB22
   BSOCB23
   BSOCB24
   BSOCB25
   BSOCB26
   BSOCB27
   BSOCC1
   BSOCC2
   BSOCC3
   BSOCC4
   BSOCC5
   BSOCC6
   BSOCC7
   BSOCC8
   BSOCC9
   BSOCC10
   BSOCC11
   BSOCC12
   BSOCC13
   BSOCC14
   BSOCC15
   BSOCC16
   BSOCC17
   BSOCC18
   BSOCC19
   BSOCC20
   BSOCC21
   BSOCC22
   BSOCC23
   BSOCC24
   BSOCC25
   BSOCC26
   BSOCC27
   BSOCC28
   BSOCC29
   BSOCC30
   BSOCC31A
   BSOCC31B
   BSOCC31C
   BSOCC31D
   BSOCC31E
   BSOCC31F
   BSOCC31G
   BSOCC31H
   BSOCC31I
   BSOCC31J
   BSOCC31K
   BSOCC31L
   BSOCD1
   BSOCD2
   BSOCD3
   BSOCD4
   BSOCD5
   BSOCD6
   BSOCD7
   BSOCD8
   BSOCD9
   BSOCD10
   BSOCD11
   BSOCD12
   BSOCD13
   BSOCD14
   BSOCD15
   BSOCD16
   BSOCD17
   BSOCD18
   BSOCD19
   BSOCD20
   BSOCD21
   BSOCD22
   BSOCD23
   BSOCD24
   BSOCD25
   BSOCD26
   BSOCD27
   BSOCD28
   BSOCD29
   BSOCD30
   BSOCD31
   BSOCD32
   BSOCD33
   BSOCD34
   BSOCD35
   BSOCD36
   BSOCD37
   BSOCD38
   BSOCD39
   BSOCD40
   BSOCD41
   BSOCD42
   BSOCD43
   BSOCD44
   BSOCD45
   BSOCD46
   BSOCD47
   BSOCD48
   BSOCD49
   BSOCD50
   BSOCD51
   BSOCD52
   BSOCD53
   BSOCD54
   BSOCD55
   BSOCD56
   BSOCD57
   BSOCD58
   BSOCD59
   BSOCD60
   BSOCD61
   BSOCD62
   BSOCD63
   BSOCE1
   BSOCE2
   BSOCE3
   BSOCE4
   BSOCE5
   BSOCE6
   BSOCE7
   BSOCE8
   BSOCE9
   BSOCE10
   BSOCE11
   BSOCE12
   BSOCE13
   BSOCE14
   BSOCE15
   BSOCE16
   BSOCE17
   BSOCE18
   BSOCE19
   BSOCE20
   BSOCE21
   BSOCE22
   BSOCE23
   BSOCE24
   BSOCE25
   BSOCE26
   BSOCE27
   BSOCE28
   BSOCE29
   BSOCE30
   BSOCE19_DC
   BSOCE19_PRO
   BSOCE19_PA
   BSOCE19_J
   BSOCE19_SP
   BSOCE20_DC
   BSOCE20_PRO
   BSOCE20_PA
   BSOCE20_J
   BSOCE20_SP
   BSOCE21_DC
   BSOCE21_PRO
   BSOCE21_PA
   BSOCE21_J
   BSOCE21_SP
   BSOCE22_DC
   BSOCE22_PRO
   BSOCE22_PA
   BSOCE22_J
   BSOCE22_SP
   BSOCE23_DC
   BSOCE23_PRO
   BSOCE23_PA
   BSOCE23_J
   BSOCE23_SP
   BSOCE24_DC
   BSOCE24_PRO
   BSOCE24_PA
   BSOCE24_J
   BSOCE24_SP
   BSOCE25_DC
   BSOCE25_PRO
   BSOCE25_PA
   BSOCE25_J
   BSOCE25_SP
   BSOCE26_DC
   BSOCE26_PRO
   BSOCE26_PA
   BSOCE26_J
   BSOCE26_SP
   BSOCE27_DC
   BSOCE27_PRO
   BSOCE27_PA
   BSOCE27_J
   BSOCE27_SP
   BSOCE28_DC
   BSOCE28_PRO
   BSOCE28_PA
   BSOCE28_J
   BSOCE28_SP
   BSOCE29_DC
   BSOCE29_PRO
   BSOCE29_PA
   BSOCE29_J
   BSOCE29_SP
   BSOCE30_DC
   BSOCE30_PRO
   BSOCE30_PA
   BSOCE30_J
   BSOCE30_SP
    (nominal).

* SPSS PRINT FORMAT COMMAND.

PRINT FORMAT
   CASEID (F3)
   ID (F8)
   RESPCODE (F4)
   SITEID (F5)
   CENTER (F2)
   STUDYCOND (F1)
   STUDYCODE (F1)
   DATE (F2)
   RESPTYPE (F1)
   DEGREE (F2)
   YEAR_DEG (F2)
   ADDICTIONS_COUNSELING (F2)
   CRIMINAL_JUSTICE (F2)
   MILITARY (F2)
   OTHER_COUNSELING (F2)
   PSYCHOLOGY (F2)
   LAW_ENFORCEMENT (F2)
   EDUCATION (F2)
   SOCIAL_WORK_HUMAN_SERVICE (F2)
   MEDICINE (F2)
   VOCATIONAL_REHABILITATION (F2)
   ADMINISTRATION (F2)
   OTHER_SPECIFY (F2)
   COUNSELING_CREDENTIALS (F2)
   COUNSELING_CREDENTIALS_AL (F2)
   COUNSELING_CREDENTIALS_DR (F2)
   COUNSELING_CREDENTIALS_CO (F2)
   NATIONAL_CERTIFICATION (F2)
   NATIONAL_CERTIFICATION_NA (F2)
   NATIONAL_CERTIFICATION_IC (F2)
   LICENSURE (F2)
   JOB_LEVEL (F2)
   SUBSTANCE_ABUSE (F1)
   PROGRAM_LENGTH (F1)
   CURRENT_EMPLOYER (F1)
   CURRENT_POSITION (F1)
   REGULAR_WORK_HOURS (F2)
   CLIENT_COUNSELING (F2)
   DIRECT_CONTACT_CLIENT (F3)
   NUMBER_OF_CLIENTS_COUNSEL (F3)
   ACTIVE_CASELOAD (F3)
   NUMBER_OF_STAFF_SUPERVISE (F2)
   CURRENT_WORK_SETTING (F2)
   BSOCA1 (F2)
   BSOCA2 (F2)
   BSOCA3 (F2)
   BSOCA4 (F2)
   BSOCA5 (F2)
   BSOCA6 (F2)
   BSOCA7 (F2)
   BSOCA8 (F2)
   BSOCA9 (F2)
   BSOCA10 (F2)
   BSOCA11 (F2)
   BSOCA12 (F2)
   BSOCA13 (F2)
   BSOCA14 (F2)
   BSOCA15 (F2)
   BSOCA16 (F2)
   BSOCA17 (F2)
   BSOCA18 (F2)
   BSOCA19 (F2)
   BSOCA20 (F2)
   BSOCA21 (F2)
   BSOCA22 (F2)
   BSOCA23 (F2)
   BSOCA24 (F2)
   BSOCA25 (F2)
   BSOCA26 (F2)
   BSOCA27 (F2)
   BSOCA28 (F2)
   BSOCA29 (F2)
   BSOCA30 (F2)
   BSOCA31 (F2)
   BSOCA32 (F2)
   BSOCA33 (F2)
   BSOCB1 (F2)
   BSOCB2 (F2)
   BSOCB3 (F2)
   BSOCB4 (F2)
   BSOCB5 (F2)
   BSOCB6 (F2)
   BSOCB7 (F2)
   BSOCB8 (F2)
   BSOCB9 (F2)
   BSOCB10 (F2)
   BSOCB11 (F2)
   BSOCB12 (F2)
   BSOCB13 (F2)
   BSOCB14 (F2)
   BSOCB15 (F2)
   BSOCB16 (F2)
   BSOCB17 (F2)
   BSOCB18 (F2)
   BSOCB19 (F2)
   BSOCB20 (F2)
   BSOCB21 (F2)
   BSOCB22 (F2)
   BSOCB23 (F2)
   BSOCB24 (F2)
   BSOCB25 (F2)
   BSOCB26 (F2)
   BSOCB27 (F2)
   BSOCC1 (F2)
   BSOCC2 (F2)
   BSOCC3 (F2)
   BSOCC4 (F2)
   BSOCC5 (F2)
   BSOCC6 (F2)
   BSOCC7 (F2)
   BSOCC8 (F2)
   BSOCC9 (F2)
   BSOCC10 (F2)
   BSOCC11 (F2)
   BSOCC12 (F2)
   BSOCC13 (F2)
   BSOCC14 (F2)
   BSOCC15 (F2)
   BSOCC16 (F2)
   BSOCC17 (F2)
   BSOCC18 (F2)
   BSOCC19 (F2)
   BSOCC20 (F2)
   BSOCC21 (F2)
   BSOCC22 (F2)
   BSOCC23 (F2)
   BSOCC24 (F2)
   BSOCC25 (F2)
   BSOCC26 (F2)
   BSOCC27 (F2)
   BSOCC28 (F2)
   BSOCC29 (F2)
   BSOCC30 (F2)
   BSOCC31A (F2)
   BSOCC31B (F2)
   BSOCC31C (F2)
   BSOCC31D (F2)
   BSOCC31E (F2)
   BSOCC31F (F2)
   BSOCC31G (F2)
   BSOCC31H (F2)
   BSOCC31I (F2)
   BSOCC31J (F2)
   BSOCC31K (F2)
   BSOCC31L (F2)
   BSOCD1 (F2)
   BSOCD2 (F2)
   BSOCD3 (F2)
   BSOCD4 (F2)
   BSOCD5 (F2)
   BSOCD6 (F2)
   BSOCD7 (F2)
   BSOCD8 (F2)
   BSOCD9 (F2)
   BSOCD10 (F2)
   BSOCD11 (F2)
   BSOCD12 (F2)
   BSOCD13 (F2)
   BSOCD14 (F2)
   BSOCD15 (F2)
   BSOCD16 (F2)
   BSOCD17 (F2)
   BSOCD18 (F2)
   BSOCD19 (F2)
   BSOCD20 (F2)
   BSOCD21 (F2)
   BSOCD22 (F2)
   BSOCD23 (F2)
   BSOCD24 (F2)
   BSOCD25 (F2)
   BSOCD26 (F2)
   BSOCD27 (F2)
   BSOCD28 (F2)
   BSOCD29 (F2)
   BSOCD30 (F2)
   BSOCD31 (F2)
   BSOCD32 (F2)
   BSOCD33 (F2)
   BSOCD34 (F2)
   BSOCD35 (F2)
   BSOCD36 (F2)
   BSOCD37 (F2)
   BSOCD38 (F2)
   BSOCD39 (F2)
   BSOCD40 (F2)
   BSOCD41 (F2)
   BSOCD42 (F2)
   BSOCD43 (F2)
   BSOCD44 (F2)
   BSOCD45 (F2)
   BSOCD46 (F2)
   BSOCD47 (F2)
   BSOCD48 (F2)
   BSOCD49 (F2)
   BSOCD50 (F2)
   BSOCD51 (F2)
   BSOCD52 (F2)
   BSOCD53 (F2)
   BSOCD54 (F2)
   BSOCD55 (F2)
   BSOCD56 (F2)
   BSOCD57 (F2)
   BSOCD58 (F2)
   BSOCD59 (F2)
   BSOCD60 (F2)
   BSOCD61 (F2)
   BSOCD62 (F2)
   BSOCD63 (F2)
   BSOCE1 (F2)
   BSOCE2 (F2)
   BSOCE3 (F2)
   BSOCE4 (F2)
   BSOCE5 (F2)
   BSOCE6 (F2)
   BSOCE7 (F2)
   BSOCE8 (F2)
   BSOCE9 (F2)
   BSOCE10 (F2)
   BSOCE11 (F2)
   BSOCE12 (F2)
   BSOCE13 (F2)
   BSOCE14 (F2)
   BSOCE15 (F2)
   BSOCE16 (F2)
   BSOCE17 (F2)
   BSOCE18 (F2)
   BSOCE19 (F2)
   BSOCE20 (F2)
   BSOCE21 (F2)
   BSOCE22 (F2)
   BSOCE23 (F2)
   BSOCE24 (F2)
   BSOCE25 (F2)
   BSOCE26 (F2)
   BSOCE27 (F2)
   BSOCE28 (F2)
   BSOCE29 (F2)
   BSOCE30 (F2)
   BSOCE19_DC (F2)
   BSOCE19_PRO (F2)
   BSOCE19_PA (F2)
   BSOCE19_J (F2)
   BSOCE19_SP (F2)
   BSOCE20_DC (F2)
   BSOCE20_PRO (F2)
   BSOCE20_PA (F2)
   BSOCE20_J (F2)
   BSOCE20_SP (F2)
   BSOCE21_DC (F2)
   BSOCE21_PRO (F2)
   BSOCE21_PA (F2)
   BSOCE21_J (F2)
   BSOCE21_SP (F2)
   BSOCE22_DC (F2)
   BSOCE22_PRO (F2)
   BSOCE22_PA (F2)
   BSOCE22_J (F2)
   BSOCE22_SP (F2)
   BSOCE23_DC (F2)
   BSOCE23_PRO (F2)
   BSOCE23_PA (F2)
   BSOCE23_J (F2)
   BSOCE23_SP (F2)
   BSOCE24_DC (F2)
   BSOCE24_PRO (F2)
   BSOCE24_PA (F2)
   BSOCE24_J (F2)
   BSOCE24_SP (F2)
   BSOCE25_DC (F2)
   BSOCE25_PRO (F2)
   BSOCE25_PA (F2)
   BSOCE25_J (F2)
   BSOCE25_SP (F2)
   BSOCE26_DC (F2)
   BSOCE26_PRO (F2)
   BSOCE26_PA (F2)
   BSOCE26_J (F2)
   BSOCE26_SP (F2)
   BSOCE27_DC (F2)
   BSOCE27_PRO (F2)
   BSOCE27_PA (F2)
   BSOCE27_J (F2)
   BSOCE27_SP (F2)
   BSOCE28_DC (F2)
   BSOCE28_PRO (F2)
   BSOCE28_PA (F2)
   BSOCE28_J (F2)
   BSOCE28_SP (F2)
   BSOCE29_DC (F2)
   BSOCE29_PRO (F2)
   BSOCE29_PA (F2)
   BSOCE29_J (F2)
   BSOCE29_SP (F2)
   BSOCE30_DC (F2)
   BSOCE30_PRO (F2)
   BSOCE30_PA (F2)
   BSOCE30_J (F2)
   BSOCE30_SP (F2)
   ANPSTAFF (F5.2)
   ANPPN (F5.2)
   ANPTRAIN (F5.2)
   ANPPFC (F5.2)
   BRESTAFF (F5.2)
   BRETRAIN (F5.2)
   BREEQU (F5.2)
   BREINT (F5.2)
   BRESUP (F5.2)
   CSAGRO (F5.2)
   CSAEFF (F5.2)
   CSAINF (F5.2)
   CSAADPT (F5.2)
   CSASAT (F5.2)
   CSABEL (F5.2)
   CSACOM (F2)
   CSABEL2 (F5.2)
   DOCMIS (F5.2)
   DOCCOH (F5.2)
   DOCAUT (F5.2)
   DOCCOM (F5.2)
   DOCCOM1 (F5.2)
   DOCCOM2 (F5.2)
   DOCSTRS (F5.2)
   DOCCHNG (F5.2)
   DOCBRNT (F5.2)
   DOCSUP (F4.1)
   DOCLEAD (F5.2)
   EOTDIV (F5.2)
   EOTTOL (F5.2)
   EOTSCO (F2)
   EOTOPN (F4.1)
  .

* Create SPSS system file.

*SAVE OUTFILE="spss-filename.sav".
