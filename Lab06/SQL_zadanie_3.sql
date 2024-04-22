USE firma;
--a
ALTER TABLE ksiegowosc.pracownicy
ALTER COLUMN telefon varchar(20);

UPDATE ksiegowosc.pracownicy
SET ksiegowosc.pracownicy.telefon='(+48)'+ksiegowosc.pracownicy.telefon
WHERE ksiegowosc.pracownicy.telefon NOT LIKE '(+48)%';

SELECT *
FROM ksiegowosc.pracownicy;

--b
UPDATE ksiegowosc.pracownicy
SET ksiegowosc.pracownicy.telefon=SUBSTRING(ksiegowosc.pracownicy.telefon, 1, 8)+'-'+SUBSTRING(ksiegowosc.pracownicy.telefon, 9, 3)+'-'+SUBSTRING(ksiegowosc.pracownicy.telefon, 12, 3);

SELECT *
FROM ksiegowosc.pracownicy;

--c
SELECT TOP 1 UPPER(CONCAT(id_pracownika, ', ', nazwisko, ' ', imie, ', ', adres, ', ', telefon)) AS Dane
FROM ksiegowosc.pracownicy
ORDER BY LEN(nazwisko) DESC

--d
SELECT HASHBYTES('MD5',imie) AS imie, HASHBYTES('MD5',nazwisko) AS nazwisko, HASHBYTES('MD5',adres) AS adres, HASHBYTES('MD5',telefon) AS telefon,HASHBYTES('MD5',CAST(kwota AS VARCHAR(12))) AS kwota FROM ksiegowosc.pracownicy pr
JOIN ksiegowosc.wynagrodzenia wy ON wy.id_pracownika = pr.id_pracownika 
JOIN ksiegowosc.pensja pe ON wy.id_pensji = pe.id_pensji;

--e
SELECT pr.*,pe.kwota,pre.kwota FROM ksiegowosc.pracownicy as pr
LEFT JOIN ksiegowosc.wynagrodzenia as wy ON pr.id_pracownika=wy.id_pracownika
LEFT JOIN ksiegowosc.pensja as pe ON pe.id_pensji=wy.id_pensji
LEFT JOIN ksiegowosc.premia as pre ON pre.id_premii=wy.id_premii
-- f
SELECT CONCAT('Pracownik ' , pracownik.imie , ' ' , pracownik.nazwisko ,', w dniu ',  FORMAT(g.data_, 'd', 'de-de'),' otrzyma³ pensjê ca³kowit¹ na kwotê ', p.kwota+ISNULL(pr.kwota,0)+ CASE WHEN g.liczba_godzin <= 160 THEN 0 ELSE (g.liczba_godzin-160)*40 END, ' z³, gdzie
wynagrodzenie zasadnicze wynosi³o: ', p.kwota,' z³, premia: ',isnull(pr.kwota,0),' z³, nadgodziny: ', CASE WHEN g.liczba_godzin <= 160 THEN 0 ELSE (g.liczba_godzin-160)*40 END,' z£' ) AS raport FROM ksiegowosc.pracownicy AS pracownik 
JOIN ksiegowosc.wynagrodzenia AS w 
ON pracownik.id_pracownika = w.id_pracownika 
JOIN ksiegowosc.godziny AS g 
ON pracownik.id_pracownika = g.id_pracownika 
JOIN ksiegowosc.pensja AS p 
ON p.id_pensji = w.id_pensji
JOIN ksiegowosc.premia AS pr 
ON pr.id_premii = w.id_pensji;