context("sas setup parse")



test_that("parse_setup is silent", {
  skip_on_cran()
  expect_silent(parse_setup(crosswalk_sas_name))
  expect_silent(parse_setup(parole_sas_name))
  expect_silent(parse_setup(ucr1985_sas_name))
  expect_silent(parse_setup(ucr1986_sas_name))
  expect_silent(parse_setup(ucr2000_sas_name))
  #  expect_silent(parse_setup(ucr2006_sas_name))
  expect_silent(parse_setup(sac_sas_name))
  expect_silent(parse_setup(sex_offender_sas_name))
  expect_silent(parse_setup(ucr1960_sas_name))
  expect_silent(parse_setup(weimar_sas_name))
  expect_silent(parse_setup(acs_sas_name))
  expect_silent(parse_setup(nibrs_sas_name))
  expect_silent(parse_setup(prisoners_sas_name))
  expect_silent(parse_setup(SHR1987_sas_name))
  expect_silent(parse_setup(SHR1988_sas_name))
  expect_silent(parse_setup(SHR1981_sas_name))
  expect_silent(parse_setup(ca_vital_sas_name))

  expect_silent(parse_setup(ncvs_sas_name))
  expect_silent(parse_setup(jail_1987_sas_name))
  expect_silent(parse_setup(jail_2010_sas_name))
  expect_silent(parse_setup(corrections_sas_name))

})




test_that("Right number of columns", {
  skip_on_cran()
  expect_equal(nrow(sac_parsed_sas$setup), 197)
  expect_equal(nrow(sex_offender_parsed_sas$setup), 34)
  expect_equal(nrow(ucr1960_parsed_sas$setup), 1448)
  expect_equal(nrow(weimar_parsed_sas$setup), 23)
  expect_equal(nrow(acs_parsed_sas$setup), 6)
  expect_equal(nrow(nibrs_parsed_sas$setup), 20)
  expect_equal(nrow(parole_parsed_sas$setup), 59)
  expect_equal(nrow(prisoners_parsed_sas$setup), 201)
  expect_equal(nrow(ca_vital_parsed_sas$setup), 59)
  expect_equal(nrow(crosswalk_parsed_sas$setup), 29)
  expect_equal(nrow(ucr1985_parsed_sas$setup), 1458)
  expect_equal(nrow(ucr1986_parsed_sas$setup), 1458)
  expect_equal(nrow(ucr2000_parsed_sas$setup), 1448)

  expect_equal(nrow(jail_1987_parsed_sas$setup), 176)

  expect_equal(nrow(jail_2010_parsed_sas$setup), 200)

  expect_equal(nrow(corrections_parsed_sas$setup), 14)


})


test_that("Starting number is correct", {
  skip_on_cran()


  expect_equal(sac_parsed_sas$setup$begin[1:20], c(1, 3, 6, 10, 16, 17, 18, 19, 20, 21, 22,
                                                   23, 24, 25, 27, 29, 31, 32, 33, 34))
  expect_equal(sac_parsed_sas$setup$begin[178:197], c(219, 220, 222, 223, 224, 226, 227,
                                                      229, 230, 232, 233, 234, 236, 237,
                                                      239, 240, 242, 243, 244, 246))
  expect_equal(sex_offender_parsed_sas$setup$begin, c(1, 4, 6, 13, 27, 29, 30, 31, 32, 33,
                                                      34, 35, 36, 38, 40, 42, 43, 44, 45,
                                                      46, 47, 48, 50, 52, 54, 56, 58, 60,
                                                      62, 64, 66, 68, 70, 71))
  expect_equal(ucr1960_parsed_sas$setup$begin[1:20], c(1, 2, 4, 11, 13, 14, 18, 23, 24, 31,
                                                       38, 42, 44, 45, 52, 55, 58, 63, 66, 69))
  expect_equal(ucr1960_parsed_sas$setup$begin[1429:1448], c(1936, 1937, 1938, 1939, 1940,
                                                            1941, 1942, 1943, 1944,  1945, 1946,
                                                            1947, 1948, 1949, 1950, 1951,
                                                            1952, 1953, 1954, 1955))
  expect_equal(weimar_parsed_sas$setup$begin, c(1, 3, 5, 6, 23, 30, 37, 44, 51, 58, 65, 72,
                                                79, 86, 93, 100, 107, 114, 121, 128, 135,
                                                142, 149))
  expect_equal(acs_parsed_sas$setup$begin, c(1, 3, 4, 8, 18, 19))
  expect_equal(nibrs_parsed_sas$setup$begin, c(1, 3, 5, 14, 26, 34, 42, 72, 74, 76, 77, 78,
                                               79, 80, 89, 93, 97, 98, 106, 133))
  expect_equal(parole_parsed_sas$setup$begin[1:20], c(1, 3, 5, 11, 17, 23, 29, 35, 41, 47,
                                                      53, 59, 65, 71, 77, 83, 89, 95, 101,
                                                      107))
  expect_equal(parole_parsed_sas$setup$begin[40:59], c(222, 228, 230, 231, 237, 239, 240,
                                                       246, 248, 250, 252, 254, 256, 262,
                                                       268, 274, 280, 286, 292, 298))
  expect_equal(ca_vital_parsed_sas$setup$begin, c(1, 3, 7, 12, 14, 16, 17, 18,  19, 21, 23, 25,
                                                  27, 29, 30, 34, 36, 38, 40, 42, 44, 45, 46, 48, 49, 50,
                                                  52, 53, 54, 56, 57, 58, 60, 62, 64, 65,
                                                  67, 71, 74, 76, 81, 83, 87, 91, 102, 104,
                                                  115, 126, 137, 148, 159, 160, 171, 182,
                                                  184, 185, 187, 188, 189))

  expect_equal(crosswalk_parsed_sas$setup$begin, c(1, 2, 4, 12, 60, 61, 62, 64, 67, 98, 101,
                                                   103, 112, 142, 172, 202, 232, 237, 239,
                                                   248, 257, 259,
                                                   323, 331, 333, 336, 342, 346, 391))
  expect_equal(ucr1985_parsed_sas$setup$begin[1:20], c(1, 5, 6, 8, 13, 15, 22, 23, 25, 26,
                                                       28, 33, 35, 36, 44, 50, 54, 56, 57,
                                                       65))
  expect_equal(ucr1985_parsed_sas$setup$begin[1439:1458], c(5324, 5325, 5326, 5327, 5328,
                                                            5329, 5330, 5331, 5332, 5335,
                                                            5338, 5341, 5344, 5347, 5350,
                                                            5353, 5356, 5359, 5362, 5365))

  expect_equal(ucr1986_parsed_sas$setup$begin[1:20], c(1, 5, 6, 8, 13, 15, 22, 23,
                                                       25, 26, 28, 33, 35, 36, 44,
                                                       50, 54, 56, 57, 65))
  expect_equal(ucr1986_parsed_sas$setup$begin[1439:1458], c(5207, 5208, 5209, 5210,
                                                            5211, 5212, 5213, 5214,
                                                            5215, 5218, 5222, 5225,
                                                            5228, 5231, 5234, 5237,
                                                            5240, 5243, 5246, 5249))
  expect_equal(ucr2000_parsed_sas$setup$begin[1:20], c(1, 2, 4, 11, 13, 14, 18, 23, 24,
                                                       31, 39, 43, 45, 46, 53, 56, 59,
                                                       64, 67, 70))
  expect_equal(ucr2000_parsed_sas$setup$begin[1429:1448], c(3710, 3712, 3716, 3718,
                                                            3720, 3722, 3724, 3728,
                                                            3731, 3734, 3736, 3738,
                                                            3742, 3745, 3748, 3750,
                                                            3752, 3756, 3757, 3758))

  expect_equal(head(ncvs_parsed_sas$setup$begin), c(1, 7, 10, 12,
                                                    15, 19))
  expect_equal(tail(ncvs_parsed_sas$setup$begin), c(713, 717, 719,
                                                    727, 729, 731))


  expect_equal(head(jail_1987_parsed_sas$setup$begin), c(1, 5, 6,
                                                         7, 10, 13))
  expect_equal(tail(jail_1987_parsed_sas$setup$begin), c(633, 634, 636,
                                                         638, 640, 642))


  expect_equal(head(jail_2010_parsed_sas$setup$begin), c(1, 22, 31,
                                                         33, 78, 123))
  expect_equal(tail(jail_2010_parsed_sas$setup$begin), c(1125, 1127, 1133,
                                                         1135, 1141, 1143))

  expect_equal(corrections_parsed_sas$setup$begin, c(1, 2, 6,
                                                     8, 9, 10,
                                                     11,15, 19,
                                                     23, 27, 28,
                                                     30, 31))


})

test_that("Ending number is correct", {
  skip_on_cran()

  expect_equal(weimar_parsed_sas$setup$end, c(2, 4, 5,
                                              22, 29, 36, 43, 50, 57, 64, 71, 78,
                                              85, 92, 99, 106, 113, 120, 127, 134, 141, 148,
                                              155))
  expect_equal(acs_parsed_sas$setup$end, c(2, 3, 7, 17, 18, 21))
  expect_equal(nibrs_parsed_sas$setup$end, c(2, 4, 13, 25, 33, 41, 71, 73, 75, 76, 77, 78,
                                             79, 88, 92, 96, 97, 105, 132, 135))
  expect_equal(parole_parsed_sas$setup$end[1:20], c(2, 4, 10, 16, 22, 28, 34, 40, 46, 52,
                                                    58, 64, 70, 76, 82, 88, 94, 100, 106,
                                                    112))
  expect_equal(parole_parsed_sas$setup$end[40:59], c(227, 229, 230, 236, 238, 239, 245,
                                                     247, 249, 251, 253, 255, 261, 267,
                                                     273, 279, 285, 291, 297, 301))
  expect_equal(ca_vital_parsed_sas$setup$end, c(2, 6, 11, 13, 15, 16, 17, 18, 20, 22, 24,
                                                26, 28, 29, 33, 35, 37, 39, 41, 43, 44, 45,
                                                47, 48, 49, 51, 52, 53, 55, 56, 57, 59, 61,
                                                63, 64, 66, 70, 73, 75, 80, 82, 86, 90,
                                                101, 103, 114, 125, 136, 147, 158, 159,
                                                170, 181, 183, 184, 186, 187, 188, 189))

  expect_equal(sac_parsed_sas$setup$end[1:20], c(2, 5, 9, 15, 16, 17, 18, 19, 20, 21, 22,
                                                 23, 24, 26, 28, 30, 31, 32, 33, 34))
  expect_equal(sac_parsed_sas$setup$end[178:197], c(219, 221, 222, 223, 225, 226, 228, 229,
                                                    231, 232, 233, 235, 236, 238, 239, 241,
                                                    242, 243, 245, 246))
  expect_equal(sex_offender_parsed_sas$setup$end, c(3, 5, 12, 26, 28, 29, 30, 31, 32, 33,
                                                    34, 35, 37, 39, 41, 42, 43, 44, 45, 46,
                                                    47, 49, 51, 53, 55, 57, 59, 61, 63, 65,
                                                    67, 69, 70, 71))

  expect_equal(crosswalk_parsed_sas$setup$end, c(1, 3, 11, 59, 60, 61, 63, 66, 97, 100, 102,
                                                 111, 141, 171, 201, 231, 236, 238, 247, 256,
                                                 258, 322, 330, 332, 335, 341, 345, 390,
                                                 393))
  expect_equal(ucr1985_parsed_sas$setup$end[1:20], c(4, 5, 7, 12, 14, 21, 22, 24, 25, 27,
                                                     32, 34, 35, 43, 49, 53, 55, 56, 64, 67))
  expect_equal(ucr1985_parsed_sas$setup$end[1439:1458], c(5324, 5325, 5326, 5327, 5328,
                                                          5329, 5330, 5331, 5334, 5337,
                                                          5340, 5343, 5346, 5349, 5352,
                                                          5355, 5358, 5361, 5364, 5367))
  expect_equal(ucr1960_parsed_sas$setup$end[1:20], c(1, 3, 10, 12, 13, 17, 22, 23, 30, 37,
                                                     41, 43, 44, 51, 54, 57, 62, 65, 68, 72))
  expect_equal(ucr1960_parsed_sas$setup$end[1429:1448], c(1936, 1937, 1938, 1939, 1940,
                                                          1941, 1942, 1943, 1944,  1945, 1946,
                                                          1947, 1948, 1949, 1950, 1951,
                                                          1952, 1953, 1954, 1955))



  expect_equal(ucr1986_parsed_sas$setup$end[1:20], c(4, 5, 7, 12, 14, 21, 22, 24,
                                                     25, 27, 32, 34, 35, 43, 49,
                                                     53, 55, 56, 64, 67))
  expect_equal(ucr1986_parsed_sas$setup$end[1439:1458], c(5207, 5208, 5209, 5210,
                                                          5211, 5212, 5213, 5214,
                                                          5217, 5221, 5224, 5227,
                                                          5230, 5233, 5236, 5239,
                                                          5242, 5245, 5248, 5251))
  expect_equal(ucr2000_parsed_sas$setup$end[1:20], c(1, 3, 10, 12, 13, 17, 22, 23,
                                                     30, 38, 42, 44, 45, 52, 55,
                                                     58, 63, 66, 69, 74))
  expect_equal(ucr2000_parsed_sas$setup$end[1429:1448], c(3711, 3715, 3717, 3719,
                                                          3721, 3723, 3727, 3730,
                                                          3733, 3735, 3737, 3741,
                                                          3744, 3747, 3749, 3751,
                                                          3755, 3756, 3757, 3760))

  expect_equal(head(ncvs_parsed_sas$setup$end), c(6, 9, 11, 14, 18, 19))
  expect_equal(tail(ncvs_parsed_sas$setup$end), c(716, 718, 726, 728, 730, 731))

  expect_equal(head(jail_1987_parsed_sas$setup$end), c(4, 5, 6, 9, 12, 14))
  expect_equal(tail(jail_1987_parsed_sas$setup$end), c(633, 635, 637, 639, 641, 642))


  expect_equal(head(jail_2010_parsed_sas$setup$end), c(21, 30, 32, 77, 122, 154))
  expect_equal(tail(jail_2010_parsed_sas$setup$end), c(1126, 1132, 1134, 1140, 1142, 1150))

  expect_equal(corrections_parsed_sas$setup$end, c(1, 5, 7, 8, 9, 10, 14, 18, 22, 26, 27, 29, 30, 31))
})


test_that("Original names are correct", {
  skip_on_cran()

  expect_equal(sac_parsed_sas$setup$column_number[1:20], c("TRINUM", "SUBNO", "TODDATYR",
                                                           "DATSTAR", "CONSTATE", "Q1JSEX",
                                                           "Q2JAGE", "Q3JETH", "Q4JEDUC",
                                                           "Q5JSUPDP", "Q6JVIC", "Q7JKIDCT",
                                                           "Q8HOWMK", "Q9KNAM", "Q10KAGET",
                                                           "Q11KAGEA", "Q12KSEX", "Q13KVID",
                                                           "Q14INTK", "Q15IMPVK"))
  expect_equal(sac_parsed_sas$setup$column_number[178:197], c("Q123PN3", "Q123BIM3",
                                                              "Q124BGEN", "Q124PN1",
                                                              "Q124BIM1", "Q124PN2",
                                                              "Q124BIM2", "Q124PN3",
                                                              "Q124BIM3", "Q125BEF",
                                                              "Q126PN1", "Q126OTH1",
                                                              "Q126PN2", "Q126OTH2",
                                                              "Q126PN3", "Q126OTH3",
                                                              "KAGE", "VERDICT",
                                                              "DURAT", "DURAT2"))
  expect_equal(sex_offender_parsed_sas$setup$column_number, c("ID", "MEETING", "DATE",
                                                              "CITY", "Q1", "Q2A", "Q2B",
                                                              "Q2C", "Q2D", "Q2E", "Q2F",
                                                              "Q2G", "Q3", "Q4", "Q5",
                                                              "Q6A", "Q6B", "Q6C", "Q6D",
                                                              "Q6E", "Q6F", "Q7", "Q8A",
                                                              "Q8B", "Q9A", "Q9B", "Q9C",
                                                              "Q9D", "Q9E", "Q9F", "Q9G",
                                                              "Q10", "INDEX", "NEWQ9G"))
  expect_equal(ucr1960_parsed_sas$setup$column_number[1:20],  c("V1", "V2", "V3", "V4", "V5", "V6",
                                                                "V7", "V8", "V9", "V10", "V11", "V12",
                                                                "V13", "V14", "V15", "V16", "V17",
                                                                "V18", "V19", "V20"))

  expect_equal(weimar_parsed_sas$setup$column_number, c("V1", "V2", "V3", "V4", "V5", "V6",
                                                        "V7", "V8", "V9", "V10", "V11", "V12",
                                                        "V13", "V14", "V15", "V16", "V17",
                                                        "V18", "V19", "V20", "V21", "V22",
                                                        "V23"))
  expect_equal(acs_parsed_sas$setup$column_number, c("STATEFIP", "GQ", "PERNUM",
                                                     "PERWT", "SEX", "AGE"))
  expect_equal(nibrs_parsed_sas$setup$column_number, c("B1001", "B1002", "B1003", "B1004",
                                                       "B1005", "B1006", "B1007", "B1008",
                                                       "B1009", "B1010", "B1011", "B1012",
                                                       "B1013", "B1014", "B1015", "B1016",
                                                       "B1017", "B1018", "B1019", "B1020"))
  expect_equal(parole_parsed_sas$setup$column_number[1:20], c("STATEID", "STATE", "TOTBEG",
                                                              "ENDISREL", "ENMANREL",
                                                              "ENREINST", "OTHEN", "TOTEN",
                                                              "EXCOM", "EXINCNEW", "EXINCREV",
                                                              "EXINCOTH", "EXTRANS", "EXDTH",
                                                              "EXOTH", "TOTEX", "TOTEND",
                                                              "MALE", "FEML", "TOTGEND"))
  expect_equal(parole_parsed_sas$setup$column_number[40:59], c("ISPNUM", "ISPIN", "EM",
                                                               "EMNUM", "EMIN", "BOOT",
                                                               "BOOTNUM", "BOOTIN",
                                                               "LOCJAIL", "LOCJAILIN",
                                                               "OTHPAR", "ENDOFYEAR",
                                                               "UNKEN", "UNKEX", "UNKGEND",
                                                               "UNKRACE2", "UNKHISP",
                                                               "UNKMAX", "UNKSTAT", "SUPVRATE"))

  expect_equal(ca_vital_parsed_sas$setup$column_number[1:20], c("CNTYJUR", "JURISDIC",
                                                                "BCSNUM", "TOTVICT",
                                                                "TOTOFFEN", "VICSEX",
                                                                "VICRACE", "CRIMEST",
                                                                "RELATN1", "RELATN2",
                                                                "RELATN3", "RELATN4",
                                                                "INCDTIME", "INCDDAY",
                                                                "DEATHYR", "WEAPON",
                                                                "LOCATION", "PRECIP1",
                                                                "PRECIP2", "PRECIP3"))
  expect_equal(ca_vital_parsed_sas$setup$column_number[40:59], c("ZIPCODE", "AGEYEARS",
                                                                 "CENSUS", "ICD10",
                                                                 "DOB",  "VICAGE",
                                                                 "DOD", "ARRDATE1",
                                                                 "ARRDATE2", "ARRDATE3",
                                                                 "ARRDATE4",  "FLAG",
                                                                 "INCDDATE", "INJDATE",
                                                                 "RACE", "SEX",
                                                                 "STATERES", "MARSTAT",
                                                                 "HISPANIC", "MATCH"))

  expect_equal(crosswalk_parsed_sas$setup$column_number, c("SOURCE", "STATE", "UORI",
                                                           "UAGENCY", "UCORI", "UMULTICO",
                                                           "USTATENO", "UCOUNTY", "UCTYNAME",
                                                           "UMSA", "UPOPGRP", "UPOPCOV",
                                                           "UADD1", "UADD2", "UADD3",
                                                           "UADD4", "UADD5",
                                                           "CSTATENO", "CGOVIDNU",
                                                           "CGOVIDST", "CGOVTYPE", "CNAME",
                                                           "CPOP94", "FSTATE", "FCOUNTY",
                                                           "FPLACE", "FMSA", "FMSANAME",
                                                           "FCMSA"))
  expect_equal(ucr1985_parsed_sas$setup$column_number[1:20], c("V1", "V2", "V3", "V4", "V5", "V6",
                                                               "V7", "V8", "V9", "V10", "V11", "V12",
                                                               "V13", "V14", "V15", "V16", "V17",
                                                               "V18", "V19", "V20"))
  expect_equal(ucr1985_parsed_sas$setup$column_number[1439:1458], c("V1439", "V1440",
                                                                    "V1441", "V1442",
                                                                    "V1443", "V1444",
                                                                    "V1445", "V1446",
                                                                    "V1447", "V1448",
                                                                    "V1449", "V1450",
                                                                    "V1451", "V1452",
                                                                    "V1453", "V1454",
                                                                    "V1455", "V1456",
                                                                    "V1457", "V1458"))
  expect_equal(ucr1960_parsed_sas$setup$column_number[1429:1448], c("V1429", "V1430",
                                                                    "V1431", "V1432",
                                                                    "V1433", "V1434",
                                                                    "V1435", "V1436",
                                                                    "V1437", "V1438",
                                                                    "V1439", "V1440",
                                                                    "V1441", "V1442",
                                                                    "V1443", "V1444",
                                                                    "V1445", "V1446",
                                                                    "V1447", "V1448"))

  expect_equal(head(ncvs_parsed_sas$setup$column_number), c("V2001", "V2002", "V2003",
                                                            "V2004", "V2005", "V2006"))
  expect_equal(tail(ncvs_parsed_sas$setup$column_number), c("V4322", "V4323", "V4324",
                                                            "V4325", "V4326", "V4327"))

  expect_equal(head(ncvs_parsed_sas$setup$column_name), c("ICPSR_HOUSEHOLD_NUMBER",
                                                          "YEAR_AND_QUARTER",
                                                          "CENSUS_SAMPLE_NUMBER",
                                                          "PRIMARY_SAMPLING_UNIT",
                                                          "SEGMENT_NUMBER",
                                                          "CHECK_DIGIT"))
  expect_equal(tail(ncvs_parsed_sas$setup$column_name), c("SERIOUSNESS_SCORE",
                                                          "SERIOUSNESS_OLD_SCORE",
                                                          "INCIDENT_WEIGHT",
                                                          "CRIME_SEQUENCE_NO",
                                                          "RECODED_TYPE_OF_CRIME",
                                                          "RELATION_TO_VICTIM"))

  expect_equal(head(jail_1987_parsed_sas$setup$column_number), c("V1", "V2", "V3",
                                                                 "V4", "V5", "V6"))
  expect_equal(tail(jail_1987_parsed_sas$setup$column_number), c("V171", "V172", "V173",
                                                                 "V174", "V175", "V176"))

  expect_equal(head(jail_1987_parsed_sas$setup$column_name), c("ICPSR_STUDY_NUMBER_9074",
                                                               "ICPSR_EDITION_NUMBER_1",
                                                               "ICPSR_PART_NUMBER_1",
                                                               "ICPSR_SEQUENCE_NUMBER",
                                                               "FORM_NUMBER",
                                                               "STATE_CODE"))
  expect_equal(tail(jail_1987_parsed_sas$setup$column_name), c("COURT_ORDER_STAFF_PATTRN",
                                                               "COURT_ORDER_ED_TRAINING",
                                                               "COURT_ORDER_COUNSELLING",
                                                               "COURT_ORDER_FOOD_SERVICE",
                                                               "COURT_ORDER_OTHER",
                                                               "CENSUS_USE_BOX"))


  expect_equal(head(jail_2010_parsed_sas$setup$column_number), c("FACLID21", "JURDID", "STATE",
                                                                 "COUNTY", "FACLNAME", "CITY"))
  expect_equal(tail(jail_2010_parsed_sas$setup$column_number), c("STOLENPROPF",
                                                                 "ESCAPE",
                                                                 "ESCAPEF",
                                                                 "OTHERMAJVIO",
                                                                 "OTHERMAJVIOF",
                                                                 "NCONPOP2"))

  expect_equal(head(jail_2010_parsed_sas$setup$column_name), c("AGENCY_ID",
                                                               "JURISDICTION_ID",
                                                               "STATE",
                                                               "COUNTY_NAME",
                                                               "FACILITY_NAME",
                                                               "CITY"))
  expect_equal(tail(jail_2010_parsed_sas$setup$column_name),
               c("POSSESSION_OF_STOLEN_PROPERTY_FLAG",
                 "S4QIV_4_1F_ESCAPE_OR_ATTEMPTED_ESCAPE",
                 "ESCAPE_OR_ATTEMPTED_ESCAPE_FLAG",
                 "S4QIV_4_1G_ANY_OTHER_MAJOR_VIOLATION_INCLUDING_WORK_SLOWDOWNS_FOOD_STRIKES_SETTING_FIRE",
                 "ANY_OTHER_MAJOR_VIOLATION_INCLUDING_WORK_SLOWDOWNS_FOOD_STRIKES_SETTING_FIRE_RIOTING_ETC_FLAG",
                 "NONCONFINED_POPULATION_CALCULATED"))


  expect_equal(corrections_parsed_sas$setup$column_number, c("SEX",
                                                             "RPTYEAR",
                                                             "STATE",
                                                             "EDUCATION",
                                                             "ADMTYPE",
                                                             "OFFGENERAL",
                                                             "MAND_PRISREL_YEAR",
                                                             "PROJ_PRISREL_YEAR",
                                                             "PARELIG_YEAR",
                                                             "ADMITYR",
                                                             "SENTLGTH",
                                                             "OFFDETAIL",
                                                             "RACE",
                                                             "AGEADMIT"))
  expect_equal(corrections_parsed_sas$setup$column_name,
               c("SEX_OF_INMATE",
                 "YEAR_DATA_WERE_SUBMITTED_TO_NCRP",
                 "STATE_WITH_CUSTODY_OF_INMATE",
                 "HIGHEST_LEVEL_OF_EDUCATION_OF_INMATE",
                 "TYPE_OF_PRISON_ADMISSION",
                 "X5_LEVEL_CATEGORIZATION_OF_MOST_SERIOUS_SENTENCED_OFFENSE",
                 "YEAR_OF_MANDATORY_PRISON_RELEASE",
                 "YEAR_OF_PROJECTED_PRISON_RELEASE",
                 "YEAR_OF_PAROLE_ELIGIBILITY",
                 "YEAR_INMATE_WAS_ADMITTED_TO_PRISON",
                 "MAXIMUM_SENTENCE_LENGTH_FOR_INMATE",
                 "DETAILED_CATEGORIZATION_OF_MOST_SERIOUS_SENTENCED_OFFENSE",
                 "RACE_HISPANIC_ETHNICITY_OF_INMATE",
                 "AGE_AT_ADMISSION"))

})
