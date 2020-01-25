
CREATE TABLE public.czytelnik (
                czytelnik_id INTEGER NOT NULL,
                imie VARCHAR NOT NULL,
                nazwisko VARCHAR NOT NULL,
                data_urodzenia DATE NOT NULL,
                login VARCHAR NOT NULL,
                haslo VARCHAR NOT NULL,
                dostep VARCHAR NOT NULL,
                uczelnia VARCHAR NOT NULL,
                CONSTRAINT czytelnik_id PRIMARY KEY (czytelnik_id)
);

--The CREATE UNIQUE INDEX command creates a unique index on a table (no duplicate values allowed)
CREATE UNIQUE INDEX czytelnik_idx
 ON public.czytelnik
 ( login );

CREATE TABLE public.kategoria (
                kategoria_id INTEGER NOT NULL,
                nazwa VARCHAR NOT NULL,
                CONSTRAINT kat_id PRIMARY KEY (kategoria_id)
);


CREATE TABLE public.wydawnictwo (
                wydawnictwo_id INTEGER NOT NULL,
                nazwa VARCHAR NOT NULL,
                lokalizacja VARCHAR NOT NULL,
                CONSTRAINT wydawnictwo_id PRIMARY KEY (wydawnictwo_id)
);


CREATE TABLE public.ksiazka (
                ksiazka_id INTEGER NOT NULL,
                tytul VARCHAR NOT NULL,
                wydawnictwo_id INTEGER NOT NULL,
                kategoria_id INTEGER NOT NULL,
                CONSTRAINT ksiazka_id PRIMARY KEY (ksiazka_id)
);


CREATE TABLE public.czytelnik_ksiazki (
                czytelnik_ksiazki_id INTEGER NOT NULL,
                czytelnik_id INTEGER NOT NULL,
                ksiazka_id INTEGER NOT NULL,
                CONSTRAINT czytelnik_ksiazki_id PRIMARY KEY (czytelnik_ksiazki_id)
);


CREATE TABLE public.egzemplarz (
                egzemplarz_id INTEGER NOT NULL,
                ksiazka_id INTEGER NOT NULL,
                czy_wypozyczony BOOLEAN NOT NULL,
                CONSTRAINT egzemplarz_id PRIMARY KEY (egzemplarz_id)
);


CREATE TABLE public.zamowienie (
                zamowienie_id INTEGER NOT NULL,
                data_zwrotu DATE NOT NULL,
                termin BOOLEAN NOT NULL,
                czytelnik_id INTEGER NOT NULL,
                egzemplarz_id INTEGER NOT NULL,
                CONSTRAINT zamowienie_id PRIMARY KEY (zamowienie_id)
);


CREATE TABLE public.wypozyczono (
                wypozyczono_id INTEGER NOT NULL,
                data_start DATE NOT NULL,
                data_end DATE,
                czytelnik_id INTEGER NOT NULL,
                egzemplarz_id INTEGER NOT NULL,
                CONSTRAINT wypozyczono_id PRIMARY KEY (wypozyczono_id)
);


CREATE TABLE public.autor (
                autor_id INTEGER NOT NULL,
                imie VARCHAR NOT NULL,
                nazwisko VARCHAR NOT NULL,
                CONSTRAINT autor_id PRIMARY KEY (autor_id)
);


CREATE TABLE public.autor_ksiazki (
                autor_id INTEGER NOT NULL,
                ksiazka_id INTEGER NOT NULL,
                CONSTRAINT public_key PRIMARY KEY (autor_id, ksiazka_id)
);


ALTER TABLE public.wypozyczenie ADD CONSTRAINT czytelnik_wypozyczenie_fk
FOREIGN KEY (czytelnik_id)
REFERENCES public.czytelnik (czytelnik_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.zamowienie ADD CONSTRAINT czytelnik_zamowienie_fk
FOREIGN KEY (czytelnik_id)
REFERENCES public.czytelnik (czytelnik_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.czytelnik_ksiazki ADD CONSTRAINT czytelnik_ksiazki_fk
FOREIGN KEY (czytelnik_id)
REFERENCES public.czytelnik (czytelnik_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ksiazka ADD CONSTRAINT kategoria_ksiazka_fk
FOREIGN KEY (kategoria_id)
REFERENCES public.Kategoria (kategoria_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ksiazka ADD CONSTRAINT wydawnictwo_ksiazka_fk
FOREIGN KEY (wydawnictwwo_id)
REFERENCES public.wydawnictwo (wydawnictwo_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.autor_ksiazki ADD CONSTRAINT ksiazka_autor_ksiazki_fk
FOREIGN KEY (ksiazka_id)
REFERENCES public.ksiazka (ksiazka_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.egzemplarz ADD CONSTRAINT ksiazka_egzemplarz_fk
FOREIGN KEY (ksiazka_id)
REFERENCES public.ksiazka (ksiazka_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.czytelnik_ksiazki ADD CONSTRAINT ksiazka_czytelnik_ksiazki_fk
FOREIGN KEY (ksiazka_id)
REFERENCES public.ksiazka (ksiazka_id)
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

ALTER TABLE public.autor_ksiazki ADD CONSTRAINT autor_autor_ksiazki_fk
FOREIGN KEY (autor_id)
REFERENCES public.autor (autor_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
