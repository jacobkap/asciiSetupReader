*-------------------------------------------------------------------------*
*                                                                          
*                     SPSS SETUP FILE FOR ICPSR 34649
*          WORRY, RISK PERCEPTIONS, AND THE WILLINGNESS TO ACT TO
*                          REDUCE MEDICAL ERRORS
*                             (DATASET 0001: )
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
*  data file is physically located (e.g., "c:\temp\34649-0001-data.txt").
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
*  will be saved (e.g., SAVE OUTFILE="c:\spsswin\data\da34649-0001.sav").
*
*-------------------------------------------------------------------------.

* SPSS FILE HANDLE AND DATA LIST COMMANDS.

FILE HANDLE DATA / NAME="data-filename" LRECL=723.
DATA LIST FILE=DATA /
                SUBJ 1-4         VERSION 5-6 (A)
                  PRE1 7                 POST1 8                  PRE2 9
                POST2 10                 PRE3 11                POST3 12
                 PRE4 13                POST4 14                 PRE5 15
                POST5 16                 PRE6 17                POST6 18
            ANCHOR 19-23            CONDITION 24          APPENDIC 25-29
           ALZHEIM 30-35           AUTOACC 36-42            CANCER 43-49
          DIABETES 50-55          HEARTDIS 56-62              AIDS 63-68
          HOMICIDE 69-75               FLU 76-81            KIDNEY 82-87
          MEDERROR 88-94          PARKINS 95-100          STROKE 101-107
         SUICIDE 108-114                  T1 115                  T2 116
                  T3 117                  T4 118                  T5 119
                  T6 120                  T7 121                  T8 122
                  T9 123                 T10 124                 T11 125
                 T12 126                 T13 127                 T14 128
                 T15 129                 T16 130         T17 131-237 (A)
              B1 238-239                  B2 240                  B3 241
                  B4 242                  B5 243                  B6 244
                  B7 245                  B8 246                  B9 247
                 B10 248                 B11 249                 B12 250
                 B13 251                 B14 252             SET 253 (A)
                  C1 254                  C2 255                  C3 256
                  C4 257                  C5 258                  C6 259
                  C7 260                  C8 261                  C9 262
                 C10 263                 C11 264                 C12 265
                 C13 266                 C14 267                 C15 268
                 C16 269                 C17 270                 C18 271
                 C19 272                 C20 273                 C21 274
                 C22 275                 C23 276                 C24 277
                 C25 278                 C26 279                 C27 280
                 C28 281                 C29 282                  D1 283
                  D2 284                  D3 285                  D4 286
                  D5 287                  D6 288                  D7 289
                  D8 290                  D9 291                 D10 292
                 D11 293                 D12 294                 D13 295
                 D14 296                 D15 297                 D16 298
                 D17 299                 D18 300                 D19 301
                 D20 302                 D21 303                 D22 304
                 D23 305                 D24 306                 D25 307
                 D26 308                 D27 309                 D28 310
                 D29 311                  G1 312                  G2 313
                  G3 314                  G4 315                  G5 316
                  G6 317                  G7 318                  G8 319
                  G9 320                 G10 321                 G11 322
                 G12 323                 G13 324                 G14 325
                 G15 326                 G16 327                 G17 328
                 G18 329                 G19 330                 G20 331
                 G21 332                 G22 333                 G23 334
                 G24 335                 G25 336                 G26 337
                 G27 338                 G28 339                 G29 340
                  K1 341                  K2 342                  K3 343
                  K4 344                  K5 345                  K6 346
                  K7 347                  K8 348                  K9 349
                 K10 350                 K11 351                 K12 352
                 K13 353                 K14 354                 K15 355
                 K16 356                 K17 357                 K18 358
                 K19 359                 K20 360                 K21 361
                 K22 362                 K23 363                 K24 364
                 K25 365                 K26 366                 K27 367
                 K28 368                 K29 369                  M1 370
                  M2 371                  M3 372                  M4 373
                  M5 374                  M6 375                  M7 376
                  M8 377                  M9 378                 M10 379
                 M11 380                 M12 381                 M13 382
                 M14 383                 M15 384                 M16 385
                 M17 386                 M18 387                 M19 388
                 M20 389                 M21 390                 M22 391
                 M23 392                 M24 393                 M25 394
                 M26 395                 M27 396                 M28 397
                 M29 398                  E1 399                  E2 400
                  E3 401                  E4 402                  E5 403
                  E6 404                  E7 405                  E8 406
                  E9 407                 E10 408                 E11 409
                 E12 410                 E13 411                 E14 412
                 E15 413                 E16 414                 E17 415
                 E18 416                 E19 417                 E20 418
                 E21 419                 E22 420                 E23 421
                 E24 422                 E25 423                 E26 424
                 E27 425                 E28 426                 E29 427
                  H1 428                  H2 429                  H3 430
                  H4 431                  H5 432                  H6 433
                  H7 434                  H8 435                  H9 436
                 H10 437                 H11 438                 H12 439
                 H13 440                 H14 441                 H15 442
                 H16 443                 H17 444                 H18 445
                 H19 446                 H20 447                 H21 448
                 H22 449                 H23 450                 H24 451
                 H25 452                 H26 453                 H27 454
                 H28 455                 H29 456                  I1 457
                  I2 458                  I3 459                  I4 460
                  I5 461                  I6 462                  I7 463
                  I8 464                  I9 465                 I10 466
                 I11 467                 I12 468                 I13 469
                 I14 470                 I15 471                 I16 472
                 I17 473                 I18 474                 I19 475
                 I20 476                 I21 477                 I22 478
                 I23 479                 I24 480                 I25 481
                 I26 482                 I27 483                 I28 484
                 I29 485                  J1 486                  J2 487
                  J3 488                  J4 489                  J5 490
                  J6 491                  J7 492                  J8 493
                  J9 494                 J10 495                 J11 496
                 J12 497                 J13 498                 J14 499
                 J15 500                 J16 501                 J17 502
                 J18 503                 J19 504                 J20 505
                 J21 506                 J22 507                 J23 508
                 J24 509                 J25 510                 J26 511
                 J27 512                 J28 513                 J29 514
                  L1 515                  L2 516                  L3 517
                  L4 518                  L5 519                  L6 520
                  L7 521                  L8 522                  L9 523
                 L10 524                 L11 525                 L12 526
                 L13 527                 L14 528                 L15 529
                 L16 530                 L17 531                 L18 532
                 L19 533                 L20 534                 L21 535
                 L22 536                 L23 537                 L24 538
                 L25 539                 L26 540                 L27 541
                 L28 542                 L29 543                  F1 544
                  F2 545                  F3 546                  F4 547
                  F5 548                  F6 549                  F7 550
                  F8 551                  F9 552                 F10 553
                 F11 554                 F12 555                 F13 556
                 F14 557                 F15 558                 F16 559
                 F17 560                 F18 561                 F19 562
                 F20 563                 F21 564                 F22 565
                 F23 566                 F24 567                 F25 568
                 F26 569                 F27 570                 F28 571
                 F29 572                  N1 573                  N2 574
                  N3 575                  N4 576                  N5 577
                  N6 578                  O1 579                  O2 580
                  O3 581                  O4 582                  O5 583
                  O6 584                  O7 585                  O8 586
                  O9 587                 O10 588                 O11 589
                 O12 590                 O13 591                 O14 592
                 O15 593                 O16 594                 O17 595
                 O18 596                 O19 597                  P1 598
                  P2 599                  P3 600                  P4 601
                  P5 602                  P6 603                  P7 604
                  P8 605                  P9 606                 P10 607
                 P11 608                 P12 609                 P13 610
                 P14 611                  Q1 612                  Q2 613
                  Q3 614                  Q4 615                  Q5 616
                  Q6 617                  Q7 618                  Q8 619
                  Q9 620                 Q10 621                 Q11 622
                 Q12 623                 Q13 624                 Q14 625
                  R1 626                  R2 627                  R3 628
                  R4 629                  R5 630                  R6 631
                  R7 632                  R8 633                  R9 634
                 R10 635                 R11 636                 R12 637
                 R13 638                 R14 639                BIS1 640
             BASHFUL 641                BOLD 642               ENERG 643
             ENVIOUS 644                BIS2 645               EXTRA 646
             FRETFUL 647                BIS3 648             JEALOUS 649
                BIS4 650               MOODY 651               QUIET 652
                BIS5 653             RELAXED 654                 SHY 655
                BIS6 656               TALKA 657               TEMPE 658
              TOUCHY 659                BIS7 660               UNENV 661
               WITHD 662             AGE 663-664             MARITAL 665
              GENDER 666                RACE 667             READERR 668
              HEALTH 669          SEEDOC 670-671        HOSPPAST 672-673
         FAMHOSP 674-675            HOSPNEXT 676                EDUC 677
            CHILDREN 678        BIS 679-693 (13)   EXTRAVER 694-708 (13)
     STABLE 709-723 (13)
   .

* SPSS VARIABLE LABELS COMMAND

VARIABLE LABELS
   SUBJ      'Subject identification number' /
   VERSION   'Version' /
   PRE1      'Overall, how serious a problem is patient safety in'+
     ' U.S. healthcare today?'/
   POST1     'How serious a problem is patient safety' /
   PRE2      'Overall, how serious a problem is medical errors in'+
     ' U.S. healthcare today?'/
   POST2     'How serious a problem is medical errors' /
   PRE3      'How much do you trust your doctor not to make a medical'+
     ' error that harms you?'/
   POST3     'Trust your doctor not to make medical error' /
   PRE4      'How much do you trust medical staff at your local hospital'+
     ' not to make a medical error that harms you?'/
   POST4     'Trust med. staff at hospital not to make error' /
   PRE5      'How much to you trust medical system in general not to make'+
     ' a medial error that harms you?'/
   POST5     'Trust med system in general not to make error' /
   PRE6      'How much can you rely on own knowledge and alertness to'+
     ' protect you from medical errors that can harm you?'/
   POST6     'Rely on own knowledge to protect you' /
   ANCHOR    'Anchor: 400 or 40,000' /
   CONDITION 'Placement of estimated deaths condition' /
   APPENDIC  'Estimated # of deaths from Appendicitis' /
   ALZHEIM   'Estimated # of deaths from Alzheimer''s disease' /
   AUTOACC   'Estimated # of deaths from Automobile accidents' /
   CANCER    'Estimated # of deaths from Cancers' /
   DIABETES  'Estimated # of deaths from Diabetes' /
   HEARTDIS  'Estimated # of deaths from Heart diseases' /
   AIDS      'Estimated # of deaths from HIV/AIDS' /
   HOMICIDE  'Estimated # of deaths from Homocide' /
   FLU       'Estimated # of deaths from Influenza and pneumonia' /
   KIDNEY    'Estimated # of deaths from Kidney disease' /
   MEDERROR  'Estimated # of deaths from Medical errors' /
   PARKINS   'Estimated # of deaths from Parkinson''s disease' /
   STROKE    'Estimated # of deaths from Stroke' /
   SUICIDE   'Estimated # of deaths from Suicide' /
   T1        'Worry: Alzheimers' /
   T2        'Worry: Appendicitis' /
   T3        'Worry: Auto accidents' /
   T4        'Worry: Cancers' /
   T5        'Worry: Diabetes' /
   T6        'Worry: Heart Disease' /
   T7        'Worry: HIV/AIDS' /
   T8        'Worry: Homicide' /
   T9        'Worry: Influenze /pneumonia' /
   T10       'Worry: Kidney disease' /
   T11       'Worry: Medical errors' /
   T12       'Worry: Parkisons disease' /
   T13       'Worry: Stroke' /
   T14       'Worry: Suicide' /
   T15       'Have you/family experience medical error' /
   T16       'If so, were you harmed as a result' /
   T17       'What was medical error?' /
   B1        'Make sure doctor in charge at hosp' /
   B2        'Make sure know abt allergies' /
   B3        'Look for hosp experienced in procedure' /
   B4        'Ask hosp workers if washed hands' /
   B5        'Ask which hosp has fewer med errors' /
   B6        'Ask abt surgeon''s experience' /
   B7        'Mark body where surgery will occur' /
   B8        'Confirm med & dose w/staff' /
   B9        'Ask someone to be advocate' /
   B10       'Choose hosp w/ med tracking system' /
   B11       'Make sure all docs know abt your meds' /
   B12       'Make sure docs know abt over-counter meds' /
   B13       'Ask abt test results at hosp' /
   B14       'Choice based on comparative errors report' /
   SET       'Set of scale items: A or B' /
   C1        'Likely: Med error in surgery' /
   C2        'Likely: Error in prescrip med' /
   C3        'Likely: Error in lab test report' /
   C4        'Likely: Error in diagnosis made' /
   C5        'Likely: Unnecessary surgery performed' /
   C6        'Likely: Wrong prescrip med given' /
   C7        'Likely: Tx not most effective one' /
   C8        'Likely: Too high dose of prescrip med' /
   C9        'Likely: Unnecessary lab tests' /
   C10       'Likely: Routine test not done early' /
   C11       'Likely: Too high dose when IV fails' /
   C12       'Likely: Drug allergy overlooked' /
   C13       'Likely: Unnecessary x-rays' /
   C14       'Likely: Surgery on wrong limb' /
   C15       'Likely: Lab test results never reported' /
   C16       'Likely: Instrument lef inside patient' /
   C17       'Likely: Med condition overlooked' /
   C18       'Likely: Not given prescribed meds' /
   C19       'Likely: Surgery on wrong patient' /
   C20       'Likely: Invasive cardiac procedure unnecessary' /
   C21       'Likely: Patient given wrong diet' /
   C22       'Likely: Too low dose of prescrip med' /
   C23       'Likely: MRI machine malfunctions' /
   C24       'Likely: Wrong IV med given' /
   C25       'Likely: Too high dose of chemo' /
   C26       'Likely: wrong blood type transfused' /
   C27       'Likely: Biopsy mistake leads to false postive' /
   C28       'Likely: Patient sent home too quickly' /
   C29       'Likely: Unconscious patient too high dose' /
   D1        'Dread: Med error in surgery' /
   D2        'Dread: Error in prescrip med' /
   D3        'Dread: Error in lab test report' /
   D4        'Dread: Error in diagnosis made' /
   D5        'Dread: Unnecessary surgery performed' /
   D6        'Dread: Wrong prescrip med given' /
   D7        'Dread: Tx not most effective one' /
   D8        'Dread: Too high dose of prescrip med' /
   D9        'Dread: Unnecessary lab tests' /
   D10       'Dread: Routine test not done early' /
   D11       'Dread: Too high dose when IV fails' /
   D12       'Dread: Drug allergy overlooked' /
   D13       'Dread: Unnecessary x-rays' /
   D14       'Dread: Surgery on wrong limb' /
   D15       'Dread: Lab test results never reported' /
   D16       'Dread: Instrument lef inside patient' /
   D17       'Dread: Med condition overlooked' /
   D18       'Dread: Not given prescribed meds' /
   D19       'Dread: Surgery on wrong patient' /
   D20       'Dread: Invasive cardiac procedure unnecessary' /
   D21       'Dread: Patient given wrong diet' /
   D22       'Dread: Too low dose of prescrip med' /
   D23       'Dread: MRI machine malfunctions' /
   D24       'Dread: Wrong IV med given' /
   D25       'Dread: Too high dose of chemo' /
   D26       'Dread: wrong blood type transfused' /
   D27       'Dread: Biopsy mistake leads to false postive' /
   D28       'Dread: Patient sent home too quickly' /
   D29       'Dread: Unconscious patient too high dose' /
   G1        'Blame: Med error in surgery' /
   G2        'Blame: Error in prescrip med' /
   G3        'Blame: Error in lab test report' /
   G4        'Blame: Error in diagnosis made' /
   G5        'Blame: Unnecessary surgery performed' /
   G6        'Blame: Wrong prescrip med given' /
   G7        'Blame: Tx not most effective one' /
   G8        'Blame: Too high dose of prescrip med' /
   G9        'Blame: Unnecessary lab tests' /
   G10       'Blame: Routine test not done early' /
   G11       'Blame: Too high dose when IV fails' /
   G12       'Blame: Drug allergy overlooked' /
   G13       'Blame: Unnecessary x-rays' /
   G14       'Blame: Surgery on wrong limb' /
   G15       'Blame: Lab test results never reported' /
   G16       'Blame: Instrument lef inside patient' /
   G17       'Blame: Med condition overlooked' /
   G18       'Blame: Not given prescribed meds' /
   G19       'Blame: Surgery on wrong patient' /
   G20       'Blame: Invasive cardiac procedure unnecessary' /
   G21       'Blame: Patient given wrong diet' /
   G22       'Blame: Too low dose of prescrip med' /
   G23       'Blame: MRI machine malfunctions' /
   G24       'Blame: Wrong IV med given' /
   G25       'Blame: Too high dose of chemo' /
   G26       'Blame: wrong blood type transfused' /
   G27       'Blame: Biopsy mistake leads to false postive' /
   G28       'Blame: Patient sent home too quickly' /
   G29       'Blame: Unconscious patient too high dose' /
   K1        'Aware: Med error in surgery' /
   K2        'Aware: Error in prescrip med' /
   K3        'Aware: Error in lab test report' /
   K4        'Aware: Error in diagnosis made' /
   K5        'Aware: Unnecessary surgery performed' /
   K6        'Aware: Wrong prescrip med given' /
   K7        'Aware: Tx not most effective one' /
   K8        'Aware: Too high dose of prescrip med' /
   K9        'Aware: Unnecessary lab tests' /
   K10       'Aware: Routine test not done early' /
   K11       'Aware: Too high dose when IV fails' /
   K12       'Aware: Drug allergy overlooked' /
   K13       'Aware: Unnecessary x-rays' /
   K14       'Aware: Surgery on wrong limb' /
   K15       'Aware: Lab test results never reported' /
   K16       'Aware: Instrument lef inside patient' /
   K17       'Aware: Med condition overlooked' /
   K18       'Aware: Not given prescribed meds' /
   K19       'Aware: Surgery on wrong patient' /
   K20       'Aware: Invasive cardiac procedure unnecessary' /
   K21       'Aware: Patient given wrong diet' /
   K22       'Aware: Too low dose of prescrip med' /
   K23       'Aware: MRI machine malfunctions' /
   K24       'Aware: Wrong IV med given' /
   K25       'Aware: Too high dose of chemo' /
   K26       'Aware: wrong blood type transfused' /
   K27       'Aware: Biopsy mistake leads to false postive' /
   K28       'Aware: Patient sent home too quickly' /
   K29       'Aware: Unconscious patient too high dose' /
   M1        'Signal: Med error in surgery' /
   M2        'Signal: Error in prescrip med' /
   M3        'Signal: Error in lab test report' /
   M4        'Signal: Error in diagnosis made' /
   M5        'Signal: Unnecessary surgery performed' /
   M6        'Signal: Wrong prescrip med given' /
   M7        'Signal: Tx not most effective one' /
   M8        'Signal: Too high dose of prescrip med' /
   M9        'Signal: Unnecessary lab tests' /
   M10       'Signal: Routine test not done early' /
   M11       'Signal: Too high dose when IV fails' /
   M12       'Signal: Drug allergy overlooked' /
   M13       'Signal: Unnecessary x-rays' /
   M14       'Signal: Surgery on wrong limb' /
   M15       'Signal: Lab test results never reported' /
   M16       'Signal: Instrument left inside patient' /
   M17       'Signal: Med condition overlooked' /
   M18       'Signal: Not given prescribed meds' /
   M19       'Signal: Surgery on wrong patient' /
   M20       'Signal: Invasive cardiac procedure unnecessary' /
   M21       'Signal: Patient given wrong diet' /
   M22       'Signal: Too low dose of prescrip med' /
   M23       'Signal: MRI machine malfunctions' /
   M24       'Signal: Wrong IV med given' /
   M25       'Signal: Too high dose of chemo' /
   M26       'Signal: wrong blood type transfused' /
   M27       'Signal: Biopsy mistake leads to false postive' /
   M28       'Signal: Patient sent home too quickly' /
   M29       'Signal: Unconscious patient too high dose' /
   E1        'Observe: Med error in surgery' /
   E2        'Observe: Error in prescrip med' /
   E3        'Observe: Error in lab test report' /
   E4        'Observe: Error in diagnosis made' /
   E5        'Observe: Unnecessary surgery performed' /
   E6        'Observe: Wrong prescrip med given' /
   E7        'Observe: Tx not most effective one' /
   E8        'Observe: Too high dose of prescrip med' /
   E9        'Observe: Unnecessary lab tests' /
   E10       'Observe: Routine test not done early' /
   E11       'Observe: Too high dose when IV fails' /
   E12       'Observe: Drug allergy overlooked' /
   E13       'Observe: Unnecessary x-rays' /
   E14       'Observe: Surgery on wrong limb' /
   E15       'Observe: Lab test results never reported' /
   E16       'Observe: Instrument lef inside patient' /
   E17       'Observe: Med condition overlooked' /
   E18       'Observe: Not given prescribed meds' /
   E19       'Observe: Surgery on wrong patient' /
   E20       'Observe: Invasive cardiac procedure unnecessary' /
   E21       'Observe: Patient given wrong diet' /
   E22       'Observe: Too low dose of prescrip med' /
   E23       'Observe: MRI machine malfunctions' /
   E24       'Observe: Wrong IV med given' /
   E25       'Observe: Too high dose of chemo' /
   E26       'Observe: wrong blood type transfused' /
   E27       'Observe: Biopsy mistake leads to false postive' /
   E28       'Observe: Patient sent home too quickly' /
   E29       'Observe: Unconscious patient too high dose' /
   H1        'SelfPrev: Med error in surgery' /
   H2        'SelfPrev: Error in prescrip med' /
   H3        'SelfPrev: Error in lab test report' /
   H4        'SelfPrev: Error in diagnosis made' /
   H5        'SelfPrev: Unnecessary surgery performed' /
   H6        'SelfPrev: Wrong prescrip med given' /
   H7        'SelfPrev: Tx not most effective one' /
   H8        'SelfPrev: Too high dose of prescrip med' /
   H9        'SelfPrev: Unnecessary lab tests' /
   H10       'SelfPrev: Routine test not done early' /
   H11       'SelfPrev: Too high dose when IV fails' /
   H12       'SelfPrev: Drug allergy overlooked' /
   H13       'SelfPrev: Unnecessary x-rays' /
   H14       'SelfPrev: Surgery on wrong limb' /
   H15       'SelfPrev: Lab test results never reported' /
   H16       'SelfPrev: Instrument lef inside patient' /
   H17       'SelfPrev: Med condition overlooked' /
   H18       'SelfPrev: Not given prescribed meds' /
   H19       'SelfPrev: Surgery on wrong patient' /
   H20       'SelfPrev: Invasive cardiac procedure unnecessary' /
   H21       'SelfPrev: Patient given wrong diet' /
   H22       'SelfPrev: Too low dose of prescrip med' /
   H23       'SelfPrev: MRI machine malfunctions' /
   H24       'SelfPrev: Wrong IV med given' /
   H25       'SelfPrev: Too high dose of chemo' /
   H26       'SelfPrev: wrong blood type transfused' /
   H27       'SelfPrev: Biopsy mistake leads to false postive' /
   H28       'SelfPrev: Patient sent home too quickly' /
   H29       'SelfPrev: Unconscious patient too high dose' /
   I1        'OthPrev: Med error in surgery' /
   I2        'OthPrev: Error in prescrip med' /
   I3        'OthPrev: Error in lab test report' /
   I4        'OthPrev: Error in diagnosis made' /
   I5        'OthPrev: Unnecessary surgery performed' /
   I6        'OthPrev: Wrong prescrip med given' /
   I7        'OthPrev: Tx not most effective one' /
   I8        'OthPrev: Too high dose of prescrip med' /
   I9        'OthPrev: Unnecessary lab tests' /
   I10       'OthPrev: Routine test not done early' /
   I11       'OthPrev: Too high dose when IV fails' /
   I12       'OthPrev: Drug allergy overlooked' /
   I13       'OthPrev: Unnecessary x-rays' /
   I14       'OthPrev: Surgery on wrong limb' /
   I15       'OthPrev: Lab test results never reported' /
   I16       'OthPrev: Instrument lef inside patient' /
   I17       'OthPrev: Med condition overlooked' /
   I18       'OthPrev: Not given prescribed meds' /
   I19       'OthPrev: Surgery on wrong patient' /
   I20       'OthPrev: Invasive cardiac procedure unnecessary' /
   I21       'OthPrev: Patient given wrong diet' /
   I22       'OthPrev: Too low dose of prescrip med' /
   I23       'OthPrev: MRI machine malfunctions' /
   I24       'OthPrev: Wrong IV med given' /
   I25       'OthPrev: Too high dose of chemo' /
   I26       'OthPrev: wrong blood type transfused' /
   I27       'OthPrev: Biopsy mistake leads to false postive' /
   I28       'OthPrev: Patient sent home too quickly' /
   I29       'OthPrev: Unconscious patient too high dose' /
   J1        'NewRisk: Med error in surgery' /
   J2        'NewRisk: Error in prescrip med' /
   J3        'NewRisk: Error in lab test report' /
   J4        'NewRisk: Error in diagnosis made' /
   J5        'NewRisk: Unnecessary surgery performed' /
   J6        'NewRisk: Wrong prescrip med given' /
   J7        'NewRisk: Tx not most effective one' /
   J8        'NewRisk: Too high dose of prescrip med' /
   J9        'NewRisk: Unnecessary lab tests' /
   J10       'NewRisk: Routine test not done early' /
   J11       'NewRisk: Too high dose when IV fails' /
   J12       'NewRisk: Drug allergy overlooked' /
   J13       'NewRisk: Unnecessary x-rays' /
   J14       'NewRisk: Surgery on wrong limb' /
   J15       'NewRisk: Lab test results never reported' /
   J16       'NewRisk: Instrument lef inside patient' /
   J17       'NewRisk: Med condition overlooked' /
   J18       'NewRisk: Not given prescribed meds' /
   J19       'NewRisk: Surgery on wrong patient' /
   J20       'NewRisk: Invasive cardiac procedure unnecessary' /
   J21       'NewRisk: Patient given wrong diet' /
   J22       'NewRisk: Too low dose of prescrip med' /
   J23       'NewRisk: MRI machine malfunctions' /
   J24       'NewRisk: Wrong IV med given' /
   J25       'NewRisk: Too high dose of chemo' /
   J26       'NewRisk: wrong blood type transfused' /
   J27       'NewRisk: Biopsy mistake leads to false postive' /
   J28       'NewRisk: Patient sent home too quickly' /
   J29       'NewRisk: Unconscious patient too high dose' /
   L1        'Worry: Med error in surgery' /
   L2        'Worry: Error in prescrip med' /
   L3        'Worry: Error in lab test report' /
   L4        'Worry: Error in diagnosis made' /
   L5        'Worry: Unnecessary surgery performed' /
   L6        'Worry: Wrong prescrip med given' /
   L7        'Worry: Tx not most effective one' /
   L8        'Worry: Too high dose of prescrip med' /
   L9        'Worry: Unnecessary lab tests' /
   L10       'Worry: Routine test not done early' /
   L11       'Worry: Too high dose when IV fails' /
   L12       'Worry: Drug allergy overlooked' /
   L13       'Worry: Unnecessary x-rays' /
   L14       'Worry: Surgery on wrong limb' /
   L15       'Worry: Lab test results never reported' /
   L16       'Worry: Instrument lef inside patient' /
   L17       'Worry: Med condition overlooked' /
   L18       'Worry: Not given prescribed meds' /
   L19       'Worry: Surgery on wrong patient' /
   L20       'Worry: Invasive cardiac procedure unnecessary' /
   L21       'Worry: Patient given wrong diet' /
   L22       'Worry: Too low dose of prescrip med' /
   L23       'Worry: MRI machine malfunctions' /
   L24       'Worry: Wrong IV med given' /
   L25       'Worry: Too high dose of chemo' /
   L26       'Worry: wrong blood type transfused' /
   L27       'Worry: Biopsy mistake leads to false postive' /
   L28       'Worry: Patient sent home too quickly' /
   L29       'Worry: Unconscious patient too high dose' /
   F1        'Dread: Med error in surgery' /
   F2        'Dread: Error in prescrip med' /
   F3        'Dread: Error in lab test report' /
   F4        'Dread: Error in diagnosis made' /
   F5        'Dread: Unnecessary surgery performed' /
   F6        'Dread: Wrong prescrip med given' /
   F7        'Dread: Tx not most effective one' /
   F8        'Dread: Too high dose of prescrip med' /
   F9        'Dread: Unnecessary lab tests' /
   F10       'Dread: Routine test not done early' /
   F11       'Dread: Too high dose when IV fails' /
   F12       'Dread: Drug allergy overlooked' /
   F13       'Dread: Unnecessary x-rays' /
   F14       'Dread: Surgery on wrong limb' /
   F15       'Dread: Lab test results never reported' /
   F16       'Dread: Instrument lef inside patient' /
   F17       'Dread: Med condition overlooked' /
   F18       'Dread: Not given prescribed meds' /
   F19       'Dread: Surgery on wrong patient' /
   F20       'Dread: Invasive cardiac procedure unnecessary' /
   F21       'Dread: Patient given wrong diet' /
   F22       'Dread: Too low dose of prescrip med' /
   F23       'Dread: MRI machine malfunctions' /
   F24       'Dread: Wrong IV med given' /
   F25       'Dread: Too high dose of chemo' /
   F26       'Dread: wrong blood type transfused' /
   F27       'Dread: Biopsy mistake leads to false postive' /
   F28       'Dread: Patient sent home too quickly' /
   F29       'Dread: Unconscious patient too high dose' /
   N1        'Seek hosp comparisons on freq/type of med errors' /
   N2        'Govt regulations necessary to reduce med errors' /
   N3        'Worried about med errors if go to hosp' /
   N4        'Discuss med errors w/doc' /
   N5        'Change hsp if found out hosp had above avg errors' /
   N6        'Avoid any hosp if found out uour hosp had above avg errors' /
   O1        'Make sure doctor in charge at hosp' /
   O2        'Make sure know abt allergies' /
   O3        'Look for hosp experienced in procedure' /
   O4        'Become friends w/hosp staff' /
   O5        'Ask hosp workers if washed hands' /
   O6        'Ask which hosp has fewer med errors' /
   O7        'Avoiding hosp food' /
   O8        'Ask abt surgeon''s experience' /
   O9        'Choose hosp based on its experience w/your surgery' /
   O10       'Mark body where surgery will occur' /
   O11       'Keeping a positive attitude' /
   O12       'Confirm med & dose w/staff' /
   O13       'Mask someone to be advocate' /
   O14       'Be alert to what is happening at hosp' /
   O15       'Choose hosp w/ med tracking system' /
   O16       'Make sure all docs know abt your meds' /
   O17       'Make sure docs know abt over-counter meds' /
   O18       'Ask abt test results at hosp' /
   O19       'Choice based on comparative errors report' /
   P1        'Prevent: Nuclear reactor' /
   P2        'Prevent: medical error in hosp' /
   P3        'Prevent: Firefighting' /
   P4        'Prevent: having surgery in hosp' /
   P5        'Prevent: Respiratory arrest because send home too soon' /
   P6        'Prevent: Power lawn mover' /
   P7        'Prevent: Getting a prescrip med in hosp' /
   P8        'Prevent: Microwave ovens' /
   P9        'Prevent: Getting lab test in hosp' /
   P10       'Prevent: IV pump fails & patient dies' /
   P11       'Prevent: Bicycle riding' /
   P12       'Prevent: Getting diagnosis in hosp' /
   P13       'Prevent: Eating genet mod foods' /
   P14       'Prevent: Going into hosp for treatment' /
   Q1        'Dread: Nuclear reactor' /
   Q2        'Dread: medical error in hosp' /
   Q3        'Dread: Firefighting' /
   Q4        'Dread: having surgery in hosp' /
   Q5        'Dread: Respiratory arrest because send home too soon' /
   Q6        'Dread: Power lawn mover' /
   Q7        'Dread: Getting a prescrip med in hosp' /
   Q8        'Dread: Microwave ovens' /
   Q9        'Dread: Getting lab test in hosp' /
   Q10       'Dread: IV pump fails & patient dies' /
   Q11       'Dread: Bicycle riding' /
   Q12       'Dread: Getting diagnosis in hosp' /
   Q13       'Dread: Eating genet mod foods' /
   Q14       'Dread: Going into hosp for treatment' /
   R1        'Worry: Nuclear reactor' /
   R2        'Worry: medical error in hosp' /
   R3        'Worry: Firefighting' /
   R4        'Worry: having surgery in hosp' /
   R5        'Worry: Respiratory arrest because send home too soon' /
   R6        'Worry: Power lawn mover' /
   R7        'Worry: Getting a prescrip med in hosp' /
   R8        'Worry: Microwave ovens' /
   R9        'Worry: Getting lab test in hosp' /
   R10       'Worry: IV pump fails & patient dies' /
   R11       'Worry: Bicycle riding' /
   R12       'Worry: Getting diagnosis in hosp' /
   R13       'Worry: Eating genet mod foods' /
   R14       'Worry: Going into hosp for treatment' /
   BIS1      'BIS1' /
   BASHFUL   'BASHFUL' /
   BOLD      'BOLD' /
   ENERG     'ENERG' /
   ENVIOUS   'ENVIOUS' /
   BIS2      'BIS2' /
   EXTRA     'EXTRA' /
   FRETFUL   'FRETFUL' /
   BIS3      'BIS3' /
   JEALOUS   'JEALOUS' /
   BIS4      'BIS4' /
   MOODY     'MOODY' /
   QUIET     'QUIET' /
   BIS5      'BIS5' /
   RELAXED   'RELAXED' /
   SHY       'SHY' /
   BIS6      'BIS6' /
   TALKA     'TALKA' /
   TEMPE     'TEMPE' /
   TOUCHY    'TOUCHY' /
   BIS7      'BIS7' /
   UNENV     'UNENV' /
   WITHD     'WITHD' /
   AGE       'Subject age' /
   MARITAL   'Marital status' /
   GENDER    'Subject gender' /
   RACE      'Subject ethnic identity' /
   READERR   'How often have you read or heard about medical errors' /
   HEALTH    'How would you decribe you current health?' /
   SEEDOC    'How many times have you been to see a doctor in the paste'+
     ' year?'/
   HOSPPAST  'How many nights, if any, have you spent in the hospital in'+
     ' the past year?'/
   FAMHOSP   'How many nights, if any, have family members spent in the'+
     ' hospital in the past year?'/
   HOSPNEXT  'How likely are you to spend a night in the hospital in the'+
     ' coming year?'/
   EDUC      'Your highest education level' /
   CHILDREN  'How many children, if any, do you have at home?' /
   BIS       'BIS (Behavioral Inhibition scale)' /
   EXTRAVER  'Extraversion scale' /
   STABLE    'Stability scale' /
   .


* SPSS VALUE LABELS COMMAND.

VALUE LABELS
   PRE1      0 'Not at all serious problem' 2 'Somewhat serious problem'
             4 'Moderately serious problem' 6 'Very serious problem' /
   POST1     0 'Not at all serious problem' 2 'Somewhat serious problem'
             4 'Moderately serious problem' 6 'Very serious problem' /
   PRE2      0 'Not at all serious problem' 2 'Somewhat serious problem'
             4 'Moderately serious problem' 6 'Very serious problem' /
   POST2     0 'Not at all serious problem' 2 'Somewhat serious problem'
             4 'Moderately serious problem' 6 'Very serious problem' /
   PRE3      0 'Do not trust at all' 2 'Trust somewhat' 4 'Trust moderately'
             6 'Trust completely' /
   POST3     0 'Do not trust at all' 2 'Trust somewhat' 4 'Trust moderately'
             6 'Trust completely' /
   PRE4      0 'Do not trust at all' 2 'Trust somewhat' 4 'Trust moderately'
             6 'Trust completely' /
   POST4     0 'Do not trust at all' 2 'Trust somewhat' 4 'Trust moderately'
             6 'Trust completely' /
   PRE5      0 'Do not trust at all' 2 'Trust somewhat' 4 'Trust moderately'
             6 'Trust completely' /
   POST5     0 'Do not trust at all' 2 'Trust somewhat' 4 'Trust moderately'
             6 'Trust completely' /
   PRE6      0 'Cannot rely at all' 2 'Can rely somewhat'
             4 'Can rely moderately' 6 'Can rely a lot' /
   POST6     0 'Cannot rely at all' 2 'Can rely somewhat'
             4 'Can rely moderately' 6 'Can rely a lot' /
   CONDITION 1 'At beginning' 2 'At end' /
   T1        0 'Not at all worried or concerned'
             6 'Very worried or concerned' /
   T2        0 'Not at all worried or concerned'
             6 'Very worried or concerned' /
   T3        0 'Not at all worried or concerned'
             6 'Very worried or concerned' /
   T4        0 'Not at all worried or concerned'
             6 'Very worried or concerned' /
   T5        0 'Not at all worried or concerned'
             6 'Very worried or concerned' /
   T6        0 'Not at all worried or concerned'
             6 'Very worried or concerned' /
   T7        0 'Not at all worried or concerned'
             6 'Very worried or concerned' /
   T8        0 'Not at all worried or concerned'
             6 'Very worried or concerned' /
   T9        0 'Not at all worried or concerned'
             6 'Very worried or concerned' /
   T10       0 'Not at all worried or concerned'
             6 'Very worried or concerned' /
   T11       0 'Not at all worried or concerned'
             6 'Very worried or concerned' /
   T12       0 'Not at all worried or concerned'
             6 'Very worried or concerned' /
   T13       0 'Not at all worried or concerned'
             6 'Very worried or concerned' /
   T14       0 'Not at all worried or concerned'
             6 'Very worried or concerned' /
   T15       1 'Yes' 2 'No' 3 'Don''t know' /
   T16       1 'Yes' 2 'No' 3 'Don''t know' /
   B1        0 'Not at all likely' 3 'Somewhat likely' 6 'Very likely' /
   B2        0 'Not at all likely' 3 'Somewhat likely' 6 'Very likely' /
   B3        0 'Not at all likely' 3 'Somewhat likely' 6 'Very likely' /
   B4        0 'Not at all likely' 3 'Somewhat likely' 6 'Very likely' /
   B5        0 'Not at all likely' 3 'Somewhat likely' 6 'Very likely' /
   B6        0 'Not at all likely' 3 'Somewhat likely' 6 'Very likely' /
   B7        0 'Not at all likely' 3 'Somewhat likely' 6 'Very likely' /
   B8        0 'Not at all likely' 3 'Somewhat likely' 6 'Very likely' /
   B9        0 'Not at all likely' 3 'Somewhat likely' 6 'Very likely' /
   B10       0 'Not at all likely' 3 'Somewhat likely' 6 'Very likely' /
   B11       0 'Not at all likely' 3 'Somewhat likely' 6 'Very likely' /
   B12       0 'Not at all likely' 3 'Somewhat likely' 6 'Very likely' /
   B13       0 'Not at all likely' 3 'Somewhat likely' 6 'Very likely' /
   B14       0 'Not at all likely' 3 'Somewhat likely' 6 'Very likely' /
   C1        0 'Not at all likely' 6 'Very likely' /
   C2        0 'Not at all likely' 6 'Very likely' /
   C3        0 'Not at all likely' 6 'Very likely' /
   C4        0 'Not at all likely' 6 'Very likely' /
   C5        0 'Not at all likely' 6 'Very likely' /
   C6        0 'Not at all likely' 6 'Very likely' /
   C7        0 'Not at all likely' 6 'Very likely' /
   C8        0 'Not at all likely' 6 'Very likely' /
   C9        0 'Not at all likely' 6 'Very likely' /
   C10       0 'Not at all likely' 6 'Very likely' /
   C11       0 'Not at all likely' 6 'Very likely' /
   C12       0 'Not at all likely' 6 'Very likely' /
   C13       0 'Not at all likely' 6 'Very likely' /
   C14       0 'Not at all likely' 6 'Very likely' /
   C15       0 'Not at all likely' 6 'Very likely' /
   C16       0 'Not at all likely' 6 'Very likely' /
   C17       0 'Not at all likely' 6 'Very likely' /
   C18       0 'Not at all likely' 6 'Very likely' /
   C19       0 'Not at all likely' 6 'Very likely' /
   C20       0 'Not at all likely' 6 'Very likely' /
   C21       0 'Not at all likely' 6 'Very likely' /
   C22       0 'Not at all likely' 6 'Very likely' /
   C23       0 'Not at all likely' 6 'Very likely' /
   C24       0 'Not at all likely' 6 'Very likely' /
   C25       0 'Not at all likely' 6 'Very likely' /
   C26       0 'Not at all likely' 6 'Very likely' /
   C27       0 'Not at all likely' 6 'Very likely' /
   C28       0 'Not at all likely' 6 'Very likely' /
   C29       0 'Not at all likely' 6 'Very likely' /
   D1        0 'Little or no harm' 6 'Serious harm or death' /
   D2        0 'Little or no harm' 6 'Serious harm or death' /
   D3        0 'Little or no harm' 6 'Serious harm or death' /
   D4        0 'Little or no harm' 6 'Serious harm or death' /
   D5        0 'Little or no harm' 6 'Serious harm or death' /
   D6        0 'Little or no harm' 6 'Serious harm or death' /
   D7        0 'Little or no harm' 6 'Serious harm or death' /
   D8        0 'Little or no harm' 6 'Serious harm or death' /
   D9        0 'Little or no harm' 6 'Serious harm or death' /
   D10       0 'Little or no harm' 6 'Serious harm or death' /
   D11       0 'Little or no harm' 6 'Serious harm or death' /
   D12       0 'Little or no harm' 6 'Serious harm or death' /
   D13       0 'Little or no harm' 6 'Serious harm or death' /
   D14       0 'Little or no harm' 6 'Serious harm or death' /
   D15       0 'Little or no harm' 6 'Serious harm or death' /
   D16       0 'Little or no harm' 6 'Serious harm or death' /
   D17       0 'Little or no harm' 6 'Serious harm or death' /
   D18       0 'Little or no harm' 6 'Serious harm or death' /
   D19       0 'Little or no harm' 6 'Serious harm or death' /
   D20       0 'Little or no harm' 6 'Serious harm or death' /
   D21       0 'Little or no harm' 6 'Serious harm or death' /
   D22       0 'Little or no harm' 6 'Serious harm or death' /
   D23       0 'Little or no harm' 6 'Serious harm or death' /
   D24       0 'Little or no harm' 6 'Serious harm or death' /
   D25       0 'Little or no harm' 6 'Serious harm or death' /
   D26       0 'Little or no harm' 6 'Serious harm or death' /
   D27       0 'Little or no harm' 6 'Serious harm or death' /
   D28       0 'Little or no harm' 6 'Serious harm or death' /
   D29       0 'Little or no harm' 6 'Serious harm or death' /
   G1        0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G2        0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G3        0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G4        0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G5        0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G6        0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G7        0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G8        0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G9        0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G10       0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G11       0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G12       0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G13       0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G14       0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G15       0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G16       0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G17       0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G18       0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G19       0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G20       0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G21       0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G22       0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G23       0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G24       0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G25       0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G26       0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G27       0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G28       0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   G29       0 'Just chance/no one is to blame'
             6 'Someone at the hospital is to blame' /
   K1        0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K2        0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K3        0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K4        0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K5        0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K6        0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K7        0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K8        0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K9        0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K10       0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K11       0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K12       0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K13       0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K14       0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K15       0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K16       0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K17       0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K18       0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K19       0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K20       0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K21       0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K22       0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K23       0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K24       0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K25       0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K26       0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K27       0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K28       0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   K29       0 'Patient is unaware of risks'
             6 'Patient is completely aware of risks' /
   M1        0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M2        0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M3        0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M4        0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M5        0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M6        0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M7        0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M8        0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M9        0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M10       0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M11       0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M12       0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M13       0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M14       0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M15       0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M16       0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M17       0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M18       0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M19       0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M20       0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M21       0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M22       0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M23       0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M24       0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M25       0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M26       0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M27       0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M28       0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   M29       0 'Does not serve as a warning signal'
             6 'Serves as a strong warning signal' /
   E1        0 'Not at all likely' 6 'Very likely' /
   E2        0 'Not at all likely' 6 'Very likely' /
   E3        0 'Not at all likely' 6 'Very likely' /
   E4        0 'Not at all likely' 6 'Very likely' /
   E5        0 'Not at all likely' 6 'Very likely' /
   E6        0 'Not at all likely' 6 'Very likely' /
   E7        0 'Not at all likely' 6 'Very likely' /
   E8        0 'Not at all likely' 6 'Very likely' /
   E9        0 'Not at all likely' 6 'Very likely' /
   E10       0 'Not at all likely' 6 'Very likely' /
   E11       0 'Not at all likely' 6 'Very likely' /
   E12       0 'Not at all likely' 6 'Very likely' /
   E13       0 'Not at all likely' 6 'Very likely' /
   E14       0 'Not at all likely' 6 'Very likely' /
   E15       0 'Not at all likely' 6 'Very likely' /
   E16       0 'Not at all likely' 6 'Very likely' /
   E17       0 'Not at all likely' 6 'Very likely' /
   E18       0 'Not at all likely' 6 'Very likely' /
   E19       0 'Not at all likely' 6 'Very likely' /
   E20       0 'Not at all likely' 6 'Very likely' /
   E21       0 'Not at all likely' 6 'Very likely' /
   E22       0 'Not at all likely' 6 'Very likely' /
   E23       0 'Not at all likely' 6 'Very likely' /
   E24       0 'Not at all likely' 6 'Very likely' /
   E25       0 'Not at all likely' 6 'Very likely' /
   E26       0 'Not at all likely' 6 'Very likely' /
   E27       0 'Not at all likely' 6 'Very likely' /
   E28       0 'Not at all likely' 6 'Very likely' /
   E29       0 'Not at all likely' 6 'Very likely' /
   H1        0 'Not at all likely' 6 'Very likely' /
   H2        0 'Not at all likely' 6 'Very likely' /
   H3        0 'Not at all likely' 6 'Very likely' /
   H4        0 'Not at all likely' 6 'Very likely' /
   H5        0 'Not at all likely' 6 'Very likely' /
   H6        0 'Not at all likely' 6 'Very likely' /
   H7        0 'Not at all likely' 6 'Very likely' /
   H8        0 'Not at all likely' 6 'Very likely' /
   H9        0 'Not at all likely' 6 'Very likely' /
   H10       0 'Not at all likely' 6 'Very likely' /
   H11       0 'Not at all likely' 6 'Very likely' /
   H12       0 'Not at all likely' 6 'Very likely' /
   H13       0 'Not at all likely' 6 'Very likely' /
   H14       0 'Not at all likely' 6 'Very likely' /
   H15       0 'Not at all likely' 6 'Very likely' /
   H16       0 'Not at all likely' 6 'Very likely' /
   H17       0 'Not at all likely' 6 'Very likely' /
   H18       0 'Not at all likely' 6 'Very likely' /
   H19       0 'Not at all likely' 6 'Very likely' /
   H20       0 'Not at all likely' 6 'Very likely' /
   H21       0 'Not at all likely' 6 'Very likely' /
   H22       0 'Not at all likely' 6 'Very likely' /
   H23       0 'Not at all likely' 6 'Very likely' /
   H24       0 'Not at all likely' 6 'Very likely' /
   H25       0 'Not at all likely' 6 'Very likely' /
   H26       0 'Not at all likely' 6 'Very likely' /
   H27       0 'Not at all likely' 6 'Very likely' /
   H28       0 'Not at all likely' 6 'Very likely' /
   H29       0 'Not at all likely' 6 'Very likely' /
   I1        0 'Not at all likely' 6 'Ver likely' /
   I2        0 'Not at all likely' 6 'Ver likely' /
   I3        0 'Not at all likely' 6 'Ver likely' /
   I4        0 'Not at all likely' 6 'Ver likely' /
   I5        0 'Not at all likely' 6 'Ver likely' /
   I6        0 'Not at all likely' 6 'Ver likely' /
   I7        0 'Not at all likely' 6 'Ver likely' /
   I8        0 'Not at all likely' 6 'Ver likely' /
   I9        0 'Not at all likely' 6 'Ver likely' /
   I10       0 'Not at all likely' 6 'Ver likely' /
   I11       0 'Not at all likely' 6 'Ver likely' /
   I12       0 'Not at all likely' 6 'Ver likely' /
   I13       0 'Not at all likely' 6 'Ver likely' /
   I14       0 'Not at all likely' 6 'Ver likely' /
   I15       0 'Not at all likely' 6 'Ver likely' /
   I16       0 'Not at all likely' 6 'Ver likely' /
   I17       0 'Not at all likely' 6 'Ver likely' /
   I18       0 'Not at all likely' 6 'Ver likely' /
   I19       0 'Not at all likely' 6 'Ver likely' /
   I20       0 'Not at all likely' 6 'Ver likely' /
   I21       0 'Not at all likely' 6 'Ver likely' /
   I22       0 'Not at all likely' 6 'Ver likely' /
   I23       0 'Not at all likely' 6 'Ver likely' /
   I24       0 'Not at all likely' 6 'Ver likely' /
   I25       0 'Not at all likely' 6 'Ver likely' /
   I26       0 'Not at all likely' 6 'Ver likely' /
   I27       0 'Not at all likely' 6 'Ver likely' /
   I28       0 'Not at all likely' 6 'Ver likely' /
   I29       0 'Not at all likely' 6 'Ver likely' /
   J1        0 'Old Risk' 6 'New Risk' /
   J2        0 'Old Risk' 6 'New Risk' /
   J3        0 'Old Risk' 6 'New Risk' /
   J4        0 'Old Risk' 6 'New Risk' /
   J5        0 'Old Risk' 6 'New Risk' /
   J6        0 'Old Risk' 6 'New Risk' /
   J7        0 'Old Risk' 6 'New Risk' /
   J8        0 'Old Risk' 6 'New Risk' /
   J9        0 'Old Risk' 6 'New Risk' /
   J10       0 'Old Risk' 6 'New Risk' /
   J11       0 'Old Risk' 6 'New Risk' /
   J12       0 'Old Risk' 6 'New Risk' /
   J13       0 'Old Risk' 6 'New Risk' /
   J14       0 'Old Risk' 6 'New Risk' /
   J15       0 'Old Risk' 6 'New Risk' /
   J16       0 'Old Risk' 6 'New Risk' /
   J17       0 'Old Risk' 6 'New Risk' /
   J18       0 'Old Risk' 6 'New Risk' /
   J19       0 'Old Risk' 6 'New Risk' /
   J20       0 'Old Risk' 6 'New Risk' /
   J21       0 'Old Risk' 6 'New Risk' /
   J22       0 'Old Risk' 6 'New Risk' /
   J23       0 'Old Risk' 6 'New Risk' /
   J24       0 'Old Risk' 6 'New Risk' /
   J25       0 'Old Risk' 6 'New Risk' /
   J26       0 'Old Risk' 6 'New Risk' /
   J27       0 'Old Risk' 6 'New Risk' /
   J28       0 'Old Risk' 6 'New Risk' /
   J29       0 'Old Risk' 6 'New Risk' /
   L1        0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L2        0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L3        0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L4        0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L5        0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L6        0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L7        0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L8        0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L9        0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L10       0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L11       0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L12       0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L13       0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L14       0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L15       0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L16       0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L17       0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L18       0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L19       0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L20       0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L21       0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L22       0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L23       0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L24       0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L25       0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L26       0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L27       0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L28       0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   L29       0 'Should not be worried or concerned'
             6 'Should be very worried or concerned' /
   F1        0 'Not dreaded at all' 6 'Extremely dreaded' /
   F2        0 'Not dreaded at all' 6 'Extremely dreaded' /
   F3        0 'Not dreaded at all' 6 'Extremely dreaded' /
   F4        0 'Not dreaded at all' 6 'Extremely dreaded' /
   F5        0 'Not dreaded at all' 6 'Extremely dreaded' /
   F6        0 'Not dreaded at all' 6 'Extremely dreaded' /
   F7        0 'Not dreaded at all' 6 'Extremely dreaded' /
   F8        0 'Not dreaded at all' 6 'Extremely dreaded' /
   F9        0 'Not dreaded at all' 6 'Extremely dreaded' /
   F10       0 'Not dreaded at all' 6 'Extremely dreaded' /
   F11       0 'Not dreaded at all' 6 'Extremely dreaded' /
   F12       0 'Not dreaded at all' 6 'Extremely dreaded' /
   F13       0 'Not dreaded at all' 6 'Extremely dreaded' /
   F14       0 'Not dreaded at all' 6 'Extremely dreaded' /
   F15       0 'Not dreaded at all' 6 'Extremely dreaded' /
   F16       0 'Not dreaded at all' 6 'Extremely dreaded' /
   F17       0 'Not dreaded at all' 6 'Extremely dreaded' /
   F18       0 'Not dreaded at all' 6 'Extremely dreaded' /
   F19       0 'Not dreaded at all' 6 'Extremely dreaded' /
   F20       0 'Not dreaded at all' 6 'Extremely dreaded' /
   F21       0 'Not dreaded at all' 6 'Extremely dreaded' /
   F22       0 'Not dreaded at all' 6 'Extremely dreaded' /
   F23       0 'Not dreaded at all' 6 'Extremely dreaded' /
   F24       0 'Not dreaded at all' 6 'Extremely dreaded' /
   F25       0 'Not dreaded at all' 6 'Extremely dreaded' /
   F26       0 'Not dreaded at all' 6 'Extremely dreaded' /
   F27       0 'Not dreaded at all' 6 'Extremely dreaded' /
   F28       0 'Not dreaded at all' 6 'Extremely dreaded' /
   F29       0 'Not dreaded at all' 6 'Extremely dreaded' /
   N1        0 'Not likely to seek out hospital comparisons'
             6 'Very likely to seek out hospital comparisons' /
   N2        0 'Regulation is not necessary' 6 'Regulation is very necessary'
             /
   N3        0 'Not worried or concerned' 6 'Very worried or concerned' /
   N4        0 'Not likely to discuss' 6 'Very likely to discuss' /
   N5        0 'Not likely to change' 6 'Very likely to change' /
   N6        0 'Not likely to avoid' 6 'Very likely to avoid' /
   O1        0 'Not at all effective' 6 'Very effective' /
   O2        0 'Not at all effective' 6 'Very effective' /
   O3        0 'Not at all effective' 6 'Very effective' /
   O4        0 'Not at all effective' 6 'Very effective' /
   O5        0 'Not at all effective' 6 'Very effective' /
   O6        0 'Not at all effective' 6 'Very effective' /
   O7        0 'Not at all effective' 6 'Very effective' /
   O8        0 'Not at all effective' 6 'Very effective' /
   O9        0 'Not at all effective' 6 'Very effective' /
   O10       0 'Not at all effective' 6 'Very effective' /
   O11       0 'Not at all effective' 6 'Very effective' /
   O12       0 'Not at all effective' 6 'Very effective' /
   O13       0 'Not at all effective' 6 'Very effective' /
   O14       0 'Not at all effective' 6 'Very effective' /
   O15       0 'Not at all effective' 6 'Very effective' /
   O16       0 'Not at all effective' 6 'Very effective' /
   O17       0 'Not at all effective' 6 'Very effective' /
   O18       0 'Not at all effective' 6 'Very effective' /
   O19       0 'Not at all effective' 6 'Very effective' /
   P1        0 'Risks not preventable at all'
             6 'Risks completely preventable' /
   P2        0 'Risks not preventable at all'
             6 'Risks completely preventable' /
   P3        0 'Risks not preventable at all'
             6 'Risks completely preventable' /
   P4        0 'Risks not preventable at all'
             6 'Risks completely preventable' /
   P5        0 'Risks not preventable at all'
             6 'Risks completely preventable' /
   P6        0 'Risks not preventable at all'
             6 'Risks completely preventable' /
   P7        0 'Risks not preventable at all'
             6 'Risks completely preventable' /
   P8        0 'Risks not preventable at all'
             6 'Risks completely preventable' /
   P9        0 'Risks not preventable at all'
             6 'Risks completely preventable' /
   P10       0 'Risks not preventable at all'
             6 'Risks completely preventable' /
   P11       0 'Risks not preventable at all'
             6 'Risks completely preventable' /
   P12       0 'Risks not preventable at all'
             6 'Risks completely preventable' /
   P13       0 'Risks not preventable at all'
             6 'Risks completely preventable' /
   P14       0 'Risks not preventable at all'
             6 'Risks completely preventable' /
   Q1        0 'Risks are not dreaded at all' 6 'Risks are very dreaded' /
   Q2        0 'Risks are not dreaded at all' 6 'Risks are very dreaded' /
   Q3        0 'Risks are not dreaded at all' 6 'Risks are very dreaded' /
   Q4        0 'Risks are not dreaded at all' 6 'Risks are very dreaded' /
   Q5        0 'Risks are not dreaded at all' 6 'Risks are very dreaded' /
   Q6        0 'Risks are not dreaded at all' 6 'Risks are very dreaded' /
   Q7        0 'Risks are not dreaded at all' 6 'Risks are very dreaded' /
   Q8        0 'Risks are not dreaded at all' 6 'Risks are very dreaded' /
   Q9        0 'Risks are not dreaded at all' 6 'Risks are very dreaded' /
   Q10       0 'Risks are not dreaded at all' 6 'Risks are very dreaded' /
   Q11       0 'Risks are not dreaded at all' 6 'Risks are very dreaded' /
   Q12       0 'Risks are not dreaded at all' 6 'Risks are very dreaded' /
   Q13       0 'Risks are not dreaded at all' 6 'Risks are very dreaded' /
   Q14       0 'Risks are not dreaded at all' 6 'Risks are very dreaded' /
   R1        0 'Should not be worried or concerned at all'
             6 'Should be very worried or concerned' /
   R2        0 'Should not be worried or concerned at all'
             6 'Should be very worried or concerned' /
   R3        0 'Should not be worried or concerned at all'
             6 'Should be very worried or concerned' /
   R4        0 'Should not be worried or concerned at all'
             6 'Should be very worried or concerned' /
   R5        0 'Should not be worried or concerned at all'
             6 'Should be very worried or concerned' /
   R6        0 'Should not be worried or concerned at all'
             6 'Should be very worried or concerned' /
   R7        0 'Should not be worried or concerned at all'
             6 'Should be very worried or concerned' /
   R8        0 'Should not be worried or concerned at all'
             6 'Should be very worried or concerned' /
   R9        0 'Should not be worried or concerned at all'
             6 'Should be very worried or concerned' /
   R10       0 'Should not be worried or concerned at all'
             6 'Should be very worried or concerned' /
   R11       0 'Should not be worried or concerned at all'
             6 'Should be very worried or concerned' /
   R12       0 'Should not be worried or concerned at all'
             6 'Should be very worried or concerned' /
   R13       0 'Should not be worried or concerned at all'
             6 'Should be very worried or concerned' /
   R14       0 'Should not be worried or concerned at all'
             6 'Should be very worried or concerned' /
   BIS1      1 'Extremely Inaccurately describes me'
             2 'Very Inaccurately describes me'
             3 'Moderately Inaccurately describes me'
             4 'Slightly Inaccurately describes me' 5 '?'
             6 'Slightly Accurately describes me'
             7 'Moderately Accurately describes me'
             8 'Very Accurately describes me'
             9 'Extremely Accurately describes me' /
   BASHFUL   1 'Extremely Inaccurately describes me'
             2 'Very Inaccurately describes me'
             3 'Moderately Inaccurately describes me'
             4 'Slightly Inaccurately describes me' 5 '?'
             6 'Slightly Accurately describes me'
             7 'Moderately Accurately describes me'
             8 'Very Accurately describes me'
             9 'Extremely Accurately describes me' /
   BOLD      1 'Extremely Inaccurately describes me'
             2 'Very Inaccurately describes me'
             3 'Moderately Inaccurately describes me'
             4 'Slightly Inaccurately describes me' 5 '?'
             6 'Slightly Accurately describes me'
             7 'Moderately Accurately describes me'
             8 'Very Accurately describes me'
             9 'Extremely Accurately describes me' /
   ENERG     1 'Extremely Inaccurately describes me'
             2 'Very Inaccurately describes me'
             3 'Moderately Inaccurately describes me'
             4 'Slightly Inaccurately describes me' 5 '?'
             6 'Slightly Accurately describes me'
             7 'Moderately Accurately describes me'
             8 'Very Accurately describes me'
             9 'Extremely Accurately describes me' /
   ENVIOUS   1 'Extremely Inaccurately describes me'
             2 'Very Inaccurately describes me'
             3 'Moderately Inaccurately describes me'
             4 'Slightly Inaccurately describes me' 5 '?'
             6 'Slightly Accurately describes me'
             7 'Moderately Accurately describes me'
             8 'Very Accurately describes me'
             9 'Extremely Accurately describes me' /
   BIS2      1 'Extremely Inaccurately describes me'
             2 'Very Inaccurately describes me'
             3 'Moderately Inaccurately describes me'
             4 'Slightly Inaccurately describes me' 5 '?'
             6 'Slightly Accurately describes me'
             7 'Moderately Accurately describes me'
             8 'Very Accurately describes me'
             9 'Extremely Accurately describes me' /
   EXTRA     1 'Extremely Inaccurately describes me'
             2 'Very Inaccurately describes me'
             3 'Moderately Inaccurately describes me'
             4 'Slightly Inaccurately describes me' 5 '?'
             6 'Slightly Accurately describes me'
             7 'Moderately Accurately describes me'
             8 'Very Accurately describes me'
             9 'Extremely Accurately describes me' /
   FRETFUL   1 'Extremely Inaccurately describes me'
             2 'Very Inaccurately describes me'
             3 'Moderately Inaccurately describes me'
             4 'Slightly Inaccurately describes me' 5 '?'
             6 'Slightly Accurately describes me'
             7 'Moderately Accurately describes me'
             8 'Very Accurately describes me'
             9 'Extremely Accurately describes me' /
   BIS3      1 'Extremely Inaccurately describes me'
             2 'Very Inaccurately describes me'
             3 'Moderately Inaccurately describes me'
             4 'Slightly Inaccurately describes me' 5 '?'
             6 'Slightly Accurately describes me'
             7 'Moderately Accurately describes me'
             8 'Very Accurately describes me'
             9 'Extremely Accurately describes me' /
   JEALOUS   1 'Extremely Inaccurately describes me'
             2 'Very Inaccurately describes me'
             3 'Moderately Inaccurately describes me'
             4 'Slightly Inaccurately describes me' 5 '?'
             6 'Slightly Accurately describes me'
             7 'Moderately Accurately describes me'
             8 'Very Accurately describes me'
             9 'Extremely Accurately describes me' /
   BIS4      1 'Extremely Inaccurately describes me'
             2 'Very Inaccurately describes me'
             3 'Moderately Inaccurately describes me'
             4 'Slightly Inaccurately describes me' 5 '?'
             6 'Slightly Accurately describes me'
             7 'Moderately Accurately describes me'
             8 'Very Accurately describes me'
             9 'Extremely Accurately describes me' /
   MOODY     1 'Extremely Inaccurately describes me'
             2 'Very Inaccurately describes me'
             3 'Moderately Inaccurately describes me'
             4 'Slightly Inaccurately describes me' 5 '?'
             6 'Slightly Accurately describes me'
             7 'Moderately Accurately describes me'
             8 'Very Accurately describes me'
             9 'Extremely Accurately describes me' /
   QUIET     1 'Extremely Inaccurately describes me'
             2 'Very Inaccurately describes me'
             3 'Moderately Inaccurately describes me'
             4 'Slightly Inaccurately describes me' 5 '?'
             6 'Slightly Accurately describes me'
             7 'Moderately Accurately describes me'
             8 'Very Accurately describes me'
             9 'Extremely Accurately describes me' /
   BIS5      1 'Extremely Inaccurately describes me'
             2 'Very Inaccurately describes me'
             3 'Moderately Inaccurately describes me'
             4 'Slightly Inaccurately describes me' 5 '?'
             6 'Slightly Accurately describes me'
             7 'Moderately Accurately describes me'
             8 'Very Accurately describes me'
             9 'Extremely Accurately describes me' /
   RELAXED   1 'Extremely Inaccurately describes me'
             2 'Very Inaccurately describes me'
             3 'Moderately Inaccurately describes me'
             4 'Slightly Inaccurately describes me' 5 '?'
             6 'Slightly Accurately describes me'
             7 'Moderately Accurately describes me'
             8 'Very Accurately describes me'
             9 'Extremely Accurately describes me' /
   SHY       1 'Extremely Inaccurately describes me'
             2 'Very Inaccurately describes me'
             3 'Moderately Inaccurately describes me'
             4 'Slightly Inaccurately describes me' 5 '?'
             6 'Slightly Accurately describes me'
             7 'Moderately Accurately describes me'
             8 'Very Accurately describes me'
             9 'Extremely Accurately describes me' /
   BIS6      1 'Extremely Inaccurately describes me'
             2 'Very Inaccurately describes me'
             3 'Moderately Inaccurately describes me'
             4 'Slightly Inaccurately describes me' 5 '?'
             6 'Slightly Accurately describes me'
             7 'Moderately Accurately describes me'
             8 'Very Accurately describes me'
             9 'Extremely Accurately describes me' /
   TALKA     1 'Extremely Inaccurately describes me'
             2 'Very Inaccurately describes me'
             3 'Moderately Inaccurately describes me'
             4 'Slightly Inaccurately describes me' 5 '?'
             6 'Slightly Accurately describes me'
             7 'Moderately Accurately describes me'
             8 'Very Accurately describes me'
             9 'Extremely Accurately describes me' /
   TEMPE     1 'Extremely Inaccurately describes me'
             2 'Very Inaccurately describes me'
             3 'Moderately Inaccurately describes me'
             4 'Slightly Inaccurately describes me' 5 '?'
             6 'Slightly Accurately describes me'
             7 'Moderately Accurately describes me'
             8 'Very Accurately describes me'
             9 'Extremely Accurately describes me' /
   TOUCHY    1 'Extremely Inaccurately describes me'
             2 'Very Inaccurately describes me'
             3 'Moderately Inaccurately describes me'
             4 'Slightly Inaccurately describes me' 5 '?'
             6 'Slightly Accurately describes me'
             7 'Moderately Accurately describes me'
             8 'Very Accurately describes me'
             9 'Extremely Accurately describes me' /
   BIS7      1 'Extremely Inaccurately describes me'
             2 'Very Inaccurately describes me'
             3 'Moderately Inaccurately describes me'
             4 'Slightly Inaccurately describes me' 5 '?'
             6 'Slightly Accurately describes me'
             7 'Moderately Accurately describes me'
             8 'Very Accurately describes me'
             9 'Extremely Accurately describes me' /
   UNENV     1 'Extremely Inaccurately describes me'
             2 'Very Inaccurately describes me'
             3 'Moderately Inaccurately describes me'
             4 'Slightly Inaccurately describes me' 5 '?'
             6 'Slightly Accurately describes me'
             7 'Moderately Accurately describes me'
             8 'Very Accurately describes me'
             9 'Extremely Accurately describes me' /
   WITHD     1 'Extremely Inaccurately describes me'
             2 'Very Inaccurately describes me'
             3 'Moderately Inaccurately describes me'
             4 'Slightly Inaccurately describes me' 5 '?'
             6 'Slightly Accurately describes me'
             7 'Moderately Accurately describes me'
             8 'Very Accurately describes me'
             9 'Extremely Accurately describes me' /
   MARITAL   1 'Single' 2 'Married' 3 'Divorced' 4 'Widowed' /
   GENDER    1 'Female' 2 'Male' /
   RACE      1 'Black' 2 'Asian/Pacific' 3 'Caucasian' 4 'Hispanic'
             5 'Native American' 6 'Other' /
   READERR   1 'Never' 2 'Seldom' 3 'Somewhat often' 4 'Very often' /
   HEALTH    1 'Poor' 2 'Fair' 3 'Good' 4 'Excellent' /
   HOSPNEXT  1 'Not at all likely' 2 'Somewhat likely' 3 'Moderately likely'
             4 'Very likely' /
   EDUC      1 'Less than high school' 2 'High school graduate'
             3 'Some college' 4 'College graduate' 5 'Graduate degree' /
   .

EXECUTE.

* SPSS VARIABLE LEVEL COMMAND.

VARIABLE LEVEL
   SUBJ
   PRE1
   POST1
   PRE2
   POST2
   PRE3
   POST3
   PRE4
   POST4
   PRE5
   POST5
   PRE6
   POST6
   ANCHOR
   APPENDIC
   ALZHEIM
   AUTOACC
   CANCER
   DIABETES
   HEARTDIS
   AIDS
   HOMICIDE
   FLU
   KIDNEY
   MEDERROR
   PARKINS
   STROKE
   SUICIDE
   T1
   T2
   T3
   T4
   T5
   T6
   T7
   T8
   T9
   T10
   T11
   T12
   T13
   T14
   B1
   B2
   B3
   B4
   B5
   B6
   B7
   B8
   B9
   B10
   B11
   B12
   B13
   B14
   C1
   C2
   C3
   C4
   C5
   C6
   C7
   C8
   C9
   C10
   C11
   C12
   C13
   C14
   C15
   C16
   C17
   C18
   C19
   C20
   C21
   C22
   C23
   C24
   C25
   C26
   C27
   C28
   C29
   D1
   D2
   D3
   D4
   D5
   D6
   D7
   D8
   D9
   D10
   D11
   D12
   D13
   D14
   D15
   D16
   D17
   D18
   D19
   D20
   D21
   D22
   D23
   D24
   D25
   D26
   D27
   D28
   D29
   G1
   G2
   G3
   G4
   G5
   G6
   G7
   G8
   G9
   G10
   G11
   G12
   G13
   G14
   G15
   G16
   G17
   G18
   G19
   G20
   G21
   G22
   G23
   G24
   G25
   G26
   G27
   G28
   G29
   K1
   K2
   K3
   K4
   K5
   K6
   K7
   K8
   K9
   K10
   K11
   K12
   K13
   K14
   K15
   K16
   K17
   K18
   K19
   K20
   K21
   K22
   K23
   K24
   K25
   K26
   K27
   K28
   K29
   M1
   M2
   M3
   M4
   M5
   M6
   M7
   M8
   M9
   M10
   M11
   M12
   M13
   M14
   M15
   M16
   M17
   M18
   M19
   M20
   M21
   M22
   M23
   M24
   M25
   M26
   M27
   M28
   M29
   E1
   E2
   E3
   E4
   E5
   E6
   E7
   E8
   E9
   E10
   E11
   E12
   E13
   E14
   E15
   E16
   E17
   E18
   E19
   E20
   E21
   E22
   E23
   E24
   E25
   E26
   E27
   E28
   E29
   H1
   H2
   H3
   H4
   H5
   H6
   H7
   H8
   H9
   H10
   H11
   H12
   H13
   H14
   H15
   H16
   H17
   H18
   H19
   H20
   H21
   H22
   H23
   H24
   H25
   H26
   H27
   H28
   H29
   I1
   I2
   I3
   I4
   I5
   I6
   I7
   I8
   I9
   I10
   I11
   I12
   I13
   I14
   I15
   I16
   I17
   I18
   I19
   I20
   I21
   I22
   I23
   I24
   I25
   I26
   I27
   I28
   I29
   J1
   J2
   J3
   J4
   J5
   J6
   J7
   J8
   J9
   J10
   J11
   J12
   J13
   J14
   J15
   J16
   J17
   J18
   J19
   J20
   J21
   J22
   J23
   J24
   J25
   J26
   J27
   J28
   J29
   L1
   L2
   L3
   L4
   L5
   L6
   L7
   L8
   L9
   L10
   L11
   L12
   L13
   L14
   L15
   L16
   L17
   L18
   L19
   L20
   L21
   L22
   L23
   L24
   L25
   L26
   L27
   L28
   L29
   F1
   F2
   F3
   F4
   F5
   F6
   F7
   F8
   F9
   F10
   F11
   F12
   F13
   F14
   F15
   F16
   F17
   F18
   F19
   F20
   F21
   F22
   F23
   F24
   F25
   F26
   F27
   F28
   F29
   N1
   N2
   N3
   N4
   N5
   N6
   O1
   O2
   O3
   O4
   O5
   O6
   O7
   O8
   O9
   O10
   O11
   O12
   O13
   O14
   O15
   O16
   O17
   O18
   O19
   P1
   P2
   P3
   P4
   P5
   P6
   P7
   P8
   P9
   P10
   P11
   P12
   P13
   P14
   Q1
   Q2
   Q3
   Q4
   Q5
   Q6
   Q7
   Q8
   Q9
   Q10
   Q11
   Q12
   Q13
   Q14
   R1
   R2
   R3
   R4
   R5
   R6
   R7
   R8
   R9
   R10
   R11
   R12
   R13
   R14
   AGE
   SEEDOC
   HOSPPAST
   FAMHOSP
   CHILDREN
   BIS
   EXTRAVER
   STABLE
    (scale).

VARIABLE LEVEL
   VERSION
   CONDITION
   T15
   T16
   T17
   SET
   BIS1
   BASHFUL
   BOLD
   ENERG
   ENVIOUS
   BIS2
   EXTRA
   FRETFUL
   BIS3
   JEALOUS
   BIS4
   MOODY
   QUIET
   BIS5
   RELAXED
   SHY
   BIS6
   TALKA
   TEMPE
   TOUCHY
   BIS7
   UNENV
   WITHD
   MARITAL
   GENDER
   RACE
   READERR
   HEALTH
   HOSPNEXT
   EDUC
    (nominal).

* Create SPSS system file.

*SAVE OUTFILE="spss-filename.sav".
