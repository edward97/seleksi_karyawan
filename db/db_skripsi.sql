-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2018 at 03:34 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.1.16

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
(2, 'Algoritma', '2018-06-26 11:28:27', '2018-08-17 04:40:20'),
(10, 'Coding C#', '2018-06-26 16:05:22', '2018-06-26 09:05:22'),
(17, 'Bahasa Inggris - Aktif', '2018-06-30 21:01:51', '2018-07-02 18:30:25'),
(18, 'Bahasa Inggris - Pasif', '2018-07-03 01:30:36', '2018-07-02 18:30:36'),
(20, 'Matematika Dasar', '2018-07-03 01:31:09', '2018-07-02 18:31:09'),
(21, 'Akuntansi Dasar', '2018-07-03 01:31:45', '2018-07-02 18:31:45'),
(22, 'Mampu Bekerja dibawah Tekanan', '2018-07-03 01:31:57', '2018-07-02 18:31:57'),
(23, 'Microsoft (Word, Excel, Powerpoint)', '2018-07-03 01:32:15', '2018-07-02 18:32:15'),
(24, 'Coding Java', '2018-07-03 01:32:28', '2018-07-02 18:32:28'),
(27, 'Coding PHP', '2018-08-20 21:05:23', '2018-08-20 14:05:23'),
(28, 'HTML Dasar', '2018-08-20 21:05:37', '2018-08-20 14:05:37'),
(29, 'Memahami dan Membuat Laporan Keuangan', '2018-08-20 21:05:53', '2018-08-20 14:06:07'),
(30, 'Akuntansi Perpajakan', '2018-08-20 21:06:16', '2018-08-20 14:06:16'),
(32, 'Mampu mengoperasikan aplikasi e-Faktur', '2018-08-20 21:06:49', '2018-08-20 14:06:49'),
(33, 'Mampu mengoperasikan aplikasi SAP', '2018-08-20 21:06:57', '2018-08-20 14:06:57');

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
(6, 'ccdnkz', 'ccdnkz@mail.com', '856e22b06868660656e0e6fff975a8d9', 'IT Support', 1, '2018-06-23 13:14:04', '2018-08-20 22:18:12'),
(7, 'Edward', 'esj@mail.com', '5f0713b7c76ee9285a14984eeb332f43', 'IT Maintenance', 1, '2018-06-27 16:26:07', '2018-08-20 22:18:16'),
(13, 'Admin', 'admin@mail.com', '21232f297a57a5a743894a0e4a801fc3', 'IT UI IX', 1, '2018-06-30 21:03:01', '2018-08-20 22:18:20'),
(14, 'Ryan', 'ryan@mail.com', '5f0713b7c76ee9285a14984eeb332f43', 'IT Tech', 1, '2018-06-30 21:59:08', '2018-08-17 08:36:44');

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

-- --------------------------------------------------------

--
-- Table structure for table `akurasi_c45_rule`
--

CREATE TABLE `akurasi_c45_rule` (
  `id` int(6) NOT NULL,
  `atribut` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `link` int(6) DEFAULT NULL,
  `keputusan` varchar(255) DEFAULT NULL,
  `atribut_cek` text NOT NULL,
  `label_cek` text NOT NULL,
  `status_hitung` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `akurasi_c45_rule`
--

INSERT INTO `akurasi_c45_rule` (`id`, `atribut`, `label`, `link`, `keputusan`, `atribut_cek`, `label_cek`, `status_hitung`) VALUES
(1, 'age', 'age', NULL, NULL, 'age~', '', '#ROOT'),
(2, 'age', '< 25', 1, NULL, 'age~', '=\"< 25\"~', 'stop_child'),
(3, 'age', '25-35', 1, NULL, 'age~', '=\"25-35\"~', 'stop_child'),
(4, 'age', '> 35', 1, NULL, 'age~', '=\"> 35\"~', 'stop_child'),
(5, 'status', 'status', 2, NULL, 'age~status~', '', '#ROOT'),
(6, 'status', 'lajang', 5, NULL, 'age~status~', '=\"< 25\"~=\"lajang\"~', 'stop_child'),
(7, 'status', 'menikah', 5, NULL, 'age~status~', '=\"< 25\"~=\"menikah\"~', 'stop_child'),
(8, 'last_education', 'last_education', 3, NULL, 'age~last_education~', '', '#ROOT'),
(9, 'last_education', 'sma', 8, NULL, 'age~last_education~', '=\"25-35\"~=\"sma\"~', 'stop_child'),
(10, 'last_education', 'akademi', 8, NULL, 'age~last_education~', '=\"25-35\"~=\"akademi\"~', 'stop_child'),
(11, 'last_education', 'sarjana', 8, NULL, 'age~last_education~', '=\"25-35\"~=\"sarjana\"~', 'stop_child'),
(12, 'last_education', 'pasca', 8, NULL, 'age~last_education~', '=\"25-35\"~=\"pasca\"~', 'stop_child'),
(13, 'experience', 'experience', 4, NULL, 'age~experience~', '', '#ROOT'),
(14, 'experience', '0 tahun', 13, NULL, 'age~experience~', '=\"> 35\"~=\"0 tahun\"~', 'stop_child'),
(15, 'experience', '1-2 tahun', 13, NULL, 'age~experience~', '=\"> 35\"~=\"1-2 tahun\"~', 'stop_child'),
(16, 'experience', '> 2 tahun', 13, NULL, 'age~experience~', '=\"> 35\"~=\"> 2 tahun\"~', 'stop_child'),
(17, 'nilai_f2f', 'nilai_f2f', 6, NULL, 'age~status~nilai_f2f~', '', '#ROOT'),
(18, 'nilai_f2f', '70-79', 17, NULL, 'age~status~nilai_f2f~', '=\"< 25\"~=\"lajang\"~=\"70-79\"~', 'stop_child'),
(19, 'nilai_f2f', '80-89', 17, 'lulus', 'age~status~nilai_f2f~', '=\"< 25\"~=\"lajang\"~=\"80-89\"~', 'lulus'),
(20, 'nilai_f2f', '90-100', 17, 'lulus', 'age~status~nilai_f2f~', '=\"< 25\"~=\"lajang\"~=\"90-100\"~', 'lulus'),
(21, 'nilai_f2f', 'nilai_f2f', 7, NULL, 'age~status~nilai_f2f~', '', '#ROOT'),
(22, 'nilai_f2f', '70-79', 21, 'lulus', 'age~status~nilai_f2f~', '=\"< 25\"~=\"menikah\"~=\"70-79\"~', 'lulus'),
(23, 'nilai_f2f', '80-89', 21, NULL, 'age~status~nilai_f2f~', '=\"< 25\"~=\"menikah\"~=\"80-89\"~', 'stop_child'),
(24, 'nilai_f2f', '90-100', 21, NULL, 'age~status~nilai_f2f~', '=\"< 25\"~=\"menikah\"~=\"90-100\"~', 'stop_child'),
(25, 'nilai_f2f', 'nilai_f2f', 9, NULL, 'age~last_education~nilai_f2f~', '', '#ROOT'),
(26, 'nilai_f2f', '70-79', 25, 'gagal', 'age~last_education~nilai_f2f~', '=\"25-35\"~=\"sma\"~=\"70-79\"~', 'gagal'),
(27, 'nilai_f2f', '80-89', 25, 'lulus', 'age~last_education~nilai_f2f~', '=\"25-35\"~=\"sma\"~=\"80-89\"~', 'lulus'),
(28, 'nilai_f2f', '90-100', 25, NULL, 'age~last_education~nilai_f2f~', '=\"25-35\"~=\"sma\"~=\"90-100\"~', 'stop_child'),
(29, 'status', 'status', 10, NULL, 'age~last_education~status~', '', '#ROOT'),
(30, 'status', 'lajang', 29, 'lulus', 'age~last_education~status~', '=\"25-35\"~=\"akademi\"~=\"lajang\"~', 'lulus'),
(31, 'status', 'menikah', 29, NULL, 'age~last_education~status~', '=\"25-35\"~=\"akademi\"~=\"menikah\"~', 'stop_child'),
(32, 'nilai_f2f', 'nilai_f2f', 11, NULL, 'age~last_education~nilai_f2f~', '', '#ROOT'),
(33, 'nilai_f2f', '70-79', 32, NULL, 'age~last_education~nilai_f2f~', '=\"25-35\"~=\"sarjana\"~=\"70-79\"~', 'stop_child'),
(34, 'nilai_f2f', '80-89', 32, 'lulus', 'age~last_education~nilai_f2f~', '=\"25-35\"~=\"sarjana\"~=\"80-89\"~', 'lulus'),
(35, 'nilai_f2f', '90-100', 32, 'lulus', 'age~last_education~nilai_f2f~', '=\"25-35\"~=\"sarjana\"~=\"90-100\"~', 'lulus'),
(36, 'nilai_sikap', 'nilai_sikap', 12, NULL, 'age~last_education~nilai_sikap~', '', '#ROOT'),
(37, 'nilai_sikap', 'cukup baik', 36, 'lulus', 'age~last_education~nilai_sikap~', '=\"25-35\"~=\"pasca\"~=\"cukup baik\"~', 'lulus'),
(38, 'nilai_sikap', 'baik', 36, NULL, 'age~last_education~nilai_sikap~', '=\"25-35\"~=\"pasca\"~=\"baik\"~', 'stop_child'),
(39, 'nilai_sikap', 'sangat baik', 36, NULL, 'age~last_education~nilai_sikap~', '=\"25-35\"~=\"pasca\"~=\"sangat baik\"~', 'stop_child'),
(40, 'nilai_sikap', 'nilai_sikap', 14, NULL, 'age~experience~nilai_sikap~', '', '#ROOT'),
(41, 'nilai_sikap', 'cukup baik', 40, 'gagal', 'age~experience~nilai_sikap~', '=\"> 35\"~=\"0 tahun\"~=\"cukup baik\"~', 'gagal'),
(42, 'nilai_sikap', 'baik', 40, NULL, 'age~experience~nilai_sikap~', '=\"> 35\"~=\"0 tahun\"~=\"baik\"~', 'stop_child'),
(43, 'nilai_sikap', 'sangat baik', 40, NULL, 'age~experience~nilai_sikap~', '=\"> 35\"~=\"0 tahun\"~=\"sangat baik\"~', 'stop_child'),
(44, 'total_ability', 'total_ability', 15, NULL, 'age~experience~total_ability~', '', '#ROOT'),
(45, 'total_ability', '5-7', 44, 'lulus', 'age~experience~total_ability~', '=\"> 35\"~=\"1-2 tahun\"~=\"5-7\"~', 'lulus'),
(46, 'total_ability', '8-10', 44, NULL, 'age~experience~total_ability~', '=\"> 35\"~=\"1-2 tahun\"~=\"8-10\"~', 'stop_child'),
(47, 'nilai_online', 'nilai_online', 16, NULL, 'age~experience~nilai_online~', '', '#ROOT'),
(48, 'nilai_online', '70-79', 47, 'gagal', 'age~experience~nilai_online~', '=\"> 35\"~=\"> 2 tahun\"~=\"70-79\"~', 'gagal'),
(49, 'nilai_online', '80-89', 47, NULL, 'age~experience~nilai_online~', '=\"> 35\"~=\"> 2 tahun\"~=\"80-89\"~', 'stop_child'),
(50, 'nilai_online', '90-100', 47, 'gagal', 'age~experience~nilai_online~', '=\"> 35\"~=\"> 2 tahun\"~=\"90-100\"~', 'gagal'),
(51, 'experience', 'experience', 18, NULL, 'age~status~nilai_f2f~experience~', '', '#ROOT'),
(52, 'experience', '0 tahun', 51, 'gagal', 'age~status~nilai_f2f~experience~', '=\"< 25\"~=\"lajang\"~=\"70-79\"~=\"0 tahun\"~', 'gagal'),
(53, 'experience', '1-2 tahun', 51, '#SKIP', 'age~status~nilai_f2f~experience~', '=\"< 25\"~=\"lajang\"~=\"70-79\"~=\"1-2 tahun\"~', '#SKIP'),
(54, 'experience', '> 2 tahun', 51, 'lulus', 'age~status~nilai_f2f~experience~', '=\"< 25\"~=\"lajang\"~=\"70-79\"~=\"> 2 tahun\"~', 'lulus'),
(55, 'nilai_sikap', 'nilai_sikap', 23, NULL, 'age~status~nilai_f2f~nilai_sikap~', '', '#ROOT'),
(56, 'nilai_sikap', 'cukup baik', 55, '#SKIP', 'age~status~nilai_f2f~nilai_sikap~', '=\"< 25\"~=\"menikah\"~=\"80-89\"~=\"cukup baik\"~', '#SKIP'),
(57, 'nilai_sikap', 'baik', 55, 'lulus', 'age~status~nilai_f2f~nilai_sikap~', '=\"< 25\"~=\"menikah\"~=\"80-89\"~=\"baik\"~', 'lulus'),
(58, 'nilai_sikap', 'sangat baik', 55, 'gagal', 'age~status~nilai_f2f~nilai_sikap~', '=\"< 25\"~=\"menikah\"~=\"80-89\"~=\"sangat baik\"~', 'gagal'),
(59, 'experience', 'experience', 24, NULL, 'age~status~nilai_f2f~experience~', '', '#ROOT'),
(60, 'experience', '0 tahun', 59, NULL, 'age~status~nilai_f2f~experience~', '=\"< 25\"~=\"menikah\"~=\"90-100\"~=\"0 tahun\"~', 'stop_child'),
(61, 'experience', '1-2 tahun', 59, 'gagal', 'age~status~nilai_f2f~experience~', '=\"< 25\"~=\"menikah\"~=\"90-100\"~=\"1-2 tahun\"~', 'gagal'),
(62, 'experience', '> 2 tahun', 59, 'gagal', 'age~status~nilai_f2f~experience~', '=\"< 25\"~=\"menikah\"~=\"90-100\"~=\"> 2 tahun\"~', 'gagal'),
(63, 'experience', 'experience', 28, NULL, 'age~last_education~nilai_f2f~experience~', '', '#ROOT'),
(64, 'experience', '0 tahun', 63, 'lulus', 'age~last_education~nilai_f2f~experience~', '=\"25-35\"~=\"sma\"~=\"90-100\"~=\"0 tahun\"~', 'lulus'),
(65, 'experience', '1-2 tahun', 63, 'gagal', 'age~last_education~nilai_f2f~experience~', '=\"25-35\"~=\"sma\"~=\"90-100\"~=\"1-2 tahun\"~', 'gagal'),
(66, 'experience', '> 2 tahun', 63, 'gagal', 'age~last_education~nilai_f2f~experience~', '=\"25-35\"~=\"sma\"~=\"90-100\"~=\"> 2 tahun\"~', 'gagal'),
(67, 'experience', 'experience', 31, NULL, 'age~last_education~status~experience~', '', '#ROOT'),
(68, 'experience', '0 tahun', 67, 'lulus', 'age~last_education~status~experience~', '=\"25-35\"~=\"akademi\"~=\"menikah\"~=\"0 tahun\"~', 'lulus'),
(69, 'experience', '1-2 tahun', 67, '#SKIP', 'age~last_education~status~experience~', '=\"25-35\"~=\"akademi\"~=\"menikah\"~=\"1-2 tahun\"~', '#SKIP'),
(70, 'experience', '> 2 tahun', 67, 'gagal', 'age~last_education~status~experience~', '=\"25-35\"~=\"akademi\"~=\"menikah\"~=\"> 2 tahun\"~', 'gagal'),
(71, 'total_ability', 'total_ability', 33, NULL, 'age~last_education~nilai_f2f~total_ability~', '', '#ROOT'),
(72, 'total_ability', '5-7', 71, 'lulus', 'age~last_education~nilai_f2f~total_ability~', '=\"25-35\"~=\"sarjana\"~=\"70-79\"~=\"5-7\"~', 'lulus'),
(73, 'total_ability', '8-10', 71, 'gagal', 'age~last_education~nilai_f2f~total_ability~', '=\"25-35\"~=\"sarjana\"~=\"70-79\"~=\"8-10\"~', 'gagal'),
(74, 'experience', 'experience', 38, NULL, 'age~last_education~nilai_sikap~experience~', '', '#ROOT'),
(75, 'experience', '0 tahun', 74, 'gagal', 'age~last_education~nilai_sikap~experience~', '=\"25-35\"~=\"pasca\"~=\"baik\"~=\"0 tahun\"~', 'gagal'),
(76, 'experience', '1-2 tahun', 74, 'gagal', 'age~last_education~nilai_sikap~experience~', '=\"25-35\"~=\"pasca\"~=\"baik\"~=\"1-2 tahun\"~', 'gagal'),
(77, 'experience', '> 2 tahun', 74, 'lulus', 'age~last_education~nilai_sikap~experience~', '=\"25-35\"~=\"pasca\"~=\"baik\"~=\"> 2 tahun\"~', 'lulus'),
(78, 'experience', 'experience', 39, NULL, 'age~last_education~nilai_sikap~experience~', '', '#ROOT'),
(79, 'experience', '0 tahun', 78, 'lulus', 'age~last_education~nilai_sikap~experience~', '=\"25-35\"~=\"pasca\"~=\"sangat baik\"~=\"0 tahun\"~', 'lulus'),
(80, 'experience', '1-2 tahun', 78, 'lulus', 'age~last_education~nilai_sikap~experience~', '=\"25-35\"~=\"pasca\"~=\"sangat baik\"~=\"1-2 tahun\"~', 'lulus'),
(81, 'experience', '> 2 tahun', 78, 'gagal', 'age~last_education~nilai_sikap~experience~', '=\"25-35\"~=\"pasca\"~=\"sangat baik\"~=\"> 2 tahun\"~', 'gagal'),
(82, 'last_education', 'last_education', 42, NULL, 'age~experience~nilai_sikap~last_education~', '', '#ROOT'),
(83, 'last_education', 'sma', 82, '#SKIP', 'age~experience~nilai_sikap~last_education~', '=\"> 35\"~=\"0 tahun\"~=\"baik\"~=\"sma\"~', '#SKIP'),
(84, 'last_education', 'akademi', 82, 'gagal', 'age~experience~nilai_sikap~last_education~', '=\"> 35\"~=\"0 tahun\"~=\"baik\"~=\"akademi\"~', 'gagal'),
(85, 'last_education', 'sarjana', 82, 'lulus', 'age~experience~nilai_sikap~last_education~', '=\"> 35\"~=\"0 tahun\"~=\"baik\"~=\"sarjana\"~', 'lulus'),
(86, 'last_education', 'pasca', 82, '#SKIP', 'age~experience~nilai_sikap~last_education~', '=\"> 35\"~=\"0 tahun\"~=\"baik\"~=\"pasca\"~', '#SKIP'),
(87, 'status', 'status', 43, NULL, 'age~experience~nilai_sikap~status~', '', '#ROOT'),
(88, 'status', 'lajang', 87, NULL, 'age~experience~nilai_sikap~status~', '=\"> 35\"~=\"0 tahun\"~=\"sangat baik\"~=\"lajang\"~', 'stop_child'),
(89, 'status', 'menikah', 87, 'lulus', 'age~experience~nilai_sikap~status~', '=\"> 35\"~=\"0 tahun\"~=\"sangat baik\"~=\"menikah\"~', 'lulus'),
(90, 'nilai_online', 'nilai_online', 46, NULL, 'age~experience~total_ability~nilai_online~', '', '#ROOT'),
(91, 'nilai_online', '70-79', 90, NULL, 'age~experience~total_ability~nilai_online~', '=\"> 35\"~=\"1-2 tahun\"~=\"8-10\"~=\"70-79\"~', 'stop_child'),
(92, 'nilai_online', '80-89', 90, 'gagal', 'age~experience~total_ability~nilai_online~', '=\"> 35\"~=\"1-2 tahun\"~=\"8-10\"~=\"80-89\"~', 'gagal'),
(93, 'nilai_online', '90-100', 90, NULL, 'age~experience~total_ability~nilai_online~', '=\"> 35\"~=\"1-2 tahun\"~=\"8-10\"~=\"90-100\"~', 'stop_child'),
(94, 'last_education', 'last_education', 49, NULL, 'age~experience~nilai_online~last_education~', '', '#ROOT'),
(95, 'last_education', 'sma', 94, 'lulus', 'age~experience~nilai_online~last_education~', '=\"> 35\"~=\"> 2 tahun\"~=\"80-89\"~=\"sma\"~', 'lulus'),
(96, 'last_education', 'akademi', 94, '#SKIP', 'age~experience~nilai_online~last_education~', '=\"> 35\"~=\"> 2 tahun\"~=\"80-89\"~=\"akademi\"~', '#SKIP'),
(97, 'last_education', 'sarjana', 94, 'gagal', 'age~experience~nilai_online~last_education~', '=\"> 35\"~=\"> 2 tahun\"~=\"80-89\"~=\"sarjana\"~', 'gagal'),
(98, 'last_education', 'pasca', 94, '#SKIP', 'age~experience~nilai_online~last_education~', '=\"> 35\"~=\"> 2 tahun\"~=\"80-89\"~=\"pasca\"~', '#SKIP'),
(99, 'last_education', 'last_education', 60, NULL, 'age~status~nilai_f2f~experience~last_education~', '', '#ROOT'),
(100, 'last_education', 'sma', 99, '#SKIP', 'age~status~nilai_f2f~experience~last_education~', '=\"< 25\"~=\"menikah\"~=\"90-100\"~=\"0 tahun\"~=\"sma\"~', '#SKIP'),
(101, 'last_education', 'akademi', 99, '#SKIP', 'age~status~nilai_f2f~experience~last_education~', '=\"< 25\"~=\"menikah\"~=\"90-100\"~=\"0 tahun\"~=\"akademi\"~', '#SKIP'),
(102, 'last_education', 'sarjana', 99, 'gagal', 'age~status~nilai_f2f~experience~last_education~', '=\"< 25\"~=\"menikah\"~=\"90-100\"~=\"0 tahun\"~=\"sarjana\"~', 'gagal'),
(103, 'last_education', 'pasca', 99, 'lulus', 'age~status~nilai_f2f~experience~last_education~', '=\"< 25\"~=\"menikah\"~=\"90-100\"~=\"0 tahun\"~=\"pasca\"~', 'lulus'),
(104, 'total_ability', 'total_ability', 88, NULL, 'age~experience~nilai_sikap~status~total_ability~', '', '#ROOT'),
(105, 'total_ability', '5-7', 104, 'lulus', 'age~experience~nilai_sikap~status~total_ability~', '=\"> 35\"~=\"0 tahun\"~=\"sangat baik\"~=\"lajang\"~=\"5-7\"~', 'lulus'),
(106, 'total_ability', '8-10', 104, 'gagal', 'age~experience~nilai_sikap~status~total_ability~', '=\"> 35\"~=\"0 tahun\"~=\"sangat baik\"~=\"lajang\"~=\"8-10\"~', 'gagal'),
(107, 'status', 'status', 91, NULL, 'age~experience~total_ability~nilai_online~status~', '', '#ROOT'),
(108, 'status', 'lajang', 107, NULL, 'age~experience~total_ability~nilai_online~status~', '=\"> 35\"~=\"1-2 tahun\"~=\"8-10\"~=\"70-79\"~=\"lajang\"~', 'stop_child'),
(109, 'status', 'menikah', 107, 'lulus', 'age~experience~total_ability~nilai_online~status~', '=\"> 35\"~=\"1-2 tahun\"~=\"8-10\"~=\"70-79\"~=\"menikah\"~', 'lulus'),
(110, 'last_education', 'last_education', 93, NULL, 'age~experience~total_ability~nilai_online~last_education~', '', '#ROOT'),
(111, 'last_education', 'sma', 110, 'gagal', 'age~experience~total_ability~nilai_online~last_education~', '=\"> 35\"~=\"1-2 tahun\"~=\"8-10\"~=\"90-100\"~=\"sma\"~', 'gagal'),
(112, 'last_education', 'akademi', 110, 'gagal', 'age~experience~total_ability~nilai_online~last_education~', '=\"> 35\"~=\"1-2 tahun\"~=\"8-10\"~=\"90-100\"~=\"akademi\"~', 'gagal'),
(113, 'last_education', 'sarjana', 110, 'lulus', 'age~experience~total_ability~nilai_online~last_education~', '=\"> 35\"~=\"1-2 tahun\"~=\"8-10\"~=\"90-100\"~=\"sarjana\"~', 'lulus'),
(114, 'last_education', 'pasca', 110, '#SKIP', 'age~experience~total_ability~nilai_online~last_education~', '=\"> 35\"~=\"1-2 tahun\"~=\"8-10\"~=\"90-100\"~=\"pasca\"~', '#SKIP'),
(115, 'nilai_sikap', 'nilai_sikap', 108, NULL, 'age~experience~total_ability~nilai_online~status~nilai_sikap~', '', '#ROOT'),
(116, 'nilai_sikap', 'cukup baik', 115, 'gagal', 'age~experience~total_ability~nilai_online~status~nilai_sikap~', '=\"> 35\"~=\"1-2 tahun\"~=\"8-10\"~=\"70-79\"~=\"lajang\"~=\"cukup baik\"~', 'gagal'),
(117, 'nilai_sikap', 'baik', 115, 'gagal', 'age~experience~total_ability~nilai_online~status~nilai_sikap~', '=\"> 35\"~=\"1-2 tahun\"~=\"8-10\"~=\"70-79\"~=\"lajang\"~=\"baik\"~', 'gagal'),
(118, 'nilai_sikap', 'sangat baik', 115, 'lulus', 'age~experience~total_ability~nilai_online~status~nilai_sikap~', '=\"> 35\"~=\"1-2 tahun\"~=\"8-10\"~=\"70-79\"~=\"lajang\"~=\"sangat baik\"~', 'lulus');

-- --------------------------------------------------------

--
-- Table structure for table `akurasi_cart_rule`
--

CREATE TABLE `akurasi_cart_rule` (
  `id` int(6) NOT NULL,
  `atribut` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `left_keputusan` varchar(255) DEFAULT NULL,
  `right_keputusan` varchar(255) DEFAULT NULL,
  `keputusan` varchar(255) DEFAULT NULL,
  `link` int(6) DEFAULT NULL,
  `status_hitung` varchar(255) NOT NULL,
  `atribut_cek` text NOT NULL,
  `label_kiri` text NOT NULL,
  `label_kanan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `akurasi_cart_rule`
--

INSERT INTO `akurasi_cart_rule` (`id`, `atribut`, `label`, `left_keputusan`, `right_keputusan`, `keputusan`, `link`, `status_hitung`, `atribut_cek`, `label_kiri`, `label_kanan`) VALUES
(1, 'nilai_f2f', 'nilai_f2f', '=\"70-79\"', '!=\"70-79\"', NULL, NULL, 'root', '', '', ''),
(2, 'experience', '=\"70-79\"', '=\"1-2 tahun\"', '!=\"1-2 tahun\"', NULL, 1, 'stop', 'nilai_f2f~experience~', '=\"70-79\"~=\"1-2 tahun\"~', '=\"70-79\"~!=\"1-2 tahun\"~'),
(3, 'last_education', '!=\"70-79\"', '=\"sarjana\"', '!=\"sarjana\"', NULL, 1, 'stop', 'nilai_f2f~last_education~', '!=\"70-79\"~=\"sarjana\"~', '!=\"70-79\"~!=\"sarjana\"~'),
(4, 'last_education', '=\"1-2 tahun\"', '=\"pasca\"', '!=\"pasca\"', NULL, 2, 'stop', 'nilai_f2f~experience~~last_education~', '=\"70-79\"~=\"1-2 tahun\"~~=\"pasca\"~', '=\"70-79\"~=\"1-2 tahun\"~~!=\"pasca\"~'),
(5, 'nilai_sikap', '!=\"1-2 tahun\"', '=\"sangat baik\"', '!=\"sangat baik\"', NULL, 2, 'stop', 'nilai_f2f~experience~~nilai_sikap~', '=\"70-79\"~!=\"1-2 tahun\"~~=\"sangat baik\"~', '=\"70-79\"~!=\"1-2 tahun\"~~!=\"sangat baik\"~'),
(6, 'nilai_sikap', '=\"sarjana\"', 'baik', NULL, 'lulus', 3, 'stop', '', '', ''),
(7, 'nilai_sikap', '=\"sarjana\"', NULL, '!=\"baik\"', NULL, 3, 'stop', 'nilai_f2f~last_education~~nilai_sikap~', '', '!=\"70-79\"~=\"sarjana\"~~!=\"baik\"~'),
(8, 'last_education', '!=\"sarjana\"', '=\"akademi\"', '!=\"akademi\"', NULL, 3, 'stop', 'nilai_f2f~last_education~~last_education~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~'),
(9, 'status', '=\"pasca\"', 'lajang', NULL, 'gagal', 4, 'stop', '', '', ''),
(10, 'status', '=\"pasca\"', NULL, '!=\"lajang\"', NULL, 4, 'stop', 'nilai_f2f~experience~~last_education~~status~', '', '=\"70-79\"~=\"1-2 tahun\"~~=\"pasca\"~~!=\"lajang\"~'),
(11, 'age', '!=\"pasca\"', '=\"< 25\"', NULL, NULL, 4, 'stop', 'nilai_f2f~experience~~last_education~~age~', '=\"70-79\"~=\"1-2 tahun\"~~!=\"pasca\"~~=\"< 25\"~', ''),
(12, 'age', '!=\"pasca\"', NULL, '< 25', 'gagal', 4, 'stop', '', '', ''),
(13, 'status', '=\"sangat baik\"', '=\"lajang\"', '!=\"lajang\"', NULL, 5, 'stop', 'nilai_f2f~experience~~nilai_sikap~~status~', '=\"70-79\"~!=\"1-2 tahun\"~~=\"sangat baik\"~~=\"lajang\"~', '=\"70-79\"~!=\"1-2 tahun\"~~=\"sangat baik\"~~!=\"lajang\"~'),
(14, 'nilai_online', '!=\"sangat baik\"', NULL, '!=\"80-89\"', NULL, 5, 'stop', 'nilai_f2f~experience~~nilai_sikap~~nilai_online~', '', '=\"70-79\"~!=\"1-2 tahun\"~~!=\"sangat baik\"~~!=\"80-89\"~'),
(15, 'experience', '!=\"baik\"', '1-2 tahun', NULL, 'lulus', 7, 'stop', '', '', ''),
(16, 'experience', '!=\"baik\"', NULL, '!=\"1-2 tahun\"', NULL, 7, 'stop', 'nilai_f2f~last_education~~nilai_sikap~~experience~', '', '!=\"70-79\"~=\"sarjana\"~~!=\"baik\"~~!=\"1-2 tahun\"~'),
(17, 'nilai_f2f', '=\"akademi\"', '=\"80-89\"', '!=\"80-89\"', NULL, 8, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~=\"80-89\"~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~'),
(18, 'experience', '!=\"akademi\"', '=\"1-2 tahun\"', '!=\"1-2 tahun\"', NULL, 8, 'stop', 'nilai_f2f~last_education~~last_education~~experience~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~'),
(19, 'total_ability', '!=\"lajang\"', '5-7', NULL, 'gagal', 10, 'stop', '', '', ''),
(20, 'total_ability', '!=\"lajang\"', NULL, '!=\"5-7\"', NULL, 10, 'stop', 'nilai_f2f~experience~~last_education~~status~~total_ability~', '', '=\"70-79\"~=\"1-2 tahun\"~~=\"pasca\"~~!=\"lajang\"~~!=\"5-7\"~'),
(21, 'total_ability', '=\"< 25\"', '5-7', NULL, 'lulus', 11, 'stop', '', '', ''),
(22, 'total_ability', '=\"< 25\"', NULL, '5-7', 'gagal', 11, 'stop', '', '', ''),
(23, 'age', '=\"lajang\"', '=\"> 35\"', NULL, NULL, 13, 'stop', 'nilai_f2f~experience~~nilai_sikap~~status~~age~', '=\"70-79\"~!=\"1-2 tahun\"~~=\"sangat baik\"~~=\"lajang\"~~=\"> 35\"~', ''),
(24, 'age', '=\"lajang\"', NULL, '> 35', 'lulus', 13, 'stop', '', '', ''),
(25, 'age', '!=\"lajang\"', '> 35', NULL, 'gagal', 13, 'stop', '', '', ''),
(26, 'age', '!=\"lajang\"', NULL, '!=\"> 35\"', NULL, 13, 'stop', 'nilai_f2f~experience~~nilai_sikap~~status~~age~', '', '=\"70-79\"~!=\"1-2 tahun\"~~=\"sangat baik\"~~!=\"lajang\"~~!=\"> 35\"~'),
(27, 'age', '!=\"80-89\"', '=\"25-35\"', '!=\"25-35\"', NULL, 14, 'stop', 'nilai_f2f~experience~~nilai_sikap~~nilai_online~~age~', '=\"70-79\"~!=\"1-2 tahun\"~~!=\"sangat baik\"~~!=\"80-89\"~~=\"25-35\"~', '=\"70-79\"~!=\"1-2 tahun\"~~!=\"sangat baik\"~~!=\"80-89\"~~!=\"25-35\"~'),
(28, 'nilai_online', '!=\"1-2 tahun\"', NULL, '!=\"70-79\"', NULL, 16, 'stop', 'nilai_f2f~last_education~~nilai_sikap~~experience~~nilai_online~', '', '!=\"70-79\"~=\"sarjana\"~~!=\"baik\"~~!=\"1-2 tahun\"~~!=\"70-79\"~'),
(29, 'age', '=\"80-89\"', '=\"25-35\"', NULL, NULL, 17, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~~age~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~=\"80-89\"~~=\"25-35\"~', ''),
(30, 'age', '=\"80-89\"', NULL, '25-35', 'lulus', 17, 'stop', '', '', ''),
(31, 'nilai_sikap', '!=\"80-89\"', '=\"cukup baik\"', '!=\"cukup baik\"', NULL, 17, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~~nilai_sikap~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~~=\"cukup baik\"~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~~!=\"cukup baik\"~'),
(32, 'total_ability', '=\"1-2 tahun\"', '=\"5-7\"', '!=\"5-7\"', NULL, 18, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~=\"5-7\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~'),
(33, 'total_ability', '!=\"1-2 tahun\"', '=\"5-7\"', '!=\"5-7\"', NULL, 18, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~'),
(34, 'age', '!=\"5-7\"', NULL, '!=\"< 25\"', NULL, 20, '#DataTidakJelas', 'nilai_f2f~experience~~last_education~~status~~total_ability~~age~', '', '=\"70-79\"~=\"1-2 tahun\"~~=\"pasca\"~~!=\"lajang\"~~!=\"5-7\"~~!=\"< 25\"~'),
(35, 'last_education', '=\"> 35\"', 'sma', NULL, 'gagal', 23, 'stop', '', '', ''),
(36, 'last_education', '=\"> 35\"', NULL, 'sma', 'lulus', 23, 'stop', '', '', ''),
(37, 'total_ability', '!=\"> 35\"', '5-7', NULL, 'lulus', 26, 'stop', '', '', ''),
(38, 'total_ability', '!=\"> 35\"', NULL, '5-7', 'gagal', 26, 'stop', '', '', ''),
(39, 'nilai_online', '=\"25-35\"', '=\"70-79\"', NULL, NULL, 27, 'stop', 'nilai_f2f~experience~~nilai_sikap~~nilai_online~~age~~nilai_online~', '=\"70-79\"~!=\"1-2 tahun\"~~!=\"sangat baik\"~~!=\"80-89\"~~=\"25-35\"~~=\"70-79\"~', ''),
(40, 'nilai_online', '=\"25-35\"', NULL, '70-79', 'gagal', 27, 'stop', '', '', ''),
(41, 'last_education', '!=\"25-35\"', '=\"akademi\"', NULL, NULL, 27, 'stop', 'nilai_f2f~experience~~nilai_sikap~~nilai_online~~age~~last_education~', '=\"70-79\"~!=\"1-2 tahun\"~~!=\"sangat baik\"~~!=\"80-89\"~~!=\"25-35\"~~=\"akademi\"~', ''),
(42, 'last_education', '!=\"25-35\"', NULL, 'akademi', 'gagal', 27, 'stop', '', '', ''),
(43, 'age', '!=\"70-79\"', '25-35', NULL, 'lulus', 28, 'stop', '', '', ''),
(44, 'age', '!=\"70-79\"', NULL, '!=\"25-35\"', NULL, 28, 'stop', 'nilai_f2f~last_education~~nilai_sikap~~experience~~nilai_online~~age~', '', '!=\"70-79\"~=\"sarjana\"~~!=\"baik\"~~!=\"1-2 tahun\"~~!=\"70-79\"~~!=\"25-35\"~'),
(45, 'nilai_sikap', '=\"25-35\"', 'cukup baik', NULL, 'lulus', 29, 'stop', '', '', ''),
(46, 'nilai_sikap', '=\"25-35\"', NULL, 'cukup baik', 'gagal', 29, 'stop', '', '', ''),
(47, 'age', '=\"cukup baik\"', '=\"> 35\"', NULL, NULL, 31, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~~nilai_sikap~~age~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~~=\"cukup baik\"~~=\"> 35\"~', ''),
(48, 'age', '=\"cukup baik\"', NULL, '> 35', 'lulus', 31, 'stop', '', '', ''),
(49, 'total_ability', '!=\"cukup baik\"', '=\"5-7\"', NULL, NULL, 31, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~~nilai_sikap~~total_ability~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~~!=\"cukup baik\"~~=\"5-7\"~', ''),
(50, 'total_ability', '!=\"cukup baik\"', NULL, '5-7', 'gagal', 31, 'stop', '', '', ''),
(51, 'age', '=\"5-7\"', '=\"> 35\"', NULL, NULL, 32, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~age~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~=\"5-7\"~~=\"> 35\"~', ''),
(52, 'age', '=\"5-7\"', NULL, '> 35', 'gagal', 32, 'stop', '', '', ''),
(53, 'nilai_sikap', '!=\"5-7\"', '=\"sangat baik\"', '!=\"sangat baik\"', NULL, 32, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_sikap~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~~=\"sangat baik\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sangat baik\"~'),
(54, 'last_education', '=\"5-7\"', '=\"sma\"', '!=\"sma\"', NULL, 33, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~=\"sma\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~!=\"sma\"~'),
(55, 'last_education', '!=\"5-7\"', '=\"sma\"', '!=\"sma\"', NULL, 33, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~=\"sma\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sma\"~'),
(56, 'last_education', '=\"70-79\"', '=\"sma\"', '!=\"sma\"', NULL, 39, 'stop', 'nilai_f2f~experience~~nilai_sikap~~nilai_online~~age~~nilai_online~~last_education~', '=\"70-79\"~!=\"1-2 tahun\"~~!=\"sangat baik\"~~!=\"80-89\"~~=\"25-35\"~~=\"70-79\"~~=\"sma\"~', '=\"70-79\"~!=\"1-2 tahun\"~~!=\"sangat baik\"~~!=\"80-89\"~~=\"25-35\"~~=\"70-79\"~~!=\"sma\"~'),
(57, 'nilai_online', '=\"akademi\"', '70-79', NULL, 'gagal', 41, 'stop', '', '', ''),
(58, 'nilai_online', '=\"akademi\"', NULL, '70-79', 'lulus', 41, 'stop', '', '', ''),
(59, 'nilai_sikap', '!=\"25-35\"', 'cukup baik', NULL, 'gagal', 44, 'stop', '', '', ''),
(60, 'nilai_sikap', '!=\"25-35\"', NULL, '!=\"cukup baik\"', NULL, 44, 'stop', 'nilai_f2f~last_education~~nilai_sikap~~experience~~nilai_online~~age~~nilai_sikap~', '', '!=\"70-79\"~=\"sarjana\"~~!=\"baik\"~~!=\"1-2 tahun\"~~!=\"70-79\"~~!=\"25-35\"~~!=\"cukup baik\"~'),
(61, 'experience', '=\"> 35\"', '0 tahun', NULL, 'gagal', 47, 'stop', '', '', ''),
(62, 'experience', '=\"> 35\"', NULL, '0 tahun', 'lulus', 47, 'stop', '', '', ''),
(63, 'age', '=\"5-7\"', '< 25', NULL, 'lulus', 49, 'stop', '', '', ''),
(64, 'age', '=\"5-7\"', NULL, '< 25', 'gagal', 49, 'stop', '', '', ''),
(65, 'last_education', '=\"> 35\"', 'sma', NULL, 'lulus', 51, 'stop', '', '', ''),
(66, 'last_education', '=\"> 35\"', NULL, '!=\"sma\"', NULL, 51, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~age~~last_education~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~=\"5-7\"~~=\"> 35\"~~!=\"sma\"~'),
(67, 'status', '=\"sangat baik\"', 'lajang', NULL, 'lulus', 53, 'stop', '', '', ''),
(68, 'status', '=\"sangat baik\"', NULL, '!=\"lajang\"', NULL, 53, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_sikap~~status~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~~=\"sangat baik\"~~!=\"lajang\"~'),
(69, 'age', '!=\"sangat baik\"', '=\"25-35\"', NULL, NULL, 53, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_sikap~~age~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sangat baik\"~~=\"25-35\"~', ''),
(70, 'age', '!=\"sangat baik\"', NULL, '25-35', 'gagal', 53, 'stop', '', '', ''),
(71, 'experience', '=\"sma\"', '=\"0 tahun\"', '!=\"0 tahun\"', NULL, 54, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~experience~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~=\"sma\"~~=\"0 tahun\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~=\"sma\"~~!=\"0 tahun\"~'),
(72, 'age', '!=\"sma\"', '25-35', NULL, 'lulus', 54, 'stop', '', '', ''),
(73, 'age', '!=\"sma\"', NULL, '!=\"25-35\"', NULL, 54, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~age~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~!=\"sma\"~~!=\"25-35\"~'),
(74, 'status', '=\"sma\"', '=\"lajang\"', NULL, NULL, 55, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~status~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~=\"sma\"~~=\"lajang\"~', ''),
(75, 'status', '=\"sma\"', NULL, 'lajang', 'lulus', 55, 'stop', '', '', ''),
(76, 'nilai_f2f', '!=\"sma\"', '80-89', NULL, 'gagal', 55, 'stop', '', '', ''),
(77, 'nilai_f2f', '!=\"sma\"', NULL, '!=\"80-89\"', NULL, 55, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~nilai_f2f~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sma\"~~!=\"80-89\"~'),
(78, 'experience', '=\"sma\"', '0 tahun', NULL, 'gagal', 56, 'stop', '', '', ''),
(79, 'experience', '=\"sma\"', NULL, '0 tahun', 'lulus', 56, 'stop', '', '', ''),
(80, 'last_education', '!=\"sma\"', '=\"sarjana\"', NULL, NULL, 56, 'stop', 'nilai_f2f~experience~~nilai_sikap~~nilai_online~~age~~nilai_online~~last_education~~last_education~', '=\"70-79\"~!=\"1-2 tahun\"~~!=\"sangat baik\"~~!=\"80-89\"~~=\"25-35\"~~=\"70-79\"~~!=\"sma\"~~=\"sarjana\"~', ''),
(81, 'last_education', '!=\"sma\"', NULL, 'sarjana', 'lulus', 56, 'stop', '', '', ''),
(82, 'experience', '!=\"cukup baik\"', '0 tahun', NULL, 'lulus', 60, 'stop', '', '', ''),
(83, 'experience', '!=\"cukup baik\"', NULL, '!=\"0 tahun\"', NULL, 60, 'stop', 'nilai_f2f~last_education~~nilai_sikap~~experience~~nilai_online~~age~~nilai_sikap~~experience~', '', '!=\"70-79\"~=\"sarjana\"~~!=\"baik\"~~!=\"1-2 tahun\"~~!=\"70-79\"~~!=\"25-35\"~~!=\"cukup baik\"~~!=\"0 tahun\"~'),
(84, 'nilai_sikap', '!=\"sma\"', 'baik', NULL, 'lulus', 66, 'stop', '', '', ''),
(85, 'nilai_sikap', '!=\"sma\"', NULL, 'baik', 'gagal', 66, 'stop', '', '', ''),
(86, 'last_education', '!=\"lajang\"', 'sma', NULL, 'gagal', 68, 'stop', '', '', ''),
(87, 'last_education', '!=\"lajang\"', NULL, 'sma', 'lulus', 68, 'stop', '', '', ''),
(88, 'nilai_online', '=\"25-35\"', '70-79', NULL, 'gagal', 69, 'stop', '', '', ''),
(89, 'nilai_online', '=\"25-35\"', NULL, '70-79', 'lulus', 69, 'stop', '', '', ''),
(90, 'age', '=\"0 tahun\"', '=\"25-35\"', NULL, NULL, 71, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~experience~~age~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~=\"sma\"~~=\"0 tahun\"~~=\"25-35\"~', ''),
(91, 'age', '=\"0 tahun\"', NULL, '25-35', 'gagal', 71, 'stop', '', '', ''),
(92, 'age', '!=\"0 tahun\"', '25-35', NULL, 'gagal', 71, 'stop', '', '', ''),
(93, 'age', '!=\"0 tahun\"', NULL, '!=\"25-35\"', NULL, 71, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~experience~~age~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~=\"sma\"~~!=\"0 tahun\"~~!=\"25-35\"~'),
(94, 'nilai_sikap', '!=\"25-35\"', 'sangat baik', NULL, 'gagal', 73, 'stop', '', '', ''),
(95, 'nilai_sikap', '!=\"25-35\"', NULL, 'sangat baik', 'lulus', 73, 'stop', '', '', ''),
(96, 'nilai_sikap', '=\"lajang\"', 'cukup baik', NULL, 'lulus', 74, 'stop', '', '', ''),
(97, 'nilai_sikap', '=\"lajang\"', NULL, 'cukup baik', 'gagal', 74, 'stop', '', '', ''),
(98, 'age', '!=\"80-89\"', '< 25', NULL, 'lulus', 77, 'stop', '', '', ''),
(99, 'age', '!=\"80-89\"', NULL, '!=\"< 25\"', NULL, 77, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~nilai_f2f~~age~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sma\"~~!=\"80-89\"~~!=\"< 25\"~'),
(100, 'experience', '=\"sarjana\"', '0 tahun', NULL, 'lulus', 80, 'stop', '', '', ''),
(101, 'experience', '=\"sarjana\"', NULL, '0 tahun', 'gagal', 80, 'stop', '', '', ''),
(102, 'age', '!=\"0 tahun\"', '< 25', NULL, 'gagal', 83, 'stop', '', '', ''),
(103, 'age', '!=\"0 tahun\"', NULL, '< 25', 'lulus', 83, 'stop', '', '', ''),
(104, 'nilai_sikap', '=\"25-35\"', 'cukup baik', NULL, 'lulus', 90, 'stop', '', '', ''),
(105, 'nilai_sikap', '=\"25-35\"', NULL, 'cukup baik', 'gagal', 90, 'stop', '', '', ''),
(106, 'nilai_f2f', '!=\"25-35\"', '80-89', NULL, 'lulus', 93, 'stop', '', '', ''),
(107, 'nilai_f2f', '!=\"25-35\"', NULL, '80-89', 'lulus', 93, 'stop', '', '', ''),
(108, 'nilai_sikap', '!=\"< 25\"', 'sangat baik', NULL, 'lulus', 99, 'stop', '', '', ''),
(109, 'nilai_sikap', '!=\"< 25\"', NULL, '!=\"sangat baik\"', NULL, 99, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~nilai_f2f~~age~~nilai_sikap~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sma\"~~!=\"80-89\"~~!=\"< 25\"~~!=\"sangat baik\"~'),
(110, 'age', '!=\"sangat baik\"', '=\"25-35\"', NULL, NULL, 109, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~nilai_f2f~~age~~nilai_sikap~~age~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sma\"~~!=\"80-89\"~~!=\"< 25\"~~!=\"sangat baik\"~~=\"25-35\"~', ''),
(111, 'age', '!=\"sangat baik\"', NULL, '25-35', 'gagal', 109, 'stop', '', '', ''),
(112, 'nilai_sikap', '=\"25-35\"', 'cukup baik', NULL, 'lulus', 110, 'stop', '', '', ''),
(113, 'nilai_sikap', '=\"25-35\"', NULL, 'cukup baik', 'gagal', 110, 'stop', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `akurasi_data`
--

CREATE TABLE `akurasi_data` (
  `id` int(3) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `experience` varchar(255) NOT NULL,
  `last_education` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `total_ability` varchar(255) NOT NULL,
  `nilai_online` varchar(255) NOT NULL,
  `nilai_f2f` varchar(255) NOT NULL,
  `nilai_sikap` varchar(255) NOT NULL,
  `flag` tinyint(4) NOT NULL,
  `status_passed` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `akurasi_data`
--

INSERT INTO `akurasi_data` (`id`, `nama_lengkap`, `age`, `experience`, `last_education`, `status`, `total_ability`, `nilai_online`, `nilai_f2f`, `nilai_sikap`, `flag`, `status_passed`) VALUES
(1, 'Vernia', '< 25', '0 tahun', 'pasca', 'lajang', '8-10', '70-79', '70-79', 'baik', 1, 'gagal'),
(2, 'Layne', '< 25', '1-2 tahun', 'pasca', 'menikah', '8-10', '90-100', '90-100', 'baik', 1, 'gagal'),
(3, 'Neomi', '25-35', '0 tahun', 'akademi', 'lajang', '5-7', '70-79', '90-100', 'cukup baik', 1, 'lulus'),
(4, 'Hannah', '25-35', '0 tahun', 'sma', 'lajang', '5-7', '70-79', '70-79', 'baik', 1, 'gagal'),
(5, 'Alyson', '25-35', '> 2 tahun', 'akademi', 'menikah', '5-7', '80-89', '80-89', 'sangat baik', 1, 'gagal'),
(6, 'Emeline', '> 35', '> 2 tahun', 'pasca', 'menikah', '8-10', '70-79', '80-89', 'baik', 1, 'gagal'),
(7, 'Janae', '> 35', '> 2 tahun', 'sma', 'lajang', '5-7', '70-79', '70-79', 'cukup baik', 1, 'gagal'),
(8, 'Luciana', '> 35', '1-2 tahun', 'sarjana', 'lajang', '8-10', '90-100', '90-100', 'cukup baik', 1, 'lulus'),
(9, 'Tommye', '25-35', '> 2 tahun', 'sarjana', 'menikah', '8-10', '80-89', '80-89', 'sangat baik', 1, 'lulus'),
(10, 'Marshall', '> 35', '0 tahun', 'pasca', 'lajang', '8-10', '80-89', '80-89', 'sangat baik', 1, 'gagal'),
(11, 'Dora', '25-35', '1-2 tahun', 'pasca', 'menikah', '5-7', '80-89', '80-89', 'baik', 1, 'gagal'),
(12, 'Ellyn', '25-35', '0 tahun', 'pasca', 'lajang', '5-7', '90-100', '90-100', 'cukup baik', 1, 'lulus'),
(13, 'Herta', '25-35', '0 tahun', 'sarjana', 'lajang', '5-7', '80-89', '70-79', 'sangat baik', 1, 'lulus'),
(14, 'Leonel', '> 35', '0 tahun', 'akademi', 'lajang', '5-7', '70-79', '90-100', 'baik', 1, 'gagal'),
(15, 'Caridad', '< 25', '> 2 tahun', 'akademi', 'menikah', '5-7', '90-100', '70-79', 'cukup baik', 1, 'lulus'),
(16, 'Veronika', '> 35', '0 tahun', 'sma', 'lajang', '8-10', '70-79', '90-100', 'sangat baik', 1, 'gagal'),
(17, 'Lincoln', '> 35', '> 2 tahun', 'pasca', 'menikah', '5-7', '90-100', '70-79', 'baik', 1, 'gagal'),
(18, 'Erich', '25-35', '0 tahun', 'akademi', 'lajang', '8-10', '70-79', '70-79', 'baik', 1, 'lulus'),
(19, 'Rickey', '< 25', '0 tahun', 'sarjana', 'menikah', '5-7', '90-100', '70-79', 'sangat baik', 1, 'lulus'),
(20, 'Dewey', '25-35', '> 2 tahun', 'pasca', 'lajang', '8-10', '70-79', '80-89', 'sangat baik', 1, 'gagal'),
(21, 'Beatris', '25-35', '1-2 tahun', 'sma', 'lajang', '5-7', '90-100', '90-100', 'sangat baik', 1, 'gagal'),
(22, 'Elroy', '< 25', '0 tahun', 'pasca', 'lajang', '8-10', '70-79', '90-100', 'cukup baik', 1, 'lulus'),
(23, 'Newton', '25-35', '1-2 tahun', 'pasca', 'menikah', '8-10', '80-89', '70-79', 'cukup baik', 1, 'lulus'),
(24, 'Talisha', '> 35', '0 tahun', 'sarjana', 'lajang', '5-7', '90-100', '80-89', 'cukup baik', 1, 'gagal'),
(25, 'Keesha', '< 25', '> 2 tahun', 'pasca', 'lajang', '8-10', '80-89', '70-79', 'cukup baik', 1, 'lulus'),
(26, 'Claude', '25-35', '0 tahun', 'sma', 'menikah', '8-10', '70-79', '70-79', 'cukup baik', 1, 'gagal'),
(27, 'Tad', '25-35', '> 2 tahun', 'akademi', 'lajang', '8-10', '70-79', '90-100', 'cukup baik', 1, 'lulus'),
(28, 'Nathan', '25-35', '> 2 tahun', 'sarjana', 'menikah', '5-7', '70-79', '90-100', 'baik', 1, 'lulus'),
(29, 'Karissa', '> 35', '> 2 tahun', 'pasca', 'menikah', '8-10', '90-100', '80-89', 'cukup baik', 1, 'gagal'),
(30, 'Jeanetta', '25-35', '> 2 tahun', 'sarjana', 'lajang', '8-10', '70-79', '70-79', 'cukup baik', 1, 'gagal'),
(31, 'Felisha', '25-35', '> 2 tahun', 'sma', 'lajang', '5-7', '80-89', '90-100', 'baik', 1, 'gagal'),
(32, 'Colleen', '> 35', '> 2 tahun', 'sarjana', 'menikah', '5-7', '80-89', '70-79', 'sangat baik', 1, 'gagal'),
(33, 'Elijah', '25-35', '0 tahun', 'sarjana', 'lajang', '8-10', '80-89', '80-89', 'baik', 1, 'lulus'),
(34, 'Natalya', '> 35', '> 2 tahun', 'pasca', 'menikah', '5-7', '90-100', '90-100', 'sangat baik', 1, 'gagal'),
(35, 'Darla', '> 35', '1-2 tahun', 'akademi', 'lajang', '8-10', '70-79', '80-89', 'sangat baik', 1, 'lulus'),
(36, 'Patrick', '> 35', '0 tahun', 'sma', 'lajang', '5-7', '70-79', '70-79', 'cukup baik', 1, 'gagal'),
(37, 'Thresa', '25-35', '> 2 tahun', 'akademi', 'lajang', '8-10', '80-89', '80-89', 'cukup baik', 1, 'lulus'),
(38, 'Eufemia', '> 35', '0 tahun', 'sarjana', 'lajang', '5-7', '70-79', '90-100', 'baik', 1, 'lulus'),
(39, 'Melania', '25-35', '> 2 tahun', 'akademi', 'menikah', '8-10', '90-100', '70-79', 'sangat baik', 1, 'gagal'),
(40, 'Jacqueline', '< 25', '> 2 tahun', 'sarjana', 'menikah', '8-10', '80-89', '90-100', 'sangat baik', 1, 'gagal'),
(41, 'Catrice', '25-35', '1-2 tahun', 'sma', 'menikah', '5-7', '90-100', '70-79', 'sangat baik', 1, 'gagal'),
(42, 'Star', '< 25', '> 2 tahun', 'akademi', 'menikah', '8-10', '70-79', '90-100', 'sangat baik', 1, 'gagal'),
(43, 'Samella', '> 35', '1-2 tahun', 'akademi', 'lajang', '8-10', '90-100', '90-100', 'baik', 1, 'gagal'),
(44, 'Elinor', '25-35', '1-2 tahun', 'sma', 'lajang', '5-7', '70-79', '90-100', 'cukup baik', 1, 'gagal'),
(45, 'Sandee', '< 25', '0 tahun', 'pasca', 'menikah', '8-10', '80-89', '90-100', 'sangat baik', 1, 'lulus'),
(46, 'Maryjane', '< 25', '1-2 tahun', 'sma', 'lajang', '8-10', '90-100', '90-100', 'sangat baik', 1, 'lulus'),
(47, 'Rebeca', '25-35', '1-2 tahun', 'sarjana', 'lajang', '8-10', '80-89', '70-79', 'baik', 1, 'gagal'),
(48, 'Franklin', '> 35', '1-2 tahun', 'sma', 'lajang', '8-10', '70-79', '80-89', 'cukup baik', 1, 'gagal'),
(49, 'Masako', '25-35', '> 2 tahun', 'pasca', 'lajang', '5-7', '70-79', '70-79', 'baik', 1, 'lulus'),
(50, 'Albertha', '25-35', '> 2 tahun', 'sma', 'lajang', '8-10', '80-89', '80-89', 'cukup baik', 1, 'lulus'),
(51, 'Alyson', '25-35', '1-2 tahun', 'pasca', 'lajang', '8-10', '70-79', '80-89', 'sangat baik', 1, 'lulus'),
(52, 'Delinda', '> 35', '0 tahun', 'akademi', 'menikah', '8-10', '70-79', '90-100', 'baik', 1, 'gagal'),
(53, 'Alessandra', '> 35', '> 2 tahun', 'sarjana', 'lajang', '8-10', '70-79', '90-100', 'sangat baik', 1, 'gagal'),
(54, 'Luigi', '> 35', '1-2 tahun', 'sarjana', 'menikah', '5-7', '70-79', '80-89', 'cukup baik', 1, 'lulus'),
(55, 'Herbert', '> 35', '1-2 tahun', 'akademi', 'lajang', '8-10', '70-79', '70-79', 'baik', 1, 'gagal'),
(56, 'Kacey', '> 35', '1-2 tahun', 'sma', 'menikah', '8-10', '90-100', '70-79', 'sangat baik', 1, 'gagal'),
(57, 'Eliz', '< 25', '1-2 tahun', 'sarjana', 'lajang', '5-7', '90-100', '90-100', 'sangat baik', 1, 'lulus'),
(58, 'Karleen', '25-35', '> 2 tahun', 'akademi', 'menikah', '5-7', '80-89', '70-79', 'baik', 1, 'gagal'),
(59, 'Lucienne', '> 35', '> 2 tahun', 'akademi', 'lajang', '8-10', '70-79', '90-100', 'sangat baik', 1, 'gagal'),
(60, 'Glynda', '< 25', '> 2 tahun', 'sma', 'menikah', '5-7', '70-79', '80-89', 'sangat baik', 1, 'gagal'),
(61, 'Tracy', '25-35', '0 tahun', 'pasca', 'lajang', '8-10', '90-100', '80-89', 'baik', 1, 'gagal'),
(62, 'Janey', '< 25', '1-2 tahun', 'sarjana', 'menikah', '5-7', '80-89', '80-89', 'baik', 1, 'lulus'),
(63, 'Daphine', '25-35', '> 2 tahun', 'sma', 'lajang', '8-10', '80-89', '70-79', 'cukup baik', 1, 'gagal'),
(64, 'Jacquelin', '25-35', '1-2 tahun', 'sarjana', 'lajang', '8-10', '90-100', '90-100', 'cukup baik', 1, 'lulus'),
(65, 'Timika', '> 35', '0 tahun', 'sma', 'menikah', '8-10', '70-79', '80-89', 'sangat baik', 1, 'lulus'),
(66, 'Pam', '25-35', '> 2 tahun', 'sarjana', 'lajang', '8-10', '90-100', '80-89', 'baik', 1, 'lulus'),
(67, 'Latrina', '25-35', '0 tahun', 'sma', 'lajang', '5-7', '70-79', '90-100', 'cukup baik', 1, 'lulus'),
(68, 'Porsha', '> 35', '1-2 tahun', 'sma', 'lajang', '8-10', '90-100', '80-89', 'baik', 1, 'gagal'),
(69, 'Carrol', '< 25', '0 tahun', 'sma', 'lajang', '8-10', '80-89', '70-79', 'cukup baik', 1, 'gagal'),
(70, 'Evita', '> 35', '> 2 tahun', 'sma', 'menikah', '8-10', '80-89', '70-79', 'cukup baik', 1, 'lulus'),
(71, 'Reagan', '< 25', '0 tahun', 'sarjana', 'lajang', '5-7', '80-89', '80-89', 'sangat baik', 1, 'lulus'),
(72, 'Quiana', '> 35', '1-2 tahun', 'pasca', 'menikah', '8-10', '70-79', '70-79', 'baik', 1, 'lulus'),
(73, 'Madonna', '< 25', '1-2 tahun', 'sma', 'menikah', '5-7', '90-100', '80-89', 'sangat baik', 1, 'gagal'),
(74, 'Hilario', '> 35', '1-2 tahun', 'akademi', 'menikah', '5-7', '90-100', '80-89', 'baik', 1, 'lulus'),
(75, 'Lu', '< 25', '0 tahun', 'sarjana', 'menikah', '8-10', '70-79', '90-100', 'sangat baik', 1, 'gagal'),
(76, 'Bruna', '> 35', '0 tahun', 'sma', 'menikah', '5-7', '70-79', '80-89', 'cukup baik', 1, 'gagal'),
(77, 'Juana', '25-35', '1-2 tahun', 'pasca', 'lajang', '8-10', '80-89', '70-79', 'baik', 1, 'gagal'),
(78, 'Thea', '25-35', '0 tahun', 'pasca', 'lajang', '8-10', '70-79', '90-100', 'cukup baik', 0, 'lulus'),
(79, 'Danita', '> 35', '0 tahun', 'pasca', 'menikah', '8-10', '70-79', '90-100', 'sangat baik', 1, 'lulus'),
(80, 'Cordell', '25-35', '0 tahun', 'akademi', 'menikah', '5-7', '90-100', '70-79', 'sangat baik', 1, 'lulus'),
(81, 'Raven', '> 35', '0 tahun', 'sarjana', 'lajang', '5-7', '90-100', '70-79', 'sangat baik', 1, 'lulus'),
(82, 'Ellie', '> 35', '1-2 tahun', 'pasca', 'menikah', '8-10', '80-89', '70-79', 'baik', 1, 'gagal'),
(83, 'Nathaniel', '25-35', '> 2 tahun', 'akademi', 'lajang', '5-7', '90-100', '90-100', 'cukup baik', 1, 'lulus'),
(84, 'Terrance', '< 25', '1-2 tahun', 'pasca', 'menikah', '5-7', '80-89', '80-89', 'sangat baik', 1, 'gagal'),
(85, 'Raymundo', '> 35', '1-2 tahun', 'pasca', 'menikah', '8-10', '80-89', '80-89', 'baik', 1, 'gagal'),
(86, 'Cori', '25-35', '> 2 tahun', 'pasca', 'menikah', '5-7', '80-89', '70-79', 'cukup baik', 1, 'lulus'),
(87, 'Harriet', '> 35', '1-2 tahun', 'sarjana', 'menikah', '8-10', '80-89', '70-79', 'sangat baik', 1, 'gagal'),
(88, 'Leonia', '25-35', '0 tahun', 'sarjana', 'menikah', '8-10', '80-89', '70-79', 'sangat baik', 1, 'gagal'),
(89, 'Bret', '> 35', '1-2 tahun', 'pasca', 'lajang', '5-7', '90-100', '80-89', 'baik', 1, 'lulus'),
(90, 'Collen', '25-35', '0 tahun', 'pasca', 'menikah', '5-7', '80-89', '80-89', 'sangat baik', 1, 'lulus'),
(91, 'Analisa', '25-35', '1-2 tahun', 'sma', 'menikah', '8-10', '90-100', '70-79', 'baik', 1, 'gagal'),
(92, 'Leisha', '< 25', '0 tahun', 'akademi', 'lajang', '8-10', '90-100', '70-79', 'cukup baik', 1, 'lulus'),
(93, 'Dane', '> 35', '0 tahun', 'akademi', 'lajang', '8-10', '90-100', '90-100', 'cukup baik', 1, 'gagal'),
(94, 'Alethia', '> 35', '> 2 tahun', 'akademi', 'menikah', '8-10', '70-79', '80-89', 'sangat baik', 1, 'lulus'),
(95, 'Danial', '25-35', '0 tahun', 'sma', 'menikah', '8-10', '90-100', '80-89', 'sangat baik', 1, 'lulus'),
(96, 'Cruz', '< 25', '0 tahun', 'sma', 'lajang', '5-7', '70-79', '80-89', 'sangat baik', 1, 'gagal'),
(97, 'August', '< 25', '> 2 tahun', 'akademi', 'lajang', '5-7', '70-79', '70-79', 'baik', 1, 'gagal'),
(98, 'Dawne', '< 25', '1-2 tahun', 'pasca', 'lajang', '8-10', '70-79', '90-100', 'sangat baik', 1, 'lulus'),
(99, 'Kyoko', '< 25', '> 2 tahun', 'sma', 'lajang', '8-10', '70-79', '70-79', 'cukup baik', 1, 'gagal'),
(100, 'Debera', '< 25', '0 tahun', 'akademi', 'lajang', '8-10', '90-100', '90-100', 'cukup baik', 1, 'lulus'),
(101, 'Stephen', '25-35', '1-2 tahun', 'pasca', 'menikah', '5-7', '90-100', '70-79', 'baik', 1, 'gagal'),
(102, 'Yan', '25-35', '0 tahun', 'sma', 'lajang', '8-10', '90-100', '70-79', 'sangat baik', 1, 'lulus'),
(103, 'Dewayne', '25-35', '> 2 tahun', 'sma', 'menikah', '8-10', '70-79', '70-79', 'baik', 1, 'lulus'),
(104, 'Shellie', '> 35', '1-2 tahun', 'pasca', 'lajang', '5-7', '90-100', '80-89', 'cukup baik', 1, 'gagal'),
(105, 'Phil', '25-35', '0 tahun', 'pasca', 'menikah', '8-10', '90-100', '90-100', 'baik', 0, 'gagal'),
(106, 'Jerome', '> 35', '0 tahun', 'akademi', 'lajang', '8-10', '70-79', '80-89', 'sangat baik', 1, 'lulus'),
(107, 'Lindsy', '25-35', '1-2 tahun', 'pasca', 'lajang', '8-10', '70-79', '90-100', 'cukup baik', 1, 'gagal'),
(108, 'Elly', '25-35', '0 tahun', 'sma', 'lajang', '5-7', '80-89', '70-79', 'baik', 1, 'lulus'),
(109, 'Billy', '25-35', '0 tahun', 'sma', 'menikah', '8-10', '90-100', '70-79', 'baik', 1, 'gagal'),
(110, 'Glennie', '> 35', '1-2 tahun', 'akademi', 'lajang', '8-10', '70-79', '80-89', 'baik', 1, 'lulus'),
(111, 'Dione', '> 35', '0 tahun', 'pasca', 'menikah', '5-7', '90-100', '70-79', 'sangat baik', 1, 'gagal'),
(112, 'Heriberto', '< 25', '1-2 tahun', 'pasca', 'menikah', '8-10', '90-100', '90-100', 'sangat baik', 1, 'lulus'),
(113, 'Farah', '> 35', '1-2 tahun', 'sma', 'menikah', '5-7', '70-79', '80-89', 'cukup baik', 1, 'lulus'),
(114, 'Frankie', '> 35', '0 tahun', 'akademi', 'menikah', '5-7', '70-79', '80-89', 'sangat baik', 1, 'lulus'),
(115, 'Mariella', '25-35', '1-2 tahun', 'sarjana', 'lajang', '8-10', '70-79', '90-100', 'baik', 1, 'lulus'),
(116, 'Marcelina', '< 25', '> 2 tahun', 'sma', 'lajang', '8-10', '70-79', '70-79', 'sangat baik', 1, 'lulus'),
(117, 'Velva', '< 25', '1-2 tahun', 'sma', 'menikah', '5-7', '70-79', '90-100', 'sangat baik', 1, 'gagal'),
(118, 'Gretchen', '25-35', '1-2 tahun', 'sarjana', 'menikah', '8-10', '80-89', '80-89', 'baik', 1, 'lulus'),
(119, 'Bobby', '> 35', '1-2 tahun', 'sma', 'lajang', '8-10', '80-89', '80-89', 'sangat baik', 1, 'lulus'),
(120, 'Iona', '25-35', '1-2 tahun', 'sarjana', 'lajang', '5-7', '70-79', '90-100', 'cukup baik', 1, 'lulus'),
(121, 'Maris', '< 25', '0 tahun', 'akademi', 'menikah', '8-10', '80-89', '90-100', 'cukup baik', 1, 'lulus'),
(122, 'Louetta', '> 35', '0 tahun', 'sarjana', 'lajang', '8-10', '70-79', '90-100', 'sangat baik', 1, 'lulus'),
(123, 'Amelia', '> 35', '> 2 tahun', 'sma', 'lajang', '5-7', '70-79', '90-100', 'sangat baik', 1, 'lulus'),
(124, 'Eldon', '25-35', '0 tahun', 'sarjana', 'lajang', '5-7', '70-79', '80-89', 'cukup baik', 1, 'gagal'),
(125, 'Rolanda', '> 35', '0 tahun', 'akademi', 'menikah', '5-7', '80-89', '70-79', 'baik', 1, 'lulus'),
(126, 'Chang', '> 35', '> 2 tahun', 'sarjana', 'menikah', '5-7', '90-100', '80-89', 'sangat baik', 1, 'lulus'),
(127, 'Cory', '25-35', '0 tahun', 'sma', 'lajang', '5-7', '70-79', '90-100', 'sangat baik', 1, 'gagal'),
(128, 'Elvis', '25-35', '1-2 tahun', 'pasca', 'lajang', '8-10', '90-100', '80-89', 'cukup baik', 1, 'lulus'),
(129, 'Bo', '25-35', '> 2 tahun', 'pasca', 'menikah', '5-7', '90-100', '70-79', 'sangat baik', 1, 'lulus'),
(130, 'Sara', '< 25', '1-2 tahun', 'sma', 'menikah', '8-10', '70-79', '80-89', 'sangat baik', 1, 'gagal'),
(131, 'Rima', '> 35', '0 tahun', 'pasca', 'lajang', '5-7', '90-100', '80-89', 'baik', 1, 'lulus'),
(132, 'Moriah', '< 25', '> 2 tahun', 'sma', 'menikah', '5-7', '70-79', '90-100', 'sangat baik', 1, 'lulus'),
(133, 'Cora', '< 25', '1-2 tahun', 'sma', 'menikah', '8-10', '70-79', '70-79', 'sangat baik', 1, 'gagal'),
(134, 'Scarlet', '> 35', '0 tahun', 'akademi', 'lajang', '8-10', '80-89', '70-79', 'cukup baik', 1, 'lulus'),
(135, 'Lilly', '< 25', '> 2 tahun', 'sarjana', 'lajang', '8-10', '90-100', '70-79', 'sangat baik', 1, 'lulus'),
(136, 'Mika', '25-35', '0 tahun', 'sarjana', 'menikah', '8-10', '90-100', '80-89', 'sangat baik', 1, 'lulus'),
(137, 'Yuk', '< 25', '0 tahun', 'pasca', 'lajang', '8-10', '80-89', '80-89', 'sangat baik', 1, 'gagal'),
(138, 'Velma', '25-35', '0 tahun', 'sarjana', 'lajang', '8-10', '90-100', '90-100', 'cukup baik', 1, 'lulus'),
(139, 'Filomena', '25-35', '1-2 tahun', 'pasca', 'lajang', '5-7', '70-79', '80-89', 'baik', 1, 'gagal'),
(140, 'Hilary', '25-35', '> 2 tahun', 'sarjana', 'menikah', '5-7', '70-79', '80-89', 'cukup baik', 1, 'lulus'),
(141, 'Victoria', '> 35', '> 2 tahun', 'akademi', 'menikah', '5-7', '70-79', '90-100', 'cukup baik', 1, 'lulus'),
(142, 'Darline', '< 25', '0 tahun', 'sarjana', 'lajang', '8-10', '90-100', '70-79', 'baik', 1, 'gagal'),
(143, 'Carola', '> 35', '> 2 tahun', 'pasca', 'menikah', '5-7', '70-79', '90-100', 'cukup baik', 1, 'lulus'),
(144, 'Patsy', '< 25', '0 tahun', 'sarjana', 'lajang', '8-10', '80-89', '90-100', 'sangat baik', 1, 'lulus'),
(145, 'Lonny', '> 35', '> 2 tahun', 'sarjana', 'menikah', '5-7', '90-100', '70-79', 'sangat baik', 1, 'gagal'),
(146, 'Marla', '< 25', '0 tahun', 'pasca', 'lajang', '5-7', '80-89', '70-79', 'cukup baik', 1, 'lulus'),
(147, 'Onie', '> 35', '> 2 tahun', 'sma', 'menikah', '8-10', '80-89', '80-89', 'baik', 1, 'lulus'),
(148, 'Karleen', '25-35', '> 2 tahun', 'pasca', 'lajang', '8-10', '70-79', '70-79', 'baik', 1, 'lulus'),
(149, 'Shanelle', '25-35', '0 tahun', 'sarjana', 'lajang', '5-7', '90-100', '70-79', 'cukup baik', 1, 'gagal'),
(150, 'France', '> 35', '> 2 tahun', 'sarjana', 'lajang', '8-10', '70-79', '80-89', 'sangat baik', 1, 'lulus'),
(151, 'Gladys', '< 25', '> 2 tahun', 'sma', 'lajang', '5-7', '70-79', '90-100', 'sangat baik', 1, 'lulus'),
(152, 'Lenore', '< 25', '> 2 tahun', 'sma', 'menikah', '5-7', '90-100', '80-89', 'baik', 1, 'lulus'),
(153, 'Kesha', '> 35', '> 2 tahun', 'sarjana', 'menikah', '5-7', '70-79', '90-100', 'baik', 1, 'lulus'),
(154, 'Donovan', '< 25', '> 2 tahun', 'sarjana', 'lajang', '8-10', '70-79', '70-79', 'cukup baik', 1, 'gagal'),
(155, 'Marti', '< 25', '> 2 tahun', 'pasca', 'lajang', '5-7', '70-79', '70-79', 'baik', 1, 'gagal'),
(156, 'Mari', '< 25', '1-2 tahun', 'sma', 'menikah', '5-7', '90-100', '70-79', 'sangat baik', 1, 'lulus'),
(157, 'Brock', '> 35', '> 2 tahun', 'sma', 'menikah', '5-7', '80-89', '90-100', 'sangat baik', 1, 'lulus'),
(158, 'Salvador', '25-35', '> 2 tahun', 'akademi', 'lajang', '8-10', '90-100', '70-79', 'baik', 1, 'gagal'),
(159, 'Carmella', '25-35', '1-2 tahun', 'sarjana', 'lajang', '5-7', '80-89', '80-89', 'cukup baik', 1, 'lulus'),
(160, 'Nerissa', '25-35', '0 tahun', 'pasca', 'lajang', '8-10', '70-79', '90-100', 'baik', 0, 'gagal'),
(161, 'Bennett', '25-35', '0 tahun', 'sarjana', 'menikah', '8-10', '70-79', '70-79', 'cukup baik', 1, 'lulus'),
(162, 'Tona', '25-35', '> 2 tahun', 'sma', 'lajang', '8-10', '80-89', '80-89', 'sangat baik', 1, 'gagal'),
(163, 'Antonette', '> 35', '> 2 tahun', 'akademi', 'lajang', '8-10', '90-100', '70-79', 'sangat baik', 1, 'lulus'),
(164, 'Suzette', '25-35', '0 tahun', 'akademi', 'menikah', '5-7', '70-79', '80-89', 'cukup baik', 1, 'lulus'),
(165, 'Xochitl', '> 35', '1-2 tahun', 'pasca', 'lajang', '5-7', '70-79', '80-89', 'sangat baik', 1, 'gagal'),
(166, 'Inger', '25-35', '> 2 tahun', 'pasca', 'lajang', '5-7', '80-89', '80-89', 'sangat baik', 1, 'lulus'),
(167, 'Stan', '25-35', '> 2 tahun', 'sarjana', 'lajang', '8-10', '70-79', '80-89', 'baik', 1, 'lulus'),
(168, 'Saturnina', '> 35', '> 2 tahun', 'akademi', 'menikah', '5-7', '80-89', '70-79', 'cukup baik', 1, 'gagal'),
(169, 'Toi', '> 35', '> 2 tahun', 'pasca', 'lajang', '8-10', '70-79', '90-100', 'cukup baik', 1, 'gagal'),
(170, 'Eusebio', '< 25', '> 2 tahun', 'akademi', 'lajang', '5-7', '90-100', '90-100', 'baik', 1, 'lulus'),
(171, 'Solomon', '25-35', '1-2 tahun', 'pasca', 'menikah', '8-10', '70-79', '70-79', 'cukup baik', 1, 'gagal'),
(172, 'Adaline', '< 25', '> 2 tahun', 'sarjana', 'lajang', '8-10', '90-100', '70-79', 'cukup baik', 1, 'gagal'),
(173, 'Elia', '> 35', '0 tahun', 'sma', 'lajang', '8-10', '80-89', '70-79', 'baik', 1, 'gagal'),
(174, 'Lacey', '> 35', '> 2 tahun', 'pasca', 'menikah', '8-10', '70-79', '90-100', 'cukup baik', 1, 'gagal'),
(175, 'Sallie', '< 25', '> 2 tahun', 'sarjana', 'menikah', '8-10', '80-89', '80-89', 'baik', 1, 'lulus'),
(176, 'Buffy', '< 25', '> 2 tahun', 'akademi', 'menikah', '8-10', '90-100', '90-100', 'sangat baik', 1, 'gagal'),
(177, 'Maurice', '< 25', '> 2 tahun', 'akademi', 'lajang', '8-10', '80-89', '80-89', 'sangat baik', 1, 'lulus'),
(178, 'Buck', '> 35', '> 2 tahun', 'sma', 'menikah', '5-7', '90-100', '80-89', 'sangat baik', 1, 'lulus'),
(179, 'Chase', '> 35', '0 tahun', 'sma', 'lajang', '8-10', '90-100', '70-79', 'sangat baik', 1, 'gagal'),
(180, 'Ernesto', '< 25', '0 tahun', 'sarjana', 'lajang', '8-10', '90-100', '70-79', 'sangat baik', 1, 'lulus');

-- --------------------------------------------------------

--
-- Table structure for table `atribut_detail`
--

CREATE TABLE `atribut_detail` (
  `id` int(6) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `flag` tinyint(4) NOT NULL,
  `attr` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `atribut_detail`
--

INSERT INTO `atribut_detail` (`id`, `detail`, `flag`, `attr`) VALUES
(1, '< 25', 0, 'age'),
(2, '25-35', 0, 'age'),
(3, '> 35', 0, 'age'),
(4, '0 tahun', 0, 'experience'),
(5, '1-2 tahun', 0, 'experience'),
(6, '> 2 tahun', 0, 'experience'),
(7, 'sma', 0, 'last_education'),
(8, 'akademi', 0, 'last_education'),
(9, 'sarjana', 0, 'last_education'),
(10, 'pasca', 0, 'last_education'),
(11, 'lajang', 0, 'status'),
(12, 'menikah', 0, 'status'),
(13, '5-7', 0, 'total_ability'),
(14, '8-10', 0, 'total_ability'),
(15, '70-79', 0, 'nilai_online'),
(16, '80-89', 0, 'nilai_online'),
(17, '90-100', 0, 'nilai_online'),
(18, '70-79', 0, 'nilai_f2f'),
(19, '80-89', 0, 'nilai_f2f'),
(20, '90-100', 0, 'nilai_f2f'),
(21, 'cukup baik', 0, 'nilai_sikap'),
(22, 'baik', 0, 'nilai_sikap'),
(23, 'sangat baik', 0, 'nilai_sikap');

-- --------------------------------------------------------

--
-- Table structure for table `c45_rule`
--

CREATE TABLE `c45_rule` (
  `id` int(6) NOT NULL,
  `atribut` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `link` int(6) DEFAULT NULL,
  `keputusan` varchar(255) DEFAULT NULL,
  `atribut_cek` text NOT NULL,
  `label_cek` text NOT NULL,
  `status_hitung` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `c45_rule`
--

INSERT INTO `c45_rule` (`id`, `atribut`, `label`, `link`, `keputusan`, `atribut_cek`, `label_cek`, `status_hitung`) VALUES
(1, 'last_education', 'last_education', NULL, NULL, 'last_education~', '', '#ROOT'),
(2, 'last_education', 'sma', 1, NULL, 'last_education~', '=\"sma\"~', 'stop_child'),
(3, 'last_education', 'akademi', 1, NULL, 'last_education~', '=\"akademi\"~', 'stop_child'),
(4, 'last_education', 'sarjana', 1, NULL, 'last_education~', '=\"sarjana\"~', 'stop_child'),
(5, 'last_education', 'pasca', 1, NULL, 'last_education~', '=\"pasca\"~', 'stop_child'),
(6, 'experience', 'experience', 2, NULL, 'last_education~experience~', '', '#ROOT'),
(7, 'experience', '0 tahun', 6, NULL, 'last_education~experience~', '=\"sma\"~=\"0 tahun\"~', 'stop_child'),
(8, 'experience', '1-2 tahun', 6, NULL, 'last_education~experience~', '=\"sma\"~=\"1-2 tahun\"~', 'stop_child'),
(9, 'experience', '> 2 tahun', 6, NULL, 'last_education~experience~', '=\"sma\"~=\"> 2 tahun\"~', 'stop_child'),
(10, 'nilai_f2f', 'nilai_f2f', 3, NULL, 'last_education~nilai_f2f~', '', '#ROOT'),
(11, 'nilai_f2f', '70-79', 10, NULL, 'last_education~nilai_f2f~', '=\"akademi\"~=\"70-79\"~', 'stop_child'),
(12, 'nilai_f2f', '80-89', 10, NULL, 'last_education~nilai_f2f~', '=\"akademi\"~=\"80-89\"~', 'stop_child'),
(13, 'nilai_f2f', '90-100', 10, NULL, 'last_education~nilai_f2f~', '=\"akademi\"~=\"90-100\"~', 'stop_child'),
(14, 'nilai_f2f', 'nilai_f2f', 4, NULL, 'last_education~nilai_f2f~', '', '#ROOT'),
(15, 'nilai_f2f', '70-79', 14, NULL, 'last_education~nilai_f2f~', '=\"sarjana\"~=\"70-79\"~', 'stop_child'),
(16, 'nilai_f2f', '80-89', 14, NULL, 'last_education~nilai_f2f~', '=\"sarjana\"~=\"80-89\"~', 'stop_child'),
(17, 'nilai_f2f', '90-100', 14, NULL, 'last_education~nilai_f2f~', '=\"sarjana\"~=\"90-100\"~', 'stop_child'),
(18, 'nilai_sikap', 'nilai_sikap', 5, NULL, 'last_education~nilai_sikap~', '', '#ROOT'),
(19, 'nilai_sikap', 'cukup baik', 18, NULL, 'last_education~nilai_sikap~', '=\"pasca\"~=\"cukup baik\"~', 'stop_child'),
(20, 'nilai_sikap', 'baik', 18, NULL, 'last_education~nilai_sikap~', '=\"pasca\"~=\"baik\"~', 'stop_child'),
(21, 'nilai_sikap', 'sangat baik', 18, NULL, 'last_education~nilai_sikap~', '=\"pasca\"~=\"sangat baik\"~', 'stop_child'),
(22, 'age', 'age', 7, NULL, 'last_education~experience~age~', '', '#ROOT'),
(23, 'age', '< 25', 22, 'gagal', 'last_education~experience~age~', '=\"sma\"~=\"0 tahun\"~=\"< 25\"~', 'gagal'),
(24, 'age', '25-35', 22, NULL, 'last_education~experience~age~', '=\"sma\"~=\"0 tahun\"~=\"25-35\"~', 'stop_child'),
(25, 'age', '> 35', 22, NULL, 'last_education~experience~age~', '=\"sma\"~=\"0 tahun\"~=\"> 35\"~', 'stop_child'),
(26, 'nilai_online', 'nilai_online', 8, NULL, 'last_education~experience~nilai_online~', '', '#ROOT'),
(27, 'nilai_online', '70-79', 26, NULL, 'last_education~experience~nilai_online~', '=\"sma\"~=\"1-2 tahun\"~=\"70-79\"~', 'stop_child'),
(28, 'nilai_online', '80-89', 26, 'lulus', 'last_education~experience~nilai_online~', '=\"sma\"~=\"1-2 tahun\"~=\"80-89\"~', 'lulus'),
(29, 'nilai_online', '90-100', 26, NULL, 'last_education~experience~nilai_online~', '=\"sma\"~=\"1-2 tahun\"~=\"90-100\"~', 'stop_child'),
(30, 'status', 'status', 9, NULL, 'last_education~experience~status~', '', '#ROOT'),
(31, 'status', 'lajang', 30, NULL, 'last_education~experience~status~', '=\"sma\"~=\"> 2 tahun\"~=\"lajang\"~', 'stop_child'),
(32, 'status', 'menikah', 30, NULL, 'last_education~experience~status~', '=\"sma\"~=\"> 2 tahun\"~=\"menikah\"~', 'stop_child'),
(33, 'experience', 'experience', 11, NULL, 'last_education~nilai_f2f~experience~', '', '#ROOT'),
(34, 'experience', '0 tahun', 33, 'lulus', 'last_education~nilai_f2f~experience~', '=\"akademi\"~=\"70-79\"~=\"0 tahun\"~', 'lulus'),
(35, 'experience', '1-2 tahun', 33, 'gagal', 'last_education~nilai_f2f~experience~', '=\"akademi\"~=\"70-79\"~=\"1-2 tahun\"~', 'gagal'),
(36, 'experience', '> 2 tahun', 33, NULL, 'last_education~nilai_f2f~experience~', '=\"akademi\"~=\"70-79\"~=\"> 2 tahun\"~', 'stop_child'),
(37, 'age', 'age', 12, NULL, 'last_education~nilai_f2f~age~', '', '#ROOT'),
(38, 'age', '< 25', 37, 'lulus', 'last_education~nilai_f2f~age~', '=\"akademi\"~=\"80-89\"~=\"< 25\"~', 'lulus'),
(39, 'age', '25-35', 37, NULL, 'last_education~nilai_f2f~age~', '=\"akademi\"~=\"80-89\"~=\"25-35\"~', 'stop_child'),
(40, 'age', '> 35', 37, 'lulus', 'last_education~nilai_f2f~age~', '=\"akademi\"~=\"80-89\"~=\"> 35\"~', 'lulus'),
(41, 'nilai_sikap', 'nilai_sikap', 13, NULL, 'last_education~nilai_f2f~nilai_sikap~', '', '#ROOT'),
(42, 'nilai_sikap', 'cukup baik', 41, NULL, 'last_education~nilai_f2f~nilai_sikap~', '=\"akademi\"~=\"90-100\"~=\"cukup baik\"~', 'stop_child'),
(43, 'nilai_sikap', 'baik', 41, NULL, 'last_education~nilai_f2f~nilai_sikap~', '=\"akademi\"~=\"90-100\"~=\"baik\"~', 'stop_child'),
(44, 'nilai_sikap', 'sangat baik', 41, 'gagal', 'last_education~nilai_f2f~nilai_sikap~', '=\"akademi\"~=\"90-100\"~=\"sangat baik\"~', 'gagal'),
(45, 'experience', 'experience', 15, NULL, 'last_education~nilai_f2f~experience~', '', '#ROOT'),
(46, 'experience', '0 tahun', 45, NULL, 'last_education~nilai_f2f~experience~', '=\"sarjana\"~=\"70-79\"~=\"0 tahun\"~', 'stop_child'),
(47, 'experience', '1-2 tahun', 45, 'gagal', 'last_education~nilai_f2f~experience~', '=\"sarjana\"~=\"70-79\"~=\"1-2 tahun\"~', 'gagal'),
(48, 'experience', '> 2 tahun', 45, NULL, 'last_education~nilai_f2f~experience~', '=\"sarjana\"~=\"70-79\"~=\"> 2 tahun\"~', 'stop_child'),
(49, 'nilai_sikap', 'nilai_sikap', 16, NULL, 'last_education~nilai_f2f~nilai_sikap~', '', '#ROOT'),
(50, 'nilai_sikap', 'cukup baik', 49, NULL, 'last_education~nilai_f2f~nilai_sikap~', '=\"sarjana\"~=\"80-89\"~=\"cukup baik\"~', 'stop_child'),
(51, 'nilai_sikap', 'baik', 49, NULL, 'last_education~nilai_f2f~nilai_sikap~', '=\"sarjana\"~=\"80-89\"~=\"baik\"~', 'stop_child'),
(52, 'nilai_sikap', 'sangat baik', 49, 'lulus', 'last_education~nilai_f2f~nilai_sikap~', '=\"sarjana\"~=\"80-89\"~=\"sangat baik\"~', 'lulus'),
(53, 'nilai_sikap', 'nilai_sikap', 17, NULL, 'last_education~nilai_f2f~nilai_sikap~', '', '#ROOT'),
(54, 'nilai_sikap', 'cukup baik', 53, 'lulus', 'last_education~nilai_f2f~nilai_sikap~', '=\"sarjana\"~=\"90-100\"~=\"cukup baik\"~', 'lulus'),
(55, 'nilai_sikap', 'baik', 53, 'lulus', 'last_education~nilai_f2f~nilai_sikap~', '=\"sarjana\"~=\"90-100\"~=\"baik\"~', 'lulus'),
(56, 'nilai_sikap', 'sangat baik', 53, NULL, 'last_education~nilai_f2f~nilai_sikap~', '=\"sarjana\"~=\"90-100\"~=\"sangat baik\"~', 'stop_child'),
(57, 'age', 'age', 19, NULL, 'last_education~nilai_sikap~age~', '', '#ROOT'),
(58, 'age', '< 25', 57, 'lulus', 'last_education~nilai_sikap~age~', '=\"pasca\"~=\"cukup baik\"~=\"< 25\"~', 'lulus'),
(59, 'age', '25-35', 57, NULL, 'last_education~nilai_sikap~age~', '=\"pasca\"~=\"cukup baik\"~=\"25-35\"~', 'stop_child'),
(60, 'age', '> 35', 57, NULL, 'last_education~nilai_sikap~age~', '=\"pasca\"~=\"cukup baik\"~=\"> 35\"~', 'stop_child'),
(61, 'status', 'status', 20, NULL, 'last_education~nilai_sikap~status~', '', '#ROOT'),
(62, 'status', 'lajang', 61, NULL, 'last_education~nilai_sikap~status~', '=\"pasca\"~=\"baik\"~=\"lajang\"~', 'stop_child'),
(63, 'status', 'menikah', 61, NULL, 'last_education~nilai_sikap~status~', '=\"pasca\"~=\"baik\"~=\"menikah\"~', 'stop_child'),
(64, 'age', 'age', 21, NULL, 'last_education~nilai_sikap~age~', '', '#ROOT'),
(65, 'age', '< 25', 64, NULL, 'last_education~nilai_sikap~age~', '=\"pasca\"~=\"sangat baik\"~=\"< 25\"~', 'stop_child'),
(66, 'age', '25-35', 64, NULL, 'last_education~nilai_sikap~age~', '=\"pasca\"~=\"sangat baik\"~=\"25-35\"~', 'stop_child'),
(67, 'age', '> 35', 64, NULL, 'last_education~nilai_sikap~age~', '=\"pasca\"~=\"sangat baik\"~=\"> 35\"~', 'stop_child'),
(68, 'nilai_online', 'nilai_online', 24, NULL, 'last_education~experience~age~nilai_online~', '', '#ROOT'),
(69, 'nilai_online', '70-79', 68, NULL, 'last_education~experience~age~nilai_online~', '=\"sma\"~=\"0 tahun\"~=\"25-35\"~=\"70-79\"~', 'stop_child'),
(70, 'nilai_online', '80-89', 68, 'lulus', 'last_education~experience~age~nilai_online~', '=\"sma\"~=\"0 tahun\"~=\"25-35\"~=\"80-89\"~', 'lulus'),
(71, 'nilai_online', '90-100', 68, NULL, 'last_education~experience~age~nilai_online~', '=\"sma\"~=\"0 tahun\"~=\"25-35\"~=\"90-100\"~', 'stop_child'),
(72, 'status', 'status', 25, NULL, 'last_education~experience~age~status~', '', '#ROOT'),
(73, 'status', 'lajang', 72, 'gagal', 'last_education~experience~age~status~', '=\"sma\"~=\"0 tahun\"~=\"> 35\"~=\"lajang\"~', 'gagal'),
(74, 'status', 'menikah', 72, NULL, 'last_education~experience~age~status~', '=\"sma\"~=\"0 tahun\"~=\"> 35\"~=\"menikah\"~', 'stop_child'),
(75, 'nilai_sikap', 'nilai_sikap', 27, NULL, 'last_education~experience~nilai_online~nilai_sikap~', '', '#ROOT'),
(76, 'nilai_sikap', 'cukup baik', 75, NULL, 'last_education~experience~nilai_online~nilai_sikap~', '=\"sma\"~=\"1-2 tahun\"~=\"70-79\"~=\"cukup baik\"~', 'stop_child'),
(77, 'nilai_sikap', 'baik', 75, '#SKIP', 'last_education~experience~nilai_online~nilai_sikap~', '=\"sma\"~=\"1-2 tahun\"~=\"70-79\"~=\"baik\"~', '#SKIP'),
(78, 'nilai_sikap', 'sangat baik', 75, 'gagal', 'last_education~experience~nilai_online~nilai_sikap~', '=\"sma\"~=\"1-2 tahun\"~=\"70-79\"~=\"sangat baik\"~', 'gagal'),
(79, 'age', 'age', 29, NULL, 'last_education~experience~nilai_online~age~', '', '#ROOT'),
(80, 'age', '< 25', 79, NULL, 'last_education~experience~nilai_online~age~', '=\"sma\"~=\"1-2 tahun\"~=\"90-100\"~=\"< 25\"~', 'stop_child'),
(81, 'age', '25-35', 79, 'gagal', 'last_education~experience~nilai_online~age~', '=\"sma\"~=\"1-2 tahun\"~=\"90-100\"~=\"25-35\"~', 'gagal'),
(82, 'age', '> 35', 79, 'gagal', 'last_education~experience~nilai_online~age~', '=\"sma\"~=\"1-2 tahun\"~=\"90-100\"~=\"> 35\"~', 'gagal'),
(83, 'nilai_sikap', 'nilai_sikap', 31, NULL, 'last_education~experience~status~nilai_sikap~', '', '#ROOT'),
(84, 'nilai_sikap', 'cukup baik', 83, NULL, 'last_education~experience~status~nilai_sikap~', '=\"sma\"~=\"> 2 tahun\"~=\"lajang\"~=\"cukup baik\"~', 'stop_child'),
(85, 'nilai_sikap', 'baik', 83, 'gagal', 'last_education~experience~status~nilai_sikap~', '=\"sma\"~=\"> 2 tahun\"~=\"lajang\"~=\"baik\"~', 'gagal'),
(86, 'nilai_sikap', 'sangat baik', 83, NULL, 'last_education~experience~status~nilai_sikap~', '=\"sma\"~=\"> 2 tahun\"~=\"lajang\"~=\"sangat baik\"~', 'stop_child'),
(87, 'age', 'age', 32, NULL, 'last_education~experience~status~age~', '', '#ROOT'),
(88, 'age', '< 25', 87, NULL, 'last_education~experience~status~age~', '=\"sma\"~=\"> 2 tahun\"~=\"menikah\"~=\"< 25\"~', 'stop_child'),
(89, 'age', '25-35', 87, 'lulus', 'last_education~experience~status~age~', '=\"sma\"~=\"> 2 tahun\"~=\"menikah\"~=\"25-35\"~', 'lulus'),
(90, 'age', '> 35', 87, 'lulus', 'last_education~experience~status~age~', '=\"sma\"~=\"> 2 tahun\"~=\"menikah\"~=\"> 35\"~', 'lulus'),
(91, 'nilai_online', 'nilai_online', 36, NULL, 'last_education~nilai_f2f~experience~nilai_online~', '', '#ROOT'),
(92, 'nilai_online', '70-79', 91, 'gagal', 'last_education~nilai_f2f~experience~nilai_online~', '=\"akademi\"~=\"70-79\"~=\"> 2 tahun\"~=\"70-79\"~', 'gagal'),
(93, 'nilai_online', '80-89', 91, NULL, 'last_education~nilai_f2f~experience~nilai_online~', '=\"akademi\"~=\"70-79\"~=\"> 2 tahun\"~=\"80-89\"~', 'stop_child'),
(94, 'nilai_online', '90-100', 91, NULL, 'last_education~nilai_f2f~experience~nilai_online~', '=\"akademi\"~=\"70-79\"~=\"> 2 tahun\"~=\"90-100\"~', 'stop_child'),
(95, 'experience', 'experience', 39, NULL, 'last_education~nilai_f2f~age~experience~', '', '#ROOT'),
(96, 'experience', '0 tahun', 95, 'lulus', 'last_education~nilai_f2f~age~experience~', '=\"akademi\"~=\"80-89\"~=\"25-35\"~=\"0 tahun\"~', 'lulus'),
(97, 'experience', '1-2 tahun', 95, '#SKIP', 'last_education~nilai_f2f~age~experience~', '=\"akademi\"~=\"80-89\"~=\"25-35\"~=\"1-2 tahun\"~', '#SKIP'),
(98, 'experience', '> 2 tahun', 95, NULL, 'last_education~nilai_f2f~age~experience~', '=\"akademi\"~=\"80-89\"~=\"25-35\"~=\"> 2 tahun\"~', 'stop_child'),
(99, 'age', 'age', 42, NULL, 'last_education~nilai_f2f~nilai_sikap~age~', '', '#ROOT'),
(100, 'age', '< 25', 99, 'lulus', 'last_education~nilai_f2f~nilai_sikap~age~', '=\"akademi\"~=\"90-100\"~=\"cukup baik\"~=\"< 25\"~', 'lulus'),
(101, 'age', '25-35', 99, 'lulus', 'last_education~nilai_f2f~nilai_sikap~age~', '=\"akademi\"~=\"90-100\"~=\"cukup baik\"~=\"25-35\"~', 'lulus'),
(102, 'age', '> 35', 99, NULL, 'last_education~nilai_f2f~nilai_sikap~age~', '=\"akademi\"~=\"90-100\"~=\"cukup baik\"~=\"> 35\"~', 'stop_child'),
(103, 'age', 'age', 43, NULL, 'last_education~nilai_f2f~nilai_sikap~age~', '', '#ROOT'),
(104, 'age', '< 25', 103, 'lulus', 'last_education~nilai_f2f~nilai_sikap~age~', '=\"akademi\"~=\"90-100\"~=\"baik\"~=\"< 25\"~', 'lulus'),
(105, 'age', '25-35', 103, '#SKIP', 'last_education~nilai_f2f~nilai_sikap~age~', '=\"akademi\"~=\"90-100\"~=\"baik\"~=\"25-35\"~', '#SKIP'),
(106, 'age', '> 35', 103, 'gagal', 'last_education~nilai_f2f~nilai_sikap~age~', '=\"akademi\"~=\"90-100\"~=\"baik\"~=\"> 35\"~', 'gagal'),
(107, 'nilai_sikap', 'nilai_sikap', 46, NULL, 'last_education~nilai_f2f~experience~nilai_sikap~', '', '#ROOT'),
(108, 'nilai_sikap', 'cukup baik', 107, NULL, 'last_education~nilai_f2f~experience~nilai_sikap~', '=\"sarjana\"~=\"70-79\"~=\"0 tahun\"~=\"cukup baik\"~', 'stop_child'),
(109, 'nilai_sikap', 'baik', 107, 'gagal', 'last_education~nilai_f2f~experience~nilai_sikap~', '=\"sarjana\"~=\"70-79\"~=\"0 tahun\"~=\"baik\"~', 'gagal'),
(110, 'nilai_sikap', 'sangat baik', 107, NULL, 'last_education~nilai_f2f~experience~nilai_sikap~', '=\"sarjana\"~=\"70-79\"~=\"0 tahun\"~=\"sangat baik\"~', 'stop_child'),
(111, 'nilai_sikap', 'nilai_sikap', 48, NULL, 'last_education~nilai_f2f~experience~nilai_sikap~', '', '#ROOT'),
(112, 'nilai_sikap', 'cukup baik', 111, 'gagal', 'last_education~nilai_f2f~experience~nilai_sikap~', '=\"sarjana\"~=\"70-79\"~=\"> 2 tahun\"~=\"cukup baik\"~', 'gagal'),
(113, 'nilai_sikap', 'baik', 111, '#SKIP', 'last_education~nilai_f2f~experience~nilai_sikap~', '=\"sarjana\"~=\"70-79\"~=\"> 2 tahun\"~=\"baik\"~', '#SKIP'),
(114, 'nilai_sikap', 'sangat baik', 111, NULL, 'last_education~nilai_f2f~experience~nilai_sikap~', '=\"sarjana\"~=\"70-79\"~=\"> 2 tahun\"~=\"sangat baik\"~', 'stop_child'),
(115, 'status', 'status', 50, NULL, 'last_education~nilai_f2f~nilai_sikap~status~', '', '#ROOT'),
(116, 'status', 'lajang', 115, NULL, 'last_education~nilai_f2f~nilai_sikap~status~', '=\"sarjana\"~=\"80-89\"~=\"cukup baik\"~=\"lajang\"~', 'stop_child'),
(117, 'status', 'menikah', 115, 'lulus', 'last_education~nilai_f2f~nilai_sikap~status~', '=\"sarjana\"~=\"80-89\"~=\"cukup baik\"~=\"menikah\"~', 'lulus'),
(118, 'age', 'age', 51, NULL, 'last_education~nilai_f2f~nilai_sikap~age~', '', '#ROOT'),
(119, 'age', '< 25', 118, 'lulus', 'last_education~nilai_f2f~nilai_sikap~age~', '=\"sarjana\"~=\"80-89\"~=\"baik\"~=\"< 25\"~', 'lulus'),
(120, 'age', '25-35', 118, 'lulus', 'last_education~nilai_f2f~nilai_sikap~age~', '=\"sarjana\"~=\"80-89\"~=\"baik\"~=\"25-35\"~', 'lulus'),
(121, 'age', '> 35', 118, 'gagal', 'last_education~nilai_f2f~nilai_sikap~age~', '=\"sarjana\"~=\"80-89\"~=\"baik\"~=\"> 35\"~', 'gagal'),
(122, 'status', 'status', 56, NULL, 'last_education~nilai_f2f~nilai_sikap~status~', '', '#ROOT'),
(123, 'status', 'lajang', 122, NULL, 'last_education~nilai_f2f~nilai_sikap~status~', '=\"sarjana\"~=\"90-100\"~=\"sangat baik\"~=\"lajang\"~', 'stop_child'),
(124, 'status', 'menikah', 122, 'gagal', 'last_education~nilai_f2f~nilai_sikap~status~', '=\"sarjana\"~=\"90-100\"~=\"sangat baik\"~=\"menikah\"~', 'gagal'),
(125, 'nilai_online', 'nilai_online', 59, NULL, 'last_education~nilai_sikap~age~nilai_online~', '', '#ROOT'),
(126, 'nilai_online', '70-79', 125, NULL, 'last_education~nilai_sikap~age~nilai_online~', '=\"pasca\"~=\"cukup baik\"~=\"25-35\"~=\"70-79\"~', 'stop_child'),
(127, 'nilai_online', '80-89', 125, 'lulus', 'last_education~nilai_sikap~age~nilai_online~', '=\"pasca\"~=\"cukup baik\"~=\"25-35\"~=\"80-89\"~', 'lulus'),
(128, 'nilai_online', '90-100', 125, NULL, 'last_education~nilai_sikap~age~nilai_online~', '=\"pasca\"~=\"cukup baik\"~=\"25-35\"~=\"90-100\"~', 'stop_child'),
(129, 'total_ability', 'total_ability', 60, NULL, 'last_education~nilai_sikap~age~total_ability~', '', '#ROOT'),
(130, 'total_ability', '5-7', 129, NULL, 'last_education~nilai_sikap~age~total_ability~', '=\"pasca\"~=\"cukup baik\"~=\"> 35\"~=\"5-7\"~', 'stop_child'),
(131, 'total_ability', '8-10', 129, 'gagal', 'last_education~nilai_sikap~age~total_ability~', '=\"pasca\"~=\"cukup baik\"~=\"> 35\"~=\"8-10\"~', 'gagal'),
(132, 'age', 'age', 62, NULL, 'last_education~nilai_sikap~status~age~', '', '#ROOT'),
(133, 'age', '< 25', 132, 'gagal', 'last_education~nilai_sikap~status~age~', '=\"pasca\"~=\"baik\"~=\"lajang\"~=\"< 25\"~', 'gagal'),
(134, 'age', '25-35', 132, NULL, 'last_education~nilai_sikap~status~age~', '=\"pasca\"~=\"baik\"~=\"lajang\"~=\"25-35\"~', 'stop_child'),
(135, 'age', '> 35', 132, 'lulus', 'last_education~nilai_sikap~status~age~', '=\"pasca\"~=\"baik\"~=\"lajang\"~=\"> 35\"~', 'lulus'),
(136, 'nilai_online', 'nilai_online', 63, NULL, 'last_education~nilai_sikap~status~nilai_online~', '', '#ROOT'),
(137, 'nilai_online', '70-79', 136, NULL, 'last_education~nilai_sikap~status~nilai_online~', '=\"pasca\"~=\"baik\"~=\"menikah\"~=\"70-79\"~', 'stop_child'),
(138, 'nilai_online', '80-89', 136, 'gagal', 'last_education~nilai_sikap~status~nilai_online~', '=\"pasca\"~=\"baik\"~=\"menikah\"~=\"80-89\"~', 'gagal'),
(139, 'nilai_online', '90-100', 136, 'gagal', 'last_education~nilai_sikap~status~nilai_online~', '=\"pasca\"~=\"baik\"~=\"menikah\"~=\"90-100\"~', 'gagal'),
(140, 'nilai_f2f', 'nilai_f2f', 65, NULL, 'last_education~nilai_sikap~age~nilai_f2f~', '', '#ROOT'),
(141, 'nilai_f2f', '70-79', 140, '#SKIP', 'last_education~nilai_sikap~age~nilai_f2f~', '=\"pasca\"~=\"sangat baik\"~=\"< 25\"~=\"70-79\"~', '#SKIP'),
(142, 'nilai_f2f', '80-89', 140, 'gagal', 'last_education~nilai_sikap~age~nilai_f2f~', '=\"pasca\"~=\"sangat baik\"~=\"< 25\"~=\"80-89\"~', 'gagal'),
(143, 'nilai_f2f', '90-100', 140, 'lulus', 'last_education~nilai_sikap~age~nilai_f2f~', '=\"pasca\"~=\"sangat baik\"~=\"< 25\"~=\"90-100\"~', 'lulus'),
(144, 'nilai_online', 'nilai_online', 66, NULL, 'last_education~nilai_sikap~age~nilai_online~', '', '#ROOT'),
(145, 'nilai_online', '70-79', 144, NULL, 'last_education~nilai_sikap~age~nilai_online~', '=\"pasca\"~=\"sangat baik\"~=\"25-35\"~=\"70-79\"~', 'stop_child'),
(146, 'nilai_online', '80-89', 144, 'lulus', 'last_education~nilai_sikap~age~nilai_online~', '=\"pasca\"~=\"sangat baik\"~=\"25-35\"~=\"80-89\"~', 'lulus'),
(147, 'nilai_online', '90-100', 144, 'lulus', 'last_education~nilai_sikap~age~nilai_online~', '=\"pasca\"~=\"sangat baik\"~=\"25-35\"~=\"90-100\"~', 'lulus'),
(148, 'total_ability', 'total_ability', 67, NULL, 'last_education~nilai_sikap~age~total_ability~', '', '#ROOT'),
(149, 'total_ability', '5-7', 148, 'gagal', 'last_education~nilai_sikap~age~total_ability~', '=\"pasca\"~=\"sangat baik\"~=\"> 35\"~=\"5-7\"~', 'gagal'),
(150, 'total_ability', '8-10', 148, NULL, 'last_education~nilai_sikap~age~total_ability~', '=\"pasca\"~=\"sangat baik\"~=\"> 35\"~=\"8-10\"~', 'stop_child'),
(151, 'nilai_f2f', 'nilai_f2f', 69, NULL, 'last_education~experience~age~nilai_online~nilai_f2f~', '', '#ROOT'),
(152, 'nilai_f2f', '70-79', 151, 'gagal', 'last_education~experience~age~nilai_online~nilai_f2f~', '=\"sma\"~=\"0 tahun\"~=\"25-35\"~=\"70-79\"~=\"70-79\"~', 'gagal'),
(153, 'nilai_f2f', '80-89', 151, '#SKIP', 'last_education~experience~age~nilai_online~nilai_f2f~', '=\"sma\"~=\"0 tahun\"~=\"25-35\"~=\"70-79\"~=\"80-89\"~', '#SKIP'),
(154, 'nilai_f2f', '90-100', 151, NULL, 'last_education~experience~age~nilai_online~nilai_f2f~', '=\"sma\"~=\"0 tahun\"~=\"25-35\"~=\"70-79\"~=\"90-100\"~', 'stop_child'),
(155, 'nilai_sikap', 'nilai_sikap', 71, NULL, 'last_education~experience~age~nilai_online~nilai_sikap~', '', '#ROOT'),
(156, 'nilai_sikap', 'cukup baik', 155, '#SKIP', 'last_education~experience~age~nilai_online~nilai_sikap~', '=\"sma\"~=\"0 tahun\"~=\"25-35\"~=\"90-100\"~=\"cukup baik\"~', '#SKIP'),
(157, 'nilai_sikap', 'baik', 155, 'gagal', 'last_education~experience~age~nilai_online~nilai_sikap~', '=\"sma\"~=\"0 tahun\"~=\"25-35\"~=\"90-100\"~=\"baik\"~', 'gagal'),
(158, 'nilai_sikap', 'sangat baik', 155, 'lulus', 'last_education~experience~age~nilai_online~nilai_sikap~', '=\"sma\"~=\"0 tahun\"~=\"25-35\"~=\"90-100\"~=\"sangat baik\"~', 'lulus'),
(159, 'total_ability', 'total_ability', 74, NULL, 'last_education~experience~age~status~total_ability~', '', '#ROOT'),
(160, 'total_ability', '5-7', 159, 'gagal', 'last_education~experience~age~status~total_ability~', '=\"sma\"~=\"0 tahun\"~=\"> 35\"~=\"menikah\"~=\"5-7\"~', 'gagal'),
(161, 'total_ability', '8-10', 159, 'lulus', 'last_education~experience~age~status~total_ability~', '=\"sma\"~=\"0 tahun\"~=\"> 35\"~=\"menikah\"~=\"8-10\"~', 'lulus'),
(162, 'status', 'status', 76, NULL, 'last_education~experience~nilai_online~nilai_sikap~status~', '', '#ROOT'),
(163, 'status', 'lajang', 162, 'gagal', 'last_education~experience~nilai_online~nilai_sikap~status~', '=\"sma\"~=\"1-2 tahun\"~=\"70-79\"~=\"cukup baik\"~=\"lajang\"~', 'gagal'),
(164, 'status', 'menikah', 162, 'lulus', 'last_education~experience~nilai_online~nilai_sikap~status~', '=\"sma\"~=\"1-2 tahun\"~=\"70-79\"~=\"cukup baik\"~=\"menikah\"~', 'lulus'),
(165, 'nilai_f2f', 'nilai_f2f', 80, NULL, 'last_education~experience~nilai_online~age~nilai_f2f~', '', '#ROOT'),
(166, 'nilai_f2f', '70-79', 165, 'lulus', 'last_education~experience~nilai_online~age~nilai_f2f~', '=\"sma\"~=\"1-2 tahun\"~=\"90-100\"~=\"< 25\"~=\"70-79\"~', 'lulus'),
(167, 'nilai_f2f', '80-89', 165, 'gagal', 'last_education~experience~nilai_online~age~nilai_f2f~', '=\"sma\"~=\"1-2 tahun\"~=\"90-100\"~=\"< 25\"~=\"80-89\"~', 'gagal'),
(168, 'nilai_f2f', '90-100', 165, 'lulus', 'last_education~experience~nilai_online~age~nilai_f2f~', '=\"sma\"~=\"1-2 tahun\"~=\"90-100\"~=\"< 25\"~=\"90-100\"~', 'lulus'),
(169, 'nilai_f2f', 'nilai_f2f', 84, NULL, 'last_education~experience~status~nilai_sikap~nilai_f2f~', '', '#ROOT'),
(170, 'nilai_f2f', '70-79', 169, 'gagal', 'last_education~experience~status~nilai_sikap~nilai_f2f~', '=\"sma\"~=\"> 2 tahun\"~=\"lajang\"~=\"cukup baik\"~=\"70-79\"~', 'gagal'),
(171, 'nilai_f2f', '80-89', 169, 'lulus', 'last_education~experience~status~nilai_sikap~nilai_f2f~', '=\"sma\"~=\"> 2 tahun\"~=\"lajang\"~=\"cukup baik\"~=\"80-89\"~', 'lulus'),
(172, 'nilai_f2f', '90-100', 169, '#SKIP', 'last_education~experience~status~nilai_sikap~nilai_f2f~', '=\"sma\"~=\"> 2 tahun\"~=\"lajang\"~=\"cukup baik\"~=\"90-100\"~', '#SKIP'),
(173, 'nilai_online', 'nilai_online', 86, NULL, 'last_education~experience~status~nilai_sikap~nilai_online~', '', '#ROOT'),
(174, 'nilai_online', '70-79', 173, 'lulus', 'last_education~experience~status~nilai_sikap~nilai_online~', '=\"sma\"~=\"> 2 tahun\"~=\"lajang\"~=\"sangat baik\"~=\"70-79\"~', 'lulus'),
(175, 'nilai_online', '80-89', 173, 'gagal', 'last_education~experience~status~nilai_sikap~nilai_online~', '=\"sma\"~=\"> 2 tahun\"~=\"lajang\"~=\"sangat baik\"~=\"80-89\"~', 'gagal'),
(176, 'nilai_online', '90-100', 173, '#SKIP', 'last_education~experience~status~nilai_sikap~nilai_online~', '=\"sma\"~=\"> 2 tahun\"~=\"lajang\"~=\"sangat baik\"~=\"90-100\"~', '#SKIP'),
(177, 'nilai_online', 'nilai_online', 88, NULL, 'last_education~experience~status~age~nilai_online~', '', '#ROOT'),
(178, 'nilai_online', '70-79', 177, NULL, 'last_education~experience~status~age~nilai_online~', '=\"sma\"~=\"> 2 tahun\"~=\"menikah\"~=\"< 25\"~=\"70-79\"~', 'stop_child'),
(179, 'nilai_online', '80-89', 177, '#SKIP', 'last_education~experience~status~age~nilai_online~', '=\"sma\"~=\"> 2 tahun\"~=\"menikah\"~=\"< 25\"~=\"80-89\"~', '#SKIP'),
(180, 'nilai_online', '90-100', 177, 'lulus', 'last_education~experience~status~age~nilai_online~', '=\"sma\"~=\"> 2 tahun\"~=\"menikah\"~=\"< 25\"~=\"90-100\"~', 'lulus'),
(181, 'total_ability', 'total_ability', 93, NULL, 'last_education~nilai_f2f~experience~nilai_online~total_ability~', '', '#ROOT'),
(182, 'total_ability', '5-7', 181, 'gagal', 'last_education~nilai_f2f~experience~nilai_online~total_ability~', '=\"akademi\"~=\"70-79\"~=\"> 2 tahun\"~=\"80-89\"~=\"5-7\"~', 'gagal'),
(183, 'total_ability', '8-10', 181, 'lulus', 'last_education~nilai_f2f~experience~nilai_online~total_ability~', '=\"akademi\"~=\"70-79\"~=\"> 2 tahun\"~=\"80-89\"~=\"8-10\"~', 'lulus'),
(184, 'age', 'age', 94, NULL, 'last_education~nilai_f2f~experience~nilai_online~age~', '', '#ROOT'),
(185, 'age', '< 25', 184, 'lulus', 'last_education~nilai_f2f~experience~nilai_online~age~', '=\"akademi\"~=\"70-79\"~=\"> 2 tahun\"~=\"90-100\"~=\"< 25\"~', 'lulus'),
(186, 'age', '25-35', 184, 'gagal', 'last_education~nilai_f2f~experience~nilai_online~age~', '=\"akademi\"~=\"70-79\"~=\"> 2 tahun\"~=\"90-100\"~=\"25-35\"~', 'gagal'),
(187, 'age', '> 35', 184, 'lulus', 'last_education~nilai_f2f~experience~nilai_online~age~', '=\"akademi\"~=\"70-79\"~=\"> 2 tahun\"~=\"90-100\"~=\"> 35\"~', 'lulus'),
(188, 'status', 'status', 98, NULL, 'last_education~nilai_f2f~age~experience~status~', '', '#ROOT'),
(189, 'status', 'lajang', 188, 'lulus', 'last_education~nilai_f2f~age~experience~status~', '=\"akademi\"~=\"80-89\"~=\"25-35\"~=\"> 2 tahun\"~=\"lajang\"~', 'lulus'),
(190, 'status', 'menikah', 188, 'gagal', 'last_education~nilai_f2f~age~experience~status~', '=\"akademi\"~=\"80-89\"~=\"25-35\"~=\"> 2 tahun\"~=\"menikah\"~', 'gagal'),
(191, 'experience', 'experience', 102, NULL, 'last_education~nilai_f2f~nilai_sikap~age~experience~', '', '#ROOT'),
(192, 'experience', '0 tahun', 191, 'gagal', 'last_education~nilai_f2f~nilai_sikap~age~experience~', '=\"akademi\"~=\"90-100\"~=\"cukup baik\"~=\"> 35\"~=\"0 tahun\"~', 'gagal'),
(193, 'experience', '1-2 tahun', 191, '#SKIP', 'last_education~nilai_f2f~nilai_sikap~age~experience~', '=\"akademi\"~=\"90-100\"~=\"cukup baik\"~=\"> 35\"~=\"1-2 tahun\"~', '#SKIP'),
(194, 'experience', '> 2 tahun', 191, 'lulus', 'last_education~nilai_f2f~nilai_sikap~age~experience~', '=\"akademi\"~=\"90-100\"~=\"cukup baik\"~=\"> 35\"~=\"> 2 tahun\"~', 'lulus'),
(195, 'status', 'status', 108, NULL, 'last_education~nilai_f2f~experience~nilai_sikap~status~', '', '#ROOT'),
(196, 'status', 'lajang', 195, 'gagal', 'last_education~nilai_f2f~experience~nilai_sikap~status~', '=\"sarjana\"~=\"70-79\"~=\"0 tahun\"~=\"cukup baik\"~=\"lajang\"~', 'gagal'),
(197, 'status', 'menikah', 195, 'lulus', 'last_education~nilai_f2f~experience~nilai_sikap~status~', '=\"sarjana\"~=\"70-79\"~=\"0 tahun\"~=\"cukup baik\"~=\"menikah\"~', 'lulus'),
(198, 'status', 'status', 110, NULL, 'last_education~nilai_f2f~experience~nilai_sikap~status~', '', '#ROOT'),
(199, 'status', 'lajang', 198, 'lulus', 'last_education~nilai_f2f~experience~nilai_sikap~status~', '=\"sarjana\"~=\"70-79\"~=\"0 tahun\"~=\"sangat baik\"~=\"lajang\"~', 'lulus'),
(200, 'status', 'menikah', 198, NULL, 'last_education~nilai_f2f~experience~nilai_sikap~status~', '=\"sarjana\"~=\"70-79\"~=\"0 tahun\"~=\"sangat baik\"~=\"menikah\"~', 'stop_child'),
(201, 'age', 'age', 114, NULL, 'last_education~nilai_f2f~experience~nilai_sikap~age~', '', '#ROOT'),
(202, 'age', '< 25', 201, 'lulus', 'last_education~nilai_f2f~experience~nilai_sikap~age~', '=\"sarjana\"~=\"70-79\"~=\"> 2 tahun\"~=\"sangat baik\"~=\"< 25\"~', 'lulus'),
(203, 'age', '25-35', 201, '#SKIP', 'last_education~nilai_f2f~experience~nilai_sikap~age~', '=\"sarjana\"~=\"70-79\"~=\"> 2 tahun\"~=\"sangat baik\"~=\"25-35\"~', '#SKIP'),
(204, 'age', '> 35', 201, 'gagal', 'last_education~nilai_f2f~experience~nilai_sikap~age~', '=\"sarjana\"~=\"70-79\"~=\"> 2 tahun\"~=\"sangat baik\"~=\"> 35\"~', 'gagal'),
(205, 'experience', 'experience', 116, NULL, 'last_education~nilai_f2f~nilai_sikap~status~experience~', '', '#ROOT'),
(206, 'experience', '0 tahun', 205, 'gagal', 'last_education~nilai_f2f~nilai_sikap~status~experience~', '=\"sarjana\"~=\"80-89\"~=\"cukup baik\"~=\"lajang\"~=\"0 tahun\"~', 'gagal'),
(207, 'experience', '1-2 tahun', 205, 'lulus', 'last_education~nilai_f2f~nilai_sikap~status~experience~', '=\"sarjana\"~=\"80-89\"~=\"cukup baik\"~=\"lajang\"~=\"1-2 tahun\"~', 'lulus'),
(208, 'experience', '> 2 tahun', 205, 'gagal', 'last_education~nilai_f2f~nilai_sikap~status~experience~', '=\"sarjana\"~=\"80-89\"~=\"cukup baik\"~=\"lajang\"~=\"> 2 tahun\"~', 'gagal'),
(209, 'nilai_online', 'nilai_online', 123, NULL, 'last_education~nilai_f2f~nilai_sikap~status~nilai_online~', '', '#ROOT'),
(210, 'nilai_online', '70-79', 209, NULL, 'last_education~nilai_f2f~nilai_sikap~status~nilai_online~', '=\"sarjana\"~=\"90-100\"~=\"sangat baik\"~=\"lajang\"~=\"70-79\"~', 'stop_child'),
(211, 'nilai_online', '80-89', 209, 'lulus', 'last_education~nilai_f2f~nilai_sikap~status~nilai_online~', '=\"sarjana\"~=\"90-100\"~=\"sangat baik\"~=\"lajang\"~=\"80-89\"~', 'lulus'),
(212, 'nilai_online', '90-100', 209, NULL, 'last_education~nilai_f2f~nilai_sikap~status~nilai_online~', '=\"sarjana\"~=\"90-100\"~=\"sangat baik\"~=\"lajang\"~=\"90-100\"~', 'stop_child'),
(213, 'experience', 'experience', 126, NULL, 'last_education~nilai_sikap~age~nilai_online~experience~', '', '#ROOT'),
(214, 'experience', '0 tahun', 213, 'lulus', 'last_education~nilai_sikap~age~nilai_online~experience~', '=\"pasca\"~=\"cukup baik\"~=\"25-35\"~=\"70-79\"~=\"0 tahun\"~', 'lulus'),
(215, 'experience', '1-2 tahun', 213, 'gagal', 'last_education~nilai_sikap~age~nilai_online~experience~', '=\"pasca\"~=\"cukup baik\"~=\"25-35\"~=\"70-79\"~=\"1-2 tahun\"~', 'gagal'),
(216, 'experience', '> 2 tahun', 213, '#SKIP', 'last_education~nilai_sikap~age~nilai_online~experience~', '=\"pasca\"~=\"cukup baik\"~=\"25-35\"~=\"70-79\"~=\"> 2 tahun\"~', '#SKIP'),
(217, 'experience', 'experience', 128, NULL, 'last_education~nilai_sikap~age~nilai_online~experience~', '', '#ROOT'),
(218, 'experience', '0 tahun', 217, 'lulus', 'last_education~nilai_sikap~age~nilai_online~experience~', '=\"pasca\"~=\"cukup baik\"~=\"25-35\"~=\"90-100\"~=\"0 tahun\"~', 'lulus'),
(219, 'experience', '1-2 tahun', 217, 'lulus', 'last_education~nilai_sikap~age~nilai_online~experience~', '=\"pasca\"~=\"cukup baik\"~=\"25-35\"~=\"90-100\"~=\"1-2 tahun\"~', 'lulus'),
(220, 'experience', '> 2 tahun', 217, 'gagal', 'last_education~nilai_sikap~age~nilai_online~experience~', '=\"pasca\"~=\"cukup baik\"~=\"25-35\"~=\"90-100\"~=\"> 2 tahun\"~', 'gagal'),
(221, 'experience', 'experience', 130, NULL, 'last_education~nilai_sikap~age~total_ability~experience~', '', '#ROOT'),
(222, 'experience', '0 tahun', 221, '#SKIP', 'last_education~nilai_sikap~age~total_ability~experience~', '=\"pasca\"~=\"cukup baik\"~=\"> 35\"~=\"5-7\"~=\"0 tahun\"~', '#SKIP'),
(223, 'experience', '1-2 tahun', 221, 'gagal', 'last_education~nilai_sikap~age~total_ability~experience~', '=\"pasca\"~=\"cukup baik\"~=\"> 35\"~=\"5-7\"~=\"1-2 tahun\"~', 'gagal'),
(224, 'experience', '> 2 tahun', 221, 'lulus', 'last_education~nilai_sikap~age~total_ability~experience~', '=\"pasca\"~=\"cukup baik\"~=\"> 35\"~=\"5-7\"~=\"> 2 tahun\"~', 'lulus'),
(225, 'experience', 'experience', 134, NULL, 'last_education~nilai_sikap~status~age~experience~', '', '#ROOT'),
(226, 'experience', '0 tahun', 225, NULL, 'last_education~nilai_sikap~status~age~experience~', '=\"pasca\"~=\"baik\"~=\"lajang\"~=\"25-35\"~=\"0 tahun\"~', 'stop_child'),
(227, 'experience', '1-2 tahun', 225, 'gagal', 'last_education~nilai_sikap~status~age~experience~', '=\"pasca\"~=\"baik\"~=\"lajang\"~=\"25-35\"~=\"1-2 tahun\"~', 'gagal'),
(228, 'experience', '> 2 tahun', 225, 'lulus', 'last_education~nilai_sikap~status~age~experience~', '=\"pasca\"~=\"baik\"~=\"lajang\"~=\"25-35\"~=\"> 2 tahun\"~', 'lulus'),
(229, 'experience', 'experience', 137, NULL, 'last_education~nilai_sikap~status~nilai_online~experience~', '', '#ROOT'),
(230, 'experience', '0 tahun', 229, '#SKIP', 'last_education~nilai_sikap~status~nilai_online~experience~', '=\"pasca\"~=\"baik\"~=\"menikah\"~=\"70-79\"~=\"0 tahun\"~', '#SKIP'),
(231, 'experience', '1-2 tahun', 229, 'lulus', 'last_education~nilai_sikap~status~nilai_online~experience~', '=\"pasca\"~=\"baik\"~=\"menikah\"~=\"70-79\"~=\"1-2 tahun\"~', 'lulus'),
(232, 'experience', '> 2 tahun', 229, 'gagal', 'last_education~nilai_sikap~status~nilai_online~experience~', '=\"pasca\"~=\"baik\"~=\"menikah\"~=\"70-79\"~=\"> 2 tahun\"~', 'gagal'),
(233, 'experience', 'experience', 145, NULL, 'last_education~nilai_sikap~age~nilai_online~experience~', '', '#ROOT'),
(234, 'experience', '0 tahun', 233, '#SKIP', 'last_education~nilai_sikap~age~nilai_online~experience~', '=\"pasca\"~=\"sangat baik\"~=\"25-35\"~=\"70-79\"~=\"0 tahun\"~', '#SKIP'),
(235, 'experience', '1-2 tahun', 233, 'lulus', 'last_education~nilai_sikap~age~nilai_online~experience~', '=\"pasca\"~=\"sangat baik\"~=\"25-35\"~=\"70-79\"~=\"1-2 tahun\"~', 'lulus'),
(236, 'experience', '> 2 tahun', 233, 'gagal', 'last_education~nilai_sikap~age~nilai_online~experience~', '=\"pasca\"~=\"sangat baik\"~=\"25-35\"~=\"70-79\"~=\"> 2 tahun\"~', 'gagal'),
(237, 'status', 'status', 150, NULL, 'last_education~nilai_sikap~age~total_ability~status~', '', '#ROOT'),
(238, 'status', 'lajang', 237, 'gagal', 'last_education~nilai_sikap~age~total_ability~status~', '=\"pasca\"~=\"sangat baik\"~=\"> 35\"~=\"8-10\"~=\"lajang\"~', 'gagal'),
(239, 'status', 'menikah', 237, 'lulus', 'last_education~nilai_sikap~age~total_ability~status~', '=\"pasca\"~=\"sangat baik\"~=\"> 35\"~=\"8-10\"~=\"menikah\"~', 'lulus'),
(240, 'nilai_sikap', 'nilai_sikap', 154, NULL, 'last_education~experience~age~nilai_online~nilai_f2f~nilai_sikap~', '', '#ROOT'),
(241, 'nilai_sikap', 'cukup baik', 240, 'lulus', 'last_education~experience~age~nilai_online~nilai_f2f~nilai_sikap~', '=\"sma\"~=\"0 tahun\"~=\"25-35\"~=\"70-79\"~=\"90-100\"~=\"cukup baik\"~', 'lulus'),
(242, 'nilai_sikap', 'baik', 240, '#SKIP', 'last_education~experience~age~nilai_online~nilai_f2f~nilai_sikap~', '=\"sma\"~=\"0 tahun\"~=\"25-35\"~=\"70-79\"~=\"90-100\"~=\"baik\"~', '#SKIP'),
(243, 'nilai_sikap', 'sangat baik', 240, 'gagal', 'last_education~experience~age~nilai_online~nilai_f2f~nilai_sikap~', '=\"sma\"~=\"0 tahun\"~=\"25-35\"~=\"70-79\"~=\"90-100\"~=\"sangat baik\"~', 'gagal'),
(244, 'nilai_f2f', 'nilai_f2f', 178, NULL, 'last_education~experience~status~age~nilai_online~nilai_f2f~', '', '#ROOT'),
(245, 'nilai_f2f', '70-79', 244, '#SKIP', 'last_education~experience~status~age~nilai_online~nilai_f2f~', '=\"sma\"~=\"> 2 tahun\"~=\"menikah\"~=\"< 25\"~=\"70-79\"~=\"70-79\"~', '#SKIP'),
(246, 'nilai_f2f', '80-89', 244, 'gagal', 'last_education~experience~status~age~nilai_online~nilai_f2f~', '=\"sma\"~=\"> 2 tahun\"~=\"menikah\"~=\"< 25\"~=\"70-79\"~=\"80-89\"~', 'gagal'),
(247, 'nilai_f2f', '90-100', 244, 'lulus', 'last_education~experience~status~age~nilai_online~nilai_f2f~', '=\"sma\"~=\"> 2 tahun\"~=\"menikah\"~=\"< 25\"~=\"70-79\"~=\"90-100\"~', 'lulus'),
(248, 'age', 'age', 200, NULL, 'last_education~nilai_f2f~experience~nilai_sikap~status~age~', '', '#ROOT'),
(249, 'age', '< 25', 248, 'lulus', 'last_education~nilai_f2f~experience~nilai_sikap~status~age~', '=\"sarjana\"~=\"70-79\"~=\"0 tahun\"~=\"sangat baik\"~=\"menikah\"~=\"< 25\"~', 'lulus'),
(250, 'age', '25-35', 248, 'gagal', 'last_education~nilai_f2f~experience~nilai_sikap~status~age~', '=\"sarjana\"~=\"70-79\"~=\"0 tahun\"~=\"sangat baik\"~=\"menikah\"~=\"25-35\"~', 'gagal'),
(251, 'age', '> 35', 248, '#SKIP', 'last_education~nilai_f2f~experience~nilai_sikap~status~age~', '=\"sarjana\"~=\"70-79\"~=\"0 tahun\"~=\"sangat baik\"~=\"menikah\"~=\"> 35\"~', '#SKIP'),
(252, 'experience', 'experience', 210, NULL, 'last_education~nilai_f2f~nilai_sikap~status~nilai_online~experience~', '', '#ROOT'),
(253, 'experience', '0 tahun', 252, 'lulus', 'last_education~nilai_f2f~nilai_sikap~status~nilai_online~experience~', '=\"sarjana\"~=\"90-100\"~=\"sangat baik\"~=\"lajang\"~=\"70-79\"~=\"0 tahun\"~', 'lulus'),
(254, 'experience', '1-2 tahun', 252, '#SKIP', 'last_education~nilai_f2f~nilai_sikap~status~nilai_online~experience~', '=\"sarjana\"~=\"90-100\"~=\"sangat baik\"~=\"lajang\"~=\"70-79\"~=\"1-2 tahun\"~', '#SKIP'),
(255, 'experience', '> 2 tahun', 252, 'gagal', 'last_education~nilai_f2f~nilai_sikap~status~nilai_online~experience~', '=\"sarjana\"~=\"90-100\"~=\"sangat baik\"~=\"lajang\"~=\"70-79\"~=\"> 2 tahun\"~', 'gagal'),
(256, 'experience', 'experience', 212, NULL, 'last_education~nilai_f2f~nilai_sikap~status~nilai_online~experience~', '', '#ROOT'),
(257, 'experience', '0 tahun', 256, 'gagal', 'last_education~nilai_f2f~nilai_sikap~status~nilai_online~experience~', '=\"sarjana\"~=\"90-100\"~=\"sangat baik\"~=\"lajang\"~=\"90-100\"~=\"0 tahun\"~', 'gagal'),
(258, 'experience', '1-2 tahun', 256, 'lulus', 'last_education~nilai_f2f~nilai_sikap~status~nilai_online~experience~', '=\"sarjana\"~=\"90-100\"~=\"sangat baik\"~=\"lajang\"~=\"90-100\"~=\"1-2 tahun\"~', 'lulus'),
(259, 'experience', '> 2 tahun', 256, '#SKIP', 'last_education~nilai_f2f~nilai_sikap~status~nilai_online~experience~', '=\"sarjana\"~=\"90-100\"~=\"sangat baik\"~=\"lajang\"~=\"90-100\"~=\"> 2 tahun\"~', '#SKIP'),
(260, 'nilai_f2f', 'nilai_f2f', 226, NULL, 'last_education~nilai_sikap~status~age~experience~nilai_f2f~', '', '#ROOT'),
(261, 'nilai_f2f', '70-79', 260, 'lulus', 'last_education~nilai_sikap~status~age~experience~nilai_f2f~', '=\"pasca\"~=\"baik\"~=\"lajang\"~=\"25-35\"~=\"0 tahun\"~=\"70-79\"~', 'lulus'),
(262, 'nilai_f2f', '80-89', 260, 'gagal', 'last_education~nilai_sikap~status~age~experience~nilai_f2f~', '=\"pasca\"~=\"baik\"~=\"lajang\"~=\"25-35\"~=\"0 tahun\"~=\"80-89\"~', 'gagal'),
(263, 'nilai_f2f', '90-100', 260, 'gagal', 'last_education~nilai_sikap~status~age~experience~nilai_f2f~', '=\"pasca\"~=\"baik\"~=\"lajang\"~=\"25-35\"~=\"0 tahun\"~=\"90-100\"~', 'gagal');

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule`
--

CREATE TABLE `cart_rule` (
  `id` int(6) NOT NULL,
  `atribut` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `left_keputusan` varchar(255) DEFAULT NULL,
  `right_keputusan` varchar(255) DEFAULT NULL,
  `keputusan` varchar(255) DEFAULT NULL,
  `link` int(6) DEFAULT NULL,
  `status_hitung` varchar(255) NOT NULL,
  `atribut_cek` text NOT NULL,
  `label_kiri` text NOT NULL,
  `label_kanan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_rule`
--

INSERT INTO `cart_rule` (`id`, `atribut`, `label`, `left_keputusan`, `right_keputusan`, `keputusan`, `link`, `status_hitung`, `atribut_cek`, `label_kiri`, `label_kanan`) VALUES
(1, 'nilai_f2f', 'nilai_f2f', '=\"70-79\"', '!=\"70-79\"', NULL, NULL, 'root', '', '', ''),
(2, 'experience', '=\"70-79\"', '=\"1-2 tahun\"', '!=\"1-2 tahun\"', NULL, 1, 'stop', 'nilai_f2f~experience~', '=\"70-79\"~=\"1-2 tahun\"~', '=\"70-79\"~!=\"1-2 tahun\"~'),
(3, 'last_education', '!=\"70-79\"', '=\"sarjana\"', '!=\"sarjana\"', NULL, 1, 'stop', 'nilai_f2f~last_education~', '!=\"70-79\"~=\"sarjana\"~', '!=\"70-79\"~!=\"sarjana\"~'),
(4, 'last_education', '=\"1-2 tahun\"', '=\"pasca\"', '!=\"pasca\"', NULL, 2, 'stop', 'nilai_f2f~experience~~last_education~', '=\"70-79\"~=\"1-2 tahun\"~~=\"pasca\"~', '=\"70-79\"~=\"1-2 tahun\"~~!=\"pasca\"~'),
(5, 'nilai_sikap', '!=\"1-2 tahun\"', '=\"sangat baik\"', '!=\"sangat baik\"', NULL, 2, 'stop', 'nilai_f2f~experience~~nilai_sikap~', '=\"70-79\"~!=\"1-2 tahun\"~~=\"sangat baik\"~', '=\"70-79\"~!=\"1-2 tahun\"~~!=\"sangat baik\"~'),
(6, 'age', '=\"sarjana\"', '=\"25-35\"', '!=\"25-35\"', NULL, 3, 'stop', 'nilai_f2f~last_education~~age~', '!=\"70-79\"~=\"sarjana\"~~=\"25-35\"~', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~'),
(7, 'last_education', '!=\"sarjana\"', '=\"akademi\"', '!=\"akademi\"', NULL, 3, 'stop', 'nilai_f2f~last_education~~last_education~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~'),
(8, 'status', '=\"pasca\"', 'lajang', NULL, 'gagal', 4, 'stop', '', '', ''),
(9, 'status', '=\"pasca\"', NULL, '!=\"lajang\"', NULL, 4, 'stop', 'nilai_f2f~experience~~last_education~~status~', '', '=\"70-79\"~=\"1-2 tahun\"~~=\"pasca\"~~!=\"lajang\"~'),
(10, 'age', '!=\"pasca\"', '=\"< 25\"', NULL, NULL, 4, 'stop', 'nilai_f2f~experience~~last_education~~age~', '=\"70-79\"~=\"1-2 tahun\"~~!=\"pasca\"~~=\"< 25\"~', ''),
(11, 'age', '!=\"pasca\"', NULL, '< 25', 'gagal', 4, 'stop', '', '', ''),
(12, 'status', '=\"sangat baik\"', '=\"lajang\"', '!=\"lajang\"', NULL, 5, 'stop', 'nilai_f2f~experience~~nilai_sikap~~status~', '=\"70-79\"~!=\"1-2 tahun\"~~=\"sangat baik\"~~=\"lajang\"~', '=\"70-79\"~!=\"1-2 tahun\"~~=\"sangat baik\"~~!=\"lajang\"~'),
(13, 'nilai_online', '!=\"sangat baik\"', NULL, '!=\"80-89\"', NULL, 5, 'stop', 'nilai_f2f~experience~~nilai_sikap~~nilai_online~', '', '=\"70-79\"~!=\"1-2 tahun\"~~!=\"sangat baik\"~~!=\"80-89\"~'),
(14, 'experience', '=\"25-35\"', '=\"0 tahun\"', NULL, NULL, 6, 'stop', 'nilai_f2f~last_education~~age~~experience~', '!=\"70-79\"~=\"sarjana\"~~=\"25-35\"~~=\"0 tahun\"~', ''),
(15, 'experience', '=\"25-35\"', NULL, '0 tahun', 'lulus', 6, 'stop', '', '', ''),
(16, 'experience', '!=\"25-35\"', '=\"1-2 tahun\"', '!=\"1-2 tahun\"', NULL, 6, 'stop', 'nilai_f2f~last_education~~age~~experience~', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~~=\"1-2 tahun\"~', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~~!=\"1-2 tahun\"~'),
(17, 'nilai_f2f', '=\"akademi\"', '=\"80-89\"', '!=\"80-89\"', NULL, 7, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~=\"80-89\"~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~'),
(18, 'experience', '!=\"akademi\"', '=\"1-2 tahun\"', '!=\"1-2 tahun\"', NULL, 7, 'stop', 'nilai_f2f~last_education~~last_education~~experience~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~'),
(19, 'total_ability', '!=\"lajang\"', '5-7', NULL, 'gagal', 9, 'stop', '', '', ''),
(20, 'total_ability', '!=\"lajang\"', NULL, '!=\"5-7\"', NULL, 9, 'stop', 'nilai_f2f~experience~~last_education~~status~~total_ability~', '', '=\"70-79\"~=\"1-2 tahun\"~~=\"pasca\"~~!=\"lajang\"~~!=\"5-7\"~'),
(21, 'total_ability', '=\"< 25\"', '5-7', NULL, 'lulus', 10, 'stop', '', '', ''),
(22, 'total_ability', '=\"< 25\"', NULL, '5-7', 'gagal', 10, 'stop', '', '', ''),
(23, 'age', '=\"lajang\"', '=\"> 35\"', NULL, NULL, 12, 'stop', 'nilai_f2f~experience~~nilai_sikap~~status~~age~', '=\"70-79\"~!=\"1-2 tahun\"~~=\"sangat baik\"~~=\"lajang\"~~=\"> 35\"~', ''),
(24, 'age', '=\"lajang\"', NULL, '> 35', 'lulus', 12, 'stop', '', '', ''),
(25, 'age', '!=\"lajang\"', '> 35', NULL, 'gagal', 12, 'stop', '', '', ''),
(26, 'age', '!=\"lajang\"', NULL, '!=\"> 35\"', NULL, 12, 'stop', 'nilai_f2f~experience~~nilai_sikap~~status~~age~', '', '=\"70-79\"~!=\"1-2 tahun\"~~=\"sangat baik\"~~!=\"lajang\"~~!=\"> 35\"~'),
(27, 'age', '!=\"80-89\"', '=\"25-35\"', '!=\"25-35\"', NULL, 13, 'stop', 'nilai_f2f~experience~~nilai_sikap~~nilai_online~~age~', '=\"70-79\"~!=\"1-2 tahun\"~~!=\"sangat baik\"~~!=\"80-89\"~~=\"25-35\"~', '=\"70-79\"~!=\"1-2 tahun\"~~!=\"sangat baik\"~~!=\"80-89\"~~!=\"25-35\"~'),
(28, 'total_ability', '=\"0 tahun\"', '5-7', NULL, 'gagal', 14, 'stop', '', '', ''),
(29, 'total_ability', '=\"0 tahun\"', NULL, '5-7', 'lulus', 14, 'stop', '', '', ''),
(30, 'nilai_sikap', '=\"1-2 tahun\"', '=\"baik\"', NULL, NULL, 16, 'stop', 'nilai_f2f~last_education~~age~~experience~~nilai_sikap~', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~~=\"1-2 tahun\"~~=\"baik\"~', ''),
(31, 'nilai_sikap', '=\"1-2 tahun\"', NULL, 'baik', 'lulus', 16, 'stop', '', '', ''),
(32, 'nilai_sikap', '!=\"1-2 tahun\"', 'baik', NULL, 'lulus', 16, 'stop', '', '', ''),
(33, 'nilai_sikap', '!=\"1-2 tahun\"', NULL, '!=\"baik\"', NULL, 16, 'stop', 'nilai_f2f~last_education~~age~~experience~~nilai_sikap~', '', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~~!=\"1-2 tahun\"~~!=\"baik\"~'),
(34, 'age', '=\"80-89\"', '=\"25-35\"', NULL, NULL, 17, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~~age~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~=\"80-89\"~~=\"25-35\"~', ''),
(35, 'age', '=\"80-89\"', NULL, '25-35', 'lulus', 17, 'stop', '', '', ''),
(36, 'nilai_sikap', '!=\"80-89\"', '=\"cukup baik\"', '!=\"cukup baik\"', NULL, 17, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~~nilai_sikap~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~~=\"cukup baik\"~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~~!=\"cukup baik\"~'),
(37, 'total_ability', '=\"1-2 tahun\"', '=\"5-7\"', '!=\"5-7\"', NULL, 18, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~=\"5-7\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~'),
(38, 'total_ability', '!=\"1-2 tahun\"', '=\"5-7\"', '!=\"5-7\"', NULL, 18, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~'),
(39, 'age', '!=\"5-7\"', NULL, '!=\"< 25\"', NULL, 20, '#DataTidakJelas', 'nilai_f2f~experience~~last_education~~status~~total_ability~~age~', '', '=\"70-79\"~=\"1-2 tahun\"~~=\"pasca\"~~!=\"lajang\"~~!=\"5-7\"~~!=\"< 25\"~'),
(40, 'last_education', '=\"> 35\"', 'sma', NULL, 'gagal', 23, 'stop', '', '', ''),
(41, 'last_education', '=\"> 35\"', NULL, 'sma', 'lulus', 23, 'stop', '', '', ''),
(42, 'total_ability', '!=\"> 35\"', '5-7', NULL, 'lulus', 26, 'stop', '', '', ''),
(43, 'total_ability', '!=\"> 35\"', NULL, '5-7', 'gagal', 26, 'stop', '', '', ''),
(44, 'last_education', '=\"25-35\"', 'pasca', NULL, 'lulus', 27, 'stop', '', '', ''),
(45, 'last_education', '=\"25-35\"', NULL, '!=\"pasca\"', NULL, 27, 'stop', 'nilai_f2f~experience~~nilai_sikap~~nilai_online~~age~~last_education~', '', '=\"70-79\"~!=\"1-2 tahun\"~~!=\"sangat baik\"~~!=\"80-89\"~~=\"25-35\"~~!=\"pasca\"~'),
(46, 'last_education', '!=\"25-35\"', '=\"akademi\"', NULL, NULL, 27, 'stop', 'nilai_f2f~experience~~nilai_sikap~~nilai_online~~age~~last_education~', '=\"70-79\"~!=\"1-2 tahun\"~~!=\"sangat baik\"~~!=\"80-89\"~~!=\"25-35\"~~=\"akademi\"~', ''),
(47, 'last_education', '!=\"25-35\"', NULL, 'akademi', 'gagal', 27, 'stop', '', '', ''),
(48, 'age', '=\"baik\"', '< 25', NULL, 'lulus', 30, 'stop', '', '', ''),
(49, 'age', '=\"baik\"', NULL, '< 25', 'gagal', 30, 'stop', '', '', ''),
(50, 'nilai_sikap', '!=\"baik\"', 'cukup baik', NULL, 'gagal', 33, 'stop', '', '', ''),
(51, 'nilai_sikap', '!=\"baik\"', NULL, '!=\"cukup baik\"', NULL, 33, 'stop', 'nilai_f2f~last_education~~age~~experience~~nilai_sikap~~nilai_sikap~', '', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~~!=\"1-2 tahun\"~~!=\"baik\"~~!=\"cukup baik\"~'),
(52, 'experience', '=\"25-35\"', '0 tahun', NULL, 'lulus', 34, 'stop', '', '', ''),
(53, 'experience', '=\"25-35\"', NULL, '!=\"0 tahun\"', NULL, 34, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~~age~~experience~', '', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~=\"80-89\"~~=\"25-35\"~~!=\"0 tahun\"~'),
(54, 'age', '=\"cukup baik\"', '=\"> 35\"', NULL, NULL, 36, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~~nilai_sikap~~age~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~~=\"cukup baik\"~~=\"> 35\"~', ''),
(55, 'age', '=\"cukup baik\"', NULL, '> 35', 'lulus', 36, 'stop', '', '', ''),
(56, 'total_ability', '!=\"cukup baik\"', '=\"5-7\"', NULL, NULL, 36, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~~nilai_sikap~~total_ability~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~~!=\"cukup baik\"~~=\"5-7\"~', ''),
(57, 'total_ability', '!=\"cukup baik\"', NULL, '5-7', 'gagal', 36, 'stop', '', '', ''),
(58, 'age', '=\"5-7\"', '=\"> 35\"', NULL, NULL, 37, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~age~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~=\"5-7\"~~=\"> 35\"~', ''),
(59, 'age', '=\"5-7\"', NULL, '> 35', 'gagal', 37, 'stop', '', '', ''),
(60, 'nilai_sikap', '!=\"5-7\"', '=\"sangat baik\"', '!=\"sangat baik\"', NULL, 37, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_sikap~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~~=\"sangat baik\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sangat baik\"~'),
(61, 'nilai_online', '=\"5-7\"', NULL, '!=\"70-79\"', NULL, 38, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_online~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~!=\"70-79\"~'),
(62, 'last_education', '!=\"5-7\"', '=\"sma\"', '!=\"sma\"', NULL, 38, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~=\"sma\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sma\"~'),
(63, 'nilai_online', '!=\"pasca\"', '=\"70-79\"', NULL, NULL, 45, 'stop', 'nilai_f2f~experience~~nilai_sikap~~nilai_online~~age~~last_education~~nilai_online~', '=\"70-79\"~!=\"1-2 tahun\"~~!=\"sangat baik\"~~!=\"80-89\"~~=\"25-35\"~~!=\"pasca\"~~=\"70-79\"~', ''),
(64, 'nilai_online', '!=\"pasca\"', NULL, '70-79', 'gagal', 45, 'stop', '', '', ''),
(65, 'nilai_online', '=\"akademi\"', '70-79', NULL, 'gagal', 46, 'stop', '', '', ''),
(66, 'nilai_online', '=\"akademi\"', NULL, '70-79', 'lulus', 46, 'stop', '', '', ''),
(67, 'nilai_f2f', '!=\"cukup baik\"', '80-89', NULL, 'lulus', 51, 'stop', '', '', ''),
(68, 'nilai_f2f', '!=\"cukup baik\"', NULL, '!=\"80-89\"', NULL, 51, 'stop', 'nilai_f2f~last_education~~age~~experience~~nilai_sikap~~nilai_sikap~~nilai_f2f~', '', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~~!=\"1-2 tahun\"~~!=\"baik\"~~!=\"cukup baik\"~~!=\"80-89\"~'),
(69, 'status', '!=\"0 tahun\"', 'lajang', NULL, 'lulus', 53, 'stop', '', '', ''),
(70, 'status', '!=\"0 tahun\"', NULL, 'lajang', 'gagal', 53, 'stop', '', '', ''),
(71, 'experience', '=\"> 35\"', '0 tahun', NULL, 'gagal', 54, 'stop', '', '', ''),
(72, 'experience', '=\"> 35\"', NULL, '0 tahun', 'lulus', 54, 'stop', '', '', ''),
(73, 'age', '=\"5-7\"', '< 25', NULL, 'lulus', 56, 'stop', '', '', ''),
(74, 'age', '=\"5-7\"', NULL, '< 25', 'gagal', 56, 'stop', '', '', ''),
(75, 'status', '=\"> 35\"', '=\"lajang\"', NULL, NULL, 58, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~age~~status~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~=\"5-7\"~~=\"> 35\"~~=\"lajang\"~', ''),
(76, 'status', '=\"> 35\"', NULL, 'lajang', 'lulus', 58, 'stop', '', '', ''),
(77, 'status', '=\"sangat baik\"', 'lajang', NULL, 'lulus', 60, 'stop', '', '', ''),
(78, 'status', '=\"sangat baik\"', NULL, '!=\"lajang\"', NULL, 60, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_sikap~~status~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~~=\"sangat baik\"~~!=\"lajang\"~'),
(79, 'age', '!=\"sangat baik\"', '=\"25-35\"', NULL, NULL, 60, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_sikap~~age~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sangat baik\"~~=\"25-35\"~', ''),
(80, 'age', '!=\"sangat baik\"', NULL, '25-35', 'gagal', 60, 'stop', '', '', ''),
(81, 'nilai_f2f', '!=\"70-79\"', '80-89', NULL, 'lulus', 61, 'stop', '', '', ''),
(82, 'nilai_f2f', '!=\"70-79\"', NULL, '!=\"80-89\"', NULL, 61, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_online~~nilai_f2f~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~!=\"70-79\"~~!=\"80-89\"~'),
(83, 'status', '=\"sma\"', '=\"lajang\"', NULL, NULL, 62, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~status~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~=\"sma\"~~=\"lajang\"~', ''),
(84, 'status', '=\"sma\"', NULL, 'lajang', 'lulus', 62, 'stop', '', '', ''),
(85, 'nilai_f2f', '!=\"sma\"', '80-89', NULL, 'gagal', 62, 'stop', '', '', ''),
(86, 'nilai_f2f', '!=\"sma\"', NULL, '!=\"80-89\"', NULL, 62, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~nilai_f2f~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sma\"~~!=\"80-89\"~'),
(87, 'last_education', '=\"70-79\"', '=\"sma\"', '!=\"sma\"', NULL, 63, 'stop', 'nilai_f2f~experience~~nilai_sikap~~nilai_online~~age~~last_education~~nilai_online~~last_education~', '=\"70-79\"~!=\"1-2 tahun\"~~!=\"sangat baik\"~~!=\"80-89\"~~=\"25-35\"~~!=\"pasca\"~~=\"70-79\"~~=\"sma\"~', '=\"70-79\"~!=\"1-2 tahun\"~~!=\"sangat baik\"~~!=\"80-89\"~~=\"25-35\"~~!=\"pasca\"~~=\"70-79\"~~!=\"sma\"~'),
(88, 'experience', '!=\"80-89\"', '=\"0 tahun\"', NULL, NULL, 68, 'stop', 'nilai_f2f~last_education~~age~~experience~~nilai_sikap~~nilai_sikap~~nilai_f2f~~experience~', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~~!=\"1-2 tahun\"~~!=\"baik\"~~!=\"cukup baik\"~~!=\"80-89\"~~=\"0 tahun\"~', ''),
(89, 'experience', '!=\"80-89\"', NULL, '0 tahun', 'gagal', 68, 'stop', '', '', ''),
(90, 'nilai_sikap', '=\"lajang\"', 'baik', NULL, 'lulus', 75, 'stop', '', '', ''),
(91, 'nilai_sikap', '=\"lajang\"', NULL, 'baik', 'gagal', 75, 'stop', '', '', ''),
(92, 'last_education', '!=\"lajang\"', 'sma', NULL, 'gagal', 78, 'stop', '', '', ''),
(93, 'last_education', '!=\"lajang\"', NULL, 'sma', 'lulus', 78, 'stop', '', '', ''),
(94, 'nilai_online', '=\"25-35\"', '70-79', NULL, 'gagal', 79, 'stop', '', '', ''),
(95, 'nilai_online', '=\"25-35\"', NULL, '70-79', 'lulus', 79, 'stop', '', '', ''),
(96, 'experience', '!=\"80-89\"', '0 tahun', NULL, 'lulus', 82, 'stop', '', '', ''),
(97, 'experience', '!=\"80-89\"', NULL, '!=\"0 tahun\"', NULL, 82, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_online~~nilai_f2f~~experience~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~!=\"70-79\"~~!=\"80-89\"~~!=\"0 tahun\"~'),
(98, 'nilai_sikap', '=\"lajang\"', 'cukup baik', NULL, 'lulus', 83, 'stop', '', '', ''),
(99, 'nilai_sikap', '=\"lajang\"', NULL, 'cukup baik', 'gagal', 83, 'stop', '', '', ''),
(100, 'nilai_sikap', '!=\"80-89\"', 'sangat baik', NULL, 'lulus', 86, 'stop', '', '', ''),
(101, 'nilai_sikap', '!=\"80-89\"', NULL, '!=\"sangat baik\"', NULL, 86, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~nilai_f2f~~nilai_sikap~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sma\"~~!=\"80-89\"~~!=\"sangat baik\"~'),
(102, 'experience', '=\"sma\"', '0 tahun', NULL, 'gagal', 87, 'stop', '', '', ''),
(103, 'experience', '=\"sma\"', NULL, '0 tahun', 'lulus', 87, 'stop', '', '', ''),
(104, 'experience', '!=\"sma\"', '0 tahun', NULL, 'lulus', 87, 'stop', '', '', ''),
(105, 'experience', '!=\"sma\"', NULL, '0 tahun', 'gagal', 87, 'stop', '', '', ''),
(106, 'age', '=\"0 tahun\"', '=\"< 25\"', NULL, NULL, 88, 'stop', 'nilai_f2f~last_education~~age~~experience~~nilai_sikap~~nilai_sikap~~nilai_f2f~~experience~~age~', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~~!=\"1-2 tahun\"~~!=\"baik\"~~!=\"cukup baik\"~~!=\"80-89\"~~=\"0 tahun\"~~=\"< 25\"~', ''),
(107, 'age', '=\"0 tahun\"', NULL, '< 25', 'lulus', 88, 'stop', '', '', ''),
(108, 'age', '!=\"0 tahun\"', '25-35', NULL, 'gagal', 97, 'stop', '', '', ''),
(109, 'age', '!=\"0 tahun\"', NULL, '!=\"25-35\"', NULL, 97, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_online~~nilai_f2f~~experience~~age~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~!=\"70-79\"~~!=\"80-89\"~~!=\"0 tahun\"~~!=\"25-35\"~'),
(110, 'age', '!=\"sangat baik\"', '< 25', NULL, 'lulus', 101, 'stop', '', '', ''),
(111, 'age', '!=\"sangat baik\"', NULL, '!=\"< 25\"', NULL, 101, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~nilai_f2f~~nilai_sikap~~age~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sma\"~~!=\"80-89\"~~!=\"sangat baik\"~~!=\"< 25\"~'),
(112, 'nilai_online', '=\"< 25\"', '80-89', NULL, 'lulus', 106, 'stop', '', '', ''),
(113, 'nilai_online', '=\"< 25\"', NULL, '80-89', 'gagal', 106, 'stop', '', '', ''),
(114, 'last_education', '!=\"25-35\"', 'sma', NULL, 'lulus', 109, 'stop', '', '', ''),
(115, 'last_education', '!=\"25-35\"', NULL, 'sma', 'gagal', 109, 'stop', '', '', ''),
(116, 'age', '!=\"< 25\"', '=\"25-35\"', NULL, NULL, 111, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~nilai_f2f~~nilai_sikap~~age~~age~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sma\"~~!=\"80-89\"~~!=\"sangat baik\"~~!=\"< 25\"~~=\"25-35\"~', ''),
(117, 'age', '!=\"< 25\"', NULL, '25-35', 'gagal', 111, 'stop', '', '', ''),
(118, 'nilai_sikap', '=\"25-35\"', 'cukup baik', NULL, 'lulus', 116, 'stop', '', '', ''),
(119, 'nilai_sikap', '=\"25-35\"', NULL, 'cukup baik', 'gagal', 116, 'stop', '', '', '');

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
  `status_passed` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `flag` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dataset`
--

INSERT INTO `dataset` (`id`, `nama_lengkap`, `age`, `experience`, `last_education`, `status`, `total_ability`, `nilai_online`, `nilai_f2f`, `nilai_sikap`, `status_passed`, `created_at`, `updated_at`, `flag`) VALUES
(1, 'Vernia', 24, 0, 'pasca', 'lajang', 9, 71, 77, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(2, 'Layne', 21, 2, 'pasca', 'menikah', 8, 98, 95, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(3, 'Neomi', 32, 0, 'akademi', 'lajang', 7, 74, 100, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(4, 'Hannah', 28, 0, 'sma', 'lajang', 6, 77, 74, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(5, 'Alyson', 28, 9, 'akademi', 'menikah', 5, 89, 84, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(6, 'Emeline', 39, 8, 'pasca', 'menikah', 9, 78, 82, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(7, 'Janae', 48, 6, 'sma', 'lajang', 6, 71, 76, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(8, 'Luciana', 45, 2, 'sarjana', 'lajang', 10, 91, 97, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(9, 'Tommye', 35, 8, 'sarjana', 'menikah', 9, 88, 80, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(10, 'Marshall', 47, 0, 'pasca', 'lajang', 8, 84, 86, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(11, 'Dora', 25, 1, 'pasca', 'menikah', 6, 80, 85, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(12, 'Ellyn', 32, 0, 'pasca', 'lajang', 6, 93, 95, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(13, 'Herta', 29, 0, 'sarjana', 'lajang', 5, 84, 78, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(14, 'Leonel', 39, 0, 'akademi', 'lajang', 5, 77, 100, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(15, 'Caridad', 20, 9, 'akademi', 'menikah', 6, 96, 77, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(16, 'Veronika', 38, 0, 'sma', 'lajang', 8, 77, 97, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(17, 'Lincoln', 43, 10, 'pasca', 'menikah', 6, 98, 72, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(18, 'Erich', 35, 0, 'akademi', 'lajang', 9, 79, 76, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(19, 'Rickey', 18, 0, 'sarjana', 'menikah', 7, 100, 76, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(20, 'Dewey', 30, 7, 'pasca', 'lajang', 8, 79, 83, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(21, 'Beatris', 29, 1, 'sma', 'lajang', 5, 93, 94, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(22, 'Elroy', 21, 0, 'pasca', 'lajang', 9, 75, 94, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(23, 'Newton', 27, 1, 'pasca', 'menikah', 9, 89, 70, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(24, 'Talisha', 36, 0, 'sarjana', 'lajang', 7, 93, 87, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(25, 'Keesha', 24, 10, 'pasca', 'lajang', 9, 86, 78, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(26, 'Claude', 32, 0, 'sma', 'menikah', 8, 78, 78, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(27, 'Tad', 28, 7, 'akademi', 'lajang', 8, 70, 94, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(28, 'Nathan', 32, 5, 'sarjana', 'menikah', 5, 76, 96, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(29, 'Karissa', 49, 6, 'pasca', 'menikah', 10, 90, 80, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(30, 'Jeanetta', 28, 5, 'sarjana', 'lajang', 8, 74, 74, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(31, 'Felisha', 33, 7, 'sma', 'lajang', 6, 85, 98, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(32, 'Colleen', 49, 3, 'sarjana', 'menikah', 5, 89, 72, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(33, 'Elijah', 28, 0, 'sarjana', 'lajang', 8, 84, 80, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(34, 'Natalya', 47, 5, 'pasca', 'menikah', 7, 95, 97, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(35, 'Darla', 49, 1, 'akademi', 'lajang', 10, 78, 89, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(36, 'Patrick', 46, 0, 'sma', 'lajang', 7, 75, 79, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(37, 'Thresa', 27, 4, 'akademi', 'lajang', 9, 80, 80, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(38, 'Eufemia', 48, 0, 'sarjana', 'lajang', 5, 76, 95, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(39, 'Melania', 25, 3, 'akademi', 'menikah', 9, 93, 74, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(40, 'Jacqueline', 20, 3, 'sarjana', 'menikah', 8, 86, 92, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(41, 'Catrice', 25, 2, 'sma', 'menikah', 5, 95, 72, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(42, 'Star', 20, 3, 'akademi', 'menikah', 8, 79, 91, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(43, 'Samella', 40, 1, 'akademi', 'lajang', 10, 98, 98, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(44, 'Elinor', 32, 2, 'sma', 'lajang', 6, 72, 99, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(45, 'Sandee', 22, 0, 'pasca', 'menikah', 8, 80, 90, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(46, 'Maryjane', 24, 1, 'sma', 'lajang', 8, 99, 92, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(47, 'Rebeca', 28, 2, 'sarjana', 'lajang', 9, 85, 76, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(48, 'Franklin', 46, 2, 'sma', 'lajang', 8, 76, 89, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(49, 'Masako', 29, 7, 'pasca', 'lajang', 6, 74, 77, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(50, 'Albertha', 27, 7, 'sma', 'lajang', 9, 85, 81, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(51, 'Alyson', 28, 2, 'pasca', 'lajang', 9, 79, 81, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(52, 'Delinda', 42, 0, 'akademi', 'menikah', 10, 78, 97, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(53, 'Alessandra', 38, 3, 'sarjana', 'lajang', 10, 79, 100, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(54, 'Luigi', 40, 2, 'sarjana', 'menikah', 6, 78, 89, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(55, 'Herbert', 39, 2, 'akademi', 'lajang', 10, 72, 73, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(56, 'Kacey', 48, 1, 'sma', 'menikah', 9, 98, 76, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(57, 'Eliz', 22, 1, 'sarjana', 'lajang', 5, 90, 96, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(58, 'Karleen', 33, 4, 'akademi', 'menikah', 5, 82, 72, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(59, 'Lucienne', 46, 7, 'akademi', 'lajang', 8, 71, 98, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(60, 'Glynda', 21, 9, 'sma', 'menikah', 5, 76, 87, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(61, 'Tracy', 26, 0, 'pasca', 'lajang', 10, 93, 81, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(62, 'Janey', 23, 2, 'sarjana', 'menikah', 5, 87, 86, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(63, 'Daphine', 25, 8, 'sma', 'lajang', 9, 85, 76, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(64, 'Jacquelin', 29, 2, 'sarjana', 'lajang', 8, 91, 100, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(65, 'Timika', 38, 0, 'sma', 'menikah', 9, 71, 84, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(66, 'Pam', 34, 4, 'sarjana', 'lajang', 9, 95, 89, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(67, 'Latrina', 25, 0, 'sma', 'lajang', 7, 70, 97, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(68, 'Porsha', 44, 2, 'sma', 'lajang', 9, 100, 82, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(69, 'Carrol', 21, 0, 'sma', 'lajang', 8, 81, 77, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(70, 'Evita', 36, 8, 'sma', 'menikah', 10, 82, 70, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(71, 'Reagan', 23, 0, 'sarjana', 'lajang', 5, 82, 89, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(72, 'Quiana', 38, 1, 'pasca', 'menikah', 9, 71, 78, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(73, 'Madonna', 19, 2, 'sma', 'menikah', 5, 94, 89, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(74, 'Hilario', 50, 2, 'akademi', 'menikah', 6, 93, 87, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(75, 'Lu', 22, 0, 'sarjana', 'menikah', 10, 71, 100, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(76, 'Bruna', 40, 0, 'sma', 'menikah', 6, 74, 81, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(77, 'Juana', 26, 2, 'pasca', 'lajang', 9, 86, 71, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(78, 'Thea', 25, 0, 'pasca', 'lajang', 8, 77, 94, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(79, 'Danita', 47, 0, 'pasca', 'menikah', 10, 75, 97, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(80, 'Cordell', 33, 0, 'akademi', 'menikah', 7, 99, 79, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(81, 'Raven', 43, 0, 'sarjana', 'lajang', 7, 98, 72, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(82, 'Ellie', 39, 2, 'pasca', 'menikah', 8, 81, 74, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(83, 'Nathaniel', 35, 8, 'akademi', 'lajang', 5, 90, 93, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(84, 'Terrance', 22, 1, 'pasca', 'menikah', 7, 82, 84, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(85, 'Raymundo', 40, 1, 'pasca', 'menikah', 9, 83, 86, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(86, 'Cori', 35, 9, 'pasca', 'menikah', 6, 86, 73, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(87, 'Harriet', 38, 2, 'sarjana', 'menikah', 10, 82, 74, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(88, 'Leonia', 25, 0, 'sarjana', 'menikah', 10, 85, 76, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(89, 'Bret', 37, 1, 'pasca', 'lajang', 6, 95, 83, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(90, 'Collen', 29, 0, 'pasca', 'menikah', 6, 80, 85, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(91, 'Analisa', 32, 1, 'sma', 'menikah', 8, 91, 76, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(92, 'Leisha', 19, 0, 'akademi', 'lajang', 8, 92, 76, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(93, 'Dane', 47, 0, 'akademi', 'lajang', 9, 93, 95, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(94, 'Alethia', 39, 7, 'akademi', 'menikah', 8, 71, 84, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(95, 'Danial', 29, 0, 'sma', 'menikah', 10, 100, 84, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(96, 'Cruz', 23, 0, 'sma', 'lajang', 5, 70, 82, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(97, 'August', 19, 8, 'akademi', 'lajang', 5, 71, 78, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(98, 'Dawne', 18, 1, 'pasca', 'lajang', 10, 71, 97, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(99, 'Kyoko', 22, 9, 'sma', 'lajang', 10, 76, 70, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(100, 'Debera', 19, 0, 'akademi', 'lajang', 9, 94, 90, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(101, 'Stephen', 27, 1, 'pasca', 'menikah', 5, 97, 75, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(102, 'Yan', 31, 0, 'sma', 'lajang', 8, 95, 75, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(103, 'Dewayne', 32, 9, 'sma', 'menikah', 10, 79, 77, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(104, 'Shellie', 41, 2, 'pasca', 'lajang', 6, 90, 81, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(105, 'Phil', 34, 0, 'pasca', 'menikah', 8, 99, 90, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(106, 'Jerome', 45, 0, 'akademi', 'lajang', 8, 70, 88, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(107, 'Lindsy', 34, 1, 'pasca', 'lajang', 10, 71, 100, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(108, 'Elly', 31, 0, 'sma', 'lajang', 6, 86, 71, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(109, 'Billy', 27, 0, 'sma', 'menikah', 8, 96, 73, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(110, 'Glennie', 36, 2, 'akademi', 'lajang', 10, 79, 80, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(111, 'Dione', 47, 0, 'pasca', 'menikah', 6, 97, 73, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(112, 'Heriberto', 19, 2, 'pasca', 'menikah', 8, 91, 91, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(113, 'Farah', 42, 1, 'sma', 'menikah', 7, 70, 84, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(114, 'Frankie', 46, 0, 'akademi', 'menikah', 7, 72, 82, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(115, 'Mariella', 29, 1, 'sarjana', 'lajang', 10, 75, 100, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(116, 'Marcelina', 19, 5, 'sma', 'lajang', 8, 76, 71, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(117, 'Velva', 18, 1, 'sma', 'menikah', 6, 70, 99, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(118, 'Gretchen', 35, 1, 'sarjana', 'menikah', 10, 86, 84, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(119, 'Bobby', 45, 1, 'sma', 'lajang', 9, 86, 80, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(120, 'Iona', 30, 2, 'sarjana', 'lajang', 5, 70, 98, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(121, 'Maris', 22, 0, 'akademi', 'menikah', 10, 85, 96, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(122, 'Louetta', 43, 0, 'sarjana', 'lajang', 8, 71, 91, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(123, 'Amelia', 45, 6, 'sma', 'lajang', 7, 74, 92, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(124, 'Eldon', 30, 0, 'sarjana', 'lajang', 7, 72, 83, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(125, 'Rolanda', 37, 0, 'akademi', 'menikah', 5, 87, 72, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(126, 'Chang', 46, 7, 'sarjana', 'menikah', 6, 95, 86, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(127, 'Cory', 35, 0, 'sma', 'lajang', 6, 72, 96, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(128, 'Elvis', 32, 1, 'pasca', 'lajang', 10, 94, 87, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(129, 'Bo', 33, 10, 'pasca', 'menikah', 7, 95, 73, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(130, 'Sara', 18, 2, 'sma', 'menikah', 8, 79, 88, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(131, 'Rima', 47, 0, 'pasca', 'lajang', 5, 97, 80, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(132, 'Moriah', 20, 3, 'sma', 'menikah', 5, 72, 97, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(133, 'Cora', 20, 1, 'sma', 'menikah', 8, 71, 71, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(134, 'Scarlet', 36, 0, 'akademi', 'lajang', 9, 87, 70, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(135, 'Lilly', 20, 4, 'sarjana', 'lajang', 9, 93, 70, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(136, 'Mika', 35, 0, 'sarjana', 'menikah', 8, 97, 89, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(137, 'Yuk', 19, 0, 'pasca', 'lajang', 8, 87, 81, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(138, 'Velma', 35, 0, 'sarjana', 'lajang', 9, 93, 93, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(139, 'Filomena', 25, 2, 'pasca', 'lajang', 7, 77, 83, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(140, 'Hilary', 25, 4, 'sarjana', 'menikah', 6, 71, 84, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(141, 'Victoria', 40, 7, 'akademi', 'menikah', 7, 76, 96, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(142, 'Darline', 22, 0, 'sarjana', 'lajang', 9, 94, 78, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(143, 'Carola', 42, 8, 'pasca', 'menikah', 5, 72, 95, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(144, 'Patsy', 23, 0, 'sarjana', 'lajang', 10, 85, 90, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(145, 'Lonny', 36, 3, 'sarjana', 'menikah', 5, 95, 77, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(146, 'Marla', 22, 0, 'pasca', 'lajang', 7, 85, 76, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(147, 'Onie', 39, 7, 'sma', 'menikah', 10, 87, 82, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(148, 'Karleen', 28, 9, 'pasca', 'lajang', 10, 74, 75, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(149, 'Shanelle', 25, 0, 'sarjana', 'lajang', 7, 96, 76, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(150, 'France', 48, 7, 'sarjana', 'lajang', 9, 73, 82, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(151, 'Gladys', 18, 3, 'sma', 'lajang', 6, 72, 92, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(152, 'Lenore', 20, 6, 'sma', 'menikah', 5, 95, 85, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(153, 'Kesha', 36, 3, 'sarjana', 'menikah', 6, 77, 91, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(154, 'Donovan', 22, 10, 'sarjana', 'lajang', 9, 71, 75, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(155, 'Marti', 24, 6, 'pasca', 'lajang', 6, 79, 75, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(156, 'Mari', 22, 2, 'sma', 'menikah', 6, 99, 78, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(157, 'Brock', 45, 10, 'sma', 'menikah', 5, 82, 96, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(158, 'Salvador', 29, 10, 'akademi', 'lajang', 10, 99, 75, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(159, 'Carmella', 32, 2, 'sarjana', 'lajang', 6, 81, 81, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(160, 'Nerissa', 25, 0, 'pasca', 'lajang', 10, 74, 94, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(161, 'Bennett', 29, 0, 'sarjana', 'menikah', 8, 72, 76, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(162, 'Tona', 25, 7, 'sma', 'lajang', 8, 89, 85, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(163, 'Antonette', 42, 7, 'akademi', 'lajang', 10, 92, 74, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(164, 'Suzette', 35, 0, 'akademi', 'menikah', 7, 74, 89, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(165, 'Xochitl', 50, 1, 'pasca', 'lajang', 7, 71, 80, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(166, 'Inger', 25, 3, 'pasca', 'lajang', 7, 83, 82, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(167, 'Stan', 34, 7, 'sarjana', 'lajang', 9, 73, 88, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(168, 'Saturnina', 36, 7, 'akademi', 'menikah', 7, 81, 79, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(169, 'Toi', 38, 9, 'pasca', 'lajang', 9, 73, 92, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(170, 'Eusebio', 22, 6, 'akademi', 'lajang', 5, 97, 98, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(171, 'Solomon', 25, 2, 'pasca', 'menikah', 8, 70, 71, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(172, 'Adaline', 18, 10, 'sarjana', 'lajang', 10, 95, 79, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(173, 'Elia', 43, 0, 'sma', 'lajang', 10, 89, 70, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(174, 'Lacey', 42, 7, 'pasca', 'menikah', 10, 77, 99, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(175, 'Sallie', 22, 10, 'sarjana', 'menikah', 10, 85, 84, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(176, 'Buffy', 20, 9, 'akademi', 'menikah', 9, 100, 90, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(177, 'Maurice', 20, 5, 'akademi', 'lajang', 9, 82, 89, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(178, 'Buck', 38, 3, 'sma', 'menikah', 7, 99, 88, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(179, 'Chase', 41, 0, 'sma', 'lajang', 10, 100, 79, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(180, 'Ernesto', 21, 0, 'sarjana', 'lajang', 10, 90, 78, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(181, 'Nedra', 25, 5, 'pasca', 'lajang', 5, 100, 100, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(182, 'Lizabeth', 45, 1, 'sarjana', 'lajang', 8, 95, 75, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(183, 'Marcia', 39, 1, 'akademi', 'menikah', 10, 74, 73, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(184, 'Gilbert', 22, 2, 'sarjana', 'menikah', 8, 80, 85, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(185, 'Titus', 34, 6, 'akademi', 'menikah', 8, 86, 72, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(186, 'Orville', 34, 0, 'akademi', 'lajang', 10, 71, 78, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(187, 'Jutta', 33, 7, 'sarjana', 'lajang', 7, 80, 99, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(188, 'Sophia', 19, 0, 'pasca', 'menikah', 8, 93, 89, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(189, 'Charlie', 44, 1, 'sma', 'lajang', 6, 93, 94, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(190, 'Raul', 18, 0, 'sarjana', 'lajang', 7, 95, 91, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(191, 'Adriane', 26, 0, 'pasca', 'lajang', 10, 80, 90, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(192, 'Shaquana', 32, 1, 'sma', 'menikah', 6, 77, 96, 'sangat baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(193, 'Emmy', 33, 0, 'pasca', 'lajang', 10, 79, 74, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(194, 'Bret', 26, 0, 'akademi', 'lajang', 10, 99, 86, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(195, 'Nicki', 40, 1, 'sarjana', 'menikah', 8, 78, 88, 'baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(196, 'Clara', 18, 2, 'sarjana', 'menikah', 6, 70, 86, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(197, 'Luigi', 26, 3, 'akademi', 'lajang', 10, 83, 90, 'cukup baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(198, 'Rossie', 19, 7, 'sarjana', 'lajang', 5, 85, 81, 'cukup baik', 'gagal', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(199, 'Danelle', 48, 9, 'akademi', 'lajang', 5, 91, 87, 'baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0),
(200, 'Melania', 48, 3, 'akademi', 'menikah', 5, 81, 81, 'sangat baik', 'lulus', '2018-08-23 20:23:06', '2018-08-23 13:23:06', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dataset_hitung`
--

CREATE TABLE `dataset_hitung` (
  `id` int(3) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `experience` varchar(255) NOT NULL,
  `last_education` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `total_ability` varchar(255) NOT NULL,
  `nilai_online` varchar(255) NOT NULL,
  `nilai_f2f` varchar(255) NOT NULL,
  `nilai_sikap` varchar(255) NOT NULL,
  `flag` tinyint(4) NOT NULL,
  `status_passed` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dataset_hitung`
--

INSERT INTO `dataset_hitung` (`id`, `nama_lengkap`, `age`, `experience`, `last_education`, `status`, `total_ability`, `nilai_online`, `nilai_f2f`, `nilai_sikap`, `flag`, `status_passed`) VALUES
(1, 'Vernia', '< 25', '0 tahun', 'pasca', 'lajang', '8-10', '70-79', '70-79', 'baik', 0, 'gagal'),
(2, 'Layne', '< 25', '1-2 tahun', 'pasca', 'menikah', '8-10', '90-100', '90-100', 'baik', 0, 'gagal'),
(3, 'Neomi', '25-35', '0 tahun', 'akademi', 'lajang', '5-7', '70-79', '90-100', 'cukup baik', 0, 'lulus'),
(4, 'Hannah', '25-35', '0 tahun', 'sma', 'lajang', '5-7', '70-79', '70-79', 'baik', 0, 'gagal'),
(5, 'Alyson', '25-35', '> 2 tahun', 'akademi', 'menikah', '5-7', '80-89', '80-89', 'sangat baik', 0, 'gagal'),
(6, 'Emeline', '> 35', '> 2 tahun', 'pasca', 'menikah', '8-10', '70-79', '80-89', 'baik', 0, 'gagal'),
(7, 'Janae', '> 35', '> 2 tahun', 'sma', 'lajang', '5-7', '70-79', '70-79', 'cukup baik', 0, 'gagal'),
(8, 'Luciana', '> 35', '1-2 tahun', 'sarjana', 'lajang', '8-10', '90-100', '90-100', 'cukup baik', 0, 'lulus'),
(9, 'Tommye', '25-35', '> 2 tahun', 'sarjana', 'menikah', '8-10', '80-89', '80-89', 'sangat baik', 0, 'lulus'),
(10, 'Marshall', '> 35', '0 tahun', 'pasca', 'lajang', '8-10', '80-89', '80-89', 'sangat baik', 0, 'gagal'),
(11, 'Dora', '25-35', '1-2 tahun', 'pasca', 'menikah', '5-7', '80-89', '80-89', 'baik', 0, 'gagal'),
(12, 'Ellyn', '25-35', '0 tahun', 'pasca', 'lajang', '5-7', '90-100', '90-100', 'cukup baik', 0, 'lulus'),
(13, 'Herta', '25-35', '0 tahun', 'sarjana', 'lajang', '5-7', '80-89', '70-79', 'sangat baik', 0, 'lulus'),
(14, 'Leonel', '> 35', '0 tahun', 'akademi', 'lajang', '5-7', '70-79', '90-100', 'baik', 0, 'gagal'),
(15, 'Caridad', '< 25', '> 2 tahun', 'akademi', 'menikah', '5-7', '90-100', '70-79', 'cukup baik', 0, 'lulus'),
(16, 'Veronika', '> 35', '0 tahun', 'sma', 'lajang', '8-10', '70-79', '90-100', 'sangat baik', 0, 'gagal'),
(17, 'Lincoln', '> 35', '> 2 tahun', 'pasca', 'menikah', '5-7', '90-100', '70-79', 'baik', 0, 'gagal'),
(18, 'Erich', '25-35', '0 tahun', 'akademi', 'lajang', '8-10', '70-79', '70-79', 'baik', 0, 'lulus'),
(19, 'Rickey', '< 25', '0 tahun', 'sarjana', 'menikah', '5-7', '90-100', '70-79', 'sangat baik', 0, 'lulus'),
(20, 'Dewey', '25-35', '> 2 tahun', 'pasca', 'lajang', '8-10', '70-79', '80-89', 'sangat baik', 0, 'gagal'),
(21, 'Beatris', '25-35', '1-2 tahun', 'sma', 'lajang', '5-7', '90-100', '90-100', 'sangat baik', 0, 'gagal'),
(22, 'Elroy', '< 25', '0 tahun', 'pasca', 'lajang', '8-10', '70-79', '90-100', 'cukup baik', 0, 'lulus'),
(23, 'Newton', '25-35', '1-2 tahun', 'pasca', 'menikah', '8-10', '80-89', '70-79', 'cukup baik', 0, 'lulus'),
(24, 'Talisha', '> 35', '0 tahun', 'sarjana', 'lajang', '5-7', '90-100', '80-89', 'cukup baik', 0, 'gagal'),
(25, 'Keesha', '< 25', '> 2 tahun', 'pasca', 'lajang', '8-10', '80-89', '70-79', 'cukup baik', 0, 'lulus'),
(26, 'Claude', '25-35', '0 tahun', 'sma', 'menikah', '8-10', '70-79', '70-79', 'cukup baik', 0, 'gagal'),
(27, 'Tad', '25-35', '> 2 tahun', 'akademi', 'lajang', '8-10', '70-79', '90-100', 'cukup baik', 0, 'lulus'),
(28, 'Nathan', '25-35', '> 2 tahun', 'sarjana', 'menikah', '5-7', '70-79', '90-100', 'baik', 0, 'lulus'),
(29, 'Karissa', '> 35', '> 2 tahun', 'pasca', 'menikah', '8-10', '90-100', '80-89', 'cukup baik', 0, 'gagal'),
(30, 'Jeanetta', '25-35', '> 2 tahun', 'sarjana', 'lajang', '8-10', '70-79', '70-79', 'cukup baik', 0, 'gagal'),
(31, 'Felisha', '25-35', '> 2 tahun', 'sma', 'lajang', '5-7', '80-89', '90-100', 'baik', 0, 'gagal'),
(32, 'Colleen', '> 35', '> 2 tahun', 'sarjana', 'menikah', '5-7', '80-89', '70-79', 'sangat baik', 0, 'gagal'),
(33, 'Elijah', '25-35', '0 tahun', 'sarjana', 'lajang', '8-10', '80-89', '80-89', 'baik', 0, 'lulus'),
(34, 'Natalya', '> 35', '> 2 tahun', 'pasca', 'menikah', '5-7', '90-100', '90-100', 'sangat baik', 0, 'gagal'),
(35, 'Darla', '> 35', '1-2 tahun', 'akademi', 'lajang', '8-10', '70-79', '80-89', 'sangat baik', 0, 'lulus'),
(36, 'Patrick', '> 35', '0 tahun', 'sma', 'lajang', '5-7', '70-79', '70-79', 'cukup baik', 0, 'gagal'),
(37, 'Thresa', '25-35', '> 2 tahun', 'akademi', 'lajang', '8-10', '80-89', '80-89', 'cukup baik', 0, 'lulus'),
(38, 'Eufemia', '> 35', '0 tahun', 'sarjana', 'lajang', '5-7', '70-79', '90-100', 'baik', 0, 'lulus'),
(39, 'Melania', '25-35', '> 2 tahun', 'akademi', 'menikah', '8-10', '90-100', '70-79', 'sangat baik', 0, 'gagal'),
(40, 'Jacqueline', '< 25', '> 2 tahun', 'sarjana', 'menikah', '8-10', '80-89', '90-100', 'sangat baik', 0, 'gagal'),
(41, 'Catrice', '25-35', '1-2 tahun', 'sma', 'menikah', '5-7', '90-100', '70-79', 'sangat baik', 0, 'gagal'),
(42, 'Star', '< 25', '> 2 tahun', 'akademi', 'menikah', '8-10', '70-79', '90-100', 'sangat baik', 0, 'gagal'),
(43, 'Samella', '> 35', '1-2 tahun', 'akademi', 'lajang', '8-10', '90-100', '90-100', 'baik', 0, 'gagal'),
(44, 'Elinor', '25-35', '1-2 tahun', 'sma', 'lajang', '5-7', '70-79', '90-100', 'cukup baik', 0, 'gagal'),
(45, 'Sandee', '< 25', '0 tahun', 'pasca', 'menikah', '8-10', '80-89', '90-100', 'sangat baik', 0, 'lulus'),
(46, 'Maryjane', '< 25', '1-2 tahun', 'sma', 'lajang', '8-10', '90-100', '90-100', 'sangat baik', 0, 'lulus'),
(47, 'Rebeca', '25-35', '1-2 tahun', 'sarjana', 'lajang', '8-10', '80-89', '70-79', 'baik', 0, 'gagal'),
(48, 'Franklin', '> 35', '1-2 tahun', 'sma', 'lajang', '8-10', '70-79', '80-89', 'cukup baik', 0, 'gagal'),
(49, 'Masako', '25-35', '> 2 tahun', 'pasca', 'lajang', '5-7', '70-79', '70-79', 'baik', 0, 'lulus'),
(50, 'Albertha', '25-35', '> 2 tahun', 'sma', 'lajang', '8-10', '80-89', '80-89', 'cukup baik', 0, 'lulus'),
(51, 'Alyson', '25-35', '1-2 tahun', 'pasca', 'lajang', '8-10', '70-79', '80-89', 'sangat baik', 0, 'lulus'),
(52, 'Delinda', '> 35', '0 tahun', 'akademi', 'menikah', '8-10', '70-79', '90-100', 'baik', 0, 'gagal'),
(53, 'Alessandra', '> 35', '> 2 tahun', 'sarjana', 'lajang', '8-10', '70-79', '90-100', 'sangat baik', 0, 'gagal'),
(54, 'Luigi', '> 35', '1-2 tahun', 'sarjana', 'menikah', '5-7', '70-79', '80-89', 'cukup baik', 0, 'lulus'),
(55, 'Herbert', '> 35', '1-2 tahun', 'akademi', 'lajang', '8-10', '70-79', '70-79', 'baik', 0, 'gagal'),
(56, 'Kacey', '> 35', '1-2 tahun', 'sma', 'menikah', '8-10', '90-100', '70-79', 'sangat baik', 0, 'gagal'),
(57, 'Eliz', '< 25', '1-2 tahun', 'sarjana', 'lajang', '5-7', '90-100', '90-100', 'sangat baik', 0, 'lulus'),
(58, 'Karleen', '25-35', '> 2 tahun', 'akademi', 'menikah', '5-7', '80-89', '70-79', 'baik', 0, 'gagal'),
(59, 'Lucienne', '> 35', '> 2 tahun', 'akademi', 'lajang', '8-10', '70-79', '90-100', 'sangat baik', 0, 'gagal'),
(60, 'Glynda', '< 25', '> 2 tahun', 'sma', 'menikah', '5-7', '70-79', '80-89', 'sangat baik', 0, 'gagal'),
(61, 'Tracy', '25-35', '0 tahun', 'pasca', 'lajang', '8-10', '90-100', '80-89', 'baik', 0, 'gagal'),
(62, 'Janey', '< 25', '1-2 tahun', 'sarjana', 'menikah', '5-7', '80-89', '80-89', 'baik', 0, 'lulus'),
(63, 'Daphine', '25-35', '> 2 tahun', 'sma', 'lajang', '8-10', '80-89', '70-79', 'cukup baik', 0, 'gagal'),
(64, 'Jacquelin', '25-35', '1-2 tahun', 'sarjana', 'lajang', '8-10', '90-100', '90-100', 'cukup baik', 0, 'lulus'),
(65, 'Timika', '> 35', '0 tahun', 'sma', 'menikah', '8-10', '70-79', '80-89', 'sangat baik', 0, 'lulus'),
(66, 'Pam', '25-35', '> 2 tahun', 'sarjana', 'lajang', '8-10', '90-100', '80-89', 'baik', 0, 'lulus'),
(67, 'Latrina', '25-35', '0 tahun', 'sma', 'lajang', '5-7', '70-79', '90-100', 'cukup baik', 0, 'lulus'),
(68, 'Porsha', '> 35', '1-2 tahun', 'sma', 'lajang', '8-10', '90-100', '80-89', 'baik', 0, 'gagal'),
(69, 'Carrol', '< 25', '0 tahun', 'sma', 'lajang', '8-10', '80-89', '70-79', 'cukup baik', 0, 'gagal'),
(70, 'Evita', '> 35', '> 2 tahun', 'sma', 'menikah', '8-10', '80-89', '70-79', 'cukup baik', 0, 'lulus'),
(71, 'Reagan', '< 25', '0 tahun', 'sarjana', 'lajang', '5-7', '80-89', '80-89', 'sangat baik', 0, 'lulus'),
(72, 'Quiana', '> 35', '1-2 tahun', 'pasca', 'menikah', '8-10', '70-79', '70-79', 'baik', 0, 'lulus'),
(73, 'Madonna', '< 25', '1-2 tahun', 'sma', 'menikah', '5-7', '90-100', '80-89', 'sangat baik', 0, 'gagal'),
(74, 'Hilario', '> 35', '1-2 tahun', 'akademi', 'menikah', '5-7', '90-100', '80-89', 'baik', 0, 'lulus'),
(75, 'Lu', '< 25', '0 tahun', 'sarjana', 'menikah', '8-10', '70-79', '90-100', 'sangat baik', 0, 'gagal'),
(76, 'Bruna', '> 35', '0 tahun', 'sma', 'menikah', '5-7', '70-79', '80-89', 'cukup baik', 0, 'gagal'),
(77, 'Juana', '25-35', '1-2 tahun', 'pasca', 'lajang', '8-10', '80-89', '70-79', 'baik', 0, 'gagal'),
(78, 'Thea', '25-35', '0 tahun', 'pasca', 'lajang', '8-10', '70-79', '90-100', 'cukup baik', 0, 'lulus'),
(79, 'Danita', '> 35', '0 tahun', 'pasca', 'menikah', '8-10', '70-79', '90-100', 'sangat baik', 0, 'lulus'),
(80, 'Cordell', '25-35', '0 tahun', 'akademi', 'menikah', '5-7', '90-100', '70-79', 'sangat baik', 0, 'lulus'),
(81, 'Raven', '> 35', '0 tahun', 'sarjana', 'lajang', '5-7', '90-100', '70-79', 'sangat baik', 0, 'lulus'),
(82, 'Ellie', '> 35', '1-2 tahun', 'pasca', 'menikah', '8-10', '80-89', '70-79', 'baik', 0, 'gagal'),
(83, 'Nathaniel', '25-35', '> 2 tahun', 'akademi', 'lajang', '5-7', '90-100', '90-100', 'cukup baik', 0, 'lulus'),
(84, 'Terrance', '< 25', '1-2 tahun', 'pasca', 'menikah', '5-7', '80-89', '80-89', 'sangat baik', 0, 'gagal'),
(85, 'Raymundo', '> 35', '1-2 tahun', 'pasca', 'menikah', '8-10', '80-89', '80-89', 'baik', 0, 'gagal'),
(86, 'Cori', '25-35', '> 2 tahun', 'pasca', 'menikah', '5-7', '80-89', '70-79', 'cukup baik', 0, 'lulus'),
(87, 'Harriet', '> 35', '1-2 tahun', 'sarjana', 'menikah', '8-10', '80-89', '70-79', 'sangat baik', 0, 'gagal'),
(88, 'Leonia', '25-35', '0 tahun', 'sarjana', 'menikah', '8-10', '80-89', '70-79', 'sangat baik', 0, 'gagal'),
(89, 'Bret', '> 35', '1-2 tahun', 'pasca', 'lajang', '5-7', '90-100', '80-89', 'baik', 0, 'lulus'),
(90, 'Collen', '25-35', '0 tahun', 'pasca', 'menikah', '5-7', '80-89', '80-89', 'sangat baik', 0, 'lulus'),
(91, 'Analisa', '25-35', '1-2 tahun', 'sma', 'menikah', '8-10', '90-100', '70-79', 'baik', 0, 'gagal'),
(92, 'Leisha', '< 25', '0 tahun', 'akademi', 'lajang', '8-10', '90-100', '70-79', 'cukup baik', 0, 'lulus'),
(93, 'Dane', '> 35', '0 tahun', 'akademi', 'lajang', '8-10', '90-100', '90-100', 'cukup baik', 0, 'gagal'),
(94, 'Alethia', '> 35', '> 2 tahun', 'akademi', 'menikah', '8-10', '70-79', '80-89', 'sangat baik', 0, 'lulus'),
(95, 'Danial', '25-35', '0 tahun', 'sma', 'menikah', '8-10', '90-100', '80-89', 'sangat baik', 0, 'lulus'),
(96, 'Cruz', '< 25', '0 tahun', 'sma', 'lajang', '5-7', '70-79', '80-89', 'sangat baik', 0, 'gagal'),
(97, 'August', '< 25', '> 2 tahun', 'akademi', 'lajang', '5-7', '70-79', '70-79', 'baik', 0, 'gagal'),
(98, 'Dawne', '< 25', '1-2 tahun', 'pasca', 'lajang', '8-10', '70-79', '90-100', 'sangat baik', 0, 'lulus'),
(99, 'Kyoko', '< 25', '> 2 tahun', 'sma', 'lajang', '8-10', '70-79', '70-79', 'cukup baik', 0, 'gagal'),
(100, 'Debera', '< 25', '0 tahun', 'akademi', 'lajang', '8-10', '90-100', '90-100', 'cukup baik', 0, 'lulus'),
(101, 'Stephen', '25-35', '1-2 tahun', 'pasca', 'menikah', '5-7', '90-100', '70-79', 'baik', 0, 'gagal'),
(102, 'Yan', '25-35', '0 tahun', 'sma', 'lajang', '8-10', '90-100', '70-79', 'sangat baik', 0, 'lulus'),
(103, 'Dewayne', '25-35', '> 2 tahun', 'sma', 'menikah', '8-10', '70-79', '70-79', 'baik', 0, 'lulus'),
(104, 'Shellie', '> 35', '1-2 tahun', 'pasca', 'lajang', '5-7', '90-100', '80-89', 'cukup baik', 0, 'gagal'),
(105, 'Phil', '25-35', '0 tahun', 'pasca', 'menikah', '8-10', '90-100', '90-100', 'baik', 0, 'gagal'),
(106, 'Jerome', '> 35', '0 tahun', 'akademi', 'lajang', '8-10', '70-79', '80-89', 'sangat baik', 0, 'lulus'),
(107, 'Lindsy', '25-35', '1-2 tahun', 'pasca', 'lajang', '8-10', '70-79', '90-100', 'cukup baik', 0, 'gagal'),
(108, 'Elly', '25-35', '0 tahun', 'sma', 'lajang', '5-7', '80-89', '70-79', 'baik', 0, 'lulus'),
(109, 'Billy', '25-35', '0 tahun', 'sma', 'menikah', '8-10', '90-100', '70-79', 'baik', 0, 'gagal'),
(110, 'Glennie', '> 35', '1-2 tahun', 'akademi', 'lajang', '8-10', '70-79', '80-89', 'baik', 0, 'lulus'),
(111, 'Dione', '> 35', '0 tahun', 'pasca', 'menikah', '5-7', '90-100', '70-79', 'sangat baik', 0, 'gagal'),
(112, 'Heriberto', '< 25', '1-2 tahun', 'pasca', 'menikah', '8-10', '90-100', '90-100', 'sangat baik', 0, 'lulus'),
(113, 'Farah', '> 35', '1-2 tahun', 'sma', 'menikah', '5-7', '70-79', '80-89', 'cukup baik', 0, 'lulus'),
(114, 'Frankie', '> 35', '0 tahun', 'akademi', 'menikah', '5-7', '70-79', '80-89', 'sangat baik', 0, 'lulus'),
(115, 'Mariella', '25-35', '1-2 tahun', 'sarjana', 'lajang', '8-10', '70-79', '90-100', 'baik', 0, 'lulus'),
(116, 'Marcelina', '< 25', '> 2 tahun', 'sma', 'lajang', '8-10', '70-79', '70-79', 'sangat baik', 0, 'lulus'),
(117, 'Velva', '< 25', '1-2 tahun', 'sma', 'menikah', '5-7', '70-79', '90-100', 'sangat baik', 0, 'gagal'),
(118, 'Gretchen', '25-35', '1-2 tahun', 'sarjana', 'menikah', '8-10', '80-89', '80-89', 'baik', 0, 'lulus'),
(119, 'Bobby', '> 35', '1-2 tahun', 'sma', 'lajang', '8-10', '80-89', '80-89', 'sangat baik', 0, 'lulus'),
(120, 'Iona', '25-35', '1-2 tahun', 'sarjana', 'lajang', '5-7', '70-79', '90-100', 'cukup baik', 0, 'lulus'),
(121, 'Maris', '< 25', '0 tahun', 'akademi', 'menikah', '8-10', '80-89', '90-100', 'cukup baik', 0, 'lulus'),
(122, 'Louetta', '> 35', '0 tahun', 'sarjana', 'lajang', '8-10', '70-79', '90-100', 'sangat baik', 0, 'lulus'),
(123, 'Amelia', '> 35', '> 2 tahun', 'sma', 'lajang', '5-7', '70-79', '90-100', 'sangat baik', 0, 'lulus'),
(124, 'Eldon', '25-35', '0 tahun', 'sarjana', 'lajang', '5-7', '70-79', '80-89', 'cukup baik', 0, 'gagal'),
(125, 'Rolanda', '> 35', '0 tahun', 'akademi', 'menikah', '5-7', '80-89', '70-79', 'baik', 0, 'lulus'),
(126, 'Chang', '> 35', '> 2 tahun', 'sarjana', 'menikah', '5-7', '90-100', '80-89', 'sangat baik', 0, 'lulus'),
(127, 'Cory', '25-35', '0 tahun', 'sma', 'lajang', '5-7', '70-79', '90-100', 'sangat baik', 0, 'gagal'),
(128, 'Elvis', '25-35', '1-2 tahun', 'pasca', 'lajang', '8-10', '90-100', '80-89', 'cukup baik', 0, 'lulus'),
(129, 'Bo', '25-35', '> 2 tahun', 'pasca', 'menikah', '5-7', '90-100', '70-79', 'sangat baik', 0, 'lulus'),
(130, 'Sara', '< 25', '1-2 tahun', 'sma', 'menikah', '8-10', '70-79', '80-89', 'sangat baik', 0, 'gagal'),
(131, 'Rima', '> 35', '0 tahun', 'pasca', 'lajang', '5-7', '90-100', '80-89', 'baik', 0, 'lulus'),
(132, 'Moriah', '< 25', '> 2 tahun', 'sma', 'menikah', '5-7', '70-79', '90-100', 'sangat baik', 0, 'lulus'),
(133, 'Cora', '< 25', '1-2 tahun', 'sma', 'menikah', '8-10', '70-79', '70-79', 'sangat baik', 0, 'gagal'),
(134, 'Scarlet', '> 35', '0 tahun', 'akademi', 'lajang', '8-10', '80-89', '70-79', 'cukup baik', 0, 'lulus'),
(135, 'Lilly', '< 25', '> 2 tahun', 'sarjana', 'lajang', '8-10', '90-100', '70-79', 'sangat baik', 0, 'lulus'),
(136, 'Mika', '25-35', '0 tahun', 'sarjana', 'menikah', '8-10', '90-100', '80-89', 'sangat baik', 0, 'lulus'),
(137, 'Yuk', '< 25', '0 tahun', 'pasca', 'lajang', '8-10', '80-89', '80-89', 'sangat baik', 0, 'gagal'),
(138, 'Velma', '25-35', '0 tahun', 'sarjana', 'lajang', '8-10', '90-100', '90-100', 'cukup baik', 0, 'lulus'),
(139, 'Filomena', '25-35', '1-2 tahun', 'pasca', 'lajang', '5-7', '70-79', '80-89', 'baik', 0, 'gagal'),
(140, 'Hilary', '25-35', '> 2 tahun', 'sarjana', 'menikah', '5-7', '70-79', '80-89', 'cukup baik', 0, 'lulus'),
(141, 'Victoria', '> 35', '> 2 tahun', 'akademi', 'menikah', '5-7', '70-79', '90-100', 'cukup baik', 0, 'lulus'),
(142, 'Darline', '< 25', '0 tahun', 'sarjana', 'lajang', '8-10', '90-100', '70-79', 'baik', 0, 'gagal'),
(143, 'Carola', '> 35', '> 2 tahun', 'pasca', 'menikah', '5-7', '70-79', '90-100', 'cukup baik', 0, 'lulus'),
(144, 'Patsy', '< 25', '0 tahun', 'sarjana', 'lajang', '8-10', '80-89', '90-100', 'sangat baik', 0, 'lulus'),
(145, 'Lonny', '> 35', '> 2 tahun', 'sarjana', 'menikah', '5-7', '90-100', '70-79', 'sangat baik', 0, 'gagal'),
(146, 'Marla', '< 25', '0 tahun', 'pasca', 'lajang', '5-7', '80-89', '70-79', 'cukup baik', 0, 'lulus'),
(147, 'Onie', '> 35', '> 2 tahun', 'sma', 'menikah', '8-10', '80-89', '80-89', 'baik', 0, 'lulus'),
(148, 'Karleen', '25-35', '> 2 tahun', 'pasca', 'lajang', '8-10', '70-79', '70-79', 'baik', 0, 'lulus'),
(149, 'Shanelle', '25-35', '0 tahun', 'sarjana', 'lajang', '5-7', '90-100', '70-79', 'cukup baik', 0, 'gagal'),
(150, 'France', '> 35', '> 2 tahun', 'sarjana', 'lajang', '8-10', '70-79', '80-89', 'sangat baik', 0, 'lulus'),
(151, 'Gladys', '< 25', '> 2 tahun', 'sma', 'lajang', '5-7', '70-79', '90-100', 'sangat baik', 0, 'lulus'),
(152, 'Lenore', '< 25', '> 2 tahun', 'sma', 'menikah', '5-7', '90-100', '80-89', 'baik', 0, 'lulus'),
(153, 'Kesha', '> 35', '> 2 tahun', 'sarjana', 'menikah', '5-7', '70-79', '90-100', 'baik', 0, 'lulus'),
(154, 'Donovan', '< 25', '> 2 tahun', 'sarjana', 'lajang', '8-10', '70-79', '70-79', 'cukup baik', 0, 'gagal'),
(155, 'Marti', '< 25', '> 2 tahun', 'pasca', 'lajang', '5-7', '70-79', '70-79', 'baik', 0, 'gagal'),
(156, 'Mari', '< 25', '1-2 tahun', 'sma', 'menikah', '5-7', '90-100', '70-79', 'sangat baik', 0, 'lulus'),
(157, 'Brock', '> 35', '> 2 tahun', 'sma', 'menikah', '5-7', '80-89', '90-100', 'sangat baik', 0, 'lulus'),
(158, 'Salvador', '25-35', '> 2 tahun', 'akademi', 'lajang', '8-10', '90-100', '70-79', 'baik', 0, 'gagal'),
(159, 'Carmella', '25-35', '1-2 tahun', 'sarjana', 'lajang', '5-7', '80-89', '80-89', 'cukup baik', 0, 'lulus'),
(160, 'Nerissa', '25-35', '0 tahun', 'pasca', 'lajang', '8-10', '70-79', '90-100', 'baik', 0, 'gagal'),
(161, 'Bennett', '25-35', '0 tahun', 'sarjana', 'menikah', '8-10', '70-79', '70-79', 'cukup baik', 0, 'lulus'),
(162, 'Tona', '25-35', '> 2 tahun', 'sma', 'lajang', '8-10', '80-89', '80-89', 'sangat baik', 0, 'gagal'),
(163, 'Antonette', '> 35', '> 2 tahun', 'akademi', 'lajang', '8-10', '90-100', '70-79', 'sangat baik', 0, 'lulus'),
(164, 'Suzette', '25-35', '0 tahun', 'akademi', 'menikah', '5-7', '70-79', '80-89', 'cukup baik', 0, 'lulus'),
(165, 'Xochitl', '> 35', '1-2 tahun', 'pasca', 'lajang', '5-7', '70-79', '80-89', 'sangat baik', 0, 'gagal'),
(166, 'Inger', '25-35', '> 2 tahun', 'pasca', 'lajang', '5-7', '80-89', '80-89', 'sangat baik', 0, 'lulus'),
(167, 'Stan', '25-35', '> 2 tahun', 'sarjana', 'lajang', '8-10', '70-79', '80-89', 'baik', 0, 'lulus'),
(168, 'Saturnina', '> 35', '> 2 tahun', 'akademi', 'menikah', '5-7', '80-89', '70-79', 'cukup baik', 0, 'gagal'),
(169, 'Toi', '> 35', '> 2 tahun', 'pasca', 'lajang', '8-10', '70-79', '90-100', 'cukup baik', 0, 'gagal'),
(170, 'Eusebio', '< 25', '> 2 tahun', 'akademi', 'lajang', '5-7', '90-100', '90-100', 'baik', 0, 'lulus'),
(171, 'Solomon', '25-35', '1-2 tahun', 'pasca', 'menikah', '8-10', '70-79', '70-79', 'cukup baik', 0, 'gagal'),
(172, 'Adaline', '< 25', '> 2 tahun', 'sarjana', 'lajang', '8-10', '90-100', '70-79', 'cukup baik', 0, 'gagal'),
(173, 'Elia', '> 35', '0 tahun', 'sma', 'lajang', '8-10', '80-89', '70-79', 'baik', 0, 'gagal'),
(174, 'Lacey', '> 35', '> 2 tahun', 'pasca', 'menikah', '8-10', '70-79', '90-100', 'cukup baik', 0, 'gagal'),
(175, 'Sallie', '< 25', '> 2 tahun', 'sarjana', 'menikah', '8-10', '80-89', '80-89', 'baik', 0, 'lulus'),
(176, 'Buffy', '< 25', '> 2 tahun', 'akademi', 'menikah', '8-10', '90-100', '90-100', 'sangat baik', 0, 'gagal'),
(177, 'Maurice', '< 25', '> 2 tahun', 'akademi', 'lajang', '8-10', '80-89', '80-89', 'sangat baik', 0, 'lulus'),
(178, 'Buck', '> 35', '> 2 tahun', 'sma', 'menikah', '5-7', '90-100', '80-89', 'sangat baik', 0, 'lulus'),
(179, 'Chase', '> 35', '0 tahun', 'sma', 'lajang', '8-10', '90-100', '70-79', 'sangat baik', 0, 'gagal'),
(180, 'Ernesto', '< 25', '0 tahun', 'sarjana', 'lajang', '8-10', '90-100', '70-79', 'sangat baik', 0, 'lulus'),
(181, 'Nedra', '25-35', '> 2 tahun', 'pasca', 'lajang', '5-7', '90-100', '90-100', 'cukup baik', 0, 'gagal'),
(182, 'Lizabeth', '> 35', '1-2 tahun', 'sarjana', 'lajang', '8-10', '90-100', '70-79', 'baik', 0, 'gagal'),
(183, 'Marcia', '> 35', '1-2 tahun', 'akademi', 'menikah', '8-10', '70-79', '70-79', 'sangat baik', 0, 'gagal'),
(184, 'Gilbert', '< 25', '1-2 tahun', 'sarjana', 'menikah', '8-10', '80-89', '80-89', 'sangat baik', 0, 'lulus'),
(185, 'Titus', '25-35', '> 2 tahun', 'akademi', 'menikah', '8-10', '80-89', '70-79', 'baik', 0, 'lulus'),
(186, 'Orville', '25-35', '0 tahun', 'akademi', 'lajang', '8-10', '70-79', '70-79', 'sangat baik', 0, 'lulus'),
(187, 'Jutta', '25-35', '> 2 tahun', 'sarjana', 'lajang', '5-7', '80-89', '90-100', 'sangat baik', 0, 'lulus'),
(188, 'Sophia', '< 25', '0 tahun', 'pasca', 'menikah', '8-10', '90-100', '80-89', 'baik', 0, 'gagal'),
(189, 'Charlie', '> 35', '1-2 tahun', 'sma', 'lajang', '5-7', '90-100', '90-100', 'cukup baik', 0, 'gagal'),
(190, 'Raul', '< 25', '0 tahun', 'sarjana', 'lajang', '5-7', '90-100', '90-100', 'sangat baik', 0, 'gagal'),
(191, 'Adriane', '25-35', '0 tahun', 'pasca', 'lajang', '8-10', '80-89', '90-100', 'sangat baik', 0, 'lulus'),
(192, 'Shaquana', '25-35', '1-2 tahun', 'sma', 'menikah', '5-7', '70-79', '90-100', 'sangat baik', 0, 'gagal'),
(193, 'Emmy', '25-35', '0 tahun', 'pasca', 'lajang', '8-10', '70-79', '70-79', 'baik', 0, 'lulus'),
(194, 'Bret', '25-35', '0 tahun', 'akademi', 'lajang', '8-10', '90-100', '80-89', 'sangat baik', 0, 'lulus'),
(195, 'Nicki', '> 35', '1-2 tahun', 'sarjana', 'menikah', '8-10', '70-79', '80-89', 'baik', 0, 'gagal'),
(196, 'Clara', '< 25', '1-2 tahun', 'sarjana', 'menikah', '5-7', '70-79', '80-89', 'sangat baik', 0, 'lulus'),
(197, 'Luigi', '25-35', '> 2 tahun', 'akademi', 'lajang', '8-10', '80-89', '90-100', 'cukup baik', 0, 'lulus'),
(198, 'Rossie', '< 25', '> 2 tahun', 'sarjana', 'lajang', '5-7', '80-89', '80-89', 'cukup baik', 0, 'gagal'),
(199, 'Danelle', '> 35', '> 2 tahun', 'akademi', 'lajang', '5-7', '90-100', '80-89', 'baik', 0, 'lulus'),
(200, 'Melania', '> 35', '> 2 tahun', 'akademi', 'menikah', '5-7', '80-89', '80-89', 'sangat baik', 0, 'lulus');

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
(1, 'IT Support', '2018-06-26 11:44:51', '2018-08-20 13:59:16'),
(7, 'Akuntansi', '2018-07-03 01:19:02', '2018-07-02 18:19:02'),
(8, 'Salesman', '2018-07-03 01:34:14', '2018-07-02 18:34:14'),
(9, 'Manajer Operasional', '2018-07-03 01:34:23', '2018-07-02 18:34:23'),
(10, 'Manajer Logistik', '2018-07-03 01:34:34', '2018-07-02 18:34:34');

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
  `status` tinyint(4) NOT NULL,
  `label` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_job` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_f2f`
--

INSERT INTO `question_f2f` (`id_question`, `question`, `answer_a`, `answer_b`, `answer_c`, `answer_d`, `correct_ans`, `status`, `label`, `created_at`, `updated_at`, `id_job`) VALUES
(4, '<p>Posting atau pemindah bukuan adalah proses pemindahan informasi dari ?</p>', 'Jurnal ke neraca saldo keuangan', 'Buku besar ke laporan', 'Buku besar ke neraca saldo', 'Jurnal ke buku besar', 'Jurnal ke buku besar', 1, 'Akuntansi I', '2018-07-20 10:51:54', '2018-07-19 20:51:54', 7),
(5, '<p>Di antara kejadian berikut mana yang bukan merupakan transaksi usaha ?</p>', 'Penyetoran sejumlah uang oleh pemilik untuk kepentingan usaha', 'Pembelian bahan baku secara tunai', 'Penjualan barang dagangan secara kredit', 'Kenaikan suku bunga pinjaman di bank', 'Kenaikan suku bunga pinjaman di bank', 1, 'Akuntansi I', '2018-07-20 10:53:23', '2018-07-19 20:53:23', 7),
(6, '<p>Pembelian perlengkapan kantor secara kredit akan mempengaruhi persamaan akuntansi sebagai berikut ?</p>', 'Aktiva bertambah dan hutang bertambah', 'Aktiva bertambah dan modal berkurang', 'Aktiva bertambah dan modal bertambah', 'Aktiva, utang dan modal tidak berubah', 'Aktiva bertambah dan hutang bertambah', 1, 'Akuntansi I', '2018-07-20 11:07:44', '2018-07-23 13:26:11', 7),
(7, '<p>A payment of cash for the purchases of merchandise would be recorded in the :</p>', 'Purchase journal', 'Cash payment journal', 'Sales journal', 'Cash receipt journal', 'Cash payment journal', 1, 'Akuntansi I', '2018-07-20 11:08:46', '2018-07-19 21:08:46', 7),
(8, '<p>Manakah di antara pernyataan berikut yang tidak tepat ?</p>', 'Kas mempunyai saldo normal debit', 'Piutang mempunyai saldo normal debit', 'Modal mempunyai saldo normal debit', 'Hutang mempunyai saldo normal kredit', 'Modal mempunyai saldo normal debit', 1, 'Akuntansi I', '2018-07-20 11:09:31', '2018-07-19 21:09:31', 7),
(9, '<p>Outstanding check disebut juga :</p>', 'Cek kosong', 'Cek tidak cukup dana', 'cek yang belum disetorkan', 'Cek yang beredar', 'Cek yang beredar', 1, 'Akuntansi I', '2018-07-20 11:10:25', '2018-07-19 21:10:25', 7),
(10, '<p>Dalam balance sheet investasi jangka pendek termasuk dalam kelompok :</p>', 'Aktiva tetap', 'Aktiva lancar', 'Hutang jangka pendek', 'Hutang jangka panjang', 'Aktiva lancar', 1, 'Akuntansi I', '2018-07-20 11:11:19', '2018-07-19 21:11:19', 7),
(11, '<p>Dasar penyusutan dapat dipengaruhi oleh nilai-nilai berikut, kecuali:</p>', 'Harga perolehan', 'Nilai sisa', 'Nilai buku', 'Nilai pasar', 'Nilai pasar', 1, 'Akuntansi I', '2018-07-20 11:12:52', '2018-07-19 21:12:52', 7),
(12, '<p>Satu dari pos-pos kerugian dibawah ini termasuk dalam katagori pos-pos luar biasa :</p>', 'Kerugian karena penjualan aktiva tetap', 'Kerugian karena penurunan nilai persediaan', 'Kerugian karena devaluasi rupiah', 'Kerugian karena penjualan surat-surat berharga', 'Kerugian karena devaluasi rupiah', 1, 'Akuntansi I', '2018-07-20 11:18:26', '2018-07-29 07:04:53', 7),
(13, '<p>&nbsp;Ayat jurnal tidak dibuat untuK ?</p>', 'Penempatan saham', 'Perolehan kembali saham', 'Pemecahan saham', 'Pengeluaran saham', 'Pemecahan saham', 1, 'Akuntansi I', '2018-07-20 11:19:49', '2018-07-19 21:19:49', 7),
(14, '<p>Perlindungan pada program komputer mencakup ?</p>', 'Source code program dan program aplikasinya', 'Program aplikasi saja', 'Pemilik program komputer saja', 'Source code programnya saja', 'Source code program dan program aplikasinya', 1, 'IT Support I', '2018-08-21 05:16:32', '2018-08-20 22:16:32', 1),
(15, '<p>Tipe data yang digunakan untuk field karakter atau huruf adalah ?</p>', 'Memo', 'Text', 'Number', 'Hyperlink', 'Text', 1, 'IT Support I', '2018-08-21 05:17:23', '2018-08-20 22:17:23', 1);

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
  `status` tinyint(4) NOT NULL,
  `label` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_job` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_online`
--

INSERT INTO `question_online` (`id_question`, `question`, `answer_a`, `answer_b`, `answer_c`, `answer_d`, `correct_ans`, `status`, `label`, `created_at`, `updated_at`, `id_job`) VALUES
(10, '<p>Untuk menghindari kecelakaan kerja ditempat kerja, dapat dilakukan dengan memberikan santunan untuk penghasilan yang hilang sebagai akibat dari kecelakaan kerja berupa ?</p>', 'Standarisasi', 'Pengawasan', 'Asuransi', 'Riset Teknis', 'Asuransi', 1, 'Akuntansi I', '2018-07-20 09:54:16', '2018-07-20 02:54:16', 7),
(11, '<p>Bidang akuntansi yang bertujuan menyediakan informasi didalam perusahaan ?</p>', 'Akuntansi Keuangan', 'Akuntansi Manajemen', 'AKuntansi Pemeriksaan', 'Akuntansi Biaya', 'Akuntansi Manajemen', 1, 'Akuntansi I', '2018-07-20 09:55:48', '2018-07-20 02:55:48', 7),
(12, '<p>Transaksi pembayaran gaji karyawan dalam persamaan dasar akuntansi akan mempengaruhi ?</p>', 'Harta (-), Hutang (-), dan Modal (+)', 'Harta (-) dan Modal (+)', 'Harta (-) dan Modal (-)', 'Harta (+) dan Modal (-)', 'Harta (-) dan Modal (-)', 1, 'Akuntansi I', '2018-07-20 09:57:16', '2018-07-20 02:57:26', 7),
(13, '<p>Bukti transaksi atas penjualan atau pembelian (secara kredit) adalah ?</p>', 'Invoice', 'Memo', 'Kuitansi', 'Debet Memorandum', 'Invoice', 1, 'Akuntansi I', '2018-07-20 10:07:27', '2018-07-20 03:07:27', 7),
(14, '<p>Pada tahun berapa berdiri organisasi Ikatan Akuntansi Indonesia (IAI) ?</p>', '1958', '1957', '1975', '1960', '1957', 1, 'Akuntansi I', '2018-07-20 10:35:35', '2018-07-20 03:35:35', 7),
(15, '<p>Perhatikan jenis-jenis biaya berikut ini :</p>\r\n<ol style=\"list-style-type: upper-roman;\">\r\n<li>Biaya bahan baku</li>\r\n<li>Biaya tenaga kerja</li>\r\n<li>Pengeluaran pendapatan</li>\r\n<li>Biaya produksi</li>\r\n<li>Biaya pemasaran</li>\r\n<li>Biaya langsung</li>\r\n<li>Biaya tetap</li>\r\n<li>Biaya administrasi dan umum</li>\r\n</ol>\r\n<p>yang merupakan jenis biaya atas dasar objek pengeluaran adalah ?</p>', 'I, II, III', 'IV, V, VIII', 'V, VI, VII', 'I, V, IV', 'IV, V, VIII', 1, 'Akuntansi I', '2018-07-20 10:39:58', '2018-07-20 03:39:58', 7),
(16, '<p>Salah satu alasan dilakukannya rekonsiliasi bank adalah ?</p>', 'Kesalahan mencatat nama customer oleh perusahaan', 'Kesalahan menulis nomor cek oleh perusahaan', 'Adanya setoran dalam perjalanan', 'Penggunaan cek dalam pembayaran hutang', 'Adanya setoran dalam perjalanan', 1, 'Akuntansi I', '2018-07-20 10:41:22', '2018-07-20 03:41:22', 7),
(17, '<p>Terdapat data PT Mawar sebagai berikut :</p>\r\n<p style=\"padding-left: 30px;\">Pembelian Rp 246.000.000,-</p>\r\n<p style=\"padding-left: 30px;\">Retur Pembelian Rp 44.000.000,-</p>\r\n<p style=\"padding-left: 30px;\">Biaya angkut pembelian Rp 5.000.000,-</p>\r\n<p style=\"padding-left: 30px;\">Persediaan awal Rp 420.000.000,-</p>\r\n<p style=\"padding-left: 30px;\">Persediaan akhir (Rp 240.000.000,-)</p>\r\n<p style=\"padding-left: 30px;\">Penjualan Rp 800.000.000,-</p>\r\n<p style=\"padding-left: 30px;\">Retur penjualan (Rp 44.000.000,-)</p>\r\n<p>Berdasarkan data diatas, PT MAWAR mengalami ?</p>', 'Laba kotor Rp 377.000.000,-', 'Laba kotor Rp 387.000.000,-', 'Laba kotor Rp 403.000.000,-', 'Laba kotor Rp 763.000.000,-', 'Laba kotor Rp 387.000.000,-', 1, 'Akuntansi I', '2018-07-20 10:45:05', '2018-07-20 03:45:05', 7),
(18, '<p>Pendapatan diterima di muka adalah ?</p>', 'Aktiva', 'Modal', 'Pendapatan', 'Kewajiban', 'Kewajiban', 1, 'Akuntansi I', '2018-07-20 10:45:54', '2018-07-20 03:45:54', 7),
(19, '<p>Program komputer yang berfungsi sebagai sarana interaksi antara pengguna dengan perangkat keras atau sebagai penterjemah perintah yang dijalankan pengguna komputer disebut ?</p>', 'Hardware', 'Software', 'Brainware', 'Peripheral', 'Software', 1, 'IT Support I', '2018-08-21 05:14:26', '2018-08-20 22:14:26', 1),
(20, '<p>ada saat pertama kali computer dihidupkan, maka akan ada proses menyiapkan system operasi disebut ?</p>', 'Login', 'Logoff', 'Booting', 'Restart', 'Booting', 1, 'IT Support I', '2018-08-21 05:15:10', '2018-08-20 22:15:10', 1);

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
(1, '2018-08-14 06:23:56', '2018-08-13 23:23:56', 17, 7, 4),
(2, '2018-08-14 06:23:56', '2018-08-13 23:23:56', 18, 7, 4),
(3, '2018-08-14 06:23:56', '2018-08-13 23:23:56', 20, 7, 4),
(4, '2018-08-14 06:23:56', '2018-08-13 23:23:56', 21, 7, 4),
(5, '2018-08-14 06:23:56', '2018-08-13 23:23:56', 22, 7, 4),
(6, '2018-08-14 06:23:56', '2018-08-13 23:23:56', 23, 7, 4),
(7, '2018-08-15 06:37:28', '2018-08-14 23:37:28', 2, 2, 5),
(8, '2018-08-15 06:37:28', '2018-08-14 23:37:28', 10, 2, 5),
(9, '2018-08-15 06:37:28', '2018-08-14 23:37:28', 17, 2, 5),
(10, '2018-08-15 06:37:28', '2018-08-14 23:37:28', 18, 2, 5),
(11, '2018-08-15 06:37:28', '2018-08-14 23:37:28', 20, 2, 5),
(12, '2018-08-15 06:37:28', '2018-08-14 23:37:28', 22, 2, 5),
(13, '2018-08-15 06:37:28', '2018-08-14 23:37:28', 23, 2, 5),
(14, '2018-08-15 06:37:28', '2018-08-14 23:37:28', 24, 2, 5),
(15, '2018-08-20 21:09:21', '2018-08-20 14:09:21', 17, 7, 1),
(16, '2018-08-20 21:09:21', '2018-08-20 14:09:21', 18, 7, 1),
(17, '2018-08-20 21:09:21', '2018-08-20 14:09:21', 20, 7, 1),
(18, '2018-08-20 21:09:21', '2018-08-20 14:09:21', 21, 7, 1),
(19, '2018-08-20 21:09:21', '2018-08-20 14:09:21', 22, 7, 1),
(20, '2018-08-20 21:09:21', '2018-08-20 14:09:21', 23, 7, 1),
(21, '2018-08-20 21:09:21', '2018-08-20 14:09:21', 29, 7, 1),
(22, '2018-08-20 21:09:21', '2018-08-20 14:09:21', 30, 7, 1),
(23, '2018-08-20 21:09:21', '2018-08-20 14:09:21', 32, 7, 1),
(24, '2018-08-20 21:09:21', '2018-08-20 14:09:21', 33, 7, 1),
(25, '2018-08-20 21:12:48', '2018-08-20 14:12:48', 2, 1, 2),
(26, '2018-08-20 21:12:48', '2018-08-20 14:12:48', 10, 1, 2),
(27, '2018-08-20 21:12:48', '2018-08-20 14:12:48', 17, 1, 2),
(28, '2018-08-20 21:12:48', '2018-08-20 14:12:48', 18, 1, 2),
(29, '2018-08-20 21:12:48', '2018-08-20 14:12:48', 20, 1, 2),
(30, '2018-08-20 21:12:48', '2018-08-20 14:12:48', 22, 1, 2),
(31, '2018-08-20 21:12:48', '2018-08-20 14:12:48', 23, 1, 2),
(32, '2018-08-20 21:12:48', '2018-08-20 14:12:48', 24, 1, 2),
(33, '2018-08-20 21:12:48', '2018-08-20 14:12:48', 27, 1, 2),
(34, '2018-08-20 21:12:48', '2018-08-20 14:12:48', 28, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `selection_stage`
--

CREATE TABLE `selection_stage` (
  `id_stage` int(6) NOT NULL,
  `label_online` varchar(255) NOT NULL,
  `label_f2f` varchar(255) NOT NULL,
  `status_selesai` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_std` int(6) NOT NULL,
  `id_job` int(6) NOT NULL,
  `lbl_register` text,
  `lbl_online` text,
  `lbl_f2f` text,
  `lbl_interview` text,
  `catatan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `selection_stage`
--

INSERT INTO `selection_stage` (`id_stage`, `label_online`, `label_f2f`, `status_selesai`, `created_at`, `updated_at`, `id_std`, `id_job`, `lbl_register`, `lbl_online`, `lbl_f2f`, `lbl_interview`, `catatan`) VALUES
(2, 'IT Support I', 'IT Support I', 1, '2018-08-21 05:19:06', '2018-08-23 13:06:38', 2, 1, NULL, NULL, NULL, NULL, '- Bawa Transkip Nilai\r\n- Bawa Izajah\r\n\r\nDatang ke Jl. Cemara No. 01, Medan\r\n*datang pada tanggal yang telah di tetapkan.'),
(3, 'Akuntansi I', 'Akuntansi I', 1, '2018-08-23 19:50:55', '2018-08-23 13:06:43', 1, 9, '11', '11', '11', NULL, 'Bawa surat lamaran dan surat pendukung lainnya, datang pada tanggal yang sudah ditetapkan.\r\n\r\nJl. Thamrin No. 04, Medan');

-- --------------------------------------------------------

--
-- Table structure for table `selection_stage_detail`
--

CREATE TABLE `selection_stage_detail` (
  `id` int(6) NOT NULL,
  `label` varchar(255) NOT NULL,
  `start_stage` datetime NOT NULL,
  `end_stage` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_stage` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `selection_stage_detail`
--

INSERT INTO `selection_stage_detail` (`id`, `label`, `start_stage`, `end_stage`, `created_at`, `updated_at`, `id_stage`) VALUES
(6, 'Tahap 1', '2018-08-21 05:19:00', '2018-08-21 05:58:26', '2018-08-21 05:19:06', '2018-08-20 22:58:26', 2),
(7, 'Tahap 2', '2018-08-21 05:58:26', '2018-08-21 05:58:28', '2018-08-21 05:19:06', '2018-08-20 22:58:28', 2),
(8, 'Tahap 3', '2018-08-21 05:58:28', '2018-08-21 05:58:31', '2018-08-21 05:19:06', '2018-08-20 22:58:31', 2),
(9, 'Tahap 4', '2018-08-21 05:58:31', '2018-08-21 05:58:33', '2018-08-21 05:19:06', '2018-08-20 22:58:33', 2),
(10, 'Tahap 5', '2018-08-21 05:58:33', '2018-08-21 05:58:33', '2018-08-21 05:19:06', '2018-08-20 22:58:33', 2),
(11, 'Tahap 1', '2018-08-23 19:51:00', '2018-08-23 19:53:57', '2018-08-23 19:50:55', '2018-08-23 12:53:57', 3),
(12, 'Tahap 2', '2018-08-23 19:53:57', '2018-08-23 19:56:11', '2018-08-23 19:50:55', '2018-08-23 12:56:11', 3),
(13, 'Tahap 3', '2018-08-23 19:56:11', '2018-08-23 19:58:39', '2018-08-23 19:50:55', '2018-08-23 12:58:39', 3),
(14, 'Tahap 4', '2018-08-23 19:58:39', '2018-08-23 20:06:40', '2018-08-23 19:50:55', '2018-08-23 13:06:40', 3),
(15, 'Tahap 5', '2018-08-23 20:06:40', '2018-08-23 20:06:40', '2018-08-23 19:50:55', '2018-08-23 13:06:40', 3);

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
(1, 'Kualifikasi Akuntansi I', 7),
(2, 'Kualifikasi IT Support I', 1);

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
  `id_stage_detail` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `email`, `password`, `confirm_code`, `acc_status`, `created_at`, `updated_at`, `id_job`, `id_stage_detail`) VALUES
(1, 'santi03@yahoo.com', '25d55ad283aa400af464c76d713c07ad', NULL, 1, '2018-08-21 05:26:38', '2018-08-23 13:07:52', 1, 11),
(2, 'mch_1984@gmail.com', '25d55ad283aa400af464c76d713c07ad', NULL, 1, '2018-08-21 05:26:38', '2018-08-23 13:07:55', 1, 11),
(3, 'ria.na15@yahoo.com', '25d55ad283aa400af464c76d713c07ad', NULL, 1, '2018-08-21 05:26:38', '2018-08-23 13:08:00', 1, 11),
(4, 'albertchandra@yahoo.com', '25d55ad283aa400af464c76d713c07ad', NULL, 1, '2018-08-21 05:26:38', '2018-08-23 13:07:59', 1, 11),
(5, 'robert_tan@yahoo.com', '25d55ad283aa400af464c76d713c07ad', NULL, 1, '2018-08-21 05:26:38', '2018-08-23 13:08:04', 1, 11),
(6, 'citra.sari1212@gmail.com', '25d55ad283aa400af464c76d713c07ad', NULL, 1, '2018-08-21 05:26:38', '2018-08-23 13:08:03', 1, 11),
(7, 'sylvia.s@yahoo.com', '25d55ad283aa400af464c76d713c07ad', NULL, 1, '2018-08-21 05:26:38', '2018-08-23 13:08:02', 1, 11),
(8, 'kiranawijaya@gmail.com', '25d55ad283aa400af464c76d713c07ad', NULL, 1, '2018-08-21 05:26:38', '2018-08-23 13:07:57', 1, 11),
(9, 'adrian0497@yahoo.com', '25d55ad283aa400af464c76d713c07ad', NULL, 1, '2018-08-21 05:26:38', '2018-08-23 13:08:06', 1, 11),
(10, 'vivi.tanjaya@yahoo.com', '25d55ad283aa400af464c76d713c07ad', NULL, 1, '2018-08-21 05:26:38', '2018-08-23 13:08:08', 1, 11),
(11, 'edw.suryajaya@gmail.com', '25d55ad283aa400af464c76d713c07ad', NULL, 1, '2018-08-23 19:52:21', '2018-08-23 13:09:37', 9, 14);

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

--
-- Dumping data for table `users_ability`
--

INSERT INTO `users_ability` (`id`, `created_at`, `updated_at`, `id_ability`, `id_user`) VALUES
(1, '2018-08-23 19:52:21', '2018-08-23 12:52:21', 17, 11),
(2, '2018-08-23 19:52:21', '2018-08-23 12:52:21', 18, 11),
(3, '2018-08-23 19:52:21', '2018-08-23 12:52:21', 20, 11),
(4, '2018-08-23 19:52:21', '2018-08-23 12:52:21', 21, 11),
(5, '2018-08-23 19:52:21', '2018-08-23 12:52:21', 27, 11),
(6, '2018-08-23 19:52:21', '2018-08-23 12:52:21', 29, 11);

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
  `total_ability` int(3) NOT NULL,
  `status_passed` tinyint(4) NOT NULL DEFAULT '0',
  `nama_kerabat` varchar(255) NOT NULL,
  `nomor_kerabat` varchar(255) NOT NULL,
  `hubungan_kerabat` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_user` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_detail`
--

INSERT INTO `users_detail` (`id_d_user`, `full_name`, `no_ktp`, `birth_place`, `birth_date`, `address`, `domisili`, `kode_pos`, `p_number`, `t_number`, `age`, `gender`, `religion`, `last_education`, `status`, `experience`, `nilai_online`, `nilai_f2f`, `nilai_sikap`, `total_ability`, `status_passed`, `nama_kerabat`, `nomor_kerabat`, `hubungan_kerabat`, `created_at`, `updated_at`, `id_user`) VALUES
(1, 'Santi', '1939458829567660', 'Medan', '1976-04-20', 'Jl. Mangga', 'Medan', '20214', '081459245139', NULL, 42, 'wanita', 'buddha', 'akademi', 'lajang', 3, 90, 90, 'sangat baik', 7, 0, 'Mina', '081742187479', 'teman', '2018-08-21 05:55:38', '2018-08-20 23:17:52', 1),
(2, 'Michael', '1562862195178460', 'Medan', '1984-05-02', 'Jl. Manggis', 'Medan', '20223', '081356134325', NULL, 34, 'pria', 'buddha', 'sma', 'menikah', 0, 74, 76, 'baik', 5, 0, 'Koko', '081572722634', 'teman', '2018-08-21 05:55:38', '2018-08-20 22:57:09', 2),
(3, 'Riana', '1450138517330510', 'Tanjung Balai', '2000-06-15', 'Jl. Jeruk', 'Tanjung Balai', '20143', '081899308742', NULL, 18, 'wanita', 'buddha', 'sma', 'lajang', 3, 90, 86, 'cukup baik', 6, 0, 'Tina', '081615199953', 'saudara', '2018-08-21 05:55:38', '2018-08-20 22:57:14', 3),
(4, 'Albert', '1138403396779310', 'Medan', '1979-09-15', 'Jl. Apel', 'Medan', '20212', '081808483554', '', 38, 'pria', 'buddha', 'sarjana', 'menikah', 0, 82, 70, 'baik', 8, 0, 'Sukma', '081198417416', 'teman', '2018-08-21 05:55:38', '2018-08-20 22:57:41', 4),
(5, 'Robert', '1790600961002990', 'Medan', '1998-02-22', 'Jl. Duku', 'Medan', '20547', '081859770983', NULL, 20, 'pria', 'buddha', 'sma', 'lajang', 3, 99, 99, 'sangat baik', 7, 0, 'Dedi', '081477497315', 'teman', '2018-08-21 05:55:38', '2018-08-20 22:57:19', 5),
(6, 'Citra', '1968963583330040', 'Pematang Siantar', '1972-12-12', 'Jl. Durian', 'Pematang Siantar', '21223', '081321888830', NULL, 46, 'wanita', 'buddha', 'pasca', 'menikah', 3, 72, 83, 'baik', 8, 0, 'Bambang', '081341514919', 'teman', '2018-08-21 05:55:38', '2018-08-20 23:20:38', 6),
(7, 'Sylvia', '1672436465406930', 'Binjai', '1976-09-07', 'Jl. Anggur', 'Binjai', '21220', '081640722353', NULL, 42, 'wanita', 'buddha', 'pasca', 'lajang', 2, 87, 90, 'cukup baik', 9, 0, 'Lia', '081112925903', 'saudara', '2018-08-21 05:55:38', '2018-08-20 23:18:43', 7),
(8, 'Kirana', '1298460436977970', 'Binjai', '1988-08-08', 'Jl. Belimbing', 'Binjai', '25067', '081778879167', NULL, 30, 'wanita', 'buddha', 'sarjana', 'menikah', 1, 72, 92, 'sangat baik', 7, 0, 'Siska', '081359910530', 'teman', '2018-08-21 05:55:38', '2018-08-20 22:57:31', 8),
(9, 'Adrian', '1571613198192640', 'Medan', '1997-07-12', 'Jl. Salak', 'Medan', '20123', '081359004719', NULL, 21, 'pria', 'buddha', 'sma', 'lajang', 3, 76, 86, 'baik', 5, 0, 'Yonathan', '081350042508', 'teman', '2018-08-21 05:55:38', '2018-08-20 22:57:34', 9),
(10, 'Vivi', '1357478848341000', 'Tanjung Balai', '1978-03-18', 'Jl. Pisang', 'Tanjung Balai', '20394', '081879248066', NULL, 40, 'wanita', 'buddha', 'sarjana', 'menikah', 3, 94, 93, 'baik', 5, 0, 'Marco', '081946962008', 'teman', '2018-08-21 05:55:38', '2018-08-20 23:24:15', 10),
(11, 'Edward Surya Jaya', '1547878888888888', 'Serbalawan', '1997-02-02', 'Jl. Damar III', 'Medan', '20145', '085275522020', '', 21, 'pria', 'buddha', 'sma', 'lajang', 4, 80, 80, 'cukup baik', 5, 0, 'Ryan Rajaya', '0614557896', 'saudara', '2018-08-23 19:52:21', '2018-08-23 13:09:37', 11);

-- --------------------------------------------------------

--
-- Table structure for table `users_exam`
--

CREATE TABLE `users_exam` (
  `id` int(6) NOT NULL,
  `start_online` datetime NOT NULL,
  `end_online` datetime NOT NULL,
  `start_f2f` datetime DEFAULT NULL,
  `end_f2f` datetime DEFAULT NULL,
  `id_user` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_exam`
--

INSERT INTO `users_exam` (`id`, `start_online`, `end_online`, `start_f2f`, `end_f2f`, `id_user`) VALUES
(1, '2018-08-23 19:55:16', '2018-08-23 21:55:16', '2018-08-23 19:56:15', '2018-08-23 21:56:15', 11);

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
-- Indexes for table `akurasi_c45_rule`
--
ALTER TABLE `akurasi_c45_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `akurasi_cart_rule`
--
ALTER TABLE `akurasi_cart_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `akurasi_data`
--
ALTER TABLE `akurasi_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `atribut_detail`
--
ALTER TABLE `atribut_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `c45_rule`
--
ALTER TABLE `c45_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_rule`
--
ALTER TABLE `cart_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dataset`
--
ALTER TABLE `dataset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dataset_hitung`
--
ALTER TABLE `dataset_hitung`
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
-- Indexes for table `standard_qualification`
--
ALTER TABLE `standard_qualification`
  ADD PRIMARY KEY (`id_std`);

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
  MODIFY `id_ability` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id_admin` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `admins_sesi`
--
ALTER TABLE `admins_sesi`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `akurasi_c45_rule`
--
ALTER TABLE `akurasi_c45_rule`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `akurasi_cart_rule`
--
ALTER TABLE `akurasi_cart_rule`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `akurasi_data`
--
ALTER TABLE `akurasi_data`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `atribut_detail`
--
ALTER TABLE `atribut_detail`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `c45_rule`
--
ALTER TABLE `c45_rule`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT for table `cart_rule`
--
ALTER TABLE `cart_rule`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `dataset`
--
ALTER TABLE `dataset`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `dataset_hitung`
--
ALTER TABLE `dataset_hitung`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id_job` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `question_f2f`
--
ALTER TABLE `question_f2f`
  MODIFY `id_question` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `question_online`
--
ALTER TABLE `question_online`
  MODIFY `id_question` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `required_ability`
--
ALTER TABLE `required_ability`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `selection_stage`
--
ALTER TABLE `selection_stage`
  MODIFY `id_stage` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `selection_stage_detail`
--
ALTER TABLE `selection_stage_detail`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `standard_qualification`
--
ALTER TABLE `standard_qualification`
  MODIFY `id_std` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users_ability`
--
ALTER TABLE `users_ability`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users_detail`
--
ALTER TABLE `users_detail`
  MODIFY `id_d_user` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users_exam`
--
ALTER TABLE `users_exam`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
