-- Dane wprowadzone do bazy


-- uzytkownicy
INSERT INTO widz VALUES (1, 'admin', 'admin','10.10.1990', 'admin', 'admin', 'AGH', 'admin');
INSERT INTO widz VALUES (2, 'Michal', 'Stefaniuk','20.09.1996', 'michal', 'haslo', 'AGH', 'user');
INSERT INTO widz VALUES (3, 'Jan', 'Kowalski', '19.12.1976', 'jan', 'haslo', 'UJ', 'user');
INSERT INTO widz VALUES (4, 'Adam', 'Nowak', '03.05.1982', 'adam', 'haslo', 'UEK', 'user');
INSERT INTO widz VALUES (5, 'Zbigniew', 'Stonoga', '22.10.1962', 'zbyszek', 'haslo', 'UP', 'user');

--studia filmowe
INSERT INTO studio VALUES(1, 'Warner Bros', 'Hollywood');
INSERT INTO studio VALUES(2, 'Walt Disney', 'Chicago');
INSERT INTO studio VALUES(3, 'Maravel Studios', 'Burbank');
INSERT INTO studio VALUES(4, 'Universal Studios', 'Hollywood');
INSERT INTO studio VALUES(5, 'Columbia Pictures', 'Culver City');

--gatunki filmowe
INSERT INTO gatunek VALUES(1, 'Akcja');
INSERT INTO gatunek VALUES(2, 'Biograficzny');
INSERT INTO gatunek VALUES(3, 'Dramat');
INSERT INTO gatunek VALUES(4, 'Fantasy');
INSERT INTO gatunek VALUES(5, 'Kryminalny');
INSERT INTO gatunek VALUES(6, 'Dokumentalny');

--filmy
INSERT INTO film VALUES(1, 'Ojciec Chrzestny', 1, 1);
INSERT INTO film VALUES(2, 'Skazani na Shawshank', 2, 3);
INSERT INTO film VALUES(3, 'Lista Schindlera', 3, 2);
INSERT INTO film VALUES(4, 'Casablance', 4, 4);
INSERT INTO film VALUES(5, 'Harry Potter', 1, 5);
INSERT INTO film VALUES(6, 'Wladca Pierscieni', 3, 6);
INSERT INTO film VALUES(7, 'Forrest Gump', 5, 2);
INSERT INTO film VALUES(8, 'Gwiezdne Wojny', 5, 3);

--rezyserzy
INSERT INTO rezyser VALUES(1, 'Thomas', 'Cormen', '01.01.1956');
INSERT INTO rezyser VALUES(2, 'Charles', 'Leiserson', '01.01.1956');
INSERT INTO rezyser VALUES(3, 'Ronald', 'Rivest', '01.01.1956');
INSERT INTO rezyser VALUES(4, 'Clifford', 'Stein', '01.01.1956');
INSERT INTO rezyser VALUES(5, 'Harper', 'Lee', '28.04.1926');
INSERT INTO rezyser VALUES(6, 'Jon', 'Duckett', '24.09.1959');
INSERT INTO rezyser VALUES(7, 'Jerzy', 'Grębosz', '19.10.1950');
INSERT INTO rezyser VALUES(8, 'Jearl', 'Walker', '20.01.1945');
INSERT INTO rezyser VALUES(9, 'David', 'Halliday', '03.03.1916');
INSERT INTO rezyser VALUES(10, 'Robert', 'Resnick', '11.01.1923');
INSERT INTO rezyser VALUES(11, 'Stephen', 'Prata', '27.05.1942');
INSERT INTO rezyser VALUES(12, 'George', 'Martin', '20.09.1948');

--rezyserzy i ksiazki
INSERT INTO rezyser_filmu VALUES(1, 1);
INSERT INTO rezyser_filmu VALUES(2, 1);
INSERT INTO rezyser_filmu VALUES(3, 1);
INSERT INTO rezyser_filmu VALUES(4, 1);
INSERT INTO rezyser_filmu VALUES(5, 2);
INSERT INTO rezyser_filmu VALUES(6, 3);
INSERT INTO rezyser_filmu VALUES(7, 4);
INSERT INTO rezyser_filmu VALUES(8, 5);
INSERT INTO rezyser_filmu VALUES(9, 5);
INSERT INTO rezyser_filmu VALUES(10, 5);
INSERT INTO rezyser_filmu VALUES(11, 6);
INSERT INTO rezyser_filmu VALUES(12, 7);
INSERT INTO rezyser_filmu VALUES(12, 8);

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
INSERT INTO zamowienie VALUES(1, '28.07.2017', false, 2, 3);
INSERT INTO zamowienie VALUES(2, '28.07.2017', false, 3, 1);
INSERT INTO zamowienie VALUES(3, '28.07.2017', false, 2, 5);
INSERT INTO zamowienie VALUES(4, '28.01.2018', false, 5, 4);
INSERT INTO zamowienie VALUES(5, '28.07.2017', false, 4, 7);
update egzemplarz set czy_wypozyczony=true;
INSERT INTO zamowienie VALUES(6, '28.07.2017', true, 3, 3);

--wypozyczenia
INSERT INTO wypozyczono VALUES(1, '19.01.2018', NULL, 2, 4);
INSERT INTO wypozyczono VALUES(2, '19.01.2018', NULL, 3, 5);
INSERT INTO wypozyczono VALUES(3, '19.01.2018', NULL, 4, 7);
INSERT INTO wypozyczono VALUES(4, '19.01.2018', NULL, 5, 8);
INSERT INTO wypozyczono VALUES(5, '19.01.2018', NULL, 2, 1);
INSERT INTO wypozyczono VALUES(6, '19.01.2018', NULL, 3, 2);
UPDATE wypozyczono SET data_end=CURRENT_DATE;
INSERT INTO wypozyczono VALUES(7, '19.01.2018', NULL, 2, 5);
INSERT INTO wypozyczono VALUES(8, '19.01.2018', NULL, 3, 4);
INSERT INTO wypozyczono VALUES(9, '19.01.2018', NULL, 4, 8);
INSERT INTO wypozyczono VALUES(10, '19.01.2018', NULL, 5, 7);
INSERT INTO wypozyczono VALUES(11, '19.01.2018', NULL, 2, 2);
INSERT INTO wypozyczono VALUES(12, '19.01.2018', NULL, 3, 1);
UPDATE wypozyczono SET data_end=CURRENT_DATE;
INSERT INTO wypozyczono VALUES(13, '19.01.2018', NULL, 5, 5);
INSERT INTO wypozyczono VALUES(14, '19.01.2018', NULL, 2, 7);
INSERT INTO wypozyczono VALUES(15, '19.01.2018', NULL, 3, 4);

--opinie
INSERT INTO widz_filmu VALUES(1, 9, 2, 4);
INSERT INTO widz_filmu VALUES(2, 9, 2, 5);
INSERT INTO widz_filmu VALUES(3, 9, 2, 1);
INSERT INTO widz_filmu VALUES(4, 9, 2, 2);
INSERT INTO widz_filmu VALUES(5, 3, 3, 5);
INSERT INTO widz_filmu VALUES(6, 2, 3, 4);
INSERT INTO widz_filmu VALUES(7, 1, 3, 2);
INSERT INTO widz_filmu VALUES(8, 10, 3, 1);
INSERT INTO widz_filmu VALUES(9, 8, 4, 7);
INSERT INTO widz_filmu VALUES(10, 7, 4, 8);
INSERT INTO widz_filmu VALUES(11, 6, 5, 8);
INSERT INTO widz_filmu VALUES(12, 5, 5, 7);