Cara Install 

````md
# Balcade Kick Co – Backend API

This is the **PHP Native REST API** backend for the Balcade Kick Co mobile application.  
It handles authentication, products, orders, and user management.

---

## 🔗 Repository
Frontend repository:  
https://github.com/Variski/balcade-kick-co

---

## 🗂 Folder Structure

```text
api-balcade/
├── api/           ← main API routes
├── auth/          ← authentication (login/register)
├── products/      ← product related API
├── orders/        ← order related API
├── config/        ← database configuration
├── utils/         ← helper functions
└── upload/        ← uploaded images
````

---

## 💻 Installation (Local XAMPP)

### 1️⃣ Place API in `htdocs`

Move `api-balcade` folder to:

```text
C:\xampp\htdocs\api-balcade
```

---

### 2️⃣ Create Database

1. Open **phpMyAdmin**
2. Create new database:

```text
balcade_kicks
```

3. Import the provided SQL file (`balcade_kicks.sql`)

---

### 3️⃣ Configure Database Connection

Edit `config/database.php`:

```php
<?php
$host = "localhost";
$user = "root";
$pass = "";
$db   = "balcade_kicks";

$conn = mysqli_connect($host, $user, $pass, $db);
```

---

### 4️⃣ Start Backend

* Make sure Apache and MySQL are running in XAMPP.
* Test API using browser or Postman:

```text
http://localhost/api-balcade
```

---

## 🔗 API Base URL

In your frontend configuration (`app/services/api.ts`):

```ts
export const API_URL = "http://localhost/api-balcade";
```

---

## 🛠 Tech Stack

* PHP Native
* MySQL
* REST API
* Token-based Authentication

---

## 🎯 Features

* User registration & login
* Product catalog API
* Product detail API
* Cart & orders API
* Image upload API
* User profile API

---

## 👨‍💻 Author

**Variski**

* Backend Repository: [https://github.com/Variski/api-balcade](https://github.com/Variski/api-balcade)

```

---

Kalau mau, aku bisa buatkan versi **README API dengan dokumentasi endpoint lengkap**, misal:

- `/auth/login`
- `/auth/register`
- `/products`
- `/orders`
- Contoh request & response

Ini akan sangat membantu untuk dosen / testing frontend.  

Apakah mau aku buatkan juga versi dokumentasi endpoint lengkapnya?
```
