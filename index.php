<?php

require('./app/bootstrap.php');

if (session_id() === '') {
    session_start();
}

$router = new Router();
