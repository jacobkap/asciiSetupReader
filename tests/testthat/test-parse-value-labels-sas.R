context("parse-value-labels-sas")

test_that("Number of value label columns are correct", {

  expect_equal(length(crosswalk_parsed_sas$value_labels), 19)
  expect_equal(length(parole_parsed_sas$value_labels), 51)
  #  expect_equal(length(ucr1985_parsed_sas$value_labels), )
  #  expect_equal(length(ucr1986_parsed_sas$value_labels), )
  #  expect_equal(length(ucr2000_parsed_sas$value_labels), )
  #  expect_equal(length(ucr2006_parsed_sas$value_labels), )
  #  expect_equal(length(sac_parsed_sas$value_labels), )
  expect_equal(length(sex_offender_parsed_sas$value_labels), 32)
  #  expect_equal(length(ucr1960_parsed_sas$value_labels), )
  expect_equal(length(weimar_parsed_sas$value_labels), 0)
  expect_equal(length(acs_parsed_sas$value_labels), 4)
  expect_equal(length(nibrs_parsed_sas$value_labels), 9)
  #  expect_equal(length(prisoners_parsed_sas$value_labels), )
  expect_equal(length(ca_vital_parsed_sas$value_labels), 36)
  expect_equal(length(property_stolen_parsed_sas$value_labels), 15)
  #  expect_equal(length(ASR), 36)
  expect_equal(length(corrections_parsed_sas$value_labels), 9)
  expect_equal(length(jail_2010_parsed_sas$value_labels), 123)
  expect_equal(length(health_nutrition_parsed_sas$value_labels), 36)
  expect_equal(length(step_in_parsed_sas$value_labels), 4)
  expect_equal(length(census_police_parsed_sas$value_labels), 76)
  expect_true(is.null(education_1995_parsed_sas$value_labels))
  expect_true(is.null(education_1985_parsed_sas$value_labels))
  expect_true(is.null(cps_1973_parsed_sas$value_labels))
  # expect_equal(length(cps_2004_parsed_sas$value_labels), )
  # expect_equal(length(drug_abuse_parsed_sas$value_labels), )
   expect_true(is.null(british_crime_teen_parsed_sps$value_labels))
  # expect_equal(length(detroit_parsed_sas$value_labels), )
  # expect_equal(length(worry_parsed_sas$value_labels), )
   expect_equal(length(cambridge_parsed_sas$value_labels), 879)
   #expect_equal(length(guam_parsed_sas$value_labels), )
   expect_equal(length(china_2002_parsed_sas$value_labels), 79)
   expect_equal(length(china_1995_parsed_sas$value_labels), 29)
   expect_equal(length(china_1998_parsed_sas$value_labels), 47)
   expect_true(is.null(indonesia_parsed_sas$value_labels))
   expect_equal(length(UN_crime_parsed_sas$value_labels), 119)
   expect_true(is.null(county_arrest_parsed_sas$value_labels))
})


test_that("PSID All - parsed value labels are accurate", {

  expect_equal(head(names(psid_all_parsed_sas$value_labels)),
               c("ER30000",
                 "ER30003",
                 "ER30005",
                 "ER30006",
                 "ER30009",
                 "ER30010"))
  expect_equal(tail(names(psid_all_parsed_sas$value_labels)),
               c("ER34611",
                 "ER34644",
                 "ER34646",
                 "ER34647",
                 "ER34648",
                 "ER34649"))

  expect_equal(psid_all_parsed_sas$value_labels$ER30000,
               c("Release number 1, February 2019" = "1",
                 "Release number 2, May 2019" = "2"))
  expect_equal(psid_all_parsed_sas$value_labels$ER30003,
               c("Head" = "1",
                 "Wife/Wife" = "2",
                 "Son or daughter" = "3",
                 "Brother or sister" = "4",
                 "Father or mother" = "5",
                 "Grandchild, niece, nephew, other relatives under 18" = "6",
                 "Other, including in-laws, other adult relatives" = "7",
                 "Husband or Wife of Head who moved out or died in the year prior to the 1968 interview" = "8",
                 "NA" = "9",
                 "Individual from core sample who was born or moved in after the 1968 interview individual from Immigrant or Latino samples (ER30001 3001-3511, 4001-4462,7001-9308)" = "0"))
  expect_equal(psid_all_parsed_sas$value_labels$ER30010,
               c("Highest grade or year of schooling completed" = "1 - 16",
                 "At least one year of postgraduate work" = "17",
                 "NA DK" = "99",
                 "Preschool born or moved in after the 1968 interview or individual from Immigrant or Latino samples (ER30003 0) still in school (ER30009 1 or 9)" = "0"))
  expect_equal(psid_all_parsed_sas$value_labels$ER30382,
               c("Working now" = "1",
                 "Only temporarily laid off" = "2",
                 "Looking for work, unemployed" = "3",
                 "Retired" = "4",
                 "Permanently disabled" = "5",
                 "HouseWife keeping house" = "6",
                 "Student" = "7",
                 "Other" = "8",
                 "NA DK" = "9",
                 "Inap.: from Immigrant or Latino samples (ER30001 3001-3511,4001-4462,7001-9308) born or moved in after the 1982 interview (ER30373>0 and ER30374 0) main family nonresponse by 1982 or mover-out nonr esponse by 1981 (ER30373 0) mover-out nonresponse for 1982 only if deceased (ER30374 81-89) in an institution in both 1981 and 1982 (ER30374 51-59 and ER30378 0) not a person aged 16 or older (ER30376 001-015)" = "0"))
  expect_equal(psid_all_parsed_sas$value_labels$ER30383,
               c("Full-time student" = "1",
                 "Part-time student" = "3",
                 "Not enrolled in school" = "5",
                 "NA DK" = "9",
                 "Inap.: from Immigrant or Latino samples (ER30001 3001-3511,4001-4462,7001-9308) born or moved in after the 1982 interview (ER30373>0 and ER30374 0) main family nonresponse by 1982 or mover-out nonr esponse by 1981 (ER30373 0) Head or Wife in 1982 (ER30374 1-20 and ER30375 1 or 02) in an institution in both 1981 and 1982 (ER30374 51-59 and ER30378 0) not a person aged 16 or older (ER30376 001- 015)" = "0"))
  expect_equal(psid_all_parsed_sas$value_labels$ER30384,
               c("Highest grade or year of school completed" = "1 - 17",
                 "NA DK" = "99",
                 "Inap.: from Immigrant or Latino samples (ER30001 3001-3511,4001-4462,7001-9308) born or moved in after the 1982 interview (ER30373>0 and ER30374 0) main family nonresponse by 1982 or mover-out nonr esponse by 1981 (ER30373 0) in an institution in both 1981 and 1982 (ER30374 51-59 and ER30378 0) not a person aged 16 or older (ER30376 001-015)" = "0"))
  expect_equal(psid_all_parsed_sas$value_labels$ER33295,
               c("Yes" = "1",
                 "No" = "5",
                 "Doesnt do" = "7",
                 "DK" = "8",
                 "NA" = "9",
                 "Inap.: from Immigrant sample (ER30001 3001-3511,4001-4462) main family nonresponse by 1995 or mover-out nonresponse by 1994 (ER33201 0) born or moved in after the 1995 interview (ER33201>0 and ER33 202 0) in an institution or mover-out nonresponse in 1995 (ER33202 51-89) not a person age 55 or older (ER33204 001-054)" = "0"))
  expect_equal(psid_all_parsed_sas$value_labels$ER33296,
               c("Yes" = "1",
                 "No" = "5",
                 "Doesnt do" = "7",
                 "DK" = "8",
                 "NA" = "9",
                 "Inap.: from Immigrant sample (ER30001 3001-3511,4001-4462) main family nonresponse by 1995 or mover-out nonresponse by 1994 (ER33201 0) born or moved in after the 1995 interview (ER33201>0 and ER33 202 0) in an institution or mover-out nonresponse in 1995 (ER33202 51-89) not a person age 55 or older (ER33204 001-054)" = "0"))
  expect_equal(psid_all_parsed_sas$value_labels$ER34648,
               c("This sample member was main family nonresponse and had been in the FU in 2015." = "1",
                 "This nonsample individual had been in the 2015 FU, and this FU became nonresponse in 2017." = "3",
                 "This sample member had been in an institution in 2015, but his or her family became nonresponse in 2017." = "4",
                 "This sample member, linked to a 2017 response family, was in an institution at the time of the 2017 interview." = "5",
                 "This sample member moved out or died between the 2015 and 2017 interviews." = "6",
                 "This nonsample individual moved out or died between the 2015 and 2017 interviews." = "8",
                 "This individual had become nonresponse by the time of the 2017 interview." = "10",
                 "Main family recontact: this person was selected for recontact in 2017, but the family was not successfully interviewed." = "21",
                 "Splitoff recontact: this sample member moved out of a 2017 recontact main family but was not successfully interviewed." = "26",
                 "Individual connected with the Latino sample (ER30001 7001-9308) this sample was dropped beginning in 1996. Individual dropped from the Census (SEO) sample due to budgetary constraints this group wa s dropped beginning in 1997." = "40",
                 "DK NA" = "99",
                 "Inap.: this individual was in a panel family in 2017 (ER34502 1-20)." = "0"))
})


test_that("psid_main - parsed value labels are accurate", {

  expect_equal(head(names(psid_main_parsed_sas$value_labels)),
               c("ER30000",
                 "ER30003",
                 "ER30005",
                 "ER30006",
                 "ER30007",
                 "ER30010"))
  expect_equal(tail(names(psid_main_parsed_sas$value_labels)),
               c("TA151282",
                 "TA151286",
                 "TA151288",
                 "TA151290",
                 "TA151291",
                 "TA151301"))

  expect_equal(psid_main_parsed_sas$value_labels$ER30000,
               c("Release number 1, February 2019" = "1",
                 "Release number 2, May 2019" = "2"))
  expect_equal(psid_main_parsed_sas$value_labels$ER30003,
               c("Head" = "1",
                 "Wife/Wife" = "2",
                 "Son or daughter" = "3",
                 "Brother or sister" = "4",
                 "Father or mother" = "5",
                 "Grandchild, niece, nephew, other relatives under 18" = "6",
                 "Other, including in-laws, other adult relatives" = "7",
                 "Husband or Wife of Head who moved out or died in the year prior to the 1968 interview" = "8",
                 "NA" = "9",
                 "Individual from core sample who was born or moved in after the 1968 interview individual from Immigrant or Latino samples (ER30001 3001-3511, 4001-4462,7001-9308)" = "0"))
  expect_equal(psid_main_parsed_sas$value_labels$ER30010,
               c("Highest grade or year of schooling completed" = "1 - 16",
                 "At least one year of postgraduate work" = "17",
                 "NA DK" = "99",
                 "Preschool born or moved in after the 1968 interview or individual from Immigrant or Latino samples (ER30003 0) still in school (ER30009 1 or 9)" = "0"))
  expect_equal(psid_main_parsed_sas$value_labels$TA050372,
               c("Checked with a public employment agency" = "1",
                 "DK" = "8",
                 "NA refused" = "9",
                 "Inap.: has not checked with a public employment agency has not been looking for work during the past four weeks (TA050371 5,8 or 9) not head or wife/Wife in 2005 PSID interview (TA050011 3)" = "0"))
  expect_equal(psid_main_parsed_sas$value_labels$TA110336,
               c("Hour" = "1",
                 "Day" = "2",
                 "Week" = "3",
                 "Two Weeks" = "4",
                 "Month" = "5",
                 "Year" = "6",
                 "Other" = "7",
                 "DK" = "8",
                 "NA refused NA, DK, RF how much money earned at job 5 in 2010 (TA110335 9999998 or 9999999 or -999999)" = "9",
                 "Inap.: has not done any work for money since January 1, 2009 (TA110141 5) NA, DK, RF whether any work done for money since January 1, 2009 (TA110141 8 or 9) fewer than five employers (TA110323 0)job 5 began after 2010 (TA110324 gt 2010) job 5 ended before 2010 (TA110326 lt 2010) NA, DK, RF year when job 5 ended (TA110326 9998 or 9999)" = "0"))
  expect_equal(psid_main_parsed_sas$value_labels$TA131219,
               c("Actual value" = "1 - 7",
                 "Has no children (TA130100 0)" = "0",
                 "All items are DK/NA/refused" = "9"))
  expect_equal(psid_main_parsed_sas$value_labels$TA151290,
               c("Never married, cohabiting" = "1",
                 "Never married, not cohabiting" = "2",
                 "Married, spouse present" = "3",
                 "Married, spouse not present" = "4",
                 "Separated" = "5",
                 "Divorced, cohabiting" = "6",
                 "Divorced, not cohabiting" = "7",
                 "Widowed" = "8",
                 "NA DK refused" = "9"))
  expect_equal(psid_main_parsed_sas$value_labels$TA151291,
               c("Northeast" = "1",
                 "North Central" = "2",
                 "South" = "3",
                 "West" = "4",
                 "Alaska, Hawaii" = "5",
                 "Foreign country" = "6",
                 "NA DK refused" = "9"))
  expect_equal(psid_main_parsed_sas$value_labels$TA151301,
               c("Less than high school diploma" = "1",
                 "GED, no college" = "2",
                 "High school graduate, no college" = "3",
                 "GED plus some college" = "4",
                 "High school graduate plus some college" = "5",
                 "GED plus Associates degree" = "6",
                 "High school graduate plus Associates degree" = "7",
                 "GED plus Bachelors degree" = "8",
                 "High school graduate plus Bachelors degree" = "9",
                 "GED plus Masters degree" = "10",
                 "High school graduate plus Masters degree" = "11",
                 "GED plus Doctoral degree" = "12",
                 "High school graduate plus Doctoral degree" = "13",
                 "GED plus Medical degree" = "14",
                 "High school graduate plus Medical degree" = "15",
                 "GED plus Law degree" = "16",
                 "High school graduate plus Law degree" = "17",
                 "GED plus other degree" = "18",
                 "High school graduate plus other degree" = "19",
                 "Skipped, asked in TA 2013" = "96",
                 "NA DK refused" = "99"))
})

test_that("Cambridge - parsed value labels are accurate", {

  expect_equal(head(names(cambridge_parsed_sas$value_labels)),
               c("V1",
                 "V2",
                 "V3",
                 "V5",
                 "V6",
                 "V7"))
  expect_equal(tail(names(cambridge_parsed_sas$value_labels)),
               c("V875",
                 "V876",
                 "V877",
                 "V878",
                 "V879",
                 "V880"))

  expect_equal(cambridge_parsed_sas$value_labels$V1,
               c("(8488) ICPSR STUDY NO." = "8488"))
  expect_equal(cambridge_parsed_sas$value_labels$V2,
               c("(2) 2ND VERSION" = "2"))
  expect_equal(cambridge_parsed_sas$value_labels$V13,
               c("(0) NONE" = "0",
                 "(1) ONE" = "1",
                 "(2) TWO" = "2"))
  expect_equal(cambridge_parsed_sas$value_labels$V303,
               c("(1) NOT POOR" = "1",
                 "(2) POOR" = "2"))
  expect_equal(cambridge_parsed_sas$value_labels$V308,
               c("(1) II" = "1",
                 "(2) III" = "2",
                 "(3) IV" = "3",
                 "(4) V" = "4"))
  expect_equal(cambridge_parsed_sas$value_labels$V879,
               c("(0) NK-UNASCERTAIN" = "0",
                 "(1) PAY TAX" = "1",
                 "(2) AVOID TAX ILLEGL" = "2"))
  expect_equal(cambridge_parsed_sas$value_labels$V418,
               c("(0) NK-UNASCERTAIN" = "0",
                 "(1) <=9 -FEW ERRS" = "1",
                 "(2) 10-13" = "2",
                 "(3) 14-18" = "3",
                 "(4) >=19 -MANY ERRS" = "4"))
  expect_equal(cambridge_parsed_sas$value_labels$V419,
               c("(0) NK-UNASCERTAIN" = "0",
                 "(1) <=9 -HIGH TQ" = "1",
                 "(2) 10-12" = "2",
                 "(3) 13-15" = "3",
                 "(4) >=16 -LOW TQ" = "4"))
  expect_equal(cambridge_parsed_sas$value_labels$V880,
               c("(0) NK-UNASCERTAIN" = "0",
                 "(1) NO" = "1",
                 "(2) YES" = "2"))
})

test_that("Guam - parsed value labels are accurate", {

  expect_equal(head(names(guam_parsed_sas$value_labels)),
               c("RECTYPE",
                 "RESISTAT",
                 "STATEOCC",
                 "CONTYOCC",
                 "REGION",
                 "DIVISION"))
  expect_equal(tail(names(guam_parsed_sas$value_labels)),
               c("AGE_FLG",
                 "PLACEINJ",
                 "ICD282",
                 "ICD72",
                 "ICD61",
                 "ICD34"))

  expect_equal(guam_parsed_sas$value_labels$RECTYPE,
               c("(1) RESIDENTS" = "1",
                 "(2) NONRESIDENTS" = "2"))
  expect_equal(guam_parsed_sas$value_labels$RESISTAT,
               c("(1) RESIDENTS" = "1",
                 "(2) INTRASTATE NONRESIDENTS" = "2",
                 "(3) INTERSTATE NONRESIDENTS" = "3",
                 "(4) FOREIGN RESIDENTS" = "4"))
  expect_equal(guam_parsed_sas$value_labels$RACE_R2,
               c("(1) White" = "1",
                 "(2) All other races" = "2"))
  expect_equal(guam_parsed_sas$value_labels$AGE_FLG,
               c("(1) Calculated age is substituted for reported age" = "1"))
  expect_equal(guam_parsed_sas$value_labels$FIPCNRES,
               c("(0) Foreign residents" = "0",
                 "(999) County less than 100,000 population" = "999"))
  expect_equal(guam_parsed_sas$value_labels$DAYDEATH,
               c("(1) Sunday" = "1",
                 "(2) Monday" = "2",
                 "(3) Tuesday" = "3",
                 "(4) Wednesday" = "4",
                 "(5) Thursday" = "5",
                 "(6) Friday" = "6",
                 "(7) Saturday" = "7",
                 "(9) Unknown" = "9"))
  expect_equal(guam_parsed_sas$value_labels$KINDBUSS,
               c("(961) Own home/At home" = "961",
                 "(970) Retired with no other industry reported" = "970",
                 "(990) Blank, Unknownr NA" = "990"))
  expect_equal(guam_parsed_sas$value_labels$USUALOCC,
               c("(913) Retired with no other occupation reported" = "913",
                 "(914) Housewife/Homemaker" = "914",
                 "(915) Student" = "915",
                 "(916) Volunteer" = "916",
                 "(917) Unemployed, never worked, disabled, child, infant" = "917",
                 "(999) Blank, Unknown, NA" = "999"))
})


test_that("China 1995 - parsed value labels are accurate", {

  expect_equal(head(names(china_1995_parsed_sas$value_labels)),
               c("A3",
                 "A4",
                 "A6",
                 "A7",
                 "A8",
                 "A9"))
  expect_equal(tail(names(china_1995_parsed_sas$value_labels)),
               c("A39",
                 "A40",
                 "A41",
                 "A47",
                 "A48",
                 "A49"))

  expect_equal(china_1995_parsed_sas$value_labels$A3,
               c("self" = "1",
                 "spouse" = "2",
                 "child" = "3",
                 "child in law" = "4",
                 "grandchild" = "5",
                 "parent" = "6",
                 "parent in law" = "7",
                 "grandparent" = "8",
                 "brother or sister" = "9",
                 "other relative" = "10",
                 "non-relative" = "11"))
  expect_equal(china_1995_parsed_sas$value_labels$A4,
               c("male" = "1",
                 "female" = "2"))
  expect_equal(china_1995_parsed_sas$value_labels$A8,
               c("yes" = "1",
                 "no" = "2"))
  expect_equal(china_1995_parsed_sas$value_labels$A20,
               c("yes" = "1",
                 "no" = "2"))
  expect_equal(china_1995_parsed_sas$value_labels$A47,
               c("unknown code" = "0",
                 "an enterprise" = "1",
                 "a government organization or institution" = "2",
                 "other" = "3"))
  expect_equal(china_1995_parsed_sas$value_labels$A48,
               c("unknown code" = "0",
                 "yes" = "1",
                 "no" = "2"))
  expect_equal(china_1995_parsed_sas$value_labels$A49,
               c("unknown code" = "0",
                 "employed throughout the year" = "1",
                 "unemployed some of the time" = "2",
                 "unemployed throughout the year" = "3"))
})


test_that("China 2002 - parsed value labels are accurate", {

  expect_equal(head(names(china_2002_parsed_sas$value_labels)),
               c("V3_1",
                 "V3_2",
                 "V3_3",
                 "V3_4",
                 "V3_101",
                 "V3_102"))
  expect_equal(tail(names(china_2002_parsed_sas$value_labels)),
               c("V3_702",
                 "V3_701B",
                 "V3_702B",
                 "V3_703",
                 "V3_704",
                 "V3_705"))

  expect_equal(china_2002_parsed_sas$value_labels$V3_1,
               c("(1) plain (basin)" = "1",
                 "(2) hilly area" = "2",
                 "(3) mountainous area" = "3"))
  expect_equal(china_2002_parsed_sas$value_labels$V3_2,
               c("(1) Yes" = "1",
                 "(2) No" = "2"))
  expect_equal(china_2002_parsed_sas$value_labels$V3_316D,
               c("(1) the villager" = "1",
                 "(2) the village cadre" = "2",
                 "(3) the township cadre" = "3",
                 "(4) the county (or upper level cadre)" = "4",
                 "(5) others" = "5"))
  expect_equal(china_2002_parsed_sas$value_labels$V3_505A,
               c("(0) Less than once per year" = "0"))
  expect_equal(china_2002_parsed_sas$value_labels$V3_506A,
               c("(0) Less than once per year" = "0"))
  expect_equal(china_2002_parsed_sas$value_labels$V3_704,
               c("(1) Yes" = "1",
                 "(2) No" = "2"))
  expect_equal(china_2002_parsed_sas$value_labels$V3_705,
               c("(1) Yes" = "1",
                 "(2) No" = "2"))
})


test_that("China 1998 - parsed value labels are accurate", {

  expect_equal(head(names(china_1998_parsed_sas$value_labels)),
               c("RELATION",
                 "GENDER",
                 "AGE",
                 "STUDENT",
                 "INCOME88",
                 "RESIDENC"))
  expect_equal(tail(names(china_1998_parsed_sas$value_labels)),
               c("IT07T",
                 "IT07M",
                 "IT07E",
                 "IT08T",
                 "IT08M",
                 "IT08E"))

  expect_equal(china_1998_parsed_sas$value_labels$RELATION,
               c("Self" = "1",
                 "Spouse" = "2",
                 "Child" = "3",
                 "Grandchild" = "4",
                 "Parent" = "5",
                 "Grandparent" = "6",
                 "Other Relative" = "7",
                 "Not Related" = "8",
                 "Missing" = "9"))
  expect_equal(china_1998_parsed_sas$value_labels$GENDER,
               c("Male" = "0",
                 "Female" = "1",
                 "Missing" = "9"))
  expect_equal(china_1998_parsed_sas$value_labels$AGE,
               c("Missing" = "999"))
  expect_equal(china_1998_parsed_sas$value_labels$SJ,
               c("No" = "0",
                 "Yes" = "1",
                 "Missing" = "9"))
  expect_equal(china_1998_parsed_sas$value_labels$IT01T,
               c("Food" = "1",
                 "Daily Use Article" = "2",
                 "Consumer Durables" = "3",
                 "Other" = "4",
                 "Missing" = "9"))
  expect_equal(china_1998_parsed_sas$value_labels$IT08M,
               c("Missing" = "99999"))
  expect_equal(china_1998_parsed_sas$value_labels$IT08E,
               c("Missing" = "99999"))
})


test_that("UN Crime - parsed value labels are accurate", {

  expect_equal(head(names(UN_crime_parsed_sas$value_labels)),
               c("NNHOM70N",
                 "NNHOM71N",
                 "NNHOM72N",
                 "NNHOM73N",
                 "NNHOM74N",
                 "NNHOM75N"))
  expect_equal(tail(names(UN_crime_parsed_sas$value_labels)),
               c("PSTF745",
                 "X2",
                 "X3",
                 "X4",
                 "X5",
                 "X6"))

  expect_equal(UN_crime_parsed_sas$value_labels$NNHOM70N,
               c("Blank" = "-9"))
  expect_equal(UN_crime_parsed_sas$value_labels$ROB74,
               c("Blank" = "-9"))
  expect_equal(UN_crime_parsed_sas$value_labels$FRAUD72,
               c("Blank" = "-9"))
  expect_equal(UN_crime_parsed_sas$value_labels$TOTC70,
               c("Blank" = "-9"))
  expect_equal(UN_crime_parsed_sas$value_labels$TDRUG70N,
               c("Blank" = "-9"))
  expect_equal(UN_crime_parsed_sas$value_labels$ACON723,
               c("Blank" = "-9"))
  expect_equal(UN_crime_parsed_sas$value_labels$X6,
               c("Blank" = "-9"))
})


test_that("CPS 2004 - parsed value labels are accurate", {


  expect_equal(cps_2004_parsed_sas$value_labels$HURESPLI,
               c("(-3) REFUSED" = "-3",
                 "(-2) DONT KNOW" = "-2",
                 "(-1) BLANK OR NOT IN UNIVERSE" = "-1"))
  expect_equal(cps_2004_parsed_sas$value_labels$HETELAVL,
               c("(-3) REFUSED" = "-3",
                 "(-2) DONT KNOW" = "-2",
                 "(-1) BLANK OR NOT IN UNIVERSE" = "-1",
                 "(1) YES" = "1",
                 "(2) NO" = "2"))
  expect_equal(cps_2004_parsed_sas$value_labels$HETELHHD,
               c("(-3) REFUSED" = "-3",
                 "(-2) DONT KNOW" = "-2",
                 "(-1) BLANK OR NOT IN UNIVERSE" = "-1",
                 "(1) YES" = "1",
                 "(2) NO" = "2"))
  expect_equal(cps_2004_parsed_sas$value_labels$PEIO1ICD,
               c("(-3) REFUSED" = "-3",
                 "(-2) DONT KNOW" = "-2",
                 "(-1) BLANK OR NOT IN UNIVERSE" = "-1"))
  expect_equal(cps_2004_parsed_sas$value_labels$PEIO1OCD,
               c("(-3) REFUSED" = "-3",
                 "(-2) DONT KNOW" = "-2",
                 "(-1) BLANK OR NOT IN UNIVERSE" = "-1"))
  expect_equal(cps_2004_parsed_sas$value_labels$HEQ3,
               c("(-9) No response" = "-9",
                 "(-3) Refused" = "-3",
                 "(-2) Dont know" = "-2",
                 "(-1) Blank or Not in Universe" = "-1",
                 "(1) All or almost all calls," = "1",
                 "(2) More than half," = "2",
                 "(3) Less than half, or" = "3",
                 "(4) Very few or none?" = "4"))
  expect_equal(cps_2004_parsed_sas$value_labels$HRSUPINT,
               c("(1) Interview" = "1",
                 "(2) Noninterview" = "2"))
})


test_that("Drug abuse - parsed value labels are accurate", {


  expect_equal(drug_abuse_parsed_sas$value_labels$ID,
               c("(-9) Missing" = "-9"))
  expect_equal(drug_abuse_parsed_sas$value_labels$RESPCODE,
               c("(-9) Missing" = "-9"))
  expect_equal(drug_abuse_parsed_sas$value_labels$ADDICTIONS_COUNSELING ,
               c("(-9) Missing" = "-9",
                 "(0) Not Marked" = "0",
                 "(1) Marked" = "1"))
  expect_equal(drug_abuse_parsed_sas$value_labels$BSOCA5,
               c("(-9) Blank / Not ascertained" = "-9",
                 "(1) Disagree Strongly" = "1",
                 "(2) Disagree" = "2",
                 "(3) Uncertain" = "3",
                 "(4) Agree" = "4",
                 "(5) Agree Strongly" = "5"))
  expect_equal(drug_abuse_parsed_sas$value_labels$BSOCA6,
               c("(-9) Blank / Not ascertained" = "-9",
                 "(1) Disagree Strongly" = "1",
                 "(2) Disagree" = "2",
                 "(3) Uncertain" = "3",
                 "(4) Agree" = "4",
                 "(5) Agree Strongly" = "5"))
  expect_equal(drug_abuse_parsed_sas$value_labels$EOTSCO,
               c("(-9) Missing" = "-9"))
  expect_equal(drug_abuse_parsed_sas$value_labels$EOTOPN    ,
               c("(-9) Missing" = "-9",
                 "(-5) Not calculated for respondent type" = "-5"))
})


test_that("Detroit - parsed value labels are accurate", {


  expect_equal(detroit_parsed_sas$value_labels$I_MONTH,
               c("(1) January" = "1",
                 "(2) February" = "2",
                 "(3) March" = "3",
                 "(4) April" = "4",
                 "(5) May" = "5",
                 "(6) June" = "6",
                 "(7) July" = "7",
                 "(8) August" = "8",
                 "(9) September" = "9",
                 "(10) October" = "10",
                 "(11) November" = "11",
                 "(12) December" = "12"))
  expect_equal(detroit_parsed_sas$value_labels$A1_YEAR,
               c("(95) ALL OF LIFE" = "95",
                 "(97) UNCODEABLE" = "97"))
  expect_equal(detroit_parsed_sas$value_labels$A1_MONTH,
               c("(97) UNCODEABLE" = "97"))
  expect_equal(detroit_parsed_sas$value_labels$D11A,
               c("(1) IDENTITY" = "1",
                 "(5) NO" = "5",
                 "(7) Uncodeable" = "7",
                 "(8) Dont_Know" = "8",
                 "(9) Refuse" = "9"))
  expect_equal(detroit_parsed_sas$value_labels$J1,
               c("(1) VERY DARK" = "1",
                 "(2) DARK" = "2",
                 "(3) MEDIUM" = "3",
                 "(4) LIGHT" = "4",
                 "(5) VERY LIGHT" = "5",
                 "(7) Uncodeable" = "7",
                 "(8) Dont_Know" = "8",
                 "(9) Refuse" = "9"))
  expect_equal(detroit_parsed_sas$value_labels$J5B,
               c("(97) UNCODEABLE" = "97",
                 "(98) DONT KNOW" = "98",
                 "(99) REFUSE" = "99"))
  expect_equal(detroit_parsed_sas$value_labels$J7,
               c("(1) IN PERSON" = "1",
                 "(2) TELEPHONE" = "2",
                 "(7) Uncodeable" = "7",
                 "(8) Dont_Know" = "8",
                 "(9) Refuse" = "9"))
})


test_that("Worry - parsed value labels are accurate", {


  expect_equal(worry_parsed_sas$value_labels$PRE1,
               c("(0) Not at all serious problem" = "0",
                 "(2) Somewhat serious problem" = "2",
                 "(4) Moderately serious problem" = "4",
                 "(6) Very serious problem" = "6"))
  expect_equal(worry_parsed_sas$value_labels$CONDITION ,
               c("(1) At beginning" = "1",
                 "(2) At end" = "2"))
  expect_equal(worry_parsed_sas$value_labels$C1,
               c("(0) Not at all likely" = "0",
                 "(6) Very likely" = "6"))
  expect_equal(worry_parsed_sas$value_labels$G12,
               c("(0) Just chance/no one is to blame" = "0",
                 "(6) Someone at the hospital is to blame" = "6"))
  expect_equal(worry_parsed_sas$value_labels$G19,
               c("(0) Just chance/no one is to blame" = "0",
                 "(6) Someone at the hospital is to blame" = "6"))
  expect_equal(worry_parsed_sas$value_labels$HEALTH,
               c("(1) Poor" = "1",
                 "(2) Fair" = "2",
                 "(3) Good" = "3",
                 "(4) Excellent" = "4"))
  expect_equal(worry_parsed_sas$value_labels$EDUC,
               c("(1) Less than high school" = "1",
                 "(2) High school graduate" = "2",
                 "(3) Some college" = "3",
                 "(4) College graduate" = "4",
                 "(5) Graduate degree" = "5"))
})


test_that("Census Police - parsed value labels are accurate", {


  expect_equal(census_police_parsed_sas$value_labels$AGCYTYPE,
               c("(0) Local police department" = "0",
                 "(1) Sheriffs office" = "1",
                 "(5) Primary state law enforcement agency" = "5",
                 "(6) Special jurisdiction" = "6",
                 "(7) Constable/marshal" = "7"))
  expect_equal(census_police_parsed_sas$value_labels$SUBTYPE1,
               c("(1) Public buildings/facilities" = "1",
                 "(2) Natural resources/parks and recreation" = "2",
                 "(3) Transportation systems/facilities" = "3",
                 "(4) Criminal investigations" = "4",
                 "(5) Special enforcement" = "5",
                 "(888) Not applicable" = "888"))
  expect_equal(census_police_parsed_sas$value_labels$TRIBAL,
               c("(0) Not a tribal agency" = "0",
                 "(1) Yes, a tribal agency" = "1"))
  expect_equal(census_police_parsed_sas$value_labels$Q1A1,
               c("(-9) Blank" = "-9",
                 "(1) Yes" = "1",
                 "(2) No" = "2"))
  expect_equal(census_police_parsed_sas$value_labels$Q3EST,
               c("(-9) Blank" = "-9",
                 "(-2) Dont know" = "-2",
                 "(1) Yes" = "1",
                 "(2) No" = "2"))
  expect_equal(census_police_parsed_sas$value_labels$Q6I,
               c("(-9) Blank" = "-9"))
  expect_equal(census_police_parsed_sas$value_labels$Q6_TOT,
               c("(-9) Blank" = "-9"))
})


test_that("Step In - parsed value labels are accurate", {


  expect_equal(step_in_parsed_sas$value_labels$NR_DAYS,
               c("(-99) missing value (date of release (event 2) is unknown or client was still incarcerated at the time of data collection)" = "-99"))
  expect_equal(step_in_parsed_sas$value_labels$NO_RECORD,
               c("(1) arrest data not available" = "1"))
  expect_equal(step_in_parsed_sas$value_labels$EVENT,
               c("(1) arrest that leads to incarceration" = "1",
                 "(2) release from jail/prison after arrest (EVENT 1)" = "2",
                 "(3) arrest that does not lead to incarceration" = "3"))
  expect_equal(step_in_parsed_sas$value_labels$CHARGE,
               c("(-99) missing value: type of charge is unknown" = "-99",
                 "(1) violent: use of dangerous weapon, robbery, assault, battery, homicide, attempted homicide, manslaughter, mugging, kidnap" = "1",
                 "(2) property: theft, identity theft, burglary, possession stolen vehicle, unauthorized use of vehicle, credit card forgery," = "2",
                 "(3) drug: drug possession, drug distribution, public intoxication, DUI, drug use, poss. to distribute, drug paraphernalia, m" = "3",
                 "(4) parole violation" = "4",
                 "(5) other: failure to appear, possession of firearm, harassment, criminal driving, false police report, child endangerment," = "5",
                 "(6) sex: prostitution, pimping, rape, sexual assault, sex w/minor" = "6"))
})


test_that("SHR1981 - parsed value labels are accurate", {
  expect_equal(SHR1981_parsed_sas$value_labels$V1,
               c("ICPSR Study Number" = "9028"))
  expect_equal(SHR1981_parsed_sas$value_labels$V2,
               c("Second edition, February 1994" = "2"))
  expect_equal(SHR1981_parsed_sas$value_labels$V3,
               c("Part 7: SHR 1981" = "7"))
  expect_equal(SHR1981_parsed_sas$value_labels$V5,
               c("SHR master file" = "6"))
  expect_equal(SHR1981_parsed_sas$value_labels$V6,
               c("Alabama" = "01",
                 "Arizona" = "02",
                 "Arkansas" = "03",
                 "California" = "04",
                 "Colorado" = "05",
                 "Connecticut" = "06",
                 "Delaware" = "07",
                 "Washington, D.C" = "08",
                 "Florida" = "09",
                 "Georgia" = "10",
                 "Idaho" = "11",
                 "Illinois" = "12",
                 "Indiana" = "13",
                 "Iowa" = "14",
                 "Kansas" = "15",
                 "Kentucky" = "16",
                 "Louisiana" = "17",
                 "Maine" = "18",
                 "Maryland" = "19",
                 "Massachusetts" = "20",
                 "Michigan" = "21",
                 "Minnesota" = "22",
                 "Mississippi" = "23",
                 "Missouri" = "24",
                 "Montana" = "25",
                 "Nebraska" = "26",
                 "Nevada" = "27",
                 "New Hampshire" = "28",
                 "New Jersey" = "29",
                 "New Mexico" = "30",
                 "New York" = "31",
                 "North Carolina" = "32",
                 "North Dakota" = "33",
                 "Ohio" = "34",
                 "Oklahoma" = "35",
                 "Oregon" = "36",
                 "Pennsylvania" = "37",
                 "Rhode Island" = "38",
                 "South Carolina" = "39",
                 "South Dakota" = "40",
                 "Tennessee" = "41",
                 "Texas" = "42",
                 "Utah" = "43",
                 "Vermont" = "44",
                 "Virginia" = "45",
                 "Washington" = "46",
                 "West Virginia" = "47",
                 "Wisconsin" = "48",
                 "Wyoming" = "49",
                 "Alaska" = "50",
                 "Hawaii" = "51",
                 "Canal Zone" = "52",
                 "Puerto Rico" = "53",
                 "American Samoa" = "54",
                 "Guam" = "55",
                 "Virgin Islands" = "62"))
  expect_equal(SHR1981_parsed_sas$value_labels$V8,
               c("Possessions" = "0",
                 "All cities 1,000,000 or over" = "11",
                 "Cities 500,000 thru 999,999" = "12",
                 "Cities 250,000 thru 499,999" = "13",
                 "Cities 100,000 thru 249,999" = "20",
                 "Cities 50,000 thru 99,999" = "30",
                 "Cities 25,000 thru 49,999" = "40",
                 "Cities 10,000 thru 24,999" = "50",
                 "Cities 2,500 thru 9,999" = "60",
                 "Cities under 2,500" = "70",
                 "Non-MSA counties 100,000 or over" = "81",
                 "Non-MSA counties 25,000 thru 99,999" = "82",
                 "Non-MSA counties 10,000 thru 24,999" = "83",
                 "Non-MSA counties under 10,000" = "84",
                 "Non-MSA State Police" = "85",
                 "MSA counties 100,000 or over" = "91",
                 "MSA counties 25,000 thru 99,999" = "92",
                 "MSA counties 10,000 thru 24,999" = "93",
                 "MSA counties under 10,000" = "94",
                 "MSA State Police" = "95"))
  expect_equal(SHR1981_parsed_sas$value_labels$V9,
               c("Possessions" = "0",
                 "New England States" = "1",
                 "Middle Atlantic States" = "2",
                 "East North Central States" = "3",
                 "West North Central States" = "4",
                 "South Atlantic States" = "5",
                 "East South Central States" = "6",
                 "West South Central States" = "7",
                 "Mountain States" = "8",
                 "Pacific States" = "9"))
  expect_equal(SHR1981_parsed_sas$value_labels$V10,
               c("1981" = "81"))
  expect_equal(SHR1981_parsed_sas$value_labels$V11,
               c("Unknown or not reported" = "0"))
  expect_equal(SHR1981_parsed_sas$value_labels$V12,
               c("Inapplicable" = "0"))
  expect_equal(SHR1981_parsed_sas$value_labels$V13,
               c("Inapplicable" = "0"))
  expect_equal(SHR1981_parsed_sas$value_labels$V14,
               c("Non-suburban" = "0",
                 "Suburban" = "1"))
  expect_equal(SHR1981_parsed_sas$value_labels$V17,
               c("January" = "1",
                 "February" = "2",
                 "March" = "3",
                 "April" = "4",
                 "May" = "5",
                 "June" = "6",
                 "July" = "7",
                 "August" = "8",
                 "September" = "9",
                 "October" = "10",
                 "November" = "11",
                 "December" = "12"))
  expect_equal(SHR1981_parsed_sas$value_labels$V20,
               c("Murder and non-negligent manslaughter" = "1",
                 "Manslaughter by negligence" = "2"))
  expect_equal(SHR1981_parsed_sas$value_labels$V22,
               c("Single victim/single offender" = "1",
                 "Single victim/unknown offender(s)" = "2",
                 "Single victim/multiple offenders" = "3",
                 "Multiple victims/single offender" = "4",
                 "Multiple victims/multiple offenders" = "5",
                 "Multiple victims/unknown offender(s)" = "6"))
  expect_equal(SHR1981_parsed_sas$value_labels$V25,
               c("Birth to 6 days old" = "100",
                 "7 days old to 364 days old" = "101",
                 "1 year old" = "1",
                 "99 years old or more" = "99",
                 "Unknown" = "999",
                 "Out of Universe" = "900"))
  expect_equal(SHR1981_parsed_sas$value_labels$V26,
               c("Male" = "1",
                 "Female" = "2",
                 "Unknown" = "9"))
  expect_equal(SHR1981_parsed_sas$value_labels$V27,
               c("White" = "1",
                 "Black" = "2",
                 "American Indian or Alaskan Native" = "3",
                 "Asian or Pacific Islander" = "4",
                 "Unknown" = "9"))
  expect_equal(SHR1981_parsed_sas$value_labels$V28,
               c("Hispanic origin" = "1",
                 "Not of Hispanic origin" = "2",
                 "Unknown" = "9"))
  expect_equal(SHR1981_parsed_sas$value_labels$V29,
               c("Birth to 6 days old" = "100",
                 "7 days old to 364 days old" = "101",
                 "1 year old" = "001",
                 "99 years old or more" = "099",
                 "Inap, only one victim" = "998",
                 "Unknown" = "999"))
  expect_equal(SHR1981_parsed_sas$value_labels$V30,
               c("Male" = "1",
                 "Female" = "2",
                 "Inap, only one victim" = "8",
                 "Unknown" = "9"))
  expect_equal(SHR1981_parsed_sas$value_labels$V31,
               c("White" = "1",
                 "Black" = "2",
                 "American Indian or Alaskan Native" = "3",
                 "Asian or Pacific Islander" = "4",
                 "Inap, only one victim" = "8",
                 "Unknown" = "9"))
  expect_equal(SHR1981_parsed_sas$value_labels$V32,
               c("Hispanic origin" = "1",
                 "Not of Hispanic origin" = "2",
                 "Inap, only one victim" = "8",
                 "Unknown" = "9"))
  expect_equal(SHR1981_parsed_sas$value_labels$V33,
               c("Birth to 6 days old" = "100",
                 "7 days old to 364 days old" = "101",
                 "1 year old" = "001",
                 "99 years old or more" = "099",
                 "Inap, less than 3 victims" = "998",
                 "Unknown" = "999"))
  expect_equal(SHR1981_parsed_sas$value_labels$V34,
               c("Male" = "1",
                 "Female" = "2",
                 "Inap, less than 3 victims" = "8",
                 "Unknown" = "9"))
  expect_equal(SHR1981_parsed_sas$value_labels$V69,
               c("Age unknown" = "999"))
  expect_equal(SHR1981_parsed_sas$value_labels$V73,
               c("Firearm, type not stated" = "11",
                 "Handgun - pistol, revolver, etc" = "12",
                 "Rifle" = "13",
                 "Shotgun" = "14",
                 "Other gun" = "15",
                 "Knife or cutting instrument" = "20",
                 "Blunt object" = "30",
                 "Personal weapons" = "40",
                 "Poison - does not include gas" = "50",
                 "Pushed or thrown out window" = "55",
                 "Explosives" = "60",
                 "Fire" = "65",
                 "Narcotics or drugs" = "70",
                 "Drowning" = "75",
                 "Strangulation - hanging" = "80",
                 "Asphyxiation - includes death by gas" = "85",
                 "Other - type of weapon not designated" = "90"))
  expect_equal(SHR1981_parsed_sas$value_labels$V74,
               c("Husband" = "01",
                 "Wife" = "02",
                 "Common-law husband" = "03",
                 "Common-law wife" = "04",
                 "Mother" = "05",
                 "Father" = "06",
                 "Son" = "07",
                 "Daughter" = "08",
                 "Brother" = "09",
                 "Sister" = "10",
                 "In-law" = "11",
                 "Stepfather" = "12",
                 "Stepmother" = "13",
                 "Stepson" = "14",
                 "Stepdaughter" = "15",
                 "Other family" = "16",
                 "Neighbor" = "17",
                 "Acquaintance" = "18",
                 "Boyfriend" = "19",
                 "Girlfriend" = "20",
                 "Ex-husband" = "21",
                 "Ex-wife" = "22",
                 "Employee" = "23",
                 "Employer" = "24",
                 "Friend" = "25",
                 "Homosexual relationship" = "26",
                 "Other - known to victim" = "27",
                 "Stranger" = "28",
                 "Relationship not determined" = "99"))
  expect_equal(SHR1981_parsed_sas$value_labels$V75,
               c("Rape" = "02",
                 "Robbery" = "03",
                 "Burglary" = "05",
                 "Larceny" = "06",
                 "Motor vehicle theft" = "07",
                 "Arson" = "09",
                 "Prostitution and commercialized vice" = "10",
                 "Other sex offense" = "17",
                 "Abortion" = "32",
                 "Narcotic drug laws" = "18",
                 "Gambling" = "19",
                 "Other - not specified" = "26",
                 "Lover s triangle" = "40",
                 "Child killed by babysitter" = "41",
                 "Brawl due to influence of alcohol" = "42",
                 "Brawl due to influence of narcotics" = "43",
                 "Argument over money or property" = "44",
                 "Other arguments" = "45",
                 "Gangland killings" = "46",
                 "Juvenile gang killings" = "47",
                 "Institutional killings" = "48",
                 "Sniper attack" = "49",
                 "Other" = "60",
                 "All suspected felony type" = "70",
                 "Felon killed by private citizen" = "80",
                 "Felon killed by police" = "81",
                 "Circumstances undetermined" = "99"))
  expect_equal(SHR1981_parsed_sas$value_labels$V76,
               c("Felon attacked police officer" = "1",
                 "Felon attacked fellow police officer" = "2",
                 "Felon attacked a civilian" = "3",
                 "Felon attempted flight from a crime" = "4",
                 "Felon killed in commission of a crime" = "5",
                 "Felon resisted arrest" = "6",
                 "Not enough information to determine" = "7",
                 "Inap, not a justifiable homicide" = "9"))
  expect_equal(SHR1981_parsed_sas$value_labels$V77,
               c("Inap, only one offender" = "998",
                 "Unknown" = "999"))
})


test_that("ACS - parsed value labels are accurate", {
  expect_equal(acs_parsed_sas$value_labels$STATEFIP,
               c("Alabama" = "01",
                 "Alaska" = "02",
                 "Arizona" = "04",
                 "Arkansas" = "05",
                 "California" = "06",
                 "Colorado" = "08",
                 "Connecticut" = "09",
                 "Delaware" = "10",
                 "District of Columbia" = "11",
                 "Florida" = "12",
                 "Georgia" = "13",
                 "Hawaii" = "15",
                 "Idaho" = "16",
                 "Illinois" = "17",
                 "Indiana" = "18",
                 "Iowa" = "19",
                 "Kansas" = "20",
                 "Kentucky" = "21",
                 "Louisiana" = "22",
                 "Maine" = "23",
                 "Maryland" = "24",
                 "Massachusetts" = "25",
                 "Michigan" = "26",
                 "Minnesota" = "27",
                 "Mississippi" = "28",
                 "Missouri" = "29",
                 "Montana" = "30",
                 "Nebraska" = "31",
                 "Nevada" = "32",
                 "New Hampshire" = "33",
                 "New Jersey" = "34",
                 "New Mexico" = "35",
                 "New York" = "36",
                 "North Carolina" = "37",
                 "North Dakota" = "38",
                 "Ohio" = "39",
                 "Oklahoma" = "40",
                 "Oregon" = "41",
                 "Pennsylvania" = "42",
                 "Rhode Island" = "44",
                 "South Carolina" = "45",
                 "South Dakota" = "46",
                 "Tennessee" = "47",
                 "Texas" = "48",
                 "Utah" = "49",
                 "Vermont" = "50",
                 "Virginia" = "51",
                 "Washington" = "53",
                 "West Virginia" = "54",
                 "Wisconsin" = "55",
                 "Wyoming" = "56",
                 "Maine-New Hampshire-Vermont" = "61",
                 "Massachusetts-Rhode Island" = "62",
                 "Minnesota-Iowa-Missouri-Kansas-Nebraska-S.Dakota-N.Dakota" = "63",
                 "Maryland-Delaware" = "64",
                 "Montana-Idaho-Wyoming" = "65",
                 "Utah-Nevada" = "66",
                 "Arizona-New Mexico" = "67",
                 "Alaska-Hawaii" = "68",
                 "Puerto Rico" = "72",
                 "Military/Mil. Reservation" = "97",
                 "State not identified" = "99"))
  expect_equal(acs_parsed_sas$value_labels$GQ,
               c("Vacant unit" = "0",
                 "Households under 1970 definition" = "1",
                 "Additional households under 1990 definition" = "2",
                 "Group quarters--Institutions" = "3",
                 "Other group quarters" = "4",
                 "Additional households under 2000 definition" = "5",
                 "Fragment" = "6"))
  expect_equal(acs_parsed_sas$value_labels$SEX,
               c("Male" = "1",
                 "Female" = "2"))
  expect_equal(acs_parsed_sas$value_labels$AGE,
               c("Less than 1 year old" = "000",
                 "1" = "001",
                 "2" = "002",
                 "3" = "003",
                 "4" = "004",
                 "5" = "005",
                 "6" = "006",
                 "7" = "007",
                 "8" = "008",
                 "9" = "009",
                 "10" = "010",
                 "11" = "011",
                 "12" = "012",
                 "13" = "013",
                 "14" = "014",
                 "15" = "015",
                 "16" = "016",
                 "17" = "017",
                 "18" = "018",
                 "19" = "019",
                 "20" = "020",
                 "21" = "021",
                 "22" = "022",
                 "23" = "023",
                 "24" = "024",
                 "25" = "025",
                 "26" = "026",
                 "27" = "027",
                 "28" = "028",
                 "29" = "029",
                 "30" = "030",
                 "31" = "031",
                 "32" = "032",
                 "33" = "033",
                 "34" = "034",
                 "35" = "035",
                 "36" = "036",
                 "37" = "037",
                 "38" = "038",
                 "39" = "039",
                 "40" = "040",
                 "41" = "041",
                 "42" = "042",
                 "43" = "043",
                 "44" = "044",
                 "45" = "045",
                 "46" = "046",
                 "47" = "047",
                 "48" = "048",
                 "49" = "049",
                 "50" = "050",
                 "51" = "051",
                 "52" = "052",
                 "53" = "053",
                 "54" = "054",
                 "55" = "055",
                 "56" = "056",
                 "57" = "057",
                 "58" = "058",
                 "59" = "059",
                 "60" = "060",
                 "61" = "061",
                 "62" = "062",
                 "63" = "063",
                 "64" = "064",
                 "65" = "065",
                 "66" = "066",
                 "67" = "067",
                 "68" = "068",
                 "69" = "069",
                 "70" = "070",
                 "71" = "071",
                 "72" = "072",
                 "73" = "073",
                 "74" = "074",
                 "75" = "075",
                 "76" = "076",
                 "77" = "077",
                 "78" = "078",
                 "79" = "079",
                 "80" = "080",
                 "81" = "081",
                 "82" = "082",
                 "83" = "083",
                 "84" = "084",
                 "85" = "085",
                 "86" = "086",
                 "87" = "087",
                 "88" = "088",
                 "89" = "089",
                 "90 (90+ in 1980 and 1990)" = "090",
                 "91" = "091",
                 "92" = "092",
                 "93" = "093",
                 "94" = "094",
                 "95" = "095",
                 "96" = "096",
                 "97" = "097",
                 "98" = "098",
                 "99" = "099",
                 "100 (100+ in 1960-1970)" = "100",
                 "101" = "101",
                 "102" = "102",
                 "103" = "103",
                 "104" = "104",
                 "105" = "105",
                 "106" = "106",
                 "107" = "107",
                 "108" = "108",
                 "109" = "109",
                 "110" = "110",
                 "111" = "111",
                 "112 (112+ in the 1980 internal data)" = "112",
                 "113" = "113",
                 "114" = "114",
                 "115 (115+ in the 1990 internal data)" = "115",
                 "116" = "116",
                 "117" = "117",
                 "118" = "118",
                 "119" = "119",
                 "120" = "120",
                 "121" = "121",
                 "122" = "122",
                 "123" = "123",
                 "124" = "124",
                 "125" = "125",
                 "126" = "126",
                 "129" = "129",
                 "130" = "130",
                 "135" = "135"))

})


test_that("crosswalk - parsed value labels are accurate", {
  expect_equal(crosswalk_parsed_sas$value_labels$SOURCE,
               c("Other" = "0",
                 "UCR only" = "1",
                 "DLEA only" = "2",
                 "UCR and DLEA" = "3"))
  expect_equal(crosswalk_parsed_sas$value_labels$UORI,
               c("Unknown" = "M"))
  expect_equal(crosswalk_parsed_sas$value_labels$UCORI,
               c("ORI rpts thru other ORI" = "*"))
  expect_equal(crosswalk_parsed_sas$value_labels$UMULTICO,
               c("ORI in > 1 county" = "*"))
  expect_equal(crosswalk_parsed_sas$value_labels$UCOUNTY,
               c("Inap" = "0",
                 "Unknown" = "999"))
  expect_equal(crosswalk_parsed_sas$value_labels$UMSA,
               c("Inap" = "0",
                 "Unknown/ not an MSA" = "999"))
  expect_equal(crosswalk_parsed_sas$value_labels$UPOPGRP,
               c("Unknown" = "M",
                 "Possessions" = "0",
                 "All cities 250,000 or over" = "1",
                 "Cities 1,000,000 or over" = "1A",
                 "Cities from 500,000 thru 999,000" = "1B",
                 "Cities from 250,000 thru 499,999" = "1C",
                 "Cities from 100,000 thru 249,000" = "2",
                 "Cities from 50,000 thru 99,999" = "3",
                 "Cities from 25,000 thru 49,999" = "4",
                 "Cities from 10,000 thru 24,999" = "5",
                 "Cities from 2,500 thru 9,999" = "6",
                 "Cities under 2,500" = "7",
                 "Non-MSA counties" = "8",
                 "Non-MSA counties 100,000 or over" = "8A",
                 "Non-MSA counties from 25,000 thru 99,999" = "8B",
                 "Non-MSA counties from 10,000 thru 24,999" = "8C",
                 "Non-MSA counties under 10,000" = "8D",
                 "Non-MSA State Police" = "8E",
                 "MSA counties" = "9",
                 "MSA counties 100,000 or over" = "9A",
                 "MSA counties from 25,000 thru 99,999" = "9B",
                 "MSA counties from 10,000 thru 24,999" = "9C",
                 "MSA counties under 10,000" = "9D",
                 "MSA State Police" = "9E"))
  expect_equal(crosswalk_parsed_sas$value_labels$UPOPCOV,
               c("Unknown" = "9999999"))
  expect_equal(crosswalk_parsed_sas$value_labels$UADD5,
               c("Unknown" = "99999"))
  expect_equal(crosswalk_parsed_sas$value_labels$CGOVIDNU,
               c("Unknown" = "999999999"))
  expect_equal(crosswalk_parsed_sas$value_labels$CGOVTYPE,
               c("State" = "0",
                 "County" = "1",
                 "Municipal" = "2",
                 "Township" = "3",
                 "Special district" = "4",
                 "Independent school district" = "5",
                 "Federal agency" = "6",
                 "Tribal" = "7",
                 "Railroad police" = "8",
                 "College/university" = "9",
                 "Unknown" = "99"))
  expect_equal(crosswalk_parsed_sas$value_labels$CPOP94,
               c("Unknown" = "99999999"))
  expect_equal(crosswalk_parsed_sas$value_labels$FSTATE,
               c("Alabama" = "1",
                 "Alaska" = "2",
                 "Arizona" = "4",
                 "Arkansas" = "5",
                 "California" = "6",
                 "Colorado" = "8",
                 "Connecticut" = "9",
                 "Delaware" = "10",
                 "District of Columbia" = "11",
                 "Florida" = "12",
                 "Georgia" = "13",
                 "Hawaii" = "15",
                 "Idaho" = "16",
                 "Illinois" = "17",
                 "Indiana" = "18",
                 "Iowa" = "19",
                 "Kansas" = "20",
                 "Kentucky" = "21",
                 "Louisiana" = "22",
                 "Maine" = "23",
                 "Maryland" = "24",
                 "Massachusetts" = "25",
                 "Michigan" = "26",
                 "Minnesota" = "27",
                 "Mississippi" = "28",
                 "Missouri" = "29",
                 "Montana" = "30",
                 "Nebraska" = "31",
                 "Nevada" = "32",
                 "New Hampshire" = "33",
                 "New Jersey" = "34",
                 "New Mexico" = "35",
                 "New York" = "36",
                 "North Carolina" = "37",
                 "North Dakota" = "38",
                 "Ohio" = "39",
                 "Oklahoma" = "40",
                 "Oregon" = "41",
                 "Pennsylvania" = "42",
                 "Rhode Island" = "44",
                 "South Carolina" = "45",
                 "South Dakota" = "46",
                 "Tennessee" = "47",
                 "Texas" = "48",
                 "Utah" = "49",
                 "Vermont" = "50",
                 "Virginia" = "51",
                 "Washington" = "53",
                 "West Virginia" = "54",
                 "Wisconsin" = "55",
                 "Wyoming" = "56",
                 "Guam" = "66",
                 "Puerto Rico" = "72",
                 "Unknown" = "99"))
  expect_equal(crosswalk_parsed_sas$value_labels$FCOUNTY,
               c("Unknown" = "999"))
  expect_equal(crosswalk_parsed_sas$value_labels$FPLACE,
               c("Tribes" = "97000",
                 "State HQ" = "98000",
                 "Unknown" = "999999"))
  expect_equal(crosswalk_parsed_sas$value_labels$FMSA,
               c("Unknown/ no MSA" = "9999"))
  expect_equal(crosswalk_parsed_sas$value_labels$FCMSA,
               c("Unknown" = "999"))


})


test_that("UCR1960 - parsed value labels are accurate", {
  expect_equal(ucr1960_parsed_sas$value_labels$V1,
               c("Offenses known" = "1"))
  expect_equal(ucr1960_parsed_sas$value_labels$V2,
               c("Alabama" = "1",
                 "Arizona" = "2",
                 "Arkansas" = "3",
                 "California" = "4",
                 "Colorado" = "5",
                 "Connecticut" = "6",
                 "Delaware" = "7",
                 "District of Columbia" = "8",
                 "Florida" = "9",
                 "Georgia" = "10",
                 "Idaho" = "11",
                 "Illinois" = "12",
                 "Indiana" = "13",
                 "Iowa" = "14",
                 "Kansas" = "15",
                 "Kentucky" = "16",
                 "Louisiana" = "17",
                 "Maine" = "18",
                 "Maryland" = "19",
                 "Massachusetts" = "20",
                 "Michigan" = "21",
                 "Minnesota" = "22",
                 "Mississippi" = "23",
                 "Missouri" = "24",
                 "Montana" = "25",
                 "Nebraska" = "26",
                 "Nevada" = "27",
                 "New Hampshire" = "28",
                 "New Jersey" = "29",
                 "New Mexico" = "30",
                 "New York" = "31",
                 "North Carolina" = "32",
                 "North Dakota" = "33",
                 "Ohio" = "34",
                 "Oklahoma" = "35",
                 "Oregon" = "36",
                 "Pennsylvania" = "37",
                 "Rhode Island" = "38",
                 "South Carolina" = "39",
                 "South Dakota" = "40",
                 "Tennessee" = "41",
                 "Texas" = "42",
                 "Utah" = "43",
                 "Vermont" = "44",
                 "Virginia" = "45",
                 "Washington" = "46",
                 "West Virginia" = "47",
                 "Wisconsin" = "48",
                 "Wyoming" = "49",
                 "Alaska" = "50",
                 "Hawaii" = "51",
                 "Canal Zone" = "52",
                 "Puerto Rico" = "53",
                 "American Samoa" = "54",
                 "Guam" = "55",
                 "Virgin Islands" = "62"))
  expect_equal(ucr1960_parsed_sas$value_labels$V4,
               c("Possessions" = "0",
                 "ALL cit 250,000 +" = "1",
                 "Cit 1,000,000 +" = "1A",
                 "Cit 500,000-999,999" = "1B",
                 "Cit 250,000-499,999" = "1C",
                 "Cit 100,000-249,999" = "2",
                 "Cit 50,000-99,999" = "3",
                 "Cit 25,000-49,999" = "4",
                 "Cit 10,000-24,999" = "5",
                 "Cit 2,500-9,999" = "6",
                 "Cit < 2,500" = "7",
                 "Non-MSA co." = "8",
                 "Non-MSA co. 100,000 +" = "8A",
                 "Non-MSA co. 25,000-99,999" = "8B",
                 "Non-MSA co. 10,000-24,999" = "8C",
                 "Non-MSA co. < 10,000" = "8D",
                 "Non-MSA St Police" = "8E",
                 "MSA counties" = "9",
                 "MSA co. 100,000 +" = "9A",
                 "MSA co. 25,000-99,999" = "9B",
                 "MSA co. 10,000-24,999" = "9C",
                 "MSA co. < 10,000" = "9D",
                 "MSA St Police" = "9E"))
  expect_equal(ucr1960_parsed_sas$value_labels$V5,
               c("Possessions" = "0",
                 "New Eng1and States" = "1",
                 "Middle Atlantic States" = "2",
                 "East North Central States" = "3",
                 "West North Central States" = "4",
                 "South Atlantic States" = "5",
                 "East South Central States" = "6",
                 "West South Central States" = "7",
                 "Mountain States" = "8",
                 "Pacific States" = "9"))
  expect_equal(ucr1960_parsed_sas$value_labels$V8,
               c("No, not core city of MSA" = "N",
                 "Yes, core city of MSA" = "Y"))
  expect_equal(ucr1960_parsed_sas$value_labels$V12,
               c("No months reported" = "0",
                 "Jan last reported" = "1",
                 "Feb last reported" = "2",
                 "March last reported" = "3",
                 "April last reported" = "4",
                 "May last reported" = "5",
                 "June last reported" = "6",
                 "July last reported" = "7",
                 "August last reported" = "8",
                 "Sep last reported" = "9",
                 "Oct last reported" = "10",
                 "Nov last reported" = "11",
                 "Dec last reported" = "12"))
  expect_equal(ucr1960_parsed_sas$value_labels$V13,
               c("US Park & State Police" = "0",
                 "All other agencies" = "1"))
  expect_equal(ucr1960_parsed_sas$value_labels$V23,
               c("No, do not send a follow-up" = "N",
                 "Yes, send a follow-up" = "Y"))
  expect_equal(ucr1960_parsed_sas$value_labels$V24,
               c("Not special mail group agency" = "0",
                 "Return sent to another agency" = "1",
                 "Small city sent a large city form" = "2",
                 "Agency-non-contributor, not sent form" = "7",
                 "Agency-contributor, not on mail list" = "9"))
  expect_equal(ucr1960_parsed_sas$value_labels$V25,
               c("Not a special mailing address" = "N",
                 "Special mailing address" = "Y"))
  expect_equal(ucr1960_parsed_sas$value_labels$V33,
               c("Jan not w oth month" = "0",
                 "Reported with Jan" = "1",
                 "Reported with Feb" = "2",
                 "Reported with Mar" = "3",
                 "Reported with Apr" = "4",
                 "Reported with May" = "5",
                 "Reported with Jun" = "6",
                 "Reported with Jul" = "7",
                 "Reported with Aug" = "8",
                 "Reported with Sep" = "9",
                 "Reported with Oct" = "10",
                 "Reported with Nov" = "11",
                 "Reported with Dec" = "12"))
  expect_equal(ucr1960_parsed_sas$value_labels$V34,
               c("Not updated" = "0"))
  expect_equal(ucr1960_parsed_sas$value_labels$V35,
               c("Not updated" = "0",
                 "Adjustment" = "2",
                 "Not available" = "4",
                 "Normal return" = "5"))
  expect_equal(ucr1960_parsed_sas$value_labels$V36,
               c("Not updated" = "0",
                 "Adjustment" = "2",
                 "Not available" = "4",
                 "Normal return" = "5"))
  expect_equal(ucr1960_parsed_sas$value_labels$V160,
               c("No return received" = " ",
                 "Missing" = "0",
                 "Breakdown offenses" = "P",
                 "Totals only" = "T"))
  expect_equal(ucr1960_parsed_sas$value_labels$V270,
               c("Not updated" = "0"))
  expect_equal(ucr1960_parsed_sas$value_labels$V506,
               c("Not updated" = "0"))
  expect_equal(ucr1960_parsed_sas$value_labels$V509,
               c("Not updated" = "0",
                 "Adjustment" = "2",
                 "Not available" = "4",
                 "Normal return" = "5"))
  expect_equal(ucr1960_parsed_sas$value_labels$V512,
               c("No return received" = " ",
                 "Missing" = "0",
                 "Breakdown offenses" = "P",
                 "Totals only" = "T"))
  expect_equal(ucr1960_parsed_sas$value_labels$V1341,
               c("No return received" = " ",
                 "Missing" = "0",
                 "Breakdown offenses" = "P",
                 "Totals only" = "T"))

})


test_that("nibrs - parsed value labels are accurate", {
  expect_equal(nibrs_parsed_sas$value_labels$B1001,
               c("Batch header 1" = "B1"))
  expect_equal(nibrs_parsed_sas$value_labels$B1002,
               c("AL" = "1",
                 "AZ" = "2",
                 "AR" = "3",
                 "CA" = "4",
                 "CO" = "5",
                 "CT" = "6",
                 "DE" = "7",
                 "DC" = "8",
                 "FL" = "9",
                 "GA" = "10",
                 "ID" = "11",
                 "IL" = "12",
                 "IN" = "13",
                 "IA" = "14",
                 "KS" = "15",
                 "KY" = "16",
                 "LA" = "17",
                 "ME" = "18",
                 "MD" = "19",
                 "MA" = "20",
                 "MI" = "21",
                 "MN" = "22",
                 "MS" = "23",
                 "MO" = "24",
                 "MT" = "25",
                 "NB" = "26",
                 "NV" = "27",
                 "NH" = "28",
                 "NJ" = "29",
                 "NM" = "30",
                 "NY" = "31",
                 "NC" = "32",
                 "ND" = "33",
                 "OH" = "34",
                 "OK" = "35",
                 "OR" = "36",
                 "PA" = "37",
                 "RI" = "38",
                 "SC" = "39",
                 "SD" = "40",
                 "TN" = "41",
                 "TX" = "42",
                 "UT" = "43",
                 "VT" = "44",
                 "VA" = "45",
                 "WA" = "46",
                 "WV" = "47",
                 "WI" = "48",
                 "WY" = "49",
                 "AK" = "50",
                 "HI" = "51",
                 "CZ" = "52",
                 "PR" = "53",
                 "AS" = "54",
                 "GM" = "55",
                 "VI" = "62"))
  expect_equal(nibrs_parsed_sas$value_labels$B1009,
               c("Possessions" = "0",
                 "Cities 250,000+" = "1",
                 "Cities 1,000,000+" = "1A",
                 "Cities 500,000-999,999" = "1B",
                 "Cities 250,000-499,999" = "1C",
                 "Cities 100,000-249,999" = "2",
                 "Cities 50,000-99,999" = "3",
                 "Cities 25,000-49,999" = "4",
                 "Cities 10,000-24,999" = "5",
                 "Cities 2,500-9,999" = "6",
                 "Cites < 2,500" = "7",
                 "Non-MSA Counties" = "8",
                 "Non-MSA Counties 100,000+" = "8A",
                 "Non-MSA Counties 25,000-99,999" = "8B",
                 "Non-MSA Counties 10,000-24,999" = "8C",
                 "Non-MSA Counties < 10,000" = "8D",
                 "Non-MSA State Police" = "8E",
                 "MSA Counties" = "9",
                 "MSA Counties 100,000+" = "9A",
                 "MSA Counties 25,000-99,999" = "9B",
                 "MSA Counties 10,000-24,999" = "9C",
                 "MSA Counties < 10,000" = "9D",
                 "MSA State Police" = "9E"))
  expect_equal(nibrs_parsed_sas$value_labels$B1010,
               c("Possessions" = "0",
                 "New England" = "1",
                 "Middle Atlantic" = "2",
                 "East North Central" = "3",
                 "West North Central" = "4",
                 "South Atlantic" = "5",
                 "East South Central" = "6",
                 "West South Central" = "7",
                 "Mountain" = "8",
                 "Pacific" = "9"))
  expect_equal(nibrs_parsed_sas$value_labels$B1011,
               c("North East" = "1",
                 "North Central" = "2",
                 "South" = "3",
                 "West" = "4"))
  expect_equal(nibrs_parsed_sas$value_labels$B1012,
               c("Covered by another agency" = "0",
                 "City" = "1",
                 "County" = "2",
                 "University or college" = "3",
                 "State Police" = "4",
                 "Special Agency" = "5"))
  expect_equal(nibrs_parsed_sas$value_labels$B1013,
               c("No" = "N",
                 "Yes" = "Y"))
  expect_equal(nibrs_parsed_sas$value_labels$B1015,
               c("Blanked" = "9999"))
  expect_equal(nibrs_parsed_sas$value_labels$B1017,
               c("Inactive" = " ",
                 "Active" = "A"))

})

test_that("Sex offenders - parsed value labels are accurate", {
  expect_equal(sex_offender_parsed_sas$value_labels$MEETING,
               c("1" = "1",
                 "2" = "2",
                 "3" = "3",
                 "4" = "4",
                 "5" = "5",
                 "6" = "6",
                 "7" = "7",
                 "8" = "8",
                 "9" = "9",
                 "10" = "10",
                 "11" = "11",
                 "12" = "12",
                 "13" = "13",
                 "14" = "14",
                 "15" = "15",
                 "16" = "16",
                 "17" = "17",
                 "18" = "18",
                 "19" = "19",
                 "20" = "20",
                 "21" = "21",
                 "22" = "22"))
  expect_equal(sex_offender_parsed_sas$value_labels$DATE,
               c("Blanked" = "8888888"))
  expect_equal(sex_offender_parsed_sas$value_labels$Q1,
               c("Media" = "1",
                 "Flyers" = "2",
                 "Local official" = "3",
                 "Friend, etc." = "4",
                 "Other" = "5",
                 "Not sure" = "6",
                 "Multiple response" = "9",
                 "Blank" = "99"))
  expect_equal(sex_offender_parsed_sas$value_labels$Q2A,
               c("Checked" = "1",
                 "Blank" = "9"))
  expect_equal(sex_offender_parsed_sas$value_labels$Q3,
               c("Very clear" = "1",
                 "Moderate clear" = "2",
                 "Neutral" = "3",
                 "Somewhat clear" = "4",
                 "Very unclear" = "5",
                 "Not sure" = "6",
                 "Multiple response" = "9",
                 "Blank" = "99"))
  expect_equal(sex_offender_parsed_sas$value_labels$Q6E,
               c("Checked" = "1",
                 "Blank" = "9"))
  expect_equal(sex_offender_parsed_sas$value_labels$Q10,
               c("More anxious" = "1",
                 "Very anxious" = "2",
                 "Neutral" = "3",
                 "Somewhat less" = "4",
                 "Relieved" = "5",
                 "No opinion" = "6",
                 "Not sure" = "7",
                 "Multiple response" = "9",
                 "Blank" = "99"))
  expect_equal(sex_offender_parsed_sas$value_labels$INDEX,
               c("More concerned" = "1",
                 "Neutral" = "2",
                 "Less concerned" = "3",
                 "Blank" = "9"))
  expect_equal(sex_offender_parsed_sas$value_labels$NEWQ9G,
               c("Inadequate" = "1",
                 "Adequate +" = "2",
                 "Blank" = "9"))

})

test_that("Sac - parsed value labels are accurate", {
  expect_equal(sac_parsed_sas$value_labels$TODDATYR,
               c("Unknown" = "9999"))
  expect_equal(sac_parsed_sas$value_labels$CONSTATE,
               c("Maricopa, AZ" = "1",
                 "Sacramento, CA" = "2",
                 "Unknown" = "9"))
  expect_equal(sac_parsed_sas$value_labels$Q2JAGE,
               c("18-30 yrs" = "1",
                 "31-40 yrs" = "2",
                 "41-50 yrs" = "3",
                 "51-60 yrs" = "4",
                 "61-70 yrs" = "5",
                 "Over 70" = "6"))
  expect_equal(sac_parsed_sas$value_labels$Q3JETH,
               c("African American" = "1",
                 "Asian American" = "2",
                 "Caucasian" = "3",
                 "Hispanic/Latino" = "4",
                 "Other" = "5",
                 "Unknown" = "9"))
  expect_equal(sac_parsed_sas$value_labels$Q4JEDUC,
               c("H.S. or less / GED" = "1",
                 "College no degree" = "2",
                 "Associate degree" = "3",
                 "Bachelors" = "4",
                 "Graduate no degree" = "5",
                 "Graduate degree etc" = "6",
                 "Other" = "7"))
  expect_equal(length(sac_parsed_sas$value_labels$Q20TPEV3), 107)
  expect_equal(sac_parsed_sas$value_labels$KAGE,
               c("12 or younger at time of trial" = "1",
                 "13 or older at time of trial" = "2",
                 "Unknown" = "9"))
  expect_equal(sac_parsed_sas$value_labels$VERDICT,
               c("Not guilty" = "0",
                 "Guilty" = "1",
                 "Unknown" = "9"))
  expect_equal(sac_parsed_sas$value_labels$DURAT,
               c("Undoc code" = "-2",
                 "Unknown" = "99"))
  expect_equal(sac_parsed_sas$value_labels$DURAT2,
               c("2 years or less" = "1",
                 "3 years or more" = "2",
                 "Unknown" = "9"))

})

test_that("Parole - parsed value labels are accurate", {
  expect_equal(parole_parsed_sas$value_labels$STATEID,
               c("(0) Federal" = "0",
                 "(1) Alabama" = "1",
                 "(2) Alaska" = "2",
                 "(4) Arizona" = "4",
                 "(5) Arkansas" = "5",
                 "(6) California" = "6",
                 "(8) Colorado" = "8",
                 "(9) Connecticut" = "9",
                 "(10) Delaware" = "10",
                 "(11) District of Columbia" = "11",
                 "(12) Florida" = "12",
                 "(13) Georgia" = "13",
                 "(15) Hawaii" = "15",
                 "(16) Idaho" = "16",
                 "(17) Illinois" = "17",
                 "(18) Indiana" = "18",
                 "(19) Iowa" = "19",
                 "(20) Kansas" = "20",
                 "(21) Kentucky" = "21",
                 "(22) Louisiana" = "22",
                 "(23) Maine" = "23",
                 "(24) Maryland" = "24",
                 "(25) Massachusetts" = "25",
                 "(26) Michigan" = "26",
                 "(27) Minnesota" = "27",
                 "(28) Mississippi" = "28",
                 "(29) Missouri" = "29",
                 "(30) Montana" = "30",
                 "(31) Nebraska" = "31",
                 "(32) Nevada" = "32",
                 "(33) New Hampshire" = "33",
                 "(34) New Jersey" = "34",
                 "(35) New Mexico" = "35",
                 "(36) New York" = "36",
                 "(37) North Carolina" = "37",
                 "(38) North Dakota" = "38",
                 "(39) Ohio" = "39",
                 "(40) Oklahoma" = "40",
                 "(41) Oregon" = "41",
                 "(42) Pennsylvania" = "42",
                 "(44) Rhode Island" = "44",
                 "(45) South Carolina" = "45",
                 "(46) South Dakota" = "46",
                 "(47) Tennessee" = "47",
                 "(48) Texas" = "48",
                 "(49) Utah" = "49",
                 "(50) Vermont" = "50",
                 "(51) Virginia" = "51",
                 "(53) Washington" = "53",
                 "(54) West Virginia" = "54",
                 "(55) Wisconsin" = "55",
                 "(56) Wyoming" = "56"))
  expect_equal(parole_parsed_sas$value_labels$STATE,
               c("(AK) Alaska" = "AK",
                 "(AL) Alabama" = "AL",
                 "(AR) Arkansas" = "AR",
                 "(AZ) Arizona" = "AZ",
                 "(CA) California" = "CA",
                 "(CO) Colorado" = "CO",
                 "(CT) Connecticut" = "CT",
                 "(DC) District of Columbia" = "DC",
                 "(DE) Delaware" = "DE",
                 "(FE) Federal" = "FE",
                 "(FL) Florida" = "FL",
                 "(GA) Georgia" = "GA",
                 "(HI) Hawaii" = "HI",
                 "(IA) Iowa" = "IA",
                 "(ID) Idaho" = "ID",
                 "(IL) Illinois" = "IL",
                 "(IN) Indiana" = "IN",
                 "(KS) Kansas" = "KS",
                 "(KY) Kentucky" = "KY",
                 "(LA) Louisiana" = "LA",
                 "(MA) Massachusetts" = "MA",
                 "(MD) Maryland" = "MD",
                 "(ME) Maine" = "ME",
                 "(MI) Michigan" = "MI",
                 "(MN) Minnesota" = "MN",
                 "(MO) Missouri" = "MO",
                 "(MS) Mississippi" = "MS",
                 "(MT) Montana" = "MT",
                 "(NC) North Carolina" = "NC",
                 "(ND) North Dakota" = "ND",
                 "(NE) Nebraska" = "NE",
                 "(NH) New Hampshire" = "NH",
                 "(NJ) New Jersey" = "NJ",
                 "(NM) New Mexico" = "NM",
                 "(NV) Nevada" = "NV",
                 "(NY) New York" = "NY",
                 "(OH) Ohio" = "OH",
                 "(OK) Oklahoma" = "OK",
                 "(OR) Oregon" = "OR",
                 "(PA) Pennsylvania" = "PA",
                 "(RI) Rhode Island" = "RI",
                 "(SC) South Carolina" = "SC",
                 "(SD) South Dakota" = "SD",
                 "(TN) Tennessee" = "TN",
                 "(TX) Texas" = "TX",
                 "(UT) Utah" = "UT",
                 "(VA) Virginia" = "VA",
                 "(VT) Vermont" = "VT",
                 "(WA) Washington" = "WA",
                 "(WI) Wisconsin" = "WI",
                 "(WV) West Virginia" = "WV",
                 "(WY) Wyoming" = "WY"))
  expect_equal(parole_parsed_sas$value_labels$TOTBEG,
               c("(-9) Not known/Dont know" = "-9",
                 "(-8) Not applicable" = "-8"))
  expect_equal(parole_parsed_sas$value_labels$MALE,
               c("(-9) Not known/Dont know" = "-9",
                 "(-8) Not applicable" = "-8"))
  expect_equal(parole_parsed_sas$value_labels$ISP,
               c("(N) No program" = "N",
                 "(Y) Yes" = "Y"))
  expect_equal(parole_parsed_sas$value_labels$ISPNUM,
               c("(-9) Not known/Dont know" = "-9",
                 "(-8) Not applicable" = "-8"))
  expect_equal(parole_parsed_sas$value_labels$ISPIN,
               c("(DK) Not known/Dont know" = "DK",
                 "(N) No" = "N",
                 "(NA) Not applicable" = "NA",
                 "(Y) Yes" = "Y"))
  expect_equal(parole_parsed_sas$value_labels$EM,
               c("(N) No program" = "N",
                 "(Y) Yes" = "Y"))
  expect_equal(parole_parsed_sas$value_labels$ENDOFYEAR,
               c("(DK) Not known/Dont know" = "DK",
                 "(N) No" = "N",
                 "(Y) Yes" = "Y"))

})


test_that("Prisoners - parsed value labels are accurate", {
  expect_equal(prisoners_parsed_sas$value_labels$STATEID,
               c("(01) 01. Alabama" = "1",
                 "(02) 02. Alaska" = "2",
                 "(04) 04. Arizona" = "4",
                 "(05) 05. Arkansas" = "5",
                 "(06) 06. California" = "6",
                 "(08) 08. Colorado" = "8",
                 "(09) 09. Connecticut" = "9",
                 "(10) 10. Delaware" = "10",
                 "(11) 11. District of Columbia" = "11",
                 "(12) 12. Florida" = "12",
                 "(13) 13. Georgia" = "13",
                 "(15) 15. Hawaii" = "15",
                 "(16) 16. Idaho" = "16",
                 "(17) 17. Illinois" = "17",
                 "(18) 18. Indiana" = "18",
                 "(19) 19. Iowa" = "19",
                 "(20) 20. Kansas" = "20",
                 "(21) 21. Kentucky" = "21",
                 "(22) 22. Louisiana" = "22",
                 "(23) 23. Maine" = "23",
                 "(24) 24. Maryland" = "24",
                 "(25) 25. Massachusetts" = "25",
                 "(26) 26. Michigan" = "26",
                 "(27) 27. Minnesota" = "27",
                 "(28) 28. Mississippi" = "28",
                 "(29) 29. Missouri" = "29",
                 "(30) 30. Montana" = "30",
                 "(31) 31. Nebraska" = "31",
                 "(32) 32. Nevada" = "32",
                 "(33) 33. New Hampshire" = "33",
                 "(34) 34. New Jersey" = "34",
                 "(35) 35. New Mexico" = "35",
                 "(36) 36. New York" = "36",
                 "(37) 37. North Carolina" = "37",
                 "(38) 38. North Dakota" = "38",
                 "(39) 39. Ohio" = "39",
                 "(40) 40. Oklahoma" = "40",
                 "(41) 41. Oregon" = "41",
                 "(42) 42. Pennsylvania" = "42",
                 "(44) 44. Rhode Island" = "44",
                 "(45) 45. South Carolina" = "45",
                 "(46) 46. South Dakota" = "46",
                 "(47) 47. Tennessee" = "47",
                 "(48) 48. Texas" = "48",
                 "(49) 49. Utah" = "49",
                 "(50) 50. Vermont" = "50",
                 "(51) 51. Virginia" = "51",
                 "(52) 52. Jurisdiction shared between States" = "52",
                 "(53) 53. Washington" = "53",
                 "(54) 54. West Virginia" = "54",
                 "(55) 55. Wisconsin" = "55",
                 "(56) 56. Wyoming" = "56",
                 "(60) State prison total" = "60",
                 "(70) US prison total (state+federal)" = "70",
                 "(99) Federal BOP" = "99"))
  expect_equal(prisoners_parsed_sas$value_labels$REGION,
               c("(1) Northeast" = "1",
                 "(2) Midwest" = "2",
                 "(3) South" = "3",
                 "(4) West" = "4",
                 "(5) U.S. total" = "5",
                 "(6) Federal Bureau of Prisons" = "6",
                 "(7) State total" = "7"))
  expect_equal(prisoners_parsed_sas$value_labels$CWPRIVM,
               c("(-9) Data are missing because the state did not respond to the item" = "-9",
                 "(-8) Data are missing because the item was not applicable to the state" = "-8",
                 "(-2) Item was asked, but only in the aggregate prison population, not by male or female" = "-2",
                 "(-1) Item not asked in survey for this year" = "-1"))
  expect_equal(prisoners_parsed_sas$value_labels$PVOTHF,
               c("(-9) Data are missing because the state did not respond to the item" = "-9",
                 "(-8) Data are missing because the item was not applicable to the state" = "-8",
                 "(-2) Item was asked, but only in the aggregate prison population, not by male or female" = "-2",
                 "(-1) Item not asked in survey for this year" = "-1"))
  expect_equal(prisoners_parsed_sas$value_labels$PVINCLF,
               c("(-9) Data are missing because the state did not respond to the item" = "-9",
                 "(-8) Data are missing because the item was not applicable to the state" = "-8",
                 "(-2) Item was asked, but only in the aggregate prison population, not by male or female" = "-2",
                 "(-1) Item not asked in survey for this year" = "-1",
                 "(1) Yes" = "1",
                 "(2) No" = "2"))
  expect_equal(prisoners_parsed_sas$value_labels$HANDLEF,
               c("(-9) Data are missing because the state did not respond to the item" = "-9",
                 "(-8) Data are missing because the item was not applicable to the state" = "-8",
                 "(-2) Item was asked, but only in the aggregate prison population, not by male or female" = "-2",
                 "(-1) Item not asked in survey for this year" = "-1"))

})


test_that("CA vital - parsed value labels are accurate", {
  expect_equal(ca_vital_parsed_sas$value_labels$VICSEX,
               c("Unknown" = "0",
                 "Male" = "1",
                 "Female" = "2"))
  expect_equal(ca_vital_parsed_sas$value_labels$CRIMEST,
               c("Actual" = "1",
                 "Justifiable - private citizen" = "2",
                 "Manslaughter" = "3",
                 "Justifiable - peace officer" = "4"))
  expect_equal(length(ca_vital_parsed_sas$value_labels$PRECIP2), 46)
  expect_equal(ca_vital_parsed_sas$value_labels$SUS2RACE,
               c("Unknown" = "0",
                 "White (not Hispanic)" = "1",
                 "Hispanic" = "2",
                 "Black" = "3",
                 "American Indian" = "4",
                 "Chinese" = "5",
                 "Japanese" = "6",
                 "Filipino" = "7",
                 "Other" = "8",
                 "Pacific Islander" = "9",
                 "Other Asian" = "A",
                 "Black" = "B",
                 "Chinese" = "C",
                 "Cambodian" = "D",
                 "Filipino" = "F",
                 "Guamanian" = "G",
                 "Hispanic" = "H",
                 "American Indian" = "I",
                 "Japanese" = "J",
                 "Korean" = "K",
                 "Laotian" = "L",
                 "Other" = "O",
                 "Pacific Islander" = "P",
                 "Samoan" = "S",
                 "Hawaiian" = "U",
                 "Vietnamese" = "V",
                 "White" = "W",
                 "Unknown" = "X",
                 "Asian" = "Z"))
  expect_equal(ca_vital_parsed_sas$value_labels$EDUCATN,
               c("1 year of college" = "13",
                 "2 years of college" = "14",
                 "3 years of college" = "15",
                 "4 years of college" = "16",
                 "5+ years of college" = "17",
                 "Unknown or not available" = "99"))
  expect_equal(ca_vital_parsed_sas$value_labels$FLAG,
               c("No estimate (incident day as reported)" = "0",
                 "Estimate (incident day set to 01)" = "1"))
  expect_equal(ca_vital_parsed_sas$value_labels$HISPANIC,
               c("Not Spanish/Hispanic" = "1",
                 "Mexican/Mexican-American/Chicano" = "2",
                 "Puerto Rican" = "3",
                 "Cuban" = "4",
                 "Central/So. American" = "5",
                 "(Born outside U.S.),other Spanish/Hispan" = "6",
                 "Code not used" = "7",
                 "(Born in the U.S.), other Spanish/Hispan" = "8",
                 "Unknown or unreported" = "9"))
  expect_equal(ca_vital_parsed_sas$value_labels$MATCH,
               c("Death record did not match with homicide" = "0",
                 "Death record matched with homicide recor" = "1"))
})


test_that("LEOKA 1980 - parsed value labels are accurate", {

  expect_equal(leoka1980_parsed_sas$value_labels$V7,
               c("ALL CITIE 250K+"  = "1",
                 "CIT BET 100-249K" = "2",
                 "CIT BET 50-99.9K" = "3",
                 "CIT BET 25-49.9K" = "4",
                 "CIT BET 10-24.9K" = "5",
                 "CIT BET 2.5-9.9K" = "6",
                 "CITIE UNDER 2.5K" = "7",
                 "NON-SMSA COUNTIE" = "8",
                 "SMSA COUNTIES"    = "9"))
  expect_equal(leoka1980_parsed_sas$value_labels$V8,
               c("POSSESS GUAM ETC"      = "0",
                 "ALL CITIES 1M+"        = "11",
                 "CIT BET 500-999K"      = "12",
                 "CIT BET 250-499K"      = "13",
                 "CIT BET 100-249K"      = "20",
                 "CIT BET 50-99.9K"      = "30",
                 "CIT BET 25-49.9K"      = "40",
                 "CIT BET 10-24.9K"      = "50",
                 "CIT BET 2.5-9.9K"      = "60",
                 "CITIE UNDER 2.5K"      = "70",
                 "NON-SMSA 100K+"        = "81",
                 "NON-SMSA 25-99K"       = "82",
                 "NON-SMSA 10-24K"       = "83",
                 "NON-SMSA <10K"         = "84",
                 "NON-SMSA STATE POLICE" = "85",
                 "SMSA COUNT 10K+"       = "91",
                 "SMSA 25-99.9K"         = "92",
                 "SMSA 100K+"            = "93",
                 "SMSA COUNT <10K"       = "94",
                 "SMSA STATE POLICE"     = "95"))
  expect_equal(leoka1980_parsed_sas$value_labels$V11,
               c("GROUPS 8 AND 9" = "0"))
  expect_equal(leoka1980_parsed_sas$value_labels$V55,
               c("FOR ALL REPORTS" = "0",
                 "CITY LIST ASSAUL" = "1",
                 "CITY LIST ONLY" = "2"))
  expect_equal(leoka1980_parsed_sas$value_labels$V56,
               c("POL EMPLOY DA" = "0",
                 "NOT UPDATED,NONE" = "1",
                 "CONTAINS POL DA" = "2"))
  expect_equal(leoka1980_parsed_sas$value_labels$V72,
               c("NORMAL" = "0",
                 "NO BREAKDOWNS. A" = "1"))
  expect_equal(leoka1980_parsed_sas$value_labels$V73,
               c("INFORMAT COMPLET" = "0",
                 "ASSAULTS NOT REP" = "1",
                 "ASSAULTS REPORTE" = "2"))
  expect_equal(leoka1980_parsed_sas$value_labels$V96,
               c("INFORMAT COMPLET" = "0",
                 "ASSAULTS NOT REP" = "1",
                 "ASSAULTS REPORTE" = "2"))

})


test_that("Property stolen - parsed value labels are accurate", {

  expect_equal(property_stolen_parsed_sas$value_labels$V2,
               c("Alabama" = "1",
                 "Arizona" = "2",
                 "Arkansas" = "3",
                 "California" = "4",
                 "Colorado" = "5",
                 "Connecticut" = "6",
                 "Delaware" = "7",
                 "District of Columbia" = "8",
                 "Florida" = "9",
                 "Georgia" = "10",
                 "Idaho" = "11",
                 "Illinois" = "12",
                 "Indiana" = "13",
                 "Iowa" = "14",
                 "Kansas" = "15",
                 "Kentucky" = "16",
                 "Louisiana" = "17",
                 "Maine" = "18",
                 "Maryland" = "19",
                 "Massachusetts" = "20",
                 "Michigan" = "21",
                 "Minnesota" = "22",
                 "Mississippi" = "23",
                 "Missouri" = "24",
                 "Montana" = "25",
                 "Nebraska" = "26",
                 "Nevada" = "27",
                 "New Hampshire" = "28",
                 "New Jersey" = "29",
                 "New Mexico" = "30",
                 "New York" = "31",
                 "North Carolina" = "32",
                 "North Dakota" = "33",
                 "Ohio" = "34",
                 "Oklahoma" = "35",
                 "Oregon" = "36",
                 "Pennsylvania" = "37",
                 "Rhode Island" = "38",
                 "South Carolina" = "39",
                 "South Dakota" = "40",
                 "Tennessee" = "41",
                 "Texas" = "42",
                 "Utah" = "43",
                 "Vermont" = "44",
                 "Virginia" = "45",
                 "Washington" = "46",
                 "West Virginia" = "47",
                 "Wisconsin" = "48",
                 "Wyoming" = "49",
                 "Alaska" = "50",
                 "Hawaii" = "51",
                 "Canal Zone" = "52",
                 "Puerto Rico" = "53",
                 "American Samoa" = "54",
                 "Guam" = "55",
                 "Virgin Islands" = "62"))
  expect_equal(property_stolen_parsed_sas$value_labels$V4,
               c("Possessions as Puerto Rico, Guam" = "0",
                 "All cities 250,000 +" = "1",
                 "Cit 1,000,000 +" = "1A",
                 "Cit 500,000-999,999" = "1B",
                 "Cit 250,000-499,999" = "1C",
                 "Cit 100,000-249,999" = "2",
                 "Cit 50,000-99,999" = "3",
                 "Cit 25,000-49,999" = "4",
                 "Cit 10,000-24,999" = "5",
                 "Cit 2,500-9,999" = "6",
                 "Cit < 2,500" = "7",
                 "Non-MSA counties" = "8",
                 "Non-MSA co. 100,000 +" = "8A",
                 "Non-MSA co. 25,000-99,999" = "8B",
                 "Non-MSA co. 10,000-24,999" = "8C",
                 "Non-MSA co. < 10,000" = "8D",
                 "Non-MSA state police" = "8E",
                 "MSA counties" = "9",
                 "MSA co. 100,000 +" = "9A",
                 "MSA co. 25,000-99,999" = "9B",
                 "MSA co. 10,000-24,999" = "9C",
                 "MSA co. < 10,000" = "9D",
                 "MSA state police" = "9E"))
  expect_equal(property_stolen_parsed_sas$value_labels$V5,
               c("Possessions" = "0",
                 "New England" = "1",
                 "Middle Atlantic" = "2",
                 "East North Central" = "3",
                 "West North Central" = "4",
                 "South Atlantic" = "5",
                 "East South Central" = "6",
                 "West South Central" = "7",
                 "Mountain" = "8",
                 "Pacific" = "9"))
  expect_equal(property_stolen_parsed_sas$value_labels$V11,
               c("Not reported" = "0",
                 "Regular"      = "1"))
  expect_equal(property_stolen_parsed_sas$value_labels$V104,
               c("Not reported" = "0",
                 "Regular"      = "1"))
  expect_equal(property_stolen_parsed_sas$value_labels$V197,
               c("Not reported" = "0",
                 "Regular"      = "1"))
  expect_equal(property_stolen_parsed_sas$value_labels$V290,
               c("Not reported" = "0",
                 "Regular"      = "1"))
  expect_equal(property_stolen_parsed_sas$value_labels$V383,
               c("Not reported" = "0",
                 "Regular"      = "1"))
  expect_equal(property_stolen_parsed_sas$value_labels$V476,
               c("Not reported" = "0",
                 "Regular"      = "1"))
  expect_equal(property_stolen_parsed_sas$value_labels$V569,
               c("Not reported" = "0",
                 "Regular"      = "1"))
  expect_equal(property_stolen_parsed_sas$value_labels$V662,
               c("Not reported" = "0",
                 "Regular"      = "1"))
  expect_equal(property_stolen_parsed_sas$value_labels$V755,
               c("Not reported" = "0",
                 "Regular"      = "1"))
  expect_equal(property_stolen_parsed_sas$value_labels$V848,
               c("Not reported" = "0",
                 "Regular"      = "1"))
  expect_equal(property_stolen_parsed_sas$value_labels$V941,
               c("Not reported" = "0",
                 "Regular"      = "1"))
  expect_equal(property_stolen_parsed_sas$value_labels$V1034,
               c("Not reported" = "0",
                 "Regular"      = "1"))

})

test_that("NCVS - parsed value labels are accurate", {


  expect_equal(ncvs_parsed_sas$value_labels$V2009,
               c("Residue" = "9998",
                 "Out of universe" = "9999"))
  expect_equal(ncvs_parsed_sas$value_labels$V2016,
               c("Urban" = "1",
                 "Rural - 10 acres or more" = "2",
                 "Rural - less than 10 acres" = "3",
                 "Residue" = "8",
                 "Out of universe" = "9"))

  expect_equal(ncvs_parsed_sas$value_labels$V4116,
               c("No" = "0",
                 "Yes" = "1",
                 "Not applicable" = "8",
                 "Out of universe" = "9"))
  expect_equal(ncvs_parsed_sas$value_labels$V4117,
               c("No" = "0",
                 "Yes" = "1",
                 "Not applicable" = "8",
                 "Out of universe" = "9"))
  expect_equal(ncvs_parsed_sas$value_labels$V4118,
               c("No" = "0",
                 "Yes" = "1",
                 "Not applicable" = "8",
                 "Out of universe" = "9"))
  expect_equal(ncvs_parsed_sas$value_labels$V4119,
               c("No" = "0",
                 "Yes" = "1",
                 "Not applicable" = "8",
                 "Out of universe" = "9"))
  expect_equal(ncvs_parsed_sas$value_labels$V4121,
               c("Yes" = "1",
                 "No" = "2",
                 "Don t know" = "3",
                 "Residue" = "8",
                 "Out of universe" = "9"))
  expect_equal(ncvs_parsed_sas$value_labels$V4122,
               c("Yes" = "1",
                 "Part" = "2",
                 "Not yet settled" = "3",
                 "None" = "4",
                 "Residue" = "8",
                 "Out of universe" = "9"))
  expect_equal(ncvs_parsed_sas$value_labels$V4322,
               c("Score obtained by adding elements" = "9999.00"))
  expect_equal(ncvs_parsed_sas$value_labels$V4323,
               c("Score obtained by adding elements" = "99"))
  expect_equal(ncvs_parsed_sas$value_labels$V4327,
               c("Stranger" = "1",
                 "Nonstranger" = "2",
                 "Out of universe" = "9"))

})


test_that("Jail survey 1987 - parsed value labels are accurate", {


  expect_equal(jail_1987_parsed_sas$value_labels$V1,
               c("ICPSR NUMBER" = "9074"))
  expect_equal(jail_1987_parsed_sas$value_labels$V2,
               c("SPRING,1989" = "1"))
  expect_equal(jail_1987_parsed_sas$value_labels$V6,
               c("ALABAMA" = "1",
                 "ALASKA" = "2",
                 "ARIZONA" = "3",
                 "ARKANSAS" = "4",
                 "CALIFORNIA" = "5",
                 "COLORADO" = "6",
                 "CONNECTICUT" = "7",
                 "DELAWARE" = "8",
                 "DIST OF COLUMBIA" = "9",
                 "FLORIDA" = "10",
                 "GEORGIA" = "11",
                 "HAWAII" = "12",
                 "IDAHO" = "13",
                 "ILLINOIS" = "14",
                 "INDIANA" = "15",
                 "IOWA" = "16",
                 "KANSAS" = "17",
                 "KENTUCKY" = "18",
                 "LOUISIANA" = "19",
                 "MAINE" = "20",
                 "MARYLAND" = "21",
                 "MASSACHUSETTS" = "22",
                 "MICHIGAN" = "23",
                 "MINNESOTA" = "24",
                 "MISSISSIPPI" = "25",
                 "MISSOURI" = "26",
                 "MONTANA" = "27",
                 "NORTH CAROLINA" = "28",
                 "NORTH DAKOTA" = "29",
                 "NEBRASKA" = "30",
                 "NEVADA" = "31",
                 "NEW HAMPSHIRE" = "32",
                 "NEW JERSEY" = "33",
                 "NEW MEXICO" = "34",
                 "NEW YORK" = "35",
                 "OHIO" = "36",
                 "OKLAHOMA" = "37",
                 "OREGON" = "38",
                 "PENNSYLVANIA" = "39",
                 "RHODE ISLAND" = "40",
                 "SOUTH CAROLINA" = "41",
                 "SOUTH DAKOTA" = "42",
                 "TENNESSEE" = "43",
                 "TEXAS" = "44",
                 "UTAH" = "45",
                 "VIRGINIA" = "46",
                 "VERMONT" = "47",
                 "WASHINGTON" = "48",
                 "WISCONSIN" = "49",
                 "WEST VIRGINIA" = "50",
                 "WYOMING" = "51"))
  expect_equal(jail_1987_parsed_sas$value_labels$V7, c("COUNTY LEVEL" = "1",
                                                       "CITY LEVEL" = "2"))
  expect_equal(jail_1987_parsed_sas$value_labels$V13, c("CERTAINTY UNIT" = "1",
                                                        "SAMPLE UNIT" = "2",
                                                        "SAMPLE UNIT" = "3",
                                                        "SAMPLE UNIT" = "4"))
  expect_equal(jail_1987_parsed_sas$value_labels$V162, c("YES" = "1",
                                                         "NO" = "2"))
  expect_equal(jail_1987_parsed_sas$value_labels$V163, c("YES" = "1"))
  expect_equal(jail_1987_parsed_sas$value_labels$V164, c("YES" = "2"))
  expect_equal(jail_1987_parsed_sas$value_labels$V165, c("YES" = "3"))
  expect_equal(jail_1987_parsed_sas$value_labels$V166, c("YES" = "4"))
  expect_equal(jail_1987_parsed_sas$value_labels$V167, c("YES" = "5"))
  expect_equal(jail_1987_parsed_sas$value_labels$V168, c("YES" = "6"))
  expect_equal(jail_1987_parsed_sas$value_labels$V169, c("YES" = "7"))
  expect_equal(jail_1987_parsed_sas$value_labels$V170, c("YES" = "8"))
  expect_equal(jail_1987_parsed_sas$value_labels$V171, c("YES" = "9"))
  expect_equal(jail_1987_parsed_sas$value_labels$V172, c("YES" = "10"))
  expect_equal(jail_1987_parsed_sas$value_labels$V173, c("YES" = "11"))
  expect_equal(jail_1987_parsed_sas$value_labels$V174, c("YES" = "12"))
  expect_equal(jail_1987_parsed_sas$value_labels$V175, c("YES" = "13"))
  expect_equal(jail_1987_parsed_sas$value_labels$V176, c("CENSUS CODE" = "0"))



})

test_that("Corrections - parsed value labels are accurate", {


  expect_equal(corrections_parsed_sas$value_labels$SEX,
               c("(1) Male" = "1",
                 "(2) Female" = "2"))
  expect_equal(corrections_parsed_sas$value_labels$EDUCATION,
               c("(1) <HS diploma/GED" = "1",
                 "(2) HS diploma/GED" = "2",
                 "(3) Any college" = "3",
                 "(9) Ungraded/unknown" = "9"))
  expect_equal(corrections_parsed_sas$value_labels$ADMTYPE,
               c("(1) New court commitment" = "1",
                 "(2) Parole return/revocation" = "2",
                 "(3) Other admission (including unsentenced, transfer, AWOL/escapee return)" = "3",
                 "(9) Missing" = "9"))
  expect_equal(corrections_parsed_sas$value_labels$OFFGENERAL,
               c("(1) Violent" = "1",
                 "(2) Property" = "2",
                 "(3) Drugs" = "3",
                 "(4) Public order" = "4",
                 "(5) Other/unspecified" = "5",
                 "(9) Missing" = "9"))
  expect_equal(corrections_parsed_sas$value_labels$SENTLGTH,
               c("(0) < 1 year" = "0",
                 "(1) 1-1.9 years" = "1",
                 "(2) 2-4.9 years" = "2",
                 "(3) 5-9.9 years" = "3",
                 "(4) 10-24.9 years" = "4",
                 "(5) >=25 years" = "5",
                 "(6) Life, LWOP, Life plus additional years, Death" = "6",
                 "(9) Missing" = "9"))
  expect_equal(corrections_parsed_sas$value_labels$OFFDETAIL,
               c("(01) Murder (including non-negligent manslaughter)" = "1",
                 "(02) Negligent manslaughter" = "2",
                 "(03) Rape/sexual assault" = "3",
                 "(04) Robbery" = "4",
                 "(05) Aggravated or simple assault" = "5",
                 "(06) Other violent offenses" = "6",
                 "(07) Burglary" = "7",
                 "(08) Larceny" = "8",
                 "(09) Motor vehicle theft" = "9",
                 "(10) Fraud" = "10",
                 "(11) Other property offenses" = "11",
                 "(12) Drugs (includes possession, distribution, trafficking, other)" = "12",
                 "(13) Public order" = "13",
                 "(14) Other/unspecified" = "14",
                 "(99) Missing" = "99"))
  expect_equal(corrections_parsed_sas$value_labels$RACE,
               c("(1) White, non-Hispanic" = "1",
                 "(2) Black, non-Hispanic" = "2",
                 "(3) Hispanic, any race" = "3",
                 "(4) Other race(s), non-Hispanic" = "4",
                 "(9) Missing" = "9"))
  expect_equal(corrections_parsed_sas$value_labels$AGEADMIT,
               c("(1) 18-24 years" = "1",
                 "(2) 25-34 years" = "2",
                 "(3) 35-44 years" = "3",
                 "(4) 45-54 years" = "4",
                 "(5) 55+ years" = "5",
                 "(9) Missing" = "9"))

})


test_that("Jail survey 2010 - parsed value labels are accurate", {


  expect_equal(jail_2010_parsed_sas$value_labels$CONFPOPF,
               c("(0) Actual" = "0",
                 "(1) Estimated" = "1",
                 "(8) Not applicable" = "8",
                 "(9) Dont know" = "9"))
  expect_equal(jail_2010_parsed_sas$value_labels$NCONPOPF,
               c("(0) Actual" = "0",
                 "(1) Estimated" = "1",
                 "(8) Not applicable" = "8",
                 "(9) Dont know" = "9"))
  expect_equal(jail_2010_parsed_sas$value_labels$PRETRIALF,
               c("(0) Actual" = "0",
                 "(1) Estimated" = "1",
                 "(8) Not applicable" = "8",
                 "(9) Dont know" = "9"))
  expect_equal(jail_2010_parsed_sas$value_labels$TREATMENTF,
               c("(0) Actual" = "0",
                 "(1) Estimated" = "1",
                 "(8) Not applicable" = "8",
                 "(9) Dont know" = "9"))
  expect_equal(jail_2010_parsed_sas$value_labels$NONCONFDF,
               c("(0) Actual" = "0",
                 "(1) Estimated" = "1",
                 "(8) Not applicable" = "8",
                 "(9) Dont know" = "9"))
  expect_equal(jail_2010_parsed_sas$value_labels$ADFMNCNFF,
               c("(0) Actual" = "0",
                 "(1) Estimated" = "1",
                 "(8) Not applicable" = "8",
                 "(9) Dont know" = "9"))
  expect_equal(jail_2010_parsed_sas$value_labels$JVFMNCNFF,
               c("(0) Actual" = "0",
                 "(1) Estimated" = "1",
                 "(8) Not applicable" = "8",
                 "(9) Dont know" = "9"))
  expect_equal(jail_2010_parsed_sas$value_labels$CONVNCNFF,
               c("(0) Actual" = "0",
                 "(1) Estimated" = "1",
                 "(8) Not applicable" = "8",
                 "(9) Dont know" = "9"))
  expect_equal(jail_2010_parsed_sas$value_labels$UNCNVNCFF,
               c("(0) Actual" = "0",
                 "(1) Estimated" = "1",
                 "(8) Not applicable" = "8",
                 "(9) Dont know" = "9"))
  expect_equal(jail_2010_parsed_sas$value_labels$UNCNVNCFF,
               c("(0) Actual" = "0",
                 "(1) Estimated" = "1",
                 "(8) Not applicable" = "8",
                 "(9) Dont know" = "9"))
  expect_equal(jail_2010_parsed_sas$value_labels$ASIANF,
               c("(0) Actual" = "0",
                 "(1) Estimated" = "1",
                 "(8) Not applicable" = "8",
                 "(9) Dont know" = "9"))
  expect_equal(jail_2010_parsed_sas$value_labels$BLACKF,
               c("(0) Actual" = "0",
                 "(1) Estimated" = "1",
                 "(8) Not applicable" = "8",
                 "(9) Dont know" = "9"))
  expect_equal(jail_2010_parsed_sas$value_labels$OTHERMAJVIO,
               c("(-9) Blank" = "-9"))
  expect_equal(jail_2010_parsed_sas$value_labels$ESCAPE,
               c("(-9) Blank" = "-9"))
  expect_equal(jail_2010_parsed_sas$value_labels$STOLENPROPF,
               c("(-9) Blank" = "-9",
                 "(0) Actual" = "0",
                 "(1) Estimated" = "1",
                 "(8) Not applicable" = "8",
                 "(9) Dont know" = "9"))
  expect_equal(jail_2010_parsed_sas$value_labels$ESCAPEF
               , c("(-9) Blank" = "-9",
                   "(0) Actual" = "0",
                   "(1) Estimated" = "1",
                   "(8) Not applicable" = "8",
                   "(9) Dont know" = "9"))
  expect_equal(jail_2010_parsed_sas$value_labels$OTHERMAJVIOF,
               c("(-9) Blank" = "-9",
                 "(0) Actual" = "0",
                 "(1) Estimated" = "1",
                 "(8) Not applicable" = "8",
                 "(9) Dont know" = "9"))
})



test_that("India human - parsed value labels are accurate", {


  expect_equal(india_human_parsed_sas$value_labels$SURVEY,
               c("(1) IHDS-I 1" = "1",
                 "(2) IHDS-II 2" = "2"))
  expect_equal(india_human_parsed_sas$value_labels$CS18,
               c("(1) Voc: <1 yr 1" = "1",
                 "(2) Voc: 1-2 years 2" = "2",
                 "(3) Voc: 3+ years 3" = "3",
                 "(4) Others 4" = "4"))
  expect_equal(india_human_parsed_sas$value_labels$CS19,
               c("(1) Govt. 1" = "1",
                 "(2) Private 2" = "2"))
  expect_equal(india_human_parsed_sas$value_labels$MG11,
               c("(1) Contractor 1" = "1",
                 "(2) With a job or Self Employed 2" = "2",
                 "(3) Without a job 3" = "3"))
  expect_equal(india_human_parsed_sas$value_labels$MM13,
               c("(0) No 0" = "0",
                 "(1) Yes 1" = "1"))
  expect_equal(india_human_parsed_sas$value_labels$TA6,
               c("(1) Nicely 1" = "1",
                 "(2) Somewhat nicely 2" = "2",
                 "(3) Not nicely 3" = "3"))
  expect_equal(india_human_parsed_sas$value_labels$MGYEAR1,
               c("(0) No 0" = "0",
                 "(1) Yes 1" = "1"))
})


test_that("Health and Nutrition - parsed value labels are accurate", {


  expect_equal(health_nutrition_parsed_sas$value_labels$SDDSRVYR,
               c("(4) NHANES 2005-2006 Public Release" = "4"))
  expect_equal(health_nutrition_parsed_sas$value_labels$RIAGENDR,
               c("(1) Male" = "1",
                 "(2) Female" = "2"))
  expect_equal(health_nutrition_parsed_sas$value_labels$DMDCITZN,
               c("(1) Citizen by birth or naturalization" = "1",
                 "(2) Not a citizen of the US" = "2",
                 "(7) Refused" = "7",
                 "(9) Dont know" = "9"))
  expect_equal(health_nutrition_parsed_sas$value_labels$DMDEDUC3,
               c("(0) Never Attended / Kindergarten Only" = "0",
                 "(1) 1st Grade" = "1",
                 "(2) 2nd Grade" = "2",
                 "(3) 3rd Grade" = "3",
                 "(4) 4th Grade" = "4",
                 "(5) 5th Grade" = "5",
                 "(6) 6th Grade" = "6",
                 "(7) 7th Grade" = "7",
                 "(8) 8th Grade" = "8",
                 "(9) 9th Grade" = "9",
                 "(10) 10th Grade" = "10",
                 "(11) 11th Grade" = "11",
                 "(12) 12th Grade, No Diploma" = "12",
                 "(13) High School Graduate" = "13",
                 "(14) GED or Equivalent" = "14",
                 "(15) More than high school" = "15",
                 "(55) Less Than 5th Grade" = "55",
                 "(66) Less Than 9th Grade" = "66",
                 "(77) Refused" = "77",
                 "(99) Dont know" = "99"))
  expect_equal(health_nutrition_parsed_sas$value_labels$DMDHRBRN,
               c("(1) Born in 50 US States or Washington, DC" = "1",
                 "(2) Born in Mexico" = "2",
                 "(3) Born Elsewhere" = "3",
                 "(7) Refused" = "7",
                 "(9) Dont know" = "9"))
  expect_equal(health_nutrition_parsed_sas$value_labels$SIAINTRP,
               c("(1) Yes" = "1",
                 "(2) No" = "2"))
  expect_equal(health_nutrition_parsed_sas$value_labels$AIALANG,
               c("(1) English" = "1",
                 "(2) Spanish" = "2"))
})

