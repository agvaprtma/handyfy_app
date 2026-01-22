-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 22, 2026 at 02:06 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_handphone`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `merk` varchar(100) NOT NULL,
  `harga` int NOT NULL,
  `deskripsi` text,
  `foto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `nama`, `merk`, `harga`, `deskripsi`, `foto`) VALUES
(3, 'Samsung Galaxy S24 FE', 'Samsung', 9999000, 'Samsung Galaxy S24 FE menambah variasi HP flagship murah yang bisa kamu pertimbangkan untuk beli. Penerus S23 FE ini membawa beberapa peningkatan dari segi software hingga hardware. ', 'samsung_s24fe.jpg'),
(8, 'Samsung Galaxy S25+', 'Samsung', 17999000, 'Samsung meluncurkan S25 Plus dengan desain lebih ringan, performa AI lebih cepat dan bejibun fitur baru. Ini spesifikasi dan harga di Indonesia.', 'samsung_s25plus.jpg'),
(9, 'Samsung Galaxy Z Flip 7', 'Samsung', 17999000, 'Galaxy Z Flip7\'s redesigned cover screen features our slimmest bezel yet, enabling you to do more from FlexWindow than ever before. The stunning main screen now features an undisrupted viewing experience. It\'s a sight to behold.', 'samsung_zflip7.jpg'),
(10, 'Samsung Galaxy A56 5G', 'Samsung', 6499000, 'Introducing the Galaxy A56 5G. With 7.4 mm thickness and 198 g weight, Galaxy A56 5G has a good grip. The enhanced cameras are grouped to match the New Inhouse Camera design. Galaxy A56 5G has four color options to choose from — Awesome Pink, Awesome Olive, Awesome Graphite and Awesome Lightgray', 'samsung_a56.jpg'),
(11, 'Iphone 17', 'Appel', 17249000, 'The iPhone 17 is the next installment in Apple\'s mainstream lineup and with its Plus sibling replaced with an Air model this year, it sounds like the dud in the lineup with its plain naming. Except that\'s an entirely false impression and this may well be the most improved member of the 2025 Apple series.', 'iphone_17.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
