/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 34988
 |            CRIMINAL JUSTICE DRUG ABUSE TREATMENT STUDIES 2:
 |         MEDICATION-ASSISTED THERAPY, 2010-2013 [UNITED STATES]
 |            (DATASET 0001: BASELINE SURVEY OF ORGANIZATIONAL
 |                CHARACTERISTICS - MERGED TS, TD, CS, CD)
 |
 |
 | SAS setup sections are provided for the ASCII version of this data
 | collection.  These sections are listed below:
 |
 | PROC FORMAT:  creates user-defined formats for the variables. Formats
 | replace original value codes with value code descriptions. Only
 | variables with user-defined formats are included in this section.
 |
 | DATA:  begins a SAS data step and names an output SAS data set.
 |
 | INFILE:  identifies the input file to be read with the input statement.
 | Users must replace the "data-filename" with a filename specifying the
 | directory on the user's computer system in which the downloaded and
 | unzipped data file is physically located (e.g.,
 | "c:\temp\34988-0001-data.txt").
 |
 | INPUT:  assigns the name, type, decimal specification (if any), and
 | specifies the beginning and ending column locations for each variable
 | in the data file.
 |
 | LABEL:  assigns descriptive labels to all variables. Variable labels
 | and variable names may be identical for some variables.
 |
 | MISSING VALUE RECODES:  sets user-defined numeric missing values to
 | missing as interpreted by the SAS system. Only variables with
 | user-defined missing values are included in this section.
 |
 | If any variables have more than one missing value, they are assigned
 | to the standard missing value of a single period (.) in the statement
 | below. To maintain the original meaning of missing codes, users may want
 | to take advantage of the SAS missing values (the letters A-Z or an
 | underscore preceded by a period).
 |
 | An example of a standard missing value recode:
 |
 |   IF (RELATION = 98 OR RELATION = 99) THEN RELATION = .; 
 |
 | The same example using special missing value recodes:
 |
 |    IF RELATION = 98 THEN RELATION = .A;
 |    IF RELATION = 99 THEN RELATION = .B;
 |
 | FORMAT:  associates the formats created by the PROC FORMAT step with
 | the variables named in the INPUT statement.
 |
 | NOTE:  Users should modify this setup file to suit their specific needs.
 | Sections for PROC FORMAT, FORMAT, and MISSING VALUE RECODES have been
 | commented out (i.e., '/*'). To include these sections in the final SAS
 | setup, users should remove the SAS comment indicators from the desired
 | section(s).
 |
 |------------------------------------------------------------------------*/

* SAS PROC FORMAT;

/*
PROC FORMAT;
VALUE csacomff  -9='(-9) Missing' -5='(-5) Not calculated for respondent type';
VALUE addictif  -9='(-9) Missing' 0='(0) Not Marked' 1='(1) Marked';
VALUE currentf  -9='(-9) Missing' 1='(1) Probation' 2='(2) Prison'
                3='(3) Prison substance abuse treatment program' 4='(4) Parole' 5='(5) TASC'
                6='(6) Community substance abuse treatment program' 7='(7) Work release center'
                8='(8) Community health clinic' 9='(9) Other (specify)';
VALUE csabelff  -9='(-9) Missing' -5='(-5) Not calculated for respondent type' other=[5.2];
VALUE anpstaff  -9='(-9) Missing' other=[5.2];
VALUE bsoce19f  -9='(-9) Blank / Not ascertained'
                -6='(-6) Not asked on respondent''s form' 1='(1) Yes' 2='(2) No';
VALUE regularf  -9='(-9) Missing' 50='(50) 50 or more';
VALUE active_f  -9='(-09) Missing' -6='(-06) Not asked on respondent''s form'
                200='(200) 200 or more';
VALUE year_def  -9='(-9) Missing' 1='(1) Before 1980' 2='(2) 1980''s' 3='(3) 1990''s'
                4='(4) 2000 or later';
VALUE job_levf  -9='(-9) Missing' 1='(1) Program Director' 2='(2) Supervisor'
                3='(3) Counselor' 4='(4) Support/Other';
VALUE studycof  1='(1) Experimental' 2='(2) Comparison' 3='(3) Both' 4='(4) Neither';
VALUE dateffff  -9='(-9) Missing' 1='(1) 2ND QTR (APR, MAY, JUN)  2010'
                2='(2) 3RD QTR (JULY, AUG, SEPT)  2010' 3='(3) 4TH QTR (OCT, NOV, DEC) 2010'
                4='(4) 1ST QTR (JAN, FEB, MAR) 2011' 5='(5) 2ND QTR (APR, MAY, JUN)  2011'
                6='(6) 3RD QTR (JULY, AUG, SEPT)  2011' 7='(7) 4TH QTR (OCT, NOV, DEC) 2011'
                8='(8) 1ST QTR (JAN, FEB, MAR) 2012';
VALUE resptypf  1='(1) Corrections Director' 2='(2) Corrections Officer'
                3='(3) Treatment Director' 4='(4) Treatment Staff';
VALUE bsocc31f  -9='(-9) Blank / Not ascertained'
                -6='(-6) Not asked on respondent''s form' 1='(1) Disagree Strongly' 2='(2) Disagree'
                3='(3) Uncertain' 4='(4) Agree' 5='(5) Agree Strongly';
VALUE direct_f  -9='(-09) Missing' -6='(-06) Not asked on respondent''s form'
                100='(100) 100 or more';
VALUE studyco_1f  1='(1) OPII' 2='(2) MATICCE' 3='(3) HIC-STIC';
VALUE degreeff  -9='(-9) Missing' 1='(1) No high school diploma or equivalent'
                2='(2) High school diploma or equivalent' 3='(3) Some college, but no degree'
                4='(4) Associate''s degree' 5='(5) Bachelor''s degree' 6='(6) Master''s degree'
                7='(7) Doctoral degree or equivalent' 8='(8) Other (specify)';
VALUE bsoca1ff  -9='(-9) Blank / Not ascertained' 1='(1) Disagree Strongly'
                2='(2) Disagree' 3='(3) Uncertain' 4='(4) Agree' 5='(5) Agree Strongly';
VALUE substanf  1='(1) Less than 5' 2='(2) 5 to 9.99' 3='(3) 10 to 19.99'
                4='(4) 20 to 29.99' 5='(5) 30 or more';
VALUE client_f  -9='(-9) Blank/Not ascertained' 1='(1) Yes' 2='(2) No';
VALUE counself  -9='(-9) Blank/Not ascertained' -6='(-6) Not asked on respondent''s form'
                1='(1) Yes' 2='(2) No';
VALUE idffffff  -9='(-9) Missing';
VALUE number_f  -9='(-9) Missing' 1='(1) Less than 10' 2='(2) 10 to 20'
                3='(3) More than 20';
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA;
INFILE "data-filename" LRECL=1215;
INPUT
        CASEID 183-185          DEGREE_SPECIFY_OTHER $1-26 DISCIPLINE $27-52
        DISCIPLINE_OTHER $53-78 STATE_CREDENTIALS_SPECIFY $79-104 NATIONAL_CERTIFICATION_OT $105-130
        LICENSURE_SPECIFY $131-156 CURRENT_WORK_SETTING_SPEC $157-182 ID 186-193
        RESPCODE 194-197        SITEID 198-202          CENTER 203-204
        STUDYCOND 205           STUDYCODE 206           DATE 207-208
        RESPTYPE 209            DEGREE 210-211          YEAR_DEG 212-213
        ADDICTIONS_COUNSELING 214-215 CRIMINAL_JUSTICE 216-217 MILITARY 218-219
        OTHER_COUNSELING 220-221 PSYCHOLOGY 222-223      LAW_ENFORCEMENT 224-225
        EDUCATION 226-227       SOCIAL_WORK_HUMAN_SERVICE 228-229 MEDICINE 230-231
        VOCATIONAL_REHABILITATION 232-233 ADMINISTRATION 234-235  OTHER_SPECIFY 236-237
        COUNSELING_CREDENTIALS 238-239 COUNSELING_CREDENTIALS_AL 240-241 COUNSELING_CREDENTIALS_DR 242-243
        COUNSELING_CREDENTIALS_CO 244-245 NATIONAL_CERTIFICATION 246-247 NATIONAL_CERTIFICATION_NA 248-249
        NATIONAL_CERTIFICATION_IC 250-251 LICENSURE 252-253       JOB_LEVEL 254-255
        SUBSTANCE_ABUSE 256     PROGRAM_LENGTH 257      CURRENT_EMPLOYER 258
        CURRENT_POSITION 259    REGULAR_WORK_HOURS 260-261 CLIENT_COUNSELING 262-263
        DIRECT_CONTACT_CLIENT 264-266 NUMBER_OF_CLIENTS_COUNSEL 267-269 ACTIVE_CASELOAD 270-272
        NUMBER_OF_STAFF_SUPERVISE 273-274 CURRENT_WORK_SETTING 275-276 BSOCA1 277-278
        BSOCA2 279-280          BSOCA3 281-282          BSOCA4 283-284
        BSOCA5 285-286          BSOCA6 287-288          BSOCA7 289-290
        BSOCA8 291-292          BSOCA9 293-294          BSOCA10 295-296
        BSOCA11 297-298         BSOCA12 299-300         BSOCA13 301-302
        BSOCA14 303-304         BSOCA15 305-306         BSOCA16 307-308
        BSOCA17 309-310         BSOCA18 311-312         BSOCA19 313-314
        BSOCA20 315-316         BSOCA21 317-318         BSOCA22 319-320
        BSOCA23 321-322         BSOCA24 323-324         BSOCA25 325-326
        BSOCA26 327-328         BSOCA27 329-330         BSOCA28 331-332
        BSOCA29 333-334         BSOCA30 335-336         BSOCA31 337-338
        BSOCA32 339-340         BSOCA33 341-342         BSOCB1 343-344
        BSOCB2 345-346          BSOCB3 347-348          BSOCB4 349-350
        BSOCB5 351-352          BSOCB6 353-354          BSOCB7 355-356
        BSOCB8 357-358          BSOCB9 359-360          BSOCB10 361-362
        BSOCB11 363-364         BSOCB12 365-366         BSOCB13 367-368
        BSOCB14 369-370         BSOCB15 371-372         BSOCB16 373-374
        BSOCB17 375-376         BSOCB18 377-378         BSOCB19 379-380
        BSOCB20 381-382         BSOCB21 383-384         BSOCB22 385-386
        BSOCB23 387-388         BSOCB24 389-390         BSOCB25 391-392
        BSOCB26 393-394         BSOCB27 395-396         BSOCC1 397-398
        BSOCC2 399-400          BSOCC3 401-402          BSOCC4 403-404
        BSOCC5 405-406          BSOCC6 407-408          BSOCC7 409-410
        BSOCC8 411-412          BSOCC9 413-414          BSOCC10 415-416
        BSOCC11 417-418         BSOCC12 419-420         BSOCC13 421-422
        BSOCC14 423-424         BSOCC15 425-426         BSOCC16 427-428
        BSOCC17 429-430         BSOCC18 431-432         BSOCC19 433-434
        BSOCC20 435-436         BSOCC21 437-438         BSOCC22 439-440
        BSOCC23 441-442         BSOCC24 443-444         BSOCC25 445-446
        BSOCC26 447-448         BSOCC27 449-450         BSOCC28 451-452
        BSOCC29 453-454         BSOCC30 455-456         BSOCC31A 457-458
        BSOCC31B 459-460        BSOCC31C 461-462        BSOCC31D 463-464
        BSOCC31E 465-466        BSOCC31F 467-468        BSOCC31G 469-470
        BSOCC31H 471-472        BSOCC31I 473-474        BSOCC31J 475-476
        BSOCC31K 477-478        BSOCC31L 479-480        BSOCD1 481-482
        BSOCD2 483-484          BSOCD3 485-486          BSOCD4 487-488
        BSOCD5 489-490          BSOCD6 491-492          BSOCD7 493-494
        BSOCD8 495-496          BSOCD9 497-498          BSOCD10 499-500
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
        BSOCD62 603-604         BSOCD63 605-606         BSOCE1 607-608
        BSOCE2 609-610          BSOCE3 611-612          BSOCE4 613-614
        BSOCE5 615-616          BSOCE6 617-618          BSOCE7 619-620
        BSOCE8 621-622          BSOCE9 623-624          BSOCE10 625-626
        BSOCE11 627-628         BSOCE12 629-630         BSOCE13 631-632
        BSOCE14 633-634         BSOCE15 635-636         BSOCE16 637-638
        BSOCE17 639-640         BSOCE18 641-642         BSOCE19 643-644
        BSOCE20 645-646         BSOCE21 647-648         BSOCE22 649-650
        BSOCE23 651-652         BSOCE24 653-654         BSOCE25 655-656
        BSOCE26 657-658         BSOCE27 659-660         BSOCE28 661-662
        BSOCE29 663-664         BSOCE30 665-666         BSOCE19_DC 667-668
        BSOCE19_PRO 669-670     BSOCE19_PA 671-672      BSOCE19_J 673-674
        BSOCE19_SP 675-676      BSOCE20_DC 677-678      BSOCE20_PRO 679-680
        BSOCE20_PA 681-682      BSOCE20_J 683-684       BSOCE20_SP 685-686
        BSOCE21_DC 687-688      BSOCE21_PRO 689-690     BSOCE21_PA 691-692
        BSOCE21_J 693-694       BSOCE21_SP 695-696      BSOCE22_DC 697-698
        BSOCE22_PRO 699-700     BSOCE22_PA 701-702      BSOCE22_J 703-704
        BSOCE22_SP 705-706      BSOCE23_DC 707-708      BSOCE23_PRO 709-710
        BSOCE23_PA 711-712      BSOCE23_J 713-714       BSOCE23_SP 715-716
        BSOCE24_DC 717-718      BSOCE24_PRO 719-720     BSOCE24_PA 721-722
        BSOCE24_J 723-724       BSOCE24_SP 725-726      BSOCE25_DC 727-728
        BSOCE25_PRO 729-730     BSOCE25_PA 731-732      BSOCE25_J 733-734
        BSOCE25_SP 735-736      BSOCE26_DC 737-738      BSOCE26_PRO 739-740
        BSOCE26_PA 741-742      BSOCE26_J 743-744       BSOCE26_SP 745-746
        BSOCE27_DC 747-748      BSOCE27_PRO 749-750     BSOCE27_PA 751-752
        BSOCE27_J 753-754       BSOCE27_SP 755-756      BSOCE28_DC 757-758
        BSOCE28_PRO 759-760     BSOCE28_PA 761-762      BSOCE28_J 763-764
        BSOCE28_SP 765-766      BSOCE29_DC 767-768      BSOCE29_PRO 769-770
        BSOCE29_PA 771-772      BSOCE29_J 773-774       BSOCE29_SP 775-776
        BSOCE30_DC 777-778      BSOCE30_PRO 779-780     BSOCE30_PA 781-782
        BSOCE30_J 783-784       BSOCE30_SP 785-786      ANPSTAFF 787-801 .12
        ANPPN 802-816 .12       ANPTRAIN 817-831 .12    ANPPFC 832-846 .12
        BRESTAFF 847-861 .12    BRETRAIN 862-876 .12    BREEQU 877-891 .12
        BREINT 892-906 .12      BRESUP 907-921 .12      CSAGRO 922-936 .12
        CSAEFF 937-951 .12      CSAINF 952-966 .12      CSAADPT 967-981 .12
        CSASAT 982-996 .12      CSABEL 997-1011 .12     CSACOM 1012-1013
        CSABEL2 1014-1028 .12   DOCMIS 1029-1040 .9     DOCCOH 1041-1055 .12
        DOCAUT 1056-1070 .12    DOCCOM 1071-1085 .12    DOCCOM1 1086-1100 .12
        DOCCOM2 1101-1115 .12   DOCSTRS 1116-1130 .12   DOCCHNG 1131-1145 .12
        DOCBRNT 1146-1160 .12   DOCSUP 1161-1164 .1     DOCLEAD 1165-1179 .12
        EOTDIV 1180-1194 .12    EOTTOL 1195-1209 .12    EOTSCO 1210-1211
        EOTOPN 1212-1215 .1     ;


* SAS LABEL STATEMENT;

LABEL 
   CASEID  = 'Case identification number' 
   DEGREE_SPECIFY_OTHER= 'Degree other' 
   DISCIPLINE= 'Discipline' 
   DISCIPLINE_OTHER= 'Discipline: Other' 
   STATE_CREDENTIALS_SPECIFY= 'State substance abuse counseling credentials (Not in CD)' 
   NATIONAL_CERTIFICATION_OT= 'National certification Other (Not in CD)' 
   LICENSURE_SPECIFY= 'Licensure: Specify (Not in CD)' 
   CURRENT_WORK_SETTING_SPEC= 'Current work setting specify' 
   ID      = 'Subject Identifier' 
   RESPCODE= 'Respondent Code' 
   SITEID  = 'Site ID' 
   CENTER  = 'Research Center' 
   STUDYCOND= 'Study Condition' 
   STUDYCODE= 'Study Code' 
   DATE    = 'Survey date' 
   RESPTYPE= 'Respondent role' 
   DEGREE  = 'Degree' 
   YEAR_DEG= 'Degree year' 
   ADDICTIONS_COUNSELING= 'Discipline: Addictions Counseling' 
   CRIMINAL_JUSTICE= 'Discipline: Criminal Justice' 
   MILITARY= 'Discipline: Military' 
   OTHER_COUNSELING= 'Discipline: Other Counseling' 
   PSYCHOLOGY= 'Discipline: Psychology' 
   LAW_ENFORCEMENT= 'Discipline: Law Enforcement' 
   EDUCATION= 'Discipline: Education' 
   SOCIAL_WORK_HUMAN_SERVICE= 'Discipline: Social Work Human Service' 
   MEDICINE= 'Discipline: Medicine' 
   VOCATIONAL_REHABILITATION= 'Discipline: Vocational Rehabilitation' 
   ADMINISTRATION= 'Discipline: Administration' 
   OTHER_SPECIFY= 'Discipline: Other specify' 
   COUNSELING_CREDENTIALS= 'Counseling credentials (Not in CD)' 
   COUNSELING_CREDENTIALS_AL= 'Counseling credentials: Alcohol (Not in CD)' 
   COUNSELING_CREDENTIALS_DR= 'Counseling credentials: Drugs (Not in CD)' 
   COUNSELING_CREDENTIALS_CO= 'Counseling credentials: Alcohol and drugs (Not in CD)' 
   NATIONAL_CERTIFICATION= 'National certification (Not in CD)' 
   NATIONAL_CERTIFICATION_NA= 'National certification: NAADAC National Certified Addiction Counselor Level 1, 2, or Master (Not in 
CD)' 
   NATIONAL_CERTIFICATION_IC= 'National certification: ICRC Certified Alcohol and Drug Abuse Counselor (Not in CD)' 
   LICENSURE= 'Licensure (Not in CD)' 
   JOB_LEVEL= 'Job Level' 
   SUBSTANCE_ABUSE= 'Substance abuse years' 
   PROGRAM_LENGTH= 'Unit/Program years' 
   CURRENT_EMPLOYER= 'Current employer years' 
   CURRENT_POSITION= 'Current position year' 
   REGULAR_WORK_HOURS= 'Regular work hours' 
   CLIENT_COUNSELING= 'Client supervision' 
   DIRECT_CONTACT_CLIENT= 'Direct contact client hours (Not in CD)' 
   NUMBER_OF_CLIENTS_COUNSEL= 'Number of clients counsel (Not in CD)' 
   ACTIVE_CASELOAD= 'Active caseload (Not in CD)' 
   NUMBER_OF_STAFF_SUPERVISE= 'Number of staff supervise' 
   CURRENT_WORK_SETTING= 'Current work setting' 
   BSOCA1  = 'Need guidance: Assessing client needs.' 
   BSOCA2  = 'Need guidance:  Using assessments to guide care' 
   BSOCA3  = 'Need guidance: Using assessments to document improvements' 
   BSOCA4  = 'Need guidance: Matching client needs with services' 
   BSOCA5  = 'Need guidance: Increasing program participation by clients' 
   BSOCA6  = 'Need guidance: Improving rapport with clients.' 
   BSOCA7  = 'Need guidance: Improving client thinking and problem solving skills.' 
   BSOCA8  = 'Need guidance: Improving behavioral management of clients' 
   BSOCA9  = 'Need guidance: Improving cognitive focus on clients during group counseling' 
   BSOCA10 = 'Need guidance: Identifying and using evidence-based  practices' 
   BSOCA11 = 'Organization needs guidance: Defining its mission' 
   BSOCA12 = 'Organization needs guidance: Setting specific goals for improving services' 
   BSOCA13 = 'Organization needs guidance: Assigning or clarifying staff roles' 
   BSOCA14 = 'Organization needs guidance: Establishing accurate job descriptions for staff' 
   BSOCA15 = 'Organization needs guidance: Evaluating staff performance' 
   BSOCA16 = 'Organization needs guidance: Improving relations among staff' 
   BSOCA17 = 'Organization needs guidance: Improving communications among staff' 
   BSOCA18 = 'Organization needs guidance: Improving record keeping and information systems' 
   BSOCA19 = 'Organization needs guidance: Improving funding for contracted services' 
   BSOCA20 = 'Need training: Basic computer skills/programs' 
   BSOCA21 = 'Need training: Specialized computer applications  (e.g., data systems)' 
   BSOCA22 = 'Need training: New methods/developments in their areas of responsibility' 
   BSOCA23 = 'Need training: New equipment or procedures being used or planned' 
   BSOCA24 = 'Need training: Obtaining certifications or promotions' 
   BSOCA25 = 'Need training:  New laws or regulations you need to  know about' 
   BSOCA26 = 'Need training: Management or supervisory responsibilities' 
   BSOCA27 = 'Pressure to Change: Offenders being served' 
   BSOCA28 = 'Pressure to Change: Other staff members' 
   BSOCA29 = 'Pressure to Change: Program  supervisors or managers' 
   BSOCA30 = 'Pressure to Change: Governmental policy makers' 
   BSOCA31 = 'Pressure to Change: Community groups' 
   BSOCA32 = 'Pressure to Change: Government funding bodies' 
   BSOCA33 = 'Pressure to Change: Accreditation or licensing authorities' 
   BSOCB1  = 'Good management team' 
   BSOCB2  = 'Staff turnover problem' 
   BSOCB3  = 'Staff training and continuing education are priorities' 
   BSOCB4  = 'Staff capable' 
   BSOCB5  = 'Policies limit staff use of internet for work needs' 
   BSOCB6  = 'Staff  learned new skills or techniques in past year' 
   BSOCB7  = 'Computer problems are usually repaired promptly at your program' 
   BSOCB8  = 'Much time and attention are given to  staff supervision when needed' 
   BSOCB9  = 'Convenient access to e-mail at work' 
   BSOCB10 = 'Spend time needed with clients' 
   BSOCB11 = 'Equiptment outdated' 
   BSOCB12 = 'Decisions well planned' 
   BSOCB13 = 'Computers are needed for staff' 
   BSOCB14 = 'Client records computerized' 
   BSOCB15 = 'Staff have skills needed' 
   BSOCB16 = 'Regular in service meetings' 
   BSOCB17 = 'Enough staff to meant client needs' 
   BSOCB18 = 'Staff well-trained' 
   BSOCB19 = 'Staff used internet recently to access treatment informtaion' 
   BSOCB20 = 'Confidence in decision making' 
   BSOCB21 = 'Easy access to internet at work' 
   BSOCB22 = 'Computers in personal work space' 
   BSOCB23 = 'Frequent meetings about client progress' 
   BSOCB24 = 'Larger support staff needed' 
   BSOCB25 = 'Budget for professional training' 
   BSOCB26 = 'Staff comfortable with computers' 
   BSOCB27 = 'Staff concerns ignored' 
   BSOCC1  = 'Skills for effective counseling' 
   BSOCC2  = 'Staff asks advice' 
   BSOCC3  = 'Satisfied with job' 
   BSOCC4  = 'Easy to learn new procedures' 
   BSOCC5  = 'Experienced source of advice' 
   BSOCC6  = 'Feel appreciated for job' 
   BSOCC7  = 'Professional growth encouraged' 
   BSOCC8  = 'Confident in doing your job' 
   BSOCC9  = 'Adapt quickly' 
   BSOCC10 = 'Skills up to date' 
   BSOCC11 = 'High value to work you do' 
   BSOCC12 = 'Influence staff decisions' 
   BSOCC13 = 'Accomplish goals' 
   BSOCC14 = 'Regularly improve skills' 
   BSOCC15 = 'Read professional literature' 
   BSOCC16 = 'Review new techniques and treatment' 
   BSOCC17 = 'Staff ask your opinion' 
   BSOCC18 = 'Willing to try new ideas' 
   BSOCC19 = 'Skills to work with community leaders' 
   BSOCC20 = 'Share knowledge with others' 
   BSOCC21 = 'Too slow to make change' 
   BSOCC22 = 'Proud of where you work' 
   BSOCC23 = 'Like working with people' 
   BSOCC24 = 'Strong leader' 
   BSOCC25 = 'Plan ahead and follow through' 
   BSOCC26 = 'Want a new job' 
   BSOCC27 = 'See the importance of substance abuse treatment' 
   BSOCC28 = 'Respect treatments staff''s work' 
   BSOCC29 = 'Minimize interference with treatment staff' 
   BSOCC30 = 'Too much reliance on computerized scoring' 
   BSOCC31A= 'Best way to reduce crime: Punish drug users (CD/CO only)' 
   BSOCC31B= 'Best way to reduce crime: Effective treatment (CD/CO only)' 
   BSOCC31C= 'Best way to reduce crime: Keep offenders in jail (CD/CO only)' 
   BSOCC31D= 'Best way to reduce crime: Eye for eye (CD/CO only)' 
   BSOCC31E= 'Best way to reduce crime: Deterrence (CD/CO only)' 
   BSOCC31F= 'Best way to reduce crime: Address problems (CD/CO only)' 
   BSOCC31G= 'Best way to reduce crime: Match treatment to needs (CD/CO only)' 
   BSOCC31H= 'Best way to reduce crime: Jail offenders (CD/CO only)' 
   BSOCC31I= 'Best way to reduce crime: Provide more treatment, jobs, and educational programs (CD/CO only)' 
   BSOCC31J= 'Best way to reduce crime: Jail drug users (CD/CO only)' 
   BSOCC31K= 'Best way to reduce crime: Punish addicts (CD/CO only)' 
   BSOCC31L= 'Best way to reduce crime: Deter future offenders by severely punishing drug users (CD/CO only)' 
   BSOCD1  = 'Staff confused about goals' 
   BSOCD2  = 'Workload reduces effectiveness' 
   BSOCD3  = 'Talking to offenders/clients & supervisors a waste of time' 
   BSOCD4  = 'Hear good ideas from staff' 
   BSOCD5  = 'Supervisors revise case plans' 
   BSOCD6  = 'Unit accepts new technology' 
   BSOCD7  = 'Need more open discussions' 
   BSOCD8  = 'Feel depressed' 
   BSOCD9  = 'Staff ideas given fair consideration' 
   BSOCD10 = 'Staff work as team' 
   BSOCD11 = 'Duties relate to unit/program goals' 
   BSOCD12 = 'Too many pressures to work effectively' 
   BSOCD13 = 'Overwhelmed by paperwork' 
   BSOCD14 = 'Staff have broad discretion' 
   BSOCD15 = 'Staff well informed' 
   BSOCD16 = 'Novel treatment ideas discouraged' 
   BSOCD17 = 'Feel tired' 
   BSOCD18 = 'Strong mutual trust/ cooperation among staff' 
   BSOCD19 = 'Clear goals/objectives' 
   BSOCD20 = 'Staff show high stress' 
   BSOCD21 = 'Easy to change procedures' 
   BSOCD22 = 'Staff try different techniques' 
   BSOCD23 = 'Not making a difference' 
   BSOCD24 = 'Staff get along well' 
   BSOCD25 = 'Too many rules' 
   BSOCD26 = 'Staff help each other' 
   BSOCD27 = 'Its an effort to come to work' 
   BSOCD28 = 'Unit communication channels work well' 
   BSOCD29 = 'Friction among staff' 
   BSOCD30 = 'Staff understand goals fit in to system' 
   BSOCD31 = 'Feel disillusioned and resentful' 
   BSOCD32 = 'Some staff do not do fair share' 
   BSOCD33 = 'Trust professional judgment of staff' 
   BSOCD34 = 'Staff free to ask questions' 
   BSOCD35 = 'Staff frustration common' 
   BSOCD36 = 'Clear plan for unit' 
   BSOCD37 = 'Encourage staff to try new techniques' 
   BSOCD38 = 'Staff have skills to work in teams' 
   BSOCD39 = 'No rewards for good job' 
   BSOCD40 = 'Support staff work' 
   BSOCD41 = 'Review staff progress in making change' 
   BSOCD42 = 'Unit success w/ offenders is a high priority' 
   BSOCD43 = 'Staff discuss differences' 
   BSOCD44 = 'Disagreements resolved fairly' 
   BSOCD45 = 'Staff seek out opinions' 
   BSOCD46 = 'Most viewpoints considered' 
   BSOCD47 = 'Staff not afraid to disagree' 
   BSOCD48 = 'Staff learn from other staff''s opinions' 
   BSOCD49 = 'Ask staff about client supervision issues' 
   BSOCD50 = 'Ask Staff about unit policies' 
   BSOCD51 = 'Ask staff about supervision issues' 
   BSOCD52 = 'Ask staff about unit policies' 
   BSOCD53 = 'Open to new methods' 
   BSOCD54 = 'Open to issues of cultural diversity' 
   BSOCD55 = 'As leader: Inspire others' 
   BSOCD56 = 'As a leader: Lead by example' 
   BSOCD57 = 'As leader: Get people to work together' 
   BSOCD58 = 'As leader: Insist on best performance' 
   BSOCD59 = 'As leader: Treat staff as individuals' 
   BSOCD60 = 'As leader: Encourage new ways' 
   BSOCD61 = 'As leader: Give recognition' 
   BSOCD62 = 'As leader: Define goals and objectives' 
   BSOCD63 = 'As leader: Innovate before other managers' 
   BSOCE1  = 'Know better than researchers how to supervise clients' 
   BSOCE2  = 'Research-based interventions are not useful' 
   BSOCE3  = 'Experience more important than manuals' 
   BSOCE4  = 'Would not support intervention w/ instructions/guidelines' 
   BSOCE5  = 'Right way and wrong way to do almost everything' 
   BSOCE6  = 'Every problem has solution' 
   BSOCE7  = 'Clear distinction between right and wrong' 
   BSOCE8  = 'Stick to basic rules' 
   BSOCE9  = 'Prefer uncertainties of psychiatry' 
   BSOCE10 = 'Vague pictures have little appeal' 
   BSOCE11 = 'Before exam, like to know how many questions' 
   BSOCE12 = 'Best part of jigsaw puzzle is putting in last piece' 
   BSOCE13 = 'Do not like to work on problems w/o answer' 
   BSOCE14 = 'Like to try new ideas, even when waste of time' 
   BSOCE15 = 'Support new supervision services to help clients (CD/TD only)' 
   BSOCE16 = 'Support new services even w/ manual (CD/TD only)' 
   BSOCE17 = 'Support services developed by researchers (CD/TD only)' 
   BSOCE18 = 'Support very different new services (CD/TD only)' 
   BSOCE19 = 'Written protocol for sharing client info (CD, CO only)' 
   BSOCE20 = 'Share operational oversight of treatment programs (CD, CO only)' 
   BSOCE21 = 'Cross train staff on substance abuse issues (CD, CO only)' 
   BSOCE22 = 'Written agreements provide space for substance abuse services (CD, CO only)' 
   BSOCE23 = 'Joint staffing, case reporting (CD, CO only)' 
   BSOCE24 = 'Coordinate policies, procedures (CD, CO only)' 
   BSOCE25 = 'Agreed to similar requirements for substance abuse service eligibility (CD, CO only)' 
   BSOCE26 = 'Share budgetary oversight of substance abuse services (CD, CO only)' 
   BSOCE27 = 'Pooled funding for offender substance abuse services (CD, CO only)' 
   BSOCE28 = 'Joint policy and procedure manuals (CD, CO only)' 
   BSOCE29 = 'Share info on offender treatment needs (CD, CO only)' 
   BSOCE30 = 'Hold joint staff meetings (CD, CO only)' 
   BSOCE19_DC= 'Drug court: Written protocol for sharing client info (TD/TS only)' 
   BSOCE19_PRO= 'Probation: Written protocol for sharing client info (TD/TS only)' 
   BSOCE19_PA= 'Parole: Written protocol for sharing client info (TD/TS only)' 
   BSOCE19_J= 'Jail: Written protocol for sharing client info (TD/TS only)' 
   BSOCE19_SP= 'State prison: Written protocol for sharing client info (TD/TS only)' 
   BSOCE20_DC= 'Drug court: Share operational oversight of treatment programs (TD/TS only)' 
   BSOCE20_PRO= 'Probation: Share operational oversight of treatment programs (TD/TS only)' 
   BSOCE20_PA= 'Parole: Share operational oversight of treatment programs (TD/TS only)' 
   BSOCE20_J= 'Jail: Share operational oversight of treatment programs (TD/TS only)' 
   BSOCE20_SP= 'State prison: Share operational oversight of treatment programs (TD/TS only)' 
   BSOCE21_DC= 'Drug court: Cross train staff on substance abuse issues (TD/TS only)' 
   BSOCE21_PRO= 'Probation: Cross train staff on substance abuse issues (TD/TS only)' 
   BSOCE21_PA= 'Parole: Cross train staff on substance abuse issues (TD/TS only)' 
   BSOCE21_J= 'Jail: Cross train staff on substance abuse issues (TD/TS only)' 
   BSOCE21_SP= 'State prison: Cross train staff on substance abuse issues (TD/TS only)' 
   BSOCE22_DC= 'Drug court: Written agreements provide space for substance abuse services (TD/TS only)' 
   BSOCE22_PRO= 'Probation: Written agreements provide space for substance abuse services (TD/TS only)' 
   BSOCE22_PA= 'Parole: Written agreements provide space for substance abuse services (TD/TS only)' 
   BSOCE22_J= 'Jail: Written agreements provide space for substance abuse services (TD/TS only)' 
   BSOCE22_SP= 'State prison: Written agreements provide space for substance abuse services (TD/TS only)' 
   BSOCE23_DC= 'Drug court: Joint staffing, case reporting (TD/TS only)' 
   BSOCE23_PRO= 'Probation: Joint staffing, case reporting (TD/TS only)' 
   BSOCE23_PA= 'Parole: Joint staffing, case reporting (TD/TS only)' 
   BSOCE23_J= 'Jail: Joint staffing, case reporting (TD/TS only)' 
   BSOCE23_SP= 'State prison: Joint staffing, case reporting (TD/TS only)' 
   BSOCE24_DC= 'Drug court: Coordinate policies, procedures (TD/TS only)' 
   BSOCE24_PRO= 'Probation: Coordinate policies, procedures (TD/TS only)' 
   BSOCE24_PA= 'Parole: Coordinate policies, procedures (TD/TS only)' 
   BSOCE24_J= 'Jail: Coordinate policies, procedures (TD/TS only)' 
   BSOCE24_SP= 'State prison: Coordinate policies, procedures (TD/TS only)' 
   BSOCE25_DC= 'Drug court: Agreed to similar requirements for substance abuse service eligibility (TD/TS only)' 
   BSOCE25_PRO= 'Probation: Agreed to similar requirements for substance abuse service eligibility (TD/TS only)' 
   BSOCE25_PA= 'Parole: Agreed to similar requirements for substance abuse service eligibility (TD/TS only)' 
   BSOCE25_J= 'Jail: Agreed to similar requirements for substance abuse service eligibility (TD/TS only)' 
   BSOCE25_SP= 'State prison: Agreed to similar requirements for substance abuse service eligibility (TD/TS only)' 
   BSOCE26_DC= 'Drug court: Share budgetary oversight of program (TD/TS only)' 
   BSOCE26_PRO= 'Probation: Share budgetary oversight of program (TD/TS only)' 
   BSOCE26_PA= 'Parole: Share budgetary oversight of program (TD/TS only)' 
   BSOCE26_J= 'Jail: Share budgetary oversight of program (TD/TS only)' 
   BSOCE26_SP= 'State prison: Share budgetary oversight of program (TD/TS only)' 
   BSOCE27_DC= 'Drug court: Pooled funding for offender substance abuse services (TD/TS only)' 
   BSOCE27_PRO= 'Probation: Pooled funding for offender substance abuse services (TD/TS only)' 
   BSOCE27_PA= 'Parole: Pooled funding for offender substance abuse services (TD/TS only)' 
   BSOCE27_J= 'Jail: Pooled funding for offender substance abuse services (TD/TS only)' 
   BSOCE27_SP= 'State prison: Pooled funding for offender substance abuse services (TD/TS only)' 
   BSOCE28_DC= 'Drug court: Developed joint policy and procedure manuals (TD/TS only)' 
   BSOCE28_PRO= 'Probation:  Developed joint policy and procedure manuals (TD/TS only)' 
   BSOCE28_PA= 'Parole:  Developed joint policy and procedure manuals (TD/TS only)' 
   BSOCE28_J= 'Jail:  Developed joint policy and procedure manuals (TD/TS only)' 
   BSOCE28_SP= 'State prison:  Developed joint policy and procedure manuals (TD/TS only)' 
   BSOCE29_DC= 'Drug court: Share info on offender treatment needs (TD/TS only)' 
   BSOCE29_PRO= 'Probation: Share info on offender treatment needs (TD/TS only)' 
   BSOCE29_PA= 'Parole: Share info on offender treatment needs (TD/TS only)' 
   BSOCE29_J= 'Jail: Share info on offender treatment needs (TD/TS only)' 
   BSOCE29_SP= 'State prison: Share info on offender treatment needs (TD/TS only)' 
   BSOCE30_DC= 'Drug court: Hold joint staff meetings (TD/TS only)' 
   BSOCE30_PRO= 'Probation: Hold joint staff meetings (TD/TS only)' 
   BSOCE30_PA= 'Parole: Hold joint staff meetings (TD/TS only)' 
   BSOCE30_J= 'Jail: Hold joint staff meetings (TD/TS only)' 
   BSOCE30_SP= 'State prison: Hold joint staff meetings (TD/TS only)' 
   ANPSTAFF= 'Staff Needs subscale (TCU), section A' 
   ANPPN   = 'Program Needs subscale, section A' 
   ANPTRAIN= 'Training Needs subscale (TCU), section A' 
   ANPPFC  = 'Pressure for Change subscale (TCU), section A' 
   BRESTAFF= 'Staffing Readiness subscale (TCU), section B' 
   BRETRAIN= 'Training Readiness subscale (TCU), section B' 
   BREEQU  = 'Equipment Readiness subscale (TCU), section B' 
   BREINT  = 'Internet Readiness subscale (TCU), section B' 
   BRESUP  = 'Supervision Subscale (TCU), section B' 
   CSAGRO  = 'Growth Subscale (TCU), section C' 
   CSAEFF  = 'Efficacy Subscale (TCU), section C' 
   CSAINF  = 'Influence Subscale (TCU), section C' 
   CSAADPT = 'Adaptability Subscale (TCU), section C' 
   CSASAT  = 'Staff Satisfaction Subscale (TCU), section C' 
   CSABEL  = 'Rehabilitation Subscale (TCU), section C' 
   CSACOM  = 'Reliance on Computers Scale' 
   CSABEL2 = 'Belief in Rehabilitation2 Scale' 
   DOCMIS  = 'Mission Subscale (TCU), section D' 
   DOCCOH  = 'Staff Cohesion Subscale (TCU), section D' 
   DOCAUT  = 'Autonomy Subscale (TCU), section D' 
   DOCCOM  = 'Communication Scale' 
   DOCCOM1 = 'Communication Scale 1' 
   DOCCOM2 = 'Communication Scale 2' 
   DOCSTRS = 'Staff Stress Subscale (TCU), section D' 
   DOCCHNG = 'Change sub-scale, section D' 
   DOCBRNT = 'Staff Burnout Subscale (TCU), section D' 
   DOCSUP  = 'Organizational Support Subscale (RAND), section D' 
   DOCLEAD = 'Leadership sub-scale, section D' 
   EOTDIV  = 'Divergence sub-scale, section E' 
   EOTTOL  = 'Tolerance for ambiguity, section E' 
   EOTSCO  = 'Service Coordination' 
   EOTOPN  = 'Openness' 
        ; 


* USER-DEFINED MISSING VALUES RECODE TO SAS SYSMIS;

/*
   IF (ID = -9) THEN ID = .;
   IF (RESPCODE = -9) THEN RESPCODE = .;
   IF (SITEID = -9) THEN SITEID = .;
   IF (DATE = -9) THEN DATE = .;
   IF (DEGREE = -9) THEN DEGREE = .;
   IF (YEAR_DEG = -9) THEN YEAR_DEG = .;
   IF (ADDICTIONS_COUNSELING = -9) THEN ADDICTIONS_COUNSELING = .;
   IF (CRIMINAL_JUSTICE = -9) THEN CRIMINAL_JUSTICE = .;
   IF (MILITARY = -9) THEN MILITARY = .;
   IF (OTHER_COUNSELING = -9) THEN OTHER_COUNSELING = .;
   IF (PSYCHOLOGY = -9) THEN PSYCHOLOGY = .;
   IF (LAW_ENFORCEMENT = -9) THEN LAW_ENFORCEMENT = .;
   IF (EDUCATION = -9) THEN EDUCATION = .;
   IF (SOCIAL_WORK_HUMAN_SERVICE = -9) THEN SOCIAL_WORK_HUMAN_SERVICE = .;
   IF (MEDICINE = -9) THEN MEDICINE = .;
   IF (VOCATIONAL_REHABILITATION = -9) THEN VOCATIONAL_REHABILITATION = .;
   IF (ADMINISTRATION = -9) THEN ADMINISTRATION = .;
   IF (OTHER_SPECIFY = -9) THEN OTHER_SPECIFY = .;
   IF (COUNSELING_CREDENTIALS = -6 OR COUNSELING_CREDENTIALS = -9) THEN COUNSELING_CREDENTIALS = .;
   IF (COUNSELING_CREDENTIALS_AL = -6 OR COUNSELING_CREDENTIALS_AL = -9) THEN COUNSELING_CREDENTIALS_AL = .;
   IF (COUNSELING_CREDENTIALS_DR = -6 OR COUNSELING_CREDENTIALS_DR = -9) THEN COUNSELING_CREDENTIALS_DR = .;
   IF (COUNSELING_CREDENTIALS_CO = -6 OR COUNSELING_CREDENTIALS_CO = -9) THEN COUNSELING_CREDENTIALS_CO = .;
   IF (NATIONAL_CERTIFICATION = -6 OR NATIONAL_CERTIFICATION = -9) THEN NATIONAL_CERTIFICATION = .;
   IF (NATIONAL_CERTIFICATION_NA = -6 OR NATIONAL_CERTIFICATION_NA = -9) THEN NATIONAL_CERTIFICATION_NA = .;
   IF (NATIONAL_CERTIFICATION_IC = -6 OR NATIONAL_CERTIFICATION_IC = -9) THEN NATIONAL_CERTIFICATION_IC = .;
   IF (LICENSURE = -6 OR LICENSURE = -9) THEN LICENSURE = .;
   IF (JOB_LEVEL = -9) THEN JOB_LEVEL = .;
   IF (REGULAR_WORK_HOURS = -9) THEN REGULAR_WORK_HOURS = .;
   IF (CLIENT_COUNSELING = -9) THEN CLIENT_COUNSELING = .;
   IF (DIRECT_CONTACT_CLIENT = -6 OR DIRECT_CONTACT_CLIENT = -9) THEN DIRECT_CONTACT_CLIENT = .;
   IF (NUMBER_OF_CLIENTS_COUNSEL = -6 OR NUMBER_OF_CLIENTS_COUNSEL = -9) THEN NUMBER_OF_CLIENTS_COUNSEL = .;
   IF (ACTIVE_CASELOAD = -6 OR ACTIVE_CASELOAD = -9) THEN ACTIVE_CASELOAD = .;
   IF (NUMBER_OF_STAFF_SUPERVISE = -9) THEN NUMBER_OF_STAFF_SUPERVISE = .;
   IF (CURRENT_WORK_SETTING = -9) THEN CURRENT_WORK_SETTING = .;
   IF (BSOCA1 = -9) THEN BSOCA1 = .;
   IF (BSOCA2 = -9) THEN BSOCA2 = .;
   IF (BSOCA3 = -9) THEN BSOCA3 = .;
   IF (BSOCA4 = -9) THEN BSOCA4 = .;
   IF (BSOCA5 = -9) THEN BSOCA5 = .;
   IF (BSOCA6 = -9) THEN BSOCA6 = .;
   IF (BSOCA7 = -9) THEN BSOCA7 = .;
   IF (BSOCA8 = -9) THEN BSOCA8 = .;
   IF (BSOCA9 = -9) THEN BSOCA9 = .;
   IF (BSOCA10 = -9) THEN BSOCA10 = .;
   IF (BSOCA11 = -9) THEN BSOCA11 = .;
   IF (BSOCA12 = -9) THEN BSOCA12 = .;
   IF (BSOCA13 = -9) THEN BSOCA13 = .;
   IF (BSOCA14 = -9) THEN BSOCA14 = .;
   IF (BSOCA15 = -9) THEN BSOCA15 = .;
   IF (BSOCA16 = -9) THEN BSOCA16 = .;
   IF (BSOCA17 = -9) THEN BSOCA17 = .;
   IF (BSOCA18 = -9) THEN BSOCA18 = .;
   IF (BSOCA19 = -9) THEN BSOCA19 = .;
   IF (BSOCA20 = -9) THEN BSOCA20 = .;
   IF (BSOCA21 = -9) THEN BSOCA21 = .;
   IF (BSOCA22 = -9) THEN BSOCA22 = .;
   IF (BSOCA23 = -9) THEN BSOCA23 = .;
   IF (BSOCA24 = -9) THEN BSOCA24 = .;
   IF (BSOCA25 = -9) THEN BSOCA25 = .;
   IF (BSOCA26 = -9) THEN BSOCA26 = .;
   IF (BSOCA27 = -9) THEN BSOCA27 = .;
   IF (BSOCA28 = -9) THEN BSOCA28 = .;
   IF (BSOCA29 = -9) THEN BSOCA29 = .;
   IF (BSOCA30 = -9) THEN BSOCA30 = .;
   IF (BSOCA31 = -9) THEN BSOCA31 = .;
   IF (BSOCA32 = -9) THEN BSOCA32 = .;
   IF (BSOCA33 = -9) THEN BSOCA33 = .;
   IF (BSOCB1 = -9) THEN BSOCB1 = .;
   IF (BSOCB2 = -9) THEN BSOCB2 = .;
   IF (BSOCB3 = -9) THEN BSOCB3 = .;
   IF (BSOCB4 = -9) THEN BSOCB4 = .;
   IF (BSOCB5 = -9) THEN BSOCB5 = .;
   IF (BSOCB6 = -9) THEN BSOCB6 = .;
   IF (BSOCB7 = -9) THEN BSOCB7 = .;
   IF (BSOCB8 = -9) THEN BSOCB8 = .;
   IF (BSOCB9 = -9) THEN BSOCB9 = .;
   IF (BSOCB10 = -9) THEN BSOCB10 = .;
   IF (BSOCB11 = -9) THEN BSOCB11 = .;
   IF (BSOCB12 = -9) THEN BSOCB12 = .;
   IF (BSOCB13 = -9) THEN BSOCB13 = .;
   IF (BSOCB14 = -9) THEN BSOCB14 = .;
   IF (BSOCB15 = -9) THEN BSOCB15 = .;
   IF (BSOCB16 = -9) THEN BSOCB16 = .;
   IF (BSOCB17 = -9) THEN BSOCB17 = .;
   IF (BSOCB18 = -9) THEN BSOCB18 = .;
   IF (BSOCB19 = -9) THEN BSOCB19 = .;
   IF (BSOCB20 = -9) THEN BSOCB20 = .;
   IF (BSOCB21 = -9) THEN BSOCB21 = .;
   IF (BSOCB22 = -9) THEN BSOCB22 = .;
   IF (BSOCB23 = -9) THEN BSOCB23 = .;
   IF (BSOCB24 = -9) THEN BSOCB24 = .;
   IF (BSOCB25 = -9) THEN BSOCB25 = .;
   IF (BSOCB26 = -9) THEN BSOCB26 = .;
   IF (BSOCB27 = -9) THEN BSOCB27 = .;
   IF (BSOCC1 = -9) THEN BSOCC1 = .;
   IF (BSOCC2 = -9) THEN BSOCC2 = .;
   IF (BSOCC3 = -9) THEN BSOCC3 = .;
   IF (BSOCC4 = -9) THEN BSOCC4 = .;
   IF (BSOCC5 = -9) THEN BSOCC5 = .;
   IF (BSOCC6 = -9) THEN BSOCC6 = .;
   IF (BSOCC7 = -9) THEN BSOCC7 = .;
   IF (BSOCC8 = -9) THEN BSOCC8 = .;
   IF (BSOCC9 = -9) THEN BSOCC9 = .;
   IF (BSOCC10 = -9) THEN BSOCC10 = .;
   IF (BSOCC11 = -9) THEN BSOCC11 = .;
   IF (BSOCC12 = -9) THEN BSOCC12 = .;
   IF (BSOCC13 = -9) THEN BSOCC13 = .;
   IF (BSOCC14 = -9) THEN BSOCC14 = .;
   IF (BSOCC15 = -9) THEN BSOCC15 = .;
   IF (BSOCC16 = -9) THEN BSOCC16 = .;
   IF (BSOCC17 = -9) THEN BSOCC17 = .;
   IF (BSOCC18 = -9) THEN BSOCC18 = .;
   IF (BSOCC19 = -9) THEN BSOCC19 = .;
   IF (BSOCC20 = -9) THEN BSOCC20 = .;
   IF (BSOCC21 = -9) THEN BSOCC21 = .;
   IF (BSOCC22 = -9) THEN BSOCC22 = .;
   IF (BSOCC23 = -9) THEN BSOCC23 = .;
   IF (BSOCC24 = -9) THEN BSOCC24 = .;
   IF (BSOCC25 = -9) THEN BSOCC25 = .;
   IF (BSOCC26 = -9) THEN BSOCC26 = .;
   IF (BSOCC27 = -9) THEN BSOCC27 = .;
   IF (BSOCC28 = -9) THEN BSOCC28 = .;
   IF (BSOCC29 = -9) THEN BSOCC29 = .;
   IF (BSOCC30 = -9) THEN BSOCC30 = .;
   IF (BSOCC31A = -6 OR BSOCC31A = -9) THEN BSOCC31A = .;
   IF (BSOCC31B = -6 OR BSOCC31B = -9) THEN BSOCC31B = .;
   IF (BSOCC31C = -6 OR BSOCC31C = -9) THEN BSOCC31C = .;
   IF (BSOCC31D = -6 OR BSOCC31D = -9) THEN BSOCC31D = .;
   IF (BSOCC31E = -6 OR BSOCC31E = -9) THEN BSOCC31E = .;
   IF (BSOCC31F = -6 OR BSOCC31F = -9) THEN BSOCC31F = .;
   IF (BSOCC31G = -6 OR BSOCC31G = -9) THEN BSOCC31G = .;
   IF (BSOCC31H = -6 OR BSOCC31H = -9) THEN BSOCC31H = .;
   IF (BSOCC31I = -6 OR BSOCC31I = -9) THEN BSOCC31I = .;
   IF (BSOCC31J = -6 OR BSOCC31J = -9) THEN BSOCC31J = .;
   IF (BSOCC31K = -6 OR BSOCC31K = -9) THEN BSOCC31K = .;
   IF (BSOCC31L = -6 OR BSOCC31L = -9) THEN BSOCC31L = .;
   IF (BSOCD1 = -9) THEN BSOCD1 = .;
   IF (BSOCD2 = -9) THEN BSOCD2 = .;
   IF (BSOCD3 = -9) THEN BSOCD3 = .;
   IF (BSOCD4 = -9) THEN BSOCD4 = .;
   IF (BSOCD5 = -9) THEN BSOCD5 = .;
   IF (BSOCD6 = -9) THEN BSOCD6 = .;
   IF (BSOCD7 = -9) THEN BSOCD7 = .;
   IF (BSOCD8 = -9) THEN BSOCD8 = .;
   IF (BSOCD9 = -9) THEN BSOCD9 = .;
   IF (BSOCD10 = -9) THEN BSOCD10 = .;
   IF (BSOCD11 = -9) THEN BSOCD11 = .;
   IF (BSOCD12 = -9) THEN BSOCD12 = .;
   IF (BSOCD13 = -9) THEN BSOCD13 = .;
   IF (BSOCD14 = -9) THEN BSOCD14 = .;
   IF (BSOCD15 = -9) THEN BSOCD15 = .;
   IF (BSOCD16 = -9) THEN BSOCD16 = .;
   IF (BSOCD17 = -9) THEN BSOCD17 = .;
   IF (BSOCD18 = -9) THEN BSOCD18 = .;
   IF (BSOCD19 = -9) THEN BSOCD19 = .;
   IF (BSOCD20 = -9) THEN BSOCD20 = .;
   IF (BSOCD21 = -9) THEN BSOCD21 = .;
   IF (BSOCD22 = -9) THEN BSOCD22 = .;
   IF (BSOCD23 = -9) THEN BSOCD23 = .;
   IF (BSOCD24 = -9) THEN BSOCD24 = .;
   IF (BSOCD25 = -9) THEN BSOCD25 = .;
   IF (BSOCD26 = -9) THEN BSOCD26 = .;
   IF (BSOCD27 = -9) THEN BSOCD27 = .;
   IF (BSOCD28 = -9) THEN BSOCD28 = .;
   IF (BSOCD29 = -9) THEN BSOCD29 = .;
   IF (BSOCD30 = -9) THEN BSOCD30 = .;
   IF (BSOCD31 = -9) THEN BSOCD31 = .;
   IF (BSOCD32 = -9) THEN BSOCD32 = .;
   IF (BSOCD33 = -9) THEN BSOCD33 = .;
   IF (BSOCD34 = -9) THEN BSOCD34 = .;
   IF (BSOCD35 = -9) THEN BSOCD35 = .;
   IF (BSOCD36 = -9) THEN BSOCD36 = .;
   IF (BSOCD37 = -9) THEN BSOCD37 = .;
   IF (BSOCD38 = -9) THEN BSOCD38 = .;
   IF (BSOCD39 = -9) THEN BSOCD39 = .;
   IF (BSOCD40 = -9) THEN BSOCD40 = .;
   IF (BSOCD41 = -9) THEN BSOCD41 = .;
   IF (BSOCD42 = -9) THEN BSOCD42 = .;
   IF (BSOCD43 = -9) THEN BSOCD43 = .;
   IF (BSOCD44 = -9) THEN BSOCD44 = .;
   IF (BSOCD45 = -9) THEN BSOCD45 = .;
   IF (BSOCD46 = -9) THEN BSOCD46 = .;
   IF (BSOCD47 = -9) THEN BSOCD47 = .;
   IF (BSOCD48 = -9) THEN BSOCD48 = .;
   IF (BSOCD49 = -9) THEN BSOCD49 = .;
   IF (BSOCD50 = -9) THEN BSOCD50 = .;
   IF (BSOCD51 = -9) THEN BSOCD51 = .;
   IF (BSOCD52 = -9) THEN BSOCD52 = .;
   IF (BSOCD53 = -9) THEN BSOCD53 = .;
   IF (BSOCD54 = -9) THEN BSOCD54 = .;
   IF (BSOCD55 = -9) THEN BSOCD55 = .;
   IF (BSOCD56 = -9) THEN BSOCD56 = .;
   IF (BSOCD57 = -9) THEN BSOCD57 = .;
   IF (BSOCD58 = -9) THEN BSOCD58 = .;
   IF (BSOCD59 = -9) THEN BSOCD59 = .;
   IF (BSOCD60 = -9) THEN BSOCD60 = .;
   IF (BSOCD61 = -9) THEN BSOCD61 = .;
   IF (BSOCD62 = -9) THEN BSOCD62 = .;
   IF (BSOCD63 = -9) THEN BSOCD63 = .;
   IF (BSOCE1 = -9) THEN BSOCE1 = .;
   IF (BSOCE2 = -9) THEN BSOCE2 = .;
   IF (BSOCE3 = -9) THEN BSOCE3 = .;
   IF (BSOCE4 = -9) THEN BSOCE4 = .;
   IF (BSOCE5 = -9) THEN BSOCE5 = .;
   IF (BSOCE6 = -9) THEN BSOCE6 = .;
   IF (BSOCE7 = -9) THEN BSOCE7 = .;
   IF (BSOCE8 = -9) THEN BSOCE8 = .;
   IF (BSOCE9 = -9) THEN BSOCE9 = .;
   IF (BSOCE10 = -9) THEN BSOCE10 = .;
   IF (BSOCE11 = -9) THEN BSOCE11 = .;
   IF (BSOCE12 = -9) THEN BSOCE12 = .;
   IF (BSOCE13 = -9) THEN BSOCE13 = .;
   IF (BSOCE14 = -9) THEN BSOCE14 = .;
   IF (BSOCE15 = -6 OR BSOCE15 = -9) THEN BSOCE15 = .;
   IF (BSOCE16 = -6 OR BSOCE16 = -9) THEN BSOCE16 = .;
   IF (BSOCE17 = -6 OR BSOCE17 = -9) THEN BSOCE17 = .;
   IF (BSOCE18 = -6 OR BSOCE18 = -9) THEN BSOCE18 = .;
   IF (BSOCE19 = -6 OR BSOCE19 = -9) THEN BSOCE19 = .;
   IF (BSOCE20 = -6 OR BSOCE20 = -9) THEN BSOCE20 = .;
   IF (BSOCE21 = -6 OR BSOCE21 = -9) THEN BSOCE21 = .;
   IF (BSOCE22 = -6 OR BSOCE22 = -9) THEN BSOCE22 = .;
   IF (BSOCE23 = -6 OR BSOCE23 = -9) THEN BSOCE23 = .;
   IF (BSOCE24 = -6 OR BSOCE24 = -9) THEN BSOCE24 = .;
   IF (BSOCE25 = -6 OR BSOCE25 = -9) THEN BSOCE25 = .;
   IF (BSOCE26 = -6 OR BSOCE26 = -9) THEN BSOCE26 = .;
   IF (BSOCE27 = -6 OR BSOCE27 = -9) THEN BSOCE27 = .;
   IF (BSOCE28 = -6 OR BSOCE28 = -9) THEN BSOCE28 = .;
   IF (BSOCE29 = -6 OR BSOCE29 = -9) THEN BSOCE29 = .;
   IF (BSOCE30 = -6 OR BSOCE30 = -9) THEN BSOCE30 = .;
   IF (BSOCE19_DC = -6 OR BSOCE19_DC = -9) THEN BSOCE19_DC = .;
   IF (BSOCE19_PRO = -6 OR BSOCE19_PRO = -9) THEN BSOCE19_PRO = .;
   IF (BSOCE19_PA = -6 OR BSOCE19_PA = -9) THEN BSOCE19_PA = .;
   IF (BSOCE19_J = -6 OR BSOCE19_J = -9) THEN BSOCE19_J = .;
   IF (BSOCE19_SP = -6 OR BSOCE19_SP = -9) THEN BSOCE19_SP = .;
   IF (BSOCE20_DC = -6 OR BSOCE20_DC = -9) THEN BSOCE20_DC = .;
   IF (BSOCE20_PRO = -6 OR BSOCE20_PRO = -9) THEN BSOCE20_PRO = .;
   IF (BSOCE20_PA = -6 OR BSOCE20_PA = -9) THEN BSOCE20_PA = .;
   IF (BSOCE20_J = -6 OR BSOCE20_J = -9) THEN BSOCE20_J = .;
   IF (BSOCE20_SP = -6 OR BSOCE20_SP = -9) THEN BSOCE20_SP = .;
   IF (BSOCE21_DC = -6 OR BSOCE21_DC = -9) THEN BSOCE21_DC = .;
   IF (BSOCE21_PRO = -6 OR BSOCE21_PRO = -9) THEN BSOCE21_PRO = .;
   IF (BSOCE21_PA = -6 OR BSOCE21_PA = -9) THEN BSOCE21_PA = .;
   IF (BSOCE21_J = -6 OR BSOCE21_J = -9) THEN BSOCE21_J = .;
   IF (BSOCE21_SP = -6 OR BSOCE21_SP = -9) THEN BSOCE21_SP = .;
   IF (BSOCE22_DC = -6 OR BSOCE22_DC = -9) THEN BSOCE22_DC = .;
   IF (BSOCE22_PRO = -6 OR BSOCE22_PRO = -9) THEN BSOCE22_PRO = .;
   IF (BSOCE22_PA = -6 OR BSOCE22_PA = -9) THEN BSOCE22_PA = .;
   IF (BSOCE22_J = -6 OR BSOCE22_J = -9) THEN BSOCE22_J = .;
   IF (BSOCE22_SP = -6 OR BSOCE22_SP = -9) THEN BSOCE22_SP = .;
   IF (BSOCE23_DC = -6 OR BSOCE23_DC = -9) THEN BSOCE23_DC = .;
   IF (BSOCE23_PRO = -6 OR BSOCE23_PRO = -9) THEN BSOCE23_PRO = .;
   IF (BSOCE23_PA = -6 OR BSOCE23_PA = -9) THEN BSOCE23_PA = .;
   IF (BSOCE23_J = -6 OR BSOCE23_J = -9) THEN BSOCE23_J = .;
   IF (BSOCE23_SP = -6 OR BSOCE23_SP = -9) THEN BSOCE23_SP = .;
   IF (BSOCE24_DC = -6 OR BSOCE24_DC = -9) THEN BSOCE24_DC = .;
   IF (BSOCE24_PRO = -6 OR BSOCE24_PRO = -9) THEN BSOCE24_PRO = .;
   IF (BSOCE24_PA = -6 OR BSOCE24_PA = -9) THEN BSOCE24_PA = .;
   IF (BSOCE24_J = -6 OR BSOCE24_J = -9) THEN BSOCE24_J = .;
   IF (BSOCE24_SP = -6 OR BSOCE24_SP = -9) THEN BSOCE24_SP = .;
   IF (BSOCE25_DC = -6 OR BSOCE25_DC = -9) THEN BSOCE25_DC = .;
   IF (BSOCE25_PRO = -6 OR BSOCE25_PRO = -9) THEN BSOCE25_PRO = .;
   IF (BSOCE25_PA = -6 OR BSOCE25_PA = -9) THEN BSOCE25_PA = .;
   IF (BSOCE25_J = -6 OR BSOCE25_J = -9) THEN BSOCE25_J = .;
   IF (BSOCE25_SP = -6 OR BSOCE25_SP = -9) THEN BSOCE25_SP = .;
   IF (BSOCE26_DC = -6 OR BSOCE26_DC = -9) THEN BSOCE26_DC = .;
   IF (BSOCE26_PRO = -6 OR BSOCE26_PRO = -9) THEN BSOCE26_PRO = .;
   IF (BSOCE26_PA = -6 OR BSOCE26_PA = -9) THEN BSOCE26_PA = .;
   IF (BSOCE26_J = -6 OR BSOCE26_J = -9) THEN BSOCE26_J = .;
   IF (BSOCE26_SP = -6 OR BSOCE26_SP = -9) THEN BSOCE26_SP = .;
   IF (BSOCE27_DC = -6 OR BSOCE27_DC = -9) THEN BSOCE27_DC = .;
   IF (BSOCE27_PRO = -6 OR BSOCE27_PRO = -9) THEN BSOCE27_PRO = .;
   IF (BSOCE27_PA = -6 OR BSOCE27_PA = -9) THEN BSOCE27_PA = .;
   IF (BSOCE27_J = -6 OR BSOCE27_J = -9) THEN BSOCE27_J = .;
   IF (BSOCE27_SP = -6 OR BSOCE27_SP = -9) THEN BSOCE27_SP = .;
   IF (BSOCE28_DC = -6 OR BSOCE28_DC = -9) THEN BSOCE28_DC = .;
   IF (BSOCE28_PRO = -6 OR BSOCE28_PRO = -9) THEN BSOCE28_PRO = .;
   IF (BSOCE28_PA = -6 OR BSOCE28_PA = -9) THEN BSOCE28_PA = .;
   IF (BSOCE28_J = -6 OR BSOCE28_J = -9) THEN BSOCE28_J = .;
   IF (BSOCE28_SP = -6 OR BSOCE28_SP = -9) THEN BSOCE28_SP = .;
   IF (BSOCE29_DC = -6 OR BSOCE29_DC = -9) THEN BSOCE29_DC = .;
   IF (BSOCE29_PRO = -6 OR BSOCE29_PRO = -9) THEN BSOCE29_PRO = .;
   IF (BSOCE29_PA = -6 OR BSOCE29_PA = -9) THEN BSOCE29_PA = .;
   IF (BSOCE29_J = -6 OR BSOCE29_J = -9) THEN BSOCE29_J = .;
   IF (BSOCE29_SP = -6 OR BSOCE29_SP = -9) THEN BSOCE29_SP = .;
   IF (BSOCE30_DC = -6 OR BSOCE30_DC = -9) THEN BSOCE30_DC = .;
   IF (BSOCE30_PRO = -6 OR BSOCE30_PRO = -9) THEN BSOCE30_PRO = .;
   IF (BSOCE30_PA = -6 OR BSOCE30_PA = -9) THEN BSOCE30_PA = .;
   IF (BSOCE30_J = -6 OR BSOCE30_J = -9) THEN BSOCE30_J = .;
   IF (BSOCE30_SP = -6 OR BSOCE30_SP = -9) THEN BSOCE30_SP = .;
   IF (ANPSTAFF = -9.0) THEN ANPSTAFF = .;
   IF (ANPPN = -9.0) THEN ANPPN = .;
   IF (ANPTRAIN = -9.0) THEN ANPTRAIN = .;
   IF (ANPPFC = -9.0) THEN ANPPFC = .;
   IF (BRESTAFF = -9.0) THEN BRESTAFF = .;
   IF (BRETRAIN = -9.0) THEN BRETRAIN = .;
   IF (BREEQU = -9.0) THEN BREEQU = .;
   IF (BREINT = -9.0) THEN BREINT = .;
   IF (BRESUP = -9.0) THEN BRESUP = .;
   IF (CSAGRO = -9.0) THEN CSAGRO = .;
   IF (CSAEFF = -9.0) THEN CSAEFF = .;
   IF (CSAINF = -9.0) THEN CSAINF = .;
   IF (CSAADPT = -9.0) THEN CSAADPT = .;
   IF (CSASAT = -9.0) THEN CSASAT = .;
   IF (CSABEL = -9.0 OR CSABEL = -5.0) THEN CSABEL = .;
   IF (CSACOM = -9 OR CSACOM = -5) THEN CSACOM = .;
   IF (CSABEL2 = -9.0 OR CSABEL2 = -5.0) THEN CSABEL2 = .;
   IF (DOCMIS = -9.0) THEN DOCMIS = .;
   IF (DOCCOH = -9.0) THEN DOCCOH = .;
   IF (DOCAUT = -9.0) THEN DOCAUT = .;
   IF (DOCCOM = -9.0) THEN DOCCOM = .;
   IF (DOCCOM1 = -9.0) THEN DOCCOM1 = .;
   IF (DOCCOM2 = -9.0) THEN DOCCOM2 = .;
   IF (DOCSTRS = -9.0) THEN DOCSTRS = .;
   IF (DOCCHNG = -9.0) THEN DOCCHNG = .;
   IF (DOCBRNT = -9.0) THEN DOCBRNT = .;
   IF (DOCSUP = -9.0) THEN DOCSUP = .;
   IF (DOCLEAD = -9.0) THEN DOCLEAD = .;
   IF (EOTDIV = -9.0) THEN EOTDIV = .;
   IF (EOTTOL = -9.0) THEN EOTTOL = .;
   IF (EOTSCO = -9) THEN EOTSCO = .;
   IF (EOTOPN = -9.0 OR EOTOPN = -5.0) THEN EOTOPN = .;
*/


* SAS FORMAT STATEMENT;

/*
   FORMAT
         ACTIVE_CASELOAD active_f. ADDICTIONS_COUNSELING addictif. ADMINISTRATION addictif.
         ANPPFC anpstaff. ANPPN anpstaff. ANPSTAFF anpstaff.
         ANPTRAIN anpstaff. BREEQU anpstaff. BREINT anpstaff.
         BRESTAFF anpstaff. BRESUP anpstaff. BRETRAIN anpstaff.
         BSOCA1 bsoca1ff. BSOCA10 bsoca1ff. BSOCA11 bsoca1ff.
         BSOCA12 bsoca1ff. BSOCA13 bsoca1ff. BSOCA14 bsoca1ff.
         BSOCA15 bsoca1ff. BSOCA16 bsoca1ff. BSOCA17 bsoca1ff.
         BSOCA18 bsoca1ff. BSOCA19 bsoca1ff. BSOCA2 bsoca1ff.
         BSOCA20 bsoca1ff. BSOCA21 bsoca1ff. BSOCA22 bsoca1ff.
         BSOCA23 bsoca1ff. BSOCA24 bsoca1ff. BSOCA25 bsoca1ff.
         BSOCA26 bsoca1ff. BSOCA27 bsoca1ff. BSOCA28 bsoca1ff.
         BSOCA29 bsoca1ff. BSOCA3 bsoca1ff. BSOCA30 bsoca1ff.
         BSOCA31 bsoca1ff. BSOCA32 bsoca1ff. BSOCA33 bsoca1ff.
         BSOCA4 bsoca1ff. BSOCA5 bsoca1ff. BSOCA6 bsoca1ff.
         BSOCA7 bsoca1ff. BSOCA8 bsoca1ff. BSOCA9 bsoca1ff.
         BSOCB1 bsoca1ff. BSOCB10 bsoca1ff. BSOCB11 bsoca1ff.
         BSOCB12 bsoca1ff. BSOCB13 bsoca1ff. BSOCB14 bsoca1ff.
         BSOCB15 bsoca1ff. BSOCB16 bsoca1ff. BSOCB17 bsoca1ff.
         BSOCB18 bsoca1ff. BSOCB19 bsoca1ff. BSOCB2 bsoca1ff.
         BSOCB20 bsoca1ff. BSOCB21 bsoca1ff. BSOCB22 bsoca1ff.
         BSOCB23 bsoca1ff. BSOCB24 bsoca1ff. BSOCB25 bsoca1ff.
         BSOCB26 bsoca1ff. BSOCB27 bsoca1ff. BSOCB3 bsoca1ff.
         BSOCB4 bsoca1ff. BSOCB5 bsoca1ff. BSOCB6 bsoca1ff.
         BSOCB7 bsoca1ff. BSOCB8 bsoca1ff. BSOCB9 bsoca1ff.
         BSOCC1 bsoca1ff. BSOCC10 bsoca1ff. BSOCC11 bsoca1ff.
         BSOCC12 bsoca1ff. BSOCC13 bsoca1ff. BSOCC14 bsoca1ff.
         BSOCC15 bsoca1ff. BSOCC16 bsoca1ff. BSOCC17 bsoca1ff.
         BSOCC18 bsoca1ff. BSOCC19 bsoca1ff. BSOCC2 bsoca1ff.
         BSOCC20 bsoca1ff. BSOCC21 bsoca1ff. BSOCC22 bsoca1ff.
         BSOCC23 bsoca1ff. BSOCC24 bsoca1ff. BSOCC25 bsoca1ff.
         BSOCC26 bsoca1ff. BSOCC27 bsoca1ff. BSOCC28 bsoca1ff.
         BSOCC29 bsoca1ff. BSOCC3 bsoca1ff. BSOCC30 bsoca1ff.
         BSOCC31A bsocc31f. BSOCC31B bsocc31f. BSOCC31C bsocc31f.
         BSOCC31D bsocc31f. BSOCC31E bsocc31f. BSOCC31F bsocc31f.
         BSOCC31G bsocc31f. BSOCC31H bsocc31f. BSOCC31I bsocc31f.
         BSOCC31J bsocc31f. BSOCC31K bsocc31f. BSOCC31L bsocc31f.
         BSOCC4 bsoca1ff. BSOCC5 bsoca1ff. BSOCC6 bsoca1ff.
         BSOCC7 bsoca1ff. BSOCC8 bsoca1ff. BSOCC9 bsoca1ff.
         BSOCD1 bsoca1ff. BSOCD10 bsoca1ff. BSOCD11 bsoca1ff.
         BSOCD12 bsoca1ff. BSOCD13 bsoca1ff. BSOCD14 bsoca1ff.
         BSOCD15 bsoca1ff. BSOCD16 bsoca1ff. BSOCD17 bsoca1ff.
         BSOCD18 bsoca1ff. BSOCD19 bsoca1ff. BSOCD2 bsoca1ff.
         BSOCD20 bsoca1ff. BSOCD21 bsoca1ff. BSOCD22 bsoca1ff.
         BSOCD23 bsoca1ff. BSOCD24 bsoca1ff. BSOCD25 bsoca1ff.
         BSOCD26 bsoca1ff. BSOCD27 bsoca1ff. BSOCD28 bsoca1ff.
         BSOCD29 bsoca1ff. BSOCD3 bsoca1ff. BSOCD30 bsoca1ff.
         BSOCD31 bsoca1ff. BSOCD32 bsoca1ff. BSOCD33 bsoca1ff.
         BSOCD34 bsoca1ff. BSOCD35 bsoca1ff. BSOCD36 bsoca1ff.
         BSOCD37 bsoca1ff. BSOCD38 bsoca1ff. BSOCD39 bsoca1ff.
         BSOCD4 bsoca1ff. BSOCD40 bsoca1ff. BSOCD41 bsoca1ff.
         BSOCD42 bsoca1ff. BSOCD43 bsoca1ff. BSOCD44 bsoca1ff.
         BSOCD45 bsoca1ff. BSOCD46 bsoca1ff. BSOCD47 bsoca1ff.
         BSOCD48 bsoca1ff. BSOCD49 bsoca1ff. BSOCD5 bsoca1ff.
         BSOCD50 bsoca1ff. BSOCD51 bsoca1ff. BSOCD52 bsoca1ff.
         BSOCD53 bsoca1ff. BSOCD54 bsoca1ff. BSOCD55 bsoca1ff.
         BSOCD56 bsoca1ff. BSOCD57 bsoca1ff. BSOCD58 bsoca1ff.
         BSOCD59 bsoca1ff. BSOCD6 bsoca1ff. BSOCD60 bsoca1ff.
         BSOCD61 bsoca1ff. BSOCD62 bsoca1ff. BSOCD63 bsoca1ff.
         BSOCD7 bsoca1ff. BSOCD8 bsoca1ff. BSOCD9 bsoca1ff.
         BSOCE1 bsoca1ff. BSOCE10 bsoca1ff. BSOCE11 bsoca1ff.
         BSOCE12 bsoca1ff. BSOCE13 bsoca1ff. BSOCE14 bsoca1ff.
         BSOCE15 bsocc31f. BSOCE16 bsocc31f. BSOCE17 bsocc31f.
         BSOCE18 bsocc31f. BSOCE19 bsoce19f. BSOCE19_DC bsoce19f.
         BSOCE19_J bsoce19f. BSOCE19_PA bsoce19f. BSOCE19_PRO bsoce19f.
         BSOCE19_SP bsoce19f. BSOCE2 bsoca1ff. BSOCE20 bsoce19f.
         BSOCE20_DC bsoce19f. BSOCE20_J bsoce19f. BSOCE20_PA bsoce19f.
         BSOCE20_PRO bsoce19f. BSOCE20_SP bsoce19f. BSOCE21 bsoce19f.
         BSOCE21_DC bsoce19f. BSOCE21_J bsoce19f. BSOCE21_PA bsoce19f.
         BSOCE21_PRO bsoce19f. BSOCE21_SP bsoce19f. BSOCE22 bsoce19f.
         BSOCE22_DC bsoce19f. BSOCE22_J bsoce19f. BSOCE22_PA bsoce19f.
         BSOCE22_PRO bsoce19f. BSOCE22_SP bsoce19f. BSOCE23 bsoce19f.
         BSOCE23_DC bsoce19f. BSOCE23_J bsoce19f. BSOCE23_PA bsoce19f.
         BSOCE23_PRO bsoce19f. BSOCE23_SP bsoce19f. BSOCE24 bsoce19f.
         BSOCE24_DC bsoce19f. BSOCE24_J bsoce19f. BSOCE24_PA bsoce19f.
         BSOCE24_PRO bsoce19f. BSOCE24_SP bsoce19f. BSOCE25 bsoce19f.
         BSOCE25_DC bsoce19f. BSOCE25_J bsoce19f. BSOCE25_PA bsoce19f.
         BSOCE25_PRO bsoce19f. BSOCE25_SP bsoce19f. BSOCE26 bsoce19f.
         BSOCE26_DC bsoce19f. BSOCE26_J bsoce19f. BSOCE26_PA bsoce19f.
         BSOCE26_PRO bsoce19f. BSOCE26_SP bsoce19f. BSOCE27 bsoce19f.
         BSOCE27_DC bsoce19f. BSOCE27_J bsoce19f. BSOCE27_PA bsoce19f.
         BSOCE27_PRO bsoce19f. BSOCE27_SP bsoce19f. BSOCE28 bsoce19f.
         BSOCE28_DC bsoce19f. BSOCE28_J bsoce19f. BSOCE28_PA bsoce19f.
         BSOCE28_PRO bsoce19f. BSOCE28_SP bsoce19f. BSOCE29 bsoce19f.
         BSOCE29_DC bsoce19f. BSOCE29_J bsoce19f. BSOCE29_PA bsoce19f.
         BSOCE29_PRO bsoce19f. BSOCE29_SP bsoce19f. BSOCE3 bsoca1ff.
         BSOCE30 bsoce19f. BSOCE30_DC bsoce19f. BSOCE30_J bsoce19f.
         BSOCE30_PA bsoce19f. BSOCE30_PRO bsoce19f. BSOCE30_SP bsoce19f.
         BSOCE4 bsoca1ff. BSOCE5 bsoca1ff. BSOCE6 bsoca1ff.
         BSOCE7 bsoca1ff. BSOCE8 bsoca1ff. BSOCE9 bsoca1ff.
         CLIENT_COUNSELING client_f. COUNSELING_CREDENTIALS counself. COUNSELING_CREDENTIALS_AL counself.
         COUNSELING_CREDENTIALS_CO counself. COUNSELING_CREDENTIALS_DR counself. CRIMINAL_JUSTICE addictif.
         CSAADPT anpstaff. CSABEL csabelff. CSABEL2 csabelff.
         CSACOM csacomff. CSAEFF anpstaff. CSAGRO anpstaff.
         CSAINF anpstaff. CSASAT anpstaff. CURRENT_EMPLOYER substanf.
         CURRENT_POSITION substanf. CURRENT_WORK_SETTING currentf. DATE dateffff.
         DEGREE degreeff. DIRECT_CONTACT_CLIENT direct_f. DOCAUT anpstaff.
         DOCBRNT anpstaff. DOCCHNG anpstaff. DOCCOH anpstaff.
         DOCCOM anpstaff. DOCCOM1 anpstaff. DOCCOM2 anpstaff.
         DOCLEAD anpstaff. DOCMIS anpstaff. DOCSTRS anpstaff.
         DOCSUP idffffff. EDUCATION addictif. EOTDIV anpstaff.
         EOTOPN csacomff. EOTSCO idffffff. EOTTOL anpstaff.
         ID idffffff. JOB_LEVEL job_levf. LAW_ENFORCEMENT addictif.
         LICENSURE counself. MEDICINE addictif. MILITARY addictif.
         NATIONAL_CERTIFICATION counself. NATIONAL_CERTIFICATION_IC counself. NATIONAL_CERTIFICATION_NA counself.
         NUMBER_OF_CLIENTS_COUNSEL direct_f. NUMBER_OF_STAFF_SUPERVISE number_f. OTHER_COUNSELING addictif.
         OTHER_SPECIFY addictif. PROGRAM_LENGTH substanf. PSYCHOLOGY addictif.
         REGULAR_WORK_HOURS regularf. RESPCODE idffffff. RESPTYPE resptypf.
         SITEID idffffff. SOCIAL_WORK_HUMAN_SERVICE addictif. STUDYCODE studyco_1f.
         STUDYCOND studycof. SUBSTANCE_ABUSE substanf. VOCATIONAL_REHABILITATION addictif.
         YEAR_DEG year_def.
    ;
*/

RUN ;
