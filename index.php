<?php

require('./app/bootstrap.php');

if (session_id() === '') {
    session_start();
}

// instance class Router 
$router = new Router();
