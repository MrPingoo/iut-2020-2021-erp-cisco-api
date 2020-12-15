<?php
// Connexion à la BDD
include_once '../database.php';

// Faire une requête
$query = "INSERT INTO
                salle
            SET
				name=:name, 
				address=:address,
				zipcode=:zipcode,
				city=:city";

// INSERT INTO product SET name = "Blabla"

$stmt = $conn->prepare($query);

$data = json_decode(file_get_contents("php://input"));

$name = $data->name;
$address = $data->address;
$zipcode = $data->zipcode;
$city = $data->city;

$stmt->bindParam(":name", $name);
$stmt->bindParam(":address", $address);
$stmt->bindParam(":zipcode", $zipcode);
$stmt->bindParam(":city", $city);

if($stmt->execute()){
    echo 'ok';
} else {
    var_dump($stmt->errorInfo());
}