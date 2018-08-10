-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2018 at 07:01 AM
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
(13, 'Bagian Pengawas', 7, 9, 7),
(14, 'Pengawas', 7, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `akurasi_dataset`
--

CREATE TABLE `akurasi_dataset` (
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
-- Dumping data for table `akurasi_dataset`
--

INSERT INTO `akurasi_dataset` (`id`, `nama_lengkap`, `age`, `experience`, `last_education`, `status`, `total_ability`, `nilai_online`, `nilai_f2f`, `nilai_sikap`, `flag`, `status_passed`) VALUES
(1, 'Edward', '< 25', '1-2 tahun', 'pasca', 'menikah', '8-10', '90-100', '90-100', 'sangat baik', 1, 'lulus'),
(2, 'Ryan', '> 35', '> 2 tahun', 'pasca', 'menikah', '5-7', '90-100', '90-100', 'sangat baik', 1, 'gagal'),
(3, 'Christine', '< 25', '0 tahun', 'sarjana', 'lajang', '5-7', '90-100', '90-100', 'sangat baik', 1, 'gagal'),
(4, 'Oba', '< 25', '0 tahun', 'sarjana', 'menikah', '8-10', '70-79', '90-100', 'sangat baik', 1, 'gagal'),
(5, 'Calwin', '> 35', '0 tahun', 'sma', 'menikah', '8-10', '70-79', '80-89', 'sangat baik', 1, 'lulus'),
(6, 'Eric', '< 25', '> 2 tahun', 'sma', 'menikah', '5-7', '70-79', '80-89', 'sangat baik', 1, 'gagal'),
(7, 'Vincent', '25-35', '> 2 tahun', 'pasca', 'lajang', '8-10', '70-79', '80-89', 'sangat baik', 1, 'gagal'),
(8, 'Morris', '> 35', '1-2 tahun', 'sarjana', 'menikah', '8-10', '80-89', '70-79', 'sangat baik', 1, 'gagal'),
(9, 'Abok', '< 25', '> 2 tahun', 'sma', 'lajang', '8-10', '70-79', '70-79', 'sangat baik', 1, 'lulus'),
(10, 'Afie', '< 25', '0 tahun', 'akademi', 'lajang', '8-10', '90-100', '90-100', 'cukup baik', 0, 'lulus'),
(11, 'Harianto', '> 35', '1-2 tahun', 'sma', 'lajang', '5-7', '90-100', '90-100', 'cukup baik', 1, 'gagal'),
(12, 'Chandra', '25-35', '1-2 tahun', 'sarjana', 'lajang', '5-7', '80-89', '90-100', 'cukup baik', 1, 'lulus'),
(13, 'Steven', '25-35', '> 2 tahun', 'sma', 'lajang', '8-10', '80-89', '80-89', 'cukup baik', 1, 'lulus'),
(14, 'Atok', '> 35', '1-2 tahun', 'sma', 'menikah', '5-7', '70-79', '80-89', 'cukup baik', 1, 'lulus'),
(15, 'Justin', '25-35', '0 tahun', 'akademi', 'menikah', '5-7', '70-79', '80-89', 'cukup baik', 1, 'lulus'),
(16, 'Santoso', '< 25', '> 2 tahun', 'akademi', 'menikah', '5-7', '90-100', '70-79', 'cukup baik', 0, 'lulus'),
(17, 'Deibi', '< 25', '0 tahun', 'pasca', 'lajang', '5-7', '80-89', '70-79', 'cukup baik', 0, 'lulus'),
(18, 'Rosa', '25-35', '0 tahun', 'sarjana', 'menikah', '8-10', '70-79', '70-79', 'cukup baik', 1, 'lulus'),
(19, 'Elly', '< 25', '1-2 tahun', 'pasca', 'menikah', '8-10', '70-79', '70-79', 'cukup baik', 0, 'gagal'),
(20, 'Dewi', '< 25', '1-2 tahun', 'pasca', 'menikah', '8-10', '90-100', '90-100', 'baik', 0, 'gagal'),
(21, 'Citra', '25-35', '> 2 tahun', 'sarjana', 'menikah', '5-7', '70-79', '90-100', 'baik', 1, 'lulus'),
(22, 'Iyus', '25-35', '0 tahun', 'pasca', 'lajang', '8-10', '70-79', '90-100', 'baik', 1, 'lulus'),
(23, 'Acun', '> 35', '0 tahun', 'akademi', 'lajang', '5-7', '70-79', '90-100', 'baik', 1, 'gagal'),
(24, 'Aling', '< 25', '> 2 tahun', 'sma', 'menikah', '5-7', '90-100', '80-89', 'baik', 1, 'lulus'),
(25, 'Budi', '> 35', '1-2 tahun', 'akademi', 'menikah', '5-7', '90-100', '80-89', 'baik', 1, 'lulus'),
(26, 'Iman', '> 35', '> 2 tahun', 'sma', 'menikah', '8-10', '80-89', '80-89', 'baik', 1, 'lulus'),
(27, 'Sindy', '> 35', '> 2 tahun', 'pasca', 'menikah', '5-7', '90-100', '70-79', 'baik', 1, 'gagal');

-- --------------------------------------------------------

--
-- Table structure for table `akurasi_rule`
--

CREATE TABLE `akurasi_rule` (
  `id` int(6) NOT NULL,
  `atribut` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `left_keputusan` varchar(255) DEFAULT NULL,
  `right_keputusan` varchar(255) DEFAULT NULL,
  `keputusan` varchar(255) DEFAULT NULL,
  `link` int(6) DEFAULT NULL,
  `status_hitung` varchar(255) NOT NULL,
  `atribut_cek` varchar(255) NOT NULL,
  `label_kiri` varchar(255) NOT NULL,
  `label_kanan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `akurasi_rule`
--

INSERT INTO `akurasi_rule` (`id`, `atribut`, `label`, `left_keputusan`, `right_keputusan`, `keputusan`, `link`, `status_hitung`, `atribut_cek`, `label_kiri`, `label_kanan`) VALUES
(1, 'nilai_sikap', 'nilai_sikap', '=\"sangat baik\"', '!=\"sangat baik\"', NULL, NULL, 'root', '', '', ''),
(2, 'last_education', '=\"sangat baik\"', '=\"sma\"', '!=\"sma\"', NULL, 1, 'stop', 'nilai_sikap~last_education~', '=\"sangat baik\"~=\"sma\"~', '=\"sangat baik\"~!=\"sma\"~'),
(3, 'age', '!=\"sangat baik\"', '25-35', NULL, 'lulus', 1, 'stop', '', '', ''),
(4, 'age', '!=\"sangat baik\"', NULL, '!=\"25-35\"', NULL, 1, 'stop', 'nilai_sikap~age~', '', '!=\"sangat baik\"~!=\"25-35\"~'),
(5, 'total_ability', '=\"sma\"', '5-7', NULL, 'gagal', 2, 'stop', '', '', ''),
(6, 'total_ability', '=\"sma\"', NULL, '5-7', 'lulus', 2, 'stop', '', '', ''),
(7, 'experience', '!=\"sma\"', '=\"1-2 tahun\"', NULL, NULL, 2, 'stop', 'nilai_sikap~last_education~~experience~', '=\"sangat baik\"~!=\"sma\"~~=\"1-2 tahun\"~', ''),
(8, 'experience', '!=\"sma\"', NULL, '1-2 tahun', 'gagal', 2, 'stop', '', '', ''),
(9, 'nilai_f2f', '!=\"25-35\"', '80-89', NULL, 'lulus', 4, 'stop', '', '', ''),
(10, 'nilai_f2f', '!=\"25-35\"', NULL, '!=\"80-89\"', NULL, 4, 'stop', 'nilai_sikap~age~~nilai_f2f~', '', '!=\"sangat baik\"~!=\"25-35\"~~!=\"80-89\"~'),
(11, 'age', '=\"1-2 tahun\"', '< 25', NULL, 'lulus', 7, 'stop', '', '', ''),
(12, 'age', '=\"1-2 tahun\"', NULL, '< 25', 'gagal', 7, 'stop', '', '', ''),
(13, 'age', '!=\"80-89\"', '=\"< 25\"', NULL, NULL, 10, 'stop', 'nilai_sikap~age~~nilai_f2f~~age~', '!=\"sangat baik\"~!=\"25-35\"~~!=\"80-89\"~~=\"< 25\"~', ''),
(14, 'age', '!=\"80-89\"', NULL, '< 25', 'gagal', 10, 'stop', '', '', ''),
(15, 'experience', '=\"< 25\"', '1-2 tahun', NULL, 'gagal', 13, 'stop', '', '', ''),
(16, 'experience', '=\"< 25\"', NULL, '1-2 tahun', 'lulus', 13, 'stop', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `cart_atribut_detail`
--

CREATE TABLE `cart_atribut_detail` (
  `id` int(6) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `flag` tinyint(4) NOT NULL,
  `attr` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_atribut_detail`
--

INSERT INTO `cart_atribut_detail` (`id`, `detail`, `flag`, `attr`) VALUES
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
  `atribut_cek` varchar(255) NOT NULL,
  `label_kiri` varchar(255) NOT NULL,
  `label_kanan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_rule`
--

INSERT INTO `cart_rule` (`id`, `atribut`, `label`, `left_keputusan`, `right_keputusan`, `keputusan`, `link`, `status_hitung`, `atribut_cek`, `label_kiri`, `label_kanan`) VALUES
(1, 'nilai_f2f', 'nilai_f2f', '=\"70-79\"', '!=\"70-79\"', NULL, NULL, 'root', '', '', ''),
(2, 'age', '=\"70-79\"', '=\"> 35\"', '!=\"> 35\"', NULL, 1, 'stop', 'nilai_f2f~age~', '=\"70-79\"~=\"> 35\"~', '=\"70-79\"~!=\"> 35\"~'),
(3, 'last_education', '!=\"70-79\"', '=\"sarjana\"', '!=\"sarjana\"', NULL, 1, 'stop', 'nilai_f2f~last_education~', '!=\"70-79\"~=\"sarjana\"~', '!=\"70-79\"~!=\"sarjana\"~'),
(4, 'last_education', '=\"> 35\"', '=\"akademi\"', '!=\"akademi\"', NULL, 2, 'stop', 'nilai_f2f~age~~last_education~', '=\"70-79\"~=\"> 35\"~~=\"akademi\"~', '=\"70-79\"~=\"> 35\"~~!=\"akademi\"~'),
(5, 'nilai_sikap', '!=\"> 35\"', '=\"sangat baik\"', '!=\"sangat baik\"', NULL, 2, 'stop', 'nilai_f2f~age~~nilai_sikap~', '=\"70-79\"~!=\"> 35\"~~=\"sangat baik\"~', '=\"70-79\"~!=\"> 35\"~~!=\"sangat baik\"~'),
(6, 'age', '=\"sarjana\"', '=\"25-35\"', '!=\"25-35\"', NULL, 3, 'stop', 'nilai_f2f~last_education~~age~', '!=\"70-79\"~=\"sarjana\"~~=\"25-35\"~', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~'),
(7, 'last_education', '!=\"sarjana\"', '=\"akademi\"', '!=\"akademi\"', NULL, 3, 'stop', 'nilai_f2f~last_education~~last_education~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~'),
(8, 'nilai_online', '=\"akademi\"', '70-79', NULL, 'gagal', 4, 'stop', '', '', ''),
(9, 'nilai_online', '=\"akademi\"', NULL, '!=\"70-79\"', NULL, 4, 'stop', 'nilai_f2f~age~~last_education~~nilai_online~', '', '=\"70-79\"~=\"> 35\"~~=\"akademi\"~~!=\"70-79\"~'),
(10, 'nilai_sikap', '!=\"akademi\"', '=\"sangat baik\"', '!=\"sangat baik\"', NULL, 4, 'stop', 'nilai_f2f~age~~last_education~~nilai_sikap~', '=\"70-79\"~=\"> 35\"~~!=\"akademi\"~~=\"sangat baik\"~', '=\"70-79\"~=\"> 35\"~~!=\"akademi\"~~!=\"sangat baik\"~'),
(11, 'status', '=\"sangat baik\"', 'lajang', NULL, 'lulus', 5, 'stop', '', '', ''),
(12, 'status', '=\"sangat baik\"', NULL, '!=\"lajang\"', NULL, 5, 'stop', 'nilai_f2f~age~~nilai_sikap~~status~', '', '=\"70-79\"~!=\"> 35\"~~=\"sangat baik\"~~!=\"lajang\"~'),
(13, 'last_education', '!=\"sangat baik\"', '=\"sma\"', '!=\"sma\"', NULL, 5, 'stop', 'nilai_f2f~age~~nilai_sikap~~last_education~', '=\"70-79\"~!=\"> 35\"~~!=\"sangat baik\"~~=\"sma\"~', '=\"70-79\"~!=\"> 35\"~~!=\"sangat baik\"~~!=\"sma\"~'),
(14, 'experience', '=\"25-35\"', '=\"0 tahun\"', NULL, NULL, 6, 'stop', 'nilai_f2f~last_education~~age~~experience~', '!=\"70-79\"~=\"sarjana\"~~=\"25-35\"~~=\"0 tahun\"~', ''),
(15, 'experience', '=\"25-35\"', NULL, '0 tahun', 'lulus', 6, 'stop', '', '', ''),
(16, 'nilai_sikap', '!=\"25-35\"', '=\"cukup baik\"', '!=\"cukup baik\"', NULL, 6, 'stop', 'nilai_f2f~last_education~~age~~nilai_sikap~', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~~=\"cukup baik\"~', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~~!=\"cukup baik\"~'),
(17, 'nilai_f2f', '=\"akademi\"', '=\"80-89\"', '!=\"80-89\"', NULL, 7, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~=\"80-89\"~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~'),
(18, 'experience', '!=\"akademi\"', '=\"1-2 tahun\"', '!=\"1-2 tahun\"', NULL, 7, 'stop', 'nilai_f2f~last_education~~last_education~~experience~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~'),
(19, 'experience', '!=\"70-79\"', '0 tahun', NULL, 'lulus', 9, 'stop', '', '', ''),
(20, 'experience', '!=\"70-79\"', NULL, '!=\"0 tahun\"', NULL, 9, 'stop', 'nilai_f2f~age~~last_education~~nilai_online~~experience~', '', '=\"70-79\"~=\"> 35\"~~=\"akademi\"~~!=\"70-79\"~~!=\"0 tahun\"~'),
(21, 'experience', '=\"sangat baik\"', '=\"0 tahun\"', NULL, NULL, 10, 'stop', 'nilai_f2f~age~~last_education~~nilai_sikap~~experience~', '=\"70-79\"~=\"> 35\"~~!=\"akademi\"~~=\"sangat baik\"~~=\"0 tahun\"~', ''),
(22, 'experience', '=\"sangat baik\"', NULL, '0 tahun', 'gagal', 10, 'stop', '', '', ''),
(23, 'status', '!=\"sangat baik\"', 'lajang', NULL, 'gagal', 10, 'stop', '', '', ''),
(24, 'status', '!=\"sangat baik\"', NULL, '!=\"lajang\"', NULL, 10, 'stop', 'nilai_f2f~age~~last_education~~nilai_sikap~~status~', '', '=\"70-79\"~=\"> 35\"~~!=\"akademi\"~~!=\"sangat baik\"~~!=\"lajang\"~'),
(25, 'total_ability', '!=\"lajang\"', '=\"5-7\"', NULL, NULL, 12, 'stop', 'nilai_f2f~age~~nilai_sikap~~status~~total_ability~', '=\"70-79\"~!=\"> 35\"~~=\"sangat baik\"~~!=\"lajang\"~~=\"5-7\"~', ''),
(26, 'total_ability', '!=\"lajang\"', NULL, '5-7', 'gagal', 12, 'stop', '', '', ''),
(27, 'nilai_sikap', '=\"sma\"', 'cukup baik', NULL, 'gagal', 13, 'stop', '', '', ''),
(28, 'nilai_sikap', '=\"sma\"', NULL, '!=\"cukup baik\"', NULL, 13, 'stop', 'nilai_f2f~age~~nilai_sikap~~last_education~~nilai_sikap~', '', '=\"70-79\"~!=\"> 35\"~~!=\"sangat baik\"~~=\"sma\"~~!=\"cukup baik\"~'),
(29, 'experience', '!=\"sma\"', '=\"0 tahun\"', '!=\"0 tahun\"', NULL, 13, 'stop', 'nilai_f2f~age~~nilai_sikap~~last_education~~experience~', '=\"70-79\"~!=\"> 35\"~~!=\"sangat baik\"~~!=\"sma\"~~=\"0 tahun\"~', '=\"70-79\"~!=\"> 35\"~~!=\"sangat baik\"~~!=\"sma\"~~!=\"0 tahun\"~'),
(30, 'total_ability', '=\"0 tahun\"', '5-7', NULL, 'gagal', 14, 'stop', '', '', ''),
(31, 'total_ability', '=\"0 tahun\"', NULL, '5-7', 'lulus', 14, 'stop', '', '', ''),
(32, 'experience', '=\"cukup baik\"', '1-2 tahun', NULL, 'lulus', 16, 'stop', '', '', ''),
(33, 'experience', '=\"cukup baik\"', NULL, '1-2 tahun', 'gagal', 16, 'stop', '', '', ''),
(34, 'total_ability', '!=\"cukup baik\"', '=\"5-7\"', '!=\"5-7\"', NULL, 16, 'stop', 'nilai_f2f~last_education~~age~~nilai_sikap~~total_ability~', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~~!=\"cukup baik\"~~=\"5-7\"~', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~~!=\"cukup baik\"~~!=\"5-7\"~'),
(35, 'age', '=\"80-89\"', '=\"25-35\"', NULL, NULL, 17, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~~age~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~=\"80-89\"~~=\"25-35\"~', ''),
(36, 'age', '=\"80-89\"', NULL, '25-35', 'lulus', 17, 'stop', '', '', ''),
(37, 'nilai_sikap', '!=\"80-89\"', '=\"cukup baik\"', '!=\"cukup baik\"', NULL, 17, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~~nilai_sikap~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~~=\"cukup baik\"~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~~!=\"cukup baik\"~'),
(38, 'total_ability', '=\"1-2 tahun\"', '=\"5-7\"', '!=\"5-7\"', NULL, 18, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~=\"5-7\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~'),
(39, 'total_ability', '!=\"1-2 tahun\"', '=\"5-7\"', '!=\"5-7\"', NULL, 18, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~'),
(40, 'status', '!=\"0 tahun\"', 'lajang', NULL, 'lulus', 20, 'stop', '', '', ''),
(41, 'status', '!=\"0 tahun\"', NULL, 'lajang', 'gagal', 20, 'stop', '', '', ''),
(42, 'last_education', '=\"0 tahun\"', 'sarjana', NULL, 'lulus', 21, 'stop', '', '', ''),
(43, 'last_education', '=\"0 tahun\"', NULL, 'sarjana', 'gagal', 21, 'stop', '', '', ''),
(44, 'last_education', '!=\"lajang\"', 'sma', NULL, 'lulus', 24, 'stop', '', '', ''),
(45, 'last_education', '!=\"lajang\"', NULL, '!=\"sma\"', NULL, 24, 'stop', 'nilai_f2f~age~~last_education~~nilai_sikap~~status~~last_education~', '', '=\"70-79\"~=\"> 35\"~~!=\"akademi\"~~!=\"sangat baik\"~~!=\"lajang\"~~!=\"sma\"~'),
(46, 'experience', '=\"5-7\"', '=\"1-2 tahun\"', NULL, NULL, 25, 'stop', 'nilai_f2f~age~~nilai_sikap~~status~~total_ability~~experience~', '=\"70-79\"~!=\"> 35\"~~=\"sangat baik\"~~!=\"lajang\"~~=\"5-7\"~~=\"1-2 tahun\"~', ''),
(47, 'experience', '=\"5-7\"', NULL, '1-2 tahun', 'lulus', 25, 'stop', '', '', ''),
(48, 'nilai_online', '!=\"cukup baik\"', '90-100', NULL, 'gagal', 28, 'stop', '', '', ''),
(49, 'nilai_online', '!=\"cukup baik\"', NULL, '!=\"90-100\"', NULL, 28, 'stop', 'nilai_f2f~age~~nilai_sikap~~last_education~~nilai_sikap~~nilai_online~', '', '=\"70-79\"~!=\"> 35\"~~!=\"sangat baik\"~~=\"sma\"~~!=\"cukup baik\"~~!=\"90-100\"~'),
(50, 'last_education', '=\"0 tahun\"', 'akademi', NULL, 'lulus', 29, 'stop', '', '', ''),
(51, 'last_education', '=\"0 tahun\"', NULL, '!=\"akademi\"', NULL, 29, 'stop', 'nilai_f2f~age~~nilai_sikap~~last_education~~experience~~last_education~', '', '=\"70-79\"~!=\"> 35\"~~!=\"sangat baik\"~~!=\"sma\"~~=\"0 tahun\"~~!=\"akademi\"~'),
(52, 'status', '!=\"0 tahun\"', '=\"lajang\"', '!=\"lajang\"', NULL, 29, 'stop', 'nilai_f2f~age~~nilai_sikap~~last_education~~experience~~status~', '=\"70-79\"~!=\"> 35\"~~!=\"sangat baik\"~~!=\"sma\"~~!=\"0 tahun\"~~=\"lajang\"~', '=\"70-79\"~!=\"> 35\"~~!=\"sangat baik\"~~!=\"sma\"~~!=\"0 tahun\"~~!=\"lajang\"~'),
(53, 'experience', '=\"5-7\"', '=\"0 tahun\"', NULL, NULL, 34, 'stop', 'nilai_f2f~last_education~~age~~nilai_sikap~~total_ability~~experience~', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~~!=\"cukup baik\"~~=\"5-7\"~~=\"0 tahun\"~', ''),
(54, 'experience', '=\"5-7\"', NULL, '0 tahun', 'lulus', 34, 'stop', '', '', ''),
(55, 'status', '!=\"5-7\"', 'lajang', NULL, 'lulus', 34, 'stop', '', '', ''),
(56, 'status', '!=\"5-7\"', NULL, '!=\"lajang\"', NULL, 34, 'stop', 'nilai_f2f~last_education~~age~~nilai_sikap~~total_ability~~status~', '', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~~!=\"cukup baik\"~~!=\"5-7\"~~!=\"lajang\"~'),
(57, 'experience', '=\"25-35\"', '0 tahun', NULL, 'lulus', 35, 'stop', '', '', ''),
(58, 'experience', '=\"25-35\"', NULL, '!=\"0 tahun\"', NULL, 35, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~~age~~experience~', '', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~=\"80-89\"~~=\"25-35\"~~!=\"0 tahun\"~'),
(59, 'age', '=\"cukup baik\"', '=\"> 35\"', NULL, NULL, 37, 'stop', 'nilai_f2f~last_education~~last_education~~nilai_f2f~~nilai_sikap~~age~', '!=\"70-79\"~!=\"sarjana\"~~=\"akademi\"~~!=\"80-89\"~~=\"cukup baik\"~~=\"> 35\"~', ''),
(60, 'age', '=\"cukup baik\"', NULL, '> 35', 'lulus', 37, 'stop', '', '', ''),
(61, 'total_ability', '!=\"cukup baik\"', '5-7', NULL, 'lulus', 37, 'stop', '', '', ''),
(62, 'total_ability', '!=\"cukup baik\"', NULL, '5-7', 'gagal', 37, 'stop', '', '', ''),
(63, 'age', '=\"5-7\"', '=\"> 35\"', NULL, NULL, 38, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~age~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~=\"5-7\"~~=\"> 35\"~', ''),
(64, 'age', '=\"5-7\"', NULL, '> 35', 'gagal', 38, 'stop', '', '', ''),
(65, 'nilai_sikap', '!=\"5-7\"', '=\"sangat baik\"', '!=\"sangat baik\"', NULL, 38, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_sikap~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~~=\"sangat baik\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~~!=\"sangat baik\"~'),
(66, 'last_education', '=\"5-7\"', '=\"sma\"', '!=\"sma\"', NULL, 39, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~=\"sma\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~!=\"sma\"~'),
(67, 'nilai_online', '!=\"5-7\"', '90-100', NULL, 'gagal', 39, 'stop', '', '', ''),
(68, 'nilai_online', '!=\"5-7\"', NULL, '!=\"90-100\"', NULL, 39, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_online~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"90-100\"~'),
(69, 'nilai_online', '!=\"sma\"', '70-79', NULL, 'lulus', 45, 'stop', '', '', ''),
(70, 'nilai_online', '!=\"sma\"', NULL, '70-79', 'gagal', 45, 'stop', '', '', ''),
(71, 'age', '=\"1-2 tahun\"', '< 25', NULL, 'lulus', 46, 'stop', '', '', ''),
(72, 'age', '=\"1-2 tahun\"', NULL, '< 25', 'gagal', 46, 'stop', '', '', ''),
(73, 'experience', '!=\"90-100\"', '=\"0 tahun\"', NULL, NULL, 49, 'stop', 'nilai_f2f~age~~nilai_sikap~~last_education~~nilai_sikap~~nilai_online~~experience~', '=\"70-79\"~!=\"> 35\"~~!=\"sangat baik\"~~=\"sma\"~~!=\"cukup baik\"~~!=\"90-100\"~~=\"0 tahun\"~', ''),
(74, 'experience', '!=\"90-100\"', NULL, '0 tahun', 'lulus', 49, 'stop', '', '', ''),
(75, 'nilai_online', '!=\"akademi\"', '90-100', NULL, 'gagal', 51, 'stop', '', '', ''),
(76, 'nilai_online', '!=\"akademi\"', NULL, '!=\"90-100\"', NULL, 51, 'stop', 'nilai_f2f~age~~nilai_sikap~~last_education~~experience~~last_education~~nilai_online~', '', '=\"70-79\"~!=\"> 35\"~~!=\"sangat baik\"~~!=\"sma\"~~=\"0 tahun\"~~!=\"akademi\"~~!=\"90-100\"~'),
(77, 'age', '=\"lajang\"', '=\"< 25\"', '!=\"< 25\"', NULL, 52, 'stop', 'nilai_f2f~age~~nilai_sikap~~last_education~~experience~~status~~age~', '=\"70-79\"~!=\"> 35\"~~!=\"sangat baik\"~~!=\"sma\"~~!=\"0 tahun\"~~=\"lajang\"~~=\"< 25\"~', '=\"70-79\"~!=\"> 35\"~~!=\"sangat baik\"~~!=\"sma\"~~!=\"0 tahun\"~~=\"lajang\"~~!=\"< 25\"~'),
(78, 'experience', '!=\"lajang\"', '=\"1-2 tahun\"', '!=\"1-2 tahun\"', NULL, 52, 'stop', 'nilai_f2f~age~~nilai_sikap~~last_education~~experience~~status~~experience~', '=\"70-79\"~!=\"> 35\"~~!=\"sangat baik\"~~!=\"sma\"~~!=\"0 tahun\"~~!=\"lajang\"~~=\"1-2 tahun\"~', '=\"70-79\"~!=\"> 35\"~~!=\"sangat baik\"~~!=\"sma\"~~!=\"0 tahun\"~~!=\"lajang\"~~!=\"1-2 tahun\"~'),
(79, 'nilai_online', '=\"0 tahun\"', '90-100', NULL, 'gagal', 53, 'stop', '', '', ''),
(80, 'nilai_online', '=\"0 tahun\"', NULL, '90-100', 'lulus', 53, 'stop', '', '', ''),
(81, 'age', '!=\"lajang\"', '=\"< 25\"', NULL, NULL, 56, 'stop', 'nilai_f2f~last_education~~age~~nilai_sikap~~total_ability~~status~~age~', '!=\"70-79\"~=\"sarjana\"~~!=\"25-35\"~~!=\"cukup baik\"~~!=\"5-7\"~~!=\"lajang\"~~=\"< 25\"~', ''),
(82, 'age', '!=\"lajang\"', NULL, '< 25', 'gagal', 56, 'stop', '', '', ''),
(83, 'status', '!=\"0 tahun\"', 'lajang', NULL, 'lulus', 58, 'stop', '', '', ''),
(84, 'status', '!=\"0 tahun\"', NULL, 'lajang', 'gagal', 58, 'stop', '', '', ''),
(85, 'experience', '=\"> 35\"', '0 tahun', NULL, 'gagal', 59, 'stop', '', '', ''),
(86, 'experience', '=\"> 35\"', NULL, '0 tahun', 'lulus', 59, 'stop', '', '', ''),
(87, 'status', '=\"> 35\"', '=\"lajang\"', NULL, NULL, 63, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~age~~status~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~=\"5-7\"~~=\"> 35\"~~=\"lajang\"~', ''),
(88, 'status', '=\"> 35\"', NULL, 'lajang', 'lulus', 63, 'stop', '', '', ''),
(89, 'status', '=\"sangat baik\"', 'lajang', NULL, 'lulus', 65, 'stop', '', '', ''),
(90, 'status', '=\"sangat baik\"', NULL, '!=\"lajang\"', NULL, 65, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_sikap~~status~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~=\"1-2 tahun\"~~!=\"5-7\"~~=\"sangat baik\"~~!=\"lajang\"~'),
(91, 'age', '!=\"sangat baik\"', '25-35', NULL, 'lulus', 65, 'stop', '', '', ''),
(92, 'age', '!=\"sangat baik\"', NULL, '25-35', 'gagal', 65, 'stop', '', '', ''),
(93, 'experience', '=\"sma\"', '=\"0 tahun\"', '!=\"0 tahun\"', NULL, 66, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~experience~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~=\"sma\"~~=\"0 tahun\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~=\"sma\"~~!=\"0 tahun\"~'),
(94, 'age', '!=\"sma\"', '25-35', NULL, 'lulus', 66, 'stop', '', '', ''),
(95, 'age', '!=\"sma\"', NULL, '!=\"25-35\"', NULL, 66, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~age~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~!=\"sma\"~~!=\"25-35\"~'),
(96, 'experience', '!=\"90-100\"', '=\"0 tahun\"', '!=\"0 tahun\"', NULL, 68, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_online~~experience~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"90-100\"~~=\"0 tahun\"~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"90-100\"~~!=\"0 tahun\"~'),
(97, 'nilai_online', '=\"0 tahun\"', '70-79', NULL, 'gagal', 73, 'stop', '', '', ''),
(98, 'nilai_online', '=\"0 tahun\"', NULL, '70-79', 'lulus', 73, 'stop', '', '', ''),
(99, 'age', '!=\"90-100\"', '=\"< 25\"', NULL, NULL, 76, 'stop', 'nilai_f2f~age~~nilai_sikap~~last_education~~experience~~last_education~~nilai_online~~age~', '=\"70-79\"~!=\"> 35\"~~!=\"sangat baik\"~~!=\"sma\"~~=\"0 tahun\"~~!=\"akademi\"~~!=\"90-100\"~~=\"< 25\"~', ''),
(100, 'age', '!=\"90-100\"', NULL, '< 25', 'lulus', 76, 'stop', '', '', ''),
(101, 'nilai_online', '=\"< 25\"', '80-89', NULL, 'lulus', 77, 'stop', '', '', ''),
(102, 'nilai_online', '=\"< 25\"', NULL, '80-89', 'gagal', 77, 'stop', '', '', ''),
(103, 'nilai_online', '!=\"< 25\"', '80-89', NULL, 'gagal', 77, 'stop', '', '', ''),
(104, 'nilai_online', '!=\"< 25\"', NULL, '!=\"80-89\"', NULL, 77, 'stop', 'nilai_f2f~age~~nilai_sikap~~last_education~~experience~~status~~age~~nilai_online~', '', '=\"70-79\"~!=\"> 35\"~~!=\"sangat baik\"~~!=\"sma\"~~!=\"0 tahun\"~~=\"lajang\"~~!=\"< 25\"~~!=\"80-89\"~'),
(105, 'nilai_online', '=\"1-2 tahun\"', '80-89', NULL, 'lulus', 78, 'stop', '', '', ''),
(106, 'nilai_online', '=\"1-2 tahun\"', NULL, '80-89', 'gagal', 78, 'stop', '', '', ''),
(107, 'nilai_sikap', '!=\"1-2 tahun\"', 'cukup baik', NULL, 'lulus', 78, 'stop', '', '', ''),
(108, 'nilai_sikap', '!=\"1-2 tahun\"', NULL, '!=\"cukup baik\"', NULL, 78, 'stop', 'nilai_f2f~age~~nilai_sikap~~last_education~~experience~~status~~experience~~nilai_sikap~', '', '=\"70-79\"~!=\"> 35\"~~!=\"sangat baik\"~~!=\"sma\"~~!=\"0 tahun\"~~!=\"lajang\"~~!=\"1-2 tahun\"~~!=\"cukup baik\"~'),
(109, 'nilai_f2f', '=\"< 25\"', '80-89', NULL, 'lulus', 81, 'stop', '', '', ''),
(110, 'nilai_f2f', '=\"< 25\"', NULL, '80-89', 'gagal', 81, 'stop', '', '', ''),
(111, 'nilai_sikap', '=\"lajang\"', 'baik', NULL, 'lulus', 87, 'stop', '', '', ''),
(112, 'nilai_sikap', '=\"lajang\"', NULL, 'baik', 'gagal', 87, 'stop', '', '', ''),
(113, 'last_education', '!=\"lajang\"', 'sma', NULL, 'gagal', 90, 'stop', '', '', ''),
(114, 'last_education', '!=\"lajang\"', NULL, 'sma', 'lulus', 90, 'stop', '', '', ''),
(115, 'age', '=\"0 tahun\"', '=\"25-35\"', NULL, NULL, 93, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~experience~~age~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~=\"sma\"~~=\"0 tahun\"~~=\"25-35\"~', ''),
(116, 'age', '=\"0 tahun\"', NULL, '25-35', 'gagal', 93, 'stop', '', '', ''),
(117, 'age', '!=\"0 tahun\"', '25-35', NULL, 'gagal', 93, 'stop', '', '', ''),
(118, 'age', '!=\"0 tahun\"', NULL, '!=\"25-35\"', NULL, 93, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~last_education~~experience~~age~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~=\"5-7\"~~=\"sma\"~~!=\"0 tahun\"~~!=\"25-35\"~'),
(119, 'nilai_sikap', '!=\"25-35\"', 'sangat baik', NULL, 'gagal', 95, 'stop', '', '', ''),
(120, 'nilai_sikap', '!=\"25-35\"', NULL, 'sangat baik', 'lulus', 95, 'stop', '', '', ''),
(121, 'status', '=\"0 tahun\"', '=\"lajang\"', NULL, NULL, 96, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_online~~experience~~status~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"90-100\"~~=\"0 tahun\"~~=\"lajang\"~', ''),
(122, 'status', '=\"0 tahun\"', NULL, 'lajang', 'lulus', 96, 'stop', '', '', ''),
(123, 'last_education', '!=\"0 tahun\"', '=\"sma\"', NULL, NULL, 96, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_online~~experience~~last_education~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"90-100\"~~!=\"0 tahun\"~~=\"sma\"~', ''),
(124, 'last_education', '!=\"0 tahun\"', NULL, 'sma', 'gagal', 96, 'stop', '', '', ''),
(125, 'total_ability', '=\"< 25\"', '5-7', NULL, 'lulus', 99, 'stop', '', '', ''),
(126, 'total_ability', '=\"< 25\"', NULL, '5-7', 'gagal', 99, 'stop', '', '', ''),
(127, 'nilai_sikap', '!=\"80-89\"', '=\"cukup baik\"', '!=\"cukup baik\"', NULL, 104, 'stop', 'nilai_f2f~age~~nilai_sikap~~last_education~~experience~~status~~age~~nilai_online~~nilai_sikap~', '=\"70-79\"~!=\"> 35\"~~!=\"sangat baik\"~~!=\"sma\"~~!=\"0 tahun\"~~=\"lajang\"~~!=\"< 25\"~~!=\"80-89\"~~=\"cukup baik\"~', '=\"70-79\"~!=\"> 35\"~~!=\"sangat baik\"~~!=\"sma\"~~!=\"0 tahun\"~~=\"lajang\"~~!=\"< 25\"~~!=\"80-89\"~~!=\"cukup baik\"~'),
(128, 'total_ability', '!=\"cukup baik\"', '5-7', NULL, 'gagal', 108, 'stop', '', '', ''),
(129, 'total_ability', '!=\"cukup baik\"', NULL, '5-7', 'lulus', 108, 'stop', '', '', ''),
(130, 'nilai_sikap', '=\"25-35\"', 'cukup baik', NULL, 'lulus', 115, 'stop', '', '', ''),
(131, 'nilai_sikap', '=\"25-35\"', NULL, 'cukup baik', 'gagal', 115, 'stop', '', '', ''),
(132, 'nilai_f2f', '!=\"25-35\"', '80-89', NULL, 'lulus', 118, 'stop', '', '', ''),
(133, 'nilai_f2f', '!=\"25-35\"', NULL, '80-89', 'lulus', 118, 'stop', '', '', ''),
(134, 'nilai_sikap', '=\"lajang\"', 'cukup baik', NULL, 'lulus', 121, 'stop', '', '', ''),
(135, 'nilai_sikap', '=\"lajang\"', NULL, '!=\"cukup baik\"', NULL, 121, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_online~~experience~~status~~nilai_sikap~', '', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"90-100\"~~=\"0 tahun\"~~=\"lajang\"~~!=\"cukup baik\"~'),
(136, 'nilai_sikap', '=\"sma\"', 'sangat baik', NULL, 'gagal', 123, 'stop', '', '', ''),
(137, 'nilai_sikap', '=\"sma\"', NULL, 'sangat baik', 'lulus', 123, 'stop', '', '', ''),
(138, 'nilai_online', '=\"cukup baik\"', '70-79', NULL, 'gagal', 127, 'stop', '', '', ''),
(139, 'nilai_online', '=\"cukup baik\"', NULL, '70-79', 'lulus', 127, 'stop', '', '', ''),
(140, 'last_education', '!=\"cukup baik\"', 'akademi', NULL, 'gagal', 127, 'stop', '', '', ''),
(141, 'last_education', '!=\"cukup baik\"', NULL, 'akademi', 'lulus', 127, 'stop', '', '', ''),
(142, 'age', '!=\"cukup baik\"', '=\"25-35\"', NULL, NULL, 135, 'stop', 'nilai_f2f~last_education~~last_education~~experience~~total_ability~~nilai_online~~experience~~status~~nilai_sikap~~age~', '!=\"70-79\"~!=\"sarjana\"~~!=\"akademi\"~~!=\"1-2 tahun\"~~!=\"5-7\"~~!=\"90-100\"~~=\"0 tahun\"~~=\"lajang\"~~!=\"cukup baik\"~~=\"25-35\"~', ''),
(143, 'age', '!=\"cukup baik\"', NULL, '25-35', 'gagal', 135, 'stop', '', '', ''),
(144, 'nilai_online', '=\"25-35\"', '70-79', NULL, 'gagal', 142, 'stop', '', '', ''),
(145, 'nilai_online', '=\"25-35\"', NULL, '70-79', 'lulus', 142, 'stop', '', '', '');

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
(1, 'Saucycool', 24, 0, 'pasca', 'lajang', 9, 71, 77, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(2, 'Verifyspoken', 21, 2, 'pasca', 'menikah', 8, 98, 95, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(3, 'Iranianprivacy', 32, 0, 'akademi', 'lajang', 7, 74, 10, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(4, 'Bitswhirr', 28, 0, 'sma', 'lajang', 6, 77, 74, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(5, 'Icyblind', 28, 9, 'akademi', 'menikah', 5, 89, 84, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(6, 'Thornebarber', 39, 8, 'pasca', 'menikah', 9, 78, 82, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(7, 'Rawfishhighlight', 48, 6, 'sma', 'lajang', 6, 71, 76, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(8, 'Rulespeafowl', 45, 2, 'sarjana', 'lajang', 10, 91, 97, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(9, 'Bimmingpulp', 35, 8, 'sarjana', 'menikah', 9, 88, 80, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(10, 'Brubbingtiding', 47, 0, 'pasca', 'lajang', 8, 84, 86, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(11, 'Discsubstr', 25, 1, 'pasca', 'menikah', 6, 80, 85, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(12, 'Mapdangerous', 32, 0, 'pasca', 'lajang', 6, 93, 95, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(13, 'Cheaksoup', 29, 0, 'sarjana', 'lajang', 5, 84, 78, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(14, 'Squeezeshallot', 39, 0, 'akademi', 'lajang', 5, 77, 10, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(15, 'Positionballer', 20, 9, 'akademi', 'menikah', 6, 96, 77, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(16, 'Truemeridian', 38, 0, 'sma', 'lajang', 8, 77, 97, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(17, 'Palettewere', 43, 10, 'pasca', 'menikah', 6, 98, 72, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(18, 'Stringcerebrum', 35, 0, 'akademi', 'lajang', 9, 79, 76, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(19, 'Coteriepiper', 18, 0, 'sarjana', 'menikah', 7, 10, 76, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(20, 'Cinemadunking', 30, 7, 'pasca', 'lajang', 8, 79, 83, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(21, 'Pushymanchester', 29, 1, 'sma', 'lajang', 5, 93, 94, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(22, 'Thumbsupsushi', 21, 0, 'pasca', 'lajang', 9, 75, 94, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(23, 'Pechoratree', 27, 1, 'pasca', 'menikah', 9, 89, 70, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(24, 'Psychoscale', 36, 0, 'sarjana', 'lajang', 7, 93, 87, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(25, 'Hoesbiping', 24, 10, 'pasca', 'lajang', 9, 86, 78, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(26, 'Corybread', 32, 0, 'sma', 'menikah', 8, 78, 78, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(27, 'Croodeneconomic', 28, 7, 'akademi', 'lajang', 8, 70, 94, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(28, 'Fatteredacid', 32, 5, 'sarjana', 'menikah', 5, 76, 96, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(29, 'Fryerfooted', 49, 6, 'pasca', 'menikah', 10, 90, 80, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(30, 'Bocolateinterval', 28, 5, 'sarjana', 'lajang', 8, 74, 74, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(31, 'Sidlawspity', 33, 7, 'sma', 'lajang', 6, 85, 98, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(32, 'Doadingrecord', 49, 3, 'sarjana', 'menikah', 5, 89, 72, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(33, 'Crimpboffee', 28, 0, 'sarjana', 'lajang', 8, 84, 80, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(34, 'Jobmeggings', 47, 5, 'pasca', 'menikah', 7, 95, 97, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(35, 'Anchovyfoal', 49, 1, 'akademi', 'lajang', 10, 78, 89, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(36, 'Memorablebrillo', 46, 0, 'sma', 'lajang', 7, 75, 79, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(37, 'Bitternmaul', 27, 4, 'akademi', 'lajang', 9, 80, 80, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(38, 'Turkeyredox', 48, 0, 'sarjana', 'lajang', 5, 76, 95, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(39, 'Savannaconcerned', 25, 3, 'akademi', 'menikah', 9, 93, 74, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(40, 'Whitingsabine', 20, 3, 'sarjana', 'menikah', 8, 86, 92, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(41, 'Brakepod', 25, 2, 'sma', 'menikah', 5, 95, 72, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(42, 'Bongueacross', 20, 3, 'akademi', 'menikah', 8, 79, 91, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(43, 'Viafax', 40, 1, 'akademi', 'lajang', 10, 98, 98, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(44, 'Entertaininvalid', 32, 2, 'sma', 'lajang', 6, 72, 99, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(45, 'Mosquitoeadvise', 22, 0, 'pasca', 'menikah', 8, 80, 90, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(46, 'Passeddopping', 24, 1, 'sma', 'lajang', 8, 99, 92, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(47, 'Beautifulprey', 28, 2, 'sarjana', 'lajang', 9, 85, 76, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(48, 'Wingfreeboard', 46, 2, 'sma', 'lajang', 8, 76, 89, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(49, 'Yearlyyob', 29, 7, 'pasca', 'lajang', 6, 74, 77, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(50, 'Presumablytuit', 27, 7, 'sma', 'lajang', 9, 85, 81, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(51, 'Lurgerpassed', 28, 2, 'pasca', 'lajang', 9, 79, 81, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(52, 'Fruitypublic', 42, 0, 'akademi', 'menikah', 10, 78, 97, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(53, 'Cystslink', 38, 3, 'sarjana', 'lajang', 10, 79, 10, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(54, 'Skatesubway', 40, 2, 'sarjana', 'menikah', 6, 78, 89, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(55, 'Armstoke', 39, 2, 'akademi', 'lajang', 10, 72, 73, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(56, 'Crogssailboat', 48, 1, 'sma', 'menikah', 9, 98, 76, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(57, 'Solitarycommand', 22, 1, 'sarjana', 'lajang', 5, 90, 96, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(58, 'Wildernesspizza', 33, 4, 'akademi', 'menikah', 5, 82, 72, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(59, 'Pencildove', 46, 7, 'akademi', 'lajang', 8, 71, 98, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(60, 'Sponsonstethoscope', 21, 9, 'sma', 'menikah', 5, 76, 87, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(61, 'Hodgkinmop', 26, 0, 'pasca', 'lajang', 10, 93, 81, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(62, 'Huygensbiathlon', 23, 2, 'sarjana', 'menikah', 5, 87, 86, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(63, 'Steamkoiled', 25, 8, 'sma', 'lajang', 9, 85, 76, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(64, 'Juddingoral', 29, 2, 'sarjana', 'lajang', 8, 91, 10, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(65, 'Chimneymouthguard', 38, 0, 'sma', 'menikah', 9, 71, 84, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(66, 'Fragmentfailure', 34, 4, 'sarjana', 'lajang', 9, 95, 89, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(67, 'Handballaware', 25, 0, 'sma', 'lajang', 7, 70, 97, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(68, 'Sociabletosh', 44, 2, 'sma', 'lajang', 9, 10, 82, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(69, 'Predictgovernance', 21, 0, 'sma', 'lajang', 8, 81, 77, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(70, 'Siblingsfur', 36, 8, 'sma', 'menikah', 10, 82, 70, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(71, 'Scottishslead', 23, 0, 'sarjana', 'lajang', 5, 82, 89, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(72, 'Orbitlithuanian', 38, 1, 'pasca', 'menikah', 9, 71, 78, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(73, 'Trolleytrackball', 19, 2, 'sma', 'menikah', 5, 94, 89, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(74, 'Tilerjukebox', 50, 2, 'akademi', 'menikah', 6, 93, 87, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(75, 'Discretemalicious', 22, 0, 'sarjana', 'menikah', 10, 71, 10, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(76, 'Climatesiberian', 40, 0, 'sma', 'menikah', 6, 74, 81, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(77, 'Otterunsuitable', 26, 2, 'pasca', 'lajang', 9, 86, 71, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(78, 'Shintbulky', 25, 0, 'pasca', 'lajang', 8, 77, 94, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(79, 'Siderealhygroscopic', 47, 0, 'pasca', 'menikah', 10, 75, 97, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(80, 'Atheistexcellence', 33, 0, 'akademi', 'menikah', 7, 99, 79, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(81, 'Illogicalweixin', 43, 0, 'sarjana', 'lajang', 7, 98, 72, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(82, 'Branchflimsy', 39, 2, 'pasca', 'menikah', 8, 81, 74, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(83, 'Shiversabstract', 35, 8, 'akademi', 'lajang', 5, 90, 93, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(84, 'Meiniepreviously', 22, 1, 'pasca', 'menikah', 7, 82, 84, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(85, 'Cracksternpost', 40, 1, 'pasca', 'menikah', 9, 83, 86, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(86, 'Prospectusmoussier', 35, 9, 'pasca', 'menikah', 6, 86, 73, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(87, 'Insisthotel', 38, 2, 'sarjana', 'menikah', 10, 82, 74, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(88, 'Ponionsmooth', 25, 0, 'sarjana', 'menikah', 10, 85, 76, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(89, 'Clowntanned', 37, 1, 'pasca', 'lajang', 6, 95, 83, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(90, 'Greasybream', 29, 0, 'pasca', 'menikah', 6, 80, 85, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(91, 'Mercedesmaple', 32, 1, 'sma', 'menikah', 8, 91, 76, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(92, 'Cosabrupt', 19, 0, 'akademi', 'lajang', 8, 92, 76, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(93, 'Betelgeusecatered', 47, 0, 'akademi', 'lajang', 9, 93, 95, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(94, 'Easilypractised', 39, 7, 'akademi', 'menikah', 8, 71, 84, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(95, 'Beatherstrike', 29, 0, 'sma', 'menikah', 10, 10, 84, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(96, 'Boncretecups', 23, 0, 'sma', 'lajang', 5, 70, 82, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(97, 'Respectfulmethodist', 19, 8, 'akademi', 'lajang', 5, 71, 78, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(98, 'Wingedmilkshakes', 18, 1, 'pasca', 'lajang', 10, 71, 97, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(99, 'Bannerwagtail', 22, 9, 'sma', 'lajang', 10, 76, 70, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(100, 'Inningwake', 19, 0, 'akademi', 'lajang', 9, 94, 90, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(101, 'Paternaldilation', 27, 1, 'pasca', 'menikah', 5, 97, 75, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(102, 'Snamerant', 31, 0, 'sma', 'lajang', 8, 95, 75, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(103, 'Updatescode', 32, 9, 'sma', 'menikah', 10, 79, 77, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(104, 'Imminentsix', 41, 2, 'pasca', 'lajang', 6, 90, 81, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(105, 'Thermometerbooted', 34, 0, 'pasca', 'menikah', 8, 99, 90, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(106, 'Fermiumbubbish', 45, 0, 'akademi', 'lajang', 8, 70, 88, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(107, 'Eccleswonder', 34, 1, 'pasca', 'lajang', 10, 71, 10, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(108, 'Explosivelydiffidence', 31, 0, 'sma', 'lajang', 6, 86, 71, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(109, 'Matrixhurry', 27, 0, 'sma', 'menikah', 8, 96, 73, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(110, 'Blessingsleep', 36, 2, 'akademi', 'lajang', 10, 79, 80, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(111, 'Mapresolute', 47, 0, 'pasca', 'menikah', 6, 97, 73, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(112, 'Typefusion', 19, 2, 'pasca', 'menikah', 8, 91, 91, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(113, 'Gasesceans', 42, 1, 'sma', 'menikah', 7, 70, 84, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(114, 'Codepageflick', 46, 0, 'akademi', 'menikah', 7, 72, 82, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(115, 'Calandrasnotty', 29, 1, 'sarjana', 'lajang', 10, 75, 10, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(116, 'Hawfinchselfie', 19, 5, 'sma', 'lajang', 8, 76, 71, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(117, 'Hoversbodrell', 18, 1, 'sma', 'menikah', 6, 70, 99, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(118, 'Careguiltless', 35, 1, 'sarjana', 'menikah', 10, 86, 84, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(119, 'Drunkjunkie', 45, 1, 'sma', 'lajang', 9, 86, 80, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(120, 'Squacksquid', 30, 2, 'sarjana', 'lajang', 5, 70, 98, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(121, 'Farmwatch', 22, 0, 'akademi', 'menikah', 10, 85, 96, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(122, 'Ickyammeter', 43, 0, 'sarjana', 'lajang', 8, 71, 91, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(123, 'Bustdesserts', 45, 6, 'sma', 'lajang', 7, 74, 92, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(124, 'Slipwaysomersault', 30, 0, 'sarjana', 'lajang', 7, 72, 83, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(125, 'Slicerypresian', 37, 0, 'akademi', 'menikah', 5, 87, 72, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(126, 'Deliveringnosed', 46, 7, 'sarjana', 'menikah', 6, 95, 86, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(127, 'Rosetteenjoy', 35, 0, 'sma', 'lajang', 6, 72, 96, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(128, 'Inclinedbread', 32, 1, 'pasca', 'lajang', 10, 94, 87, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(129, 'Meddlesomemechanics', 33, 10, 'pasca', 'menikah', 7, 95, 73, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(130, 'Playplanes', 18, 2, 'sma', 'menikah', 8, 79, 88, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(131, 'Feetpyrenees', 47, 0, 'pasca', 'lajang', 5, 97, 80, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(132, 'Bloatinggrey', 20, 3, 'sma', 'menikah', 5, 72, 97, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(133, 'Primagequeen', 20, 1, 'sma', 'menikah', 8, 71, 71, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(134, 'Portblumbling', 36, 0, 'akademi', 'lajang', 9, 87, 70, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(135, 'Buildercredit', 20, 4, 'sarjana', 'lajang', 9, 93, 70, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(136, 'Nescafedifficult', 35, 0, 'sarjana', 'menikah', 8, 97, 89, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(137, 'Guaranteedshotput', 19, 0, 'pasca', 'lajang', 8, 87, 81, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(138, 'Centaursexuberance', 35, 0, 'sarjana', 'lajang', 9, 93, 93, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(139, 'Wobblychoodle', 25, 2, 'pasca', 'lajang', 7, 77, 83, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(140, 'Climbfoof', 25, 4, 'sarjana', 'menikah', 6, 71, 84, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(141, 'Skilkpiglet', 40, 7, 'akademi', 'menikah', 7, 76, 96, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(142, 'Padstrunc', 22, 0, 'sarjana', 'lajang', 9, 94, 78, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(143, 'Emeraldreply', 42, 8, 'pasca', 'menikah', 5, 72, 95, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(144, 'Usatheory', 23, 0, 'sarjana', 'lajang', 10, 85, 90, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(145, 'Colitisrosy', 36, 3, 'sarjana', 'menikah', 5, 95, 77, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(146, 'Swarpettempting', 22, 0, 'pasca', 'lajang', 7, 85, 76, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(147, 'Thumbscactus', 39, 7, 'sma', 'menikah', 10, 87, 82, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(148, 'Synchronousimprobable', 28, 9, 'pasca', 'lajang', 10, 74, 75, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(149, 'Vestaneed', 25, 0, 'sarjana', 'lajang', 7, 96, 76, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(150, 'Stokemin', 48, 7, 'sarjana', 'lajang', 9, 73, 82, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(151, 'Throatedinvoices', 18, 3, 'sma', 'lajang', 6, 72, 92, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(152, 'Listshiny', 20, 6, 'sma', 'menikah', 5, 95, 85, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(153, 'Verdantsloth', 36, 3, 'sarjana', 'menikah', 6, 77, 91, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(154, 'Speculaterosary', 22, 10, 'sarjana', 'lajang', 9, 71, 75, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(155, 'Tamarintarties', 24, 6, 'pasca', 'lajang', 6, 79, 75, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(156, 'Virusrandom', 22, 2, 'sma', 'menikah', 6, 99, 78, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(157, 'Nerdraffle', 45, 10, 'sma', 'menikah', 5, 82, 96, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(158, 'Provideadze', 29, 10, 'akademi', 'lajang', 10, 99, 75, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(159, 'Focketsmolds', 32, 2, 'sarjana', 'lajang', 6, 81, 81, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(160, 'Fanfarepry', 25, 0, 'pasca', 'lajang', 10, 74, 94, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(161, 'Frozenhitting', 29, 0, 'sarjana', 'menikah', 8, 72, 76, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(162, 'Graterub', 25, 7, 'sma', 'lajang', 8, 89, 85, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(163, 'Residueprudence', 42, 7, 'akademi', 'lajang', 10, 92, 74, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(164, 'Schantsmolecular', 35, 0, 'akademi', 'menikah', 7, 74, 89, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(165, 'Pityingdisrupt', 50, 1, 'pasca', 'lajang', 7, 71, 80, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(166, 'Windowsartery', 25, 3, 'pasca', 'lajang', 7, 83, 82, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(167, 'Bonetaste', 34, 7, 'sarjana', 'lajang', 9, 73, 88, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(168, 'Gumpsother', 36, 7, 'akademi', 'menikah', 7, 81, 79, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(169, 'Deatnet', 38, 9, 'pasca', 'lajang', 9, 73, 92, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(170, 'Dearestmassage', 22, 6, 'akademi', 'lajang', 5, 97, 98, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(171, 'Lithiumattack', 25, 2, 'pasca', 'menikah', 8, 70, 71, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(172, 'Stooveralso', 18, 10, 'sarjana', 'lajang', 10, 95, 79, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(173, 'Coughnag', 43, 0, 'sma', 'lajang', 10, 89, 70, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(174, 'Steaklaboratory', 42, 7, 'pasca', 'menikah', 10, 77, 99, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(175, 'Troupeformula', 22, 10, 'sarjana', 'menikah', 10, 85, 84, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(176, 'Tawdrysines', 20, 9, 'akademi', 'menikah', 9, 10, 90, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(177, 'Shysterdelight', 20, 5, 'akademi', 'lajang', 9, 82, 89, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(178, 'Singerparka', 38, 3, 'sma', 'menikah', 7, 99, 88, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(179, 'Sensorsnun', 41, 0, 'sma', 'lajang', 10, 10, 79, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(180, 'Chishfarch', 21, 0, 'sarjana', 'lajang', 10, 90, 78, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(181, 'Ponensjedi', 25, 5, 'pasca', 'lajang', 5, 10, 10, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(182, 'Splairscroast', 45, 1, 'sarjana', 'lajang', 8, 95, 75, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(183, 'Networklike', 39, 1, 'akademi', 'menikah', 10, 74, 73, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(184, 'Stoeuniversity', 22, 2, 'sarjana', 'menikah', 8, 80, 85, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(185, 'Headwallpie', 34, 6, 'akademi', 'menikah', 8, 86, 72, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(186, 'Waltzcanon', 34, 0, 'akademi', 'lajang', 10, 71, 78, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(187, 'Drummetacarpal', 33, 7, 'sarjana', 'lajang', 7, 80, 99, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(188, 'Chiefruler', 19, 0, 'pasca', 'menikah', 8, 93, 89, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(189, 'Rageappeared', 44, 1, 'sma', 'lajang', 6, 93, 94, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(190, 'Gamedairy', 18, 0, 'sarjana', 'lajang', 7, 95, 91, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(191, 'Valueearlier', 26, 0, 'pasca', 'lajang', 10, 80, 90, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(192, 'Kitemailer', 32, 1, 'sma', 'menikah', 6, 77, 96, 'sangat baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(193, 'Briskrealistic', 33, 0, 'pasca', 'lajang', 10, 79, 74, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(194, 'Richnesstempt', 26, 0, 'akademi', 'lajang', 10, 99, 86, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(195, 'Zincunwilling', 40, 1, 'sarjana', 'menikah', 8, 78, 88, 'baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(196, 'Translatorsomalian', 18, 2, 'sarjana', 'menikah', 6, 70, 86, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(197, 'Sitemapbookmark', 26, 3, 'akademi', 'lajang', 10, 83, 90, 'cukup baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(198, 'Patrickvertigo', 19, 7, 'sarjana', 'lajang', 5, 85, 81, 'cukup baik', 0, 'gagal', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(199, 'Slatetoy', 48, 9, 'akademi', 'lajang', 5, 91, 87, 'baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59'),
(200, 'Bakerise', 48, 3, 'akademi', 'menikah', 5, 81, 81, 'sangat baik', 0, 'lulus', '2018-08-10 07:35:59', '2018-08-10 00:35:59');

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
(1, 'Saucycool', '< 25', '0 tahun', 'pasca', 'lajang', '8-10', '70-79', '70-79', 'baik', 1, 'gagal'),
(2, 'Verifyspoken', '< 25', '1-2 tahun', 'pasca', 'menikah', '8-10', '90-100', '90-100', 'baik', 1, 'gagal'),
(3, 'Iranianprivacy', '25-35', '0 tahun', 'akademi', 'lajang', '5-7', '70-79', '70-79', 'cukup baik', 1, 'lulus'),
(4, 'Bitswhirr', '25-35', '0 tahun', 'sma', 'lajang', '5-7', '70-79', '70-79', 'baik', 1, 'gagal'),
(5, 'Icyblind', '25-35', '> 2 tahun', 'akademi', 'menikah', '5-7', '80-89', '80-89', 'sangat baik', 1, 'gagal'),
(6, 'Thornebarber', '> 35', '> 2 tahun', 'pasca', 'menikah', '8-10', '70-79', '80-89', 'baik', 1, 'gagal'),
(7, 'Rawfishhighlight', '> 35', '> 2 tahun', 'sma', 'lajang', '5-7', '70-79', '70-79', 'cukup baik', 1, 'gagal'),
(8, 'Rulespeafowl', '> 35', '1-2 tahun', 'sarjana', 'lajang', '8-10', '90-100', '90-100', 'cukup baik', 1, 'lulus'),
(9, 'Bimmingpulp', '25-35', '> 2 tahun', 'sarjana', 'menikah', '8-10', '80-89', '80-89', 'sangat baik', 1, 'lulus'),
(10, 'Brubbingtiding', '> 35', '0 tahun', 'pasca', 'lajang', '8-10', '80-89', '80-89', 'sangat baik', 1, 'gagal'),
(11, 'Discsubstr', '25-35', '1-2 tahun', 'pasca', 'menikah', '5-7', '80-89', '80-89', 'baik', 1, 'gagal'),
(12, 'Mapdangerous', '25-35', '0 tahun', 'pasca', 'lajang', '5-7', '90-100', '90-100', 'cukup baik', 1, 'lulus'),
(13, 'Cheaksoup', '25-35', '0 tahun', 'sarjana', 'lajang', '5-7', '80-89', '70-79', 'sangat baik', 1, 'lulus'),
(14, 'Squeezeshallot', '> 35', '0 tahun', 'akademi', 'lajang', '5-7', '70-79', '70-79', 'baik', 1, 'gagal'),
(15, 'Positionballer', '< 25', '> 2 tahun', 'akademi', 'menikah', '5-7', '90-100', '70-79', 'cukup baik', 1, 'lulus'),
(16, 'Truemeridian', '> 35', '0 tahun', 'sma', 'lajang', '8-10', '70-79', '90-100', 'sangat baik', 1, 'gagal'),
(17, 'Palettewere', '> 35', '> 2 tahun', 'pasca', 'menikah', '5-7', '90-100', '70-79', 'baik', 1, 'gagal'),
(18, 'Stringcerebrum', '25-35', '0 tahun', 'akademi', 'lajang', '8-10', '70-79', '70-79', 'baik', 1, 'lulus'),
(19, 'Coteriepiper', '< 25', '0 tahun', 'sarjana', 'menikah', '5-7', '70-79', '70-79', 'sangat baik', 1, 'lulus'),
(20, 'Cinemadunking', '25-35', '> 2 tahun', 'pasca', 'lajang', '8-10', '70-79', '80-89', 'sangat baik', 1, 'gagal'),
(21, 'Pushymanchester', '25-35', '1-2 tahun', 'sma', 'lajang', '5-7', '90-100', '90-100', 'sangat baik', 1, 'gagal'),
(22, 'Thumbsupsushi', '< 25', '0 tahun', 'pasca', 'lajang', '8-10', '70-79', '90-100', 'cukup baik', 1, 'lulus'),
(23, 'Pechoratree', '25-35', '1-2 tahun', 'pasca', 'menikah', '8-10', '80-89', '70-79', 'cukup baik', 1, 'lulus'),
(24, 'Psychoscale', '> 35', '0 tahun', 'sarjana', 'lajang', '5-7', '90-100', '80-89', 'cukup baik', 1, 'gagal'),
(25, 'Hoesbiping', '< 25', '> 2 tahun', 'pasca', 'lajang', '8-10', '80-89', '70-79', 'cukup baik', 1, 'lulus'),
(26, 'Corybread', '25-35', '0 tahun', 'sma', 'menikah', '8-10', '70-79', '70-79', 'cukup baik', 1, 'gagal'),
(27, 'Croodeneconomic', '25-35', '> 2 tahun', 'akademi', 'lajang', '8-10', '70-79', '90-100', 'cukup baik', 1, 'lulus'),
(28, 'Fatteredacid', '25-35', '> 2 tahun', 'sarjana', 'menikah', '5-7', '70-79', '90-100', 'baik', 1, 'lulus'),
(29, 'Fryerfooted', '> 35', '> 2 tahun', 'pasca', 'menikah', '8-10', '90-100', '80-89', 'cukup baik', 1, 'gagal'),
(30, 'Bocolateinterval', '25-35', '> 2 tahun', 'sarjana', 'lajang', '8-10', '70-79', '70-79', 'cukup baik', 1, 'gagal'),
(31, 'Sidlawspity', '25-35', '> 2 tahun', 'sma', 'lajang', '5-7', '80-89', '90-100', 'baik', 1, 'gagal'),
(32, 'Doadingrecord', '> 35', '> 2 tahun', 'sarjana', 'menikah', '5-7', '80-89', '70-79', 'sangat baik', 1, 'gagal'),
(33, 'Crimpboffee', '25-35', '0 tahun', 'sarjana', 'lajang', '8-10', '80-89', '80-89', 'baik', 1, 'lulus'),
(34, 'Jobmeggings', '> 35', '> 2 tahun', 'pasca', 'menikah', '5-7', '90-100', '90-100', 'sangat baik', 1, 'gagal'),
(35, 'Anchovyfoal', '> 35', '1-2 tahun', 'akademi', 'lajang', '8-10', '70-79', '80-89', 'sangat baik', 1, 'lulus'),
(36, 'Memorablebrillo', '> 35', '0 tahun', 'sma', 'lajang', '5-7', '70-79', '70-79', 'cukup baik', 1, 'gagal'),
(37, 'Bitternmaul', '25-35', '> 2 tahun', 'akademi', 'lajang', '8-10', '80-89', '80-89', 'cukup baik', 1, 'lulus'),
(38, 'Turkeyredox', '> 35', '0 tahun', 'sarjana', 'lajang', '5-7', '70-79', '90-100', 'baik', 1, 'lulus'),
(39, 'Savannaconcerned', '25-35', '> 2 tahun', 'akademi', 'menikah', '8-10', '90-100', '70-79', 'sangat baik', 1, 'gagal'),
(40, 'Whitingsabine', '< 25', '> 2 tahun', 'sarjana', 'menikah', '8-10', '80-89', '90-100', 'sangat baik', 1, 'gagal'),
(41, 'Brakepod', '25-35', '1-2 tahun', 'sma', 'menikah', '5-7', '90-100', '70-79', 'sangat baik', 1, 'gagal'),
(42, 'Bongueacross', '< 25', '> 2 tahun', 'akademi', 'menikah', '8-10', '70-79', '90-100', 'sangat baik', 1, 'gagal'),
(43, 'Viafax', '> 35', '1-2 tahun', 'akademi', 'lajang', '8-10', '90-100', '90-100', 'baik', 1, 'gagal'),
(44, 'Entertaininvalid', '25-35', '1-2 tahun', 'sma', 'lajang', '5-7', '70-79', '90-100', 'cukup baik', 1, 'gagal'),
(45, 'Mosquitoeadvise', '< 25', '0 tahun', 'pasca', 'menikah', '8-10', '80-89', '90-100', 'sangat baik', 1, 'lulus'),
(46, 'Passeddopping', '< 25', '1-2 tahun', 'sma', 'lajang', '8-10', '90-100', '90-100', 'sangat baik', 1, 'lulus'),
(47, 'Beautifulprey', '25-35', '1-2 tahun', 'sarjana', 'lajang', '8-10', '80-89', '70-79', 'baik', 1, 'gagal'),
(48, 'Wingfreeboard', '> 35', '1-2 tahun', 'sma', 'lajang', '8-10', '70-79', '80-89', 'cukup baik', 1, 'gagal'),
(49, 'Yearlyyob', '25-35', '> 2 tahun', 'pasca', 'lajang', '5-7', '70-79', '70-79', 'baik', 1, 'lulus'),
(50, 'Presumablytuit', '25-35', '> 2 tahun', 'sma', 'lajang', '8-10', '80-89', '80-89', 'cukup baik', 1, 'lulus'),
(51, 'Lurgerpassed', '25-35', '1-2 tahun', 'pasca', 'lajang', '8-10', '70-79', '80-89', 'sangat baik', 1, 'lulus'),
(52, 'Fruitypublic', '> 35', '0 tahun', 'akademi', 'menikah', '8-10', '70-79', '90-100', 'baik', 1, 'gagal'),
(53, 'Cystslink', '> 35', '> 2 tahun', 'sarjana', 'lajang', '8-10', '70-79', '70-79', 'sangat baik', 1, 'gagal'),
(54, 'Skatesubway', '> 35', '1-2 tahun', 'sarjana', 'menikah', '5-7', '70-79', '80-89', 'cukup baik', 1, 'lulus'),
(55, 'Armstoke', '> 35', '1-2 tahun', 'akademi', 'lajang', '8-10', '70-79', '70-79', 'baik', 1, 'gagal'),
(56, 'Crogssailboat', '> 35', '1-2 tahun', 'sma', 'menikah', '8-10', '90-100', '70-79', 'sangat baik', 1, 'gagal'),
(57, 'Solitarycommand', '< 25', '1-2 tahun', 'sarjana', 'lajang', '5-7', '90-100', '90-100', 'sangat baik', 1, 'lulus'),
(58, 'Wildernesspizza', '25-35', '> 2 tahun', 'akademi', 'menikah', '5-7', '80-89', '70-79', 'baik', 1, 'gagal'),
(59, 'Pencildove', '> 35', '> 2 tahun', 'akademi', 'lajang', '8-10', '70-79', '90-100', 'sangat baik', 1, 'gagal'),
(60, 'Sponsonstethoscope', '< 25', '> 2 tahun', 'sma', 'menikah', '5-7', '70-79', '80-89', 'sangat baik', 1, 'gagal'),
(61, 'Hodgkinmop', '25-35', '0 tahun', 'pasca', 'lajang', '8-10', '90-100', '80-89', 'baik', 1, 'gagal'),
(62, 'Huygensbiathlon', '< 25', '1-2 tahun', 'sarjana', 'menikah', '5-7', '80-89', '80-89', 'baik', 1, 'lulus'),
(63, 'Steamkoiled', '25-35', '> 2 tahun', 'sma', 'lajang', '8-10', '80-89', '70-79', 'cukup baik', 1, 'gagal'),
(64, 'Juddingoral', '25-35', '1-2 tahun', 'sarjana', 'lajang', '8-10', '90-100', '70-79', 'cukup baik', 1, 'lulus'),
(65, 'Chimneymouthguard', '> 35', '0 tahun', 'sma', 'menikah', '8-10', '70-79', '80-89', 'sangat baik', 1, 'lulus'),
(66, 'Fragmentfailure', '25-35', '> 2 tahun', 'sarjana', 'lajang', '8-10', '90-100', '80-89', 'baik', 1, 'lulus'),
(67, 'Handballaware', '25-35', '0 tahun', 'sma', 'lajang', '5-7', '70-79', '90-100', 'cukup baik', 1, 'lulus'),
(68, 'Sociabletosh', '> 35', '1-2 tahun', 'sma', 'lajang', '8-10', '70-79', '80-89', 'baik', 1, 'gagal'),
(69, 'Predictgovernance', '< 25', '0 tahun', 'sma', 'lajang', '8-10', '80-89', '70-79', 'cukup baik', 1, 'gagal'),
(70, 'Siblingsfur', '> 35', '> 2 tahun', 'sma', 'menikah', '8-10', '80-89', '70-79', 'cukup baik', 1, 'lulus'),
(71, 'Scottishslead', '< 25', '0 tahun', 'sarjana', 'lajang', '5-7', '80-89', '80-89', 'sangat baik', 1, 'lulus'),
(72, 'Orbitlithuanian', '> 35', '1-2 tahun', 'pasca', 'menikah', '8-10', '70-79', '70-79', 'baik', 1, 'lulus'),
(73, 'Trolleytrackball', '< 25', '1-2 tahun', 'sma', 'menikah', '5-7', '90-100', '80-89', 'sangat baik', 1, 'gagal'),
(74, 'Tilerjukebox', '> 35', '1-2 tahun', 'akademi', 'menikah', '5-7', '90-100', '80-89', 'baik', 1, 'lulus'),
(75, 'Discretemalicious', '< 25', '0 tahun', 'sarjana', 'menikah', '8-10', '70-79', '70-79', 'sangat baik', 1, 'gagal'),
(76, 'Climatesiberian', '> 35', '0 tahun', 'sma', 'menikah', '5-7', '70-79', '80-89', 'cukup baik', 1, 'gagal'),
(77, 'Otterunsuitable', '25-35', '1-2 tahun', 'pasca', 'lajang', '8-10', '80-89', '70-79', 'baik', 1, 'gagal'),
(78, 'Shintbulky', '25-35', '0 tahun', 'pasca', 'lajang', '8-10', '70-79', '90-100', 'cukup baik', 1, 'lulus'),
(79, 'Siderealhygroscopic', '> 35', '0 tahun', 'pasca', 'menikah', '8-10', '70-79', '90-100', 'sangat baik', 1, 'lulus'),
(80, 'Atheistexcellence', '25-35', '0 tahun', 'akademi', 'menikah', '5-7', '90-100', '70-79', 'sangat baik', 1, 'lulus'),
(81, 'Illogicalweixin', '> 35', '0 tahun', 'sarjana', 'lajang', '5-7', '90-100', '70-79', 'sangat baik', 1, 'lulus'),
(82, 'Branchflimsy', '> 35', '1-2 tahun', 'pasca', 'menikah', '8-10', '80-89', '70-79', 'baik', 1, 'gagal'),
(83, 'Shiversabstract', '25-35', '> 2 tahun', 'akademi', 'lajang', '5-7', '90-100', '90-100', 'cukup baik', 1, 'lulus'),
(84, 'Meiniepreviously', '< 25', '1-2 tahun', 'pasca', 'menikah', '5-7', '80-89', '80-89', 'sangat baik', 1, 'gagal'),
(85, 'Cracksternpost', '> 35', '1-2 tahun', 'pasca', 'menikah', '8-10', '80-89', '80-89', 'baik', 1, 'gagal'),
(86, 'Prospectusmoussier', '25-35', '> 2 tahun', 'pasca', 'menikah', '5-7', '80-89', '70-79', 'cukup baik', 1, 'lulus'),
(87, 'Insisthotel', '> 35', '1-2 tahun', 'sarjana', 'menikah', '8-10', '80-89', '70-79', 'sangat baik', 1, 'gagal'),
(88, 'Ponionsmooth', '25-35', '0 tahun', 'sarjana', 'menikah', '8-10', '80-89', '70-79', 'sangat baik', 1, 'gagal'),
(89, 'Clowntanned', '> 35', '1-2 tahun', 'pasca', 'lajang', '5-7', '90-100', '80-89', 'baik', 1, 'lulus'),
(90, 'Greasybream', '25-35', '0 tahun', 'pasca', 'menikah', '5-7', '80-89', '80-89', 'sangat baik', 1, 'lulus'),
(91, 'Mercedesmaple', '25-35', '1-2 tahun', 'sma', 'menikah', '8-10', '90-100', '70-79', 'baik', 1, 'gagal'),
(92, 'Cosabrupt', '< 25', '0 tahun', 'akademi', 'lajang', '8-10', '90-100', '70-79', 'cukup baik', 1, 'lulus'),
(93, 'Betelgeusecatered', '> 35', '0 tahun', 'akademi', 'lajang', '8-10', '90-100', '90-100', 'cukup baik', 1, 'gagal'),
(94, 'Easilypractised', '> 35', '> 2 tahun', 'akademi', 'menikah', '8-10', '70-79', '80-89', 'sangat baik', 1, 'lulus'),
(95, 'Beatherstrike', '25-35', '0 tahun', 'sma', 'menikah', '8-10', '70-79', '80-89', 'sangat baik', 1, 'lulus'),
(96, 'Boncretecups', '< 25', '0 tahun', 'sma', 'lajang', '5-7', '70-79', '80-89', 'sangat baik', 1, 'gagal'),
(97, 'Respectfulmethodist', '< 25', '> 2 tahun', 'akademi', 'lajang', '5-7', '70-79', '70-79', 'baik', 1, 'gagal'),
(98, 'Wingedmilkshakes', '< 25', '1-2 tahun', 'pasca', 'lajang', '8-10', '70-79', '90-100', 'sangat baik', 1, 'lulus'),
(99, 'Bannerwagtail', '< 25', '> 2 tahun', 'sma', 'lajang', '8-10', '70-79', '70-79', 'cukup baik', 1, 'gagal'),
(100, 'Inningwake', '< 25', '0 tahun', 'akademi', 'lajang', '8-10', '90-100', '90-100', 'cukup baik', 1, 'lulus'),
(101, 'Paternaldilation', '25-35', '1-2 tahun', 'pasca', 'menikah', '5-7', '90-100', '70-79', 'baik', 1, 'gagal'),
(102, 'Snamerant', '25-35', '0 tahun', 'sma', 'lajang', '8-10', '90-100', '70-79', 'sangat baik', 1, 'lulus'),
(103, 'Updatescode', '25-35', '> 2 tahun', 'sma', 'menikah', '8-10', '70-79', '70-79', 'baik', 1, 'lulus'),
(104, 'Imminentsix', '> 35', '1-2 tahun', 'pasca', 'lajang', '5-7', '90-100', '80-89', 'cukup baik', 1, 'gagal'),
(105, 'Thermometerbooted', '25-35', '0 tahun', 'pasca', 'menikah', '8-10', '90-100', '90-100', 'baik', 1, 'gagal'),
(106, 'Fermiumbubbish', '> 35', '0 tahun', 'akademi', 'lajang', '8-10', '70-79', '80-89', 'sangat baik', 1, 'lulus'),
(107, 'Eccleswonder', '25-35', '1-2 tahun', 'pasca', 'lajang', '8-10', '70-79', '70-79', 'cukup baik', 1, 'gagal'),
(108, 'Explosivelydiffidence', '25-35', '0 tahun', 'sma', 'lajang', '5-7', '80-89', '70-79', 'baik', 1, 'lulus'),
(109, 'Matrixhurry', '25-35', '0 tahun', 'sma', 'menikah', '8-10', '90-100', '70-79', 'baik', 1, 'gagal'),
(110, 'Blessingsleep', '> 35', '1-2 tahun', 'akademi', 'lajang', '8-10', '70-79', '80-89', 'baik', 1, 'lulus'),
(111, 'Mapresolute', '> 35', '0 tahun', 'pasca', 'menikah', '5-7', '90-100', '70-79', 'sangat baik', 1, 'gagal'),
(112, 'Typefusion', '< 25', '1-2 tahun', 'pasca', 'menikah', '8-10', '90-100', '90-100', 'sangat baik', 1, 'lulus'),
(113, 'Gasesceans', '> 35', '1-2 tahun', 'sma', 'menikah', '5-7', '70-79', '80-89', 'cukup baik', 1, 'lulus'),
(114, 'Codepageflick', '> 35', '0 tahun', 'akademi', 'menikah', '5-7', '70-79', '80-89', 'sangat baik', 1, 'lulus'),
(115, 'Calandrasnotty', '25-35', '1-2 tahun', 'sarjana', 'lajang', '8-10', '70-79', '70-79', 'baik', 1, 'lulus'),
(116, 'Hawfinchselfie', '< 25', '> 2 tahun', 'sma', 'lajang', '8-10', '70-79', '70-79', 'sangat baik', 1, 'lulus'),
(117, 'Hoversbodrell', '< 25', '1-2 tahun', 'sma', 'menikah', '5-7', '70-79', '90-100', 'sangat baik', 1, 'gagal'),
(118, 'Careguiltless', '25-35', '1-2 tahun', 'sarjana', 'menikah', '8-10', '80-89', '80-89', 'baik', 1, 'lulus'),
(119, 'Drunkjunkie', '> 35', '1-2 tahun', 'sma', 'lajang', '8-10', '80-89', '80-89', 'sangat baik', 1, 'lulus'),
(120, 'Squacksquid', '25-35', '1-2 tahun', 'sarjana', 'lajang', '5-7', '70-79', '90-100', 'cukup baik', 1, 'lulus'),
(121, 'Farmwatch', '< 25', '0 tahun', 'akademi', 'menikah', '8-10', '80-89', '90-100', 'cukup baik', 1, 'lulus'),
(122, 'Ickyammeter', '> 35', '0 tahun', 'sarjana', 'lajang', '8-10', '70-79', '90-100', 'sangat baik', 1, 'lulus'),
(123, 'Bustdesserts', '> 35', '> 2 tahun', 'sma', 'lajang', '5-7', '70-79', '90-100', 'sangat baik', 1, 'lulus'),
(124, 'Slipwaysomersault', '25-35', '0 tahun', 'sarjana', 'lajang', '5-7', '70-79', '80-89', 'cukup baik', 1, 'gagal'),
(125, 'Slicerypresian', '> 35', '0 tahun', 'akademi', 'menikah', '5-7', '80-89', '70-79', 'baik', 1, 'lulus'),
(126, 'Deliveringnosed', '> 35', '> 2 tahun', 'sarjana', 'menikah', '5-7', '90-100', '80-89', 'sangat baik', 1, 'lulus'),
(127, 'Rosetteenjoy', '25-35', '0 tahun', 'sma', 'lajang', '5-7', '70-79', '90-100', 'sangat baik', 1, 'gagal'),
(128, 'Inclinedbread', '25-35', '1-2 tahun', 'pasca', 'lajang', '8-10', '90-100', '80-89', 'cukup baik', 1, 'lulus'),
(129, 'Meddlesomemechanics', '25-35', '> 2 tahun', 'pasca', 'menikah', '5-7', '90-100', '70-79', 'sangat baik', 1, 'lulus'),
(130, 'Playplanes', '< 25', '1-2 tahun', 'sma', 'menikah', '8-10', '70-79', '80-89', 'sangat baik', 1, 'gagal'),
(131, 'Feetpyrenees', '> 35', '0 tahun', 'pasca', 'lajang', '5-7', '90-100', '80-89', 'baik', 1, 'lulus'),
(132, 'Bloatinggrey', '< 25', '> 2 tahun', 'sma', 'menikah', '5-7', '70-79', '90-100', 'sangat baik', 1, 'lulus'),
(133, 'Primagequeen', '< 25', '1-2 tahun', 'sma', 'menikah', '8-10', '70-79', '70-79', 'sangat baik', 1, 'gagal'),
(134, 'Portblumbling', '> 35', '0 tahun', 'akademi', 'lajang', '8-10', '80-89', '70-79', 'cukup baik', 1, 'lulus'),
(135, 'Buildercredit', '< 25', '> 2 tahun', 'sarjana', 'lajang', '8-10', '90-100', '70-79', 'sangat baik', 1, 'lulus'),
(136, 'Nescafedifficult', '25-35', '0 tahun', 'sarjana', 'menikah', '8-10', '90-100', '80-89', 'sangat baik', 1, 'lulus'),
(137, 'Guaranteedshotput', '< 25', '0 tahun', 'pasca', 'lajang', '8-10', '80-89', '80-89', 'sangat baik', 1, 'gagal'),
(138, 'Centaursexuberance', '25-35', '0 tahun', 'sarjana', 'lajang', '8-10', '90-100', '90-100', 'cukup baik', 1, 'lulus'),
(139, 'Wobblychoodle', '25-35', '1-2 tahun', 'pasca', 'lajang', '5-7', '70-79', '80-89', 'baik', 1, 'gagal'),
(140, 'Climbfoof', '25-35', '> 2 tahun', 'sarjana', 'menikah', '5-7', '70-79', '80-89', 'cukup baik', 1, 'lulus'),
(141, 'Skilkpiglet', '> 35', '> 2 tahun', 'akademi', 'menikah', '5-7', '70-79', '90-100', 'cukup baik', 1, 'lulus'),
(142, 'Padstrunc', '< 25', '0 tahun', 'sarjana', 'lajang', '8-10', '90-100', '70-79', 'baik', 1, 'gagal'),
(143, 'Emeraldreply', '> 35', '> 2 tahun', 'pasca', 'menikah', '5-7', '70-79', '90-100', 'cukup baik', 1, 'lulus'),
(144, 'Usatheory', '< 25', '0 tahun', 'sarjana', 'lajang', '8-10', '80-89', '90-100', 'sangat baik', 1, 'lulus'),
(145, 'Colitisrosy', '> 35', '> 2 tahun', 'sarjana', 'menikah', '5-7', '90-100', '70-79', 'sangat baik', 1, 'gagal'),
(146, 'Swarpettempting', '< 25', '0 tahun', 'pasca', 'lajang', '5-7', '80-89', '70-79', 'cukup baik', 1, 'lulus'),
(147, 'Thumbscactus', '> 35', '> 2 tahun', 'sma', 'menikah', '8-10', '80-89', '80-89', 'baik', 1, 'lulus'),
(148, 'Synchronousimprobable', '25-35', '> 2 tahun', 'pasca', 'lajang', '8-10', '70-79', '70-79', 'baik', 1, 'lulus'),
(149, 'Vestaneed', '25-35', '0 tahun', 'sarjana', 'lajang', '5-7', '90-100', '70-79', 'cukup baik', 1, 'gagal'),
(150, 'Stokemin', '> 35', '> 2 tahun', 'sarjana', 'lajang', '8-10', '70-79', '80-89', 'sangat baik', 1, 'lulus'),
(151, 'Throatedinvoices', '< 25', '> 2 tahun', 'sma', 'lajang', '5-7', '70-79', '90-100', 'sangat baik', 1, 'lulus'),
(152, 'Listshiny', '< 25', '> 2 tahun', 'sma', 'menikah', '5-7', '90-100', '80-89', 'baik', 1, 'lulus'),
(153, 'Verdantsloth', '> 35', '> 2 tahun', 'sarjana', 'menikah', '5-7', '70-79', '90-100', 'baik', 1, 'lulus'),
(154, 'Speculaterosary', '< 25', '> 2 tahun', 'sarjana', 'lajang', '8-10', '70-79', '70-79', 'cukup baik', 1, 'gagal'),
(155, 'Tamarintarties', '< 25', '> 2 tahun', 'pasca', 'lajang', '5-7', '70-79', '70-79', 'baik', 1, 'gagal'),
(156, 'Virusrandom', '< 25', '1-2 tahun', 'sma', 'menikah', '5-7', '90-100', '70-79', 'sangat baik', 1, 'lulus'),
(157, 'Nerdraffle', '> 35', '> 2 tahun', 'sma', 'menikah', '5-7', '80-89', '90-100', 'sangat baik', 1, 'lulus'),
(158, 'Provideadze', '25-35', '> 2 tahun', 'akademi', 'lajang', '8-10', '90-100', '70-79', 'baik', 1, 'gagal'),
(159, 'Focketsmolds', '25-35', '1-2 tahun', 'sarjana', 'lajang', '5-7', '80-89', '80-89', 'cukup baik', 1, 'lulus'),
(160, 'Fanfarepry', '25-35', '0 tahun', 'pasca', 'lajang', '8-10', '70-79', '90-100', 'baik', 0, 'gagal'),
(161, 'Frozenhitting', '25-35', '0 tahun', 'sarjana', 'menikah', '8-10', '70-79', '70-79', 'cukup baik', 1, 'lulus'),
(162, 'Graterub', '25-35', '> 2 tahun', 'sma', 'lajang', '8-10', '80-89', '80-89', 'sangat baik', 1, 'gagal'),
(163, 'Residueprudence', '> 35', '> 2 tahun', 'akademi', 'lajang', '8-10', '90-100', '70-79', 'sangat baik', 1, 'lulus'),
(164, 'Schantsmolecular', '25-35', '0 tahun', 'akademi', 'menikah', '5-7', '70-79', '80-89', 'cukup baik', 1, 'lulus'),
(165, 'Pityingdisrupt', '> 35', '1-2 tahun', 'pasca', 'lajang', '5-7', '70-79', '80-89', 'sangat baik', 1, 'gagal'),
(166, 'Windowsartery', '25-35', '> 2 tahun', 'pasca', 'lajang', '5-7', '80-89', '80-89', 'sangat baik', 1, 'lulus'),
(167, 'Bonetaste', '25-35', '> 2 tahun', 'sarjana', 'lajang', '8-10', '70-79', '80-89', 'baik', 1, 'lulus'),
(168, 'Gumpsother', '> 35', '> 2 tahun', 'akademi', 'menikah', '5-7', '80-89', '70-79', 'cukup baik', 1, 'gagal'),
(169, 'Deatnet', '> 35', '> 2 tahun', 'pasca', 'lajang', '8-10', '70-79', '90-100', 'cukup baik', 1, 'gagal'),
(170, 'Dearestmassage', '< 25', '> 2 tahun', 'akademi', 'lajang', '5-7', '90-100', '90-100', 'baik', 1, 'lulus'),
(171, 'Lithiumattack', '25-35', '1-2 tahun', 'pasca', 'menikah', '8-10', '70-79', '70-79', 'cukup baik', 1, 'gagal'),
(172, 'Stooveralso', '< 25', '> 2 tahun', 'sarjana', 'lajang', '8-10', '90-100', '70-79', 'cukup baik', 1, 'gagal'),
(173, 'Coughnag', '> 35', '0 tahun', 'sma', 'lajang', '8-10', '80-89', '70-79', 'baik', 1, 'gagal'),
(174, 'Steaklaboratory', '> 35', '> 2 tahun', 'pasca', 'menikah', '8-10', '70-79', '90-100', 'cukup baik', 1, 'gagal'),
(175, 'Troupeformula', '< 25', '> 2 tahun', 'sarjana', 'menikah', '8-10', '80-89', '80-89', 'baik', 1, 'lulus'),
(176, 'Tawdrysines', '< 25', '> 2 tahun', 'akademi', 'menikah', '8-10', '70-79', '90-100', 'sangat baik', 1, 'gagal'),
(177, 'Shysterdelight', '< 25', '> 2 tahun', 'akademi', 'lajang', '8-10', '80-89', '80-89', 'sangat baik', 1, 'lulus'),
(178, 'Singerparka', '> 35', '> 2 tahun', 'sma', 'menikah', '5-7', '90-100', '80-89', 'sangat baik', 1, 'lulus'),
(179, 'Sensorsnun', '> 35', '0 tahun', 'sma', 'lajang', '8-10', '70-79', '70-79', 'sangat baik', 1, 'gagal'),
(180, 'Chishfarch', '< 25', '0 tahun', 'sarjana', 'lajang', '8-10', '90-100', '70-79', 'sangat baik', 1, 'lulus'),
(181, 'Ponensjedi', '25-35', '> 2 tahun', 'pasca', 'lajang', '5-7', '70-79', '70-79', 'cukup baik', 1, 'gagal'),
(182, 'Splairscroast', '> 35', '1-2 tahun', 'sarjana', 'lajang', '8-10', '90-100', '70-79', 'baik', 1, 'gagal'),
(183, 'Networklike', '> 35', '1-2 tahun', 'akademi', 'menikah', '8-10', '70-79', '70-79', 'sangat baik', 1, 'gagal'),
(184, 'Stoeuniversity', '< 25', '1-2 tahun', 'sarjana', 'menikah', '8-10', '80-89', '80-89', 'sangat baik', 1, 'lulus'),
(185, 'Headwallpie', '25-35', '> 2 tahun', 'akademi', 'menikah', '8-10', '80-89', '70-79', 'baik', 1, 'lulus'),
(186, 'Waltzcanon', '25-35', '0 tahun', 'akademi', 'lajang', '8-10', '70-79', '70-79', 'sangat baik', 1, 'lulus'),
(187, 'Drummetacarpal', '25-35', '> 2 tahun', 'sarjana', 'lajang', '5-7', '80-89', '90-100', 'sangat baik', 1, 'lulus'),
(188, 'Chiefruler', '< 25', '0 tahun', 'pasca', 'menikah', '8-10', '90-100', '80-89', 'baik', 1, 'gagal'),
(189, 'Rageappeared', '> 35', '1-2 tahun', 'sma', 'lajang', '5-7', '90-100', '90-100', 'cukup baik', 1, 'gagal'),
(190, 'Gamedairy', '< 25', '0 tahun', 'sarjana', 'lajang', '5-7', '90-100', '90-100', 'sangat baik', 1, 'gagal'),
(191, 'Valueearlier', '25-35', '0 tahun', 'pasca', 'lajang', '8-10', '80-89', '90-100', 'sangat baik', 0, 'lulus'),
(192, 'Kitemailer', '25-35', '1-2 tahun', 'sma', 'menikah', '5-7', '70-79', '90-100', 'sangat baik', 1, 'gagal'),
(193, 'Briskrealistic', '25-35', '0 tahun', 'pasca', 'lajang', '8-10', '70-79', '70-79', 'baik', 1, 'lulus'),
(194, 'Richnesstempt', '25-35', '0 tahun', 'akademi', 'lajang', '8-10', '90-100', '80-89', 'sangat baik', 1, 'lulus'),
(195, 'Zincunwilling', '> 35', '1-2 tahun', 'sarjana', 'menikah', '8-10', '70-79', '80-89', 'baik', 1, 'gagal'),
(196, 'Translatorsomalian', '< 25', '1-2 tahun', 'sarjana', 'menikah', '5-7', '70-79', '80-89', 'sangat baik', 1, 'lulus'),
(197, 'Sitemapbookmark', '25-35', '> 2 tahun', 'akademi', 'lajang', '8-10', '80-89', '90-100', 'cukup baik', 1, 'lulus'),
(198, 'Patrickvertigo', '< 25', '> 2 tahun', 'sarjana', 'lajang', '5-7', '80-89', '80-89', 'cukup baik', 1, 'gagal'),
(199, 'Slatetoy', '> 35', '> 2 tahun', 'akademi', 'lajang', '5-7', '90-100', '80-89', 'baik', 1, 'lulus'),
(200, 'Bakerise', '> 35', '> 2 tahun', 'akademi', 'menikah', '5-7', '80-89', '80-89', 'sangat baik', 1, 'lulus');

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
(9, '<p>Setiap anggota harus berperilaku yang konsisten dengan reputasi profesi&nbsp; yang baik dan menjauhi tindakan yang dapat mendiskreditkan profesi. Hal ini merupakan salah satu prinsip etika profesi teknisi akuntansi yaitu ?</p>', 'Objektivitas', 'Subjektivitas', 'Integritas', 'Profesional', 'Profesional', 1, 'Akuntansi I', '2018-07-20 09:53:20', '2018-07-20 02:53:20', 7),
(10, '<p>Untuk menghindari kecelakaan kerja ditempat kerja, dapat dilakukan dengan memberikan santunan untuk penghasilan yang hilang sebagai akibat dari kecelakaan kerja berupa ?</p>', 'Standarisasi', 'Pengawasan', 'Asuransi', 'Riset Teknis', 'Asuransi', 1, 'Akuntansi I', '2018-07-20 09:54:16', '2018-07-20 02:54:16', 7),
(11, '<p>Bidang akuntansi yang bertujuan menyediakan informasi didalam perusahaan ?</p>', 'Akuntansi Keuangan', 'Akuntansi Manajemen', 'AKuntansi Pemeriksaan', 'Akuntansi Biaya', 'Akuntansi Manajemen', 1, 'Akuntansi I', '2018-07-20 09:55:48', '2018-07-20 02:55:48', 7),
(12, '<p>Transaksi pembayaran gaji karyawan dalam persamaan dasar akuntansi akan mempengaruhi ?</p>', 'Harta (-), Hutang (-), dan Modal (+)', 'Harta (-) dan Modal (+)', 'Harta (-) dan Modal (-)', 'Harta (+) dan Modal (-)', 'Harta (-) dan Modal (-)', 1, 'Akuntansi I', '2018-07-20 09:57:16', '2018-07-20 02:57:26', 7),
(13, '<p>Bukti transaksi atas penjualan atau pembelian (secara kredit) adalah ?</p>', 'Invoice', 'Memo', 'Kuitansi', 'Debet Memorandum', 'Invoice', 1, 'Akuntansi I', '2018-07-20 10:07:27', '2018-07-20 03:07:27', 7),
(14, '<p>Pada tahun berapa berdiri organisasi Ikatan Akuntansi Indonesia (IAI) ?</p>', '1958', '1957', '1975', '1960', '1957', 1, 'Akuntansi I', '2018-07-20 10:35:35', '2018-07-20 03:35:35', 7),
(15, '<p>Perhatikan jenis-jenis biaya berikut ini :</p>\r\n<ol style=\"list-style-type: upper-roman;\">\r\n<li>Biaya bahan baku</li>\r\n<li>Biaya tenaga kerja</li>\r\n<li>Pengeluaran pendapatan</li>\r\n<li>Biaya produksi</li>\r\n<li>Biaya pemasaran</li>\r\n<li>Biaya langsung</li>\r\n<li>Biaya tetap</li>\r\n<li>Biaya administrasi dan umum</li>\r\n</ol>\r\n<p>yang merupakan jenis biaya atas dasar objek pengeluaran adalah ?</p>', 'I, II, III', 'IV, V, VIII', 'V, VI, VII', 'I, V, IV', 'IV, V, VIII', 1, 'Akuntansi I', '2018-07-20 10:39:58', '2018-07-20 03:39:58', 7),
(16, '<p>Salah satu alasan dilakukannya rekonsiliasi bank adalah ?</p>', 'Kesalahan mencatat nama customer oleh perusahaan', 'Kesalahan menulis nomor cek oleh perusahaan', 'Adanya setoran dalam perjalanan', 'Penggunaan cek dalam pembayaran hutang', 'Adanya setoran dalam perjalanan', 1, 'Akuntansi I', '2018-07-20 10:41:22', '2018-07-20 03:41:22', 7),
(17, '<p>Terdapat data PT Mawar sebagai berikut :</p>\r\n<p style=\"padding-left: 30px;\">Pembelian Rp 246.000.000,-</p>\r\n<p style=\"padding-left: 30px;\">Retur Pembelian Rp 44.000.000,-</p>\r\n<p style=\"padding-left: 30px;\">Biaya angkut pembelian Rp 5.000.000,-</p>\r\n<p style=\"padding-left: 30px;\">Persediaan awal Rp 420.000.000,-</p>\r\n<p style=\"padding-left: 30px;\">Persediaan akhir (Rp 240.000.000,-)</p>\r\n<p style=\"padding-left: 30px;\">Penjualan Rp 800.000.000,-</p>\r\n<p style=\"padding-left: 30px;\">Retur penjualan (Rp 44.000.000,-)</p>\r\n<p>Berdasarkan data diatas, PT MAWAR mengalami ?</p>', 'Laba kotor Rp 377.000.000,-', 'Laba kotor Rp 387.000.000,-', 'Laba kotor Rp 403.000.000,-', 'Laba kotor Rp 763.000.000,-', 'Laba kotor Rp 387.000.000,-', 1, 'Akuntansi I', '2018-07-20 10:45:05', '2018-07-20 03:45:05', 7),
(18, '<p>Pendapatan diterima di muka adalah ?</p>', 'Aktiva', 'Modal', 'Pendapatan', 'Kewajiban', 'Kewajiban', 1, 'Akuntansi I', '2018-07-20 10:45:54', '2018-07-20 03:45:54', 7),
(19, '<p>Apakah sebuah aplikasi yang dibangun harus di testing terlebih dahulu atau langsung implementasi ?</p>', 'Tidak', 'Harus', 'Tidak harus', 'Tergantung aplikasi yang dibangun', 'Harus', 1, 'IT - Testing I', '2018-07-30 23:14:50', '2018-07-30 16:14:50', 6);

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
(1, 'Akuntansi I', 'Akuntansi I', 1, '2018-08-03 01:07:22', '2018-08-05 02:43:04', 1, 7);

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
(6, 'Tahap 6', '2018-08-09', '2018-08-10', '2018-08-03 01:07:22', '2018-08-02 18:07:22', 1);

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
  `umur` int(3) NOT NULL,
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
  `id_stage_detail` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `email`, `password`, `confirm_code`, `acc_status`, `created_at`, `updated_at`, `id_job`, `id_stage_detail`) VALUES
(1, 'edw.suryajaya@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', NULL, 1, '2018-08-03 01:38:10', '2018-08-02 18:41:50', 7, 1);

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
(1, 'Edward Surya Jaya', '1411112356789000', 'Serbalawan', '1997-02-02', 'Jl. Damar III', 'Medan', '20011', '085275522020', '-', 21, 'pria', 'buddha', 'sarjana', 'lajang', 4, NULL, NULL, NULL, 5, 0, 'Steven Than', '0614557896', 'Teman', '2018-08-03 01:38:10', '2018-08-02 18:38:10', 1);

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
-- Indexes for table `akurasi_dataset`
--
ALTER TABLE `akurasi_dataset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `akurasi_rule`
--
ALTER TABLE `akurasi_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_atribut_detail`
--
ALTER TABLE `cart_atribut_detail`
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
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `akurasi_dataset`
--
ALTER TABLE `akurasi_dataset`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `akurasi_rule`
--
ALTER TABLE `akurasi_rule`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cart_atribut_detail`
--
ALTER TABLE `cart_atribut_detail`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `cart_rule`
--
ALTER TABLE `cart_rule`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

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
  MODIFY `id_question` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `required_ability`
--
ALTER TABLE `required_ability`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `selection_stage`
--
ALTER TABLE `selection_stage`
  MODIFY `id_stage` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `selection_stage_detail`
--
ALTER TABLE `selection_stage_detail`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
