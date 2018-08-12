-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2018 at 12:05 AM
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
(14, 'Ryan', 'ryan@mail.com', '5f0713b7c76ee9285a14984eeb332f43', 'IT - Tech', 1, '2018-06-30 21:59:08', '2018-08-12 04:34:50'),
(15, 'edw_shen', 'tzusi007@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'IT - Support', 1, '2018-08-13 05:05:05', '2018-08-12 22:05:05');

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
(13, 'Bagian Pengawas', 7, 9, 7),
(14, 'Pengawas', 7, 1, 7),
(15, 'Pengawas', 7, 2, 7);

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
(1, 'nilai_f2f', 'nilai_f2f', NULL, NULL, 'nilai_f2f~', '', '#ROOT'),
(2, 'nilai_f2f', '70-79', 1, NULL, 'nilai_f2f~', '=\"70-79\"~', 'stop_child'),
(3, 'nilai_f2f', '80-89', 1, NULL, 'nilai_f2f~', '=\"80-89\"~', 'stop_child'),
(4, 'nilai_f2f', '90-100', 1, NULL, 'nilai_f2f~', '=\"90-100\"~', 'stop_child'),
(5, 'experience', 'experience', 2, NULL, 'nilai_f2f~experience~', '', '#ROOT'),
(6, 'experience', '0 tahun', 5, NULL, 'nilai_f2f~experience~', '=\"70-79\"~=\"0 tahun\"~', 'stop_child'),
(7, 'experience', '1-2 tahun', 5, NULL, 'nilai_f2f~experience~', '=\"70-79\"~=\"1-2 tahun\"~', 'stop_child'),
(8, 'experience', '> 2 tahun', 5, NULL, 'nilai_f2f~experience~', '=\"70-79\"~=\"> 2 tahun\"~', 'stop_child'),
(9, 'last_education', 'last_education', 3, NULL, 'nilai_f2f~last_education~', '', '#ROOT'),
(10, 'last_education', 'sma', 9, NULL, 'nilai_f2f~last_education~', '=\"80-89\"~=\"sma\"~', 'stop_child'),
(11, 'last_education', 'akademi', 9, NULL, 'nilai_f2f~last_education~', '=\"80-89\"~=\"akademi\"~', 'stop_child'),
(12, 'last_education', 'sarjana', 9, NULL, 'nilai_f2f~last_education~', '=\"80-89\"~=\"sarjana\"~', 'stop_child'),
(13, 'last_education', 'pasca', 9, NULL, 'nilai_f2f~last_education~', '=\"80-89\"~=\"pasca\"~', 'stop_child'),
(14, 'nilai_sikap', 'nilai_sikap', 4, NULL, 'nilai_f2f~nilai_sikap~', '', '#ROOT'),
(15, 'nilai_sikap', 'cukup baik', 14, NULL, 'nilai_f2f~nilai_sikap~', '=\"90-100\"~=\"cukup baik\"~', 'stop_child'),
(16, 'nilai_sikap', 'baik', 14, NULL, 'nilai_f2f~nilai_sikap~', '=\"90-100\"~=\"baik\"~', 'stop_child'),
(17, 'nilai_sikap', 'sangat baik', 14, NULL, 'nilai_f2f~nilai_sikap~', '=\"90-100\"~=\"sangat baik\"~', 'stop_child'),
(18, 'last_education', 'last_education', 6, NULL, 'nilai_f2f~experience~last_education~', '', '#ROOT'),
(19, 'last_education', 'sma', 18, NULL, 'nilai_f2f~experience~last_education~', '=\"70-79\"~=\"0 tahun\"~=\"sma\"~', 'stop_child'),
(20, 'last_education', 'akademi', 18, 'lulus', 'nilai_f2f~experience~last_education~', '=\"70-79\"~=\"0 tahun\"~=\"akademi\"~', 'lulus'),
(21, 'last_education', 'sarjana', 18, NULL, 'nilai_f2f~experience~last_education~', '=\"70-79\"~=\"0 tahun\"~=\"sarjana\"~', 'stop_child'),
(22, 'last_education', 'pasca', 18, NULL, 'nilai_f2f~experience~last_education~', '=\"70-79\"~=\"0 tahun\"~=\"pasca\"~', 'stop_child'),
(23, 'status', 'status', 7, NULL, 'nilai_f2f~experience~status~', '', '#ROOT'),
(24, 'status', 'lajang', 23, 'gagal', 'nilai_f2f~experience~status~', '=\"70-79\"~=\"1-2 tahun\"~=\"lajang\"~', 'gagal'),
(25, 'status', 'menikah', 23, NULL, 'nilai_f2f~experience~status~', '=\"70-79\"~=\"1-2 tahun\"~=\"menikah\"~', 'stop_child'),
(26, 'last_education', 'last_education', 8, NULL, 'nilai_f2f~experience~last_education~', '', '#ROOT'),
(27, 'last_education', 'sma', 26, NULL, 'nilai_f2f~experience~last_education~', '=\"70-79\"~=\"> 2 tahun\"~=\"sma\"~', 'stop_child'),
(28, 'last_education', 'akademi', 26, NULL, 'nilai_f2f~experience~last_education~', '=\"70-79\"~=\"> 2 tahun\"~=\"akademi\"~', 'stop_child'),
(29, 'last_education', 'sarjana', 26, NULL, 'nilai_f2f~experience~last_education~', '=\"70-79\"~=\"> 2 tahun\"~=\"sarjana\"~', 'stop_child'),
(30, 'last_education', 'pasca', 26, NULL, 'nilai_f2f~experience~last_education~', '=\"70-79\"~=\"> 2 tahun\"~=\"pasca\"~', 'stop_child'),
(31, 'age', 'age', 10, NULL, 'nilai_f2f~last_education~age~', '', '#ROOT'),
(32, 'age', '< 25', 31, NULL, 'nilai_f2f~last_education~age~', '=\"80-89\"~=\"sma\"~=\"< 25\"~', 'stop_child'),
(33, 'age', '25-35', 31, NULL, 'nilai_f2f~last_education~age~', '=\"80-89\"~=\"sma\"~=\"25-35\"~', 'stop_child'),
(34, 'age', '> 35', 31, NULL, 'nilai_f2f~last_education~age~', '=\"80-89\"~=\"sma\"~=\"> 35\"~', 'stop_child'),
(35, 'age', 'age', 11, NULL, 'nilai_f2f~last_education~age~', '', '#ROOT'),
(36, 'age', '< 25', 35, 'lulus', 'nilai_f2f~last_education~age~', '=\"80-89\"~=\"akademi\"~=\"< 25\"~', 'lulus'),
(37, 'age', '25-35', 35, NULL, 'nilai_f2f~last_education~age~', '=\"80-89\"~=\"akademi\"~=\"25-35\"~', 'stop_child'),
(38, 'age', '> 35', 35, 'lulus', 'nilai_f2f~last_education~age~', '=\"80-89\"~=\"akademi\"~=\"> 35\"~', 'lulus'),
(39, 'experience', 'experience', 12, NULL, 'nilai_f2f~last_education~experience~', '', '#ROOT'),
(40, 'experience', '0 tahun', 39, NULL, 'nilai_f2f~last_education~experience~', '=\"80-89\"~=\"sarjana\"~=\"0 tahun\"~', 'stop_child'),
(41, 'experience', '1-2 tahun', 39, 'lulus', 'nilai_f2f~last_education~experience~', '=\"80-89\"~=\"sarjana\"~=\"1-2 tahun\"~', 'lulus'),
(42, 'experience', '> 2 tahun', 39, 'lulus', 'nilai_f2f~last_education~experience~', '=\"80-89\"~=\"sarjana\"~=\"> 2 tahun\"~', 'lulus'),
(43, 'age', 'age', 13, NULL, 'nilai_f2f~last_education~age~', '', '#ROOT'),
(44, 'age', '< 25', 43, 'gagal', 'nilai_f2f~last_education~age~', '=\"80-89\"~=\"pasca\"~=\"< 25\"~', 'gagal'),
(45, 'age', '25-35', 43, NULL, 'nilai_f2f~last_education~age~', '=\"80-89\"~=\"pasca\"~=\"25-35\"~', 'stop_child'),
(46, 'age', '> 35', 43, NULL, 'nilai_f2f~last_education~age~', '=\"80-89\"~=\"pasca\"~=\"> 35\"~', 'stop_child'),
(47, 'age', 'age', 15, NULL, 'nilai_f2f~nilai_sikap~age~', '', '#ROOT'),
(48, 'age', '< 25', 47, 'lulus', 'nilai_f2f~nilai_sikap~age~', '=\"90-100\"~=\"cukup baik\"~=\"< 25\"~', 'lulus'),
(49, 'age', '25-35', 47, NULL, 'nilai_f2f~nilai_sikap~age~', '=\"90-100\"~=\"cukup baik\"~=\"25-35\"~', 'stop_child'),
(50, 'age', '> 35', 47, NULL, 'nilai_f2f~nilai_sikap~age~', '=\"90-100\"~=\"cukup baik\"~=\"> 35\"~', 'stop_child'),
(51, 'last_education', 'last_education', 16, NULL, 'nilai_f2f~nilai_sikap~last_education~', '', '#ROOT'),
(52, 'last_education', 'sma', 51, 'gagal', 'nilai_f2f~nilai_sikap~last_education~', '=\"90-100\"~=\"baik\"~=\"sma\"~', 'gagal'),
(53, 'last_education', 'akademi', 51, NULL, 'nilai_f2f~nilai_sikap~last_education~', '=\"90-100\"~=\"baik\"~=\"akademi\"~', 'stop_child'),
(54, 'last_education', 'sarjana', 51, 'lulus', 'nilai_f2f~nilai_sikap~last_education~', '=\"90-100\"~=\"baik\"~=\"sarjana\"~', 'lulus'),
(55, 'last_education', 'pasca', 51, 'gagal', 'nilai_f2f~nilai_sikap~last_education~', '=\"90-100\"~=\"baik\"~=\"pasca\"~', 'gagal'),
(56, 'last_education', 'last_education', 17, NULL, 'nilai_f2f~nilai_sikap~last_education~', '', '#ROOT'),
(57, 'last_education', 'sma', 56, NULL, 'nilai_f2f~nilai_sikap~last_education~', '=\"90-100\"~=\"sangat baik\"~=\"sma\"~', 'stop_child'),
(58, 'last_education', 'akademi', 56, 'gagal', 'nilai_f2f~nilai_sikap~last_education~', '=\"90-100\"~=\"sangat baik\"~=\"akademi\"~', 'gagal'),
(59, 'last_education', 'sarjana', 56, NULL, 'nilai_f2f~nilai_sikap~last_education~', '=\"90-100\"~=\"sangat baik\"~=\"sarjana\"~', 'stop_child'),
(60, 'last_education', 'pasca', 56, NULL, 'nilai_f2f~nilai_sikap~last_education~', '=\"90-100\"~=\"sangat baik\"~=\"pasca\"~', 'stop_child'),
(61, 'age', 'age', 19, NULL, 'nilai_f2f~experience~last_education~age~', '', '#ROOT'),
(62, 'age', '< 25', 61, 'gagal', 'nilai_f2f~experience~last_education~age~', '=\"70-79\"~=\"0 tahun\"~=\"sma\"~=\"< 25\"~', 'gagal'),
(63, 'age', '25-35', 61, NULL, 'nilai_f2f~experience~last_education~age~', '=\"70-79\"~=\"0 tahun\"~=\"sma\"~=\"25-35\"~', 'stop_child'),
(64, 'age', '> 35', 61, 'gagal', 'nilai_f2f~experience~last_education~age~', '=\"70-79\"~=\"0 tahun\"~=\"sma\"~=\"> 35\"~', 'gagal'),
(65, 'nilai_sikap', 'nilai_sikap', 21, NULL, 'nilai_f2f~experience~last_education~nilai_sikap~', '', '#ROOT'),
(66, 'nilai_sikap', 'cukup baik', 65, NULL, 'nilai_f2f~experience~last_education~nilai_sikap~', '=\"70-79\"~=\"0 tahun\"~=\"sarjana\"~=\"cukup baik\"~', 'stop_child'),
(67, 'nilai_sikap', 'baik', 65, 'gagal', 'nilai_f2f~experience~last_education~nilai_sikap~', '=\"70-79\"~=\"0 tahun\"~=\"sarjana\"~=\"baik\"~', 'gagal'),
(68, 'nilai_sikap', 'sangat baik', 65, NULL, 'nilai_f2f~experience~last_education~nilai_sikap~', '=\"70-79\"~=\"0 tahun\"~=\"sarjana\"~=\"sangat baik\"~', 'stop_child'),
(69, 'nilai_online', 'nilai_online', 22, NULL, 'nilai_f2f~experience~last_education~nilai_online~', '', '#ROOT'),
(70, 'nilai_online', '70-79', 69, 'gagal', 'nilai_f2f~experience~last_education~nilai_online~', '=\"70-79\"~=\"0 tahun\"~=\"pasca\"~=\"70-79\"~', 'gagal'),
(71, 'nilai_online', '80-89', 69, 'lulus', 'nilai_f2f~experience~last_education~nilai_online~', '=\"70-79\"~=\"0 tahun\"~=\"pasca\"~=\"80-89\"~', 'lulus'),
(72, 'nilai_online', '90-100', 69, 'gagal', 'nilai_f2f~experience~last_education~nilai_online~', '=\"70-79\"~=\"0 tahun\"~=\"pasca\"~=\"90-100\"~', 'gagal'),
(73, 'last_education', 'last_education', 25, NULL, 'nilai_f2f~experience~status~last_education~', '', '#ROOT'),
(74, 'last_education', 'sma', 73, NULL, 'nilai_f2f~experience~status~last_education~', '=\"70-79\"~=\"1-2 tahun\"~=\"menikah\"~=\"sma\"~', 'stop_child'),
(75, 'last_education', 'akademi', 73, '#SKIP', 'nilai_f2f~experience~status~last_education~', '=\"70-79\"~=\"1-2 tahun\"~=\"menikah\"~=\"akademi\"~', '#SKIP'),
(76, 'last_education', 'sarjana', 73, 'gagal', 'nilai_f2f~experience~status~last_education~', '=\"70-79\"~=\"1-2 tahun\"~=\"menikah\"~=\"sarjana\"~', 'gagal'),
(77, 'last_education', 'pasca', 73, NULL, 'nilai_f2f~experience~status~last_education~', '=\"70-79\"~=\"1-2 tahun\"~=\"menikah\"~=\"pasca\"~', 'stop_child'),
(78, 'status', 'status', 27, NULL, 'nilai_f2f~experience~last_education~status~', '', '#ROOT'),
(79, 'status', 'lajang', 78, NULL, 'nilai_f2f~experience~last_education~status~', '=\"70-79\"~=\"> 2 tahun\"~=\"sma\"~=\"lajang\"~', 'stop_child'),
(80, 'status', 'menikah', 78, 'lulus', 'nilai_f2f~experience~last_education~status~', '=\"70-79\"~=\"> 2 tahun\"~=\"sma\"~=\"menikah\"~', 'lulus'),
(81, 'nilai_online', 'nilai_online', 28, NULL, 'nilai_f2f~experience~last_education~nilai_online~', '', '#ROOT'),
(82, 'nilai_online', '70-79', 81, 'gagal', 'nilai_f2f~experience~last_education~nilai_online~', '=\"70-79\"~=\"> 2 tahun\"~=\"akademi\"~=\"70-79\"~', 'gagal'),
(83, 'nilai_online', '80-89', 81, 'gagal', 'nilai_f2f~experience~last_education~nilai_online~', '=\"70-79\"~=\"> 2 tahun\"~=\"akademi\"~=\"80-89\"~', 'gagal'),
(84, 'nilai_online', '90-100', 81, NULL, 'nilai_f2f~experience~last_education~nilai_online~', '=\"70-79\"~=\"> 2 tahun\"~=\"akademi\"~=\"90-100\"~', 'stop_child'),
(85, 'nilai_sikap', 'nilai_sikap', 29, NULL, 'nilai_f2f~experience~last_education~nilai_sikap~', '', '#ROOT'),
(86, 'nilai_sikap', 'cukup baik', 85, 'gagal', 'nilai_f2f~experience~last_education~nilai_sikap~', '=\"70-79\"~=\"> 2 tahun\"~=\"sarjana\"~=\"cukup baik\"~', 'gagal'),
(87, 'nilai_sikap', 'baik', 85, '#SKIP', 'nilai_f2f~experience~last_education~nilai_sikap~', '=\"70-79\"~=\"> 2 tahun\"~=\"sarjana\"~=\"baik\"~', '#SKIP'),
(88, 'nilai_sikap', 'sangat baik', 85, NULL, 'nilai_f2f~experience~last_education~nilai_sikap~', '=\"70-79\"~=\"> 2 tahun\"~=\"sarjana\"~=\"sangat baik\"~', 'stop_child'),
(89, 'age', 'age', 30, NULL, 'nilai_f2f~experience~last_education~age~', '', '#ROOT'),
(90, 'age', '< 25', 89, NULL, 'nilai_f2f~experience~last_education~age~', '=\"70-79\"~=\"> 2 tahun\"~=\"pasca\"~=\"< 25\"~', 'stop_child'),
(91, 'age', '25-35', 89, 'lulus', 'nilai_f2f~experience~last_education~age~', '=\"70-79\"~=\"> 2 tahun\"~=\"pasca\"~=\"25-35\"~', 'lulus'),
(92, 'age', '> 35', 89, 'gagal', 'nilai_f2f~experience~last_education~age~', '=\"70-79\"~=\"> 2 tahun\"~=\"pasca\"~=\"> 35\"~', 'gagal'),
(93, 'nilai_sikap', 'nilai_sikap', 32, NULL, 'nilai_f2f~last_education~age~nilai_sikap~', '', '#ROOT'),
(94, 'nilai_sikap', 'cukup baik', 93, '#SKIP', 'nilai_f2f~last_education~age~nilai_sikap~', '=\"80-89\"~=\"sma\"~=\"< 25\"~=\"cukup baik\"~', '#SKIP'),
(95, 'nilai_sikap', 'baik', 93, 'lulus', 'nilai_f2f~last_education~age~nilai_sikap~', '=\"80-89\"~=\"sma\"~=\"< 25\"~=\"baik\"~', 'lulus'),
(96, 'nilai_sikap', 'sangat baik', 93, 'gagal', 'nilai_f2f~last_education~age~nilai_sikap~', '=\"80-89\"~=\"sma\"~=\"< 25\"~=\"sangat baik\"~', 'gagal'),
(97, 'experience', 'experience', 33, NULL, 'nilai_f2f~last_education~age~experience~', '', '#ROOT'),
(98, 'experience', '0 tahun', 97, 'lulus', 'nilai_f2f~last_education~age~experience~', '=\"80-89\"~=\"sma\"~=\"25-35\"~=\"0 tahun\"~', 'lulus'),
(99, 'experience', '1-2 tahun', 97, '#SKIP', 'nilai_f2f~last_education~age~experience~', '=\"80-89\"~=\"sma\"~=\"25-35\"~=\"1-2 tahun\"~', '#SKIP'),
(100, 'experience', '> 2 tahun', 97, NULL, 'nilai_f2f~last_education~age~experience~', '=\"80-89\"~=\"sma\"~=\"25-35\"~=\"> 2 tahun\"~', 'stop_child'),
(101, 'nilai_sikap', 'nilai_sikap', 34, NULL, 'nilai_f2f~last_education~age~nilai_sikap~', '', '#ROOT'),
(102, 'nilai_sikap', 'cukup baik', 101, NULL, 'nilai_f2f~last_education~age~nilai_sikap~', '=\"80-89\"~=\"sma\"~=\"> 35\"~=\"cukup baik\"~', 'stop_child'),
(103, 'nilai_sikap', 'baik', 101, NULL, 'nilai_f2f~last_education~age~nilai_sikap~', '=\"80-89\"~=\"sma\"~=\"> 35\"~=\"baik\"~', 'stop_child'),
(104, 'nilai_sikap', 'sangat baik', 101, 'lulus', 'nilai_f2f~last_education~age~nilai_sikap~', '=\"80-89\"~=\"sma\"~=\"> 35\"~=\"sangat baik\"~', 'lulus'),
(105, 'nilai_sikap', 'nilai_sikap', 37, NULL, 'nilai_f2f~last_education~age~nilai_sikap~', '', '#ROOT'),
(106, 'nilai_sikap', 'cukup baik', 105, 'lulus', 'nilai_f2f~last_education~age~nilai_sikap~', '=\"80-89\"~=\"akademi\"~=\"25-35\"~=\"cukup baik\"~', 'lulus'),
(107, 'nilai_sikap', 'baik', 105, '#SKIP', 'nilai_f2f~last_education~age~nilai_sikap~', '=\"80-89\"~=\"akademi\"~=\"25-35\"~=\"baik\"~', '#SKIP'),
(108, 'nilai_sikap', 'sangat baik', 105, 'gagal', 'nilai_f2f~last_education~age~nilai_sikap~', '=\"80-89\"~=\"akademi\"~=\"25-35\"~=\"sangat baik\"~', 'gagal'),
(109, 'nilai_sikap', 'nilai_sikap', 40, NULL, 'nilai_f2f~last_education~experience~nilai_sikap~', '', '#ROOT'),
(110, 'nilai_sikap', 'cukup baik', 109, 'gagal', 'nilai_f2f~last_education~experience~nilai_sikap~', '=\"80-89\"~=\"sarjana\"~=\"0 tahun\"~=\"cukup baik\"~', 'gagal'),
(111, 'nilai_sikap', 'baik', 109, 'lulus', 'nilai_f2f~last_education~experience~nilai_sikap~', '=\"80-89\"~=\"sarjana\"~=\"0 tahun\"~=\"baik\"~', 'lulus'),
(112, 'nilai_sikap', 'sangat baik', 109, 'lulus', 'nilai_f2f~last_education~experience~nilai_sikap~', '=\"80-89\"~=\"sarjana\"~=\"0 tahun\"~=\"sangat baik\"~', 'lulus'),
(113, 'nilai_sikap', 'nilai_sikap', 45, NULL, 'nilai_f2f~last_education~age~nilai_sikap~', '', '#ROOT'),
(114, 'nilai_sikap', 'cukup baik', 113, 'lulus', 'nilai_f2f~last_education~age~nilai_sikap~', '=\"80-89\"~=\"pasca\"~=\"25-35\"~=\"cukup baik\"~', 'lulus'),
(115, 'nilai_sikap', 'baik', 113, 'gagal', 'nilai_f2f~last_education~age~nilai_sikap~', '=\"80-89\"~=\"pasca\"~=\"25-35\"~=\"baik\"~', 'gagal'),
(116, 'nilai_sikap', 'sangat baik', 113, NULL, 'nilai_f2f~last_education~age~nilai_sikap~', '=\"80-89\"~=\"pasca\"~=\"25-35\"~=\"sangat baik\"~', 'stop_child'),
(117, 'total_ability', 'total_ability', 46, NULL, 'nilai_f2f~last_education~age~total_ability~', '', '#ROOT'),
(118, 'total_ability', '5-7', 117, NULL, 'nilai_f2f~last_education~age~total_ability~', '=\"80-89\"~=\"pasca\"~=\"> 35\"~=\"5-7\"~', 'stop_child'),
(119, 'total_ability', '8-10', 117, 'gagal', 'nilai_f2f~last_education~age~total_ability~', '=\"80-89\"~=\"pasca\"~=\"> 35\"~=\"8-10\"~', 'gagal'),
(120, 'experience', 'experience', 49, NULL, 'nilai_f2f~nilai_sikap~age~experience~', '', '#ROOT'),
(121, 'experience', '0 tahun', 120, 'lulus', 'nilai_f2f~nilai_sikap~age~experience~', '=\"90-100\"~=\"cukup baik\"~=\"25-35\"~=\"0 tahun\"~', 'lulus'),
(122, 'experience', '1-2 tahun', 120, NULL, 'nilai_f2f~nilai_sikap~age~experience~', '=\"90-100\"~=\"cukup baik\"~=\"25-35\"~=\"1-2 tahun\"~', 'stop_child'),
(123, 'experience', '> 2 tahun', 120, 'lulus', 'nilai_f2f~nilai_sikap~age~experience~', '=\"90-100\"~=\"cukup baik\"~=\"25-35\"~=\"> 2 tahun\"~', 'lulus'),
(124, 'total_ability', 'total_ability', 50, NULL, 'nilai_f2f~nilai_sikap~age~total_ability~', '', '#ROOT'),
(125, 'total_ability', '5-7', 124, 'lulus', 'nilai_f2f~nilai_sikap~age~total_ability~', '=\"90-100\"~=\"cukup baik\"~=\"> 35\"~=\"5-7\"~', 'lulus'),
(126, 'total_ability', '8-10', 124, NULL, 'nilai_f2f~nilai_sikap~age~total_ability~', '=\"90-100\"~=\"cukup baik\"~=\"> 35\"~=\"8-10\"~', 'stop_child'),
(127, 'age', 'age', 53, NULL, 'nilai_f2f~nilai_sikap~last_education~age~', '', '#ROOT'),
(128, 'age', '< 25', 127, 'lulus', 'nilai_f2f~nilai_sikap~last_education~age~', '=\"90-100\"~=\"baik\"~=\"akademi\"~=\"< 25\"~', 'lulus'),
(129, 'age', '25-35', 127, '#SKIP', 'nilai_f2f~nilai_sikap~last_education~age~', '=\"90-100\"~=\"baik\"~=\"akademi\"~=\"25-35\"~', '#SKIP'),
(130, 'age', '> 35', 127, 'gagal', 'nilai_f2f~nilai_sikap~last_education~age~', '=\"90-100\"~=\"baik\"~=\"akademi\"~=\"> 35\"~', 'gagal'),
(131, 'experience', 'experience', 57, NULL, 'nilai_f2f~nilai_sikap~last_education~experience~', '', '#ROOT'),
(132, 'experience', '0 tahun', 131, 'gagal', 'nilai_f2f~nilai_sikap~last_education~experience~', '=\"90-100\"~=\"sangat baik\"~=\"sma\"~=\"0 tahun\"~', 'gagal'),
(133, 'experience', '1-2 tahun', 131, NULL, 'nilai_f2f~nilai_sikap~last_education~experience~', '=\"90-100\"~=\"sangat baik\"~=\"sma\"~=\"1-2 tahun\"~', 'stop_child'),
(134, 'experience', '> 2 tahun', 131, 'lulus', 'nilai_f2f~nilai_sikap~last_education~experience~', '=\"90-100\"~=\"sangat baik\"~=\"sma\"~=\"> 2 tahun\"~', 'lulus'),
(135, 'status', 'status', 59, NULL, 'nilai_f2f~nilai_sikap~last_education~status~', '', '#ROOT'),
(136, 'status', 'lajang', 135, NULL, 'nilai_f2f~nilai_sikap~last_education~status~', '=\"90-100\"~=\"sangat baik\"~=\"sarjana\"~=\"lajang\"~', 'stop_child'),
(137, 'status', 'menikah', 135, 'gagal', 'nilai_f2f~nilai_sikap~last_education~status~', '=\"90-100\"~=\"sangat baik\"~=\"sarjana\"~=\"menikah\"~', 'gagal'),
(138, 'total_ability', 'total_ability', 60, NULL, 'nilai_f2f~nilai_sikap~last_education~total_ability~', '', '#ROOT'),
(139, 'total_ability', '5-7', 138, 'gagal', 'nilai_f2f~nilai_sikap~last_education~total_ability~', '=\"90-100\"~=\"sangat baik\"~=\"pasca\"~=\"5-7\"~', 'gagal'),
(140, 'total_ability', '8-10', 138, 'lulus', 'nilai_f2f~nilai_sikap~last_education~total_ability~', '=\"90-100\"~=\"sangat baik\"~=\"pasca\"~=\"8-10\"~', 'lulus'),
(141, 'status', 'status', 63, NULL, 'nilai_f2f~experience~last_education~age~status~', '', '#ROOT'),
(142, 'status', 'lajang', 141, NULL, 'nilai_f2f~experience~last_education~age~status~', '=\"70-79\"~=\"0 tahun\"~=\"sma\"~=\"25-35\"~=\"lajang\"~', 'stop_child'),
(143, 'status', 'menikah', 141, 'gagal', 'nilai_f2f~experience~last_education~age~status~', '=\"70-79\"~=\"0 tahun\"~=\"sma\"~=\"25-35\"~=\"menikah\"~', 'gagal'),
(144, 'status', 'status', 66, NULL, 'nilai_f2f~experience~last_education~nilai_sikap~status~', '', '#ROOT'),
(145, 'status', 'lajang', 144, 'gagal', 'nilai_f2f~experience~last_education~nilai_sikap~status~', '=\"70-79\"~=\"0 tahun\"~=\"sarjana\"~=\"cukup baik\"~=\"lajang\"~', 'gagal'),
(146, 'status', 'menikah', 144, 'lulus', 'nilai_f2f~experience~last_education~nilai_sikap~status~', '=\"70-79\"~=\"0 tahun\"~=\"sarjana\"~=\"cukup baik\"~=\"menikah\"~', 'lulus'),
(147, 'status', 'status', 68, NULL, 'nilai_f2f~experience~last_education~nilai_sikap~status~', '', '#ROOT'),
(148, 'status', 'lajang', 147, 'lulus', 'nilai_f2f~experience~last_education~nilai_sikap~status~', '=\"70-79\"~=\"0 tahun\"~=\"sarjana\"~=\"sangat baik\"~=\"lajang\"~', 'lulus'),
(149, 'status', 'menikah', 147, NULL, 'nilai_f2f~experience~last_education~nilai_sikap~status~', '=\"70-79\"~=\"0 tahun\"~=\"sarjana\"~=\"sangat baik\"~=\"menikah\"~', 'stop_child'),
(150, 'total_ability', 'total_ability', 74, NULL, 'nilai_f2f~experience~status~last_education~total_ability~', '', '#ROOT'),
(151, 'total_ability', '5-7', 150, NULL, 'nilai_f2f~experience~status~last_education~total_ability~', '=\"70-79\"~=\"1-2 tahun\"~=\"menikah\"~=\"sma\"~=\"5-7\"~', 'stop_child'),
(152, 'total_ability', '8-10', 150, 'gagal', 'nilai_f2f~experience~status~last_education~total_ability~', '=\"70-79\"~=\"1-2 tahun\"~=\"menikah\"~=\"sma\"~=\"8-10\"~', 'gagal'),
(153, 'total_ability', 'total_ability', 77, NULL, 'nilai_f2f~experience~status~last_education~total_ability~', '', '#ROOT'),
(154, 'total_ability', '5-7', 153, 'gagal', 'nilai_f2f~experience~status~last_education~total_ability~', '=\"70-79\"~=\"1-2 tahun\"~=\"menikah\"~=\"pasca\"~=\"5-7\"~', 'gagal'),
(155, 'total_ability', '8-10', 153, NULL, 'nilai_f2f~experience~status~last_education~total_ability~', '=\"70-79\"~=\"1-2 tahun\"~=\"menikah\"~=\"pasca\"~=\"8-10\"~', 'stop_child'),
(156, 'nilai_sikap', 'nilai_sikap', 79, NULL, 'nilai_f2f~experience~last_education~status~nilai_sikap~', '', '#ROOT'),
(157, 'nilai_sikap', 'cukup baik', 156, 'gagal', 'nilai_f2f~experience~last_education~status~nilai_sikap~', '=\"70-79\"~=\"> 2 tahun\"~=\"sma\"~=\"lajang\"~=\"cukup baik\"~', 'gagal'),
(158, 'nilai_sikap', 'baik', 156, '#SKIP', 'nilai_f2f~experience~last_education~status~nilai_sikap~', '=\"70-79\"~=\"> 2 tahun\"~=\"sma\"~=\"lajang\"~=\"baik\"~', '#SKIP'),
(159, 'nilai_sikap', 'sangat baik', 156, 'lulus', 'nilai_f2f~experience~last_education~status~nilai_sikap~', '=\"70-79\"~=\"> 2 tahun\"~=\"sma\"~=\"lajang\"~=\"sangat baik\"~', 'lulus'),
(160, 'age', 'age', 84, NULL, 'nilai_f2f~experience~last_education~nilai_online~age~', '', '#ROOT'),
(161, 'age', '< 25', 160, 'lulus', 'nilai_f2f~experience~last_education~nilai_online~age~', '=\"70-79\"~=\"> 2 tahun\"~=\"akademi\"~=\"90-100\"~=\"< 25\"~', 'lulus'),
(162, 'age', '25-35', 160, 'gagal', 'nilai_f2f~experience~last_education~nilai_online~age~', '=\"70-79\"~=\"> 2 tahun\"~=\"akademi\"~=\"90-100\"~=\"25-35\"~', 'gagal'),
(163, 'age', '> 35', 160, 'lulus', 'nilai_f2f~experience~last_education~nilai_online~age~', '=\"70-79\"~=\"> 2 tahun\"~=\"akademi\"~=\"90-100\"~=\"> 35\"~', 'lulus'),
(164, 'age', 'age', 88, NULL, 'nilai_f2f~experience~last_education~nilai_sikap~age~', '', '#ROOT'),
(165, 'age', '< 25', 164, 'lulus', 'nilai_f2f~experience~last_education~nilai_sikap~age~', '=\"70-79\"~=\"> 2 tahun\"~=\"sarjana\"~=\"sangat baik\"~=\"< 25\"~', 'lulus'),
(166, 'age', '25-35', 164, '#SKIP', 'nilai_f2f~experience~last_education~nilai_sikap~age~', '=\"70-79\"~=\"> 2 tahun\"~=\"sarjana\"~=\"sangat baik\"~=\"25-35\"~', '#SKIP'),
(167, 'age', '> 35', 164, 'gagal', 'nilai_f2f~experience~last_education~nilai_sikap~age~', '=\"70-79\"~=\"> 2 tahun\"~=\"sarjana\"~=\"sangat baik\"~=\"> 35\"~', 'gagal'),
(168, 'total_ability', 'total_ability', 90, NULL, 'nilai_f2f~experience~last_education~age~total_ability~', '', '#ROOT'),
(169, 'total_ability', '5-7', 168, 'gagal', 'nilai_f2f~experience~last_education~age~total_ability~', '=\"70-79\"~=\"> 2 tahun\"~=\"pasca\"~=\"< 25\"~=\"5-7\"~', 'gagal'),
(170, 'total_ability', '8-10', 168, 'lulus', 'nilai_f2f~experience~last_education~age~total_ability~', '=\"70-79\"~=\"> 2 tahun\"~=\"pasca\"~=\"< 25\"~=\"8-10\"~', 'lulus'),
(171, 'nilai_sikap', 'nilai_sikap', 100, NULL, 'nilai_f2f~last_education~age~experience~nilai_sikap~', '', '#ROOT'),
(172, 'nilai_sikap', 'cukup baik', 171, 'lulus', 'nilai_f2f~last_education~age~experience~nilai_sikap~', '=\"80-89\"~=\"sma\"~=\"25-35\"~=\"> 2 tahun\"~=\"cukup baik\"~', 'lulus'),
(173, 'nilai_sikap', 'baik', 171, '#SKIP', 'nilai_f2f~last_education~age~experience~nilai_sikap~', '=\"80-89\"~=\"sma\"~=\"25-35\"~=\"> 2 tahun\"~=\"baik\"~', '#SKIP'),
(174, 'nilai_sikap', 'sangat baik', 171, 'gagal', 'nilai_f2f~last_education~age~experience~nilai_sikap~', '=\"80-89\"~=\"sma\"~=\"25-35\"~=\"> 2 tahun\"~=\"sangat baik\"~', 'gagal'),
(175, 'experience', 'experience', 102, NULL, 'nilai_f2f~last_education~age~nilai_sikap~experience~', '', '#ROOT'),
(176, 'experience', '0 tahun', 175, 'gagal', 'nilai_f2f~last_education~age~nilai_sikap~experience~', '=\"80-89\"~=\"sma\"~=\"> 35\"~=\"cukup baik\"~=\"0 tahun\"~', 'gagal'),
(177, 'experience', '1-2 tahun', 175, NULL, 'nilai_f2f~last_education~age~nilai_sikap~experience~', '=\"80-89\"~=\"sma\"~=\"> 35\"~=\"cukup baik\"~=\"1-2 tahun\"~', 'stop_child'),
(178, 'experience', '> 2 tahun', 175, '#SKIP', 'nilai_f2f~last_education~age~nilai_sikap~experience~', '=\"80-89\"~=\"sma\"~=\"> 35\"~=\"cukup baik\"~=\"> 2 tahun\"~', '#SKIP'),
(179, 'experience', 'experience', 103, NULL, 'nilai_f2f~last_education~age~nilai_sikap~experience~', '', '#ROOT'),
(180, 'experience', '0 tahun', 179, '#SKIP', 'nilai_f2f~last_education~age~nilai_sikap~experience~', '=\"80-89\"~=\"sma\"~=\"> 35\"~=\"baik\"~=\"0 tahun\"~', '#SKIP'),
(181, 'experience', '1-2 tahun', 179, 'gagal', 'nilai_f2f~last_education~age~nilai_sikap~experience~', '=\"80-89\"~=\"sma\"~=\"> 35\"~=\"baik\"~=\"1-2 tahun\"~', 'gagal'),
(182, 'experience', '> 2 tahun', 179, 'lulus', 'nilai_f2f~last_education~age~nilai_sikap~experience~', '=\"80-89\"~=\"sma\"~=\"> 35\"~=\"baik\"~=\"> 2 tahun\"~', 'lulus'),
(183, 'total_ability', 'total_ability', 116, NULL, 'nilai_f2f~last_education~age~nilai_sikap~total_ability~', '', '#ROOT'),
(184, 'total_ability', '5-7', 183, 'lulus', 'nilai_f2f~last_education~age~nilai_sikap~total_ability~', '=\"80-89\"~=\"pasca\"~=\"25-35\"~=\"sangat baik\"~=\"5-7\"~', 'lulus'),
(185, 'total_ability', '8-10', 183, NULL, 'nilai_f2f~last_education~age~nilai_sikap~total_ability~', '=\"80-89\"~=\"pasca\"~=\"25-35\"~=\"sangat baik\"~=\"8-10\"~', 'stop_child'),
(186, 'nilai_sikap', 'nilai_sikap', 118, NULL, 'nilai_f2f~last_education~age~total_ability~nilai_sikap~', '', '#ROOT'),
(187, 'nilai_sikap', 'cukup baik', 186, 'gagal', 'nilai_f2f~last_education~age~total_ability~nilai_sikap~', '=\"80-89\"~=\"pasca\"~=\"> 35\"~=\"5-7\"~=\"cukup baik\"~', 'gagal'),
(188, 'nilai_sikap', 'baik', 186, 'lulus', 'nilai_f2f~last_education~age~total_ability~nilai_sikap~', '=\"80-89\"~=\"pasca\"~=\"> 35\"~=\"5-7\"~=\"baik\"~', 'lulus'),
(189, 'nilai_sikap', 'sangat baik', 186, 'gagal', 'nilai_f2f~last_education~age~total_ability~nilai_sikap~', '=\"80-89\"~=\"pasca\"~=\"> 35\"~=\"5-7\"~=\"sangat baik\"~', 'gagal'),
(190, 'last_education', 'last_education', 122, NULL, 'nilai_f2f~nilai_sikap~age~experience~last_education~', '', '#ROOT'),
(191, 'last_education', 'sma', 190, 'gagal', 'nilai_f2f~nilai_sikap~age~experience~last_education~', '=\"90-100\"~=\"cukup baik\"~=\"25-35\"~=\"1-2 tahun\"~=\"sma\"~', 'gagal'),
(192, 'last_education', 'akademi', 190, '#SKIP', 'nilai_f2f~nilai_sikap~age~experience~last_education~', '=\"90-100\"~=\"cukup baik\"~=\"25-35\"~=\"1-2 tahun\"~=\"akademi\"~', '#SKIP'),
(193, 'last_education', 'sarjana', 190, 'lulus', 'nilai_f2f~nilai_sikap~age~experience~last_education~', '=\"90-100\"~=\"cukup baik\"~=\"25-35\"~=\"1-2 tahun\"~=\"sarjana\"~', 'lulus'),
(194, 'last_education', 'pasca', 190, 'gagal', 'nilai_f2f~nilai_sikap~age~experience~last_education~', '=\"90-100\"~=\"cukup baik\"~=\"25-35\"~=\"1-2 tahun\"~=\"pasca\"~', 'gagal'),
(195, 'experience', 'experience', 126, NULL, 'nilai_f2f~nilai_sikap~age~total_ability~experience~', '', '#ROOT'),
(196, 'experience', '0 tahun', 195, 'gagal', 'nilai_f2f~nilai_sikap~age~total_ability~experience~', '=\"90-100\"~=\"cukup baik\"~=\"> 35\"~=\"8-10\"~=\"0 tahun\"~', 'gagal'),
(197, 'experience', '1-2 tahun', 195, 'lulus', 'nilai_f2f~nilai_sikap~age~total_ability~experience~', '=\"90-100\"~=\"cukup baik\"~=\"> 35\"~=\"8-10\"~=\"1-2 tahun\"~', 'lulus'),
(198, 'experience', '> 2 tahun', 195, 'gagal', 'nilai_f2f~nilai_sikap~age~total_ability~experience~', '=\"90-100\"~=\"cukup baik\"~=\"> 35\"~=\"8-10\"~=\"> 2 tahun\"~', 'gagal'),
(199, 'total_ability', 'total_ability', 133, NULL, 'nilai_f2f~nilai_sikap~last_education~experience~total_ability~', '', '#ROOT'),
(200, 'total_ability', '5-7', 199, 'gagal', 'nilai_f2f~nilai_sikap~last_education~experience~total_ability~', '=\"90-100\"~=\"sangat baik\"~=\"sma\"~=\"1-2 tahun\"~=\"5-7\"~', 'gagal'),
(201, 'total_ability', '8-10', 199, 'lulus', 'nilai_f2f~nilai_sikap~last_education~experience~total_ability~', '=\"90-100\"~=\"sangat baik\"~=\"sma\"~=\"1-2 tahun\"~=\"8-10\"~', 'lulus'),
(202, 'experience', 'experience', 136, NULL, 'nilai_f2f~nilai_sikap~last_education~status~experience~', '', '#ROOT'),
(203, 'experience', '0 tahun', 202, 'lulus', 'nilai_f2f~nilai_sikap~last_education~status~experience~', '=\"90-100\"~=\"sangat baik\"~=\"sarjana\"~=\"lajang\"~=\"0 tahun\"~', 'lulus'),
(204, 'experience', '1-2 tahun', 202, 'lulus', 'nilai_f2f~nilai_sikap~last_education~status~experience~', '=\"90-100\"~=\"sangat baik\"~=\"sarjana\"~=\"lajang\"~=\"1-2 tahun\"~', 'lulus'),
(205, 'experience', '> 2 tahun', 202, 'gagal', 'nilai_f2f~nilai_sikap~last_education~status~experience~', '=\"90-100\"~=\"sangat baik\"~=\"sarjana\"~=\"lajang\"~=\"> 2 tahun\"~', 'gagal'),
(206, 'nilai_online', 'nilai_online', 142, NULL, 'nilai_f2f~experience~last_education~age~status~nilai_online~', '', '#ROOT'),
(207, 'nilai_online', '70-79', 206, 'gagal', 'nilai_f2f~experience~last_education~age~status~nilai_online~', '=\"70-79\"~=\"0 tahun\"~=\"sma\"~=\"25-35\"~=\"lajang\"~=\"70-79\"~', 'gagal'),
(208, 'nilai_online', '80-89', 206, 'lulus', 'nilai_f2f~experience~last_education~age~status~nilai_online~', '=\"70-79\"~=\"0 tahun\"~=\"sma\"~=\"25-35\"~=\"lajang\"~=\"80-89\"~', 'lulus'),
(209, 'nilai_online', '90-100', 206, 'lulus', 'nilai_f2f~experience~last_education~age~status~nilai_online~', '=\"70-79\"~=\"0 tahun\"~=\"sma\"~=\"25-35\"~=\"lajang\"~=\"90-100\"~', 'lulus'),
(210, 'age', 'age', 149, NULL, 'nilai_f2f~experience~last_education~nilai_sikap~status~age~', '', '#ROOT'),
(211, 'age', '< 25', 210, 'lulus', 'nilai_f2f~experience~last_education~nilai_sikap~status~age~', '=\"70-79\"~=\"0 tahun\"~=\"sarjana\"~=\"sangat baik\"~=\"menikah\"~=\"< 25\"~', 'lulus'),
(212, 'age', '25-35', 210, 'gagal', 'nilai_f2f~experience~last_education~nilai_sikap~status~age~', '=\"70-79\"~=\"0 tahun\"~=\"sarjana\"~=\"sangat baik\"~=\"menikah\"~=\"25-35\"~', 'gagal'),
(213, 'age', '> 35', 210, '#SKIP', 'nilai_f2f~experience~last_education~nilai_sikap~status~age~', '=\"70-79\"~=\"0 tahun\"~=\"sarjana\"~=\"sangat baik\"~=\"menikah\"~=\"> 35\"~', '#SKIP'),
(214, 'age', 'age', 151, NULL, 'nilai_f2f~experience~status~last_education~total_ability~age~', '', '#ROOT'),
(215, 'age', '< 25', 214, 'lulus', 'nilai_f2f~experience~status~last_education~total_ability~age~', '=\"70-79\"~=\"1-2 tahun\"~=\"menikah\"~=\"sma\"~=\"5-7\"~=\"< 25\"~', 'lulus'),
(216, 'age', '25-35', 214, 'gagal', 'nilai_f2f~experience~status~last_education~total_ability~age~', '=\"70-79\"~=\"1-2 tahun\"~=\"menikah\"~=\"sma\"~=\"5-7\"~=\"25-35\"~', 'gagal'),
(217, 'age', '> 35', 214, '#SKIP', 'nilai_f2f~experience~status~last_education~total_ability~age~', '=\"70-79\"~=\"1-2 tahun\"~=\"menikah\"~=\"sma\"~=\"5-7\"~=\"> 35\"~', '#SKIP'),
(218, 'age', 'age', 155, NULL, 'nilai_f2f~experience~status~last_education~total_ability~age~', '', '#ROOT'),
(219, 'age', '< 25', 218, '#SKIP', 'nilai_f2f~experience~status~last_education~total_ability~age~', '=\"70-79\"~=\"1-2 tahun\"~=\"menikah\"~=\"pasca\"~=\"8-10\"~=\"< 25\"~', '#SKIP'),
(220, 'age', '25-35', 218, NULL, 'nilai_f2f~experience~status~last_education~total_ability~age~', '=\"70-79\"~=\"1-2 tahun\"~=\"menikah\"~=\"pasca\"~=\"8-10\"~=\"25-35\"~', 'stop_child'),
(221, 'age', '> 35', 218, NULL, 'nilai_f2f~experience~status~last_education~total_ability~age~', '=\"70-79\"~=\"1-2 tahun\"~=\"menikah\"~=\"pasca\"~=\"8-10\"~=\"> 35\"~', 'stop_child'),
(222, 'status', 'status', 177, NULL, 'nilai_f2f~last_education~age~nilai_sikap~experience~status~', '', '#ROOT'),
(223, 'status', 'lajang', 222, 'gagal', 'nilai_f2f~last_education~age~nilai_sikap~experience~status~', '=\"80-89\"~=\"sma\"~=\"> 35\"~=\"cukup baik\"~=\"1-2 tahun\"~=\"lajang\"~', 'gagal'),
(224, 'status', 'menikah', 222, 'lulus', 'nilai_f2f~last_education~age~nilai_sikap~experience~status~', '=\"80-89\"~=\"sma\"~=\"> 35\"~=\"cukup baik\"~=\"1-2 tahun\"~=\"menikah\"~', 'lulus'),
(225, 'experience', 'experience', 185, NULL, 'nilai_f2f~last_education~age~nilai_sikap~total_ability~experience~', '', '#ROOT'),
(226, 'experience', '0 tahun', 225, '#SKIP', 'nilai_f2f~last_education~age~nilai_sikap~total_ability~experience~', '=\"80-89\"~=\"pasca\"~=\"25-35\"~=\"sangat baik\"~=\"8-10\"~=\"0 tahun\"~', '#SKIP'),
(227, 'experience', '1-2 tahun', 225, 'lulus', 'nilai_f2f~last_education~age~nilai_sikap~total_ability~experience~', '=\"80-89\"~=\"pasca\"~=\"25-35\"~=\"sangat baik\"~=\"8-10\"~=\"1-2 tahun\"~', 'lulus'),
(228, 'experience', '> 2 tahun', 225, 'gagal', 'nilai_f2f~last_education~age~nilai_sikap~total_ability~experience~', '=\"80-89\"~=\"pasca\"~=\"25-35\"~=\"sangat baik\"~=\"8-10\"~=\"> 2 tahun\"~', 'gagal'),
(229, 'nilai_online', 'nilai_online', 220, NULL, 'nilai_f2f~experience~status~last_education~total_ability~age~nilai_online~', '', '#ROOT'),
(230, 'nilai_online', '70-79', 229, 'gagal', 'nilai_f2f~experience~status~last_education~total_ability~age~nilai_online~', '=\"70-79\"~=\"1-2 tahun\"~=\"menikah\"~=\"pasca\"~=\"8-10\"~=\"25-35\"~=\"70-79\"~', 'gagal'),
(231, 'nilai_online', '80-89', 229, 'lulus', 'nilai_f2f~experience~status~last_education~total_ability~age~nilai_online~', '=\"70-79\"~=\"1-2 tahun\"~=\"menikah\"~=\"pasca\"~=\"8-10\"~=\"25-35\"~=\"80-89\"~', 'lulus'),
(232, 'nilai_online', '90-100', 229, '#SKIP', 'nilai_f2f~experience~status~last_education~total_ability~age~nilai_online~', '=\"70-79\"~=\"1-2 tahun\"~=\"menikah\"~=\"pasca\"~=\"8-10\"~=\"25-35\"~=\"90-100\"~', '#SKIP'),
(233, 'nilai_online', 'nilai_online', 221, NULL, 'nilai_f2f~experience~status~last_education~total_ability~age~nilai_online~', '', '#ROOT'),
(234, 'nilai_online', '70-79', 233, 'lulus', 'nilai_f2f~experience~status~last_education~total_ability~age~nilai_online~', '=\"70-79\"~=\"1-2 tahun\"~=\"menikah\"~=\"pasca\"~=\"8-10\"~=\"> 35\"~=\"70-79\"~', 'lulus'),
(235, 'nilai_online', '80-89', 233, 'gagal', 'nilai_f2f~experience~status~last_education~total_ability~age~nilai_online~', '=\"70-79\"~=\"1-2 tahun\"~=\"menikah\"~=\"pasca\"~=\"8-10\"~=\"> 35\"~=\"80-89\"~', 'gagal'),
(236, 'nilai_online', '90-100', 233, '#SKIP', 'nilai_f2f~experience~status~last_education~total_ability~age~nilai_online~', '=\"70-79\"~=\"1-2 tahun\"~=\"menikah\"~=\"pasca\"~=\"8-10\"~=\"> 35\"~=\"90-100\"~', '#SKIP');

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
(10, 'status', '=\"pasca\"', NULL, '!=\"lajang\"', NULL, 4, '#SKIP', 'nilai_f2f~experience~~last_education~~status~', '', '=\"70-79\"~=\"1-2 tahun\"~~=\"pasca\"~~!=\"lajang\"~'),
(11, 'age', '!=\"pasca\"', '=\"< 25\"', NULL, NULL, 4, 'stop', 'nilai_f2f~experience~~last_education~~age~', '=\"70-79\"~=\"1-2 tahun\"~~!=\"pasca\"~~=\"< 25\"~', ''),
(12, 'age', '!=\"pasca\"', NULL, '< 25', 'gagal', 4, 'stop', '', '', ''),
(13, 'status', '=\"sangat baik\"', '=\"lajang\"', '!=\"lajang\"', NULL, 5, 'stop', 'nilai_f2f~experience~~nilai_sikap~~status~', '=\"70-79\"~!=\"1-2 tahun\"~~=\"sangat baik\"~~=\"lajang\"~', '=\"70-79\"~!=\"1-2 tahun\"~~=\"sangat baik\"~~!=\"lajang\"~'),
(14, 'nilai_online', '!=\"sangat baik\"', '=\"80-89\"', '!=\"80-89\"', NULL, 5, '#SKIP', 'nilai_f2f~experience~~nilai_sikap~~nilai_online~', '=\"70-79\"~!=\"1-2 tahun\"~~!=\"sangat baik\"~~=\"80-89\"~', '=\"70-79\"~!=\"1-2 tahun\"~~!=\"sangat baik\"~~!=\"80-89\"~'),
(15, 'experience', '!=\"baik\"', '1-2 tahun', NULL, 'lulus', 7, 'stop', '', '', ''),
(16, 'experience', '!=\"baik\"', NULL, '!=\"1-2 tahun\"', NULL, 7, 'stop', 'nilai_f2f~last_education~~nilai_sikap~~experience~', '', '!=\"70-79\"~=\"sarjana\"~~!=\"baik\"~~!=\"1-2 tahun\"~'),
(17, 'nilai_f2f', '=\"akademi\"', '=\"80-89\"', '!=\"80-89\"', NULL, 8, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~=\"80-89\"~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~'),
(18, 'experience', '!=\"akademi\"', '=\"1-2 tahun\"', '!=\"1-2 tahun\"', NULL, 8, 'stop', 'nilai_f2f~last_education~~last_education~~experience~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~'),
(19, 'total_ability', '=\"< 25\"', '5-7', NULL, 'lulus', 11, 'stop', '', '', ''),
(20, 'total_ability', '=\"< 25\"', NULL, '5-7', 'gagal', 11, 'stop', '', '', ''),
(21, 'age', '=\"lajang\"', '=\"> 35\"', NULL, NULL, 13, 'stop', 'nilai_f2f~experience~~nilai_sikap~~status~~age~', '=\"70-79\"~!=\"1-2 tahun\"~~=\"sangat baik\"~~=\"lajang\"~~=\"> 35\"~', ''),
(22, 'age', '=\"lajang\"', NULL, '> 35', 'lulus', 13, 'stop', '', '', ''),
(23, 'age', '!=\"lajang\"', '> 35', NULL, 'gagal', 13, 'stop', '', '', ''),
(24, 'age', '!=\"lajang\"', NULL, '!=\"> 35\"', NULL, 13, 'stop', 'nilai_f2f~experience~~nilai_sikap~~status~~age~', '', '=\"70-79\"~!=\"1-2 tahun\"~~=\"sangat baik\"~~!=\"lajang\"~~!=\"> 35\"~'),
(25, 'nilai_online', '!=\"1-2 tahun\"', '=\"70-79\"', '!=\"70-79\"', NULL, 16, 'stop', 'nilai_f2f~last_education~~nilai_sikap~~experience~~nilai_online~', '!=\"70-79\"~=\"sarjana\"~~!=\"baik\"~~!=\"1-2 tahun\"~~=\"70-79\"~', '!=\"70-79\"~=\"sarjana\"~~!=\"baik\"~~!=\"1-2 tahun\"~~!=\"70-79\"~'),
(26, 'age', '=\"80-89\"', '=\"25-35\"', NULL, NULL, 17, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~~age~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~=\"80-89\"~~=\"25-35\"~', ''),
(27, 'age', '=\"80-89\"', NULL, '25-35', 'lulus', 17, 'stop', '', '', ''),
(28, 'nilai_sikap', '!=\"80-89\"', '=\"cukup baik\"', '!=\"cukup baik\"', NULL, 17, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~~nilai_sikap~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~~=\"cukup baik\"~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~~!=\"cukup baik\"~'),
(29, 'total_ability', '=\"1-2 tahun\"', '=\"5-7\"', '!=\"5-7\"', NULL, 18, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~=\"5-7\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~'),
(30, 'total_ability', '!=\"1-2 tahun\"', '=\"5-7\"', '!=\"5-7\"', NULL, 18, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~'),
(31, 'last_education', '=\"> 35\"', 'sma', NULL, 'gagal', 21, 'stop', '', '', ''),
(32, 'last_education', '=\"> 35\"', NULL, 'sma', 'lulus', 21, 'stop', '', '', ''),
(33, 'total_ability', '!=\"> 35\"', '5-7', NULL, 'lulus', 24, 'stop', '', '', ''),
(34, 'total_ability', '!=\"> 35\"', NULL, '5-7', 'gagal', 24, 'stop', '', '', ''),
(35, 'age', '=\"70-79\"', '< 25', NULL, 'gagal', 25, 'stop', '', '', ''),
(36, 'age', '=\"70-79\"', NULL, '!=\"< 25\"', NULL, 25, 'stop', 'nilai_f2f~last_education~~nilai_sikap~~experience~~nilai_online~~age~', '', '!=\"70-79\"~=\"sarjana\"~~!=\"baik\"~~!=\"1-2 tahun\"~~=\"70-79\"~~!=\"< 25\"~'),
(37, 'age', '!=\"70-79\"', '25-35', NULL, 'lulus', 25, 'stop', '', '', ''),
(38, 'age', '!=\"70-79\"', NULL, '!=\"25-35\"', NULL, 25, 'stop', 'nilai_f2f~last_education~~nilai_sikap~~experience~~nilai_online~~age~', '', '!=\"70-79\"~=\"sarjana\"~~!=\"baik\"~~!=\"1-2 tahun\"~~!=\"70-79\"~~!=\"25-35\"~'),
(39, 'nilai_sikap', '=\"25-35\"', 'cukup baik', NULL, 'lulus', 26, 'stop', '', '', ''),
(40, 'nilai_sikap', '=\"25-35\"', NULL, 'cukup baik', 'gagal', 26, 'stop', '', '', ''),
(41, 'age', '=\"cukup baik\"', '=\"> 35\"', NULL, NULL, 28, '#SKIP', 'nilai_f2f~last_education~~last_education~~nilai_f2f~~nilai_sikap~~age~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~~=\"cukup baik\"~~=\"> 35\"~', ''),
(42, 'age', '=\"cukup baik\"', NULL, '> 35', 'lulus', 28, 'stop', '', '', ''),
(43, 'total_ability', '!=\"cukup baik\"', '=\"5-7\"', NULL, NULL, 28, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~~nilai_sikap~~total_ability~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~~!=\"cukup baik\"~~=\"5-7\"~', ''),
(44, 'total_ability', '!=\"cukup baik\"', NULL, '5-7', 'gagal', 28, 'stop', '', '', ''),
(45, 'age', '=\"5-7\"', '=\"> 35\"', NULL, NULL, 29, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~age~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~=\"5-7\"~~=\"> 35\"~', ''),
(46, 'age', '=\"5-7\"', NULL, '> 35', 'gagal', 29, 'stop', '', '', ''),
(47, 'nilai_sikap', '!=\"5-7\"', '=\"sangat baik\"', '!=\"sangat baik\"', NULL, 29, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_sikap~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~~=\"sangat baik\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sangat baik\"~'),
(48, 'last_education', '=\"5-7\"', '=\"sma\"', '!=\"sma\"', NULL, 30, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~=\"sma\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~!=\"sma\"~'),
(49, 'last_education', '!=\"5-7\"', '=\"sma\"', '!=\"sma\"', NULL, 30, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~=\"sma\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sma\"~'),
(50, 'status', '!=\"< 25\"', '=\"lajang\"', NULL, NULL, 36, 'stop', 'nilai_f2f~last_education~~nilai_sikap~~experience~~nilai_online~~age~~status~', '!=\"70-79\"~=\"sarjana\"~~!=\"baik\"~~!=\"1-2 tahun\"~~=\"70-79\"~~!=\"< 25\"~~=\"lajang\"~', ''),
(51, 'status', '!=\"< 25\"', NULL, 'lajang', 'lulus', 36, 'stop', '', '', ''),
(52, 'nilai_sikap', '!=\"25-35\"', 'cukup baik', NULL, 'gagal', 38, 'stop', '', '', ''),
(53, 'nilai_sikap', '!=\"25-35\"', NULL, '!=\"cukup baik\"', NULL, 38, 'stop', 'nilai_f2f~last_education~~nilai_sikap~~experience~~nilai_online~~age~~nilai_sikap~', '', '!=\"70-79\"~=\"sarjana\"~~!=\"baik\"~~!=\"1-2 tahun\"~~!=\"70-79\"~~!=\"25-35\"~~!=\"cukup baik\"~'),
(54, 'age', '=\"5-7\"', '< 25', NULL, 'lulus', 43, 'stop', '', '', ''),
(55, 'age', '=\"5-7\"', NULL, '< 25', 'gagal', 43, 'stop', '', '', ''),
(56, 'last_education', '=\"> 35\"', 'sma', NULL, 'lulus', 45, 'stop', '', '', ''),
(57, 'last_education', '=\"> 35\"', NULL, '!=\"sma\"', NULL, 45, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~age~~last_education~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~=\"5-7\"~~=\"> 35\"~~!=\"sma\"~'),
(58, 'status', '=\"sangat baik\"', 'lajang', NULL, 'lulus', 47, 'stop', '', '', ''),
(59, 'status', '=\"sangat baik\"', NULL, '!=\"lajang\"', NULL, 47, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_sikap~~status~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~~=\"sangat baik\"~~!=\"lajang\"~'),
(60, 'age', '!=\"sangat baik\"', '=\"25-35\"', NULL, NULL, 47, '#SKIP', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_sikap~~age~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sangat baik\"~~=\"25-35\"~', ''),
(61, 'age', '!=\"sangat baik\"', NULL, '25-35', 'gagal', 47, 'stop', '', '', ''),
(62, 'experience', '=\"sma\"', '=\"0 tahun\"', '!=\"0 tahun\"', NULL, 48, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~experience~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~=\"sma\"~~=\"0 tahun\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~=\"sma\"~~!=\"0 tahun\"~'),
(63, 'age', '!=\"sma\"', '25-35', NULL, 'lulus', 48, 'stop', '', '', ''),
(64, 'age', '!=\"sma\"', NULL, '!=\"25-35\"', NULL, 48, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~age~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~!=\"sma\"~~!=\"25-35\"~'),
(65, 'status', '=\"sma\"', '=\"lajang\"', NULL, NULL, 49, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~status~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~=\"sma\"~~=\"lajang\"~', ''),
(66, 'status', '=\"sma\"', NULL, 'lajang', 'lulus', 49, 'stop', '', '', ''),
(67, 'nilai_f2f', '!=\"sma\"', '80-89', NULL, 'gagal', 49, 'stop', '', '', ''),
(68, 'nilai_f2f', '!=\"sma\"', NULL, '!=\"80-89\"', NULL, 49, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~nilai_f2f~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sma\"~~!=\"80-89\"~'),
(69, 'age', '=\"lajang\"', '25-35', NULL, 'gagal', 50, 'stop', '', '', ''),
(70, 'age', '=\"lajang\"', NULL, '!=\"25-35\"', NULL, 50, 'stop', 'nilai_f2f~last_education~~nilai_sikap~~experience~~nilai_online~~age~~status~~age~', '', '!=\"70-79\"~=\"sarjana\"~~!=\"baik\"~~!=\"1-2 tahun\"~~=\"70-79\"~~!=\"< 25\"~~=\"lajang\"~~!=\"25-35\"~'),
(71, 'experience', '!=\"cukup baik\"', '0 tahun', NULL, 'lulus', 53, 'stop', '', '', ''),
(72, 'experience', '!=\"cukup baik\"', NULL, '!=\"0 tahun\"', NULL, 53, 'stop', 'nilai_f2f~last_education~~nilai_sikap~~experience~~nilai_online~~age~~nilai_sikap~~experience~', '', '!=\"70-79\"~=\"sarjana\"~~!=\"baik\"~~!=\"1-2 tahun\"~~!=\"70-79\"~~!=\"25-35\"~~!=\"cukup baik\"~~!=\"0 tahun\"~'),
(73, 'nilai_sikap', '!=\"sma\"', 'baik', NULL, 'lulus', 57, 'stop', '', '', ''),
(74, 'nilai_sikap', '!=\"sma\"', NULL, 'baik', 'gagal', 57, 'stop', '', '', ''),
(75, 'last_education', '!=\"lajang\"', 'sma', NULL, 'gagal', 59, 'stop', '', '', ''),
(76, 'last_education', '!=\"lajang\"', NULL, 'sma', 'lulus', 59, 'stop', '', '', ''),
(77, 'age', '=\"0 tahun\"', '=\"25-35\"', NULL, NULL, 62, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~experience~~age~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~=\"sma\"~~=\"0 tahun\"~~=\"25-35\"~', ''),
(78, 'age', '=\"0 tahun\"', NULL, '25-35', 'gagal', 62, 'stop', '', '', ''),
(79, 'age', '!=\"0 tahun\"', '25-35', NULL, 'gagal', 62, 'stop', '', '', ''),
(80, 'age', '!=\"0 tahun\"', NULL, '!=\"25-35\"', NULL, 62, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~experience~~age~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~=\"sma\"~~!=\"0 tahun\"~~!=\"25-35\"~'),
(81, 'nilai_sikap', '!=\"25-35\"', 'sangat baik', NULL, 'gagal', 64, 'stop', '', '', ''),
(82, 'nilai_sikap', '!=\"25-35\"', NULL, 'sangat baik', 'lulus', 64, 'stop', '', '', ''),
(83, 'nilai_sikap', '=\"lajang\"', 'cukup baik', NULL, 'lulus', 65, 'stop', '', '', ''),
(84, 'nilai_sikap', '=\"lajang\"', NULL, 'cukup baik', 'gagal', 65, 'stop', '', '', ''),
(85, 'age', '!=\"80-89\"', '< 25', NULL, 'lulus', 68, 'stop', '', '', ''),
(86, 'age', '!=\"80-89\"', NULL, '!=\"< 25\"', NULL, 68, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~nilai_f2f~~age~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sma\"~~!=\"80-89\"~~!=\"< 25\"~'),
(87, 'experience', '!=\"25-35\"', '0 tahun', NULL, 'lulus', 70, 'stop', '', '', ''),
(88, 'experience', '!=\"25-35\"', NULL, '!=\"0 tahun\"', NULL, 70, 'stop', 'nilai_f2f~last_education~~nilai_sikap~~experience~~nilai_online~~age~~status~~age~~experience~', '', '!=\"70-79\"~=\"sarjana\"~~!=\"baik\"~~!=\"1-2 tahun\"~~=\"70-79\"~~!=\"< 25\"~~=\"lajang\"~~!=\"25-35\"~~!=\"0 tahun\"~'),
(89, 'age', '!=\"0 tahun\"', '< 25', NULL, 'gagal', 72, 'stop', '', '', ''),
(90, 'age', '!=\"0 tahun\"', NULL, '< 25', 'lulus', 72, 'stop', '', '', ''),
(91, 'nilai_sikap', '=\"25-35\"', 'cukup baik', NULL, 'lulus', 77, 'stop', '', '', ''),
(92, 'nilai_sikap', '=\"25-35\"', NULL, 'cukup baik', 'gagal', 77, 'stop', '', '', ''),
(93, 'nilai_f2f', '!=\"25-35\"', '80-89', NULL, 'lulus', 80, 'stop', '', '', ''),
(94, 'nilai_f2f', '!=\"25-35\"', NULL, '80-89', 'lulus', 80, 'stop', '', '', ''),
(95, 'nilai_sikap', '!=\"< 25\"', 'sangat baik', NULL, 'lulus', 86, 'stop', '', '', ''),
(96, 'nilai_sikap', '!=\"< 25\"', NULL, '!=\"sangat baik\"', NULL, 86, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~nilai_f2f~~age~~nilai_sikap~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sma\"~~!=\"80-89\"~~!=\"< 25\"~~!=\"sangat baik\"~'),
(97, 'nilai_f2f', '!=\"0 tahun\"', '80-89', NULL, 'lulus', 88, 'stop', '', '', ''),
(98, 'nilai_f2f', '!=\"0 tahun\"', NULL, '80-89', 'gagal', 88, 'stop', '', '', ''),
(99, 'age', '!=\"sangat baik\"', '=\"25-35\"', NULL, NULL, 96, '#SKIP', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~nilai_f2f~~age~~nilai_sikap~~age~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sma\"~~!=\"80-89\"~~!=\"< 25\"~~!=\"sangat baik\"~~=\"25-35\"~', ''),
(100, 'age', '!=\"sangat baik\"', NULL, '25-35', 'gagal', 96, 'stop', '', '', '');

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
(169, 'Toi', '> 35', '> 2 tahun', 'pasca', 'lajang', '8-10', '70-79', '90-100', 'cukup baik', 0, 'gagal'),
(170, 'Eusebio', '< 25', '> 2 tahun', 'akademi', 'lajang', '5-7', '90-100', '90-100', 'baik', 1, 'lulus'),
(171, 'Solomon', '25-35', '1-2 tahun', 'pasca', 'menikah', '8-10', '70-79', '70-79', 'cukup baik', 1, 'gagal'),
(172, 'Adaline', '< 25', '> 2 tahun', 'sarjana', 'lajang', '8-10', '90-100', '70-79', 'cukup baik', 1, 'gagal'),
(173, 'Elia', '> 35', '0 tahun', 'sma', 'lajang', '8-10', '80-89', '70-79', 'baik', 1, 'gagal'),
(174, 'Lacey', '> 35', '> 2 tahun', 'pasca', 'menikah', '8-10', '70-79', '90-100', 'cukup baik', 0, 'gagal'),
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
(11, 'lajang', 1, 'status'),
(12, 'menikah', 1, 'status'),
(13, '5-7', 1, 'total_ability'),
(14, '8-10', 1, 'total_ability'),
(15, '70-79', 1, 'nilai_online'),
(16, '80-89', 1, 'nilai_online'),
(17, '90-100', 1, 'nilai_online'),
(18, '70-79', 1, 'nilai_f2f'),
(19, '80-89', 1, 'nilai_f2f'),
(20, '90-100', 1, 'nilai_f2f'),
(21, 'cukup baik', 1, 'nilai_sikap'),
(22, 'baik', 1, 'nilai_sikap'),
(23, 'sangat baik', 1, 'nilai_sikap');

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
(9, 'status', '=\"pasca\"', NULL, '!=\"lajang\"', NULL, 4, '#SKIP', 'nilai_f2f~experience~~last_education~~status~', '', '=\"70-79\"~=\"1-2 tahun\"~~=\"pasca\"~~!=\"lajang\"~'),
(10, 'age', '!=\"pasca\"', '=\"< 25\"', NULL, NULL, 4, 'stop', 'nilai_f2f~experience~~last_education~~age~', '=\"70-79\"~=\"1-2 tahun\"~~!=\"pasca\"~~=\"< 25\"~', ''),
(11, 'age', '!=\"pasca\"', NULL, '< 25', 'gagal', 4, 'stop', '', '', ''),
(12, 'status', '=\"sangat baik\"', '=\"lajang\"', '!=\"lajang\"', NULL, 5, 'stop', 'nilai_f2f~experience~~nilai_sikap~~status~', '=\"70-79\"~!=\"1-2 tahun\"~~=\"sangat baik\"~~=\"lajang\"~', '=\"70-79\"~!=\"1-2 tahun\"~~=\"sangat baik\"~~!=\"lajang\"~'),
(13, 'nilai_online', '!=\"sangat baik\"', '=\"80-89\"', '!=\"80-89\"', NULL, 5, '#SKIP', 'nilai_f2f~experience~~nilai_sikap~~nilai_online~', '=\"70-79\"~!=\"1-2 tahun\"~~!=\"sangat baik\"~~=\"80-89\"~', '=\"70-79\"~!=\"1-2 tahun\"~~!=\"sangat baik\"~~!=\"80-89\"~'),
(14, 'experience', '=\"25-35\"', '=\"0 tahun\"', NULL, NULL, 6, 'stop', 'nilai_f2f~last_education~~age~~experience~', '!=\"70-79\"~=\"sarjana\"~~=\"25-35\"~~=\"0 tahun\"~', ''),
(15, 'experience', '=\"25-35\"', NULL, '0 tahun', 'lulus', 6, 'stop', '', '', ''),
(16, 'experience', '!=\"25-35\"', '=\"1-2 tahun\"', '!=\"1-2 tahun\"', NULL, 6, 'stop', 'nilai_f2f~last_education~~age~~experience~', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~~=\"1-2 tahun\"~', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~~!=\"1-2 tahun\"~'),
(17, 'nilai_f2f', '=\"akademi\"', '=\"80-89\"', '!=\"80-89\"', NULL, 7, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~=\"80-89\"~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~'),
(18, 'experience', '!=\"akademi\"', '=\"1-2 tahun\"', '!=\"1-2 tahun\"', NULL, 7, 'stop', 'nilai_f2f~last_education~~last_education~~experience~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~'),
(19, 'total_ability', '=\"< 25\"', '5-7', NULL, 'lulus', 10, 'stop', '', '', ''),
(20, 'total_ability', '=\"< 25\"', NULL, '5-7', 'gagal', 10, 'stop', '', '', ''),
(21, 'age', '=\"lajang\"', '=\"> 35\"', NULL, NULL, 12, 'stop', 'nilai_f2f~experience~~nilai_sikap~~status~~age~', '=\"70-79\"~!=\"1-2 tahun\"~~=\"sangat baik\"~~=\"lajang\"~~=\"> 35\"~', ''),
(22, 'age', '=\"lajang\"', NULL, '> 35', 'lulus', 12, 'stop', '', '', ''),
(23, 'age', '!=\"lajang\"', '> 35', NULL, 'gagal', 12, 'stop', '', '', ''),
(24, 'age', '!=\"lajang\"', NULL, '!=\"> 35\"', NULL, 12, 'stop', 'nilai_f2f~experience~~nilai_sikap~~status~~age~', '', '=\"70-79\"~!=\"1-2 tahun\"~~=\"sangat baik\"~~!=\"lajang\"~~!=\"> 35\"~'),
(25, 'total_ability', '=\"0 tahun\"', '5-7', NULL, 'gagal', 14, 'stop', '', '', ''),
(26, 'total_ability', '=\"0 tahun\"', NULL, '5-7', 'lulus', 14, 'stop', '', '', ''),
(27, 'nilai_sikap', '=\"1-2 tahun\"', '=\"baik\"', NULL, NULL, 16, 'stop', 'nilai_f2f~last_education~~age~~experience~~nilai_sikap~', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~~=\"1-2 tahun\"~~=\"baik\"~', ''),
(28, 'nilai_sikap', '=\"1-2 tahun\"', NULL, 'baik', 'lulus', 16, 'stop', '', '', ''),
(29, 'nilai_sikap', '!=\"1-2 tahun\"', 'baik', NULL, 'lulus', 16, 'stop', '', '', ''),
(30, 'nilai_sikap', '!=\"1-2 tahun\"', NULL, '!=\"baik\"', NULL, 16, 'stop', 'nilai_f2f~last_education~~age~~experience~~nilai_sikap~', '', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~~!=\"1-2 tahun\"~~!=\"baik\"~'),
(31, 'age', '=\"80-89\"', '=\"25-35\"', NULL, NULL, 17, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~~age~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~=\"80-89\"~~=\"25-35\"~', ''),
(32, 'age', '=\"80-89\"', NULL, '25-35', 'lulus', 17, 'stop', '', '', ''),
(33, 'nilai_sikap', '!=\"80-89\"', '=\"cukup baik\"', '!=\"cukup baik\"', NULL, 17, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~~nilai_sikap~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~~=\"cukup baik\"~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~~!=\"cukup baik\"~'),
(34, 'total_ability', '=\"1-2 tahun\"', '=\"5-7\"', '!=\"5-7\"', NULL, 18, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~=\"5-7\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~'),
(35, 'total_ability', '!=\"1-2 tahun\"', '=\"5-7\"', '!=\"5-7\"', NULL, 18, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~'),
(36, 'last_education', '=\"> 35\"', 'sma', NULL, 'gagal', 21, 'stop', '', '', ''),
(37, 'last_education', '=\"> 35\"', NULL, 'sma', 'lulus', 21, 'stop', '', '', ''),
(38, 'total_ability', '!=\"> 35\"', '5-7', NULL, 'lulus', 24, 'stop', '', '', ''),
(39, 'total_ability', '!=\"> 35\"', NULL, '5-7', 'gagal', 24, 'stop', '', '', ''),
(40, 'age', '=\"baik\"', '< 25', NULL, 'lulus', 27, 'stop', '', '', ''),
(41, 'age', '=\"baik\"', NULL, '< 25', 'gagal', 27, 'stop', '', '', ''),
(42, 'nilai_sikap', '!=\"baik\"', 'cukup baik', NULL, 'gagal', 30, 'stop', '', '', ''),
(43, 'nilai_sikap', '!=\"baik\"', NULL, '!=\"cukup baik\"', NULL, 30, 'stop', 'nilai_f2f~last_education~~age~~experience~~nilai_sikap~~nilai_sikap~', '', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~~!=\"1-2 tahun\"~~!=\"baik\"~~!=\"cukup baik\"~'),
(44, 'experience', '=\"25-35\"', '0 tahun', NULL, 'lulus', 31, 'stop', '', '', ''),
(45, 'experience', '=\"25-35\"', NULL, '!=\"0 tahun\"', NULL, 31, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~~age~~experience~', '', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~=\"80-89\"~~=\"25-35\"~~!=\"0 tahun\"~'),
(46, 'age', '=\"cukup baik\"', '=\"> 35\"', NULL, NULL, 33, '#SKIP', 'nilai_f2f~last_education~~last_education~~nilai_f2f~~nilai_sikap~~age~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~~=\"cukup baik\"~~=\"> 35\"~', ''),
(47, 'age', '=\"cukup baik\"', NULL, '> 35', 'lulus', 33, 'stop', '', '', ''),
(48, 'total_ability', '!=\"cukup baik\"', '=\"5-7\"', NULL, NULL, 33, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~~nilai_sikap~~total_ability~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~~!=\"cukup baik\"~~=\"5-7\"~', ''),
(49, 'total_ability', '!=\"cukup baik\"', NULL, '5-7', 'gagal', 33, 'stop', '', '', ''),
(50, 'age', '=\"5-7\"', '=\"> 35\"', NULL, NULL, 34, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~age~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~=\"5-7\"~~=\"> 35\"~', ''),
(51, 'age', '=\"5-7\"', NULL, '> 35', 'gagal', 34, 'stop', '', '', ''),
(52, 'nilai_sikap', '!=\"5-7\"', '=\"sangat baik\"', '!=\"sangat baik\"', NULL, 34, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_sikap~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~~=\"sangat baik\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sangat baik\"~'),
(53, 'nilai_online', '=\"5-7\"', '=\"70-79\"', '!=\"70-79\"', NULL, 35, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_online~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~=\"70-79\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~!=\"70-79\"~'),
(54, 'last_education', '!=\"5-7\"', '=\"sma\"', '!=\"sma\"', NULL, 35, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~=\"sma\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sma\"~'),
(55, 'nilai_f2f', '!=\"cukup baik\"', '80-89', NULL, 'lulus', 43, 'stop', '', '', ''),
(56, 'nilai_f2f', '!=\"cukup baik\"', NULL, '!=\"80-89\"', NULL, 43, 'stop', 'nilai_f2f~last_education~~age~~experience~~nilai_sikap~~nilai_sikap~~nilai_f2f~', '', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~~!=\"1-2 tahun\"~~!=\"baik\"~~!=\"cukup baik\"~~!=\"80-89\"~'),
(57, 'status', '!=\"0 tahun\"', 'lajang', NULL, 'lulus', 45, 'stop', '', '', ''),
(58, 'status', '!=\"0 tahun\"', NULL, 'lajang', 'gagal', 45, 'stop', '', '', ''),
(59, 'age', '=\"5-7\"', '< 25', NULL, 'lulus', 48, 'stop', '', '', ''),
(60, 'age', '=\"5-7\"', NULL, '< 25', 'gagal', 48, 'stop', '', '', ''),
(61, 'status', '=\"> 35\"', '=\"lajang\"', NULL, NULL, 50, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~age~~status~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~=\"5-7\"~~=\"> 35\"~~=\"lajang\"~', ''),
(62, 'status', '=\"> 35\"', NULL, 'lajang', 'lulus', 50, 'stop', '', '', ''),
(63, 'status', '=\"sangat baik\"', 'lajang', NULL, 'lulus', 52, 'stop', '', '', ''),
(64, 'status', '=\"sangat baik\"', NULL, '!=\"lajang\"', NULL, 52, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_sikap~~status~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~~=\"sangat baik\"~~!=\"lajang\"~'),
(65, 'age', '!=\"sangat baik\"', '=\"25-35\"', NULL, NULL, 52, '#SKIP', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_sikap~~age~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sangat baik\"~~=\"25-35\"~', ''),
(66, 'age', '!=\"sangat baik\"', NULL, '25-35', 'gagal', 52, 'stop', '', '', ''),
(67, 'nilai_f2f', '=\"70-79\"', '80-89', NULL, 'gagal', 53, 'stop', '', '', ''),
(68, 'nilai_f2f', '=\"70-79\"', NULL, '!=\"80-89\"', NULL, 53, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_online~~nilai_f2f~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~=\"70-79\"~~!=\"80-89\"~'),
(69, 'nilai_f2f', '!=\"70-79\"', '80-89', NULL, 'lulus', 53, 'stop', '', '', ''),
(70, 'nilai_f2f', '!=\"70-79\"', NULL, '!=\"80-89\"', NULL, 53, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_online~~nilai_f2f~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~!=\"70-79\"~~!=\"80-89\"~'),
(71, 'status', '=\"sma\"', '=\"lajang\"', NULL, NULL, 54, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~status~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~=\"sma\"~~=\"lajang\"~', ''),
(72, 'status', '=\"sma\"', NULL, 'lajang', 'lulus', 54, 'stop', '', '', ''),
(73, 'nilai_f2f', '!=\"sma\"', '80-89', NULL, 'gagal', 54, 'stop', '', '', ''),
(74, 'nilai_f2f', '!=\"sma\"', NULL, '!=\"80-89\"', NULL, 54, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~nilai_f2f~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sma\"~~!=\"80-89\"~'),
(75, 'experience', '!=\"80-89\"', '=\"0 tahun\"', NULL, NULL, 56, 'stop', 'nilai_f2f~last_education~~age~~experience~~nilai_sikap~~nilai_sikap~~nilai_f2f~~experience~', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~~!=\"1-2 tahun\"~~!=\"baik\"~~!=\"cukup baik\"~~!=\"80-89\"~~=\"0 tahun\"~', ''),
(76, 'experience', '!=\"80-89\"', NULL, '0 tahun', 'gagal', 56, 'stop', '', '', ''),
(77, 'nilai_sikap', '=\"lajang\"', 'baik', NULL, 'lulus', 61, 'stop', '', '', ''),
(78, 'nilai_sikap', '=\"lajang\"', NULL, 'baik', 'gagal', 61, 'stop', '', '', ''),
(79, 'last_education', '!=\"lajang\"', 'sma', NULL, 'gagal', 64, 'stop', '', '', ''),
(80, 'last_education', '!=\"lajang\"', NULL, 'sma', 'lulus', 64, 'stop', '', '', ''),
(81, 'age', '!=\"80-89\"', '=\"25-35\"', NULL, NULL, 68, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_online~~nilai_f2f~~age~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~=\"70-79\"~~!=\"80-89\"~~=\"25-35\"~', ''),
(82, 'age', '!=\"80-89\"', NULL, '25-35', 'lulus', 68, 'stop', '', '', ''),
(83, 'experience', '!=\"80-89\"', '0 tahun', NULL, 'lulus', 70, 'stop', '', '', ''),
(84, 'experience', '!=\"80-89\"', NULL, '!=\"0 tahun\"', NULL, 70, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_online~~nilai_f2f~~experience~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~!=\"70-79\"~~!=\"80-89\"~~!=\"0 tahun\"~'),
(85, 'nilai_sikap', '=\"lajang\"', 'cukup baik', NULL, 'lulus', 71, 'stop', '', '', ''),
(86, 'nilai_sikap', '=\"lajang\"', NULL, 'cukup baik', 'gagal', 71, 'stop', '', '', ''),
(87, 'nilai_sikap', '!=\"80-89\"', 'sangat baik', NULL, 'lulus', 74, 'stop', '', '', ''),
(88, 'nilai_sikap', '!=\"80-89\"', NULL, '!=\"sangat baik\"', NULL, 74, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~nilai_f2f~~nilai_sikap~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sma\"~~!=\"80-89\"~~!=\"sangat baik\"~'),
(89, 'age', '=\"0 tahun\"', '=\"< 25\"', NULL, NULL, 75, 'stop', 'nilai_f2f~last_education~~age~~experience~~nilai_sikap~~nilai_sikap~~nilai_f2f~~experience~~age~', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~~!=\"1-2 tahun\"~~!=\"baik\"~~!=\"cukup baik\"~~!=\"80-89\"~~=\"0 tahun\"~~=\"< 25\"~', ''),
(90, 'age', '=\"0 tahun\"', NULL, '< 25', 'lulus', 75, 'stop', '', '', ''),
(91, 'nilai_sikap', '=\"25-35\"', 'cukup baik', NULL, 'lulus', 81, 'stop', '', '', ''),
(92, 'nilai_sikap', '=\"25-35\"', NULL, 'cukup baik', 'gagal', 81, 'stop', '', '', ''),
(93, 'age', '!=\"0 tahun\"', '25-35', NULL, 'gagal', 84, 'stop', '', '', ''),
(94, 'age', '!=\"0 tahun\"', NULL, '!=\"25-35\"', NULL, 84, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_online~~nilai_f2f~~experience~~age~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~!=\"70-79\"~~!=\"80-89\"~~!=\"0 tahun\"~~!=\"25-35\"~'),
(95, 'age', '!=\"sangat baik\"', '< 25', NULL, 'lulus', 88, 'stop', '', '', ''),
(96, 'age', '!=\"sangat baik\"', NULL, '!=\"< 25\"', NULL, 88, '#SKIP', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~nilai_f2f~~nilai_sikap~~age~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sma\"~~!=\"80-89\"~~!=\"sangat baik\"~~!=\"< 25\"~'),
(97, 'nilai_online', '=\"< 25\"', '80-89', NULL, 'lulus', 89, 'stop', '', '', ''),
(98, 'nilai_online', '=\"< 25\"', NULL, '80-89', 'gagal', 89, 'stop', '', '', ''),
(99, 'last_education', '!=\"25-35\"', 'sma', NULL, 'lulus', 94, 'stop', '', '', ''),
(100, 'last_education', '!=\"25-35\"', NULL, 'sma', 'gagal', 94, 'stop', '', '', '');

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
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dataset`
--

INSERT INTO `dataset` (`id`, `nama_lengkap`, `age`, `experience`, `last_education`, `status`, `total_ability`, `nilai_online`, `nilai_f2f`, `nilai_sikap`, `status_passed`, `created_at`, `updated_at`) VALUES
(1, 'Vernia', 24, 0, 'pasca', 'lajang', 9, 71, 77, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(2, 'Layne', 21, 2, 'pasca', 'menikah', 8, 98, 95, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(3, 'Neomi', 32, 0, 'akademi', 'lajang', 7, 74, 100, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(4, 'Hannah', 28, 0, 'sma', 'lajang', 6, 77, 74, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(5, 'Alyson', 28, 9, 'akademi', 'menikah', 5, 89, 84, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(6, 'Emeline', 39, 8, 'pasca', 'menikah', 9, 78, 82, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(7, 'Janae', 48, 6, 'sma', 'lajang', 6, 71, 76, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(8, 'Luciana', 45, 2, 'sarjana', 'lajang', 10, 91, 97, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(9, 'Tommye', 35, 8, 'sarjana', 'menikah', 9, 88, 80, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(10, 'Marshall', 47, 0, 'pasca', 'lajang', 8, 84, 86, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(11, 'Dora', 25, 1, 'pasca', 'menikah', 6, 80, 85, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(12, 'Ellyn', 32, 0, 'pasca', 'lajang', 6, 93, 95, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(13, 'Herta', 29, 0, 'sarjana', 'lajang', 5, 84, 78, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(14, 'Leonel', 39, 0, 'akademi', 'lajang', 5, 77, 100, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(15, 'Caridad', 20, 9, 'akademi', 'menikah', 6, 96, 77, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(16, 'Veronika', 38, 0, 'sma', 'lajang', 8, 77, 97, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(17, 'Lincoln', 43, 10, 'pasca', 'menikah', 6, 98, 72, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(18, 'Erich', 35, 0, 'akademi', 'lajang', 9, 79, 76, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(19, 'Rickey', 18, 0, 'sarjana', 'menikah', 7, 100, 76, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(20, 'Dewey', 30, 7, 'pasca', 'lajang', 8, 79, 83, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(21, 'Beatris', 29, 1, 'sma', 'lajang', 5, 93, 94, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(22, 'Elroy', 21, 0, 'pasca', 'lajang', 9, 75, 94, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(23, 'Newton', 27, 1, 'pasca', 'menikah', 9, 89, 70, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(24, 'Talisha', 36, 0, 'sarjana', 'lajang', 7, 93, 87, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(25, 'Keesha', 24, 10, 'pasca', 'lajang', 9, 86, 78, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(26, 'Claude', 32, 0, 'sma', 'menikah', 8, 78, 78, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(27, 'Tad', 28, 7, 'akademi', 'lajang', 8, 70, 94, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(28, 'Nathan', 32, 5, 'sarjana', 'menikah', 5, 76, 96, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(29, 'Karissa', 49, 6, 'pasca', 'menikah', 10, 90, 80, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(30, 'Jeanetta', 28, 5, 'sarjana', 'lajang', 8, 74, 74, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(31, 'Felisha', 33, 7, 'sma', 'lajang', 6, 85, 98, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(32, 'Colleen', 49, 3, 'sarjana', 'menikah', 5, 89, 72, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(33, 'Elijah', 28, 0, 'sarjana', 'lajang', 8, 84, 80, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(34, 'Natalya', 47, 5, 'pasca', 'menikah', 7, 95, 97, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(35, 'Darla', 49, 1, 'akademi', 'lajang', 10, 78, 89, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(36, 'Patrick', 46, 0, 'sma', 'lajang', 7, 75, 79, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(37, 'Thresa', 27, 4, 'akademi', 'lajang', 9, 80, 80, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(38, 'Eufemia', 48, 0, 'sarjana', 'lajang', 5, 76, 95, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(39, 'Melania', 25, 3, 'akademi', 'menikah', 9, 93, 74, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(40, 'Jacqueline', 20, 3, 'sarjana', 'menikah', 8, 86, 92, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(41, 'Catrice', 25, 2, 'sma', 'menikah', 5, 95, 72, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(42, 'Star', 20, 3, 'akademi', 'menikah', 8, 79, 91, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(43, 'Samella', 40, 1, 'akademi', 'lajang', 10, 98, 98, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(44, 'Elinor', 32, 2, 'sma', 'lajang', 6, 72, 99, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(45, 'Sandee', 22, 0, 'pasca', 'menikah', 8, 80, 90, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(46, 'Maryjane', 24, 1, 'sma', 'lajang', 8, 99, 92, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(47, 'Rebeca', 28, 2, 'sarjana', 'lajang', 9, 85, 76, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(48, 'Franklin', 46, 2, 'sma', 'lajang', 8, 76, 89, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(49, 'Masako', 29, 7, 'pasca', 'lajang', 6, 74, 77, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(50, 'Albertha', 27, 7, 'sma', 'lajang', 9, 85, 81, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(51, 'Alyson', 28, 2, 'pasca', 'lajang', 9, 79, 81, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(52, 'Delinda', 42, 0, 'akademi', 'menikah', 10, 78, 97, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(53, 'Alessandra', 38, 3, 'sarjana', 'lajang', 10, 79, 100, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(54, 'Luigi', 40, 2, 'sarjana', 'menikah', 6, 78, 89, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(55, 'Herbert', 39, 2, 'akademi', 'lajang', 10, 72, 73, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(56, 'Kacey', 48, 1, 'sma', 'menikah', 9, 98, 76, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(57, 'Eliz', 22, 1, 'sarjana', 'lajang', 5, 90, 96, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(58, 'Karleen', 33, 4, 'akademi', 'menikah', 5, 82, 72, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(59, 'Lucienne', 46, 7, 'akademi', 'lajang', 8, 71, 98, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(60, 'Glynda', 21, 9, 'sma', 'menikah', 5, 76, 87, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(61, 'Tracy', 26, 0, 'pasca', 'lajang', 10, 93, 81, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(62, 'Janey', 23, 2, 'sarjana', 'menikah', 5, 87, 86, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(63, 'Daphine', 25, 8, 'sma', 'lajang', 9, 85, 76, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(64, 'Jacquelin', 29, 2, 'sarjana', 'lajang', 8, 91, 100, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(65, 'Timika', 38, 0, 'sma', 'menikah', 9, 71, 84, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(66, 'Pam', 34, 4, 'sarjana', 'lajang', 9, 95, 89, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(67, 'Latrina', 25, 0, 'sma', 'lajang', 7, 70, 97, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(68, 'Porsha', 44, 2, 'sma', 'lajang', 9, 100, 82, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(69, 'Carrol', 21, 0, 'sma', 'lajang', 8, 81, 77, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(70, 'Evita', 36, 8, 'sma', 'menikah', 10, 82, 70, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(71, 'Reagan', 23, 0, 'sarjana', 'lajang', 5, 82, 89, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(72, 'Quiana', 38, 1, 'pasca', 'menikah', 9, 71, 78, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(73, 'Madonna', 19, 2, 'sma', 'menikah', 5, 94, 89, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(74, 'Hilario', 50, 2, 'akademi', 'menikah', 6, 93, 87, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(75, 'Lu', 22, 0, 'sarjana', 'menikah', 10, 71, 100, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(76, 'Bruna', 40, 0, 'sma', 'menikah', 6, 74, 81, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(77, 'Juana', 26, 2, 'pasca', 'lajang', 9, 86, 71, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(78, 'Thea', 25, 0, 'pasca', 'lajang', 8, 77, 94, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(79, 'Danita', 47, 0, 'pasca', 'menikah', 10, 75, 97, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(80, 'Cordell', 33, 0, 'akademi', 'menikah', 7, 99, 79, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(81, 'Raven', 43, 0, 'sarjana', 'lajang', 7, 98, 72, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(82, 'Ellie', 39, 2, 'pasca', 'menikah', 8, 81, 74, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(83, 'Nathaniel', 35, 8, 'akademi', 'lajang', 5, 90, 93, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(84, 'Terrance', 22, 1, 'pasca', 'menikah', 7, 82, 84, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(85, 'Raymundo', 40, 1, 'pasca', 'menikah', 9, 83, 86, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(86, 'Cori', 35, 9, 'pasca', 'menikah', 6, 86, 73, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(87, 'Harriet', 38, 2, 'sarjana', 'menikah', 10, 82, 74, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(88, 'Leonia', 25, 0, 'sarjana', 'menikah', 10, 85, 76, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(89, 'Bret', 37, 1, 'pasca', 'lajang', 6, 95, 83, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(90, 'Collen', 29, 0, 'pasca', 'menikah', 6, 80, 85, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(91, 'Analisa', 32, 1, 'sma', 'menikah', 8, 91, 76, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(92, 'Leisha', 19, 0, 'akademi', 'lajang', 8, 92, 76, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(93, 'Dane', 47, 0, 'akademi', 'lajang', 9, 93, 95, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(94, 'Alethia', 39, 7, 'akademi', 'menikah', 8, 71, 84, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(95, 'Danial', 29, 0, 'sma', 'menikah', 10, 100, 84, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(96, 'Cruz', 23, 0, 'sma', 'lajang', 5, 70, 82, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(97, 'August', 19, 8, 'akademi', 'lajang', 5, 71, 78, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(98, 'Dawne', 18, 1, 'pasca', 'lajang', 10, 71, 97, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(99, 'Kyoko', 22, 9, 'sma', 'lajang', 10, 76, 70, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(100, 'Debera', 19, 0, 'akademi', 'lajang', 9, 94, 90, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(101, 'Stephen', 27, 1, 'pasca', 'menikah', 5, 97, 75, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(102, 'Yan', 31, 0, 'sma', 'lajang', 8, 95, 75, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(103, 'Dewayne', 32, 9, 'sma', 'menikah', 10, 79, 77, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(104, 'Shellie', 41, 2, 'pasca', 'lajang', 6, 90, 81, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(105, 'Phil', 34, 0, 'pasca', 'menikah', 8, 99, 90, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(106, 'Jerome', 45, 0, 'akademi', 'lajang', 8, 70, 88, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(107, 'Lindsy', 34, 1, 'pasca', 'lajang', 10, 71, 100, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(108, 'Elly', 31, 0, 'sma', 'lajang', 6, 86, 71, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(109, 'Billy', 27, 0, 'sma', 'menikah', 8, 96, 73, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(110, 'Glennie', 36, 2, 'akademi', 'lajang', 10, 79, 80, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(111, 'Dione', 47, 0, 'pasca', 'menikah', 6, 97, 73, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(112, 'Heriberto', 19, 2, 'pasca', 'menikah', 8, 91, 91, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(113, 'Farah', 42, 1, 'sma', 'menikah', 7, 70, 84, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(114, 'Frankie', 46, 0, 'akademi', 'menikah', 7, 72, 82, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(115, 'Mariella', 29, 1, 'sarjana', 'lajang', 10, 75, 100, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(116, 'Marcelina', 19, 5, 'sma', 'lajang', 8, 76, 71, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(117, 'Velva', 18, 1, 'sma', 'menikah', 6, 70, 99, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(118, 'Gretchen', 35, 1, 'sarjana', 'menikah', 10, 86, 84, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(119, 'Bobby', 45, 1, 'sma', 'lajang', 9, 86, 80, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(120, 'Iona', 30, 2, 'sarjana', 'lajang', 5, 70, 98, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(121, 'Maris', 22, 0, 'akademi', 'menikah', 10, 85, 96, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(122, 'Louetta', 43, 0, 'sarjana', 'lajang', 8, 71, 91, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(123, 'Amelia', 45, 6, 'sma', 'lajang', 7, 74, 92, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(124, 'Eldon', 30, 0, 'sarjana', 'lajang', 7, 72, 83, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(125, 'Rolanda', 37, 0, 'akademi', 'menikah', 5, 87, 72, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(126, 'Chang', 46, 7, 'sarjana', 'menikah', 6, 95, 86, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(127, 'Cory', 35, 0, 'sma', 'lajang', 6, 72, 96, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(128, 'Elvis', 32, 1, 'pasca', 'lajang', 10, 94, 87, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(129, 'Bo', 33, 10, 'pasca', 'menikah', 7, 95, 73, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(130, 'Sara', 18, 2, 'sma', 'menikah', 8, 79, 88, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(131, 'Rima', 47, 0, 'pasca', 'lajang', 5, 97, 80, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(132, 'Moriah', 20, 3, 'sma', 'menikah', 5, 72, 97, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(133, 'Cora', 20, 1, 'sma', 'menikah', 8, 71, 71, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(134, 'Scarlet', 36, 0, 'akademi', 'lajang', 9, 87, 70, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(135, 'Lilly', 20, 4, 'sarjana', 'lajang', 9, 93, 70, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(136, 'Mika', 35, 0, 'sarjana', 'menikah', 8, 97, 89, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(137, 'Yuk', 19, 0, 'pasca', 'lajang', 8, 87, 81, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(138, 'Velma', 35, 0, 'sarjana', 'lajang', 9, 93, 93, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(139, 'Filomena', 25, 2, 'pasca', 'lajang', 7, 77, 83, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(140, 'Hilary', 25, 4, 'sarjana', 'menikah', 6, 71, 84, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(141, 'Victoria', 40, 7, 'akademi', 'menikah', 7, 76, 96, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(142, 'Darline', 22, 0, 'sarjana', 'lajang', 9, 94, 78, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(143, 'Carola', 42, 8, 'pasca', 'menikah', 5, 72, 95, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(144, 'Patsy', 23, 0, 'sarjana', 'lajang', 10, 85, 90, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(145, 'Lonny', 36, 3, 'sarjana', 'menikah', 5, 95, 77, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(146, 'Marla', 22, 0, 'pasca', 'lajang', 7, 85, 76, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(147, 'Onie', 39, 7, 'sma', 'menikah', 10, 87, 82, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(148, 'Karleen', 28, 9, 'pasca', 'lajang', 10, 74, 75, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(149, 'Shanelle', 25, 0, 'sarjana', 'lajang', 7, 96, 76, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(150, 'France', 48, 7, 'sarjana', 'lajang', 9, 73, 82, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(151, 'Gladys', 18, 3, 'sma', 'lajang', 6, 72, 92, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(152, 'Lenore', 20, 6, 'sma', 'menikah', 5, 95, 85, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(153, 'Kesha', 36, 3, 'sarjana', 'menikah', 6, 77, 91, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(154, 'Donovan', 22, 10, 'sarjana', 'lajang', 9, 71, 75, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(155, 'Marti', 24, 6, 'pasca', 'lajang', 6, 79, 75, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(156, 'Mari', 22, 2, 'sma', 'menikah', 6, 99, 78, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(157, 'Brock', 45, 10, 'sma', 'menikah', 5, 82, 96, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(158, 'Salvador', 29, 10, 'akademi', 'lajang', 10, 99, 75, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(159, 'Carmella', 32, 2, 'sarjana', 'lajang', 6, 81, 81, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(160, 'Nerissa', 25, 0, 'pasca', 'lajang', 10, 74, 94, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(161, 'Bennett', 29, 0, 'sarjana', 'menikah', 8, 72, 76, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(162, 'Tona', 25, 7, 'sma', 'lajang', 8, 89, 85, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(163, 'Antonette', 42, 7, 'akademi', 'lajang', 10, 92, 74, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(164, 'Suzette', 35, 0, 'akademi', 'menikah', 7, 74, 89, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(165, 'Xochitl', 50, 1, 'pasca', 'lajang', 7, 71, 80, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(166, 'Inger', 25, 3, 'pasca', 'lajang', 7, 83, 82, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(167, 'Stan', 34, 7, 'sarjana', 'lajang', 9, 73, 88, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(168, 'Saturnina', 36, 7, 'akademi', 'menikah', 7, 81, 79, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(169, 'Toi', 38, 9, 'pasca', 'lajang', 9, 73, 92, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(170, 'Eusebio', 22, 6, 'akademi', 'lajang', 5, 97, 98, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(171, 'Solomon', 25, 2, 'pasca', 'menikah', 8, 70, 71, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(172, 'Adaline', 18, 10, 'sarjana', 'lajang', 10, 95, 79, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(173, 'Elia', 43, 0, 'sma', 'lajang', 10, 89, 70, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(174, 'Lacey', 42, 7, 'pasca', 'menikah', 10, 77, 99, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(175, 'Sallie', 22, 10, 'sarjana', 'menikah', 10, 85, 84, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(176, 'Buffy', 20, 9, 'akademi', 'menikah', 9, 100, 90, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(177, 'Maurice', 20, 5, 'akademi', 'lajang', 9, 82, 89, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(178, 'Buck', 38, 3, 'sma', 'menikah', 7, 99, 88, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(179, 'Chase', 41, 0, 'sma', 'lajang', 10, 100, 79, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(180, 'Ernesto', 21, 0, 'sarjana', 'lajang', 10, 90, 78, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(181, 'Nedra', 25, 5, 'pasca', 'lajang', 5, 100, 100, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(182, 'Lizabeth', 45, 1, 'sarjana', 'lajang', 8, 95, 75, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(183, 'Marcia', 39, 1, 'akademi', 'menikah', 10, 74, 73, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(184, 'Gilbert', 22, 2, 'sarjana', 'menikah', 8, 80, 85, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(185, 'Titus', 34, 6, 'akademi', 'menikah', 8, 86, 72, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(186, 'Orville', 34, 0, 'akademi', 'lajang', 10, 71, 78, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(187, 'Jutta', 33, 7, 'sarjana', 'lajang', 7, 80, 99, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(188, 'Sophia', 19, 0, 'pasca', 'menikah', 8, 93, 89, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(189, 'Charlie', 44, 1, 'sma', 'lajang', 6, 93, 94, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(190, 'Raul', 18, 0, 'sarjana', 'lajang', 7, 95, 91, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(191, 'Adriane', 26, 0, 'pasca', 'lajang', 10, 80, 90, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(192, 'Shaquana', 32, 1, 'sma', 'menikah', 6, 77, 96, 'sangat baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(193, 'Emmy', 33, 0, 'pasca', 'lajang', 10, 79, 74, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(194, 'Bret', 26, 0, 'akademi', 'lajang', 10, 99, 86, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(195, 'Nicki', 40, 1, 'sarjana', 'menikah', 8, 78, 88, 'baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(196, 'Clara', 18, 2, 'sarjana', 'menikah', 6, 70, 86, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(197, 'Luigi', 26, 3, 'akademi', 'lajang', 10, 83, 90, 'cukup baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(198, 'Rossie', 19, 7, 'sarjana', 'lajang', 5, 85, 81, 'cukup baik', 'gagal', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(199, 'Danelle', 48, 9, 'akademi', 'lajang', 5, 91, 87, 'baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52'),
(200, 'Melania', 48, 3, 'akademi', 'menikah', 5, 81, 81, 'sangat baik', 'lulus', '2018-08-12 18:18:52', '2018-08-12 11:18:52');

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
(13, '2018-07-11 15:18:43', '2018-07-11 08:18:43', 24, 3, 2),
(14, '2018-08-12 13:29:20', '2018-08-12 06:29:20', 2, 3, 3),
(15, '2018-08-12 13:29:20', '2018-08-12 06:29:20', 10, 3, 3),
(16, '2018-08-12 13:29:20', '2018-08-12 06:29:20', 17, 3, 3),
(17, '2018-08-12 13:29:20', '2018-08-12 06:29:20', 18, 3, 3),
(18, '2018-08-12 13:29:20', '2018-08-12 06:29:20', 20, 3, 3),
(19, '2018-08-12 13:29:20', '2018-08-12 06:29:20', 21, 3, 3),
(20, '2018-08-12 13:29:20', '2018-08-12 06:29:20', 22, 3, 3),
(21, '2018-08-12 13:29:20', '2018-08-12 06:29:20', 23, 3, 3),
(22, '2018-08-12 13:29:20', '2018-08-12 06:29:20', 24, 3, 3);

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
(1, 'Akuntansi I', 'Akuntansi I', 1, '2018-08-03 01:07:22', '2018-08-05 02:43:04', 1, 7, NULL, NULL, NULL, NULL),
(2, 'Akuntansi I', 'Akuntansi I', 1, '2018-08-12 07:26:51', '2018-08-12 20:07:37', 1, 8, NULL, NULL, NULL, NULL),
(3, 'Akuntansi I', 'Akuntansi I', 1, '2018-08-12 08:39:55', '2018-08-12 20:07:38', 2, 3, NULL, NULL, NULL, NULL);

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
(1, 'Tahap 1', '2018-08-03', '2018-08-04', '2018-08-03 01:07:22', '2018-08-02 18:07:22', 1),
(2, 'Tahap 2', '2018-08-05', '2018-08-05', '2018-08-03 01:07:22', '2018-08-05 02:42:21', 1),
(3, 'Tahap 3', '2018-08-05', '2018-08-05', '2018-08-03 01:07:22', '2018-08-05 02:42:22', 1),
(4, 'Tahap 4', '2018-08-05', '2018-08-04', '2018-08-03 01:07:22', '2018-08-05 02:42:57', 1),
(5, 'Tahap 5', '2018-08-09', '2018-08-10', '2018-08-03 01:07:22', '2018-08-02 18:07:22', 1),
(6, 'Tahap 6', '2018-08-09', '2018-08-10', '2018-08-03 01:07:22', '2018-08-02 18:07:22', 1),
(7, 'Tahap 1', '2018-08-11', '2018-08-11', '2018-08-12 07:26:52', '2018-08-12 11:54:12', 2),
(8, 'Tahap 2', '2018-08-12', '2018-08-12', '2018-08-12 07:26:52', '2018-08-12 01:50:32', 2),
(9, 'Tahap 3', '2018-08-12', '2018-08-12', '2018-08-12 07:26:52', '2018-08-12 12:11:47', 2),
(10, 'Tahap 4', '2018-08-12', '2018-08-12', '2018-08-12 07:26:52', '2018-08-12 12:15:01', 2),
(11, 'Tahap 5', '2018-08-15', '2018-08-15', '2018-08-12 07:26:52', '2018-08-12 00:26:52', 2),
(12, 'Tahap 6', '2018-08-15', '2018-08-15', '2018-08-12 07:26:52', '2018-08-12 00:26:52', 2),
(13, 'Tahap 1', '2018-08-10', '2018-08-11', '2018-08-12 08:39:55', '2018-08-12 09:55:34', 3),
(14, 'Tahap 2', '2018-08-12', '2018-08-12', '2018-08-12 08:39:55', '2018-08-12 12:22:57', 3),
(15, 'Tahap 3', '2018-08-12', '2018-08-12', '2018-08-12 08:39:55', '2018-08-12 01:39:55', 3),
(16, 'Tahap 4', '2018-08-12', '2018-08-12', '2018-08-12 08:39:55', '2018-08-12 01:39:55', 3);

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
(1, 'Standard Akuntansi', 0),
(2, 'Standar IT', 0),
(3, 'Kualifikasi Akuntansi IT', 3);

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
(1, 'edw.suryajaya@gmail.com', '5f0713b7c76ee9285a14984eeb332f43', NULL, 2, '2018-08-03 01:38:10', '2018-08-12 03:56:13', 7, 1),
(3, 'promptriney@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'u7NNOhcaMc6E0UFp5s1o2Rplj4rTWDXsLfx0WKVGaUWppL8VJFHUwFMhx2EvpkWvG5JDikY6KlMwcQezrdNMyvrALe9n1AZR21KZ', 1, '2018-08-12 18:49:26', '2018-08-12 12:26:15', 8, 11);

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
(1, '2018-08-03 01:38:10', '2018-08-02 18:38:10', 2, 1),
(2, '2018-08-03 01:38:10', '2018-08-02 18:38:10', 10, 1),
(3, '2018-08-03 01:38:10', '2018-08-02 18:38:10', 17, 1),
(4, '2018-08-03 01:38:10', '2018-08-02 18:38:10', 18, 1),
(5, '2018-08-03 01:38:10', '2018-08-02 18:38:10', 20, 1),
(6, '2018-08-03 01:38:10', '2018-08-02 18:38:10', 21, 1),
(7, '2018-08-03 01:38:10', '2018-08-02 18:38:10', 22, 1),
(8, '2018-08-03 01:38:10', '2018-08-02 18:38:10', 23, 1),
(9, '2018-08-03 01:38:10', '2018-08-02 18:38:10', 24, 1),
(10, '2018-08-12 16:51:19', '2018-08-12 09:51:19', 2, 2),
(11, '2018-08-12 16:51:19', '2018-08-12 09:51:19', 10, 2),
(12, '2018-08-12 16:51:19', '2018-08-12 09:51:19', 17, 2),
(13, '2018-08-12 16:51:19', '2018-08-12 09:51:19', 18, 2),
(14, '2018-08-12 16:51:19', '2018-08-12 09:51:19', 20, 2),
(15, '2018-08-12 16:51:19', '2018-08-12 09:51:19', 21, 2),
(16, '2018-08-12 16:51:19', '2018-08-12 09:51:19', 22, 2),
(17, '2018-08-12 16:51:19', '2018-08-12 09:51:19', 23, 2),
(18, '2018-08-12 16:51:19', '2018-08-12 09:51:19', 24, 2),
(19, '2018-08-12 18:49:26', '2018-08-12 11:49:26', 10, 3),
(20, '2018-08-12 18:49:26', '2018-08-12 11:49:26', 17, 3),
(21, '2018-08-12 18:49:26', '2018-08-12 11:49:26', 23, 3);

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
(1, 'Edward Surya Jaya', '1411112356789000', 'Serbalawan', '1997-02-02', 'Jl. Damar III', 'Medan', '20011', '085275522020', '', 21, 'pria', 'buddha', 'sarjana', 'lajang', 4, NULL, NULL, NULL, 5, 0, 'Ryan Rajaya', '0614557896', 'teman', '2018-08-03 01:38:10', '2018-08-12 06:17:55', 1),
(3, 'Christine', '1234567891234567', 'Medan', '1997-02-02', 'Yose Rizal', 'Medan', '20011', '085275522020', '', 21, 'wanita', 'buddha', 'sarjana', 'menikah', 5, 80, 80, 'sangat baik', 7, 0, 'Ryan Rajaya', '061455', 'saudara', '2018-08-12 18:49:26', '2018-08-12 12:26:15', 3);

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
(0, '2018-08-12 19:02:00', '2018-08-12 19:03:00', '2018-08-12 19:12:08', '2018-08-12 21:12:08', 3);

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
  MODIFY `id_ability` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id_admin` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `admins_sesi`
--
ALTER TABLE `admins_sesi`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `akurasi_c45_rule`
--
ALTER TABLE `akurasi_c45_rule`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT for table `akurasi_cart_rule`
--
ALTER TABLE `akurasi_cart_rule`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

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
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

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
  MODIFY `id_job` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `selection_stage`
--
ALTER TABLE `selection_stage`
  MODIFY `id_stage` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `selection_stage_detail`
--
ALTER TABLE `selection_stage_detail`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `standard_qualification`
--
ALTER TABLE `standard_qualification`
  MODIFY `id_std` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users_ability`
--
ALTER TABLE `users_ability`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users_detail`
--
ALTER TABLE `users_detail`
  MODIFY `id_d_user` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users_exam`
--
ALTER TABLE `users_exam`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
