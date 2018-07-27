-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2018 at 05:06 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_skripsi`
--

-- --------------------------------------------------------

--
-- Table structure for table `dataset`
--

CREATE TABLE `dataset` (
  `id` int(3) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `age` int(3) NOT NULL,
  `experience` int(3) NOT NULL,
  `last_education` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `total_ability` int(3) NOT NULL,
  `nilai_online` float NOT NULL,
  `nilai_f2f` float NOT NULL,
  `nilai_sikap` varchar(255) NOT NULL,
  `flag` tinyint(4) NOT NULL,
  `status_passed` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dataset`
--

INSERT INTO `dataset` (`id`, `nama_lengkap`, `age`, `experience`, `last_education`, `status`, `total_ability`, `nilai_online`, `nilai_f2f`, `nilai_sikap`, `flag`, `status_passed`, `created_at`, `updated_at`) VALUES
(1, 'Suharto', 21, 4, 'pasca', 'lajang', 6, 95, 85, 'baik', 0, 'lulus', '2018-07-27 09:47:59', '2018-07-27 02:47:59'),
(2, 'Adi', 21, 0, 'sarjana', 'menikah', 7, 83, 90, 'cukup baik', 0, 'lulus', '2018-07-27 09:47:59', '2018-07-27 02:47:59'),
(3, 'Dewi', 35, 3, 'sma', 'lajang', 8, 71, 78, 'cukup baik', 0, 'gagal', '2018-07-27 09:47:59', '2018-07-27 02:48:30'),
(4, 'Martha', 21, 0, 'akademi', 'menikah', 9, 74, 76, 'baik', 0, 'lulus', '2018-07-27 09:47:59', '2018-07-27 03:00:13'),
(5, 'Stephen', 21, 4, 'pasca', 'lajang', 5, 86, 85, 'cukup baik', 0, 'lulus', '2018-07-27 09:47:59', '2018-07-27 02:53:54'),
(6, 'Eko', 26, 1, 'akademi', 'menikah', 4, 70, 75, 'cukup baik', 0, 'gagal', '2018-07-27 09:47:59', '2018-07-27 02:53:58'),
(7, 'Wulan', 21, 5, 'sarjana', 'lajang', 3, 76, 95, 'baik', 0, 'lulus', '2018-07-27 09:47:59', '2018-07-27 02:47:59'),
(8, 'Susanti', 21, 2, 'sma', 'lajang', 2, 74, 75, 'baik', 0, 'gagal', '2018-07-27 09:47:59', '2018-07-27 02:47:59'),
(9, 'Sudirman', 28, 2, 'sma', 'menikah', 4, 78, 79, 'sangat baik', 0, 'lulus', '2018-07-27 09:47:59', '2018-07-27 03:01:10'),
(10, 'Surya', 21, 5, 'pasca', 'lajang', 8, 93, 95, 'cukup baik', 0, 'lulus', '2018-07-27 09:47:59', '2018-07-27 02:53:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dataset`
--
ALTER TABLE `dataset`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dataset`
--
ALTER TABLE `dataset`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
