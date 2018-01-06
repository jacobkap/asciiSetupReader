/*
   NOTE: You need to edit the `libname` command to specify the path to the directory
   where the data file is located. For example: "C:\ipums_directory".
   Edit the `filename` command similarly to include the full path (the directory and the data file name).
*/

libname IPUMS ".";
filename ASCIIDAT "usa_00103.dat";

proc format cntlout = IPUMS.usa_00103_f;

value STATEFIP_f
  01 = "Alabama"
  02 = "Alaska"
  04 = "Arizona"
  05 = "Arkansas"
  06 = "California"
  08 = "Colorado"
  09 = "Connecticut"
  10 = "Delaware"
  11 = "District of Columbia"
  12 = "Florida"
  13 = "Georgia"
  15 = "Hawaii"
  16 = "Idaho"
  17 = "Illinois"
  18 = "Indiana"
  19 = "Iowa"
  20 = "Kansas"
  21 = "Kentucky"
  22 = "Louisiana"
  23 = "Maine"
  24 = "Maryland"
  25 = "Massachusetts"
  26 = "Michigan"
  27 = "Minnesota"
  28 = "Mississippi"
  29 = "Missouri"
  30 = "Montana"
  31 = "Nebraska"
  32 = "Nevada"
  33 = "New Hampshire"
  34 = "New Jersey"
  35 = "New Mexico"
  36 = "New York"
  37 = "North Carolina"
  38 = "North Dakota"
  39 = "Ohio"
  40 = "Oklahoma"
  41 = "Oregon"
  42 = "Pennsylvania"
  44 = "Rhode Island"
  45 = "South Carolina"
  46 = "South Dakota"
  47 = "Tennessee"
  48 = "Texas"
  49 = "Utah"
  50 = "Vermont"
  51 = "Virginia"
  53 = "Washington"
  54 = "West Virginia"
  55 = "Wisconsin"
  56 = "Wyoming"
  61 = "Maine-New Hampshire-Vermont"
  62 = "Massachusetts-Rhode Island"
  63 = "Minnesota-Iowa-Missouri-Kansas-Nebraska-S.Dakota-N.Dakota"
  64 = "Maryland-Delaware"
  65 = "Montana-Idaho-Wyoming"
  66 = "Utah-Nevada"
  67 = "Arizona-New Mexico"
  68 = "Alaska-Hawaii"
  72 = "Puerto Rico"
  97 = "Military/Mil. Reservation"
  99 = "State not identified"
;

value GQ_f
  0 = "Vacant unit"
  1 = "Households under 1970 definition"
  2 = "Additional households under 1990 definition"
  3 = "Group quarters--Institutions"
  4 = "Other group quarters"
  5 = "Additional households under 2000 definition"
  6 = "Fragment"
;

value SEX_f
  1 = "Male"
  2 = "Female"
;

value AGE_f
  000 = "Less than 1 year old"
  001 = "1"
  002 = "2"
  003 = "3"
  004 = "4"
  005 = "5"
  006 = "6"
  007 = "7"
  008 = "8"
  009 = "9"
  010 = "10"
  011 = "11"
  012 = "12"
  013 = "13"
  014 = "14"
  015 = "15"
  016 = "16"
  017 = "17"
  018 = "18"
  019 = "19"
  020 = "20"
  021 = "21"
  022 = "22"
  023 = "23"
  024 = "24"
  025 = "25"
  026 = "26"
  027 = "27"
  028 = "28"
  029 = "29"
  030 = "30"
  031 = "31"
  032 = "32"
  033 = "33"
  034 = "34"
  035 = "35"
  036 = "36"
  037 = "37"
  038 = "38"
  039 = "39"
  040 = "40"
  041 = "41"
  042 = "42"
  043 = "43"
  044 = "44"
  045 = "45"
  046 = "46"
  047 = "47"
  048 = "48"
  049 = "49"
  050 = "50"
  051 = "51"
  052 = "52"
  053 = "53"
  054 = "54"
  055 = "55"
  056 = "56"
  057 = "57"
  058 = "58"
  059 = "59"
  060 = "60"
  061 = "61"
  062 = "62"
  063 = "63"
  064 = "64"
  065 = "65"
  066 = "66"
  067 = "67"
  068 = "68"
  069 = "69"
  070 = "70"
  071 = "71"
  072 = "72"
  073 = "73"
  074 = "74"
  075 = "75"
  076 = "76"
  077 = "77"
  078 = "78"
  079 = "79"
  080 = "80"
  081 = "81"
  082 = "82"
  083 = "83"
  084 = "84"
  085 = "85"
  086 = "86"
  087 = "87"
  088 = "88"
  089 = "89"
  090 = "90 (90+ in 1980 and 1990)"
  091 = "91"
  092 = "92"
  093 = "93"
  094 = "94"
  095 = "95"
  096 = "96"
  097 = "97"
  098 = "98"
  099 = "99"
  100 = "100 (100+ in 1960-1970)"
  101 = "101"
  102 = "102"
  103 = "103"
  104 = "104"
  105 = "105"
  106 = "106"
  107 = "107"
  108 = "108"
  109 = "109"
  110 = "110"
  111 = "111"
  112 = "112 (112+ in the 1980 internal data)"
  113 = "113"
  114 = "114"
  115 = "115 (115+ in the 1990 internal data)"
  116 = "116"
  117 = "117"
  118 = "118"
  119 = "119"
  120 = "120"
  121 = "121"
  122 = "122"
  123 = "123"
  124 = "124"
  125 = "125"
  126 = "126"
  129 = "129"
  130 = "130"
  135 = "135"
;

run;

data IPUMS.usa_00103;
infile ASCIIDAT pad missover lrecl=21;

input
  STATEFIP   1-2
  GQ         3-3
  PERNUM     4-7
  PERWT      8-17 .2
  SEX        18-18
  AGE        19-21
;

label
  STATEFIP = "State (FIPS code)"
  GQ       = "Group quarters status"
  PERNUM   = "Person number in sample unit"
  PERWT    = "Person weight"
  SEX      = "Sex"
  AGE      = "Age"
;

format
  STATEFIP  STATEFIP_f.
  GQ        GQ_f.
  SEX       SEX_f.
  AGE       AGE_f.
;

format
  PERWT     11.2
;

run;

