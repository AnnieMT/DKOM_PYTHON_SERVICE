drop schema "demo" cascade;
create schema "demo";

create table "demo"."parties" (
  "id" bigint primary key,
  "type" varchar(20) not null,
  "name" varchar(100) not null,
  "balance" decimal(18,2) not null,
  "rating" double not null
);

create table "demo"."parties2" (
  "id" bigint primary key,
  "type" varchar(20) not null,
  "name" varchar(100) not null unique,
  "balance" decimal(18,2) not null,
  "rating" double not null
);


create table "demo"."transactions" (
  "id" bigint primary key,
  "creditor" bigint not null references "demo"."parties"("id") on update cascade on delete cascade,
  "debtor" bigint not null references "demo"."parties"("id") on update cascade on delete cascade,
  "timestamp" timestamp not null,
  "value" decimal(18,2) not null
);

create table "demo"."transactions2" (
  "id" bigint primary key,
 "creditor" varchar(100) not null references "demo"."parties2"("name") on update cascade on delete cascade,
  "debtor" varchar(100) not null references "demo"."parties2"("name") on update cascade on delete cascade,
  "timestamp" timestamp not null,
  "value" decimal(18,2) not null
);

create graph workspace "demo"."graph"
  edge table "demo"."transactions"
    source column "creditor"
    target column "debtor"
    key column "id"
  vertex table "demo"."parties"
    key column "id";

create graph workspace "demo"."graph2"
  edge table "demo"."transactions2"
    source column "creditor"
    target column "debtor"
    key column "id"
  vertex table "demo"."parties2"
    key column "name";

insert into "demo"."parties"("id","type","name","balance","rating") values (11948,'person','Michael Smith',171110,4);
insert into "demo"."parties"("id","type","name","balance","rating") values (91114,'person','Gabi Williams',227732.63,5);
insert into "demo"."parties"("id","type","name","balance","rating") values (45140,'person','Robert Carter',2690023.1,5);
insert into "demo"."parties"("id","type","name","balance","rating") values (45549,'person','Jim Smith',1937335.46,3);
insert into "demo"."parties"("id","type","name","balance","rating") values (81201,'person','George King',254308.44,2);
insert into "demo"."parties"("id","type","name","balance","rating") values (67595,'person','Liz Brown',363657.59,4);
insert into "demo"."parties"("id","type","name","balance","rating") values (82949,'person','Joe Johnson',912058.8,3);
insert into "demo"."parties"("id","type","name","balance","rating") values (67819,'person','Scott Wilson',1113711.51,5);
insert into "demo"."parties"("id","type","name","balance","rating") values (96877,'person','Paul Brown',295119.19,5);
insert into "demo"."parties"("id","type","name","balance","rating") values (41835,'person','Amanda Wilson',1089338.13,3);
insert into "demo"."parties"("id","type","name","balance","rating") values (26202,'company','Mueller-MacGyver',334535.34,5);
insert into "demo"."parties"("id","type","name","balance","rating") values (63031,'company','Greenfelder, Kerluke and Waelchi',552414.16,5);
insert into "demo"."parties"("id","type","name","balance","rating") values (99897,'company','Beier-Simonis',13223.17,4);
insert into "demo"."parties"("id","type","name","balance","rating") values (93332,'company','Zboncak-Predovic',602918.87,3);
insert into "demo"."parties"("id","type","name","balance","rating") values (33015,'company','Treutel-Jacobson',338053.32,2);
insert into "demo"."parties"("id","type","name","balance","rating") values (38509,'company','Stokes, Sanford and Schuppe',1257149.67,5);
insert into "demo"."parties"("id","type","name","balance","rating") values (78168,'company','Koch, Ondricka and Flatley',723656.72,3);
insert into "demo"."parties"("id","type","name","balance","rating") values (48212,'company','Homenick-Lubowitz',448255.81,4);
insert into "demo"."parties"("id","type","name","balance","rating") values (45592,'company','Walsh & Sons Co.',175004.61,5);
insert into "demo"."parties"("id","type","name","balance","rating") values (93556,'company','Hintz Inc',5116.55,3);

insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (0,11948,91114,'2008-06-07 11:36:50',69476.94);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (1,11948,45549,'2007-02-09 07:47:59',12711.73);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (2,91114,26202,'2005-10-05 07:08:32',370.49);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (3,91114,63031,'2016-06-18 21:10:47',54478.88);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (4,91114,99897,'2001-10-16 17:49:09',7559.74);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (5,45140,26202,'2009-12-16 13:41:03',1920.97);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (6,45549,11948,'2009-10-10 20:49:04',11010.74);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (7,45549,99897,'2003-06-04 07:16:00',41609);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (8,81201,41835,'2007-11-22 10:59:25',3862.18);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (9,81201,78168,'2015-09-26 05:37:48',35630.04);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (10,67595,96877,'2014-06-06 08:16:39',93182.81);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (11,67819,82949,'2012-07-21 01:14:09',19814.51);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (12,67819,48212,'2015-11-24 05:22:24',62730.61);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (13,67819,41835,'2004-01-06 04:06:58',13041.71);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (14,96877,33015,'2002-03-28 08:07:52',27249.08);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (15,41835,78168,'2009-07-12 04:45:16',2161.17);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (16,26202,63031,'2016-10-23 09:42:24',19202.91);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (17,63031,93332,'2006-11-16 13:59:15',9239.55);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (18,63031,45140,'2007-05-25 08:22:55',87978.74);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (19,99897,11948,'2013-07-28 23:30:41',8400.87);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (20,33015,67595,'2007-04-01 01:40:31',28807.8);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (21,78168,38509,'2006-09-21 07:52:57',1323.8);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (22,78168,96877,'2000-05-25 08:58:47',3055.68);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (23,78168,38509,'2010-05-05 19:05:19',41.56);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (24,48212,45592,'2013-06-02 10:55:22',1625.79);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (25,45592,48212,'2000-03-11 01:54:18',19083.11);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (26,45592,41835,'2008-06-18 17:21:13',19684.72);
insert into "demo"."transactions"("id","creditor","debtor","timestamp","value") values (27,93556,48212,'2002-03-23 08:33:32',6794.35);

insert into "demo"."parties2"("id","type","name","balance","rating")
select "id","type","name","balance","rating"
from "demo"."parties";

insert into "demo"."transactions2"("id","creditor","debtor","timestamp","value")
select t."id", c."name" as "creditor", d."name" as "debtor", t."timestamp", t."value"
from "demo"."transactions" t join "demo"."parties" c on (t."creditor" = c."id") join "demo"."parties" d on (t."debtor" = d."id");

create calculation scenario "demo"."neighborhood" using '
<?xml version="1.0"?>
<cubeSchema version="2" operation="createCalculationScenario" defaultLanguage="en">
 <calculationScenario schema="demo" name="neighborhood">
 <calculationViews>
 <graph name="neighborhood_node" defaultViewFlag="true" schema="demo" workspace="graph" action="GET_NEIGHBORHOOD">
 <expression>
 <![CDATA[{
 "parameters": {
 "startVertices": [$$startVertex$$],
 "direction":"any",
 "minDepth": 0,
 "maxDepth": 2000000000
 }
 }]]>
 </expression>
 <viewAttributes>
 <viewAttribute name="id" datatype="fixed" length="18"/>
 <viewAttribute name="DEPTH" datatype="int"/>
 </viewAttributes>
 </graph>
 </calculationViews>
 <variables>
 <variable name="$$startVertex$$" type="graphVariable"/>
 </variables>
 </calculationScenario>
</cubeSchema>
' with parameters ('EXPOSE_NODE'=('neighborhood_node', 'neighborhood'));

DROP PROCEDURE "demo"."get_rating";
CREATE PROCEDURE "demo"."get_rating" (
    IN V_PARTY_ID BIGINT,
    IN V_EXTERNAL_RATING_WEIGHT DOUBLE,
    IN V_NETWORK_RATING_WEIGHT DOUBLE,
    OUT V_RATING DOUBLE,
    OUT V_MESSAGE VARCHAR(5000)
) LANGUAGE SQLSCRIPT AS
BEGIN
  DECLARE V_EXTERNAL_RATING DOUBLE;
  DECLARE V_SMALLEST_NETWORK_RATING DOUBLE;

  -- retrieve external rating for the given party
  SELECT "rating" INTO V_EXTERNAL_RATING FROM "demo"."parties" WHERE "id" = :V_PARTY_ID;

  -- retrieve smallest rating from the transaction network of the given party
  -- using SQL query LIMITED NETWORK RADIUS!!! = 7 (biggest in our demo data)
WITH EUT AS (
  SELECT t."creditor", t."debtor", p."rating"
  FROM "demo"."transactions" t JOIN "demo"."parties" p ON p."id" = t."debtor"
  UNION
  SELECT t."debtor" AS "creditor", t."creditor" AS "debtor", p."rating"
  FROM "demo"."transactions" t JOIN "demo"."parties" p ON p."id" = t."creditor"  
),
JOINS AS (
  SELECT t1."rating" AS "rating1", t2."rating" AS "rating2", t3."rating" AS "rating3",
         t4."rating" AS "rating4", t5."rating" AS "rating5", t6."rating" AS "rating6",
         t7."rating" AS "rating7"
  FROM EUT t1
    LEFT OUTER JOIN EUT t2 ON t1."debtor" = t2."creditor"
    LEFT OUTER JOIN EUT t3 ON t2."debtor" = t3."creditor"
    LEFT OUTER JOIN EUT t4 ON t3."debtor" = t4."creditor"
    LEFT OUTER JOIN EUT t5 ON t4."debtor" = t5."creditor"
    LEFT OUTER JOIN EUT t6 ON t5."debtor" = t6."creditor"
    LEFT OUTER JOIN EUT t7 ON t6."debtor" = t7."creditor"
    WHERE t1."creditor" = 26202)
SELECT MIN("rating") INTO V_SMALLEST_NETWORK_RATING
FROM (
  SELECT MIN("rating1") AS "rating" FROM JOINS
  UNION
  SELECT MIN("rating2") AS "rating" FROM JOINS
  UNION
  SELECT MIN("rating3") AS "rating" FROM JOINS
  UNION
  SELECT MIN("rating4") AS "rating" FROM JOINS
  UNION
  SELECT MIN("rating5") AS "rating" FROM JOINS
  UNION
  SELECT MIN("rating6") AS "rating" FROM JOINS
  UNION
  SELECT MIN("rating7") AS "rating" FROM JOINS
);
  -- using the SAP HANA Graph functionality UNLIMITED NETWORK RADIUS!!!
--  SELECT MIN("rating") INTO V_SMALLEST_NETWORK_RATING FROM "demo"."parties"
--  WHERE "id" IN (SELECT "id" FROM "demo"."neighborhood" (placeholder."$$startVertex$$" => :V_PARTY_ID));

  -- calculate the weighted average
  V_RATING = ROUND((:V_EXTERNAL_RATING * :V_EXTERNAL_RATING_WEIGHT + :V_SMALLEST_NETWORK_RATING * :V_NETWORK_RATING_WEIGHT) / (:V_EXTERNAL_RATING_WEIGHT + :V_NETWORK_RATING_WEIGHT));
  V_MESSAGE = '{ "externalRating": ' || :V_EXTERNAL_RATING || ', "networkRating": ' || :V_SMALLEST_NETWORK_RATING ||
    ', "externalRatingWeight": ' || :V_EXTERNAL_RATING_WEIGHT || ', "networkRatingWeight": ' || :V_NETWORK_RATING_WEIGHT || ', "calculation": "round((' ||
    :V_EXTERNAL_RATING || '*' || :V_EXTERNAL_RATING_WEIGHT || '+' || :V_SMALLEST_NETWORK_RATING || '*' || :V_NETWORK_RATING_WEIGHT || ')/ (' || :V_EXTERNAL_RATING_WEIGHT || '+' || :V_NETWORK_RATING_WEIGHT || '))"}';
END;

CALL "demo"."get_rating"(11948, 50, 50, ?, ?);
CALL "demo"."get_rating"(91114, 50, 50, ?, ?);
CALL "demo"."get_rating"(45140, 50, 50, ?, ?);
CALL "demo"."get_rating"(45549, 50, 50, ?, ?);
CALL "demo"."get_rating"(81201, 50, 50, ?, ?);
CALL "demo"."get_rating"(67595, 50, 50, ?, ?);
CALL "demo"."get_rating"(82949, 50, 50, ?, ?);
CALL "demo"."get_rating"(67819, 50, 50, ?, ?);
CALL "demo"."get_rating"(96877, 50, 50, ?, ?);
CALL "demo"."get_rating"(41835, 50, 50, ?, ?);
CALL "demo"."get_rating"(26202, 50, 50, ?, ?);
CALL "demo"."get_rating"(63031, 50, 50, ?, ?);
CALL "demo"."get_rating"(99897, 50, 50, ?, ?);
CALL "demo"."get_rating"(93332, 50, 50, ?, ?);
CALL "demo"."get_rating"(33015, 50, 50, ?, ?);
CALL "demo"."get_rating"(38509, 50, 50, ?, ?);
CALL "demo"."get_rating"(78168, 50, 50, ?, ?);
CALL "demo"."get_rating"(48212, 50, 50, ?, ?);
CALL "demo"."get_rating"(45592, 50, 50, ?, ?);
CALL "demo"."get_rating"(93556, 50, 50, ?, ?);


WITH EUT AS (
  SELECT t."creditor", t."debtor", p."rating"
  FROM "demo"."transactions" t JOIN "demo"."parties" p ON p."id" = t."debtor"
  UNION
  SELECT t."debtor" AS "creditor", t."creditor" AS "debtor", p."rating"
  FROM "demo"."transactions" t JOIN "demo"."parties" p ON p."id" = t."creditor"  
),
JOINS AS (
  SELECT t1."rating" AS "rating1", t2."rating" AS "rating2", t3."rating" AS "rating3",
         t4."rating" AS "rating4", t5."rating" AS "rating5", t6."rating" AS "rating6",
         t7."rating" AS "rating7"
  FROM EUT t1
    LEFT OUTER JOIN EUT t2 ON t1."debtor" = t2."creditor"
    LEFT OUTER JOIN EUT t3 ON t2."debtor" = t3."creditor"
    LEFT OUTER JOIN EUT t4 ON t3."debtor" = t4."creditor"
    LEFT OUTER JOIN EUT t5 ON t4."debtor" = t5."creditor"
    LEFT OUTER JOIN EUT t6 ON t5."debtor" = t6."creditor"
    LEFT OUTER JOIN EUT t7 ON t6."debtor" = t7."creditor"
    WHERE t1."creditor" = 26202)
SELECT MIN("rating")
FROM (
  SELECT MIN("rating1") AS "rating" FROM JOINS
  UNION
  SELECT MIN("rating2") AS "rating" FROM JOINS
  UNION
  SELECT MIN("rating3") AS "rating" FROM JOINS
  UNION
  SELECT MIN("rating4") AS "rating" FROM JOINS
  UNION
  SELECT MIN("rating5") AS "rating" FROM JOINS
  UNION
  SELECT MIN("rating6") AS "rating" FROM JOINS
  UNION
  SELECT MIN("rating7") AS "rating" FROM JOINS
);


DROP PROCEDURE "demo"."get_rating";
CREATE PROCEDURE "demo"."get_rating" (
    IN V_PARTY_ID BIGINT,
    IN V_EXTERNAL_RATING_WEIGHT DOUBLE,
    IN V_NETWORK_RATING_WEIGHT DOUBLE,
    OUT V_RATING DOUBLE,
    OUT V_MESSAGE VARCHAR(5000)
) LANGUAGE GRAPH READS SQL DATA AS
BEGIN
  GRAPH G = GRAPH("demo", "graph");
  VERTEX PARTY = VERTEX(:G, :V_PARTY_ID);
  -- retrieve external rating for the given party
  DOUBLE V_EXTERNAL_RATING = :PARTY."rating";
  -- retrieve smallest rating from the transaction network
  DOUBLE V_SMALLEST_NETWORK_RATING = 5.0;
  FOREACH (V in VERTICES(:G)) {
    IF (IS_REACHABLE(:G, :PARTY, :V) OR IS_REACHABLE(:G, :V, :PARTY)) {
      IF (:V."rating" < :V_SMALLEST_NETWORK_RATING) {
        V_SMALLEST_NETWORK_RATING = :V."rating";
      }
    }
  }
  -- calculate the weighted average
  V_RATING = (:V_EXTERNAL_RATING * :V_EXTERNAL_RATING_WEIGHT + :V_SMALLEST_NETWORK_RATING * :V_NETWORK_RATING_WEIGHT) / (:V_EXTERNAL_RATING_WEIGHT + :V_NETWORK_RATING_WEIGHT);
  V_MESSAGE = '{ "status": "OK"}';
END;

CALL "demo"."get_rating"(11948, 50, 50, ?, ?);
CALL "demo"."get_rating"(91114, 50, 50, ?, ?);
CALL "demo"."get_rating"(45140, 50, 50, ?, ?);
CALL "demo"."get_rating"(45549, 50, 50, ?, ?);
CALL "demo"."get_rating"(81201, 50, 50, ?, ?);
CALL "demo"."get_rating"(67595, 50, 50, ?, ?);
CALL "demo"."get_rating"(82949, 50, 50, ?, ?);
CALL "demo"."get_rating"(67819, 50, 50, ?, ?);
CALL "demo"."get_rating"(96877, 50, 50, ?, ?);
CALL "demo"."get_rating"(41835, 50, 50, ?, ?);
CALL "demo"."get_rating"(26202, 50, 50, ?, ?);
CALL "demo"."get_rating"(63031, 50, 50, ?, ?);
CALL "demo"."get_rating"(99897, 50, 50, ?, ?);
CALL "demo"."get_rating"(93332, 50, 50, ?, ?);
CALL "demo"."get_rating"(33015, 50, 50, ?, ?);
CALL "demo"."get_rating"(38509, 50, 50, ?, ?);
CALL "demo"."get_rating"(78168, 50, 50, ?, ?);
CALL "demo"."get_rating"(48212, 50, 50, ?, ?);
CALL "demo"."get_rating"(45592, 50, 50, ?, ?);
CALL "demo"."get_rating"(93556, 50, 50, ?, ?);
