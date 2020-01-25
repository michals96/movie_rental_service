<?php
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);
include 'queries.php';
?>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Abel' rel='stylesheet'>
    <title>Wypozyczalnia filmow</title>
    <style type="text/css">
        html {
            background: url(bck.jpg) no-repeat center center fixed;
            background-size: cover;
            height: 100%;
            overflow: hidden;
        }

        .footer {
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
            text-align: center;
        }

        body {
            font-family: 'Abel';
            font-size: 22px;
        }

        #container {
            position: absolute;
            top: 120px;
            left: 100px;
            width: 100%;
            height: auto;
        }

        img {
            position: fixed;
            margin-left: 45%;
            margin-top: 1%;
            height: auto;
            width: 700px;
        }

        .button {
            background-color: #4CAF50;
            /* Green */
            border: none;
            color: white;
            padding: 16px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            -webkit-transition-duration: 0.4s;
            /* Safari */
            transition-duration: 0.4s;
            cursor: pointer;
        }

        .button1 {
            background-color: white;
            color: black;
            border: 2px solid #4CAF50;
        }

        .button1:hover {
            background-color: #4CAF50;
            color: white;
        }

        .button2 {
            background-color: white;
            color: black;
            border: 2px solid #008CBA;
        }

        .button2:hover {
            background-color: #008CBA;
            color: white;
        }

        a {
            text-decoration: none;
            color: white;
        }
    </style>
</head>

<body>
    <script src='script.js'> </script>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <ul class="navbar-nav">

            <li class="nav-item active">
                <?php
                if (isset($_SESSION['logged']) && $_SESSION['logged'] == true) {
                    echo "<a class='nav-link' href='#'>" . $_SESSION['imie'] . "</a>";
                } else {
                    echo "<a class='nav-link' href='#'> Guest </a>";
                }
                ?>

            </li>
            <li class="nav-item">
                <a class="nav-link" href="index.php">Main page</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="documentation.php">Documentation</a>
            </li>
            <?php
            if (isset($_SESSION['logged']) && $_SESSION['logged'] == true) {
                echo "<a class='nav-link' href='logout.php'>Logout</a>";
            }
            ?>

        </ul>
    </nav>
    <div id='container'>

        <?php
        if (isset($_SESSION['logged']) && $_SESSION['logged'] == true) {
            // funkcjonalnosci admina
            if ($_SESSION['imie'] == 'admin') {
                echo
                    "<a href='index.php'> MENU </a><br/>

                            <a href='index.php?action=movies'> List movies </a>
                            <a href='index.php?action=add_movie'> Add movie </a><br/>

                            <a href='index.php?action=show_directors'> List directors </a>
                            <a href='index.php?action=add_director'> Add director </a><br/>

                            <a href='index.php?action=attatch_director'> Add director to movie </a><br/>
                            <a href='index.php?action=add_studio'> Add movie studio </a><br/>
                            <a href='index.php?action=add_type'> Add movie type </a><br/>

                            <a href='index.php?action=show_specimen'> List specimen </a>
                            <a href='index.php?action=add_specimen'> Add specimen </a><br/>

		                    <a href='index.php?action=show_users'> List users </a> 
                            <a href='index.php?action=add_user'> Add user </a><br/>

                            <a href='index.php?action=manage_bookings'> Manage bookings </a><br/>
                            <a href='index.php?action=manage_rents'> Manage rents </a><br/>
                            ";
                $action = 'index';
                if (isset($_GET['action'])) {
                        $action = $_GET['action'];
                    }
                $akcja = new queries;
                switch ($action): case 'movies':
                        $akcja->movies();
                        break;
                    case 'add_movie':
                        $akcja->add_movie();
                        break;
                    case 'show_directors':
                        $akcja->show_directors();
                        break;
                    case 'add_director':
                        $akcja->add_director();
                        break;
                    case 'attatch_director':
                        $akcja->attatch_director();
                        break;
                    case 'add_studio':
                        $akcja->add_studio();
                        break;
                    case 'add_type':
                        $akcja->add_type();
                        break;
                    case 'add_specimen':
                        $akcja->add_specimen();
                        break;
                    case 'show_users':
                        $akcja->show_users();
                        break;
                    case 'add_user':
                        $akcja->add_user();
                        break;
                    case 'show_specimen':
                        $akcja->show_specimen();
                        break;
                    case 'manage_bookings':
                        $akcja->manage_bookings();
                        break;
                    case 'manage_rents':
                        $akcja->manage_rents();
                        break;
                endswitch;
            } else {
                    echo "<nav>
                <a href='index.php'> MENU </a><br/>
                <a href='index.php?action=show_specimen'> List specimen </a><br/>
                <a href='index.php?action=my_bookings'> Moje rezerwacje </a><br/>
                <a href='index.php?action=my_rents'> Moje wypozyczenia </a><br/>
                </nav>";
                    $action = 'index';
                    if (isset($_GET['action'])) {
                            $action = $_GET['action'];
                        }
                    $akcja = new queries;
                    switch ($action): 
                        case 'show_specimen':
                            $akcja->show_specimen();
                            break;
                        case 'my_bookings':
                            $akcja->my_bookings();
                            break;
                        case 'my_rents':
                            $akcja->my_rents();
                            break;
                    endswitch;
                }
        } else {
            echo "<h1> Witaj w wypozyczalni filmow</h1>
                <h2> Zaloguj sie aby rozpoczac </h2>
                <h3> Credentials: </h3>
                <h4> ROOT: admin:admin</h4>
                <h4> USER: michal:haslo </h4>";
            echo "<form action='login.php' method='post'>
                Login: <input type='text' name='login'><br/>
                Password: <input type='password' name='haslo'><br/>
                <input type='submit' value='Zaloguj'>
                </form>";
            if (isset($_SESSION['error']))
                echo $_SESSION['error'];
        }
        ?>
    </div>
    <img src="logo.png">
    <div class="footer">
        <p>Bazy danych 2019/2020 Michal Stefaniuk</p>
    </div>
</body>

</html>