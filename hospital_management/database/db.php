<?php
//error_reporting(E_ERROR | E_PARSE);
$servername = "127.0.0.1";
$username = "alaa";
$password = "alaa";
$database = "hospital_management";
// Create connection
($db_connection = mysqli_connect($servername, $username, $password , $database) )|| die("Connection failed: " . mysqli_connect_error());

