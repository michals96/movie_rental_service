<!DOCTYPE HTML>

<head>
    <style>
        table {
            border-collapse: collapse;
        }

        table,
        th,
        td {
            border: 2px solid black;
            text-align: center;
        }

        th {
            font-weight: bolded;
        }
    </style>
</head>
<?php
error_reporting(E_ALL);
ini_set('display_errors', 0);

class queries
{

    private $dbconn = null;

    function __construct()
    {
        require_once 'connect_pascal.php';
        $this->dbconn = pg_connect("host=$host user=$db_user password=$db_password dbname=$db_name")
            or die('Nie można nawiązać połączenia: ' . pg_last_error());
    }

    // Listuje zawartosci tabeli film
    function movies()
    {
        echo "<br/><form action='index.php?action=movies' method='post'><select name='sort'>
		<option value='film.tytul'>title</option>
		<option value='studio.nazwa'>studio</option>
		<option value='gatunek.nazwa'>type</option>
		</select> <input type='submit' value='sort'> </form>";
        if (!isset($_POST['sort']))
            $sort = 'film.tytul';
        else
            $sort = $_POST['sort'];
        $query = pg_query("SELECT film.tytul, studio.nazwa, gatunek.nazwa, show_directors(film.film_id) from film, studio, gatunek"
            . " WHERE film.studio_id=studio.studio_id AND film.gatunek_id=gatunek.gatunek_id ORDER BY $sort");
        echo "<table>";
        echo "<tr><th>Title</th> <th>Studio</th> <th>Type</th> <th>Director</th> </tr>";
        while ($row = pg_fetch_row($query)) {
            echo "<tr> <td>$row[0]</td> <td>$row[1]</td> <td>$row[2]</td> <td>$row[3]</td></tr>";
        }
        echo "</table>";
        pg_free_result($query);
    }

    // Dodaje wiersze do tabeli film i umozliwia powiazanie nowego filmu ze studiem i gatunkiem
    function add_movie()
    {
        $q_studio = pg_query("select studio_id, nazwa from studio");
        $q_gatunek = pg_query("select gatunek_id, nazwa from gatunek");
        $query = pg_query("select * from film");
        $count = pg_num_rows($query) + 1;
        echo "<br/><form action='index.php?action=add_movie' method='post'>
		Title: <input type='text' name='tytul'><br>
		Studio: <select name='wyd'>";
        while ($row = pg_fetch_row($q_studio)) {
            echo "<option value='$row[0]'>$row[1]</option>";
        }
        echo "</select><br>Type: ";
        echo "<select name='kat'>";
        while ($row = pg_fetch_row($q_gatunek)) {
            echo "<option value='$row[0]'>$row[1]</option>";
        }
        echo "</select><br><input type='submit' value='Add movie'> </form>";

        if (isset($_POST['tytul']) && isset($_POST['wyd']) && isset($_POST['kat'])) {
            $ins = "INSERT INTO film VALUES('$count', '$_POST[tytul]', '$_POST[wyd]', '$_POST[kat]')";
            $add = pg_query($ins);
            pg_free_result($add);
        }

        pg_free_result($q_studio);
        pg_free_result($q_gatunek);
        pg_free_result($query);
    }

    // Listuje zawartosci tabeli rezyser
    function show_directors()
    {
        echo "<br/><form action='index.php?action=show_directors' method='post'><select name='sort'>
		<option value='rezyser.imie'>Name</option>
		<option value='rezyser.nazwisko'>Surname</option>
		</select> <input type='submit' value='sort'> </form>";
        if (!isset($_POST['sort']))
            $sort = 'rezyser.nazwisko';
        else
            $sort = $_POST['sort'];
        $query = pg_query("SELECT rezyser.imie, rezyser.nazwisko from rezyser ORDER BY $sort");
        echo "<table>";
        echo "<tr><td>Imię</td> <td>Nazwisko</td>";
        while ($row = pg_fetch_row($query)) {
            echo "<tr> <td>$row[0]</td> <td>$row[1]</td></tr>";
        }
        echo "</table>";
        pg_free_result($query);
    }

    // Dodaje obiekty do tabeli rezyser
    function add_director()
    {
        $query = pg_query("select * from rezyser");
        $count = pg_num_rows($query) + 1;
        echo "<br/><form action='index.php?action=add_director' method='post'>
		 Name: <input type='text' name='imie'><br>
		 Surname: <input type='text' name='nazwisko'><br>
		<input type='submit' value='Add director'> </form>";
        if (isset($_POST['imie']) && isset($_POST['nazwisko'])) {
            $ins = "INSERT INTO rezyser VALUES('$count', '$_POST[imie]', '$_POST[nazwisko]')";
            $add = pg_query($ins);
            pg_free_result($add);
        }

        pg_free_result($query);
    }

    // Pozwala dodac rezysera do filmu
    function attatch_director()
    {
        $q_rezysera = pg_query("SELECT rezyser_id, imie, nazwisko FROM rezyser");
        $q_gatunku = pg_query("SELECT film_id, tytul FROM film");


        echo "<br/><form action='index.php?action=attatch_director' method='post'>
		 <br>
		<select name='Rezyser'>";
        while ($row = pg_fetch_row($q_rezysera)) {
                echo "<option value='$row[0]'>$row[1] $row[2]</option>";
            }
        echo "</select>";
        echo "<select name='Film'>";
        while ($row = pg_fetch_row($q_gatunku)) {
                echo "<option value='$row[0]'>$row[1]</option>";
            }
        echo "</select><input type='submit' value='Attatch'> </form>";

        if (isset($_POST['Rezyser']) && isset($_POST['Film'])) {
                $ins = "INSERT INTO rezyser_filmu VALUES('$_POST[Rezyser]', '$_POST[Film]')";
                $add = pg_query($ins);
                pg_free_result($add);
            }

        pg_free_result($q_rezysera);
        pg_free_result($q_gatunku);
    }

    // Pozwala na dodanie obiektu do tabeli studio
    function add_studio()
    {
        $query = pg_query("select * from studio");
        $count = pg_num_rows($query) + 1;
        echo "<br/><form action='index.php?action=add_studio' method='post'>
		Name: <input type='text' name='cityName'><br>
		City: <input type='text' name='name'><br>
		<input type='submit' value='Add'> </form>";

        if (isset($_POST['cityName']) && isset($_POST['name'])) {
                $ins = "INSERT INTO studio VALUES('$count', '$_POST[cityName]', '$_POST[name]')";
                $add = pg_query($ins);
                pg_free_result($add);
            }

        pg_free_result($query);
    }

    // Pozwala na dodanie obiektu do tabeli gatunek
    function add_type()
    {
        $query = pg_query("select * from gatunek");
        $count = pg_num_rows($query) + 1;
        echo "<br/><form action='index.php?action=add_type' method='post'>
		Type: <input type='text' name='type'><br>
		<input type='submit' value='Add type'> </form>";

        if (isset($_POST['type'])) {
                $ins = "INSERT INTO gatunek VALUES('$count', '$_POST[type]')";
                $add = pg_query($ins);
                pg_free_result($add);
            }

        pg_free_result($query);
    }

    // Pozwala dodawać egzemplarze
    function add_specimen()
    {
        $query = pg_query("select * from egzemplarz");
        $specimen_query = pg_query("select * from film");
        $count = pg_num_rows($query) + 1;
        echo "<br/><form action='index.php?action=add_specimen' method='post'>
		Title: 
		<select name='film_egzeplarz'>";
        while ($row = pg_fetch_row($specimen_query)) {
                echo "<option value='$row[0]'>$row[1]</option>";
            }
        echo "</select><br>
		<input type='submit' value='Add specimen'> </form>";

        if (isset($_POST['film_egzeplarz'])) {
                $ins = "INSERT INTO egzemplarz VALUES('$count', '$_POST[film_egzeplarz]', true)"; // jesli damy false to nie jest wpozyczony
                $add = pg_query($ins);
                print(pg_last_notice($this->dbconn));
                pg_free_result($add);
            }

        pg_free_result($query);
        pg_free_result($specimen_query);
    }

    // Obsluga dodawania widzow filmow / uzytkownikow serwisu
    function add_user()
    {
        $query = pg_query("select * from widz");
        $count = pg_num_rows($query) + 1;
        echo "<br/><form action='index.php?action=add_user' method='post'>

		Imie: <input type='text' name='imie'><br>
		Nazwisko: <input type='text' name='nazwisko'><br>
		Data urodzenia: <input type='text' name='urodz' value='DD.MM.RRRR'><br>
		Login: <input type='text' name='login'><br>
        Haslo: <input type='text' name='haslo'><br>
        
		Przywilej: 
		<select name='przywilej'>
		<option value='admin'>admin</option>
		<option value='czytelnik'>czytelnik</option>
        </select> <br>

        Uczelnia: <input type='text' name='adres'><br>

		<input type='submit' value='dodaj'> </form>";

        if (isset($_POST['imie']) && isset($_POST['nazwisko']) && isset($_POST['adres']) && isset($_POST['urodz']) && isset($_POST['login']) && isset($_POST['haslo']) && isset($_POST['przywilej'])) {
                $ins = "INSERT INTO widz VALUES('$count', '$_POST[imie]', '$_POST[nazwisko]', '$_POST[urodz]', '$_POST[login]', '$_POST[haslo]', '$_POST[przywilej]', '$_POST[adres]')";
                $add = pg_query($ins);
                pg_free_result($add);
            }

        pg_free_result($query);
    }
}
?>