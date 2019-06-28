test_that("PSID tests", {
  # PSID main take SUPER LONG so they are separate and
  # skipped on both CRAN and TravisCI
  skip_on_cran()
  skip_on_travis()
  psid_supplement_sps_name <- system.file("testdata",
                                          "psid_supplement.sps",
                                          package = "asciiSetupReader")
  psid_core_sps_name       <- system.file("testdata",
                                          "psid_core_sps.zip",
                                          package = "asciiSetupReader")
  psid_main_sps_name       <- system.file("testdata",
                                          "psid_main_sps.zip",
                                          package = "asciiSetupReader")
  psid_all_sas_name        <- system.file("testdata",
                                          "psid_all_sas.zip",
                                          package = "asciiSetupReader")
  psid_main_sas_name       <- system.file("testdata",
                                          "psid_main_sas.zip",
                                          package = "asciiSetupReader")
  psid_supplement_sas_name <- system.file("testdata",
                                          "psid_supplement.sas",
                                          package = "asciiSetupReader")
  psid_core_sas_name       <- system.file("testdata",
                                          "psid_core_sas.zip",
                                          package = "asciiSetupReader")

  psid_supplement_parsed_sps  <- parse_setup(psid_supplement_sps_name)
  psid_core_parsed_sps        <- parse_setup(psid_core_sps_name)
  psid_main_parsed_sps        <- parse_setup(psid_main_sps_name)
  psid_all_parsed_sas         <- parse_setup(psid_all_sas_name)
  psid_main_parsed_sas        <- parse_setup(psid_main_sas_name)
  psid_supplement_parsed_sas  <- parse_setup(psid_supplement_sas_name)
  psid_core_parsed_sas        <- parse_setup(psid_core_sas_name)

  expect_silent(parse_setup(psid_main_sps_name))
  expect_silent(parse_setup(psid_main_sas_name))
  expect_silent(parse_setup(psid_all_sas_name))
  expect_silent(parse_setup(psid_core_sas_name))
  expect_silent(parse_setup(psid_supplement_sas_name))
  expect_silent(parse_setup(psid_supplement_sps_name))
  expect_silent(parse_setup(psid_core_sps_name))


  expect_equal(head(names(psid_main_parsed_sps$value_labels)),
               c("ER30000",
                 "ER30003",
                 "ER30005",
                 "ER30006",
                 "ER30007",
                 "ER30010"))
  expect_equal(tail(names(psid_main_parsed_sps$value_labels)),
               c("TA151282",
                 "TA151286",
                 "TA151288",
                 "TA151290",
                 "TA151291",
                 "TA151301"))

  expect_equal(psid_main_parsed_sps$value_labels$ER30000,
               c("Release number 1, February 2019" = "1",
                 "Release number 2, May 2019" = "2"))
  expect_equal(psid_main_parsed_sps$value_labels$ER30003,
               c("Head" = "1",
                 "Wife/Wife" = "2",
                 "Son or daughter" = "3",
                 "Brother or sister" = "4",
                 "Father or mother" = "5",
                 "Grandchild, niece, nephew, other relatives under 18" = "6",
                 "Other, including in-laws, other adult relatives" = "7",
                 "Husband or Wife of Head who moved out or died in the year prior to the 1968 interview" = "8",
                 "NA" = "9",
                 "Individual from core sample who was born or moved in after the 1968 interview; individual from Immigrant or..." = "0"))
  expect_equal(psid_main_parsed_sps$value_labels$ER30010,
               c("Highest grade or year of schooling completed" = "1",
                 "Highest grade or year of schooling completed" = "2",
                 "Highest grade or year of schooling completed" = "3",
                 "Highest grade or year of schooling completed" = "4",
                 "Highest grade or year of schooling completed" = "5",
                 "Highest grade or year of schooling completed" = "6",
                 "Highest grade or year of schooling completed" = "7",
                 "Highest grade or year of schooling completed" = "8",
                 "Highest grade or year of schooling completed" = "9",
                 "Highest grade or year of schooling completed" = "10",
                 "Highest grade or year of schooling completed" = "11",
                 "Highest grade or year of schooling completed" = "12",
                 "Highest grade or year of schooling completed" = "13",
                 "Highest grade or year of schooling completed" = "14",
                 "Highest grade or year of schooling completed" = "15",
                 "Highest grade or year of schooling completed" = "16",
                 "At least one year of postgraduate work" = "17",
                 "NA; DK" = "99",
                 "Preschool; born or moved in after the 1968 interview or individual from Immigrant or Latino samples (ER30003 0);..." = "0"))
  expect_equal(psid_main_parsed_sps$value_labels$TA050372,
               c("Checked with a public employment agency" = "1",
                 "DK" = "8",
                 "NA; refused" = "9",
                 "Inap.: has not checked with a public employment agency; has not been looking for work during the past four weeks..." = "0"))
  expect_equal(psid_main_parsed_sps$value_labels$TA110336,
               c("Hour" = "1",
                 "Day" = "2",
                 "Week" = "3",
                 "Two Weeks" = "4",
                 "Month" = "5",
                 "Year" = "6",
                 "Other" = "7",
                 "DK" = "8",
                 "NA; refused; NA, DK, RF how much money earned at job 5 in 2010 (TA110335 9999998 or 9999999 or -999999)" = "9",
                 "Inap.: has not done any work for money since January 1, 2009 (TA110141 5); NA, DK, RF whether any work done for..." = "0"))
  expect_equal(psid_main_parsed_sps$value_labels$TA131219,
               c("Actual value" = "1",
                 "Actual value" = "2",
                 "Actual value" = "3",
                 "Actual value" = "4",
                 "Actual value" = "5",
                 "Actual value" = "6",
                 "Actual value" = "7",
                 "Has no children (TA130100 0)" = "0",
                 "All items are DK/NA/refused" = "9"))
  expect_equal(psid_main_parsed_sps$value_labels$TA151290,
               c("Never married, cohabiting" = "1",
                 "Never married, not cohabiting" = "2",
                 "Married, spouse present" = "3",
                 "Married, spouse not present" = "4",
                 "Separated" = "5",
                 "Divorced, cohabiting" = "6",
                 "Divorced, not cohabiting" = "7",
                 "Widowed" = "8",
                 "NA; DK; refused" = "9"))
  expect_equal(psid_main_parsed_sps$value_labels$TA151291,
               c("Northeast" = "1",
                 "North Central" = "2",
                 "South" = "3",
                 "West" = "4",
                 "Alaska, Hawaii" = "5",
                 "Foreign country" = "6",
                 "NA; DK; refused" = "9"))
  expect_equal(psid_main_parsed_sps$value_labels$TA151301,
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
                 "NA; DK; refused" = "99"))


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


  expect_true(is.null(psid_main_parsed_sps$missing))
  expect_equal(nrow(psid_supplement_parsed_sps$missing), 16)
  expect_true(is.null(psid_core_parsed_sps$missing))
  expect_true(is.null(psid_main_parsed_sas$missing))
  expect_true(is.null(psid_all_parsed_sas$missing))
  expect_equal(nrow(psid_supplement_parsed_sas$missing), 16)
  expect_true(is.null(psid_core_parsed_sas$missing))

  expect_equal(head(psid_supplement_parsed_sps$missing$variable),
               c("VIANN_94", "VOANN_94", "VSHOM_94",
                 "VBREL_94", "VSREL_94", "VHIMP_94"))
  expect_equal(tail(psid_supplement_parsed_sps$missing$variable),
               c("VIASS_94", "VIDEB_94", "VINHA_94",
                 "VINHB_94", "VINHC_94", "VSTOC_94"))

  expect_equal(head(psid_supplement_parsed_sps$missing$values),
               c("0", "0", "0",
                 "0", "0", "0"))
  expect_equal(tail(psid_supplement_parsed_sps$missing$values),
               c("0", "0", "0",
                 "0", "0", "0"))

  expect_equal(head(unique(psid_supplement_parsed_sps$missing$variable)),
               c("VIANN_94", "VOANN_94", "VSHOM_94",
                 "VBREL_94", "VSREL_94", "VHIMP_94"))
  expect_equal(tail(unique(psid_supplement_parsed_sps$missing$variable)),
               c("VIASS_94", "VIDEB_94", "VINHA_94",
                 "VINHB_94", "VINHC_94", "VSTOC_94"))

  expect_equal(head(psid_supplement_parsed_sas$missing$variable),
               c("VIANN_94", "VOANN_94", "VSHOM_94",
                 "VBREL_94", "VSREL_94", "VHIMP_94"))
  expect_equal(tail(psid_supplement_parsed_sas$missing$variable),
               c("VIASS_94", "VIDEB_94", "VINHA_94",
                 "VINHB_94", "VINHC_94", "VSTOC_94"))

  expect_equal(head(psid_supplement_parsed_sas$missing$values),
               c("0", "0", "0",
                 "0", "0", "0"))
  expect_equal(tail(psid_supplement_parsed_sas$missing$values),
               c("0", "0", "0",
                 "0", "0", "0"))

  expect_equal(head(unique(psid_supplement_parsed_sas$missing$variable)),
               c("VIANN_94", "VOANN_94", "VSHOM_94",
                 "VBREL_94", "VSREL_94", "VHIMP_94"))
  expect_equal(tail(unique(psid_supplement_parsed_sas$missing$variable)),
               c("VIASS_94", "VIDEB_94", "VINHA_94",
                 "VINHB_94", "VINHC_94", "VSTOC_94"))


  expect_equal(nrow(psid_core_parsed_sas$setup),  2084)
  expect_equal(nrow(psid_supplement_parsed_sas$setup), 17)
  expect_equal(nrow(psid_main_parsed_sas$setup), 3569)
  expect_equal(nrow(psid_all_parsed_sas$setup), 1534)

  expect_equal(head(psid_all_parsed_sas$setup$begin),
               c(1, 2, 6,
                 9, 10, 11))
  expect_equal(head(psid_all_parsed_sas$setup$end),
               c(1, 5, 8,
                 9, 10, 11))
  expect_equal(tail(psid_all_parsed_sas$setup$begin),
               c(4062, 4063, 4065,
                 4067, 4069, 4076))
  expect_equal(tail(psid_all_parsed_sas$setup$end),
               c(4062, 4064, 4066,
                 4068, 4075, 4080))


  expect_equal(head(psid_main_parsed_sas$setup$begin),
               c(1, 2, 6,
                 9, 10, 14))
  expect_equal(head(psid_main_parsed_sas$setup$end),
               c(1, 5, 8,
                 9, 13, 15))
  expect_equal(tail(psid_main_parsed_sas$setup$begin),
               c(7365, 7371, 7375,
                 7380, 7381, 7388))
  expect_equal(tail(psid_main_parsed_sas$setup$end),
               c(7370, 7374, 7379,
                 7380, 7387, 7392))


  expect_equal(head(psid_supplement_parsed_sas$setup$begin),
               c(1, 6, 13,
                 20, 27, 34))
  expect_equal(tail(psid_supplement_parsed_sas$setup$begin),
               c(76, 83, 90,
                 97, 104, 111))

  expect_equal(head(psid_core_parsed_sas$setup$begin),
               c(1, 2, 7,
                 11, 13, 15))
  expect_equal(tail(psid_core_parsed_sas$setup$begin),
               c(3525, 3535, 3545,
                 3546, 3552, 3553))
  expect_equal(head(psid_core_parsed_sas$setup$end),
               c(1, 6, 10,
                 12, 14, 16))
  expect_equal(tail(psid_core_parsed_sas$setup$end),
               c(3534, 3544, 3545,
                 3551, 3552, 3558))
  expect_equal(head(psid_supplement_parsed_sas$setup$end),
               c(5, 12, 19,
                 26, 33, 40))
  expect_equal(tail(psid_supplement_parsed_sas$setup$end),
               c(82, 89, 96,
                 103, 110, 117))


  expect_equal(head(psid_supplement_parsed_sas$setup$column_number),
               c("ID94",
                 "VIANN_94",
                 "VOANN_94",
                 "VSHOM_94",
                 "VBREL_94",
                 "VSREL_94"))
  expect_equal(tail(psid_supplement_parsed_sas$setup$column_number),
               c("VIASS_94",
                 "VIDEB_94",
                 "VINHA_94",
                 "VINHB_94",
                 "VINHC_94",
                 "VSTOC_94"))
  expect_equal(head(psid_supplement_parsed_sas$setup$column_name),
               c("X1994_INTERVIEW_NUMBER",
                 "PUT_INTO_ANNUITY_94",
                 "CASH_IN_ANNUITY_94",
                 "SELL_MAIN_HOME_94",
                 "BUY_REAL_ESTATE_94",
                 "SELL_REAL_ESTATE_94"))
  expect_equal(tail(psid_supplement_parsed_sas$setup$column_name),
               c("ASSETS_BROUGHT_IN_94",
                 "DEBTS_BROUGHT_IN_94",
                 "FIRST_GIFT_INHERITANCE_94",
                 "SECOND_GIFT_INHERITANCE_94",
                 "THIRD_GIFT_INHERITANCE_94",
                 "NET_INTO_STOCK_94"))


  expect_equal(head(psid_core_parsed_sas$setup$column_number),
               c("ER10001",
                 "ER10002",
                 "ER10003",
                 "ER10004",
                 "ER10005",
                 "ER10006"))
  expect_equal(tail(psid_core_parsed_sas$setup$column_number),
               c("ER12079",
                 "ER12080",
                 "ER12081",
                 "ER12082",
                 "ER12083",
                 "ER12084"))

  expect_equal(head(psid_core_parsed_sas$setup$column_name),
               c("RELEASE_NUMBER",
                 "X1997_INTERVIEW",
                 "INTERVIEWER_ID",
                 "CURRENT_STATE",
                 "MONTH_CURRENT_IW",
                 "DAY_CURRENT_IW"))
  expect_equal(tail(psid_core_parsed_sas$setup$column_name),
               c("TOTAL_FAMILY_INCOME",
                 "LABOR_INCOME_HEAD",
                 "ACC_LABOR_INCOME_HD",
                 "LABOR_INCOME_WIFE",
                 "ACC_LABOR_INCOME_WF",
                 "FAMILY_WEIGHT"))

  expect_equal(head(psid_main_parsed_sas$setup$column_number),
               c("ER30000",
                 "ER30001",
                 "ER30002",
                 "ER32000",
                 "ER32021",
                 "ER32022"))
  expect_equal(head(psid_main_parsed_sas$setup$column_name),
               c("RELEASE_NUMBER",
                 "X1968_INTERVIEW_NUMBER",
                 "PERSON_NUMBER_68",
                 "SEX_OF_INDIVIDUAL",
                 "YEAR_BIRTH_INFO_MOST_RECENTLY_UPDATED",
                 "LIVE_BIRTHS_TO_THIS_INDIVIDUAL"))
  expect_equal(tail(psid_main_parsed_sas$setup$column_number),
               c("ER34640",
                 "ER34642",
                 "ER34643",
                 "ER34644",
                 "ER34650",
                 "ER34651"))
  expect_equal(tail(psid_main_parsed_sas$setup$column_name),
               c("OFUM_TOTAL_TRANSFER_INCOME_IMPUTED_17",
                 "YEAR_S_O_FAM_FORMED_17",
                 "MAIN_FAM_ID_FOR_S_O_17",
                 "FOLLOW_STATUS_17",
                 "CORE_IMM_INDIVIDUAL_LONGITUDINAL_WT_17",
                 "CORE_IMM_INDIVIDUAL_CROSS_SECTION_WT_17"))


  expect_equal(head(psid_all_parsed_sas$setup$column_number),
               c("ER30000",
                 "ER30001",
                 "ER30002",
                 "ER32000",
                 "ER32001",
                 "ER32002"))
  expect_equal(head(psid_all_parsed_sas$setup$column_name),
               c("RELEASE_NUMBER",
                 "X1968_INTERVIEW_NUMBER",
                 "PERSON_NUMBER_68",
                 "SEX_OF_INDIVIDUAL",
                 "WTR_ALWAYS_IN_RESPONDING_FAMILY_UNIT",
                 "WTR_EVER_CODED_INSTITUTIONAL"))
  expect_equal(tail(psid_all_parsed_sas$setup$column_number),
               c("ER34646",
                 "ER34647",
                 "ER34648",
                 "ER34649",
                 "ER34650",
                 "ER34651"))
  expect_equal(tail(psid_all_parsed_sas$setup$column_name),
               c("WTR_ELIGIBLE_FOR_TA_17",
                 "RESULT_OF_TA_IW_ATTEMPT_17",
                 "TYPE_OF_IND_RECORD_17",
                 "WHY_NONRESPONSE_17",
                 "CORE_IMM_INDIVIDUAL_LONGITUDINAL_WT_17",
                 "CORE_IMM_INDIVIDUAL_CROSS_SECTION_WT_17"))

  expect_equal(nrow(psid_supplement_parsed_sps$setup),   17)
  expect_equal(nrow(psid_core_parsed_sps$setup),  2084)
  expect_equal(nrow(psid_main_parsed_sps$setup), 3569)

  expect_equal(head(psid_main_parsed_sps$setup$begin),
               c(1, 2, 6,
                 9, 10, 14))
  expect_equal(head(psid_main_parsed_sps$setup$end),
               c(1, 5, 8,
                 9, 13, 15))
  expect_equal(tail(psid_main_parsed_sps$setup$begin),
               c(7365, 7371, 7375,
                 7380, 7381, 7388))
  expect_equal(tail(psid_main_parsed_sps$setup$end),
               c(7370, 7374, 7379,
                 7380, 7387, 7392))
  expect_equal(head(psid_supplement_parsed_sps$setup$begin),
               c(1, 6, 13,
                 20, 27, 34))
  expect_equal(tail(psid_supplement_parsed_sps$setup$begin),
               c(76, 83, 90,
                 97, 104, 111))
  expect_equal(head(psid_supplement_parsed_sps$setup$end),
               c(5, 12, 19,
                 26, 33, 40))
  expect_equal(tail(psid_supplement_parsed_sps$setup$end),
               c(82, 89, 96,
                 103, 110, 117))

  expect_equal(head(psid_core_parsed_sps$setup$begin),
               c(1, 2, 7,
                 11, 13, 15))
  expect_equal(tail(psid_core_parsed_sps$setup$begin),
               c(3525, 3535, 3545,
                 3546, 3552, 3553))
  expect_equal(head(psid_core_parsed_sps$setup$end),
               c(1, 6, 10,
                 12, 14, 16))
  expect_equal(tail(psid_core_parsed_sps$setup$end),
               c(3534, 3544, 3545,
                 3551, 3552, 3558))



  expect_equal(head(psid_main_parsed_sps$setup$column_number),
               c("ER30000",
                 "ER30001",
                 "ER30002",
                 "ER32000",
                 "ER32021",
                 "ER32022"))
  expect_equal(head(psid_main_parsed_sps$setup$column_name),
               c("RELEASE_NUMBER",
                 "X1968_INTERVIEW_NUMBER",
                 "PERSON_NUMBER_68",
                 "SEX_OF_INDIVIDUAL",
                 "YEAR_BIRTH_INFO_MOST_RECENTLY_UPDATED",
                 "LIVE_BIRTHS_TO_THIS_INDIVIDUAL"))
  expect_equal(tail(psid_main_parsed_sps$setup$column_number),
               c("ER34640",
                 "ER34642",
                 "ER34643",
                 "ER34644",
                 "ER34650",
                 "ER34651"))
  expect_equal(tail(psid_main_parsed_sps$setup$column_name),
               c("OFUM_TOTAL_TRANSFER_INCOME_IMPUTED_17",
                 "YEAR_S_O_FAM_FORMED_17",
                 "MAIN_FAM_ID_FOR_S_O_17",
                 "FOLLOW_STATUS_17",
                 "CORE_IMM_INDIVIDUAL_LONGITUDINAL_WT_17",
                 "CORE_IMM_INDIVIDUAL_CROSS_SECTION_WT_17"))


  expect_equal(head(psid_supplement_parsed_sps$setup$column_number),
               c("ID94",
                 "VIANN_94",
                 "VOANN_94",
                 "VSHOM_94",
                 "VBREL_94",
                 "VSREL_94"))
  expect_equal(tail(psid_supplement_parsed_sps$setup$column_number),
               c("VIASS_94",
                 "VIDEB_94",
                 "VINHA_94",
                 "VINHB_94",
                 "VINHC_94",
                 "VSTOC_94"))
  expect_equal(head(psid_supplement_parsed_sps$setup$column_name),
               c("X1994_INTERVIEW_NUMBER",
                 "PUT_INTO_ANNUITY_94",
                 "CASH_IN_ANNUITY_94",
                 "SELL_MAIN_HOME_94",
                 "BUY_REAL_ESTATE_94",
                 "SELL_REAL_ESTATE_94"))
  expect_equal(tail(psid_supplement_parsed_sps$setup$column_name),
               c("ASSETS_BROUGHT_IN_94",
                 "DEBTS_BROUGHT_IN_94",
                 "FIRST_GIFT_INHERITANCE_94",
                 "SECOND_GIFT_INHERITANCE_94",
                 "THIRD_GIFT_INHERITANCE_94",
                 "NET_INTO_STOCK_94"))


  expect_equal(head(psid_core_parsed_sps$setup$column_number),
               c("ER10001",
                 "ER10002",
                 "ER10003",
                 "ER10004",
                 "ER10005",
                 "ER10006"))
  expect_equal(tail(psid_core_parsed_sps$setup$column_number),
               c("ER12079",
                 "ER12080",
                 "ER12081",
                 "ER12082",
                 "ER12083",
                 "ER12084"))
  expect_equal(head(psid_core_parsed_sps$setup$column_name),
               c("RELEASE_NUMBER",
                 "X1997_INTERVIEW",
                 "INTERVIEWER_ID",
                 "CURRENT_STATE",
                 "MONTH_CURRENT_IW",
                 "DAY_CURRENT_IW"))
  expect_equal(tail(psid_core_parsed_sps$setup$column_name),
               c("TOTAL_FAMILY_INCOME",
                 "LABOR_INCOME_HEAD",
                 "ACC_LABOR_INCOME_HD",
                 "LABOR_INCOME_WIFE",
                 "ACC_LABOR_INCOME_WF",
                 "FAMILY_WEIGHT"))


})
