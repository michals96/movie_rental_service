<!DOCTYPE HTML>
<head>
<style>

table {
	border-collapse: collapse;
}
table, th, td {
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
	
	function movies()
	{
		echo "<br/><form action='index.php?action=movies' method='post'><select name='sort'>
		<option value='film.tytul'>Tytuł</option>
		<option value='studio.nazwa'>studio</option>
		<option value='gatunek.nazwa'>gatunek</option>
		</select> <input type='submit' value='sortuj'> </form>";
	if(!isset($_POST['sort']))
		$sort = 'film.tytul';
	else
		$sort = $_POST['sort'];
		$query = pg_query("SELECT film.tytul, studio.nazwa, gatunek.nazwa, show_directors(film.film_id) from film, studio, gatunek"
		." WHERE film.studio_id=studio.studio_id AND film.gatunek_id=gatunek.gatunek_id ORDER BY $sort");
		echo "<table>";
		echo "<tr><th>Tytuł</th> <th>studio</th> <th>gatunek</th> <th>Rezyser</th> </tr>";
		while ($row = pg_fetch_row($query))
		{
			echo "<tr> <td>$row[0]</td> <td>$row[1]</td> <td>$row[2]</td> <td>$row[3]</td></tr>";
		}
		echo "</table>";
		pg_free_result($query);
	}
	
    function add_movie()
	{
		$query_wyd = pg_query("select studio_id, nazwa from studio");
		$query_kat = pg_query("select gatunek_id, nazwa from gatunek");
		$query = pg_query("select * from film");
		$ile = pg_num_rows($query) + 1;
		echo "<br/><form action='index.php?action=add_movie' method='post'>
		Tytuł: <input type='text' name='tytul'><br>
		Studio: <select name='wyd'>";
		while($row = pg_fetch_row($query_wyd))
		{
			echo "<option value='$row[0]'>$row[1]</option>";
		}
		echo "</select><br>Gatunek: ";
		echo "<select name='kat'>";
		while($row = pg_fetch_row($query_kat))
		{
			echo "<option value='$row[0]'>$row[1]</option>";
		}
		echo "</select><br><input type='submit' value='dodaj'> </form>";
		
		if(isset($_POST['tytul']) && isset($_POST['wyd']) && isset($_POST['kat']))
		{
			$ins = "INSERT INTO film VALUES('$ile', '$_POST[tytul]', '$_POST[wyd]', '$_POST[kat]')";
			$dodaj = pg_query($ins);
			pg_free_result($dodaj);
		}
		
		pg_free_result($query_wyd);
		pg_free_result($query_kat);
		pg_free_result($query);
	}

}
?>