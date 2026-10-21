# SPSS VARIABLE LABELS and SAS LABEL / ATTRIB statements, read token by
# token so the labels can be laid out in any of the ways the languages allow.

names_of <- function(lines, fileext, positions = "  V1 1  V2 2  V3 3") {
  if (fileext == ".sps") {
    setup <- temp_file(c("DATA LIST FILE = 'x'", positions, ".", lines, "EXECUTE."), ".sps")
  } else {
    setup <- temp_file(c("DATA x;", "INFILE 'x';", "INPUT", positions, ";", lines, "RUN;"), ".sas")
  }
  parse_setup(setup)$setup$column_name
}

test_that("SPSS labels can share lines, use / and start on the command's line", {
  expect_equal(names_of(c("VARIABLE LABELS", "  V1 'Age'  V2 'Income' V3 'Sex'", "."), ".sps"),
               c("Age", "Income", "Sex"))
  expect_equal(names_of(c("VARIABLE LABELS V1 'Age' /V2 'Income' /V3 'Sex' ."), ".sps"),
               c("Age", "Income", "Sex"))
  expect_equal(names_of(c("VAR LABELS V1 \"Age\"", "  V2 \"Income\"", "  V3 \"Sex\"."), ".sps"),
               c("Age", "Income", "Sex"))
})

test_that("SPSS labels continued with + are joined", {
  expect_equal(names_of(c("VARIABLE LABELS", "  V1 'Age in ' +", "  'years'",
                          "  V2 'Income in '", "  + 'dollars'", "  V3 'Sex'", "."), ".sps"),
               c("Age_in_years", "Income_in_dollars", "Sex"))
})

test_that("a note that starts with VARIABLE LABELS isn't the command", {
  expect_equal(names_of(c("VARIABLE LABELS assigns labels; 'V1' is the first.",
                          "VARIABLE LABELS", "  V1 'Age'", "."), ".sps"),
               c("Age", "V2", "V3"))
})

test_that("SAS LABEL statements can be on one line, over blank lines, in any case", {
  expect_equal(names_of("LABEL V1 = 'Age' V2 = 'Income' V3 = 'Sex';", ".sas"),
               c("Age", "Income", "Sex"))
  expect_equal(names_of(c("label", "  V1 = 'Age'", "", "  V2 = \"Income\"", "", "  V3 = 'Sex'", ";"),
                        ".sas"),
               c("Age", "Income", "Sex"))
})

test_that("a ; inside a SAS label doesn't end the LABEL statement", {
  # As in the 2017 YRBS SADC file, whose labels after one like this were lost
  expect_equal(names_of(c("LABEL", "  V1 = \"Pills; an IUD\"", "  V2 = 'Income'",
                          "  V3 = 'Sex'", ";"), ".sas"),
               c("Pills_an_IUD", "Income", "Sex"))
  expect_equal(split_outside_quotes("a = 'x; y'; b = 2", ";"), c("a = 'x; y'", " b = 2"))
})

test_that("a SAS label continued on the next line is read in full", {
  expect_equal(names_of(c("LABEL", "  V1 = 'Inmates housed in local facilities,",
                          "MALE'", "  V2 = 'Inmates housed in local facilities,",
                          "FEMALE'", "  V3 = 'Sex'", ";"), ".sas"),
               c("Inmates_housed_in_local_facilities_MALE",
                 "Inmates_housed_in_local_facilities_FEMALE", "Sex"))
  # The real file this comes from: the two columns used to get the same name
  prisoners <- parse_setup(test_path("testdata", "prisoners_sas.zip"))$setup
  expect_equal(prisoners$column_name[prisoners$column_number %in% c("LFM", "LFF")],
               paste0("INMATES_UNDER_JURISDICTION_HOUSED_IN_LOCAL_FACILITIES_OPERATED_BY",
                      "_COUNTY_OR_OTHER_LOCAL_AUTHORITY_", c("MALE", "FEMALE")))
  china <- parse_setup(test_path("testdata", "china_2002.sas"))$setup
  expect_match(china$column_name[china$column_number == "V3_318"], "10_000_yuan$")
})

test_that("SAS ATTRIB gives labels whatever else it sets", {
  expect_equal(names_of(c("ATTRIB V1 LABEL = 'Age' FORMAT = V1F.",
                          "       V2 LENGTH = 8 LABEL = \"Income\"",
                          "       V3 LABEL='Sex';"), ".sas"),
               c("Age", "Income", "Sex"))
})

test_that("name_from_label() keeps the meaning of symbols", {
  expect_equal(name_from_label(c("Age < 5", "Income > $10", "50% or more", "A + B @ C", "...")),
               c("Age_under_5", "Income_over_dollar_10", "X50_percent_or_more",
                 "A_plus_B_at_C", ""))
})

# Found by the independent review of the label reader

test_that("a SAS LABEL statement after another on the same line is read", {
  expect_equal(names_of(c("LENGTH V1 8; LABEL V1 = 'One' V2 = 'Two';", "LABEL V3 = 'Three';"),
                        ".sas"),
               c("One", "Two", "Three"))
})

test_that("a SAS LABEL statement inside a /* */ comment isn't used", {
  expect_equal(names_of(c("/*", "LABEL V1 = 'bad';", "*/", "LABEL V2 = 'Two';"), ".sas"),
               c("V1", "Two", "V3"))
})

test_that("SAS ATTRIB gives a label to every column listed before it", {
  expect_equal(names_of("ATTRIB V1 V2 LABEL = 'Shared' FORMAT = F8. V3 LABEL = 'Three';", ".sas"),
               c("Shared", "Shared_V2", "Three"))
})

test_that("an SPSS label can be on the line after its column's name", {
  expect_equal(names_of(c("VARIABLE LABELS V1", "'Age'", "/V2 'Income'", "."), ".sps"),
               c("Age", "Income", "V3"))
})
