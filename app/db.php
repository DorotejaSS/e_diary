<?php

$conn = new mysqli('localhost', 'root', '', 'e_diary');

if ($conn->connect_error) {
    echo'failed';
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";