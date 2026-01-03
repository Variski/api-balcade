<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Content-Type: application/json");

function response($status, $message, $data = null) {
  echo json_encode([
    "status" => $status,
    "message" => $message,
    "data" => $data
  ]);
  exit;
}
