
CREATE TABLE public.widz (
                widz_id INTEGER NOT NULL,
                imie VARCHAR NOT NULL,
                nazwisko VARCHAR NOT NULL,
                data_urodzenia DATE NOT NULL,
                login VARCHAR NOT NULL,
                haslo VARCHAR NOT NULL,
                dostep VARCHAR NOT NULL,
                uczelnia VARCHAR NOT NULL,
                CONSTRAINT widz_id PRIMARY KEY (widz_id)
);

--The CREATE UNIQUE INDEX command creates a unique index on a table (no duplicate values allowed)
CREATE UNIQUE INDEX widz_idx
 ON public.widz
 ( login );

CREATE TABLE public.gatunek (
                gatunek_id INTEGER NOT NULL,
                nazwa VARCHAR NOT NULL,
                CONSTRAINT kat_id PRIMARY KEY (gatunek_id)
);


CREATE TABLE public.studio (
                studio_id INTEGER NOT NULL,
                nazwa VARCHAR NOT NULL,
                lokalizacja VARCHAR NOT NULL,
                CONSTRAINT studio_id PRIMARY KEY (studio_id)
);


CREATE TABLE public.film (
                film_id INTEGER NOT NULL,
                tytul VARCHAR NOT NULL,
                studio_id INTEGER NOT NULL,
                gatunek_id INTEGER NOT NULL,
                CONSTRAINT film_id PRIMARY KEY (film_id)
);


CREATE TABLE public.widz_filmu (
                widz_filmu_id INTEGER NOT NULL,
                widz_id INTEGER NOT NULL,
                film_id INTEGER NOT NULL,
                CONSTRAINT widz_filmu_id PRIMARY KEY (widz_filmu_id)
);


CREATE TABLE public.egzemplarz (
                egzemplarz_id INTEGER NOT NULL,
                film_id INTEGER NOT NULL,
                czy_wypozyczony BOOLEAN NOT NULL,
                CONSTRAINT egzemplarz_id PRIMARY KEY (egzemplarz_id)
);


CREATE TABLE public.zamowienie (
                zamowienie_id INTEGER NOT NULL,
                data_zwrotu DATE NOT NULL,
                termin BOOLEAN NOT NULL,
                widz_id INTEGER NOT NULL,
                egzemplarz_id INTEGER NOT NULL,
                CONSTRAINT zamowienie_id PRIMARY KEY (zamowienie_id)
);


CREATE TABLE public.wypozyczono (
                wypozyczono_id INTEGER NOT NULL,
                data_start DATE NOT NULL,
                data_end DATE,
                widz_id INTEGER NOT NULL,
                egzemplarz_id INTEGER NOT NULL,
                CONSTRAINT wypozyczono_id PRIMARY KEY (wypozyczono_id)
);


CREATE TABLE public.rezyser (
                rezyser_id INTEGER NOT NULL,
                imie VARCHAR NOT NULL,
                nazwisko VARCHAR NOT NULL,
                CONSTRAINT rezyser_id PRIMARY KEY (rezyser_id)
);


CREATE TABLE public.rezyser_filmu (
                rezyser_id INTEGER NOT NULL,
                film_id INTEGER NOT NULL,
                CONSTRAINT public_key PRIMARY KEY (rezyser_id, film_id)
);


ALTER TABLE public.wypozyczenie ADD CONSTRAINT widz_wypozyczenie_fk
FOREIGN KEY (widz_id)
REFERENCES public.widz (widz_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.zamowienie ADD CONSTRAINT widz_zamowienie_fk
FOREIGN KEY (widz_id)
REFERENCES public.widz (widz_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.widz_filmu ADD CONSTRAINT widz_filmu_fk
FOREIGN KEY (widz_id)
REFERENCES public.widz (widz_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.film ADD CONSTRAINT gatunek_film_fk
FOREIGN KEY (gatunek_id)
REFERENCES public.gatunek (gatunek_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.film ADD CONSTRAINT studio_film_fk
FOREIGN KEY (wydawnictwwo_id)
REFERENCES public.studio (studio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.rezyser_filmu ADD CONSTRAINT film_rezyser_filmu_fk
FOREIGN KEY (film_id)
REFERENCES public.film (film_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.egzemplarz ADD CONSTRAINT film_egzemplarz_fk
FOREIGN KEY (film_id)
REFERENCES public.film (film_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.widz_filmu ADD CONSTRAINT film_widz_filmu_fk
FOREIGN KEY (film_id)
REFERENCES public.film (film_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.wypozyczono ADD CONSTRAINT egzemplarz_wypozyczono_fk
FOREIGN KEY (egzemplarz_id)
REFERENCES public.egzemplarz (egzemplarz_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.zamowienie ADD CONSTRAINT egzemplarz_zamowienie_fk
FOREIGN KEY (egzemplarz_id)
REFERENCES public.egzemplarz (egzemplarz_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.rezyser_filmu ADD CONSTRAINT rezyser_rezyser_filmu_fk
FOREIGN KEY (rezyser_id)
REFERENCES public.rezyser (rezyser_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
