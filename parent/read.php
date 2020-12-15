<?php
// Connexion à la BDD
include_once '../database.php';

// Faire une requête
$query = "SELECT
                *
            FROM
                parent
            ORDER BY
                firstname DESC";
$stmt = $conn->prepare($query);
$stmt->execute();
$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Afficher les données
echo json_encode($rows);