<?php

require('config/config.php');

$conn = new mysqli($server_name, $user, $password, $db_name);

if ($conn->connect_error) {
    echo'failed';
    die("Connection failed: " . $conn->connect_error);
}
// echo "Connected successfully";