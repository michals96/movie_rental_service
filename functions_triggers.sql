--wyswietl rezyserow, korzystam z tej funkcji przy listowaniu filmow w kolumnie 'Rezyser'
CREATE OR REPLACE FUNCTION show_directors(integer) RETURNS VARCHAR AS $$
	DECLARE 
		directors VARCHAR;
	BEGIN
		SELECT array_to_string(array(select rezyser.imie || ' ' || rezyser.nazwisko from rezyser, rezyser_filmu WHERE film_id=$1 AND rezyser.rezyser_id=rezyser_filmu.rezyser_id), ', ') INTO directors;
		RETURN directors;
	END;

$$LANGUAGE 'plpgsql';