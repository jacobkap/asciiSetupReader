context("Make sure missing values are removed")


weimar_dataset_name <- system.file("testdata", "weimar.txt",
                                   package = "asciiSetupReader")
weimar_sps_name <- system.file("testdata", "weimar.sps",
                               package = "asciiSetupReader")
weimar <- spss_ascii_reader(dataset_name = weimar_dataset_name,
                         sps_name = weimar_sps_name)

crosswalk_dataset_name <- system.file("testdata", "crosswalk.zip",
                                   package = "asciiSetupReader")
crosswalk_sps_name <- system.file("testdata", "crosswalk.sps",
                               package = "asciiSetupReader")
crosswalk <- spss_ascii_reader(dataset_name = crosswalk_dataset_name,
                            sps_name = crosswalk_sps_name,
                            real_names = FALSE)


parole_survey_dataset_name <- system.file("testdata", "parole_survey.txt",
                                   package = "asciiSetupReader")
parole_survey_sps_name <- system.file("testdata", "parole_survey.sps",
                               package = "asciiSetupReader")
parole_survey <- spss_ascii_reader(dataset_name = parole_survey_dataset_name,
                             sps_name = parole_survey_sps_name,
                             real_names = FALSE)


test_that("number of missing values is correct - SPSS", {
  expect_equal(sum(is.na(weimar$X1919_RT_NR_ELIGIBLE_VTRS)), 3)

  expect_equal(sum(is.na(crosswalk$UORI)),         1205)
  expect_equal(sum(is.na(crosswalk$UMSA)),        13630)
  expect_equal(sum(is.na(crosswalk$UADD5)),        5634)
  expect_equal(sum(is.na(crosswalk$CGOVTYPE)),      137)
  expect_equal(sum(is.na(crosswalk$FCOUNTY)),        65)
  expect_equal(sum(is.na(crosswalk$FMSA)),        13793)
  expect_equal(sum(is.na(crosswalk$UCOUNTY)),        61)
  expect_equal(sum(is.na(crosswalk$UPOPGRP)),      4636)
  expect_equal(sum(is.na(crosswalk$CGOVIDNU)),      449)
  expect_equal(sum(is.na(crosswalk$FSTATE)),          1)
  expect_equal(sum(is.na(crosswalk$FPLACE)),        424)
  expect_equal(sum(is.na(crosswalk$FCMSA)),        4190)

  expect_equal(sum(is.na(parole_survey$TOTBEG)),      0)
  expect_equal(sum(is.na(parole_survey$ENDISREL)),    4)
  expect_equal(sum(is.na(parole_survey$ENMANREL)),   11)
  expect_equal(sum(is.na(parole_survey$ENREINST)),   18)
  expect_equal(sum(is.na(parole_survey$OTHEN)),       8)
  expect_equal(sum(is.na(parole_survey$TOTEN)),       1)
  expect_equal(sum(is.na(parole_survey$EXCOM)),       2)
  expect_equal(sum(is.na(parole_survey$EXINCNEW)),   11)
  expect_equal(sum(is.na(parole_survey$EXINCREV)),    3)
  expect_equal(sum(is.na(parole_survey$EXINCOTH)),   14)
  expect_equal(sum(is.na(parole_survey$EXTRANS)),    13)
  expect_equal(sum(is.na(parole_survey$EXDTH)),       4)
  expect_equal(sum(is.na(parole_survey$EXOTH)),       5)
  expect_equal(sum(is.na(parole_survey$TOTEX)),       1)
  expect_equal(sum(is.na(parole_survey$TOTEND)),      0)
  expect_equal(sum(is.na(parole_survey$MALE)),        2)
  expect_equal(sum(is.na(parole_survey$FEML)),        2)
  expect_equal(sum(is.na(parole_survey$TOTGEND)),     0)
  expect_equal(sum(is.na(parole_survey$WHITE)),       5)
  expect_equal(sum(is.na(parole_survey$BLACK)),       5)
  expect_equal(sum(is.na(parole_survey$AMINALK)),    10)
  expect_equal(sum(is.na(parole_survey$ASHAWPAC)),   11)
  expect_equal(sum(is.na(parole_survey$ADDRACE)),     7)
  expect_equal(sum(is.na(parole_survey$TOTRACE)),     0)
  expect_equal(sum(is.na(parole_survey$HISP)),       17)
  expect_equal(sum(is.na(parole_survey$NONHISP)),    17)
  expect_equal(sum(is.na(parole_survey$TOTHISP)),     0)
  expect_equal(sum(is.na(parole_survey$MAXYEAR)),    15)
  expect_equal(sum(is.na(parole_survey$MAXMORE)),    10)
  expect_equal(sum(is.na(parole_survey$TOTMAX)),      0)
  expect_equal(sum(is.na(parole_survey$ACTIVE)),      1)
  expect_equal(sum(is.na(parole_survey$INACTIVE)),   10)
  expect_equal(sum(is.na(parole_survey$ABSND)),       6)
  expect_equal(sum(is.na(parole_survey$OUTSTATE)),    3)
  expect_equal(sum(is.na(parole_survey$OTHSTAT)),     3)
  expect_equal(sum(is.na(parole_survey$TOTSTAT)),     0)
  expect_equal(sum(is.na(parole_survey$ISPNUM)),     16)
  expect_equal(sum(is.na(parole_survey$ISPIN)),      15)
  expect_equal(sum(is.na(parole_survey$EMNUM)),      25)
  expect_equal(sum(is.na(parole_survey$EMIN)),       25)
  expect_equal(sum(is.na(parole_survey$BOOTNUM)),    49)
  expect_equal(sum(is.na(parole_survey$BOOTIN)),     49)
  expect_equal(sum(is.na(parole_survey$LOCJAIL)),     3)
  expect_equal(sum(is.na(parole_survey$LOCJAILIN)),  52)
  expect_equal(sum(is.na(parole_survey$OTHPAR)),      2)
  expect_equal(sum(is.na(parole_survey$ENDOFYEAR)),   2)

  })



test_that("location of missing values is correct - SPSS", {
  expect_true(all(is.na(weimar$X1919_RT_NR_ELIGIBLE_VTRS[c(13, 14, 36)])))

  expect_true(all(is.na(crosswalk$UORI[c(1:18, 10036, 10703, 19375,
                                         19501:19550, 22115:22129)])))
  expect_true(all(is.na(crosswalk$UMSA[c(1:18, 20:75, 1000:1003, 3715:3721,
                                         4400:4411)])))
  expect_true(all(is.na(crosswalk$UADD5[c(1:17, 955, 1925, 2012, 2700,
                                          2774:2779, 4181, 4277)])))
  expect_true(all(is.na(crosswalk$CGOVTYPE[c(91, 93, 1649, 16225, 20084,
                                             404, 487)])))
  expect_true(all(is.na(crosswalk$FCOUNTY[c(42, 2207, 2352, 4708, 4710,
                                            11445, 21616)])))
  expect_true(all(is.na(crosswalk$FMSA[c(1:18, 20:70, 490, 400:418, 917:928,
                                         2155:2170, 4001:4030)])))
  expect_true(all(is.na(crosswalk$UCOUNTY[c(42, 2207, 2352, 4707, 4710, 4713,
                                            8479, 21660, 21714)])))
  expect_true(all(is.na(crosswalk$UPOPGRP[c(13609, 14758, 9784:9787, 1:18)])))
  expect_true(all(is.na(crosswalk$CGOVIDNU[c(91, 404, 5056, 10000, 14623, 14709,
                                             19906, 22932)])))
  expect_true(all(is.na(crosswalk$FSTATE[c(2352)])))
  expect_true(all(is.na(crosswalk$FPLACE[c(42, 91, 1576, 5790, 9217, 14005,
                                           20868, 21810)])))
  expect_true(all(is.na(crosswalk$FCMSA[c(1, 4, 1419, 2561, 2690, 2765, 3308,
                                          4057, 4130)])))


  expect_true(all(is.na(parole_survey$ENDISREL[c(9, 14, 28, 33)])))
  expect_true(all(is.na(parole_survey$ENMANREL[c(5, 9, 12, 19, 28, 33, 35, 38,
                                                 41, 44, 52)])))
  expect_true(all(is.na(parole_survey$ENREINST[c(5, 7, 9, 11, 12, 14, 16, 27:29,
                                                 33:35, 38, 44:45, 49, 52)])))
  expect_true(all(is.na(parole_survey$OTHEN[c(9, 14, 19, 28, 33:34, 45, 52)])))
  expect_true(all(is.na(parole_survey$TOTEN[c(14)])))
  expect_true(all(is.na(parole_survey$EXCOM[c(9, 28)])))
  expect_true(all(is.na(parole_survey$EXINCNEW[c(5, 9, 14, 23, 28:30, 33, 35,
                                                 44, 52)])))
  expect_true(all(is.na(parole_survey$EXINCREV[c(9, 14, 28)])))
  expect_true(all(is.na(parole_survey$EXINCOTH[c(7, 9, 11, 14, 15, 19:20, 28,
                                                 33:35, 39, 45, 52)])))
  expect_true(all(is.na(parole_survey$EXTRANS[c(3, 9, 10, 13, 14, 18, 28, 30,
                                                33:35, 38, 45)])))
  expect_true(all(is.na(parole_survey$EXDTH[c(9, 14, 16, 28)])))
  expect_true(all(is.na(parole_survey$EXOTH[c(9:10, 14, 28, 45)])))
  expect_true(all(is.na(parole_survey$TOTEX[c(14)])))
  expect_true(all(is.na(parole_survey$MALE[c(17, 19)])))
  expect_true(all(is.na(parole_survey$FEML[c(17, 19)])))
  expect_true(all(is.na(parole_survey$WHITE[c(8, 13, 16:17, 19)])))
  expect_true(all(is.na(parole_survey$BLACK[c(8, 13, 16:17, 19)])))
  expect_true(all(is.na(parole_survey$AMINALK[c(8, 10, 12:13, 16:17, 19, 26,
                                                42, 44)])))
  expect_true(all(is.na(parole_survey$ASHAWPAC[c(8, 10, 12:13, 16:17, 19, 26,
                                                 33, 42, 44)])))
  expect_true(all(is.na(parole_survey$ADDRACE[c(8, 12:13, 16:17, 19, 44)])))
  expect_true(all(is.na(parole_survey$HISP[c(1:2, 8, 10, 12:13, 16:17, 19:20,
                                             22, 26:28, 35, 42, 44)])))
  expect_true(all(is.na(parole_survey$NONHISP[c(1:2, 8, 10, 12:13, 16:17, 19:20,
                                                22, 26:28, 35, 42, 44)])))
  expect_true(all(is.na(parole_survey$MAXYEAR[c(7, 9, 10, 15:17, 19, 26, 28, 34,
                                                35, 37, 40, 42, 52)])))
  expect_true(all(is.na(parole_survey$MAXMORE[c(9:10, 16:17, 26, 28, 35, 37, 40,
                                                42)])))
  expect_true(all(is.na(parole_survey$ACTIVE[c(37)])))
  expect_true(all(is.na(parole_survey$INACTIVE[c(6, 12, 14, 15, 19:20, 29:30, 37,
                                                 52)])))
  expect_true(all(is.na(parole_survey$ABSND[c(12, 15, 19, 23, 27, 37)])))
  expect_true(all(is.na(parole_survey$OUTSTATE[c(19, 37, 38)])))
  expect_true(all(is.na(parole_survey$OTHSTAT[c(10, 15, 37)])))
  expect_true(all(is.na(parole_survey$ISPNUM[c(1, 4, 6, 8, 16, 18, 21, 24, 26, 34,
                                               36:37, 41, 47, 49:50)])))

  expect_true(all(is.na(parole_survey$ISPIN[c(4, 9, 46)])))
  expect_true(all(is.na(parole_survey$EMNUM[c(3, 5, 7, 9:10, 14, 16, 18:21, 23,
                                              26, 29, 32, 36:38, 40, 43:44,
                                              46:47, 49:50)])))
  expect_true(all(is.na(parole_survey$EMIN[c(1:3, 30, 46)])))
  expect_true(all(is.na(parole_survey$BOOTNUM[c(1:5, 7:18, 20:21, 23:52)])))
  expect_true(all(is.na(parole_survey$BOOTIN[c(19)])))
  expect_true(all(is.na(parole_survey$LOCJAIL[c(2, 18, 42)])))
  expect_true(all(is.na(parole_survey$LOCJAILIN[c(2, 9:10, 18:19, 22:23, 27, 32,
                                                  35, 40, 42, 44)])))
  expect_true(all(is.na(parole_survey$OTHPAR[c(2 ,47)])))
  expect_true(all(is.na(parole_survey$ENDOFYEAR[c(2, 16)])))






})
