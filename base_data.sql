-- Dane wprowadzone do bazy


-- uzytkownicy
INSERT INTO widz VALUES (1, 'admin', 'admin','10.10.1990', 'admin', 'admin', 'admin', 'AGH');
INSERT INTO widz VALUES (2, 'user', 'user','20.09.1996', 'user', 'user', 'user', 'AGH');
INSERT INTO widz VALUES (3, 'Jan', 'Kowalski', '19.12.1976', 'jan', 'haslo', 'user', 'UJ');
INSERT INTO widz VALUES (4, 'Adam', 'Nowak', '03.05.1982', 'adam', 'haslo', 'user', 'UEK');
INSERT INTO widz VALUES (5, 'Zbigniew', 'Stonoga', '22.10.1962', 'zbyszek', 'haslo', 'user', 'UP');

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
INSERT INTO rezyser VALUES(1, 'Quentin', 'Tarantino');
INSERT INTO rezyser VALUES(2, 'Martin', 'Scorsese');
INSERT INTO rezyser VALUES(3, 'Alejandro', 'Inarritu');
INSERT INTO rezyser VALUES(4, 'Michal', 'Stefaniuk');
INSERT INTO rezyser VALUES(5, 'Christopher', 'Nolan');
INSERT INTO rezyser VALUES(6, 'Francis Ford', 'Copolla');
INSERT INTO rezyser VALUES(7, 'Andrzej', 'Wajda');

--rezyserzy filmow, powiazanie
INSERT INTO rezyser_filmu VALUES(1, 1);
INSERT INTO rezyser_filmu VALUES(2, 2);
INSERT INTO rezyser_filmu VALUES(3, 3);
INSERT INTO rezyser_filmu VALUES(4, 4);
INSERT INTO rezyser_filmu VALUES(5, 5);
INSERT INTO rezyser_filmu VALUES(6, 6);
INSERT INTO rezyser_filmu VALUES(7, 7);
INSERT INTO rezyser_filmu VALUES(1, 8);

--egzemplarze
INSERT INTO egzemplarz VALUES(1, 1, true);
INSERT INTO egzemplarz VALUES(2, 2,true);
INSERT INTO egzemplarz VALUES(3, 3, true);
INSERT INTO egzemplarz VALUES(4, 4, true);
INSERT INTO egzemplarz VALUES(5, 4, true);
INSERT INTO egzemplarz VALUES(6, 4, true);
INSERT INTO egzemplarz VALUES(7, 5, true);
INSERT INTO egzemplarz VALUES(8, 5, true);
INSERT INTO egzemplarz VALUES(9, 6, true);
INSERT INTO egzemplarz VALUES(10, 7, true);
INSERT INTO egzemplarz VALUES(11, 7, true);
INSERT INTO egzemplarz VALUES(12, 8, true);

--zamowienia na filmy
INSERT INTO zamowienie VALUES(1, '28.07.2020', false, 2, 3);
INSERT INTO zamowienie VALUES(2, '28.07.2020', false, 3, 1);
INSERT INTO zamowienie VALUES(3, '28.07.2020', false, 2, 5);
INSERT INTO zamowienie VALUES(4, '28.01.2020', false, 5, 4);
INSERT INTO zamowienie VALUES(5, '28.07.2020', false, 4, 7);
update egzemplarz set czy_wypozyczony=true;
INSERT INTO zamowienie VALUES(6, '28.07.2020', true, 3, 3);

--wypozyczenia
INSERT INTO wypozyczono VALUES(1, '01.01.2020', NULL, 2, 4);
INSERT INTO wypozyczono VALUES(2, '01.01.2020', NULL, 3, 5);
INSERT INTO wypozyczono VALUES(3, '01.01.2020', NULL, 4, 7);
INSERT INTO wypozyczono VALUES(4, '01.01.2020', NULL, 5, 8);
INSERT INTO wypozyczono VALUES(5, '01.01.2020', NULL, 2, 1);
INSERT INTO wypozyczono VALUES(6, '01.01.2020', NULL, 3, 2);
UPDATE wypozyczono SET data_end=CURRENT_DATE;
INSERT INTO wypozyczono VALUES(7, '01.01.2020', NULL, 2, 5);
INSERT INTO wypozyczono VALUES(8, '01.01.2020', NULL, 3, 4);
INSERT INTO wypozyczono VALUES(9, '01.01.2020', NULL, 4, 8);
INSERT INTO wypozyczono VALUES(10, '01.01.2020', NULL, 5, 7);
INSERT INTO wypozyczono VALUES(11, '01.01.2020', NULL, 2, 2);
INSERT INTO wypozyczono VALUES(12, '01.01.2020', NULL, 3, 1);
UPDATE wypozyczono SET data_end=CURRENT_DATE;
INSERT INTO wypozyczono VALUES(13, '01.01.2020', NULL, 5, 5);

--widzowie filmow, powiazania
INSERT INTO widz_filmu VALUES(1, 2, 4);
INSERT INTO widz_filmu VALUES(2, 2, 5);
INSERT INTO widz_filmu VALUES(3, 2, 1);
INSERT INTO widz_filmu VALUES(4, 2, 2);
INSERT INTO widz_filmu VALUES(5, 3, 5);
INSERT INTO widz_filmu VALUES(6, 3, 4);
INSERT INTO widz_filmu VALUES(7, 3, 2);
INSERT INTO widz_filmu VALUES(8, 3, 1);
INSERT INTO widz_filmu VALUES(9, 4, 7);
INSERT INTO widz_filmu VALUES(10, 4, 8);
INSERT INTO widz_filmu VALUES(11, 5, 8);
INSERT INTO widz_filmu VALUES(12, 5, 7);

