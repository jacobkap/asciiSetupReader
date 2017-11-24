context("All value labels are present")

dataset_name <- system.file("extdata", "example_data.txt",
                            package = "asciiSetupReader")
sps_name <- system.file("extdata", "example_setup.sps",
                        package = "asciiSetupReader")
example <- spss_ascii_reader(dataset_name = dataset_name,
                             sps_name = sps_name)

test_that("All labels are assigned correctly - SHR", {

  expect_true(all(c('Single victim/single offender',
                    'Single victim/unknown offender(s)',
                    'Single victim/multiple offenders',
                    'Multiple victims/single offender',
                    'Multiple victims/multiple offenders',
                    'Multiple victims/unknown offender(s)') %in% unique(example$SITUATION)))
  expect_true(all(c("Female", "Male", "Unknown") %in% unique(example$VICTIM_1_SEX)))
  expect_true(all(c("Hispanic or Latino", "Not Hispanic or Latino",
                    "Unknown or not reported") %in% unique(example$VICTIM_1_ETHNIC_ORIGIN)))
  expect_true(all(c("Asian", "Black or African American", "American Indian or Alaska Native", "Unknown",
                    "White") %in% unique(example$VICTIM_1_RACE)))
  expect_true(all(c("7 days old to 364 days old", "Birth to 6 days old", "Unknown") %in%
                    unique(example$VICTIM_1_AGE)))
  expect_true(all(c("Female", "Male", "Unknown") %in% unique(example$OFFENDER_1_SEX)))
  expect_true(all(c("Asian", "Black or African American", "American Indian or Alaska Native",
                    "Unknown",
                    "White") %in% unique(example$OFFENDER_1_RACE)))

  expect_true(all(c("Firearm, type not stated", "Handgun - pistol, revolver, etc",
                    "Rifle", "Shotgun", "Other gun", "Knife or cutting instrument",
                    "Blunt object - hammer, club, etc", "Personal weapons, includes beating",
                    "Poison - does not include gas", "Pushed or thrown out window",
                    "Explosives", "Fire", "Narcotics or drugs, sleeping pills",
                    "Drowning", "Strangulation - hanging", "Asphyxiation - includes death by gas",
                    "Other or type unknown") %in%
                    unique(example$OFFENDER_1_WEAPON)))

  expect_true(all(c('Felon attacked police officer',
                    'Felon attacked fellow police officer',
                    'Felon attacked a civilian',
                    'Felon attempted flight from a crime',
                    'Felon killed in commission of a crime',
                    'Felon resisted arrest',
                    'Not enough information to determine') %in%
                    unique(example$OFFENDER_1_SUB_CIRCUMSTANCE)))

  expect_true(all(c('Acquaintance', 'Boyfriend', 'Brother', 'Common-law husband',
                    'Common-law wife', 'Daughter', 'Employee',
                    'Employer', 'Father', 'Friend', 'Girlfriend',
                    'Homosexual relationship', 'Husband', 'In-law', 'Mother',
                    'Neighbor', 'Other family', 'Other - known to victim', 'Stepdaughter',
                    'Stepfather', 'Sister', 'Stepmother', 'Son',
                    'Stepson', 'Stranger', 'Relationship not determined', 'Wife',
                    'Ex-husband', 'Ex-wife') %in%
                    unique(example$OFFENDER_1_RELATIONSHIP_TO_FIRST_VICTIM)))


})
