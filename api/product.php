<?php
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
  http_response_code(200);
  exit();
}

include "../config/database.php";
include "../utils/response.php";

$result = $conn->query("SELECT * FROM products");
$data = [];

while ($row = $result->fetch_assoc()) {
  $data[] = $row;
}

response(true, "Product list", $data);
