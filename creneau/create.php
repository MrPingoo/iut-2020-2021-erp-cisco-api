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

$matieres = $data->matieres;

if($stmt->execute()){
    echo 'ok';
} else {
    var_dump($stmt->errorInfo());
}

foreach ($matieres as $m) {
    // 1/ Vérifier que la matière existe dans la base si elle n'est pas dispo alors la créer
    // 2/ création du matiere_has_creneau avec les données creneau_id, lvl, matiere_id

    var_dump($m->matiere);
    var_dump($m->lvl);
}
die();