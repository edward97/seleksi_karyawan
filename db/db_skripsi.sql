-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2018 at 11:13 AM
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
(14, 'Ryan', 'ryan@mail.com', '5f0713b7c76ee9285a14984eeb332f43', 'IT - Tech', 1, '2018-06-30 21:59:08', '2018-08-12 04:34:50');

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
(1, 'age', 'age', NULL, NULL, 'age~', '', '#ROOT'),
(2, 'age', '< 25', 1, NULL, 'age~', '=\"< 25\"~', 'stop_child'),
(3, 'age', '25-35', 1, NULL, 'age~', '=\"25-35\"~', 'stop_child'),
(4, 'age', '> 35', 1, NULL, 'age~', '=\"> 35\"~', 'stop_child'),
(5, 'last_education', 'last_education', 2, NULL, 'age~last_education~', '', '#ROOT'),
(6, 'last_education', 'sma', 5, NULL, 'age~last_education~', '=\"< 25\"~=\"sma\"~', 'stop_child'),
(7, 'last_education', 'akademi', 5, 'lulus', 'age~last_education~', '=\"< 25\"~=\"akademi\"~', 'lulus'),
(8, 'last_education', 'sarjana', 5, 'gagal', 'age~last_education~', '=\"< 25\"~=\"sarjana\"~', 'gagal'),
(9, 'last_education', 'pasca', 5, NULL, 'age~last_education~', '=\"< 25\"~=\"pasca\"~', 'stop_child'),
(10, 'nilai_sikap', 'nilai_sikap', 3, NULL, 'age~nilai_sikap~', '', '#ROOT'),
(11, 'nilai_sikap', 'cukup baik', 10, 'lulus', 'age~nilai_sikap~', '=\"25-35\"~=\"cukup baik\"~', 'lulus'),
(12, 'nilai_sikap', 'baik', 10, 'lulus', 'age~nilai_sikap~', '=\"25-35\"~=\"baik\"~', 'lulus'),
(13, 'nilai_sikap', 'sangat baik', 10, 'gagal', 'age~nilai_sikap~', '=\"25-35\"~=\"sangat baik\"~', 'gagal'),
(14, 'nilai_f2f', 'nilai_f2f', 4, NULL, 'age~nilai_f2f~', '', '#ROOT'),
(15, 'nilai_f2f', '70-79', 14, 'gagal', 'age~nilai_f2f~', '=\"> 35\"~=\"70-79\"~', 'gagal'),
(16, 'nilai_f2f', '80-89', 14, 'lulus', 'age~nilai_f2f~', '=\"> 35\"~=\"80-89\"~', 'lulus'),
(17, 'nilai_f2f', '90-100', 14, 'gagal', 'age~nilai_f2f~', '=\"> 35\"~=\"90-100\"~', 'gagal'),
(18, 'status', 'status', 6, NULL, 'age~last_education~status~', '', '#ROOT'),
(19, 'status', 'lajang', 18, 'lulus', 'age~last_education~status~', '=\"< 25\"~=\"sma\"~=\"lajang\"~', 'lulus'),
(20, 'status', 'menikah', 18, NULL, 'age~last_education~status~', '=\"< 25\"~=\"sma\"~=\"menikah\"~', 'stop_child'),
(21, 'experience', 'experience', 9, NULL, 'age~last_education~experience~', '', '#ROOT'),
(22, 'experience', '0 tahun', 21, 'lulus', 'age~last_education~experience~', '=\"< 25\"~=\"pasca\"~=\"0 tahun\"~', 'lulus'),
(23, 'experience', '1-2 tahun', 21, NULL, 'age~last_education~experience~', '=\"< 25\"~=\"pasca\"~=\"1-2 tahun\"~', 'stop_child'),
(24, 'experience', '> 2 tahun', 21, '#SKIP', 'age~last_education~experience~', '=\"< 25\"~=\"pasca\"~=\"> 2 tahun\"~', '#SKIP'),
(25, 'nilai_online', 'nilai_online', 20, NULL, 'age~last_education~status~nilai_online~', '', '#ROOT'),
(26, 'nilai_online', '70-79', 25, 'gagal', 'age~last_education~status~nilai_online~', '=\"< 25\"~=\"sma\"~=\"menikah\"~=\"70-79\"~', 'gagal'),
(27, 'nilai_online', '80-89', 25, '#SKIP', 'age~last_education~status~nilai_online~', '=\"< 25\"~=\"sma\"~=\"menikah\"~=\"80-89\"~', '#SKIP'),
(28, 'nilai_online', '90-100', 25, 'lulus', 'age~last_education~status~nilai_online~', '=\"< 25\"~=\"sma\"~=\"menikah\"~=\"90-100\"~', 'lulus'),
(29, 'nilai_sikap', 'nilai_sikap', 23, NULL, 'age~last_education~experience~nilai_sikap~', '', '#ROOT'),
(30, 'nilai_sikap', 'cukup baik', 29, 'gagal', 'age~last_education~experience~nilai_sikap~', '=\"< 25\"~=\"pasca\"~=\"1-2 tahun\"~=\"cukup baik\"~', 'gagal'),
(31, 'nilai_sikap', 'baik', 29, 'gagal', 'age~last_education~experience~nilai_sikap~', '=\"< 25\"~=\"pasca\"~=\"1-2 tahun\"~=\"baik\"~', 'gagal'),
(32, 'nilai_sikap', 'sangat baik', 29, 'lulus', 'age~last_education~experience~nilai_sikap~', '=\"< 25\"~=\"pasca\"~=\"1-2 tahun\"~=\"sangat baik\"~', 'lulus');

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
(1, 'nilai_sikap', 'nilai_sikap', '=\"sangat baik\"', '!=\"sangat baik\"', NULL, NULL, 'root', '', '', ''),
(2, 'last_education', '=\"sangat baik\"', '=\"sma\"', '!=\"sma\"', NULL, 1, 'stop', 'nilai_sikap~last_education~', '=\"sangat baik\"~=\"sma\"~', '=\"sangat baik\"~!=\"sma\"~'),
(3, 'experience', '!=\"sangat baik\"', '=\"1-2 tahun\"', '!=\"1-2 tahun\"', NULL, 1, 'stop', 'nilai_sikap~experience~', '!=\"sangat baik\"~=\"1-2 tahun\"~', '!=\"sangat baik\"~!=\"1-2 tahun\"~'),
(4, 'total_ability', '=\"sma\"', '5-7', NULL, 'gagal', 2, 'stop', '', '', ''),
(5, 'total_ability', '=\"sma\"', NULL, '5-7', 'lulus', 2, 'stop', '', '', ''),
(6, 'experience', '!=\"sma\"', '=\"1-2 tahun\"', NULL, NULL, 2, 'stop', 'nilai_sikap~last_education~~experience~', '=\"sangat baik\"~!=\"sma\"~~=\"1-2 tahun\"~', ''),
(7, 'experience', '!=\"sma\"', NULL, '1-2 tahun', 'gagal', 2, 'stop', '', '', ''),
(8, 'age', '=\"1-2 tahun\"', '< 25', NULL, 'gagal', 3, 'stop', '', '', ''),
(9, 'age', '=\"1-2 tahun\"', NULL, '!=\"< 25\"', NULL, 3, 'stop', 'nilai_sikap~experience~~age~', '', '!=\"sangat baik\"~=\"1-2 tahun\"~~!=\"< 25\"~'),
(10, 'age', '!=\"1-2 tahun\"', '=\"> 35\"', NULL, NULL, 3, 'stop', 'nilai_sikap~experience~~age~', '!=\"sangat baik\"~!=\"1-2 tahun\"~~=\"> 35\"~', ''),
(11, 'age', '!=\"1-2 tahun\"', NULL, '> 35', 'lulus', 3, 'stop', '', '', ''),
(12, 'age', '=\"1-2 tahun\"', '< 25', NULL, 'lulus', 6, 'stop', '', '', ''),
(13, 'age', '=\"1-2 tahun\"', NULL, '< 25', 'gagal', 6, 'stop', '', '', ''),
(14, 'last_education', '!=\"< 25\"', '=\"sma\"', NULL, NULL, 9, 'stop', 'nilai_sikap~experience~~age~~last_education~', '!=\"sangat baik\"~=\"1-2 tahun\"~~!=\"< 25\"~~=\"sma\"~', ''),
(15, 'last_education', '!=\"< 25\"', NULL, 'sma', 'lulus', 9, 'stop', '', '', ''),
(16, 'experience', '=\"> 35\"', '0 tahun', NULL, 'gagal', 10, 'stop', '', '', ''),
(17, 'experience', '=\"> 35\"', NULL, '0 tahun', 'lulus', 10, 'stop', '', '', ''),
(18, 'status', '=\"sma\"', 'lajang', NULL, 'gagal', 14, 'stop', '', '', ''),
(19, 'status', '=\"sma\"', NULL, 'lajang', 'lulus', 14, 'stop', '', '', '');

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
(1, 'Edward', '< 25', '1-2 tahun', 'pasca', 'menikah', '8-10', '90-100', '90-100', 'sangat baik', 1, 'lulus'),
(2, 'Ryan', '> 35', '0 tahun', 'sma', 'menikah', '8-10', '70-79', '80-89', 'sangat baik', 1, 'lulus'),
(3, 'Christine', '< 25', '> 2 tahun', 'sma', 'lajang', '8-10', '70-79', '70-79', 'sangat baik', 1, 'lulus'),
(4, 'Oba', '> 35', '> 2 tahun', 'pasca', 'menikah', '5-7', '90-100', '90-100', 'sangat baik', 1, 'gagal'),
(5, 'Calwin', '< 25', '0 tahun', 'sarjana', 'lajang', '5-7', '90-100', '90-100', 'sangat baik', 1, 'gagal'),
(6, 'Eric', '< 25', '0 tahun', 'sarjana', 'menikah', '8-10', '70-79', '90-100', 'sangat baik', 1, 'gagal'),
(7, 'Vincent', '25-35', '> 2 tahun', 'pasca', 'lajang', '8-10', '70-79', '80-89', 'sangat baik', 1, 'gagal'),
(8, 'Morris', '< 25', '> 2 tahun', 'sma', 'menikah', '5-7', '70-79', '80-89', 'sangat baik', 1, 'gagal'),
(9, 'Abok', '> 35', '1-2 tahun', 'sarjana', 'menikah', '8-10', '80-89', '70-79', 'sangat baik', 1, 'gagal'),
(10, 'Afie', '< 25', '0 tahun', 'akademi', 'lajang', '8-10', '90-100', '90-100', 'cukup baik', 1, 'lulus'),
(11, 'Harianto', '> 35', '1-2 tahun', 'sma', 'lajang', '5-7', '90-100', '90-100', 'cukup baik', 0, 'gagal'),
(12, 'Chandra', '25-35', '1-2 tahun', 'sarjana', 'lajang', '5-7', '80-89', '90-100', 'cukup baik', 1, 'lulus'),
(13, 'Steven', '25-35', '> 2 tahun', 'sma', 'lajang', '8-10', '80-89', '80-89', 'cukup baik', 1, 'lulus'),
(14, 'Atok', '> 35', '1-2 tahun', 'sma', 'menikah', '5-7', '70-79', '80-89', 'cukup baik', 0, 'lulus'),
(15, 'Justin', '25-35', '0 tahun', 'akademi', 'menikah', '5-7', '70-79', '80-89', 'cukup baik', 1, 'lulus'),
(16, 'Santoso', '< 25', '> 2 tahun', 'akademi', 'menikah', '5-7', '90-100', '70-79', 'cukup baik', 1, 'lulus'),
(17, 'Deibi', '< 25', '0 tahun', 'pasca', 'lajang', '5-7', '80-89', '70-79', 'cukup baik', 1, 'lulus'),
(18, 'Rosa', '25-35', '0 tahun', 'sarjana', 'menikah', '8-10', '70-79', '70-79', 'cukup baik', 1, 'lulus'),
(19, 'Elly', '< 25', '1-2 tahun', 'pasca', 'menikah', '8-10', '70-79', '70-79', 'cukup baik', 1, 'gagal'),
(20, 'Dewi', '25-35', '0 tahun', 'pasca', 'lajang', '8-10', '70-79', '90-100', 'baik', 1, 'lulus'),
(21, 'Citra', '25-35', '> 2 tahun', 'sarjana', 'menikah', '5-7', '70-79', '90-100', 'baik', 1, 'lulus'),
(22, 'Iyus', '< 25', '1-2 tahun', 'pasca', 'menikah', '8-10', '90-100', '90-100', 'baik', 1, 'gagal'),
(23, 'Acun', '> 35', '0 tahun', 'akademi', 'lajang', '5-7', '70-79', '90-100', 'baik', 1, 'gagal'),
(24, 'Aling', '< 25', '> 2 tahun', 'sma', 'menikah', '5-7', '90-100', '80-89', 'baik', 1, 'lulus'),
(25, 'Budi', '> 35', '1-2 tahun', 'akademi', 'menikah', '5-7', '90-100', '80-89', 'baik', 1, 'lulus'),
(26, 'Iman', '> 35', '> 2 tahun', 'sma', 'menikah', '8-10', '80-89', '80-89', 'baik', 1, 'lulus'),
(27, 'Sindy', '25-35', '> 2 tahun', 'akademi', 'menikah', '8-10', '80-89', '70-79', 'baik', 1, 'lulus');

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
(1, 'nilai_sikap', 'nilai_sikap', NULL, NULL, 'nilai_sikap~', '', '#ROOT'),
(2, 'nilai_sikap', 'cukup baik', 1, NULL, 'nilai_sikap~', '=\"cukup baik\"~', 'stop_child'),
(3, 'nilai_sikap', 'baik', 1, NULL, 'nilai_sikap~', '=\"baik\"~', 'stop_child'),
(4, 'nilai_sikap', 'sangat baik', 1, NULL, 'nilai_sikap~', '=\"sangat baik\"~', 'stop_child'),
(5, 'experience', 'experience', 2, NULL, 'nilai_sikap~experience~', '', '#ROOT'),
(6, 'experience', '0 tahun', 5, 'lulus', 'nilai_sikap~experience~', '=\"cukup baik\"~=\"0 tahun\"~', 'lulus'),
(7, 'experience', '1-2 tahun', 5, NULL, 'nilai_sikap~experience~', '=\"cukup baik\"~=\"1-2 tahun\"~', 'stop_child'),
(8, 'experience', '> 2 tahun', 5, 'lulus', 'nilai_sikap~experience~', '=\"cukup baik\"~=\"> 2 tahun\"~', 'lulus'),
(9, 'last_education', 'last_education', 3, NULL, 'nilai_sikap~last_education~', '', '#ROOT'),
(10, 'last_education', 'sma', 9, 'lulus', 'nilai_sikap~last_education~', '=\"baik\"~=\"sma\"~', 'lulus'),
(11, 'last_education', 'akademi', 9, NULL, 'nilai_sikap~last_education~', '=\"baik\"~=\"akademi\"~', 'stop_child'),
(12, 'last_education', 'sarjana', 9, 'lulus', 'nilai_sikap~last_education~', '=\"baik\"~=\"sarjana\"~', 'lulus'),
(13, 'last_education', 'pasca', 9, NULL, 'nilai_sikap~last_education~', '=\"baik\"~=\"pasca\"~', 'stop_child'),
(14, 'total_ability', 'total_ability', 4, NULL, 'nilai_sikap~total_ability~', '', '#ROOT'),
(15, 'total_ability', '5-7', 14, 'gagal', 'nilai_sikap~total_ability~', '=\"sangat baik\"~=\"5-7\"~', 'gagal'),
(16, 'total_ability', '8-10', 14, NULL, 'nilai_sikap~total_ability~', '=\"sangat baik\"~=\"8-10\"~', 'stop_child'),
(17, 'total_ability', 'total_ability', 7, NULL, 'nilai_sikap~experience~total_ability~', '', '#ROOT'),
(18, 'total_ability', '5-7', 17, NULL, 'nilai_sikap~experience~total_ability~', '=\"cukup baik\"~=\"1-2 tahun\"~=\"5-7\"~', 'stop_child'),
(19, 'total_ability', '8-10', 17, 'gagal', 'nilai_sikap~experience~total_ability~', '=\"cukup baik\"~=\"1-2 tahun\"~=\"8-10\"~', 'gagal'),
(20, 'status', 'status', 11, NULL, 'nilai_sikap~last_education~status~', '', '#ROOT'),
(21, 'status', 'lajang', 20, 'gagal', 'nilai_sikap~last_education~status~', '=\"baik\"~=\"akademi\"~=\"lajang\"~', 'gagal'),
(22, 'status', 'menikah', 20, 'lulus', 'nilai_sikap~last_education~status~', '=\"baik\"~=\"akademi\"~=\"menikah\"~', 'lulus'),
(23, 'nilai_online', 'nilai_online', 13, NULL, 'nilai_sikap~last_education~nilai_online~', '', '#ROOT'),
(24, 'nilai_online', '70-79', 23, 'lulus', 'nilai_sikap~last_education~nilai_online~', '=\"baik\"~=\"pasca\"~=\"70-79\"~', 'lulus'),
(25, 'nilai_online', '80-89', 23, '#SKIP', 'nilai_sikap~last_education~nilai_online~', '=\"baik\"~=\"pasca\"~=\"80-89\"~', '#SKIP'),
(26, 'nilai_online', '90-100', 23, 'gagal', 'nilai_sikap~last_education~nilai_online~', '=\"baik\"~=\"pasca\"~=\"90-100\"~', 'gagal'),
(27, 'last_education', 'last_education', 16, NULL, 'nilai_sikap~total_ability~last_education~', '', '#ROOT'),
(28, 'last_education', 'sma', 27, 'lulus', 'nilai_sikap~total_ability~last_education~', '=\"sangat baik\"~=\"8-10\"~=\"sma\"~', 'lulus'),
(29, 'last_education', 'akademi', 27, '#SKIP', 'nilai_sikap~total_ability~last_education~', '=\"sangat baik\"~=\"8-10\"~=\"akademi\"~', '#SKIP'),
(30, 'last_education', 'sarjana', 27, 'gagal', 'nilai_sikap~total_ability~last_education~', '=\"sangat baik\"~=\"8-10\"~=\"sarjana\"~', 'gagal'),
(31, 'last_education', 'pasca', 27, NULL, 'nilai_sikap~total_ability~last_education~', '=\"sangat baik\"~=\"8-10\"~=\"pasca\"~', 'stop_child'),
(32, 'nilai_online', 'nilai_online', 18, NULL, 'nilai_sikap~experience~total_ability~nilai_online~', '', '#ROOT'),
(33, 'nilai_online', '70-79', 32, 'lulus', 'nilai_sikap~experience~total_ability~nilai_online~', '=\"cukup baik\"~=\"1-2 tahun\"~=\"5-7\"~=\"70-79\"~', 'lulus'),
(34, 'nilai_online', '80-89', 32, 'lulus', 'nilai_sikap~experience~total_ability~nilai_online~', '=\"cukup baik\"~=\"1-2 tahun\"~=\"5-7\"~=\"80-89\"~', 'lulus'),
(35, 'nilai_online', '90-100', 32, 'gagal', 'nilai_sikap~experience~total_ability~nilai_online~', '=\"cukup baik\"~=\"1-2 tahun\"~=\"5-7\"~=\"90-100\"~', 'gagal'),
(36, 'age', 'age', 31, NULL, 'nilai_sikap~total_ability~last_education~age~', '', '#ROOT'),
(37, 'age', '< 25', 36, 'lulus', 'nilai_sikap~total_ability~last_education~age~', '=\"sangat baik\"~=\"8-10\"~=\"pasca\"~=\"< 25\"~', 'lulus'),
(38, 'age', '25-35', 36, 'gagal', 'nilai_sikap~total_ability~last_education~age~', '=\"sangat baik\"~=\"8-10\"~=\"pasca\"~=\"25-35\"~', 'gagal'),
(39, 'age', '> 35', 36, '#SKIP', 'nilai_sikap~total_ability~last_education~age~', '=\"sangat baik\"~=\"8-10\"~=\"pasca\"~=\"> 35\"~', '#SKIP');

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
(1, 'nilai_sikap', 'nilai_sikap', '=\"sangat baik\"', '!=\"sangat baik\"', NULL, NULL, 'root', '', '', ''),
(2, 'last_education', '=\"sangat baik\"', '=\"sma\"', '!=\"sma\"', NULL, 1, 'stop', 'nilai_sikap~last_education~', '=\"sangat baik\"~=\"sma\"~', '=\"sangat baik\"~!=\"sma\"~'),
(3, 'last_education', '!=\"sangat baik\"', '=\"pasca\"', '!=\"pasca\"', NULL, 1, 'stop', 'nilai_sikap~last_education~', '!=\"sangat baik\"~=\"pasca\"~', '!=\"sangat baik\"~!=\"pasca\"~'),
(4, 'total_ability', '=\"sma\"', '5-7', NULL, 'gagal', 2, 'stop', '', '', ''),
(5, 'total_ability', '=\"sma\"', NULL, '5-7', 'lulus', 2, 'stop', '', '', ''),
(6, 'experience', '!=\"sma\"', '=\"1-2 tahun\"', NULL, NULL, 2, 'stop', 'nilai_sikap~last_education~~experience~', '=\"sangat baik\"~!=\"sma\"~~=\"1-2 tahun\"~', ''),
(7, 'experience', '!=\"sma\"', NULL, '1-2 tahun', 'gagal', 2, 'stop', '', '', ''),
(8, 'nilai_online', '=\"pasca\"', '90-100', NULL, 'gagal', 3, 'stop', '', '', ''),
(9, 'nilai_online', '=\"pasca\"', NULL, '!=\"90-100\"', NULL, 3, 'stop', 'nilai_sikap~last_education~~nilai_online~', '', '!=\"sangat baik\"~=\"pasca\"~~!=\"90-100\"~'),
(10, 'age', '!=\"pasca\"', '=\"> 35\"', NULL, NULL, 3, 'stop', 'nilai_sikap~last_education~~age~', '!=\"sangat baik\"~!=\"pasca\"~~=\"> 35\"~', ''),
(11, 'age', '!=\"pasca\"', NULL, '> 35', 'lulus', 3, 'stop', '', '', ''),
(12, 'age', '=\"1-2 tahun\"', '< 25', NULL, 'lulus', 6, 'stop', '', '', ''),
(13, 'age', '=\"1-2 tahun\"', NULL, '< 25', 'gagal', 6, 'stop', '', '', ''),
(14, 'age', '!=\"90-100\"', '=\"< 25\"', NULL, NULL, 9, 'stop', 'nilai_sikap~last_education~~nilai_online~~age~', '!=\"sangat baik\"~=\"pasca\"~~!=\"90-100\"~~=\"< 25\"~', ''),
(15, 'age', '!=\"90-100\"', NULL, '< 25', 'lulus', 9, 'stop', '', '', ''),
(16, 'status', '=\"> 35\"', 'lajang', NULL, 'gagal', 10, 'stop', '', '', ''),
(17, 'status', '=\"> 35\"', NULL, 'lajang', 'lulus', 10, 'stop', '', '', ''),
(18, 'experience', '=\"< 25\"', '0 tahun', NULL, 'lulus', 14, 'stop', '', '', ''),
(19, 'experience', '=\"< 25\"', NULL, '0 tahun', 'gagal', 14, 'stop', '', '', '');

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
(1, 'Edward', 5, 5, 'akademi', 'lajang', 9, 78, 100, 'baik', 0, 'gagal', '2018-08-12 13:10:53', '2018-08-12 06:10:53');

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
(1, 'Edward', '< 25', '1-2 tahun', 'pasca', 'menikah', '8-10', '90-100', '90-100', 'sangat baik', 0, 'lulus'),
(2, 'Ryan', '> 35', '0 tahun', 'sma', 'menikah', '8-10', '70-79', '80-89', 'sangat baik', 0, 'lulus'),
(3, 'Christine', '< 25', '> 2 tahun', 'sma', 'lajang', '8-10', '70-79', '70-79', 'sangat baik', 0, 'lulus'),
(4, 'Oba', '> 35', '> 2 tahun', 'pasca', 'menikah', '5-7', '90-100', '90-100', 'sangat baik', 0, 'gagal'),
(5, 'Calwin', '< 25', '0 tahun', 'sarjana', 'lajang', '5-7', '90-100', '90-100', 'sangat baik', 0, 'gagal'),
(6, 'Eric', '< 25', '0 tahun', 'sarjana', 'menikah', '8-10', '70-79', '90-100', 'sangat baik', 0, 'gagal'),
(7, 'Vincent', '25-35', '> 2 tahun', 'pasca', 'lajang', '8-10', '70-79', '80-89', 'sangat baik', 0, 'gagal'),
(8, 'Morris', '< 25', '> 2 tahun', 'sma', 'menikah', '5-7', '70-79', '80-89', 'sangat baik', 0, 'gagal'),
(9, 'Abok', '> 35', '1-2 tahun', 'sarjana', 'menikah', '8-10', '80-89', '70-79', 'sangat baik', 0, 'gagal'),
(10, 'Afie', '< 25', '0 tahun', 'akademi', 'lajang', '8-10', '90-100', '90-100', 'cukup baik', 0, 'lulus'),
(11, 'Harianto', '> 35', '1-2 tahun', 'sma', 'lajang', '5-7', '90-100', '90-100', 'cukup baik', 0, 'gagal'),
(12, 'Chandra', '25-35', '1-2 tahun', 'sarjana', 'lajang', '5-7', '80-89', '90-100', 'cukup baik', 0, 'lulus'),
(13, 'Steven', '25-35', '> 2 tahun', 'sma', 'lajang', '8-10', '80-89', '80-89', 'cukup baik', 0, 'lulus'),
(14, 'Atok', '> 35', '1-2 tahun', 'sma', 'menikah', '5-7', '70-79', '80-89', 'cukup baik', 0, 'lulus'),
(15, 'Justin', '25-35', '0 tahun', 'akademi', 'menikah', '5-7', '70-79', '80-89', 'cukup baik', 0, 'lulus'),
(16, 'Santoso', '< 25', '> 2 tahun', 'akademi', 'menikah', '5-7', '90-100', '70-79', 'cukup baik', 0, 'lulus'),
(17, 'Deibi', '< 25', '0 tahun', 'pasca', 'lajang', '5-7', '80-89', '70-79', 'cukup baik', 0, 'lulus'),
(18, 'Rosa', '25-35', '0 tahun', 'sarjana', 'menikah', '8-10', '70-79', '70-79', 'cukup baik', 0, 'lulus'),
(19, 'Elly', '< 25', '1-2 tahun', 'pasca', 'menikah', '8-10', '70-79', '70-79', 'cukup baik', 0, 'gagal'),
(20, 'Dewi', '25-35', '0 tahun', 'pasca', 'lajang', '8-10', '70-79', '90-100', 'baik', 0, 'lulus'),
(21, 'Citra', '25-35', '> 2 tahun', 'sarjana', 'menikah', '5-7', '70-79', '90-100', 'baik', 0, 'lulus'),
(22, 'Iyus', '< 25', '1-2 tahun', 'pasca', 'menikah', '8-10', '90-100', '90-100', 'baik', 0, 'gagal'),
(23, 'Acun', '> 35', '0 tahun', 'akademi', 'lajang', '5-7', '70-79', '90-100', 'baik', 0, 'gagal'),
(24, 'Aling', '< 25', '> 2 tahun', 'sma', 'menikah', '5-7', '90-100', '80-89', 'baik', 0, 'lulus'),
(25, 'Budi', '> 35', '1-2 tahun', 'akademi', 'menikah', '5-7', '90-100', '80-89', 'baik', 0, 'lulus'),
(26, 'Iman', '> 35', '> 2 tahun', 'sma', 'menikah', '8-10', '80-89', '80-89', 'baik', 0, 'lulus'),
(27, 'Sindy', '25-35', '> 2 tahun', 'akademi', 'menikah', '8-10', '80-89', '70-79', 'baik', 0, 'lulus'),
(28, 'Tata', '> 35', '1-2 tahun', 'pasca', 'menikah', '8-10', '70-79', '70-79', 'baik', 0, 'lulus'),
(29, 'Nora', '25-35', '1-2 tahun', 'pasca', 'menikah', '5-7', '90-100', '70-79', 'baik', 0, 'gagal'),
(30, 'Apheng', '> 35', '> 2 tahun', 'pasca', 'menikah', '5-7', '90-100', '70-79', 'baik', 0, 'gagal');

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
  `id_job` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `selection_stage`
--

INSERT INTO `selection_stage` (`id_stage`, `label_online`, `label_f2f`, `status_selesai`, `created_at`, `updated_at`, `id_std`, `id_job`) VALUES
(1, 'Akuntansi I', 'Akuntansi I', 1, '2018-08-03 01:07:22', '2018-08-05 02:43:04', 1, 7),
(2, 'Akuntansi I', 'Akuntansi I', 0, '2018-08-12 07:26:51', '2018-08-12 00:26:51', 1, 8),
(3, 'Akuntansi I', 'Akuntansi I', 0, '2018-08-12 08:39:55', '2018-08-12 01:39:55', 2, 3);

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
(7, 'Tahap 1', '2018-08-12', '2018-08-12', '2018-08-12 07:26:52', '2018-08-12 00:26:52', 2),
(8, 'Tahap 2', '2018-08-12', '2018-08-12', '2018-08-12 07:26:52', '2018-08-12 01:50:32', 2),
(9, 'Tahap 3', '2018-08-14', '2018-08-14', '2018-08-12 07:26:52', '2018-08-12 01:36:22', 2),
(10, 'Tahap 4', '2018-08-18', '2018-08-31', '2018-08-12 07:26:52', '2018-08-12 01:36:12', 2),
(11, 'Tahap 5', '2018-08-15', '2018-08-15', '2018-08-12 07:26:52', '2018-08-12 00:26:52', 2),
(12, 'Tahap 6', '2018-08-15', '2018-08-15', '2018-08-12 07:26:52', '2018-08-12 00:26:52', 2),
(13, 'Tahap 1', '2018-08-10', '2018-08-12', '2018-08-12 08:39:55', '2018-08-12 05:42:39', 3),
(14, 'Tahap 2', '2018-08-12', '2018-08-12', '2018-08-12 08:39:55', '2018-08-12 01:39:55', 3),
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
(1, 'edw.suryajaya@gmail.com', '5f0713b7c76ee9285a14984eeb332f43', NULL, 2, '2018-08-03 01:38:10', '2018-08-12 03:56:13', 7, 1);

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
(9, '2018-08-03 01:38:10', '2018-08-02 18:38:10', 24, 1);

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
(1, 'Edward Surya Jaya', '1411112356789000', 'Serbalawan', '1997-02-02', 'Jl. Damar III', 'Medan', '20011', '085275522020', '', 21, 'pria', 'buddha', 'sarjana', 'lajang', 4, NULL, NULL, NULL, 5, 0, 'Ryan Rajaya', '0614557896', 'teman', '2018-08-03 01:38:10', '2018-08-12 06:17:55', 1);

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
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `akurasi_c45_rule`
--
ALTER TABLE `akurasi_c45_rule`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `akurasi_cart_rule`
--
ALTER TABLE `akurasi_cart_rule`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `akurasi_data`
--
ALTER TABLE `akurasi_data`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `atribut_detail`
--
ALTER TABLE `atribut_detail`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `c45_rule`
--
ALTER TABLE `c45_rule`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `cart_rule`
--
ALTER TABLE `cart_rule`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `dataset`
--
ALTER TABLE `dataset`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dataset_hitung`
--
ALTER TABLE `dataset_hitung`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
  MODIFY `id_user` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_ability`
--
ALTER TABLE `users_ability`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users_detail`
--
ALTER TABLE `users_detail`
  MODIFY `id_d_user` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_exam`
--
ALTER TABLE `users_exam`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
