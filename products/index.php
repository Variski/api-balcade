<?php
include "../config/database.php";
include "../utils/response.php";

$result = $conn->query("SELECT * FROM products");
$data = [];

while ($row = $result->fetch_assoc()) {
  $data[] = $row;
}

response(true, "Product list", $data);
?>
