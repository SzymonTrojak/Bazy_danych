Use firma;
create database firma;
create schema rozliczenia;
--tworzenie tabeli--
create table rozliczenia.pracownicy (id_pracownika int NOT NULL primary key,imie varchar(20)NOT NULL,nazwisko varchar (40)NOT NULL,adres varchar(100),telefon int);
create table rozliczenia.godziny (id_godziny int NOT NULL primary key ,data_ date,liczba_godzin int, id_pracownika int NOT NULL);
create table rozliczenia.pensje (id_pensje int NOT NULL primary key,stanowisko varchar(20),kwota int NOT NULL, id_premii int NOT NULL);
create table rozliczenia.premie (id_premii int NOT NULL primary key,rodzaj varchar(20),kwota int);
ALTER TABLE rozliczenia.godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);
ALTER TABLE rozliczenia.pensje
ADD FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);
INSERT INTO rozliczenia.pracownicy (id_pracownika,imie, nazwisko,adres, telefon)
VALUES
(1, 'Jan', 'Kowalski', 'ul. Wiejska 1, Warszawa', '123456789'),
(2, 'Anna', 'Nowak', 'ul. Kwiatowa 2, Kraków', '987654321'),
(3, 'Piotr', 'Czajkowski', 'ul. S³oneczna 3, Gdañsk', '555555555'),
(4, 'Katarzyna', 'Zaj¹c', 'ul. Morska 4, Gdynia', '111222333'),
(5, 'Tomasz', 'Michalski', 'ul. Lipowa 5, Poznañ', '444444444'),
(6, 'Aleksandra', 'Kaczmarek', 'ul. Polna 6, £ódŸ', '777888999'),
(7, 'Grzegorz', 'Szymañski', 'ul. Krótka 7, Wroc³aw', '222222222'),
(8, 'Magdalena', 'Kowalczyk', 'ul. D³uga 8, Katowice', '333333333'),
(9, 'Marcin', 'Jankowski', 'ul. Ró¿ana 9, Lublin', '666666666'),
(10, 'Karolina', 'Kaczmarczyk', 'ul. Zielona 10, Szczecin', '999999999');
INSERT INTO rozliczenia.godziny (id_godziny,data_,liczba_godzin,id_pracownika)
VALUES
(1, '2022-01-01', 8,9),
  (2, '2022-01-02', 7,6),
  (3, '2022-01-03', 6,3),
  (4, '2022-01-04', 8,1),
  (5, '2022-01-05', 7,2),
  (6, '2022-01-06', 8,4),
  (7, '2022-01-07', 8,8),
  (8, '2022-01-08', 8,5),
  (9, '2022-01-09', 7,7),
  (10, '2022-01-10', 6,10);
  INSERT INTO rozliczenia.pensje (id_pensje,stanowisko,kwota, id_premii)
VALUES
(1, 'Kierownik', 10000, 1),
(2, 'Specjalista rynku', 8000, 2),
(3, 'Ksiêgowy', 7500, 3),
(4, 'Administracja danych', 6000, 2),
(5, 'Sprzedawca', 5000, 1),
(6, 'In¿ynier', 9000, 1),
(7, 'Programista', 9500, 3),
(8, 'Handlowiec', 5500, 2),
(9, 'Doradca klienta', 4500, 1),
(10, 'Asystent', 4000, 3);
 INSERT INTO rozliczenia.premie (id_premii,rodzaj,kwota)
VALUES
 (1, 'Nagroda roczna', 1000),
  (2, 'Premia œwi¹teczna', 500),
  (3, 'Bonus za wyniki', 750),
  (4, 'Podwy¿ka', 1500),
  (5, 'Nagroda za sta¿', 250),
  (6, 'Dobre wyniki', 1000),
  (7, 'Bonus-osi¹gniêcia', 900),
  (8, 'Podwy¿ka ', 2000),
  (9, 'Nagroda za pracê', 750),
  (10, 'Premia za cel', 1250);
  
  SELECT nazwisko,adres FROM rozliczenia.pracownicy;
 
  SELECT DATEPART(MM,data_) as MIESI¥C,
		 DATEPART(weekday,data_) as DZIEN
  FROM rozliczenia.godziny

  EXEC sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto', 'COLUMN';
  
  ALTER TABLE rozliczenia.pensje
  ADD kwota_netto int;

  UPDATE rozliczenia.pensje
  SET kwota_netto=kwota_brutto*0.77

  SELECT kwota_netto,kwota_brutto FROM rozliczenia.pensje

