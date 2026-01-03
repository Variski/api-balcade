<?php
include "../config/database.php";
include "../utils/response.php";

header("Content-Type: application/json");

// Ambil JSON
$data = json_decode(file_get_contents("php://input"), true);

if (empty($data['id'])) {
  response(false, "Product ID required");
  exit;
}

$id = (int) $data['id'];

$stmt = $conn->prepare("DELETE FROM products WHERE id=?");
$stmt->bind_param("i", $id);

if ($stmt->execute()) {
  response(true, "Product deleted");
} else {
  response(false, "Failed to delete product", [
    "error" => $stmt->error
  ]);
}
