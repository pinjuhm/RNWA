<?php

$hostname = "127.0.0.1";
$username = "root";
$password = "";
$dbname = "hospital";

$conn = new mysqli($hostname, $username, $password, $dbname);
if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
}

?>