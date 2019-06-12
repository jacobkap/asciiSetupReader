context("SPSS setup parse")

test_that("Right number of columns", {
  skip_on_cran()
  expect_equal(nrow(sac_parsed_sps$setup),          197)
  expect_equal(nrow(sex_offender_parsed_sps$setup),  34)
  expect_equal(nrow(ucr1960_parsed_sps$setup),     1448)
  expect_equal(nrow(weimar_parsed_sps$setup),        23)
  expect_equal(nrow(acs_parsed_sps$setup),            6)
  expect_equal(nrow(nibrs_parsed_sps$setup),         20)
  expect_equal(nrow(parole_parsed_sps$setup),        59)
  expect_equal(nrow(prisoners_parsed_sps$setup),    201)
  expect_equal(nrow(ca_vital_parsed_sps$setup),      59)
  expect_equal(nrow(crosswalk_parsed_sps$setup),     29)
  expect_equal(nrow(ucr1985_parsed_sps$setup),     1458)
  expect_equal(nrow(ucr1986_parsed_sps$setup),     1458)
  expect_equal(nrow(ucr2000_parsed_sps$setup),     1448)
  expect_equal(nrow(jail_1987_parsed_sps$setup),    176)
  expect_equal(nrow(jail_2010_parsed_sps$setup),    200)
  expect_equal(nrow(corrections_parsed_sps$setup),   14)
  expect_equal(nrow(sadc_parsed_sps$setup),         314)
  expect_equal(nrow(crosswalk2012_parsed_sps$setup), 46)
  expect_equal(nrow(dutch_election_parsed_sps$setup), 878)
  expect_equal(nrow(well_being_parsed_sps$setup),   312)
  expect_equal(nrow(psid_supplement_parsed_sps$setup),   17)
  expect_equal(nrow(health_nutrition_parsed_sps$setup),  43)
  expect_equal(nrow(ad_health_parsed_sps$setup),  5)
  expect_equal(nrow(india_human_parsed_sps$setup),  337)
  expect_equal(nrow(psid_core_parsed_sps$setup),  2084)
  expect_equal(nrow(step_in_parsed_sps$setup), 8)
  expect_equal(nrow(cps_1973_parsed_sps$setup), 269)
  expect_equal(nrow(census_police_parsed_sps$setup), 92)
  expect_equal(nrow(escolar_parsed_sps$setup), 1307)
  expect_equal(nrow(british_crime_teen_parsed_sps$setup), 374)
  expect_equal(nrow(drug_abuse_parsed_sps$setup),         337)
  expect_equal(nrow(detroit_parsed_sps$setup),            369)
  expect_equal(nrow(worry_parsed_sps$setup),              486)
  expect_equal(nrow(cps_2004_parsed_sps$setup),           286)

  expect_equal(nrow(cambridge_parsed_sps$setup), 880)
  expect_equal(nrow(guam_parsed_sps$setup), 115)
  expect_equal(nrow(china_2002_parsed_sps$setup), 259)
  expect_equal(nrow(china_1995_parsed_sps$setup), 102)
  expect_equal(nrow(china_1998_parsed_sps$setup), 51)
  expect_equal(nrow(indonesia_parsed_sps$setup), 10)
  expect_equal(nrow(UN_crime_parsed_sps$setup), 121)
  expect_equal(nrow(county_arrest_parsed_sps$setup), 19)
  expect_equal(nrow(psid_main_parsed_sps$setup), 3569)



})

test_that("Column numbers are correct", {
  skip_on_cran()

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

  expect_equal(head(british_crime_teen_parsed_sps$setup$begin), c(1, 7, 13,
                                                                  16, 18, 19))
  expect_equal(head(british_crime_teen_parsed_sps$setup$end),   c(6, 12, 15,
                                                                  17, 18, 19))
  expect_equal(tail(british_crime_teen_parsed_sps$setup$begin), c(685, 686, 690,
                                                                  691, 695, 696))
  expect_equal(tail(british_crime_teen_parsed_sps$setup$end),   c(685, 689, 690,
                                                                  694, 695, 697))


  expect_equal(head(drug_abuse_parsed_sps$setup$begin), c(1, 27, 53,
                                                          79, 105, 131))
  expect_equal(head(drug_abuse_parsed_sps$setup$end),   c(26, 52, 78,
                                                          104, 130, 156))
  expect_equal(tail(drug_abuse_parsed_sps$setup$begin), c(1161, 1165, 1180,
                                                          1195, 1210, 1212))
  expect_equal(tail(drug_abuse_parsed_sps$setup$end),   c(1164, 1179, 1194,
                                                          1209, 1211, 1215))


  expect_equal(head(detroit_parsed_sps$setup$begin), c(1, 9, 17,
                                                       25, 40, 48))
  expect_equal(head(detroit_parsed_sps$setup$end),   c(8, 16, 24,
                                                       39, 47, 55))
  expect_equal(tail(detroit_parsed_sps$setup$begin), c(4849, 4857, 4865,
                                                       4873, 4881, 4889))
  expect_equal(tail(detroit_parsed_sps$setup$end),   c(4856, 4864, 4872,
                                                       4880, 4888, 4896))


  expect_equal(head(worry_parsed_sps$setup$begin), c(1, 5, 7,
                                                     8, 9, 10))
  expect_equal(head(worry_parsed_sps$setup$end),   c(4, 6, 7,
                                                     8, 9, 10))
  expect_equal(tail(worry_parsed_sps$setup$begin), c(676, 677, 678,
                                                     679, 694, 709))
  expect_equal(tail(worry_parsed_sps$setup$end),   c(676, 677, 678,
                                                     693, 708, 723))


  expect_equal(head(cps_2004_parsed_sps$setup$begin), c(1, 16, 20,
                                                        22, 25, 27))
  expect_equal(head(cps_2004_parsed_sps$setup$end),   c(15, 19, 21,
                                                        24, 26, 28))
  expect_equal(tail(cps_2004_parsed_sps$setup$begin), c(590, 592, 594,
                                                        596, 598, 599))
  expect_equal(tail(cps_2004_parsed_sps$setup$end),   c(591, 593, 595,
                                                        597, 598, 608))


  expect_equal(head(step_in_parsed_sps$setup$begin), c(1, 5, 7,
                                                       18, 31, 35))
  expect_equal(head(step_in_parsed_sps$setup$end),   c(4, 6, 17,
                                                       30, 34, 35))
  expect_equal(tail(step_in_parsed_sps$setup$begin), c(7, 18, 31,
                                                       35, 36, 37))
  expect_equal(tail(step_in_parsed_sps$setup$end),   c(17, 30, 34,
                                                       35, 36, 39))

  expect_equal(head(cps_1973_parsed_sps$setup$begin), c(1, 2, 11,
                                                        12, 13, 14))
  expect_equal(head(cps_1973_parsed_sps$setup$end),   c(1, 10, 11,
                                                        12, 13, 14))
  expect_equal(tail(cps_1973_parsed_sps$setup$begin), c(554, 561, 568,
                                                        575, 579, 580))
  expect_equal(tail(cps_1973_parsed_sps$setup$end),   c(560, 567, 574,
                                                        578, 579, 582))

  expect_equal(head(census_police_parsed_sps$setup$begin), c(1, 9, 13,
                                                             21, 29, 30))
  expect_equal(head(census_police_parsed_sps$setup$end),   c(8, 12, 20,
                                                             28, 29, 31))
  expect_equal(tail(census_police_parsed_sps$setup$begin), c(619, 645, 647,
                                                             669, 689, 714))
  expect_equal(tail(census_police_parsed_sps$setup$end),   c(644, 646, 668,
                                                             688, 713, 721))


  expect_equal(ad_health_parsed_sps$setup$begin,
               c(1, 9, 12,
                 27, 42))

  expect_equal(sac_parsed_sps$setup$begin[1:20],
               c(1, 3, 6, 10, 16, 17, 18, 19, 20, 21, 22,
                 23, 24, 25, 27, 29, 31, 32, 33, 34))
  expect_equal(sac_parsed_sps$setup$begin[178:197],
               c(219, 220, 222, 223, 224, 226, 227,
                 229, 230, 232, 233, 234, 236, 237,
                 239, 240, 242, 243, 244, 246))
  expect_equal(sex_offender_parsed_sps$setup$begin,
               c(1, 4, 6, 13, 27, 29, 30, 31, 32, 33,
                 34, 35, 36, 38, 40, 42, 43, 44, 45,
                 46, 47, 48, 50, 52, 54, 56, 58, 60,
                 62, 64, 66, 68, 70, 71))
  expect_equal(ucr1960_parsed_sps$setup$begin[1:20],
               c(1, 2, 4, 11, 13, 14, 18, 23, 24, 31,
                 38, 42, 44, 45, 52, 55, 58, 63, 66, 69))
  expect_equal(ucr1960_parsed_sps$setup$begin[1429:1448],
               c(1936, 1937, 1938, 1939, 1940,
                 1941, 1942, 1943, 1944,  1945, 1946,
                 1947, 1948, 1949, 1950, 1951,
                 1952, 1953, 1954, 1955))
  expect_equal(weimar_parsed_sps$setup$begin,
               c(1, 3, 5, 6, 23, 30, 37, 44, 51, 58, 65, 72,
                 79, 86, 93, 100, 107, 114, 121, 128, 135,
                 142, 149))
  expect_equal(acs_parsed_sps$setup$begin,
               c(1, 3, 4, 8, 18, 19))
  expect_equal(nibrs_parsed_sps$setup$begin,
               c(1, 3, 5, 14, 26, 34, 42, 72, 74, 76, 77, 78,
                 79, 80, 89, 93, 97, 98, 106, 133))
  expect_equal(parole_parsed_sps$setup$begin[1:20],
               c(1, 3, 5, 11, 17, 23, 29, 35, 41, 47,
                 53, 59, 65, 71, 77, 83, 89, 95, 101,
                 107))
  expect_equal(parole_parsed_sps$setup$begin[40:59],
               c(222, 228, 230, 231, 237, 239, 240,
                 246, 248, 250, 252, 254, 256, 262,
                 268, 274, 280, 286, 292, 298))
  expect_equal(ca_vital_parsed_sps$setup$begin,
               c(1, 3, 7, 12, 14, 16, 17, 18,  19, 21, 23, 25,
                 27, 29, 30, 34, 36, 38, 40, 42, 44, 45, 46, 48, 49, 50,
                 52, 53, 54, 56, 57, 58, 60, 62, 64, 65,
                 67, 71, 74, 76, 81, 83, 87, 91, 102, 104,
                 115, 126, 137, 148, 159, 160, 171, 182,
                 184, 185, 187, 188, 189))

  expect_equal(crosswalk_parsed_sps$setup$begin,
               c(1, 2, 4, 12, 60, 61, 62, 64, 67, 98, 101,
                 103, 112, 142, 172, 202, 232, 237, 239,
                 248, 257, 259,
                 323, 331, 333, 336, 342, 346, 391))
  expect_equal(ucr1985_parsed_sps$setup$begin[1:20],
               c(1, 5, 6, 8, 13, 15, 22, 23, 25, 26,
                 28, 33, 35, 36, 44, 50, 54, 56, 57,
                 65))
  expect_equal(ucr1985_parsed_sps$setup$begin[1439:1458],
               c(5324, 5325, 5326, 5327, 5328,
                 5329, 5330, 5331, 5332, 5335,
                 5338, 5341, 5344, 5347, 5350,
                 5353, 5356, 5359, 5362, 5365))

  expect_equal(ucr1986_parsed_sps$setup$begin[1:20],
               c(1, 5, 6, 8, 13, 15, 22, 23,
                 25, 26, 28, 33, 35, 36, 44,
                 50, 54, 56, 57, 65))
  expect_equal(ucr1986_parsed_sps$setup$begin[1439:1458],
               c(5207, 5208, 5209, 5210,
                 5211, 5212, 5213, 5214,
                 5215, 5218, 5222, 5225,
                 5228, 5231, 5234, 5237,
                 5240, 5243, 5246, 5249))
  expect_equal(ucr2000_parsed_sps$setup$begin[1:20],
               c(1, 2, 4, 11, 13, 14, 18, 23, 24,
                 31, 39, 43, 45, 46, 53, 56, 59,
                 64, 67, 70))
  expect_equal(ucr2000_parsed_sps$setup$begin[1429:1448],
               c(3710, 3712, 3716, 3718,
                 3720, 3722, 3724, 3728,
                 3731, 3734, 3736, 3738,
                 3742, 3745, 3748, 3750,
                 3752, 3756, 3757, 3758))

  expect_equal(head(ncvs_parsed_sps$setup$begin), c(1, 7, 10,
                                                    12, 15, 19))
  expect_equal(tail(ncvs_parsed_sps$setup$begin), c(713, 717, 719,
                                                    727, 729, 731))


  expect_equal(head(jail_1987_parsed_sps$setup$begin), c(1, 5, 6,
                                                         7, 10, 13))
  expect_equal(tail(jail_1987_parsed_sps$setup$begin), c(633, 634, 636,
                                                         638, 640, 642))


  expect_equal(head(jail_2010_parsed_sps$setup$begin), c(1, 22, 31,
                                                         33, 78, 123))
  expect_equal(tail(jail_2010_parsed_sps$setup$begin), c(1125, 1127, 1133,
                                                         1135, 1141, 1143))

  expect_equal(corrections_parsed_sps$setup$begin, c(1, 2, 6,
                                                     8, 9, 10,
                                                     11,15, 19,
                                                     23, 27, 28,
                                                     30, 31))

  expect_equal(sadc_parsed_sps$setup$begin[1:10], c(1, 6, 56,
                                                    106, 114, 122,
                                                    125, 135, 143,
                                                    151))
  expect_equal(tail(sadc_parsed_sps$setup$begin), c(843, 846, 849,
                                                    852, 855, 858))



  expect_equal(head(crosswalk2012_parsed_sps$setup$begin),
               c(1, 3, 6,
                 11, 13, 16))
  expect_equal(tail(crosswalk2012_parsed_sps$setup$begin),
               c(1350, 1351, 1352,
                 1353, 1354, 1355))


  expect_equal(head(dutch_election_parsed_sps$setup$begin),
               c(1, 5, 9,
                 11, 14, 16))
  expect_equal(tail(dutch_election_parsed_sps$setup$begin),
               c(1250, 1251, 1252,
                 1254, 1255, 1256))



  expect_equal(head(well_being_parsed_sps$setup$begin),
               c(1, 2, 7,
                 9, 10, 13))
  expect_equal(tail(well_being_parsed_sps$setup$begin),
               c(405, 406, 407,
                 408, 409, 418))


  expect_equal(head(psid_supplement_parsed_sps$setup$begin),
               c(1, 6, 13,
                 20, 27, 34))
  expect_equal(tail(psid_supplement_parsed_sps$setup$begin),
               c(76, 83, 90,
                 97, 104, 111))



  expect_equal(head(health_nutrition_parsed_sps$setup$begin),
               c(1, 6, 9,
                 12, 15, 18))
  expect_equal(tail(health_nutrition_parsed_sps$setup$begin),
               c(118, 121, 124,
                 138, 152, 155))


  expect_equal(head(india_human_parsed_sps$setup$begin),
               c(1, 2, 4,
                 6, 8, 11))
  expect_equal(tail(india_human_parsed_sps$setup$begin),
               c(1022, 1023, 1025,
                 1027, 1028, 1029))


  expect_equal(head(escolar_parsed_sps$setup$begin),
               c(0, 8, 13,
                 25, 75, 77))
  expect_equal(tail(escolar_parsed_sps$setup$begin),
               c(8359, 8365, 8371,
                 8377, 8383, 8389))
  expect_equal(head(escolar_parsed_sps$setup$end),
               c(7, 12, 24,
                 74, 76, 126))
  expect_equal(tail(escolar_parsed_sps$setup$end),
               c(8364, 8370, 8376,
                 8382, 8388, 8394))


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




  expect_equal(head(india_human_parsed_sps$setup$end),
               c(1, 3, 5,
                 7, 10, 11))
  expect_equal(tail(india_human_parsed_sps$setup$end),
               c(1022, 1024, 1026,
                 1027, 1028, 1030))


  expect_equal(ad_health_parsed_sps$setup$end,
               c(8, 11, 26,
                 41, 56))


  expect_equal(head(health_nutrition_parsed_sps$setup$end),
               c(5, 8, 11,
                 14, 17, 20))
  expect_equal(tail(health_nutrition_parsed_sps$setup$end),
               c(120, 123, 137,
                 151, 154, 157))

  expect_equal(head(well_being_parsed_sps$setup$end),
               c(1, 6, 8,
                 9, 12, 13))
  expect_equal(tail(well_being_parsed_sps$setup$end),
               c(405, 406, 407,
                 408, 417, 419))

  expect_equal(weimar_parsed_sps$setup$end,
               c(2, 4, 5, 22, 29, 36, 43, 50, 57, 64, 71, 78,
                 85, 92, 99, 106, 113, 120, 127, 134, 141, 148,
                 155))
  expect_equal(acs_parsed_sps$setup$end,
               c(2, 3, 7, 17, 18, 21))
  expect_equal(nibrs_parsed_sps$setup$end,
               c(2, 4, 13, 25, 33, 41, 71, 73, 75, 76, 77, 78,
                 79, 88, 92, 96, 97, 105, 132, 135))
  expect_equal(parole_parsed_sps$setup$end[1:20],
               c(2, 4, 10, 16, 22, 28, 34, 40, 46, 52,
                 58, 64, 70, 76, 82, 88, 94, 100, 106,
                 112))
  expect_equal(parole_parsed_sps$setup$end[40:59],
               c(227, 229, 230, 236, 238, 239, 245,
                 247, 249, 251, 253, 255, 261, 267,
                 273, 279, 285, 291, 297, 301))
  expect_equal(ca_vital_parsed_sps$setup$end,
               c(2, 6, 11, 13, 15, 16, 17, 18, 20, 22, 24,
                 26, 28, 29, 33, 35, 37, 39, 41, 43, 44, 45,
                 47, 48, 49, 51, 52, 53, 55, 56, 57, 59, 61,
                 63, 64, 66, 70, 73, 75, 80, 82, 86, 90,
                 101, 103, 114, 125, 136, 147, 158, 159,
                 170, 181, 183, 184, 186, 187, 188, 189))

  expect_equal(sac_parsed_sps$setup$end[1:20],
               c(2, 5, 9, 15, 16, 17, 18, 19, 20, 21, 22,
                 23, 24, 26, 28, 30, 31, 32, 33, 34))
  expect_equal(sac_parsed_sps$setup$end[178:197],
               c(219, 221, 222, 223, 225, 226, 228, 229,
                 231, 232, 233, 235, 236, 238, 239, 241,
                 242, 243, 245, 246))
  expect_equal(sex_offender_parsed_sps$setup$end,
               c(3, 5, 12, 26, 28, 29, 30, 31, 32, 33,
                 34, 35, 37, 39, 41, 42, 43, 44, 45, 46,
                 47, 49, 51, 53, 55, 57, 59, 61, 63, 65,
                 67, 69, 70, 71))

  expect_equal(crosswalk_parsed_sps$setup$end,
               c(1, 3, 11, 59, 60, 61, 63, 66, 97, 100, 102,
                 111, 141, 171, 201, 231, 236, 238, 247, 256,
                 258, 322, 330, 332, 335, 341, 345, 390,
                 393))
  expect_equal(ucr1985_parsed_sps$setup$end[1:20],
               c(4, 5, 7, 12, 14, 21, 22, 24, 25, 27,
                 32, 34, 35, 43, 49, 53, 55, 56, 64, 67))
  expect_equal(ucr1985_parsed_sps$setup$end[1439:1458],
               c(5324, 5325, 5326, 5327, 5328,
                 5329, 5330, 5331, 5334, 5337,
                 5340, 5343, 5346, 5349, 5352,
                 5355, 5358, 5361, 5364, 5367))
  expect_equal(ucr1960_parsed_sps$setup$end[1:20],
               c(1, 3, 10, 12, 13, 17, 22, 23, 30, 37,
                 41, 43, 44, 51, 54, 57, 62, 65, 68, 72))
  expect_equal(ucr1960_parsed_sps$setup$end[1429:1448],
               c(1936, 1937, 1938, 1939, 1940,
                 1941, 1942, 1943, 1944,  1945, 1946,
                 1947, 1948, 1949, 1950, 1951,
                 1952, 1953, 1954, 1955))



  expect_equal(ucr1986_parsed_sps$setup$end[1:20],
               c(4, 5, 7, 12, 14, 21, 22, 24,
                 25, 27, 32, 34, 35, 43, 49,
                 53, 55, 56, 64, 67))
  expect_equal(ucr1986_parsed_sps$setup$end[1439:1458],
               c(5207, 5208, 5209, 5210,
                 5211, 5212, 5213, 5214,
                 5217, 5221, 5224, 5227,
                 5230, 5233, 5236, 5239,
                 5242, 5245, 5248, 5251))
  expect_equal(ucr2000_parsed_sps$setup$end[1:20],
               c(1, 3, 10, 12, 13, 17, 22, 23,
                 30, 38, 42, 44, 45, 52, 55,
                 58, 63, 66, 69, 74))
  expect_equal(ucr2000_parsed_sps$setup$end[1429:1448],
               c(3711, 3715, 3717, 3719,
                 3721, 3723, 3727, 3730,
                 3733, 3735, 3737, 3741,
                 3744, 3747, 3749, 3751,
                 3755, 3756, 3757, 3760))

  expect_equal(head(ncvs_parsed_sps$setup$end),
               c(6, 9, 11, 14, 18, 19))
  expect_equal(tail(ncvs_parsed_sps$setup$end),
               c(716, 718, 726, 728, 730, 731))

  expect_equal(head(jail_1987_parsed_sps$setup$end),
               c(4, 5, 6, 9, 12, 14))
  expect_equal(tail(jail_1987_parsed_sps$setup$end),
               c(633, 635, 637, 639, 641, 642))


  expect_equal(head(jail_2010_parsed_sps$setup$end),
               c(21, 30, 32, 77, 122, 154))
  expect_equal(tail(jail_2010_parsed_sps$setup$end),
               c(1126, 1132, 1134, 1140, 1142, 1150))

  expect_equal(corrections_parsed_sps$setup$end,
               c(1, 5, 7, 8, 9, 10, 14, 18, 22, 26, 27, 29, 30, 31))

  expect_equal(sadc_parsed_sps$setup$end[1:10], c(5, 55, 105,
                                                  113, 121, 124,
                                                  134, 142, 150,
                                                  158))
  expect_equal(tail(sadc_parsed_sps$setup$end), c(845, 848, 851,
                                                  854, 857, 860))


  expect_equal(head(crosswalk2012_parsed_sps$setup$end),
               c(2, 5, 10,
                 12, 15, 20))
  expect_equal(tail(crosswalk2012_parsed_sps$setup$end),
               c(1350, 1351, 1352,
                 1353, 1354, 1355))


  expect_equal(head(dutch_election_parsed_sps$setup$end),
               c(4, 8, 10,
                 13, 15, 16))
  expect_equal(tail(dutch_election_parsed_sps$setup$end),
               c(1250, 1251, 1253,
                 1254, 1255, 1256))

  expect_equal(head(psid_supplement_parsed_sps$setup$end),
               c(5, 12, 19,
                 26, 33, 40))
  expect_equal(tail(psid_supplement_parsed_sps$setup$end),
               c(82, 89, 96,
                 103, 110, 117))


  expect_equal(head(cambridge_parsed_sps$setup$begin),
               c(1, 5, 6,
                 7, 10, 11))
  expect_equal(head(cambridge_parsed_sps$setup$end),
               c(4, 5, 6,
                 9, 10, 11))
  expect_equal(tail(cambridge_parsed_sps$setup$begin),
               c(1009, 1011, 1013,
                 1015, 1016, 1017))
  expect_equal(tail(cambridge_parsed_sps$setup$end),
               c(1010, 1012, 1014,
                 1015, 1016, 1017))


  expect_equal(head(guam_parsed_sps$setup$begin),
               c(1, 4, 10,
                 12, 19, 20))
  expect_equal(head(guam_parsed_sps$setup$end),
               c(3, 9, 11,
                 18, 19, 20))
  expect_equal(tail(guam_parsed_sps$setup$begin),
               c(393, 398, 403,
                 408, 413, 418))
  expect_equal(tail(guam_parsed_sps$setup$end),
               c(397, 402, 407,
                 412, 417, 422))


  expect_equal(head(china_2002_parsed_sps$setup$begin),
               c(1, 4, 6,
                 12, 14, 15))
  expect_equal(head(china_2002_parsed_sps$setup$end),
               c(3, 5, 11,
                 13, 14, 15))
  expect_equal(tail(china_2002_parsed_sps$setup$begin),
               c(1215, 1218, 1224,
                 1228, 1234, 1242))
  expect_equal(tail(china_2002_parsed_sps$setup$end),
               c(1217, 1223, 1227,
                 1233, 1241, 1249))


  expect_equal(head(china_1995_parsed_sps$setup$begin),
               c(1, 13, 25,
                 37, 49, 61))
  expect_equal(head(china_1995_parsed_sps$setup$end),
               c(12, 24, 36,
                 48, 60, 72))
  expect_equal(tail(china_1995_parsed_sps$setup$begin),
               c(1153, 1165, 1177,
                 1189, 1201, 1213))
  expect_equal(tail(china_1995_parsed_sps$setup$end),
               c(1164, 1176, 1188,
                 1200, 1212, 1224))


  expect_equal(head(china_1998_parsed_sps$setup$begin),
               c(1, 10, 11,
                 12, 15, 16))
  expect_equal(head(china_1998_parsed_sps$setup$end),
               c(9, 10, 11,
                 14, 15, 16))
  expect_equal(tail(china_1998_parsed_sps$setup$begin),
               c(143, 148, 153,
                 154, 159, 164))
  expect_equal(tail(china_1998_parsed_sps$setup$end),
               c(147, 152, 153,
                 158, 163, 165))


  expect_equal(head(indonesia_parsed_sps$setup$begin),
               c(1, 9, 17,
                 19, 21, 29))
  expect_equal(head(indonesia_parsed_sps$setup$end),
               c(8, 16, 18,
                 20, 28, 36))
  expect_equal(tail(indonesia_parsed_sps$setup$begin),
               c(21, 29, 37,
                 45, 52, 61))
  expect_equal(tail(indonesia_parsed_sps$setup$end),
               c(28, 36, 44,
                 51, 60, 64))


  expect_equal(head(UN_crime_parsed_sps$setup$begin),
               c(1, 4, 18,
                 23, 28, 33))
  expect_equal(head(UN_crime_parsed_sps$setup$end),
               c(3, 17, 22,
                 27, 32, 37))
  expect_equal(tail(UN_crime_parsed_sps$setup$begin),
               c(600, 606, 611,
                 616, 621, 626))
  expect_equal(tail(UN_crime_parsed_sps$setup$end),
               c(605, 610, 615,
                 620, 625, 630))


  expect_equal(head(county_arrest_parsed_sps$setup$begin),
               c(1, 5, 6,
                 8, 12, 14))
  expect_equal(head(county_arrest_parsed_sps$setup$end),
               c(4, 5, 7,
                 11, 13, 16))
  expect_equal(tail(county_arrest_parsed_sps$setup$begin),
               c(55, 60, 65,
                 70, 75, 80))
  expect_equal(tail(county_arrest_parsed_sps$setup$end),
               c(59, 64, 69,
                 74, 79, 83))



})


test_that("Column names are correct", {
  skip_on_cran()


  expect_equal(head(cambridge_parsed_sps$setup$column_number),
               c("V1", "V2", "V3",
                 "V4", "V5", "V6"))
  expect_equal(head(cambridge_parsed_sps$setup$column_name),
               c("ICPSR_STUDY_NUMBER_8488",
                 "ICPSR_EDITION_NUMBER_2",
                 "ICPSR_PART_NUMBER",
                 "ICPSR_SEQ_ID_NUMBER",
                 "CONVICTED_10_13",
                 "CONVICTED_14_16"))
  expect_equal(tail(cambridge_parsed_sps$setup$column_number),
               c("V875", "V876", "V877",
                 "V878", "V879", "V880"))
  expect_equal(tail(cambridge_parsed_sps$setup$column_name),
               c("DEL_DAMAGE_PROP_W_O_STL",
                 "STEAL_FRM_SLOT_MACHINES",
                 "SHOPLIFT_FROM_SHOPS",
                 "READING_ABILITY",
                 "TAX_EVASION",
                 "POOR_LIVING_CONDITIONS"))


  expect_equal(head(guam_parsed_sps$setup$column_number),
               c("RESVD1", "CERTNO", "RESVD2",
                 "SEQNUM", "RECTYPE", "RESISTAT"))
  expect_equal(head(guam_parsed_sps$setup$column_name),
               c("RESERVED_POSITIONS",
                 "CERTIFICATE_NUMBER",
                 "RESERVED_POSITIONS",
                 "SEQUENCE_NUMBER",
                 "RECORD_TYPE",
                 "RESIDENT_STATUS"))
  expect_equal(tail(guam_parsed_sps$setup$column_number),
               c("RCOND15", "RCOND16", "RCOND17",
                 "RCOND18", "RCOND19", "RCOND20"))
  expect_equal(tail(guam_parsed_sps$setup$column_name),
               c("RECORD_CONDITION",
                 "RECORD_CONDITION",
                 "RECORD_CONDITION",
                 "RECORD_CONDITION",
                 "RECORD_CONDITION",
                 "RECORD_CONDITION"))


  expect_equal(head(china_2002_parsed_sps$setup$column_number),
               c("ORDER", "SM", "COUN",
                 "VILL", "V3_1", "V3_2"))
  expect_equal(head(china_2002_parsed_sps$setup$column_name),
               c("ORDER",
                 "SM",
                 "County_Number",
                 "Village_Number",
                 "Geographical_condition",
                 "Suburb_of_large_middle_city_jiaoqu"))
  expect_equal(tail(china_2002_parsed_sps$setup$column_number),
               c("V3_709A", "V3_709B", "V3_710A",
                 "V3_710B", "V3_8OLD", "V3_8NEW"))
  expect_equal(tail(china_2002_parsed_sps$setup$column_name),
               c("The_amount_loan_for_poverty_relief_in_1998",
                 "The_amount_loan_for_poverty_relief_in_1998",
                 "The_amount_loan_for_poverty_relief_in_1997",
                 "The_amount_loan_for_poverty_relief_in_1997",
                 "V3_8OLD",
                 "V3_8NEW"))


  expect_equal(head(china_1995_parsed_sps$setup$column_number),
               c("N1", "A1", "A2",
                 "A3", "A4", "A5"))
  expect_equal(head(china_1995_parsed_sps$setup$column_name),
               c("N1",
                 "A1",
                 "A2",
                 "A3",
                 "A4",
                 "A5"))
  expect_equal(tail(china_1995_parsed_sps$setup$column_number),
               c("A96", "A97", "A98",
                 "A99", "PROVINCE", "COUNTY"))
  expect_equal(tail(china_1995_parsed_sps$setup$column_name),
               c("A96",
                 "A97",
                 "A98",
                 "A99",
                 "PROVINCE",
                 "COUNTY"))


  expect_equal(head(china_1998_parsed_sps$setup$column_number),
               c("UCODE", "RELATION", "GENDER",
                 "AGE", "STUDENT", "INCOME88"))
  expect_equal(head(china_1998_parsed_sps$setup$column_name),
               c("HOUSEHOLD_CODE",
                 "RELATIONSHIP_TO_HEAD_OF_HOUSEHOLD",
                 "SEX_OF_HOUSEHOLD_MEMBER",
                 "AGE_OF_HOUSEHOLD_MEMBER",
                 "STUDENT_STATUS_OF_HOUSEHOLD_MEMBER",
                 "INCOME_RECIPIENT_IN_1988"))
  expect_equal(tail(china_1998_parsed_sps$setup$column_number),
               c("IT07M", "IT07E", "IT08T",
                 "IT08M", "IT08E", "NHHMEM"))
  expect_equal(tail(china_1998_parsed_sps$setup$column_name),
               c("ESTIMATED_MARKET_PRICE_YUAN",
                 "AMOUNT_PAID_BY_MEMBER_YUAN",
                 "ITEM_TYPE",
                 "ESTIMATED_MARKET_PRICE_YUAN",
                 "AMOUNT_PAID_BY_MEMBER_YUAN",
                 "OF_MEMBERS_IN_HOUSEHOLD"))


  expect_equal(head(indonesia_parsed_sps$setup$column_number),
               c("CASE", "NCOMB", "ITEM",
                 "KS01", "KS02RP", "NCOMB1A"))
  expect_equal(head(indonesia_parsed_sps$setup$column_name),
               c("IFLS_HHLD_NUMBER",
                 "TOTAL_OF_ITEMS_CONSUMED",
                 "TYPES_OF_STAPLE_FOODS_LISTED",
                 "COMBINATION_CODE",
                 "NUMERIC_VALUE_TOTAL_EXPENSE_IN_PAST_WEE",
                 "TOTAL_ITEMS_SELF_PRODUCED"))
  expect_equal(tail(indonesia_parsed_sps$setup$column_number),
               c("KS02RP", "NCOMB1A", "KS03RP",
                 "HHID93", "HHID", "COMMID93"))
  expect_equal(tail(indonesia_parsed_sps$setup$column_name),
               c("NUMERIC_VALUE_TOTAL_EXPENSE_IN_PAST_WEE",
                 "TOTAL_ITEMS_SELF_PRODUCED",
                 "NUMERIC_VALUE_TOTAL_SELF_PRODUCED_CONSU",
                 "HHID_93_EA_HHNUM_00",
                 "HHID_case",
                 "COMMUNITY_ID_TO_MATCH_IFLS2_COMMID93"))


  expect_equal(head(UN_crime_parsed_sps$setup$column_number),
               c("ID", "COUNTRY", "NNHOM70N",
                 "NNHOM71N", "NNHOM72N", "NNHOM73N"))
  expect_equal(head(UN_crime_parsed_sps$setup$column_name),
               c("ID",
                 "COUNTRY",
                 "MURDER_CONVICTIONS_1970",
                 "MURDER_CONVICTIONS_1971",
                 "MURDER_CONVICTIONS_1972",
                 "MURDER_CONVICTIONS_1973"))
  expect_equal(tail(UN_crime_parsed_sps$setup$column_number),
               c("PSTF745", "X2", "X3",
                 "X4", "X5", "X6"))
  expect_equal(tail(UN_crime_parsed_sps$setup$column_name),
               c("PRISON_STAFF_1974_1975",
                 "X2",
                 "X3",
                 "X4",
                 "X5",
                 "X6"))


  expect_equal(head(county_arrest_parsed_sps$setup$column_number),
               c("V1", "V2", "V3",
                 "V4", "V5", "V6"))
  expect_equal(head(county_arrest_parsed_sps$setup$column_name),
               c("ICPSR_STUDY_NUMBER",
                 "ICPSR_EDITION_NUMBER",
                 "ICPSR_PART_NUMBER",
                 "ICPSR_SEQUENCE_NUMber",
                 "STATE_CODE",
                 "COUNTY_CODE"))
  expect_equal(tail(county_arrest_parsed_sps$setup$column_number),
               c("V14", "V15", "V16",
                 "V17", "V18", "V19"))
  expect_equal(tail(county_arrest_parsed_sps$setup$column_name),
               c("ROBBERY",
                 "ASSAULT",
                 "BURGLARY",
                 "LARCENY",
                 "VEHICLE_THEFT",
                 "ARSON"))


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




  expect_equal(head(well_being_parsed_sps$setup$column_number),
               c("WB16REL", "WB16YRID", "WB16SN",
                 "WB16SEX", "WB16AGE", "WB16IWMODE"))
  expect_equal(head(well_being_parsed_sps$setup$column_name),
               c("RELEASE_NUMBER",
                 "X2015_FAMILY_INTERVIEW_ID_NUMBER",
                 "SEQUENCE_NUMBER_15",
                 "SEX_OF_R",
                 "AGE_OF_R_ON_DEC_31_2015",
                 "MODE_OF_INTERVIEW"))
  expect_equal(tail(well_being_parsed_sps$setup$column_number),
               c("WB16BKSECH", "WB16BKSECI", "WB16BKSECJ",
                 "WB16BKSECK", "WB16WT", "WB16DEV"))
  expect_equal(tail(well_being_parsed_sps$setup$column_name),
               c("WTR_BACKED_UP_SECTION_H",
                 "WTR_BACKED_UP_SECTION_I",
                 "WTR_BACKED_UP_SECTION_J",
                 "WTR_BACKED_UP_SECTION_K",
                 "WELLBEING_CROSS_SECTIONAL_WEIGHT",
                 "DEVICE_TYPE_FOR_WEB_LOGIN"))





  expect_equal(head(crosswalk2012_parsed_sps$setup$column_number),
               c("FSTATE", "FCOUNTY", "FPLACE",
                 "FIPS_ST", "FIPS_COUNTY", "FIPS"))
  expect_equal(tail(crosswalk2012_parsed_sps$setup$column_number),
               c("SOURCE_CSLLEA2008", "SOURCE_UCR2010", "SOURCE_UCR2011",
                 "SOURCE_UCR2012", "SOURCE_NCIC2012", "SOURCE_VENDOR"))

  expect_equal(head(crosswalk2012_parsed_sps$setup$column_name),
               c("FIPS_STATE_CODE",
                 "FIPS_COUNTY_CODE",
                 "FIPS_PLACE_CODE",
                 "FIPS_STATE_CODE_ALPHANUMERIC",
                 "FIPS_COUNTY_CODE_ALPHANUMERIC",
                 "FIPS_STATE_COUNTY_CODE_ALPHANUMERIC"))
  expect_equal(tail(crosswalk2012_parsed_sps$setup$column_name),
               c("SOURCE_FILE_FLAG_CSLLEA_2008",
                 "SOURCE_FILE_FLAG_UCR_2010",
                 "SOURCE_FILE_FLAG_UCR_2011",
                 "SOURCE_FILE_FLAG_UCR_2012",
                 "SOURCE_FILE_FLAG_NCIC_2012",
                 "SOURCE_FILE_FLAG_VENDOR_FILE_2012"))



  expect_equal(head(dutch_election_parsed_sps$setup$column_number),
               c("V1", "V2", "V3",
                 "V4", "V5", "V6"))
  expect_equal(tail(dutch_election_parsed_sps$setup$column_number),
               c("V761", "V762", "V763",
                 "V764", "V765", "V766"))

  expect_equal(head(dutch_election_parsed_sps$setup$column_name),
               c("ICPSR_STUDY_NUMBER_7261",
                 "INTERVIEW_NUMBER",
                 "PROVINCE_OF_INTERVIEW",
                 "MUNICIPALITY_OF_INT",
                 "DGRE_OF_URBNZATN_MNCPLTY",
                 "X1ST_VISIT_CS_OF_NNINT"))
  expect_equal(tail(dutch_election_parsed_sps$setup$column_name),
               c("X3_COOPERATION_OF_R",
                 "X3_GNL_RLBLTY_R_S_ANSR",
                 "X3_UNRELIABLE_RESPONSES",
                 "X3_R_S_GNL_INTRST_N_POLT",
                 "X3_R_S_LVL_F_INF_ABT_PLT",
                 "RESPONSE_BY_WAVE"))


  expect_equal(sac_parsed_sps$setup$column_number[1:20],
               c("TRINUM", "SUBNO", "TODDATYR",
                 "DATSTAR", "CONSTATE", "Q1JSEX",
                 "Q2JAGE", "Q3JETH", "Q4JEDUC",
                 "Q5JSUPDP", "Q6JVIC", "Q7JKIDCT",
                 "Q8HOWMK", "Q9KNAM", "Q10KAGET",
                 "Q11KAGEA", "Q12KSEX", "Q13KVID",
                 "Q14INTK", "Q15IMPVK"))
  expect_equal(sac_parsed_sps$setup$column_number[178:197],
               c("Q123PN3", "Q123BIM3",
                 "Q124BGEN", "Q124PN1",
                 "Q124BIM1", "Q124PN2",
                 "Q124BIM2", "Q124PN3",
                 "Q124BIM3", "Q125BEF",
                 "Q126PN1", "Q126OTH1",
                 "Q126PN2", "Q126OTH2",
                 "Q126PN3", "Q126OTH3",
                 "KAGE", "VERDICT",
                 "DURAT", "DURAT2"))
  expect_equal(sex_offender_parsed_sps$setup$column_number,
               c("ID", "MEETING", "DATE",
                 "CITY", "Q1", "Q2A", "Q2B",
                 "Q2C", "Q2D", "Q2E", "Q2F",
                 "Q2G", "Q3", "Q4", "Q5",
                 "Q6A", "Q6B", "Q6C", "Q6D",
                 "Q6E", "Q6F", "Q7", "Q8A",
                 "Q8B", "Q9A", "Q9B", "Q9C",
                 "Q9D", "Q9E", "Q9F", "Q9G",
                 "Q10", "INDEX", "NEWQ9G"))
  expect_equal(ucr1960_parsed_sps$setup$column_number[1:20],
               c("V1", "V2", "V3", "V4", "V5", "V6",
                 "V7", "V8", "V9", "V10", "V11", "V12",
                 "V13", "V14", "V15", "V16", "V17",
                 "V18", "V19", "V20"))

  expect_equal(weimar_parsed_sps$setup$column_number,
               c("V1", "V2", "V3", "V4", "V5", "V6",
                 "V7", "V8", "V9", "V10", "V11", "V12",
                 "V13", "V14", "V15", "V16", "V17",
                 "V18", "V19", "V20", "V21", "V22",
                 "V23"))
  expect_equal(acs_parsed_sps$setup$column_number,
               c("STATEFIP", "GQ", "PERNUM",
                 "PERWT", "SEX", "AGE"))
  expect_equal(nibrs_parsed_sps$setup$column_number,
               c("B1001", "B1002", "B1003", "B1004",
                 "B1005", "B1006", "B1007", "B1008",
                 "B1009", "B1010", "B1011", "B1012",
                 "B1013", "B1014", "B1015", "B1016",
                 "B1017", "B1018", "B1019", "B1020"))
  expect_equal(parole_parsed_sps$setup$column_number[1:20],
               c("STATEID", "STATE", "TOTBEG",
                 "ENDISREL", "ENMANREL",
                 "ENREINST", "OTHEN", "TOTEN",
                 "EXCOM", "EXINCNEW", "EXINCREV",
                 "EXINCOTH", "EXTRANS", "EXDTH",
                 "EXOTH", "TOTEX", "TOTEND",
                 "MALE", "FEML", "TOTGEND"))
  expect_equal(parole_parsed_sps$setup$column_number[40:59],
               c("ISPNUM", "ISPIN", "EM",
                 "EMNUM", "EMIN", "BOOT",
                 "BOOTNUM", "BOOTIN",
                 "LOCJAIL", "LOCJAILIN",
                 "OTHPAR", "ENDOFYEAR",
                 "UNKEN", "UNKEX", "UNKGEND",
                 "UNKRACE2", "UNKHISP",
                 "UNKMAX", "UNKSTAT", "SUPVRATE"))

  expect_equal(ca_vital_parsed_sps$setup$column_number[1:20],
               c("CNTYJUR", "JURISDIC",
                 "BCSNUM", "TOTVICT",
                 "TOTOFFEN", "VICSEX",
                 "VICRACE", "CRIMEST",
                 "RELATN1", "RELATN2",
                 "RELATN3", "RELATN4",
                 "INCDTIME", "INCDDAY",
                 "DEATHYR", "WEAPON",
                 "LOCATION", "PRECIP1",
                 "PRECIP2", "PRECIP3"))
  expect_equal(ca_vital_parsed_sps$setup$column_number[40:59],
               c("ZIPCODE", "AGEYEARS",
                 "CENSUS", "ICD10",
                 "DOB",  "VICAGE",
                 "DOD", "ARRDATE1",
                 "ARRDATE2", "ARRDATE3",
                 "ARRDATE4",  "FLAG",
                 "INCDDATE", "INJDATE",
                 "RACE", "SEX",
                 "STATERES", "MARSTAT",
                 "HISPANIC", "MATCH"))

  expect_equal(crosswalk_parsed_sps$setup$column_number,
               c("SOURCE", "STATE", "UORI",
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
  expect_equal(ucr1985_parsed_sps$setup$column_number[1:20],
               c("V1", "V2", "V3", "V4", "V5", "V6",
                 "V7", "V8", "V9", "V10", "V11", "V12",
                 "V13", "V14", "V15", "V16", "V17",
                 "V18", "V19", "V20"))
  expect_equal(ucr1985_parsed_sps$setup$column_number[1439:1458],
               c("V1439", "V1440",
                 "V1441", "V1442",
                 "V1443", "V1444",
                 "V1445", "V1446",
                 "V1447", "V1448",
                 "V1449", "V1450",
                 "V1451", "V1452",
                 "V1453", "V1454",
                 "V1455", "V1456",
                 "V1457", "V1458"))
  expect_equal(ucr1960_parsed_sps$setup$column_number[1429:1448],
               c("V1429", "V1430",
                 "V1431", "V1432",
                 "V1433", "V1434",
                 "V1435", "V1436",
                 "V1437", "V1438",
                 "V1439", "V1440",
                 "V1441", "V1442",
                 "V1443", "V1444",
                 "V1445", "V1446",
                 "V1447", "V1448"))

  expect_equal(head(ncvs_parsed_sps$setup$column_number),
               c("V2001", "V2002", "V2003",
                 "V2004", "V2005", "V2006"))
  expect_equal(tail(ncvs_parsed_sps$setup$column_number),
               c("V4322", "V4323", "V4324",
                 "V4325", "V4326", "V4327"))

  expect_equal(head(ncvs_parsed_sps$setup$column_name),
               c("ICPSR_HOUSEHOLD_NUMBER",
                 "YEAR_AND_QUARTER",
                 "CENSUS_SAMPLE_NUMBER",
                 "PRIMARY_SAMPLING_UNIT",
                 "SEGMENT_NUMBER",
                 "CHECK_DIGIT"))
  expect_equal(tail(ncvs_parsed_sps$setup$column_name),
               c("SERIOUSNESS_SCORE",
                 "SERIOUSNESS_OLD_SCORE",
                 "INCIDENT_WEIGHT",
                 "CRIME_SEQUENCE_NO",
                 "RECODED_TYPE_OF_CRIME",
                 "RELATION_TO_VICTIM"))

  expect_equal(head(jail_1987_parsed_sps$setup$column_number),
               c("V1", "V2", "V3",
                 "V4", "V5", "V6"))
  expect_equal(tail(jail_1987_parsed_sps$setup$column_number),
               c("V171", "V172", "V173",
                 "V174", "V175", "V176"))

  expect_equal(head(jail_1987_parsed_sps$setup$column_name),
               c("ICPSR_STUDY_NUMBER_9074",
                 "ICPSR_EDITION_NUMBER_1",
                 "ICPSR_PART_NUMBER_1",
                 "ICPSR_SEQUENCE_NUMBER",
                 "FORM_NUMBER",
                 "STATE_CODE"))
  expect_equal(tail(jail_1987_parsed_sps$setup$column_name),
               c("COURT_ORDER_STAFF_PATTRN",
                 "COURT_ORDER_ED_TRAINING",
                 "COURT_ORDER_COUNSELLING",
                 "COURT_ORDER_FOOD_SERVICE",
                 "COURT_ORDER_OTHER",
                 "CENSUS_USE_BOX"))


  expect_equal(head(jail_2010_parsed_sps$setup$column_number),
               c("FACLID21", "JURDID", "STATE",
                 "COUNTY", "FACLNAME", "CITY"))
  expect_equal(tail(jail_2010_parsed_sps$setup$column_number),
               c("STOLENPROPF",
                 "ESCAPE",
                 "ESCAPEF",
                 "OTHERMAJVIO",
                 "OTHERMAJVIOF",
                 "NCONPOP2"))

  expect_equal(head(jail_2010_parsed_sps$setup$column_name),
               c("AGENCY_ID",
                 "JURISDICTION_ID",
                 "STATE",
                 "COUNTY_NAME",
                 "FACILITY_NAME",
                 "CITY"))
  expect_equal(tail(jail_2010_parsed_sps$setup$column_name),
               c("POSSESSION_OF_STOLEN_PROPERTY_FLAG",
                 "S4QIV_4_1F_ESCAPE_OR_ATTEMPTED_ESCAPE",
                 "ESCAPE_OR_ATTEMPTED_ESCAPE_FLAG",
                 "S4QIV_4_1G_ANY_OTHER_MAJOR_VIOLATION_INCLUDING_WORK_SLOWDOWNS_FOOD_STRIKES_SETTING_FIRE_RIOTING_ETC",
                 "ANY_OTHER_MAJOR_VIOLATION_INCLUDING_WORK_SLOWDOWNS_FOOD_STRIKES_SETTING_FIRE_RIOTING_ETC_FLAG",
                 "NONCONFINED_POPULATION_CALCULATED"))


  expect_equal(corrections_parsed_sps$setup$column_number,
               c("SEX",
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
  expect_equal(corrections_parsed_sps$setup$column_name,
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



  expect_equal(head(sadc_parsed_sps$setup$column_number),
               c("sitecode",
                 "sitename",
                 "sitetype",
                 "sitetypenum",
                 "year",
                 "survyear"))
  expect_equal(tail(sadc_parsed_sps$setup$column_number),
               c("qnsunburn",
                 "qnconcentrating",
                 "qncurrentasthma",
                 "qnwheresleep",
                 "qnspeakenglish",
                 "qntransgender"))

  expect_equal(head(sadc_parsed_sps$setup$column_name),
               c("Site_code",
                 "Site_name",
                 "Site_type",
                 "X1_District_2_State_3_National",
                 "X4_digit_Year_of_survey",
                 "X1_1991_14_2017"))
  expect_equal(tail(sadc_parsed_sps$setup$column_name),
               c("Had_a_sunburn",
                 "Have_serious_difficulty_concentrating_remembering_or_making_decisions",
                 "With_current_asthma",
                 "Usually_slept_in_the_home_of_a_friend_family_member_or_other_person_because_they_had_to_leave_their_home_or_their_parent_or_guardian_cannot_afford_housing",
                 "Speak_English_well_or_very_well",
                 "Are_transgender"))



  expect_equal(head(health_nutrition_parsed_sps$setup$column_number),
               c("SEQN",
                 "SDDSRVYR",
                 "RIDSTATR",
                 "RIDEXMON",
                 "RIAGENDR",
                 "RIDAGEYR"))
  expect_equal(tail(health_nutrition_parsed_sps$setup$column_number),
               c("MIAINTRP",
                 "AIALANG",
                 "WTINT2YR",
                 "WTMEC2YR",
                 "SDMVPSU",
                 "SDMVSTRA"))

  expect_equal(head(health_nutrition_parsed_sps$setup$column_name),
               c("Respondent_sequence_number",
                 "Data_Release_Number",
                 "Interview_Examination_Status",
                 "Six_month_time_period",
                 "Gender",
                 "Age_at_Screening_Adjudicated_Recode"))
  expect_equal(tail(health_nutrition_parsed_sps$setup$column_name),
               c("Interpreter_used_in_MEC_Interview",
                 "Language_of_ACASI_Interview",
                 "Full_Sample_2_Year_Interview_Weight",
                 "Full_Sample_2_Year_MEC_Exam_Weight",
                 "Masked_Variance_Pseudo_PSU",
                 "Masked_Variance_Pseudo_Stratum"))


  expect_equal(ad_health_parsed_sps$setup$column_number,
               c("AID",
                 "CLUSTER2",
                 "GSWGT4",
                 "GSWGT4_2",
                 "GSWGT134"))
  expect_equal(ad_health_parsed_sps$setup$column_name,
               c("RESPONDENT_IDENTIFIER",
                 "Sample_cluster",
                 "Post_stratified_untrimmed_longitudinal_grand_sample_weight",
                 "Post_stratified_untrimmed_cross_sectional_grand_sample_weight",
                 "Post_stratified_untrimmed_longitudinal_grand_sample_weight_for_Waves_I_III_and_IV"))



  expect_equal(head(india_human_parsed_sps$setup$column_number),
               c("SURVEY",
                 "STATEID",
                 "DISTID",
                 "PSUID",
                 "HHID",
                 "HHSPLITID"))
  expect_equal(tail(india_human_parsed_sps$setup$column_number),
               c("MGYEAR5",
                 "NMIG5",
                 "MGMONTHS5",
                 "MGYEAR1",
                 "NMIG1",
                 "MGMONTHS1"))

  expect_equal(head(india_human_parsed_sps$setup$column_name),
               c("IHDS_I_2005_or_IHDS_II_2012",
                 "State_code",
                 "District_code",
                 "PSU_village_neighborhood_code",
                 "Household_ID_3_digit",
                 "Split_household_ID"))
  expect_equal(tail(india_human_parsed_sps$setup$column_name),
               c("HQ6_4_1_Migrant_five_years_ago_or_less",
                 "HQ6_4_1_migrations_in_last_5_years",
                 "HQ6_4_7_total_months_gone_in_last_5_years",
                 "HQ6_4_8_Migrant_one_year_ago_or_less",
                 "HQ6_4_1_migrations_in_last_1_year",
                 "HQ6_4_7_total_months_gone_in_last_1_year"))


    expect_equal(head(escolar_parsed_sps$setup$column_number),
                 c("MASCARA",
                   "ANO",
                   "CODMUNIC",
                   "UF",
                   "SIGLA",
                   "MUNIC"))
    expect_equal(tail(escolar_parsed_sps$setup$column_number),
                 c("VTE165",
                   "VTE166",
                   "VTE167",
                   "VTE168",
                   "VTE169",
                   "VTE16A"))
    expect_equal(head(escolar_parsed_sps$setup$column_name),
                 c("MASCARA",
                   "ANO",
                   "CODMUNIC",
                   "UF",
                   "SIGLA",
                   "MUNIC"))
    expect_equal(tail(escolar_parsed_sps$setup$column_name),
                 c("VTE165",
                   "VTE166",
                   "VTE167",
                   "VTE168",
                   "VTE169",
                   "VTE16A"))


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



  expect_equal(head(step_in_parsed_sps$setup$column_number),
               c("CID",
                 "RCTR",
                 "FSDATE",
                 "EVENT_DATE",
                 "NR_DAYS",
                 "NO_RECORD"))
  expect_equal(tail(step_in_parsed_sps$setup$column_number),
               c("FSDATE",
                 "EVENT_DATE",
                 "NR_DAYS",
                 "NO_RECORD",
                 "EVENT",
                 "CHARGE"))
  expect_equal(head(step_in_parsed_sps$setup$column_name),
               c("CID",
                 "RCTR",
                 "FSDATE",
                 "EVENT_DATE",
                 "NR_DAYS",
                 "NO_RECORD"))
  expect_equal(tail(step_in_parsed_sps$setup$column_name),
               c("FSDATE",
                 "EVENT_DATE",
                 "NR_DAYS",
                 "NO_RECORD",
                 "EVENT",
                 "CHARGE"))


  expect_equal(head(cps_1973_parsed_sps$setup$column_number),
               c("V1001",
                 "V1002",
                 "V1003",
                 "V1004",
                 "V1005",
                 "V1006"))
  expect_equal(tail(cps_1973_parsed_sps$setup$column_number),
               c("V1264",
                 "V1265",
                 "V1266",
                 "V1267",
                 "V1268",
                 "V1269"))
  expect_equal(head(cps_1973_parsed_sps$setup$column_name),
               c("SMON",
                 "HHSEQNUM",
                 "HNUM",
                 "SUBH",
                 "STATS1",
                 "STATS2"))
  expect_equal(tail(cps_1973_parsed_sps$setup$column_name),
               c("AWAIT3",
                 "AWAIT4",
                 "AWAIT5",
                 "ICPSR_STUDY_NUMBER_7616",
                 "ICPSR_EDITION_NUMBER_1",
                 "ICPSR_PART_NUMBER_001"))


  expect_equal(head(census_police_parsed_sps$setup$column_number),
               c("CSLLEA08_ID",
                 "AGCYTYPE",
                 "SUBTYPE1",
                 "SUBTYPE2",
                 "TRIBAL",
                 "Q1A1"))
  expect_equal(tail(census_police_parsed_sps$setup$column_number),
               c("CITY",
                 "STATE",
                 "ZIP",
                 "STATENAME",
                 "COUNTY",
                 "FIPS"))
  expect_equal(head(census_police_parsed_sps$setup$column_name),
               c("AGENCY_IDENTIFIER",
                 "TYPE_OF_AGENCY",
                 "SPECIAL_JURISDICTION_GENERAL_TYPE",
                 "SPECIAL_JURISDICTION_SPECIFIC_TYPE",
                 "TRIBAL_AGENCY_INDICATOR",
                 "Q1A1_FIRST_RESPONSE_TO_CRIMINAL_INCIDENTS"))
  expect_equal(tail(census_police_parsed_sps$setup$column_name),
               c("CITY",
                 "STATE_CODE",
                 "ZIP",
                 "NAME_OF_STATE",
                 "COUNTY_NAME",
                 "FIPS_CODE"))


  expect_equal(head(british_crime_teen_parsed_sps$setup$column_number),
               c("ROW_LAB",
                 "TB_CASE",
                 "AR_CODE",
                 "T_SN",
                 "T_SCRN",
                 "BOOSTER"))
  expect_equal(tail(british_crime_teen_parsed_sps$setup$column_number),
               c("T69",
                 "T70",
                 "T71",
                 "T72",
                 "T73",
                 "T74"))
  expect_equal(head(british_crime_teen_parsed_sps$setup$column_name),
               c("ROW_LAB",
                 "TB_CASE",
                 "AR_CODE",
                 "T_SN",
                 "T_SCRN",
                 "BOOSTER"))
  expect_equal(tail(british_crime_teen_parsed_sps$setup$column_name),
               c("T69",
                 "T70",
                 "T71",
                 "T72",
                 "T73",
                 "T74"))


  expect_equal(head(drug_abuse_parsed_sps$setup$column_number),
               c("DEGREE_SPECIFY_OTHER",
                 "DISCIPLINE",
                 "DISCIPLINE_OTHER",
                 "STATE_CREDENTIALS_SPECIFY",
                 "NATIONAL_CERTIFICATION_OT",
                 "LICENSURE_SPECIFY"))
  expect_equal(tail(drug_abuse_parsed_sps$setup$column_number),
               c("DOCSUP",
                 "DOCLEAD",
                 "EOTDIV",
                 "EOTTOL",
                 "EOTSCO",
                 "EOTOPN"))
  expect_equal(head(drug_abuse_parsed_sps$setup$column_name),
               c("Degree_other",
                 "Discipline",
                 "Discipline_Other",
                 "State_substance_abuse_counseling_credentials_Not_in_CD",
                 "National_certification_Other_Not_in_CD",
                 "Licensure_Specify_Not_in_CD"))
  expect_equal(tail(drug_abuse_parsed_sps$setup$column_name),
               c("Organizational_Support_Subscale_RAND_section_D",
                 "Leadership_sub_scale_section_D",
                 "Divergence_sub_scale_section_E",
                 "Tolerance_for_ambiguity_section_E",
                 "Service_Coordination",
                 "Openness"))


  expect_equal(head(detroit_parsed_sps$setup$column_number),
               c("CASEID",
                 "IWERID",
                 "CASETYPE",
                 "FINALWGT",
                 "STRATUM",
                 "CLUSTER"))
  expect_equal(tail(detroit_parsed_sps$setup$column_number),
               c("J5A",
                 "J5B",
                 "J5C",
                 "J5D",
                 "J6",
                 "J7"))
  expect_equal(head(detroit_parsed_sps$setup$column_name),
               c("CASEID",
                 "IWER_ID",
                 "CASETYPE",
                 "FINAL_SAMPLE_WEIGHT",
                 "STRATUM",
                 "CLUSTER"))
  expect_equal(tail(detroit_parsed_sps$setup$column_name),
               c("IF_NO_WERE_FAMILY_MEMBERS_OR_FRIENDS_PRESENT",
                 "NUMBER_OF_OTHER_PEOPLE_PRESENT",
                 "DID_RESPONDENT_CONSULT_WITH_OTHERS_BEFORE_RESPONDING",
                 "DID_OTHERS_PRESENT_TRY_TO_ANSWER_FOR_RESPONDENT",
                 "DID_R_SEEM_GUARDED_NERVOUS_OR_SUSPICIOUS_ABOUT_THE_INTERVIEW",
                 "WAS_INTERVIEW_CONDUCTED_IN_PERSON_OR_BY_TELEPHONE"))


  expect_equal(head(worry_parsed_sps$setup$column_number),
               c("SUBJ",
                 "VERSION",
                 "PRE1",
                 "POST1",
                 "PRE2",
                 "POST2"))
  expect_equal(tail(worry_parsed_sps$setup$column_number),
               c("HOSPNEXT",
                 "EDUC",
                 "CHILDREN",
                 "BIS",
                 "EXTRAVER",
                 "STABLE"))
  expect_equal(head(worry_parsed_sps$setup$column_name),
               c("Subject_identification_number",
                 "Version",
                 "Overall_how_serious_a_problem_is_patient_safety_in_U_S_healthcare_today",
                 "How_serious_a_problem_is_patient_safety",
                 "Overall_how_serious_a_problem_is_medical_errors_in_U_S_healthcare_today",
                 "How_serious_a_problem_is_medical_errors"))
  expect_equal(tail(worry_parsed_sps$setup$column_name),
               c("How_likely_are_you_to_spend_a_night_in_the_hospital_in_the_coming_year",
                 "Your_highest_education_level",
                 "How_many_children_if_any_do_you_have_at_home",
                 "BIS_Behavioral_Inhibition_scale",
                 "Extraversion_scale",
                 "Stability_scale"))


  expect_equal(head(cps_2004_parsed_sps$setup$column_number),
               c("HRHHID",
                 "HRYEAR4",
                 "HURESPLI",
                 "HUFINAL",
                 "HUSPNISH",
                 "HETENURE"))
  expect_equal(tail(cps_2004_parsed_sps$setup$column_number),
               c("HEQ2C",
                 "HEQ2D",
                 "HEQ2E",
                 "HEQ3",
                 "HRSUPINT",
                 "HWSUPWGT"))
  expect_equal(head(cps_2004_parsed_sps$setup$column_name),
               c("HRHHID",
                 "HRYEAR4",
                 "HURESPLI",
                 "HUFINAL",
                 "HUSPNISH",
                 "HETENURE"))
  expect_equal(tail(cps_2004_parsed_sps$setup$column_name),
               c("HEQ2C",
                 "HEQ2D",
                 "HEQ2E",
                 "HEQ3",
                 "HRSUPINT",
                 "HWSUPWGT"))


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


})
