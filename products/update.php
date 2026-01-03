<?php
include "../config/database.php";
include "../utils/response.php";

header("Content-Type: application/json");

// Ambil JSON
$data = json_decode(file_get_contents("php://input"), true);

if (
  empty($data['id']) ||
  empty($data['name']) ||
  empty($data['brand_id']) ||
  empty($data['price'])
) {
  response(false, "Data tidak lengkap");
  exit;
}

$id          = (int) $data['id'];
$brand_id   = (int) $data['brand_id'];
$name        = $data['name'];
$description = $data['description'] ?? '';
$price       = (int) $data['price'];
$image       = $data['image'] ?? null;

if ($image) {
  $stmt = $conn->prepare("
    UPDATE products
    SET brand_id=?, name=?, description=?, price=?, image=?
    WHERE id=?
  ");
  $stmt->bind_param("issisi", $brand_id, $name, $description, $price, $image, $id);
} else {
  $stmt = $conn->prepare("
    UPDATE products
    SET brand_id=?, name=?, description=?, price=?
    WHERE id=?
  ");
  $stmt->bind_param("issii", $brand_id, $name, $description, $price, $id);
}

if ($stmt->execute()) {
  response(true, "Product updated");
} else {
  response(false, "Failed to update product", [
    "error" => $stmt->error
  ]);
}
