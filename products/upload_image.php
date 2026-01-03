<?php
include "../config/database.php";
include "../utils/response.php";

$id = $_POST["id"];

if (!isset($_FILES["image"])) {
  response(false, "Image required");
}

$file = $_FILES["image"];
$filename = time() . "_" . $file["name"];
$path = "../upload/image/" . $filename;

move_uploaded_file($file["tmp_name"], $path);

$stmt = $conn->prepare("UPDATE products SET image = ? WHERE id = ?");
$stmt->bind_param("si", $filename, $id);
$stmt->execute();

response(true, "Image updated", ["image" => $filename]);
