-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2018 at 08:08 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thoughti`
--

-- --------------------------------------------------------

--
-- Table structure for table `root`
--

CREATE TABLE `root` (
  `id` int(12) NOT NULL,
  `parent_id` int(12) NOT NULL,
  `name` varchar(256) NOT NULL,
  `type` enum('file','folder') NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `root`
--

INSERT INTO `root` (`id`, `parent_id`, `name`, `type`, `created`) VALUES
(1, 0, 'New York', 'folder', '2018-10-12 10:07:00'),
(2, 0, 'File 1', 'file', '2018-10-12 10:08:00'),
(3, 0, 'File 2', 'file', '2018-10-12 10:08:10'),
(4, 0, 'File 3', 'file', '2018-10-12 10:08:10'),
(6, 1, 'File 1', 'file', '2018-10-12 10:08:10'),
(7, 1, 'fILE 2', 'file', '2018-10-12 10:15:10'),
(8, 1, 'fILE 3', 'file', '2018-10-12 10:16:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `root`
--
ALTER TABLE `root`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_index` (`parent_id`,`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `root`
--
ALTER TABLE `root`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
