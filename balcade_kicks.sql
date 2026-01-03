-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306:4306
-- Generation Time: Jan 03, 2026 at 08:45 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `balcade_kicks`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(1, 'Nike'),
(2, 'Vans'),
(3, 'Adidas'),
(4, 'Puma'),
(5, 'New Balance');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `address` text DEFAULT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total`, `status`, `created_at`, `address`, `note`) VALUES
(8, 3, 3900000, 'pending', '2025-12-25 15:09:57', 'Jl. Raya Keputih No. 10', 'Ukuran 42'),
(10, 3, 1500000, 'pending', '2025-12-26 02:53:32', 'Pasuruan\n', ''),
(12, 4, 1400000, 'pending', '2025-12-26 03:46:54', 'Surabaya', ''),
(13, 6, 3900000, 'pending', '2025-12-26 03:50:56', 'Jl. Ngemplak No. 10', 'Ukuran 42'),
(14, 6, 6850000, 'pending', '2025-12-26 05:28:39', 'Tuban Kota', ''),
(15, 7, 3900000, 'pending', '2025-12-26 12:59:19', 'Jl. Buduran No. 10', 'Ukuran 42'),
(16, 7, 1500000, 'pending', '2025-12-26 13:44:26', 'Surabaya', ''),
(17, 6, 8650000, 'pending', '2025-12-26 14:49:14', 'Tuban', '');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `qty`, `price`) VALUES
(8, 8, 1, 2, 1500000),
(9, 8, 2, 1, 900000),
(13, 10, 1, 1, 1500000),
(17, 12, 5, 1, 1400000),
(18, 13, 1, 2, 1500000),
(19, 13, 2, 1, 900000),
(20, 14, 1, 1, 1500000),
(21, 14, 2, 1, 950000),
(22, 14, 3, 1, 1800000),
(23, 14, 4, 1, 1200000),
(24, 14, 5, 1, 1400000),
(25, 15, 1, 2, 1500000),
(26, 15, 2, 1, 900000),
(27, 16, 1, 1, 1500000),
(28, 17, 6, 1, 1800000),
(29, 17, 5, 1, 1400000),
(30, 17, 4, 1, 1200000),
(31, 17, 3, 1, 1800000),
(32, 17, 2, 1, 950000),
(33, 17, 1, 1, 1500000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `name`, `description`, `price`, `image`, `created_at`) VALUES
(1, 3, 'Adidas Pro Model ADV', 'Classic white sneakers', 1500000, 'adidas_SkateboardingProModelADV.jpg', '2025-12-25 13:09:19'),
(2, 2, 'Vans Old Skool', 'Skate lifestyle shoes', 950000, 'Vans-SkateOldSkool.jpg', '2025-12-25 13:09:19'),
(3, 3, 'Adidas Samba', 'Comfort running shoes', 1800000, 'Adidas_SkateboardingSambaADV.jpg', '2025-12-25 13:09:19'),
(4, 2, 'Vans SK8-HI', 'Sport street style', 1200000, '143420-0-Vans-SkateSK8Hi.jpg', '2025-12-25 13:09:19'),
(5, 5, 'New Balance 550', 'Retro basketball shoes', 1400000, '174962-0-NewBalanceNumeric-306.jpg', '2025-12-25 13:09:19'),
(6, 3, 'Adidas Samba', 'Comfort running shoes', 1800000, 'adidas-SkateboardingSambaADV.jpg', '2025-12-26 06:01:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `token`, `role`, `created_at`) VALUES
(3, 'Maulidya Khairina Balqis', '23081010276@student.upnjatim.ac.id', '$2y$10$vvNaCHmPE7crXO0c5l7hjuF9g2i1RITj67POqNTd2nJbKPXw5BDzC', 'd0e542153459bd89b51b4a6ad662fef023d407497b41a3b8851bf20bdd5f4cca', 'user', '2025-12-25 14:57:41'),
(4, 'Cantika Berliana Rahmasari', '23081010245@student.upnjatim.ac.id', '$2y$10$Ujs08y07OBGW.oO0TFTIHOv9UtFzHN8Ctf2UXvbZEWGNazqhBwCM2', 'c88e9ab3799fae4fb41b0b4557b3f4699a95160bfbde43738cc8839858d571be', 'user', '2025-12-26 02:34:22'),
(6, 'Deva Helal Eka Variski', '23081010313@student.upnjatim.ac.id', '$2y$10$.d88CdidFWU6ZqY2QRFWY.310STpqRzEx3eSoJLP4v/.tMi76a4Gu', 'e827d0cc3ef3cc8d135ef68606fd502a2a24906ee0ca9040aaf01f645a4a9727', 'user', '2025-12-26 03:48:32'),
(7, 'I Kadek Rangga Sandi', '23081010203@student.upnjatim.ac.id', '$2y$10$warRsqPRG8m.Idj8LERcCefGm70Qk5wuu6ZWZwpgeiKfzesJ9Nho6', '6fb85b8adbf9d892a182410dcb916d43b0b27f8290fbbaed2a0a6cc7e596679d', 'user', '2025-12-26 12:58:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
