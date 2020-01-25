-- Dane wprowadzone do bazy


-- uzytkownicy
INSERT INTO czytelnik VALUES (1, 'admin', 'admin', 'Kraków','18.07.1996', 'admin', 'admin', 'admin');
INSERT INTO czytelnik VALUES (2, 'Adam', 'Abacki', 'Kraków','10.04.1991', 'adm', 'maslo', 'czytelnik');
INSERT INTO czytelnik VALUES (3, 'Barbara', 'Babacka', 'Warszawa','19.12.1976', 'barb', 'pass', 'czytelnik');
INSERT INTO czytelnik VALUES (4, 'Czesław', 'Cabacki', 'Poznań','03.05.1982', 'czesio', 'haselo', 'czytelnik');
INSERT INTO czytelnik VALUES (5, 'Damian', 'Dadacki', 'Wrocław','22.10.1962', 'ddd', 'supertajnehaslo', 'czytelnik');

--wydawnictwa
INSERT INTO wydawnictwo VALUES(1, 'PWN', 'Warszawa',1951);
INSERT INTO wydawnictwo VALUES(2, 'Rebis', 'Poznań',1990);
INSERT INTO wydawnictwo VALUES(3, 'Helion', 'Gliwice',1991);
INSERT INTO wydawnictwo VALUES(4, 'Edition 2000', 'Kraków',2000);
INSERT INTO wydawnictwo VALUES(5, 'Zysk i S-ka', 'Poznań',1994);

--kategorie
INSERT INTO kategoria VALUES(1, 'Informatyka');
INSERT INTO kategoria VALUES(2, 'Literatura współczesna');
INSERT INTO kategoria VALUES(3, 'Fizyka');
INSERT INTO kategoria VALUES(4, 'Fantasy');

--ksiazki
INSERT INTO ksiazka VALUES(1, 'Wprowadzenie do algorytmów', 1, 1);
INSERT INTO ksiazka VALUES(2, 'Zabić drozda', 2, 2);
INSERT INTO ksiazka VALUES(3, 'HTML i CSS', 3, 1);
INSERT INTO ksiazka VALUES(4, 'Symfonia C++', 4, 1);
INSERT INTO ksiazka VALUES(5, 'Podstawy fizyki', 1, 3);
INSERT INTO ksiazka VALUES(6, 'Język C++ Szkoła Programowania', 3, 1);
INSERT INTO ksiazka VALUES(7, 'Gra o tron', 5, 4);
INSERT INTO ksiazka VALUES(8, 'Starcie królów', 5, 4);

--autorzy
INSERT INTO autor VALUES(1, 'Thomas', 'Cormen', '01.01.1956');
INSERT INTO autor VALUES(2, 'Charles', 'Leiserson', '01.01.1956');
INSERT INTO autor VALUES(3, 'Ronald', 'Rivest', '01.01.1956');
INSERT INTO autor VALUES(4, 'Clifford', 'Stein', '01.01.1956');
INSERT INTO autor VALUES(5, 'Harper', 'Lee', '28.04.1926');
INSERT INTO autor VALUES(6, 'Jon', 'Duckett', '24.09.1959');
INSERT INTO autor VALUES(7, 'Jerzy', 'Grębosz', '19.10.1950');
INSERT INTO autor VALUES(8, 'Jearl', 'Walker', '20.01.1945');
INSERT INTO autor VALUES(9, 'David', 'Halliday', '03.03.1916');
INSERT INTO autor VALUES(10, 'Robert', 'Resnick', '11.01.1923');
INSERT INTO autor VALUES(11, 'Stephen', 'Prata', '27.05.1942');
INSERT INTO autor VALUES(12, 'George', 'Martin', '20.09.1948');

--autorzy i ksiazki
INSERT INTO autorksiazka VALUES(1, 1);
INSERT INTO autorksiazka VALUES(2, 1);
INSERT INTO autorksiazka VALUES(3, 1);
INSERT INTO autorksiazka VALUES(4, 1);
INSERT INTO autorksiazka VALUES(5, 2);
INSERT INTO autorksiazka VALUES(6, 3);
INSERT INTO autorksiazka VALUES(7, 4);
INSERT INTO autorksiazka VALUES(8, 5);
INSERT INTO autorksiazka VALUES(9, 5);
INSERT INTO autorksiazka VALUES(10, 5);
INSERT INTO autorksiazka VALUES(11, 6);
INSERT INTO autorksiazka VALUES(12, 7);
INSERT INTO autorksiazka VALUES(12, 8);

--egzemplarze
INSERT INTO egzemplarz VALUES(1, 1, 2008, true);
INSERT INTO egzemplarz VALUES(2, 2, 2018, true);
INSERT INTO egzemplarz VALUES(3, 3, 2015, true);
INSERT INTO egzemplarz VALUES(4, 4, 2008, true);
INSERT INTO egzemplarz VALUES(5, 4, 2012, true);
INSERT INTO egzemplarz VALUES(6, 4, 2016, true);
INSERT INTO egzemplarz VALUES(7, 5, 1999, true);
INSERT INTO egzemplarz VALUES(8, 5, 2010, true);
INSERT INTO egzemplarz VALUES(9, 6, 2017, true);
INSERT INTO egzemplarz VALUES(10, 7, 2005, true);
INSERT INTO egzemplarz VALUES(11, 7, 2018, true);
INSERT INTO egzemplarz VALUES(12, 8, 2018, true);

--rezerwacje
INSERT INTO rezerwacja VALUES(1, '28.07.2017', false, 2, 3);
INSERT INTO rezerwacja VALUES(2, '28.07.2017', false, 3, 1);
INSERT INTO rezerwacja VALUES(3, '28.07.2017', false, 2, 5);
INSERT INTO rezerwacja VALUES(4, '28.01.2018', false, 5, 4);
INSERT INTO rezerwacja VALUES(5, '28.07.2017', false, 4, 7);
update egzemplarz set dostepnosc=true;
INSERT INTO rezerwacja VALUES(6, '28.07.2017', true, 3, 3);

--wypozyczenia
INSERT INTO wypozyczenie VALUES(1, '19.01.2018', NULL, 2, 4);
INSERT INTO wypozyczenie VALUES(2, '19.01.2018', NULL, 3, 5);
INSERT INTO wypozyczenie VALUES(3, '19.01.2018', NULL, 4, 7);
INSERT INTO wypozyczenie VALUES(4, '19.01.2018', NULL, 5, 8);
INSERT INTO wypozyczenie VALUES(5, '19.01.2018', NULL, 2, 1);
INSERT INTO wypozyczenie VALUES(6, '19.01.2018', NULL, 3, 2);
UPDATE wypozyczenie SET data_oddania=CURRENT_DATE;
INSERT INTO wypozyczenie VALUES(7, '19.01.2018', NULL, 2, 5);
INSERT INTO wypozyczenie VALUES(8, '19.01.2018', NULL, 3, 4);
INSERT INTO wypozyczenie VALUES(9, '19.01.2018', NULL, 4, 8);
INSERT INTO wypozyczenie VALUES(10, '19.01.2018', NULL, 5, 7);
INSERT INTO wypozyczenie VALUES(11, '19.01.2018', NULL, 2, 2);
INSERT INTO wypozyczenie VALUES(12, '19.01.2018', NULL, 3, 1);
UPDATE wypozyczenie SET data_oddania=CURRENT_DATE;
INSERT INTO wypozyczenie VALUES(13, '19.01.2018', NULL, 5, 5);
INSERT INTO wypozyczenie VALUES(14, '19.01.2018', NULL, 2, 7);
INSERT INTO wypozyczenie VALUES(15, '19.01.2018', NULL, 3, 4);

--opinie
INSERT INTO opinia VALUES(1, 9, 2, 4);
INSERT INTO opinia VALUES(2, 9, 2, 5);
INSERT INTO opinia VALUES(3, 9, 2, 1);
INSERT INTO opinia VALUES(4, 9, 2, 2);
INSERT INTO opinia VALUES(5, 3, 3, 5);
INSERT INTO opinia VALUES(6, 2, 3, 4);
INSERT INTO opinia VALUES(7, 1, 3, 2);
INSERT INTO opinia VALUES(8, 10, 3, 1);
INSERT INTO opinia VALUES(9, 8, 4, 7);
INSERT INTO opinia VALUES(10, 7, 4, 8);
INSERT INTO opinia VALUES(11, 6, 5, 8);
INSERT INTO opinia VALUES(12, 5, 5, 7);