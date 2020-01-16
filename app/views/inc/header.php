<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="../../public/css/style.css">     
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>   
    </head>
    <body>
        <div class="container">
        
        <?php

        if (isset($_SESSION['user_data']))
        {
            $menu = new eeMenu();
            $menu->getMenu();

            /*echo '<ul>';

            echo '<li> <a href="href="/logout"> Odjavi se </a> </li>';*/

            for ($i=0; $i<count($menu->menu_title); $i++) {
                echo '<li> <a href="' . $menu->menu_url[$i] . '"> ' . $menu->menu_title[$i] . ' </a> </li>';
            }
            echo '</ul>';
        }
        /*else
        {
            echo '
            <ul>
                <li> <a href="/login"> Uloguj se </a> </li>
            </ul>
            ';
        }*/

        ?>