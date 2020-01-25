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