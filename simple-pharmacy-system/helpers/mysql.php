<?php 

    $con = new mysqli('localhost','root','root','pharmacy');
//for user informationa making available for all pages
    if ($con->connect_error) {
        die("Connection failed: " . $con->connect_error);
    }
    // $array = $con->query("select * from users where id ='$_SESSION[userId]'");
    // $user = $array->fetch_assoc();

?>