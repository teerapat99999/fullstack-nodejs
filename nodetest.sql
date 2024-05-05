-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2024 at 10:55 AM
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
-- Database: `nodetest`
--

-- --------------------------------------------------------

--
-- Table structure for table `com`
--

CREATE TABLE `com` (
  `id_com` int(11) NOT NULL,
  `com` varchar(50) NOT NULL,
  `id_post` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `com`
--

INSERT INTO `com` (`id_com`, `com`, `id_post`) VALUES
(1, 'asdf', 24),
(2, 'ฟหกด', 24),
(3, 'asdf', 24),
(4, 'asdf', 25),
(5, 'asfd', 26),
(6, 'asdf', 24),
(7, 'asdf', 24),
(8, 'กด dell', 25),
(9, 'เปิด google', 25),
(10, 'ถามช่าง', 26);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id_post` int(11) NOT NULL,
  `post` varchar(100) NOT NULL,
  `details` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id_post`, `post`, `details`, `type`, `id_user`) VALUES
(24, 'หัวใจ', 'เจ็บหัวใจ', 'การแพทย์', 34),
(25, 'คอมพิวเตอร์', 'เปิดเครื่องไม่ติด', 'เทคโนโลยี', 1),
(26, 'คอมพิวเตอร์', 'เปิดเครื่องไม่ติด', 'เทคโนโลยี', 1);

-- --------------------------------------------------------

--
-- Table structure for table `type_post`
--

CREATE TABLE `type_post` (
  `id_typepost` int(11) NOT NULL,
  `name_post` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `type_post`
--

INSERT INTO `type_post` (`id_typepost`, `name_post`) VALUES
(1, 'เทคโนโลยี'),
(2, 'การแพทย์');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username_user` varchar(50) NOT NULL,
  `password_user` varchar(50) NOT NULL,
  `fname_user` varchar(50) NOT NULL,
  `lname_user` varchar(50) NOT NULL,
  `type_user` varchar(50) NOT NULL,
  `img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username_user`, `password_user`, `fname_user`, `lname_user`, `type_user`, `img`) VALUES
(1, 'teerapat', '12', 'teerapat', 'chuchuay', 'admin', '0'),
(34, 'teerapat1', '123', 'teerpat1', 'chuchuqy', '1', 'C:\\fakepath\\AAAABYTfjC7jBn4roleuR4IwFQNwegtAR-VEU_Ig0MxhNOY1_UKVAddHlhJEN961JNfDxt2xpJnrvzQTJHE7zwhYXIZnpkf7wOskpMor.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `com`
--
ALTER TABLE `com`
  ADD PRIMARY KEY (`id_com`),
  ADD KEY `id_post` (`id_post`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id_post`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `type_post`
--
ALTER TABLE `type_post`
  ADD PRIMARY KEY (`id_typepost`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `com`
--
ALTER TABLE `com`
  MODIFY `id_com` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `type_post`
--
ALTER TABLE `type_post`
  MODIFY `id_typepost` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `com`
--
ALTER TABLE `com`
  ADD CONSTRAINT `com_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
