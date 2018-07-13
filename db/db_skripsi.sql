-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2018 at 11:02 AM
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
-- Table structure for table `ability`
--

CREATE TABLE `ability` (
  `id_ability` int(6) NOT NULL,
  `nm_ability` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ability`
--

INSERT INTO `ability` (`id_ability`, `nm_ability`, `created_at`, `updated_at`) VALUES
(2, 'Algorithm', '2018-06-26 11:28:27', '2018-06-27 13:36:11'),
(10, 'Coding C#', '2018-06-26 16:05:22', '2018-06-26 09:05:22'),
(17, 'Bahasa Inggris - Aktif', '2018-06-30 21:01:51', '2018-07-02 18:30:25'),
(18, 'Bahasa Inggris - Pasif', '2018-07-03 01:30:36', '2018-07-02 18:30:36'),
(20, 'Matematika Dasar', '2018-07-03 01:31:09', '2018-07-02 18:31:09'),
(21, 'Akuntansi Dasar', '2018-07-03 01:31:45', '2018-07-02 18:31:45'),
(22, 'Mampu Bekerja dibawah Tekanan', '2018-07-03 01:31:57', '2018-07-02 18:31:57'),
(23, 'Microsoft (Word, Excel, Powerpoint)', '2018-07-03 01:32:15', '2018-07-02 18:32:15'),
(24, 'Coding Java', '2018-07-03 01:32:28', '2018-07-02 18:32:28');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id_admin` int(6) NOT NULL,
  `nm_admin` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profesi` varchar(255) NOT NULL,
  `level` int(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id_admin`, `nm_admin`, `email`, `password`, `profesi`, `level`, `created_at`, `updated_at`) VALUES
(6, 'ccdnkz', 'ccdnkz@mail.com', '856e22b06868660656e0e6fff975a8d9', 'IT - Support', 1, '2018-06-23 13:14:04', '2018-07-05 13:48:25'),
(7, 'Edward', 'esj@mail.com', '5f0713b7c76ee9285a14984eeb332f43', 'IT - Maintenance', 1, '2018-06-27 16:26:07', '2018-07-05 13:48:33'),
(13, 'Admin', 'admin@mail.com', '21232f297a57a5a743894a0e4a801fc3', 'IT - UI IX', 1, '2018-06-30 21:03:01', '2018-07-05 13:49:52'),
(14, 'Ryan', 'ryan@mail.com', '10c7ccc7a4f0aff03c915c485565b9da', 'IT - Tech', 1, '2018-06-30 21:59:08', '2018-07-05 13:48:55');

-- --------------------------------------------------------

--
-- Table structure for table `admins_sesi`
--

CREATE TABLE `admins_sesi` (
  `id` int(6) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `id_admin` int(6) NOT NULL,
  `id_stage` int(6) DEFAULT NULL,
  `created_by` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins_sesi`
--

INSERT INTO `admins_sesi` (`id`, `keterangan`, `id_admin`, `id_stage`, `created_by`) VALUES
(8, 'Bagian Pengawas', 7, 4, 7);

-- --------------------------------------------------------

--
-- Table structure for table `algoritma`
--

CREATE TABLE `algoritma` (
  `id_algo` int(3) NOT NULL,
  `nm_algo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `algoritma`
--

INSERT INTO `algoritma` (`id_algo`, `nm_algo`) VALUES
(1, 'CART'),
(2, 'C4.5');

-- --------------------------------------------------------

--
-- Table structure for table `dataset`
--

CREATE TABLE `dataset` (
  `id` int(3) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `umur` int(3) NOT NULL,
  `experience` int(3) NOT NULL,
  `last_education` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `total_kemampuan` int(3) NOT NULL,
  `nilai_online` float NOT NULL,
  `nilai_f2f` float NOT NULL,
  `nilai_sikap` varchar(255) NOT NULL,
  `buta_warna` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dataset`
--

INSERT INTO `dataset` (`id`, `nama_lengkap`, `umur`, `experience`, `last_education`, `status`, `total_kemampuan`, `nilai_online`, `nilai_f2f`, `nilai_sikap`, `buta_warna`, `created_at`, `updated_at`) VALUES
(1, 'Edward Surya Jaya', 21, 2, 'S1', 'Lajang', 8, 85, 85, 'Baik', 'Negatif', '2018-07-11 08:54:37', '2018-07-11 01:54:37'),
(2, 'Christine', 25, 5, 'S3', 'Lajang', 7, 90, 90, 'Cukup Baik', 'Positif', '2018-07-11 08:54:37', '2018-07-11 01:54:37'),
(3, 'Ryan Rajaya', 22, 3, 'S2', 'Menikah', 5, 88, 87, 'Sangat Baik', 'Parsial', '2018-07-11 08:54:37', '2018-07-11 01:54:37');

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `id_job` int(6) NOT NULL,
  `nm_job` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id_job`, `nm_job`, `created_at`, `updated_at`) VALUES
(1, 'IT - Support', '2018-06-26 11:44:51', '2018-06-26 04:44:51'),
(2, 'IT - Programming', '2018-06-26 11:45:27', '2018-06-26 04:45:27'),
(3, 'IT - Maintenance', '2018-06-26 11:45:41', '2018-06-26 04:45:41'),
(6, 'IT - Testing', '2018-06-30 20:53:24', '2018-06-30 14:02:05'),
(7, 'Akuntansi', '2018-07-03 01:19:02', '2018-07-02 18:19:02'),
(8, 'Salesman', '2018-07-03 01:34:14', '2018-07-02 18:34:14'),
(9, 'Manajer Operasional', '2018-07-03 01:34:23', '2018-07-02 18:34:23'),
(10, 'Manajer Logistik', '2018-07-03 01:34:34', '2018-07-02 18:34:34'),
(11, 'IT - Kepala Bagian Support', '2018-07-03 01:34:52', '2018-07-02 18:34:52');

-- --------------------------------------------------------

--
-- Table structure for table `question_f2f`
--

CREATE TABLE `question_f2f` (
  `id_question` int(6) NOT NULL,
  `question` text NOT NULL,
  `answer_a` varchar(255) NOT NULL,
  `answer_b` varchar(255) NOT NULL,
  `answer_c` varchar(255) NOT NULL,
  `answer_d` varchar(255) NOT NULL,
  `correct_ans` varchar(255) NOT NULL,
  `weight` int(3) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `label` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_job` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_f2f`
--

INSERT INTO `question_f2f` (`id_question`, `question`, `answer_a`, `answer_b`, `answer_c`, `answer_d`, `correct_ans`, `weight`, `status`, `label`, `created_at`, `updated_at`, `id_job`) VALUES
(1, '<p>Apakah tulisan di disamping ini bold ?&nbsp;<strong>TESTING</strong></p>', 'Benar', 'Salah', 'Mungkin', 'Tidak Mungkin', 'Mungkin', 30, 1, 'Akuntansi I', '2018-07-01 16:03:48', '2018-07-01 11:20:17', 2),
(2, '<p>Kepanjangan <strong>HTML</strong> adalah ?</p>', 'Gak Tau', 'HTML => HTML', 'Lol', 'Gk usa Jawab', 'Gk usa Jawab', 5, 1, 'Akuntansi I', '2018-07-01 18:14:39', '2018-07-01 12:06:46', 3);

-- --------------------------------------------------------

--
-- Table structure for table `question_online`
--

CREATE TABLE `question_online` (
  `id_question` int(6) NOT NULL,
  `question` text NOT NULL,
  `answer_a` varchar(255) NOT NULL,
  `answer_b` varchar(255) NOT NULL,
  `answer_c` varchar(255) NOT NULL,
  `answer_d` varchar(255) NOT NULL,
  `correct_ans` varchar(255) NOT NULL,
  `weight` int(3) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `label` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_job` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_online`
--

INSERT INTO `question_online` (`id_question`, `question`, `answer_a`, `answer_b`, `answer_c`, `answer_d`, `correct_ans`, `weight`, `status`, `label`, `created_at`, `updated_at`, `id_job`) VALUES
(1, '<p><em>Apakah</em> Jawaban di bawah ini <strong>BENAR</strong> ?</p>', 'Mungkin', 'Iya', 'Salah', 'Kek Nya Benar', 'Iya', 30, 1, 'Akuntansi I', '2018-07-01 16:02:26', '2018-07-01 12:23:10', 1),
(2, '<p>Apa yang kami inginkan ?</p>', 'Tidak Urus', 'Uang', 'Hidup Mewah', 'Kekayaan', 'Tidak Urus', 15, 1, 'Akuntansi II', '2018-07-01 18:19:58', '2018-07-01 15:48:23', 6),
(3, '<p>How ?</p>', '1', '2', '3', '4', '4', 74, 1, 'Akuntansi II', '2018-07-01 19:15:28', '2018-07-01 12:15:42', 3),
(4, '<p>Skripsi itu mudah atau tidak ?</p>', 'Ez', 'Susah', 'Gak Kuliah', 'Susah Susah Gampang Bang', 'Ez', 9, 1, 'Akuntansi II', '2018-07-01 22:49:34', '2018-07-01 15:49:47', 6),
(5, '<p>Kegunaan Mouse ?</p>', 'Untuk menjalankan kursor', 'Ntah', 'Jawab Sendiri', 'Gk usa Jawab', 'Untuk menjalankan kursor', 5, 1, 'IT', '2018-07-05 22:16:56', '2018-07-05 15:16:56', 2);

-- --------------------------------------------------------

--
-- Table structure for table `required_ability`
--

CREATE TABLE `required_ability` (
  `id` int(6) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_ability` int(6) NOT NULL,
  `id_job` int(6) NOT NULL,
  `id_std` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `required_ability`
--

INSERT INTO `required_ability` (`id`, `created_at`, `updated_at`, `id_ability`, `id_job`, `id_std`) VALUES
(1, '2018-07-10 09:09:46', '2018-07-10 02:09:46', 17, 7, 1),
(2, '2018-07-10 09:09:46', '2018-07-10 02:09:46', 18, 7, 1),
(3, '2018-07-10 09:09:46', '2018-07-10 02:09:46', 21, 7, 1),
(4, '2018-07-10 09:09:46', '2018-07-10 02:09:46', 22, 7, 1),
(5, '2018-07-10 09:09:46', '2018-07-10 02:09:46', 23, 7, 1),
(6, '2018-07-11 15:18:43', '2018-07-11 08:18:43', 2, 3, 2),
(7, '2018-07-11 15:18:43', '2018-07-11 08:18:43', 10, 3, 2),
(8, '2018-07-11 15:18:43', '2018-07-11 08:18:43', 17, 3, 2),
(9, '2018-07-11 15:18:43', '2018-07-11 08:18:43', 18, 3, 2),
(10, '2018-07-11 15:18:43', '2018-07-11 08:18:43', 20, 3, 2),
(11, '2018-07-11 15:18:43', '2018-07-11 08:18:43', 22, 3, 2),
(12, '2018-07-11 15:18:43', '2018-07-11 08:18:43', 23, 3, 2),
(13, '2018-07-11 15:18:43', '2018-07-11 08:18:43', 24, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `selection_stage`
--

CREATE TABLE `selection_stage` (
  `id_stage` int(6) NOT NULL,
  `nm_stage` varchar(255) NOT NULL,
  `label_online` varchar(255) NOT NULL,
  `label_f2f` varchar(255) NOT NULL,
  `status_selesai` int(3) NOT NULL,
  `status_laporan` int(3) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_algo` int(6) NOT NULL,
  `id_std` int(6) NOT NULL,
  `id_job` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `selection_stage`
--

INSERT INTO `selection_stage` (`id_stage`, `nm_stage`, `label_online`, `label_f2f`, `status_selesai`, `status_laporan`, `created_at`, `updated_at`, `id_algo`, `id_std`, `id_job`) VALUES
(4, 'nama_stage', 'Akuntansi I', 'Akuntansi I', 0, 0, '2018-07-13 01:05:43', '2018-07-12 18:05:43', 0, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `selection_stage_detail`
--

CREATE TABLE `selection_stage_detail` (
  `id` int(6) NOT NULL,
  `label` varchar(255) NOT NULL,
  `start_stage` date NOT NULL,
  `end_stage` date NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_stage` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `selection_stage_detail`
--

INSERT INTO `selection_stage_detail` (`id`, `label`, `start_stage`, `end_stage`, `created_at`, `updated_at`, `id_stage`) VALUES
(20, 'Tahap 1', '2018-07-09', '2018-07-14', '2018-07-13 01:05:43', '2018-07-13 09:01:33', 4),
(21, 'Tahap 2', '2018-07-16', '2018-07-21', '2018-07-13 01:05:43', '2018-07-13 09:01:43', 4),
(22, 'Tahap 3', '2018-07-23', '2018-07-28', '2018-07-13 01:05:43', '2018-07-13 09:01:49', 4),
(23, 'Tahap 4', '2018-07-30', '2018-07-31', '2018-07-13 01:05:43', '2018-07-12 18:05:43', 4),
(24, 'Tahap 5', '2018-07-30', '2018-07-31', '2018-07-13 01:05:43', '2018-07-12 18:05:43', 4),
(25, 'Tahap 6', '2018-07-30', '2018-07-31', '2018-07-13 01:05:43', '2018-07-12 18:05:43', 4);

-- --------------------------------------------------------

--
-- Table structure for table `standard_ability`
--

CREATE TABLE `standard_ability` (
  `id` int(6) NOT NULL,
  `kemampuan` int(3) NOT NULL,
  `id_std` int(6) NOT NULL,
  `priority` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `standard_ability`
--

INSERT INTO `standard_ability` (`id`, `kemampuan`, `id_std`, `priority`) VALUES
(1, 5, 1, 1),
(2, 7, 1, 1),
(3, 8, 1, 2),
(4, 10, 1, 2),
(5, 5, 2, 1),
(6, 8, 2, 1),
(7, 9, 2, 2),
(8, 10, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `standard_age`
--

CREATE TABLE `standard_age` (
  `id` int(6) NOT NULL,
  `umur` int(6) NOT NULL,
  `id_std` int(6) NOT NULL,
  `priority` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `standard_age`
--

INSERT INTO `standard_age` (`id`, `umur`, `id_std`, `priority`) VALUES
(1, 20, 1, 1),
(2, 21, 1, 3),
(3, 25, 1, 3),
(4, 40, 1, 2),
(5, 20, 2, 1),
(6, 21, 2, 1),
(7, 25, 2, 1),
(8, 35, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `standard_buta_warna`
--

CREATE TABLE `standard_buta_warna` (
  `id` int(6) NOT NULL,
  `buta_warna` varchar(255) NOT NULL,
  `id_std` int(6) NOT NULL,
  `priority` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `standard_buta_warna`
--

INSERT INTO `standard_buta_warna` (`id`, `buta_warna`, `id_std`, `priority`) VALUES
(1, 'Negatif', 1, 3),
(2, 'Parsial', 1, 2),
(3, 'Positif', 1, 1),
(4, 'Negatif', 2, 3),
(5, 'Parsial', 2, 2),
(6, 'Positif', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `standard_education`
--

CREATE TABLE `standard_education` (
  `id` int(6) NOT NULL,
  `pendidikan` varchar(255) NOT NULL,
  `id_std` int(6) NOT NULL,
  `priority` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `standard_education`
--

INSERT INTO `standard_education` (`id`, `pendidikan`, `id_std`, `priority`) VALUES
(1, 'SMA', 1, 1),
(2, 'S1', 1, 1),
(3, 'S2', 1, 2),
(4, 'S3', 1, 3),
(5, 'SMA', 2, 1),
(6, 'S1', 2, 2),
(7, 'S2', 2, 3),
(8, 'S3', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `standard_experience`
--

CREATE TABLE `standard_experience` (
  `id` int(6) NOT NULL,
  `pengalaman` int(3) NOT NULL,
  `id_std` int(6) NOT NULL,
  `priority` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `standard_experience`
--

INSERT INTO `standard_experience` (`id`, `pengalaman`, `id_std`, `priority`) VALUES
(1, 0, 1, 1),
(2, 1, 1, 2),
(3, 2, 1, 2),
(4, 3, 1, 3),
(5, 0, 2, 1),
(6, 1, 2, 1),
(7, 2, 2, 1),
(8, 3, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `standard_f2f`
--

CREATE TABLE `standard_f2f` (
  `id` int(6) NOT NULL,
  `nilai` float NOT NULL,
  `id_std` int(6) NOT NULL,
  `priority` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `standard_f2f`
--

INSERT INTO `standard_f2f` (`id`, `nilai`, `id_std`, `priority`) VALUES
(1, 70, 1, 1),
(2, 79, 1, 1),
(3, 80, 1, 2),
(4, 89, 1, 2),
(5, 90, 1, 3),
(6, 100, 1, 3),
(7, 80, 2, 1),
(8, 80, 2, 1),
(9, 86, 2, 2),
(10, 95, 2, 2),
(11, 96, 2, 3),
(12, 100, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `standard_online`
--

CREATE TABLE `standard_online` (
  `id` int(6) NOT NULL,
  `nilai` float NOT NULL,
  `id_std` int(6) NOT NULL,
  `priority` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `standard_online`
--

INSERT INTO `standard_online` (`id`, `nilai`, `id_std`, `priority`) VALUES
(1, 70, 1, 1),
(2, 79, 1, 1),
(3, 80, 1, 3),
(4, 89, 1, 3),
(5, 90, 1, 2),
(6, 100, 1, 2),
(7, 75, 2, 1),
(8, 80, 2, 1),
(9, 81, 2, 2),
(10, 95, 2, 2),
(11, 96, 2, 3),
(12, 100, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `standard_qualification`
--

CREATE TABLE `standard_qualification` (
  `id_std` int(6) NOT NULL,
  `nm_std` varchar(255) NOT NULL,
  `id_job` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `standard_qualification`
--

INSERT INTO `standard_qualification` (`id_std`, `nm_std`, `id_job`) VALUES
(1, 'Standard Akuntansi', 7),
(2, 'Standar IT', 3);

-- --------------------------------------------------------

--
-- Table structure for table `standard_sikap`
--

CREATE TABLE `standard_sikap` (
  `id` int(6) NOT NULL,
  `nilai` varchar(255) NOT NULL,
  `id_std` int(6) NOT NULL,
  `priority` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `standard_sikap`
--

INSERT INTO `standard_sikap` (`id`, `nilai`, `id_std`, `priority`) VALUES
(1, 'Cukup Baik', 1, 1),
(2, 'Baik', 1, 2),
(3, 'Sangat Baik', 1, 3),
(4, 'Cukup Baik', 2, 1),
(5, 'Baik', 2, 2),
(6, 'Sangat Baik', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `standard_status`
--

CREATE TABLE `standard_status` (
  `id` int(6) NOT NULL,
  `status` varchar(255) NOT NULL,
  `id_std` int(6) NOT NULL,
  `priority` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `standard_status`
--

INSERT INTO `standard_status` (`id`, `status`, `id_std`, `priority`) VALUES
(1, 'Lajang', 1, 2),
(2, 'Menikah', 1, 1),
(3, 'Lajang', 2, 1),
(4, 'Menikah', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(6) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `confirm_code` varchar(255) DEFAULT NULL,
  `acc_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_job` int(6) NOT NULL,
  `id_stage` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_ability`
--

CREATE TABLE `users_ability` (
  `id` int(6) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_ability` int(6) NOT NULL,
  `id_user` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_detail`
--

CREATE TABLE `users_detail` (
  `id_d_user` int(6) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `no_ktp` varchar(255) NOT NULL,
  `birth_place` varchar(255) NOT NULL,
  `birth_date` date NOT NULL,
  `address` text NOT NULL,
  `domisili` varchar(255) NOT NULL,
  `kode_pos` varchar(255) NOT NULL,
  `p_number` varchar(255) NOT NULL,
  `t_number` varchar(255) DEFAULT NULL,
  `age` int(3) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `religion` varchar(255) NOT NULL,
  `last_education` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `experience` int(3) NOT NULL,
  `nilai_online` float DEFAULT NULL,
  `nilai_f2f` float DEFAULT NULL,
  `nilai_sikap` varchar(255) DEFAULT NULL,
  `status_passed` tinyint(4) NOT NULL DEFAULT '0',
  `nama_kerabat` varchar(255) NOT NULL,
  `nomor_kerabat` varchar(255) NOT NULL,
  `hubungan_kerabat` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_user` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_exam`
--

CREATE TABLE `users_exam` (
  `id` int(6) NOT NULL,
  `start_online` datetime NOT NULL,
  `end_online` datetime NOT NULL,
  `start_f2f` datetime NOT NULL,
  `end_f2f` datetime NOT NULL,
  `id_user` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ability`
--
ALTER TABLE `ability`
  ADD PRIMARY KEY (`id_ability`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `admins_sesi`
--
ALTER TABLE `admins_sesi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `algoritma`
--
ALTER TABLE `algoritma`
  ADD PRIMARY KEY (`id_algo`);

--
-- Indexes for table `dataset`
--
ALTER TABLE `dataset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id_job`);

--
-- Indexes for table `question_f2f`
--
ALTER TABLE `question_f2f`
  ADD PRIMARY KEY (`id_question`);

--
-- Indexes for table `question_online`
--
ALTER TABLE `question_online`
  ADD PRIMARY KEY (`id_question`);

--
-- Indexes for table `required_ability`
--
ALTER TABLE `required_ability`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `selection_stage`
--
ALTER TABLE `selection_stage`
  ADD PRIMARY KEY (`id_stage`);

--
-- Indexes for table `selection_stage_detail`
--
ALTER TABLE `selection_stage_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standard_ability`
--
ALTER TABLE `standard_ability`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standard_age`
--
ALTER TABLE `standard_age`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standard_buta_warna`
--
ALTER TABLE `standard_buta_warna`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standard_education`
--
ALTER TABLE `standard_education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standard_experience`
--
ALTER TABLE `standard_experience`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standard_f2f`
--
ALTER TABLE `standard_f2f`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standard_online`
--
ALTER TABLE `standard_online`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standard_qualification`
--
ALTER TABLE `standard_qualification`
  ADD PRIMARY KEY (`id_std`);

--
-- Indexes for table `standard_sikap`
--
ALTER TABLE `standard_sikap`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standard_status`
--
ALTER TABLE `standard_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `users_ability`
--
ALTER TABLE `users_ability`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_detail`
--
ALTER TABLE `users_detail`
  ADD PRIMARY KEY (`id_d_user`);

--
-- Indexes for table `users_exam`
--
ALTER TABLE `users_exam`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ability`
--
ALTER TABLE `ability`
  MODIFY `id_ability` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id_admin` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `admins_sesi`
--
ALTER TABLE `admins_sesi`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `algoritma`
--
ALTER TABLE `algoritma`
  MODIFY `id_algo` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dataset`
--
ALTER TABLE `dataset`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id_job` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `question_f2f`
--
ALTER TABLE `question_f2f`
  MODIFY `id_question` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `question_online`
--
ALTER TABLE `question_online`
  MODIFY `id_question` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `required_ability`
--
ALTER TABLE `required_ability`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `selection_stage`
--
ALTER TABLE `selection_stage`
  MODIFY `id_stage` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `selection_stage_detail`
--
ALTER TABLE `selection_stage_detail`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `standard_ability`
--
ALTER TABLE `standard_ability`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `standard_age`
--
ALTER TABLE `standard_age`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `standard_buta_warna`
--
ALTER TABLE `standard_buta_warna`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `standard_education`
--
ALTER TABLE `standard_education`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `standard_experience`
--
ALTER TABLE `standard_experience`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `standard_f2f`
--
ALTER TABLE `standard_f2f`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `standard_online`
--
ALTER TABLE `standard_online`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `standard_qualification`
--
ALTER TABLE `standard_qualification`
  MODIFY `id_std` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `standard_sikap`
--
ALTER TABLE `standard_sikap`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `standard_status`
--
ALTER TABLE `standard_status`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users_ability`
--
ALTER TABLE `users_ability`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `users_detail`
--
ALTER TABLE `users_detail`
  MODIFY `id_d_user` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users_exam`
--
ALTER TABLE `users_exam`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
