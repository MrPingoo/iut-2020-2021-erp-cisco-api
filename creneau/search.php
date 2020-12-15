<?php
// Connexion à la BDD
include_once '../database.php';

// Faire une requête
$query = "SELECT
                *
            FROM
                salle
            ";
$stmt = $conn->prepare($query);
$stmt->execute();
$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Afficher les données
echo json_encode($rows);