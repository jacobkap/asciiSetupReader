context("Make sure missing values are removed")

test_that("number of missing values is correct - SPSS", {
  expect_equal(sum(is.na(weimar$X1919_RT_NR_ELIGIBLE_VTRS)), 3)

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


