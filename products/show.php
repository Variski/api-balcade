<?php
include "../config/database.php";
include "../utils/response.php";

header("Content-Type: application/json");

$id = $_GET['id'] ?? null;

if (!$id) {
  response(false, "Product ID required");
  exit;
}

$stmt = $conn->prepare("
  SELECT p.*, b.name AS brand_name
  FROM products p
  LEFT JOIN brands b ON p.brand_id = b.id
  WHERE p.id = ?
");

$stmt->bind_param("i", $id);
$stmt->execute();

$result = $stmt->get_result();

if ($result->num_rows === 0) {
  response(false, "Product not found");
  exit;
}

response(true, "Product detail", $result->fetch_assoc());
