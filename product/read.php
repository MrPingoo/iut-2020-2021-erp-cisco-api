<?php
// Connexion à la BDD
include_once '../database.php';

// Faire une requête
$query = "SELECT
                p.name, p.id
            FROM
                product p
            ORDER BY
                p.date DESC";
$stmt = $conn->prepare($query);
$stmt->execute();
$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Afficher les données
echo json_encode($rows);