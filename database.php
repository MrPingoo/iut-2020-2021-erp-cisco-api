<?php

try {
    $host = "localhost:8889";
    $db_name = "api-erp-cisco-v2";
    $username = "root";
    $password = "root";
    $conn = new PDO("mysql:host=" . $host . ";dbname=" . $db_name, $username, $password);
    $conn->exec("set names utf8");
} catch (PDOException $e) {
    echo $e;
    die();
}
