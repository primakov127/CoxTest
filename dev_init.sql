create table if not exists zip
(
	zip integer not null constraint zip_pkey primary key,
	city varchar(50),
	state_code varchar(2) not null
);

create table if not exists state_region
(
	state_code varchar(2) not null constraint state_region_pkey primary key,
	region varchar(2)
);

INSERT INTO zip (zip, city, state_code)
VALUES
(1001,'Agawam','MA'),
(1010,'Brimfield','MA'),
(1020,'Chicopee','MA'),
(1030,'Feeding Hills','MA'),
(1031,'Gilbertville','MA'),
(1032,'Goshen','MA'),
(1033,'Granby','MA'),
(1034,'Granville','MA'),
(1035,'Hadley','MA'),
(1036,'Hampden','MA'),
(1037,'Hardwick','MA'),
(1038,'Hatfield','MA'),
(1039,'Haydenville','MA'),
(1040,'Holyoke','MA'),
(1050,'Huntington','MA'),
(3031,'Amherst','NH'),
(3032,'Auburn','NH'),
(3033,'Brookline','NH'),
(3034,'Candia','NH'),
(3036,'Chester','NH'),
(3037,'Deerfield','NH'),
(3038,'Derry','NH'),
(3042,'Epping','NH'),
(3043,'Francestown','NH'),
(3044,'Fremont','NH'),
(3045,'Goffstown','NH'),
(3046,'Dunbarton','NH'),
(3047,'Greenfield','NH'),
(3048,'Greenville','NH'),
(3049,'Hollis','NH'),
(3051,'Hudson','NH'),
(3052,'Litchfield','NH'),
(3053,'Londonderry','NH'),
(3054,'Merrimack','NH'),
(3055,'Milford','NH'),
(3057,'Mont Vernon','NH'),
(3060,'Nashua','NH'),
(3062,'Nashua','NH'),
(3063,'Nashua','NH'),
(3064,'Nashua','NH'),
(3070,'New Boston','NH'),
(3071,'New Ipswich','NH'),
(3076,'Pelham','NH'),
(3077,'Raymond','NH'),
(3079,'Salem','NH'),
(3082,'Lyndeborough','NH'),
(3084,'Temple','NH'),
(3086,'Wilton','NH'),
(3087,'Windham','NH'),
(93513,'Big Pine','CA'),
(93514,'Bishop','CA'),
(93516,'Boron','CA'),
(96740,'Kailua Kona','HI'),
(96741,'Kalaheo','HI'),
(96742,'Kalaupapa','HI'),
(96743,'Kamuela','HI'),
(96744,'Kaneohe','HI'),
(96746,'Kapaa','HI'),
(96747,'Kaumakani','HI'),
(96748,'Kaunakakai','HI'),
(96749,'Keaau','HI'),
(96750,'Kealakekua','HI'),
(96751,'Kealia','HI'),
(96752,'Kekaha','HI'),
(96753,'Kihei','HI'),
(96754,'Kilauea','HI'),
(96755,'Kapaau','HI'),
(96756,'Koloa','HI'),
(96757,'Kualapuu','HI'),
(96759,'Kunia','HI'),
(96760,'Kurtistown','HI'),
(96761,'Lahaina','HI'),
(96762,'Laie','HI'),
(96763,'Lanai City','HI'),
(97880,'Ukiah','OR'),
(97882,'Umatilla','OR'),
(97883,'Union','OR'),
(97884,'Unity','OR'),
(99901,'Ketchikan','AK'),
(99903,'Meyers Chuck','AK'),
(99918,'Coffman Cove','AK'),
(99919,'Thorne Bay','AK'),
(99921,'Craig','AK'),
(99922,'Hydaburg','AK'),
(99923,'Hyder','AK'),
(99925,'Klawock','AK'),
(99926,'Metlakatla','AK'),
(99927,'Point Baker','AK'),
(99929,'Wrangell','AK');

INSERT INTO state_region (state_code, region)
VALUES
    ('AL','SE'), -- Alabama
    ('AK','WC'), -- Alaska
    ('AZ','WC'), -- Arizona
    ('AR','SW'), -- Arkansas
    ('CA','WC'), -- California
    ('CO','SW'), -- Colorado
    ('CT','NE'), -- Connecticut
    ('DE','NE'), -- Delaware
    ('FL','SE'), -- Florida
    ('GA','SE'), -- Georgia
    ('HI','WC'), -- Hawaii
    ('ID','WC'), -- Idaho
    ('IL','MW'), -- Illinois
    ('IN','MW'), -- Indiana
    ('IA','MW'), -- Iowa
    ('KS','MW'), -- Kansas
    ('KY','MW'), -- Kentucky
    ('LA','SE'), -- Louisiana
    ('ME','NE'), -- Maine
    ('MD','NE'), -- Maryland
    ('MA','NE'), -- Massachusetts
    ('MI','MW'), -- Michigan
    ('MN','MW'), -- Minnesota
    ('MS','SE'), -- Mississippi
    ('MO','MW'), -- Missouri
    ('MT','WC'), -- Montana
    ('NE','SW'), -- Nebraska
    ('NV','WC'), -- Nevada
    ('NH','NE'), -- New Hampshire
    ('NJ','NE'), -- New Jersey
    ('NM','SW'), -- New Mexico
    ('NY','NE'), -- New York
    ('NC','SE'), -- North California
    ('ND','MW'), -- North Dakota
    ('OH','MW'), -- Ohio
    ('OK','SW'), -- Oklahoma
    ('OR','WC'), -- Oregon
    ('PA','NE'), -- Pennsylvania
    ('RI','NE'), -- Rhode Island
    ('SC','SE'), -- South California
    ('SD','MW'), -- South Dakota
    ('TN','SE'), -- Tennessee
    ('TX','SW'), -- Texas
    ('UT','WC'), -- Utah
    ('VT','NE'), -- Vermont
    ('VA','NE'), -- Virginia
    ('WA','WC'), -- Washington
    ('WV','SE'), -- West Virginia
    ('WI','MW'), -- Wisconsin
    ('WY','WC')  -- Wyoming
;

/*
get_state_from_zip (_zip integer) RETURNS varchar(2)
get_state_from_zip_audit (_zip integer) RETURNS RECORD

get_region_from_zip (_zip varchar(10)) RETURNS varchar(2)
get_region_from_zip_audit (_zip varchar(10)) RETURNS RECORD
*/