<?php
include "../config/database.php";
include "../utils/response.php";

$data = json_decode(file_get_contents("php://input"), true);

if (empty($data["id"]) || empty($data["image"])) {
  response(false, "ID dan image wajib diisi");
}

$id = $data["id"];
$image = $data["image"];

$stmt = $conn->prepare("UPDATE products SET image=? WHERE id=?");
$stmt->bind_param("si", $image, $id);
$stmt->execute();

response(true, "Image produk berhasil diperbarui");
