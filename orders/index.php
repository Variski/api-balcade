<?php
include "../config/database.php";
include "../utils/response.php";

$user_id = $_GET['user_id'] ?? null;
if (!$user_id) response(false, "User tidak valid");

$stmt = $conn->prepare("
  SELECT * FROM orders
  WHERE user_id = ?
  ORDER BY created_at DESC
");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

$data = [];
while ($row = $result->fetch_assoc()) {
  $data[] = $row;
}

response(true, "Order list", $data);
