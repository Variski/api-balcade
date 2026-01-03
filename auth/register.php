<?php
include "../config/database.php";
include "../utils/response.php";

$data = json_decode(file_get_contents("php://input"), true);

if (
  empty($data["name"]) ||
  empty($data["email"]) ||
  empty($data["password"])
) {
  response(false, "Data tidak lengkap");
}

$name = $data["name"];
$email = $data["email"];
$password = password_hash($data["password"], PASSWORD_DEFAULT);

// cek email
$check = $conn->prepare("SELECT id FROM users WHERE email = ?");
$check->bind_param("s", $email);
$check->execute();
if ($check->get_result()->num_rows > 0) {
  response(false, "Email sudah terdaftar");
}

$stmt = $conn->prepare(
  "INSERT INTO users (name, email, password) VALUES (?, ?, ?)"
);
$stmt->bind_param("sss", $name, $email, $password);

if ($stmt->execute()) {
  response(true, "Register success");
} else {
  response(false, "Register failed");
}
