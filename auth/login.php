<?php
include "../config/database.php";
include "../utils/response.php";

$data = json_decode(file_get_contents("php://input"), true);

if (!$data) {
  response(false, "Invalid JSON");
}

if (empty($data["email"]) || empty($data["password"])) {
  response(false, "Email dan password wajib diisi");
}

$email = trim($data["email"]);
$password = $data["password"];

// cari user
$stmt = $conn->prepare("SELECT * FROM users WHERE LOWER(email) = LOWER(?)");
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
  response(false, "User not found");
}

$user = $result->fetch_assoc();

// cek password
if (!password_verify($password, $user["password"])) {
  response(false, "Wrong password");
}

// token
$token = bin2hex(random_bytes(32));

// simpan token
$update = $conn->prepare("UPDATE users SET token = ? WHERE id = ?");
$update->bind_param("si", $token, $user["id"]);
$update->execute();

// response
unset($user["password"]);
$user["token"] = $token;

response(true, "Login success", $user);
