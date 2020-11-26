-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2020 at 10:58 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tubes1wbd`
--

-- --------------------------------------------------------

--
-- Table structure for table `cookie_data`
--

CREATE TABLE `cookie_data` (
  `login_string` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cookie_data`
--

INSERT INTO `cookie_data` (`login_string`, `username`) VALUES
('3dd7fa030084c421b2f2de84bcabff74', 'admin'),
('5d351a3017ebf79098dc0e2469d941bd', 'admin'),
('663cf1657dc63e7a374ab6231fe5366f', 'taufiq'),
('8537385d85d2cf0541d24cd6c03bf34e', 'admin'),
('c35e856c921648dd53f854c9823e044e', 'ibnu');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `sold` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `photo` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `sold`, `amount`, `Description`, `photo`) VALUES
(1, 'Chocolate 2', 3000, 48, 23, 'Coklat ini merupakan coklat yang dipanggang hingga meleleh, setelah itu dibentuk lalu dibekukan kami juga kurang mengerti mengapa kami melakukan itu', 'contoh.png'),
(2, 'Chocolate 4', 2000, 55, 3, 'lorem ipsum', 'contoh.png'),
(3, 'Chocolate3', 2000, 12, 12, 'lorem ipsum', 'contoh.png');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `chocolate_name` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL,
  `total_price` float NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `address` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`chocolate_name`, `amount`, `total_price`, `date`, `time`, `address`, `username`) VALUES
('chocolate 1', 12, 12000, '2020-10-08', '07:12:05', 'jalan blablabla', 'taufiq'),
('chocolate 1', 12, 12000, '2020-10-08', '07:12:05', 'jalan blablabla', 'taufiq'),
('Chocolate 2', 3, 9000, '2020-10-23', '09:55:24', 'aaaaa', 'ibnu'),
('Chocolate 2', 3, 9000, '2020-10-23', '09:58:33', 'aaaaa', 'ibnu'),
('Chocolate 2', 3, 9000, '2020-10-23', '09:59:17', 'aaaa', 'ibnu'),
('Chocolate 2', 3, 9000, '2020-10-23', '10:01:37', 'jalanananananan', 'ibnu'),
('Chocolate 2', 6, 18000, '2020-10-23', '10:03:14', 'aaaa', 'ibnu'),
('Chocolate 2', 4, 12000, '2020-10-24', '15:20:28', 'di ITB', 'ibnu'),
('Chocolate 2', 11, 33000, '2020-10-24', '22:34:31', 'AAAAAAAAAAAAAAAAAA', 'ibnu'),
('Chocolate 2', 13, 39000, '2020-10-25', '10:28:29', 'dimana saja lah', 'ibnu'),
('Chocolate 2', 3, 9000, '2020-10-25', '13:45:46', 'aaaaaaaaaaaaaaa', 'ibnu'),
('Chocolate3', 2, 4000, '2020-11-06', '15:10:44', 'jajajajajajajajajaj', 'ibnu'),
('Chocolate3', 2, 4000, '2020-11-06', '15:11:11', 'mdmmdmdmdmdmdmdmdmdm', 'ibnu'),
('Chocolate 2', 5, 15000, '2020-11-06', '15:11:56', 'djjdhjdhjhdjhdjdj', 'ibnu'),
('Chocolate3', 4, 8000, '2020-11-06', '15:14:20', 'dbjsdbjdbsjbdsjbsdj', 'ibnu'),
('Chocolate 4', 8, 16000, '2020-11-06', '15:15:47', 'aadaddadadaadda', 'ibnu'),
('Chocolate 4', 35, 70000, '2020-11-06', '15:18:28', 'dimana saja', 'ibnu');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `email`, `password`, `role`) VALUES
('admin', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
('bebas', 'bebas@gmail.com', 'a4ce06e8e4e1b3a69a8767b5fa70ee24', 'user'),
('hmmmmmm', 'hmmmmmm@gmail.com', 'bd1b9fda5e854f9745bd82728232c3d6', 'user'),
('ibnu', 'ibnu@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user'),
('taufiq', 't@gmail.com', 'f4eff635e6dfe584a1a536dbc7718f3d', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cookie_data`
--
ALTER TABLE `cookie_data`
  ADD PRIMARY KEY (`login_string`),
  ADD UNIQUE KEY `login_string` (`login_string`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_id` (`id`) USING BTREE,
  ADD KEY `secondary_atribute` (`name`,`price`,`sold`,`amount`,`Description`) USING HASH;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
