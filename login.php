<?php
		include 'register.php';
		
		$user = new Register;
		session_start();
	
		if ((!isset($_POST['login'])) || (!isset($_POST['haslo'])))
		{
			header('Location: index.php');
			exit();
		}
		
		$user->login();

?>