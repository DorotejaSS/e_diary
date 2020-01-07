<?php

require('config/config.php');

$conn = new mysqli($server_name, $user, $password, $db_name);

if ($conn->connect_error) {
    echo'failed';
    die("Connection failed: " . $conn->connect_error);
}
// echo "Connected successfully";


try {
    $connn = new PDO("mysql:host=$server_name;dbname=$db_name", $user, $password);
    // set the PDO error mode to exception
    $connn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully";
    }
catch(PDOException $e)
    {
    echo "Connection failed: " . $e->getMessage();
    }