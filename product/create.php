<?php
// Connexion à la BDD
include_once '../database.php';

// Faire une requête
$query = "INSERT INTO
                product
            SET
				name=:name, date=:date";

// INSERT INTO product SET name = "Blabla"

$stmt = $conn->prepare($query);

$data = json_decode(file_get_contents("php://input"));

$name = $data->name;
$date = date('Y-m-d');

$stmt->bindParam(":name", $name);
$stmt->bindParam(":date", $date);

if($stmt->execute()){
    echo 'ok';
} else {
    var_dump($stmt->errorInfo());
}