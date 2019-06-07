*-------------------------------------------------------------------------*
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 04413
 |               DETROIT ARAB AMERICAN STUDY (DAAS), 2003
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
 | "c:\temp\04413-0001-data.txt").
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
 | FORMAT:  associates the formats created by the PROC FORMAT step with
 | the variables named in the INPUT statement.
 |
 | NOTE:  Users should modify this setup file to suit their specific needs.
 | Sections for PROC FORMAT, FORMAT, and MISSING VALUE RECODES have been
 | commented out (i.e., '/*'). To include these sections in the final SAS
 | setup, users should remove the SAS comment indicators from the desired
 | section(s).
 |
 *------------------------------------------------------------------------;

* SAS PROC FORMAT;

/*
PROC FORMAT;
  VALUE I_MONTH   1='(1) January' 2='(2) February' 3='(3) March' 4='(4) April' 5='(5) May'
                  6='(6) June' 7='(7) July' 8='(8) August' 9='(9) September' 10='(10) October'
                  11='(11) November' 12='(12) December' ;
  VALUE A1_YEAR   95='(95) ALL OF LIFE' 97='(97) UNCODEABLE' ;
  VALUE A1_MONTH  97='(97) UNCODEABLE' ;
  VALUE A2ffffff  1='(1) INSIDE DETROIT' 2='(2) NEAR SOUTH WEST DETROIT'
                  3='(3) DOWNRIVER' 4='(4) WESTERN SUBURBS' 5='(5) NEAR NORTHERN SUBURBS'
                  6='(6) NORTHERN SUBURBS' 7='(7) EASTERN SUBURBS' 8='(8) Dont_Know'
                  9='(9) Refuse' 97='(97) Uncodeable' ;
  VALUE A3ffffff  1='(1) Own' 2='(2) Rent' 3='(3) Neither' 7='(7) Uncodeable' 8='(8) Dont_Know'
                  9='(9) Refuse' ;
  VALUE A4ffffff  1='(1) Very happy' 2='(2) happy' 3='(3) Not very happy'
                  4='(4) Not happy at all' 7='(7) Uncodeable' 8='(8) Dont_Know'
                  9='(9) Refuse' ;
  VALUE A5ffffff  1='(1) Excellent' 2='(2) Very Good' 3='(3) Good' 4='(4) Fair' 5='(5) Poor'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE A6_1ffff  1='(1) WHITE' 2='(2) BLACK, AFRICAN AMERICAN, OR NEGRO'
                  3='(3) AMERICAN INDIAN OR ALASKA NATIVE' 4='(4) ASIAN'
                  5='(5) PACIFIC ISLANDER' 6='(6) OTHER (SPECIFY)' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE A6_2ffff  1='(1) WHITE' 2='(2) BLACK, AFRICAN AMERICAN, OR NEGRO'
                  3='(3) AMERICAN INDIAN OR ALASKA NATIVE' 4='(4) ASIAN'
                  5='(5) PACIFIC ISLANDER' 6='(6) OTHER (SPECIFY)' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE A6_3ffff  1='(1) WHITE' 2='(2) BLACK, AFRICAN AMERICAN, OR NEGRO'
                  3='(3) AMERICAN INDIAN OR ALASKA NATIVE' 4='(4) ASIAN'
                  5='(5) PACIFIC ISLANDER' 6='(6) OTHER (SPECIFY)' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE A6_4ffff  1='(1) WHITE' 2='(2) BLACK, AFRICAN AMERICAN, OR NEGRO'
                  3='(3) AMERICAN INDIAN OR ALASKA NATIVE' 4='(4) ASIAN'
                  5='(5) PACIFIC ISLANDER' 6='(6) OTHER (SPECIFY)' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE A6_5ffff  1='(1) WHITE' 2='(2) BLACK, AFRICAN AMERICAN, OR NEGRO'
                  3='(3) AMERICAN INDIAN OR ALASKA NATIVE' 4='(4) ASIAN'
                  5='(5) PACIFIC ISLANDER' 6='(6) OTHER (SPECIFY)' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE A6_6ffff  1='(1) WHITE' 2='(2) BLACK, AFRICAN AMERICAN, OR NEGRO'
                  3='(3) AMERICAN INDIAN OR ALASKA NATIVE' 4='(4) ASIAN'
                  5='(5) PACIFIC ISLANDER' 6='(6) OTHER (SPECIFY)' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE A6_7ffff  1='(1) WHITE' 2='(2) BLACK, AFRICAN AMERICAN, OR NEGRO'
                  3='(3) AMERICAN INDIAN OR ALASKA NATIVE' 4='(4) ASIAN'
                  5='(5) PACIFIC ISLANDER' 6='(6) OTHER (SPECIFY)' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B1ffffff  97='(97) UNCODEABLE' 99='(99) REFUSE' ;
  VALUE B2ffffff  1='(1) EVERY DAY' 2='(2) SEVERAL DAYS' 3='(3) ONE OR TWO DAYS'
                  4='(4) NEVER' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B2A       1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B2B       1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B2C       1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B3ffffff  1='(1) EVERY DAY' 2='(2) SEVERAL DAYS' 3='(3) ONE OR TWO DAYS'
                  4='(4) NEVER' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B3A       1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B4ffffff  1='(1) EVERY DAY' 2='(2) SEVERAL DAYS' 3='(3) ONE OR TWO DAYS'
                  4='(4) NEVER' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B4A       1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B4B       1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B5A       1='(1) YES' 5='(5) NO' 7='(7) DON T KNOW WHAT IT IS' 8='(8) Dont_Know'
                  9='(9) Refuse' 97='(97) Uncodeable' ;
  VALUE B5B       1='(1) YES' 5='(5) NO' 7='(7) DON T KNOW WHAT IT IS' 8='(8) Dont_Know'
                  9='(9) Refuse' 97='(97) Uncodeable' ;
  VALUE B5C       1='(1) YES' 5='(5) NO' 7='(7) DON T KNOW WHAT IT IS' 8='(8) Dont_Know'
                  9='(9) Refuse' 97='(97) Uncodeable' ;
  VALUE B5D       1='(1) YES' 5='(5) NO' 7='(7) DON T KNOW WHAT IT IS' 8='(8) Dont_Know'
                  9='(9) Refuse' 97='(97) Uncodeable' ;
  VALUE B5E       1='(1) YES' 5='(5) NO' 7='(7) DON T KNOW WHAT IT IS' 8='(8) Dont_Know'
                  9='(9) Refuse' 97='(97) Uncodeable' ;
  VALUE B6ffffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B6A01fff  1='(1) ART' 2='(2) AL JEZEERA' 3='(3) DUBAI' 4='(4) ABU DHABI'
                  5='(5) PALESTINE' 6='(6) EGYPT' 7='(7) KUWAIT' 8='(8) QATAR' 9='(9) LBC'
                  10='(10) MBC' 11='(11) AL MANAR' 12='(12) MUSTAQUBAL (FUTURE TV)'
                  13='(13) SAUDI ARABIA (1 AND 2)' 14='(14) YEMENI SATELLITE'
                  15='(15) OTHER (SPECIFY)' 97='(97) Uncodeable' 98='(98) Dont_Know'
                  99='(99) Refuse' ;
  VALUE B6A02fff  1='(1) ART' 2='(2) AL JEZEERA' 3='(3) DUBAI' 4='(4) ABU DHABI'
                  5='(5) PALESTINE' 6='(6) EGYPT' 7='(7) KUWAIT' 8='(8) QATAR' 9='(9) LBC'
                  10='(10) MBC' 11='(11) AL MANAR' 12='(12) MUSTAQUBAL (FUTURE TV)'
                  13='(13) SAUDI ARABIA (1 AND 2)' 14='(14) YEMENI SATELLITE'
                  15='(15) OTHER (SPECIFY)' 97='(97) Uncodeable' 98='(98) Dont_Know'
                  99='(99) Refuse' ;
  VALUE B6A03fff  1='(1) ART' 2='(2) AL JEZEERA' 3='(3) DUBAI' 4='(4) ABU DHABI'
                  5='(5) PALESTINE' 6='(6) EGYPT' 7='(7) KUWAIT' 8='(8) QATAR' 9='(9) LBC'
                  10='(10) MBC' 11='(11) AL MANAR' 12='(12) MUSTAQUBAL (FUTURE TV)'
                  13='(13) SAUDI ARABIA (1 AND 2)' 14='(14) YEMENI SATELLITE'
                  15='(15) OTHER (SPECIFY)' 97='(97) Uncodeable' 98='(98) Dont_Know'
                  99='(99) Refuse' ;
  VALUE B6A04fff  1='(1) ART' 2='(2) AL JEZEERA' 3='(3) DUBAI' 4='(4) ABU DHABI'
                  5='(5) PALESTINE' 6='(6) EGYPT' 7='(7) KUWAIT' 8='(8) QATAR' 9='(9) LBC'
                  10='(10) MBC' 11='(11) AL MANAR' 12='(12) MUSTAQUBAL (FUTURE TV)'
                  13='(13) SAUDI ARABIA (1 AND 2)' 14='(14) YEMENI SATELLITE'
                  15='(15) OTHER (SPECIFY)' 97='(97) Uncodeable' 98='(98) Dont_Know'
                  99='(99) Refuse' ;
  VALUE B6A05fff  1='(1) ART' 2='(2) AL JEZEERA' 3='(3) DUBAI' 4='(4) ABU DHABI'
                  5='(5) PALESTINE' 6='(6) EGYPT' 7='(7) KUWAIT' 8='(8) QATAR' 9='(9) LBC'
                  10='(10) MBC' 11='(11) AL MANAR' 12='(12) MUSTAQUBAL (FUTURE TV)'
                  13='(13) SAUDI ARABIA (1 AND 2)' 14='(14) YEMENI SATELLITE'
                  15='(15) OTHER (SPECIFY)' 97='(97) Uncodeable' 98='(98) Dont_Know'
                  99='(99) Refuse' ;
  VALUE B6A06fff  1='(1) ART' 2='(2) AL JEZEERA' 3='(3) DUBAI' 4='(4) ABU DHABI'
                  5='(5) PALESTINE' 6='(6) EGYPT' 7='(7) KUWAIT' 8='(8) QATAR' 9='(9) LBC'
                  10='(10) MBC' 11='(11) AL MANAR' 12='(12) MUSTAQUBAL (FUTURE TV)'
                  13='(13) SAUDI ARABIA (1 AND 2)' 14='(14) YEMENI SATELLITE'
                  15='(15) OTHER (SPECIFY)' 97='(97) Uncodeable' 98='(98) Dont_Know'
                  99='(99) Refuse' ;
  VALUE B6A07fff  1='(1) ART' 2='(2) AL JEZEERA' 3='(3) DUBAI' 4='(4) ABU DHABI'
                  5='(5) PALESTINE' 6='(6) EGYPT' 7='(7) KUWAIT' 8='(8) QATAR' 9='(9) LBC'
                  10='(10) MBC' 11='(11) AL MANAR' 12='(12) MUSTAQUBAL (FUTURE TV)'
                  13='(13) SAUDI ARABIA (1 AND 2)' 14='(14) YEMENI SATELLITE'
                  15='(15) OTHER (SPECIFY)' 97='(97) Uncodeable' 98='(98) Dont_Know'
                  99='(99) Refuse' ;
  VALUE B6A08fff  1='(1) ART' 2='(2) AL JEZEERA' 3='(3) DUBAI' 4='(4) ABU DHABI'
                  5='(5) PALESTINE' 6='(6) EGYPT' 7='(7) KUWAIT' 8='(8) QATAR' 9='(9) LBC'
                  10='(10) MBC' 11='(11) AL MANAR' 12='(12) MUSTAQUBAL (FUTURE TV)'
                  13='(13) SAUDI ARABIA (1 AND 2)' 14='(14) YEMENI SATELLITE'
                  15='(15) OTHER (SPECIFY)' 97='(97) Uncodeable' 98='(98) Dont_Know'
                  99='(99) Refuse' ;
  VALUE B6A09fff  1='(1) ART' 2='(2) AL JEZEERA' 3='(3) DUBAI' 4='(4) ABU DHABI'
                  5='(5) PALESTINE' 6='(6) EGYPT' 7='(7) KUWAIT' 8='(8) QATAR' 9='(9) LBC'
                  10='(10) MBC' 11='(11) AL MANAR' 12='(12) MUSTAQUBAL (FUTURE TV)'
                  13='(13) SAUDI ARABIA (1 AND 2)' 14='(14) YEMENI SATELLITE'
                  15='(15) OTHER (SPECIFY)' 97='(97) Uncodeable' 98='(98) Dont_Know'
                  99='(99) Refuse' ;
  VALUE B6A10fff  1='(1) ART' 2='(2) AL JEZEERA' 3='(3) DUBAI' 4='(4) ABU DHABI'
                  5='(5) PALESTINE' 6='(6) EGYPT' 7='(7) KUWAIT' 8='(8) QATAR' 9='(9) LBC'
                  10='(10) MBC' 11='(11) AL MANAR' 12='(12) MUSTAQUBAL (FUTURE TV)'
                  13='(13) SAUDI ARABIA (1 AND 2)' 14='(14) YEMENI SATELLITE'
                  15='(15) OTHER (SPECIFY)' 97='(97) Uncodeable' 98='(98) Dont_Know'
                  99='(99) Refuse' ;
  VALUE B6A11fff  1='(1) ART' 2='(2) AL JEZEERA' 3='(3) DUBAI' 4='(4) ABU DHABI'
                  5='(5) PALESTINE' 6='(6) EGYPT' 7='(7) KUWAIT' 8='(8) QATAR' 9='(9) LBC'
                  10='(10) MBC' 11='(11) AL MANAR' 12='(12) MUSTAQUBAL (FUTURE TV)'
                  13='(13) SAUDI ARABIA (1 AND 2)' 14='(14) YEMENI SATELLITE'
                  15='(15) OTHER (SPECIFY)' 97='(97) Uncodeable' 98='(98) Dont_Know'
                  99='(99) Refuse' ;
  VALUE B6A12fff  1='(1) ART' 2='(2) AL JEZEERA' 3='(3) DUBAI' 4='(4) ABU DHABI'
                  5='(5) PALESTINE' 6='(6) EGYPT' 7='(7) KUWAIT' 8='(8) QATAR' 9='(9) LBC'
                  10='(10) MBC' 11='(11) AL MANAR' 12='(12) MUSTAQUBAL (FUTURE TV)'
                  13='(13) SAUDI ARABIA (1 AND 2)' 14='(14) YEMENI SATELLITE'
                  15='(15) OTHER (SPECIFY)' 97='(97) Uncodeable' 98='(98) Dont_Know'
                  99='(99) Refuse' ;
  VALUE B6A13fff  1='(1) ART' 2='(2) AL JEZEERA' 3='(3) DUBAI' 4='(4) ABU DHABI'
                  5='(5) PALESTINE' 6='(6) EGYPT' 7='(7) KUWAIT' 8='(8) QATAR' 9='(9) LBC'
                  10='(10) MBC' 11='(11) AL MANAR' 12='(12) MUSTAQUBAL (FUTURE TV)'
                  13='(13) SAUDI ARABIA (1 AND 2)' 14='(14) YEMENI SATELLITE'
                  15='(15) OTHER (SPECIFY)' 97='(97) Uncodeable' 98='(98) Dont_Know'
                  99='(99) Refuse' ;
  VALUE B6A14fff  1='(1) ART' 2='(2) AL JEZEERA' 3='(3) DUBAI' 4='(4) ABU DHABI'
                  5='(5) PALESTINE' 6='(6) EGYPT' 7='(7) KUWAIT' 8='(8) QATAR' 9='(9) LBC'
                  10='(10) MBC' 11='(11) AL MANAR' 12='(12) MUSTAQUBAL (FUTURE TV)'
                  13='(13) SAUDI ARABIA (1 AND 2)' 14='(14) YEMENI SATELLITE'
                  15='(15) OTHER (SPECIFY)' 97='(97) Uncodeable' 98='(98) Dont_Know'
                  99='(99) Refuse' ;
  VALUE B6A15fff  1='(1) ART' 2='(2) AL JEZEERA' 3='(3) DUBAI' 4='(4) ABU DHABI'
                  5='(5) PALESTINE' 6='(6) EGYPT' 7='(7) KUWAIT' 8='(8) QATAR' 9='(9) LBC'
                  10='(10) MBC' 11='(11) AL MANAR' 12='(12) MUSTAQUBAL (FUTURE TV)'
                  13='(13) SAUDI ARABIA (1 AND 2)' 14='(14) YEMENI SATELLITE'
                  15='(15) OTHER (SPECIFY)' 97='(97) Uncodeable' 98='(98) Dont_Know'
                  99='(99) Refuse' ;
  VALUE B7ffffff  97='(97) UNCODEABLE' ;
  VALUE B8ffffff  97='(97) UNCODEABLE' 99='(99) REFUSE' ;
  VALUE B9ffffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B10fffff  1='(1) EVERYDAY OR ALMOST EVERYDAY' 2='(2) A FEW TIMES A WEEK'
                  3='(3) ONCE A WEEK' 4='(4) LESS THAN ONCE A WEEK' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B11fffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B12fffff  1='(1) EVERY DAY' 2='(2) SEVERAL DAYS' 3='(3) ONE OR TWO DAYS'
                  4='(4) NEVER' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B12A      1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B13fffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B14fffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B15fffff  1='(1) AT LEAST ONCE A DAY' 2='(2) ONCE A WEEK' 3='(3) ONCE A MONTH'
                  4='(4) LESS OFTEN THAN THAT' 5='(5) NEVER' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B16fffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) (IF VOL.) DOES NOT APPLY'
                  9='(9) Refuse' ;
  VALUE B16A      1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B17fffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) (IF VOL.) DOES NOT APPLY'
                  9='(9) Refuse' ;
  VALUE B17A      1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B18fffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) (IF VOL.) DOES NOT APPLY'
                  9='(9) Refuse' ;
  VALUE B18A      1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B19fffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) (IF VOL.) DOES NOT APPLY'
                  9='(9) Refuse' ;
  VALUE B19A      1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B20fffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) (IF VOL.) DOES NOT APPLY'
                  9='(9) Refuse' ;
  VALUE B20A      1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B21fffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) (IF VOL.) DOES NOT APPLY'
                  9='(9) Refuse' ;
  VALUE B21A      1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE B22fffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) (IF VOL.) DOES NOT APPLY'
                  9='(9) Refuse' ;
  VALUE B22A      1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C1ffffff  1='(1) VERY CONSERVATIVE' 2='(2) MODERATELY CONSERVATIVE'
                  3='(3) MIDDLE OF THE ROAD' 4='(4) MODERATELY LIBERAL'
                  5='(5) VERY LIBERAL' 6='(6) (IF VOL)SOMETHING ELSE' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C2ffffff  1='(1) REPUBLICAN' 2='(2) DEMOCRAT' 3='(3) INDEPENDENT'
                  4='(4) OTHER SPECIFY:' 5='(5) (IF VOL.)NO PREFERENCE'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C3ffffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C3A       1='(1) GORE' 2='(2) BUSH' 3='(3) RALPH NADER' 4='(4) SOMEONE ELSE'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C4ffffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C5ffffff  997='(997) UNCODEABLE' 998='(998) DON''T KNOW/NOT SURE' 999='(999) REFUSE' ;
  VALUE C5A       1='(1) NEVER DID THIS' 2='(2) ONCE' 3='(3) A FEW TIMES'
                  4='(4) ABOUT ONCE A MONTH ON AVERAGE' 5='(5) TWICE A MONTH'
                  6='(6) ABOUT ONCE A WEEK ON AVERAGE' 7='(7) MORE THAN ONCE A WEEK'
                  8='(8) Dont_Know' 9='(9) Refuse' 97='(97) Uncodeable' ;
  VALUE C5B       1='(1) TWO TO FOUR TIMES' 2='(2) FIVE TO NINE TIMES' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C6ffffff  997='(997) UNCODEABLE' 998='(998) DON''T KNOW/NOT SURE' 999='(999) REFUSE' ;
  VALUE C6A       1='(1) NEVER DID THIS' 2='(2) ONCE' 3='(3) A FEW TIMES'
                  4='(4) ABOUT ONCE A MONTH ON AVERAGE' 5='(5) TWICE A MONTH'
                  6='(6) ABOUT ONCE A WEEK ON AVERAGE' 7='(7) MORE THAN ONCE A WEEK'
                  8='(8) Dont_Know' 9='(9) Refuse' 97='(97) Uncodeable' ;
  VALUE C6B       1='(1) TWO TO FOUR TIMES' 2='(2) FIVE TO NINE TIMES' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C7ffffff  997='(997) UNCODEABLE' 998='(998) DON''T KNOW/NOT SURE' 999='(999) REFUSE' ;
  VALUE C7A       1='(1) NEVER DID THIS' 2='(2) ONCE' 3='(3) A FEW TIMES'
                  4='(4) ABOUT ONCE A MONTH ON AVERAGE' 5='(5) TWICE A MONTH'
                  6='(6) ABOUT ONCE A WEEK ON AVERAGE' 7='(7) MORE THAN ONCE A WEEK'
                  8='(8) Dont_Know' 9='(9) Refuse' 97='(97) Uncodeable' ;
  VALUE C7B       1='(1) TWO TO FOUR TIMES' 2='(2) FIVE TO NINE TIMES' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C8ffffff  997='(997) UNCODEABLE' 998='(998) DON''T KNOW/NOT SURE' 999='(999) REFUSE' ;
  VALUE C8A       1='(1) NEVER DID THIS' 2='(2) ONCE' 3='(3) A FEW TIMES'
                  4='(4) ABOUT ONCE A MONTH ON AVERAGE' 5='(5) TWICE A MONTH'
                  6='(6) ABOUT ONCE A WEEK ON AVERAGE' 7='(7) MORE THAN ONCE A WEEK'
                  8='(8) Dont_Know' 9='(9) Refuse' 97='(97) Uncodeable' ;
  VALUE C8B       1='(1) TWO TO FOUR TIMES' 2='(2) FIVE TO NINE TIMES' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C9ffffff  997='(997) UNCODEABLE' 998='(998) DON''T KNOW/NOT SURE' 999='(999) REFUSE' ;
  VALUE C9A       1='(1) NEVER DID THIS' 2='(2) ONCE' 3='(3) A FEW TIMES'
                  4='(4) ABOUT ONCE A MONTH ON AVERAGE' 5='(5) TWICE A MONTH'
                  6='(6) ABOUT ONCE A WEEK ON AVERAGE' 7='(7) MORE THAN ONCE A WEEK'
                  8='(8) Dont_Know' 9='(9) Refuse' 97='(97) Uncodeable' ;
  VALUE C9B       1='(1) TWO TO FOUR TIMES' 2='(2) FIVE TO NINE TIMES' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C10fffff  997='(997) UNCODEABLE' 998='(998) DON''T KNOW/NOT SURE' 999='(999) REFUSE' ;
  VALUE C10A      1='(1) NEVER DID THIS' 2='(2) ONCE' 3='(3) A FEW TIMES'
                  4='(4) ABOUT ONCE A MONTH ON AVERAGE' 5='(5) TWICE A MONTH'
                  6='(6) ABOUT ONCE A WEEK ON AVERAGE' 7='(7) MORE THAN ONCE A WEEK'
                  8='(8) Dont_Know' 9='(9) Refuse' 97='(97) Uncodeable' ;
  VALUE C10B      1='(1) TWO TO FOUR TIMES' 2='(2) FIVE TO NINE TIMES' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C11fffff  997='(997) UNCODEABLE' 998='(998) DON''T KNOW/NOT SURE' 999='(999) REFUSE' ;
  VALUE C11A      1='(1) NEVER DID THIS' 2='(2) ONCE' 3='(3) A FEW TIMES'
                  4='(4) ABOUT ONCE A MONTH ON AVERAGE' 5='(5) TWICE A MONTH'
                  6='(6) ABOUT ONCE A WEEK ON AVERAGE' 7='(7) MORE THAN ONCE A WEEK'
                  8='(8) Dont_Know' 9='(9) Refuse' 97='(97) Uncodeable' ;
  VALUE C11B      1='(1) TWO TO FOUR TIMES' 2='(2) FIVE TO NINE TIMES' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C12fffff  1='(1) EVERY WEEK OR MORE' 2='(2) ALMOST EVERY WEEK'
                  3='(3) ONCE OR TWICE A MONTH' 4='(4) A FEW TIMES A YEAR'
                  5='(5) LESS OFTEN THAN THAT' 7='(7) Uncodeable' 8='(8) Dont_Know'
                  9='(9) Refuse' ;
  VALUE C13fffff  1='(1) NOT AT ALL IMPORTANT' 10='(10) VERY IMPORTANT' ;
  VALUE C14fffff  1='(1) OFTEN' 2='(2) SOMETIMES' 3='(3) RARELY' 4='(4) NEVER' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C15fffff  1='(1) A' 2='(2) (IF VOL) DISAGREE WITH BOTH' 3='(3) B' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C16fffff  1='(1) ACTIVE' 2='(2) INACTIVE MEMBER' 3='(3) NEITHER' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C17fffff  1='(1) ACTIVE' 2='(2) INACTIVE MEMBER' 3='(3) NEITHER' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C18fffff  1='(1) ACTIVE' 2='(2) INACTIVE MEMBER' 3='(3) NEITHER' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C19fffff  1='(1) ACTIVE' 2='(2) INACTIVE MEMBER' 3='(3) NEITHER' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C20fffff  1='(1) ACTIVE' 2='(2) INACTIVE MEMBER' 3='(3) NEITHER' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C21fffff  1='(1) ACTIVE' 2='(2) INACTIVE MEMBER' 3='(3) NEITHER' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C22fffff  1='(1) ACTIVE' 2='(2) INACTIVE MEMBER' 3='(3) NEITHER' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C23fffff  1='(1) ACTIVE' 2='(2) INACTIVE MEMBER' 3='(3) NEITHER' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C24fffff  1='(1) NONE' 2='(2) $1-99' 3='(3) $100-499' 4='(4) $500-999' 5='(5) $1000-4999'
                  6='(6) $5000 OR MORE' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C25A      1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C25B      1='(1) MIGHT DO' 3='(3) WOULD NEVER DO' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C25C      1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C25D      1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C25E      1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C26fffff  1='(1) A GREAT DEAL' 2='(2) A LOT' 3='(3) NOT VERY MUCH'
                  4='(4) NONE AT ALL' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C27fffff  1='(1) A GREAT DEAL' 2='(2) A LOT' 3='(3) NOT VERY MUCH'
                  4='(4) NONE AT ALL' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C28fffff  1='(1) A GREAT DEAL' 2='(2) A LOT' 3='(3) NOT VERY MUCH'
                  4='(4) NONE AT ALL' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C29fffff  1='(1) A GREAT DEAL' 2='(2) A LOT' 3='(3) NOT VERY MUCH'
                  4='(4) NONE AT ALL' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C30fffff  1='(1) A GREAT DEAL' 2='(2) A LOT' 3='(3) NOT VERY MUCH'
                  4='(4) NONE AT ALL' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C31fffff  1='(1) A GREAT DEAL' 2='(2) A LOT' 3='(3) NOT VERY MUCH'
                  4='(4) NONE AT ALL' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C32fffff  1='(1) A GREAT DEAL' 2='(2) A LOT' 3='(3) NOT VERY MUCH'
                  4='(4) NONE AT ALL' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C33fffff  1='(1) PEOPLE CAN BE TRUSTED' 2='(2) YOU CAN T BE TOO CAREFUL'
                  3='(3) (IF VOL) DEPENDS' 7='(7) Uncodeable' 8='(8) Dont_Know'
                  9='(9) Refuse' ;
  VALUE C34A      1='(1) TRUST THEM A LOT' 2='(2) TRUST THEM SOME'
                  3='(3) TRUST THEM ONLY A LITTLE' 4='(4) TRUST THEM NOT AT ALL'
                  5='(5) (IF VOL) DOES NOT APPLY' 7='(7) Uncodeable' 8='(8) Dont_Know'
                  9='(9) Refuse' ;
  VALUE C34B      1='(1) TRUST THEM A LOT' 2='(2) TRUST THEM SOME'
                  3='(3) TRUST THEM ONLY A LITTLE' 4='(4) TRUST THEM NOT AT ALL'
                  5='(5) (IF VOL) DOES NOT APPLY' 7='(7) Uncodeable' 8='(8) Dont_Know'
                  9='(9) Refuse' ;
  VALUE C34C      1='(1) TRUST THEM A LOT' 2='(2) TRUST THEM SOME'
                  3='(3) TRUST THEM ONLY A LITTLE' 4='(4) TRUST THEM NOT AT ALL'
                  5='(5) (IF VOL) DOES NOT APPLY' 7='(7) Uncodeable' 8='(8) Dont_Know'
                  9='(9) Refuse' ;
  VALUE C34D      1='(1) TRUST THEM A LOT' 2='(2) TRUST THEM SOME'
                  3='(3) TRUST THEM ONLY A LITTLE' 4='(4) TRUST THEM NOT AT ALL'
                  5='(5) (IF VOL) DOES NOT APPLY' 7='(7) Uncodeable' 8='(8) Dont_Know'
                  9='(9) Refuse' ;
  VALUE C34E      1='(1) TRUST THEM A LOT' 2='(2) TRUST THEM SOME'
                  3='(3) TRUST THEM ONLY A LITTLE' 4='(4) TRUST THEM NOT AT ALL'
                  5='(5) (IF VOL) DOES NOT APPLY' 7='(7) Uncodeable' 8='(8) Dont_Know'
                  9='(9) Refuse' ;
  VALUE C35A      1='(1) VERY EFFECTIVE' 2='(2) SOMEWHAT EFFECTIVE' 3='(3) NOT EFFECTIVE'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C35B      1='(1) VERY EFFECTIVE' 2='(2) SOMEWHAT EFFECTIVE' 3='(3) NOT EFFECTIVE'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C35C      1='(1) VERY EFFECTIVE' 2='(2) SOMEWHAT EFFECTIVE' 3='(3) NOT EFFECTIVE'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C35D      1='(1) VERY EFFECTIVE' 2='(2) SOMEWHAT EFFECTIVE' 3='(3) NOT EFFECTIVE'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C35E      1='(1) VERY EFFECTIVE' 2='(2) SOMEWHAT EFFECTIVE' 3='(3) NOT EFFECTIVE'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C35F      1='(1) VERY EFFECTIVE' 2='(2) SOMEWHAT EFFECTIVE' 3='(3) NOT EFFECTIVE'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C35G      1='(1) VERY EFFECTIVE' 2='(2) SOMEWHAT EFFECTIVE' 3='(3) NOT EFFECTIVE'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C36A      1='(1) BIASED IN FAVOR' 2='(2) BALANCED' 3='(3) BIASED AGAINST'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C36B      1='(1) BIASED IN FAVOR' 2='(2) BALANCED' 3='(3) BIASED AGAINST'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C36C      1='(1) BIASED IN FAVOR' 2='(2) BALANCED' 3='(3) BIASED AGAINST'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C36D      1='(1) BIASED IN FAVOR' 2='(2) BALANCED' 3='(3) BIASED AGAINST'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C36E      1='(1) BIASED IN FAVOR' 2='(2) BALANCED' 3='(3) BIASED AGAINST'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE C37fffff  1='(1) ASHCROFT' 2='(2) SOMEONE ELSE' 3='(3) (IF VOL.)DON T KNOW'
                  7='(7) Uncodeable' 9='(9) Refuse' ;
  VALUE C38fffff  1='(1) DEMOCRATS' 2='(2) REPUBLICANS' 3='(3) (IF VOL.)DON T KNOW'
                  7='(7) Uncodeable' 9='(9) Refuse' ;
  VALUE D1ffffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D3ffffff  1='(1) WORKING NOW' 2='(2) ONLY TEMPORARILY LAID OFF'
                  3='(3) UNEMPLOYED' 4='(4) RETIRED' 5='(5) PERMANENTLY DISABLED'
                  6='(6) HOMEMAKER' 7='(7) STUDENT' 8='(8) OTHER (SPECIFY)'
                  97='(97) Uncodeable' 98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE D4ffffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D5ffffff  1='(1) SELF-EMPLOYED ONLY'
                  2='(2) (IF VOL.) BOTH SOMEONE ELSE AND SELF'
                  3='(3) SOMEONE ELSE ONLY' 7='(7) Uncodeable' 8='(8) Dont_Know'
                  9='(9) Refuse' ;
  VALUE $D6fffff  '001'='(001) CHIEF EXECUTIVES'
                  '002'='(002) GENERAL AND OPERATIONS MANAGERS' '003'='(003) LEGISLATORS'
                  '004'='(004) ADVERTISING AND PROMOTIONS MANAGERS'
                  '005'='(005) MARKETING AND SALES MANAGERS'
                  '006'='(006) PUBLIC RELATIONS MANAGERS'
                  '010'='(010) ADMINISTRATIVE SERVICES MANAGERS'
                  '011'='(011) COMPUTER AND INFORMATION SYSTEMS MANAGERS'
                  '012'='(012) FINANCIAL MANAGERS' '013'='(013) HUMAN RESOURCES MANAGERS'
                  '014'='(014) INDUSTRIAL PRODUCTION MANAGERS'
                  '015'='(015) PURCHASING MANAGERS'
                  '016'='(016) TRANSPORTATION, STORAGE, AND DISTRIBUTION MANAGERS'
                  '020'='(020) FARM, RANCH, AND OTHER AGRICULTURAL MANAGERS'
                  '021'='(021) FARMERS AND RANCHERS' '022'='(022) CONSTRUCTIONS MANAGERS'
                  '023'='(023) EDUCATION ADMINISTRATORS'
                  '030'='(030) ENGINEERING MANAGERS' '031'='(031) FOOD SERVICE MANAGERS'
                  '032'='(032) FUNERAL DIRECTORS' '033'='(033) GAMING MANAGERS'
                  '034'='(034) LODGING MANAGERS'
                  '035'='(035) MEDICAL AND HEALTH SERVICES MANAGERS'
                  '036'='(036) NATURAL SCIENCE MANAGERS'
                  '040'='(040) POSTMASTERS AND MAIL SUPERINTENDENTS'
                  '041'='(041) PROPERTY, REAL ESTATE, AND COMMUNITY ASSOCIATION MANAGERS'
                  '042'='(042) SOCIAL AND COMMUNITY SERVICE MANAGERS'
                  '043'='(043) MANAGERS, ALL OTHER'
                  '050'='(050) AGENTS AND BUSINESS MANAGERS OF ARTISTS, PERFORMERS, AND ATH'
                  '051'='(051) PURCHASING AGENTS AND BUYERS, FARM PRODUCTS'
                  '052'='(052) WHOLESALE AND RETAIL BUYERS, EXCEPT FARM PRODUCTS'
                  '053'='(053) PURCHASING AGENTS, EXCEPT WHOLESALE, RETAIL, AND FARM PRODUC'
                  '054'='(054) CLAIMS ADJUSTERS, APPRAISERS, EXAMINERS, AND INVESTIGATORS'
                  '056'='(056) COMPLIANCE OFFICERS, EXCEPT AGRICULTURE, CONSTRUCTION, HEALT'
                  '060'='(060) COST ESTIMATORS'
                  '062'='(062) HUMAN RESOURCES, TRAINING, AND LABOR RELATIONS SPECIALISTS'
                  '070'='(070) LOGISTICIANS' '071'='(071) MANAGEMENT ANALYSTS'
                  '072'='(072) MEETING AND CONVENTION PLANNERS'
                  '073'='(073) OTHER BUSINESS OPERATIONS SPECIALISTS'
                  '080'='(080) ACCOUNTANTS AND AUDITORS'
                  '081'='(081) APPRAISERS AND ASSESSORS OF REAL ESTATE'
                  '082'='(082) BUDGET ANALYSTS' '083'='(083) CREDIT ANALYSTS'
                  '084'='(084) FINANCIAL ANALYSTS'
                  '085'='(085) PERSONAL FINANCIAL ADVISORS'
                  '086'='(086) INSURANCE UNDERWRITERS' '090'='(090) FINANCIAL EXAMINERS'
                  '091'='(091) LOAN COUNSELORS AND OFFICERS'
                  '093'='(093) TAX EXAMINERS, COLLECTORS, AND REVENUE AGENTS'
                  '094'='(094) TAX PREPARERS'
                  '095'='(095) FINANCIAL SPECIALISTS, ALL OTHER'
                  '100'='(100) COMPUTER SCIENTISTS AND SYSTEMS ANALYSTS'
                  '101'='(101) COMPUTER PROGRAMMERS'
                  '102'='(102) COMPUTER SOFTWARE ENGINEERS'
                  '104'='(104) COMPUTER SUPPORT SPECIALISTS'
                  '106'='(106) DATABASE ADMINISTRATORS'
                  '110'='(110) NETWORK AND COMPUTER SYSTEMS ADMINISTRATORS'
                  '111'='(111) NETWORK SYSTEMS AND DATA COMMUNICATIONS ANALYSTS'
                  '120'='(120) ACTUARIES' '121'='(121) MATHEMATICIANS'
                  '122'='(122) OPERATIONS RESEARCH ANALYSTS' '123'='(123) STATISTICIANS'
                  '124'='(124) MISCELLANEOUS MATHEMATICAL SCIENTISTS AND TECHNICIANS'
                  '130'='(130) ARCHITECTS, EXCEPT NAVAL'
                  '131'='(131) SURVEYORS, CARTOGRAPHERS, AND PHOTOGRAMMETRISTS'
                  '132'='(132) AEROSPACE ENGINEERS' '133'='(133) AGRICULTURAL ENGINEERS'
                  '134'='(134) BIOMEDICAL ENGINEERS' '135'='(135) CHEMICAL ENGINEERS'
                  '136'='(136) CIVIL ENGINEERS' '140'='(140) COMPUTER HARDWARE ENGINEERS'
                  '141'='(141) ELECTRICAL AND ELECTRONICS ENGINEERS'
                  '142'='(142) ENVIRONMENTAL ENGINEERS'
                  '143'='(143) INDUSTRIAL ENGINEERS, INCLUDING HEALTH AND SAFETY'
                  '144'='(144) MARINE ENGINEERS AND NAVAL ARCHITECTS'
                  '145'='(145) MATERIALS ENGINEERS' '146'='(146) MECHANICAL ENGINEERS'
                  '150'='(150) MINING AND GEOLOGICAL ENGINEERS, INCLUDING MINING SAFETY ENG'
                  '151'='(151) NUCLEAR ENGINEERS' '152'='(152) PETROLEUM ENGINEERS'
                  '153'='(153) ENGINEERS, ALL OTHER' '154'='(154) DRAFTERS'
                  '155'='(155) ENGINEERING TECHNICIANS, EXCEPT DRAFTERS'
                  '156'='(156) SURVEYING AND MAPPING TECHNICIANS'
                  '160'='(160) AGRICULTURAL AND FOOD SCIENTISTS'
                  '161'='(161) BIOLOGICAL SCIENTISTS'
                  '164'='(164) CONSERVATION SCIENTISTS AND FORESTERS'
                  '165'='(165) MEDICAL SCIENTISTS'
                  '170'='(170) ASTRONOMERS AND PHYSICISTS'
                  '171'='(171) ATMOSPHERIC AND SPACE SCIENTISTS'
                  '172'='(172) CHEMISTS AND MATERIALS SCIENTISTS'
                  '174'='(174) ENVIRONMENTAL SCIENTISTS AND GEOSCIENTISTS'
                  '176'='(176) PHYSICAL SCIENTISTS, ALL OTHER' '180'='(180) ECONOMISTS'
                  '181'='(181) MARKET AND SURVEY RESEARCHERS' '182'='(182) PSYCHOLOGISTS'
                  '183'='(183) SOCIOLOGISTS' '184'='(184) URBAN AND REGIONAL PLANNERS'
                  '186'='(186) MISCELLANEOUS SOCIAL SCIENTISTS AND RELATED WORKERS'
                  '190'='(190) AGRICULTURAL AND FOOD SCIENCE TECHNICIANS'
                  '191'='(191) BIOLOGICAL TECHNICIANS' '192'='(192) CHEMICAL TECHNICIANS'
                  '193'='(193) GEOLOGICAL AND PETROLEUM TECHNICIANS'
                  '194'='(194) NUCLEAR TECHNICIANS'
                  '196'='(196) OTHER LIFE, PHYSICAL, AND SOCIAL SCIENCE TECHNICIANS'
                  '200'='(200) COUNSELORS' '201'='(201) SOCIAL WORKERS'
                  '202'='(202) MISCELLANEOUS COMMUNITY AND SOCIAL SERVICE SPECIALISTS'
                  '204'='(204) CLERGY'
                  '205'='(205) DIRECTORS, RELIGIOUS ACTIVITIES AND EDUCATION'
                  '206'='(206) RELIGIOUS WORKERS, ALL OTHER' '210'='(210) LAWYERS'
                  '211'='(211) JUDGES, MAGISTRATES, AND OTHER JUDICIAL WORKERS'
                  '214'='(214) PARALEGALS AND LEGAL ASSISTANTS'
                  '215'='(215) MISCELLANEOUS LEGAL SUPPORT WORKERS'
                  '220'='(220) POSTSECONDARY TEACHERS'
                  '230'='(230) PRESCHOOL AND KINDERGARTEN TEACHERS'
                  '231'='(231) ELEMENTARY AND MIDDLE SCHOOL TEACHERS'
                  '232'='(232) SECONDARY SCHOOL TEACHERS'
                  '233'='(233) SPECIAL EDUCATION TEACHERS'
                  '234'='(234) OTHER TEACHERS AND INSTRUCTORS'
                  '240'='(240) ARCHIVISTS, CURATORS, AND MUSEUM TECHNICIANS'
                  '243'='(243) LIBRARIANS' '244'='(244) LIBRARY TECHNICIANS'
                  '254'='(254) TEACHER ASSISTANTS'
                  '255'='(255) OTHER EDUCATION, TRAINING, AND LIBRARY WORKERS'
                  '260'='(260) ARTISTS AND RELATED WORKERS' '263'='(263) DESIGNERS'
                  '270'='(270) ACTORS' '271'='(271) PRODUCERS AND DIRECTORS'
                  '272'='(272) ATHLETES, COACHES, UMPIRES, AND RELATED WORKERS'
                  '274'='(274) DANCERS AND CHOREOGRAPHERS'
                  '275'='(275) MUSICIANS, SINGERS, AND RELATED WORKERS'
                  '276'='(276) ENTERTAINERS AND PERFORMERS, SPORTS AND RELATED WORKERS, ALL'
                  '280'='(280) ANNOUNCERS'
                  '281'='(281) NEWS ANALYSTS, REPORTERS AND CORRESPONDENTS'
                  '282'='(282) PUBLIC RELATIONS SPECIALISTS' '283'='(283) EDITORS'
                  '284'='(284) TECHNICAL WRITERS' '285'='(285) WRITERS AND AUTHORS'
                  '286'='(286) MISCELLANEOUS MEDIA AND COMMUNICATION WORKERS'
                  '290'='(290) BROADCAST AND SOUND ENGINEERING TECHNICIANS AND RADIO OPERAT'
                  '291'='(291) PHOTOGRAPHERS'
                  '292'='(292) TELEVISION, VIDEO, AND MOTION PICTURE CAMERA OPERATORS AND E'
                  '296'='(296) MEDIA AND COMMUNICATION EQUIPMENT WORKERS, ALL OTHER'
                  '300'='(300) CHIROPRACTORS' '301'='(301) DENTISTS'
                  '303'='(303) DIETICIANS AND NUTRITIONISTS' '304'='(304) OPTOMETRISTS'
                  '305'='(305) PHARMACISTS' '306'='(306) PHYSICIANS AND SURGEONS'
                  '311'='(311) PHYSICIAN ASSISTANTS' '312'='(312) PODIATRISTS'
                  '313'='(313) REGISTERED NURSES' '314'='(314) AUDIOLOGISTS'
                  '315'='(315) OCCUPATIONAL THERAPISTS' '316'='(316) PHYSICAL THERAPISTS'
                  '320'='(320) RADIATION THERAPISTS'
                  '321'='(321) RECREATIONAL THERAPISTS'
                  '322'='(322) RESPIRATORY THERAPISTS'
                  '323'='(323) SPEECH-LANGUAGE PATHOLOGISTS'
                  '324'='(324) THERAPISTS, ALL OTHER' '325'='(325) VETERINARIANS'
                  '326'='(326) HEALTH DIAGNOSING AND TREATING PRACTITIONERS, ALL OTHER'
                  '330'='(330) CLINICAL LABORATORY TECHNOLOGISTS AND TECHNICIANS'
                  '331'='(331) DENTAL HYGIENISTS'
                  '332'='(332) DIAGNOSTIC RELATED TECHNOLOGISTS AND TECHNICIANS'
                  '340'='(340) EMERGENCY MEDICAL TECHNICIANS AND PARAMEDICS'
                  '341'='(341) HEALTH DIAGNOSING AND TREATING PRACTITIONER SUPPORT TECHNICI'
                  '350'='(350) LICENSED PRACTICAL AND LICENSED VOCATIONAL NURSES'
                  '351'='(351) MEDICAL RECORDS AND HEALTH INFORMATION TECHNICIANS'
                  '352'='(352) OPTICIANS, DISPENSING'
                  '353'='(353) MISCELLANEOUS HEALTH TECHNOLOGISTS AND TECHNICIANS'
                  '354'='(354) OTHER HEALTHCARE PRACTITIONERS AND TECHNICAL OCCUPATIONS'
                  '360'='(360) NURSING, PSYCHIATRIC, AND HOME HEALTH AIDES'
                  '361'='(361) OCCUPATIONAL THERAPIST ASSISTANTS AND AIDES'
                  '362'='(362) PHYSICAL THERAPIST ASSISTANTS AND AIDES'
                  '363'='(363) MASSAGE THERAPISTS' '364'='(364) DENTAL ASSISTANTS'
                  '365'='(365) MEDICAL ASSISTANTS AND OTHER HEALTHCARE SUPPORT OCCUPATIONS'
                  '370'='(370) FIRST-LINE SUPERVISORS/MANAGERS OF CORRECTIONAL OFFICERS'
                  '371'='(371) FIRST-LINE SUPERVISORS/MANAGERS OF POLICE AND DETECTIVES'
                  '372'='(372) FIRST-LINE SUPERVISORS/MANAGERS OF FIRE FIGHTING AND PREVENT'
                  '373'='(373) SUPERVISORS, PROTECTIVE SERVICE WORKERS, ALL OTHER'
                  '374'='(374) FIRE FIGHTERS' '375'='(375) FIRE INSPECTORS'
                  '380'='(380) BAILIFFS, CORRECTIONAL OFFICERS, AND JAILERS'
                  '382'='(382) DETECTIVES AND CRIMINAL INVESTIGATORS'
                  '383'='(383) FISH AND GAME WARDENS'
                  '384'='(384) PARKING ENFORCEMENT WORKERS'
                  '385'='(385) POLICE AND SHERIFFS PATROL OFFICERS'
                  '386'='(386) TRANSIT AND RAILROAD POLICE'
                  '390'='(390) ANIMAL CONTROL WORKERS'
                  '391'='(391) PRIVATE DETECTIVES AND INVESTIGATORS'
                  '392'='(392) SECURITY GUARDS AND GAMING SURVEILLANCE OFFICERS'
                  '394'='(394) CROSSING GUARDS'
                  '395'='(395) LIFEGUARDS AND OTHER PROTECTIVE SERVICE WORKERS'
                  '400'='(400) CHEFS AND HEAD COOKS'
                  '401'='(401) FIRST-LINE SUPERVISORS/MANAGERS OF FOOD PREPARATION AND SERV'
                  '402'='(402) COOKS' '403'='(403) FOOD PREPARATION WORKERS'
                  '404'='(404) BARTENDERS'
                  '405'='(405) COMBINED FOOD PREPARATION AND SERVING WORKERS, INCLUDING FAS'
                  '406'='(406) COUNTER ATTENDANT, CAFETERIA, FOOD CONCESSION, AND COFFEE SH'
                  '411'='(411) WAITERS AND WAITRESSES'
                  '412'='(412) FOOD SERVERS, NONRESTAURANT'
                  '413'='(413) DINING ROOM AND CAFETERIA ATTENDANTS AND BARTENDER HELPERS'
                  '414'='(414) DISHWASHERS'
                  '415'='(415) HOST AND HOSTESSES, RESTAURANT, LOUNGE, AND COFFEE SHOP'
                  '416'='(416) FOOD PREPARATION AND SERVING RELATED WORKERS, ALL OTHER'
                  '420'='(420) FIRST-LINE SUPERVISORS/MANAGERS OF HOUSEKEEPING AND JANITORI'
                  '421'='(421) FIRST-LINE SUPERVISORS/MANAGERS OF LANDSCAPING, LAWN SERVICE'
                  '422'='(422) JANITORS AND BUILDING CLEANERS'
                  '423'='(423) MAIDS AND HOUSEKEEPING CLEANERS'
                  '424'='(424) PEST CONTROL WORKERS'
                  '425'='(425) GROUNDS MAINTENANCE WORKERS'
                  '430'='(430) FIRST-LINE SUPERVISORS/MANAGERS OF GAMING WORKERS'
                  '432'='(432) FIRST-LINE SUPERVISORS/MANAGERS OF PERSONAL SERVICE WORKERS'
                  '434'='(434) ANIMAL TRAINERS' '435'='(435) NONFARM ANIMAL CARETAKERS'
                  '440'='(440) GAMING SERVICES WORKERS'
                  '441'='(441) MOTION PICTURE PROJECTIONISTS'
                  '442'='(442) USHERS, LOBBY ATTENDANTS, AND TICKET TAKERS'
                  '443'='(443) MISCELLANEOUS ENTERTAINMENT ATTENDANTS AND RELATED WORKERS'
                  '446'='(446) FUNERAL SERVICE WORKERS' '450'='(450) BARBERS'
                  '451'='(451) HAIRDRESSERS, HAIRSTYLISTS, AND COSMETOLOGISTS'
                  '452'='(452) MISCELLANEOUS PERSONAL APPEARANCE WORKERS'
                  '453'='(453) BAGGAGE PORTERS, BELLHOPS, AND CONCIERGES'
                  '454'='(454) TOUR AND TRAVEL GUIDES'
                  '455'='(455) TRANSPORTATION ATTENDANTS'
                  '460'='(460) CHILD CARE WORKERS'
                  '461'='(461) PERSONAL AND HOME CARE AIDES'
                  '462'='(462) RECREATION AND FITNESS WORKERS'
                  '464'='(464) RESIDENTIAL ADVISORS'
                  '465'='(465) PERSONAL CARE AND SERVICE WORKERS, ALL OTHER'
                  '470'='(470) FIRST-LINE SUPERVISORS/MANAGERS OF RETAIL SALES WORKERS'
                  '471'='(471) FIRST-LINE SUPERVISORS/MANAGERS OF NON-RETAIL SALES'
                  '472'='(472) CASHIERS' '474'='(474) COUNTER AND RENTAL CLERKS'
                  '475'='(475) PARTS SALESPERSONS' '476'='(476) RETAIL SALESPERSONS'
                  '480'='(480) ADVERTISING SALES AGENTS'
                  '481'='(481) INSURANCE SALES AGENTS'
                  '482'='(482) SECURITIES, COMMODITIES, AND FINANCIAL SERVICES SALES AGENTS'
                  '483'='(483) TRAVEL AGENTS'
                  '484'='(484) SALES REPRESENTATIVES, SERVICES, ALL OTHER'
                  '485'='(485) SALES REPRESENTATIVES, WHOLESALE AND MANUFACTURING'
                  '490'='(490) MODELS, DEMONSTRATORS, AND PRODUCT PROMOTERS'
                  '492'='(492) REAL ESTATE BROKERS AND SALES AGENTS'
                  '493'='(493) SALES ENGINEERS' '494'='(494) TELEMARKETERS'
                  '495'='(495) DOOR-TO-DOOR SALES WORKERS, NEWS AND STREET VENDORS, AND REL'
                  '496'='(496) SALES AND RELATED WORKERS, ALL OTHER'
                  '500'='(500) FIRST-LINE SUPERVISORS/MANAGERS OF OFFICE AND ADMINISTRATIVE'
                  '501'='(501) SWITCHBOARD OPERATORS, INCLUDING ANSWERING SERVICE'
                  '502'='(502) TELEPHONE OPERATORS'
                  '503'='(503) COMMUNICATIONS EQUIPMENT OPERATORS, ALL OTHER'
                  '510'='(510) BILL AND ACCOUNT COLLECTORS'
                  '511'='(511) BILLING AND POSTING CLERKS AND MACHINE OPERATORS'
                  '512'='(512) BOOKKEEPING, ACCOUNTING, AND AUDITING CLERKS'
                  '513'='(513) GAMING CAGE WORKERS'
                  '514'='(514) PAYROLL AND TIMEKEEPING CLERKS'
                  '515'='(515) PROCUREMENT CLERKS' '516'='(516) TELLERS'
                  '520'='(520) BROKERAGE CLERKS' '521'='(521) CORRESPONDENCE CLERKS'
                  '522'='(522) COURT, MUNICIPAL, AND LICENSE CLERKS'
                  '523'='(523) CREDIT AUTHORIZERS, CHECKERS, AND CLERKS'
                  '524'='(524) CUSTOMER SERVICE REPRESENTATIVES'
                  '525'='(525) ELIGIBILITY INTERVIEWERS, GOVERNMENT PROGRAMS'
                  '526'='(526) FILE CLERKS'
                  '530'='(530) HOTEL, MOTEL, AND RESORT DESK CLERKS'
                  '531'='(531) INTERVIEWERS, EXCEPT ELIGIBILITY AND LOAN'
                  '532'='(532) LIBRARY ASSISTANTS, CLERICAL'
                  '533'='(533) LOAN INTERVIEWERS AND CLERKS'
                  '534'='(534) NEW ACCOUNT CLERKS' '535'='(535) ORDER CLERKS'
                  '536'='(536) HUMAN RESOURCES ASSISTANTS, EXCEPT PAYROLL AND TIMEKEEPING'
                  '540'='(540) RECEPTIONISTS AND INFORMATION CLERKS'
                  '541'='(541) RESERVATION AND TRANSPORTATION TICKET AGENTS AND TRAVEL CLER'
                  '542'='(542) INFORMATION AND RECORD CLERKS, ALL OTHER'
                  '550'='(550) CARGO AND FREIGHT AGENTS'
                  '551'='(551) COURIERS AND MESSENGERS' '552'='(552) DISPATCHERS'
                  '553'='(553) METER READERS, UTILITIES'
                  '554'='(554) POSTAL SERVICE CLERKS'
                  '555'='(555) POSTAL SERVICE MAIL CARRIERS'
                  '556'='(556) POSTAL SERVICE MAIL SORTERS, PROCESSORS, AND PROCESSING MACH'
                  '560'='(560) PRODUCTION, PLANNING, AND EXPEDITING CLERKS'
                  '561'='(561) SHIPPING, RECEIVING, AND TRAFFIC CLERKS'
                  '562'='(562) STOCK CLERKS AND ORDER FILLERS'
                  '563'='(563) WEIGHERS, MEASURERS, CHECKERS, AND SAMPLERS, RECORDKEEPING'
                  '570'='(570) SECRETARIES AND ADMINISTRATIVE ASSISTANTS'
                  '580'='(580) COMPUTER OPERATORS' '581'='(581) DATA ENTRY KEYERS'
                  '582'='(582) WORD PROCESSORS AND TYPISTS'
                  '583'='(583) DESKTOP PUBLISHERS'
                  '584'='(584) INSURANCE CLAIMS AND POLICY PROCESSING CLERKS'
                  '585'='(585) MAIL CLERKS AND MAIL MACHINE OPERATORS, EXCEPT POSTAL SERVIC'
                  '586'='(586) OFFICE CLERKS, GENERAL'
                  '590'='(590) OFFICE MACHINE OPERATORS, EXCEPT COMPUTER'
                  '591'='(591) PROOFREADERS AND COPY MARKERS'
                  '592'='(592) STATISTICAL ASSISTANTS'
                  '593'='(593) OFFICE AND ADMINISTRATIVE SUPPORT WORKERS, ALL OTHER'
                  '600'='(600) FIRST-LINE SUPERVISORS/MANAGERS/CONTRACTORS OF FARMING, FISH'
                  '601'='(601) AGRICULTURAL INSPECTORS' '602'='(602) ANIMAL BREEDERS'
                  '604'='(604) GRADERS AND SORTERS, AGRICULTURAL PRODUCTS'
                  '605'='(605) OTHER AGRICULTURAL WORKERS'
                  '610'='(610) FISHERS AND RELATED FISHING WORKERS'
                  '611'='(611) HUNTERS AND TRAPPERS'
                  '612'='(612) FOREST AND CONSERVATION WORKERS'
                  '613'='(613) LOGGING WORKERS'
                  '620'='(620) FIRST-LINE SUPERVISORS/MANAGERS OF CONSTRUCTION TRADES AND E'
                  '621'='(621) BOILERMAKERS'
                  '622'='(622) BRICKMASONS, BLOCKMASONS, AND STONEMASONS'
                  '623'='(623) CARPENTERS'
                  '624'='(624) CARPET, FLOOR, AND TILE INSTALLERS AND FINISHERS'
                  '625'='(625) CEMENT MASONS, CONCRETE FINISHERS, AND TERRAZZO WORKERS'
                  '626'='(626) CONSTRUCTION LABORERS'
                  '630'='(630) PAVING, SURFACING, AND TAMPING EQUIPMENT OPERATORS'
                  '631'='(631) PILE-DRIVER OPERATORS'
                  '632'='(632) OPERATING ENGINEERS AND OTHER CONSTRUCTION EQUIPMENT OPERATO'
                  '633'='(633) DRYWALL INSTALLERS, CEILING TILE INSTALLERS, AND TAPERS'
                  '635'='(635) ELECTRICIANS' '636'='(636) GLAZIERS'
                  '640'='(640) INSULATION WORKERS'
                  '642'='(642) PAINTERS, CONSTRUCTION AND MAINTENANCE'
                  '643'='(643) PAPERHANGERS'
                  '644'='(644) PIPELAYERS, PLUMBERS, PIPEFITTERS, AND STEAMFITTERS'
                  '646'='(646) PLASTERERS AND STUCCO MASONS'
                  '650'='(650) REINFORCING IRON AND REBAR WORKERS' '651'='(651) ROOFERS'
                  '652'='(652) SHEET METAL WORKERS'
                  '653'='(653) STRUCTURAL IRON AND STEEL WORKERS'
                  '660'='(660) HELPERS, CONSTRUCTION TRADES'
                  '666'='(666) CONSTRUCTION AND BUILDING INSPECTORS'
                  '670'='(670) ELEVATOR INSTALLERS AND REPAIRERS'
                  '671'='(671) FENCE ERECTORS'
                  '672'='(672) HAZARDOUS MATERIALS REMOVAL WORKERS'
                  '673'='(673) HIGHWAY MAINTENANCE WORKERS'
                  '674'='(674) RAIL-TRACK LAYING AND MAINTENANCE EQUIPMENT OPERATORS'
                  '675'='(675) SEPTIC TANK SERVICERS AND SEWER PIPE CLEANERS'
                  '676'='(676) MISCELLANEOUS CONSTRUCTION AND RELATED WORKERS'
                  '680'='(680) DERRICK, ROTARY DRILL, AND SERVICE UNIT OPERATORS, OIL, GAS,'
                  '682'='(682) EARTH DRILLERS, EXCEPT OIL AND GAR'
                  '683'='(683) EXPLOSIVES WORKERS, ORDNANCE HANDLING EXPERTS, AND BLASTERS'
                  '684'='(684) MINING MACHINE OPERATORS'
                  '691'='(691) ROOF BOLTERS, MINING'
                  '692'='(692) ROUSTABOUTS, OIL AND GAS'
                  '693'='(693) HELPERS--EXTRACTION WORKERS'
                  '694'='(694) OTHER EXTRACTION WORKERS'
                  '700'='(700) FIRST-LINE SUPERVISORS/MANAGERS OF MECHANICS, INSTALLERS, AN'
                  '701'='(701) COMPUTER, AUTOMATED TELLER, AND OFFICE MACHINE REPAIRERS'
                  '702'='(702) RADIO AND TELECOMMUNICATIONS EQUIPMENT INSTALLERS AND REPAIR'
                  '703'='(703) AVIONICS TECHNICIANS'
                  '704'='(704) ELECTRIC MOTOR, POWER TOOL, AND RELATED REPAIRERS'
                  '705'='(705) ELECTRICAL AND ELECTRONICS INSTALLERS AND REPAIRERS, TRANSPO'
                  '710'='(710) ELECTRICAL AND ELECTRONICS REPAIRERS, INDUSTRIAL AND UTILITY'
                  '711'='(711) ELECTRONIC EQUIPMENT INSTALLERS AND REPAIRERS, MOTOR VEHICLE'
                  '712'='(712) ELECTRONIC HOME ENTERTAINMENT EQUIPMENT INSTALLERS AND REPAI'
                  '713'='(713) SECURITY AND FIRE ALARM SYSTEMS INSTALLERS'
                  '714'='(714) AIRCRAFT MECHANICS AND SERVICE TECHNICIANS'
                  '715'='(715) AUTOMOTIVE BODY AND RELATED REPAIRERS'
                  '716'='(716) AUTOMOTIVE GLASS INSTALLERS AND REPAIRERS'
                  '720'='(720) AUTOMOTIVE SERVICE TECHNICIANS AND MECHANICS'
                  '721'='(721) BUS AND TRUCK MECHANICS AND DIESEL ENGINE SPECIALISTS'
                  '722'='(722) HEAVY VEHICLE AND MOBILE EQUIPMENT SERVICE TECHNICIANS AND M'
                  '724'='(724) SMALL ENGINE MECHANICS'
                  '726'='(726) MISCELLANEOUS VEHICLE AND MOBILE EQUIPMENT MECHANICS, INSTAL'
                  '730'='(730) CONTROL AND VALVE INSTALLERS AND REPAIRERS'
                  '731'='(731) HEATING, AIR CONDITIONING, AND REFRIGERATION MECHANICS AND I'
                  '732'='(732) HOME APPLIANCE REPAIRERS'
                  '733'='(733) INDUSTRIAL AND REFRACTORY MACHINERY MECHANICS'
                  '734'='(734) MAINTENANCE AND REPAIR WORKERS, GENERAL'
                  '735'='(735) MAINTENANCE WORKERS, MACHINERY' '736'='(736) MILLWRIGHTS'
                  '741'='(741) ELECTRICAL POWER-LINE INSTALLERS AND REPAIRERS'
                  '742'='(742) TELECOMMUNICATIONS LINE INSTALLERS AND REPAIRERS'
                  '743'='(743) PRECISION INSTRUMENT AND EQUIPMENT REPAIRERS'
                  '751'='(751) COIN, VENDING, AND AMUSEMENT MACHINE SERVICERS AND REPAIRERS'
                  '752'='(752) COMMERCIAL DIVERS'
                  '754'='(754) LOCKSMITHS AND SAFE REPAIRERS'
                  '755'='(755) MANUFACTURED BUILDING AND MOBILE HOME INSTALLERS'
                  '756'='(756) RIGGERS' '760'='(760) SIGNAL AND TRACK SWITCH REPAIRERS'
                  '761'='(761) HELPERS--INSTALLATION, MAINTENANCE, AND REPAIR WORKERS'
                  '762'='(762) OTHER INSTALLATION, MAINTENANCE, AND REPAIR WORKERS'
                  '770'='(770) FIRST-LINE SUPERVISORS/MANAGERS OF PRODUCTION AND OPERATING'
                  '771'='(771) AIRCRAFT STRUCTURE, SURFACES, RIGGING, AND SYSTEMS ASSEMBLER'
                  '772'='(772) ELECTRICAL, ELECTRONICS, AND ELECTROMECHANICAL ASSEMBLERS'
                  '773'='(773) ENGINE AND OTHER MACHINE ASSEMBLERS'
                  '774'='(774) STRUCTURAL METAL FABRICATORS AND FITTERS'
                  '775'='(775) MISCELLANEOUS ASSEMBLERS AND FABRICATORS'
                  '780'='(780) BAKERS'
                  '781'='(781) BUTCHERS AND OTHER MEAT, POULTRY, AND FISH PROCESSING WORKER'
                  '783'='(783) FOOD AND TOBACCO ROASTING, BAKING, AND DRYING MACHINE OPERAT'
                  '784'='(784) FOOD BATCHMAKERS'
                  '785'='(785) FOOD COOKING MACHINE OPERATORS AND TENDERS'
                  '790'='(790) COMPUTER CONTROL PROGRAMMERS AND OPERATORS'
                  '792'='(792) EXTRUDING AND DRAWING MACHINE SETTERS, OPERATORS, AND TENDER'
                  '793'='(793) FORGING MACHINE SETTERS, OPERATORS, AND TENDERS, METAL AND P'
                  '794'='(794) ROLLING MACHINE SETTERS, OPERATORS, AND TENDERS, METAL AND P'
                  '795'='(795) CUTTING, PUNCHING, AND PRESS MACHINE SETTERS, OPERATORS, AND'
                  '796'='(796) DRILLING AND BORING MACHINE TOOL SETTERS, OPERATORS, AND TEN'
                  '800'='(800) GRINDING, LAPPING, POLISHING, AND BUFFING MACHINE TOOL SETTE'
                  '801'='(801) LATHE AND TURNING MACHINE TOOL SETTERS, OPERATORS, AND TENDE'
                  '802'='(802) MILLING AND PLANING MACHINE SETTERS, OPERATORS, AND TENDERS,'
                  '803'='(803) MACHINISTS'
                  '804'='(804) METAL FURNACE AND KILN OPERATORS AND TENDERS'
                  '806'='(806) MODEL MAKERS AND PATTERNMAKERS, METAL AND PLASTIC'
                  '810'='(810) MOLDERS AND MOLDING MACHINE SETTERS, OPERATORS, AND TENDERS,'
                  '812'='(812) MULTIPLE MACHINE TOOL SETTERS, OPERATORS, AND TENDERS, METAL'
                  '813'='(813) TOOL AND DIE MAKERS'
                  '814'='(814) WELDING, SOLDERING, AND BRAZING WORKERS'
                  '815'='(815) HEAT TREATING EQUIPMENT SETTERS, OPERATORS, AND TENDERS, MET'
                  '816'='(816) LAY-OUT WORKERS, METAL AND PLASTIC'
                  '820'='(820) PLATING AND COATING MACHINE SETTERS, OPERATORS, AND TENDERS,'
                  '821'='(821) TOOL GRINDERS, FILERS, AND SHARPENERS'
                  '822'='(822) METALWORKERS AND PLASTIC WORKERS, ALL OTHER'
                  '823'='(823) BOOKBINDERS AND BINDERY WORKERS'
                  '824'='(824) JOB PRINTERS'
                  '825'='(825) PREPRESS TECHNICIANS AND WORKERS'
                  '826'='(826) PRINTING MACHINE OPERATORS'
                  '830'='(830) LAUNDRY AND DRY-CLEANING WORKERS'
                  '831'='(831) PRESSERS, TEXTILE, GARMENT, AND RELATED MATERIALS'
                  '832'='(832) SEWING MACHINE OPERATORS'
                  '833'='(833) SHOE AND LEATHER WORKERS AND REPAIRERS'
                  '834'='(834) SHOE MACHINE OPERATORS AND TENDERS'
                  '835'='(835) TAILORS, DRESSMAKERS, AND SEWERS'
                  '836'='(836) TEXTILE BLEACHING AND DYEING MACHINE OPERATORS AND TENDERS'
                  '840'='(840) TEXTILE CUTTING MACHINE SETTERS, OPERATORS, AND TENDERS'
                  '841'='(841) TEXTILE KNITTING AND WEAVING MACHINE SETTERS, OPERATORS, AND'
                  '842'='(842) TEXTILE WINDING, TWISTING, AND DRAWING OUT MACHINE SETTERS,'
                  '843'='(843) EXTRUDING AND FORMING MACHINE SETTERS, OPERATORS, AND TENDER'
                  '844'='(844) FABRIC AND APPAREL PATTERNMAKERS'
                  '845'='(845) UPHOLSTERERS'
                  '846'='(846) TEXTILE, APPAREL, AND FURNISHINGS WORKERS, ALL OTHER'
                  '850'='(850) CABINETMAKERS AND BENCH CARPENTERS'
                  '851'='(851) FURNITURE FINISHERS'
                  '852'='(852) MODEL MAKERS AND PATTERNMAKERS, WOOD'
                  '853'='(853) SAWING MACHINE SETTERS, OPERATORS, AND TENDERS, WOOD'
                  '854'='(854) WOODWORKING MACHINE SETTERS, OPERATORS, AND TENDERS, EXCEPT'
                  '855'='(855) WOODWORKERS, ALL OTHER'
                  '860'='(860) POWER PLANT OPERATORS, DISTRIBUTORS, AND DISPATCHERS'
                  '861'='(861) STATIONARY ENGINEERS AND BOILER OPERATORS'
                  '862'='(862) WATER AND LIQUID WASTE TREATMENT PLANT AND SYSTEM OPERATORS'
                  '863'='(863) MISCELLANEOUS PLANT AND SYSTEM OPERATORS'
                  '864'='(864) CHEMICAL PROCESSING MACHINE SETTERS, OPERATORS, AND TENDERS'
                  '865'='(865) CRUSHING, GRINDING, POLISHING, MIXING, AND BLENDING WORKERS'
                  '871'='(871) CUTTING WORKERS'
                  '872'='(872) EXTRUDING, FORMING, PRESSING, AND COMPACTING MACHINE SETTERS'
                  '873'='(873) FURNACE, KILN, OVEN, DRIER, AND KETTLE OPERATORS AND TENDERS'
                  '874'='(874) INSPECTORS, TESTERS, SORTERS, SAMPLERS, AND WEIGHERS'
                  '875'='(875) JEWELERS AND PRECIOUS STONE AND METAL WORKERS'
                  '876'='(876) MEDICAL, DENTAL, AND OPHTHALMIC LABORATORY TECHNICIANS'
                  '880'='(880) PACKAGING AND FILLING MACHINE OPERATORS AND TENDERS'
                  '881'='(881) PAINTING WORKERS'
                  '883'='(883) PHOTOGRAPHIC PROCESS WORKERS AND PROCESSING MACHINE OPERATOR'
                  '884'='(884) SEMICONDUCTOR PROCESSORS'
                  '885'='(885) CEMENTING AND GLUING MACHINE OPERATORS AND TENDERS'
                  '886'='(886) CLEANING, WASHING, AND METAL PICKLING EQUIPMENT OPERATORS AN'
                  '890'='(890) COOLING AND FREEZING EQUIPMENT OPERATORS AND TENDERS'
                  '891'='(891) ETCHERS AND ENGRAVERS'
                  '892'='(892) MOLDERS, SHAPERS, AND CASTERS, EXCEPT METAL AND PLASTIC'
                  '893'='(893) PAPER GOODS MACHINE SETTERS, OPERATORS, AND TENDERS'
                  '894'='(894) TIRE BUILDERS' '895'='(895) HELPERS--PRODUCTION WORKERS'
                  '896'='(896) PRODUCTION WORKERS, ALL OTHER'
                  '900'='(900) SUPERVISORS, TRANSPORTATION AND MATERIAL MOVING WORKERS'
                  '903'='(903) AIRCRAFT PILOTS AND FLIGHT ENGINEERS'
                  '904'='(904) AIR TRAFFIC CONTROLLERS AND AIRFIELD OPERATIONS SPECIALISTS'
                  '911'='(911) AMBULANCE DRIVERS AND ATTENDANTS, EXCEPT EMERGENCY MEDICAL T'
                  '912'='(912) BUS DRIVERS'
                  '913'='(913) DRIVER/SALES WORKERS AND TRUCK DRIVERS'
                  '914'='(914) TAXI DRIVERS AND CHAUFFEURS'
                  '915'='(915) MOTOR VEHICLE OPERATORS, ALL OTHER'
                  '920'='(920) LOCOMOTIVE ENGINEERS AND OPERATORS'
                  '923'='(923) RAILROAD BRAKE, SIGNAL, AND SWITCH OPERATORS'
                  '924'='(924) RAILROAD CONDUCTORS AND YARDMASTERS'
                  '926'='(926) SUBWAY, STREETCAR, AND OTHER RAIL TRANSPORTATION WORKERS'
                  '930'='(930) SAILORS AND MARINE OILERS'
                  '931'='(931) SHIP AND BOAT CAPTAINS AND OPERATORS'
                  '933'='(933) SHIP ENGINEERS' '934'='(934) BRIDGE AND LOCK TENDERS'
                  '935'='(935) PARKING LOT ATTENDANTS'
                  '936'='(936) SERVICE STATION ATTENDANTS'
                  '941'='(941) TRANSPORTATION INSPECTORS'
                  '942'='(942) OTHER TRANSPORTATION WORKERS'
                  '950'='(950) CONVEYOR OPERATORS AND TENDERS'
                  '951'='(951) CRANE AND TOWER OPERATORS'
                  '952'='(952) DREDGE, EXCAVATING, AND LOADING MACHINE OPERATORS'
                  '956'='(956) HOIST AND WINCH OPERATORS'
                  '960'='(960) INDUSTRIAL TRUCK AND TRACTOR OPERATORS'
                  '961'='(961) CLEANERS OF VEHICLES AND EQUIPMENT'
                  '962'='(962) LABORERS AND FREIGHT, STOCK, AND MATERIAL MOVERS, HAND'
                  '963'='(963) MACHINE FEEDERS AND OFF BEARERS'
                  '964'='(964) PACKERS AND PACKAGERS, HAND'
                  '965'='(965) PUMPING STATION OPERATORS'
                  '972'='(972) REFUSE AND RECYCLABLE MATERIAL COLLECTORS'
                  '973'='(973) SHUTTLE CAR OPERATORS'
                  '974'='(974) TANK CAR, TRUCK, AND SHIP LOADERS'
                  '975'='(975) MATERIAL MOVING WORKERS, ALL OTHER'
                  '980'='(980) MILITARY OFFICER SPECIAL AND TACTICAL OPERATIONS LEADERS/MAN'
                  '981'='(981) FIRST-LINE ENLISTED MILITARY SUPERVISORS/MANAGERS'
                  '982'='(982) MILITARY ENLISTED TACTICAL OPERATIONS AND AIR/WEAPONS SPECIA'
                  '983'='(983) MILITARY, RANK NOT SPECIFIED (CENSUS ONLY)'
                  '999'='(999) DK NA DONT KNOW NOT ASCERTAINED' ;
  VALUE $D7fffff  '017'='(017) CROP PRODUCTION' '018'='(018) ANIMAL PRODUCTION'
                  '019'='(019) FORESTRY EXCEPT LOGGING' '027'='(027) LOGGING'
                  '028'='(028) FISHING, HUNTING, AND TRAPPING'
                  '029'='(029) SUPPORT ACTIVITIES FOR AGRICULTURE AND FORESTRY'
                  '037'='(037) OIL AND GAS EXTRACTION' '038'='(038) COAL MINING'
                  '039'='(039) METAL ORE MINING'
                  '047'='(047) NONMETALLIC MINERAL MINING AND QUARRYING'
                  '048'='(048) NOT SPECIFIED TYPE OF MINING'
                  '049'='(049) SUPPORT ACTIVITIES FOR MINING'
                  '057'='(057) ELECTRIC POWER GENERATION TRANSMISSION AND DISTRIBUTION'
                  '058'='(058) NATURAL GAS DISTRIBUTION'
                  '059'='(059) ELECTRIC AND GAS AND OTHER COMBINATIONS'
                  '067'='(067) WATER, STEAM, AIR-CONDITIONING, AND IRRIGATION SYSTEMS'
                  '068'='(068) SEWAGE TREATMENT FACILITIES'
                  '069'='(069) NOT SPECIFIED UTILITIES' '077'='(077) CONSTRUCTION'
                  '080'='(080) ACCOUNTANTS AND AUDITORS'
                  '107'='(107) ANIMAL FOOD, GRAIN, AND OILSEED MILLING'
                  '108'='(108) SUGAR AND CONFECTIONERY PRODUCTS'
                  '109'='(109) FRUIT AND VEGETABLE PRESERVING AND SPECIALTY FOOD MANUFACTUR'
                  '117'='(117) DAIRY PRODUCT MANUFACTURING'
                  '118'='(118) ANIMAL SLAUGHTERING AND PROCESSING'
                  '119'='(119) RETAIL BAKERIES' '127'='(127) BAKERIES EXCEPT RETAIL'
                  '128'='(128) SEAFOOD AND OTHER MISCELLANEOUS FOODS N.E.C.'
                  '129'='(129) NOT SPECIFIED FOOD INDUSTRIES'
                  '137'='(137) BEVERAGE MANUFACTURING'
                  '139'='(139) TOBACCO MANUFACTURING'
                  '147'='(147) FIBER, YARN, AND THREAD MILLS'
                  '148'='(148) FABRIC MILLS, EXCEPT KNITTING'
                  '149'='(149) TEXTILE AND FABRIC FINISHING AND COATING MILLS'
                  '157'='(157) CARPETS AND RUGS MANUFACTURING'
                  '159'='(159) TEXTILE PRODUCT MILLS EXCEPT CARPETS AND RUGS'
                  '167'='(167) KNITTING MILLS'
                  '168'='(168) CUT AND SEW APPAREL MANUFACTURING'
                  '169'='(169) APPAREL ACCESSORIES AND OTHER APPAREL MANUFACTURING'
                  '177'='(177) FOOTWEAR MANUFACTURING'
                  '179'='(179) LEATHER TANNING AND PRODUCTS, EXCEPT FOOTWEAR MANUFACTURING'
                  '187'='(187) PULP, PAPER, AND PAPERBOARD MILLS'
                  '188'='(188) PAPERBOARD CONTAINERS AND BOXES'
                  '189'='(189) MISCELLANEOUS PAPER AND PULP PRODUCTS'
                  '199'='(199) PRINTING AND RELATED SUPPORT ACTIVITIES'
                  '207'='(207) PETROLEUM REFINING'
                  '209'='(209) MISCELLANEOUS PETROLEUM AND COAL PRODUCTS'
                  '217'='(217) RESIN, SYNTHETIC RUBBER AND FIBERS, AND FILAMENTS MANUFACTUR'
                  '218'='(218) AGRICULTURAL CHEMICAL MANUFACTURING'
                  '219'='(219) PHARMACEUTICAL AND MEDICINE MANUFACTURING'
                  '227'='(227) PAINT, COATING, AND ADHESIVES MANUFACTURING'
                  '228'='(228) SOAP, CLEANING COMPOUND, AND COSMETIC MANUFACTURING'
                  '229'='(229) INDUSTRIAL AND MISCELLANEOUS CHEMICALS'
                  '237'='(237) PLASTICS PRODUCT MANUFACTURING'
                  '238'='(238) TIRE MANUFACTURING'
                  '239'='(239) RUBBER PRODUCTS, EXCEPT TIRES, MANUFACTURING'
                  '247'='(247) POTTERY, CERAMICS, AND RELATED PRODUCTS MANUFACTURING'
                  '248'='(248) STRUCTURAL CLAY PRODUCT MANUFACTURING'
                  '249'='(249) GLASS AND GLASS PRODUCT MANUFACTURING'
                  '257'='(257) CEMENT, CONCRETE, LIME, AND GYPSUM PRODUCT MANUFACTURING'
                  '259'='(259) MISCELLANEOUS NONMETALLIC MINERAL PRODUCT MANUFACTURING'
                  '267'='(267) IRON AND STEEL MILLS AND STEEL PRODUCT MANUFACTURING'
                  '268'='(268) ALUMINUM PRODUCTION AND PROCESSING'
                  '269'='(269) NONFERROUS METAL, EXCEPT ALUMINUM, PRODUCTION AND PROCESSING'
                  '277'='(277) FOUNDRIES' '278'='(278) METAL FORGINGS AND STAMPINGS'
                  '279'='(279) CUTLERY AND HAND TOOL MANUFACTURING'
                  '287'='(287) STRUCTURAL METALS AND TANK AND SHIPPING CONTAINER MANUFACTUR'
                  '288'='(288) MACHINE SHOPS TURNED PRODUCT SCREW NUT AND BOLT MANUFACTURIN'
                  '289'='(289) COATING, ENGRAVING, HEAT TREATING AND ALLIED ACTIVITIES'
                  '297'='(297) ORDNANCE'
                  '298'='(298) MISCELLANEOUS FABRICATED METAL PRODUCTS MANUFACTURING'
                  '299'='(299) NOT SPECIFIED METAL INDUSTRIES'
                  '307'='(307) AGRICULTURAL IMPLEMENT MANUFACTURING'
                  '308'='(308) CONSTRUCTION MINING AND OIL FIELD MACHINERY MANUFACTURING'
                  '309'='(309) COMMERCIAL AND SERVICE INDUSTRY MACHINERY MANUFACTURING'
                  '317'='(317) METALWORKING MACHINERY MANUFACTURING'
                  '318'='(318) ENGINES, TURBINES, AND POWER TRANSMISSION EQUIPMENT MANUFACT'
                  '319'='(319) MACHINERY MANUFACTURING, N.E.C.'
                  '329'='(329) NOT SPECIFIED MACHINERY MANUFACTURING'
                  '336'='(336) COMPUTER AND PERIPHERAL EQUIPMENT MANUFACTURING'
                  '337'='(337) COMMUNICATIONS, AUDIO, AND VIDEO EQUIPMENT MANUFACTURING'
                  '338'='(338) NAVIGATION, MEASURING, ELECTROMETRICAL, AND CONTROL INSTRUME'
                  '339'='(339) ELECTRONIC COMPONENT AND PRODUCT MANUFACTURING, N.E.C.'
                  '347'='(347) HOUSEHOLD APPLIANCE MANUFACTURING'
                  '349'='(349) ELECTRICAL MACHINERY, EQUIPMENT, AND SUPPLIES MANUFACTURING,'
                  '357'='(357) MOTOR VEHICLES AND MOTOR VEHICLE EQUIPMENT MANUFACTURING'
                  '358'='(358) AIRCRAFT AND PARTS MANUFACTURING'
                  '359'='(359) AEROSPACE PRODUCT AND PARTS MANUFACTURING'
                  '367'='(367) RAILROAD ROLLING STOCK MANUFACTURING'
                  '368'='(368) SHIP AND BOAT BUILDING'
                  '369'='(369) OTHER TRANSPORTATION EQUIPMENT MANUFACTURING'
                  '377'='(377) SAWMILLS AND WOOD PRESERVATION'
                  '378'='(378) VENEER, PLYWOOD, AND ENGINEERED WOOD PRODUCT MANUFACTURING'
                  '379'='(379) PREFABRICATED WOOD BUILDINGS AND MOBILE HOMES MANUFACTURING'
                  '387'='(387) MISCELLANEOUS WOOD PRODUCT MANUFACTURING'
                  '389'='(389) FURNITURE AND FIXTURES'
                  '396'='(396) MEDICAL EQUIPMENT AND SUPPLIES MANUFACTURING'
                  '397'='(397) TOYS, AMUSEMENT, AND SPORTING GOODS MANUFACTURING'
                  '398'='(398) MISCELLANEOUS MANUFACTURING, N.E.C.'
                  '399'='(399) NOT SPECIFIED MANUFACTURING INDUSTRIES'
                  '407'='(407) MOTOR VEHICLES, PARTS AND SUPPLIES WHOLESALERS'
                  '408'='(408) FURNITURE AND HOME FURNISHING WHOLESALERS'
                  '409'='(409) LUMBER AND OTHER CONSTRUCTION MATERIALS WHOLESALERS'
                  '417'='(417) PROFESSIONAL AND COMMERCIAL EQUIPMENT AND SUPPLIES WHOLESALE'
                  '418'='(418) METALS AND MINERALS, EXCEPT PETROLEUM, WHOLESALERS'
                  '419'='(419) ELECTRICAL GOODS WHOLESALERS'
                  '426'='(426) HARDWARE, PLUMBING AND HEATING EQUIPMENT, AND SUPPLIES WHOLE'
                  '427'='(427) MACHINERY, EQUIPMENT, AND SUPPLIES WHOLESALERS'
                  '428'='(428) RECYCLABLE MATERIAL WHOLESALERS'
                  '429'='(429) MISCELLANEOUS DURABLE GOODS WHOLESALERS'
                  '437'='(437) PAPER AND PAPER PRODUCT WHOLESALERS'
                  '438'='(438) DRUGS, SUNDRIES, AND CHEMICAL AND ALLIED PRODUCT WHOLESALERS'
                  '439'='(439) APPAREL, FABRICS, AND NOTIONS WHOLESALERS'
                  '447'='(447) GROCERIES AND RELATED PRODUCT WHOLESALERS'
                  '448'='(448) FARM PRODUCT RAW MATERIAL WHOLESALERS'
                  '449'='(449) PETROLEUM AND PETROLEUM PRODUCT WHOLESALERS'
                  '456'='(456) ALCOHOLIC BEVERAGE WHOLESALERS'
                  '457'='(457) FARM SUPPLIES WHOLESALERS'
                  '458'='(458) MISCELLANEOUS NONDURABLE GOODS WHOLESALERS'
                  '459'='(459) NOT SPECIFIED WHOLESALE TRADE'
                  '467'='(467) AUTOMOBILE DEALERS'
                  '468'='(468) OTHER MOTOR VEHICLE DEALERS'
                  '469'='(469) AUTO PARTS, ACCESSORIES, AND TIRE STORES'
                  '477'='(477) FURNITURE AND HOME FURNISHINGS STORES'
                  '478'='(478) HOUSEHOLD APPLIANCE STORES'
                  '479'='(479) RADIO, TV, AND COMPUTER STORES'
                  '487'='(487) BUILDING MATERIAL AND SUPPLIES DEALERS'
                  '488'='(488) HARDWARE STORES'
                  '489'='(489) LAWN AND GARDEN EQUIPMENT AND SUPPLIES STORES'
                  '497'='(497) GROCERY STORES' '498'='(498) SPECIALTY FOOD STORES'
                  '499'='(499) BEER, WINE, AND LIQUOR STORES'
                  '507'='(507) PHARMACIES AND DRUG STORES'
                  '508'='(508) HEALTH AND PERSONAL CARE, EXCEPT DRUG, STORES'
                  '509'='(509) GASOLINE STATIONS'
                  '517'='(517) CLOTHING AND ACCESSORIES, EXCEPT SHOE, STORES'
                  '518'='(518) SHOE STORES'
                  '519'='(519) JEWELRY, LUGGAGE, AND LEATHER GOODS STORES'
                  '527'='(527) SPORTING GOODS, CAMERA, AND HOBBY AND TOY STORES'
                  '528'='(528) SEWING, NEEDLEWORK AND PIECE GOODS STORES'
                  '529'='(529) MUSIC STORES' '537'='(537) BOOK STORES AND NEWS DEALERS'
                  '538'='(538) DEPARTMENT STORES'
                  '539'='(539) MISCELLANEOUS GENERAL MERCHANDISE STORES'
                  '547'='(547) RETAIL FLORISTS'
                  '548'='(548) OFFICE SUPPLIES AND STATIONARY STORES'
                  '549'='(549) USED MERCHANDISE STORES'
                  '557'='(557) GIFT, NOVELTY, AND SOUVENIR SHOPS'
                  '558'='(558) MISCELLANEOUS RETAIL STORES'
                  '559'='(559) ELECTRONIC SHOPPING AND MAIL-ORDER HOUSES'
                  '567'='(567) VENDING MACHINE OPERATORS' '568'='(568) FUEL DEALERS'
                  '569'='(569) OTHER DIRECT SELLING ESTABLISHMENTS'
                  '579'='(579) NOT SPECIFIED RETAIL TRADE'
                  '607'='(607) AIR TRANSPORTATION' '608'='(608) RAIL TRANSPORTATION'
                  '609'='(609) WATER TRANSPORTATION' '617'='(617) TRUCK TRANSPORTATION'
                  '618'='(618) BUS SERVICE AND URBAN TRANSIT'
                  '619'='(619) TAXI AND LIMOUSINE SERVICE'
                  '627'='(627) PIPELINE TRANSPORTATION'
                  '628'='(628) SCENIC AND SIGHTSEEING TRANSPORTATION'
                  '629'='(629) SERVICES INCIDENTAL TO TRANSPORTATION'
                  '637'='(637) POSTAL SERVICE' '638'='(638) COURIER AND MESSENGERS'
                  '639'='(639) WAREHOUSING AND STORAGE'
                  '647'='(647) NEWSPAPER PUBLISHERS'
                  '648'='(648) PUBLISHING EXCEPT NEWSPAPERS AND SOFTWARE'
                  '649'='(649) SOFTWARE PUBLISHING'
                  '657'='(657) MOTION PICTURES AND VIDEO INDUSTRIES'
                  '659'='(659) SOUND RECORDING INDUSTRIES'
                  '667'='(667) RADIO AND TELEVISION BROADCASTING AND CABLE'
                  '668'='(668) WIRED TELECOMMUNICATIONS CARRIERS'
                  '669'='(669) OTHER TELECOMMUNICATION SERVICES'
                  '677'='(677) LIBRARIES AND ARCHIVES'
                  '678'='(678) OTHER INFORMATION SERVICES'
                  '679'='(679) DATA PROCESSING SERVICES'
                  '687'='(687) BANKING AND RELATED ACTIVITIES'
                  '688'='(688) SAVINGS INSTITUTIONS, INCLUDING CREDIT UNIONS'
                  '689'='(689) NON-DEPOSITORY CREDIT AND RELATED ACTIVITIES'
                  '697'='(697) SECURITIES, COMMODITIES, FUNDS, TRUSTS, AND OTHER FINANCIAL'
                  '698'='(698) INSURANCE CARRIERS AND RELATED ACTIVITIES'
                  '699'='(699) GENERAL INSURANCE COMPANY' '707'='(707) REAL ESTATE'
                  '708'='(708) AUTOMOTIVE EQUIPMENT RENTAL AND LEASING'
                  '717'='(717) VIDEO TAPE AND DISK RENTAL'
                  '718'='(718) OTHER CONSUMER GOODS RENTAL'
                  '719'='(719) COMMERCIAL, INDUSTRIAL, AND OTHER INTANGIBLE ASSETS RENTAL A'
                  '727'='(727) LEGAL SERVICES'
                  '728'='(728) ACCOUNTING, TAX PREPARATION, BOOKKEEPING AND PAYROLL SERVICE'
                  '729'='(729) ARCHITECTURAL, ENGINEERING, AND RELATED SERVICES'
                  '737'='(737) SPECIALIZED DESIGN SERVICES'
                  '738'='(738) COMPUTER SYSTEMS DESIGN AND RELATED SERVICES'
                  '739'='(739) MANAGEMENT, SCIENTIFIC AND TECHNICAL CONSULTING SERVICES'
                  '746'='(746) SCIENTIFIC RESEARCH AND DEVELOPMENT SERVICES'
                  '747'='(747) ADVERTISING AND RELATED SERVICES'
                  '748'='(748) VETERINARY SERVICES'
                  '749'='(749) OTHER PROFESSIONAL, SCIENTIFIC AND TECHNICAL SERVICES'
                  '757'='(757) MANAGEMENT OF COMPANIES AND ENTERPRISES'
                  '758'='(758) EMPLOYMENT SERVICES'
                  '759'='(759) BUSINESS SUPPORT SERVICES'
                  '767'='(767) TRAVEL ARRANGEMENT AND RESERVATION SERVICES'
                  '768'='(768) INVESTIGATION AND SECURITY SERVICES'
                  '769'='(769) SERVICES TO BUILDINGS AND DWELLINGS'
                  '777'='(777) LANDSCAPING SERVICES'
                  '778'='(778) OTHER ADMINISTRATIVE AND OTHER SUPPORT SERVICES'
                  '779'='(779) WASTE MANAGEMENT AND REMEDIATION SERVICES'
                  '786'='(786) ELEMENTARY AND SECONDARY SCHOOLS'
                  '787'='(787) COLLEGES AND UNIVERSITIES, INCLUDING JUNIOR COLLEGES'
                  '788'='(788) BUSINESS, TECHNICAL, AND TRADE SCHOOLS AND TRAINING'
                  '789'='(789) OTHER SCHOOLS, INSTRUCTION, AND EDUCATIONAL SERVICES'
                  '797'='(797) OFFICES OF PHYSICIANS' '798'='(798) OFFICES OF DENTISTS'
                  '799'='(799) OFFICE OF CHIROPRACTORS'
                  '807'='(807) OFFICES OF OPTOMETRISTS'
                  '808'='(808) OFFICES OF OTHER HEALTH PRACTITIONERS'
                  '809'='(809) OUTPATIENT CARE CENTERS'
                  '817'='(817) HOME HEALTH CARE SERVICES'
                  '818'='(818) OTHER HEALTH CARE SERVICES' '819'='(819) HOSPITALS'
                  '827'='(827) NURSING CARE FACILITIES'
                  '829'='(829) RESIDENTIAL CARE FACILITIES, WITHOUT NURSING'
                  '837'='(837) INDIVIDUAL AND FAMILY SERVICES'
                  '838'='(838) COMMUNITY FOOD AND HOUSING, AND EMERGENCY SERVICES'
                  '839'='(839) VOCATIONAL REHABILITATION SERVICES'
                  '847'='(847) CHILD DAY CARE SERVICES'
                  '856'='(856) INDEPENDENT ARTISTS, PERFORMING ARTS, SPECTATOR SPORTS, AND'
                  '857'='(857) MUSEUMS, ART GALLERIES, HISTORICAL SITES, AND SIMILAR INSTIT'
                  '858'='(858) BOWLING CENTERS'
                  '859'='(859) OTHER AMUSEMENT, GAMBLING, AND RECREATION INDUSTRIES'
                  '862'='(862) WATER AND LIQUID WASTE TREATMENT PLANT AND SYSTEM OPERATORS'
                  '866'='(866) TRAVELER ACCOMMODATION'
                  '867'='(867) RECREATIONAL VEHICLE PARKS AND CAMPS, AND ROOMING AND BOARDI'
                  '868'='(868) RESTAURANTS AND OTHER FOOD SERVICES'
                  '869'='(869) DRINKING PLACES, ALCOHOLIC BEVERAGES'
                  '877'='(877) AUTOMOTIVE REPAIR AND MAINTENANCE'
                  '878'='(878) CAR WASHES'
                  '879'='(879) ELECTRONIC AND PRECISION EQUIPMENT REPAIR AND MAINTENANCE'
                  '887'='(887) COMMERCIAL AND INDUSTRIAL MACHINERY AND EQUIPMENT REPAIR AND'
                  '888'='(888) PERSONAL AND HOUSEHOLD GOODS REPAIR AND MAINTENANCE'
                  '889'='(889) FOOTWEAR AND LEATHER GOODS REPAIR'
                  '897'='(897) BARBER SHOPS' '898'='(898) BEAUTY SALONS'
                  '899'='(899) NAIL SALONS AND OTHER PERSONAL CARE SERVICES'
                  '907'='(907) DRY CLEANING AND LAUNDRY SERVICES'
                  '908'='(908) FUNERAL HOMES, CEMETERIES AND CREMATORIES'
                  '909'='(909) OTHER PERSONAL SERVICES'
                  '916'='(916) RELIGIOUS ORGANIZATIONS'
                  '917'='(917) CIVIC, SOCIAL, ADVOCACY ORGANIZATIONS, AND GRANTMAKING AND G'
                  '918'='(918) LABOR UNIONS'
                  '919'='(919) BUSINESS, PROFESSIONAL, POLITICAL, AND SIMILAR ORGANIZATIONS'
                  '929'='(929) PRIVATE HOUSEHOLDS'
                  '937'='(937) EXECUTIVE OFFICES AND LEGISLATIVE BODIES'
                  '938'='(938) PUBLIC FINANCE ACTIVITIES'
                  '939'='(939) OTHER GENERAL GOVERNMENT AND SUPPORT'
                  '947'='(947) JUSTICE, PUBLIC ORDER, AND SAFETY ACTIVITIES'
                  '948'='(948) ADMINISTRATION OF HUMAN RESOURCE PROGRAMS'
                  '949'='(949) ADMINISTRATION OF ENVIRONMENTAL QUALITY AND HOUSING PROGRAMS'
                  '957'='(957) ADMINISTRATION OF ECONOMIC PROGRAMS AND SPACE RESEARCH'
                  '959'='(959) NATIONAL SECURITY AND INTERNATIONAL AFFAIRS'
                  '967'='(967) U. S. ARMY' '968'='(968) U. S. AIR FORCE'
                  '969'='(969) U. S. NAVY' '977'='(977) U. S. MARINES'
                  '978'='(978) U. S. COAST GUARD'
                  '979'='(979) U. S. ARMED FORCES, BRANCH NOT SPECIFIED'
                  '987'='(987) MILITARY RESERVES OR NATIONAL GUARD'
                  '999'='(999) DK NA DONT KNOW NOT ASCERTAINED' ;
  VALUE D8ffffff  1='(1) PART-TIME' 2='(2) FULL TIME' 7='(7) Uncodeable' 8='(8) Dont_Know'
                  9='(9) Refuse' ;
  VALUE D9ffffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D10A      1='(1) STRONGLY AGREE' 2='(2) AGREE' 3='(3) NEITHER AGREE NOR DISAGREE'
                  4='(4) DISAGREE' 5='(5) STRONGLY DISAGREE' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D10B      1='(1) STRONGLY AGREE' 2='(2) AGREE' 3='(3) NEITHER AGREE NOR DISAGREE'
                  4='(4) DISAGREE' 5='(5) STRONGLY DISAGREE' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D10C      1='(1) STRONGLY AGREE' 2='(2) AGREE' 3='(3) NEITHER AGREE NOR DISAGREE'
                  4='(4) DISAGREE' 5='(5) STRONGLY DISAGREE' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D10D      1='(1) STRONGLY AGREE' 2='(2) AGREE' 3='(3) NEITHER AGREE NOR DISAGREE'
                  4='(4) DISAGREE' 5='(5) STRONGLY DISAGREE' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D11A      1='(1) IDENTITY' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D12A      1='(1) STRONGLY AGREE' 2='(2) AGREE' 3='(3) NEITHER AGREE NOR DISAGREE'
                  4='(4) DISAGREE' 5='(5) STRONGLY DISAGREE' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D12B      1='(1) STRONGLY AGREE' 2='(2) AGREE' 3='(3) NEITHER AGREE NOR DISAGREE'
                  4='(4) DISAGREE' 5='(5) STRONGLY DISAGREE' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D12C      1='(1) STRONGLY AGREE' 2='(2) AGREE' 3='(3) NEITHER AGREE NOR DISAGREE'
                  4='(4) DISAGREE' 5='(5) STRONGLY DISAGREE' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D12D      1='(1) STRONGLY AGREE' 2='(2) AGREE' 3='(3) NEITHER AGREE NOR DISAGREE'
                  4='(4) DISAGREE' 5='(5) STRONGLY DISAGREE' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D13fffff  1='(1) CHRISTIAN' 2='(2) JEWISH' 3='(3) MUSLIM' 4='(4) ATHEIST' 5='(5) OTHER'
                  6='(6) NONE' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D14fffff  1='(1) PROTESTANT' 2='(2) CATHOLIC' 3='(3) ORTHODOX CHRISTIAN'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D14B      1='(1) ROMAN CATHOLIC' 2='(2) MARONITE' 3='(3) CHALDEAN' 4='(4) MELKITE'
                  5='(5) OTHER' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D14C      1='(1) ANTIOCHIAN ORTHODOX' 2='(2) COPTIC ORTHODOX'
                  3='(3) GREEK ORTHODOX' 4='(4) RUSSIAN ORTHODOX' 5='(5) SYRIAN ORTHODOX'
                  7='(7) OTHER' 8='(8) Dont_Know' 9='(9) Refuse' 97='(97) Uncodeable' ;
  VALUE D15A      1='(1) CONSERVATIVE JEWISH' 2='(2) ORTHODOX JEWISH'
                  3='(3) REFORM JEWISH' 4='(4) OTHER' 7='(7) Uncodeable' 8='(8) Dont_Know'
                  9='(9) Refuse' ;
  VALUE D15B      1='(1) SHI A' 2='(2) SUNNI' 3='(3) OTHER' 4='(4) (IF VOL) WOULD NOT CHOOSE'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D16A      1='(1) STRONGLY AGREE' 2='(2) AGREE' 3='(3) NEITHER AGREE NOR DISAGREE'
                  4='(4) DISAGREE' 5='(5) STRONGLY DISAGREE' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D16B      1='(1) STRONGLY AGREE' 2='(2) AGREE' 3='(3) NEITHER AGREE NOR DISAGREE'
                  4='(4) DISAGREE' 5='(5) STRONGLY DISAGREE' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D16C      1='(1) STRONGLY AGREE' 2='(2) AGREE' 3='(3) NEITHER AGREE NOR DISAGREE'
                  4='(4) DISAGREE' 5='(5) STRONGLY DISAGREE' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D16D      1='(1) STRONGLY AGREE' 2='(2) AGREE' 3='(3) NEITHER AGREE NOR DISAGREE'
                  4='(4) DISAGREE' 5='(5) STRONGLY DISAGREE' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D17_01ff  1='(1) ATTENDING FRIDAY PRAYERS'
                  2='(2) READING OR LISTENING TO THE QURAN REGULARLY'
                  3='(3) GIVING CHARITY (ZAKAT)'
                  4='(4) SENDING YOUR CHILDREN TO RELIGIOUS EDUCATION CLASSES'
                  5='(5) PRAYING DAILY' 6='(6) MARRYING A MUSLIM' 7='(7) FASTING'
                  8='(8) WEARING HIJAB' 9='(9) WEARING A RELIGIOUS SYMBOL'
                  10='(10) TELLING OTHERS ABOUT YOUR FAITH' 97='(97) Uncodeable'
                  98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE D17_02ff  1='(1) ATTENDING FRIDAY PRAYERS'
                  2='(2) READING OR LISTENING TO THE QURAN REGULARLY'
                  3='(3) GIVING CHARITY (ZAKAT)'
                  4='(4) SENDING YOUR CHILDREN TO RELIGIOUS EDUCATION CLASSES'
                  5='(5) PRAYING DAILY' 6='(6) MARRYING A MUSLIM' 7='(7) FASTING'
                  8='(8) WEARING HIJAB' 9='(9) WEARING A RELIGIOUS SYMBOL'
                  10='(10) TELLING OTHERS ABOUT YOUR FAITH' 97='(97) Uncodeable'
                  98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE D17_03ff  1='(1) ATTENDING FRIDAY PRAYERS'
                  2='(2) READING OR LISTENING TO THE QURAN REGULARLY'
                  3='(3) GIVING CHARITY (ZAKAT)'
                  4='(4) SENDING YOUR CHILDREN TO RELIGIOUS EDUCATION CLASSES'
                  5='(5) PRAYING DAILY' 6='(6) MARRYING A MUSLIM' 7='(7) FASTING'
                  8='(8) WEARING HIJAB' 9='(9) WEARING A RELIGIOUS SYMBOL'
                  10='(10) TELLING OTHERS ABOUT YOUR FAITH' 97='(97) Uncodeable'
                  98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE D17_04ff  1='(1) ATTENDING FRIDAY PRAYERS'
                  2='(2) READING OR LISTENING TO THE QURAN REGULARLY'
                  3='(3) GIVING CHARITY (ZAKAT)'
                  4='(4) SENDING YOUR CHILDREN TO RELIGIOUS EDUCATION CLASSES'
                  5='(5) PRAYING DAILY' 6='(6) MARRYING A MUSLIM' 7='(7) FASTING'
                  8='(8) WEARING HIJAB' 9='(9) WEARING A RELIGIOUS SYMBOL'
                  10='(10) TELLING OTHERS ABOUT YOUR FAITH' 97='(97) Uncodeable'
                  98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE D17_05ff  1='(1) ATTENDING FRIDAY PRAYERS'
                  2='(2) READING OR LISTENING TO THE QURAN REGULARLY'
                  3='(3) GIVING CHARITY (ZAKAT)'
                  4='(4) SENDING YOUR CHILDREN TO RELIGIOUS EDUCATION CLASSES'
                  5='(5) PRAYING DAILY' 6='(6) MARRYING A MUSLIM' 7='(7) FASTING'
                  8='(8) WEARING HIJAB' 9='(9) WEARING A RELIGIOUS SYMBOL'
                  10='(10) TELLING OTHERS ABOUT YOUR FAITH' 97='(97) Uncodeable'
                  98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE D17_06ff  1='(1) ATTENDING FRIDAY PRAYERS'
                  2='(2) READING OR LISTENING TO THE QURAN REGULARLY'
                  3='(3) GIVING CHARITY (ZAKAT)'
                  4='(4) SENDING YOUR CHILDREN TO RELIGIOUS EDUCATION CLASSES'
                  5='(5) PRAYING DAILY' 6='(6) MARRYING A MUSLIM' 7='(7) FASTING'
                  8='(8) WEARING HIJAB' 9='(9) WEARING A RELIGIOUS SYMBOL'
                  10='(10) TELLING OTHERS ABOUT YOUR FAITH' 97='(97) Uncodeable'
                  98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE D17_07ff  1='(1) ATTENDING FRIDAY PRAYERS'
                  2='(2) READING OR LISTENING TO THE QURAN REGULARLY'
                  3='(3) GIVING CHARITY (ZAKAT)'
                  4='(4) SENDING YOUR CHILDREN TO RELIGIOUS EDUCATION CLASSES'
                  5='(5) PRAYING DAILY' 6='(6) MARRYING A MUSLIM' 7='(7) FASTING'
                  8='(8) WEARING HIJAB' 9='(9) WEARING A RELIGIOUS SYMBOL'
                  10='(10) TELLING OTHERS ABOUT YOUR FAITH' 97='(97) Uncodeable'
                  98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE D17_08ff  1='(1) ATTENDING FRIDAY PRAYERS'
                  2='(2) READING OR LISTENING TO THE QURAN REGULARLY'
                  3='(3) GIVING CHARITY (ZAKAT)'
                  4='(4) SENDING YOUR CHILDREN TO RELIGIOUS EDUCATION CLASSES'
                  5='(5) PRAYING DAILY' 6='(6) MARRYING A MUSLIM' 7='(7) FASTING'
                  8='(8) WEARING HIJAB' 9='(9) WEARING A RELIGIOUS SYMBOL'
                  10='(10) TELLING OTHERS ABOUT YOUR FAITH' 97='(97) Uncodeable'
                  98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE D17_09ff  1='(1) ATTENDING FRIDAY PRAYERS'
                  2='(2) READING OR LISTENING TO THE QURAN REGULARLY'
                  3='(3) GIVING CHARITY (ZAKAT)'
                  4='(4) SENDING YOUR CHILDREN TO RELIGIOUS EDUCATION CLASSES'
                  5='(5) PRAYING DAILY' 6='(6) MARRYING A MUSLIM' 7='(7) FASTING'
                  8='(8) WEARING HIJAB' 9='(9) WEARING A RELIGIOUS SYMBOL'
                  10='(10) TELLING OTHERS ABOUT YOUR FAITH' 97='(97) Uncodeable'
                  98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE D17_10ff  1='(1) ATTENDING FRIDAY PRAYERS'
                  2='(2) READING OR LISTENING TO THE QURAN REGULARLY'
                  3='(3) GIVING CHARITY (ZAKAT)'
                  4='(4) SENDING YOUR CHILDREN TO RELIGIOUS EDUCATION CLASSES'
                  5='(5) PRAYING DAILY' 6='(6) MARRYING A MUSLIM' 7='(7) FASTING'
                  8='(8) WEARING HIJAB' 9='(9) WEARING A RELIGIOUS SYMBOL'
                  10='(10) TELLING OTHERS ABOUT YOUR FAITH' 97='(97) Uncodeable'
                  98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE D18_01ff  1='(1) ATTENDING CHURCH ON SUNDAY'
                  2='(2) READING THE BIBLE REGULARLY'
                  3='(3) GIVING TO CHARITY OR TITHING'
                  4='(4) SENDING YOUR CHILDREN TO RELIGIOUS EDUCATION CLASSES'
                  5='(5) PRAYING DAILY' 6='(6) MARRYING A CHRISTIAN' 7='(7) FASTING'
                  8='(8) DRESSING MODESTLY' 9='(9) WEARING A RELIGIOUS SYMBOL'
                  10='(10) TELLING OTHERS ABOUT YOUR FAITH' 97='(97) Uncodeable'
                  98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE D18_02ff  1='(1) ATTENDING CHURCH ON SUNDAY'
                  2='(2) READING THE BIBLE REGULARLY'
                  3='(3) GIVING TO CHARITY OR TITHING'
                  4='(4) SENDING YOUR CHILDREN TO RELIGIOUS EDUCATION CLASSES'
                  5='(5) PRAYING DAILY' 6='(6) MARRYING A CHRISTIAN' 7='(7) FASTING'
                  8='(8) DRESSING MODESTLY' 9='(9) WEARING A RELIGIOUS SYMBOL'
                  10='(10) TELLING OTHERS ABOUT YOUR FAITH' 97='(97) Uncodeable'
                  98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE D18_03ff  1='(1) ATTENDING CHURCH ON SUNDAY'
                  2='(2) READING THE BIBLE REGULARLY'
                  3='(3) GIVING TO CHARITY OR TITHING'
                  4='(4) SENDING YOUR CHILDREN TO RELIGIOUS EDUCATION CLASSES'
                  5='(5) PRAYING DAILY' 6='(6) MARRYING A CHRISTIAN' 7='(7) FASTING'
                  8='(8) DRESSING MODESTLY' 9='(9) WEARING A RELIGIOUS SYMBOL'
                  10='(10) TELLING OTHERS ABOUT YOUR FAITH' 97='(97) Uncodeable'
                  98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE D18_04ff  1='(1) ATTENDING CHURCH ON SUNDAY'
                  2='(2) READING THE BIBLE REGULARLY'
                  3='(3) GIVING TO CHARITY OR TITHING'
                  4='(4) SENDING YOUR CHILDREN TO RELIGIOUS EDUCATION CLASSES'
                  5='(5) PRAYING DAILY' 6='(6) MARRYING A CHRISTIAN' 7='(7) FASTING'
                  8='(8) DRESSING MODESTLY' 9='(9) WEARING A RELIGIOUS SYMBOL'
                  10='(10) TELLING OTHERS ABOUT YOUR FAITH' 97='(97) Uncodeable'
                  98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE D18_05ff  1='(1) ATTENDING CHURCH ON SUNDAY'
                  2='(2) READING THE BIBLE REGULARLY'
                  3='(3) GIVING TO CHARITY OR TITHING'
                  4='(4) SENDING YOUR CHILDREN TO RELIGIOUS EDUCATION CLASSES'
                  5='(5) PRAYING DAILY' 6='(6) MARRYING A CHRISTIAN' 7='(7) FASTING'
                  8='(8) DRESSING MODESTLY' 9='(9) WEARING A RELIGIOUS SYMBOL'
                  10='(10) TELLING OTHERS ABOUT YOUR FAITH' 97='(97) Uncodeable'
                  98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE D18_06ff  1='(1) ATTENDING CHURCH ON SUNDAY'
                  2='(2) READING THE BIBLE REGULARLY'
                  3='(3) GIVING TO CHARITY OR TITHING'
                  4='(4) SENDING YOUR CHILDREN TO RELIGIOUS EDUCATION CLASSES'
                  5='(5) PRAYING DAILY' 6='(6) MARRYING A CHRISTIAN' 7='(7) FASTING'
                  8='(8) DRESSING MODESTLY' 9='(9) WEARING A RELIGIOUS SYMBOL'
                  10='(10) TELLING OTHERS ABOUT YOUR FAITH' 97='(97) Uncodeable'
                  98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE D18_07ff  1='(1) ATTENDING CHURCH ON SUNDAY'
                  2='(2) READING THE BIBLE REGULARLY'
                  3='(3) GIVING TO CHARITY OR TITHING'
                  4='(4) SENDING YOUR CHILDREN TO RELIGIOUS EDUCATION CLASSES'
                  5='(5) PRAYING DAILY' 6='(6) MARRYING A CHRISTIAN' 7='(7) FASTING'
                  8='(8) DRESSING MODESTLY' 9='(9) WEARING A RELIGIOUS SYMBOL'
                  10='(10) TELLING OTHERS ABOUT YOUR FAITH' 97='(97) Uncodeable'
                  98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE D18_08ff  1='(1) ATTENDING CHURCH ON SUNDAY'
                  2='(2) READING THE BIBLE REGULARLY'
                  3='(3) GIVING TO CHARITY OR TITHING'
                  4='(4) SENDING YOUR CHILDREN TO RELIGIOUS EDUCATION CLASSES'
                  5='(5) PRAYING DAILY' 6='(6) MARRYING A CHRISTIAN' 7='(7) FASTING'
                  8='(8) DRESSING MODESTLY' 9='(9) WEARING A RELIGIOUS SYMBOL'
                  10='(10) TELLING OTHERS ABOUT YOUR FAITH' 97='(97) Uncodeable'
                  98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE D18_09ff  1='(1) ATTENDING CHURCH ON SUNDAY'
                  2='(2) READING THE BIBLE REGULARLY'
                  3='(3) GIVING TO CHARITY OR TITHING'
                  4='(4) SENDING YOUR CHILDREN TO RELIGIOUS EDUCATION CLASSES'
                  5='(5) PRAYING DAILY' 6='(6) MARRYING A CHRISTIAN' 7='(7) FASTING'
                  8='(8) DRESSING MODESTLY' 9='(9) WEARING A RELIGIOUS SYMBOL'
                  10='(10) TELLING OTHERS ABOUT YOUR FAITH' 97='(97) Uncodeable'
                  98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE D18_10ff  1='(1) ATTENDING CHURCH ON SUNDAY'
                  2='(2) READING THE BIBLE REGULARLY'
                  3='(3) GIVING TO CHARITY OR TITHING'
                  4='(4) SENDING YOUR CHILDREN TO RELIGIOUS EDUCATION CLASSES'
                  5='(5) PRAYING DAILY' 6='(6) MARRYING A CHRISTIAN' 7='(7) FASTING'
                  8='(8) DRESSING MODESTLY' 9='(9) WEARING A RELIGIOUS SYMBOL'
                  10='(10) TELLING OTHERS ABOUT YOUR FAITH' 97='(97) Uncodeable'
                  98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE D19A      1='(1) A LOT' 2='(2) SOMEWHAT' 3='(3) ONLY A LITTLE' 4='(4) NOT AT ALL'
                  5='(5) NOT RELEVANT' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D19B      1='(1) A LOT' 2='(2) SOMEWHAT' 3='(3) ONLY A LITTLE' 4='(4) NOT AT ALL'
                  5='(5) NOT RELEVANT' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D19C      1='(1) A LOT' 2='(2) SOMEWHAT' 3='(3) ONLY A LITTLE' 4='(4) NOT AT ALL'
                  5='(5) NOT RELEVANT' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D19D      1='(1) A LOT' 2='(2) SOMEWHAT' 3='(3) ONLY A LITTLE' 4='(4) NOT AT ALL'
                  5='(5) NOT RELEVANT' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D19E      1='(1) A LOT' 2='(2) SOMEWHAT' 3='(3) ONLY A LITTLE' 4='(4) NOT AT ALL'
                  5='(5) NOT RELEVANT' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D20_1fff  1='(1) IMPROVED IMAGE OF ARAB COMMUNITY'
                  2='(2) HURT IMAGE OF ARAB COMMUNITY'
                  3='(3) BROUGHT POLITICAL INFLUENCE TO ARAB COMMUNITY'
                  4='(4) MAKES PEOPLE THINK ALL ARABS ARE MUSLIMS'
                  5='(5) MAKES PEOPLE MORE AWARE AND PROUD OF DETROIT S ETHNIC DIVERS'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D20_2fff  1='(1) IMPROVED IMAGE OF ARAB COMMUNITY'
                  2='(2) HURT IMAGE OF ARAB COMMUNITY'
                  3='(3) BROUGHT POLITICAL INFLUENCE TO ARAB COMMUNITY'
                  4='(4) MAKES PEOPLE THINK ALL ARABS ARE MUSLIMS'
                  5='(5) MAKES PEOPLE MORE AWARE AND PROUD OF DETROIT S ETHNIC DIVERS'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D20_3fff  1='(1) IMPROVED IMAGE OF ARAB COMMUNITY'
                  2='(2) HURT IMAGE OF ARAB COMMUNITY'
                  3='(3) BROUGHT POLITICAL INFLUENCE TO ARAB COMMUNITY'
                  4='(4) MAKES PEOPLE THINK ALL ARABS ARE MUSLIMS'
                  5='(5) MAKES PEOPLE MORE AWARE AND PROUD OF DETROIT S ETHNIC DIVERS'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D20_4fff  1='(1) IMPROVED IMAGE OF ARAB COMMUNITY'
                  2='(2) HURT IMAGE OF ARAB COMMUNITY'
                  3='(3) BROUGHT POLITICAL INFLUENCE TO ARAB COMMUNITY'
                  4='(4) MAKES PEOPLE THINK ALL ARABS ARE MUSLIMS'
                  5='(5) MAKES PEOPLE MORE AWARE AND PROUD OF DETROIT S ETHNIC DIVERS'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D20_5fff  1='(1) IMPROVED IMAGE OF ARAB COMMUNITY'
                  2='(2) HURT IMAGE OF ARAB COMMUNITY'
                  3='(3) BROUGHT POLITICAL INFLUENCE TO ARAB COMMUNITY'
                  4='(4) MAKES PEOPLE THINK ALL ARABS ARE MUSLIMS'
                  5='(5) MAKES PEOPLE MORE AWARE AND PROUD OF DETROIT S ETHNIC DIVERS'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D21A      1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D21B      1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D21C      1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D21D      1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE D21E      1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE E1ffffff  9997='(9997) UNCODEABLE' 9998='(9998) DON''T KNOW' 9999='(9999) REFUSE' ;
  VALUE E2ffffff  1='(1) US' 2='(2) OTHER' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE E2A       9997='(9997) UNCODEABLE' 9998='(9998) DON''T KNOW' 9999='(9999) REFUSE' ;
  VALUE E2D       1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE E3ffffff  1='(1) US' 2='(2) OTHER' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE E3A       1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE E4ffffff  1='(1) US' 2='(2) OTHER' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE E4A       1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE E5ffffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE E5A01fff  1='(1) CULTURAL EXPERIENCE FOR CHILDREN' 2='(2) WORK'
                  3='(3) START A BUSINESS' 4='(4) RETIRE' 5='(5) FAMILY AND FRIENDS'
                  6='(6) SCHOOLING' 7='(7) RELIGION AND CULTURE' 8='(8) MILITARY SERVICE'
                  9='(9) OTHER' 97='(97) Uncodeable' 98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE E5A02fff  1='(1) CULTURAL EXPERIENCE FOR CHILDREN' 2='(2) WORK'
                  3='(3) START A BUSINESS' 4='(4) RETIRE' 5='(5) FAMILY AND FRIENDS'
                  6='(6) SCHOOLING' 7='(7) RELIGION AND CULTURE' 8='(8) MILITARY SERVICE'
                  9='(9) OTHER' 97='(97) Uncodeable' 98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE E5A03fff  1='(1) CULTURAL EXPERIENCE FOR CHILDREN' 2='(2) WORK'
                  3='(3) START A BUSINESS' 4='(4) RETIRE' 5='(5) FAMILY AND FRIENDS'
                  6='(6) SCHOOLING' 7='(7) RELIGION AND CULTURE' 8='(8) MILITARY SERVICE'
                  9='(9) OTHER' 97='(97) Uncodeable' 98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE E5A04fff  1='(1) CULTURAL EXPERIENCE FOR CHILDREN' 2='(2) WORK'
                  3='(3) START A BUSINESS' 4='(4) RETIRE' 5='(5) FAMILY AND FRIENDS'
                  6='(6) SCHOOLING' 7='(7) RELIGION AND CULTURE' 8='(8) MILITARY SERVICE'
                  9='(9) OTHER' 97='(97) Uncodeable' 98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE E5A05fff  1='(1) CULTURAL EXPERIENCE FOR CHILDREN' 2='(2) WORK'
                  3='(3) START A BUSINESS' 4='(4) RETIRE' 5='(5) FAMILY AND FRIENDS'
                  6='(6) SCHOOLING' 7='(7) RELIGION AND CULTURE' 8='(8) MILITARY SERVICE'
                  9='(9) OTHER' 97='(97) Uncodeable' 98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE E5A06fff  1='(1) CULTURAL EXPERIENCE FOR CHILDREN' 2='(2) WORK'
                  3='(3) START A BUSINESS' 4='(4) RETIRE' 5='(5) FAMILY AND FRIENDS'
                  6='(6) SCHOOLING' 7='(7) RELIGION AND CULTURE' 8='(8) MILITARY SERVICE'
                  9='(9) OTHER' 97='(97) Uncodeable' 98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE E5A07fff  1='(1) CULTURAL EXPERIENCE FOR CHILDREN' 2='(2) WORK'
                  3='(3) START A BUSINESS' 4='(4) RETIRE' 5='(5) FAMILY AND FRIENDS'
                  6='(6) SCHOOLING' 7='(7) RELIGION AND CULTURE' 8='(8) MILITARY SERVICE'
                  9='(9) OTHER' 97='(97) Uncodeable' 98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE E5A08fff  1='(1) CULTURAL EXPERIENCE FOR CHILDREN' 2='(2) WORK'
                  3='(3) START A BUSINESS' 4='(4) RETIRE' 5='(5) FAMILY AND FRIENDS'
                  6='(6) SCHOOLING' 7='(7) RELIGION AND CULTURE' 8='(8) MILITARY SERVICE'
                  9='(9) OTHER' 97='(97) Uncodeable' 98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE E5A09fff  1='(1) CULTURAL EXPERIENCE FOR CHILDREN' 2='(2) WORK'
                  3='(3) START A BUSINESS' 4='(4) RETIRE' 5='(5) FAMILY AND FRIENDS'
                  6='(6) SCHOOLING' 7='(7) RELIGION AND CULTURE' 8='(8) MILITARY SERVICE'
                  9='(9) OTHER' 97='(97) Uncodeable' 98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE E6ffffff  1='(1) MARRIED' 2='(2) WIDOWED' 3='(3) DIVORCED' 4='(4) SEPARATED'
                  5='(5) NEVER MARRIED' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE E6A       1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE E6C       1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE E6D       1='(1) WORKING NOW' 2='(2) ONLY TEMPORARILY LAID OFF'
                  3='(3) UNEMPLOYED' 4='(4) RETIRED' 5='(5) PERMANENTLY DISABLED'
                  6='(6) HOMEMAKER' 7='(7) STUDENT' 8='(8) OTHER (SPECIFY)'
                  97='(97) Uncodeable' 98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE E7ffffff  1='(1) LESS THAN HIGH SCHOOL(LESS THAN 9TH GRADE)'
                  2='(2) SOME HIGH SCHOOL(9, 10, OR 11TH GRADE)'
                  3='(3) COMPLETED HIGH SCHOOL OR GED (12TH GRADE)'
                  4='(4) SOME COLLEGE(13, 14, OR 15TH)'
                  5='(5) ASSOCIATE DEGREE (E.G., AA, AS)'
                  6='(6) BACHELOR S DEGREE (E.G., BA, AB, BS)'
                  7='(7) MASTER S DEGREE (E.G., MA, MS, MEng, Med, MSN, MBA)'
                  8='(8) PROFESSIONAL DEGREE (E.G.,MD, DDS, DVM, LLB, JD)'
                  9='(9) DOCTORATE DEGREE (E.G., PhD, EdD)' 10='(10) OTHER'
                  97='(97) Uncodeable' 98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE E8ffffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE E9ffffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE E10_CKPT  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE E10A      1='(1) VERY WELL' 2='(2) WELL' 3='(3) NOT WELL' 4='(4) NOT AT ALL'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE E10B      1='(1) VERY WELL' 2='(2) WELL' 3='(3) NOT WELL' 4='(4) NOT AT ALL'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE E10C      1='(1) VERY WELL' 2='(2) WELL' 3='(3) NOT WELL' 4='(4) NOT AT ALL'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE E10D      1='(1) VERY WELL' 2='(2) WELL' 3='(3) NOT WELL' 4='(4) NOT AT ALL'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE E11fffff  1='(1) VERY WELL' 2='(2) WELL' 3='(3) NOT WELL' 4='(4) NOT AT ALL'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE E12fffff  1='(1) VERY WELL' 2='(2) WELL' 3='(3) NOT WELL' 4='(4) NOT AT ALL'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE E13fffff  1='(1) VERY WELL' 2='(2) WELL' 3='(3) NOT WELL' 4='(4) NOT AT ALL'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE E14fffff  1='(1) LESS THAN $10,000' 2='(2) $10,000 - 14,999'
                  3='(3) $15,000 - 19,999' 4='(4) $20,000 - 29,999'
                  5='(5) $30,000 - 49,999' 6='(6) $50,000 - 74,999'
                  7='(7) $75,000- 99,999' 8='(8) $100,000 - 149,999'
                  9='(9) $150,000 - 199,999' 10='(10) $200,000 OR MORE'
                  97='(97) Uncodeable' 98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE E15fffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE E16fffff  97='(97) UNCODEABLE' 99='(99) REFUSE' ;
  VALUE E17fffff  97='(97) UNCODEABLE' 99='(99) REFUSE' ;
  VALUE F1_1ffff  1='(1) a. Good manners' 2='(2) b. Independence' 3='(3) c. Hard work'
                  4='(4) d. Feeling of responsibility' 5='(5) e. Imagination'
                  6='(6) f. Tolerance and respect for other people'
                  7='(7) g. Thrift, saving money and things'
                  8='(8) h. Determination and perseverance'
                  9='(9) j. Religious faith' 10='(10) k. Unselfishness'
                  11='(11) l. Obedience' 97='(97) Uncodeable' 98='(98) Dont_Know'
                  99='(99) Refuse' ;
  VALUE F1_2ffff  1='(1) a. Good manners' 2='(2) b. Independence' 3='(3) c. Hard work'
                  4='(4) d. Feeling of responsibility' 5='(5) e. Imagination'
                  6='(6) f. Tolerance and respect for other people'
                  7='(7) g. Thrift, saving money and things'
                  8='(8) h. Determination and perseverance'
                  9='(9) j. Religious faith' 10='(10) k. Unselfishness'
                  11='(11) l. Obedience' 97='(97) Uncodeable' 98='(98) Dont_Know'
                  99='(99) Refuse' ;
  VALUE F1_3ffff  1='(1) a. Good manners' 2='(2) b. Independence' 3='(3) c. Hard work'
                  4='(4) d. Feeling of responsibility' 5='(5) e. Imagination'
                  6='(6) f. Tolerance and respect for other people'
                  7='(7) g. Thrift, saving money and things'
                  8='(8) h. Determination and perseverance'
                  9='(9) j. Religious faith' 10='(10) k. Unselfishness'
                  11='(11) l. Obedience' 97='(97) Uncodeable' 98='(98) Dont_Know'
                  99='(99) Refuse' ;
  VALUE F1_4ffff  1='(1) a. Good manners' 2='(2) b. Independence' 3='(3) c. Hard work'
                  4='(4) d. Feeling of responsibility' 5='(5) e. Imagination'
                  6='(6) f. Tolerance and respect for other people'
                  7='(7) g. Thrift, saving money and things'
                  8='(8) h. Determination and perseverance'
                  9='(9) j. Religious faith' 10='(10) k. Unselfishness'
                  11='(11) l. Obedience' 97='(97) Uncodeable' 98='(98) Dont_Know'
                  99='(99) Refuse' ;
  VALUE F1_5ffff  1='(1) a. Good manners' 2='(2) b. Independence' 3='(3) c. Hard work'
                  4='(4) d. Feeling of responsibility' 5='(5) e. Imagination'
                  6='(6) f. Tolerance and respect for other people'
                  7='(7) g. Thrift, saving money and things'
                  8='(8) h. Determination and perseverance'
                  9='(9) j. Religious faith' 10='(10) k. Unselfishness'
                  11='(11) l. Obedience' 97='(97) Uncodeable' 98='(98) Dont_Know'
                  99='(99) Refuse' ;
  VALUE F2ffffff  1='(1) a. Maintaining order in the nation'
                  2='(2) b. Giving people more say in important government decisions'
                  3='(3) c. Fighting rising prices'
                  4='(4) d. Protecting freedom of speech' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE F3ffffff  1='(1) a. Maintaining order in the nation'
                  2='(2) b. Giving people more say in important government decisions'
                  3='(3) c. Fighting rising prices'
                  4='(4) d. Protecting freedom of speech' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE F4ffffff  1='(1) VERY PROUD' 2='(2) QUITE PROUD' 3='(3) NOT VERY PROUD'
                  4='(4) NOT AT ALL PROUD' 5='(5) (IF VOL) NOT APPLICABLE'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE F5ffffff  1='(1) STRONGLY AGREE' 2='(2) AGREE' 3='(3) NEITHER AGREE NOR DISAGREE'
                  4='(4) DISAGREE' 5='(5) STRONGLY DISAGREE' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE F6ffffff  1='(1) STRONGLY AGREE' 2='(2) AGREE' 3='(3) NEITHER AGREE NOR DISAGREE'
                  4='(4) DISAGREE' 5='(5) STRONGLY DISAGREE' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE F7ffffff  1='(1) STRONGLY AGREE' 2='(2) AGREE' 3='(3) NEITHER AGREE NOR DISAGREE'
                  4='(4) DISAGREE' 5='(5) STRONGLY DISAGREE' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE F8ffffff  1='(1) STRONGLY AGREE' 2='(2) AGREE' 3='(3) NEITHER AGREE NOR DISAGREE'
                  4='(4) DISAGREE' 5='(5) STRONGLY DISAGREE' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE F9ffffff  1='(1) STRONGLY AGREE' 2='(2) AGREE' 3='(3) NEITHER AGREE NOR DISAGREE'
                  4='(4) DISAGREE' 5='(5) STRONGLY DISAGREE' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE F10fffff  1='(1) STRONGLY AGREE' 2='(2) AGREE' 3='(3) NEITHER AGREE NOR DISAGREE'
                  4='(4) DISAGREE' 5='(5) STRONGLY DISAGREE' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE F11A      1='(1) A GOOD THING' 2='(2) A BAD THING' 3='(3) DON T MIND'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE F11B      1='(1) A GOOD THING' 2='(2) A BAD THING' 3='(3) DON T MIND'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE F11C      1='(1) A GOOD THING' 2='(2) A BAD THING' 3='(3) DON T MIND'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE F12A      1='(1) Can never be justified' 2='(2) 2' 3='(3) 3' 4='(4) 4' 5='(5) 5' 6='(6) 6'
                  7='(7) 7' 8='(8) 8' 9='(9) 9' 10='(10) Can always be justified'
                  97='(97) Uncodeable' 98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE F12B      1='(1) Can never be justified' 2='(2) 2' 3='(3) 3' 4='(4) 4' 5='(5) 5' 6='(6) 6'
                  7='(7) 7' 8='(8) 8' 9='(9) 9' 10='(10) Can always be justified'
                  97='(97) Uncodeable' 98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE F12C      1='(1) Can never be justified' 2='(2) 2' 3='(3) 3' 4='(4) 4' 5='(5) 5' 6='(6) 6'
                  7='(7) 7' 8='(8) 8' 9='(9) 9' 10='(10) Can always be justified'
                  97='(97) Uncodeable' 98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE F12D      1='(1) Can never be justified' 2='(2) 2' 3='(3) 3' 4='(4) 4' 5='(5) 5' 6='(6) 6'
                  7='(7) 7' 8='(8) 8' 9='(9) 9' 10='(10) Can always be justified'
                  97='(97) Uncodeable' 98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE F12E      1='(1) Can never be justified' 2='(2) 2' 3='(3) 3' 4='(4) 4' 5='(5) 5' 6='(6) 6'
                  7='(7) 7' 8='(8) 8' 9='(9) 9' 10='(10) Can always be justified'
                  97='(97) Uncodeable' 98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE F12F      1='(1) Can never be justified' 2='(2) 2' 3='(3) 3' 4='(4) 4' 5='(5) 5' 6='(6) 6'
                  7='(7) 7' 8='(8) 8' 9='(9) 9' 10='(10) Can always be justified'
                  97='(97) Uncodeable' 98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE F12G      1='(1) Can never be justified' 2='(2) 2' 3='(3) 3' 4='(4) 4' 5='(5) 5' 6='(6) 6'
                  7='(7) 7' 8='(8) 8' 9='(9) 9' 10='(10) Can always be justified'
                  97='(97) Uncodeable' 98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE F12H      1='(1) Can never be justified' 2='(2) 2' 3='(3) 3' 4='(4) 4' 5='(5) 5' 6='(6) 6'
                  7='(7) 7' 8='(8) 8' 9='(9) 9' 10='(10) Can always be justified'
                  97='(97) Uncodeable' 98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE G1A       1='(1) ALL OF THE TIME' 2='(2) MOST OF THE TIME'
                  3='(3) SOME OF THE TIME' 4='(4) ALMOST NEVER' 5='(5) NOT AT ALL'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE G1B       1.0='(1.0) ALL OF THE TIME' 2.0='(2.0) MOST OF THE TIME'
                  3.0='(3.0) SOME OF THE TIME' 4.0='(4.0) ALMOST NEVER' 5.0='(5.0) NOT AT ALL'
                  7.0='(7.0) Uncodeable' 8.0='(8.0) Dont_Know' 9.0='(9.0) Refuse' ;
  VALUE G1C       1='(1) ALL OF THE TIME' 2='(2) MOST OF THE TIME'
                  3='(3) SOME OF THE TIME' 4='(4) ALMOST NEVER' 5='(5) NOT AT ALL'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE G1D       1='(1) ALL OF THE TIME' 2='(2) MOST OF THE TIME'
                  3='(3) SOME OF THE TIME' 4='(4) ALMOST NEVER' 5='(5) NOT AT ALL'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE G1E       1='(1) ALL OF THE TIME' 2='(2) MOST OF THE TIME'
                  3='(3) SOME OF THE TIME' 4='(4) ALMOST NEVER' 5='(5) NOT AT ALL'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE G1F       1='(1) ALL OF THE TIME' 2='(2) MOST OF THE TIME'
                  3='(3) SOME OF THE TIME' 4='(4) ALMOST NEVER' 5='(5) NOT AT ALL'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE G1G       1='(1) ALL OF THE TIME' 2='(2) MOST OF THE TIME'
                  3='(3) SOME OF THE TIME' 4='(4) ALMOST NEVER' 5='(5) NOT AT ALL'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE G1H       1='(1) ALL OF THE TIME' 2='(2) MOST OF THE TIME'
                  3='(3) SOME OF THE TIME' 4='(4) ALMOST NEVER' 5='(5) NOT AT ALL'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE G1J       1='(1) ALL OF THE TIME' 2='(2) MOST OF THE TIME'
                  3='(3) SOME OF THE TIME' 4='(4) ALMOST NEVER' 5='(5) NOT AT ALL'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE G1K       1='(1) ALL OF THE TIME' 2='(2) MOST OF THE TIME'
                  3='(3) SOME OF THE TIME' 4='(4) ALMOST NEVER' 5='(5) NOT AT ALL'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE G21fffff  1='(1) TIRED OUT FOR NO GOOD REASON' 2='(2) NERVOUS' 3='(3) HOPELESS'
                  4='(4) RESTLESS AND FIDGETY' 5='(5) DEPRESSED'
                  6='(6) (FELT) THAT EVERYTHING WAS AN EFFORT' 7='(7) WORTHLESS'
                  8='(8) Dont_Know' 9='(9) Refuse' 97='(97) Uncodeable' ;
  VALUE G22fffff  1='(1) TIRED OUT FOR NO GOOD REASON' 2='(2) NERVOUS' 3='(3) HOPELESS'
                  4='(4) RESTLESS AND FIDGETY' 5='(5) DEPRESSED'
                  6='(6) (FELT) THAT EVERYTHING WAS AN EFFORT' 7='(7) WORTHLESS'
                  8='(8) Dont_Know' 9='(9) Refuse' 97='(97) Uncodeable' ;
  VALUE G23fffff  1='(1) TIRED OUT FOR NO GOOD REASON' 2='(2) NERVOUS' 3='(3) HOPELESS'
                  4='(4) RESTLESS AND FIDGETY' 5='(5) DEPRESSED'
                  6='(6) (FELT) THAT EVERYTHING WAS AN EFFORT' 7='(7) WORTHLESS'
                  8='(8) Dont_Know' 9='(9) Refuse' 97='(97) Uncodeable' ;
  VALUE G24fffff  1='(1) TIRED OUT FOR NO GOOD REASON' 2='(2) NERVOUS' 3='(3) HOPELESS'
                  4='(4) RESTLESS AND FIDGETY' 5='(5) DEPRESSED'
                  6='(6) (FELT) THAT EVERYTHING WAS AN EFFORT' 7='(7) WORTHLESS'
                  8='(8) Dont_Know' 9='(9) Refuse' 97='(97) Uncodeable' ;
  VALUE G25fffff  1='(1) TIRED OUT FOR NO GOOD REASON' 2='(2) NERVOUS' 3='(3) HOPELESS'
                  4='(4) RESTLESS AND FIDGETY' 5='(5) DEPRESSED'
                  6='(6) (FELT) THAT EVERYTHING WAS AN EFFORT' 7='(7) WORTHLESS'
                  8='(8) Dont_Know' 9='(9) Refuse' 97='(97) Uncodeable' ;
  VALUE G26fffff  1='(1) TIRED OUT FOR NO GOOD REASON' 2='(2) NERVOUS' 3='(3) HOPELESS'
                  4='(4) RESTLESS AND FIDGETY' 5='(5) DEPRESSED'
                  6='(6) (FELT) THAT EVERYTHING WAS AN EFFORT' 7='(7) WORTHLESS'
                  8='(8) Dont_Know' 9='(9) Refuse' 97='(97) Uncodeable' ;
  VALUE G27fffff  1='(1) TIRED OUT FOR NO GOOD REASON' 2='(2) NERVOUS' 3='(3) HOPELESS'
                  4='(4) RESTLESS AND FIDGETY' 5='(5) DEPRESSED'
                  6='(6) (FELT) THAT EVERYTHING WAS AN EFFORT' 7='(7) WORTHLESS'
                  8='(8) Dont_Know' 9='(9) Refuse' 97='(97) Uncodeable' ;
  VALUE H1ffffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE H2ffffff  1='(1) SUPPORT' 2='(2) (IF VOL.) UNDECIDED' 3='(3) OPPOSE'
                  4='(4) HAVE NOT THOUGHT MUCH ABOUT IT' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE H3ffffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE H4A       1='(1) VERY RELIABLE' 2='(2) SOMEWHAT RELIABLE' 3='(3) NOT RELIABLE'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE H4B       1='(1) VERY RELIABLE' 2='(2) SOMEWHAT RELIABLE' 3='(3) NOT RELIABLE'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE H4C       1='(1) VERY RELIABLE' 2='(2) SOMEWHAT RELIABLE' 3='(3) NOT RELIABLE'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE H4D       1='(1) VERY RELIABLE' 2='(2) SOMEWHAT RELIABLE' 3='(3) NOT RELIABLE'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE H5ffffff  1='(1) VERY CLOSELY' 2='(2) CLOSELY' 3='(3) A LITTLE'
                  8='(8) NOT MUCH AT ALL' 97='(97) Uncodeable' 98='(98) Dont_Know'
                  99='(99) Refuse' ;
  VALUE H6ffffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE H7ffffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE H8ffffff  1='(1) STRONGLY AGREE' 2='(2) AGREE' 3='(3) NEITHER AGREE NOR DISAGREE'
                  4='(4) DISAGREE' 5='(5) STRONGLY DISAGREE' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE H9ffffff  1='(1) STRONGLY AGREE' 2='(2) AGREE' 3='(3) NEITHER AGREE NOR DISAGREE'
                  4='(4) DISAGREE' 5='(5) STRONGLY DISAGREE' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE H10fffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE H11A      1='(1) Yes' 5='(5) No' 7='(7) Uncodeable'
                  8='(8) (IF VOL.)DON T KNOW, NOT SURE' 9='(9) Refuse' ;
  VALUE H11B      1='(1) Yes' 5='(5) No' 7='(7) Uncodeable'
                  8='(8) (IF VOL.)DON T KNOW, NOT SURE' 9='(9) Refuse' ;
  VALUE H11C      1='(1) Yes' 5='(5) No' 7='(7) Uncodeable'
                  8='(8) (IF VOL.)DON T KNOW, NOT SURE' 9='(9) Refuse' ;
  VALUE H11D      1='(1) Yes' 5='(5) No' 7='(7) Uncodeable'
                  8='(8) (IF VOL.)DON T KNOW, NOT SURE' 9='(9) Refuse' ;
  VALUE H11E      1='(1) Yes' 5='(5) No' 7='(7) Uncodeable'
                  8='(8) (IF VOL.)DON T KNOW, NOT SURE' 9='(9) Refuse' ;
  VALUE H12fffff  1='(1) A GREAT DEAL' 2='(2) A GOOD AMOUNT' 3='(3) NOT TOO MUCH'
                  8='(8) NOT AT ALL' 97='(97) Uncodeable' 98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE H13fffff  1='(1) YES' 3='(3) (IF VOL.) DEPENDS ON WHICH LIBERTIES' 5='(5) No'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE H14A      1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE H14B      1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE H14C      1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE H14D      1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE H14E      1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE H14F      1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE H15fffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE H16fffff  1='(1) STRONGLY AGREE' 2='(2) AGREE' 3='(3) NEITHER AGREE NOR DISAGREE'
                  4='(4) DISAGREE' 5='(5) STRONGLY DISAGREE' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE H17fffff  1='(1) THEY HAVE BECOME MORE DISTANT'
                  2='(2) THEY HAVE BECOME CLOSER'
                  3='(3) THEY HAVE STAYED ABOUT THE SAME' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE H18fffff  1='(1) THEY HAVE BECOME MORE DISTANT'
                  2='(2) THEY HAVE BECOME CLOSER'
                  3='(3) THEY HAVE STAYED ABOUT THE SAME' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE H19fffff  1='(1) VERY CLOSELY' 2='(2) CLOSELY' 3='(3) A LITTLE'
                  8='(8) NOT MUCH AT ALL' 97='(97) Uncodeable' 98='(98) Dont_Know'
                  99='(99) Refuse' ;
  VALUE H20fffff  1='(1) A GREAT DEAL' 2='(2) A GOOD AMOUNT' 3='(3) NOT TOO MUCH'
                  8='(8) NOT AT ALL' 97='(97) Uncodeable' 98='(98) Dont_Know' 99='(99) Refuse' ;
  VALUE J1ffffff  1='(1) VERY DARK' 2='(2) DARK' 3='(3) MEDIUM' 4='(4) LIGHT' 5='(5) VERY LIGHT'
                  7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE J2ffffff  1='(1) MALE' 2='(2) FEMALE' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE J3ffffff  1='(1) ARABIC' 2='(2) MOSTLY ARABIC, SOME ENGLISH'
                  3='(3) EQUAL DIVISION BETWEEN ARABIC AND ENGLISH'
                  4='(4) MOSTLY ENGLISH SOME ARABIC' 5='(5) ENGLISH' 7='(7) Uncodeable'
                  8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE J4ffffff  1='(1) HOME' 2='(2) CHURCH / MOSQUE' 3='(3) LIBRARY'
                  4='(4) OTHER PUBLIC SITE, SPECIFY' 7='(7) Uncodeable' 8='(8) Dont_Know'
                  9='(9) Refuse' ;
  VALUE J5ffffff  1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE J5A       1='(1) YES' 5='(5) NO' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE J5B       97='(97) UNCODEABLE' 98='(98) DON''T KNOW' 99='(99) REFUSE' ;
  VALUE J5C       1='(1) A LOT' 2='(2) SOMEWHAT' 3='(3) ONLY A LITTLE' 4='(4) NOT AT ALL'
                  5='(5) NOT RELEVANT' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE J5D       1='(1) A LOT' 2='(2) SOMEWHAT' 3='(3) ONLY A LITTLE' 4='(4) NOT AT ALL'
                  5='(5) NOT RELEVANT' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE J6ffffff  1='(1) A LOT' 2='(2) SOMEWHAT' 3='(3) ONLY A LITTLE' 4='(4) NOT AT ALL'
                  5='(5) NOT RELEVANT' 7='(7) Uncodeable' 8='(8) Dont_Know' 9='(9) Refuse' ;
  VALUE J7ffffff  1='(1) IN PERSON' 2='(2) TELEPHONE' 7='(7) Uncodeable' 8='(8) Dont_Know'
                  9='(9) Refuse' ;
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA;
INFILE "data-filename" LRECL=4896;
INPUT
        CASEID $1-8             IWERID 9-16             CASETYPE $17-24
        FINALWGT 25-39 .10      STRATUM 40-47           CLUSTER 48-55
        IWDATE $56-66           I_MONTH 67-68           I_DAY 69-70
        I_YEAR 71-74            IWSTART $75-82          ENDTIME $83-90
        A1_YEAR 91-98           A1_MONTH 99-106         A2 107-114
        A3 115-122              A4 123-130              A5 131-138
        A6_1 139-146            A6_2 147-154            A6_3 155-162
        A6_4 163-170            A6_5 171-178            A6_6 179-186
        A6_7 187-194            A6_SP $195-222          B1 223-230
        B2 231-238              B2A 239-246             B2B 247-254
        B2C 255-262             B3 263-270              B3A 271-278
        B4 279-286              B4A 287-294             B4B 295-302
        B5A 303-310             B5B 311-318             B5C 319-326
        B5D 327-334             B5E 335-342             B6 343-350
        B6A01 351-358           B6A02 359-366           B6A03 367-374
        B6A04 375-382           B6A05 383-390           B6A06 391-398
        B6A07 399-406           B6A08 407-414           B6A09 415-422
        B6A10 423-430           B6A11 431-438           B6A12 439-446
        B6A13 447-454           B6A14 455-462           B6A15 463-470
        B6A_SP $471-570         B7 571-578              B8 579-586
        B9 587-594              B10 595-602             B11 603-610
        B12 611-618             B12A 619-626            B13 627-634
        B14 635-642             B15 643-650             B16 651-658
        B16A 659-666            B17 667-674             B17A 675-682
        B18 683-690             B18A 691-698            B19 699-706
        B19A 707-714            B20 715-722             B20A 723-730
        B21 731-738             B21A 739-746            B22 747-754
        B22A 755-762            C1 763-770              C2 771-778
        C2_SP $779-806          C3 807-814              C3A 815-822
        C4 823-830              C5 831-838              C5A 839-846
        C5B 847-854             C6 855-862              C6A 863-870
        C6B 871-878             C7 879-886              C7A 887-894
        C7B 895-902             C8 903-910              C8A 911-918
        C8B 919-926             C9 927-934              C9A 935-942
        C9B 943-950             C10 951-958             C10A 959-966
        C10B 967-974            C11 975-982             C11A 983-990
        C11B 991-998            C12 999-1006            C13 1007-1014
        C14 1015-1022           C15 1023-1030           C16 1031-1038
        C17 1039-1046           C18 1047-1054           C19 1055-1062
        C20 1063-1070           C21 1071-1078           C22 1079-1086
        C23 1087-1094           C24 1095-1102           C25A 1103-1110
        C25B 1111-1118          C25C 1119-1126          C25D 1127-1134
        C25E 1135-1142          C26 1143-1150           C27 1151-1158
        C28 1159-1166           C29 1167-1174           C30 1175-1182
        C31 1183-1190           C32 1191-1198           C33 1199-1206
        C34A 1207-1214          C34B 1215-1222          C34C 1223-1230
        C34D 1231-1238          C34E 1239-1246          C35A 1247-1254
        C35B 1255-1262          C35C 1263-1270          C35D 1271-1278
        C35E 1279-1286          C35F 1287-1294          C35G 1295-1302
        C36A 1303-1310          C36B 1311-1318          C36C 1319-1326
        C36D 1327-1334          C36E 1335-1342          C37 1343-1350
        C38 1351-1358           D1 1359-1366            D2 $1367-1465
        D3 1466-1473            D3_SP $1474-1532        D4 1533-1540
        D5 1541-1548            D6 $1549-1551           D7 $1552-1554
        D8 1555-1562            D9 1563-1570            D10A 1571-1578
        D10B 1579-1586          D10C 1587-1594          D10D 1595-1602
        D11 $1603-1697          D11A 1698-1705          D11_SP $1706-1734
        D12A 1735-1742          D12B 1743-1750          D12C 1751-1758
        D12D 1759-1766          D13 1767-1774           D13_SP $1775-1804
        D14 1805-1812           D14A $1813-1842         D14B 1843-1850
        D14B_SP $1851-1881      D14C 1882-1889          D14C_SP $1890-1941
        D15A 1942-1949          D15A_SP $1950-1979      D15B 1980-1987
        D15B_SP $1988-2017      D16A 2018-2025          D16B 2026-2033
        D16C 2034-2041          D16D 2042-2049          D17_01 2050-2057
        D17_02 2058-2065        D17_03 2066-2073        D17_04 2074-2081
        D17_05 2082-2089        D17_06 2090-2097        D17_07 2098-2105
        D17_08 2106-2113        D17_09 2114-2121        D17_10 2122-2129
        D18_01 2130-2137        D18_02 2138-2145        D18_03 2146-2153
        D18_04 2154-2161        D18_05 2162-2169        D18_06 2170-2177
        D18_07 2178-2185        D18_08 2186-2193        D18_09 2194-2201
        D18_10 2202-2209        D19A 2210-2217          D19B 2218-2225
        D19C 2226-2233          D19D 2234-2241          D19E 2242-2249
        D20_1 2250-2257         D20_2 2258-2265         D20_3 2266-2273
        D20_4 2274-2281         D20_5 2282-2289         D21A 2290-2297
        D21B 2298-2305          D21C 2306-2313          D21D 2314-2321
        D21E 2322-2329          E1 2330-2337            E2 2338-2345
        E2_SP $2346-2368        E2A 2369-2376           E2B $2377-2396
        E2C $2397-2423          E2D 2424-2431           E3 2432-2439
        E3_SP $2440-2455        E3A 2456-2463           E3B $2464-2498
        E3C $2499-2533          E4 2534-2541            E4_SP $2542-2555
        E4A 2556-2563           E4B $2564-2581          E4C $2582-2605
        E5 2606-2613            E5A01 2614-2621         E5A02 2622-2629
        E5A03 2630-2637         E5A04 2638-2645         E5A05 2646-2653
        E5A06 2654-2661         E5A07 2662-2669         E5A08 2670-2677
        E5A09 2678-2685         E5A_SP $2686-2784       E5B $2785-2822
        E6 2823-2830            E6A 2831-2838           E6B $2839-2869
        E6C 2870-2877           E6D 2878-2885           E6D_SP $2886-2934
        E7 2935-2942            E7_SP $2943-3027        E8 3028-3035
        E9 3036-3043            E10 $3044-3083          E10_CKPT 3084-3091
        E10A 3092-3099          E10B 3100-3107          E10C 3108-3115
        E10D 3116-3123          E11 3124-3131           E12 3132-3139
        E13 3140-3147           E14 3148-3155           E15 3156-3163
        E16 3164-3171           E17 3172-3179           F1_1 3180-3187
        F1_2 3188-3195          F1_3 3196-3203          F1_4 3204-3211
        F1_5 3212-3219          F2 3220-3227            F3 3228-3235
        F4 3236-3243            F5 3244-3251            F6 3252-3259
        F7 3260-3267            F8 3268-3275            F9 3276-3283
        F10 3284-3291           F11A 3292-3299          F11B 3300-3307
        F11C 3308-3315          F12A 3316-3323          F12B 3324-3331
        F12C 3332-3339          F12D 3340-3347          F12E 3348-3355
        F12F 3356-3363          F12G 3364-3371          F12H 3372-3379
        G1A 3380-3387           G1B 3388-3395 .1        G1C 3396-3403
        G1D 3404-3411           G1E 3412-3419           G1F 3420-3427
        G1G 3428-3435           G1H 3436-3443           G1J 3444-3451
        G1K 3452-3459           G21 3460-3467           G22 3468-3475
        G23 3476-3483           G24 3484-3491           G25 3492-3499
        G26 3500-3507           G27 3508-3515           G3 $3516-3715
        H1 3716-3723            H2 3724-3731            H3 3732-3739
        H4A 3740-3747           H4B 3748-3755           H4C 3756-3763
        H4D 3764-3771           H5 3772-3779            H6 3780-3787
        H6A $3788-3987          H7 3988-3995            H7A $3996-4195
        H8 4196-4203            H9 4204-4211            H10 4212-4219
        H11A 4220-4227          H11B 4228-4235          H11C 4236-4243
        H11D 4244-4251          H11E 4252-4259          H12 4260-4267
        H13 4268-4275           H14A 4276-4283          H14B 4284-4291
        H14C 4292-4299          H14D 4300-4307          H14E 4308-4315
        H14F 4316-4323          H15 4324-4331           H16 4332-4339
        H17 4340-4347           H18 4348-4355           H19 4356-4363
        H20 4364-4371           H21 $4372-4571          H22 $4572-4771
        J1 4772-4779            J2 4780-4787            J3 4788-4795
        J4 4796-4803            J4_SP $4804-4840        J5 4841-4848
        J5A 4849-4856           J5B 4857-4864           J5C 4865-4872
        J5D 4873-4880           J6 4881-4888            J7 4889-4896
        ;


* SAS LABEL STATEMENT;

LABEL
   CASEID  = 'CASEID'
   IWERID  = 'IWER ID'
   CASETYPE= 'CASETYPE'
   FINALWGT= 'FINAL SAMPLE WEIGHT'
   STRATUM = 'STRATUM'
   CLUSTER = 'CLUSTER'
   IWDATE  = 'Interview Date (MM/DD/YYYY)'
   I_MONTH = 'Month of interview (derived from IWDATE variable'
   I_DAY   = 'Day of interview (derived from IWDATE variable'
   I_YEAR  = 'Year of interview (derived from IWDATE variable'
   IWSTART = 'IW START TIME format HH:MM'
   ENDTIME = 'IW END TIME format HH:MM'
   A1_YEAR = 'How long have you lived in the Detroit Metro area? (in years)'
   A1_MONTH= 'How long have you lived in the Detroit Metro area? (in months)'
   A2      = 'Please look at page 1 of your Blue Booklet and tell me which item on the list best describes where you live.'
   A3      = 'Do you or your family own the place where you are living now, or do you rent?'
   A4      = 'Taking all things together, would you say you are very happy, happy, not very happy, or not happy at all?'
   A5      = 'And how would you describe your overall state of health these days?  Would you say it is excellent, very good, good, fai'
   A6_1    = 'The next question is a standard question from the United States Census...Using the categories...what is your race?'
   A6_2    = 'The next question is a standard question from the United States Census...Using the categories...what is your race?'
   A6_3    = 'The next question is a standard question from the United States Census...Using the categories...what is your race?'
   A6_4    = 'The next question is a standard question from the United States Census...Using the categories...what is your race?'
   A6_5    = 'The next question is a standard question from the United States Census...Using the categories...what is your race?'
   A6_6    = 'The next question is a standard question from the United States Census...Using the categories...what is your race?'
   A6_7    = 'The next question is a standard question from the United States Census...Using the categories...what is your race?'
   A6_SP   = 'The next question is a standard question from the United States Census...Using the categories...what is your race?'
   B1      = 'In a typical week about how many hours do you spend watching TV per day?'
   B2      = 'In a typical week, about how often do you watch the news on television-everyday, several days, one or two days, or never'
   B2A     = 'In a typical week, do you watch the national news on television?  National news includes ''NBC Nightly News'', ''ABC World'
   B2B     = 'In a typical week, do you watch the local news on television?  For example, ''Eyewitness News'', or ''Action News''?'
   B2C     = 'In a typical week, do you watch any television news broadcast in Arabic?'
   B3      = 'In a typical week, about how often do you listen to the news on the radio-everyday, several days, one or two days, or ne'
   B3A     = 'In a typical week, do you listen to radio news in Arabic?'
   B4      = 'In a typical week, about how often do you read a newspaper-everyday, several days, one or two days, or never?'
   B4A     = 'Are any of the newspapers you read in Arabic?'
   B4B     = 'Are any of the newspapers you read in Arabic published outside of the United States?'
   B5A     = 'Next... how you get ad use information in your daily life...use each of the following: A cell phone'
   B5B     = 'Next... how you get ad use information in your daily life...use each of the following: Television'
   B5C     = 'Next... how you get ad use information in your daily life...use each of the following: Cable TV'
   B5D     = 'Next... how you get ad use information in your daily life...use each of the following: Satellite dish'
   B5E     = 'Next... how you get ad use information in your daily life...use each of the following: A PalmPilot or something like tha'
   B6      = 'Does your satellite dish receive Arabic programs?'
   B6A01   = 'Which satellite channels do you watch? (CHECK ALL THAT APPLY)'
   B6A02   = 'Which satellite channels do you watch? (CHECK ALL THAT APPLY)'
   B6A03   = 'Which satellite channels do you watch? (CHECK ALL THAT APPLY)'
   B6A04   = 'Which satellite channels do you watch? (CHECK ALL THAT APPLY)'
   B6A05   = 'Which satellite channels do you watch? (CHECK ALL THAT APPLY)'
   B6A06   = 'Which satellite channels do you watch? (CHECK ALL THAT APPLY)'
   B6A07   = 'Which satellite channels do you watch? (CHECK ALL THAT APPLY)'
   B6A08   = 'Which satellite channels do you watch? (CHECK ALL THAT APPLY)'
   B6A09   = 'Which satellite channels do you watch? (CHECK ALL THAT APPLY)'
   B6A10   = 'Which satellite channels do you watch? (CHECK ALL THAT APPLY)'
   B6A11   = 'Which satellite channels do you watch? (CHECK ALL THAT APPLY)'
   B6A12   = 'Which satellite channels do you watch? (CHECK ALL THAT APPLY)'
   B6A13   = 'Which satellite channels do you watch? (CHECK ALL THAT APPLY)'
   B6A14   = 'Which satellite channels do you watch? (CHECK ALL THAT APPLY)'
   B6A15   = 'Which satellite channels do you watch? (CHECK ALL THAT APPLY)'
   B6A_SP  = 'Which satellite channels do you watch? (CHECK ALL THAT APPLY)'
   B7      = 'How many different telephone numbers does your household have, not counting those dedicated to a fax machine or compute'
   B8      = 'We would like a count of all computers and laptops that are used in your home whether you own them or not.  How many are'
   B9      = 'Do you, yourself, use a computer?'
   B10     = 'Thinking of all the places where you use a computer, about how often do you use it in a typical week?  Would you say ev'
   B11     = 'Do you use the Internet?'
   B12     = 'In a typical week, about how often do you read news items on the Internet- everyday, several days, one or two days, or'
   B12A    = 'Are any of the news items you read on the Internet in Arabic?'
   B13     = 'Do you connect to the Internet from home?'
   B14     = 'Do you use email?'
   B15     = 'About how often do you check your email - at least once a day, once a week, once a month, less often than that, or neve'
   B16     = 'The next set of questions deals with the extent to which people communicate with each other.   We''ll start with family.'
   B16A    = 'In a typical month do you talk or communicate with any of them?'
   B17     = 'Do you have family or relatives who live outside of Michigan but in the U.S.?'
   B17A    = 'In a typical month do you talk or communicate with any of them?'
   B18     = 'Do you have family or relatives who live outside the U.S.?'
   B18A    = 'In a typical month do you talk or communicate with any of them?'
   B19     = 'Now about friends--Do you have friends who live in Michigan?'
   B19A    = 'In a typical month do you talk or communicate with any of them?'
   B20     = 'Do you have friends who live outside of Michigan but in the U.S.?'
   B20A    = 'In a typical month do you talk or communicate with any of them?'
   B21     = 'Do you have friends who live outside the U.S.?'
   B21A    = 'In a typical month do you talk or communicate with any of them?'
   B22     = 'Do you have work or business contacts outside the U.S.?'
   B22A    = 'In a typical month do you talk in person or communicate with any of them?'
   C1      = 'Thinking politically and socially, how would you describe your own general outlook--as being very conservative, moderate'
   C2      = 'Generally, speaking, do you usually think of yourself as a Republican, Democrat, Independent or what?'
   C2_SP   = 'Generally, speaking, do you usually think of yourself as a Republican, Democrat, Independent or what?'
   C3      = 'Think back to the presidential election in November 2000...Did you happen to vote in that election?'
   C3A     = 'Who did you vote for?'
   C4      = 'Are you currently registered to vote?'
   C5      = 'How many times in the past twelve months have you attended any public meeting in which there was discussion of town or s'
   C5A     = 'Would you say you never did this, did it once, a few times, about once a month on average, twice a month, about once a'
   C5B     = 'Would that be closer to 2-4 times or 5-9 times?'
   C6      = '(How many times in the past twelve months have you) Attended any club or organizational meeting, not including meetings'
   C6A     = 'Would you say you  never did this, did it once, a few times, about once a month on average, twice a month, about once a'
   C6B     = 'Would that be closer to 2-4 times or 5-9 times?'
   C7      = '(How many times in the past twelve months have you) Had friends over to your home?'
   C7A     = 'Would you say you  never did this, did it once, a few times, about once a month on average, twice a month, about once a'
   C7B     = 'Would that be closer to 2-4 times or 5-9 times?'
   C8      = '(How many times in the past twelve months have you) Been in the home of a friend of a different race or had them in your'
   C8A     = 'Would you say you  never did this, did it once, a few times, about once a month on average, twice a month, about once a'
   C8B     = 'Would that be closer to 2-4 times or 5-9 times?'
   C9      = '(How many times in the past twelve months have you) Been in the home of someone of a different neighborhood or had them'
   C9A     = 'Would you say you  never did this, did it once, a few times, about once a month on average, twice a month, about once a'
   C9B     = 'Would that be closer to 2-4 times or 5-9 times?'
   C10     = '(How many times in the past twelve months have you) Been in the home of someone you consider to be a community leader or'
   C10A    = 'Would you say you  never did this, did it once, a few times, about once a month on average, twice a month, about once'
   C10B    = 'Would that be closer to 2-4 times or 5-9 times?'
   C11     = '(How many times in the past twelve months have you) Volunteered?'
   C11A    = 'Would you say you never did this, did it once, a few times, about once a month on average, twice a month, about once a'
   C11B    = 'Would that be closer to 2-4 times or 5-9 times?'
   C12     = 'Not including weddings and funerals, how often do you attend religious services?   Do you attend every week or more oft'
   C13     = 'How important is God in your life?  Please use this scale to indicate.  10 means very important and 1 means not at all'
   C14     = 'How often, if at all, do you think about the meaning and purpose of life?  Would you say often, sometimes, rarely, or n'
   C15     = 'On...are two statements which people sometimes make when discussing good and evil.  Which one comes closest to your poin'
   C16     = 'Now...voluntary organizations...whether you are active, inactive member, or neither: Sport or recreation organization'
   C17     = 'Art, music or cultural organization.  (Are you active in the organization, an inactive member, or neither?)'
   C18     = 'Labor union.  (Are you active in the organization, an inactive member, or neither?)'
   C19     = 'A parents'' association, like the PTA or PTO, or other school support or service group.  (Are you active in the organiza'
   C20     = 'Professional or business association.  (Are you active in the organization, an inactive member, or neither?)'
   C21     = 'Village or town club (like Ramallah or Bint Jebail)?  (Are you active in the organization, an inactive member, or neithe'
   C22     = 'Ethnic association, including advocacy groups like ADC, theYemeni Benevolent Association or the Chaldean Federation?  ('
   C23     = 'Church, synagogue, mosque or other religious organization.  Are you active in the organization, an inactive member, or'
   C24     = 'People and families contribute...past 12 months...how much money...household contribute in total'
   C25A    = 'Have you ever signed a petition?'
   C25B    = 'Is this something you might do, or would you never under any circumstances do it?'
   C25C    = 'Since January 2000, have you contributed money to any organization that supported political candidates?'
   C25D    = 'In the past 12 months, have you called or written a government official to express your opinion on a political issue?'
   C25E    = 'In the past 12 months, have you taken part in a protest, march, or demonstration about any social or political issue?'
   C26     = 'I am going to list a number of organizations...how much confidence in them...local public schools'
   C27     = 'The U.S. legal system.  (How much confidence do you have in it--a great deal, a lot, not very much, or none at all?)'
   C28     = 'Labor unions.  (How much confidence do you have in them--a great deal, a lot, not very much, or none at all?)'
   C29     = 'The local police.  (How much confidence do you have in them--a great deal, a lot, not very much, or none at all?)'
   C30     = 'The government in Washington, D.C.   (How much confidence do you have in it--a great deal, a lot, not very much, or non'
   C31     = 'Political parties.  (How much confidence do you have in them--a great deal, a lot, not very much, or none at all?)'
   C32     = 'The United Nations.  (How much confidence do you have in them--a great deal, a lot, not very much, or none at all?)'
   C33     = 'These next  questions...would you say that most people can be trusted or that you can''t be too careful in dealing with p'
   C34A    = 'Next we''d like to know how much you trust different groups of people...think about people in your neighborhood'
   C34B    = '(How about) Arab Americans?  (Can you trust them a lot, some, only a little, or not at all?)'
   C34C    = '(How about) White people?  (Can you trust them a lot, some, only a little, or not at all?)'
   C34D    = '(How about) African Americans or Blacks?  (Can you trust them a lot, some, only a little, or not at all?)'
   C34E    = '(How about) Hispanics or Latinos?  (Can you trust them a lot, some, only a little, or not at all?)'
   C35A    = '...how well different organizations serve community needs...Churches'
   C35B    = 'Mosques'
   C35C    = 'Village or town clubs, such as Ramallah  or Bint Jebail?'
   C35D    = 'Business and professional associations'
   C35E    = 'Civil liberties and anti-discrimination groups'
   C35F    = 'Arab and Chaldean social service agencies'
   C35G    = 'Local Arab media'
   C36A    = 'First, think about American news coverage of religion and religious people.  Do you think the coverage is biased in fa'
   C36B    = 'Next, think about American news coverage of Islam and Muslims.  Do you think the coverage is biased in favor, balanced'
   C36C    = 'Next, American news coverage of Arab/Chaldean Americans.  (Do you think the coverage is biased in favor, balanced, or'
   C36D    = 'Next, American news coverage of Israelis.  (Do you think the coverage is biased in favor, balanced, or biased against?'
   C36E    = 'Next, American news coverage of Palestinians.  (Do you think the coverage is biased in favor, balanced, or biased agai'
   C37     = 'Now I have two questions about the government in Washington...who is the current Attorney General of the U.S.'
   C38     = 'Which party currently has more members in the United States House of Representatives: the Democrats or the Republicans?'
   D1      = 'Now I have a few questions about the work you do.  Do you own your own business?'
   D2      = 'What kind of business is that?'
   D3      = 'Please turn to page 13 in your Blue Booklet and tell me which of these choices best describes your present work status:'
   D3_SP   = 'Please turn to page 13 in your Blue Booklet and tell me which of these choices best describes your present work status:'
   D4      = 'At the present time are you doing any work for pay?'
   D5      = 'Thinking about your main job, are you self-employed, are you employed by someone else, or what?'
   D6      = 'What is your occupation on your main job?  What sort of work do you do? (What are your most important activities or dut'
   D7      = 'What do they make or do where you work?  (What kind of business or industry is that in?)'
   D8      = 'Are you working part-time or full time?'
   D9      = 'Now for some questions about your background.  Do you feel that the term ''Arab American'' describes you?'
   D10A    = 'First statement -- For others to know me as I really am, it is important for them to know that I am Arab American.'
   D10B    = 'Next statement -- Being Arab American is a major factor in my social relationships.  Do you strongly agree, agree, nei'
   D10C    = 'Next -- I identify with other Arab Americans. (Do you strongly agree, agree, neither agree nor disagree, disagree, or'
   D10D    = 'And the last statement in this set - Arab Americans are not respected by the broader American society.  (Do you strong'
   D11     = 'Is there any other term like ''Arab American'' that better describes you?'
   D11A    = 'Is there any other term like ''Arab American'' that better describes you?'
   D11_SP  = 'Is there any other term like ''Arab American'' that better describes you?'
   D12A    = 'First statement -- For others to know me as I really am, it is important for them to know that I am (IDENTITY).  Do yo'
   D12B    = 'Next statement -- Being (IDENTITY) is a major factor in my social relationships.  Do you strongly agree, agree, neithe'
   D12C    = 'Next -- I identify with other (IDENTITY)s. (Do you strongly agree, agree, neither agree nor disagree, disagree, or str'
   D12D    = 'And the last statement in this set -- (IDENTITY)s are not respected by the broader American society.  (Do you strongly'
   D13     = 'Looking at the categories...which best describes your religion'
   D13_SP  = 'Looking at the categories...which best describes your religion: Other Specify'
   D14     = 'Are you Protestant, Catholic, or Orthodox Christian?'
   D14A    = 'Which Protestant church or denomination do you belong to?'
   D14B    = 'Are you Roman Catholic, Maronite, Chaldean, Melkite, or something else?'
   D14B_SP = 'Are you Roman Catholic, Maronite, Chaldean, Melkite, or something else?'
   D14C    = 'Are you Antiochian, Coptic, Greek, Russian, Syrian, or something else?'
   D14C_SP = 'Are you Antiochian, Coptic, Greek, Russian, Syrian, or something else?'
   D15A    = 'Are you Conservative, Orthodox, Reform, or something else?'
   D15A_SP = 'Are you Conservative, Orthodox, Reform, or something else?'
   D15B    = 'Are you Shi''a, Sunni, or another tradition?'
   D15B_SP = 'Are you Shi''a, Sunni, or another tradition?'
   D16A    = 'First statement -- For others to know me as I really am, it is important for them to know that I am (RELIGION/ HAVE NO'
   D16B    = 'Next statement -- Being (RELIGION/ HAVE NO RELIGION/ AM ATHEIST/ OTHER) is a major factor in my social relationships.'
   D16C    = 'Next -- I identify with other (RELIGION/ HAVE NO RELIGION/ AM ATHEIST/ OTHER)s. (Do you strongly agree, agree, neither'
   D16D    = 'And the last statement in this set -- (RELIGION/ HAVE NO RELIGION/ AM ATHEIST/ OTHER)s are not respected by the broade'
   D17_01  = '(ONLY FOR MUSLIMS, ALL OTHERS GO TO D18) Is it important to you to make a point of doing any of the following things?'
   D17_02  = '(ONLY FOR MUSLIMS, ALL OTHERS GO TO D18) Is it important to you to make a point of doing any of the following things?'
   D17_03  = '(ONLY FOR MUSLIMS, ALL OTHERS GO TO D18) Is it important to you to make a point of doing any of the following things?'
   D17_04  = '(ONLY FOR MUSLIMS, ALL OTHERS GO TO D18) Is it important to you to make a point of doing any of the following things?'
   D17_05  = '(ONLY FOR MUSLIMS, ALL OTHERS GO TO D18) Is it important to you to make a point of doing any of the following things?'
   D17_06  = '(ONLY FOR MUSLIMS, ALL OTHERS GO TO D18) Is it important to you to make a point of doing any of the following things?'
   D17_07  = '(ONLY FOR MUSLIMS, ALL OTHERS GO TO D18) Is it important to you to make a point of doing any of the following things?'
   D17_08  = '(ONLY FOR MUSLIMS, ALL OTHERS GO TO D18) Is it important to you to make a point of doing any of the following things?'
   D17_09  = '(ONLY FOR MUSLIMS, ALL OTHERS GO TO D18) Is it important to you to make a point of doing any of the following things?'
   D17_10  = '(ONLY FOR MUSLIMS, ALL OTHERS GO TO D18) Is it important to you to make a point of doing any of the following things?'
   D18_01  = '(ONLY FOR CHRISTIANS, ALL OTHERS GO TO D19)  Is it important to you to make a point of doing any of the following things'
   D18_02  = '(ONLY FOR CHRISTIANS, ALL OTHERS GO TO D19)  Is it important to you to make a point of doing any of the following things'
   D18_03  = '(ONLY FOR CHRISTIANS, ALL OTHERS GO TO D19)  Is it important to you to make a point of doing any of the following things'
   D18_04  = '(ONLY FOR CHRISTIANS, ALL OTHERS GO TO D19)  Is it important to you to make a point of doing any of the following things'
   D18_05  = '(ONLY FOR CHRISTIANS, ALL OTHERS GO TO D19)  Is it important to you to make a point of doing any of the following things'
   D18_06  = '(ONLY FOR CHRISTIANS, ALL OTHERS GO TO D19)  Is it important to you to make a point of doing any of the following things'
   D18_07  = '(ONLY FOR CHRISTIANS, ALL OTHERS GO TO D19)  Is it important to you to make a point of doing any of the following things'
   D18_08  = '(ONLY FOR CHRISTIANS, ALL OTHERS GO TO D19)  Is it important to you to make a point of doing any of the following things'
   D18_09  = '(ONLY FOR CHRISTIANS, ALL OTHERS GO TO D19)  Is it important to you to make a point of doing any of the following things'
   D18_10  = '(ONLY FOR CHRISTIANS, ALL OTHERS GO TO D19)  Is it important to you to make a point of doing any of the following things'
   D19A    = 'There are many ways...how much...does each of the following mean for you: Speaking Arabic'
   D19B    = 'Marrying someone of Arab background'
   D19C    = 'Participating in Arab art and cultural events'
   D19D    = 'Supporting Palestine'
   D19E    = 'Frequently visiting your family''s country of ancestry in the Arab world'
   D20_1   = 'There is a large, highly visible Arab American community in Dearborn.  How has this affected the image of Arab American'
   D20_2   = 'There is a large, highly visible Arab American community in Dearborn.  How has this affected the image of Arab American'
   D20_3   = 'There is a large, highly visible Arab American community in Dearborn.  How has this affected the image of Arab American'
   D20_4   = 'There is a large, highly visible Arab American community in Dearborn.  How has this affected the image of Arab American'
   D20_5   = 'There is a large, highly visible Arab American community in Dearborn.  How has this affected the image of Arab American'
   D21A    = '...experienced (in the past two years) due to your race, ethnicity or religion: Verbal insults or abuse (due to your rac'
   D21B    = 'Threatening words or gestures (due to your race, ethnicity, or religion)?'
   D21C    = 'Physical attack (due to your race, ethnicity, or religion)?'
   D21D    = 'Vandalism or destruction of property (due to your race, ethnicity, or religion)?'
   D21E    = 'Loss of employment (due to your race, ethnicity, or religion)?'
   E1      = 'Now for a few more background questions.  In what year were you born?'
   E2      = 'In what country were you born?'
   E2_SP   = 'In what country were you born?'
   E2A     = 'In what year did you come to live in the U.S.?'
   E2B     = 'What country did you immigrate from?'
   E2C     = 'Just before you came to America, what country were you living in?'
   E2D     = 'Are you a U.S. citizen?'
   E3      = 'In what country was your mother born?'
   E3_SP   = 'In what country was your mother born?'
   E3A     = 'Is your mother a U.S. citizen?'
   E3B     = 'In what country was her mother born?'
   E3C     = 'In what country was her father born?'
   E4      = 'In what country was your father born?'
   E4_SP   = 'In what country was your father born?'
   E4A     = 'Is your father a U.S. citizen?'
   E4B     = 'In what country was his mother born?'
   E4C     = 'In what country was his father born?'
   E5      = 'Have you ever moved from the United States to another country for more than 6 months?'
   E5A01   = 'Reasons why (moved from the US to another country for more than 6 months)'
   E5A02   = 'Reasons why (moved from the US to another country for more than 6 months)'
   E5A03   = 'Reasons why (moved from the US to another country for more than 6 months)'
   E5A04   = 'Reasons why (moved from the US to another country for more than 6 months)'
   E5A05   = 'Reasons why (moved from the US to another country for more than 6 months)'
   E5A06   = 'Reasons why (moved from the US to another country for more than 6 months)'
   E5A07   = 'Reasons why (moved from the US to another country for more than 6 months)'
   E5A08   = 'Reasons why (moved from the US to another country for more than 6 months)'
   E5A09   = 'Reasons why (moved from the US to another country for more than 6 months)'
   E5A_SP  = 'Reasons why (moved from the US to another country for more than 6 months)'
   E5B     = 'Please identify country(ies) of residence for more than 6 months.'
   E6      = 'Are you married, widowed, divorced, separated, or have you never been married?'
   E6A     = 'Are you currently living with a partner?'
   E6B     = 'What is your (spouse''s/partner''s) ancestry or ethnic origin?'
   E6C     = 'Is your (spouse/partner) a U.S. citizen?'
   E6D     = 'Which of these choices best describes the present work status of your (spouse/partner)'
   E6D_SP  = 'Which of these choices best describes the present work status of your (spouse/partner)'
   E7      = 'What is the highest grade of school or degree that you completed?'
   E7_SP   = 'What is the highest grade of school or degree that you completed?'
   E8      = 'Have you ever been a member of any branch of the U.S. Armed Forces including being a member of the Reserves, National Gu'
   E9      = 'Do you speak a language other than English at home?'
   E10     = 'What language(s) is it (are they)?'
   E10_CKPT= 'If Arabic, ask E10a thru E10d, Otherwise skip to E11'
   E10A    = 'Listen to radio and television news in Arabic'
   E10B    = 'Read newspapers and magazines in Arabic'
   E10C    = 'Write a letter in formal Arabic'
   E10D    = 'Talk with Arabic-speaking friends and family in Arabic'
   E11     = 'How well do you speak English?'
   E12     = 'How well do you read English?'
   E13     = 'How well do you write English?'
   E14     = 'Please...tell me the number of the income group that includes your total family income...'
   E15     = 'Do you have health insurance?'
   E16     = 'How many children do you have, including those who live elsewhere?'
   E17     = 'I would like a count of how many people live in your household, including children or babies, yourself, and anyone else'
   F1_1    = '...list of qualities that children can be encouraged to learn at home...which...especially important'
   F1_2    = '...list of qualities that children can be encouraged to learn at home...which...especially important'
   F1_3    = '...list of qualities that children can be encouraged to learn at home...which...especially important'
   F1_4    = '...list of qualities that children can be encouraged to learn at home...which...especially important'
   F1_5    = '...list of qualities that children can be encouraged to learn at home...which...especially important'
   F2      = 'People sometimes talk about what the aims of this country should be...which...is most important'
   F3      = 'And which would be the next most important?'
   F4      = 'On another topic, how proud are you to be American?  Would you say you are very proud, quite proud, not very proud, or n'
   F5      = 'Please tell me how you feel about each of the following statements.  First-The United States is a land of equal opportun'
   F6      = 'Next statement--Income differences in the United States are too large.  Do you strongly agree, agree, neither agree nor'
   F7      = 'Next--Immigrants are generally good for the U.S. economy.  (Do you strongly agree, agree, neither agree nor disagree, di'
   F8      = 'Next--Immigrants increase crime rates.  (Do you strongly agree, agree, neither agree nor disagree, disagree, or strongly'
   F9      = '(RB, p. 28)  Immigrants make America more open to new ideas and cultures.  (Do you strongly agree, agree, neither agree'
   F10     = 'And last in this set, the government should give a special tax break to parents who send their children to religious or'
   F11A    = 'Less emphasis on money and material possessions.  Would that be a good thing, bad thing, or don''t you mind?'
   F11B    = 'Greater respect for authority. (Would that be a good thing, bad thing, or don''t you mind?)'
   F11C    = 'More emphasis on family life.  (Would that be a good thing, bad thing, or don''t you mind?)'
   F12A    = '...think it can always be justified, never be justified, or something in between: Divorce'
   F12B    = 'Organ donation after death'
   F12C    = 'Women working outside the home while they have small children'
   F12D    = 'Gambling'
   F12E    = 'Drinking alcohol'
   F12F    = 'Premarital Sex'
   F12G    = 'Homosexuality'
   F12H    = 'Abortion'
   G1A     = 'During the past 12 months, how often did you feel tired out for no good reason-all of the time, most of the time, some'
   G1B     = 'During the past 12 months, how often did you feel nervous-all of the time, most of the time, some of the time, almost n'
   G1C     = 'During the past 12 months, how often did you feel so nervous that nothing could calm you down (-all of the time, most o'
   G1D     = 'During the past 12 months, how often did you feel hopeless (-all of the time, most of the time, some of the time, almos'
   G1E     = 'During the past 12 months, how often did you feel restless and fidgety (-all of the time, most of the time, some of the'
   G1F     = 'During the past 12 months, how often did you feel so restless you could not sit still (-all of the time, most of the ti'
   G1G     = 'During the past 12 months, how often did you feel depressed (-all of the time, most of the time, some of the time, almo'
   G1H     = 'During the past 12 months, how often did you feel so depressed that nothing could cheer you up (-all of the time, most'
   G1J     = 'During the past 12 months, how often did you feel that everything was an effort (-all of the time, most of the time, so'
   G1K     = 'During the past 12 months, how often did you feel worthless (-all of the time, most of the time, some of the time, almo'
   G21     = 'IWER CHECKPOINT:  R SAID ALL OF THE TIME, MOST OF THE TIME, OR SOME OF THE TIME TO THE FOLLOWING:'
   G22     = 'IWER CHECKPOINT:  R SAID ALL OF THE TIME,  MOST OF THE TIME, OR SOME OF THE TIME TO THE FOLLOWING:  TIRED OUT FOR'
   G23     = 'IWER CHECKPOINT:  R SAID ALL OF THE TIME,  MOST OF THE TIME, OR SOME OF THE TIME TO THE FOLLOWING:  NERVOUS'
   G24     = 'IWER CHECKPOINT:  R SAID ALL OF THE TIME,  MOST OF THE TIME, OR SOME OF THE TIME TO THE FOLLOWING:  HOPELESS'
   G25     = 'IWER CHECKPOINT:  R SAID ALL OF THE TIME,  MOST OF THE TIME,  OR SOME OF THE TIME TO THE FOLLOWING:  RESTLESS AND F'
   G26     = 'IWER CHECKPOINT:  R SAID ALL OF THE TIME,  MOST OF THE TIME, OR SOME OF THE TIME TO THE FOLLOWING:  _____(FELT) TH'
   G27     = 'IWER CHECKPOINT:  R SAID ALL OF THE TIME,  MOST OF THE TIME, OR SOME OF THE TIME TO THE FOLLOWING:  WORTHLESS'
   G3      = 'You have said that during the past 12 months you felt...What are some of the things that made you feel that way?'
   H1      = 'First... In recent times, the United States has been deeply involved in the Middle East in various ways.  On the whole,'
   H2      = 'Next... Do you support or oppose the establishment of an independent Palestinian state on the West Bank and Gaza, or hav'
   H3      = 'In 1948 Israel became an independent state.  Some people believe that this event was the fulfillment of prophecy.  Other'
   H4A     = 'U.S.-based media--were they very reliable, somewhat reliable, or not reliable as sources of information?'
   H4B     = 'Media from the Arab world--were they very reliable, somewhat reliable, or not reliable as sources of information?'
   H4C     = 'Local community leaders (--were they very reliable, somewhat reliable, or not reliable as sources of information)?'
   H4D     = 'Family and friends (--were they very reliable, somewhat reliable, or not reliable as sources of information)?'
   H5      = 'Since 9/11, how closely have you been following the news about the ''war on terrorism''-- very closely, closely, a little'
   H6      = 'Since 9/11, have you personally had a bad experience due to your Arab or Chaldean ethnicity?'
   H6A     = 'Please explain:'
   H7      = 'In the weeks after 9/11, did anyone who was not of Middle Eastern background show you support or solidarity?'
   H7A     = 'Please explain:'
   H8      = 'Referring to page 31 of your Blue Booklet, to what extent do you agree or disagree with this statement.  Since 9-11, as'
   H9      = 'To what extent do you agree or disagree with this statement:  I feel at home in America.  Do you strongly agree, agree,'
   H10     = 'Has your feeling on this changed since September 11th?'
   H11A    = 'First... It''s because the U.S. supports Israel.'
   H11B    = 'It''s because of the U.S. intervention in the Persian Gulf.'
   H11C    = 'Here are a few more possible explanations for the terrorist attacks on 9/11.  It''s because of the conflict between Chr'
   H11D    = 'It''s because of the extremist beliefs of a few terrorists.'
   H11E    = 'It''s because the U. S. believes in democracy, freedom and equal rights for women.'
   H12     = 'How much-if any-have the events of 9/11 shaken your own personal sense of safety and security?  Have they shaken it a g'
   H13     = 'Would you be willing to give up some civil liberties if that were necessary to curb terrorism in this country?'
   H14A    = 'Increasing surveillance of U. S. citizens by the government?'
   H14B    = 'Giving the police powers to stop and search anyone at random?'
   H14C    = 'Detaining some suspicious individuals even if there is not sufficient evidence to prosecute them in the courts?'
   H14D    = 'Increasing surveillance of Arab Americans by the government?'
   H14E    = 'Giving the police powers to stop and search anyone who appears to be Arab or Muslim, at random?'
   H14F    = 'Detaining some suspicious Arabs and/or Muslims even if there is not sufficient evidence to prosecute them in the court'
   H15     = 'Do you think Arabs or Muslims who are accused of supporting or engaging in terrorism can receive fair trials in the U.S.'
   H16     = 'Using the categories on page 31 in the Blue Booklet: Do you strongly agree, agree, neither agree nor disagree, disagree'
   H17     = 'Next, I want to ask two questions about relations in the metro Detroit region between Arab Americans and other resident'
   H18     = 'How about between Muslims and Christians in the Arab and Chaldean community?    Have relations become more distant, clo'
   H19     = 'How closely have you been following the news relating to the conflict between the U.S. and Iraq -- very closely, closel'
   H20     = 'How much-if any-have the events relating to the conflict between the U.S. and Iraq shaken your own personal sense of sa'
   H21     = 'We are about at the end of this interview.  I''d like to finish this interview with a couple of general questions abou'
   H22     = 'What are the three most pressing needs facing your local Arab or Chaldean community?'
   J1      = 'COMPLEXION OF RESPONDENT'
   J2      = 'SEX OF RESPONDENT'
   J3      = 'INTERVIEW CONDUCTED IN'
   J4      = 'LOCATION OF INTERVIEW'
   J4_SP   = 'LOCATION OF INTERVIEW'
   J5      = 'WAS INTERVIEW CONDUCTED IN A PRIVATE SETTING?'
   J5A     = 'IF NO, WERE FAMILY MEMBERS OR FRIENDS PRESENT?'
   J5B     = 'NUMBER OF OTHER PEOPLE PRESENT'
   J5C     = 'DID RESPONDENT CONSULT WITH OTHERS BEFORE RESPONDING?'
   J5D     = 'DID OTHERS PRESENT TRY TO ANSWER FOR RESPONDENT?'
   J6      = 'DID R SEEM GUARDED, NERVOUS, OR SUSPICIOUS ABOUT THE INTERVIEW?'
   J7      = 'WAS INTERVIEW CONDUCTED IN PERSON OR BY TELEPHONE?'
        ;


* SAS FORMAT STATEMENT;

/*
  FORMAT I_MONTH I_MONTH. A1_YEAR A1_YEAR. A1_MONTH A1_MONTH.
         A2 A2ffffff. A3 A3ffffff. A4 A4ffffff.
         A5 A5ffffff. A6_1 A6_1ffff. A6_2 A6_2ffff.
         A6_3 A6_3ffff. A6_4 A6_4ffff. A6_5 A6_5ffff.
         A6_6 A6_6ffff. A6_7 A6_7ffff. B1 B1ffffff.
         B2 B2ffffff. B2A B2A. B2B B2B.
         B2C B2C. B3 B3ffffff. B3A B3A.
         B4 B4ffffff. B4A B4A. B4B B4B.
         B5A B5A. B5B B5B. B5C B5C.
         B5D B5D. B5E B5E. B6 B6ffffff.
         B6A01 B6A01fff. B6A02 B6A02fff. B6A03 B6A03fff.
         B6A04 B6A04fff. B6A05 B6A05fff. B6A06 B6A06fff.
         B6A07 B6A07fff. B6A08 B6A08fff. B6A09 B6A09fff.
         B6A10 B6A10fff. B6A11 B6A11fff. B6A12 B6A12fff.
         B6A13 B6A13fff. B6A14 B6A14fff. B6A15 B6A15fff.
         B7 B7ffffff. B8 B8ffffff. B9 B9ffffff.
         B10 B10fffff. B11 B11fffff. B12 B12fffff.
         B12A B12A. B13 B13fffff. B14 B14fffff.
         B15 B15fffff. B16 B16fffff. B16A B16A.
         B17 B17fffff. B17A B17A. B18 B18fffff.
         B18A B18A. B19 B19fffff. B19A B19A.
         B20 B20fffff. B20A B20A. B21 B21fffff.
         B21A B21A. B22 B22fffff. B22A B22A.
         C1 C1ffffff. C2 C2ffffff. C3 C3ffffff.
         C3A C3A. C4 C4ffffff. C5 C5ffffff.
         C5A C5A. C5B C5B. C6 C6ffffff.
         C6A C6A. C6B C6B. C7 C7ffffff.
         C7A C7A. C7B C7B. C8 C8ffffff.
         C8A C8A. C8B C8B. C9 C9ffffff.
         C9A C9A. C9B C9B. C10 C10fffff.
         C10A C10A. C10B C10B. C11 C11fffff.
         C11A C11A. C11B C11B. C12 C12fffff.
         C13 C13fffff. C14 C14fffff. C15 C15fffff.
         C16 C16fffff. C17 C17fffff. C18 C18fffff.
         C19 C19fffff. C20 C20fffff. C21 C21fffff.
         C22 C22fffff. C23 C23fffff. C24 C24fffff.
         C25A C25A. C25B C25B. C25C C25C.
         C25D C25D. C25E C25E. C26 C26fffff.
         C27 C27fffff. C28 C28fffff. C29 C29fffff.
         C30 C30fffff. C31 C31fffff. C32 C32fffff.
         C33 C33fffff. C34A C34A. C34B C34B.
         C34C C34C. C34D C34D. C34E C34E.
         C35A C35A. C35B C35B. C35C C35C.
         C35D C35D. C35E C35E. C35F C35F.
         C35G C35G. C36A C36A. C36B C36B.
         C36C C36C. C36D C36D. C36E C36E.
         C37 C37fffff. C38 C38fffff. D1 D1ffffff.
         D3 D3ffffff. D4 D4ffffff. D5 D5ffffff.
         D6 $D6fffff. D7 $D7fffff. D8 D8ffffff.
         D9 D9ffffff. D10A D10A. D10B D10B.
         D10C D10C. D10D D10D. D11A D11A.
         D12A D12A. D12B D12B. D12C D12C.
         D12D D12D. D13 D13fffff. D14 D14fffff.
         D14B D14B. D14C D14C. D15A D15A.
         D15B D15B. D16A D16A. D16B D16B.
         D16C D16C. D16D D16D. D17_01 D17_01ff.
         D17_02 D17_02ff. D17_03 D17_03ff. D17_04 D17_04ff.
         D17_05 D17_05ff. D17_06 D17_06ff. D17_07 D17_07ff.
         D17_08 D17_08ff. D17_09 D17_09ff. D17_10 D17_10ff.
         D18_01 D18_01ff. D18_02 D18_02ff. D18_03 D18_03ff.
         D18_04 D18_04ff. D18_05 D18_05ff. D18_06 D18_06ff.
         D18_07 D18_07ff. D18_08 D18_08ff. D18_09 D18_09ff.
         D18_10 D18_10ff. D19A D19A. D19B D19B.
         D19C D19C. D19D D19D. D19E D19E.
         D20_1 D20_1fff. D20_2 D20_2fff. D20_3 D20_3fff.
         D20_4 D20_4fff. D20_5 D20_5fff. D21A D21A.
         D21B D21B. D21C D21C. D21D D21D.
         D21E D21E. E1 E1ffffff. E2 E2ffffff.
         E2A E2A. E2D E2D. E3 E3ffffff.
         E3A E3A. E4 E4ffffff. E4A E4A.
         E5 E5ffffff. E5A01 E5A01fff. E5A02 E5A02fff.
         E5A03 E5A03fff. E5A04 E5A04fff. E5A05 E5A05fff.
         E5A06 E5A06fff. E5A07 E5A07fff. E5A08 E5A08fff.
         E5A09 E5A09fff. E6 E6ffffff. E6A E6A.
         E6C E6C. E6D E6D. E7 E7ffffff.
         E8 E8ffffff. E9 E9ffffff. E10_CKPT E10_CKPT.
         E10A E10A. E10B E10B. E10C E10C.
         E10D E10D. E11 E11fffff. E12 E12fffff.
         E13 E13fffff. E14 E14fffff. E15 E15fffff.
         E16 E16fffff. E17 E17fffff. F1_1 F1_1ffff.
         F1_2 F1_2ffff. F1_3 F1_3ffff. F1_4 F1_4ffff.
         F1_5 F1_5ffff. F2 F2ffffff. F3 F3ffffff.
         F4 F4ffffff. F5 F5ffffff. F6 F6ffffff.
         F7 F7ffffff. F8 F8ffffff. F9 F9ffffff.
         F10 F10fffff. F11A F11A. F11B F11B.
         F11C F11C. F12A F12A. F12B F12B.
         F12C F12C. F12D F12D. F12E F12E.
         F12F F12F. F12G F12G. F12H F12H.
         G1A G1A. G1B G1B. G1C G1C.
         G1D G1D. G1E G1E. G1F G1F.
         G1G G1G. G1H G1H. G1J G1J.
         G1K G1K. G21 G21fffff. G22 G22fffff.
         G23 G23fffff. G24 G24fffff. G25 G25fffff.
         G26 G26fffff. G27 G27fffff. H1 H1ffffff.
         H2 H2ffffff. H3 H3ffffff. H4A H4A.
         H4B H4B. H4C H4C. H4D H4D.
         H5 H5ffffff. H6 H6ffffff. H7 H7ffffff.
         H8 H8ffffff. H9 H9ffffff. H10 H10fffff.
         H11A H11A. H11B H11B. H11C H11C.
         H11D H11D. H11E H11E. H12 H12fffff.
         H13 H13fffff. H14A H14A. H14B H14B.
         H14C H14C. H14D H14D. H14E H14E.
         H14F H14F. H15 H15fffff. H16 H16fffff.
         H17 H17fffff. H18 H18fffff. H19 H19fffff.
         H20 H20fffff. J1 J1ffffff. J2 J2ffffff.
         J3 J3ffffff. J4 J4ffffff. J5 J5ffffff.
         J5A J5A. J5B J5B. J5C J5C.
         J5D J5D. J6 J6ffffff. J7 J7ffffff.
          ;
*/

RUN ;
