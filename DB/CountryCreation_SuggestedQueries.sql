-----------------------------------------------------------------------------------------------------------------------

select * from game g ;--con este muestra toda la tabla game
select * from country c ;-- con este muestra toda la tabla country

-- Cree la tabla country 
create table if not exists country(
	codeID serial primary key,
	name varchar(50) unique not null
);
alter table country 
add column acronyms varchar(30);

-- Crear la columna "country_fk" en la tabla "usuarios"
ALTER TABLE users
ADD COLUMN country_fk int;

-- Agregar la restricción de llave foránea a users
ALTER TABLE users 
ADD CONSTRAINT country_fk FOREIGN KEY (country_fk)
REFERENCES country (codeID);

--ME CANSE INTENTAR METER LA BASE DE DATOS DEL COUNTRY CON EL IMPORT DATA, ASI QUE LOS INGRESE MANUALMENTE XD

insert into country (codeid , "name" , acronyms) values (  , ' ', ' ');


INSERT INTO country (codeid, "name", acronyms) VALUES (4, 'Afghanistan', 'AFG');
INSERT INTO country (codeid, "name", acronyms) VALUES (248, 'Åland Islands', 'ALA');
INSERT INTO country (codeid, "name", acronyms) VALUES (8, 'Albania', 'ALB');
INSERT INTO country (codeid, "name", acronyms) VALUES (12, 'Algeria', 'DZA');
INSERT INTO country (codeid, "name", acronyms) VALUES (16, 'American Samoa', 'ASM');
INSERT INTO country (codeid, "name", acronyms) VALUES (20, 'Andorra', 'AND');
INSERT INTO country (codeid, "name", acronyms) VALUES (24, 'Angola', 'AGO');
INSERT INTO country (codeid, "name", acronyms) VALUES (660, 'Anguilla', 'AIA');
INSERT INTO country (codeid, "name", acronyms) VALUES (10, 'Antarctica', 'ATA');
INSERT INTO country (codeid, "name", acronyms) VALUES (28, 'Antigua and Barbuda', 'ATG');
INSERT INTO country (codeid, "name", acronyms) VALUES (32, 'Argentina', 'ARG');
INSERT INTO country (codeid, "name", acronyms) VALUES (51, 'Armenia', 'ARM');
INSERT INTO country (codeid, "name", acronyms) VALUES (533, 'Aruba', 'ABW');
INSERT INTO country (codeid, "name", acronyms) VALUES (36, 'Australia', 'AUS');
INSERT INTO country (codeid, "name", acronyms) VALUES (40, 'Austria', 'AUT');
INSERT INTO country (codeid, "name", acronyms) VALUES (31, 'Azerbaijan', 'AZE');
INSERT INTO country (codeid, "name", acronyms) VALUES (44, 'Bahamas', 'BHS');
INSERT INTO country (codeid, "name", acronyms) VALUES (48, 'Bahrain', 'BHR');
INSERT INTO country (codeid, "name", acronyms) VALUES (50, 'Bangladesh', 'BGD');
INSERT INTO country (codeid, "name", acronyms) VALUES (52, 'Barbados', 'BRB');
INSERT INTO country (codeid, "name", acronyms) VALUES (112, 'Belarus', 'BLR');
INSERT INTO country (codeid, "name", acronyms) VALUES (56, 'Belgium', 'BEL');
INSERT INTO country (codeid, "name", acronyms) VALUES (84, 'Belize', 'BLZ');
INSERT INTO country (codeid, "name", acronyms) VALUES (204, 'Benin', 'BEN');
INSERT INTO country (codeid, "name", acronyms) VALUES (60, 'Bermuda', 'BMU');
INSERT INTO country (codeid, "name", acronyms) VALUES (64, 'Bhutan', 'BTN');
INSERT INTO country (codeid, "name", acronyms) VALUES (68, 'Bolivia (Plurinational State of)', 'BOL');
INSERT INTO country (codeid, "name", acronyms) VALUES (535, 'Bonaire, Sint Eustatius and Saba', 'BES');
INSERT INTO country (codeid, "name", acronyms) VALUES (70, 'Bosnia and Herzegovina', 'BIH');
INSERT INTO country (codeid, "name", acronyms) VALUES (72, 'Botswana', 'BWA');
INSERT INTO country (codeid, "name", acronyms) VALUES (74, 'Bouvet Island', 'BVT');
INSERT INTO country (codeid, "name", acronyms) VALUES (76, 'Brazil', 'BRA');
INSERT INTO country (codeid, "name", acronyms) VALUES (86, 'British Indian Ocean Territory', 'IOT');
INSERT INTO country (codeid, "name", acronyms) VALUES (96, 'Brunei Darussalam', 'BRN');
INSERT INTO country (codeid, "name", acronyms) VALUES (100, 'Bulgaria', 'BGR');
INSERT INTO country (codeid, "name", acronyms) VALUES (854, 'Burkina Faso', 'BFA');
INSERT INTO country (codeid, "name", acronyms) VALUES (108, 'Burundi', 'BDI');
INSERT INTO country (codeid, "name", acronyms) VALUES (132, 'Cabo Verde', 'CPV');
INSERT INTO country (codeid, "name", acronyms) VALUES (116, 'Cambodia', 'KHM');
INSERT INTO country (codeid, "name", acronyms) VALUES (120, 'Cameroon', 'CMR');
INSERT INTO country (codeid, "name", acronyms) VALUES (124, 'Canada', 'CAN');
INSERT INTO country (codeid, "name", acronyms) VALUES (136, 'Cayman Islands', 'CYM');
INSERT INTO country (codeid, "name", acronyms) VALUES (140, 'Central African Republic', 'CAF');
INSERT INTO country (codeid, "name", acronyms) VALUES (148, 'Chad', 'TCD');
INSERT INTO country (codeid, "name", acronyms) VALUES (152, 'Chile', 'CHL');
INSERT INTO country (codeid, "name", acronyms) VALUES (156, 'China', 'CHN');
INSERT INTO country (codeid, "name", acronyms) VALUES (162, 'Christmas Island', 'CXR');
INSERT INTO country (codeid, "name", acronyms) VALUES (166, 'Cocos (Keeling) Islands', 'CCK');
INSERT INTO country (codeid, "name", acronyms) VALUES (170, 'Colombia', 'COL');
INSERT INTO country (codeid, "name", acronyms) VALUES (174, 'Comoros', 'COM');
INSERT INTO country (codeid, "name", acronyms) VALUES (178, 'Congo', 'COG');
INSERT INTO country (codeid, "name", acronyms) VALUES (180, 'Congo, Democratic Republic of the', 'COD');
INSERT INTO country (codeid, "name", acronyms) VALUES (184, 'Cook Islands', 'COK');
INSERT INTO country (codeid, "name", acronyms) VALUES (188, 'Costa Rica', 'CRI');
INSERT INTO country (codeid, "name", acronyms) VALUES (384, 'Côte dIvoire', 'CIV');
INSERT INTO country (codeid, "name", acronyms) VALUES (191, 'Croatia', 'HRV');
INSERT INTO country (codeid, "name", acronyms) VALUES (192, 'Cuba', 'CUB');
INSERT INTO country (codeid, "name", acronyms) VALUES (531, 'Curaçao', 'CUW');
INSERT INTO country (codeid, "name", acronyms) VALUES (196, 'Cyprus', 'CYP');
INSERT INTO country (codeid, "name", acronyms) VALUES (203, 'Czechia', 'CZE');
INSERT INTO country (codeid, "name", acronyms) VALUES (208, 'Denmark', 'DNK');
INSERT INTO country (codeid, "name", acronyms) VALUES (262, 'Djibouti', 'DJI');
INSERT INTO country (codeid, "name", acronyms) VALUES (212, 'Dominica', 'DMA');
INSERT INTO country (codeid, "name", acronyms) VALUES (214, 'Dominican Republic', 'DOM');
INSERT INTO country (codeid, "name", acronyms) VALUES (218, 'Ecuador', 'ECU');
INSERT INTO country (codeid, "name", acronyms) VALUES (818, 'Egypt', 'EGY');
INSERT INTO country (codeid, "name", acronyms) VALUES (222, 'El Salvador', 'SLV');
INSERT INTO country (codeid, "name", acronyms) VALUES (226, 'Equatorial Guinea', 'GNQ');
INSERT INTO country (codeid, "name", acronyms) VALUES (232, 'Eritrea', 'ERI');
INSERT INTO country (codeid, "name", acronyms) VALUES (233, 'Estonia', 'EST');
INSERT INTO country (codeid, "name", acronyms) VALUES (748, 'Eswatini', 'SWZ');
INSERT INTO country (codeid, "name", acronyms) VALUES (231, 'Ethiopia', 'ETH');
INSERT INTO country (codeid, "name", acronyms) VALUES (238, 'Falkland Islands (Malvinas)', 'FLK');
INSERT INTO country (codeid, "name", acronyms) VALUES (234, 'Faroe Islands', 'FRO');
INSERT INTO country (codeid, "name", acronyms) VALUES (242, 'Fiji', 'FJI');
INSERT INTO country (codeid, "name", acronyms) VALUES (246, 'Finland', 'FIN');
INSERT INTO country (codeid, "name", acronyms) VALUES (250, 'France', 'FRA');
INSERT INTO country (codeid, "name", acronyms) VALUES (254, 'French Guiana', 'GUF');
INSERT INTO country (codeid, "name", acronyms) VALUES (258, 'French Polynesia', 'PYF');
INSERT INTO country (codeid, "name", acronyms) VALUES (260, 'French Southern Territories', 'ATF');
INSERT INTO country (codeid, "name", acronyms) VALUES (266, 'Gabon', 'GAB');
INSERT INTO country (codeid, "name", acronyms) VALUES (270, 'Gambia', 'GMB');
INSERT INTO country (codeid, "name", acronyms) VALUES (268, 'Georgia', 'GEO');
INSERT INTO country (codeid, "name", acronyms) VALUES (276, 'Germany', 'DEU');
INSERT INTO country (codeid, "name", acronyms) VALUES (288, 'Ghana', 'GHA');
INSERT INTO country (codeid, "name", acronyms) VALUES (292, 'Gibraltar', 'GIB');
INSERT INTO country (codeid, "name", acronyms) VALUES (300, 'Greece', 'GRC');
INSERT INTO country (codeid, "name", acronyms) VALUES (304, 'Greenland', 'GRL');
INSERT INTO country (codeid, "name", acronyms) VALUES (308, 'Grenada', 'GRD');
INSERT INTO country (codeid, "name", acronyms) VALUES (312, 'Guadeloupe', 'GLP');
INSERT INTO country (codeid, "name", acronyms) VALUES (316, 'Guam', 'GUM');
INSERT INTO country (codeid, "name", acronyms) VALUES (320, 'Guatemala', 'GTM');
INSERT INTO country (codeid, "name", acronyms) VALUES (831, 'Guernsey', 'GGY');
INSERT INTO country (codeid, "name", acronyms) VALUES (324, 'Guinea', 'GIN');
INSERT INTO country (codeid, "name", acronyms) VALUES (624, 'Guinea-Bissau', 'GNB');
INSERT INTO country (codeid, "name", acronyms) VALUES (328, 'Guyana', 'GUY');
INSERT INTO country (codeid, "name", acronyms) VALUES (332, 'Haiti', 'HTI');
INSERT INTO country (codeid, "name", acronyms) VALUES (334, 'Heard Island and McDonald Islands', 'HMD');
INSERT INTO country (codeid, "name", acronyms) VALUES (336, 'Holy See', 'VAT');
INSERT INTO country (codeid, "name", acronyms) VALUES (340, 'Honduras', 'HND');
INSERT INTO country (codeid, "name", acronyms) VALUES (344, 'Hong Kong', 'HKG');
INSERT INTO country (codeid, "name", acronyms) VALUES (348, 'Hungary', 'HUN');
INSERT INTO country (codeid, "name", acronyms) VALUES (352, 'Iceland', 'ISL');
INSERT INTO country (codeid, "name", acronyms) VALUES (356, 'India', 'IND');
INSERT INTO country (codeid, "name", acronyms) VALUES (360, 'Indonesia', 'IDN');
INSERT INTO country (codeid, "name", acronyms) VALUES (364, 'Iran (Islamic Republic of)', 'IRN');
INSERT INTO country (codeid, "name", acronyms) VALUES (368, 'Iraq', 'IRQ');
INSERT INTO country (codeid, "name", acronyms) VALUES (372, 'Ireland', 'IRL');
INSERT INTO country (codeid, "name", acronyms) VALUES (833, 'Isle of Man', 'IMN');
INSERT INTO country (codeid, "name", acronyms) VALUES (376, 'Israel', 'ISR');
INSERT INTO country (codeid, "name", acronyms) VALUES (380, 'Italy', 'ITA');
INSERT INTO country (codeid, "name", acronyms) VALUES (388, 'Jamaica', 'JAM');
INSERT INTO country (codeid, "name", acronyms) VALUES (392, 'Japan', 'JPN');
INSERT INTO country (codeid, "name", acronyms) VALUES (832, 'Jersey', 'JEY');
INSERT INTO country (codeid, "name", acronyms) VALUES (400, 'Jordan', 'JOR');
INSERT INTO country (codeid, "name", acronyms) VALUES (398, 'Kazakhstan', 'KAZ');
INSERT INTO country (codeid, "name", acronyms) VALUES (404, 'Kenya', 'KEN');
INSERT INTO country (codeid, "name", acronyms) VALUES (296, 'Kiribati', 'KIR');
INSERT INTO country (codeid, "name", acronyms) VALUES (408, 'Korea (Democratic People''s Republic of)', 'PRK');
INSERT INTO country (codeid, "name", acronyms) VALUES (410, 'Korea, Republic of', 'KOR');
INSERT INTO country (codeid, "name", acronyms) VALUES (414, 'Kuwait', 'KWT');
INSERT INTO country (codeid, "name", acronyms) VALUES (417, 'Kyrgyzstan', 'KGZ');
INSERT INTO country (codeid, "name", acronyms) VALUES (418, 'Lao People''s Democratic Republic', 'LAO');
INSERT INTO country (codeid, "name", acronyms) VALUES (428, 'Latvia', 'LVA');
INSERT INTO country (codeid, "name", acronyms) VALUES (422, 'Lebanon', 'LBN');
INSERT INTO country (codeid, "name", acronyms) VALUES (426, 'Lesotho', 'LSO');
INSERT INTO country (codeid, "name", acronyms) VALUES (430, 'Liberia', 'LBR');
INSERT INTO country (codeid, "name", acronyms) VALUES (434, 'Libya', 'LBY');
INSERT INTO country (codeid, "name", acronyms) VALUES (438, 'Liechtenstein', 'LIE');
INSERT INTO country (codeid, "name", acronyms) VALUES (440, 'Lithuania', 'LTU');
INSERT INTO country (codeid, "name", acronyms) VALUES (442, 'Luxembourg', 'LUX');
INSERT INTO country (codeid, "name", acronyms) VALUES (446, 'Macao', 'MAC');
INSERT INTO country (codeid, "name", acronyms) VALUES (450, 'Madagascar', 'MDG');
INSERT INTO country (codeid, "name", acronyms) VALUES (454, 'Malawi', 'MWI');
INSERT INTO country (codeid, "name", acronyms) VALUES (458, 'Malaysia', 'MYS');
INSERT INTO country (codeid, "name", acronyms) VALUES (462, 'Maldives', 'MDV');
INSERT INTO country (codeid, "name", acronyms) VALUES (466, 'Mali', 'MLI');
INSERT INTO country (codeid, "name", acronyms) VALUES (470, 'Malta', 'MLT');
INSERT INTO country (codeid, "name", acronyms) VALUES (584, 'Marshall Islands', 'MHL');
INSERT INTO country (codeid, "name", acronyms) VALUES (474, 'Martinique', 'MTQ');
INSERT INTO country (codeid, "name", acronyms) VALUES (478, 'Mauritania', 'MRT');
INSERT INTO country (codeid, "name", acronyms) VALUES (480, 'Mauritius', 'MUS');
INSERT INTO country (codeid, "name", acronyms) VALUES (175, 'Mayotte', 'MYT');
INSERT INTO country (codeid, "name", acronyms) VALUES (484, 'Mexico', 'MEX');
INSERT INTO country (codeid, "name", acronyms) VALUES (583, 'Micronesia (Federated States of)', 'FSM');
INSERT INTO country (codeid, "name", acronyms) VALUES (498, 'Moldova, Republic of', 'MDA');
INSERT INTO country (codeid, "name", acronyms) VALUES (492, 'Monaco', 'MCO');
INSERT INTO country (codeid, "name", acronyms) VALUES (496, 'Mongolia', 'MNG');
INSERT INTO country (codeid, "name", acronyms) VALUES (499, 'Montenegro', 'MNE');
INSERT INTO country (codeid, "name", acronyms) VALUES (500, 'Montserrat', 'MSR');
INSERT INTO country (codeid, "name", acronyms) VALUES (504, 'Morocco', 'MAR');
INSERT INTO country (codeid, "name", acronyms) VALUES (508, 'Mozambique', 'MOZ');
INSERT INTO country (codeid, "name", acronyms) VALUES (104, 'Myanmar', 'MMR');
INSERT INTO country (codeid, "name", acronyms) VALUES (516, 'Namibia', 'NAM');
INSERT INTO country (codeid, "name", acronyms) VALUES (520, 'Nauru', 'NRU');
INSERT INTO country (codeid, "name", acronyms) VALUES (524, 'Nepal', 'NPL');
INSERT INTO country (codeid, "name", acronyms) VALUES (528, 'Netherlands', 'NLD');
INSERT INTO country (codeid, "name", acronyms) VALUES (540, 'New Caledonia', 'NCL');
INSERT INTO country (codeid, "name", acronyms) VALUES (554, 'New Zealand', 'NZL');
INSERT INTO country (codeid, "name", acronyms) VALUES (558, 'Nicaragua', 'NIC');
INSERT INTO country (codeid, "name", acronyms) VALUES (562, 'Niger', 'NER');
INSERT INTO country (codeid, "name", acronyms) VALUES (566, 'Nigeria', 'NGA');
INSERT INTO country (codeid, "name", acronyms) VALUES (570, 'Niue', 'NIU');
INSERT INTO country (codeid, "name", acronyms) VALUES (574, 'Norfolk Island', 'NFK');
INSERT INTO country (codeid, "name", acronyms) VALUES (807, 'North Macedonia', 'MKD');
INSERT INTO country (codeid, "name", acronyms) VALUES (580, 'Northern Mariana Islands', 'MNP');
INSERT INTO country (codeid, "name", acronyms) VALUES (578, 'Norway', 'NOR');
INSERT INTO country (codeid, "name", acronyms) VALUES (512, 'Oman', 'OMN');
INSERT INTO country (codeid, "name", acronyms) VALUES (586, 'Pakistan', 'PAK');
INSERT INTO country (codeid, "name", acronyms) VALUES (585, 'Palau', 'PLW');
INSERT INTO country (codeid, "name", acronyms) VALUES (275, 'Palestine, State of', 'PSE');
INSERT INTO country (codeid, "name", acronyms) VALUES (591, 'Panama', 'PAN');
INSERT INTO country (codeid, "name", acronyms) VALUES (598, 'Papua New Guinea', 'PNG');
INSERT INTO country (codeid, "name", acronyms) VALUES (600, 'Paraguay', 'PRY');
INSERT INTO country (codeid, "name", acronyms) VALUES (604, 'Peru', 'PER');
INSERT INTO country (codeid, "name", acronyms) VALUES (608, 'Philippines', 'PHL');
INSERT INTO country (codeid, "name", acronyms) VALUES (612, 'Pitcairn', 'PCN');
INSERT INTO country (codeid, "name", acronyms) VALUES (616, 'Poland', 'POL');
INSERT INTO country (codeid, "name", acronyms) VALUES (620, 'Portugal', 'PRT');
INSERT INTO country (codeid, "name", acronyms) VALUES (630, 'Puerto Rico', 'PRI');
INSERT INTO country (codeid, "name", acronyms) VALUES (634, 'Qatar', 'QAT');
INSERT INTO country (codeid, "name", acronyms) VALUES (638, 'Réunion', 'REU');
INSERT INTO country (codeid, "name", acronyms) VALUES (642, 'Romania', 'ROU');
INSERT INTO country (codeid, "name", acronyms) VALUES (643, 'Russian Federation', 'RUS');
INSERT INTO country (codeid, "name", acronyms) VALUES (646, 'Rwanda', 'RWA');
INSERT INTO country (codeid, "name", acronyms) VALUES (652, 'Saint Barthélemy', 'BLM');
INSERT INTO country (codeid, "name", acronyms) VALUES (654, 'Saint Helena, Ascension and Tristan da Cunha', 'SHN');
INSERT INTO country (codeid, "name", acronyms) VALUES (659, 'Saint Kitts and Nevis', 'KNA');
INSERT INTO country (codeid, "name", acronyms) VALUES (662, 'Saint Lucia', 'LCA');
INSERT INTO country (codeid, "name", acronyms) VALUES (663, 'Saint Martin (French part)', 'MAF');
INSERT INTO country (codeid, "name", acronyms) VALUES (666, 'Saint Pierre and Miquelon', 'SPM');
INSERT INTO country (codeid, "name", acronyms) VALUES (670, 'Saint Vincent and the Grenadines', 'VCT');
INSERT INTO country (codeid, "name", acronyms) VALUES (882, 'Samoa', 'WSM');
INSERT INTO country (codeid, "name", acronyms) VALUES (674, 'San Marino', 'SMR');
INSERT INTO country (codeid, "name", acronyms) VALUES (678, 'Sao Tome and Principe', 'STP');
INSERT INTO country (codeid, "name", acronyms) VALUES (682, 'Saudi Arabia', 'SAU');
INSERT INTO country (codeid, "name", acronyms) VALUES (686, 'Senegal', 'SEN');
INSERT INTO country (codeid, "name", acronyms) VALUES (688, 'Serbia', 'SRB');
INSERT INTO country (codeid, "name", acronyms) VALUES (690, 'Seychelles', 'SYC');
INSERT INTO country (codeid, "name", acronyms) VALUES (694, 'Sierra Leone', 'SLE');
INSERT INTO country (codeid, "name", acronyms) VALUES (702, 'Singapore', 'SGP');
INSERT INTO country (codeid, "name", acronyms) VALUES (534, 'Sint Maarten (Dutch part)', 'SXM');
INSERT INTO country (codeid, "name", acronyms) VALUES (703, 'Slovakia', 'SVK');
INSERT INTO country (codeid, "name", acronyms) VALUES (705, 'Slovenia', 'SVN');
INSERT INTO country (codeid, "name", acronyms) VALUES (090, 'Solomon Islands', 'SLB');
INSERT INTO country (codeid, "name", acronyms) VALUES (706, 'Somalia', 'SOM');
INSERT INTO country (codeid, "name", acronyms) VALUES (710, 'South Africa', 'ZAF');
INSERT INTO country (codeid, "name", acronyms) VALUES (239, 'South Georgia and the South Sandwich Islands', 'SGS');
INSERT INTO country (codeid, "name", acronyms) VALUES (728, 'South Sudan', 'SSD');
INSERT INTO country (codeid, "name", acronyms) VALUES (724, 'Spain', 'ESP');
INSERT INTO country (codeid, "name", acronyms) VALUES (144, 'Sri Lanka', 'LKA');
INSERT INTO country (codeid, "name", acronyms) VALUES (729, 'Sudan', 'SDN');
INSERT INTO country (codeid, "name", acronyms) VALUES (740, 'Suriname', 'SUR');
INSERT INTO country (codeid, "name", acronyms) VALUES (744, 'Svalbard and Jan Mayen', 'SJM');
INSERT INTO country (codeid, "name", acronyms) VALUES (752, 'Sweden', 'SWE');
INSERT INTO country (codeid, "name", acronyms) VALUES (756, 'Switzerland', 'CHE');
INSERT INTO country (codeid, "name", acronyms) VALUES (760, 'Syrian Arab Republic', 'SYR');
INSERT INTO country (codeid, "name", acronyms) VALUES (158, 'Taiwan, Province of China', 'TWN');
INSERT INTO country (codeid, "name", acronyms) VALUES (762, 'Tajikistan', 'TJK');
INSERT INTO country (codeid, "name", acronyms) VALUES (834, 'Tanzania, United Republic of', 'TZA');
INSERT INTO country (codeid, "name", acronyms) VALUES (764, 'Thailand', 'THA');
INSERT INTO country (codeid, "name", acronyms) VALUES (626, 'Timor-Leste', 'TLS');
INSERT INTO country (codeid, "name", acronyms) VALUES (768, 'Togo', 'TGO');
INSERT INTO country (codeid, "name", acronyms) VALUES (772, 'Tokelau', 'TKL');
INSERT INTO country (codeid, "name", acronyms) VALUES (776, 'Tonga', 'TON');
INSERT INTO country (codeid, "name", acronyms) VALUES (780, 'Trinidad and Tobago', 'TTO');
INSERT INTO country (codeid, "name", acronyms) VALUES (788, 'Tunisia', 'TUN');
INSERT INTO country (codeid, "name", acronyms) VALUES (792, 'Turkey', 'TUR');
INSERT INTO country (codeid, "name", acronyms) VALUES (795, 'Turkmenistan', 'TKM');
INSERT INTO country (codeid, "name", acronyms) VALUES (796, 'Turks and Caicos Islands', 'TCA');
INSERT INTO country (codeid, "name", acronyms) VALUES (798, 'Tuvalu', 'TUV');
INSERT INTO country (codeid, "name", acronyms) VALUES (800, 'Uganda', 'UGA');
INSERT INTO country (codeid, "name", acronyms) VALUES (804, 'Ukraine', 'UKR');
INSERT INTO country (codeid, "name", acronyms) VALUES (784, 'United Arab Emirates', 'ARE');
INSERT INTO country (codeid, "name", acronyms) VALUES (826, 'United Kingdom', 'GBR');
INSERT INTO country (codeid, "name", acronyms) VALUES (840, 'United States of America', 'USA');
INSERT INTO country (codeid, "name", acronyms) VALUES (581, 'United States Minor', 'UMI');
INSERT INTO country (codeid, "name", acronyms) VALUES (858, 'Uruguay', 'URY');
INSERT INTO country (codeid, "name", acronyms) VALUES (860, 'Uzbekistan', 'UZB');
INSERT INTO country (codeid, "name", acronyms) VALUES (548, 'Vanuatu', 'VUT');
INSERT INTO country (codeid, "name", acronyms) VALUES (862, 'Venezuela', 'VEN');
INSERT INTO country (codeid, "name", acronyms) VALUES (704, 'Viet Nam', 'VNM');
INSERT INTO country (codeid, "name", acronyms) VALUES (092, 'Virgin Islands (British)', 'VGB');
INSERT INTO country (codeid, "name", acronyms) VALUES (850, 'Virgin Islands (U.S.)', 'VIR');
INSERT INTO country (codeid, "name", acronyms) VALUES (876, 'Wallis and Futuna', 'WLF');
INSERT INTO country (codeid, "name", acronyms) VALUES (732, 'Western Sahara', 'ESH');
INSERT INTO country (codeid, "name", acronyms) VALUES (887, 'Yemen', 'YEM');
INSERT INTO country (codeid, "name", acronyms) VALUES (894, 'Zambia', 'ZMB');
INSERT INTO country (codeid, "name", acronyms) VALUES (716, 'Zimbabwe', 'ZWE');


select * from country c ; --reviso que si quedo todito xD
--------------------------------------------------------------------------------------------------------------------------

--Queries que se me ocurrieron: 

--Dame el juego que se llame "KLAUS", que tenga 20.0000 descargas y que sea gratuito
select price, downloads, positive, "name" 
from game g
where price = 0 and downloads = 20000 and positive = 3 and "name" = '-KLAUS-';

--Dame el precio y el número de descargas del videojuego "WARSAW"
select "name", price, downloads  
from game g 
where "name" = 'WARSAW';

--Dame el nombre y el numero de las reseñas positivas y negativas de todos los juegos que valgan menos de 15 dolares
select "name" , positive , negative 
from game g 
where price <15;

---------------------------------------------------------------------------------------------------------------------------
--Queries ya más serios y necesarios 

--Necesito saber todos los juegos que son gratis y que tienen mas de 30.000 reseñas positivas
select "name", price, positive
from game g 
where price = 0 and positive > 30000;

--Necesito saber cual es el juego más caro de la tienda 
--Necesito saber cual es el juego de pago más barato
--Dame los 10 peores juegos que tiene la tienda
--Quiero saber cuales son los juegos que salieron en 2014 y que precio tienen


