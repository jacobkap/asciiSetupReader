context("parse-value-labels")

crosswalk <- system.file("testdata", "crosswalk.sps",
                         package = "asciiSetupReader")
parole <- system.file("testdata", "parole_survey.sps",
                      package = "asciiSetupReader")
ucr1985 <- system.file("testdata", "1985_UCR_offenses_known.sps",
                       package = "asciiSetupReader")
ucr1986 <- system.file("testdata", "1986_UCR_offenses_known.sps",
                       package = "asciiSetupReader")
ucr2000 <- system.file("testdata", "2000_UCR_offenses_known.sps",
                       package = "asciiSetupReader")
ucr2006 <- system.file("testdata", "2006_UCR_offenses_known.sps",
                       package = "asciiSetupReader")
sac <- system.file("testdata", "sacramento.sps",
                   package = "asciiSetupReader")
sex_offender <- system.file("testdata", "sex_offender_notification.sps",
                            package = "asciiSetupReader")
ucr1960 <- system.file("testdata", "ucr1960.sps",
                       package = "asciiSetupReader")
weimar <- system.file("testdata", "weimar.sps",
                      package = "asciiSetupReader")
acs <- system.file("testdata", "acs.sps",
                   package = "asciiSetupReader")
nibrs <- system.file("testdata", "nibrs_2000_batch_header1.sps",
                     package = "asciiSetupReader")
prisoners <- system.file("testdata", "prisoners.sps",
                         package = "asciiSetupReader")
SHR1987 <- system.file("testdata", "1987_SHR.sps",
                       package = "asciiSetupReader")
SHR1988 <- system.file("testdata", "1988_SHR.sps",
                       package = "asciiSetupReader")



crosswalk <- parse_spss(crosswalk)
parole <- parse_spss(parole)
ucr1985 <- parse_spss(ucr1985)
ucr1986 <- parse_spss(ucr1986)
ucr2000 <- parse_spss(ucr2000)
ucr2006 <- parse_spss(ucr2006)
sac <- parse_spss(sac)
sex_offender <- parse_spss(sex_offender)
ucr1960 <- parse_spss(ucr1960)
weimar <- parse_spss(weimar)
acs <- parse_spss(acs)
nibrs <- parse_spss(nibrs)
prisoners <- parse_spss(prisoners)
SHR1987 <- parse_spss(SHR1987)
SHR1988 <- parse_spss(SHR1988)

crosswalk_values <- parse_value_labels(crosswalk)
parole_values <- parse_value_labels(parole)
ucr1985_values <- parse_value_labels(ucr1985)
ucr1986_values <- parse_value_labels(ucr1986)
ucr2000_values <- parse_value_labels(ucr2000)
ucr2006_values <- parse_value_labels(ucr2006)
sac_values <- parse_value_labels(sac)
sex_offender_values <- parse_value_labels(sex_offender)
ucr1960_values <- parse_value_labels(ucr1960)
weimar_values <- parse_value_labels(weimar)
acs_values <- parse_value_labels(acs)
nibrs_values <- parse_value_labels(nibrs)
prisoners_values <- parse_value_labels(prisoners)

test_that("Number of value label columns are correct", {

  expect_equal(length(crosswalk_values[[2]]), 19)
  expect_equal(length(parole_values[[2]]), 51)
#  expect_equal(length(ucr1985_values[[2]]), )
#  expect_equal(length(ucr1986_values[[2]]), )
#  expect_equal(length(ucr2000_values[[2]]), )
  #  expect_equal(length(ucr2006_values[[2]]), )
#  expect_equal(length(sac_values[[2]]), )
  expect_equal(length(sex_offender_values[[2]]), 32)
#  expect_equal(length(ucr1960_values[[2]]), )
  expect_equal(length(weimar_values[[2]]), 0)
  expect_equal(length(acs_values[[2]]), 4)
  expect_equal(length(nibrs_values[[2]]), 9)
#  expect_equal(length(prisoners_values[[2]]), )

})


test_that("parse value labels is silent", {

  expect_silent(parse_value_labels(crosswalk))
  expect_silent(parse_value_labels(parole))
  expect_silent(parse_value_labels(ucr1985))
  expect_silent(parse_value_labels(ucr1986))
  expect_silent(parse_value_labels(ucr2000))
  expect_silent(parse_value_labels(ucr2006))
  expect_silent(parse_value_labels(sac))
  expect_silent(parse_value_labels(sex_offender))
  expect_silent(parse_value_labels(ucr1960))
  expect_silent(parse_value_labels(weimar))
  expect_silent(parse_value_labels(acs))
  expect_silent(parse_value_labels(nibrs))
  expect_silent(parse_value_labels(prisoners))

  expect_silent(parse_value_labels(SHR1987))
  expect_silent(parse_value_labels(SHR1987))

})
