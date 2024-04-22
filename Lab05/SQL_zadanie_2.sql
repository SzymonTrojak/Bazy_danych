Use firma;
create database firma;
create schema ksiegowosc;
--tworzenie tabeli--
create table ksiegowosc.pracownicy (id_pracownika int NOT NULL primary key,imie varchar(50)NOT NULL,nazwisko varchar (40)NOT NULL,adres varchar(100),telefon varchar(9));
create table ksiegowosc.godziny (id_godziny int NOT NULL primary key ,data_ date,liczba_godzin float, id_pracownika int NOT NULL);
create table ksiegowosc.pensja (id_pensji int NOT NULL primary key,stanowisko varchar(50),kwota money NOT NULL);
create table ksiegowosc.premia (id_premii int NOT NULL primary key,rodzaj varchar(50),kwota money);
create table ksiegowosc.wynagrodzenia (id_wynagrodzenia int NOT NULL primary key,data_ date,id_pracownika int, id_godziny int, id_pensji int, id_premii int);


ALTER TABLE ksiegowosc.godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);
ALTER TABLE ksiegowosc.wynagrodzenia
ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);
ALTER TABLE ksiegowosc.wynagrodzenia
ADD FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny(id_godziny);
ALTER TABLE ksiegowosc.wynagrodzenia
ADD FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensja(id_pensji);
ALTER TABLE ksiegowosc.wynagrodzenia
ADD FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premia(id_premii);


EXEC sys.sp_addextendedproperty
@name = N'Opis tabeli "pracownicy"',
@value = N'Informacje o pracownikach',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'pracownicy';
GO

EXEC sys.sp_addextendedproperty
@name = N'Opis tabeli "godziny"',
@value = N'Informacje o godzinach pracy ka¿dego z pracowników',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'godziny';
GO

EXEC sys.sp_addextendedproperty
@name = N'Opis tabeli "pensja"',
@value = N'Informacje o pensjach',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'pensja';
GO

EXEC sys.sp_addextendedproperty
@name = N'Opis tabeli "premia"',
@value = N'Informacje o premiach',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'premia';
GO

EXEC sys.sp_addextendedproperty
@name = N'Opis tabeli "wynagrodzenie"',
@value = N'Informacje o wynagrodzeniach',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'wynagrodzenia';
GO

/*
SELECT value AS Comment
FROM sys.extended_properties
WHERE major_id = 
OBJECT_ID('ksiegowosc.pracownicy')
AND minor_id = 0
AND class = 1;
*/

INSERT INTO ksiegowosc.pracownicy (id_pracownika,imie, nazwisko,adres, telefon)
VALUES
(1, 'Jan', 'Kowalski', 'ul. Wiejska 1, Warszawa', '123456789'),
(2, 'Anna', 'Nowak', 'ul. Kwiatowa 2, Kraków', '987654321'),
(3, 'Piotr', 'Czajkowski', 'ul. S³oneczna 3, Gdañsk', '555555555'),
(4, 'Katarzyna', 'Zaj¹c', 'ul. Morska 4, Gdynia', '111222333'),
(5, 'Tomasz', 'Michalski', 'ul. Lipowa 5, Poznañ', '444444444'),
(6, 'Aleksandra', 'Kaczmarek', 'ul. Polna 6, £ódŸ', '777888999'),
(7, 'Grzegorz', 'Szymañski', 'ul. Krótka 7, Wroc³aw', '222222222'),
(8, 'Magdalena', 'Kowalnczyk', 'ul. D³uga 8, Katowice', '333333333'),
(9, 'Marcin', 'Jankowski', 'ul. Ró¿ana 9, Lublin', '666666666'),
(10, 'Karolina', 'Kaczmarczyk', 'ul. Zielona 10, Szczecin', '999999999');
INSERT INTO ksiegowosc.godziny (id_godziny,data_,liczba_godzin,id_pracownika)
VALUES
(1, '2022-01-01', 165,9),
  (2, '2022-01-02', 174,6),
  (3, '2022-01-03', 79,3),
  (4, '2022-01-04', 158,1),
  (5, '2022-01-05', 200,2),
  (6, '2022-01-06', 164,4),
  (7, '2022-01-07', 159,8),
  (8, '2022-01-08', 148,5),
  (9, '2022-01-09', 127,7),
  (10, '2022-01-10', 58,10);
  INSERT INTO ksiegowosc.pensja (id_pensji,stanowisko,kwota)
VALUES
(1, 'Kierownik', 10000),
(2, 'Specjalista rynku', 8000),
(3, 'Ksiêgowy', 7500),
(4, 'Administracja danych', 6000),
(5, 'Sprzedawca', 2900),
(6, 'In¿ynier', 1000),
(7, 'Programista', 1700),
(8, 'Doradca klienta', 1700),
(9, 'Doradca klienta', 4500),
(10, 'Asystent', 4000);
 INSERT INTO ksiegowosc.premia (id_premii,rodzaj,kwota)
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
  

  INSERT INTO ksiegowosc.wynagrodzenia VALUES
	(1, '2023-04-10', 1, 1, 1, 1),
	(2, '2023-04-12', 2, 2, 2, 2),
	(3, '2023-04-12', 3, 3, 3, 3),
	(4, '2023-04-14', 4, 4, 4, 4),
	(5, '2023-04-13', 5, 5, 5, 5),
	(6, '2023-04-13', 6, 6, 6, 6),
	(7, '2023-04-12', 7, 7, 7, 7),
	(8, '2023-04-15', 8, 8, 8, 8),
	(9, '2023-04-15', 9, 9, 9, 9),
	(10, '2023-04-12', 10, 10, 10, 10);



  -- a imie i nazwisko pracownika
  SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;

  --b) Wyœwietl id pracowników, których p³aca jest wiêksza ni¿ 1000.
SELECT pracownicy.id_pracownika FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenia as wynagrodzenie
ON ksiegowosc.pracownicy.id_pracownika = wynagrodzenie.id_pracownika
INNER JOIN ksiegowosc.pensja as pensja
ON wynagrodzenie.id_pensji = pensja.id_pensji
WHERE pensja.kwota > 1000;

--c Wyœwietl id pracowników nieposiadaj¹cych premii,których p³aca jest wiêksza ni¿ 2000
-- W MOJEJ FIRMIE KAZDY PRACONIK ZAS£UGUJE NA PREEMIE
SELECT pracownik.id_pracownika FROM ksiegowosc.pracownicy AS pracownik
INNER JOIN ksiegowosc.wynagrodzenia as wynagrodzenie
ON pracownik.id_pracownika = wynagrodzenie.id_pracownika
INNER JOIN ksiegowosc.pensja AS pensje
ON wynagrodzenie.id_pensji = pensje.id_pensji
INNER JOIN ksiegowosc.premia as premie
ON wynagrodzenie.id_premii= premie.id_premii
WHERE pensje.kwota > 2000 AND premie.kwota IS NULL;

--d Wyœwietl pracowników, których pierwsza litera imienia zaczyna siê na literê ‘J’.
SELECT id_pracownika,imie,nazwisko FROM ksiegowosc.pracownicy WHERE ksiegowosc.pracownicy.imie LIKE 'J%'

--e Wyœwietl pracowników, których nazwisko zawiera literê ‘n’ oraz imiê koñczy siê na literê ‘a’.
SELECT id_pracownika,imie,nazwisko FROM ksiegowosc.pracownicy WHERE ksiegowosc.pracownicy.imie LIKE '%a' AND ksiegowosc.pracownicy.nazwisko LIKE '%n%'
  
--f Wyœwietl imiê i nazwisko pracowników oraz liczbê ich nadgodzin, standard to 160 h miesiêcznie.
SELECT pracownicy.imie,pracownicy.nazwisko, 
CASE WHEN (godziny.liczba_godzin>160) THEN (godziny.liczba_godzin-160) END as nadgodziny
FROM ksiegowosc.pracownicy as pracownicy
INNER JOIN ksiegowosc.wynagrodzenia as wynagrodzenia
ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
INNER JOIN ksiegowosc.godziny as godziny
ON wynagrodzenia.id_godziny = godziny.id_godziny;

--g Wyœwietl imiê i nazwisko pracowników, których pensja zawiera siê w przedziale 1500 –3000PLN.
SELECT pracownicy.imie,pracownicy.nazwisko,pensja.kwota FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenia AS wynagrodzenia
ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
INNER JOIN ksiegowosc.pensja AS pensja
ON pensja.id_pensji = wynagrodzenia.id_pensji
WHERE pensja.kwota BETWEEN 1500 AND 3000; 

--h Wyœwietl imiê i nazwisko pracowników, którzy pracowali w nadgodzinach i nie otrzymali premii.
SELECT pracownicy.imie,pracownicy.nazwisko FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenia AS wynagrodzenia
ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
INNER JOIN ksiegowosc.godziny AS godziny
ON wynagrodzenia.id_godziny = godziny.id_godziny
INNER JOIN ksiegowosc.premia AS premia
ON premia.id_premii = wynagrodzenia.id_premii
WHERE godziny.liczba_godzin>160 AND premia.kwota IS  NULL; 

-- i Uszereguj pracowników wed³ug pensji.
SELECT pracownicy.id_pracownika,imie, nazwisko,pensja.kwota FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenia as wynagrodzenia
ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
INNER JOIN ksiegowosc.pensja AS pensja
ON wynagrodzenia.id_pensji = pensja.id_pensji
ORDER BY pensja.kwota DESC;

 -- j Uszereguj pracowników wed³ug pensji i premii malej¹co CHYBA  JAKO SUMA ,PREMI I PENSJI
 SELECT pracownicy.id_pracownika,imie, nazwisko,(pensja.kwota+premia.kwota) FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenia as wynagrodzenia
ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
INNER JOIN ksiegowosc.pensja AS pensja
ON wynagrodzenia.id_pensji = pensja.id_pensji
INNER JOIN ksiegowosc.premia AS premia
ON wynagrodzenia.id_premii = premia.id_premii
ORDER BY pensja.kwota DESC;

 --k Zlicz i pogrupuj pracowników wed³ug pola stanowisko.
 SELECT pensja.stanowisko, SUM(pensja.kwota) AS suma_wynagrodzen FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenia AS wynagrodzenia
on pracownicy.id_pracownika = wynagrodzenia.id_pracownika
INNER JOIN ksiegowosc.pensja AS pensja 
ON pensja.id_pensji = wynagrodzenia.id_pensji
GROUP BY pensja.stanowisko;

--l Policz œredni¹, minimaln¹ i maksymaln¹ p³acê dla stanowiska ‘kierownik’ (je¿eli takiego nie masz, to przyjmij dowolne inne).
SELECT avg(pensja.kwota) AS srednia, min(pensja.kwota) AS minimalna, max(pensja.kwota) AS maksymalna FROM ksiegowosc.wynagrodzenia AS wynagrodzenia
INNER JOIN ksiegowosc.pensja AS pensja 
ON pensja.id_pensji = wynagrodzenia.id_pensji
WHERE pensja.stanowisko = 'Doradca klienta'

--m Policz sumê wszystkich wynagrodzeñ.
SELECT SUM(premia.kwota+pensja.kwota) AS suma_wynagrodzen FROM ksiegowosc.pracownicy 
INNER JOIN ksiegowosc.wynagrodzenia AS wynagrodzenie
on pracownicy.id_pracownika = wynagrodzenie.id_pracownika
INNER JOIN ksiegowosc.pensja AS pensja
ON pensja.id_pensji = wynagrodzenie.id_pensji
INNER JOIN ksiegowosc.premia AS premia
ON premia.id_premii = wynagrodzenie.id_premii;

--n Policz sumê wynagrodzeñ w ramach danego stanowiska.

SELECT SUM(premia.kwota+pensja.kwota) AS suma_wynagrodzen, pensja.stanowisko FROM ksiegowosc.pracownicy 
INNER JOIN ksiegowosc.wynagrodzenia AS wynagrodzenie
on pracownicy.id_pracownika = wynagrodzenie.id_pracownika
INNER JOIN ksiegowosc.pensja AS pensja
ON pensja.id_pensji = wynagrodzenie.id_pensji
INNER JOIN ksiegowosc.premia AS premia
ON premia.id_premii = wynagrodzenie.id_premii
GROUP BY pensja.stanowisko
ORDER BY suma_wynagrodzen DESC;

--o Wyznacz liczbê premii przyznanych dla pracowników danego stanowiska.

SELECT SUM(premia.kwota)AS suma_premii, pensja.stanowisko FROM ksiegowosc.pracownicy 
INNER JOIN ksiegowosc.wynagrodzenia AS wynagrodzenie
on pracownicy.id_pracownika = wynagrodzenie.id_pracownika
INNER JOIN ksiegowosc.pensja AS pensja
ON pensja.id_pensji = wynagrodzenie.id_pensji
INNER JOIN ksiegowosc.premia AS premia
ON premia.id_premii = wynagrodzenie.id_premii
GROUP BY pensja.stanowisko
ORDER BY suma_premii DESC;

--p Usuwanie pracownikow ponizej 1200 pln
EXEC sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT ALL"
GO
DELETE pracownicy FROM ksiegowosc.pracownicy 
INNER JOIN ksiegowosc.wynagrodzenia ON pracownicy.id_pracownika = wynagrodzenia.id_pracownika
INNER JOIN ksiegowosc.pensja ON wynagrodzenia.id_pensji = pensja.id_pensji
	WHERE pensja.kwota < 1200;
GO

SELECT * FROM ksiegowosc.pracownicy;