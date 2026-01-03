<?php
include "../config/database.php";
include "../utils/response.php";

header("Content-Type: application/json");

// Ambil JSON dari request
$data = json_decode(file_get_contents("php://input"), true);

// Validasi input
if (
  empty($data['name']) ||
  empty($data['brand_id']) ||
  empty($data['price']) ||
  empty($data['image'])
) {
  response(false, "Data tidak lengkap");
  exit;
}

$name        = $data['name'];
$brand_id   = (int) $data['brand_id'];
$description = $data['description'] ?? '';
$price       = (int) $data['price'];
$image       = $data['image'];

// Prepared Statement (AMAN)
$stmt = $conn->prepare(
  "INSERT INTO products (brand_id, name, description, price, image)
   VALUES (?, ?, ?, ?, ?)"
);

$stmt->bind_param(
  "issis",
  $brand_id,
  $name,
  $description,
  $price,
  $image
);

if ($stmt->execute()) {
  response(true, "Product created successfully", [
    "id" => $conn->insert_id,
    "brand_id" => $brand_id,
    "name" => $name,
    "description" => $description,
    "price" => $price,
    "image" => $image
  ]);
} else {
  response(false, "Failed to create product", [
    "error" => $stmt->error
  ]);
}
