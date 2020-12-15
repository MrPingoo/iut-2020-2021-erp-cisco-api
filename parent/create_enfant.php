<?php
// Connexion à la BDD
include_once '../database.php';

// Faire une requête
$query = "INSERT INTO
                parent
            SET
				firstname=:firstname, 
				lastname=:lastname,
				email=:email,
				password=:password";

// INSERT INTO product SET name = "Blabla"

$stmt = $conn->prepare($query);

$data = json_decode(file_get_contents("php://input"));

$firstname = $data->firstname;
$lastname = $data->lastname;
$email = $data->email;
$password = md5($data->password);

$stmt->bindParam(":firstname", $firstname);
$stmt->bindParam(":lastname", $lastname);
$stmt->bindParam(":email", $email);
$stmt->bindParam(":password", $password);

if($stmt->execute()){
    echo 'ok';
} else {
    var_dump($stmt->errorInfo());
}

$lastInsertId = $conn->lastInsertId();

$query = "INSERT INTO
                enfant
            SET
				firstname=:firstname, 
				lastname=:lastname,
				parent_id=:parentid";

$stmt = $conn->prepare($query);

foreach ($data->enfants as $enfant) {
    $firstname = $enfant->firstname;
    $lastname = $enfant->lastname;

    $stmt->bindParam(":firstname", $firstname);
    $stmt->bindParam(":lastname", $lastname);
    $stmt->bindParam(":parentid", $lastInsertId);

    if($stmt->execute()){
        echo 'ok';
    } else {
        var_dump($stmt->errorInfo());
    }
}