--wyswietl rezyserow, korzystam z tej funkcji przy listowaniu filmow w kolumnie 'Rezyser'
CREATE OR REPLACE FUNCTION show_directors(integer) RETURNS VARCHAR AS $$
	DECLARE 
		directors VARCHAR;
	BEGIN
		SELECT array_to_string(array(select rezyser.imie || ' ' || rezyser.nazwisko from rezyser, rezyser_filmu WHERE film_id=$1 AND rezyser.rezyser_id=rezyser_filmu.rezyser_id), ', ') INTO directors;
		RETURN directors;
	END;

$$LANGUAGE 'plpgsql';

--widok pozwala na listowanie egzemplarzy
create view list_specimen
as select film.tytul, show_directors(film.film_id), studio.nazwa 
AS studioName, studio.nazwa AS typeName, egzemplarz.czy_wypozyczony, egzemplarz.egzemplarz_id 
from egzemplarz, film, studio, gatunek 
WHERE film.film_id=egzemplarz.film_id AND film.studio_id=studio.studio_id AND film.gatunek_id=gatunek.gatunek_id;


--widok odpowiedzialny za listowanie rezerwacji
create view list_reservations 
as select z.zamowienie_id, z.data_zwrotu, z.termin, w.widz_id, w.imie, w.nazwisko, e.egzemplarz_id, f.tytul 
FROM zamowienie as z, 
widz as w, 
egzemplarz as e, 
film as f 
WHERE z.widz_id=w.widz_id AND z.egzemplarz_id=e.egzemplarz_id AND e.film_id=f.film_id;

--widdok odpowiedzialny za listowawnie wypozyczen
create view list_rents 
as select wyp.wypozyczono_id, wyp.data_start, wyp.data_end, w.widz_id, w.imie, w.nazwisko, e.egzemplarz_id, f.tytul 
FROM 
wypozyczono as wyp, 
widz as w, 
egzemplarz as e, 
film as f 
WHERE wyp.widz_id=w.widz_id AND wyp.egzemplarz_id=e.egzemplarz_id AND e.film_id=f.film_id;