<?php
// Connexion à la BDD
include_once '../database.php';

// Faire une requête
$query = "INSERT INTO
                creneau
            SET
				begin=:begin, 
				end=:end,
				nb=:nb,
				salle_id=:salle_id";

// INSERT INTO product SET name = "Blabla"

$stmt = $conn->prepare($query);

$data = json_decode(file_get_contents("php://input"));

$begin = $data->begin;
$end = $data->end;
$nb = $data->nb;


$query = "SELECT id FROM salle WHERE `name` = '" . $data->salle ."'";

$result = $conn->query($query);
$salle = $result->fetch();

if (empty($salle)) {
    var_dump('ERROR sur le nom de la salle');
    die();
}

$stmt->bindParam(":begin", $begin);
$stmt->bindParam(":end", $end);
$stmt->bindParam(":nb", $nb);
$stmt->bindParam(":salle_id", $salle['id']);

$cID = null;

if($stmt->execute()){
    $cID = $conn->lastInsertId();
}

$matieres = $data->matieres;

foreach ($matieres as $matiere) {
    $mID = null;

    $query = "SELECT id FROM matiere WHERE `name` = '" . $matiere->matiere ."'";

    $result = $conn->query($query);
    $m = $result->fetch();

    if ($m != false) {
        $mID = $m['id'];
    } else {
        $query = "INSERT INTO
                matiere
            SET
				name=:name";

        $stmt = $conn->prepare($query);
        $name = $matiere->matiere;
        $stmt->bindParam(":name", $name);
        if ($stmt->execute()) {

        } else {
            var_dump($stmt->errorInfo());
            die();
        }

        $mID = $conn->lastInsertId();
    }

    $query = "INSERT INTO
                matiere_has_creneau
            SET
				creneau_id=:creneau_id,
				lvl=:lvl,
				matiere_id=:matiere_id
    ";

    $stmt = $conn->prepare($query);
    $stmt->bindParam(":creneau_id", $cID);
    $lvl = $matiere->lvl;
    $stmt->bindParam(":lvl", $lvl);
    $stmt->bindParam(":matiere_id", $mID);
    $stmt->execute();
}

echo 'OK';