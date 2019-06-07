/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 34649
 |         WORRY, RISK PERCEPTIONS, AND THE WILLINGNESS TO ACT TO
 |                         REDUCE MEDICAL ERRORS
 |                            (DATASET 0001: )
 |
 |
 | SAS setup sections are provided for the ASCII version of this data
 | collection.  These sections are listed below:
 |
 | PROC FORMAT:  creates user-defined formats for the variables. Formats
 | replace original value codes with value code descriptions. Only
 | variables with user-defined formats are included in this section.
 |
 | DATA:  begins a SAS data step and names an output SAS data set.
 |
 | INFILE:  identifies the input file to be read with the input statement.
 | Users must replace the "data-filename" with a filename specifying the
 | directory on the user's computer system in which the downloaded and
 | unzipped data file is physically located (e.g.,
 | "c:\temp\34649-0001-data.txt").
 |
 | INPUT:  assigns the name, type, decimal specification (if any), and
 | specifies the beginning and ending column locations for each variable
 | in the data file.
 |
 | LABEL:  assigns descriptive labels to all variables. Variable labels
 | and variable names may be identical for some variables.
 |
 | MISSING VALUE RECODES:  sets user-defined numeric missing values to
 | missing as interpreted by the SAS system. Only variables with
 | user-defined missing values are included in this section.
 |
 | If any variables have more than one missing value, they are assigned
 | to the standard missing value of a single period (.) in the statement
 | below. To maintain the original meaning of missing codes, users may want
 | to take advantage of the SAS missing values (the letters A-Z or an
 | underscore preceded by a period).
 |
 | An example of a standard missing value recode:
 |
 |   IF (RELATION = 98 OR RELATION = 99) THEN RELATION = .; 
 |
 | The same example using special missing value recodes:
 |
 |    IF RELATION = 98 THEN RELATION = .A;
 |    IF RELATION = 99 THEN RELATION = .B;
 |
 | FORMAT:  associates the formats created by the PROC FORMAT step with
 | the variables named in the INPUT statement.
 |
 | NOTE:  Users should modify this setup file to suit their specific needs.
 | Sections for PROC FORMAT, FORMAT, and MISSING VALUE RECODES have been
 | commented out (i.e., '/*'). To include these sections in the final SAS
 | setup, users should remove the SAS comment indicators from the desired
 | section(s).
 |
 |------------------------------------------------------------------------*/

* SAS PROC FORMAT;

/*
PROC FORMAT;
  VALUE pre1ffff  0='(0) Not at all serious problem'
                  2='(2) Somewhat serious problem'
                  4='(4) Moderately serious problem'
                  6='(6) Very serious problem' ;
  VALUE post1fff  0='(0) Not at all serious problem'
                  2='(2) Somewhat serious problem'
                  4='(4) Moderately serious problem'
                  6='(6) Very serious problem' ;
  VALUE pre2ffff  0='(0) Not at all serious problem'
                  2='(2) Somewhat serious problem'
                  4='(4) Moderately serious problem'
                  6='(6) Very serious problem' ;
  VALUE post2fff  0='(0) Not at all serious problem'
                  2='(2) Somewhat serious problem'
                  4='(4) Moderately serious problem'
                  6='(6) Very serious problem' ;
  VALUE pre3ffff  0='(0) Do not trust at all' 2='(2) Trust somewhat'
                  4='(4) Trust moderately' 6='(6) Trust completely' ;
  VALUE post3fff  0='(0) Do not trust at all' 2='(2) Trust somewhat'
                  4='(4) Trust moderately' 6='(6) Trust completely' ;
  VALUE pre4ffff  0='(0) Do not trust at all' 2='(2) Trust somewhat'
                  4='(4) Trust moderately' 6='(6) Trust completely' ;
  VALUE post4fff  0='(0) Do not trust at all' 2='(2) Trust somewhat'
                  4='(4) Trust moderately' 6='(6) Trust completely' ;
  VALUE pre5ffff  0='(0) Do not trust at all' 2='(2) Trust somewhat'
                  4='(4) Trust moderately' 6='(6) Trust completely' ;
  VALUE post5fff  0='(0) Do not trust at all' 2='(2) Trust somewhat'
                  4='(4) Trust moderately' 6='(6) Trust completely' ;
  VALUE pre6ffff  0='(0) Cannot rely at all' 2='(2) Can rely somewhat'
                  4='(4) Can rely moderately' 6='(6) Can rely a lot' ;
  VALUE post6fff  0='(0) Cannot rely at all' 2='(2) Can rely somewhat'
                  4='(4) Can rely moderately' 6='(6) Can rely a lot' ;
  VALUE conditif  1='(1) At beginning' 2='(2) At end' ;
  VALUE t1ffffff  0='(0) Not at all worried or concerned'
                  6='(6) Very worried or concerned' ;
  VALUE t2ffffff  0='(0) Not at all worried or concerned'
                  6='(6) Very worried or concerned' ;
  VALUE t3ffffff  0='(0) Not at all worried or concerned'
                  6='(6) Very worried or concerned' ;
  VALUE t4ffffff  0='(0) Not at all worried or concerned'
                  6='(6) Very worried or concerned' ;
  VALUE t5ffffff  0='(0) Not at all worried or concerned'
                  6='(6) Very worried or concerned' ;
  VALUE t6ffffff  0='(0) Not at all worried or concerned'
                  6='(6) Very worried or concerned' ;
  VALUE t7ffffff  0='(0) Not at all worried or concerned'
                  6='(6) Very worried or concerned' ;
  VALUE t8ffffff  0='(0) Not at all worried or concerned'
                  6='(6) Very worried or concerned' ;
  VALUE t9ffffff  0='(0) Not at all worried or concerned'
                  6='(6) Very worried or concerned' ;
  VALUE t10fffff  0='(0) Not at all worried or concerned'
                  6='(6) Very worried or concerned' ;
  VALUE t11fffff  0='(0) Not at all worried or concerned'
                  6='(6) Very worried or concerned' ;
  VALUE t12fffff  0='(0) Not at all worried or concerned'
                  6='(6) Very worried or concerned' ;
  VALUE t13fffff  0='(0) Not at all worried or concerned'
                  6='(6) Very worried or concerned' ;
  VALUE t14fffff  0='(0) Not at all worried or concerned'
                  6='(6) Very worried or concerned' ;
  VALUE t15fffff  1='(1) Yes' 2='(2) No' 3='(3) Don''t know' ;
  VALUE t16fffff  1='(1) Yes' 2='(2) No' 3='(3) Don''t know' ;
  VALUE b1ffffff  0='(0) Not at all likely' 3='(3) Somewhat likely'
                  6='(6) Very likely' ;
  VALUE b2ffffff  0='(0) Not at all likely' 3='(3) Somewhat likely'
                  6='(6) Very likely' ;
  VALUE b3ffffff  0='(0) Not at all likely' 3='(3) Somewhat likely'
                  6='(6) Very likely' ;
  VALUE b4ffffff  0='(0) Not at all likely' 3='(3) Somewhat likely'
                  6='(6) Very likely' ;
  VALUE b5ffffff  0='(0) Not at all likely' 3='(3) Somewhat likely'
                  6='(6) Very likely' ;
  VALUE b6ffffff  0='(0) Not at all likely' 3='(3) Somewhat likely'
                  6='(6) Very likely' ;
  VALUE b7ffffff  0='(0) Not at all likely' 3='(3) Somewhat likely'
                  6='(6) Very likely' ;
  VALUE b8ffffff  0='(0) Not at all likely' 3='(3) Somewhat likely'
                  6='(6) Very likely' ;
  VALUE b9ffffff  0='(0) Not at all likely' 3='(3) Somewhat likely'
                  6='(6) Very likely' ;
  VALUE b10fffff  0='(0) Not at all likely' 3='(3) Somewhat likely'
                  6='(6) Very likely' ;
  VALUE b11fffff  0='(0) Not at all likely' 3='(3) Somewhat likely'
                  6='(6) Very likely' ;
  VALUE b12fffff  0='(0) Not at all likely' 3='(3) Somewhat likely'
                  6='(6) Very likely' ;
  VALUE b13fffff  0='(0) Not at all likely' 3='(3) Somewhat likely'
                  6='(6) Very likely' ;
  VALUE b14fffff  0='(0) Not at all likely' 3='(3) Somewhat likely'
                  6='(6) Very likely' ;
  VALUE c1ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c2ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c3ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c4ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c5ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c6ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c7ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c8ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c9ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c10fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c11fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c12fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c13fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c14fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c15fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c16fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c17fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c18fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c19fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c20fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c21fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c22fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c23fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c24fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c25fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c26fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c27fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c28fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE c29fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE d1ffffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d2ffffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d3ffffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d4ffffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d5ffffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d6ffffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d7ffffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d8ffffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d9ffffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d10fffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d11fffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d12fffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d13fffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d14fffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d15fffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d16fffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d17fffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d18fffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d19fffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d20fffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d21fffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d22fffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d23fffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d24fffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d25fffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d26fffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d27fffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d28fffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE d29fffff  0='(0) Little or no harm' 6='(6) Serious harm or death' ;
  VALUE g1ffffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g2ffffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g3ffffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g4ffffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g5ffffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g6ffffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g7ffffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g8ffffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g9ffffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g10fffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g11fffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g12fffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g13fffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g14fffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g15fffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g16fffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g17fffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g18fffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g19fffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g20fffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g21fffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g22fffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g23fffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g24fffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g25fffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g26fffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g27fffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g28fffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE g29fffff  0='(0) Just chance/no one is to blame'
                  6='(6) Someone at the hospital is to blame' ;
  VALUE k1ffffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k2ffffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k3ffffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k4ffffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k5ffffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k6ffffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k7ffffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k8ffffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k9ffffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k10fffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k11fffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k12fffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k13fffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k14fffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k15fffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k16fffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k17fffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k18fffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k19fffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k20fffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k21fffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k22fffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k23fffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k24fffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k25fffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k26fffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k27fffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k28fffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE k29fffff  0='(0) Patient is unaware of risks'
                  6='(6) Patient is completely aware of risks' ;
  VALUE m1ffffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m2ffffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m3ffffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m4ffffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m5ffffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m6ffffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m7ffffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m8ffffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m9ffffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m10fffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m11fffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m12fffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m13fffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m14fffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m15fffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m16fffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m17fffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m18fffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m19fffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m20fffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m21fffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m22fffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m23fffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m24fffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m25fffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m26fffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m27fffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m28fffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE m29fffff  0='(0) Does not serve as a warning signal'
                  6='(6) Serves as a strong warning signal' ;
  VALUE e1ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e2ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e3ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e4ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e5ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e6ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e7ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e8ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e9ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e10fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e11fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e12fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e13fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e14fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e15fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e16fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e17fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e18fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e19fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e20fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e21fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e22fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e23fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e24fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e25fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e26fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e27fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e28fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE e29fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h1ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h2ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h3ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h4ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h5ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h6ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h7ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h8ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h9ffffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h10fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h11fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h12fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h13fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h14fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h15fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h16fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h17fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h18fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h19fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h20fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h21fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h22fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h23fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h24fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h25fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h26fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h27fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h28fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE h29fffff  0='(0) Not at all likely' 6='(6) Very likely' ;
  VALUE i1ffffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i2ffffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i3ffffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i4ffffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i5ffffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i6ffffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i7ffffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i8ffffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i9ffffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i10fffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i11fffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i12fffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i13fffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i14fffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i15fffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i16fffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i17fffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i18fffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i19fffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i20fffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i21fffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i22fffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i23fffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i24fffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i25fffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i26fffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i27fffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i28fffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE i29fffff  0='(0) Not at all likely' 6='(6) Ver likely' ;
  VALUE j1ffffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j2ffffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j3ffffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j4ffffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j5ffffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j6ffffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j7ffffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j8ffffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j9ffffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j10fffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j11fffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j12fffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j13fffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j14fffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j15fffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j16fffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j17fffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j18fffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j19fffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j20fffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j21fffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j22fffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j23fffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j24fffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j25fffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j26fffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j27fffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j28fffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE j29fffff  0='(0) Old Risk' 6='(6) New Risk' ;
  VALUE l1ffffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l2ffffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l3ffffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l4ffffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l5ffffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l6ffffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l7ffffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l8ffffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l9ffffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l10fffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l11fffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l12fffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l13fffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l14fffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l15fffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l16fffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l17fffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l18fffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l19fffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l20fffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l21fffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l22fffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l23fffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l24fffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l25fffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l26fffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l27fffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l28fffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE l29fffff  0='(0) Should not be worried or concerned'
                  6='(6) Should be very worried or concerned' ;
  VALUE f1ffffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f2ffffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f3ffffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f4ffffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f5ffffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f6ffffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f7ffffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f8ffffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f9ffffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f10fffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f11fffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f12fffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f13fffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f14fffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f15fffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f16fffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f17fffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f18fffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f19fffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f20fffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f21fffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f22fffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f23fffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f24fffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f25fffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f26fffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f27fffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f28fffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE f29fffff  0='(0) Not dreaded at all' 6='(6) Extremely dreaded' ;
  VALUE n1ffffff  0='(0) Not likely to seek out hospital comparisons'
                  6='(6) Very likely to seek out hospital comparisons' ;
  VALUE n2ffffff  0='(0) Regulation is not necessary'
                  6='(6) Regulation is very necessary' ;
  VALUE n3ffffff  0='(0) Not worried or concerned'
                  6='(6) Very worried or concerned' ;
  VALUE n4ffffff  0='(0) Not likely to discuss'
                  6='(6) Very likely to discuss' ;
  VALUE n5ffffff  0='(0) Not likely to change' 6='(6) Very likely to change' ;
  VALUE n6ffffff  0='(0) Not likely to avoid' 6='(6) Very likely to avoid' ;
  VALUE o1ffffff  0='(0) Not at all effective' 6='(6) Very effective' ;
  VALUE o2ffffff  0='(0) Not at all effective' 6='(6) Very effective' ;
  VALUE o3ffffff  0='(0) Not at all effective' 6='(6) Very effective' ;
  VALUE o4ffffff  0='(0) Not at all effective' 6='(6) Very effective' ;
  VALUE o5ffffff  0='(0) Not at all effective' 6='(6) Very effective' ;
  VALUE o6ffffff  0='(0) Not at all effective' 6='(6) Very effective' ;
  VALUE o7ffffff  0='(0) Not at all effective' 6='(6) Very effective' ;
  VALUE o8ffffff  0='(0) Not at all effective' 6='(6) Very effective' ;
  VALUE o9ffffff  0='(0) Not at all effective' 6='(6) Very effective' ;
  VALUE o10fffff  0='(0) Not at all effective' 6='(6) Very effective' ;
  VALUE o11fffff  0='(0) Not at all effective' 6='(6) Very effective' ;
  VALUE o12fffff  0='(0) Not at all effective' 6='(6) Very effective' ;
  VALUE o13fffff  0='(0) Not at all effective' 6='(6) Very effective' ;
  VALUE o14fffff  0='(0) Not at all effective' 6='(6) Very effective' ;
  VALUE o15fffff  0='(0) Not at all effective' 6='(6) Very effective' ;
  VALUE o16fffff  0='(0) Not at all effective' 6='(6) Very effective' ;
  VALUE o17fffff  0='(0) Not at all effective' 6='(6) Very effective' ;
  VALUE o18fffff  0='(0) Not at all effective' 6='(6) Very effective' ;
  VALUE o19fffff  0='(0) Not at all effective' 6='(6) Very effective' ;
  VALUE p1ffffff  0='(0) Risks not preventable at all'
                  6='(6) Risks completely preventable' ;
  VALUE p2ffffff  0='(0) Risks not preventable at all'
                  6='(6) Risks completely preventable' ;
  VALUE p3ffffff  0='(0) Risks not preventable at all'
                  6='(6) Risks completely preventable' ;
  VALUE p4ffffff  0='(0) Risks not preventable at all'
                  6='(6) Risks completely preventable' ;
  VALUE p5ffffff  0='(0) Risks not preventable at all'
                  6='(6) Risks completely preventable' ;
  VALUE p6ffffff  0='(0) Risks not preventable at all'
                  6='(6) Risks completely preventable' ;
  VALUE p7ffffff  0='(0) Risks not preventable at all'
                  6='(6) Risks completely preventable' ;
  VALUE p8ffffff  0='(0) Risks not preventable at all'
                  6='(6) Risks completely preventable' ;
  VALUE p9ffffff  0='(0) Risks not preventable at all'
                  6='(6) Risks completely preventable' ;
  VALUE p10fffff  0='(0) Risks not preventable at all'
                  6='(6) Risks completely preventable' ;
  VALUE p11fffff  0='(0) Risks not preventable at all'
                  6='(6) Risks completely preventable' ;
  VALUE p12fffff  0='(0) Risks not preventable at all'
                  6='(6) Risks completely preventable' ;
  VALUE p13fffff  0='(0) Risks not preventable at all'
                  6='(6) Risks completely preventable' ;
  VALUE p14fffff  0='(0) Risks not preventable at all'
                  6='(6) Risks completely preventable' ;
  VALUE q1ffffff  0='(0) Risks are not dreaded at all'
                  6='(6) Risks are very dreaded' ;
  VALUE q2ffffff  0='(0) Risks are not dreaded at all'
                  6='(6) Risks are very dreaded' ;
  VALUE q3ffffff  0='(0) Risks are not dreaded at all'
                  6='(6) Risks are very dreaded' ;
  VALUE q4ffffff  0='(0) Risks are not dreaded at all'
                  6='(6) Risks are very dreaded' ;
  VALUE q5ffffff  0='(0) Risks are not dreaded at all'
                  6='(6) Risks are very dreaded' ;
  VALUE q6ffffff  0='(0) Risks are not dreaded at all'
                  6='(6) Risks are very dreaded' ;
  VALUE q7ffffff  0='(0) Risks are not dreaded at all'
                  6='(6) Risks are very dreaded' ;
  VALUE q8ffffff  0='(0) Risks are not dreaded at all'
                  6='(6) Risks are very dreaded' ;
  VALUE q9ffffff  0='(0) Risks are not dreaded at all'
                  6='(6) Risks are very dreaded' ;
  VALUE q10fffff  0='(0) Risks are not dreaded at all'
                  6='(6) Risks are very dreaded' ;
  VALUE q11fffff  0='(0) Risks are not dreaded at all'
                  6='(6) Risks are very dreaded' ;
  VALUE q12fffff  0='(0) Risks are not dreaded at all'
                  6='(6) Risks are very dreaded' ;
  VALUE q13fffff  0='(0) Risks are not dreaded at all'
                  6='(6) Risks are very dreaded' ;
  VALUE q14fffff  0='(0) Risks are not dreaded at all'
                  6='(6) Risks are very dreaded' ;
  VALUE r1ffffff  0='(0) Should not be worried or concerned at all'
                  6='(6) Should be very worried or concerned' ;
  VALUE r2ffffff  0='(0) Should not be worried or concerned at all'
                  6='(6) Should be very worried or concerned' ;
  VALUE r3ffffff  0='(0) Should not be worried or concerned at all'
                  6='(6) Should be very worried or concerned' ;
  VALUE r4ffffff  0='(0) Should not be worried or concerned at all'
                  6='(6) Should be very worried or concerned' ;
  VALUE r5ffffff  0='(0) Should not be worried or concerned at all'
                  6='(6) Should be very worried or concerned' ;
  VALUE r6ffffff  0='(0) Should not be worried or concerned at all'
                  6='(6) Should be very worried or concerned' ;
  VALUE r7ffffff  0='(0) Should not be worried or concerned at all'
                  6='(6) Should be very worried or concerned' ;
  VALUE r8ffffff  0='(0) Should not be worried or concerned at all'
                  6='(6) Should be very worried or concerned' ;
  VALUE r9ffffff  0='(0) Should not be worried or concerned at all'
                  6='(6) Should be very worried or concerned' ;
  VALUE r10fffff  0='(0) Should not be worried or concerned at all'
                  6='(6) Should be very worried or concerned' ;
  VALUE r11fffff  0='(0) Should not be worried or concerned at all'
                  6='(6) Should be very worried or concerned' ;
  VALUE r12fffff  0='(0) Should not be worried or concerned at all'
                  6='(6) Should be very worried or concerned' ;
  VALUE r13fffff  0='(0) Should not be worried or concerned at all'
                  6='(6) Should be very worried or concerned' ;
  VALUE r14fffff  0='(0) Should not be worried or concerned at all'
                  6='(6) Should be very worried or concerned' ;
  VALUE bis1ffff  1='(1) Extremely Inaccurately describes me'
                  2='(2) Very Inaccurately describes me'
                  3='(3) Moderately Inaccurately describes me'
                  4='(4) Slightly Inaccurately describes me' 5='(5) ?'
                  6='(6) Slightly Accurately describes me'
                  7='(7) Moderately Accurately describes me'
                  8='(8) Very Accurately describes me'
                  9='(9) Extremely Accurately describes me' ;
  VALUE bashful   1='(1) Extremely Inaccurately describes me'
                  2='(2) Very Inaccurately describes me'
                  3='(3) Moderately Inaccurately describes me'
                  4='(4) Slightly Inaccurately describes me' 5='(5) ?'
                  6='(6) Slightly Accurately describes me'
                  7='(7) Moderately Accurately describes me'
                  8='(8) Very Accurately describes me'
                  9='(9) Extremely Accurately describes me' ;
  VALUE bold      1='(1) Extremely Inaccurately describes me'
                  2='(2) Very Inaccurately describes me'
                  3='(3) Moderately Inaccurately describes me'
                  4='(4) Slightly Inaccurately describes me' 5='(5) ?'
                  6='(6) Slightly Accurately describes me'
                  7='(7) Moderately Accurately describes me'
                  8='(8) Very Accurately describes me'
                  9='(9) Extremely Accurately describes me' ;
  VALUE energ     1='(1) Extremely Inaccurately describes me'
                  2='(2) Very Inaccurately describes me'
                  3='(3) Moderately Inaccurately describes me'
                  4='(4) Slightly Inaccurately describes me' 5='(5) ?'
                  6='(6) Slightly Accurately describes me'
                  7='(7) Moderately Accurately describes me'
                  8='(8) Very Accurately describes me'
                  9='(9) Extremely Accurately describes me' ;
  VALUE envious   1='(1) Extremely Inaccurately describes me'
                  2='(2) Very Inaccurately describes me'
                  3='(3) Moderately Inaccurately describes me'
                  4='(4) Slightly Inaccurately describes me' 5='(5) ?'
                  6='(6) Slightly Accurately describes me'
                  7='(7) Moderately Accurately describes me'
                  8='(8) Very Accurately describes me'
                  9='(9) Extremely Accurately describes me' ;
  VALUE bis2ffff  1='(1) Extremely Inaccurately describes me'
                  2='(2) Very Inaccurately describes me'
                  3='(3) Moderately Inaccurately describes me'
                  4='(4) Slightly Inaccurately describes me' 5='(5) ?'
                  6='(6) Slightly Accurately describes me'
                  7='(7) Moderately Accurately describes me'
                  8='(8) Very Accurately describes me'
                  9='(9) Extremely Accurately describes me' ;
  VALUE extra     1='(1) Extremely Inaccurately describes me'
                  2='(2) Very Inaccurately describes me'
                  3='(3) Moderately Inaccurately describes me'
                  4='(4) Slightly Inaccurately describes me' 5='(5) ?'
                  6='(6) Slightly Accurately describes me'
                  7='(7) Moderately Accurately describes me'
                  8='(8) Very Accurately describes me'
                  9='(9) Extremely Accurately describes me' ;
  VALUE fretful   1='(1) Extremely Inaccurately describes me'
                  2='(2) Very Inaccurately describes me'
                  3='(3) Moderately Inaccurately describes me'
                  4='(4) Slightly Inaccurately describes me' 5='(5) ?'
                  6='(6) Slightly Accurately describes me'
                  7='(7) Moderately Accurately describes me'
                  8='(8) Very Accurately describes me'
                  9='(9) Extremely Accurately describes me' ;
  VALUE bis3ffff  1='(1) Extremely Inaccurately describes me'
                  2='(2) Very Inaccurately describes me'
                  3='(3) Moderately Inaccurately describes me'
                  4='(4) Slightly Inaccurately describes me' 5='(5) ?'
                  6='(6) Slightly Accurately describes me'
                  7='(7) Moderately Accurately describes me'
                  8='(8) Very Accurately describes me'
                  9='(9) Extremely Accurately describes me' ;
  VALUE jealous   1='(1) Extremely Inaccurately describes me'
                  2='(2) Very Inaccurately describes me'
                  3='(3) Moderately Inaccurately describes me'
                  4='(4) Slightly Inaccurately describes me' 5='(5) ?'
                  6='(6) Slightly Accurately describes me'
                  7='(7) Moderately Accurately describes me'
                  8='(8) Very Accurately describes me'
                  9='(9) Extremely Accurately describes me' ;
  VALUE bis4ffff  1='(1) Extremely Inaccurately describes me'
                  2='(2) Very Inaccurately describes me'
                  3='(3) Moderately Inaccurately describes me'
                  4='(4) Slightly Inaccurately describes me' 5='(5) ?'
                  6='(6) Slightly Accurately describes me'
                  7='(7) Moderately Accurately describes me'
                  8='(8) Very Accurately describes me'
                  9='(9) Extremely Accurately describes me' ;
  VALUE moody     1='(1) Extremely Inaccurately describes me'
                  2='(2) Very Inaccurately describes me'
                  3='(3) Moderately Inaccurately describes me'
                  4='(4) Slightly Inaccurately describes me' 5='(5) ?'
                  6='(6) Slightly Accurately describes me'
                  7='(7) Moderately Accurately describes me'
                  8='(8) Very Accurately describes me'
                  9='(9) Extremely Accurately describes me' ;
  VALUE quiet     1='(1) Extremely Inaccurately describes me'
                  2='(2) Very Inaccurately describes me'
                  3='(3) Moderately Inaccurately describes me'
                  4='(4) Slightly Inaccurately describes me' 5='(5) ?'
                  6='(6) Slightly Accurately describes me'
                  7='(7) Moderately Accurately describes me'
                  8='(8) Very Accurately describes me'
                  9='(9) Extremely Accurately describes me' ;
  VALUE bis5ffff  1='(1) Extremely Inaccurately describes me'
                  2='(2) Very Inaccurately describes me'
                  3='(3) Moderately Inaccurately describes me'
                  4='(4) Slightly Inaccurately describes me' 5='(5) ?'
                  6='(6) Slightly Accurately describes me'
                  7='(7) Moderately Accurately describes me'
                  8='(8) Very Accurately describes me'
                  9='(9) Extremely Accurately describes me' ;
  VALUE relaxed   1='(1) Extremely Inaccurately describes me'
                  2='(2) Very Inaccurately describes me'
                  3='(3) Moderately Inaccurately describes me'
                  4='(4) Slightly Inaccurately describes me' 5='(5) ?'
                  6='(6) Slightly Accurately describes me'
                  7='(7) Moderately Accurately describes me'
                  8='(8) Very Accurately describes me'
                  9='(9) Extremely Accurately describes me' ;
  VALUE shy       1='(1) Extremely Inaccurately describes me'
                  2='(2) Very Inaccurately describes me'
                  3='(3) Moderately Inaccurately describes me'
                  4='(4) Slightly Inaccurately describes me' 5='(5) ?'
                  6='(6) Slightly Accurately describes me'
                  7='(7) Moderately Accurately describes me'
                  8='(8) Very Accurately describes me'
                  9='(9) Extremely Accurately describes me' ;
  VALUE bis6ffff  1='(1) Extremely Inaccurately describes me'
                  2='(2) Very Inaccurately describes me'
                  3='(3) Moderately Inaccurately describes me'
                  4='(4) Slightly Inaccurately describes me' 5='(5) ?'
                  6='(6) Slightly Accurately describes me'
                  7='(7) Moderately Accurately describes me'
                  8='(8) Very Accurately describes me'
                  9='(9) Extremely Accurately describes me' ;
  VALUE talka     1='(1) Extremely Inaccurately describes me'
                  2='(2) Very Inaccurately describes me'
                  3='(3) Moderately Inaccurately describes me'
                  4='(4) Slightly Inaccurately describes me' 5='(5) ?'
                  6='(6) Slightly Accurately describes me'
                  7='(7) Moderately Accurately describes me'
                  8='(8) Very Accurately describes me'
                  9='(9) Extremely Accurately describes me' ;
  VALUE tempe     1='(1) Extremely Inaccurately describes me'
                  2='(2) Very Inaccurately describes me'
                  3='(3) Moderately Inaccurately describes me'
                  4='(4) Slightly Inaccurately describes me' 5='(5) ?'
                  6='(6) Slightly Accurately describes me'
                  7='(7) Moderately Accurately describes me'
                  8='(8) Very Accurately describes me'
                  9='(9) Extremely Accurately describes me' ;
  VALUE touchy    1='(1) Extremely Inaccurately describes me'
                  2='(2) Very Inaccurately describes me'
                  3='(3) Moderately Inaccurately describes me'
                  4='(4) Slightly Inaccurately describes me' 5='(5) ?'
                  6='(6) Slightly Accurately describes me'
                  7='(7) Moderately Accurately describes me'
                  8='(8) Very Accurately describes me'
                  9='(9) Extremely Accurately describes me' ;
  VALUE bis7ffff  1='(1) Extremely Inaccurately describes me'
                  2='(2) Very Inaccurately describes me'
                  3='(3) Moderately Inaccurately describes me'
                  4='(4) Slightly Inaccurately describes me' 5='(5) ?'
                  6='(6) Slightly Accurately describes me'
                  7='(7) Moderately Accurately describes me'
                  8='(8) Very Accurately describes me'
                  9='(9) Extremely Accurately describes me' ;
  VALUE unenv     1='(1) Extremely Inaccurately describes me'
                  2='(2) Very Inaccurately describes me'
                  3='(3) Moderately Inaccurately describes me'
                  4='(4) Slightly Inaccurately describes me' 5='(5) ?'
                  6='(6) Slightly Accurately describes me'
                  7='(7) Moderately Accurately describes me'
                  8='(8) Very Accurately describes me'
                  9='(9) Extremely Accurately describes me' ;
  VALUE withd     1='(1) Extremely Inaccurately describes me'
                  2='(2) Very Inaccurately describes me'
                  3='(3) Moderately Inaccurately describes me'
                  4='(4) Slightly Inaccurately describes me' 5='(5) ?'
                  6='(6) Slightly Accurately describes me'
                  7='(7) Moderately Accurately describes me'
                  8='(8) Very Accurately describes me'
                  9='(9) Extremely Accurately describes me' ;
  VALUE marital   1='(1) Single' 2='(2) Married' 3='(3) Divorced'
                  4='(4) Widowed' ;
  VALUE gender    1='(1) Female' 2='(2) Male' ;
  VALUE race      1='(1) Black' 2='(2) Asian/Pacific' 3='(3) Caucasian'
                  4='(4) Hispanic' 5='(5) Native American' 6='(6) Other' ;
  VALUE readerr   1='(1) Never' 2='(2) Seldom' 3='(3) Somewhat often'
                  4='(4) Very often' ;
  VALUE health    1='(1) Poor' 2='(2) Fair' 3='(3) Good' 4='(4) Excellent' ;
  VALUE hospnext  1='(1) Not at all likely' 2='(2) Somewhat likely'
                  3='(3) Moderately likely' 4='(4) Very likely' ;
  VALUE educ      1='(1) Less than high school' 2='(2) High school graduate'
                  3='(3) Some college' 4='(4) College graduate'
                  5='(5) Graduate degree' ;
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA;
INFILE "data-filename" LRECL=723;
INPUT
       SUBJ 1-4                VERSION $5-6
        PRE1 7                  POST1 8                 PRE2 9
        POST2 10                PRE3 11                 POST3 12
        PRE4 13                 POST4 14                PRE5 15
        POST5 16                PRE6 17                 POST6 18
        ANCHOR 19-23            CONDITION 24            APPENDIC 25-29
        ALZHEIM 30-35           AUTOACC 36-42           CANCER 43-49
        DIABETES 50-55          HEARTDIS 56-62          AIDS 63-68
        HOMICIDE 69-75          FLU 76-81               KIDNEY 82-87
        MEDERROR 88-94          PARKINS 95-100          STROKE 101-107
        SUICIDE 108-114         T1 115                  T2 116
        T3 117                  T4 118                  T5 119
        T6 120                  T7 121                  T8 122
        T9 123                  T10 124                 T11 125
        T12 126                 T13 127                 T14 128
        T15 129                 T16 130                 T17 $131-237
        B1 238-239              B2 240                  B3 241
        B4 242                  B5 243                  B6 244
        B7 245                  B8 246                  B9 247
        B10 248                 B11 249                 B12 250
        B13 251                 B14 252                 SET $253
        C1 254                  C2 255                  C3 256
        C4 257                  C5 258                  C6 259
        C7 260                  C8 261                  C9 262
        C10 263                 C11 264                 C12 265
        C13 266                 C14 267                 C15 268
        C16 269                 C17 270                 C18 271
        C19 272                 C20 273                 C21 274
        C22 275                 C23 276                 C24 277
        C25 278                 C26 279                 C27 280
        C28 281                 C29 282                 D1 283
        D2 284                  D3 285                  D4 286
        D5 287                  D6 288                  D7 289
        D8 290                  D9 291                  D10 292
        D11 293                 D12 294                 D13 295
        D14 296                 D15 297                 D16 298
        D17 299                 D18 300                 D19 301
        D20 302                 D21 303                 D22 304
        D23 305                 D24 306                 D25 307
        D26 308                 D27 309                 D28 310
        D29 311                 G1 312                  G2 313
        G3 314                  G4 315                  G5 316
        G6 317                  G7 318                  G8 319
        G9 320                  G10 321                 G11 322
        G12 323                 G13 324                 G14 325
        G15 326                 G16 327                 G17 328
        G18 329                 G19 330                 G20 331
        G21 332                 G22 333                 G23 334
        G24 335                 G25 336                 G26 337
        G27 338                 G28 339                 G29 340
        K1 341                  K2 342                  K3 343
        K4 344                  K5 345                  K6 346
        K7 347                  K8 348                  K9 349
        K10 350                 K11 351                 K12 352
        K13 353                 K14 354                 K15 355
        K16 356                 K17 357                 K18 358
        K19 359                 K20 360                 K21 361
        K22 362                 K23 363                 K24 364
        K25 365                 K26 366                 K27 367
        K28 368                 K29 369                 M1 370
        M2 371                  M3 372                  M4 373
        M5 374                  M6 375                  M7 376
        M8 377                  M9 378                  M10 379
        M11 380                 M12 381                 M13 382
        M14 383                 M15 384                 M16 385
        M17 386                 M18 387                 M19 388
        M20 389                 M21 390                 M22 391
        M23 392                 M24 393                 M25 394
        M26 395                 M27 396                 M28 397
        M29 398                 E1 399                  E2 400
        E3 401                  E4 402                  E5 403
        E6 404                  E7 405                  E8 406
        E9 407                  E10 408                 E11 409
        E12 410                 E13 411                 E14 412
        E15 413                 E16 414                 E17 415
        E18 416                 E19 417                 E20 418
        E21 419                 E22 420                 E23 421
        E24 422                 E25 423                 E26 424
        E27 425                 E28 426                 E29 427
        H1 428                  H2 429                  H3 430
        H4 431                  H5 432                  H6 433
        H7 434                  H8 435                  H9 436
        H10 437                 H11 438                 H12 439
        H13 440                 H14 441                 H15 442
        H16 443                 H17 444                 H18 445
        H19 446                 H20 447                 H21 448
        H22 449                 H23 450                 H24 451
        H25 452                 H26 453                 H27 454
        H28 455                 H29 456                 I1 457
        I2 458                  I3 459                  I4 460
        I5 461                  I6 462                  I7 463
        I8 464                  I9 465                  I10 466
        I11 467                 I12 468                 I13 469
        I14 470                 I15 471                 I16 472
        I17 473                 I18 474                 I19 475
        I20 476                 I21 477                 I22 478
        I23 479                 I24 480                 I25 481
        I26 482                 I27 483                 I28 484
        I29 485                 J1 486                  J2 487
        J3 488                  J4 489                  J5 490
        J6 491                  J7 492                  J8 493
        J9 494                  J10 495                 J11 496
        J12 497                 J13 498                 J14 499
        J15 500                 J16 501                 J17 502
        J18 503                 J19 504                 J20 505
        J21 506                 J22 507                 J23 508
        J24 509                 J25 510                 J26 511
        J27 512                 J28 513                 J29 514
        L1 515                  L2 516                  L3 517
        L4 518                  L5 519                  L6 520
        L7 521                  L8 522                  L9 523
        L10 524                 L11 525                 L12 526
        L13 527                 L14 528                 L15 529
        L16 530                 L17 531                 L18 532
        L19 533                 L20 534                 L21 535
        L22 536                 L23 537                 L24 538
        L25 539                 L26 540                 L27 541
        L28 542                 L29 543                 F1 544
        F2 545                  F3 546                  F4 547
        F5 548                  F6 549                  F7 550
        F8 551                  F9 552                  F10 553
        F11 554                 F12 555                 F13 556
        F14 557                 F15 558                 F16 559
        F17 560                 F18 561                 F19 562
        F20 563                 F21 564                 F22 565
        F23 566                 F24 567                 F25 568
        F26 569                 F27 570                 F28 571
        F29 572                 N1 573                  N2 574
        N3 575                  N4 576                  N5 577
        N6 578                  O1 579                  O2 580
        O3 581                  O4 582                  O5 583
        O6 584                  O7 585                  O8 586
        O9 587                  O10 588                 O11 589
        O12 590                 O13 591                 O14 592
        O15 593                 O16 594                 O17 595
        O18 596                 O19 597                 P1 598
        P2 599                  P3 600                  P4 601
        P5 602                  P6 603                  P7 604
        P8 605                  P9 606                  P10 607
        P11 608                 P12 609                 P13 610
        P14 611                 Q1 612                  Q2 613
        Q3 614                  Q4 615                  Q5 616
        Q6 617                  Q7 618                  Q8 619
        Q9 620                  Q10 621                 Q11 622
        Q12 623                 Q13 624                 Q14 625
        R1 626                  R2 627                  R3 628
        R4 629                  R5 630                  R6 631
        R7 632                  R8 633                  R9 634
        R10 635                 R11 636                 R12 637
        R13 638                 R14 639                 BIS1 640
        BASHFUL 641             BOLD 642                ENERG 643
        ENVIOUS 644             BIS2 645                EXTRA 646
        FRETFUL 647             BIS3 648                JEALOUS 649
        BIS4 650                MOODY 651               QUIET 652
        BIS5 653                RELAXED 654             SHY 655
        BIS6 656                TALKA 657               TEMPE 658
        TOUCHY 659              BIS7 660                UNENV 661
        WITHD 662               AGE 663-664             MARITAL 665
        GENDER 666              RACE 667                READERR 668
        HEALTH 669              SEEDOC 670-671          HOSPPAST 672-673
        FAMHOSP 674-675         HOSPNEXT 676            EDUC 677
        CHILDREN 678            BIS 679-693 .13         EXTRAVER 694-708 .13
        STABLE 709-723 .13      ;


* SAS LABEL STATEMENT;

LABEL 
   SUBJ    = 'Subject identification number' 
   VERSION = 'Version' 
   PRE1    = 'Overall, how serious a problem is patient safety in U.S. healthcare today?' 
   POST1   = 'How serious a problem is patient safety' 
   PRE2    = 'Overall, how serious a problem is medical errors in U.S. healthcare today?' 
   POST2   = 'How serious a problem is medical errors' 
   PRE3    = 'How much do you trust your doctor not to make a medical error that harms you?' 
   POST3   = 'Trust your doctor not to make medical error' 
   PRE4    = 'How much do you trust medical staff at your local hospital not to make a medical error that harms 
you?' 
   POST4   = 'Trust med. staff at hospital not to make error' 
   PRE5    = 'How much to you trust medical system in general not to make a medial error that harms you?' 
   POST5   = 'Trust med system in general not to make error' 
   PRE6    = 'How much can you rely on own knowledge and alertness to protect you from medical errors that can 
harm you?' 
   POST6   = 'Rely on own knowledge to protect you' 
   ANCHOR  = 'Anchor: 400 or 40,000' 
   CONDITION= 'Placement of estimated deaths condition' 
   APPENDIC= 'Estimated # of deaths from Appendicitis' 
   ALZHEIM = 'Estimated # of deaths from Alzheimer''s disease' 
   AUTOACC = 'Estimated # of deaths from Automobile accidents' 
   CANCER  = 'Estimated # of deaths from Cancers' 
   DIABETES= 'Estimated # of deaths from Diabetes' 
   HEARTDIS= 'Estimated # of deaths from Heart diseases' 
   AIDS    = 'Estimated # of deaths from HIV/AIDS' 
   HOMICIDE= 'Estimated # of deaths from Homocide' 
   FLU     = 'Estimated # of deaths from Influenza and pneumonia' 
   KIDNEY  = 'Estimated # of deaths from Kidney disease' 
   MEDERROR= 'Estimated # of deaths from Medical errors' 
   PARKINS = 'Estimated # of deaths from Parkinson''s disease' 
   STROKE  = 'Estimated # of deaths from Stroke' 
   SUICIDE = 'Estimated # of deaths from Suicide' 
   T1      = 'Worry: Alzheimers' 
   T2      = 'Worry: Appendicitis' 
   T3      = 'Worry: Auto accidents' 
   T4      = 'Worry: Cancers' 
   T5      = 'Worry: Diabetes' 
   T6      = 'Worry: Heart Disease' 
   T7      = 'Worry: HIV/AIDS' 
   T8      = 'Worry: Homicide' 
   T9      = 'Worry: Influenze /pneumonia' 
   T10     = 'Worry: Kidney disease' 
   T11     = 'Worry: Medical errors' 
   T12     = 'Worry: Parkisons disease' 
   T13     = 'Worry: Stroke' 
   T14     = 'Worry: Suicide' 
   T15     = 'Have you/family experience medical error' 
   T16     = 'If so, were you harmed as a result' 
   T17     = 'What was medical error?' 
   B1      = 'Make sure doctor in charge at hosp' 
   B2      = 'Make sure know abt allergies' 
   B3      = 'Look for hosp experienced in procedure' 
   B4      = 'Ask hosp workers if washed hands' 
   B5      = 'Ask which hosp has fewer med errors' 
   B6      = 'Ask abt surgeon''s experience' 
   B7      = 'Mark body where surgery will occur' 
   B8      = 'Confirm med & dose w/staff' 
   B9      = 'Ask someone to be advocate' 
   B10     = 'Choose hosp w/ med tracking system' 
   B11     = 'Make sure all docs know abt your meds' 
   B12     = 'Make sure docs know abt over-counter meds' 
   B13     = 'Ask abt test results at hosp' 
   B14     = 'Choice based on comparative errors report' 
   SET     = 'Set of scale items: A or B' 
   C1      = 'Likely: Med error in surgery' 
   C2      = 'Likely: Error in prescrip med' 
   C3      = 'Likely: Error in lab test report' 
   C4      = 'Likely: Error in diagnosis made' 
   C5      = 'Likely: Unnecessary surgery performed' 
   C6      = 'Likely: Wrong prescrip med given' 
   C7      = 'Likely: Tx not most effective one' 
   C8      = 'Likely: Too high dose of prescrip med' 
   C9      = 'Likely: Unnecessary lab tests' 
   C10     = 'Likely: Routine test not done early' 
   C11     = 'Likely: Too high dose when IV fails' 
   C12     = 'Likely: Drug allergy overlooked' 
   C13     = 'Likely: Unnecessary x-rays' 
   C14     = 'Likely: Surgery on wrong limb' 
   C15     = 'Likely: Lab test results never reported' 
   C16     = 'Likely: Instrument lef inside patient' 
   C17     = 'Likely: Med condition overlooked' 
   C18     = 'Likely: Not given prescribed meds' 
   C19     = 'Likely: Surgery on wrong patient' 
   C20     = 'Likely: Invasive cardiac procedure unnecessary' 
   C21     = 'Likely: Patient given wrong diet' 
   C22     = 'Likely: Too low dose of prescrip med' 
   C23     = 'Likely: MRI machine malfunctions' 
   C24     = 'Likely: Wrong IV med given' 
   C25     = 'Likely: Too high dose of chemo' 
   C26     = 'Likely: wrong blood type transfused' 
   C27     = 'Likely: Biopsy mistake leads to false postive' 
   C28     = 'Likely: Patient sent home too quickly' 
   C29     = 'Likely: Unconscious patient too high dose' 
   D1      = 'Dread: Med error in surgery' 
   D2      = 'Dread: Error in prescrip med' 
   D3      = 'Dread: Error in lab test report' 
   D4      = 'Dread: Error in diagnosis made' 
   D5      = 'Dread: Unnecessary surgery performed' 
   D6      = 'Dread: Wrong prescrip med given' 
   D7      = 'Dread: Tx not most effective one' 
   D8      = 'Dread: Too high dose of prescrip med' 
   D9      = 'Dread: Unnecessary lab tests' 
   D10     = 'Dread: Routine test not done early' 
   D11     = 'Dread: Too high dose when IV fails' 
   D12     = 'Dread: Drug allergy overlooked' 
   D13     = 'Dread: Unnecessary x-rays' 
   D14     = 'Dread: Surgery on wrong limb' 
   D15     = 'Dread: Lab test results never reported' 
   D16     = 'Dread: Instrument lef inside patient' 
   D17     = 'Dread: Med condition overlooked' 
   D18     = 'Dread: Not given prescribed meds' 
   D19     = 'Dread: Surgery on wrong patient' 
   D20     = 'Dread: Invasive cardiac procedure unnecessary' 
   D21     = 'Dread: Patient given wrong diet' 
   D22     = 'Dread: Too low dose of prescrip med' 
   D23     = 'Dread: MRI machine malfunctions' 
   D24     = 'Dread: Wrong IV med given' 
   D25     = 'Dread: Too high dose of chemo' 
   D26     = 'Dread: wrong blood type transfused' 
   D27     = 'Dread: Biopsy mistake leads to false postive' 
   D28     = 'Dread: Patient sent home too quickly' 
   D29     = 'Dread: Unconscious patient too high dose' 
   G1      = 'Blame: Med error in surgery' 
   G2      = 'Blame: Error in prescrip med' 
   G3      = 'Blame: Error in lab test report' 
   G4      = 'Blame: Error in diagnosis made' 
   G5      = 'Blame: Unnecessary surgery performed' 
   G6      = 'Blame: Wrong prescrip med given' 
   G7      = 'Blame: Tx not most effective one' 
   G8      = 'Blame: Too high dose of prescrip med' 
   G9      = 'Blame: Unnecessary lab tests' 
   G10     = 'Blame: Routine test not done early' 
   G11     = 'Blame: Too high dose when IV fails' 
   G12     = 'Blame: Drug allergy overlooked' 
   G13     = 'Blame: Unnecessary x-rays' 
   G14     = 'Blame: Surgery on wrong limb' 
   G15     = 'Blame: Lab test results never reported' 
   G16     = 'Blame: Instrument lef inside patient' 
   G17     = 'Blame: Med condition overlooked' 
   G18     = 'Blame: Not given prescribed meds' 
   G19     = 'Blame: Surgery on wrong patient' 
   G20     = 'Blame: Invasive cardiac procedure unnecessary' 
   G21     = 'Blame: Patient given wrong diet' 
   G22     = 'Blame: Too low dose of prescrip med' 
   G23     = 'Blame: MRI machine malfunctions' 
   G24     = 'Blame: Wrong IV med given' 
   G25     = 'Blame: Too high dose of chemo' 
   G26     = 'Blame: wrong blood type transfused' 
   G27     = 'Blame: Biopsy mistake leads to false postive' 
   G28     = 'Blame: Patient sent home too quickly' 
   G29     = 'Blame: Unconscious patient too high dose' 
   K1      = 'Aware: Med error in surgery' 
   K2      = 'Aware: Error in prescrip med' 
   K3      = 'Aware: Error in lab test report' 
   K4      = 'Aware: Error in diagnosis made' 
   K5      = 'Aware: Unnecessary surgery performed' 
   K6      = 'Aware: Wrong prescrip med given' 
   K7      = 'Aware: Tx not most effective one' 
   K8      = 'Aware: Too high dose of prescrip med' 
   K9      = 'Aware: Unnecessary lab tests' 
   K10     = 'Aware: Routine test not done early' 
   K11     = 'Aware: Too high dose when IV fails' 
   K12     = 'Aware: Drug allergy overlooked' 
   K13     = 'Aware: Unnecessary x-rays' 
   K14     = 'Aware: Surgery on wrong limb' 
   K15     = 'Aware: Lab test results never reported' 
   K16     = 'Aware: Instrument lef inside patient' 
   K17     = 'Aware: Med condition overlooked' 
   K18     = 'Aware: Not given prescribed meds' 
   K19     = 'Aware: Surgery on wrong patient' 
   K20     = 'Aware: Invasive cardiac procedure unnecessary' 
   K21     = 'Aware: Patient given wrong diet' 
   K22     = 'Aware: Too low dose of prescrip med' 
   K23     = 'Aware: MRI machine malfunctions' 
   K24     = 'Aware: Wrong IV med given' 
   K25     = 'Aware: Too high dose of chemo' 
   K26     = 'Aware: wrong blood type transfused' 
   K27     = 'Aware: Biopsy mistake leads to false postive' 
   K28     = 'Aware: Patient sent home too quickly' 
   K29     = 'Aware: Unconscious patient too high dose' 
   M1      = 'Signal: Med error in surgery' 
   M2      = 'Signal: Error in prescrip med' 
   M3      = 'Signal: Error in lab test report' 
   M4      = 'Signal: Error in diagnosis made' 
   M5      = 'Signal: Unnecessary surgery performed' 
   M6      = 'Signal: Wrong prescrip med given' 
   M7      = 'Signal: Tx not most effective one' 
   M8      = 'Signal: Too high dose of prescrip med' 
   M9      = 'Signal: Unnecessary lab tests' 
   M10     = 'Signal: Routine test not done early' 
   M11     = 'Signal: Too high dose when IV fails' 
   M12     = 'Signal: Drug allergy overlooked' 
   M13     = 'Signal: Unnecessary x-rays' 
   M14     = 'Signal: Surgery on wrong limb' 
   M15     = 'Signal: Lab test results never reported' 
   M16     = 'Signal: Instrument left inside patient' 
   M17     = 'Signal: Med condition overlooked' 
   M18     = 'Signal: Not given prescribed meds' 
   M19     = 'Signal: Surgery on wrong patient' 
   M20     = 'Signal: Invasive cardiac procedure unnecessary' 
   M21     = 'Signal: Patient given wrong diet' 
   M22     = 'Signal: Too low dose of prescrip med' 
   M23     = 'Signal: MRI machine malfunctions' 
   M24     = 'Signal: Wrong IV med given' 
   M25     = 'Signal: Too high dose of chemo' 
   M26     = 'Signal: wrong blood type transfused' 
   M27     = 'Signal: Biopsy mistake leads to false postive' 
   M28     = 'Signal: Patient sent home too quickly' 
   M29     = 'Signal: Unconscious patient too high dose' 
   E1      = 'Observe: Med error in surgery' 
   E2      = 'Observe: Error in prescrip med' 
   E3      = 'Observe: Error in lab test report' 
   E4      = 'Observe: Error in diagnosis made' 
   E5      = 'Observe: Unnecessary surgery performed' 
   E6      = 'Observe: Wrong prescrip med given' 
   E7      = 'Observe: Tx not most effective one' 
   E8      = 'Observe: Too high dose of prescrip med' 
   E9      = 'Observe: Unnecessary lab tests' 
   E10     = 'Observe: Routine test not done early' 
   E11     = 'Observe: Too high dose when IV fails' 
   E12     = 'Observe: Drug allergy overlooked' 
   E13     = 'Observe: Unnecessary x-rays' 
   E14     = 'Observe: Surgery on wrong limb' 
   E15     = 'Observe: Lab test results never reported' 
   E16     = 'Observe: Instrument lef inside patient' 
   E17     = 'Observe: Med condition overlooked' 
   E18     = 'Observe: Not given prescribed meds' 
   E19     = 'Observe: Surgery on wrong patient' 
   E20     = 'Observe: Invasive cardiac procedure unnecessary' 
   E21     = 'Observe: Patient given wrong diet' 
   E22     = 'Observe: Too low dose of prescrip med' 
   E23     = 'Observe: MRI machine malfunctions' 
   E24     = 'Observe: Wrong IV med given' 
   E25     = 'Observe: Too high dose of chemo' 
   E26     = 'Observe: wrong blood type transfused' 
   E27     = 'Observe: Biopsy mistake leads to false postive' 
   E28     = 'Observe: Patient sent home too quickly' 
   E29     = 'Observe: Unconscious patient too high dose' 
   H1      = 'SelfPrev: Med error in surgery' 
   H2      = 'SelfPrev: Error in prescrip med' 
   H3      = 'SelfPrev: Error in lab test report' 
   H4      = 'SelfPrev: Error in diagnosis made' 
   H5      = 'SelfPrev: Unnecessary surgery performed' 
   H6      = 'SelfPrev: Wrong prescrip med given' 
   H7      = 'SelfPrev: Tx not most effective one' 
   H8      = 'SelfPrev: Too high dose of prescrip med' 
   H9      = 'SelfPrev: Unnecessary lab tests' 
   H10     = 'SelfPrev: Routine test not done early' 
   H11     = 'SelfPrev: Too high dose when IV fails' 
   H12     = 'SelfPrev: Drug allergy overlooked' 
   H13     = 'SelfPrev: Unnecessary x-rays' 
   H14     = 'SelfPrev: Surgery on wrong limb' 
   H15     = 'SelfPrev: Lab test results never reported' 
   H16     = 'SelfPrev: Instrument lef inside patient' 
   H17     = 'SelfPrev: Med condition overlooked' 
   H18     = 'SelfPrev: Not given prescribed meds' 
   H19     = 'SelfPrev: Surgery on wrong patient' 
   H20     = 'SelfPrev: Invasive cardiac procedure unnecessary' 
   H21     = 'SelfPrev: Patient given wrong diet' 
   H22     = 'SelfPrev: Too low dose of prescrip med' 
   H23     = 'SelfPrev: MRI machine malfunctions' 
   H24     = 'SelfPrev: Wrong IV med given' 
   H25     = 'SelfPrev: Too high dose of chemo' 
   H26     = 'SelfPrev: wrong blood type transfused' 
   H27     = 'SelfPrev: Biopsy mistake leads to false postive' 
   H28     = 'SelfPrev: Patient sent home too quickly' 
   H29     = 'SelfPrev: Unconscious patient too high dose' 
   I1      = 'OthPrev: Med error in surgery' 
   I2      = 'OthPrev: Error in prescrip med' 
   I3      = 'OthPrev: Error in lab test report' 
   I4      = 'OthPrev: Error in diagnosis made' 
   I5      = 'OthPrev: Unnecessary surgery performed' 
   I6      = 'OthPrev: Wrong prescrip med given' 
   I7      = 'OthPrev: Tx not most effective one' 
   I8      = 'OthPrev: Too high dose of prescrip med' 
   I9      = 'OthPrev: Unnecessary lab tests' 
   I10     = 'OthPrev: Routine test not done early' 
   I11     = 'OthPrev: Too high dose when IV fails' 
   I12     = 'OthPrev: Drug allergy overlooked' 
   I13     = 'OthPrev: Unnecessary x-rays' 
   I14     = 'OthPrev: Surgery on wrong limb' 
   I15     = 'OthPrev: Lab test results never reported' 
   I16     = 'OthPrev: Instrument lef inside patient' 
   I17     = 'OthPrev: Med condition overlooked' 
   I18     = 'OthPrev: Not given prescribed meds' 
   I19     = 'OthPrev: Surgery on wrong patient' 
   I20     = 'OthPrev: Invasive cardiac procedure unnecessary' 
   I21     = 'OthPrev: Patient given wrong diet' 
   I22     = 'OthPrev: Too low dose of prescrip med' 
   I23     = 'OthPrev: MRI machine malfunctions' 
   I24     = 'OthPrev: Wrong IV med given' 
   I25     = 'OthPrev: Too high dose of chemo' 
   I26     = 'OthPrev: wrong blood type transfused' 
   I27     = 'OthPrev: Biopsy mistake leads to false postive' 
   I28     = 'OthPrev: Patient sent home too quickly' 
   I29     = 'OthPrev: Unconscious patient too high dose' 
   J1      = 'NewRisk: Med error in surgery' 
   J2      = 'NewRisk: Error in prescrip med' 
   J3      = 'NewRisk: Error in lab test report' 
   J4      = 'NewRisk: Error in diagnosis made' 
   J5      = 'NewRisk: Unnecessary surgery performed' 
   J6      = 'NewRisk: Wrong prescrip med given' 
   J7      = 'NewRisk: Tx not most effective one' 
   J8      = 'NewRisk: Too high dose of prescrip med' 
   J9      = 'NewRisk: Unnecessary lab tests' 
   J10     = 'NewRisk: Routine test not done early' 
   J11     = 'NewRisk: Too high dose when IV fails' 
   J12     = 'NewRisk: Drug allergy overlooked' 
   J13     = 'NewRisk: Unnecessary x-rays' 
   J14     = 'NewRisk: Surgery on wrong limb' 
   J15     = 'NewRisk: Lab test results never reported' 
   J16     = 'NewRisk: Instrument lef inside patient' 
   J17     = 'NewRisk: Med condition overlooked' 
   J18     = 'NewRisk: Not given prescribed meds' 
   J19     = 'NewRisk: Surgery on wrong patient' 
   J20     = 'NewRisk: Invasive cardiac procedure unnecessary' 
   J21     = 'NewRisk: Patient given wrong diet' 
   J22     = 'NewRisk: Too low dose of prescrip med' 
   J23     = 'NewRisk: MRI machine malfunctions' 
   J24     = 'NewRisk: Wrong IV med given' 
   J25     = 'NewRisk: Too high dose of chemo' 
   J26     = 'NewRisk: wrong blood type transfused' 
   J27     = 'NewRisk: Biopsy mistake leads to false postive' 
   J28     = 'NewRisk: Patient sent home too quickly' 
   J29     = 'NewRisk: Unconscious patient too high dose' 
   L1      = 'Worry: Med error in surgery' 
   L2      = 'Worry: Error in prescrip med' 
   L3      = 'Worry: Error in lab test report' 
   L4      = 'Worry: Error in diagnosis made' 
   L5      = 'Worry: Unnecessary surgery performed' 
   L6      = 'Worry: Wrong prescrip med given' 
   L7      = 'Worry: Tx not most effective one' 
   L8      = 'Worry: Too high dose of prescrip med' 
   L9      = 'Worry: Unnecessary lab tests' 
   L10     = 'Worry: Routine test not done early' 
   L11     = 'Worry: Too high dose when IV fails' 
   L12     = 'Worry: Drug allergy overlooked' 
   L13     = 'Worry: Unnecessary x-rays' 
   L14     = 'Worry: Surgery on wrong limb' 
   L15     = 'Worry: Lab test results never reported' 
   L16     = 'Worry: Instrument lef inside patient' 
   L17     = 'Worry: Med condition overlooked' 
   L18     = 'Worry: Not given prescribed meds' 
   L19     = 'Worry: Surgery on wrong patient' 
   L20     = 'Worry: Invasive cardiac procedure unnecessary' 
   L21     = 'Worry: Patient given wrong diet' 
   L22     = 'Worry: Too low dose of prescrip med' 
   L23     = 'Worry: MRI machine malfunctions' 
   L24     = 'Worry: Wrong IV med given' 
   L25     = 'Worry: Too high dose of chemo' 
   L26     = 'Worry: wrong blood type transfused' 
   L27     = 'Worry: Biopsy mistake leads to false postive' 
   L28     = 'Worry: Patient sent home too quickly' 
   L29     = 'Worry: Unconscious patient too high dose' 
   F1      = 'Dread: Med error in surgery' 
   F2      = 'Dread: Error in prescrip med' 
   F3      = 'Dread: Error in lab test report' 
   F4      = 'Dread: Error in diagnosis made' 
   F5      = 'Dread: Unnecessary surgery performed' 
   F6      = 'Dread: Wrong prescrip med given' 
   F7      = 'Dread: Tx not most effective one' 
   F8      = 'Dread: Too high dose of prescrip med' 
   F9      = 'Dread: Unnecessary lab tests' 
   F10     = 'Dread: Routine test not done early' 
   F11     = 'Dread: Too high dose when IV fails' 
   F12     = 'Dread: Drug allergy overlooked' 
   F13     = 'Dread: Unnecessary x-rays' 
   F14     = 'Dread: Surgery on wrong limb' 
   F15     = 'Dread: Lab test results never reported' 
   F16     = 'Dread: Instrument lef inside patient' 
   F17     = 'Dread: Med condition overlooked' 
   F18     = 'Dread: Not given prescribed meds' 
   F19     = 'Dread: Surgery on wrong patient' 
   F20     = 'Dread: Invasive cardiac procedure unnecessary' 
   F21     = 'Dread: Patient given wrong diet' 
   F22     = 'Dread: Too low dose of prescrip med' 
   F23     = 'Dread: MRI machine malfunctions' 
   F24     = 'Dread: Wrong IV med given' 
   F25     = 'Dread: Too high dose of chemo' 
   F26     = 'Dread: wrong blood type transfused' 
   F27     = 'Dread: Biopsy mistake leads to false postive' 
   F28     = 'Dread: Patient sent home too quickly' 
   F29     = 'Dread: Unconscious patient too high dose' 
   N1      = 'Seek hosp comparisons on freq/type of med errors' 
   N2      = 'Govt regulations necessary to reduce med errors' 
   N3      = 'Worried about med errors if go to hosp' 
   N4      = 'Discuss med errors w/doc' 
   N5      = 'Change hsp if found out hosp had above avg errors' 
   N6      = 'Avoid any hosp if found out uour hosp had above avg errors' 
   O1      = 'Make sure doctor in charge at hosp' 
   O2      = 'Make sure know abt allergies' 
   O3      = 'Look for hosp experienced in procedure' 
   O4      = 'Become friends w/hosp staff' 
   O5      = 'Ask hosp workers if washed hands' 
   O6      = 'Ask which hosp has fewer med errors' 
   O7      = 'Avoiding hosp food' 
   O8      = 'Ask abt surgeon''s experience' 
   O9      = 'Choose hosp based on its experience w/your surgery' 
   O10     = 'Mark body where surgery will occur' 
   O11     = 'Keeping a positive attitude' 
   O12     = 'Confirm med & dose w/staff' 
   O13     = 'Mask someone to be advocate' 
   O14     = 'Be alert to what is happening at hosp' 
   O15     = 'Choose hosp w/ med tracking system' 
   O16     = 'Make sure all docs know abt your meds' 
   O17     = 'Make sure docs know abt over-counter meds' 
   O18     = 'Ask abt test results at hosp' 
   O19     = 'Choice based on comparative errors report' 
   P1      = 'Prevent: Nuclear reactor' 
   P2      = 'Prevent: medical error in hosp' 
   P3      = 'Prevent: Firefighting' 
   P4      = 'Prevent: having surgery in hosp' 
   P5      = 'Prevent: Respiratory arrest because send home too soon' 
   P6      = 'Prevent: Power lawn mover' 
   P7      = 'Prevent: Getting a prescrip med in hosp' 
   P8      = 'Prevent: Microwave ovens' 
   P9      = 'Prevent: Getting lab test in hosp' 
   P10     = 'Prevent: IV pump fails & patient dies' 
   P11     = 'Prevent: Bicycle riding' 
   P12     = 'Prevent: Getting diagnosis in hosp' 
   P13     = 'Prevent: Eating genet mod foods' 
   P14     = 'Prevent: Going into hosp for treatment' 
   Q1      = 'Dread: Nuclear reactor' 
   Q2      = 'Dread: medical error in hosp' 
   Q3      = 'Dread: Firefighting' 
   Q4      = 'Dread: having surgery in hosp' 
   Q5      = 'Dread: Respiratory arrest because send home too soon' 
   Q6      = 'Dread: Power lawn mover' 
   Q7      = 'Dread: Getting a prescrip med in hosp' 
   Q8      = 'Dread: Microwave ovens' 
   Q9      = 'Dread: Getting lab test in hosp' 
   Q10     = 'Dread: IV pump fails & patient dies' 
   Q11     = 'Dread: Bicycle riding' 
   Q12     = 'Dread: Getting diagnosis in hosp' 
   Q13     = 'Dread: Eating genet mod foods' 
   Q14     = 'Dread: Going into hosp for treatment' 
   R1      = 'Worry: Nuclear reactor' 
   R2      = 'Worry: medical error in hosp' 
   R3      = 'Worry: Firefighting' 
   R4      = 'Worry: having surgery in hosp' 
   R5      = 'Worry: Respiratory arrest because send home too soon' 
   R6      = 'Worry: Power lawn mover' 
   R7      = 'Worry: Getting a prescrip med in hosp' 
   R8      = 'Worry: Microwave ovens' 
   R9      = 'Worry: Getting lab test in hosp' 
   R10     = 'Worry: IV pump fails & patient dies' 
   R11     = 'Worry: Bicycle riding' 
   R12     = 'Worry: Getting diagnosis in hosp' 
   R13     = 'Worry: Eating genet mod foods' 
   R14     = 'Worry: Going into hosp for treatment' 
   BIS1    = 'BIS1' 
   BASHFUL = 'BASHFUL' 
   BOLD    = 'BOLD' 
   ENERG   = 'ENERG' 
   ENVIOUS = 'ENVIOUS' 
   BIS2    = 'BIS2' 
   EXTRA   = 'EXTRA' 
   FRETFUL = 'FRETFUL' 
   BIS3    = 'BIS3' 
   JEALOUS = 'JEALOUS' 
   BIS4    = 'BIS4' 
   MOODY   = 'MOODY' 
   QUIET   = 'QUIET' 
   BIS5    = 'BIS5' 
   RELAXED = 'RELAXED' 
   SHY     = 'SHY' 
   BIS6    = 'BIS6' 
   TALKA   = 'TALKA' 
   TEMPE   = 'TEMPE' 
   TOUCHY  = 'TOUCHY' 
   BIS7    = 'BIS7' 
   UNENV   = 'UNENV' 
   WITHD   = 'WITHD' 
   AGE     = 'Subject age' 
   MARITAL = 'Marital status' 
   GENDER  = 'Subject gender' 
   RACE    = 'Subject ethnic identity' 
   READERR = 'How often have you read or heard about medical errors' 
   HEALTH  = 'How would you decribe you current health?' 
   SEEDOC  = 'How many times have you been to see a doctor in the paste year?' 
   HOSPPAST= 'How many nights, if any, have you spent in the hospital in the past year?' 
   FAMHOSP = 'How many nights, if any, have family members spent in the hospital in the past year?' 
   HOSPNEXT= 'How likely are you to spend a night in the hospital in the coming year?' 
   EDUC    = 'Your highest education level' 
   CHILDREN= 'How many children, if any, do you have at home?' 
   BIS     = 'BIS (Behavioral Inhibition scale)' 
   EXTRAVER= 'Extraversion scale' 
   STABLE  = 'Stability scale' 
        ; 


* SAS FORMAT STATEMENT;

/*
  FORMAT PRE1 pre1ffff. POST1 post1fff. PRE2 pre2ffff.
         POST2 post2fff. PRE3 pre3ffff. POST3 post3fff.
         PRE4 pre4ffff. POST4 post4fff. PRE5 pre5ffff.
         POST5 post5fff. PRE6 pre6ffff. POST6 post6fff.
         CONDITION conditif. T1 t1ffffff. T2 t2ffffff.
         T3 t3ffffff. T4 t4ffffff. T5 t5ffffff.
         T6 t6ffffff. T7 t7ffffff. T8 t8ffffff.
         T9 t9ffffff. T10 t10fffff. T11 t11fffff.
         T12 t12fffff. T13 t13fffff. T14 t14fffff.
         T15 t15fffff. T16 t16fffff. B1 b1ffffff.
         B2 b2ffffff. B3 b3ffffff. B4 b4ffffff.
         B5 b5ffffff. B6 b6ffffff. B7 b7ffffff.
         B8 b8ffffff. B9 b9ffffff. B10 b10fffff.
         B11 b11fffff. B12 b12fffff. B13 b13fffff.
         B14 b14fffff. C1 c1ffffff. C2 c2ffffff.
         C3 c3ffffff. C4 c4ffffff. C5 c5ffffff.
         C6 c6ffffff. C7 c7ffffff. C8 c8ffffff.
         C9 c9ffffff. C10 c10fffff. C11 c11fffff.
         C12 c12fffff. C13 c13fffff. C14 c14fffff.
         C15 c15fffff. C16 c16fffff. C17 c17fffff.
         C18 c18fffff. C19 c19fffff. C20 c20fffff.
         C21 c21fffff. C22 c22fffff. C23 c23fffff.
         C24 c24fffff. C25 c25fffff. C26 c26fffff.
         C27 c27fffff. C28 c28fffff. C29 c29fffff.
         D1 d1ffffff. D2 d2ffffff. D3 d3ffffff.
         D4 d4ffffff. D5 d5ffffff. D6 d6ffffff.
         D7 d7ffffff. D8 d8ffffff. D9 d9ffffff.
         D10 d10fffff. D11 d11fffff. D12 d12fffff.
         D13 d13fffff. D14 d14fffff. D15 d15fffff.
         D16 d16fffff. D17 d17fffff. D18 d18fffff.
         D19 d19fffff. D20 d20fffff. D21 d21fffff.
         D22 d22fffff. D23 d23fffff. D24 d24fffff.
         D25 d25fffff. D26 d26fffff. D27 d27fffff.
         D28 d28fffff. D29 d29fffff. G1 g1ffffff.
         G2 g2ffffff. G3 g3ffffff. G4 g4ffffff.
         G5 g5ffffff. G6 g6ffffff. G7 g7ffffff.
         G8 g8ffffff. G9 g9ffffff. G10 g10fffff.
         G11 g11fffff. G12 g12fffff. G13 g13fffff.
         G14 g14fffff. G15 g15fffff. G16 g16fffff.
         G17 g17fffff. G18 g18fffff. G19 g19fffff.
         G20 g20fffff. G21 g21fffff. G22 g22fffff.
         G23 g23fffff. G24 g24fffff. G25 g25fffff.
         G26 g26fffff. G27 g27fffff. G28 g28fffff.
         G29 g29fffff. K1 k1ffffff. K2 k2ffffff.
         K3 k3ffffff. K4 k4ffffff. K5 k5ffffff.
         K6 k6ffffff. K7 k7ffffff. K8 k8ffffff.
         K9 k9ffffff. K10 k10fffff. K11 k11fffff.
         K12 k12fffff. K13 k13fffff. K14 k14fffff.
         K15 k15fffff. K16 k16fffff. K17 k17fffff.
         K18 k18fffff. K19 k19fffff. K20 k20fffff.
         K21 k21fffff. K22 k22fffff. K23 k23fffff.
         K24 k24fffff. K25 k25fffff. K26 k26fffff.
         K27 k27fffff. K28 k28fffff. K29 k29fffff.
         M1 m1ffffff. M2 m2ffffff. M3 m3ffffff.
         M4 m4ffffff. M5 m5ffffff. M6 m6ffffff.
         M7 m7ffffff. M8 m8ffffff. M9 m9ffffff.
         M10 m10fffff. M11 m11fffff. M12 m12fffff.
         M13 m13fffff. M14 m14fffff. M15 m15fffff.
         M16 m16fffff. M17 m17fffff. M18 m18fffff.
         M19 m19fffff. M20 m20fffff. M21 m21fffff.
         M22 m22fffff. M23 m23fffff. M24 m24fffff.
         M25 m25fffff. M26 m26fffff. M27 m27fffff.
         M28 m28fffff. M29 m29fffff. E1 e1ffffff.
         E2 e2ffffff. E3 e3ffffff. E4 e4ffffff.
         E5 e5ffffff. E6 e6ffffff. E7 e7ffffff.
         E8 e8ffffff. E9 e9ffffff. E10 e10fffff.
         E11 e11fffff. E12 e12fffff. E13 e13fffff.
         E14 e14fffff. E15 e15fffff. E16 e16fffff.
         E17 e17fffff. E18 e18fffff. E19 e19fffff.
         E20 e20fffff. E21 e21fffff. E22 e22fffff.
         E23 e23fffff. E24 e24fffff. E25 e25fffff.
         E26 e26fffff. E27 e27fffff. E28 e28fffff.
         E29 e29fffff. H1 h1ffffff. H2 h2ffffff.
         H3 h3ffffff. H4 h4ffffff. H5 h5ffffff.
         H6 h6ffffff. H7 h7ffffff. H8 h8ffffff.
         H9 h9ffffff. H10 h10fffff. H11 h11fffff.
         H12 h12fffff. H13 h13fffff. H14 h14fffff.
         H15 h15fffff. H16 h16fffff. H17 h17fffff.
         H18 h18fffff. H19 h19fffff. H20 h20fffff.
         H21 h21fffff. H22 h22fffff. H23 h23fffff.
         H24 h24fffff. H25 h25fffff. H26 h26fffff.
         H27 h27fffff. H28 h28fffff. H29 h29fffff.
         I1 i1ffffff. I2 i2ffffff. I3 i3ffffff.
         I4 i4ffffff. I5 i5ffffff. I6 i6ffffff.
         I7 i7ffffff. I8 i8ffffff. I9 i9ffffff.
         I10 i10fffff. I11 i11fffff. I12 i12fffff.
         I13 i13fffff. I14 i14fffff. I15 i15fffff.
         I16 i16fffff. I17 i17fffff. I18 i18fffff.
         I19 i19fffff. I20 i20fffff. I21 i21fffff.
         I22 i22fffff. I23 i23fffff. I24 i24fffff.
         I25 i25fffff. I26 i26fffff. I27 i27fffff.
         I28 i28fffff. I29 i29fffff. J1 j1ffffff.
         J2 j2ffffff. J3 j3ffffff. J4 j4ffffff.
         J5 j5ffffff. J6 j6ffffff. J7 j7ffffff.
         J8 j8ffffff. J9 j9ffffff. J10 j10fffff.
         J11 j11fffff. J12 j12fffff. J13 j13fffff.
         J14 j14fffff. J15 j15fffff. J16 j16fffff.
         J17 j17fffff. J18 j18fffff. J19 j19fffff.
         J20 j20fffff. J21 j21fffff. J22 j22fffff.
         J23 j23fffff. J24 j24fffff. J25 j25fffff.
         J26 j26fffff. J27 j27fffff. J28 j28fffff.
         J29 j29fffff. L1 l1ffffff. L2 l2ffffff.
         L3 l3ffffff. L4 l4ffffff. L5 l5ffffff.
         L6 l6ffffff. L7 l7ffffff. L8 l8ffffff.
         L9 l9ffffff. L10 l10fffff. L11 l11fffff.
         L12 l12fffff. L13 l13fffff. L14 l14fffff.
         L15 l15fffff. L16 l16fffff. L17 l17fffff.
         L18 l18fffff. L19 l19fffff. L20 l20fffff.
         L21 l21fffff. L22 l22fffff. L23 l23fffff.
         L24 l24fffff. L25 l25fffff. L26 l26fffff.
         L27 l27fffff. L28 l28fffff. L29 l29fffff.
         F1 f1ffffff. F2 f2ffffff. F3 f3ffffff.
         F4 f4ffffff. F5 f5ffffff. F6 f6ffffff.
         F7 f7ffffff. F8 f8ffffff. F9 f9ffffff.
         F10 f10fffff. F11 f11fffff. F12 f12fffff.
         F13 f13fffff. F14 f14fffff. F15 f15fffff.
         F16 f16fffff. F17 f17fffff. F18 f18fffff.
         F19 f19fffff. F20 f20fffff. F21 f21fffff.
         F22 f22fffff. F23 f23fffff. F24 f24fffff.
         F25 f25fffff. F26 f26fffff. F27 f27fffff.
         F28 f28fffff. F29 f29fffff. N1 n1ffffff.
         N2 n2ffffff. N3 n3ffffff. N4 n4ffffff.
         N5 n5ffffff. N6 n6ffffff. O1 o1ffffff.
         O2 o2ffffff. O3 o3ffffff. O4 o4ffffff.
         O5 o5ffffff. O6 o6ffffff. O7 o7ffffff.
         O8 o8ffffff. O9 o9ffffff. O10 o10fffff.
         O11 o11fffff. O12 o12fffff. O13 o13fffff.
         O14 o14fffff. O15 o15fffff. O16 o16fffff.
         O17 o17fffff. O18 o18fffff. O19 o19fffff.
         P1 p1ffffff. P2 p2ffffff. P3 p3ffffff.
         P4 p4ffffff. P5 p5ffffff. P6 p6ffffff.
         P7 p7ffffff. P8 p8ffffff. P9 p9ffffff.
         P10 p10fffff. P11 p11fffff. P12 p12fffff.
         P13 p13fffff. P14 p14fffff. Q1 q1ffffff.
         Q2 q2ffffff. Q3 q3ffffff. Q4 q4ffffff.
         Q5 q5ffffff. Q6 q6ffffff. Q7 q7ffffff.
         Q8 q8ffffff. Q9 q9ffffff. Q10 q10fffff.
         Q11 q11fffff. Q12 q12fffff. Q13 q13fffff.
         Q14 q14fffff. R1 r1ffffff. R2 r2ffffff.
         R3 r3ffffff. R4 r4ffffff. R5 r5ffffff.
         R6 r6ffffff. R7 r7ffffff. R8 r8ffffff.
         R9 r9ffffff. R10 r10fffff. R11 r11fffff.
         R12 r12fffff. R13 r13fffff. R14 r14fffff.
         BIS1 bis1ffff. BASHFUL bashful. BOLD bold.
         ENERG energ. ENVIOUS envious. BIS2 bis2ffff.
         EXTRA extra. FRETFUL fretful. BIS3 bis3ffff.
         JEALOUS jealous. BIS4 bis4ffff. MOODY moody.
         QUIET quiet. BIS5 bis5ffff. RELAXED relaxed.
         SHY shy. BIS6 bis6ffff. TALKA talka.
         TEMPE tempe. TOUCHY touchy. BIS7 bis7ffff.
         UNENV unenv. WITHD withd. MARITAL marital.
         GENDER gender. RACE race. READERR readerr.
         HEALTH health. HOSPNEXT hospnext. EDUC educ.
          ;
*/

RUN ;
