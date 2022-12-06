<?php
try {
    $connection = new PDO("mysql:host=localhost;dbname=college", "root", "");
} catch (Exception $e) {
    echo $e->getMessage();
    exit();
}
