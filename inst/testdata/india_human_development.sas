/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 36151
 |          INDIA HUMAN DEVELOPMENT SURVEY-II (IHDS-II), 2011-12
 |                       (DATASET 0001: INDIVIDUAL)
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
 | "c:\temp\36151-0001-data.txt").
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
VALUE ch6fffff  1='(1) Rarely/Never 1' 2='(2) Sometimes 2' 3='(3) Often 3';
VALUE ed11ffff  0='(0) No 0' 1='(1) College 1' 2='(2) Technical 2';
VALUE ws4fffff  0='(000) Physical scientists 0' 1='(001) Physical sci tech 1'
                2='(002) Engineers 2' 3='(003) Eng. tech 3' 4='(004) Air/ship officers 4'
                5='(005) Life scientists 5' 6='(006) Life science tech 6' 7='(007) Physicians 7'
                8='(008) Nursing 8' 9='(009) Other scientific 9' 10='(010) Statisticians 10'
                11='(011) Economists 11' 12='(012) Accountants 12' 13='(013) Social scientists 13'
                14='(014) Lawyers 14' 15='(015) Teachers 15' 16='(016) Journalists 16'
                17='(017) Artists 17' 18='(018) Performers 18' 19='(019) Professional nec 19'
                20='(020) Elected officials 20' 21='(021) Govt officials 21'
                22='(022) Mgr Whsl/retail 22' 23='(023) Mgr finance 23' 24='(024) Mgr manf 24'
                25='(025) Mgr transp/commun 25' 26='(026) Mgr service 26' 29='(029) Managerial nec 29'
                30='(030) Clerical supe 30' 31='(031) Village officials 31' 32='(032) Typists 32'
                33='(033) Book-keepers 33' 34='(034) Computing op 34' 35='(035) Clerical nec 35'
                36='(036) Transp/commun supe 36' 37='(037) Transp conductors 37'
                38='(038) Mail distributors 38' 39='(039) Telephone op 39' 40='(040) Shopkeepers 40'
                41='(041) Manuf agents 41' 42='(042) Technical sales 42' 43='(043) Sales, shop 43'
                44='(044) FIRE sales 44' 45='(045) Money lenders 45' 49='(049) Sales, nec 49'
                50='(050) Hotel/restaurant 50' 51='(051) House keepers 51' 52='(052) Cooks/waiters 52'
                53='(053) Maids 53' 54='(054) Sweepers 54' 55='(055) Launderers 55' 56='(056) Barbers 56'
                57='(057) Police 57' 59='(059) Service nec 59' 60='(060) Farm manager 60'
                61='(061) Cultivators 61' 62='(062) Other farmers 62' 63='(063) Ag labour 63'
                64='(064) Plantation lab 64' 65='(065) Other farm 65' 66='(066) Forestry 66'
                67='(067) Hunters 67' 68='(068) Fishermen 68' 71='(071) Miners 71'
                72='(072) Metal workers 72' 73='(073) Wood/paper 73' 74='(074) Chemical 74'
                75='(075) Textile 75' 76='(076) Tanners 76' 77='(077) Food 77' 78='(078) Tobacco 78'
                79='(079) Tailors 79' 80='(080) Shoe makers 80' 81='(081) Carpenters 81'
                82='(082) Stone cutters 82' 83='(083) Machine tool op 83' 84='(084) Assemblers 84'
                85='(085) Electrical 85' 86='(086) Cinema op 86' 87='(087) Plumbers/welders 87'
                88='(088) Jewellery 88' 89='(089) Potters 89' 90='(090) Rubber/plastic 90'
                91='(091) Paper 91' 92='(092) Printing 92' 93='(093) Painters 93'
                94='(094) Production nec 94' 95='(095) Construction 95' 96='(096) Boilermen 96'
                97='(097) Loaders 97' 98='(098) Drivers 98' 99='(099) Labour nec 99'
                100='(100) New workers X0' 101='(101) Unidentifiable occ X1' 109='(109) No occupation X9'
                111='(111) Housewife AA' 112='(112) Student/ too young BB'
                113='(113) Retired/ too old CC' 114='(114) Disabled DD'
                115='(115) Out of labour force EE' 119='(119) Other XI';
VALUE ta9bffff  0='(0) Cannot recognise 0' 1='(1) Numbers 1' 2='(2) Subtraction 2'
                3='(3) Division 3';
VALUE urban4_f  0='(0) metro urban 0' 1='(1) other urban 1' 2='(2) more dev vill 2'
                3='(3) less dev vill 3';
VALUE ws14ffff  1='(1) Govt/PSU 1' 2='(2) Private firm 2' 3='(3) Private employer 3'
                4='(4) MGNREGA 4' 5='(5) Other govt. programs' 6='(6) Other 6';
VALUE ta8bffff  0='(0) Cannot read 0' 1='(1) Letters 1' 2='(2) Words 2'
                3='(3) Paragraph 3' 4='(4) Story 4';
VALUE ws13ffff  1='(1) Casual daily 1' 2='(2) Casual piecework 2' 3='(3) Contract <1yr 3'
                4='(4) Regular/Permanent/Longer contract';
VALUE id11ffff  1='(1) Hindu 1' 2='(2) Muslim 2' 3='(3) Christian 3' 4='(4) Sikh 4'
                5='(5) Buddhist 5' 6='(6) Jain 6' 7='(7) Tribal 7' 8='(8) Others 8' 9='(9) None 9';
VALUE districf  102='(0102) Baramula' 103='(0103) Srinagar' 105='(0105) Pulwama'
                112='(0112) Rajauri' 113='(0113) Jammu' 201='(0201) Chamba' 202='(0202) Kangra'
                204='(0204) Kullu' 205='(0205) Mandi' 206='(0206) Hamirpur' 208='(0208) Bilaspur'
                209='(0209) Solan' 210='(0210) Sirmaur' 211='(0211) Shimla' 301='(0301) Gurdaspur'
                302='(0302) Amritsar' 303='(0303) Kapurthala' 304='(0304) Jalandhar'
                305='(0305) Hoshiarpur' 306='(0306) Nawanshahr' 307='(0307) Rupnagar'
                308='(0308) Fatehgarh' 309='(0309) Ludhiana' 310='(0310) Moga' 311='(0311) Firozpur'
                316='(0316) Sangrur' 317='(0317) Patiala' 400='(0400) Chandigarh' 505='(0505) Dehradun'
                508='(0508) Bageshwar' 509='(0509) Almora' 511='(0511) Nainital'
                512='(0512) Udham Singh Nagar' 513='(0513) Hardwar' 601='(0601) Panchkula'
                602='(0602) Ambala' 603='(0603) Yamunanagar' 604='(0604) Kurukshetra'
                605='(0605) Kaithal' 606='(0606) Karnal' 608='(0608) Sonipat' 609='(0609) Jind'
                610='(0610) Fatehabad' 612='(0612) Hissar' 613='(0613) Bhiwani' 617='(0617) Rewari'
                618='(0618) Gurgaon' 619='(0619) Faridabad' 700='(0700) Delhi'
                701='(0701) Delhi North West' 702='(0702) Delhi North' 703='(0703) Delhi North East'
                704='(0704) Delhi East' 707='(0707) Delhi West' 708='(0708) Delhi South West'
                709='(0709) Delhi South' 710='(0710) Delhi Municipal Corp'
                711='(0711) New Delhi Municipal Council' 803='(0803) Bikaner' 804='(0804) Churu'
                805='(0805) Jhunjhunu' 806='(0806) Alwar' 807='(0807) Bharatpur' 808='(0808) Dhaulpur'
                809='(0809) Karauli' 810='(0810) Sawai Madhopur' 811='(0811) Dausa' 812='(0812) Jaipur'
                813='(0813) Sikar' 814='(0814) Nagaur' 815='(0815) Jodhpur' 818='(0818) Jalor'
                820='(0820) Pali' 821='(0821) Ajmer' 824='(0824) Bhilwara' 825='(0825) Rajsamand'
                826='(0826) Udaipur' 829='(0829) Chittaurgarh' 830='(0830) Kota' 831='(0831) Baran'
                832='(0832) Jhalawar' 901='(0901) Saharanpur' 902='(0902) Muzaffarnagar'
                903='(0903) Bijnor' 904='(0904) Moradabad' 905='(0905) Rampur'
                906='(0906) Jyotiva Phule Nagar' 907='(0907) Meerut' 909='(0909) Ghaziabad'
                910='(0910) Gautam Buddha Nagar' 913='(0913) Hathras' 914='(0914) Mathura'
                915='(0915) Agra' 919='(0919) Budaun' 920='(0920) Bareilly' 923='(0923) Kheri'
                924='(0924) Sitapur' 927='(0927) Lucknow' 929='(0929) Farrukabad' 930='(0930) Kannauj'
                933='(0933) Kanpur Dehat' 934='(0934) Kanpur Nagar' 936='(0936) Jhansi'
                940='(0940) Banda' 941='(0941) Chitrakoot' 942='(0942) Fatehpur' 944='(0944) Kaushambi'
                945='(0945) Allahabad' 946='(0946) Barabanki' 947='(0947) Faizabad'
                948='(0948) Ambedkar Nagar' 949='(0949) Sultanpur' 950='(0950) Bahraich'
                951='(0951) Sharawasti' 954='(0954) Siddharathnagar' 958='(0958) Gorakhpur'
                959='(0959) Kushinagar' 960='(0960) Deoria' 962='(0962) Mau' 963='(0963) Baliya'
                965='(0965) Ghazipur' 966='(0966) Chandauli' 967='(0967) Varanasi'
                968='(0968) Sant Ravidas Nagar' 1002='(1002) Purbi Champaran' 1005='(1005) Madhubani'
                1006='(1006) Supaul' 1009='(1009) Purnia' 1012='(1012) Saharsa'
                1014='(1014) Muzaffar Pur' 1016='(1016) Siwan' 1017='(1017) Saran'
                1022='(1022) Bhagal Pur' 1023='(1023) Banka' 1026='(1026) Sheikhpura'
                1027='(1027) Nalanda' 1028='(1028) Patna' 1030='(1030) Buxar'
                1031='(1031) Kaimur (Bhabua)' 1032='(1032) Rohtas' 1035='(1035) Gaya'
                1100='(1100) Sikkim' 1200='(1200) Arunachal' 1300='(1300) Nagaland' 1400='(1400) Manipur'
                1500='(1500) Mizoram' 1600='(1600) Tripura' 1700='(1700) Meghalaya' 1802='(1802) Dhubri'
                1803='(1803) Goalpara' 1806='(1806) Kamrup' 1809='(1809) Marigaon' 1814='(1814) Tinsukia'
                1817='(1817) Jorhat' 1819='(1819) Karbi Amglong' 1821='(1821) Cachar'
                1901='(1901) Darjiling' 1902='(1902) Jalapiguri' 1904='(1904) Uttar Dinajpur'
                1906='(1906) Maldah' 1907='(1907) Murshidabad' 1908='(1908) Birbhum'
                1909='(1909) Barddhaman' 1910='(1910) Nadia' 1911='(1911) North 24 Parganas'
                1912='(1912) Hugli' 1913='(1913) Bankura' 1916='(1916) Haora' 1917='(1917) Kolkata'
                1918='(1918) South 24 Parganas' 2002='(2002) Palamu' 2012='(2012) Dhanbad'
                2013='(2013) Bokaro' 2014='(2014) Ranchi' 2017='(2017) Pashchimi Singbhum'
                2018='(2018) Purbi Singhbhum' 2101='(2101) Bargarh' 2102='(2102) Jharsuguda'
                2103='(2103) Sambalpur' 2105='(2105) Sundargarh' 2106='(2106) Kendujhar'
                2107='(2107) Mayurbhanj' 2108='(2108) Baleshwar' 2109='(2109) Bhadrak'
                2112='(2112) Cuttack' 2113='(2113) Jajapur' 2114='(2114) Dhenkanal' 2115='(2115) Anugul'
                2116='(2116) Nayagarh' 2117='(2117) Khordha' 2118='(2118) Puri' 2119='(2119) Ganjam'
                2120='(2120) Gajapati' 2121='(2121) Kandhamal' 2122='(2122) Baudh' 2123='(2123) Sonapur'
                2124='(2124) Balangir' 2126='(2126) Kalahandi' 2127='(2127) Rayagada'
                2128='(2128) Nabarangapur' 2129='(2129) Koraput' 2130='(2130) Malkangiri'
                2201='(2201) Koriya' 2202='(2202) Sarguja' 2203='(2203) Jashpur' 2204='(2204) Raigarh'
                2205='(2205) Korba' 2206='(2206) Janjgir' 2207='(2207) Bilas Pur' 2208='(2208) Kawardha'
                2209='(2209) Rajnandgaon' 2210='(2210) Durg' 2211='(2211) Raipur'
                2212='(2212) Mahasamund' 2213='(2213) Dhamtari' 2214='(2214) Kanker' 2215='(2215) Bastar'
                2301='(2301) Sheopur' 2302='(2302) Morena' 2304='(2304) Gwalior' 2305='(2305) Datia'
                2308='(2308) Tikamgarh' 2309='(2309) Chhatarpur' 2310='(2310) Panna' 2312='(2312) Damoh'
                2313='(2313) Satna' 2315='(2315) Umaria' 2316='(2316) Shahdol' 2317='(2317) Sidhi'
                2320='(2320) Ratlam' 2321='(2321) Ujjain' 2322='(2322) Shajapur' 2323='(2323) Dewas'
                2325='(2325) Dhar' 2326='(2326) Indore' 2327='(2327) West Nimar' 2328='(2328) Barwani'
                2329='(2329) East Nimar' 2330='(2330) Rajgarh' 2332='(2332) Bhopal' 2335='(2335) Betul'
                2336='(2336) Harda' 2337='(2337) Hoshangabad' 2338='(2338) Katni' 2339='(2339) Jabalpur'
                2341='(2341) Dindori' 2342='(2342) Mandla' 2344='(2344) Seoni' 2401='(2401) Kachchh'
                2403='(2403) Patan' 2404='(2404) Mahesana' 2406='(2406) Gandhinagar'
                2407='(2407) Ahmedabad' 2408='(2408) Surendranagar' 2409='(2409) Rajkot'
                2410='(2410) Jamnagar' 2412='(2412) Junagadh' 2413='(2413) Amreli'
                2414='(2414) Bhavnagar' 2415='(2415) Anand' 2416='(2416) Kheda' 2419='(2419) Vadodara'
                2420='(2420) Narmada' 2421='(2421) Bharuch' 2422='(2422) Surat' 2500='(2500) Daman & Diu'
                2600='(2600) Dadra & Nagar Haveli' 2701='(2701) Nandurbar' 2702='(2702) Dhule'
                2703='(2703) Jalgaon' 2705='(2705) Akola' 2706='(2706) Washim' 2707='(2707) Amarawti'
                2708='(2708) Wardha' 2709='(2709) Nagpur' 2710='(2710) Bhandara' 2711='(2711) Gondiya'
                2713='(2713) Chandrapur' 2714='(2714) Yavatmal' 2715='(2715) Nanded'
                2716='(2716) Hingoli' 2717='(2717) Parbhani' 2718='(2718) Jalna' 2720='(2720) Nasik'
                2721='(2721) Thane' 2722='(2722) Mumbai (suburban)' 2723='(2723) Mumbai'
                2725='(2725) Pune' 2726='(2726) Ahmadnagar' 2727='(2727) Bid' 2729='(2729) Osmanabad'
                2730='(2730) Solapur' 2731='(2731) Satara' 2732='(2732) Ratnagiri' 2734='(2734) Kolhapur'
                2801='(2801) Adilabad' 2802='(2802) Nizamabad' 2803='(2803) Karimnagar'
                2804='(2804) Medak' 2805='(2805) Hyderabad' 2806='(2806) Rangareddi'
                2807='(2807) Mahbubnagar' 2810='(2810) Khammam' 2813='(2813) Visakhapatnam'
                2814='(2814) East Godavari' 2815='(2815) West Godavari' 2816='(2816) Krishna'
                2817='(2817) Guntur' 2818='(2818) Prakasam' 2819='(2819) Nellore' 2820='(2820) Cuddapah'
                2821='(2821) Kurnool' 2822='(2822) Anantapur' 2823='(2823) Chittoor'
                2901='(2901) Belgaum' 2902='(2902) Bagalkot' 2903='(2903) Bijapur' 2905='(2905) Bidar'
                2906='(2906) Raichur' 2907='(2907) Koppal' 2908='(2908) Gadag' 2909='(2909) Dharwad'
                2910='(2910) Uttar Kannad' 2911='(2911) Haveri' 2912='(2912) Bellary'
                2913='(2913) Chitradurga' 2914='(2914) Davanagere' 2915='(2915) Shimoga'
                2916='(2916) Udupi' 2917='(2917) Chikmagalur' 2918='(2918) Tumkur' 2919='(2919) Kolar'
                2920='(2920) Bangalore' 2921='(2921) Bangalore Rural' 2922='(2922) Mandya'
                2924='(2924) Dakshin Kannada' 2925='(2925) Kodagu' 2926='(2926) Mysore'
                2927='(2927) Chamarajanagar' 3001='(3001) North Goa' 3002='(3002) South Goa'
                3202='(3202) Kannur' 3204='(3204) Kozhikode' 3205='(3205) Malappuram'
                3206='(3206) Palakkad' 3207='(3207) Thrissur' 3208='(3208) Ernakulam'
                3209='(3209) Idukki' 3210='(3210) Kottayam' 3211='(3211) Alappuzha'
                3212='(3212) Pathanamthitta' 3213='(3213) Kollam' 3214='(3214) Thiruvananthapuram'
                3301='(3301) Thiruvallur' 3302='(3302) Chennai' 3303='(3303) Kancheepuram'
                3304='(3304) Vellore' 3305='(3305) Dharampuri' 3306='(3306) Tiruvannamalai'
                3309='(3309) Namakkal' 3310='(3310) Erode' 3312='(3312) Coimbatore'
                3313='(3313) Dindigul' 3314='(3314) Karur' 3315='(3315) Tiruchchirappalli'
                3316='(3316) Perambalur' 3317='(3317) Ariyalur' 3323='(3323) Sivaganga'
                3324='(3324) Madurai' 3325='(3325) Theni' 3327='(3327) Ramanathapuram'
                3328='(3328) Thoothukkudi' 3329='(3329) Tirunelveli' 3330='(3330) Kanniyakumari'
                3400='(3400) Pondicherry';
VALUE cs17ffff  0='(00) none 0' 1='(01) 1st class 1' 2='(02) 2nd class 2'
                3='(03) 3rd class 3' 4='(04) 4th class 4' 5='(05) 5th class 5' 6='(06) 6th class 6'
                7='(07) 7th class 7' 8='(08) 8th class 8' 9='(09) 9th class 9' 10='(10) Secondary 10'
                11='(11) 11th Class 11' 12='(12) High Secondary 12' 13='(13) 1 year post-secondary 13'
                14='(14) 2 years post-secondary 14' 15='(15) Bachelors 15' 16='(16) Above Bachelors 16';
VALUE id13ffff  1='(1) Brahmin 1' 2='(2) Forward/General (except Brahmin) 2'
                3='(3) Other Backward Castes (OBC) 3' 4='(4) Scheduled Castes (SC) 4'
                5='(5) Scheduled Tribes (ST) 5' 6='(6) Others 6';
VALUE mg4fffff  1='(1) same state 1' 2='(2) another state 2' 3='(3) abroad 3';
VALUE cs18ffff  1='(1) Voc: <1 yr 1' 2='(2) Voc: 1-2 years 2' 3='(3) Voc: 3+ years 3'
                4='(4) Others 4';
VALUE sm14bfff  1='(1) Home' 2='(2) This village or Town' 3='(3) Another Village'
                4='(4) Other Town' 5='(5) District Town' 6='(6) Metro City' 7='(7) Abroad/Others';
VALUE ed3fffff  0='(0) none' 1='(1) Little 1' 2='(2) Fluent 2';
VALUE ed12ffff  1='(1) Incomplete 1' 2='(2) BA,BSc,BCom,etc. 2' 3='(3) BE,B.Tech. 3'
                4='(4) MBBS/BAMS 4' 5='(5) Masters,Ph.D. 5' 6='(6) MD, Law, MBA, CA etc. 6'
                7='(7) Diploma <3 years 7' 8='(8) Diploma 3+ years 8' 9='(9) other 9';
VALUE mb3fffff  0='(0) No 0' 1='(1) Cured 1' 2='(2) Yes 2';
VALUE metro6ff  1='(1) Mumbai 1' 2='(2) Delhi 2' 3='(3) Kolkata 3' 4='(4) Chennai 4'
                5='(5) Bangalore 5' 6='(6) Hyderabad 6';
VALUE sm16ffff  1='(1) Pain killer/Cough syrup 1' 2='(2) Antibiotic 2'
                3='(3) Other Allopathic 3' 4='(4) Ayurvedic 4' 5='(5) Homeopathy 5'
                6='(6) Home/Herbal remedy 6' 7='(7) Surgery 7' 8='(8) Others 8';
VALUE urban20f  0='(0) rural 0' 1='(1) urban 1';
VALUE ed9fffff  1='(1) regular school 1' 2='(2) study privately 2' 3='(3) distance educ 3'
                4='(4) Diploma <3 years pvt 4' 5='(5) Diploma <3 years govt 5'
                6='(6) Diploma 3+ years pvt 6' 7='(7) Diploma 3+ years govt 7' 9='(9) Finished 9';
VALUE groupsff  1='(1) Brahmin 1' 2='(2) Forward caste 2' 3='(3) OBC 3' 4='(4) Dalit 4'
                5='(5) Adivasi 5' 6='(6) Muslim 6' 7='(7) Christian, Sikh, Jain 7';
VALUE nf29ffff  0='(0) does not work in 2nd hh business' 1='(1) works in 2nd hh business';
VALUE metrofff  0='(0) non-metro' 1='(1) largest six metro areas';
VALUE nf9fffff  0='(0) does not work in 1st hh business' 1='(1) works in 1st hh business';
VALUE ro8fffff  69='(69) IF Spouse/Parent outside for more than 6 months' 75='(75) Dead';
VALUE ws9fffff  1='(1) Per Day 1' 2='(2) Per Month 2' 3='(3) Fixed 3';
VALUE ed6fffff  0='(00) none 0' 1='(01) 1st class 1' 2='(02) 2nd class 2'
                3='(03) 3rd class 3' 4='(04) 4th class 4' 5='(05) 5th class 5' 6='(06) 6th class 6'
                7='(07) 7th class 7' 8='(08) 8th class 8' 9='(09) 9th class 9' 10='(10) Secondary 10'
                11='(11) 11th Class 11' 12='(12) High Secondary 12' 13='(13) 1 year post-secondary'
                14='(14) 2 years post-secondary' 15='(15) Bachelors 15' 16='(16) Above Bachelors 16'
                55='(55) <1 class 55';
VALUE fm1fffff  0='(0) No 0' 1='(1) Yes 1';
VALUE cs4fffff  1='(01) EGS 1' 2='(02) Government 2' 3='(03) Govt. Aided 3'
                4='(04) Private 4' 5='(05) Convent 5' 6='(06) Madrassa 6' 7='(07) Other/Open school 7'
                8='(08) Junior college 8' 9='(09) College 9' 10='(10) Postgraduate 10'
                11='(11) Technical Inst. 11' 12='(12) Private vocational programme 12'
                13='(13) Govt. vocational programme 13';
VALUE mb22bfff  1='(1) Home' 2='(2) This village or Neighbourhood' 3='(3) Another Village'
                4='(4) Other Town' 5='(5) District Town' 6='(6) Metro City' 7='(7) Abroad/Others';
VALUE ch15ffff  1='(1) Below average 1' 2='(2) Average 2' 3='(3) Better than average 3';
VALUE to3fffff  1='(1) Never 1' 2='(2) Rarely 2' 3='(3) Sometimes 3' 4='(4) Daily 4';
VALUE ro4fffff  1='(01) Head 1' 2='(02) Wife/Husband 2' 3='(03) Son/Daughter 3'
                4='(04) Child-in-Law 4' 5='(05) Grandchild 5' 6='(06) Father/Mother 6'
                7='(07) Brother/Sister 7' 8='(08) Parent-in-Law 8' 9='(09) Nephew/Niece 9'
                10='(10) Sib-in-Law 10' 11='(11) Other rel 11' 12='(12) Servant/Others 12';
VALUE ch2fffff  0='(0) No 0' 1='(1) Yes, in the past 1' 2='(2) Yes, currently 2';
VALUE mg11ffff  1='(1) Contractor 1' 2='(2) With a job or Self Employed 2'
                3='(3) Without a job 3';
VALUE mb21bfff  1='(1) Home' 2='(2) This village or Neighbourhood' 3='(3) Another Village'
                4='(4) Other Town' 5='(5) District Town' 6='(6) Metro City' 7='(7) Abroad/Others'
                8='(8) Don''t know';
VALUE ws11ffff  0='(0) No' 1='(1) Yes meal' 2='(2) Yes house' 3='(3) Yes both';
VALUE ed10ffff  1='(1) Arts 1' 2='(2) Commerce 2' 3='(3) Science 3' 4='(4) Engineering 4'
                5='(5) Agriculture 5' 6='(6) Home science/Craft/Design 6' 7='(7) Other Tech/Vocational 7'
                8='(8) others 8';
VALUE sm9fffff  1='(1) More' 2='(2) Same' 3='(3) Less';
VALUE ta3fffff  0='(0) Never 0' 1='(1) Yes, currently 1' 2='(2) Yes, in the past 2';
VALUE ta6fffff  1='(1) Nicely 1' 2='(2) Somewhat nicely 2' 3='(3) Not nicely 3';
VALUE surveyff  1='(1) IHDS-I 1' 2='(2) IHDS-II 2';
VALUE nfbn1fff  0='(0) no 1st hh business' 1='(1) hh has 1st business';
VALUE sm14afff  1='(1) Govt Doc/Nurse 1' 2='(2) Govt Doc/Nurse in Pvt 2'
                3='(3) Pvt Doc/Nurse 3' 4='(4) Chemist4' 5='(5) Vaidhya/Hakim 5' 6='(6) Witch craft 6'
                7='(7) Others 7';
VALUE cs3fffff  1='(1) School 1' 2='(2) College 2' 3='(3) School+Vocational 3'
                4='(4) College+Vocational 4' 5='(5) Vocational only 5' 6='(6) No longer 6';
VALUE ro6fffff  0='(0) Married, spouse absent' 1='(1) Married 1' 2='(2) Unmarried 2'
                3='(3) Widowed 3' 4='(4) Separated/Divorced 4' 5='(5) Married no gauna 5';
VALUE ap7fffff  1='(1) Lying 1' 2='(2) Standing 2';
VALUE ws5fffff  0='(00) Agriculture 0' 1='(01) Plantations 1' 2='(02) Livestock 2'
                3='(03) Ag services 3' 4='(04) Hunting 4' 5='(05) Forestry 5' 6='(06) Fishing 6'
                10='(10) Coal mining 10' 11='(11) Petroleum extract 11' 12='(12) Iron mining 12'
                13='(13) Other metal mining 13' 14='(14) Uranium mining 14' 15='(15) Nonmetal mining 15'
                19='(19) Mining services 19' 20='(20) Manf food products 20'
                22='(22) Manf bev/tobacco 22' 23='(23) Manf cotton textiles 23'
                24='(24) Manf wool/silk/etc 24' 25='(25) Manf jute 25' 26='(26) Manf apparel 26'
                27='(27) Manf wood/furniture 27' 28='(28) Manf paper/publish 28'
                29='(29) Manf leather 29' 30='(30) Manf chemicals 30' 31='(31) Manf rubber/plastic 31'
                32='(32) Manf mineral 32' 33='(33) Manf basic metal 33' 34='(34) Manf metal products 34'
                35='(35) Manf machinery 35' 37='(37) Manf transport equip 37' 38='(38) Manf other 38'
                39='(39) Repair capital goods 39' 40='(40) Electricity 40' 41='(41) Gas/steam 41'
                42='(42) Water works 42' 43='(43) Other energy 43' 50='(50) Construction 50'
                51='(51) Allied construction 51' 60='(60) Whsl ag/textiles 60'
                61='(61) Whsl basic goods 61' 62='(62) Whsl machinery 62' 63='(63) Whsl nec 63'
                64='(64) Manf agents 64' 65='(65) Retail food 65' 66='(66) Retail textiles 66'
                67='(67) Retail household 67' 68='(68) Retail nec 68' 69='(69) Restaurants/hotels 69'
                70='(70) Land transport 70' 71='(71) Water transport 71' 72='(72) Air transport 72'
                73='(73) Transport nec 73' 74='(74) Storage 74' 75='(75) Communication 75'
                80='(80) Banking 80' 81='(81) Insurance 81' 82='(82) Real estate 82' 83='(83) Legal 83'
                84='(84) Lotteries 84' 85='(85) Renting 85' 89='(89) Business services 89'
                90='(90) Public admin 90' 91='(91) Sanitary 91' 92='(92) Education 92'
                93='(93) Medical 93' 94='(94) Community 94' 95='(95) Rec/culture 95'
                96='(96) Personal services 96' 97='(97) Repair services 97' 98='(98) International 98'
                99='(99) Services nec 99';
VALUE ta8affff  1='(01) Hindi 1' 2='(02) Assamese 2' 3='(03) Bangla 3' 4='(04) Gujarati 4'
                5='(05) Marathi 5' 6='(06) Oriya 6' 7='(07) Kannada 7' 8='(08) Malayalam 8'
                9='(09) Tamil 9' 10='(10) Telegu 10' 11='(11) English 11' 12='(12) Punjabi 12'
                13='(13) Urdu 13' 14='(14) Others 14';
VALUE an6fffff  0='(0) No 0' 1='(1) Sometimes 1' 2='(2) Usually 2';
VALUE ch16ffff  1='(1) Rarely 1' 2='(2) Sometimes 2' 3='(3) Usually 3' 4='(4) Always 4';
VALUE in22ffff  1='(1) Not Interested 1' 2='(2) No work 2' 3='(3) Payment problem 3'
                4='(4) Low wage 4' 5='(5) Paid, no work 5' 6='(6) Others 6';
VALUE nf49ffff  0='(0) does not work in 3rd hh business' 1='(1) works in 3rd hh business';
VALUE ta10bfff  0='(0) Cannot write 0' 1='(1) 1-2 mistakes 1' 2='(2) No mistake 2';
VALUE mg6fffff  1='(1) Alone 1' 2='(2) With Spouse 2' 3='(3) With Spouse & children 3'
                4='(4) With others 4';
VALUE mm9fffff  1='(1) Home 1' 2='(2) Cyber cafe 2' 3='(3) Office 3'
                4='(4) School/Collage 4' 5='(5) E-chaupal/Panchayat 5' 6='(6) Relative/Friends 6'
                7='(7) Others 7';
VALUE cs7fffff  1='(01) Arts 1' 2='(02) Commerce/Business management 2' 3='(03) Science 3'
                4='(04) Engineering 4' 5='(05) Information Technology (IT) 5' 6='(06) Medical 6'
                7='(07) Agriculture 7' 8='(08) Other technology 8' 9='(09) Law/CA/Other Professional 9'
                10='(10) Home sciences/ Craft/Design 10' 11='(11) Vocational (NEC) 11'
                12='(12) Others 12';
VALUE ap2fffff  1='(1) Main quest. 1' 2='(2) Additional quest 2';
VALUE ad3fffff  0='(0) No Difficulty 0' 1='(1) with difficulty 1'
                2='(2) Unable to do it 2';
VALUE nfbn21ff  0='(0) no 2nd hh business' 2='(2) hh has 2nd business';
VALUE cs20ffff  1='(01) Paramedic 1' 2='(02) Art/Craft/Design 2' 3='(03) Electrical 3'
                4='(04) Computer 4' 5='(05) Other Tech 5' 6='(06) Auto mechanic 6' 7='(07) Photog 7'
                8='(08) Plumbing/Carpentry 8' 9='(09) Fashion 9' 10='(10) Hotel 10' 11='(11) Business 11'
                12='(12) Architect 12' 13='(13) Cooking 13' 14='(14) Others 14';
VALUE stateidf  1='(01) Jammu & Kashmir 01' 2='(02) Himachal Pradesh 02'
                3='(03) Punjab 03' 4='(04) Chandigarh 04' 5='(05) Uttarakhand 05' 6='(06) Haryana 06'
                7='(07) Delhi 07' 8='(08) Rajasthan 08' 9='(09) Uttar Pradesh 09' 10='(10) Bihar 10'
                11='(11) Sikkim 11' 12='(12) Arunachal Pradesh 12' 13='(13) Nagaland 13'
                14='(14) Manipur 14' 15='(15) Mizoram 15' 16='(16) Tripura 16' 17='(17) Meghalaya 17'
                18='(18) Assam 18' 19='(19) West Bengal 19' 20='(20) Jharkhand 20' 21='(21) Orissa 21'
                22='(22) Chhattisgarh 22' 23='(23) Madhya Pradesh 23' 24='(24) Gujarat 24'
                25='(25) Daman & Diu 25' 26='(26) Dadra+Nagar Haveli 26' 27='(27) Maharashtra 27'
                28='(28) Andhra Pradesh 28' 29='(29) Karnataka 29' 30='(30) Goa 30'
                31='(31) Lakshadweep 31' 32='(32) Kerala 32' 33='(33) Tamil Nadu 33'
                34='(34) Pondicherry 34' 35='(35) Anadman/Nicobar 35';
VALUE wkfarmff  0='(0) none 0' 1='(1) missing hours 1' 2='(2) <240hrs 2'
                3='(3) parttime 3' 4='(4) ft yr (250 days/year or more AND 2000 hours/year or more)';
VALUE ro3fffff  1='(1) Male 1' 2='(2) Female 2';
VALUE cs19ffff  1='(1) Govt. 1' 2='(2) Private 2';
VALUE ch10ffff  1='(1) Excellent 1' 2='(2) Good 2' 3='(3) Fair 3' 4='(4) Poor 4';
VALUE ro7fffff  1='(01) Cultivation 1' 2='(02) Allied ag 2' 3='(03) Ag wage labour 3'
                4='(04) Nonag wage labour 4' 5='(05) Artisan/indpt work 5' 6='(06) Small business 6'
                7='(07) Organized Business 7' 8='(08) Salaried 8' 9='(09) Profession 9'
                10='(10) Retired 10' 11='(11) Housework 11' 12='(12) Student 12' 13='(13) Unemployed 13'
                14='(14) Too young/Unfit 14' 15='(15) Others 15';
VALUE educ7fff  0='(00) none 0' 3='(03) 1-4 3' 5='(05) primary 5' 8='(08) 6-9 8'
                10='(10) Secondary(&11) 10' 12='(12) Higher sec(&13,14) 12' 15='(15) graduate 15'
                16='(16) some post-grad 16';
VALUE nfbn41ff  0='(0) no 3rd hh business' 3='(3) hh has 3rd business';
VALUE wkanimaf  0='(0) none 0' 1='(1) missing hours 1' 2='(2) <240hrs 2'
                3='(3) parttime 3' 4='(4) ft yr 4';
VALUE ch4affff  1='(1) Only available 1' 2='(2) Close to home 2'
                3='(3) Better Education 3' 4='(4) Siblings 4' 5='(5) English medium 5'
                6='(6) Affordable 6' 7='(7) Single sex 7' 8='(8) No admission else 8' 9='(9) Others 9';
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA;
INFILE "data-filename" LRECL=1030;
INPUT
       SURVEY 1                STATEID 2-3
        DISTID 4-5              PSUID 6-7               HHID 8-10
        HHSPLITID 11            PERSONID 12-13          IDPSU 14-19
        IDHH $20-29             IDPERSON $30-41         WT 42-56 .8
        FWT 57-62               DIST01 63-64            DISTRICT 65-68
        RO3 69                  RO4 70-71               RO5 72-73
        RO6 74                  RO7 75-76               RO8 77-78
        RO9 79-80               RO10 81-82              FM1 83
        FM36Y 84                FM37 85-87              FM38 88-89
        FMHOURS 90-93           WKFARM 94               FM39AY 95
        AN1 96                  AN5Y 97                 AN6 98
        AN7Y 99                 NF1 100                 NFBN1 101
        NF9 102                 NF12 103-105            NF13 106-107
        NF15Y 108               NFBN21 109              NF29 110
        NF32 111-113            NF33 114-115            NF35Y 116
        NFBN41 117              NF49 118                NF52 119-121
        NF53 122-123            NFDAYS 124-126          NFHOURS 127-130
        NF55Y 131               IN11S1 132              IN13S1 133-137
        IN11S2 138              IN13S2 139-143          IN11S3 144
        IN13S3 145-149          IN11S4 150              IN13S4 151-155
        IN11S5 156              IN13S5 157-161          IN11S6 162
        IN13S6 163-167          IN11S7 168              IN13S7 169-173
        IN11S8 174              IN13S8 175-179          IN18 180
        IN19 181-182            IN20 183-185            IN21 186-188
        IN22 189                IN23 190-191            IN24 192-193
        ED2 194                 ED3 195                 ED4 196
        ED5 197                 ED6 198-199             EDUC7 200-201
        EDUNDER1 202            ED7 203                 ED8 $204-206
        ED9 207                 ED10 208                ED11 209
        ED12 210                ED13 $211-213           MM7Y 214
        MM8 215                 MM9 216                 MM12Y 217
        MM13 218                MM14 219                TA3 220
        TA4 221                 TA5 222                 TA6 223
        TA8A 224-225            TA8B 226                TA9A 227-228
        TA9B 229                TA10A 230-231           TA10B 232
        CS3 233                 CS3Y 234                CS4 235-236
        CS5 237-238             CS6 239-240             CS7 241-242
        CS8 243-244             CS9 245-246             CS10 247-248
        CS11 249-250            CS12 251-252            CS13 253-254
        CS16 255-256            CS17 257-258            CS18 259
        CS19 260                CS20 261-262            CS21 263
        CS22 264                CS23 265                CS24 266-270
        CS25 271-276            CS26 277-281            CS27 282-286
        CS28 287-291            CH2 292                 CH3 293-294
        CH4A 295                CH4B 296                CH5 297
        CH6 298                 CH7 299                 CH8 300
        CH9 301                 CH10 302                CH11 303
        CH12 304                CH13 305                CH14 306-307
        CH15 308                CH16 309                CH17 310
        CH18 311                CH19 312                CH20 313
        CH22 314                SM3 315-316             SM4 317
        SM5 318                 SM6 319                 SM7 320
        SM8 321                 SM9 322                 SM10 323
        SM11 324-325            SM12 326                SM14A 327
        SM14B 328               SM15A 329               SM15B 330
        SM16 331                SM17 332-334            SM18 335-339
        SM19 340                SM20 341-344            SM21 345-348
        SM22 349-352            MB3 353                 MB4 354
        MB5 355                 MB6 356                 MB7 357
        MB8 358                 MB9 359                 MB10 360
        MB11 361                MB12 362                MB13 363
        MB14 364                MB15 365                MB16 366
        MB17 367                MB18 368-370            MB19 371
        MB21A 372               MB21B 373               MB22A 374
        MB22B 375               MB23 376                MB24 377-379
        MB25 380-385            MB26 386                MB27 387-391
        MB28 392-396            MB29 397-401            AD3 402
        AD4 403                 AD5 404                 AD6 405
        AD7 406                 AD8 407                 AD9 408
        TO3 409                 TO4 410                 TO5 411
        TO6 412                 AP2 413                 AP3 414-415
        AP5 416-430 .11         AP6 431-445 .11         AP7 446
        AP8 447-461 .11         AP9 462-476 .11         EW3Y 477
        URBAN2011 478           URBAN4_2011 479         METRO 480
        METRO6 481              POVLINE2005 482-496 .11 POVLINE2012 497-500
        DEFLATOR 501-515 .13    NPERSONS 516-517        EWELIGIBLE 518
        EWQELIGIBLE 519         ID11 520                ID13 521
        GROUPS 522              NF5 523-530             NF25 531-537
        NF45 538-543            COTOTAL 544-558 .7      COPC 559-573 .7
        ASSETS 574-575          ASSETS2005 576-577      INCCROP 578-588 .2
        INCAGPROP 589-594       INCANIMAL 595-609 .7    INCAG 610-624 .6
        INCBUS 625-632          INCOTHER 633-639        INCEARN 640-646
        INCBENEFITS 647-652     INCREMIT 653-658        INCOME 659-673 .6
        INCOMEPC 674-688 .7     WKANIMAL 689            WKBUSINESS 690
        WS3NM $691-730          WS4 731-733             WS5 734-735
        WS7 736-738             WS7MONTHS 739-753 .12   WS8 754-755
        WS8YEAR 756-759         WS9 760                 WS10 761-766
        WS10ANNUAL 767-781 .7   WSEARN 782-788          WSEARNHOURLY 789-803 .10
        WS11 804                WS11MEALS 805           WS11HOUSE 806
        WS11MEALSRS 807-810     WS11HOUSERS 811-816     WS12 817-821
        WS13 822                WS14 823                WS15 824-826
        WS7AGLAB 827-829        WS8AGLAB 830-833        WSEARNAGLAB 834-839
        WKAGLAB 840             WS7NONAG 841-843        WS8NONAG 844-847
        WSEARNNONAG 848-853     WKNONAG 854             WS7SALARY 855-857
        WS8SALARY 858-861       WSEARNSALARY 862-868    WKSALARY 869
        WS7NREGA 870-872        WS8NREGA 873-876        WSEARNNREGA 877-881
        WKNREGA 882             WKDAYS 883-885          WKHOURS 886-889
        WKANY5 890              RSUNEARN 891-905 .6     MHEADAGE 906-907
        FHEADAGE 908-909        NADULTM 910             NADULTF 911
        NCHILDM 912-913         NCHILDF 914-915         NTEENM 916
        NTEENF 917              NELDERM 918             NELDERF 919
        NMARRIEDM 920           NMARRIEDF 921           NWKNONAG 922
        NWKAGLAB 923            NWKSALARY 924           NWKBUSINESS 925
        NWKFARM 926-927         NWKANIMAL 928           NWKNREGA 929
        NWKNREGA4 930           NWKNONNREGA 931         NWKANY5 932-933
        INCNONAG 934-939        INCAGLAB 940-945        INCSALARY 946-952
        INCNREGA 953-958        INCNONNREGA 959-964     NNR 965
        HHEDUC 966-967          HHEDUCM 968-969         HHEDUCF 970-971
        MG4 972                 MG5 973                 MG6 974
        MG7 975-976             MG8 977                 MG9NM $978-1017
        MG10 1018-1020          MG11 1021               MGYEAR5 1022
        NMIG5 1023-1024         MGMONTHS5 1025-1026     MGYEAR1 1027
        NMIG1 1028              MGMONTHS1 1029-1030     ;


* SAS LABEL STATEMENT;

LABEL 
   SURVEY  = 'IHDS-I (2005) or IHDS-II (2012)' 
   STATEID = 'State code' 
   DISTID  = 'District code' 
   PSUID   = 'PSU: village/neighborhood code' 
   HHID    = 'Household ID (3-digit)' 
   HHSPLITID= 'Split household ID' 
   PERSONID= 'HQ4 2.1 Roster ID within 2012 household' 
   IDPSU   = 'PSU id unique 6 digit long int =cluster' 
   IDHH    = 'Household id, unique 10 byte string' 
   IDPERSON= 'Person id, unique 12 byte' 
   WT      = 'Weights for 2012' 
   FWT     = 'Integer weights for 2012' 
   DIST01  = 'H1sp: District ID Census 2001' 
   DISTRICT= '2001 Census state id + district id, labeled' 
   RO3     = 'HQ4 2.3 Sex' 
   RO4     = 'HQ4 2.4 Relationship to head' 
   RO5     = 'HQ4 2.5 Age' 
   RO6     = 'HQ4 2.6 Marital Status' 
   RO7     = 'HQ4 2.7 Primary Activity Status' 
   RO8     = 'HQ4 2.8 Spouse''s ID' 
   RO9     = 'HQ4 2.9 Father''s ID' 
   RO10    = 'HQ4 2.1 Mother''s ID' 
   FM1     = 'HQ7 5.1 Any owned or cultivated' 
   FM36Y   = 'HQ10 5.36 Own farm work' 
   FM37    = 'HQ10 5.37 Farm labour: days/year' 
   FM38    = 'HQ10 5.38 Farm: hours/day max=16' 
   FMHOURS = 'HQ10 5.37-38 Farm: hours/year max=4000' 
   WKFARM  = 'HQ14-16 fm12+ work participation farm' 
   FM39AY  = 'HQ10 5.39a Farm work: is decision maker' 
   AN1     = 'HQ11 6.1 Owns livestock' 
   AN5Y    = 'HQ11 6.5 Animal care work' 
   AN6     = 'HQ11 6.6 Animal care: Frequency' 
   AN7Y    = 'HQ11 6.7 Animal care: is decision maker' 
   NF1     = 'HQ14 8.1 Any non-farm business, corrected' 
   NFBN1   = 'HQ14 8(1) Business1: 1st business' 
   NF9     = 'HQ14 8.9 Business1: is worker' 
   NF12    = 'HQ16 8.52 Business1: days max=365' 
   NF13    = 'HQ14 8.13 Business1: hours/day max=16' 
   NF15Y   = 'HQ14 8.15 Business #1: is decision maker' 
   NFBN21  = 'HQ15 8(2) Business2: 2nd business' 
   NF29    = 'HQ15 8.29 Business2: is worker' 
   NF32    = 'HQ15 8.32 Business1: days max=365' 
   NF33    = 'HQ15 8.33 Business2: hours/day max=16' 
   NF35Y   = 'HQ15 8.35 Business #2: is decision maker' 
   NFBN41  = 'HQ16 8(3) Business3: 3rd business' 
   NF49    = 'HQ16 8.49 Business3: is worker' 
   NF52    = 'HQ16 8.52 Business3: days/year' 
   NF53    = 'HQ16 8.53 Business3: hours/day max=16' 
   NFDAYS  = 'HQ14-16 nf12+ days per year all businesses' 
   NFHOURS = 'HQ14-16 nf12+ hours per year all businesses' 
   NF55Y   = 'HQ16 8.55 Business #3: is decision maker' 
   IN11S1  = 'HQ17 9.11-1 Old Age Pension any income' 
   IN13S1  = 'HQ17 9.13-1 Old Age Pension Rs' 
   IN11S2  = 'HQ17 9.11-2 Widows Pension any income' 
   IN13S2  = 'HQ17 9.13-2 Widows Pension Rs. year' 
   IN11S3  = 'HQ17 9.11-3 Maternity Benefit any income' 
   IN13S3  = 'HQ17 9.13-3 Maternity Benefit Rs' 
   IN11S4  = 'HQ17 9.11-4 Disability Pension any income' 
   IN13S4  = 'HQ17 9.13-4 Disability Pension Rs' 
   IN11S5  = 'HQ17 9.11-5 Annapurna any income' 
   IN13S5  = 'HQ17 9.13-5 Annapurna Rs' 
   IN11S6  = 'HQ17 9.11-6 Other Government any income' 
   IN13S6  = 'HQ17 9.13-6 Other Government Rs' 
   IN11S7  = 'HQ17 9.11-7 NGOs any income' 
   IN13S7  = 'HQ17 9.13-7 NGOs Rs' 
   IN11S8  = 'HQ17 9.11-8 other' 
   IN13S8  = 'HQ17 9.13-8 other Rs' 
   IN18    = 'HQ18 9.18 NREGA card number' 
   IN19    = 'HQ18 9.19 NREGA: N members on card' 
   IN20    = 'HQ18 9.20 NREGA: N days eligible' 
   IN21    = 'HQ18 9.21 NREGA: N days worked' 
   IN22    = 'HQ18 9.22 NREGA: why not worked' 
   IN23    = 'HQ18 9.23 NREGA: 1st worker' 
   IN24    = 'HQ18 9.24 NREGA: 2nd worker' 
   ED2     = 'HQ19 11.2 Education: Literacy' 
   ED3     = 'HQ19 11.3 Education: English ability' 
   ED4     = 'HQ19 11.4 Education: Attended school' 
   ED5     = 'HQ19 11.5 Education: Enrolled now' 
   ED6     = 'HQ19 11.6 Education: Completed Years, never,<1=0' 
   EDUC7   = 'HQ19 11.4,6 Education: Completed Years, 7cats' 
   EDUNDER1= 'HQ19 11.6 Education: under 1 year' 
   ED7     = 'HQ19 11.7 Education: Ever repeated' 
   ED8     = 'HQ19 11.8 Education: Secondary class' 
   ED9     = 'HQ19 11.9 Education: post secondary' 
   ED10    = 'HQ19 11.1 Education: Post 2nd subject' 
   ED11    = 'HQ19 11.11 Education: College/vocational school' 
   ED12    = 'HQ19 11.12 Education: Highest degree' 
   ED13    = 'HQ19 11.13 Education: Degree class' 
   MM7Y    = 'HQ22 13.7 uses computer' 
   MM8     = 'HQ22 13.8 Computer: internet, e-mail' 
   MM9     = 'HQ22 13.9 Computer: Mostly where?' 
   MM12Y   = 'HQ22 13.12 owns mobile' 
   MM13    = 'HQ22 13.13 Mobile: internet, e-mail' 
   MM14    = 'HQ22 13.14 Mobile: SMS' 
   TA3     = 'HQ34 26.3 Test child: Ever school' 
   TA4     = 'HQ34 26.4 Test child: Class' 
   TA5     = 'HQ34 26.5 Test child: Enjoys school' 
   TA6     = 'HQ34 26.6 Test child: Teacher nice' 
   TA8A    = 'HQ34 26.8 Test: Reading language' 
   TA8B    = 'HQ34 26.8 Test: Reading level' 
   TA9A    = 'HQ34 26.9 Test: Math language' 
   TA9B    = 'HQ34 26.9 Test: Math level' 
   TA10A   = 'HQ34 26.10 Test: Writing language' 
   TA10B   = 'HQ34 26.10 Test: Writing level' 
   CS3     = 'EQ4 2.3 In School / College' 
   CS3Y    = 'EQ4 2.3 In School/ College, yes/no' 
   CS4     = 'EQ4 2.4 School type' 
   CS5     = 'EQ4 2.5 School distance (Km)' 
   CS6     = 'EQ4 2.6 Standard (years) <1=0' 
   CS7     = 'EQ4 2.7 Course of study if above 10 standard' 
   CS8     = 'EQ4 2.8 Medium of instruction' 
   CS9     = 'EQ4 2.9 Year English taught' 
   CS10    = 'EQ4 2.10 School hours/week' 
   CS11    = 'EQ4 2.11 Homework hours/week' 
   CS12    = 'EQ4 2.12 private Tuition hours/week' 
   CS13    = 'EQ4 2.13 Days/month absent' 
   CS16    = 'EQ5 2.16 Vocational Classes hours/week' 
   CS17    = 'EQ5 2.17 Standard completed' 
   CS18    = 'EQ5 2.18 Current Prog type' 
   CS19    = 'EQ5 2.19 Institution type' 
   CS20    = 'EQ5 2.20 Vocational course' 
   CS21    = 'EQ5 2.21 Free books' 
   CS22    = 'EQ5 2.22 School fees by Government' 
   CS23    = 'EQ5 2.23 Free uniform' 
   CS24    = 'EQ5 2.24 Scholarship (rupees)' 
   CS25    = 'EQ5 2.25 School fees (in rupees)' 
   CS26    = 'EQ5 2.26 Books uniform Rs' 
   CS27    = 'EQ5 2.27 Bus Rs' 
   CS28    = 'EQ5 2.28 private tuition Rs' 
   CH2     = 'EQ6 3.2 Child: School enrollment' 
   CH3     = 'EQ6 3.3 Child: Start Age in years' 
   CH4A    = 'EQ6 3.4 Child: School choice reason 1' 
   CH4B    = 'EQ6 3.4 Child: School choice reason 2' 
   CH5     = 'EQ6 3.5 Child: School admission difficult' 
   CH6     = 'EQ6 3.6 Child: Teacher attendance' 
   CH7     = 'EQ6 3.7 Child: Teacher gender' 
   CH8     = 'EQ6 3.8 Child: Local teacher' 
   CH9     = 'EQ6 3.9 Child: Fair Teacher' 
   CH10    = 'EQ6 3.10 Child: Good Teacher' 
   CH11    = 'EQ6 3.11 Child: Biased Teacher' 
   CH12    = 'EQ6 3.12 Child: PTA participation' 
   CH13    = 'EQ6 3.13 Child: PTA attendance' 
   CH14    = 'EQ6 3.14 Child: # teacher discuss' 
   CH15    = 'EQ6 3.15 Child: Average student' 
   CH16    = 'EQ6 3.16 Child: School enjoyment' 
   CH17    = 'EQ6 3.17 Child: # Repeats' 
   CH18    = 'EQ6 3.18 Child: Ever praised' 
   CH19    = 'EQ6 3.19 Child: Ever beaten' 
   CH20    = 'EQ6 3.20 Child: Ever scolded' 
   CH22    = 'EQ6 3.22 Child: School code' 
   SM3     = 'EQ12 8.3 Short Term Morbidity Days ill last 30 days' 
   SM4     = 'EQ12 8.4 Short Term Morbidity Fever last 30 days' 
   SM5     = 'EQ12 8.5 Short Term Morbidity Cough last 30 days' 
   SM6     = 'EQ12 8.6 Short Term Morbidity Cough with short breaths' 
   SM7     = 'EQ12 8.7 Diarrhea' 
   SM8     = 'EQ12 8.8 Diarrhea with blood' 
   SM9     = 'EQ12 8.9 Liquid intake if Diarrhea' 
   SM10    = 'EQ12 8.10 ORS given if Diarrhea' 
   SM11    = 'EQ12 8.11 Short Term Morbidity How many days disabled in last 30 days' 
   SM12    = 'EQ12 8.12 Short Term Morbidity Received advice or treatment in last month' 
   SM14A   = 'EQ13 8.14a Short Term Morbidity Who gave advice or treatment 1st' 
   SM14B   = 'EQ13 8.14b Short Term Morbidity Where received advice or treatment 1st' 
   SM15A   = 'EQ13 8.15a Short Term Morbidity Who gave advice or treatment 2nd' 
   SM15B   = 'EQ13 8.15b Short Term Morbidity Where received advice or treatment 2nd' 
   SM16    = 'EQ13 8.16 Short Term Morbidity Treatment type' 
   SM17    = 'EQ13 8.17 Short Term Morbidity Days hospitalized' 
   SM18    = 'EQ13 8.18 Short Term Morbidity Total cost for inpatient/outpatient (doctor, hospital, surgery) Rs' 
   SM19    = 'EQ13 8.19 Short Term Morbidity Tests and medicines included in fees' 
   SM20    = 'EQ13 8.20 Short Term Morbidity Cost for medicines/tests/expenses not included in doctor/hospital 
fees Rs' 
   SM21    = 'EQ13 8.21 Short Term Morbidity Treatment travel expenses Rs' 
   SM22    = 'EQ13 8.22 Short Term Morbidity Expenditures covered by medical Insurance Rs' 
   MB3     = 'EQ14 9.3 Major Morbidity Cataract' 
   MB4     = 'EQ14 9.4 Major Morbidity Tuberculosis (TB)' 
   MB5     = 'EQ14 9.5 Major Morbidity High Blood Pressure' 
   MB6     = 'EQ14 9.6 Major Morbidity Heart disease' 
   MB7     = 'EQ14 9.7 Major Morbidity Diabetes' 
   MB8     = 'EQ14 9.8 Major Morbidity Leprosy' 
   MB9     = 'EQ14 9.9 Major Morbidity Cancer' 
   MB10    = 'EQ14 9.10 Major Morbidity Asthma' 
   MB11    = 'EQ14 9.11 Major Morbidity Polio' 
   MB12    = 'EQ14 9.12 Major Morbidity Paralysis' 
   MB13    = 'EQ14 9.13 Major Morbidity Epilepsy' 
   MB14    = 'EQ14 9.14 Major Morbidity Mental illness' 
   MB15    = 'EQ14 9.15 Major Morbidity STD or AIDS' 
   MB16    = 'EQ14 9.16 Major Morbidity Accident' 
   MB17    = 'EQ14 9.17 Major Morbidity Other long term' 
   MB18    = 'EQ14 9.18 Major Morbidity How many days disabled in last 12 months' 
   MB19    = 'EQ14 9.19 Major Morbidity Received advice or treatment in last 12 months' 
   MB21A   = 'EQ15 9.21 Major Morbidity Who gave advice or treatment 1st' 
   MB21B   = 'EQ15 9.21 Major Morbidity Where received advice or treatment 1st' 
   MB22A   = 'EQ15 9.22 Major Morbidity Who gave advice or treatment 2nd' 
   MB22B   = 'EQ15 9.22 Major Morbidity Where received advice or treatment 2nd' 
   MB23    = 'EQ15 9.23 Major Morbidity Treatment type' 
   MB24    = 'EQ15 9.24 Major Morbidity Days hospitalized' 
   MB25    = 'EQ15 9.25 Major morbidity Cost Dr/hosp (in rupees)' 
   MB26    = 'EQ15 9.26 Major Morbidity Tests and medicines included in fees' 
   MB27    = 'EQ15 9.27 Major morbidity Cost Medicine (in rupees)' 
   MB28    = 'EQ15 9.28 Major morbidity Cost Travel (in rupees)' 
   MB29    = 'EQ15 9.29 Major Morbidity Expenditures covered by medical Insurance Rs' 
   AD3     = 'EQ16 10.3 Difficulty Walking 1km' 
   AD4     = 'EQ16 10.4 Difficulty Toilet' 
   AD5     = 'EQ16 10.5 Difficulty Dressing' 
   AD6     = 'EQ16 10.6 Difficulty Hearing' 
   AD7     = 'EQ16 10.7 Difficulty Speaking' 
   AD8     = 'EQ16 10.8 Difficulty Far sight' 
   AD9     = 'EQ16 10.9 Difficulty Short sight' 
   TO3     = 'EQ17 12.3 Smoke cigarettes' 
   TO4     = 'EQ17 12.4 Smoke bidis or hukkah' 
   TO5     = 'EQ17 12.5 Chew tobacco / gutkha' 
   TO6     = 'EQ17 12.6 Drink alcohol' 
   AP2     = 'EQ36 25.2 Eligible woman questionnaire' 
   AP3     = 'EQ36 25.3 Anthropometry Birth ID' 
   AP5     = 'EQ36 25.5 Anthropometry Height 1st' 
   AP6     = 'EQ36 25.6 Anthropometry Height 2nd' 
   AP7     = 'EQ36 25.7 Anthropometry Position' 
   AP8     = 'EQ36 25.8 Anthropometry Weight 1st' 
   AP9     = 'EQ36 25.9 Anthropometry Weight 2nd' 
   EW3Y    = 'EQ19 14.3 Respondent is Eligible Woman' 
   URBAN2011= 'Urban residence from census 2011' 
   URBAN4_2011= '4-cat urban/rural from 2011 census & IHDS-II vill q' 
   METRO   = 'Largest 6 metro areas 0/1' 
   METRO6  = 'Largest 6 metro areas 1-6' 
   POVLINE2005= 'Poverty cutoff specific for state/urban sector Tendulkar 2004-05 line' 
   POVLINE2012= 'Poverty cut off Tendulkar Method, adjusted for interview date' 
   DEFLATOR= 'Deflator for converting 2012 prices, CPI based, month adj.' 
   NPERSONS= 'HQ4 2.0 N in household' 
   EWELIGIBLE= 'HH4 2.3,5,6 Woman 15-49 ever married' 
   EWQELIGIBLE= 'HH4 2.3,5,6 EW q and 15-49 ever married' 
   ID11    = 'HQ3 1.11 Religion' 
   ID13    = 'HQ3 1.13 Caste category' 
   GROUPS  = 'HQ3 1.13-15 Caste & religion' 
   NF5     = 'HQ14 8.5 Business 1: Net income (rupees)' 
   NF25    = 'HQ15 8.25 Business 2: Net income (rupees)' 
   NF45    = 'HQ16 8.45 Business 3: Net income (rupees)' 
   COTOTAL = 'HQ23 14. Total household consumption expenditure' 
   COPC    = 'HQ23 14. household expenditure /capita' 
   ASSETS  = 'Total household assets (0-33)' 
   ASSETS2005= 'Total household assets, same as IHDS 2005' 
   INCCROP = 'HQ7-10 Income from crops minus expenses' 
   INCAGPROP= 'HQ7 5.14,41 Rs land, other rented out' 
   INCANIMAL= 'HQ11,23 mkt + home - cost' 
   INCAG   = 'HQ7-10 Income from agriculture minus expenses' 
   INCBUS  = 'HQ14-16 8.5,25,45 All businesses: Net income' 
   INCOTHER= 'HQ17 9.1-3 Income from property, pensions (rupees)' 
   INCEARN = 'HQ13 7.10-12 annual household wage and salary earnings with bonuses' 
   INCBENEFITS= 'HQ17 9.5+13,1-8 all Government benefits Rs' 
   INCREMIT= 'HQ5 3.13a Rs received by household from non-resident last year' 
   INCOME  = 'HQ Total income' 
   INCOMEPC= 'HQ per capita income' 
   WKANIMAL= 'HQ11 an5+ work participation animals' 
   WKBUSINESS= 'HQ14-16 nf12+ work participation business' 
   WS3NM   = 'HQ12 7.3 Job description -job1' 
   WS4     = 'HQ12 7.4 Occupation -job1' 
   WS5     = 'HQ12 7.5 Industry -job1' 
   WS7     = 'HQ13 7.7 Working days -person total' 
   WS7MONTHS= 'HQ13 7.7 Work months last year' 
   WS8     = 'HQ13 7.8 Work hours/day -job1' 
   WS8YEAR = 'HQ13 7.5&6.6 Work hours/year -person total' 
   WS9     = 'HQ13 7.9 Pay period -job1' 
   WS10    = 'HQ13 7.10 Pay rate -job1 (rupees)' 
   WS10ANNUAL= 'HQ13 7.8 annual cash wages' 
   WSEARN  = 'HQ13 7.10 annual earnings -person total' 
   WSEARNHOURLY= 'HQ13 7.10 hourly wage & bonuses, max=10000' 
   WS11    = 'HQ13 7.11 Meals/housing -person total' 
   WS11MEALS= 'HQ13 7.11 Meals benefit -any job' 
   WS11HOUSE= 'HQ13 7.11 Housing benefit -any job' 
   WS11MEALSRS= 'HQ13 7.11 Meals benefit Rs person total' 
   WS11HOUSERS= 'HQ13 7.11 Housing benefit Rs person total' 
   WS12    = 'HQ13 7.12 Bonus -person total' 
   WS13    = 'HQ13 7.13 Casual -job1' 
   WS14    = 'HQ13 7.14 Government, NREGA, private' 
   WS15    = 'HQ13 7.15 Minutes to workplace' 
   WS7AGLAB= 'HQ13 7.5 agricultural labour: days/year' 
   WS8AGLAB= 'HQ13 7.5, agricultural labour: hours/year' 
   WSEARNAGLAB= 'HQ13 7.8+ agricultural labour: annual earnings' 
   WKAGLAB = 'HQ13 7.3 Farm wage labour (5cat)' 
   WS7NONAG= 'HQ13 7.5 non-agricultural labour: days/year' 
   WS8NONAG= 'HQ13 7.5, non-agricultural labour: hours/year' 
   WSEARNNONAG= 'HQ13 7.8+ non-agricultural labour: annual wages' 
   WKNONAG = 'HQ13 7.3 non-agricultural wage labour (5cat)' 
   WS7SALARY= 'HQ13 7.5 salary position: days/year' 
   WS8SALARY= 'HQ13 7.5, salary position: hours/year' 
   WSEARNSALARY= 'HQ13 7.8+ salary position: annual wages' 
   WKSALARY= 'HQ13 7.3 Salary position (5cat)' 
   WS7NREGA= 'HQ13 7.5 NREGA position: days/year' 
   WS8NREGA= 'HQ13 7.5, NREGA position: hours/year' 
   WSEARNNREGA= 'HQ13 7.8+ NREGA position: annual wages' 
   WKNREGA = 'HQ13 7.3 NREGA work (5cat)' 
   WKDAYS  = 'HQ work days /year (farm, business, wage|salary)' 
   WKHOURS = 'HQ work hours /year (farm, business, wage|salary)' 
   WKANY5  = 'HQ work participation (farm, business, wage|salary)' 
   RSUNEARN= 'ind: other Household income' 
   MHEADAGE= 'HQ4 2.5 ro5 Age of male head' 
   FHEADAGE= 'HQ4 2.5 ro5 Age of female head' 
   NADULTM = 'HQ4 2.5 # 21+ men in Household' 
   NADULTF = 'HQ4 2.5 N 21+ women in Household' 
   NCHILDM = 'HQ4 2.5 # 0-14 boys in Household' 
   NCHILDF = 'HQ4 2.5 # 0-14 girls in Household' 
   NTEENM  = 'HQ4 2.5 # 15-20 boys in Household' 
   NTEENF  = 'HQ4 2.5 # 15-20 girls in Household' 
   NELDERM = 'HQ4 2.5 # 60+ men in Household' 
   NELDERF = 'HQ4 2.5 # 60+ women in household' 
   NMARRIEDM= 'HQ4 2.6 N married men in Household' 
   NMARRIEDF= 'HQ4 2.6 N married women in Household' 
   NWKNONAG= 'HQ13 7.3 Number of workers (>=240hrs): non-agricultural wage' 
   NWKAGLAB= 'HQ13 7.3 Number of workers (>=240hrs): farm wage' 
   NWKSALARY= 'HQ13 7.3 Number of workers (>=240hrs): salary position' 
   NWKBUSINESS= 'HQ14-16 nf12,13 Number of workers (>=240hrs): business' 
   NWKFARM = 'HQ10 fm37,38 Number of workers (>=240hrs): farm' 
   NWKANIMAL= 'HQ11 an5 Number of workers (often): animal' 
   NWKNREGA= 'HQ13 7.3 Number of workers (>=240hrs): NREGA' 
   NWKNREGA4= 'HQ13 7.3 Number of workers, any hours: NREGA' 
   NWKNONNREGA= 'HQ13 7.3 Number of workers (>=240hrs): non-agricultural wage not NREGA' 
   NWKANY5 = 'HQ10-16 Number of workers (>=240hrs): any job' 
   INCNONAG= 'HQ13 7.3 income: non-agricultural wage' 
   INCAGLAB= 'HQ13 7.3 income: farm wage' 
   INCSALARY= 'HQ13 7.3 income: salary position' 
   INCNREGA= 'HQ13 7.3 income: NREGA' 
   INCNONNREGA= 'HQ13 7.3 income: non-agricultural wage not NREGA' 
   NNR     = 'HQ5 3.0 # Household nonresidents' 
   HHEDUC  = 'HQ19 11.6 Highest adult Education' 
   HHEDUCM = 'HQ19 11.6 Highest male adult education' 
   HHEDUCF = 'HQ19 11.6 Highest female adult education' 
   MG4     = 'HQ6 4.4 Place of migration' 
   MG5     = 'HQ6 4.5 Rural/ Urban' 
   MG6     = 'HQ6 4.6 Gone alone or with family?' 
   MG7     = 'HQ6 4.7 Gone for how many months?' 
   MG8     = 'HQ6 4.8 How many years ago?' 
   MG9NM   = 'HQ6 4.9 Type of work' 
   MG10    = 'HQ6 4.10 Occupation code' 
   MG11    = 'HQ6 4.11 Name migrated through' 
   MGYEAR5 = 'HQ6 4.1 Migrant five years ago or less' 
   NMIG5   = 'HQ6 4.1 # migrations in last 5 years' 
   MGMONTHS5= 'HQ6 4.7 total months gone in last 5 years' 
   MGYEAR1 = 'HQ6 4.8 Migrant one year ago or less' 
   NMIG1   = 'HQ6 4.1 # migrations in last 1 year' 
   MGMONTHS1= 'HQ6 4.7 total months gone in last 1 year' 
        ; 


* USER-DEFINED MISSING VALUES RECODE TO SAS SYSMIS;

/*
   IF (MB21B = 8) THEN MB21B = .;
*/


* SAS FORMAT STATEMENT;

/*
   FORMAT
         AD3 ad3fffff. AD4 ad3fffff. AD5 ad3fffff.
         AD6 ad3fffff. AD7 ad3fffff. AD8 ad3fffff.
         AD9 ad3fffff. AN1 fm1fffff. AN5Y fm1fffff.
         AN6 an6fffff. AN7Y fm1fffff. AP2 ap2fffff.
         AP7 ap7fffff. CH10 ch10ffff. CH11 ch6fffff.
         CH12 fm1fffff. CH13 fm1fffff. CH15 ch15ffff.
         CH16 ch16ffff. CH18 fm1fffff. CH19 fm1fffff.
         CH2 ch2fffff. CH20 fm1fffff. CH4A ch4affff.
         CH4B ch4affff. CH5 fm1fffff. CH6 ch6fffff.
         CH7 ro3fffff. CH8 fm1fffff. CH9 ch6fffff.
         CS17 cs17ffff. CS18 cs18ffff. CS19 cs19ffff.
         CS20 cs20ffff. CS21 fm1fffff. CS22 fm1fffff.
         CS23 fm1fffff. CS3 cs3fffff. CS3Y fm1fffff.
         CS4 cs4fffff. CS6 ed6fffff. CS7 cs7fffff.
         CS8 ta8affff. CS9 ed6fffff. DISTRICT districf.
         ED10 ed10ffff. ED11 ed11ffff. ED12 ed12ffff.
         ED2 fm1fffff. ED3 ed3fffff. ED4 fm1fffff.
         ED5 fm1fffff. ED6 ed6fffff. ED7 fm1fffff.
         ED9 ed9fffff. EDUC7 educ7fff. EDUNDER1 fm1fffff.
         EW3Y fm1fffff. EWELIGIBLE fm1fffff. EWQELIGIBLE fm1fffff.
         FM1 fm1fffff. FM36Y fm1fffff. FM39AY fm1fffff.
         GROUPS groupsff. HHEDUC ed6fffff. HHEDUCF ed6fffff.
         HHEDUCM ed6fffff. ID11 id11ffff. ID13 id13ffff.
         IN11S1 fm1fffff. IN11S2 fm1fffff. IN11S3 fm1fffff.
         IN11S4 fm1fffff. IN11S5 fm1fffff. IN11S6 fm1fffff.
         IN11S7 fm1fffff. IN11S8 fm1fffff. IN22 in22ffff.
         MB10 mb3fffff. MB11 mb3fffff. MB12 mb3fffff.
         MB13 mb3fffff. MB14 mb3fffff. MB15 mb3fffff.
         MB16 mb3fffff. MB17 mb3fffff. MB19 fm1fffff.
         MB21A sm14afff. MB21B mb21bfff. MB22A sm14afff.
         MB22B mb22bfff. MB23 sm16ffff. MB26 fm1fffff.
         MB3 mb3fffff. MB4 mb3fffff. MB5 mb3fffff.
         MB6 mb3fffff. MB7 mb3fffff. MB8 mb3fffff.
         MB9 mb3fffff. METRO metrofff. METRO6 metro6ff.
         MG10 ws4fffff. MG11 mg11ffff. MG4 mg4fffff.
         MG5 urban20f. MG6 mg6fffff. MGYEAR1 fm1fffff.
         MGYEAR5 fm1fffff. MM12Y fm1fffff. MM13 fm1fffff.
         MM14 fm1fffff. MM7Y fm1fffff. MM8 fm1fffff.
         MM9 mm9fffff. NF1 fm1fffff. NF15Y fm1fffff.
         NF29 nf29ffff. NF35Y fm1fffff. NF49 nf49ffff.
         NF55Y fm1fffff. NF9 nf9fffff. NFBN1 nfbn1fff.
         NFBN21 nfbn21ff. NFBN41 nfbn41ff. RO10 ro8fffff.
         RO3 ro3fffff. RO4 ro4fffff. RO6 ro6fffff.
         RO7 ro7fffff. RO8 ro8fffff. RO9 ro8fffff.
         SM10 fm1fffff. SM12 fm1fffff. SM14A sm14afff.
         SM14B sm14bfff. SM15A sm14afff. SM15B sm14bfff.
         SM16 sm16ffff. SM19 fm1fffff. SM4 fm1fffff.
         SM5 fm1fffff. SM6 fm1fffff. SM7 fm1fffff.
         SM8 fm1fffff. SM9 sm9fffff. STATEID stateidf.
         SURVEY surveyff. TA10A ta8affff. TA10B ta10bfff.
         TA3 ta3fffff. TA5 fm1fffff. TA6 ta6fffff.
         TA8A ta8affff. TA8B ta8bffff. TA9A ta8affff.
         TA9B ta9bffff. TO3 to3fffff. TO4 to3fffff.
         TO5 to3fffff. TO6 to3fffff. URBAN2011 urban20f.
         URBAN4_2011 urban4_f. WKAGLAB wkfarmff. WKANIMAL wkanimaf.
         WKANY5 wkanimaf. WKBUSINESS wkanimaf. WKFARM wkfarmff.
         WKNONAG wkfarmff. WKNREGA wkfarmff. WKSALARY wkfarmff.
         WS11 ws11ffff. WS11HOUSE fm1fffff. WS11MEALS fm1fffff.
         WS13 ws13ffff. WS14 ws14ffff. WS4 ws4fffff.
         WS5 ws5fffff. WS9 ws9fffff.
    ;
*/

RUN ;
