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
crosswalk_setup <- parse_spss(crosswalk_sps_name)
crosswalk_raw <- read_data(crosswalk_dataset_name, crosswalk_setup)


parole_dataset_name <- system.file("testdata", "parole_survey.txt",
                                   package = "asciiSetupReader")
parole_sps_name <- system.file("testdata", "parole_survey.sps",
                               package = "asciiSetupReader")
parole <- spss_ascii_reader(dataset_name = parole_dataset_name,
                             sps_name = parole_sps_name,
                             real_names = FALSE)
parole_setup <- parse_spss(parole_sps_name)
parole_raw <- read_data(parole_dataset_name, parole_setup)


test_that("number of missing values is correct - SPSS", {
  expect_equal(sum(is.na(weimar$X1919_RT_NR_ELIGIBLE_VTRS)), 3)

  expect_equal(sum(is.na(crosswalk$UORI)),         1205)
  expect_equal(sum(crosswalk$UMSA %in% "Unknown/ not an MSA"),    13630)
  expect_equal(sum(crosswalk$UADD5 %in% "Unknown"),        5634)
  expect_equal(sum(crosswalk$CGOVTYPE %in% "Unknown"),      137)
  expect_equal(sum(crosswalk$FCOUNTY %in% "Unknown"),        65)
  expect_equal(sum(crosswalk$FMSA %in% "Unknown/ no MSA"),        13793)
  expect_equal(sum(crosswalk$UCOUNTY %in% "Unknown"),        61)
  expect_equal(sum(is.na(crosswalk$UPOPGRP)),      4636)
  expect_equal(sum(crosswalk$CGOVIDNU %in% "Unknown"),      449)
  expect_equal(sum(crosswalk$FSTATE %in% "Unknown"),          1)
  expect_equal(sum(crosswalk$FPLACE %in% "Unknown"),        424)
  expect_equal(sum(crosswalk$FCMSA %in% "Unknown"),        4190)

  expect_equal(sum(is.na(parole$TOTBEG)),      0)
  expect_equal(sum(parole$ENDISREL %in% "Not known/Dont know"),    4)
  expect_equal(sum(parole$ENMANREL %in% "Not applicable"),   5)
  expect_equal(sum(parole$ENMANREL %in% "Not known/Dont know"),   6)
  expect_equal(sum(parole$ENREINST %in% "Not applicable"),   6)
  expect_equal(sum(parole$ENREINST %in% "Not known/Dont know"),   12)
  expect_equal(sum(parole$OTHEN %in% "Not applicable"),       4)
  expect_equal(sum(parole$OTHEN %in% "Not known/Dont know"),       4)
  expect_equal(sum(parole$TOTEN %in% "Not known/Dont know"),       1)
  expect_equal(sum(parole$EXCOM %in% "Not known/Dont know"),       2)
  expect_equal(sum(parole$EXINCNEW %in% "Not applicable"),   1)
  expect_equal(sum(parole$EXINCNEW %in% "Not known/Dont know"),   10)
  expect_equal(sum(parole$EXINCREV %in% "Not known/Dont know"),    3)
  expect_equal(sum(parole$EXINCOTH %in% "Not applicable"),   7)
  expect_equal(sum(parole$EXINCOTH %in% "Not known/Dont know"),   7)
  expect_equal(sum(parole$EXTRANS %in% "Not known/Dont know"),    10)
  expect_equal(sum(parole$EXTRANS %in% "Not applicable"),    3)
  expect_equal(sum(parole$EXDTH %in% "Not applicable"),       1)
  expect_equal(sum(parole$EXDTH %in% "Not known/Dont know"),       3)
  expect_equal(sum(parole$EXOTH %in% "Not applicable"),       2)
  expect_equal(sum(parole$EXOTH %in% "Not known/Dont know"),       3)
  expect_equal(sum(parole$TOTEX %in% "Not known/Dont know"),       1)
  expect_equal(sum(is.na(parole$TOTEND)),      0)
  expect_equal(sum(parole$MALE %in% "Not known/Dont know"),        2)
  expect_equal(sum(parole$FEML %in% "Not known/Dont know"),        2)
  expect_equal(sum(is.na(parole$TOTGEND)),     0)
  expect_equal(sum(parole$WHITE %in% "Not known/Dont know"),       5)
  expect_equal(sum(parole$BLACK %in% "Not known/Dont know"),       5)
  expect_equal(sum(parole$AMINALK %in% "Not known/Dont know"),    10)
  expect_equal(sum(parole$ASHAWPAC %in% "Not known/Dont know"),   11)
  expect_equal(sum(parole$ADDRACE %in% "Not known/Dont know"),     7)
  expect_equal(sum(is.na(parole$TOTRACE)),     0)
  expect_equal(sum(parole$HISP %in% "Not known/Dont know"),       17)
  expect_equal(sum(parole$NONHISP %in% "Not known/Dont know"),    17)
  expect_equal(sum(is.na(parole$TOTHISP)),     0)
  expect_equal(sum(parole$MAXYEAR %in% "Not applicable"),    6)
  expect_equal(sum(parole$MAXYEAR %in% "Not known/Dont know"),    9)
  expect_equal(sum(parole$MAXMORE %in% "Not applicable"),    1)
  expect_equal(sum(parole$MAXMORE %in% "Not known/Dont know"),    9)
  expect_equal(sum(is.na(parole$TOTMAX)),      0)
  expect_equal(sum(parole$ACTIVE %in% "Not known/Dont know"),      1)
  expect_equal(sum(parole$INACTIVE %in% "Not applicable"),   5)
  expect_equal(sum(parole$INACTIVE %in% "Not known/Dont know"),   5)
  expect_equal(sum(parole$ABSND %in% "Not applicable"),       1)
  expect_equal(sum(parole$ABSND %in% "Not known/Dont know"),       5)
  expect_equal(sum(parole$OUTSTATE %in% "Not known/Dont know"),    3)
  expect_equal(sum(parole$OTHSTAT %in% "Not applicable"),     2)
  expect_equal(sum(parole$OTHSTAT %in% "Not known/Dont know"),     1)
  expect_equal(sum(is.na(parole$TOTSTAT)),     0)

  expect_equal(sum(parole$ISPNUM %in% "Not applicable"),     12)
  expect_equal(sum(parole$ISPNUM %in% "Not known/Dont know"),     4)
  expect_equal(sum(parole$ISPIN %in% "Not known/Dont know"),      3)
  expect_equal(sum(parole$EMNUM %in% "Not applicable"),      21)
  expect_equal(sum(parole$EMNUM %in% "Not known/Dont know"),      4)
  expect_equal(sum(parole$EMIN %in% "Not known/Dont know"),       4)
  expect_equal(sum(parole$BOOTNUM %in% "Not applicable"),    48)
  expect_equal(sum(parole$BOOTNUM %in% "Not known/Dont know"),    1)
  expect_equal(sum(parole$BOOTIN %in% "Not known/Dont know"),     1)
  expect_equal(sum(parole$LOCJAIL %in% "Not known/Dont know"),     3)
  expect_equal(sum(parole$LOCJAILIN %in% "Not known/Dont know"),  13)
  expect_equal(sum(parole$OTHPAR %in% "Not known/Dont know"),      2)
  expect_equal(sum(parole$ENDOFYEAR %in% "Not known/Dont know"),   2)

  })



test_that("location of missing values is correct - SPSS", {
  expect_true(all(is.na(weimar$X1919_RT_NR_ELIGIBLE_VTRS[c(13, 14, 36)])))

  expect_true(all(which(is.na(crosswalk$UORI)) %in%
                  which(is.na(crosswalk_raw$UORI))))
  expect_true(all(which(is.na(crosswalk$UMSA)) %in%
                    which(is.na(crosswalk_raw$UMSA))))
  expect_true(all(which(is.na(crosswalk$UADD5)) %in%
                    which(is.na(crosswalk_raw$UADD5))))
  expect_true(all(which(is.na(crosswalk$CGOVTYPE)) %in%
                    which(is.na(crosswalk_raw$CGOVTYPE))))
  expect_true(all(which(is.na(crosswalk$FCOUNTY)) %in%
                    which(is.na(crosswalk_raw$FCOUNTY))))
  expect_true(all(which(is.na(crosswalk$FMSA)) %in%
                    which(is.na(crosswalk_raw$FMSA))))
  expect_true(all(which(is.na(crosswalk$UCOUNTY)) %in%
                    which(is.na(crosswalk_raw$UCOUNTY))))
  expect_true(all(which(is.na(crosswalk$UPOPGRP)) %in%
                    which(is.na(crosswalk_raw$UPOPGRP))))
  expect_true(all(which(is.na(crosswalk$CGOVIDNU)) %in%
                    which(is.na(crosswalk_raw$CGOVIDNU))))
  expect_true(all(which(is.na(crosswalk$FSTATE)) %in%
                    which(is.na(crosswalk_raw$FSTATE))))
  expect_true(all(which(is.na(crosswalk$FPLACE)) %in%
                    which(is.na(crosswalk_raw$FPLACE))))
  expect_true(all(which(is.na(crosswalk$FCMSA)) %in%
                    which(is.na(crosswalk_raw$FCMSA))))


  expect_true(all(which(is.na(parole$ENDISREL)) %in%
                    which(is.na(parole_raw$ENDISREL))))
  expect_true(all(which(is.na(parole$ENMANREL)) %in%
                    which(is.na(parole_raw$ENMANREL))))
  expect_true(all(which(is.na(parole$ENREINST)) %in%
                    which(is.na(parole_raw$ENREINST))))
  expect_true(all(which(is.na(parole$OTHEN)) %in%
                    which(is.na(parole_raw$OTHEN))))
  expect_true(all(which(is.na(parole$TOTEN)) %in%
                    which(is.na(parole_raw$TOTEN))))
  expect_true(all(which(is.na(parole$EXCOM)) %in%
                    which(is.na(parole_raw$EXCOM))))
  expect_true(all(which(is.na(parole$EXINCNEW)) %in%
                    which(is.na(parole_raw$EXINCNEW))))
  expect_true(all(which(is.na(parole$EXINCREV)) %in%
                    which(is.na(parole_raw$EXINCREV))))
  expect_true(all(which(is.na(parole$EXINCOTH)) %in%
                    which(is.na(parole_raw$EXINCOTH))))
  expect_true(all(which(is.na(parole$EXTRANS)) %in%
                    which(is.na(parole_raw$EXTRANS))))
  expect_true(all(which(is.na(parole$EXDTH)) %in%
                    which(is.na(parole_raw$EXDTH))))
  expect_true(all(which(is.na(parole$EXOTH)) %in%
                    which(is.na(parole_raw$EXOTH))))
  expect_true(all(which(is.na(parole$TOTEX)) %in%
                    which(is.na(parole_raw$TOTEX))))
  expect_true(all(which(is.na(parole$MALE)) %in%
                    which(is.na(parole_raw$MALE))))
  expect_true(all(which(is.na(parole$FEML)) %in%
                    which(is.na(parole_raw$FEML))))
  expect_true(all(which(is.na(parole$WHITE)) %in%
                    which(is.na(parole_raw$WHITE))))
  expect_true(all(which(is.na(parole$BLACK)) %in%
                    which(is.na(parole_raw$BLACK))))
  expect_true(all(which(is.na(parole$AMINALK)) %in%
                    which(is.na(parole_raw$AMINALK))))
  expect_true(all(which(is.na(parole$ASHAWPAC)) %in%
                    which(is.na(parole_raw$ASHAWPAC))))
  expect_true(all(which(is.na(parole$ADDRACE)) %in%
                    which(is.na(parole_raw$ADDRACE))))
  expect_true(all(which(is.na(parole$HISP)) %in%
                    which(is.na(parole_raw$HISP))))
  expect_true(all(which(is.na(parole$NONHISP)) %in%
                    which(is.na(parole_raw$NONHISP))))
  expect_true(all(which(is.na(parole$MAXYEAR)) %in%
                    which(is.na(parole_raw$MAXYEAR))))
  expect_true(all(which(is.na(parole$MAXMORE)) %in%
                    which(is.na(parole_raw$MAXMORE))))
  expect_true(all(which(is.na(parole$ACTIVE)) %in%
                    which(is.na(parole_raw$ACTIVE))))
  expect_true(all(which(is.na(parole$INACTIVE)) %in%
                    which(is.na(parole_raw$INACTIVE))))
  expect_true(all(which(is.na(parole$ABSND)) %in%
                    which(is.na(parole_raw$ABSND))))
  expect_true(all(which(is.na(parole$OUTSTATE)) %in%
                    which(is.na(parole_raw$OUTSTATE))))
  expect_true(all(which(is.na(parole$OTHSTAT)) %in%
                    which(is.na(parole_raw$OTHSTAT))))
  expect_true(all(which(is.na(parole$ISPNUM)) %in%
                    which(is.na(parole_raw$ISPNUM))))

  expect_true(all(which(is.na(parole$ISPIN)) %in%
                    which(is.na(parole_raw$ISPIN))))
  expect_true(all(which(is.na(parole$EMNUM)) %in%
                    which(is.na(parole_raw$EMNUM))))
  expect_true(all(which(is.na(parole$EMIN)) %in%
                    which(is.na(parole_raw$EMIN))))
  expect_true(all(which(is.na(parole$BOOTNUM)) %in%
                    which(is.na(parole_raw$BOOTNUM))))
  expect_true(all(which(is.na(parole$BOOTIN)) %in%
                    which(is.na(parole_raw$BOOTIN))))
  expect_true(all(which(is.na(parole$LOCJAIL)) %in%
                    which(is.na(parole_raw$LOCJAIL))))
  expect_true(all(which(is.na(parole$LOCJAILIN)) %in%
                    which(is.na(parole_raw$LOCJAILIN))))
  expect_true(all(which(is.na(parole$OTHPAR)) %in%
                    which(is.na(parole_raw$OTHPAR))))
  expect_true(all(which(is.na(parole$ENDOFYEAR)) %in%
                    which(is.na(parole_raw$ENDOFYEAR))))

})
