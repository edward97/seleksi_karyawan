-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2018 at 03:25 AM
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
(13, 'Bagian Pengawas', 7, 9, 7);

-- --------------------------------------------------------

--
-- Table structure for table `cart_atribut`
--

CREATE TABLE `cart_atribut` (
  `id` int(6) NOT NULL,
  `nm_atribut` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_atribut`
--

INSERT INTO `cart_atribut` (`id`, `nm_atribut`) VALUES
(1, 'age'),
(2, 'experience'),
(3, 'last_education'),
(4, 'status'),
(5, 'total_ability'),
(6, 'nilai_online'),
(7, 'nilai_f2f'),
(8, 'nilai_sikap');

-- --------------------------------------------------------

--
-- Table structure for table `cart_atribut_detail`
--

CREATE TABLE `cart_atribut_detail` (
  `id` int(6) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `id_atribut` int(6) NOT NULL,
  `flag` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_atribut_detail`
--

INSERT INTO `cart_atribut_detail` (`id`, `detail`, `id_atribut`, `flag`) VALUES
(1, '< 25', 1, 0),
(2, '25-35', 1, 0),
(3, '> 35', 1, 0),
(4, '0 tahun', 2, 1),
(5, '1-2 tahun', 2, 1),
(6, '> 2 tahun', 2, 0),
(7, 'sma', 3, 1),
(8, 'akademi', 3, 0),
(9, 'sarjana', 3, 0),
(10, 'pasca', 3, 0),
(11, 'lajang', 4, 0),
(12, 'menikah', 4, 0),
(13, '5-7', 5, 0),
(14, '8-10', 5, 0),
(15, '70-79', 6, 0),
(16, '80-89', 6, 0),
(17, '90-100', 6, 0),
(18, '70-79', 7, 0),
(19, '80-89', 7, 0),
(20, '90-100', 7, 0),
(21, 'cukup baik', 8, 1),
(22, 'baik', 8, 1),
(23, 'sangat baik', 8, 1);

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
  `link` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_rule`
--

INSERT INTO `cart_rule` (`id`, `atribut`, `label`, `left_keputusan`, `right_keputusan`, `keputusan`, `link`) VALUES
(1, 'last_education', 'last_education', 'sma', '!sma', NULL, NULL),
(2, 'last_education', 'sma', '-', '-', 'gagal', 1),
(3, 'last_education', '!sma', '> 2 tahun', '!> 2 tahun', NULL, 1),
(4, 'experience', '> 2 tahun', 'cukup baik', '!cukup baik', NULL, 3),
(5, 'experience', '!> 2 tahun', '-', '-', 'lulus', 3),
(6, 'nilai_sikap', 'cukup baik', '-', '-', 'gagal', 4),
(7, 'nilai_sikap', '!cukup baik', '-', '-', 'lulus', 4);

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
(1, 'Suharto', 21, 4, 'pasca', 'lajang', 6, 95, 85, 'baik', 0, 'lulus', '2018-07-27 01:17:14', '2018-07-26 18:17:14'),
(2, 'Adi', 21, 0, 'sarjana', 'menikah', 7, 83, 90, 'cukup baik', 0, 'lulus', '2018-07-27 01:17:14', '2018-07-26 18:17:14'),
(3, 'Dewi', 21, 3, 'sma', 'lajang', 8, 71, 78, 'cukup baik', 0, 'gagal', '2018-07-27 01:17:14', '2018-07-26 18:17:14'),
(4, 'Martha', 21, 0, 'pasca', 'menikah', 9, 74, 76, 'baik', 0, 'lulus', '2018-07-27 01:17:14', '2018-07-26 18:17:14'),
(5, 'Stephen', 21, 4, 'pasca', 'lajang', 5, 86, 85, 'cukup baik', 0, 'gagal', '2018-07-27 01:17:14', '2018-07-26 18:17:14'),
(6, 'Eko', 21, 1, 'akademi', 'menikah', 4, 70, 75, 'cukup baik', 0, 'lulus', '2018-07-27 01:17:14', '2018-07-26 18:17:14'),
(7, 'Wulan', 21, 5, 'sarjana', 'lajang', 3, 76, 95, 'baik', 0, 'lulus', '2018-07-27 01:17:14', '2018-07-26 18:17:14'),
(8, 'Susanti', 21, 2, 'sma', 'lajang', 2, 74, 75, 'baik', 0, 'gagal', '2018-07-27 01:17:14', '2018-07-26 18:17:14'),
(9, 'Sudirman', 21, 2, 'sma', 'menikah', 4, 78, 79, 'sangat baik', 0, 'gagal', '2018-07-27 01:17:14', '2018-07-26 18:17:14'),
(10, 'Surya', 21, 5, 'pasca', 'lajang', 8, 93, 95, 'cukup baik', 0, 'gagal', '2018-07-27 01:17:14', '2018-07-26 18:17:14');

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
(1, 'Suharto', '< 25', '> 2 tahun', 'pasca', 'lajang', '5-7', '90-100', '80-89', 'baik', 1, 'lulus'),
(2, 'Adi', '< 25', '0 tahun', 'sarjana', 'menikah', '5-7', '80-89', '90-100', 'cukup baik', 1, 'lulus'),
(3, 'Dewi', '< 25', '> 2 tahun', 'sma', 'lajang', '8-10', '70-79', '70-79', 'cukup baik', 1, 'gagal'),
(4, 'Martha', '< 25', '0 tahun', 'pasca', 'menikah', '8-10', '70-79', '70-79', 'baik', 1, 'lulus'),
(5, 'Stephen', '< 25', '> 2 tahun', 'pasca', 'lajang', '5-7', '80-89', '80-89', 'cukup baik', 1, 'gagal'),
(6, 'Eko', '< 25', '1-2 tahun', 'akademi', 'menikah', '5-7', '70-79', '70-79', 'cukup baik', 1, 'lulus'),
(7, 'Wulan', '< 25', '> 2 tahun', 'sarjana', 'lajang', '5-7', '70-79', '90-100', 'baik', 1, 'lulus'),
(8, 'Susanti', '< 25', '1-2 tahun', 'sma', 'lajang', '5-7', '70-79', '70-79', 'baik', 1, 'gagal'),
(9, 'Sudirman', '< 25', '1-2 tahun', 'sma', 'menikah', '5-7', '70-79', '70-79', 'sangat baik', 1, 'gagal'),
(10, 'Surya', '< 25', '> 2 tahun', 'pasca', 'lajang', '8-10', '90-100', '90-100', 'cukup baik', 1, 'gagal');

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
(4, '<p>Posting atau pemindah bukuan adalah proses pemindahan informasi dari ?</p>', 'Jurnal ke neraca saldo keuangan', 'Buku besar ke laporan', 'Buku besar ke neraca saldo', 'Jurnal ke buku besar', 'Jurnal ke buku besar', 1, 'Akuntansi I', '2018-07-20 10:51:54', '2018-07-20 03:51:54', 7),
(5, '<p>Di antara kejadian berikut mana yang bukan merupakan transaksi usaha ?</p>', 'Penyetoran sejumlah uang oleh pemilik untuk kepentingan usaha', 'Pembelian bahan baku secara tunai', 'Penjualan barang dagangan secara kredit', 'Kenaikan suku bunga pinjaman di bank', 'Kenaikan suku bunga pinjaman di bank', 1, 'Akuntansi I', '2018-07-20 10:53:23', '2018-07-20 03:53:23', 7),
(6, '<p>Pembelian perlengkapan kantor secara kredit akan mempengaruhi persamaan akuntansi sebagai berikut ?</p>', 'Aktiva bertambah dan hutang bertambah', 'Aktiva bertambah dan modal berkurang', 'Aktiva bertambah dan modal bertambah', 'Aktiva, utang dan modal tidak berubah', 'Aktiva bertambah dan hutang bertambah', 1, 'Akuntansi I', '2018-07-20 11:07:44', '2018-07-23 20:26:11', 7),
(7, '<p>A payment of cash for the purchases of merchandise would be recorded in the :</p>', 'Purchase journal', 'Cash payment journal', 'Sales journal', 'Cash receipt journal', 'Cash payment journal', 1, 'Akuntansi I', '2018-07-20 11:08:46', '2018-07-20 04:08:46', 7),
(8, '<p>Manakah di antara pernyataan berikut yang tidak tepat ?</p>', 'Kas mempunyai saldo normal debit', 'Piutang mempunyai saldo normal debit', 'Modal mempunyai saldo normal debit', 'Hutang mempunyai saldo normal kredit', 'Modal mempunyai saldo normal debit', 1, 'Akuntansi I', '2018-07-20 11:09:31', '2018-07-20 04:09:31', 7),
(9, '<p>Outstanding check disebut juga :</p>', 'Cek kosong', 'Cek tidak cukup dana', 'cek yang belum disetorkan', 'Cek yang beredar', 'Cek yang beredar', 1, 'Akuntansi I', '2018-07-20 11:10:25', '2018-07-20 04:10:25', 7),
(10, '<p>Dalam balance sheet investasi jangka pendek termasuk dalam kelompok :</p>', 'Aktiva tetap', 'Aktiva lancar', 'Hutang jangka pendek', 'Hutang jangka panjang', 'Aktiva lancar', 1, 'Akuntansi I', '2018-07-20 11:11:19', '2018-07-20 04:11:19', 7),
(11, '<p>Dasar penyusutan dapat dipengaruhi oleh nilai-nilai berikut, kecuali:</p>', 'Harga perolehan', 'Nilai sisa', 'Nilai buku', 'Nilai pasar', 'Nilai pasar', 1, 'Akuntansi I', '2018-07-20 11:12:52', '2018-07-20 04:12:52', 7),
(12, '<p>Satu dari pos-pos kerugian dibawah ini termasuk dalam katagori pos-pos luar biasa :</p>', 'Kerugian karena penjualan aktiva tetap', 'Kerugian karena penurunan niali persediaan', 'Kerugian karena devaluasi rupiah', 'Kerugian karena penjualan surat-surat berharga', 'Kerugian karena devaluasi rupiah', 1, 'Akuntansi I', '2018-07-20 11:18:26', '2018-07-20 04:18:26', 7),
(13, '<p>&nbsp;Ayat jurnal tidak dibuat untuK ?</p>', 'Penempatan saham', 'Perolehan kembali saham', 'Pemecahan saham', 'Pengeluaran saham', 'Pemecahan saham', 1, 'Akuntansi I', '2018-07-20 11:19:49', '2018-07-20 04:19:49', 7);

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
  `status_selesai` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_std` int(6) NOT NULL,
  `id_job` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `selection_stage`
--

INSERT INTO `selection_stage` (`id_stage`, `nm_stage`, `label_online`, `label_f2f`, `status_selesai`, `created_at`, `updated_at`, `id_std`, `id_job`) VALUES
(9, 'nama_stage', 'Akuntansi I', 'Akuntansi I', 1, '2018-07-22 20:04:49', '2018-07-23 03:30:14', 1, 7),
(10, 'nama_stage', 'Akuntansi I', 'Akuntansi I', 1, '2018-07-22 20:34:15', '2018-07-22 14:33:33', 1, 8);

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
(50, 'Tahap 1', '2018-07-21', '2018-07-23', '2018-07-22 20:04:49', '2018-07-23 03:29:33', 9),
(51, 'Tahap 2', '2018-07-23', '2018-07-23', '2018-07-22 20:04:49', '2018-07-23 03:29:36', 9),
(52, 'Tahap 3', '2018-07-23', '2018-07-23', '2018-07-22 20:04:49', '2018-07-23 03:29:37', 9),
(53, 'Tahap 4', '2018-07-23', '2018-07-22', '2018-07-22 20:04:49', '2018-07-23 03:30:11', 9),
(54, 'Tahap 5', '2018-07-26', '2018-07-30', '2018-07-22 20:04:49', '2018-07-23 03:18:54', 9),
(55, 'Tahap 6', '2018-07-29', '2018-07-30', '2018-07-22 20:04:49', '2018-07-22 13:04:49', 9),
(56, 'Tahap 1', '2018-07-21', '2018-07-21', '2018-07-22 20:34:16', '2018-07-22 14:00:03', 10),
(57, 'Tahap 2', '2018-07-22', '2018-07-24', '2018-07-22 20:34:16', '2018-07-22 14:31:34', 10),
(58, 'Tahap 3', '2018-07-23', '2018-07-27', '2018-07-22 20:34:16', '2018-07-22 14:00:32', 10),
(59, 'Tahap 4', '2018-07-21', '2018-07-21', '2018-07-22 20:34:16', '2018-07-22 14:31:09', 10),
(60, 'Tahap 5', '2018-07-28', '2018-07-29', '2018-07-22 20:34:16', '2018-07-22 13:34:16', 10),
(61, 'Tahap 6', '2018-07-28', '2018-07-29', '2018-07-22 20:34:16', '2018-07-22 13:34:16', 10);

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
  `total_ability` int(3) NOT NULL,
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
-- Indexes for table `cart_atribut`
--
ALTER TABLE `cart_atribut`
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
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `cart_atribut`
--
ALTER TABLE `cart_atribut`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart_atribut_detail`
--
ALTER TABLE `cart_atribut_detail`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `cart_rule`
--
ALTER TABLE `cart_rule`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dataset`
--
ALTER TABLE `dataset`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dataset_hitung`
--
ALTER TABLE `dataset_hitung`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `selection_stage`
--
ALTER TABLE `selection_stage`
  MODIFY `id_stage` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `selection_stage_detail`
--
ALTER TABLE `selection_stage_detail`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

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
  MODIFY `id_user` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_ability`
--
ALTER TABLE `users_ability`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_detail`
--
ALTER TABLE `users_detail`
  MODIFY `id_d_user` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_exam`
--
ALTER TABLE `users_exam`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
