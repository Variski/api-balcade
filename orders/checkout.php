<?php
include "../config/database.php";
include "../utils/response.php";

$data = json_decode(file_get_contents("php://input"), true);

$user_id = $data['user_id'] ?? null;
$items   = $data['items'] ?? [];
$address = $data['address'] ?? '';
$note    = $data['note'] ?? '';

if (!$user_id || !$address || count($items) === 0) {
  response(false, "Data tidak lengkap");
}

$conn->begin_transaction();

try {
  $total = 0;
  foreach ($items as $item) {
    $total += $item['price'] * $item['qty'];
  }

  $stmt = $conn->prepare("
    INSERT INTO orders (user_id, total, address, note)
    VALUES (?, ?, ?, ?)
  ");
  $stmt->bind_param("idss", $user_id, $total, $address, $note);
  $stmt->execute();

  $order_id = $conn->insert_id;

  $itemStmt = $conn->prepare("
    INSERT INTO order_items (order_id, product_id, qty, price)
    VALUES (?, ?, ?, ?)
  ");

  foreach ($items as $item) {
    $itemStmt->bind_param(
      "iiid",
      $order_id,
      $item['product_id'],
      $item['qty'],
      $item['price']
    );
    $itemStmt->execute();
  }

  $conn->commit();
  response(true, "Checkout berhasil", ["order_id" => $order_id]);

} catch (Exception $e) {
  $conn->rollback();
  response(false, "Checkout gagal");
}
