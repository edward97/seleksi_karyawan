-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2018 at 05:09 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

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
(6, 'ccdnkz', 'ccdnkz@mail.com', '856e22b06868660656e0e6fff975a8d9', 'IT - Support', 1, '2018-06-23 13:14:04', '2018-08-17 08:10:09'),
(7, 'Edward', 'esj@mail.com', '5f0713b7c76ee9285a14984eeb332f43', 'IT - Maintenance', 1, '2018-06-27 16:26:07', '2018-08-17 04:45:00'),
(13, 'Admin', 'admin@mail.com', '21232f297a57a5a743894a0e4a801fc3', 'IT - UI IX', 1, '2018-06-30 21:03:01', '2018-08-17 08:15:03'),
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
(1, 'age', 'age', '=\"> 35\"', '!=\"> 35\"', NULL, NULL, 'root', '', '', ''),
(2, 'experience', '=\"> 35\"', '> 2 tahun', NULL, 'gagal', 1, 'stop', '', '', ''),
(3, 'experience', '=\"> 35\"', NULL, '!=\"> 2 tahun\"', NULL, 1, 'stop', 'age~experience~', '', '=\"> 35\"~!=\"> 2 tahun\"~'),
(4, 'last_education', '!=\"> 35\"', '=\"sma\"', '!=\"sma\"', NULL, 1, 'stop', 'age~last_education~', '!=\"> 35\"~=\"sma\"~', '!=\"> 35\"~!=\"sma\"~'),
(5, 'last_education', '!=\"> 2 tahun\"', 'sma', NULL, 'gagal', 3, 'stop', '', '', ''),
(6, 'last_education', '!=\"> 2 tahun\"', NULL, '!=\"sma\"', NULL, 3, 'next', 'age~experience~~last_education~', '', '=\"> 35\"~!=\"> 2 tahun\"~~!=\"sma\"~'),
(7, 'total_ability', '=\"sma\"', '5-7', NULL, 'gagal', 4, 'stop', '', '', ''),
(8, 'total_ability', '=\"sma\"', NULL, '!=\"5-7\"', NULL, 4, 'next', 'age~last_education~~total_ability~', '', '!=\"> 35\"~=\"sma\"~~!=\"5-7\"~'),
(9, 'experience', '!=\"sma\"', '=\"0 tahun\"', '!=\"0 tahun\"', NULL, 4, 'next', 'age~last_education~~experience~', '!=\"> 35\"~!=\"sma\"~~=\"0 tahun\"~', '!=\"> 35\"~!=\"sma\"~~!=\"0 tahun\"~');

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
(11, 'Veronika', '> 35', '0 tahun', 'sma', 'lajang', '8-10', '70-79', '90-100', 'sangat baik', 1, 'gagal'),
(12, 'Lincoln', '> 35', '> 2 tahun', 'pasca', 'menikah', '5-7', '90-100', '70-79', 'baik', 1, 'gagal'),
(13, 'Erich', '25-35', '0 tahun', 'akademi', 'lajang', '8-10', '70-79', '70-79', 'baik', 1, 'lulus'),
(14, 'Rickey', '< 25', '0 tahun', 'sarjana', 'menikah', '5-7', '90-100', '70-79', 'sangat baik', 1, 'lulus'),
(15, 'Dewey', '25-35', '> 2 tahun', 'pasca', 'lajang', '8-10', '70-79', '80-89', 'sangat baik', 1, 'gagal'),
(16, 'Beatris', '25-35', '1-2 tahun', 'sma', 'lajang', '5-7', '90-100', '90-100', 'sangat baik', 1, 'gagal'),
(17, 'Elroy', '< 25', '0 tahun', 'pasca', 'lajang', '8-10', '70-79', '90-100', 'cukup baik', 1, 'lulus'),
(18, 'Newton', '25-35', '1-2 tahun', 'pasca', 'menikah', '8-10', '80-89', '70-79', 'cukup baik', 1, 'lulus'),
(19, 'Talisha', '> 35', '0 tahun', 'sarjana', 'lajang', '5-7', '90-100', '80-89', 'cukup baik', 1, 'gagal'),
(20, 'Keesha', '< 25', '> 2 tahun', 'pasca', 'lajang', '8-10', '80-89', '70-79', 'cukup baik', 1, 'lulus'),
(21, 'Claude', '25-35', '0 tahun', 'sma', 'menikah', '8-10', '70-79', '70-79', 'cukup baik', 1, 'gagal'),
(22, 'Tad', '25-35', '> 2 tahun', 'akademi', 'lajang', '8-10', '70-79', '90-100', 'cukup baik', 1, 'lulus'),
(23, 'Nathan', '25-35', '> 2 tahun', 'sarjana', 'menikah', '5-7', '70-79', '90-100', 'baik', 1, 'lulus'),
(24, 'Karissa', '> 35', '> 2 tahun', 'pasca', 'menikah', '8-10', '90-100', '80-89', 'cukup baik', 1, 'gagal'),
(25, 'Jeanetta', '25-35', '> 2 tahun', 'sarjana', 'lajang', '8-10', '70-79', '70-79', 'cukup baik', 1, 'gagal'),
(26, 'Felisha', '25-35', '> 2 tahun', 'sma', 'lajang', '5-7', '80-89', '90-100', 'baik', 1, 'gagal'),
(27, 'Colleen', '> 35', '> 2 tahun', 'sarjana', 'menikah', '5-7', '80-89', '70-79', 'sangat baik', 1, 'gagal'),
(28, 'Elijah', '25-35', '0 tahun', 'sarjana', 'lajang', '8-10', '80-89', '80-89', 'baik', 1, 'lulus'),
(29, 'Natalya', '> 35', '> 2 tahun', 'pasca', 'menikah', '5-7', '90-100', '90-100', 'sangat baik', 1, 'gagal'),
(30, 'Darla', '> 35', '1-2 tahun', 'akademi', 'lajang', '8-10', '70-79', '80-89', 'sangat baik', 1, 'lulus'),
(31, 'Patrick', '> 35', '0 tahun', 'sma', 'lajang', '5-7', '70-79', '70-79', 'cukup baik', 1, 'gagal'),
(32, 'Thresa', '25-35', '> 2 tahun', 'akademi', 'lajang', '8-10', '80-89', '80-89', 'cukup baik', 1, 'lulus'),
(33, 'Eufemia', '> 35', '0 tahun', 'sarjana', 'lajang', '5-7', '70-79', '90-100', 'baik', 1, 'lulus'),
(34, 'Melania', '25-35', '> 2 tahun', 'akademi', 'menikah', '8-10', '90-100', '70-79', 'sangat baik', 1, 'gagal'),
(35, 'Jacqueline', '< 25', '> 2 tahun', 'sarjana', 'menikah', '8-10', '80-89', '90-100', 'sangat baik', 1, 'gagal'),
(36, 'Catrice', '25-35', '1-2 tahun', 'sma', 'menikah', '5-7', '90-100', '70-79', 'sangat baik', 1, 'gagal'),
(37, 'Star', '< 25', '> 2 tahun', 'akademi', 'menikah', '8-10', '70-79', '90-100', 'sangat baik', 1, 'gagal'),
(38, 'Samella', '> 35', '1-2 tahun', 'akademi', 'lajang', '8-10', '90-100', '90-100', 'baik', 1, 'gagal'),
(39, 'Elinor', '25-35', '1-2 tahun', 'sma', 'lajang', '5-7', '70-79', '90-100', 'cukup baik', 1, 'gagal'),
(40, 'Sandee', '< 25', '0 tahun', 'pasca', 'menikah', '8-10', '80-89', '90-100', 'sangat baik', 1, 'lulus'),
(41, 'Maryjane', '< 25', '1-2 tahun', 'sma', 'lajang', '8-10', '90-100', '90-100', 'sangat baik', 1, 'lulus'),
(42, 'Rebeca', '25-35', '1-2 tahun', 'sarjana', 'lajang', '8-10', '80-89', '70-79', 'baik', 1, 'gagal'),
(43, 'Franklin', '> 35', '1-2 tahun', 'sma', 'lajang', '8-10', '70-79', '80-89', 'cukup baik', 1, 'gagal'),
(44, 'Masako', '25-35', '> 2 tahun', 'pasca', 'lajang', '5-7', '70-79', '70-79', 'baik', 1, 'lulus'),
(45, 'Albertha', '25-35', '> 2 tahun', 'sma', 'lajang', '8-10', '80-89', '80-89', 'cukup baik', 1, 'lulus');

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
(1, '< 25', 1, 'age'),
(2, '25-35', 1, 'age'),
(3, '> 35', 1, 'age'),
(4, '0 tahun', 1, 'experience'),
(5, '1-2 tahun', 1, 'experience'),
(6, '> 2 tahun', 1, 'experience'),
(7, 'sma', 1, 'last_education'),
(8, 'akademi', 1, 'last_education'),
(9, 'sarjana', 1, 'last_education'),
(10, 'pasca', 1, 'last_education'),
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
(1, 'age', 'age', NULL, NULL, 'age~', '', '#ROOT'),
(2, 'age', '< 25', 1, NULL, 'age~', '=\"< 25\"~', 'stop_child'),
(3, 'age', '25-35', 1, NULL, 'age~', '=\"25-35\"~', 'stop_child'),
(4, 'age', '> 35', 1, NULL, 'age~', '=\"> 35\"~', 'stop_child'),
(5, 'nilai_sikap', 'nilai_sikap', 2, NULL, 'age~nilai_sikap~', '', '#ROOT'),
(6, 'nilai_sikap', 'cukup baik', 5, 'lulus', 'age~nilai_sikap~', '=\"< 25\"~=\"cukup baik\"~', 'lulus'),
(7, 'nilai_sikap', 'baik', 5, 'gagal', 'age~nilai_sikap~', '=\"< 25\"~=\"baik\"~', 'gagal'),
(8, 'nilai_sikap', 'sangat baik', 5, NULL, 'age~nilai_sikap~', '=\"< 25\"~=\"sangat baik\"~', 'stop_child'),
(9, 'experience', 'experience', 3, NULL, 'age~experience~', '', '#ROOT'),
(10, 'experience', '0 tahun', 9, NULL, 'age~experience~', '=\"25-35\"~=\"0 tahun\"~', 'stop_child'),
(11, 'experience', '1-2 tahun', 9, NULL, 'age~experience~', '=\"25-35\"~=\"1-2 tahun\"~', 'stop_child'),
(12, 'experience', '> 2 tahun', 9, NULL, 'age~experience~', '=\"25-35\"~=\"> 2 tahun\"~', 'stop_child'),
(13, 'last_education', 'last_education', 4, NULL, 'age~last_education~', '', '#ROOT'),
(14, 'last_education', 'sma', 13, 'gagal', 'age~last_education~', '=\"> 35\"~=\"sma\"~', 'gagal'),
(15, 'last_education', 'akademi', 13, NULL, 'age~last_education~', '=\"> 35\"~=\"akademi\"~', 'stop_child'),
(16, 'last_education', 'sarjana', 13, NULL, 'age~last_education~', '=\"> 35\"~=\"sarjana\"~', 'stop_child'),
(17, 'last_education', 'pasca', 13, 'gagal', 'age~last_education~', '=\"> 35\"~=\"pasca\"~', 'gagal'),
(18, 'experience', 'experience', 8, NULL, 'age~nilai_sikap~experience~', '', '#ROOT'),
(19, 'experience', '0 tahun', 18, 'lulus', 'age~nilai_sikap~experience~', '=\"< 25\"~=\"sangat baik\"~=\"0 tahun\"~', 'lulus'),
(20, 'experience', '1-2 tahun', 18, 'lulus', 'age~nilai_sikap~experience~', '=\"< 25\"~=\"sangat baik\"~=\"1-2 tahun\"~', 'lulus'),
(21, 'experience', '> 2 tahun', 18, 'gagal', 'age~nilai_sikap~experience~', '=\"< 25\"~=\"sangat baik\"~=\"> 2 tahun\"~', 'gagal'),
(22, 'status', 'status', 10, NULL, 'age~experience~status~', '', '#ROOT'),
(23, 'status', 'lajang', 22, NULL, 'age~experience~status~', '=\"25-35\"~=\"0 tahun\"~=\"lajang\"~', 'stop_child'),
(24, 'status', 'menikah', 22, 'gagal', 'age~experience~status~', '=\"25-35\"~=\"0 tahun\"~=\"menikah\"~', 'gagal'),
(25, 'total_ability', 'total_ability', 11, NULL, 'age~experience~total_ability~', '', '#ROOT'),
(26, 'total_ability', '5-7', 25, 'gagal', 'age~experience~total_ability~', '=\"25-35\"~=\"1-2 tahun\"~=\"5-7\"~', 'gagal'),
(27, 'total_ability', '8-10', 25, NULL, 'age~experience~total_ability~', '=\"25-35\"~=\"1-2 tahun\"~=\"8-10\"~', 'stop_child'),
(28, 'nilai_sikap', 'nilai_sikap', 12, NULL, 'age~experience~nilai_sikap~', '', '#ROOT'),
(29, 'nilai_sikap', 'cukup baik', 28, NULL, 'age~experience~nilai_sikap~', '=\"25-35\"~=\"> 2 tahun\"~=\"cukup baik\"~', 'stop_child'),
(30, 'nilai_sikap', 'baik', 28, NULL, 'age~experience~nilai_sikap~', '=\"25-35\"~=\"> 2 tahun\"~=\"baik\"~', 'stop_child'),
(31, 'nilai_sikap', 'sangat baik', 28, NULL, 'age~experience~nilai_sikap~', '=\"25-35\"~=\"> 2 tahun\"~=\"sangat baik\"~', 'stop_child'),
(32, 'nilai_f2f', 'nilai_f2f', 15, NULL, 'age~last_education~nilai_f2f~', '', '#ROOT'),
(33, 'nilai_f2f', '70-79', 32, '#SKIP', 'age~last_education~nilai_f2f~', '=\"> 35\"~=\"akademi\"~=\"70-79\"~', '#SKIP'),
(34, 'nilai_f2f', '80-89', 32, 'lulus', 'age~last_education~nilai_f2f~', '=\"> 35\"~=\"akademi\"~=\"80-89\"~', 'lulus'),
(35, 'nilai_f2f', '90-100', 32, 'gagal', 'age~last_education~nilai_f2f~', '=\"> 35\"~=\"akademi\"~=\"90-100\"~', 'gagal'),
(36, 'nilai_f2f', 'nilai_f2f', 16, NULL, 'age~last_education~nilai_f2f~', '', '#ROOT'),
(37, 'nilai_f2f', '70-79', 36, 'gagal', 'age~last_education~nilai_f2f~', '=\"> 35\"~=\"sarjana\"~=\"70-79\"~', 'gagal'),
(38, 'nilai_f2f', '80-89', 36, 'gagal', 'age~last_education~nilai_f2f~', '=\"> 35\"~=\"sarjana\"~=\"80-89\"~', 'gagal'),
(39, 'nilai_f2f', '90-100', 36, 'lulus', 'age~last_education~nilai_f2f~', '=\"> 35\"~=\"sarjana\"~=\"90-100\"~', 'lulus'),
(40, 'last_education', 'last_education', 23, NULL, 'age~experience~status~last_education~', '', '#ROOT'),
(41, 'last_education', 'sma', 40, 'gagal', 'age~experience~status~last_education~', '=\"25-35\"~=\"0 tahun\"~=\"lajang\"~=\"sma\"~', 'gagal'),
(42, 'last_education', 'akademi', 40, 'lulus', 'age~experience~status~last_education~', '=\"25-35\"~=\"0 tahun\"~=\"lajang\"~=\"akademi\"~', 'lulus'),
(43, 'last_education', 'sarjana', 40, 'lulus', 'age~experience~status~last_education~', '=\"25-35\"~=\"0 tahun\"~=\"lajang\"~=\"sarjana\"~', 'lulus'),
(44, 'last_education', 'pasca', 40, 'lulus', 'age~experience~status~last_education~', '=\"25-35\"~=\"0 tahun\"~=\"lajang\"~=\"pasca\"~', 'lulus'),
(45, 'last_education', 'last_education', 27, NULL, 'age~experience~total_ability~last_education~', '', '#ROOT'),
(46, 'last_education', 'sma', 45, '#SKIP', 'age~experience~total_ability~last_education~', '=\"25-35\"~=\"1-2 tahun\"~=\"8-10\"~=\"sma\"~', '#SKIP'),
(47, 'last_education', 'akademi', 45, '#SKIP', 'age~experience~total_ability~last_education~', '=\"25-35\"~=\"1-2 tahun\"~=\"8-10\"~=\"akademi\"~', '#SKIP'),
(48, 'last_education', 'sarjana', 45, 'gagal', 'age~experience~total_ability~last_education~', '=\"25-35\"~=\"1-2 tahun\"~=\"8-10\"~=\"sarjana\"~', 'gagal'),
(49, 'last_education', 'pasca', 45, 'lulus', 'age~experience~total_ability~last_education~', '=\"25-35\"~=\"1-2 tahun\"~=\"8-10\"~=\"pasca\"~', 'lulus'),
(50, 'last_education', 'last_education', 29, NULL, 'age~experience~nilai_sikap~last_education~', '', '#ROOT'),
(51, 'last_education', 'sma', 50, 'lulus', 'age~experience~nilai_sikap~last_education~', '=\"25-35\"~=\"> 2 tahun\"~=\"cukup baik\"~=\"sma\"~', 'lulus'),
(52, 'last_education', 'akademi', 50, 'lulus', 'age~experience~nilai_sikap~last_education~', '=\"25-35\"~=\"> 2 tahun\"~=\"cukup baik\"~=\"akademi\"~', 'lulus'),
(53, 'last_education', 'sarjana', 50, 'gagal', 'age~experience~nilai_sikap~last_education~', '=\"25-35\"~=\"> 2 tahun\"~=\"cukup baik\"~=\"sarjana\"~', 'gagal'),
(54, 'last_education', 'pasca', 50, '#SKIP', 'age~experience~nilai_sikap~last_education~', '=\"25-35\"~=\"> 2 tahun\"~=\"cukup baik\"~=\"pasca\"~', '#SKIP'),
(55, 'nilai_online', 'nilai_online', 30, NULL, 'age~experience~nilai_sikap~nilai_online~', '', '#ROOT'),
(56, 'nilai_online', '70-79', 55, 'lulus', 'age~experience~nilai_sikap~nilai_online~', '=\"25-35\"~=\"> 2 tahun\"~=\"baik\"~=\"70-79\"~', 'lulus'),
(57, 'nilai_online', '80-89', 55, 'gagal', 'age~experience~nilai_sikap~nilai_online~', '=\"25-35\"~=\"> 2 tahun\"~=\"baik\"~=\"80-89\"~', 'gagal'),
(58, 'nilai_online', '90-100', 55, '#SKIP', 'age~experience~nilai_sikap~nilai_online~', '=\"25-35\"~=\"> 2 tahun\"~=\"baik\"~=\"90-100\"~', '#SKIP'),
(59, 'last_education', 'last_education', 31, NULL, 'age~experience~nilai_sikap~last_education~', '', '#ROOT'),
(60, 'last_education', 'sma', 59, '#SKIP', 'age~experience~nilai_sikap~last_education~', '=\"25-35\"~=\"> 2 tahun\"~=\"sangat baik\"~=\"sma\"~', '#SKIP'),
(61, 'last_education', 'akademi', 59, 'gagal', 'age~experience~nilai_sikap~last_education~', '=\"25-35\"~=\"> 2 tahun\"~=\"sangat baik\"~=\"akademi\"~', 'gagal'),
(62, 'last_education', 'sarjana', 59, 'lulus', 'age~experience~nilai_sikap~last_education~', '=\"25-35\"~=\"> 2 tahun\"~=\"sangat baik\"~=\"sarjana\"~', 'lulus'),
(63, 'last_education', 'pasca', 59, 'gagal', 'age~experience~nilai_sikap~last_education~', '=\"25-35\"~=\"> 2 tahun\"~=\"sangat baik\"~=\"pasca\"~', 'gagal');

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
(1, 'age', 'age', '=\"> 35\"', '!=\"> 35\"', NULL, NULL, 'root', '', '', ''),
(2, 'experience', '=\"> 35\"', '=\"1-2 tahun\"', '!=\"1-2 tahun\"', NULL, 1, 'stop', 'age~experience~', '=\"> 35\"~=\"1-2 tahun\"~', '=\"> 35\"~!=\"1-2 tahun\"~'),
(3, 'nilai_sikap', '!=\"> 35\"', '=\"cukup baik\"', '!=\"cukup baik\"', NULL, 1, 'stop', 'age~nilai_sikap~', '!=\"> 35\"~=\"cukup baik\"~', '!=\"> 35\"~!=\"cukup baik\"~'),
(4, 'last_education', '=\"1-2 tahun\"', 'sma', NULL, 'gagal', 2, 'stop', '', '', ''),
(5, 'last_education', '=\"1-2 tahun\"', NULL, '!=\"sma\"', NULL, 2, 'stop', 'age~experience~~last_education~', '', '=\"> 35\"~=\"1-2 tahun\"~~!=\"sma\"~'),
(6, 'last_education', '!=\"1-2 tahun\"', '=\"sarjana\"', NULL, NULL, 2, 'stop', 'age~experience~~last_education~', '=\"> 35\"~!=\"1-2 tahun\"~~=\"sarjana\"~', ''),
(7, 'last_education', '!=\"1-2 tahun\"', NULL, 'sarjana', 'gagal', 2, 'stop', '', '', ''),
(8, 'nilai_online', '=\"cukup baik\"', '=\"70-79\"', NULL, NULL, 3, '#SKIP', 'age~nilai_sikap~~nilai_online~', '!=\"> 35\"~=\"cukup baik\"~~=\"70-79\"~', ''),
(9, 'nilai_online', '=\"cukup baik\"', NULL, '70-79', 'lulus', 3, 'stop', '', '', ''),
(10, 'experience', '!=\"cukup baik\"', '=\"0 tahun\"', '!=\"0 tahun\"', NULL, 3, 'stop', 'age~nilai_sikap~~experience~', '!=\"> 35\"~!=\"cukup baik\"~~=\"0 tahun\"~', '!=\"> 35\"~!=\"cukup baik\"~~!=\"0 tahun\"~'),
(11, 'nilai_sikap', '!=\"sma\"', 'baik', NULL, 'gagal', 5, 'stop', '', '', ''),
(12, 'nilai_sikap', '!=\"sma\"', NULL, 'baik', 'lulus', 5, 'stop', '', '', ''),
(13, 'nilai_online', '=\"sarjana\"', '70-79', NULL, 'gagal', 6, 'stop', '', '', ''),
(14, 'nilai_online', '=\"sarjana\"', NULL, '70-79', 'gagal', 6, 'stop', '', '', ''),
(15, 'nilai_online', '=\"0 tahun\"', '=\"70-79\"', NULL, NULL, 10, 'stop', 'age~nilai_sikap~~experience~~nilai_online~', '!=\"> 35\"~!=\"cukup baik\"~~=\"0 tahun\"~~=\"70-79\"~', ''),
(16, 'nilai_online', '=\"0 tahun\"', NULL, '70-79', 'lulus', 10, 'stop', '', '', ''),
(17, 'last_education', '!=\"0 tahun\"', '=\"sarjana\"', '!=\"sarjana\"', NULL, 10, 'stop', 'age~nilai_sikap~~experience~~last_education~', '!=\"> 35\"~!=\"cukup baik\"~~!=\"0 tahun\"~~=\"sarjana\"~', '!=\"> 35\"~!=\"cukup baik\"~~!=\"0 tahun\"~~!=\"sarjana\"~'),
(18, 'last_education', '=\"70-79\"', 'akademi', NULL, 'lulus', 15, 'stop', '', '', ''),
(19, 'last_education', '=\"70-79\"', NULL, 'akademi', 'gagal', 15, 'stop', '', '', ''),
(20, 'age', '=\"sarjana\"', '< 25', NULL, 'gagal', 17, 'stop', '', '', ''),
(21, 'age', '=\"sarjana\"', NULL, '!=\"< 25\"', NULL, 17, 'stop', 'age~nilai_sikap~~experience~~last_education~~age~', '', '!=\"> 35\"~!=\"cukup baik\"~~!=\"0 tahun\"~~=\"sarjana\"~~!=\"< 25\"~'),
(22, 'status', '!=\"sarjana\"', '=\"lajang\"', NULL, NULL, 17, 'stop', 'age~nilai_sikap~~experience~~last_education~~status~', '!=\"> 35\"~!=\"cukup baik\"~~!=\"0 tahun\"~~!=\"sarjana\"~~=\"lajang\"~', ''),
(23, 'status', '!=\"sarjana\"', NULL, 'lajang', 'gagal', 17, 'stop', '', '', ''),
(24, 'experience', '!=\"< 25\"', '1-2 tahun', NULL, 'gagal', 21, 'stop', '', '', ''),
(25, 'experience', '!=\"< 25\"', NULL, '1-2 tahun', 'lulus', 21, 'stop', '', '', ''),
(26, 'age', '=\"lajang\"', '< 25', NULL, 'lulus', 22, 'stop', '', '', ''),
(27, 'age', '=\"lajang\"', NULL, '!=\"< 25\"', NULL, 22, 'stop', 'age~nilai_sikap~~experience~~last_education~~status~~age~', '', '!=\"> 35\"~!=\"cukup baik\"~~!=\"0 tahun\"~~!=\"sarjana\"~~=\"lajang\"~~!=\"< 25\"~'),
(28, 'nilai_f2f', '!=\"< 25\"', '70-79', NULL, 'lulus', 27, 'stop', '', '', ''),
(29, 'nilai_f2f', '!=\"< 25\"', NULL, '70-79', 'gagal', 27, 'stop', '', '', '');

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
(1, 'Vernia', 24, 0, 'pasca', 'lajang', 9, 71, 77, 'baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(2, 'Layne', 21, 2, 'pasca', 'menikah', 8, 98, 95, 'baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(3, 'Neomi', 32, 0, 'akademi', 'lajang', 7, 74, 100, 'cukup baik', 'lulus', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(4, 'Hannah', 28, 0, 'sma', 'lajang', 6, 77, 74, 'baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(5, 'Alyson', 28, 9, 'akademi', 'menikah', 5, 89, 84, 'sangat baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(6, 'Emeline', 39, 8, 'pasca', 'menikah', 9, 78, 82, 'baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(7, 'Janae', 48, 6, 'sma', 'lajang', 6, 71, 76, 'cukup baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(8, 'Luciana', 45, 2, 'sarjana', 'lajang', 10, 91, 97, 'cukup baik', 'lulus', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(9, 'Tommye', 35, 8, 'sarjana', 'menikah', 9, 88, 80, 'sangat baik', 'lulus', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(10, 'Marshall', 47, 0, 'pasca', 'lajang', 8, 84, 86, 'sangat baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(11, 'Dora', 25, 1, 'pasca', 'menikah', 6, 80, 85, 'baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(12, 'Ellyn', 32, 0, 'pasca', 'lajang', 6, 93, 95, 'cukup baik', 'lulus', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(13, 'Herta', 29, 0, 'sarjana', 'lajang', 5, 84, 78, 'sangat baik', 'lulus', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(14, 'Leonel', 39, 0, 'akademi', 'lajang', 5, 77, 100, 'baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(15, 'Caridad', 20, 9, 'akademi', 'menikah', 6, 96, 77, 'cukup baik', 'lulus', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(16, 'Veronika', 38, 0, 'sma', 'lajang', 8, 77, 97, 'sangat baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(17, 'Lincoln', 43, 10, 'pasca', 'menikah', 6, 98, 72, 'baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(18, 'Erich', 35, 0, 'akademi', 'lajang', 9, 79, 76, 'baik', 'lulus', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(19, 'Rickey', 18, 0, 'sarjana', 'menikah', 7, 100, 76, 'sangat baik', 'lulus', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(20, 'Dewey', 30, 7, 'pasca', 'lajang', 8, 79, 83, 'sangat baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(21, 'Beatris', 29, 1, 'sma', 'lajang', 5, 93, 94, 'sangat baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(22, 'Elroy', 21, 0, 'pasca', 'lajang', 9, 75, 94, 'cukup baik', 'lulus', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(23, 'Newton', 27, 1, 'pasca', 'menikah', 9, 89, 70, 'cukup baik', 'lulus', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(24, 'Talisha', 36, 0, 'sarjana', 'lajang', 7, 93, 87, 'cukup baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(25, 'Keesha', 24, 10, 'pasca', 'lajang', 9, 86, 78, 'cukup baik', 'lulus', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(26, 'Claude', 32, 0, 'sma', 'menikah', 8, 78, 78, 'cukup baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(27, 'Tad', 28, 7, 'akademi', 'lajang', 8, 70, 94, 'cukup baik', 'lulus', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(28, 'Nathan', 32, 5, 'sarjana', 'menikah', 5, 76, 96, 'baik', 'lulus', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(29, 'Karissa', 49, 6, 'pasca', 'menikah', 10, 90, 80, 'cukup baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(30, 'Jeanetta', 28, 5, 'sarjana', 'lajang', 8, 74, 74, 'cukup baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(31, 'Felisha', 33, 7, 'sma', 'lajang', 6, 85, 98, 'baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(32, 'Colleen', 49, 3, 'sarjana', 'menikah', 5, 89, 72, 'sangat baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(33, 'Elijah', 28, 0, 'sarjana', 'lajang', 8, 84, 80, 'baik', 'lulus', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(34, 'Natalya', 47, 5, 'pasca', 'menikah', 7, 95, 97, 'sangat baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(35, 'Darla', 49, 1, 'akademi', 'lajang', 10, 78, 89, 'sangat baik', 'lulus', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(36, 'Patrick', 46, 0, 'sma', 'lajang', 7, 75, 79, 'cukup baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(37, 'Thresa', 27, 4, 'akademi', 'lajang', 9, 80, 80, 'cukup baik', 'lulus', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(38, 'Eufemia', 48, 0, 'sarjana', 'lajang', 5, 76, 95, 'baik', 'lulus', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(39, 'Melania', 25, 3, 'akademi', 'menikah', 9, 93, 74, 'sangat baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(40, 'Jacqueline', 20, 3, 'sarjana', 'menikah', 8, 86, 92, 'sangat baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(41, 'Catrice', 25, 2, 'sma', 'menikah', 5, 95, 72, 'sangat baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(42, 'Star', 20, 3, 'akademi', 'menikah', 8, 79, 91, 'sangat baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(43, 'Samella', 40, 1, 'akademi', 'lajang', 10, 98, 98, 'baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(44, 'Elinor', 32, 2, 'sma', 'lajang', 6, 72, 99, 'cukup baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(45, 'Sandee', 22, 0, 'pasca', 'menikah', 8, 80, 90, 'sangat baik', 'lulus', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(46, 'Maryjane', 24, 1, 'sma', 'lajang', 8, 99, 92, 'sangat baik', 'lulus', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(47, 'Rebeca', 28, 2, 'sarjana', 'lajang', 9, 85, 76, 'baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(48, 'Franklin', 46, 2, 'sma', 'lajang', 8, 76, 89, 'cukup baik', 'gagal', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(49, 'Masako', 29, 7, 'pasca', 'lajang', 6, 74, 77, 'baik', 'lulus', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0),
(50, 'Albertha', 27, 7, 'sma', 'lajang', 9, 85, 81, 'cukup baik', 'lulus', '2018-08-20 22:07:31', '2018-08-20 15:07:31', 0);

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
(50, 'Albertha', '25-35', '> 2 tahun', 'sma', 'lajang', '8-10', '80-89', '80-89', 'cukup baik', 0, 'lulus');

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
(13, '<p>&nbsp;Ayat jurnal tidak dibuat untuK ?</p>', 'Penempatan saham', 'Perolehan kembali saham', 'Pemecahan saham', 'Pengeluaran saham', 'Pemecahan saham', 1, 'Akuntansi I', '2018-07-20 11:19:49', '2018-07-19 21:19:49', 7);

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
(18, '<p>Pendapatan diterima di muka adalah ?</p>', 'Aktiva', 'Modal', 'Pendapatan', 'Kewajiban', 'Kewajiban', 1, 'Akuntansi I', '2018-07-20 10:45:54', '2018-07-20 03:45:54', 7);

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
  `lbl_interview` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `selection_stage`
--

INSERT INTO `selection_stage` (`id_stage`, `label_online`, `label_f2f`, `status_selesai`, `created_at`, `updated_at`, `id_std`, `id_job`, `lbl_register`, `lbl_online`, `lbl_f2f`, `lbl_interview`) VALUES
(1, 'Akuntansi I', 'Akuntansi I', 1, '2018-08-20 21:21:15', '2018-08-20 15:03:15', 1, 7, '1~2~3~4~5~6~7~8', NULL, NULL, NULL);

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
(1, 'Tahap 1', '2018-08-20 21:23:00', '2018-08-20 21:54:31', '2018-08-20 21:21:15', '2018-08-20 14:54:31', 1),
(2, 'Tahap 2', '2018-08-20 21:54:31', '2018-08-20 21:54:34', '2018-08-20 21:21:15', '2018-08-20 14:54:34', 1),
(3, 'Tahap 3', '2018-08-20 21:54:34', '2018-08-20 21:54:36', '2018-08-20 21:21:15', '2018-08-20 14:54:36', 1),
(4, 'Tahap 4', '2018-08-20 21:54:36', '2018-08-20 21:54:45', '2018-08-20 21:21:15', '2018-08-20 14:54:45', 1),
(5, 'Tahap 5', '2018-08-20 21:54:45', '2018-08-20 21:54:45', '2018-08-20 21:21:15', '2018-08-20 14:54:45', 1);

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
(8, 'edw_shen@yahoo.com', '25d55ad283aa400af464c76d713c07ad', 'Jh2dkqBbo6pW3uVT3JeClsxcZSp0jCqBnPI6vlzBMVI9N493EhM3rUAPlrjDuaQEuCE5qGees9oSRU2jXM752eVNsINp2BIm5q0s', 1, '2018-08-20 21:52:38', '2018-08-20 14:56:16', 7, 5);

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
(71, '2018-08-20 21:52:38', '2018-08-20 14:52:38', 2, 8),
(72, '2018-08-20 21:52:38', '2018-08-20 14:52:38', 10, 8),
(73, '2018-08-20 21:52:38', '2018-08-20 14:52:38', 20, 8),
(74, '2018-08-20 21:52:38', '2018-08-20 14:52:38', 21, 8),
(75, '2018-08-20 21:52:38', '2018-08-20 14:52:38', 27, 8),
(76, '2018-08-20 21:52:38', '2018-08-20 14:52:38', 28, 8),
(77, '2018-08-20 21:52:38', '2018-08-20 14:52:38', 29, 8),
(78, '2018-08-20 21:52:38', '2018-08-20 14:52:38', 30, 8),
(79, '2018-08-20 21:52:38', '2018-08-20 14:52:38', 32, 8);

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
(8, 'Edward Surya Jaya', '1111111111111111', 'Medan', '1997-02-02', 'Jl. Medan', 'Medan', '28675', '085275522020', '', 21, 'pria', 'buddha', 'sarjana', 'lajang', 3, 75, 80, 'baik', 5, 0, 'Ryan Rajaya', '085275522020', 'teman', '2018-08-20 21:52:38', '2018-08-20 14:56:16', 8);

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
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `akurasi_cart_rule`
--
ALTER TABLE `akurasi_cart_rule`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `akurasi_data`
--
ALTER TABLE `akurasi_data`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `atribut_detail`
--
ALTER TABLE `atribut_detail`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `c45_rule`
--
ALTER TABLE `c45_rule`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `cart_rule`
--
ALTER TABLE `cart_rule`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `dataset`
--
ALTER TABLE `dataset`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `dataset_hitung`
--
ALTER TABLE `dataset_hitung`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id_job` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `question_f2f`
--
ALTER TABLE `question_f2f`
  MODIFY `id_question` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `question_online`
--
ALTER TABLE `question_online`
  MODIFY `id_question` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `required_ability`
--
ALTER TABLE `required_ability`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `selection_stage`
--
ALTER TABLE `selection_stage`
  MODIFY `id_stage` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `selection_stage_detail`
--
ALTER TABLE `selection_stage_detail`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `standard_qualification`
--
ALTER TABLE `standard_qualification`
  MODIFY `id_std` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users_ability`
--
ALTER TABLE `users_ability`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `users_detail`
--
ALTER TABLE `users_detail`
  MODIFY `id_d_user` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users_exam`
--
ALTER TABLE `users_exam`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
