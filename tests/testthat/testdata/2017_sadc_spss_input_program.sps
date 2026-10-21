* This SPSS syntax file reads ASCII format (text format) 2017 SADC data and creates a formatted 
and labeled SPSS data file that you can analyze in SPSS.
 
* Change the file location specifications from 'c:\sadc2017' to the location where you 
downloaded, unzipped, and stored the 2017 SADC ASCII data file before you run this syntax; 
Change the location specification in three places - in the 'data list' statement at the top 
of the syntax and in the 'save' and 'get' statements at the end of this syntax file.

* Change 'xxxxxxx' in the 'data list' statement and the 'save' and 'get' statements at the 
end of this syntax file to 'national', 'district', 'state_a_m', or 'state_n_z' depending on which 
file you are analyzing.   

DATA LIST FILE="C:\sadc2017\sadc_2017_xxxxxxx.dat"/
sitecode 1-5 (A) sitename 6-55 (A) sitetype 56-105 (A) sitetypenum 106-113
year 114-121 survyear 122-124 weight 125-134 stratum 135-142
PSU 143-150 record 151-158 age 159-161 sex 162-164 grade 165-167
race4 168-170 race7 171-173 stheight 174-181 stweight 182-189
bmi 190-197 bmipct 198-205 qnobese 206-208 qnowt 209-211 
q67 212-212 q66 213-213 sexid 214-221 sexid2 222-229 sexpart 230-237 sexpart2 238-245
q8 246-246 q9 247-247 q10 248-248
q11 249-249 q12 250-250 q13 251-251 
q14 252-252 q15 253-253 q16 254-254 
q17 255-255 q18 256-256 q19 257-257 
q20 258-258 q21 259-259 q22 260-260 
q23 261-261 q24 262-262 q25 263-263 
q26 264-264 q27 265-265 q28 266-266 
q29 267-267 q30 268-268 q31 269-269 
q32 270-270 q33 271-271 q34 272-272 
q35 273-273 q36 274-274 q37 275-275 
q38 276-276 q39 277-277 q40 278-278 
q41 279-279 q42 280-280 q43 281-281 
q44 282-282 q45 283-283 q46 284-284 
q47 285-285 q48 286-286 q49 287-287 
q50 288-288 q51 289-289 q52 290-290 
q53 291-291 q54 292-292 q55 293-293 
q56 294-294 q57 295-295 q58 296-296 
q59 297-297 q60 298-298 q61 299-299 
q62 300-300 q63 301-301 q64 302-302
q65 303-303 q68 304-304 q69 305-305
q70 306-306 q71 307-307 q72 308-308
q73 309-309 q74 310-310 q75 311-311
q76 312-312 q77 313-313 q78 314-314
q79 315-315 q80 316-316 q81 317-317
q82 318-318 q83 319-319 q84 320-320
q85 321-321 q86 322-322 q87 323-323
q88 324-324 q89 325-325
qn8 326-328 qn9 329-331 qn10 332-334
qn11 335-337 qn12 338-340 qn13 341-343 
qn14 344-346 qn15 347-349 qn16 350-352
qn17 353-355 qn18 356-358 qn19 359-361 
qn20 362-364 qn21 365-367 qn22 368-370 
qn23 371-373 qn24 374-376 qn25 377-379 
qn26 380-382 qn27 383-385 qn28 386-388 
qn29 389-391 qn30 392-394 qn31 395-397 
qn32 398-400 qn33 401-403 qn34 404-406 
qn35 407-409 qn36 410-412 qn37 413-415 
qn38 416-418 qn39 419-421 qn40 422-424
qn41 425-427 qn42 428-430 qn43 431-433 
qn44 434-436 qn45 437-439 qn46 440-442 
qn47 443-445 qn48 446-448 qn49 449-451 
qn50 452-454 qn51 455-457 qn52 458-460 
qn53 461-463 qn54 464-466 qn55 467-469 
qn56 470-472 qn57 473-475 qn58 476-478 
qn59 479-481 qn60 482-484 qn61 485-487 
qn62 488-490 qn63 491-493 qn64 494-496 
qn65 497-499 qn68 500-502 qn69 503-505 
qn70 506-508 qn71 509-511 qn72 512-514 
qn73 515-517 qn74 518-520 qn75 521-523 
qn76 524-526 qn77 527-529 qn78 530-532 
qn79 533-535 qn80 536-538 qn81 539-541 
qn82 542-544 qn83 545-547 qn84 548-550 
qn85 551-553 qn86 554-556 qn87 557-559 
qn88 560-562 qn89 563-565 
qnfrcig 566-568 qndaycig 569-571 qnfrevp 572-574
qndayevp 575-577 qnfrskl 578-580 qndayskl 581-583
qnfrcgr 584-586 qndaycgr 587-589 qntb2 590-592
qntb3 593-595 qntb4 596-598 qniudimp 599-601
qnshparg 602-604 qnothhpl 605-607 qndualbc 608-610
qnbcnone 611-613 qnfr0 614-616 qnfr1 617-619
qnfr2 620-622 qnfr3 623-625 qnveg0 626-628
qnveg1 629-631 qnveg2 632-634 qnveg3 635-637
qnsoda1 638-640 qnsoda2 641-643 qnsoda3 644-646
qnmilk1 647-649 qnmilk2 650-652 qnmilk3 653-655
qnbk7day 656-658 qnpa0day 659-661 qnpa7day 662-664
qndlype 665-667 qnnodnt 668-670
qbikehelmet 671-671 qdrivemarijuana 672-672 qcelldriving 673-673
qpropertydamage 674-674 qbullyweight 675-675 qbullygender 676-676
qbullygay 677-677 qchokeself 678-678 qcigschool 679-679
qchewtobschool 680-680 qalcoholschool 681-681 qtypealcohol 682-682
qhowmarijuana 683-683 qmarijuanaschool 684-684 qcurrentcocaine 685-685
qcurrentheroin 686-686 qcurrentmeth 687-687 qhallucdrug 688-688
qprescription30d 689-689 qgenderexp 690-690 qtaughtHIV 691-691
qtaughtsexed 692-692 qtaughtstd 693-693 qtaughtcondom 694-694
qtaughtbc 695-695 qdietpop 696-696 qcoffeetea 697-697
qsportsdrink 698-698 qenergydrink 699-699 qsugardrink 700-700
qwater 701-701 qfastfood 702-702 qfoodallergy 703-703
qwenthungry 704-704 qmusclestrength 705-705 qsunscreenuse 706-706
qindoortanning 707-707 qsunburn 708-708 qconcentrating 709-709
qcurrentasthma 710-710 qwheresleep 711-711 qspeakenglish 712-712
qtransgender 713-713
qnbikehelmet 714-716 qndrivemarijuana 717-719 qncelldriving 720-722
qnpropertydamage 723-725 qnbullyweight 726-728 qnbullygender 729-731
qnbullygay 732-734 qnchokeself 735-737 qncigschool 738-740
qnchewtobschool 741-743 qnalcoholschool 744-746 qntypealcohol 747-749
qnhowmarijuana 750-752 qnmarijuanaschool 753-755 qncurrentcocaine 756-758
qncurrentheroin 759-761 qncurrentmeth 762-764 qnhallucdrug 765-767
qnprescription30d 768-770 qngenderexp 771-773 qntaughtHIV 774-776
qntaughtsexed 777-779 qntaughtstd 780-782 qntaughtcondom 783-785
qntaughtbc 786-788 qndietpop 789-791 qncoffeetea 792-794
qnsportsdrink 795-797 qnspdrk1 798-800 qnspdrk2 801-803
qnspdrk3 804-806 qnenergydrink 807-809 qnsugardrink 810-812
qnwater 813-815 qnwater1 816-818 qnwater2 819-821
qnwater3 822-824 qnfastfood 825-827 qnfoodallergy 828-830
qnwenthungry 831-833 qnmusclestrength 834-836 qnsunscreenuse 837-839
qnindoortanning 840-842 qnsunburn 843-845 qnconcentrating 846-848
qncurrentasthma 849-851 qnwheresleep 852-854 qnspeakenglish 855-857
qntransgender 858-860.
EXECUTE.
 
VARIABLE LABELS
sitecode "Site code"
sitename "Site name"
sitetype "Site type"
sitetypenum "1=District, 2=State, 3=National"
year "4-digit Year of survey"
survyear "1=1991...14=2017"
weight "Analysis weight"
stratum "Analysis stratum"
PSU "Analysis primary sampling unit"
record "Record ID"
age "1= <=12...7=18+ years old"
sex "1=Female, 2=Male"
grade "1=9th...4=12th grade"
race4 "4-level race variable"
race7 "7-level race variable"
stheight "Height in meters"
stweight "Weight in kilograms"
bmi "Body Mass Index"
bmipct "BMI percentile"
qnobese "Had obesity"
qnowt "Were overweight"
q67 "Sexual identity"
q66 "Sex of sexual contacts"
sexid "Sexual identity"
sexid2 "Collapsed sexual identity"
sexpart "Sex of sex contact(s)"
sexpart2 "Collapsed sex of sex contact(s)"
Q8 "Seat belt use"
Q9 "Riding with a drinking driver"
Q10 "Drinking and driving"
Q11 "Texting and driving"
Q12 "Weapon carrying"
Q13 "Weapon carrying at school"
Q14 "Gun carrying past 12 mos"
Q15 "Safety concerns at school"
Q16 "Threatened at school"
Q17 "Physical fighting"
Q18 "Physical fighting at school"
Q19 "Forced sexual intercourse"
Q20 "Sexual violence"
Q21 "Sexual dating violence"
Q22 "Physical dating violence"
Q23 "Bullying at school"
Q24 "Electronic bullying"
Q25 "Sad or hopeless"
Q26 "Considered suicide"
Q27 "Made a suicide plan"
Q28 "Attempted suicide"
Q29 "Injurious suicide attempt"
Q30 "Ever cigarette use"
Q31 "Initiation of cigarette smoking"
Q32 "Current cigarette use"
Q33 "Smoked >10 cigarettes"
Q34 "Electronic vapor product use"
Q35 "Current electronic vapor product use"
Q36 "EVP from store"
Q37 "Current smokeless tobacco use"
Q38 "Current cigar use"
Q39 "All tobacco product cessation"
Q40 "Ever alcohol use"
Q41 "Initiation of alcohol use"
Q42 "Current alcohol use"
Q43 "Source of alcohol"
Q44 "Current binge drinking"
Q45 "Largest number of drinks"
Q46 "Ever marijuana use"
Q47 "Initiation of marijuana use"
Q48 "Current marijuana use"
Q49 "Ever cocaine use"
Q50 "Ever inhalant use"
Q51 "Ever heroin use"
Q52 "Ever methamphetamine use"
Q53 "Ever ecstasy use"
Q54 "Ever synthetic marijuana use"
Q55 "Ever steroid use"
Q56 "Ever prescription pain medicine use"
Q57 "Illegal injected drug use"
Q58 "Illegal drugs at school"
Q59 "Ever sexual intercourse"
Q60 "Sex before 13 years"
Q61 "Multiple sex partners"
Q62 "Current sexual activity"
Q63 "Alcohol/drugs and sex"
Q64 "Condom use"
Q65 "Birth control pill use"
Q68 "Perception of weight"
Q69 "Weight loss"
Q70 "Fruit juice drinking"
Q71 "Fruit eating"
Q72 "Green salad eating"
Q73 "Potato eating"
Q74 "Carrot eating"
Q75 "Other vegetable eating"
Q76 "No soda drinking"
Q77 "No milk drinking"
Q78 "Breakfast eating"
Q79 "Physical activity >= 5 days"
Q80 "Television watching"
Q81 "Computer use"
Q82 "PE attendance"
Q83 "Sports team participation"
Q84 "Concussion"
Q85 "HIV testing"
Q86 "Oral health care"
Q87 "Asthma"
Q88 "Sleep"
Q89 "Grades in school"
QN8 "Rarely or never wore a seat belt"
QN9 "Rode with a driver who had been drinking alcohol"
QN10 "Drove a car or other vehicle when they had been drinking alcohol"
QN11 "Texted or e-mailed while driving a car or other vehicle"
QN12 "Carried a weapon"
QN13 "Carried a weapon on school property"
QN14 "Carried a gun"
QN15 "Did not go to school because they felt unsafe at school or on their way to or from school"
QN16 "Were threatened or injured with a weapon on school property"
QN17 "Were in a physical fight"
QN18 "Were in a physical fight on school property"
QN19 "Were ever physically forced to have sexual intercourse"
QN20 "Experienced sexual violence"
QN21 "Experienced sexual dating violence"
QN22 "Experienced physical dating violence"
QN23 "Were bullied on school property"
QN24 "Were electronically bullied"
QN25 "Felt sad or hopeless"
QN26 "Seriously considered attempting suicide"
QN27 "Made a plan about how they would attempt suicide"
QN28 "Attempted suicide"
QN29 "Had a suicide attempt that resulted in an injury, poisoning, or overdose that had to be treated by a doctor or nurse"
QN30 "Ever tried cigarette smoking"
QN31 "First tried cigarette smoking before age 13 years"
QN32 "Currently smoked cigarettes"
QN33 "Smoked more than 10 cigarettes per day"
QN34 "Ever used an electronic vapor product"
QN35 "Currently used an electronic vapor product"
QN36 "Usually got their own electronic vapor products by buying them in a store"
QN37 "Currently used smokeless tobacco"
QN38 "Currently smoked cigars"
QN39 "Tried to quit using all tobacco products"
QN40 "Ever drank alcohol"
QN41 "Had their first drink of alcohol before age 13 years"
QN42 "Currently drank alcohol"
QN43 "Usually got the alcohol they drank by someone giving it to them"
QN44 "Currently were binge drinking"
QN45 "Reported that the largest number of drinks they had in a row was 10 or more"
QN46 "Ever used marijuana"
QN47 "Tried marijuana for the first time before age 13 years"
QN48 "Currently used marijuana"
QN49 "Ever used cocaine"
QN50 "Ever used inhalants"
QN51 "Ever used heroin"
QN52 "Ever used methamphetamines"
QN53 "Ever used ecstasy"
QN54 "Ever used synthetic marijuana"
QN55 "Ever took steroids without a doctor's prescription"
QN56 "Ever took prescription pain medicine without a doctor's prescription or differently than how a doctor told them to use it"
QN57 "Ever injected any illegal drug"
QN58 "Were offered, sold, or given an illegal drug on school property"
QN59 "Ever had sexual intercourse"
QN60 "Had sexual intercourse for the first time before age 13 years"
QN61 "Had sexual intercourse with four or more persons during their life"
QN62 "Were currently sexually active"
QN63 "Drank alcohol or used drugs before last sexual intercourse"
QN64 "Used a condom during last sexual intercourse"
QN65 "Used birth control pills before last sexual intercourse"
QN68 "Described themselves as slightly or very overweight"
QN69 "Were trying to lose weight"
QN70 "Did not drink fruit juice"
QN71 "Did not eat fruit"
QN72 "Did not eat green salad"
QN73 "Did not eat potatoes"
QN74 "Did not eat carrots"
QN75 "Did not eat other vegetables"
QN76 "Did not drink a can, bottle, or glass of soda or pop"
QN77 "Did not drink milk"
QN78 "Did not eat breakfast"
QN79 "Were physically active at least 60 minutes per day on 5 or more days"
QN80 "Watched television 3 or more hours per day"
QN81 "Played video or computer games or used a computer 3 or more hours per day"
QN82 "Attended physical education (PE) classes on 1 or more days"
QN83 "Played on at least one sports team"
QN84 "Had a concussion from playing a sport or being physically active"
QN85 "Were ever tested for human immunodeficiency virus (HIV)"
QN86 "Saw a dentist"
QN87 "Had ever been told by a doctor or nurse that they had asthma"
QN88 "Got 8 or more hours of sleep"
QN89 "Described their grades in school as mostly A's or B's"
qnfrcig "Currently smoked cigarettes frequently"
qndaycig "Currently smoked cigarettes daily"
qnfrevp "Currently used an electronic vapor product frequently"
qndayevp "Currently used an elecctronic vapor product daily"
qnfrskl "Currently used smokeless tobacco frequently"
qndayskl "Currently used smokeless tobacco daily"
qnfrcgr "Currently smoked cigars frequently"
qndaycgr "Currently smoked cigars daily"
qntb2 "Currently smoked cigarettes or cigars"
qntb3 "Currently smoked cigarettes or cigars or used smokeless tobacco"
qntb4 "Currently smoked cigarettes or cigars or used smokeless tobacco or electronic vapor products"
qniudimp "Used an IUD (e.g., Mirena or ParaGard) or implant (e.g., Implanon or Nexplanon) before last sexual intercourse"
qnshparg "Used a shot (e.g., Depo-Provera), patch (e.g., OrthoEvra), or birth control ring (e.g., NuvaRing) before last sexual intercourse"
qnothhpl "Used birth control pills; an IUD (such as Mirena or ParaGard) or implant (such as Implanon or Nexplanon); or a shot (such as Depo-Provera), patch (such as OrthoEvra), or birth control ring (such as NuvaRing) before last sexual intercourse"
qndualbc "Used both condom during last sexual intercourse and birth control pills; IUD (e.g., Mirena/ParaGard)/implant (e.g., Implanon/Nexplanon); or shot (e.g., Depo-Provera)/patch (e.g., OrthoEvra)/birth control ring (e.g., NuvaRing) before last sexual intercourse"
qnbcnone "Did not use any method to prevent pregnancy during last sexual intercourse"
qnfr0 "Did not eat fruit or drink 100% fruit juices"
qnfr1 "Ate fruit or drank 100% fruit juices one or more times per day"
qnfr2 "Ate fruit or drank 100% fruit juices two or more times per day"
qnfr3 "Ate fruit or drank 100% fruit juices three or more times per day"
qnveg0 "Did not eat vegetables"
qnveg1 "Ate vegetables one or more times per day"
qnveg2 "Ate vegetables two or more times per day"
qnveg3 "Ate vegetables three or more times per day"
qnsoda1 "Drank a can, bottle, or glass of soda or pop one or more times per day"
qnsoda2 "Drank a can, bottle, or glass of soda or pop two or more times per day"
qnsoda3 "Drank a can, bottle, or glass of soda or pop three or more times per day"
qnmilk1 "Drank one or more glasses per day of milk"
qnmilk2 "Drank two or more glasses per day of milk"
qnmilk3 "Drank three or more glasses per day of milk"
qnbk7day "Ate breakfast on all 7 days"
qnpa0day "Did not participate in at least 60 minutes of physical activity on at least 1 day"
qnpa7day "Were physically active at least 60 minutes per day on all 7 days"
qndlype "Attended physical education (PE) classes on all 5 days"
qnnodnt "Never saw a dentist"
qbikehelmet "Bicycle helmet use"
qdrivemarijuana "Drive when using marijuana"
qcelldriving "Did you talk on cell phone while driving"
qpropertydamage "Property stolen at school >= 1 time"
qbullyweight "Ever been teased because of weight"
qbullygender "Victim of gender teasing"
qbullygay "Ever been teased b/c labeled GLB"
qchokeself "Ever been choked/choked self on purpose"
qcigschool "Days use cigarettes school property 30 days"
qchewtobschool "Days use snuff school property 30 days"
qalcoholschool "How many days drink @ school 30 days"
qtypealcohol "What type of alcohol usually drink 30d"
qhowmarijuana "Usual use of marijuana"
qmarijuanaschool "How many times marijuana @ school 30 days"
qcurrentcocaine "How many times use cocaine 30 days"
qcurrentheroin "Current heroin use"
qcurrentmeth "Current meth use"
qhallucdrug "Ever used LSD"
qprescription30d "Times take drug w/o prescription 30d"
qgenderexp "How others would describe you"
qtaughtHIV "Ever taught about AIDS/HIV at school"
qtaughtsexed "Ever had sex education in school"
qtaughtstd "Ever been taught in school about STDs"
qtaughtcondom "Ever been taught in school about how to use condom"
qtaughtbc "Ever been taught about BC methods in sch"
qdietpop "How many times diet soda past 7 days"
qcoffeetea "Times drink coffee or tea past 7 days"
qsportsdrink "Sports drinks"
qenergydrink "How many times energy drink past 7 days"
qsugardrink "Times sugar-sweetened beverage past 7d"
qwater "Plain water"
qfastfood "Days 1+ meal/snack fast food past 7d"
qfoodallergy "Food allergies"
qwenthungry "How often went hungry"
qmusclestrength "Muscle strengthening"
qsunscreenuse "Sunscreen use outside"
qindoortanning "Indoor tanning"
qsunburn "Sunburn"
qconcentrating "Difficulty concentrating"
qcurrentasthma "Do you still have asthma"
qwheresleep "Homelessness"
qspeakenglish "How well speak English"
qtransgender "Transgender"
qnbikehelmet "Rarely or never wore a bicycle helmet"
qndrivemarijuana "Drove a car or other vehicle when they had been using marijuana"
qncelldriving "Talked on cell phone driving 1+ past 30d"
qnpropertydamage "Reported that their property had been stolen or deliberately damaged on school property one or more times"
qnbullyweight "Been teased b/c of weight past 12 mos"
qnbullygender "Been teased because of gender"
qnbullygay "Been teased b/c labeled GLB past 12 mos"
qnchokeself "Choked yourself on purpose"
qncigschool "Used cigarettes at school 1+ 30 days"
qnchewtobschool "Used snuff/dip at school 1+ 30 days"
qnalcoholschool "Had 1+ drinks at school 1+ 30 days"
qntypealcohol "Liquor type alcohol drank past 30 days"
qnhowmarijuana "Usually used marijuana by smoking it in a joint, bong, pipe, or blunt"
qnmarijuanaschool "Used marijuana @ school 1+ times 30 day"
qncurrentcocaine "Used cocaine 1+ times past 30 days"
qncurrentheroin "Used heroin 1+ times past 30 days"
qncurrentmeth "Used meth 1+ times past 30 days"
qnhallucdrug "Used LSD 1+ times"
qnprescription30d "Prescription drug 1+ times past 30 days"
qngenderexp "Equally feminine and masculine"
qntaughtHIV "Been taught about HIV in school"
qntaughtsexed "Had sex education in school ever"
qntaughtstd "Been taught in school about STDs ever"
qntaughtcondom "Been taught how to use a condom in sch"
qntaughtbc "Been taught in school about BC methods"
qndietpop "Drink 1+ times/day diet soda past 7d"
qncoffeetea "Drank 1+ times/day coffee/tea past 7d"
qnsportsdrink "Did not drink a can, bottle, or glass of a sports drink"
qnspdrk1 "Drank a can, bottle, or glass of a sports drink one or more times per day"
qnspdrk2 "Drank a can, bottle, or glass of a sports drink two or more times per day"
qnspdrk3 "Drank a can, bottle, or glass of a sports drink three or more times per day"
qnenergydrink "Drank 1+ times/day energy drink past 7d"
qnsugardrink "Drank 1+times/day sugar beverage past 7d"
qnwater "Did not drink a bottle or glass of plain water"
qnwater1 "Drank one or more glasses per day of water"
qnwater2 "Drank two or more glasses per day of water"
qnwater3 "Drank three or more glasses per day of water"
qnfastfood "Ate 1+ meal/snack fast food 3+ days"
qnfoodallergy "Have to avoid some foods because eating the food could cause an allergic reaction"
qnwenthungry "Mostly/Always went hungry past 30 days"
qnmusclestrength "Strengthened muscles 3+ of past 7 days"
qnsunscreenuse "Mostly or always wear sunscreen"
qnindoortanning "Used 1+ times indoor tanning"
qnsunburn "Had a sunburn"
qnconcentrating "Have serious difficulty concentrating, remembering, or making decisions"
qncurrentasthma "With current asthma"
qnwheresleep "Usually slept in the home of a friend, family member, or other person because they had to leave their home or their parent or guardian cannot afford housing"
qnspeakenglish "Speak English well or very well"
qntransgender "Are transgender".
 
VALUE LABELS
Q8
1 "Never"
2 "Rarely"
3 "Sometimes"
4 "Most of the time"
5 "Always"
/
Q9
1 "0 times"
2 "1 time"
3 "2 or 3 times"
4 "4 or 5 times"
5 "6 or more times"
/
Q10
1 "Did not drive"
2 "0 times"
3 "1 time"
4 "2 or 3 times"
5 "4 or 5 times"
6 "6 or more times"
/
Q11
1 "Did not drive"
2 "0 days"
3 "1 or 2 days"
4 "3 to 5 days"
5 "6 to 9 days"
6 "10 to 19 days"
7 "20 to 29 days"
8 "All 30 days"
/
Q12
1 "0 days"
2 "1 day"
3 "2 or 3 days"
4 "4 or 5 days"
5 "6 or more days"
/
Q13
1 "0 days"
2 "1 day"
3 "2 or 3 days"
4 "4 or 5 days"
5 "6 or more days"
/
Q14
1 "0 days"
2 "1 day"
3 "2 or 3 days"
4 "4 or 5 days"
5 "6 or more days"
/
Q15
1 "0 days"
2 "1 day"
3 "2 or 3 days"
4 "4 or 5 days"
5 "6 or more days"
/
Q16
1 "0 times"
2 "1 time"
3 "2 or 3 times"
4 "4 or 5 times"
5 "6 or 7 times"
6 "8 or 9 times"
7 "10 or 11 times"
8 "12 or more times"
/
Q17
1 "0 times"
2 "1 time"
3 "2 or 3 times"
4 "4 or 5 times"
5 "6 or 7 times"
6 "8 or 9 times"
7 "10 or 11 times"
8 "12 or more times"
/
Q18
1 "0 times"
2 "1 time"
3 "2 or 3 times"
4 "4 or 5 times"
5 "6 or 7 times"
6 "8 or 9 times"
7 "10 or 11 times"
8 "12 or more times"
/
Q19
1 "Yes"
2 "No"
/
Q20
1 "0 times"
2 "1 time"
3 "2 or 3 times"
4 "4 or 5 times"
5 "6 or more times"
/
Q21
1 "Did not date"
2 "0 times"
3 "1 time"
4 "2 or 3 times"
5 "4 or 5 times"
6 "6 or more times"
/
Q22
1 "Did not date"
2 "0 times"
3 "1 time"
4 "2 or 3 times"
5 "4 or 5 times"
6 "6 or more times"
/
Q23
1 "Yes"
2 "No"
/
Q24
1 "Yes"
2 "No"
/
Q25
1 "Yes"
2 "No"
/
Q26
1 "Yes"
2 "No"
/
Q27
1 "Yes"
2 "No"
/
Q28
1 "0 times"
2 "1 time"
3 "2 or 3 times"
4 "4 or 5 times"
5 "6 or more times"
/
Q29
1 "Did not attempt suicide"
2 "Yes"
3 "No"
/
Q30
1 "Yes"
2 "No"
/
Q31
1 "Never tried cigarette smoking"
2 "8 years old or younger"
3 "9 or 10 years old"
4 "11 or 12 years old"
5 "13 or 14 years old"
6 "15 or 16 years old"
7 "17 years old or older"
/
Q32
1 "0 days"
2 "1 or 2 days"
3 "3 to 5 days"
4 "6 to 9 days"
5 "10 to 19 days"
6 "20 to 29 days"
7 "All 30 days"
/
Q33
1 "Did not smoke cigarettes"
2 "Less than 1 cigarette"
3 "1 cigarette"
4 "2 to 5 cigarettes"
5 "6 to 10 cigarettes"
6 "11 to 20 cigarettes"
7 "More than 20 cigarettes"
/
Q34
1 "Yes"
2 "No"
/
Q35
1 "0 days"
2 "1 or 2 days"
3 "3 to 5 days"
4 "6 to 9 days"
5 "10 to 19 days"
6 "20 to 29 days"
7 "All 30 days"
/
Q36
1 "Did not use any vapor products"
2 "Bought them in a store"
3 "I got them on the Internet"
4 "Someone else bought them"
5 "Borrowed them"
6 "A person 18 or older gave me"
7 "Took them from a store"
8 "Some other way"
/
Q37
1 "0 days"
2 "1 or 2 days"
3 "3 to 5 days"
4 "6 to 9 days"
5 "10 to 19 days"
6 "20 to 29 days"
7 "All 30 days"
/
Q38
1 "0 days"
2 "1 or 2 days"
3 "3 to 5 days"
4 "6 to 9 days"
5 "10 to 19 days"
6 "20 to 29 days"
7 "All 30 days"
/
Q39
1 "I did not use tobacco products"
2 "Yes"
3 "No"
/
Q40
1 "0 days"
2 "1 or 2 days"
3 "3 to 9 days"
4 "10 to 19 days"
5 "20 to 39 days"
6 "40 to 99 days"
7 "100 or more days"
/
Q41
1 "Never drank alcohol"
2 "8 years old or younger"
3 "9 or 10 years old"
4 "11 or 12 years old"
5 "13 or 14 years old"
6 "15 or 16 years old"
7 "17 years old or older"
/
Q42
1 "0 days"
2 "1 or 2 days"
3 "3 to 5 days"
4 "6 to 9 days"
5 "10 to 19 days"
6 "20 to 29 days"
7 "All 30 days"
/
Q43
1 "Did not drink in past 30 days"
2 "Bought in store"
3 "Bought in restaurant"
4 "Bought at public event"
5 "I gave someone money to buy"
6 "Someone gave it to me"
7 "Took from store/family"
8 "Some other way"
/
Q44
1 "0 days"
2 "1 day"
3 "2 days"
4 "3 to 5 days"
5 "6 to 9 days"
6 "10 to 19 days"
7 "20 or more days"
/
Q45
1 "Did not drink in past 30 days"
2 "1 or 2 drinks"
3 "3 drinks"
4 "4 drinks"
5 "5 drinks"
6 "6 or 7 drinks"
7 "8 or 9 drinks"
8 "10 or more drinks"
/
Q46
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 to 99 times"
7 "100 or more times"
/
Q47
1 "Never tried marijuana"
2 "8 years old or younger"
3 "9 or 10 years old"
4 "11 or 12 years old"
5 "13 or 14 years old"
6 "15 or 16 years old"
7 "17 years old or older"
/
Q48
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
Q49
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
Q50
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
Q51
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
Q52
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
Q53
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
Q54
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
Q55
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
Q56
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
Q57
1 "0 times"
2 "1 time"
3 "2 or more times"
/
Q58
1 "Yes"
2 "No"
/
Q59
1 "Yes"
2 "No"
/
Q60
1 "Never had sex"
2 "11 years old or younger"
3 "12 years old"
4 "13 years old"
5 "14 years old"
6 "15 years old"
7 "16 years old"
8 "17 years old or older"
/
Q61
1 "Never had sex"
2 "1 person"
3 "2 people"
4 "3 people"
5 "4 people"
6 "5 people"
7 "6 or more people"
/
Q62
1 "Never had sex"
2 "None during past 3 months"
3 "1 person"
4 "2 people"
5 "3 people"
6 "4 people"
7 "5 people"
8 "6 or more people"
/
Q63
1 "Never had sex"
2 "Yes"
3 "No"
/
Q64
1 "Never had sex"
2 "Yes"
3 "No"
/
Q65
1 "Never had sex"
2 "No method was used"
3 "Birth control pills"
4 "Condoms"
5 "IUD or implant"
6 "Shot/patch/birth control ring"
7 "Withdrawal/other method"
8 "Not sure"
/
Q66
1 "Never had sexual contact"
2 "Females"
3 "Males"
4 "Females and males"
/
Q67
1 "Heterosexual (straight)"
2 "Gay or lesbian"
3 "Bisexual"
4 "Not sure"
/
Q68
1 "Very underweight"
2 "Slightly underweight"
3 "About the right weight"
4 "Slightly overweight"
5 "Very overweight"
/
Q69
1 "Lose weight"
2 "Gain weight"
3 "Stay the same weight"
4 "Not trying to do anything"
/
Q70
1 "Did not drink fruit juice"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
Q71
1 "Did not eat fruit"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
Q72
1 "Did not eat green salad"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
Q73
1 "Did not eat potatoes"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
Q74
1 "Did not eat carrots"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
Q75
1 "Did not eat other vegetables"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
Q76
1 "Did not drink soda or pop"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
Q77
1 "Did not drink milk"
2 "1 to 3 glasses"
3 "4 to 6 glasses"
4 "1 glass per day"
5 "2 glasses per day"
6 "3 glasses per day"
7 "4 or more glasses per day"
/
Q78
1 "0 days"
2 "1 day"
3 "2 days"
4 "3 days"
5 "4 days"
6 "5 days"
7 "6 days"
8 "7 days"
/
Q79
1 "0 days"
2 "1 day"
3 "2 days"
4 "3 days"
5 "4 days"
6 "5 days"
7 "6 days"
8 "7 days"
/
Q80
1 "No TV on average school day"
2 "Less than 1 hour per day"
3 "1 hour per day"
4 "2 hours per day"
5 "3 hours per day"
6 "4 hours per day"
7 "5 or more hours per day"
/
Q81
1 "No playing video/computer game"
2 "Less than 1 hour per day"
3 "1 hour per day"
4 "2 hours per day"
5 "3 hours per day"
6 "4 hours per day"
7 "5 or more hours per day"
/
Q82
1 "0 days"
2 "1 day"
3 "2 days"
4 "3 days"
5 "4 days"
6 "5 days"
/
Q83
1 "0 teams"
2 "1 team"
3 "2 teams"
4 "3 or more teams"
/
Q84
1 "0 times"
2 "1 time"
3 "2 times"
4 "3 times"
5 "4 or more times"
/
Q85
1 "Yes"
2 "No"
3 "Not sure"
/
Q86
1 "During the past 12 months"
2 "Between 12 and 24 months ago"
3 "More than 24 months ago"
4 "Never"
5 "Not sure"
/
Q87
1 "Yes"
2 "No"
3 "Not sure"
/
Q88
1 "4 or less hours"
2 "5 hours"
3 "6 hours"
4 "7 hours"
5 "8 hours"
6 "9 hours"
7 "10 or more hours"
/
Q89
1 "Mostly A's"
2 "Mostly B's"
3 "Mostly C's"
4 "Mostly D's"
5 "Mostly F's"
6 "None of these grades"
7 "Not sure"
/
qbikehelmet
1 "Did not ride a bicycle"
2 "Never wore a helmet"
3 "Rarely wore a helmet"
4 "Sometimes wore a helmet"
5 "Most of the time wore a helmet"
6 "Always wore a helmet"
/
qdrivemarijuana
1 "Did not drive"
2 "0 times"
3 "1 time"
4 "2 or 3 times"
5 "4 or 5 times"
6 "6 or more times"
/
qcelldriving
1 "Did not drive"
2 "0 days"
3 "1 or 2 days"
4 "3 to 5 days"
5 "6 to 9 days"
6 "10 to 19 days"
7 "20 to 29 days"
8 "All 30 days"
/
qpropertydamage
1 "0 times"
2 "1 time"
3 "2 or 3 time"
4 "4 or 5 times"
5 "6 or 7 times"
6 "8 or 9 times"
7 "10 or 11 times"
8 "12 or more times"
/
qbullyweight
1 "Yes"
2 "No"
/
qbullygender
1 "Yes"
2 "No"
/
qbullygay
1 "Yes"
2 "No"
/
qchokeself
1 "Yes"
2 "No"
/
qcigschool
1 "0 days"
2 "1 or 2 days"
3 "3 to 5 days"
4 "6 to 9 days"
5 "10 to 19 days"
6 "20 to 29 days"
7 "All 30 days"
/
qchewtobschool
1 "0 days"
2 "1 or 2 days"
3 "3 to 5 days"
4 "6 to 9 days"
5 "10 to 19 days"
6 "20 to 29 days"
7 "All 30 days"
/
qalcoholschool
1 "0 days"
2 "1 or 2 days"
3 "3 to 5 days"
4 "6 to 9 days"
5 "10 to 19 days"
6 "20 to 29 days"
7 "All 30 days"
/
qtypealcohol
1 "I did not drink alcohol during the past 30 days"
2 "I do not have a usual type"
3 "Beer"
4 "Flavored malt beverages"
5 "Wine coolers"
6 "Wine"
7 "Liquor"
8 "Some other type"
/
qhowmarijuana
1 "Did not use marijuana"
2 "Smoked it"
3 "Ate in food"
4 "Drank in tea or other drink"
5 "Vaporized"
6 "Some other way"
/
qmarijuanaschool
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
qcurrentcocaine
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
qcurrentheroin
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
qcurrentmeth
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
qhallucdrug
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
qprescription30d
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
qgenderexp
1 "Very feminine"
2 "Mostly feminine"
3 "Somewhat feminine"
4 "Equally feminine and masculine"
5 "Somewhat masculine"
6 "Mostly masculine"
7 "Very masculine"
/
qtaughtHIV
1 "Yes"
2 "No"
3 "Not sure"
/
qtaughtsexed
1 "Yes"
2 "No"
3 "Not sure"
/
qtaughtstd
1 "Yes"
2 "No"
3 "Not sure"
/
qtaughtcondom
1 "Yes"
2 "No"
3 "Not sure"
/
qtaughtbc
1 "Yes"
2 "No"
3 "Not sure"
/
qdietpop
1 "Did not drink diet soda or pop"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
qcoffeetea
1 "Did not drink coffee or tes"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
qsportsdrink
1 "Did not drink sports drink"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
qenergydrink
1 "Did not drink energy drink"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
qsugardrink
1 "Did not drink sugar drinks"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
qwater
1 "Did not drink water"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
qfastfood
1 "0 days"
2 "1 day"
3 "2 days"
4 "3 days"
5 "4 days"
6 "5 days"
7 "6 days"
8 "7 days"
/
qfoodallergy
1 "Yes"
2 "No"
3 "Not sure"
/
qwenthungry
1 "Never"
2 "Rarely"
3 "Sometimes"
4 "Most of the time"
5 "Always"
/
qmusclestrength
1 "0 days"
2 "1 day"
3 "2 days"
4 "3 days"
5 "4 days"
6 "5 days"
7 "6 days"
8 "7 days"
/
qsunscreenuse
1 "Never"
2 "Rarely"
3 "Sometimes"
4 "Most of the time"
5 "Always"
/
qindoortanning
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
qsunburn
1 "0 times"
2 "1 time"
3 "2 times"
4 "3 times"
5 "4 times"
6 "5 or more times"
/
qconcentrating
1 "Yes"
2 "No"
/
qcurrentasthma
1 "I have never had asthma"
2 "Yes"
3 "No"
4 "Not Sure"
/
qwheresleep
1 "Parent's or guardian's home"
2 "Home of friend/family/other"
3 "Shelter or emergency housing"
4 "Motel or hotel"
5 "Car, park, campground"
6 "No usual place to sleep"
7 "Somewhere else"
/
qspeakenglish
1 "Very well"
2 "Well"
3 "Not well"
4 "Not at all"
/
qtransgender
1 "No"
2 "Yes, I am transgender"
3 "Not sure if I am transgender"
4 "DK what question is asking"
/
sitecode
'AK' 'Alaska'
'AL' 'Alabama'
'AR' 'Arkansas'
'AZB' 'Arizona'
'CA' 'California'
'CO' 'Colorado'
'CT' 'Connecticut'
'DE' 'Delaware'
'FL' 'Florida'
'HI' 'Hawaii'
'IA' 'Iowa'
'ID' 'Idaho'
'IL' 'Illinois'
'KS' 'Kansas'
'KY' 'Kentucky'
'LA' 'Louisiana'
'MD' 'Maryland'
'ME' 'Maine'
'MI' 'Michigan'
'MO' 'Missouri'
'MS' 'Mississippi'
'MT' 'Montana'
'NC' 'North Carolina'
'ND' 'North Dakota'
'NE' 'Nebraska'
'NH' 'New Hampshire'
'NJ' 'New Jersey'
'NM' 'New Mexico'
'NV' 'Nevada'
'NY' 'New York'
'OK' 'Oklahoma'
'PA' 'Pennsylvania'
'RI' 'Rhode Island'
'SC' 'South Carolina'
'SD' 'South Dakota'
'TN' 'Tennessee'
'UT' 'Utah'
'VA' 'Virginia'
'WI' 'Wisconsin'
'WV' 'West Virginia'
'WY' 'Wyoming'
'XX' 'United States'
'NYG' 'Borough of Bronx, NY'
'NYH' 'Borough of Brooklyn, NY'
'NYI' 'Borough of Manhattan, NY'
'NYJ' 'Borough of Queens, NY'
'NYK' 'Borough of Staten Island, NY'
'FT' 'Broward County, FL'
'CM' 'Charlotte-Mecklenburg County, NC'
'CH' 'Chicago, IL'
'DA' 'Dallas, TX'
'DU' 'Duval County, FL'
'FW' 'Fort Worth, TX'
'MM' 'Miami-Dade County, FL'
'ML' 'Milwaukee, WI'
'NO' 'New Orleans, LA'
'NYC' 'New York City, NY'
'OL' 'Orange County, FL'
'SB' 'San Bernardino, CA'
'SA' 'San Diego, CA'
'SE' 'Seattle, WA'
/
age 
1 "12 years old or younger"
2 "13 years old"
3 "14 years old"
4 "15 years old"
5 "16 years old"
6 "17 years old"
7 "18 years old or older"
/
sex 
1 "Female"
2 "Male"
/
grade
1 "9th"
2 "10th"
3 "11th"
4 "12th"
/
race4
1 "White"
2 "Black or African American"
3 "Hispanic/Latino"
4 "All other races"
/
race7
1 "Am Indian / Alaska Native"
2 "Asian"
3 "Black or African American"
4 "Hispanic/Latino"
5 "Native Hawaiian/other PI"
6 "White"
7 "Multiple - Non-Hispanic"
/
sexid 		
1 "Heterosexual"
2 "Gay or Lesbian"
3 "Bisexual"
4 "Not Sure"
/
sexid2		
1 "Heterosexual"
2 "Sexual Minority"
3 "Unsure"
/
sexpart     
1 "Never had sex"
2 "Opposite sex only"
3 "Same sex only"
4 "Both Sexes"
/
sexpart2    
1 "Never had sex"
2 "Opposite sex only"
3 "Same sex only or both sexes"
/.

MISSING VALUES
sitecode ("     ") sitetypenum ("        ")
year ("        ") survyear ("   ") weight ("          ") stratum ("        ")
PSU ("        ") record ("        ") age ("   ") sex ("   ") grade ("   ")
race4 ("   ") race7 ("   ") stheight ("        ") stweight ("        ")
bmi ("        ") bmipct ("        ") qnobese ("   ") qnowt ("   ")
q67 (" ") q66 (" ") sexid ("        ") sexid2 ("        ")
sexpart ("        ") sexpart2 ("        ")
q8 (" ") q9 (" ") q10 (" ") q11 (" ") q12 (" ")
q13 (" ") q14 (" ") q15 (" ") q16 (" ") q17 (" ")
q18 (" ") q19 (" ") q20 (" ") q21 (" ") q22 (" ")
q23 (" ") q24 (" ") q25 (" ") q26 (" ") q27 (" ")
q28 (" ") q29 (" ") q30 (" ") q31 (" ") q32 (" ")
q33 (" ") q34 (" ") q35 (" ") q36 (" ") q37 (" ")
q38 (" ") q39 (" ") q40 (" ") q41 (" ") q42 (" ")
q43 (" ") q44 (" ") q45 (" ") q46 (" ") q47 (" ")
q48 (" ") q49 (" ") q50 (" ") q51 (" ") q52 (" ")
q53 (" ") q54 (" ") q55 (" ") q56 (" ") q57 (" ")
q58 (" ") q59 (" ") q60 (" ") q61 (" ") q62 (" ")
q63 (" ") q64 (" ") q65 (" ")
q68 (" ") q69 (" ") q70 (" ") q71 (" ") q72 (" ")
q73 (" ") q74 (" ") q75 (" ") q76 (" ") q77 (" ")
q78 (" ") q79 (" ") q80 (" ") q81 (" ") q82 (" ")
q83 (" ") q84 (" ") q85 (" ") q86 (" ") q87 (" ")
q88 (" ") q89 (" ") 
qn8 ("   ")  qn9 ("   ") qn10 ("   ") qn11 ("   ") qn12 ("   ") 
qn13 ("   ") qn14 ("   ") qn15 ("   ") qn16 ("   ") qn17 ("   ") 
qn18 ("   ") qn19 ("   ") qn20 ("   ") qn21 ("   ") qn22 ("   ") 
qn23 ("   ") qn24 ("   ") qn25 ("   ") qn26 ("   ") qn27 ("   ") 
qn28 ("   ") qn29 ("   ") qn30 ("   ") qn31 ("   ") qn32 ("   ")
qn33 ("   ") qn34 ("   ") qn35 ("   ") qn36 ("   ") qn37 ("   ") 
qn38 ("   ") qn39 ("   ") qn40 ("   ") qn41 ("   ") qn42 ("   ") 
qn43 ("   ") qn44 ("   ") qn45 ("   ") qn46 ("   ") qn47 ("   ") 
qn48 ("   ") qn49 ("   ") qn50 ("   ") qn51 ("   ") qn52 ("   ") 
qn53 ("   ") qn54 ("   ") qn55 ("   ") qn56 ("   ") qn57 ("   ") 
qn58 ("   ") qn59 ("   ") qn60 ("   ") qn61 ("   ") qn62 ("   ")
qn63 ("   ") qn64 ("   ") qn65 ("   ")
qn68 ("   ") qn69 ("   ") qn70 ("   ") qn71 ("   ") qn72 ("   ")
qn73 ("   ") qn74 ("   ") qn75 ("   ") qn76 ("   ") qn77 ("   ") 
qn78 ("   ") qn79 ("   ") qn80 ("   ") qn81 ("   ") qn82 ("   ") 
qn83 ("   ") qn84 ("   ") qn85 ("   ") qn86 ("   ") qn87 ("   ") 
qn88 ("   ") qn89 ("   ")
qnfrcig ("   ") qndaycig ("   ") qnfrevp ("   ") qndayevp ("   ") qnfrskl ("   ")
qndayskl ("   ") qnfrcgr ("   ") qndaycgr ("   ") qntb2 ("   ") qntb3 ("   ")
qntb4 ("   ") qniudimp ("   ") qnshparg ("   ") qnothhpl ("   ") qndualbc ("   ")
qnbcnone ("   ") qnfr0 ("   ") qnfr1 ("   ") qnfr2 ("   ") qnfr3 ("   ")
qnveg0 ("   ") qnveg1 ("   ") qnveg2 ("   ") qnveg3 ("   ") qnsoda1 ("   ")
qnsoda2 ("   ") qnsoda3 ("   ") qnmilk1 ("   ") qnmilk2 ("   ") qnmilk3 ("   ")
qnbk7day ("   ") qnpa0day ("   ") qnpa7day ("   ") qndlype ("   ") qnnodnt ("   ")
qbikehelmet (" ") qdrivemarijuana (" ") qcelldriving (" ") qpropertydamage (" ") qbullyweight (" ")
qbullygender (" ") qbullygay (" ") qchokeself (" ") qcigschool (" ") qchewtobschool (" ")
qalcoholschool (" ") qtypealcohol (" ") qhowmarijuana (" ") qmarijuanaschool (" ") qcurrentcocaine (" ")
qcurrentheroin (" ") qcurrentmeth (" ") qhallucdrug (" ") qprescription30d (" ") qgenderexp (" ")
qtaughtHIV (" ") qtaughtsexed (" ") qtaughtstd (" ") qtaughtcondom (" ") qtaughtbc (" ")
qdietpop (" ") qcoffeetea (" ") qsportsdrink (" ") qenergydrink (" ") qsugardrink (" ")
qwater (" ") qfastfood (" ") qfoodallergy (" ") qwenthungry (" ") qmusclestrength (" ")
qsunscreenuse (" ") qindoortanning (" ") qsunburn (" ") qconcentrating (" ")
qcurrentasthma (" ") qwheresleep (" ") qspeakenglish (" ") qtransgender (" ")
qnbikehelmet ("   ") qndrivemarijuana ("   ") qncelldriving ("   ") qnpropertydamage ("   ")
qnbullyweight ("   ") qnbullygender ("   ") qnbullygay ("   ") qnchokeself ("   ") qncigschool ("   ")
qnchewtobschool ("   ") qnalcoholschool ("   ") qntypealcohol ("   ") qnhowmarijuana ("   ") qnmarijuanaschool ("   ")
qncurrentcocaine ("   ") qncurrentheroin ("   ") qncurrentmeth ("   ") qnhallucdrug ("   ") qnprescription30d ("   ")
qngenderexp ("   ") qntaughtHIV ("   ") qntaughtsexed ("   ") qntaughtstd ("   ") qntaughtcondom ("   ")
qntaughtbc ("   ") qndietpop ("   ") qncoffeetea ("   ") qnsportsdrink ("   ") qnspdrk1 ("   ")
qnspdrk2 ("   ") qnspdrk3 ("   ") qnenergydrink ("   ") qnsugardrink ("   ") qnwater ("   ")
qnwater1 ("   ") qnwater2 ("   ") qnwater3 ("   ") qnfastfood ("   ") qnfoodallergy ("   ")
qnwenthungry ("   ") qnmusclestrength ("   ") qnsunscreenuse ("   ") qnindoortanning ("   ")
qnsunburn ("   ") qnconcentrating ("   ") qncurrentasthma ("   ") qnwheresleep ("   ")
qnspeakenglish ("   ") qntransgender ("   ").

Formats stheight stweight (F5.2).
EXECUTE.
SAVE OUTFILE "C:\sadc2017\sadc2017_xxxxxxx.sav"/
/COMPRESSED.
EXECUTE.

GET FILE="C:\sadc2017\sadc2017_xxxxxxx.sav"/.
