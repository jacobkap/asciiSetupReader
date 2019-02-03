/****************************************************************************************/
/*  This SAS program reads ASCII format (text format) 2017 SADC data and creates a      */
/*  formatted and labeled SAS dataset.                                                  */
/*                                                                                      */
/*  Change the file location specifications from 'c:\YRBS2017' to the location where    */
/*  you have stored the YRBS ASCII data file and the format library before you run this */
/*  program.  Change the location specification in three places - in the 'filename'     */
/*  statement and in the two 'libname' statements at the top of the program.            */
/*                                                                                      */
/*  Note: Run '2017 SADC SAS Formats Program.sas' BEFORE you run                        */
/*  '2017 SADC SAS Input Program.sas' to create the 2017SADC dataset.                   */
/****************************************************************************************/
 
filename datain 'c:\yrbs2017\sadc_2017_district.dat';
libname dataout 'c:\yrbs2017';
libname library 'c:\yrbs2017';
data dataout.sadc_2017_district ;
infile datain lrecl=900;
input
sitecode $ 1-5
sitename $ 6-55
sitetype $ 56-105
sitetypenum 106-113
year 114-121
survyear 122-124
weight 125-134
stratum 135-142
PSU 143-150
record 151-158
age 159-161
sex 162-164
grade 165-167
race4 168-170
race7 171-173
stheight 174-181
stweight 182-189
bmi 190-197
bmipct 198-205
qnobese 206-208
qnowt 209-211
q67 $ 212-212
q66 $ 213-213
sexid 214-221
sexid2 222-229
sexpart 230-237
sexpart2 238-245
q8 $ 246-246
q9 $ 247-247
q10 $ 248-248
q11 $ 249-249
q12 $ 250-250
q13 $ 251-251
q14 $ 252-252
q15 $ 253-253
q16 $ 254-254
q17 $ 255-255
q18 $ 256-256
q19 $ 257-257
q20 $ 258-258
q21 $ 259-259
q22 $ 260-260
q23 $ 261-261
q24 $ 262-262
q25 $ 263-263
q26 $ 264-264
q27 $ 265-265
q28 $ 266-266
q29 $ 267-267
q30 $ 268-268
q31 $ 269-269
q32 $ 270-270
q33 $ 271-271
q34 $ 272-272
q35 $ 273-273
q36 $ 274-274
q37 $ 275-275
q38 $ 276-276
q39 $ 277-277
q40 $ 278-278
q41 $ 279-279
q42 $ 280-280
q43 $ 281-281
q44 $ 282-282
q45 $ 283-283
q46 $ 284-284
q47 $ 285-285
q48 $ 286-286
q49 $ 287-287
q50 $ 288-288
q51 $ 289-289
q52 $ 290-290
q53 $ 291-291
q54 $ 292-292
q55 $ 293-293
q56 $ 294-294
q57 $ 295-295
q58 $ 296-296
q59 $ 297-297
q60 $ 298-298
q61 $ 299-299
q62 $ 300-300
q63 $ 301-301
q64 $ 302-302
q65 $ 303-303
q68 $ 304-304
q69 $ 305-305
q70 $ 306-306
q71 $ 307-307
q72 $ 308-308
q73 $ 309-309
q74 $ 310-310
q75 $ 311-311
q76 $ 312-312
q77 $ 313-313
q78 $ 314-314
q79 $ 315-315
q80 $ 316-316
q81 $ 317-317
q82 $ 318-318
q83 $ 319-319
q84 $ 320-320
q85 $ 321-321
q86 $ 322-322
q87 $ 323-323
q88 $ 324-324
q89 $ 325-325
qn8 326-328
qn9 329-331
qn10 332-334
qn11 335-337
qn12 338-340
qn13 341-343
qn14 344-346
qn15 347-349
qn16 350-352
qn17 353-355
qn18 356-358
qn19 359-361
qn20 362-364
qn21 365-367
qn22 368-370
qn23 371-373
qn24 374-376
qn25 377-379
qn26 380-382
qn27 383-385
qn28 386-388
qn29 389-391
qn30 392-394
qn31 395-397
qn32 398-400
qn33 401-403
qn34 404-406
qn35 407-409
qn36 410-412
qn37 413-415
qn38 416-418
qn39 419-421
qn40 422-424
qn41 425-427
qn42 428-430
qn43 431-433
qn44 434-436
qn45 437-439
qn46 440-442
qn47 443-445
qn48 446-448
qn49 449-451
qn50 452-454
qn51 455-457
qn52 458-460
qn53 461-463
qn54 464-466
qn55 467-469
qn56 470-472
qn57 473-475
qn58 476-478
qn59 479-481
qn60 482-484
qn61 485-487
qn62 488-490
qn63 491-493
qn64 494-496
qn65 497-499
qn68 500-502
qn69 503-505
qn70 506-508
qn71 509-511
qn72 512-514
qn73 515-517
qn74 518-520
qn75 521-523
qn76 524-526
qn77 527-529
qn78 530-532
qn79 533-535
qn80 536-538
qn81 539-541
qn82 542-544
qn83 545-547
qn84 548-550
qn85 551-553
qn86 554-556
qn87 557-559
qn88 560-562
qn89 563-565
qnfrcig 566-568
qndaycig 569-571
qnfrevp 572-574
qndayevp 575-577
qnfrskl 578-580
qndayskl 581-583
qnfrcgr 584-586
qndaycgr 587-589
qntb2 590-592
qntb3 593-595
qntb4 596-598
qniudimp 599-601
qnshparg 602-604
qnothhpl 605-607
qndualbc 608-610
qnbcnone 611-613
qnfr0 614-616
qnfr1 617-619
qnfr2 620-622
qnfr3 623-625
qnveg0 626-628
qnveg1 629-631
qnveg2 632-634
qnveg3 635-637
qnsoda1 638-640
qnsoda2 641-643
qnsoda3 644-646
qnmilk1 647-649
qnmilk2 650-652
qnmilk3 653-655
qnbk7day 656-658
qnpa0day 659-661
qnpa7day 662-664
qndlype 665-667
qnnodnt 668-670
qbikehelmet $ 671-671
qdrivemarijuana $ 672-672
qcelldriving $ 673-673
qpropertydamage $ 674-674
qbullyweight $ 675-675
qbullygender $ 676-676
qbullygay $ 677-677
qchokeself $ 678-678
qcigschool $ 679-679
qchewtobschool $ 680-680
qalcoholschool $ 681-681
qtypealcohol $ 682-682
qhowmarijuana $ 683-683
qmarijuanaschool $ 684-684
qcurrentcocaine $ 685-685
qcurrentheroin $ 686-686
qcurrentmeth $ 687-687
qhallucdrug $ 688-688
qprescription30d $ 689-689
qgenderexp $ 690-690
qtaughtHIV $ 691-691
qtaughtsexed $ 692-692
qtaughtstd $ 693-693
qtaughtcondom $ 694-694
qtaughtbc $ 695-695
qdietpop $ 696-696
qcoffeetea $ 697-697
qsportsdrink $ 698-698
qenergydrink $ 699-699
qsugardrink $ 700-700
qwater $ 701-701
qfastfood $ 702-702
qfoodallergy $ 703-703
qwenthungry $ 704-704
qmusclestrength $ 705-705
qsunscreenuse $ 706-706
qindoortanning $ 707-707
qsunburn $ 708-708
qconcentrating $ 709-709
qcurrentasthma $ 710-710
qwheresleep $ 711-711
qspeakenglish $ 712-712
qtransgender $ 713-713
qnbikehelmet 714-716
qndrivemarijuana 717-719
qncelldriving 720-722
qnpropertydamage 723-725
qnbullyweight 726-728
qnbullygender 729-731
qnbullygay 732-734
qnchokeself 735-737
qncigschool 738-740
qnchewtobschool 741-743
qnalcoholschool 744-746
qntypealcohol 747-749
qnhowmarijuana 750-752
qnmarijuanaschool 753-755
qncurrentcocaine 756-758
qncurrentheroin 759-761
qncurrentmeth 762-764
qnhallucdrug 765-767
qnprescription30d 768-770
qngenderexp 771-773
qntaughtHIV 774-776
qntaughtsexed 777-779
qntaughtstd 780-782
qntaughtcondom 783-785
qntaughtbc 786-788
qndietpop 789-791
qncoffeetea 792-794
qnsportsdrink 795-797
qnspdrk1 798-800
qnspdrk2 801-803
qnspdrk3 804-806
qnenergydrink 807-809
qnsugardrink 810-812
qnwater 813-815
qnwater1 816-818
qnwater2 819-821
qnwater3 822-824
qnfastfood 825-827
qnfoodallergy 828-830
qnwenthungry 831-833
qnmusclestrength 834-836
qnsunscreenuse 837-839
qnindoortanning 840-842
qnsunburn 843-845
qnconcentrating 846-848
qncurrentasthma 849-851
qnwheresleep 852-854
qnspeakenglish 855-857
qntransgender 858-860
;
 
/****************************************/
/*   Assign formats to SAS variables    */
/****************************************/
;
format
sitecode $SITE.
age AGE.
sex SEX.
grade GRADE.
race4 RACE.
race7 RACE7S.
q67 $H67S.
q66 $H66S.
sexid SEXID.
sexid2 SEXIDB.
sexpart SEXPART.
sexpart2 SEXPARTB.
q8 $H8S.
q9 $H9S.
q10 $H10S.
q11 $H11S.
q12 $H12S.
q13 $H13S.
q14 $H14S.
q15 $H15S.
q16 $H16S.
q17 $H17S.
q18 $H18S.
q19 $H19S.
q20 $H20S.
q21 $H21S.
q22 $H22S.
q23 $H23S.
q24 $H24S.
q25 $H25S.
q26 $H26S.
q27 $H27S.
q28 $H28S.
q29 $H29S.
q30 $H30S.
q31 $H31S.
q32 $H32S.
q33 $H33S.
q34 $H34S.
q35 $H35S.
q36 $H36S.
q37 $H37S.
q38 $H38S.
q39 $H39S.
q40 $H40S.
q41 $H41S.
q42 $H42S.
q43 $H43S.
q44 $H44S.
q45 $H45S.
q46 $H46S.
q47 $H47S.
q48 $H48S.
q49 $H49S.
q50 $H50S.
q51 $H51S.
q52 $H52S.
q53 $H53S.
q54 $H54S.
q55 $H55S.
q56 $H56S.
q57 $H57S.
q58 $H58S.
q59 $H59S.
q60 $H60S.
q61 $H61S.
q62 $H62S.
q63 $H63S.
q64 $H64S.
q65 $H65S.
q68 $H68S.
q69 $H69S.
q70 $H70S.
q71 $H71S.
q72 $H72S.
q73 $H73S.
q74 $H74S.
q75 $H75S.
q76 $H76S.
q77 $H77S.
q78 $H78S.
q79 $H79S.
q80 $H80S.
q81 $H81S.
q82 $H82S.
q83 $H83S.
q84 $H84S.
q85 $H85S.
q86 $H86S.
q87 $H87S.
q88 $H88S.
q89 $H89S.
qbikehelmet $BIKE.
qdrivemarijuana $DRVMARJ.
qcelldriving $CELLDRV.
qpropertydamage $PROPDAM.
qbullyweight $BULLWGT.
qbullygender $BULLGEND.
qbullygay $BULLGAY.
qchokeself $CHOKE.
qcigschool $CIGS.
qchewtobschool $CHEWTOB.
qalcoholschool $ALCSCH.
qtypealcohol $ALCTYPE.
qhowmarijuana $HOWMARJ.
qmarijuanaschool $MARIJSCH.
qcurrentcocaine $CURRCOC.
qcurrentheroin $CURRHER.
qcurrentmeth $CURRMETH.
qhallucdrug $LSD.
qprescription30d $DRUG30D.
qgenderexp $EXPRESS.
qtaughtHIV $THIV.
qtaughtsexed $TSEXED.
qtaughtstd $TSTD.
qtaughtcondom $TCOND.
qtaughtbc $TBC.
qdietpop $DIETPOP.
qcoffeetea $COFFEE.
qsportsdrink $SPRTDRNK.
qenergydrink $ENRGDRNK.
qsugardrink $SGRDRNK.
qwater $WATER.
qfastfood $FASTFOOD.
qfoodallergy $ALLERGY.
qwenthungry $HUNGRY.
qmusclestrength $MUSCLE.
qsunscreenuse $SUNSCR.
qindoortanning $SUNTAN.
qsunburn $SUNBURN.
qconcentrating $CONCEN.
qcurrentasthma $CURRASTH.
qwheresleep $WHSLP.
qspeakenglish $ENGLISH.
qtransgender $TRNS.
;
 
/****************************************/
/*   Assign labels to SAS variables    */
/****************************************/
;
label
sitecode="Site code"
sitename="Site name"
sitetype="Site type"
sitetypenum="1=District, 2=State, 3=National"
year="4-digit Year of survey"
survyear="1=1991...14=2017"
weight="Analysis weight"
stratum="Analysis stratum"
PSU="Analysis primary sampling unit"
record="Record ID"
age="1= <=12...7=18+ years old"
sex="1=Female, 2=Male"
grade="1=9th...4=12th grade"
race4="4-level race variable"
race7="7-level race variable"
stheight="Height in meters"
stweight="Weight in kilograms"
bmi="Body Mass Index"
bmipct="BMI percentile"
qnobese="Had obesity"
qnowt="Were Overweight"
q67="Sexual identity"
q66="Sex of sexual contacts"
sexid="Sexual identity"
sexid2="Collapsed sexual identity"
sexpart="Sex of sex contact(s)"
sexpart2="Collapsed sex of sex contact(s)"
q8="Seat belt use"
q9="Riding with a drinking driver"
q10="Drinking and driving"
q11="Texting and driving"
q12="Weapon carrying"
q13="Weapon carrying at school"
q14="Gun carrying past 12 mos"
q15="Safety concerns at school"
q16="Threatened at school"
q17="Physical fighting"
q18="Physical fighting at school"
q19="Forced sexual intercourse"
q20="Sexual violence"
q21="Sexual dating violence"
q22="Physical dating violence"
q23="Bullying at school"
q24="Electronic bullying"
q25="Sad or hopeless"
q26="Considered suicide"
q27="Made a suicide plan"
q28="Attempted suicide"
q29="Injurious suicide attempt"
q30="Ever cigarette use"
q31="Initiation of cigarette smoking"
q32="Current cigarette use"
q33="Smoked >10 cigarettes"
q34="Electronic vapor product use"
q35="Current electronic vapor product use"
q36="EVP from store"
q37="Current smokeless tobacco use"
q38="Current cigar use"
q39="All tobacco product cessation"
q40="Ever alcohol use"
q41="Initiation of alcohol use"
q42="Current alcohol use"
q43="Source of alcohol"
q44="Current binge drinking"
q45="Largest number of drinks"
q46="Ever marijuana use"
q47="Initiation of marijuana use"
q48="Current marijuana use"
q49="Ever cocaine use"
q50="Ever inhalant use"
q51="Ever heroin use"
q52="Ever methamphetamine use"
q53="Ever ecstasy use"
q54="Ever synthetic marijuana use"
q55="Ever steroid use"
q56="Ever prescription pain medicine use"
q57="Illegal injected drug use"
q58="Illegal drugs at school"
q59="Ever sexual intercourse"
q60="Sex before 13 years"
q61="Multiple sex partners"
q62="Current sexual activity"
q63="Alcohol/drugs and sex"
q64="Condom use"
q65="Birth control pill use"
q68="Perception of weight"
q69="Weight loss"
q70="Fruit juice drinking"
q71="Fruit eating"
q72="Green salad eating"
q73="Potato eating"
q74="Carrot eating"
q75="Other vegetable eating"
q76="No soda drinking"
q77="No milk drinking"
q78="Breakfast eating"
q79="Physical activity >= 5 days"
q80="Television watching"
q81="Computer use"
q82="PE attendance"
q83="Sports team participation"
q84="Concussion"
q85="HIV testing"
q86="Oral health care"
q87="Asthma"
q88="Sleep"
q89="Grades in school"
qn8="Rarely or never wore a seat belt"
qn9="Rode with a driver who had been drinking alcohol"
qn10="Drove when drinking alcohol"
qn11="Texted or e-mailed while driving a car or other vehicle"
qn12="Carried a weapon"
qn13="Carried a weapon on school property"
qn14="Carried a gun"
qn15="Did not go to school because they felt unsafe at school or on their way to or from school"
qn16="Were threatened or injured with a weapon on school property"
qn17="Were in a physical fight"
qn18="Were in a physical fight on school property"
qn19="Were ever physically forced to have sexual intercourse"
qn20="Experienced sexual violence"
qn21="Experienced sexual dating violence"
qn22="Experienced physical dating violence"
qn23="Were bullied on school property"
qn24="Were electronically bullied"
qn25="Felt sad or hopeless"
qn26="Seriously considered attempting suicide"
qn27="Made a plan about how they would attempt suicide"
qn28="Attempted suicide"
qn29="Had a suicide attempt that resulted in an injury, poisoning, or overdose that had to be treated by a doctor or nurse"
qn30="Ever tried cigarette smoking"
qn31="First tried cigarette smoking before age 13 years"
qn32="Currently smoked cigarettes"
qn33="Smoked more than 10 cigarettes per day"
qn34="Ever used an electronic vapor product"
qn35="Currently used an electronic vapor product"
qn36="Usually got their own electronic vapor products by buying them in a store"
qn37="Currently used smokeless tobacco"
qn38="Currently smoked cigars"
qn39="Tried to quit using all tobacco products"
qn40="Ever drank alcohol"
qn41="Had their first drink of alcohol before age 13 years"
qn42="Currently drank alcohol"
qn43="Usually got the alcohol they drank by someone giving it to them"
qn44="Currently were binge drinking"
qn45="Reported that the largest number of drinks they had in a row was 10 or more"
qn46="Ever used marijuana"
qn47="Tried marijuana for the first time before age 13 years"
qn48="Currently used marijuana"
qn49="Ever used cocaine"
qn50="Ever used inhalants"
qn51="Ever used heroin"
qn52="Ever used methamphetamines"
qn53="Ever used ecstasy"
qn54="Ever used synthetic marijuana"
qn55="Ever took steroids without a doctor's prescription"
qn56="Ever took prescription pain medicine without a doctor's prescription or differently than how a doctor told them to use it"
qn57="Ever injected any illegal drug"
qn58="Were offered, sold, or given an illegal drug on school property"
qn59="Ever had sexual intercourse"
qn60="Had sexual intercourse for the first time before age 13 years"
qn61="Had sexual intercourse with four or more persons during their life"
qn62="Were currently sexually active"
qn63="Drank alcohol or used drugs before last sexual intercourse"
qn64="Used a condom during last sexual intercourse"
qn65="Used birth control pills before last sexual intercourse"
qn68="Described themselves as slightly or very overweight"
qn69="Were trying to lose weight"
qn70="Did not drink fruit juice"
qn71="Did not eat fruit"
qn72="Did not eat green salad"
qn73="Did not eat potatoes"
qn74="Did not eat carrots"
qn75="Did not eat other vegetables"
qn76="Did not drink a can, bottle, or glass of soda or pop"
qn77="Did not drink milk"
qn78="Did not eat breakfast"
qn79="Were physically active at least 60 minutes per day on 5 or more days"
qn80="Watched television 3 or more hours per day"
qn81="Played video or computer games or used a computer 3 or more hours per day"
qn82="Attended physical education (PE) classes on 1 or more days"
qn83="Played on at least one sports team"
qn84="Had a concussion from playing a sport or being physically active"
qn85="Were ever tested for human immunodeficiency virus (HIV)"
qn86="Saw a dentist"
qn87="Had ever been told by a doctor or nurse that they had asthma"
qn88="Got 8 or more hours of sleep"
qn89="Described their grades in school as mostly A's or B's"
qnfrcig="Currently smoked cigarettes frequently"
qndaycig="Currently smoked cigarettes daily"
qnfrevp="Currently used an electronic vapor product frequently"
qndayevp="Currently used an elecctronic vapor product daily"
qnfrskl="Currently used smokeless tobacco frequently qndayskl Currently used smokeless tobacco daily"
qndayskl="Currently used smokeless daily"
qnfrcgr="Currently smoked cigars frequently"
qndaycgr="Currently smoked cigars daily"
qntb2="Currently smoked cigarettes or cigars"
qntb3="Currently smoked cigarettes or cigars or used smokeless tobacco"
qntb4="Currently smoked cigarettes or cigars or used smokeless tobacco or electronic vapor products"
qniudimp="Used an IUD (e.g., Mirena or ParaGard) or implant (e.g., Implanon or Nexplanon) before last sexual intercourse"
qnshparg="Used a shot (e.g., Depo-Provera), patch (e.g., OrthoEvra), or birth control ring (e.g., NuvaRing) before last sexual intercourse"
qnothhpl="Used birth control pills; an IUD (such as Mirena or ParaGard) or implant (such as Implanon or Nexplanon); or a shot (such as Depo-Provera), patch (such as OrthoEvra), or birth control ring (such as NuvaRing) before last sexual intercourse"
qndualbc="Used both a condom during last sexual intercourse and birth control pills; an IUD (such as Mirena or ParaGard) or implant (such as Implanon or Nexplanon); or a shot (such as Depo-Provera), patch (such as OrthoEvra), or birth control ring (such as NuvaRing)"
qnbcnone="Did not use any method to prevent pregnancy during last sexual intercourse"
qnfr0="Did not eat fruit or drink 100% fruit juices"
qnfr1="Ate fruit or drank 100% fruit juices one or more times per day"
qnfr2="Ate fruit or drank 100% fruit juices two or more times per day"
qnfr3="Ate fruit or drank 100% fruit juices three or more times per day"
qnveg0="Did not eat vegetables"
qnveg1="Ate vegetables one or more times per day"
qnveg2="Ate vegetables two or more times per day"
qnveg3="Ate vegetables three or more times per day"
qnsoda1="Drank a can, bottle, or glass of soda or pop one or more times per day"
qnsoda2="Drank a can, bottle, or glass of soda or pop two or more times per day"
qnsoda3="Drank a can, bottle, or glass of soda or pop three or more times per day"
qnmilk1="Drank one or more glasses per day of milk"
qnmilk2="Drank two or more glasses per day of milk"
qnmilk3="Drank three or more glasses per day of milk"
qnbk7day="Ate breakfast on all 7 days"
qnpa0day="Did not participate in at least 60 minutes of physical activity on at least 1 day"
qnpa7day="Were physically active at least 60 minutes per day on all 7 days"
qndlype="Attended physical education (PE) classes on all 5 days"
qnnodnt="Never saw a dentist"
qbikehelmet="Bicycle helmet use"
qdrivemarijuana="Drive when using marijuana"
qcelldriving="Cell phone use while driving"
qpropertydamage="Property stolen at school >= 1 time"
qbullyweight="Victim of teasing b/c of physical appearance"
qbullygender="Victim of gender teasing"
qbullygay="Ever been teased b/c labeled GLB"
qchokeself="Ever been choked/choked self on purpose"
qcigschool="Currently smoke at school >=1 days"
qchewtobschool="Current snuff @ school"
qalcoholschool="Current drink at school"
qtypealcohol="Usual alcohol type"
qhowmarijuana="Usual use of marijuana"
qmarijuanaschool="Marijuana use at school"
qcurrentcocaine="Current cocaine use"
qcurrentheroin="Current heroin use"
qcurrentmeth="Current meth use"
qhallucdrug="Ever used hallucinogenic drugs"
qprescription30d="Current drug w/o prescription"
qgenderexp="Others description of your masc/fem"
qtaughtHIV="Ever taught about AIDS/HIV at school"
qtaughtsexed="Ever had sex education in school"
qtaughtstd="Ever been taught in school about STDs"
qtaughtcondom="Ever been taught in school about how to use condom"
qtaughtbc="Ever been taught about BC methods in sch"
qdietpop="Diet soda drinking >=1 time/day"
qcoffeetea="Coffee/tea drinking >=1 time/day"
qsportsdrink="Sports drinks"
qenergydrink="Energy drink >=1 time/day"
qsugardrink="Sugar-sweetened beverage >=1 time/day"
qwater="Plain water"
qfastfood="Meal/snack fast food >= 3 days"
qfoodallergy="Food allergies"
qwenthungry="How often went hungry"
qmusclestrength="Muscle strengthening"
qsunscreenuse="Sunscreen use outside"
qindoortanning="Indoor tanning"
qsunburn="Sunburn"
qconcentrating="Difficulty concentrating"
qcurrentasthma="Current asthma"
qwheresleep="Homelessness"
qspeakenglish="How well speak English"
qtransgender="Transgender"
qnbikehelmet="Rarely or never wore a bicycle helmet"
qndrivemarijuana="Drove a car or other vehicle when they had been using marijuana"
qncelldriving="Talked on a cell phone use while driving"
qnpropertydamage="Reported that their property had been stolen or deliberately damaged on school property one or more times"
qnbullyweight="Have been the victim of teasing or name calling because of their weight, size, or physical appearance"
qnbullygender="Have been the victim of teasing or name calling because of their gender"
qnbullygay="Have been the victim of teasing or name calling because someone thought they were gay, lesbian, or bisexual"
qnchokeself="Have ever been choked by someone or tried to choke themselves on purpose"
qncigschool="Smoked cigarettes on school property"
qnchewtobschool="Used chewing tobacco, snuff, or dip on school property"
qnalcoholschool="Currently had at least one drink of alcohol on school property"
qntypealcohol="Reported liquor as the type of alcohol they usually drank"
qnhowmarijuana="Usually used marijuana by smoking it in a joint, bong, pipe, or blunt"
qnmarijuanaschool="Used marijuana on school property"
qncurrentcocaine="Currently used any form of cocaine"
qncurrentheroin="Currently used heroin"
qncurrentmeth="Currently used methamphetamines"
qnhallucdrug="Ever used hallucinogenic drugs"
qnprescription30d="Currently took a prescription drug without a doctor's prescription"
qngenderexp="Think other people at school would describe them as equally feminine and masculine"
qntaughtHIV="Have been taught about AIDS or HIV infection in school"
qntaughtsexed="Have had sex education in school"
qntaughtstd="Have been taught in school about sexually transmitted diseases (STDs)"
qntaughtcondom="Have ever been taught in school about how to use a condom to prevent pregnancy or sexually transmitted diseases (STDs)"
qntaughtbc="Have been taught in school about birth control methods"
qndietpop="Drank a can, bottle, or glass of diet soda or pop"
qncoffeetea="Drank a cup, can, or bottle of coffee, coffee drinks, or any kind of tea"
qnsportsdrink="Did not drink a can, bottle, or glass of a sports drink"
qnspdrk1="Drank a can, bottle, or glass of a sports drink one or more times per day"
qnspdrk2="Drank a can, bottle, or glass of a sports drink two or more times per day"
qnspdrk3="Drank a can, bottle, or glass of a sports drink three or more times per day"
qnenergydrink="Drank a can, bottle, or glass of an energy drink"
qnsugardrink="Drank a can, bottle, or glass of a sugar-sweetened beverage"
qnwater="Did not drink a bottle or glass of plain water"
qnwater1="Drank one or more glasses per day of plain water"
qnwater2="Drank two or more glasses per day of plain water"
qnwater3="Drank three or more glasses per day of plain water"
qnfastfood="Ate at least one meal or snack from a fast food restaurant"
qnfoodallergy="Have to avoid some foods because eating the food could cause an allergic reaction"
qnwenthungry="Most of the time or always went hungry because there was not enough food in their home"
qnmusclestrength="Did exercises to strengthen or tone their muscles on three or more days"
qnsunscreenuse="Most of the time or always wear sunscreen"
qnindoortanning="Used an indoor tanning device"
qnsunburn="Had a sunburn"
qnconcentrating="Have serious difficulty concentrating, remembering, or making decisions"
qncurrentasthma="Had been told by a doctor or nurse that they had asthma and who still have asthma"
qnwheresleep="Usually slept in the home of a friend, family member, or other person because they had to leave their home or their parent or guardian could not afford housing"
qnspeakenglish="Speak English well or very well"
qntransgender="Are transgender"
;
run;
