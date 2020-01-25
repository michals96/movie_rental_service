<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

class Register
{
	function login()
	{
		require_once "connect_pascal.php";
		$dbconn = pg_connect("host=$host user=$db_user password=$db_password dbname=$db_name")
		or die('Cannot connect: ' . pg_last_error());
		$login = $_POST['login'];
		$haslo = $_POST['haslo'];
		if($query = pg_query("SELECT * from widz WHERE login='$login' AND haslo='$haslo'"))
		{
			if(pg_num_rows($query) > 0)
			{
				$row = pg_fetch_assoc($query);
				$_SESSION['id'] = $row['widz_id'];
				$_SESSION['login'] = $row['login'];
				$_SESSION['imie'] = $row['imie'];
				$_SESSION['dostep'] = $row['dostep'];
				$_SESSION['logged'] = true;
				header('Location: index.php');
			}
			else 
			{
				$_SESSION['error'] = "User dont exist.";
				header('Location: index.php');
			}
		}
		else 
			{
				$_SESSION['error'] = "User dont exist.";
				header('Location: index.php');
			}
	}
}


?>