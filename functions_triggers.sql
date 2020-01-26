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

--triggery


-- a) funkcja i jej trigger weryfikujacy dostepnosc egzemplarza do rezerwacji
CREATE OR REPLACE FUNCTION make_reservation() RETURNS TRIGGER AS $$
	DECLARE
		reservation_id integer;
		specimen_id integer;
		reservation boolean;
		
	BEGIN
	specimen_id := new.egzemplarz_id;
	SELECT czy_wypozyczony INTO reservation FROM egzemplarz WHERE egzemplarz_id=specimen_id;
	
	IF reservation = true
		THEN UPDATE egzemplarz SET czy_wypozyczony=false WHERE egzemplarz_id=specimen_id;
		RAISE INFO 'Reservation has been made';
		RETURN new;
	ELSE RAISE INFO 'Specimen is not available';
		RETURN NULL;
	END IF;
	END;

$$LANGUAGE 'plpgsql';

CREATE TRIGGER reservation_trigger BEFORE INSERT ON zamowienie FOR EACH ROW EXECUTE PROCEDURE make_reservation();


-- b) funkcja i jej trigger weryfikujacy dostepnosc egzemplarza do wypozyczenia
CREATE OR REPLACE FUNCTION make_rent() RETURNS TRIGGER AS $$
	DECLARE
		flag_ifAvailable boolean;
		count_var integer;
	BEGIN
	SELECT czy_wypozyczony INTO flag_ifAvailable FROM egzemplarz WHERE egzemplarz_id=new.egzemplarz_id;
	
	IF flag_ifAvailable = true
		THEN UPDATE egzemplarz SET czy_wypozyczony=false WHERE egzemplarz_id=new.egzemplarz_id;
		RAISE INFO 'Rent made';
		RETURN new;
	ELSE
		SELECT COUNT(*) INTO count_var FROM zamowienie WHERE egzemplarz_id=new.egzemplarz_id AND widz_id=new.widz_id AND termin=true;
		IF count_var!=0
			THEN UPDATE zamowienie SET termin=false WHERE egzemplarz_id=new.egzemplarz_id AND widz_id=new.widz_id;
			RAISE INFO 'Rent made';
			RETURN new;
		ELSE
		RAISE INFO 'Specimen not available';
		RETURN NULL;
		END IF;
	END IF;
	END;

$$LANGUAGE 'plpgsql';

CREATE TRIGGER rent_trigger BEFORE INSERT ON wypozyczono FOR EACH ROW EXECUTE PROCEDURE make_rent();

-- c) funkcja i jej trigger sluzacy do weryfikacji oddawania filmu
CREATE OR REPLACE FUNCTION give_back() RETURNS TRIGGER AS $$
	BEGIN
	
	IF new.data_end IS NOT NULL
		THEN UPDATE egzemplarz SET czy_wypozyczony=true WHERE egzemplarz_id=old.egzemplarz_id;
		RAISE INFO 'Specimen gave back';
	END IF;
		RETURN new;
	END;

$$LANGUAGE 'plpgsql';

CREATE TRIGGER giveback_trigger BEFORE UPDATE ON wypozyczono FOR EACH ROW EXECUTE PROCEDURE give_back();