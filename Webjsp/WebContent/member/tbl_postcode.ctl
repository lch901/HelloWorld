load data
infile tbl_postcode.csv
replace
into table tbl_postcode
fields terminated by ','
(       NO,
        ZIPCODE,
        SIDO nullif SIDO=blanks,
        gugun nullif gugun=blanks,
        DONG nullif DONG=blanks,
        RI nullif RI=blanks,
        BUNJI nullif BUNJI=blanks
)