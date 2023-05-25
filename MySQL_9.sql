CREATE DATABASE WymiarGeochronologiczny;
USE WymiarGeochronologiczny;
CREATE SCHEMA geo1;
-- create table
CREATE TABLE geo1.GeoEon (
	id_eon INTEGER PRIMARY KEY,
	nazwa_eon VARCHAR(45) NOT NULL
);

CREATE TABLE geo1.GeoEra (
	id_era INTEGER PRIMARY KEY,
	id_eon INTEGER,
	nazwa_era VARCHAR(45) NOT NULL,
	FOREIGN KEY (id_eon) REFERENCES GeoEon(id_eon)
);

CREATE TABLE geo1.GeoOkres (
	id_okres INTEGER PRIMARY KEY,
	id_era INTEGER REFERENCES GeoEra (id_era),
	nazwa_okres VARCHAR(45) NOT NULL,
	FOREIGN KEY (id_era) REFERENCES GeoEra (id_era)
);

CREATE TABLE geo1.GeoEpoka (
	id_epoka INTEGER PRIMARY KEY,
	id_okres INTEGER REFERENCES GeoOkres(id_okres),
	nazwa_epoka VARCHAR(45) NOT NULL,
	FOREIGN KEY (id_okres) REFERENCES GeoOkres (id_okres)
);

CREATE TABLE geo1.GeoPietro (
	id_pietro INTEGER PRIMARY KEY,
	id_epoka INTEGER REFERENCES GeoEpoka(id_epoka),
	nazwa_p VARCHAR(45) NOT NULL,
	FOREIGN KEY (id_epoka) REFERENCES GeoEpoka (id_epoka)
);


INSERT INTO geo1.GeoEon VALUES
	(1, 'Fanerozoik');

INSERT INTO geo1.GeoEra VALUES
	(1, 1, 'Kenozoik'),
	(2, 1, 'Mezozoik'),
	(3, 1, 'Paleozoik');

INSERT INTO geo1.GeoOkres VALUES
	(1, 1, 'Czwartorzęd'),
	(2, 1, 'Neogen'),
	(3, 1, 'Paleogen'),
	(4, 2, 'Kreda'),
	(5, 2, 'Jura'),
	(6, 2, 'Trias'),
	(7, 3, 'Perm'),
	(8, 3, 'Karbon'),
	(9, 3, 'Dewon');

INSERT INTO geo1.GeoEpoka VALUES
	(1, 1, 'Holocen'),
	(2, 1, 'Plejstocen'),
	(3, 2, 'Pliocen'),
	(4, 2, 'Miocen'),
	(5, 3, 'Oligocen'),
	(6, 3, 'Eocen'),
	(7, 3, 'Paleocen'),
	(8, 4, 'Póżna kreda'),
	(9, 4, 'Wczesna kreda'),
	(10, 5, 'Jura późna'),
	(11, 5, 'Jura środkowa'),
	(12, 5, 'Jura wczesna'),
	(13, 6, 'Późny trias'),
	(14, 6, 'Środkowy trias'),
	(15, 6, 'Wczesny trias'),
	(16, 7, 'Póżny perm'),
	(17, 7, 'Wczesny perm'),
	(18, 8, 'Późny karbon'),
	(19, 8, 'Wczesny karbon'),
	(20, 9, 'Późny dewon'),
	(21, 9, 'Środkowy dewon'),
	(22, 9, 'Dolny dewon');

INSERT INTO geo1.GeoPietro VALUES
	(1,1,'megalaj'),
	(2,1,'northgrip'),
	(3,1,'grenland'),
	(4,2,'późny[b]'),
	(5,2,'chiban'),
	(6,2,'kalabr'),
	(7,2,'gelas'),
	(8,3,'piacent'),
	(9,3,'zankl'),
	(10,4,'messyn'),
	(11,4,'torton'),
	(12,4,'serrawal'),
	(13,4,'lang'),
	(14,4,'burdygał'),
	(15,4,'akwitan'),
	(16,5,'szat'),
	(17,5,'rupel'),
	(18,6,'priabon'),
	(19,6,'barton'),
	(20,6,'lutet'),
	(21,6,'iprez'),
	(22,7,'tanet'),
	(23,7,'zeland'),
	(24,7,'dan'),
	(25,8,'mastrycht'),
	(26,8,'kampan'),
	(27,8,'santon'),
	(28,8,'koniak'),
	(29,8,'turon'),
	(30,8,'cenoman'),
	(31,9,'alb'),
	(32,9,'apt'),
	(33,9,'barrem'),
	(34,9,'hoteryw'),
	(35,9,'walanżyn'),
	(36,9,'berrias'),
	(37,10,'tyton'),
	(38,10,'kimeryd'),
	(39,10,'oksford'),
	(40,11,'kelowej'),
	(41,11,'baton'),
	(42,11,'bajos'),
	(43,11,'aalen'),
	(44,12,'toark'),
	(45,12,'pliensbach'),
	(46,12,'synemur'),
	(47,12,'hettang'),
	(48,13,'retyk'),
	(49,13,'noryk'),
	(50,13,'karnik'),
	(51,14,'ladyn'),
	(52,14,'anizyk'),
	(53,15,'olenek'),
	(54,15,'ind'),
	(55,16,'czangsing'),
	(56,16,'wucziaping'),
	(57,16,'kapitan'),
	(58,16,'word'),
	(59,16,'road'),
	(60,17,'kungur'),
	(61,17,'artinsk'),
	(62,17,'sakmar'),
	(63,17,'assel'),
	(64,18,'gżel'),
	(65,18,'kasimow'),
	(66,18,'moskow'),
	(67,18,'baszkir'),
	(68,19,'serpuchow'),
	(69,19,'wizen'),
	(70,19,'turnej'),
	(71,20,'famen'),
	(72,20,'fran'),
	(73,21,'żywet'),
	(74,21,'eifel'),
	(75,22,'ems'),
	(76,22,'prag'),
	(77,22,'lochkow');

CREATE TABLE GeoTabela AS (SELECT * FROM geo1.GeoPietro NATURAL JOIN geo1.GeoEpoka NATURAL
JOIN geo1.GeoOkres NATURAL JOIN geo1.GeoEra NATURAL JOIN geo1.GeoEon);

ALTER TABLE GeoTabela
ADD PRIMARY KEY (id_pietro);

CREATE TABLE geo1.Dziesiec
(
wartosc INTEGER NOT NULL PRIMARY KEY
);
INSERT INTO geo1.dziesiec VALUES(0);
INSERT INTO geo1.Dziesiec VALUES(1);
INSERT INTO geo1.Dziesiec VALUES(2);
INSERT INTO geo1.Dziesiec VALUES(3);
INSERT INTO geo1.Dziesiec VALUES(4);
INSERT INTO geo1.Dziesiec VALUES(5);
INSERT INTO geo1.Dziesiec VALUES(6);
INSERT INTO geo1.Dziesiec VALUES(7);
INSERT INTO geo1.Dziesiec VALUES(8);
INSERT INTO geo1.Dziesiec VALUES(9);

CREATE TABLE
	geo1.milion

SELECT
	d1.wartosc+10*d2.wartosc+100*d3.wartosc+1000*d4.wartosc+10000*d5.wartosc+100000*d6.wartosc AS liczba
FROM
	geo1.dziesiec d1,
	geo1.dziesiec d2,
	geo1.dziesiec d3,
	geo1.dziesiec d4,
	geo1.dziesiec d5,
	geo1.dziesiec d6;

#SELECT * FROM geo1.milion
#ORDER BY geo1.milion.liczba;

CREATE INDEX id_eon ON geo1.GeoEon(id_eon);
CREATE INDEX id_era ON geo1.GeoEra(id_era);
CREATE INDEX id_epoka ON geo1.GeoEpoka(id_epoka);
CREATE INDEX id_okres ON geo1.GeoOkres(id_okres);
CREATE INDEX id_pietro ON geo1.GeoPietro(id_pietro);
CREATE INDEX liczba ON geo1.Milion(liczba);

DROP INDEX id_pietro ON geo1.GeoPietro;
DROP INDEX id_epoka ON geo1.GeoEpoka;
DROP INDEX id_okres ON geo1.GeoOkres;
DROP INDEX id_era ON geo1.GeoEra;
DROP INDEX id_eon ON geo1.GeoEon;
DROP INDEX liczba ON geo1.Milion;

#1
SELECT COUNT(*) FROM geo1.Milion INNER JOIN GeoTabela ON
    (mod(Milion.liczba,77)=(GeoTabela.id_pietro));
#2
SELECT COUNT(*) FROM geo1.Milion INNER JOIN  geo1.GeoPietro  ON
    (mod(Milion.liczba,77)=GeoPietro.id_pietro)
    NATURAL JOIN geo1.GeoEpoka NATURAL JOIN geo1.GeoOkres NATURAL JOIN geo1.GeoEra NATURAL JOIN geo1.GeoEon;
#3
SELECT COUNT(*) FROM geo1.Milion WHERE mod(Milion.liczba,77)=
    (SELECT id_pietro FROM GeoTabela   WHERE mod(Milion.liczba,77)=(id_pietro));
#4
SELECT COUNT(*) FROM geo1.Milion WHERE mod(Milion.liczba,77) IN
    (SELECT geo1.GeoPietro.id_pietro FROM geo1.GeoPietro NATURAL JOIN
    geo1.GeoEpoka NATURAL JOIN   geo1.GeoOkres NATURAL JOIN geo1.GeoEra NATURAL JOIN geo1.GeoEon);
