*-------------------------------------------------------------------------*
 !                                                                        !
 !               SAS DATA DEFINITION STATEMENTS FOR ICPSR 6834            !
 !                        BRITISH CRIME SURVEY, 1992                      !
 !                          TEENAGE BOOSTER SAMPLE                        !
 !                              ICPSR VERSION                             !
 !                             FEBRUARY, 1997                             !
 !                                                                        !
 ! SAS setup sections are provided for the LRECL version of this data     !
 ! collection.  These sections are listed below:                          !
 !                                                                        !
 ! DATA begins a SAS data step and names an output SAS data set.          !
 !                                                                        !
 ! INFILE identifies the input file to be read with the input  statement. !
 ! Users must replace the "physical-filename" with host computer-specific !
 ! input file specifications.                                             !
 !                                                                        !
 ! INPUT  assigns  the  name,  type,  decimal specification (if any), and !
 ! specifies the beginning and ending column locations for each variable. !
 !                                                                        !
 ! LABEL  assigns  descriptive  labels to all variables.  Variable labels !
 ! and variable names may be identical for some data files.               !
 !                                                                        !
 ! MISSING VALUE RECODES  sets  user-defined  numeric  missing  values to !
 ! missing  as  interpreted  by  the  SAS  system.  Only  variables  with !
 ! user-defined missing values are included in these statements.          !
 !                                                                        !
 ! PLEASE NOTE:  Users  should  combine  and modify these data definition !
 ! statements  to  suit  their specific needs.                            |
 !                                                                        !
*-------------------------------------------------------------------------;
                                                                           
                                                                           
* SAS DATA, INFILE, INPUT STATEMENTS FOR 6834;                             
                                                                           
DATA;                                                                      
INFILE "physical-filename" LRECL=697;                                      
INPUT                                                                      
   ROW_LAB $ 1-6                                                           
   TB_CASE 7-12                                                            
   AR_CODE 13-15                                                           
   T_SN 16-17                                                              
   T_SCRN 18                                                               
   BOOSTER 19                                                              
   CARD_28 20-21                                                           
   T1 22                                                                   
   T2 23                                                                   
   T3 24                                                                   
   T4 25                                                                   
   T5A 26                                                                  
   T5B 27                                                                  
   T5C 28                                                                  
   T5D 29                                                                  
   T5E 30                                                                  
   T6 31                                                                   
   T7A 32                                                                  
   T7B 33                                                                  
   T7C 34                                                                  
   T7D 35                                                                  
   T8 36                                                                   
   T9 37-38                                                                
   T10AMR1 39-40                                                           
   T10AMR2 41-42                                                           
   T10AMR3 43-44                                                           
   T10AMR4 45-46                                                           
   T10AMR5 47-48                                                           
   T10B 49-50                                                              
   T11AMR1 51-52                                                           
   T11AMR2 53-54                                                           
   T11AMR3 55-56                                                           
   T11AMR4 57-58                                                           
   T11AMR5 59-60                                                           
   T11AMR6 61-62                                                           
   T11BMR1 63-64                                                           
   T11BMR2 65-66                                                           
   T11BMR3 67-68                                                           
   T11BMR4 69-70                                                           
   T11BMR5 71-72                                                           
   T11BMR6 73-74                                                           
   T11BMR7 75-76                                                           
   T11C 77-78                                                              
   T11D 79-80                                                              
   T12 81                                                                  
   T13 82-83                                                               
   T14A 84-85                                                              
   T14BMR1 86-87                                                           
   T14BMR2 88-89                                                           
   T14BMR3 90-91                                                           
   T14BMR4 92-93                                                           
   T14BMR5 94-95                                                           
   T14C 96-97                                                              
   T14D 98-99                                                              
   T14E 100-101                                                            
   T14F 102-103                                                            
   T14G 104-105                                                            
   T14H 106-107                                                            
   CARD_29 108-109                                                         
   T14IMR1 110-111                                                         
   T14IMR2 112-113                                                         
   T14IMR3 114-115                                                         
   T14IMR4 116-117                                                         
   T14IMR5 118-119                                                         
   T14IMR6 120-121                                                         
   T14IMR7 122-123                                                         
   T14IMR8 124-125                                                         
   T14JMR1 126-127                                                         
   T14JMR2 128-129                                                         
   T14JMR3 130-131                                                         
   T15AMR1 132-133                                                         
   T15AMR2 134-135                                                         
   T15AMR3 136-137                                                         
   T15AMR4 138-139                                                         
   T15AMR5 140-141                                                         
   T15AMR6 142-143                                                         
   T15BMR1 144-145                                                         
   T15BMR2 146-147                                                         
   T15BMR3 148-149                                                         
   T15BMR4 150-151                                                         
   T15BMR5 152-153                                                         
   T15BMR6 154-155                                                         
   T15BMR7 156-157                                                         
   T15C 158-159                                                            
   T15D 160-161                                                            
   T15E 162-163                                                            
   T16 164                                                                 
   T17 165-166                                                             
   T18A 167-168                                                            
   T18B 169-170                                                            
   T18C 171-172                                                            
   T18D 173-174                                                            
   T18EMR1 175-176                                                         
   T18EMR2 177-178                                                         
   T18EMR3 179-180                                                         
   T18EMR4 181-182                                                         
   T18EMR5 183-184                                                         
   T18EMR6 185-186                                                         
   T18EMR7 187-188                                                         
   T18EMR8 189-190                                                         
   T18FMR1 191-192                                                         
   T18FMR2 193-194                                                         
   T18FMR3 195-196                                                         
   T19AMR1 197-198                                                         
   T19AMR2 199-200                                                         
   T19AMR3 201-202                                                         
   T19AMR4 203-204                                                         
   T19AMR5 205-206                                                         
   T19AMR6 207-208                                                         
   T19BMR1 209-210                                                         
   T19BMR2 211-212                                                         
   T19BMR3 213-214                                                         
   T19BMR4 215-216                                                         
   T19BMR5 217-218                                                         
   T19BMR6 219-220                                                         
   T19C 221-222                                                            
   T19D 223-224                                                            
   T19E 225-226                                                            
   CARD_30 227-228                                                         
   T20 229                                                                 
   T21 230-231                                                             
   T22A 232-233                                                            
   T22B 234-235                                                            
   T22C 236-237                                                            
   T22D 238-239                                                            
   T22EMR1 240-241                                                         
   T22EMR2 242-243                                                         
   T22EMR3 244-245                                                         
   T22EMR4 246-247                                                         
   T22FMR1 248-249                                                         
   T22FMR2 250-251                                                         
   T22FMR3 252-253                                                         
   T23AMR1 254-255                                                         
   T23AMR2 256-257                                                         
   T23AMR3 258-259                                                         
   T23AMR4 260-261                                                         
   T23AMR5 262-263                                                         
   T23AMR6 264-265                                                         
   T23BMR1 266-267                                                         
   T23BMR2 268-269                                                         
   T23BMR3 270-271                                                         
   T23BMR4 272-273                                                         
   T23BMR5 274-275                                                         
   T23BMR6 276-277                                                         
   T23BMR7 278-279                                                         
   T23C 280-281                                                            
   T23D 282-283                                                            
   T23E 284-285                                                            
   T24 286                                                                 
   T25 287-288                                                             
   T26A 289-290                                                            
   T26B 291-292                                                            
   T26C 293-294                                                            
   T26D 295-296                                                            
   T26EMR1 297-298                                                         
   T26EMR2 299-300                                                         
   T26EMR3 301-302                                                         
   T26EMR4 303-304                                                         
   T26EMR5 305-306                                                         
   T26FMR1 307-308                                                         
   T26FMR2 309-310                                                         
   T26FMR3 311-312                                                         
   T27AMR1 313-314                                                         
   T27AMR2 315-316                                                         
   T27AMR3 317-318                                                         
   T27AMR4 319-320                                                         
   T27AMR5 321-322                                                         
   T27BMR1 323-324                                                         
   T27BMR2 325-326                                                         
   T27BMR3 327-328                                                         
   T27BMR4 329-330                                                         
   T27BMR5 331-332                                                         
   T27BMR6 333-334                                                         
   T27BMR7 335-336                                                         
   T27C 337-338                                                            
   T27D 339-340                                                            
   T27E 341-342                                                            
   CARD_31 343-344                                                         
   T28 345                                                                 
   T29 346-347                                                             
   T30A 348-349                                                            
   T30B 350-351                                                            
   T30C 352-353                                                            
   T30DMR1 354-355                                                         
   T30DMR2 356-357                                                         
   T30DMR3 358-359                                                         
   T30DMR4 360-361                                                         
   T30EMR1 362-363                                                         
   T30EMR2 364-365                                                         
   T30EMR3 366-367                                                         
   T31AMR1 368-369                                                         
   T31AMR2 370-371                                                         
   T31AMR3 372-373                                                         
   T31AMR4 374-375                                                         
   T31AMR5 376-377                                                         
   T31AMR6 378-379                                                         
   T31BMR1 380-381                                                         
   T31BMR2 382-383                                                         
   T31BMR3 384-385                                                         
   T31BMR4 386-387                                                         
   T31BMR5 388-389                                                         
   T31BMR6 390-391                                                         
   T31BMR7 392-393                                                         
   T31C 394-395                                                            
   T31D 396-397                                                            
   T31E 398-399                                                            
   T32 400                                                                 
   T33 401                                                                 
   T34 402-403                                                             
   T35A 404                                                                
   T35B 405                                                                
   T35C 406                                                                
   T36 407                                                                 
   T37 408-409                                                             
   T38A 410-411                                                            
   T38B 412-413                                                            
   T38C 414-415                                                            
   T38D 416-417                                                            
   T38E 418-419                                                            
   T39 420                                                                 
   T40 421-422                                                             
   T41A 423-424                                                            
   T41B 425-426                                                            
   T41C 427-428                                                            
   T42 429                                                                 
   T43 430-431                                                             
   T44A 432-433                                                            
   T44B 434-435                                                            
   T44C 436-437                                                            
   T45MR1 438                                                              
   T45MR2 439-440                                                          
   T45MR3 441-442                                                          
   T45MR4 443-444                                                          
   T45MR5 445-446                                                          
   T45MR6 447-448                                                          
   T46 449                                                                 
   T47A 450                                                                
   T47B 451                                                                
   T47C 452                                                                
   T47D 453                                                                
   T48 454                                                                 
   CARD_32 455-456                                                         
   T49MR1 457-458                                                          
   T49MR2 459-460                                                          
   T49MR3 461-462                                                          
   T49MR4 463-464                                                          
   T49MR5 465-466                                                          
   T49MR6 467-468                                                          
   T49MR7 469-470                                                          
   T49MR8 471-472                                                          
   T49MR9 473-474                                                          
   T50MR1 475-476                                                          
   T50MR2 477-478                                                          
   T50MR3 479-480                                                          
   T50MR4 481-482                                                          
   T50MR5 483-484                                                          
   T50MR6 485-486                                                          
   T50MR7 487-488                                                          
   T50MR8 489-490                                                          
   T50MR9 491-492                                                          
   T51MR1 493-494                                                          
   T51MR2 495-496                                                          
   T51MR3 497-498                                                          
   T51MR4 499-500                                                          
   T51MR5 501-502                                                          
   T51MR6 503-504                                                          
   T51MR7 505-506                                                          
   T51MR8 507-508                                                          
   T51MR9 509-510                                                          
   T52 511                                                                 
   T53 512-513                                                             
   CARD_33 514-515                                                         
   T54 516                                                                 
   T55 517-518                                                             
   T56MR1 519-520                                                          
   T56MR2 521-522                                                          
   T56MR3 523-524                                                          
   T56MR4 525-526                                                          
   T56MR5 527-528                                                          
   T56MR6 529-530                                                          
   T56MR7 531-532                                                          
   T56MR8 533-534                                                          
   T56MR9 535-536                                                          
   T56MR10 537-538                                                         
   T56MR11 539-540                                                         
   T57MR1 541-542                                                          
   T57MR2 543-544                                                          
   T57MR3 545-546                                                          
   T57MR4 547-548                                                          
   T57MR5 549-550                                                          
   T57MR6 551-552                                                          
   T57MR7 553-554                                                          
   T57MR8 555-556                                                          
   T57MR9 557-558                                                          
   T57MR10 559-560                                                         
   T57MR11 561-562                                                         
   T57MR12 563-564                                                         
   T57MR13 565-566                                                         
   T57MR14 567-568                                                         
   CARD_34 569-570                                                         
   T58MR1 571-572                                                          
   T58MR2 573-574                                                          
   T58MR3 575-576                                                          
   T58MR4 577-578                                                          
   T58MR5 579-580                                                          
   T58MR6 581-582                                                          
   T58MR7 583-584                                                          
   T58MR8 585-586                                                          
   T58MR9 587-588                                                          
   T58MR10 589-590                                                         
   T58MR11 591-592                                                         
   T58MR12 593-594                                                         
   T58MR13 595-596                                                         
   T58MR14 597-598                                                         
   T59MR1 599-600                                                          
   T59MR2 601-602                                                          
   T59MR3 603-604                                                          
   T59MR4 605-606                                                          
   T59MR5 607-608                                                          
   T59MR6 609-610                                                          
   T59MR7 611-612                                                          
   T59MR8 613-614                                                          
   T59MR9 615-616                                                          
   T59MR10 617-618                                                         
   T59MR11 619-620                                                         
   T59MR12 621-622                                                         
   T59MR13 623-624                                                         
   T59MR14 625-626                                                         
   T60MR1 627-628                                                          
   T60MR2 629-630                                                          
   T60MR3 631-632                                                          
   T60MR4 633-634                                                          
   CARD_35 635-636                                                         
   T61 637                                                                 
   T62MR1 638-639                                                          
   T62MR2 640-641                                                          
   T62MR3 642-643                                                          
   T62MR4 644-645                                                          
   T62MR5 646-647                                                          
   T62MR6 648-649                                                          
   T62MR7 650-651                                                          
   T62MR8 652-653                                                          
   T62MR9 654-655                                                          
   T62MR10 656-657                                                         
   T63 658-659                                                             
   T64MR1 660                                                              
   T64MR2 661-662                                                          
   T64MR3 663-664                                                          
   T65 665                                                                 
   T66A 666                                                                
   T66B 667                                                                
   T66C 668                                                                
   T66D 669                                                                
   T66E 670                                                                
   T66F 671                                                                
   T66G 672                                                                
   T66H 673                                                                
   T66I 674                                                                
   T66J 675                                                                
   T66K 676                                                                
   T661 677                                                                
   T67A 678                                                                
   T67B 679                                                                
   T67C 680                                                                
   T67D 681                                                                
   T67E 682                                                                
   T67F 683                                                                
   T68 684                                                                 
   T69 685                                                                 
   T70 686-689                                                             
   T71 690                                                                 
   T72 691-694                                                             
   T73 695                                                                 
   T74 696-697;                                                            
                                                                           
                                                                           
* SAS LABEL STATEMENT FOR 6834;                                            
                                                                           
LABEL                                                                      
   ROW_LAB = "ROW_LAB"                                                     
   TB_CASE = "TB_CASE"                                                     
   AR_CODE = "AR_CODE"                                                     
   T_SN = "T_SN"                                                           
   T_SCRN = "T_SCRN"                                                       
   BOOSTER = "BOOSTER"                                                     
   CARD_28 = "CARD_28"                                                     
   T1 = "T1"                                                               
   T2 = "T2"                                                               
   T3 = "T3"                                                               
   T4 = "T4"                                                               
   T5A = "T5A"                                                             
   T5B = "T5B"                                                             
   T5C = "T5C"                                                             
   T5D = "T5D"                                                             
   T5E = "T5E"                                                             
   T6 = "T6"                                                               
   T7A = "T7A"                                                             
   T7B = "T7B"                                                             
   T7C = "T7C"                                                             
   T7D = "T7D"                                                             
   T8 = "T8"                                                               
   T9 = "T9"                                                               
   T10AMR1 = "T10AMR1"                                                     
   T10AMR2 = "T10AMR2"                                                     
   T10AMR3 = "T10AMR3"                                                     
   T10AMR4 = "T10AMR4"                                                     
   T10AMR5 = "T10AMR5"                                                     
   T10B = "T10B"                                                           
   T11AMR1 = "T11AMR1"                                                     
   T11AMR2 = "T11AMR2"                                                     
   T11AMR3 = "T11AMR3"                                                     
   T11AMR4 = "T11AMR4"                                                     
   T11AMR5 = "T11AMR5"                                                     
   T11AMR6 = "T11AMR6"                                                     
   T11BMR1 = "T11BMR1"                                                     
   T11BMR2 = "T11BMR2"                                                     
   T11BMR3 = "T11BMR3"                                                     
   T11BMR4 = "T11BMR4"                                                     
   T11BMR5 = "T11BMR5"                                                     
   T11BMR6 = "T11BMR6"                                                     
   T11BMR7 = "T11BMR7"                                                     
   T11C = "T11C"                                                           
   T11D = "T11D"                                                           
   T12 = "T12"                                                             
   T13 = "T13"                                                             
   T14A = "T14A"                                                           
   T14BMR1 = "T14BMR1"                                                     
   T14BMR2 = "T14BMR2"                                                     
   T14BMR3 = "T14BMR3"                                                     
   T14BMR4 = "T14BMR4"                                                     
   T14BMR5 = "T14BMR5"                                                     
   T14C = "T14C"                                                           
   T14D = "T14D"                                                           
   T14E = "T14E"                                                           
   T14F = "T14F"                                                           
   T14G = "T14G"                                                           
   T14H = "T14H"                                                           
   CARD_29 = "CARD_29"                                                     
   T14IMR1 = "T14IMR1"                                                     
   T14IMR2 = "T14IMR2"                                                     
   T14IMR3 = "T14IMR3"                                                     
   T14IMR4 = "T14IMR4"                                                     
   T14IMR5 = "T14IMR5"                                                     
   T14IMR6 = "T14IMR6"                                                     
   T14IMR7 = "T14IMR7"                                                     
   T14IMR8 = "T14IMR8"                                                     
   T14JMR1 = "T14JMR1"                                                     
   T14JMR2 = "T14JMR2"                                                     
   T14JMR3 = "T14JMR3"                                                     
   T15AMR1 = "T15AMR1"                                                     
   T15AMR2 = "T15AMR2"                                                     
   T15AMR3 = "T15AMR3"                                                     
   T15AMR4 = "T15AMR4"                                                     
   T15AMR5 = "T15AMR5"                                                     
   T15AMR6 = "T15AMR6"                                                     
   T15BMR1 = "T15BMR1"                                                     
   T15BMR2 = "T15BMR2"                                                     
   T15BMR3 = "T15BMR3"                                                     
   T15BMR4 = "T15BMR4"                                                     
   T15BMR5 = "T15BMR5"                                                     
   T15BMR6 = "T15BMR6"                                                     
   T15BMR7 = "T15BMR7"                                                     
   T15C = "T15C"                                                           
   T15D = "T15D"                                                           
   T15E = "T15E"                                                           
   T16 = "T16"                                                             
   T17 = "T17"                                                             
   T18A = "T18A"                                                           
   T18B = "T18B"                                                           
   T18C = "T18C"                                                           
   T18D = "T18D"                                                           
   T18EMR1 = "T18EMR1"                                                     
   T18EMR2 = "T18EMR2"                                                     
   T18EMR3 = "T18EMR3"                                                     
   T18EMR4 = "T18EMR4"                                                     
   T18EMR5 = "T18EMR5"                                                     
   T18EMR6 = "T18EMR6"                                                     
   T18EMR7 = "T18EMR7"                                                     
   T18EMR8 = "T18EMR8"                                                     
   T18FMR1 = "T18FMR1"                                                     
   T18FMR2 = "T18FMR2"                                                     
   T18FMR3 = "T18FMR3"                                                     
   T19AMR1 = "T19AMR1"                                                     
   T19AMR2 = "T19AMR2"                                                     
   T19AMR3 = "T19AMR3"                                                     
   T19AMR4 = "T19AMR4"                                                     
   T19AMR5 = "T19AMR5"                                                     
   T19AMR6 = "T19AMR6"                                                     
   T19BMR1 = "T19BMR1"                                                     
   T19BMR2 = "T19BMR2"                                                     
   T19BMR3 = "T19BMR3"                                                     
   T19BMR4 = "T19BMR4"                                                     
   T19BMR5 = "T19BMR5"                                                     
   T19BMR6 = "T19BMR6"                                                     
   T19C = "T19C"                                                           
   T19D = "T19D"                                                           
   T19E = "T19E"                                                           
   CARD_30 = "CARD_30"                                                     
   T20 = "T20"                                                             
   T21 = "T21"                                                             
   T22A = "T22A"                                                           
   T22B = "T22B"                                                           
   T22C = "T22C"                                                           
   T22D = "T22D"                                                           
   T22EMR1 = "T22EMR1"                                                     
   T22EMR2 = "T22EMR2"                                                     
   T22EMR3 = "T22EMR3"                                                     
   T22EMR4 = "T22EMR4"                                                     
   T22FMR1 = "T22FMR1"                                                     
   T22FMR2 = "T22FMR2"                                                     
   T22FMR3 = "T22FMR3"                                                     
   T23AMR1 = "T23AMR1"                                                     
   T23AMR2 = "T23AMR2"                                                     
   T23AMR3 = "T23AMR3"                                                     
   T23AMR4 = "T23AMR4"                                                     
   T23AMR5 = "T23AMR5"                                                     
   T23AMR6 = "T23AMR6"                                                     
   T23BMR1 = "T23BMR1"                                                     
   T23BMR2 = "T23BMR2"                                                     
   T23BMR3 = "T23BMR3"                                                     
   T23BMR4 = "T23BMR4"                                                     
   T23BMR5 = "T23BMR5"                                                     
   T23BMR6 = "T23BMR6"                                                     
   T23BMR7 = "T23BMR7"                                                     
   T23C = "T23C"                                                           
   T23D = "T23D"                                                           
   T23E = "T23E"                                                           
   T24 = "T24"                                                             
   T25 = "T25"                                                             
   T26A = "T26A"                                                           
   T26B = "T26B"                                                           
   T26C = "T26C"                                                           
   T26D = "T26D"                                                           
   T26EMR1 = "T26EMR1"                                                     
   T26EMR2 = "T26EMR2"                                                     
   T26EMR3 = "T26EMR3"                                                     
   T26EMR4 = "T26EMR4"                                                     
   T26EMR5 = "T26EMR5"                                                     
   T26FMR1 = "T26FMR1"                                                     
   T26FMR2 = "T26FMR2"                                                     
   T26FMR3 = "T26FMR3"                                                     
   T27AMR1 = "T27AMR1"                                                     
   T27AMR2 = "T27AMR2"                                                     
   T27AMR3 = "T27AMR3"                                                     
   T27AMR4 = "T27AMR4"                                                     
   T27AMR5 = "T27AMR5"                                                     
   T27BMR1 = "T27BMR1"                                                     
   T27BMR2 = "T27BMR2"                                                     
   T27BMR3 = "T27BMR3"                                                     
   T27BMR4 = "T27BMR4"                                                     
   T27BMR5 = "T27BMR5"                                                     
   T27BMR6 = "T27BMR6"                                                     
   T27BMR7 = "T27BMR7"                                                     
   T27C = "T27C"                                                           
   T27D = "T27D"                                                           
   T27E = "T27E"                                                           
   CARD_31 = "CARD_31"                                                     
   T28 = "T28"                                                             
   T29 = "T29"                                                             
   T30A = "T30A"                                                           
   T30B = "T30B"                                                           
   T30C = "T30C"                                                           
   T30DMR1 = "T30DMR1"                                                     
   T30DMR2 = "T30DMR2"                                                     
   T30DMR3 = "T30DMR3"                                                     
   T30DMR4 = "T30DMR4"                                                     
   T30EMR1 = "T30EMR1"                                                     
   T30EMR2 = "T30EMR2"                                                     
   T30EMR3 = "T30EMR3"                                                     
   T31AMR1 = "T31AMR1"                                                     
   T31AMR2 = "T31AMR2"                                                     
   T31AMR3 = "T31AMR3"                                                     
   T31AMR4 = "T31AMR4"                                                     
   T31AMR5 = "T31AMR5"                                                     
   T31AMR6 = "T31AMR6"                                                     
   T31BMR1 = "T31BMR1"                                                     
   T31BMR2 = "T31BMR2"                                                     
   T31BMR3 = "T31BMR3"                                                     
   T31BMR4 = "T31BMR4"                                                     
   T31BMR5 = "T31BMR5"                                                     
   T31BMR6 = "T31BMR6"                                                     
   T31BMR7 = "T31BMR7"                                                     
   T31C = "T31C"                                                           
   T31D = "T31D"                                                           
   T31E = "T31E"                                                           
   T32 = "T32"                                                             
   T33 = "T33"                                                             
   T34 = "T34"                                                             
   T35A = "T35A"                                                           
   T35B = "T35B"                                                           
   T35C = "T35C"                                                           
   T36 = "T36"                                                             
   T37 = "T37"                                                             
   T38A = "T38A"                                                           
   T38B = "T38B"                                                           
   T38C = "T38C"                                                           
   T38D = "T38D"                                                           
   T38E = "T38E"                                                           
   T39 = "T39"                                                             
   T40 = "T40"                                                             
   T41A = "T41A"                                                           
   T41B = "T41B"                                                           
   T41C = "T41C"                                                           
   T42 = "T42"                                                             
   T43 = "T43"                                                             
   T44A = "T44A"                                                           
   T44B = "T44B"                                                           
   T44C = "T44C"                                                           
   T45MR1 = "T45MR1"                                                       
   T45MR2 = "T45MR2"                                                       
   T45MR3 = "T45MR3"                                                       
   T45MR4 = "T45MR4"                                                       
   T45MR5 = "T45MR5"                                                       
   T45MR6 = "T45MR6"                                                       
   T46 = "T46"                                                             
   T47A = "T47A"                                                           
   T47B = "T47B"                                                           
   T47C = "T47C"                                                           
   T47D = "T47D"                                                           
   T48 = "T48"                                                             
   CARD_32 = "CARD_32"                                                     
   T49MR1 = "T49MR1"                                                       
   T49MR2 = "T49MR2"                                                       
   T49MR3 = "T49MR3"                                                       
   T49MR4 = "T49MR4"                                                       
   T49MR5 = "T49MR5"                                                       
   T49MR6 = "T49MR6"                                                       
   T49MR7 = "T49MR7"                                                       
   T49MR8 = "T49MR8"                                                       
   T49MR9 = "T49MR9"                                                       
   T50MR1 = "T50MR1"                                                       
   T50MR2 = "T50MR2"                                                       
   T50MR3 = "T50MR3"                                                       
   T50MR4 = "T50MR4"                                                       
   T50MR5 = "T50MR5"                                                       
   T50MR6 = "T50MR6"                                                       
   T50MR7 = "T50MR7"                                                       
   T50MR8 = "T50MR8"                                                       
   T50MR9 = "T50MR9"                                                       
   T51MR1 = "T51MR1"                                                       
   T51MR2 = "T51MR2"                                                       
   T51MR3 = "T51MR3"                                                       
   T51MR4 = "T51MR4"                                                       
   T51MR5 = "T51MR5"                                                       
   T51MR6 = "T51MR6"                                                       
   T51MR7 = "T51MR7"                                                       
   T51MR8 = "T51MR8"                                                       
   T51MR9 = "T51MR9"                                                       
   T52 = "T52"                                                             
   T53 = "T53"                                                             
   CARD_33 = "CARD_33"                                                     
   T54 = "T54"                                                             
   T55 = "T55"                                                             
   T56MR1 = "T56MR1"                                                       
   T56MR2 = "T56MR2"                                                       
   T56MR3 = "T56MR3"                                                       
   T56MR4 = "T56MR4"                                                       
   T56MR5 = "T56MR5"                                                       
   T56MR6 = "T56MR6"                                                       
   T56MR7 = "T56MR7"                                                       
   T56MR8 = "T56MR8"                                                       
   T56MR9 = "T56MR9"                                                       
   T56MR10 = "T56MR10"                                                     
   T56MR11 = "T56MR11"                                                     
   T57MR1 = "T57MR1"                                                       
   T57MR2 = "T57MR2"                                                       
   T57MR3 = "T57MR3"                                                       
   T57MR4 = "T57MR4"                                                       
   T57MR5 = "T57MR5"                                                       
   T57MR6 = "T57MR6"                                                       
   T57MR7 = "T57MR7"                                                       
   T57MR8 = "T57MR8"                                                       
   T57MR9 = "T57MR9"                                                       
   T57MR10 = "T57MR10"                                                     
   T57MR11 = "T57MR11"                                                     
   T57MR12 = "T57MR12"                                                     
   T57MR13 = "T57MR13"                                                     
   T57MR14 = "T57MR14"                                                     
   CARD_34 = "CARD_34"                                                     
   T58MR1 = "T58MR1"                                                       
   T58MR2 = "T58MR2"                                                       
   T58MR3 = "T58MR3"                                                       
   T58MR4 = "T58MR4"                                                       
   T58MR5 = "T58MR5"                                                       
   T58MR6 = "T58MR6"                                                       
   T58MR7 = "T58MR7"                                                       
   T58MR8 = "T58MR8"                                                       
   T58MR9 = "T58MR9"                                                       
   T58MR10 = "T58MR10"                                                     
   T58MR11 = "T58MR11"                                                     
   T58MR12 = "T58MR12"                                                     
   T58MR13 = "T58MR13"                                                     
   T58MR14 = "T58MR14"                                                     
   T59MR1 = "T59MR1"                                                       
   T59MR2 = "T59MR2"                                                       
   T59MR3 = "T59MR3"                                                       
   T59MR4 = "T59MR4"                                                       
   T59MR5 = "T59MR5"                                                       
   T59MR6 = "T59MR6"                                                       
   T59MR7 = "T59MR7"                                                       
   T59MR8 = "T59MR8"                                                       
   T59MR9 = "T59MR9"                                                       
   T59MR10 = "T59MR10"                                                     
   T59MR11 = "T59MR11"                                                     
   T59MR12 = "T59MR12"                                                     
   T59MR13 = "T59MR13"                                                     
   T59MR14 = "T59MR14"                                                     
   T60MR1 = "T60MR1"                                                       
   T60MR2 = "T60MR2"                                                       
   T60MR3 = "T60MR3"                                                       
   T60MR4 = "T60MR4"                                                       
   CARD_35 = "CARD_35"                                                     
   T61 = "T61"                                                             
   T62MR1 = "T62MR1"                                                       
   T62MR2 = "T62MR2"                                                       
   T62MR3 = "T62MR3"                                                       
   T62MR4 = "T62MR4"                                                       
   T62MR5 = "T62MR5"                                                       
   T62MR6 = "T62MR6"                                                       
   T62MR7 = "T62MR7"                                                       
   T62MR8 = "T62MR8"                                                       
   T62MR9 = "T62MR9"                                                       
   T62MR10 = "T62MR10"                                                     
   T63 = "T63"                                                             
   T64MR1 = "T64MR1"                                                       
   T64MR2 = "T64MR2"                                                       
   T64MR3 = "T64MR3"                                                       
   T65 = "T65"                                                             
   T66A = "T66A"                                                           
   T66B = "T66B"                                                           
   T66C = "T66C"                                                           
   T66D = "T66D"                                                           
   T66E = "T66E"                                                           
   T66F = "T66F"                                                           
   T66G = "T66G"                                                           
   T66H = "T66H"                                                           
   T66I = "T66I"                                                           
   T66J = "T66J"                                                           
   T66K = "T66K"                                                           
   T661 = "T661"                                                           
   T67A = "T67A"                                                           
   T67B = "T67B"                                                           
   T67C = "T67C"                                                           
   T67D = "T67D"                                                           
   T67E = "T67E"                                                           
   T67F = "T67F"                                                           
   T68 = "T68"                                                             
   T69 = "T69"                                                             
   T70 = "T70"                                                             
   T71 = "T71"                                                             
   T72 = "T72"                                                             
   T73 = "T73"                                                             
   T74 = "T74";                                                            
                                                                           
                                                                           
                                                                           
* USER-DEFINED MISSING VALUE RECODE TO SAS SYSMIS FOR 6834;                
                                                                           
   IF TB_CASE IN(-7, -8, -9) THEN TB_CASE=.;                               
   IF AR_CODE IN(-7, -8, -9) THEN AR_CODE=.;                               
   IF T_SN IN(-7, -8, -9) THEN T_SN=.;                                     
   IF T_SCRN IN(-7, -8, -9) THEN T_SCRN=.;                                 
   IF BOOSTER IN(-7, -8, -9) THEN BOOSTER=.;                               
   IF CARD_28 IN(-7, -8, -9) THEN CARD_28=.;                               
   IF T1 IN(-7, -8, -9) THEN T1=.;                                         
   IF T2 IN(-7, -8, -9) THEN T2=.;                                         
   IF T3 IN(-7, -8, -9) THEN T3=.;                                         
   IF T4 IN(-7, -8, -9) THEN T4=.;                                         
   IF T5A IN(-7, -8, -9) THEN T5A=.;                                       
   IF T5B IN(-7, -8, -9) THEN T5B=.;                                       
   IF T5C IN(-7, -8, -9) THEN T5C=.;                                       
   IF T5D IN(-7, -8, -9) THEN T5D=.;                                       
   IF T5E IN(-7, -8, -9) THEN T5E=.;                                       
   IF T6 IN(-7, -8, -9) THEN T6=.;                                         
   IF T7A IN(-7, -8, -9) THEN T7A=.;                                       
   IF T7B IN(-7, -8, -9) THEN T7B=.;                                       
   IF T7C IN(-7, -8, -9) THEN T7C=.;                                       
   IF T7D IN(-7, -8, -9) THEN T7D=.;                                       
   IF T8 IN(-7, -8, -9) THEN T8=.;                                         
   IF T9 IN(-7, -8, -9) THEN T9=.;                                         
   IF T10AMR1 IN(-7, -8, -9) THEN T10AMR1=.;                               
   IF T10AMR2 IN(-7, -8, -9) THEN T10AMR2=.;                               
   IF T10AMR3 IN(-7, -8, -9) THEN T10AMR3=.;                               
   IF T10AMR4 IN(-7, -8, -9) THEN T10AMR4=.;                               
   IF T10AMR5 IN(-7, -8, -9) THEN T10AMR5=.;                               
   IF T10B IN(-7, -8, -9) THEN T10B=.;                                     
   IF T11AMR1 IN(-7, -8, -9) THEN T11AMR1=.;                               
   IF T11AMR2 IN(-7, -8, -9) THEN T11AMR2=.;                               
   IF T11AMR3 IN(-7, -8, -9) THEN T11AMR3=.;                               
   IF T11AMR4 IN(-7, -8, -9) THEN T11AMR4=.;                               
   IF T11AMR5 IN(-7, -8, -9) THEN T11AMR5=.;                               
   IF T11AMR6 IN(-7, -8, -9) THEN T11AMR6=.;                               
   IF T11BMR1 IN(-7, -8, -9) THEN T11BMR1=.;                               
   IF T11BMR2 IN(-7, -8, -9) THEN T11BMR2=.;                               
   IF T11BMR3 IN(-7, -8, -9) THEN T11BMR3=.;                               
   IF T11BMR4 IN(-7, -8, -9) THEN T11BMR4=.;                               
   IF T11BMR5 IN(-7, -8, -9) THEN T11BMR5=.;                               
   IF T11BMR6 IN(-7, -8, -9) THEN T11BMR6=.;                               
   IF T11BMR7 IN(-7, -8, -9) THEN T11BMR7=.;                               
   IF T11C IN(-7, -8, -9) THEN T11C=.;                                     
   IF T11D IN(-7, -8, -9) THEN T11D=.;                                     
   IF T12 IN(-7, -8, -9) THEN T12=.;                                       
   IF T13 IN(-7, -8, -9) THEN T13=.;                                       
   IF T14A IN(-7, -8, -9) THEN T14A=.;                                     
   IF T14BMR1 IN(-7, -8, -9) THEN T14BMR1=.;                               
   IF T14BMR2 IN(-7, -8, -9) THEN T14BMR2=.;                               
   IF T14BMR3 IN(-7, -8, -9) THEN T14BMR3=.;                               
   IF T14BMR4 IN(-7, -8, -9) THEN T14BMR4=.;                               
   IF T14BMR5 IN(-7, -8, -9) THEN T14BMR5=.;                               
   IF T14C IN(-7, -8, -9) THEN T14C=.;                                     
   IF T14D IN(-7, -8, -9) THEN T14D=.;                                     
   IF T14E IN(-7, -8, -9) THEN T14E=.;                                     
   IF T14F IN(-7, -8, -9) THEN T14F=.;                                     
   IF T14G IN(-7, -8, -9) THEN T14G=.;                                     
   IF T14H IN(-7, -8, -9) THEN T14H=.;                                     
   IF CARD_29 IN(-7, -8, -9) THEN CARD_29=.;                               
   IF T14IMR1 IN(-7, -8, -9) THEN T14IMR1=.;                               
   IF T14IMR2 IN(-7, -8, -9) THEN T14IMR2=.;                               
   IF T14IMR3 IN(-7, -8, -9) THEN T14IMR3=.;                               
   IF T14IMR4 IN(-7, -8, -9) THEN T14IMR4=.;                               
   IF T14IMR5 IN(-7, -8, -9) THEN T14IMR5=.;                               
   IF T14IMR6 IN(-7, -8, -9) THEN T14IMR6=.;                               
   IF T14IMR7 IN(-7, -8, -9) THEN T14IMR7=.;                               
   IF T14IMR8 IN(-7, -8, -9) THEN T14IMR8=.;                               
   IF T14JMR1 IN(-7, -8, -9) THEN T14JMR1=.;                               
   IF T14JMR2 IN(-7, -8, -9) THEN T14JMR2=.;                               
   IF T14JMR3 IN(-7, -8, -9) THEN T14JMR3=.;                               
   IF T15AMR1 IN(-7, -8, -9) THEN T15AMR1=.;                               
   IF T15AMR2 IN(-7, -8, -9) THEN T15AMR2=.;                               
   IF T15AMR3 IN(-7, -8, -9) THEN T15AMR3=.;                               
   IF T15AMR4 IN(-7, -8, -9) THEN T15AMR4=.;                               
   IF T15AMR5 IN(-7, -8, -9) THEN T15AMR5=.;                               
   IF T15AMR6 IN(-7, -8, -9) THEN T15AMR6=.;                               
   IF T15BMR1 IN(-7, -8, -9) THEN T15BMR1=.;                               
   IF T15BMR2 IN(-7, -8, -9) THEN T15BMR2=.;                               
   IF T15BMR3 IN(-7, -8, -9) THEN T15BMR3=.;                               
   IF T15BMR4 IN(-7, -8, -9) THEN T15BMR4=.;                               
   IF T15BMR5 IN(-7, -8, -9) THEN T15BMR5=.;                               
   IF T15BMR6 IN(-7, -8, -9) THEN T15BMR6=.;                               
   IF T15BMR7 IN(-7, -8, -9) THEN T15BMR7=.;                               
   IF T15C IN(-7, -8, -9) THEN T15C=.;                                     
   IF T15D IN(-7, -8, -9) THEN T15D=.;                                     
   IF T15E IN(-7, -8, -9) THEN T15E=.;                                     
   IF T16 IN(-7, -8, -9) THEN T16=.;                                       
   IF T17 IN(-7, -8, -9) THEN T17=.;                                       
   IF T18A IN(-7, -8, -9) THEN T18A=.;                                     
   IF T18B IN(-7, -8, -9) THEN T18B=.;                                     
   IF T18C IN(-7, -8, -9) THEN T18C=.;                                     
   IF T18D IN(-7, -8, -9) THEN T18D=.;                                     
   IF T18EMR1 IN(-7, -8, -9) THEN T18EMR1=.;                               
   IF T18EMR2 IN(-7, -8, -9) THEN T18EMR2=.;                               
   IF T18EMR3 IN(-7, -8, -9) THEN T18EMR3=.;                               
   IF T18EMR4 IN(-7, -8, -9) THEN T18EMR4=.;                               
   IF T18EMR5 IN(-7, -8, -9) THEN T18EMR5=.;                               
   IF T18EMR6 IN(-7, -8, -9) THEN T18EMR6=.;                               
   IF T18EMR7 IN(-7, -8, -9) THEN T18EMR7=.;                               
   IF T18EMR8 IN(-7, -8, -9) THEN T18EMR8=.;                               
   IF T18FMR1 IN(-7, -8, -9) THEN T18FMR1=.;                               
   IF T18FMR2 IN(-7, -8, -9) THEN T18FMR2=.;                               
   IF T18FMR3 IN(-7, -8, -9) THEN T18FMR3=.;                               
   IF T19AMR1 IN(-7, -8, -9) THEN T19AMR1=.;                               
   IF T19AMR2 IN(-7, -8, -9) THEN T19AMR2=.;                               
   IF T19AMR3 IN(-7, -8, -9) THEN T19AMR3=.;                               
   IF T19AMR4 IN(-7, -8, -9) THEN T19AMR4=.;                               
   IF T19AMR5 IN(-7, -8, -9) THEN T19AMR5=.;                               
   IF T19AMR6 IN(-7, -8, -9) THEN T19AMR6=.;                               
   IF T19BMR1 IN(-7, -8, -9) THEN T19BMR1=.;                               
   IF T19BMR2 IN(-7, -8, -9) THEN T19BMR2=.;                               
   IF T19BMR3 IN(-7, -8, -9) THEN T19BMR3=.;                               
   IF T19BMR4 IN(-7, -8, -9) THEN T19BMR4=.;                               
   IF T19BMR5 IN(-7, -8, -9) THEN T19BMR5=.;                               
   IF T19BMR6 IN(-7, -8, -9) THEN T19BMR6=.;                               
   IF T19C IN(-7, -8, -9) THEN T19C=.;                                     
   IF T19D IN(-7, -8, -9) THEN T19D=.;                                     
   IF T19E IN(-7, -8, -9) THEN T19E=.;                                     
   IF CARD_30 IN(-7, -8, -9) THEN CARD_30=.;                               
   IF T20 IN(-7, -8, -9) THEN T20=.;                                       
   IF T21 IN(-7, -8, -9) THEN T21=.;                                       
   IF T22A IN(-7, -8, -9) THEN T22A=.;                                     
   IF T22B IN(-7, -8, -9) THEN T22B=.;                                     
   IF T22C IN(-7, -8, -9) THEN T22C=.;                                     
   IF T22D IN(-7, -8, -9) THEN T22D=.;                                     
   IF T22EMR1 IN(-7, -8, -9) THEN T22EMR1=.;                               
   IF T22EMR2 IN(-7, -8, -9) THEN T22EMR2=.;                               
   IF T22EMR3 IN(-7, -8, -9) THEN T22EMR3=.;                               
   IF T22EMR4 IN(-7, -8, -9) THEN T22EMR4=.;                               
   IF T22FMR1 IN(-7, -8, -9) THEN T22FMR1=.;                               
   IF T22FMR2 IN(-7, -8, -9) THEN T22FMR2=.;                               
   IF T22FMR3 IN(-7, -8, -9) THEN T22FMR3=.;                               
   IF T23AMR1 IN(-7, -8, -9) THEN T23AMR1=.;                               
   IF T23AMR2 IN(-7, -8, -9) THEN T23AMR2=.;                               
   IF T23AMR3 IN(-7, -8, -9) THEN T23AMR3=.;                               
   IF T23AMR4 IN(-7, -8, -9) THEN T23AMR4=.;                               
   IF T23AMR5 IN(-7, -8, -9) THEN T23AMR5=.;                               
   IF T23AMR6 IN(-7, -8, -9) THEN T23AMR6=.;                               
   IF T23BMR1 IN(-7, -8, -9) THEN T23BMR1=.;                               
   IF T23BMR2 IN(-7, -8, -9) THEN T23BMR2=.;                               
   IF T23BMR3 IN(-7, -8, -9) THEN T23BMR3=.;                               
   IF T23BMR4 IN(-7, -8, -9) THEN T23BMR4=.;                               
   IF T23BMR5 IN(-7, -8, -9) THEN T23BMR5=.;                               
   IF T23BMR6 IN(-7, -8, -9) THEN T23BMR6=.;                               
   IF T23BMR7 IN(-7, -8, -9) THEN T23BMR7=.;                               
   IF T23C IN(-7, -8, -9) THEN T23C=.;                                     
   IF T23D IN(-7, -8, -9) THEN T23D=.;                                     
   IF T23E IN(-7, -8, -9) THEN T23E=.;                                     
   IF T24 IN(-7, -8, -9) THEN T24=.;                                       
   IF T25 IN(-7, -8, -9) THEN T25=.;                                       
   IF T26A IN(-7, -8, -9) THEN T26A=.;                                     
   IF T26B IN(-7, -8, -9) THEN T26B=.;                                     
   IF T26C IN(-7, -8, -9) THEN T26C=.;                                     
   IF T26D IN(-7, -8, -9) THEN T26D=.;                                     
   IF T26EMR1 IN(-7, -8, -9) THEN T26EMR1=.;                               
   IF T26EMR2 IN(-7, -8, -9) THEN T26EMR2=.;                               
   IF T26EMR3 IN(-7, -8, -9) THEN T26EMR3=.;                               
   IF T26EMR4 IN(-7, -8, -9) THEN T26EMR4=.;                               
   IF T26EMR5 IN(-7, -8, -9) THEN T26EMR5=.;                               
   IF T26FMR1 IN(-7, -8, -9) THEN T26FMR1=.;                               
   IF T26FMR2 IN(-7, -8, -9) THEN T26FMR2=.;                               
   IF T26FMR3 IN(-7, -8, -9) THEN T26FMR3=.;                               
   IF T27AMR1 IN(-7, -8, -9) THEN T27AMR1=.;                               
   IF T27AMR2 IN(-7, -8, -9) THEN T27AMR2=.;                               
   IF T27AMR3 IN(-7, -8, -9) THEN T27AMR3=.;                               
   IF T27AMR4 IN(-7, -8, -9) THEN T27AMR4=.;                               
   IF T27AMR5 IN(-7, -8, -9) THEN T27AMR5=.;                               
   IF T27BMR1 IN(-7, -8, -9) THEN T27BMR1=.;                               
   IF T27BMR2 IN(-7, -8, -9) THEN T27BMR2=.;                               
   IF T27BMR3 IN(-7, -8, -9) THEN T27BMR3=.;                               
   IF T27BMR4 IN(-7, -8, -9) THEN T27BMR4=.;                               
   IF T27BMR5 IN(-7, -8, -9) THEN T27BMR5=.;                               
   IF T27BMR6 IN(-7, -8, -9) THEN T27BMR6=.;                               
   IF T27BMR7 IN(-7, -8, -9) THEN T27BMR7=.;                               
   IF T27C IN(-7, -8, -9) THEN T27C=.;                                     
   IF T27D IN(-7, -8, -9) THEN T27D=.;                                     
   IF T27E IN(-7, -8, -9) THEN T27E=.;                                     
   IF CARD_31 IN(-7, -8, -9) THEN CARD_31=.;                               
   IF T28 IN(-7, -8, -9) THEN T28=.;                                       
   IF T29 IN(-7, -8, -9) THEN T29=.;                                       
   IF T30A IN(-7, -8, -9) THEN T30A=.;                                     
   IF T30B IN(-7, -8, -9) THEN T30B=.;                                     
   IF T30C IN(-7, -8, -9) THEN T30C=.;                                     
   IF T30DMR1 IN(-7, -8, -9) THEN T30DMR1=.;                               
   IF T30DMR2 IN(-7, -8, -9) THEN T30DMR2=.;                               
   IF T30DMR3 IN(-7, -8, -9) THEN T30DMR3=.;                               
   IF T30DMR4 IN(-7, -8, -9) THEN T30DMR4=.;                               
   IF T30EMR1 IN(-7, -8, -9) THEN T30EMR1=.;                               
   IF T30EMR2 IN(-7, -8, -9) THEN T30EMR2=.;                               
   IF T30EMR3 IN(-7, -8, -9) THEN T30EMR3=.;                               
   IF T31AMR1 IN(-7, -8, -9) THEN T31AMR1=.;                               
   IF T31AMR2 IN(-7, -8, -9) THEN T31AMR2=.;                               
   IF T31AMR3 IN(-7, -8, -9) THEN T31AMR3=.;                               
   IF T31AMR4 IN(-7, -8, -9) THEN T31AMR4=.;                               
   IF T31AMR5 IN(-7, -8, -9) THEN T31AMR5=.;                               
   IF T31AMR6 IN(-7, -8, -9) THEN T31AMR6=.;                               
   IF T31BMR1 IN(-7, -8, -9) THEN T31BMR1=.;                               
   IF T31BMR2 IN(-7, -8, -9) THEN T31BMR2=.;                               
   IF T31BMR3 IN(-7, -8, -9) THEN T31BMR3=.;                               
   IF T31BMR4 IN(-7, -8, -9) THEN T31BMR4=.;                               
   IF T31BMR5 IN(-7, -8, -9) THEN T31BMR5=.;                               
   IF T31BMR6 IN(-7, -8, -9) THEN T31BMR6=.;                               
   IF T31BMR7 IN(-7, -8, -9) THEN T31BMR7=.;                               
   IF T31C IN(-7, -8, -9) THEN T31C=.;                                     
   IF T31D IN(-7, -8, -9) THEN T31D=.;                                     
   IF T31E IN(-7, -8, -9) THEN T31E=.;                                     
   IF T32 IN(-7, -8, -9) THEN T32=.;                                       
   IF T33 IN(-7, -8, -9) THEN T33=.;                                       
   IF T34 IN(-7, -8, -9) THEN T34=.;                                       
   IF T35A IN(-7, -8, -9) THEN T35A=.;                                     
   IF T35B IN(-7, -8, -9) THEN T35B=.;                                     
   IF T35C IN(-7, -8, -9) THEN T35C=.;                                     
   IF T36 IN(-7, -8, -9) THEN T36=.;                                       
   IF T37 IN(-7, -8, -9) THEN T37=.;                                       
   IF T38A IN(-7, -8, -9) THEN T38A=.;                                     
   IF T38B IN(-7, -8, -9) THEN T38B=.;                                     
   IF T38C IN(-7, -8, -9) THEN T38C=.;                                     
   IF T38D IN(-7, -8, -9) THEN T38D=.;                                     
   IF T38E IN(-7, -8, -9) THEN T38E=.;                                     
   IF T39 IN(-7, -8, -9) THEN T39=.;                                       
   IF T40 IN(-7, -8, -9) THEN T40=.;                                       
   IF T41A IN(-7, -8, -9) THEN T41A=.;                                     
   IF T41B IN(-7, -8, -9) THEN T41B=.;                                     
   IF T41C IN(-7, -8, -9) THEN T41C=.;                                     
   IF T42 IN(-7, -8, -9) THEN T42=.;                                       
   IF T43 IN(-7, -8, -9) THEN T43=.;                                       
   IF T44A IN(-7, -8, -9) THEN T44A=.;                                     
   IF T44B IN(-7, -8, -9) THEN T44B=.;                                     
   IF T44C IN(-7, -8, -9) THEN T44C=.;                                     
   IF T45MR1 IN(-7, -8, -9) THEN T45MR1=.;                                 
   IF T45MR2 IN(-7, -8, -9) THEN T45MR2=.;                                 
   IF T45MR3 IN(-7, -8, -9) THEN T45MR3=.;                                 
   IF T45MR4 IN(-7, -8, -9) THEN T45MR4=.;                                 
   IF T45MR5 IN(-7, -8, -9) THEN T45MR5=.;                                 
   IF T45MR6 IN(-7, -8, -9) THEN T45MR6=.;                                 
   IF T46 IN(-7, -8, -9) THEN T46=.;                                       
   IF T47A IN(-7, -8, -9) THEN T47A=.;                                     
   IF T47B IN(-7, -8, -9) THEN T47B=.;                                     
   IF T47C IN(-7, -8, -9) THEN T47C=.;                                     
   IF T47D IN(-7, -8, -9) THEN T47D=.;                                     
   IF T48 IN(-7, -8, -9) THEN T48=.;                                       
   IF CARD_32 IN(-7, -8, -9) THEN CARD_32=.;                               
   IF T49MR1 IN(-7, -8, -9) THEN T49MR1=.;                                 
   IF T49MR2 IN(-7, -8, -9) THEN T49MR2=.;                                 
   IF T49MR3 IN(-7, -8, -9) THEN T49MR3=.;                                 
   IF T49MR4 IN(-7, -8, -9) THEN T49MR4=.;                                 
   IF T49MR5 IN(-7, -8, -9) THEN T49MR5=.;                                 
   IF T49MR6 IN(-7, -8, -9) THEN T49MR6=.;                                 
   IF T49MR7 IN(-7, -8, -9) THEN T49MR7=.;                                 
   IF T49MR8 IN(-7, -8, -9) THEN T49MR8=.;                                 
   IF T49MR9 IN(-7, -8, -9) THEN T49MR9=.;                                 
   IF T50MR1 IN(-7, -8, -9) THEN T50MR1=.;                                 
   IF T50MR2 IN(-7, -8, -9) THEN T50MR2=.;                                 
   IF T50MR3 IN(-7, -8, -9) THEN T50MR3=.;                                 
   IF T50MR4 IN(-7, -8, -9) THEN T50MR4=.;                                 
   IF T50MR5 IN(-7, -8, -9) THEN T50MR5=.;                                 
   IF T50MR6 IN(-7, -8, -9) THEN T50MR6=.;                                 
   IF T50MR7 IN(-7, -8, -9) THEN T50MR7=.;                                 
   IF T50MR8 IN(-7, -8, -9) THEN T50MR8=.;                                 
   IF T50MR9 IN(-7, -8, -9) THEN T50MR9=.;                                 
   IF T51MR1 IN(-7, -8, -9) THEN T51MR1=.;                                 
   IF T51MR2 IN(-7, -8, -9) THEN T51MR2=.;                                 
   IF T51MR3 IN(-7, -8, -9) THEN T51MR3=.;                                 
   IF T51MR4 IN(-7, -8, -9) THEN T51MR4=.;                                 
   IF T51MR5 IN(-7, -8, -9) THEN T51MR5=.;                                 
   IF T51MR6 IN(-7, -8, -9) THEN T51MR6=.;                                 
   IF T51MR7 IN(-7, -8, -9) THEN T51MR7=.;                                 
   IF T51MR8 IN(-7, -8, -9) THEN T51MR8=.;                                 
   IF T51MR9 IN(-7, -8, -9) THEN T51MR9=.;                                 
   IF T52 IN(-7, -8, -9) THEN T52=.;                                       
   IF T53 IN(-7, -8, -9) THEN T53=.;                                       
   IF CARD_33 IN(-7, -8, -9) THEN CARD_33=.;                               
   IF T54 IN(-7, -8, -9) THEN T54=.;                                       
   IF T55 IN(-7, -8, -9) THEN T55=.;                                       
   IF T56MR1 IN(-7, -8, -9) THEN T56MR1=.;                                 
   IF T56MR2 IN(-7, -8, -9) THEN T56MR2=.;                                 
   IF T56MR3 IN(-7, -8, -9) THEN T56MR3=.;                                 
   IF T56MR4 IN(-7, -8, -9) THEN T56MR4=.;                                 
   IF T56MR5 IN(-7, -8, -9) THEN T56MR5=.;                                 
   IF T56MR6 IN(-7, -8, -9) THEN T56MR6=.;                                 
   IF T56MR7 IN(-7, -8, -9) THEN T56MR7=.;                                 
   IF T56MR8 IN(-7, -8, -9) THEN T56MR8=.;                                 
   IF T56MR9 IN(-7, -8, -9) THEN T56MR9=.;                                 
   IF T56MR10 IN(-7, -8, -9) THEN T56MR10=.;                               
   IF T56MR11 IN(-7, -8, -9) THEN T56MR11=.;                               
   IF T57MR1 IN(-7, -8, -9) THEN T57MR1=.;                                 
   IF T57MR2 IN(-7, -8, -9) THEN T57MR2=.;                                 
   IF T57MR3 IN(-7, -8, -9) THEN T57MR3=.;                                 
   IF T57MR4 IN(-7, -8, -9) THEN T57MR4=.;                                 
   IF T57MR5 IN(-7, -8, -9) THEN T57MR5=.;                                 
   IF T57MR6 IN(-7, -8, -9) THEN T57MR6=.;                                 
   IF T57MR7 IN(-7, -8, -9) THEN T57MR7=.;                                 
   IF T57MR8 IN(-7, -8, -9) THEN T57MR8=.;                                 
   IF T57MR9 IN(-7, -8, -9) THEN T57MR9=.;                                 
   IF T57MR10 IN(-7, -8, -9) THEN T57MR10=.;                               
   IF T57MR11 IN(-7, -8, -9) THEN T57MR11=.;                               
   IF T57MR12 IN(-7, -8, -9) THEN T57MR12=.;                               
   IF T57MR13 IN(-7, -8, -9) THEN T57MR13=.;                               
   IF T57MR14 IN(-7, -8, -9) THEN T57MR14=.;                               
   IF CARD_34 IN(-7, -8, -9) THEN CARD_34=.;                               
   IF T58MR1 IN(-7, -8, -9) THEN T58MR1=.;                                 
   IF T58MR2 IN(-7, -8, -9) THEN T58MR2=.;                                 
   IF T58MR3 IN(-7, -8, -9) THEN T58MR3=.;                                 
   IF T58MR4 IN(-7, -8, -9) THEN T58MR4=.;                                 
   IF T58MR5 IN(-7, -8, -9) THEN T58MR5=.;                                 
   IF T58MR6 IN(-7, -8, -9) THEN T58MR6=.;                                 
   IF T58MR7 IN(-7, -8, -9) THEN T58MR7=.;                                 
   IF T58MR8 IN(-7, -8, -9) THEN T58MR8=.;                                 
   IF T58MR9 IN(-7, -8, -9) THEN T58MR9=.;                                 
   IF T58MR10 IN(-7, -8, -9) THEN T58MR10=.;                               
   IF T58MR11 IN(-7, -8, -9) THEN T58MR11=.;                               
   IF T58MR12 IN(-7, -8, -9) THEN T58MR12=.;                               
   IF T58MR13 IN(-7, -8, -9) THEN T58MR13=.;                               
   IF T58MR14 IN(-7, -8, -9) THEN T58MR14=.;                               
   IF T59MR1 IN(-7, -8, -9) THEN T59MR1=.;                                 
   IF T59MR2 IN(-7, -8, -9) THEN T59MR2=.;                                 
   IF T59MR3 IN(-7, -8, -9) THEN T59MR3=.;                                 
   IF T59MR4 IN(-7, -8, -9) THEN T59MR4=.;                                 
   IF T59MR5 IN(-7, -8, -9) THEN T59MR5=.;                                 
   IF T59MR6 IN(-7, -8, -9) THEN T59MR6=.;                                 
   IF T59MR7 IN(-7, -8, -9) THEN T59MR7=.;                                 
   IF T59MR8 IN(-7, -8, -9) THEN T59MR8=.;                                 
   IF T59MR9 IN(-7, -8, -9) THEN T59MR9=.;                                 
   IF T59MR10 IN(-7, -8, -9) THEN T59MR10=.;                               
   IF T59MR11 IN(-7, -8, -9) THEN T59MR11=.;                               
   IF T59MR12 IN(-7, -8, -9) THEN T59MR12=.;                               
   IF T59MR13 IN(-7, -8, -9) THEN T59MR13=.;                               
   IF T59MR14 IN(-7, -8, -9) THEN T59MR14=.;                               
   IF T60MR1 IN(-7, -8, -9) THEN T60MR1=.;                                 
   IF T60MR2 IN(-7, -8, -9) THEN T60MR2=.;                                 
   IF T60MR3 IN(-7, -8, -9) THEN T60MR3=.;                                 
   IF T60MR4 IN(-7, -8, -9) THEN T60MR4=.;                                 
   IF CARD_35 IN(-7, -8, -9) THEN CARD_35=.;                               
   IF T61 IN(-7, -8, -9) THEN T61=.;                                       
   IF T62MR1 IN(-7, -8, -9) THEN T62MR1=.;                                 
   IF T62MR2 IN(-7, -8, -9) THEN T62MR2=.;                                 
   IF T62MR3 IN(-7, -8, -9) THEN T62MR3=.;                                 
   IF T62MR4 IN(-7, -8, -9) THEN T62MR4=.;                                 
   IF T62MR5 IN(-7, -8, -9) THEN T62MR5=.;                                 
   IF T62MR6 IN(-7, -8, -9) THEN T62MR6=.;                                 
   IF T62MR7 IN(-7, -8, -9) THEN T62MR7=.;                                 
   IF T62MR8 IN(-7, -8, -9) THEN T62MR8=.;                                 
   IF T62MR9 IN(-7, -8, -9) THEN T62MR9=.;                                 
   IF T62MR10 IN(-7, -8, -9) THEN T62MR10=.;                               
   IF T63 IN(-7, -8, -9) THEN T63=.;                                       
   IF T64MR1 IN(-7, -8, -9) THEN T64MR1=.;                                 
   IF T64MR2 IN(-7, -8, -9) THEN T64MR2=.;                                 
   IF T64MR3 IN(-7, -8, -9) THEN T64MR3=.;                                 
   IF T65 IN(-7, -8, -9) THEN T65=.;                                       
   IF T66A IN(-7, -8, -9) THEN T66A=.;                                     
   IF T66B IN(-7, -8, -9) THEN T66B=.;                                     
   IF T66C IN(-7, -8, -9) THEN T66C=.;                                     
   IF T66D IN(-7, -8, -9) THEN T66D=.;                                     
   IF T66E IN(-7, -8, -9) THEN T66E=.;                                     
   IF T66F IN(-7, -8, -9) THEN T66F=.;                                     
   IF T66G IN(-7, -8, -9) THEN T66G=.;                                     
   IF T66H IN(-7, -8, -9) THEN T66H=.;                                     
   IF T66I IN(-7, -8, -9) THEN T66I=.;                                     
   IF T66J IN(-7, -8, -9) THEN T66J=.;                                     
   IF T66K IN(-7, -8, -9) THEN T66K=.;                                     
   IF T661 IN(-7, -8, -9) THEN T661=.;                                     
   IF T67A IN(-7, -8, -9) THEN T67A=.;                                     
   IF T67B IN(-7, -8, -9) THEN T67B=.;                                     
   IF T67C IN(-7, -8, -9) THEN T67C=.;                                     
   IF T67D IN(-7, -8, -9) THEN T67D=.;                                     
   IF T67E IN(-7, -8, -9) THEN T67E=.;                                     
   IF T67F IN(-7, -8, -9) THEN T67F=.;                                     
   IF T68 IN(-7, -8, -9) THEN T68=.;                                       
   IF T69 IN(-7, -8, -9) THEN T69=.;                                       
   IF T70 IN(-7, -8, -9) THEN T70=.;                                       
   IF T71 IN(-7, -8, -9) THEN T71=.;                                       
   IF T72 IN(-7, -8, -9) THEN T72=.;                                       
   IF T73 IN(-7, -8, -9) THEN T73=.;                                       
   IF T74 IN(-7, -8, -9) THEN T74=.;                                       
                                                                           
                                                                           
