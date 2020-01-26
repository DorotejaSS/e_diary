<?php

require('config/config.php');

try {
    $conn = new PDO("mysql:host=$server_name;dbname=$db_name", $user, $password);
    // set the PDO error mode to exception
    /***
     * procitajte o PDO::ATTR_EMULATE_PREPARES koji je bitan za security ovde:
     * https://stackoverflow.com/questions/134099/are-pdo-prepared-statements-sufficient-to-prevent-sql-injection
     */
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // echo "Connected successfully";
    }
catch(PDOException $e)
    {
    echo "Connection failed: " . $e->getMessage();
    }