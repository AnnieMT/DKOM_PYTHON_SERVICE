drop schema "USR_4JS1EI5192ALIGS7L3SF9XC72" cascade;
create schema "USR_4JS1EI5192ALIGS7L3SF9XC72";
GRANT SELECT, EXECUTE, DROP ON SCHEMA USR_4JS1EI5192ALIGS7L3SF9XC72 to XSA_ADMIN WITH GRANT OPTION;

create column table "USR_4JS1EI5192ALIGS7L3SF9XC72"."ratings_docstore" (id int primary key, value nvarchar(5000));

create column table "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties" (
  "id" bigint primary key,
  "type" varchar(20) not null,
  "name" varchar(100) not null,
  "balance" decimal(18,2) not null,
  "rating" double not null
);

create column table "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions" (
  "id" bigint primary key,
  "creditor" bigint not null references "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties"("id") on update cascade on delete cascade,
  "debtor" bigint not null references "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties"("id") on update cascade on delete cascade,
  "timestamp" timestamp not null,
  "value" decimal(18,2) not null
);

create graph workspace "USR_4JS1EI5192ALIGS7L3SF9XC72"."graph"
  edge table "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"
    source column "creditor"
    target column "debtor"
    key column "id"
  vertex table "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties"
    key column "id";
    
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties"("id","type","name","balance","rating") values (11948,'person','Michael Smith',171110,4);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties"("id","type","name","balance","rating") values (91114,'person','Gabi Williams',227732.63,5);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties"("id","type","name","balance","rating") values (45140,'person','Robert Carter',2690023.1,5);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties"("id","type","name","balance","rating") values (45549,'person','Jim Smith',1937335.46,3);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties"("id","type","name","balance","rating") values (81201,'person','George King',254308.44,2);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties"("id","type","name","balance","rating") values (67595,'person','Liz Brown',363657.59,4);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties"("id","type","name","balance","rating") values (82949,'person','Joe Johnson',912058.8,3);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties"("id","type","name","balance","rating") values (67819,'person','Scott Wilson',1113711.51,5);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties"("id","type","name","balance","rating") values (96877,'person','Paul Brown',295119.19,5);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties"("id","type","name","balance","rating") values (41835,'person','Amanda Wilson',1089338.13,3);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties"("id","type","name","balance","rating") values (26202,'company','Mueller-MacGyver',334535.34,5);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties"("id","type","name","balance","rating") values (63031,'company','Greenfelder, Kerluke and Waelchi',552414.16,5);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties"("id","type","name","balance","rating") values (99897,'company','Beier-Simonis',13223.17,4);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties"("id","type","name","balance","rating") values (93332,'company','Zboncak-Predovic',602918.87,3);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties"("id","type","name","balance","rating") values (33015,'company','Treutel-Jacobson',338053.32,2);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties"("id","type","name","balance","rating") values (38509,'company','Stokes, Sanford and Schuppe',1257149.67,5);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties"("id","type","name","balance","rating") values (78168,'company','Koch, Ondricka and Flatley',723656.72,3);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties"("id","type","name","balance","rating") values (48212,'company','Homenick-Lubowitz',448255.81,4);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties"("id","type","name","balance","rating") values (45592,'company','Walsh & Sons Co.',175004.61,5);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."parties"("id","type","name","balance","rating") values (93556,'company','Hintz Inc',5116.55,3);

insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (0,11948,91114,'2008-06-07 11:36:50',69476.94);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (1,11948,45549,'2007-02-09 07:47:59',12711.73);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (2,91114,26202,'2005-10-05 07:08:32',370.49);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (3,91114,63031,'2016-06-18 21:10:47',54478.88);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (4,91114,99897,'2001-10-16 17:49:09',7559.74);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (5,45140,26202,'2009-12-16 13:41:03',1920.97);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (6,45549,11948,'2009-10-10 20:49:04',11010.74);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (7,45549,99897,'2003-06-04 07:16:00',41609);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (8,81201,41835,'2007-11-22 10:59:25',3862.18);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (9,81201,78168,'2015-09-26 05:37:48',35630.04);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (10,67595,96877,'2014-06-06 08:16:39',93182.81);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (11,67819,82949,'2012-07-21 01:14:09',19814.51);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (12,67819,48212,'2015-11-24 05:22:24',62730.61);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (13,67819,41835,'2004-01-06 04:06:58',13041.71);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (14,96877,33015,'2002-03-28 08:07:52',27249.08);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (15,41835,78168,'2009-07-12 04:45:16',2161.17);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (16,26202,63031,'2016-10-23 09:42:24',19202.91);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (17,63031,93332,'2006-11-16 13:59:15',9239.55);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (18,63031,45140,'2007-05-25 08:22:55',87978.74);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (19,99897,11948,'2013-07-28 23:30:41',8400.87);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (20,33015,67595,'2007-04-01 01:40:31',28807.8);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (21,78168,38509,'2006-09-21 07:52:57',1323.8);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (22,78168,96877,'2000-05-25 08:58:47',3055.68);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (23,78168,38509,'2010-05-05 19:05:19',41.56);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (24,48212,45592,'2013-06-02 10:55:22',1625.79);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (25,45592,48212,'2000-03-11 01:54:18',19083.11);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (26,45592,41835,'2008-06-18 17:21:13',19684.72);
insert into "USR_4JS1EI5192ALIGS7L3SF9XC72"."transactions"("id","creditor","debtor","timestamp","value") values (27,93556,48212,'2002-03-23 08:33:32',6794.35);
