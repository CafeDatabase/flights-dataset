set echo off
 
-- NOTE: DBMS_OUTPUT is disabled during bulk load to avoid buffer overflow in SQL*Plus/SQLcl/SQL Developer.
begin
  dbms_output.disable;
end;
/
 
PROMPT Values for table GENDERS
PROMPT *********************************

insert into GENDERS(ID_GENDER, CN_GENDER) values ('M','Male');
insert into GENDERS(ID_GENDER, CN_GENDER) values ('F','Female');

PROMPT Values for table MARITAL_STATUS
PROMPT *********************************

insert into MARITAL_STATUS(ID_MS, CN_MS) values ('SI','Single');
insert into MARITAL_STATUS(ID_MS, CN_MS) values ('SE','Separated');
insert into MARITAL_STATUS(ID_MS, CN_MS) values ('MA','Married');
insert into MARITAL_STATUS(ID_MS, CN_MS) values ('WI','Widowed');
insert into MARITAL_STATUS(ID_MS, CN_MS) values ('DI','Divorced');

PROMPT Values for table CATERING
PROMPT *********************************

insert into CATERING(ID_CATERING, CN_CATERING) values ('IN','Included');
insert into CATERING(ID_CATERING, CN_CATERING) values ('NO','Not included');

PROMPT Values for table FLIGHT_TYPES
PROMPT *********************************

insert into FLIGHT_TYPES(ID_FLIGHT_TYPE, CN_FLIGHT_TYPE) values ('CHA','Charter');
insert into FLIGHT_TYPES(ID_FLIGHT_TYPE, CN_FLIGHT_TYPE) values ('REG','Regular');
insert into FLIGHT_TYPES(ID_FLIGHT_TYPE, CN_FLIGHT_TYPE) values ('INT','International');
insert into FLIGHT_TYPES(ID_FLIGHT_TYPE, CN_FLIGHT_TYPE) values ('DOM','Domestic');

PROMPT Values for table AIRLINES
PROMPT *********************************

insert into AIRLINES(ID_AIRLINE, CN_AIRLINE) values ('IBERI','Aurea Air');
insert into AIRLINES(ID_AIRLINE, CN_AIRLINE) values ('AIRNS','Northwind Air');
insert into AIRLINES(ID_AIRLINE, CN_AIRLINE) values ('AIREU','Blue Meridian Airlines');
insert into AIRLINES(ID_AIRLINE, CN_AIRLINE) values ('SPNAI','Skyforge Airways');
insert into AIRLINES(ID_AIRLINE, CN_AIRLINE) values ('KLM','Kestrel Air Lines');
insert into AIRLINES(ID_AIRLINE, CN_AIRLINE) values ('BRITA','Britannic Skies');
insert into AIRLINES(ID_AIRLINE, CN_AIRLINE) values ('ALITA','Altavia Airlines');
insert into AIRLINES(ID_AIRLINE, CN_AIRLINE) values ('AIFRA','Aether France Air');

PROMPT Values for table EMPLOYMENT_STATUS
PROMPT *********************************

insert into EMPLOYMENT_STATUS(ID_ES, CN_ES) values ('AC','Active');
insert into EMPLOYMENT_STATUS(ID_ES, CN_ES) values ('IN','Inactive');

PROMPT Values for table AGE_GROUPS
PROMPT *********************************

insert into AGE_GROUPS(AGE_ID, ID_AGE_GROUP, AGE_RANGE) values (1,'YOU','Under 18');
insert into AGE_GROUPS(AGE_ID, ID_AGE_GROUP, AGE_RANGE) values (2,'ADU','Under 50');
insert into AGE_GROUPS(AGE_ID, ID_AGE_GROUP, AGE_RANGE) values (3,'SEN','Over 50');

PROMPT Values for table BOOKING_TYPES
PROMPT *********************************

insert into BOOKING_TYPES(ID_BOOKING_TYPE, CN_BOOKING_TYPE) values ('PHO','Phone');
insert into BOOKING_TYPES(ID_BOOKING_TYPE, CN_BOOKING_TYPE) values ('ONL','Online');
insert into BOOKING_TYPES(ID_BOOKING_TYPE, CN_BOOKING_TYPE) values ('DIR','Direct Sale');

PROMPT Values for table TRAVEL_AGENCIES
PROMPT *********************************

insert into TRAVEL_AGENCIES(ID_TRAVEL_AGENCY, CN_TRAVEL_AGENCY) values ('1','Aurea Travel');
insert into TRAVEL_AGENCIES(ID_TRAVEL_AGENCY, CN_TRAVEL_AGENCY) values ('2','Northwind Travel Group');
insert into TRAVEL_AGENCIES(ID_TRAVEL_AGENCY, CN_TRAVEL_AGENCY) values ('3','Meridian Travel');
insert into TRAVEL_AGENCIES(ID_TRAVEL_AGENCY, CN_TRAVEL_AGENCY) values ('4','TuriNova');
insert into TRAVEL_AGENCIES(ID_TRAVEL_AGENCY, CN_TRAVEL_AGENCY) values ('5','VacayPlan');

PROMPT Values for table COUNTRIES
PROMPT *********************************

insert into COUNTRIES(ID_COUNTRY, CN_COUNTRY) values (1,'Spain');
insert into COUNTRIES(ID_COUNTRY, CN_COUNTRY) values (2,'Portugal');
insert into COUNTRIES(ID_COUNTRY, CN_COUNTRY) values (3,'United Kingdom');
insert into COUNTRIES(ID_COUNTRY, CN_COUNTRY) values (4,'France');
insert into COUNTRIES(ID_COUNTRY, CN_COUNTRY) values (5,'Germany');
insert into COUNTRIES(ID_COUNTRY, CN_COUNTRY) values (6,'USA');
insert into COUNTRIES(ID_COUNTRY, CN_COUNTRY) values (7,'Italy');

PROMPT Values for table CITIES
PROMPT *********************************

insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (1,'Barcelona',1);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (2,'Madrid',1);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (3,'Valencia',1);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (4,'Sevilla',1);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (5,'Pamplona',1);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (6,'Bilbao',1);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (7,'Malaga',1);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (8,'Santa Cruz de Tenerife',1);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (9,'Palma de Mallorca',1);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (10,'Lisbon',2);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (11,'Madeira',2);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (12,'London',3);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (13,'Manchester',3);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (14,'Liverpool',3);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (15,'Essex',3);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (16,'Paris',4);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (17,'Lyon',4);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (18,'Berlin',5);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (19,'Bonn',5);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (20,'Munich',5);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (21,'Washington',6);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (22,'Boston',6);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (23,'Chicago',6);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (24,'Los Angeles',6);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (25,'New York',6);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (26,'Denver',6);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (27,'Florence',7);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (28,'Rome',7);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (29,'Milan',7);
insert into CITIES(ID_CITY,CN_CITY,CTRY_ID_COUNTRY) values (30,'Venice',7);

PROMPT Values for table AIRPORTS
PROMPT *********************************

-- Spain
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('BCN','Josep Tarradellas Barcelona-El Prat Airport',1);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('MAD','Adolfo Suárez Madrid-Barajas Airport',2);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('VLC','Valencia Airport',3);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('SVQ','Seville Airport',4);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('PNA','Pamplona Airport',5);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('BIO','Bilbao Airport',6);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('AGP','Málaga-Costa del Sol Airport',7);
-- Santa Cruz de Tenerife: city <-> closest airport = Tenerife North (TFN)
-- Second fictitious airport "Tenerife South"
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('TFN','Tenerife North Airport',8);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('TFS','Tenerife South Airport',8);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('PMI','Palma de Mallorca Airport',9);
-- Portugal
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('LIS','Lisbon Airport',10);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('FNC','Madeira Airport',11);
-- UK
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('LHR','Heathrow Airport',12);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('LGW','Gatwick Airport',12);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('MAN','Manchester Airport',13);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('LPL','Liverpool John Lennon Airport',14);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('STN','London Stansted Airport',15);
-- France
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('CDG','Paris Charles de Gaulle Airport',16);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('ORY','Paris Orly Airport',16);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('LYS','Lyon-Saint Exupéry Airport',17);
-- Germany
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('BER','Berlin Brandenburg Airport',18);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('CGN','Cologne Bonn Airport',19);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('MUC','Munich Airport',20);
-- USA
-- NOTE: Washington has 2 typical airports (DCA/IAD). The "city" one is usually DCA.
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('DCA','Ronald Reagan Washington National Airport',21);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('IAD','Washington Dulles International Airport',21);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('BOS','Logan International Airport',22);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('ORD','O''Hare International Airport',23);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('LAX','Los Angeles International Airport',24);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('JFK','John F. Kennedy International Airport',25);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('DEN','Denver International Airport',26);
-- Italy
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('FLR','Florence Airport',27);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('FCO','Rome Fiumicino Airport',28);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('MXP','Milan Malpensa Airport',29);
insert into AIRPORTS(ID_AIRPORT, CN_AIRPORT, CITY_ID_CITY) values ('VCE','Venice Marco Polo Airport',30);

PROMPT Values for table AGENCIES (GENERATED)
PROMPT *********************************

insert into AGENCIES (ID_AGENCY, CN_AGENCY, CITY_ID_CITY, TAG_ID_TRAVEL_AGENCY)
select
  AGENCY_SEQ.nextval,
  -- Neutral and consistent name: <Company>-<City>
  replace(tag.CN_TRAVEL_AGENCY,' ','') || '_' || replace(c.CN_CITY,' ',''),
  c.ID_CITY,
  tag.ID_TRAVEL_AGENCY
from TRAVEL_AGENCIES tag
cross join CITIES c;

commit;
