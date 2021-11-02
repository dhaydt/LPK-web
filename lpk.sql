-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 02, 2021 at 11:16 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lpk`
--

-- --------------------------------------------------------

--
-- Table structure for table `apply`
--

CREATE TABLE `apply` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `wa` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `domisili` varchar(255) DEFAULT NULL,
  `provinsi` varchar(50) DEFAULT NULL,
  `kelamin` varchar(20) DEFAULT NULL,
  `pendidikan` varchar(20) DEFAULT NULL,
  `jurusan` varchar(20) DEFAULT NULL,
  `agama` varchar(20) DEFAULT NULL,
  `pengalaman` varchar(100) NOT NULL,
  `alasan` text DEFAULT NULL,
  `tempat_lhr` varchar(100) DEFAULT NULL,
  `tgl_lhr` date DEFAULT NULL,
  `menikah` varchar(20) DEFAULT NULL,
  `komputer` varchar(10) DEFAULT NULL,
  `bahasa` text DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `ktp` varchar(255) DEFAULT NULL,
  `ijazah` varchar(255) DEFAULT NULL,
  `sertifikat` varchar(255) DEFAULT NULL,
  `skck` varchar(255) DEFAULT NULL,
  `portfolio` varchar(255) DEFAULT NULL,
  `pertanyaan` text DEFAULT NULL,
  `jawaban` text DEFAULT NULL,
  `nilai` varchar(100) DEFAULT NULL,
  `loker_id` int(11) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `apply`
--

INSERT INTO `apply` (`id`, `nama`, `wa`, `email`, `domisili`, `provinsi`, `kelamin`, `pendidikan`, `jurusan`, `agama`, `pengalaman`, `alasan`, `tempat_lhr`, `tgl_lhr`, `menikah`, `komputer`, `bahasa`, `instagram`, `facebook`, `foto`, `ktp`, `ijazah`, `sertifikat`, `skck`, `portfolio`, `pertanyaan`, `jawaban`, `nilai`, `loker_id`, `status`, `created_at`) VALUES
(31, 'Muhammad Hidayatullah', '081282734', 'intanmandirisejahtera@gmail.com', 'solok', 'Sumbar', 'laki-laki', 'S-1', 'TI', 'Islam', 'Sudah pernah bekerja', 'asasasas', 'Manado', '1992-09-10', 'Lajang', 'Ya', 'asasassa', 'asasas', 'asasas', 'foto1635087980667foto.jpg', 'ktp1635087980667Scan KTP.JPG', 'ijazah1635087980667ijazah.jpeg', 'serti1635087980667sert.jpeg', 'skck1635087980667skck.jpg', 'porto1635087980667Muhammad hidayatullah.pdf', '[\"Jumlah rukun islam\",\"Jumlah nabi ada berapa dalam islam ?\",\"Jumlah rukun iman ada berapa ?\",\"Jumlah rukun islam ada berapa ?\"]', '[{\"text\":\"5\",\"correct\":true},{\"text\":\"25\",\"correct\":true},{\"text\":\"6\",\"correct\":true},{\"text\":\"Ada 5\",\"correct\":true}]', '100', 50, 'Lamaran Masuk', '2021-10-24 15:08:00'),
(32, 'andi', '092321233', '1992dayat@gmail.com', 'Kota Solok', 'asada', 'laki-laki', 'S-1', 'asdasdasda', 'Islam', 'Sudah pernah bekerja', 'asdasdadasdsd', 'Manado', '1992-09-10', 'Lajang', 'Ya', 'dasdasdasdasd', 'sadasdadadsas', 'sadasdasdas', 'foto1635285678043foto.jpg', 'ktp1635285678043Scan KTP.JPG', 'ijazah1635285678043ijazah.jpeg', 'serti1635285678043sert.jpeg', 'skck1635285678043skck.jpg', 'porto1635285678043Muhammad hidayatullah.pdf', '[\"Jumlah rukun islam\",\"Jumlah nabi ada berapa dalam islam ?\",\"Jumlah rukun iman ada berapa ?\",\"Jumlah rukun islam ada berapa ?\"]', '[{\"text\":\"4\"},{\"text\":\"22\"},{\"text\":\"2\"},{\"text\":\"ada 4\"}]', '0', 50, 'Lamaran Masuk', '2021-10-26 22:01:18'),
(33, 'Muhammad Hidayatullah', '22918273', 'intanmandirisejahtera@gmail.com', 'solok', 'sumatera barat', 'laki-laki', 'S-1', 'informatika', 'Islam', 'Sudah pernah bekerja', 'saya pekerja keras', 'Manado', '1992-09-10', 'Lajang', 'Ya', 'english', 'dhaydt', 'dhaydt', 'foto1635877013305Screenshot from 2021-10-08 19-45-16.png', 'ktp1635877013305Scan KTP.JPG', 'ijazah1635877013305ijazah.jpeg', 'serti1635877013305sert.jpeg', 'skck1635877013305skck.jpg', 'porto1635877013305Muhammad hidayatullah.pdf', '[\"aku adalah\",\"Jumlah rukun islam\",\"Jumlah nabi ada berapa dalam islam ?\",\"Jumlah rukun iman ada berapa ?\",\"Jumlah rukun islam ada berapa ?\"]', '[{\"text\":\"kamu\",\"correct\":false},{\"text\":\"5\",\"correct\":true},{\"text\":\"25\",\"correct\":true},{\"text\":\"6\",\"correct\":true},{\"text\":\"Ada 5\",\"correct\":true}]', '80', 50, 'Lamaran Masuk', '2021-11-02 18:16:53');

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cabang`
--

CREATE TABLE `cabang` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `telp` varchar(20) DEFAULT NULL,
  `img` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cabang`
--

INSERT INTO `cabang` (`id`, `name`, `address`, `telp`, `img`, `created_at`) VALUES
(2, 'Ayub Camps', 'Jl. Tomang Raya Kav 21 – 23, Jakarta Barats', '08227282738121', '1634408235799business-address-slovenia-europe-800x445.jpg', '2021-10-29 19:59:14'),
(3, 'Moses', 'Jl. Daan Mogot KM. 18, Cengkareng, Jakarta 11840 – Indonesia', '0755232526', '1634408308644Company-profile-3.jpg', '2021-10-16 18:18:28'),
(4, 'Ibrahim Camp', 'Jalan Tomang Raya No 21-23 Jakarta', '0755239823', '1634408903336Company-profile-3.jpg', '2021-10-16 18:28:23');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'galeri',
  `lokasi` varchar(100) DEFAULT NULL,
  `date_range` varchar(100) DEFAULT NULL,
  `img` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `title`, `status`, `lokasi`, `date_range`, `img`, `created_at`) VALUES
(11, 'Galeri PAZ Basic semarang 12 oktober 2021', 'galeri', 'Pelatihan PAZ Basic Surabaya', '20 - 21 Oktober 2021', '1634477177338qEq59t-3_400x400.jpg', '2021-11-01 13:45:10'),
(12, 'Galeri PAZ Basic semarang 12 oktober 2021', 'galeri', 'Pelatihan PAZ Basic Surabaya', '20 - 21 Oktober 2021', '1634477189699pelatihan-Apps-orlokjakbar-2020-3.jpg', '2021-11-01 13:45:15'),
(13, 'PAZ Surabaya', 'galeri', 'Pelatihan PAZ Basic Surabaya', '20 - 21 Oktober 2021', '1634477213431images.jpeg', '2021-10-29 21:24:38'),
(14, 'Galeri PAZ Basic semarang 12 oktober 2021', 'galeri', 'Kopdar PAZTI Kalimantan Barat', '30 Oktober 2021', '1634477238811Bimtek-Pelatihan-Perpajakan-Omnibus-Law-Pada-Instansi-Pemerintah.jpeg', '2021-11-01 13:45:21'),
(15, 'Galeri PAZ Basic semarang 12 oktober 2021', 'galeri', 'Kopdar PAZTI Kalimantan Barat', '30 Oktober 2021', '163516858059797746-gading-marten-ngopi-bareng-presiden-jokowi.jpg', '2021-11-01 13:45:27'),
(17, 'Galeri PAZ Basic semarang 12 oktober 2021', 'galeri', 'Kopdar PAZTI Kalimantan Barat', '30 Oktober 2021', '1635169453826Company-profile-3.jpg', '2021-11-01 13:45:33'),
(35, 'Gallery PAZ Basic Jogja 12 Oktober 2021', 'kopdar', 'Pelatihan PAZ Basic Yogyakarta', '17 - 18 Oktober 2021', '1635799714969Rectangle 942 (1).png', '2021-11-01 20:48:34'),
(36, 'Kopdar PAZ Alumni Jogja', 'kopdar', 'Pelatihan PAZ Basic Yogyakarta', '17 - 18 Oktober 2021', '1635800088558Image (2).png', '2021-11-01 20:54:48'),
(37, 'Kopdar PAZ Alumni Jogja', 'kopdar', 'Pelatihan PAZ Basic Yogyakarta', '17 - 18 Oktober 2021', '1635800116143Company-profile-3.jpg', '2021-11-01 20:55:16'),
(38, 'PAZ Basic Kopdar', 'kopdar', 'Pelatihan PAZ Basic Yogyakarta', '17 - 18 Oktober 2021', '1635800149431IMG-20191212-WA0000.jpg', '2021-11-01 20:55:49'),
(39, 'Kopdar PAZ Alumni Surabay', 'kopdar', 'Pelatihan PAZ Basic Surabaya', '20 - 25 Oktober 2021', '1635800342608Image (2).png', '2021-11-01 20:59:02'),
(40, 'PAZJawa timur', 'kopdar', 'Pelatihan PAZ Basic Surabaya', '20 - 25 Oktober 2021', '1635800364204Image (1).png', '2021-11-01 20:59:24'),
(41, 'PAZ JATIM', 'kopdar', 'Pelatihan PAZ Basic Surabaya', '20 - 25 Oktober 2021', '1635800386571IMG-20191212-WA0000.jpg', '2021-11-01 20:59:46'),
(42, 'Surabaya Kopdar', 'kopdar', 'Pelatihan PAZ Basic Surabaya', '20 - 25 Oktober 2021', '1635800412946Image (2).png', '2021-11-01 21:00:12'),
(43, 'Kopdar kalbar', 'kopdar', 'Kopdar PAZTI Kaliantan Barat', '12 - 15 November 2021', '1635800451293Image.png', '2021-11-01 21:00:51'),
(44, 'Kopdar PAZ Kalbar', 'kopdar', 'Kopdar PAZTI Kaliantan Barat', '12 - 15 November 2021', '1635800480148Image (1).png', '2021-11-01 21:01:20'),
(45, 'KALBAR Kopdar', 'kopdar', 'Kopdar PAZTI Kaliantan Barat', '20 - 25 Oktober 2021', '1635800507974Image (2).png', '2021-11-01 21:01:47'),
(46, 'Kobdar Terbaru Kalbar', 'kopdar', 'Kopdar PAZTI Kaliantan Barat', '12 - 15 November 2021', '1635800529943Company-profile-3.jpg', '2021-11-01 21:02:09'),
(47, 'Gallery PAZ Basic Jogja 12 Oktober 2021', 'kopdar', 'Pelatihan PAZ Basic Padang', '17 - 18 Oktober 2021', '1635799714969Rectangle 942 (1).png', '2021-11-01 20:48:34'),
(48, 'Kopdar PAZ Alumni Jogja', 'kopdar', 'Pelatihan PAZ Basic Padang', '17 - 18 Oktober 2021', '1635800088558Image (2).png', '2021-11-01 20:54:48'),
(49, 'Kopdar PAZ Alumni Jogja', 'kopdar', 'Pelatihan PAZ Basic Padang', '17 - 18 Oktober 2021', '1635800116143Company-profile-3.jpg', '2021-11-01 20:55:16'),
(50, 'PAZ Basic Kopdar', 'kopdar', 'Pelatihan PAZ Basic Padang', '17 - 18 Oktober 2021', '1635800149431IMG-20191212-WA0000.jpg', '2021-11-01 20:55:49'),
(51, 'Kopdar PAZ Alumni Surabay', 'kopdar', 'Kopdar PAZTI Bukit tinggi', '20 - 25 Oktober 2021', '1635800342608Image (2).png', '2021-11-01 20:59:02'),
(52, 'PAZJawa timur', 'kopdar', 'Kopdar PAZTI Bukit tinggi', '20 - 25 Oktober 2021', '1635800364204Image (1).png', '2021-11-01 20:59:24'),
(53, 'PAZ JATIM', 'kopdar', 'Kopdar PAZTI Bukit tinggi', '20 - 25 Oktober 2021', '1635800386571IMG-20191212-WA0000.jpg', '2021-11-01 20:59:46'),
(54, 'Surabaya Kopdar', 'kopdar', 'Kopdar PAZTI Bukit tinggi', '20 - 25 Oktober 2021', '1635800412946Image (2).png', '2021-11-01 21:00:12');

-- --------------------------------------------------------

--
-- Table structure for table `gallery_group`
--

CREATE TABLE `gallery_group` (
  `id` int(11) NOT NULL,
  `lokasi` varchar(100) DEFAULT NULL,
  `date_range` varchar(100) DEFAULT NULL,
  `konten` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gallery_group`
--

INSERT INTO `gallery_group` (`id`, `lokasi`, `date_range`, `konten`, `created_at`) VALUES
(6, 'Kopdar PAZTI Kalimantan Barat', '30 Oktober 2021', 'Pertemuan antar alumni Pelatihan PAZ daerah Kalimantan Barat yang dilakukan dari tanggal X bulan Oktober 2021 secara offline di kota X. Peserta pada pertemuan ini mencapai 64 orang.', '2021-10-25 14:28:01'),
(7, 'Pelatihan PAZ Basic Surabaya', '20 - 21 Oktober 2021', 'Pelatihan yang dilakukan dari tanggal X sampai tanggal Y pada bulan Oktober 2021 secara offline di kota Surabaya. Peserta pada pelatihan ini mencapai 128 orang.', '2021-10-25 14:28:35'),
(8, 'Pelatihan PAZ Basic Yogyakarta', '17 - 18 Oktober 2021', 'Pelatihan yang dilakukan dari tanggal X sampai tanggal Y pada bulan Oktober 2021 secara offline di kota Yogyakarta. Peserta pada pelatihan ini mencapai 100 orang.', '2021-10-25 14:30:20');

-- --------------------------------------------------------

--
-- Table structure for table `instruktur`
--

CREATE TABLE `instruktur` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `instruktur`
--

INSERT INTO `instruktur` (`id`, `name`, `img`, `title`, `address`, `telp`, `created_at`) VALUES
(2, 'Ahmad Kaimudin', '1635442123874Container.png', 'Trainer', 'Pontianak', '0812872384', '2021-10-28 17:28:44'),
(3, 'Ahmad Siam', '1635442153467Container (1).png', 'Trainer', 'Solo', '0812837493', '2021-10-28 17:29:13'),
(4, 'Ahmad Albar', '1635442181099Container (2).png', 'trainer', 'Surabaya', '0755325031', '2021-10-28 17:29:41'),
(5, 'Aldi Taher', '1635442215540Container (3).png', 'trainer online', 'Dirumah', '082383746384', '2021-10-28 17:30:15'),
(6, 'Sumiya', '1635442243638Container (4).png', 'Trainer offline', 'Bandung', '0923827383', '2021-10-28 17:30:43'),
(7, 'Ahmad Kaimudin', '1635442123874Container.png', 'Trainer', 'Pontianak', '0812872384', '2021-10-28 17:28:44'),
(8, 'Ahmad Siam', '1635442153467Container (1).png', 'Trainer', 'Solo', '0812837493', '2021-10-28 17:29:13'),
(9, 'Ahmad Albar', '1635442181099Container (2).png', 'trainer', 'Surabaya', '0755325031', '2021-10-28 17:29:41'),
(10, 'Aldi Taher', '1635442215540Container (3).png', 'trainer online', 'Dari mana saja', '082383746384', '2021-10-28 17:30:15'),
(11, 'Sumiyah', '1635442243638Container (4).png', 'Trainer offline', 'Bandung', '0923827383', '2021-10-28 17:30:43');

-- --------------------------------------------------------

--
-- Table structure for table `kopdar_group`
--

CREATE TABLE `kopdar_group` (
  `id` int(11) NOT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `date_range` varchar(100) DEFAULT NULL,
  `konten` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'kopdar',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kopdar_group`
--

INSERT INTO `kopdar_group` (`id`, `lokasi`, `date_range`, `konten`, `status`, `created_at`) VALUES
(5, 'Pelatihan PAZ Basic Yogyakarta', '17 - 18 Oktober 2021', 'Gallery PAZ Basic Samarinda 17 - 18 Oktober 2021', 'kopdar', '2021-11-02 03:47:45'),
(6, 'Pelatihan PAZ Basic Surabaya', '20 - 25 Oktober 2021', 'Kopdar yang dilakukan bersama alumni PAZ', 'kopdar', '2021-11-02 03:56:40'),
(8, 'Kopdar PAZTI Kaliantan Barat', '12 - 15 November 2021', 'Kopdar Almuni Kalbar', 'kopdar', '2021-11-02 03:57:15'),
(10, 'Pelatihan PAZ Basic Padang', '20 - 25 Oktober 2021', 'Kopdar yang dilakukan bersama alumni PAZ', 'kopdar', '2021-11-02 03:56:40'),
(11, 'Kopdar PAZTI Bukit tinggi', '12 - 15 November 2021', 'Kopdar Almuni Kalbar', 'kopdar', '2021-11-02 03:57:15');

-- --------------------------------------------------------

--
-- Table structure for table `kuis`
--

CREATE TABLE `kuis` (
  `id` int(11) NOT NULL,
  `text` text DEFAULT NULL,
  `responses` text DEFAULT NULL,
  `jawaban` varchar(100) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `options` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kuis`
--

INSERT INTO `kuis` (`id`, `text`, `responses`, `jawaban`, `status`, `options`, `created_at`) VALUES
(18, 'Jumlah rukun islam ada berapa ?', '[{\"text\":\"Ada 2\"},{\"text\":\"ada 4\"},{\"text\":\"Ada 3\"},{\"text\":\"Ada 5\",\"correct\":true}]', NULL, 'on', '{\"a\":\"\",\"b\":\"\",\"c\":\"\",\"d\":\"\"}', '2021-10-24 09:23:09'),
(19, 'Jumlah rukun iman ada berapa ?', '[{\"text\":\"1\"},{\"text\":\"2\"},{\"text\":\"4\"},{\"text\":\"6\",\"correct\":true}]', NULL, 'on', '{\"a\":\"\",\"b\":\"\",\"c\":\"\",\"d\":\"\"}', '2021-10-24 09:25:57'),
(20, 'Jumlah nabi ada berapa dalam islam ?', '[{\"text\":\"23\"},{\"text\":\"22\"},{\"text\":\"25\",\"correct\":true},{\"text\":\"24\"}]', NULL, 'on', '{\"a\":\"\",\"b\":\"\",\"c\":\"\",\"d\":\"\"}', '2021-10-24 09:29:11'),
(21, 'Jumlah rukun islam', '[{\"text\":\"5\",\"correct\":true},{\"text\":\"4\"},{\"text\":\"3\"},{\"text\":\"2\"}]', NULL, 'on', '{\"a\":\"\",\"b\":\"\",\"c\":\"\",\"d\":\"\"}', '2021-10-24 15:02:05'),
(23, 'aku adalah', '[{\"text\":\"kamu\",\"correct\":false},{\"text\":\"saya\",\"correct\":true},{\"text\":\"dia\",\"correct\":false},{\"text\":\"mereka\"}]', NULL, 'on', '{}', '2021-10-30 12:03:30');

-- --------------------------------------------------------

--
-- Table structure for table `kurikulum`
--

CREATE TABLE `kurikulum` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `penyakit` varchar(255) DEFAULT NULL,
  `konten` text DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `tipe` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kurikulum`
--

INSERT INTO `kurikulum` (`id`, `name`, `subtitle`, `penyakit`, `konten`, `img`, `tipe`) VALUES
(1, 'PAZ Survival', 'Materi bertahan hidup', 'Bertahan hidup', '<p><strong>Kisi - Kisi Kurikulum</strong></p><p>Maecenas lorem eros, luctus placerat blandit et, mattis sed enim. Ut lacus urna, efficitur et fringilla id, pretium ac ex.</p><ul><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li><li>Nullam eu orci nisl. Aliquam et nisl libero.</li></ul>', '1635617975917bonfire 1.png', 'upgrading'),
(2, 'PAZ Stroke', 'Materi lumpuh sebelah', 'Penanganan stroke', '<p><strong>Kisi - Kisi Kurikulum</strong></p><p>Maecenas lorem eros, luctus placerat blandit et, mattis sed enim. Ut lacus urna, efficitur et fringilla id, pretium ac ex.</p><ul><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li><li>Nullam eu orci nisl. Aliquam et nisl libero.</li></ul>', '1635617933332cerebral 1.png', 'upgrading'),
(3, 'PAZ Maryam', 'Materi ibu hamil', 'Melahirkan secara alami dan cepat', '<p><strong>Kisi - Kisi Kurikulum</strong></p><p>Maecenas lorem eros, luctus placerat blandit et, mattis sed enim. Ut lacus urna, efficitur et fringilla id, pretium ac ex.</p><ul><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li><li>Nullam eu orci nisl. Aliquam et nisl libero.</li></ul>', '1635617881178mother 1.png', 'upgrading'),
(4, 'Diabetes', 'Materi mengenai penyakit gula', 'Mata kabur, sering tidur, sering buang air kecil', '<p><strong>Kisi - Kisi Kurikulum</strong></p><p>Maecenas lorem eros, luctus placerat blandit et, mattis sed enim. Ut lacus urna, efficitur et fringilla id, pretium ac ex.</p><ul><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li><li>Nullam eu orci nisl. Aliquam et nisl libero.</li></ul>', '1635617833097sugar-blood-level 1.png', 'upgrading'),
(5, 'Autoimun', 'Imun tubuh', 'Mudah sakit', '<p><strong>Kisi - Kisi Kurikulum</strong></p><p>Maecenas lorem eros, luctus placerat blandit et, mattis sed enim. Ut lacus urna, efficitur et fringilla id, pretium ac ex.</p><ul><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li><li>Nullam eu orci nisl. Aliquam et nisl libero</li></ul><p>&nbsp;</p>', '1635617775642immunity 1.png', 'upgrading'),
(6, 'Skoliosis', 'Materi mengenai tulang belakang dan saraf', 'Bentuk tulang belakang yang tidak simetris', '<p><strong>Kisi - Kisi Kurikulum</strong></p><p>Maecenas lorem eros, luctus placerat blandit et, mattis sed enim. Ut lacus urna, efficitur et fringilla id, pretium ac ex.&nbsp;</p><ul><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li><li>Nullam eu orci nisl. Aliquam et nisl libero.</li></ul>', '1635617663362Group (1) 1.png', 'upgrading'),
(7, 'Kanker / Benjolan', 'Materi kanker', 'Tumor dan kanker payudara', '<p><strong>Kisi - Kisi Kurikulum</strong></p><p>Maecenas lorem eros, luctus placerat blandit et, mattis sed enim. Ut lacus urna, efficitur et fringilla id, pretium ac ex.&nbsp;</p><ul><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li><li>Nullam eu orci nisl. Aliquam et nisl libero.</li></ul>', '1635531868998breast-cancer (1) 1.png', 'upgrading'),
(8, 'Babypaz', 'Materi bayi baru lahir', 'Cerebral palsy, down syndrom, jantung bocor, pneumonia, asma, kejang, epilepsi, polio', '<p><strong>Kisi - Kisi Kurikulum</strong></p><p>Maecenas lorem eros, luctus placerat blandit et, mattis sed enim. Ut lacus urna, efficitur et fringilla id, pretium ac ex.&nbsp;</p><ul><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li><li>Nullam eu orci nisl. Aliquam et nisl libero.</li></ul>', '1635530769369newborn 1.png', 'upgrading'),
(9, 'Jantung', 'Materi tentang jantung dan penyakit jantung', 'Koroner, jantung bengkak, bypass, aritmea, klep bocor, lemah jantung', '<p><strong>Kisi - Kisi Kurikulum</strong></p><p>Maecenas lorem eros, luctus placerat blandit et, mattis sed enim. Ut lacus urna, efficitur et fringilla id, pretium ac ex.</p><ul><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li><li>Nullam eu orci nisl. Aliquam et nisl libero.</li></ul>', '1635530561721heart 1.png', 'upgrading'),
(11, 'PAZ Basic', 'Wajib diikuti oleh siapapun yang ingin belajar terapi PAZ secara mendalam dengan bahasan utama Syaraf Kejepit dan Asma', 'Dasar dasar PAZ', '<h4><strong>Kisi - Kisi Kurikulum</strong></h4><p>Maecenas lorem eros, luctus placerat blandit et, mattis sed enim. Ut lacus urna, efficitur et fringilla id, pretium ac ex. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero.Maecenas lorem eros, luctus placerat blandit et, mattis sed enim. Ut lacus urna, efficitur et fringilla id, pretium ac ex. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero.Maecenas lorem eros, luctus placerat blandit et, mattis sed enim. Ut lacus urna, efficitur et fringilla id, pretium ac ex. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero.Maecenas lorem eros, luctus placerat blandit et, mattis sed enim. Ut lacus urna, efficitur et fringilla id, pretium ac ex. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero.Maecenas lorem eros, luctus placerat blandit et, mattis sed enim. Ut lacus urna, efficitur et fringilla id, pretium ac ex. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero.</p>', '1635618394786anatomy 1.png', 'basic'),
(12, 'Enterpreneur', 'Lorem ipsum dolor sit amet', 'Materi enterpreneur', '<p><strong>Kisi - Kisi Kurikulum</strong></p><p>Maecenas lorem eros, luctus placerat blandit et, mattis sed enim. Ut lacus urna, efficitur et fringilla id, pretium ac ex.</p><ul><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li><li>Nullam eu orci nisl. Aliquam et nisl libero.</li></ul>', '1635618614523businessman 1.png', 'pengayaan'),
(13, 'Pengajian', 'Lorem ipsum dolor sit amet', 'Materi tambahan', '<p><strong>Kisi - Kisi Kurikulum</strong></p><p>Maecenas lorem eros, luctus placerat blandit et, mattis sed enim. Ut lacus urna, efficitur et fringilla id, pretium ac ex.</p><ul><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li><li>Nullam eu orci nisl. Aliquam et nisl libero.</li></ul>', '1635618560895open-book (3) 1.png', 'pengayaan');

-- --------------------------------------------------------

--
-- Table structure for table `legalitas`
--

CREATE TABLE `legalitas` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `instansi` varchar(100) NOT NULL,
  `img` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `legalitas`
--

INSERT INTO `legalitas` (`id`, `name`, `instansi`, `img`, `created_at`) VALUES
(11, 'Izin Menyelenggarakan Kursus', 'Disdik / Kemendikbud', '1634405969570izinfull1.png', '2021-10-16 17:39:29'),
(12, 'Izin Penyelenggaraan Pelatihan', 'Disnaker / Kemnaker', '1634405998208izin2.png', '2021-10-16 17:39:58'),
(13, 'Sertifikat NPSN ', 'Kemendikbud', '1634406020587izin3.png', '2021-10-16 17:40:20'),
(14, 'Surat Izin Usaha Pendidikan', 'Badan Perizinan Usaha Terpadu', '1634406101458contoh-siup-kecil.jpg', '2021-10-29 19:11:39');

-- --------------------------------------------------------

--
-- Table structure for table `liputan`
--

CREATE TABLE `liputan` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `tag` text DEFAULT NULL,
  `subtitle` text DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `quote` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `content2` text DEFAULT NULL,
  `img` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `liputan`
--

INSERT INTO `liputan` (`id`, `title`, `tag`, `subtitle`, `date`, `quote`, `content`, `content2`, `img`, `user_id`, `created_at`) VALUES
(3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '[{\"text\":\"google\"},{\"text\":\"internet\"}]', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero. In euismod et urna ut pulvinar. Donec vitae est arcu. Proin eget lacus vel massa feugiat porta.', '2021-10-16 23:13:00', '“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero. In euismod et urna ut pulvinar.\"', '<p><i><strong>Lorem ipsum</strong> dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</i></p>', '<p><i><strong>Lorem ipsum</strong> dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</i></p>', '1634391506898authentication-bg.jpg', '016241c8-b725-43d5-8a50-94f5c86ea494', '2021-11-01 12:16:55'),
(7, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet', '[{\"text\":\"google\"},{\"text\":\"internet\"}]', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero. In euismod et urna ut pulvinar. Donec vitae est arcu. Proin eget lacus vel massa feugiat porta.', '2021-10-15 00:00:00', '“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero. In euismod et urna ut pulvinar.\"', '<p>adadadadada dad ddddaaa</p>', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero. In euismod et urna ut pulvinar. Donec vitae est arcu. Proin eget lacus vel massa feugiat porta.', '1634392469162police.png', '016241c8-b725-43d5-8a50-94f5c86ea494', '2021-11-01 12:17:01'),
(8, 'Google Hanya Izinkan Pinjol yang Terdaftar di OJK sejak 28 Juli 2021', '[{\"text\":\"google\"},{\"text\":\"internet\"}]', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero. In euismod et urna ut pulvinar. Donec vitae est arcu. Proin eget lacus vel massa feugiat porta.', '2021-10-15 00:00:00', '“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero. In euismod et urna ut pulvinar.\"', '<p>Mulai 28 Juli 2021, Google memperbarui kebijakan bagi para pengembang aplikasi pinjaman online di India dan Indonesia. Khusus di Indonesia, Google hanya akan mengizinkan aplikasi pinjaman pribadi yang diberi lisensi oleh, atau terdaftar di OJK. \"Sesuai dengan kebijakan kami, harus ada nomor yang terdaftar di OJK atau minimal nomor registrasi pendaftaran ke OJK,\" jelas perwakilan Google Indonesia ketika dihubungi KompasTekno melalui pesan singkat, Jumat (15/10/2021).</p>', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero. In euismod et urna ut pulvinar. Donec vitae est arcu. Proin eget lacus vel massa feugiat porta.', '1634405166567newssss.jpg', '016241c8-b725-43d5-8a50-94f5c86ea494', '2021-11-01 12:17:40'),
(9, 'Dianggap Langgar Privasi, Google Blokir Iklan Aplikasi Penyadap', '[{\"text\":\"google\"},{\"text\":\"internet\"}]', 'loremipsumsum tulang belakang', '2021-10-16 00:00:00', '“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero. In euismod et urna ut pulvinar.\"', '<p><strong>RAKSASA </strong>Google memperketat privasi untuk para penggunanya dengan menutup beberapa iklan yang dianggap memata-matai. Iklan tersebut dianggap mempromosikan aplikasi yang mendorong pengguna memata-matai ponsel pasangan.</p><p>Aplikasi spyware ini memang biasa digunakan orangtua yang ingin memantau panggilan, pesan, aplikasi, foto dan lokasi anak mereka. Namun, aplikasi tersebut sering dirancang untuk dipasang secara diam-diam tanpa persetujuan pemilik perangkat.</p><p>“Kami tidak mengizinkan iklan yang mempromosikan spyware untuk pengawasan pengguna,\" kata juru bicara Google, dikutip dari TechCrunch, Sabtu (16/19/2021).</p>', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero. In euismod et urna ut pulvinar. Donec vitae est arcu. Proin eget lacus vel massa feugiat porta.', '1634405373201google.jpg', '016241c8-b725-43d5-8a50-94f5c86ea494', '2021-11-01 12:17:44'),
(11, 'Hujan Longsor melanda sitinjau lauik', '[{\"text\":\"google\"},{\"text\":\"internet\"}]', 'Terjadi longsor akibat hujan lebat', '2021-10-20 00:00:00', '“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero. In euismod et urna ut pulvinar.\"', '<p>beberapa korban berhasil diselamatkan</p>', 'disini berisi konten dua', '1635257507582google.jpeg', '016241c8-b725-43d5-8a50-94f5c86ea494', '2021-11-01 12:17:48'),
(12, 'ELSAM Tanggapi Laporan Google soal RI Banyak Minta Hapus Konten  Baca artikel CNN Indonesia \"ELSAM Tanggapi Laporan Google soal RI Banyak Minta Hapus Konten\"', '[{\"text\":\"teknologi\"},{\"text\":\"google\"},{\"text\":\"terbaru\"}]', 'Google mencatat Indonesia menjadi negara yang paling banyak menghapus dan mengajukan permintaan penghapusan konten atau informasi. (Foto: istockphoto/volkan.basar)  Baca artikel CNN Indonesia \"ELSAM Tanggapi Laporan Google soal RI Banyak Minta Hapus Konten\"', '2021-10-26 00:00:00', '“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero. In euismod et urna ut pulvinar.\"', '<p>Jakarta, CNN Indonesia -- Peneliti Lembaga Studi &amp; Advokasi Masyarakat (ELSAM), Alia Yofira menanggapi laporan transparansi Google terkait Indonesia menjadi negara yang banyak menghapus dan mengajukan permintaan penghapusan konten atau informasi terbanyak pada periode Januari-Juni 2021.<br>Menurut Alia, permintaan penghapusan konten di Indonesia memiliki sejumlah masalah jika merujuk pada pasal 40 ayat 2b yang secara khusus mengatur pemutusan akses ke sebuah konten.<br><br>Penghapusan konten di Indonesia dilakukan berdasarkan UU ITE, khususnya pasal 40 ayat 2b yang mengatur bahwa pemerintah berwenang untuk melakukan pemutusan akses ke konten yang memiliki muatan yang melanggar hukum, kata Alia kepada CNNindonesia.com melalui pesan teks, Selasa (26/10).<br><br>Baca artikel CNN Indonesia ELSAM Tanggapi Laporan Google soal RI Banyak Minta Hapus Konten selengkapnya di sini: <a href=\"https://www.cnnindonesia.com/teknologi/20211026190406-185-712725/elsam-tanggapi-laporan-google-soal-ri-banyak-minta-hapus-konten\">https://www.cnnindonesia.com/teknologi/20211026190406-185-712725/elsam-tanggapi-laporan-google-soal-ri-banyak-minta-hapus-konten</a>.<br><br>Download Apps CNN Indonesia sekarang https://app.cnnindonesia.com/</p>', 'disini konten dua', '1635257849060google.jpeg', '016241c8-b725-43d5-8a50-94f5c86ea494', '2021-11-01 12:17:50'),
(17, 'Cek Rp 35,9 M yang Tercecer di Bandara Soetta Dikembalikan, Ini Pemiliknya  Baca artikel detiknews, \"Cek Rp 35,9 M yang Tercecer di Bandara Soetta Dikembalikan, Ini Pemiliknya\" selengkapnya https://news.detik.com/berita/d-5792465/cek-rp-359-m-yang-tercecer-di-bandara-soetta-dikembalikan-ini-pemiliknya. ', '[{\"text\":\"detik.news\"}]', 'Cek Rp 35,9 miliar dikembalikan ke pemiliknya, pengusaha bernama Sunardi (batik) Foto: dok ist  Baca artikel detiknews, \"Cek Rp 35,9 M yang Tercecer di Bandara Soetta Dikembalikan, Ini Pemiliknya\" selengkapnya https://news.detik.com/berita/d-5792465/cek-rp-359-m-yang-tercecer-di-bandara-soetta-dikembalikan-ini-pemiliknya.  Download Apps Detikcom Sekarang https://apps.detik.com/detik/', '2021-11-01T19:43:00+07:00', 'Polisi Ungkap Cek Rp 35,9 M Tercecer di Soetta Milik Pengusaha Jambi  ', '<p>Jakarta - Dompet dan cek senilai Rp 35,9 miliar yang tercecer di Bandara Soekarno-Hatta bernama akhirnya dikembalikan ke pemiliknya. Dompet dan cek tersebut sebelumnya ditemukan cleaning service bandara bernama Halimah.<br>Agenda pengembalian dompet dan cek senilai Rp 35,9 miliar ini dilakukan di Bandara Sultan Thaha II di Jambi, Senin (1/10/2021). Pengembalian dilakukan oleh perwakilan Aviation Security Bandara Internasional Soekarno-Hatta AP II kepada pemiliknya, pengusaha bernama Sunardi.<br><br>\"Kami sangat bersyukur barang yang tertinggal ini dapat diamankan dan dikembalikan ke pemiliknya,\" kata Direktur Utama PT Angkasa Pura Solusi Dorma Manalu dalam keterangannya, Senin (1/10/2021).<br><br>Baca artikel detiknews, \"Cek Rp 35,9 M yang Tercecer di Bandara Soetta Dikembalikan, Ini Pemiliknya\" selengkapnya <a href=\"https://news.detik.com/berita/d-5792465/cek-rp-359-m-yang-tercecer-di-bandara-soetta-dikembalikan-ini-pemiliknya\">https://news.detik.com/berita/d-5792465/cek-rp-359-m-yang-tercecer-di-bandara-soetta-dikembalikan-ini-pemiliknya</a>.<br><br>Download Apps Detikcom Sekarang https://apps.detik.com/detik/</p>', '<p>\"Ini dapat terjadi berkat koordinasi para pihak, dan seluruh staf bandara termasuk Ibu Halimah yang bekerja dengan mengedepankan kejujuran dan amanah sesuai nilai utama SDM AP II yaitu Amanah, Kompeten, Harmonis, Loyal, Adaptif dan Kolaboratif (AKHLAK),\" sambungnya.<br><br>Dorma mengatakan, dirinya berterima kasih atas dukungan masyarakat sehingga karyawannya bisa mempraktikkan nilai-nilai utama yang diterapkan perusahaan.<br><br>Baca artikel detiknews, \"Cek Rp 35,9 M yang Tercecer di Bandara Soetta Dikembalikan, Ini Pemiliknya\" selengkapnya <a href=\"https://news.detik.com/berita/d-5792465/cek-rp-359-m-yang-tercecer-di-bandara-soetta-dikembalikan-ini-pemiliknya\">https://news.detik.com/berita/d-5792465/cek-rp-359-m-yang-tercecer-di-bandara-soetta-dikembalikan-ini-pemiliknya</a>.<br><br>Download Apps Detikcom Sekarang https://apps.detik.com/detik/</p>', '1635771681319cek-rp-359-miliar-dikembalikan-ke-pemiliknya-pengusaha-bernama-sunardi-batik-1_169.jpeg', '3eb53177-c9af-49bb-828d-c4a8a134db10', '2021-11-01 13:01:21'),
(18, 'Pakai Bahasa Indonesia, Macron Sebut Jokowi \'Sahabat yang Terhormat\'  Baca artikel detiknews, \"Pakai Bahasa Indonesia, Macron Sebut Jokowi \"Sahabat yang Terhormat\"', '[{\"text\":\"france\"},{\"text\":\"international\"}]', 'Foto: Presiden Jokowi mengadakan pertemuan bilateral dengan Presiden Prancis Emmanuel Macron. Kerja sama pertahanan hingga perubahan iklim dibahas kedua presiden. (Laily Rachev - Biro Pers Sekretariat Presiden)  Baca artikel detiknews, \"Pakai Bahasa Indonesia, Macron Sebut Jokowi \'Sahabat yang Terhormat\'', '', 'Sejumlah Kesepakatan yang Dibuat dari Konferensi Kelompok G20 di Italia', '<p>Jakarta - Presiden Prancis Emmanuel Macron menyebut Presiden Jokowi merupakan sahabat terhormat. Hal itu diungkapkan Macron melalui Twitternya.<br>Cuitan Macron dibuat menggunakan bahasa Indonesia. Cuitan itu diunggah Macron pada Sabtu (30/10). Dalam cuitannya itu Macron pun sekaligus mengunggah foto bersama Jokowi.<br><br>Macron mengatakan semua negara harus bertindak demi terjalinnya kerja sama dan perdamaian.<br><br>\"Bersama jajaran mitra, kita akan terus bertindak agar kawasan Indo-Pasifik tetap menjadi ruang untuk perdamaian dan kerja sama,\" tulis Macron seperti dilihat detikcom, Senin (1/11/2021)</p>', '<p>Macron lalu berharap kepada Indonesia untuk menjadi pelaku utama dalam menjaga perdamaian dan kerja sama di kawasan Indo-Pasifik. Dia menyebut Jokowi lebih dari sekedar mitra melainkan sahabat terhormat.<br><br>\"Perihal ini, Indonesia adalah pelaku utama, lebih dari sekadar mitra, yakni sahabat, @jokowi yang terhormat,\" sambungnya.<br><br>Jokowi Bincang dengan Macron di Sela KTT G20<br>Sebelumnya, Jokowi juga sempat bertemu dengan Macron membahas kerja sama bilateral di sela kegiatan KTT G20 di Roma, Italia. Jokowi mengapresiasi kemajuan kerja sama pertahanan Indonesia dengan Prancis.</p>', '1635772328818presiden-jokowi-mengadakan-pertemuan-bilateral-dengan-presiden-prancis-emmanuel-macron-kerja-sama-pertahanan-hingga-perubahan-_169.jpeg', '3eb53177-c9af-49bb-828d-c4a8a134db10', '2021-11-01 13:15:52');

-- --------------------------------------------------------

--
-- Table structure for table `loker`
--

CREATE TABLE `loker` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `bidang` varchar(100) DEFAULT NULL,
  `kriteria` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `kualifikasi` text DEFAULT NULL,
  `jenis` varchar(100) DEFAULT NULL,
  `gaji` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `pengalaman` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loker`
--

INSERT INTO `loker` (`id`, `judul`, `bidang`, `kriteria`, `deskripsi`, `kualifikasi`, `jenis`, `gaji`, `note`, `deadline`, `alamat`, `pengalaman`, `created_at`) VALUES
(4, 'Admin Online', 'Administrasi', 'Selalu up to date', '<ul><li>Edit foto dan upload produk ke marketplace seperti Tokopedia, Shopee, Lazada, Blibli, dsb</li><li>Mengurus sistem Jubelio</li><li>Melakukan photo dan video editing untuk content social media perusahaan</li><li>Melakukan rekaman video semacam menjual/mengulas/review produk</li><li>Bila dibutuhkan, siap menjadi talent untuk content media</li><li>Pekerjaan digital marketing, administrasi dan operasional lainnya</li></ul>', '<p>Syarat Wajib:</p><ul><li>Usia 18-25</li><li>Mahir menggunakan Adobe Photoshop atau punya basic editing Design Grafis</li><li>Jujur, Bertanggung Jawab, Loyal/Setia, Semangat kerja yang tinggi</li><li>Rajin dan mampu bekerja sendiri tanpa harus dipantau</li><li>FULL TIME, jangka panjang, tidak sedang/tidak akan kuliah/tidak sedang kelas karyawan</li></ul><p>Syarat Opsional (nilai lebih jika ada):</p><ul><li>Bisa menggunakan software video editing</li></ul>', '[\"Penuh waktu\",\"Fresh Graduate\",\"Kontrak\"]', 'Rp 3.000.000 - Rp 4.000.000', 'Kirimkan portfolio dari hasil kerja yang pernah dilakukan (bisa berupa URL/link ke sosmed, youtube, dsb), informasikan kontribusi pribadi bila project dilakukan bbrp orang dlm 1 team.', '2021-10-07', 'Sidoarjo, Jawa Timur', '< 1 Tahun', '2021-10-30 11:50:32'),
(8, 'Admin Online', 'Administrasi', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang admin online', '', '', '[\"Penuh waktu\",\"Fresh Graduate\",\"Kontrak\"]', 'Rp. 3.000.000 - Rp 4.000.000', 'Kirimkan portfolio dari hasil kerja yang pernah dilakukan (bisa berupa URL/link ke sosmed, youtube, dsb), informasikan kontribusi pribadi bila project dilakukan bbrp orang dlm 1 team.', '2023-10-26', 'Sidoarjo, Jawa Timur', '< 1 Tahun', '2021-10-18 16:40:21'),
(9, 'Therapist', 'Layanan', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang terapi dan kesehatan', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(10, 'Social Media Specialist', 'Medsos', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang sosial media', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(11, 'Desain Grafis', 'Design', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang desain grafis', '', '', '[\"Penuh waktu\",\"Fresh Graduate\",\"Kontrak\"]', 'Rp. 3.000.000 - Rp 4.000.000', 'Kirimkan portfolio dari hasil kerja yang pernah dilakukan (bisa berupa URL/link ke sosmed, youtube, dsb), informasikan kontribusi pribadi bila project dilakukan bbrp orang dlm 1 team.', '2023-10-26', 'Sidoarjo, Jawa Timur', '< 1 Tahun', '2021-10-18 16:40:21'),
(12, 'Therapist', 'Layanan', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang terapi dan kesehatan', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(13, 'Social Media Specialist', 'Medsos', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang sosial media', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(14, 'Admin Online', 'Administrasi', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang admin online', '', '', '[\"Penuh waktu\",\"Fresh Graduate\",\"Kontrak\"]', 'Rp. 3.000.000 - Rp 4.000.000', 'Kirimkan portfolio dari hasil kerja yang pernah dilakukan (bisa berupa URL/link ke sosmed, youtube, dsb), informasikan kontribusi pribadi bila project dilakukan bbrp orang dlm 1 team.', '2023-10-26', 'Sidoarjo, Jawa Timur', '< 1 Tahun', '2021-10-18 16:40:21'),
(15, 'Therapist', 'Layanan', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang terapi dan kesehatan', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(16, 'Social Media Specialist', 'Medsos', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang sosial media', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(17, 'Desain Grafis', 'Design', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang desain grafis', '', '', '[\"Penuh waktu\",\"Fresh Graduate\",\"Kontrak\"]', 'Rp. 3.000.000 - Rp 4.000.000', 'Kirimkan portfolio dari hasil kerja yang pernah dilakukan (bisa berupa URL/link ke sosmed, youtube, dsb), informasikan kontribusi pribadi bila project dilakukan bbrp orang dlm 1 team.', '2023-10-26', 'Sidoarjo, Jawa Timur', '< 1 Tahun', '2021-10-18 16:40:21'),
(18, 'Therapist', 'Layanan', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang terapi dan kesehatan', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(19, 'Social Media Specialist', 'Medsos', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang sosial media', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(20, 'Social Media Specialist', 'Medsos', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang sosial media', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(21, 'Admin Online', 'Administrasi', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang admin online', '', '', '[\"Penuh waktu\",\"Fresh Graduate\",\"Kontrak\"]', 'Rp. 3.000.000 - Rp 4.000.000', 'Kirimkan portfolio dari hasil kerja yang pernah dilakukan (bisa berupa URL/link ke sosmed, youtube, dsb), informasikan kontribusi pribadi bila project dilakukan bbrp orang dlm 1 team.', '2023-10-26', 'Sidoarjo, Jawa Timur', '< 1 Tahun', '2021-10-18 16:40:21'),
(22, 'Therapist', 'Layanan', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang terapi dan kesehatan', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(23, 'Social Media Specialist', 'Medsos', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang sosial media', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(24, 'Desain Grafis', 'Design', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang desain grafis', '', '', '[\"Penuh waktu\",\"Fresh Graduate\",\"Kontrak\"]', 'Rp. 3.000.000 - Rp 4.000.000', 'Kirimkan portfolio dari hasil kerja yang pernah dilakukan (bisa berupa URL/link ke sosmed, youtube, dsb), informasikan kontribusi pribadi bila project dilakukan bbrp orang dlm 1 team.', '2023-10-26', 'Sidoarjo, Jawa Timur', '< 1 Tahun', '2021-10-18 16:40:21'),
(25, 'Therapist', 'Layanan', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang terapi dan kesehatan', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(26, 'Social Media Specialist', 'Medsos', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang sosial media', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(27, 'Admin Online', 'Administrasi', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang admin online', '', '', '[\"Penuh waktu\",\"Fresh Graduate\",\"Kontrak\"]', 'Rp. 3.000.000 - Rp 4.000.000', 'Kirimkan portfolio dari hasil kerja yang pernah dilakukan (bisa berupa URL/link ke sosmed, youtube, dsb), informasikan kontribusi pribadi bila project dilakukan bbrp orang dlm 1 team.', '2023-10-26', 'Sidoarjo, Jawa Timur', '< 1 Tahun', '2021-10-18 16:40:21'),
(28, 'Therapist', 'Layanan', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang terapi dan kesehatan', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(29, 'Social Media Specialist', 'Medsos', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang sosial media', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(30, 'Desain Grafis', 'Design', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang desain grafis', '', '', '[\"Penuh waktu\",\"Fresh Graduate\",\"Kontrak\"]', 'Rp. 3.000.000 - Rp 4.000.000', 'Kirimkan portfolio dari hasil kerja yang pernah dilakukan (bisa berupa URL/link ke sosmed, youtube, dsb), informasikan kontribusi pribadi bila project dilakukan bbrp orang dlm 1 team.', '2023-10-26', 'Sidoarjo, Jawa Timur', '< 1 Tahun', '2021-10-18 16:40:21'),
(31, 'Therapist', 'Layanan', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang terapi dan kesehatan', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(32, 'Social Media Specialist', 'Medsos', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang sosial media', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(33, 'Admin Online', 'Administrasi', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang admin online', '', '', '[\"Penuh waktu\",\"Fresh Graduate\",\"Kontrak\"]', 'Rp. 3.000.000 - Rp 4.000.000', 'Kirimkan portfolio dari hasil kerja yang pernah dilakukan (bisa berupa URL/link ke sosmed, youtube, dsb), informasikan kontribusi pribadi bila project dilakukan bbrp orang dlm 1 team.', '2023-10-26', 'Sidoarjo, Jawa Timur', '< 1 Tahun', '2021-10-18 16:40:21'),
(34, 'Therapist', 'Layanan', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang terapi dan kesehatan', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(35, 'Desain Grafis', 'Design', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang desain grafis', '', '', '[\"Penuh waktu\",\"Fresh Graduate\",\"Kontrak\"]', 'Rp. 3.000.000 - Rp 4.000.000', 'Kirimkan portfolio dari hasil kerja yang pernah dilakukan (bisa berupa URL/link ke sosmed, youtube, dsb), informasikan kontribusi pribadi bila project dilakukan bbrp orang dlm 1 team.', '2023-10-26', 'Sidoarjo, Jawa Timur', '< 1 Tahun', '2021-10-18 16:40:21'),
(36, 'Therapist', 'Layanan', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang terapi dan kesehatan', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(37, 'Social Media Specialist', 'Medsos', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang sosial media', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(38, 'Social Media Specialist', 'Medsos', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang sosial media', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(39, 'Admin Online', 'Administrasi', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang admin online', '', '', '[\"Penuh waktu\",\"Fresh Graduate\",\"Kontrak\"]', 'Rp. 3.000.000 - Rp 4.000.000', 'Kirimkan portfolio dari hasil kerja yang pernah dilakukan (bisa berupa URL/link ke sosmed, youtube, dsb), informasikan kontribusi pribadi bila project dilakukan bbrp orang dlm 1 team.', '2023-10-26', 'Sidoarjo, Jawa Timur', '< 1 Tahun', '2021-10-18 16:40:21'),
(40, 'Therapist', 'Layanan', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang terapi dan kesehatan', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(41, 'Social Media Specialist', 'Medsos', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang sosial media', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(42, 'Desain Grafis', 'Design', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang desain grafis', '', '', '[\"Penuh waktu\",\"Fresh Graduate\",\"Kontrak\"]', 'Rp. 3.000.000 - Rp 4.000.000', 'Kirimkan portfolio dari hasil kerja yang pernah dilakukan (bisa berupa URL/link ke sosmed, youtube, dsb), informasikan kontribusi pribadi bila project dilakukan bbrp orang dlm 1 team.', '2023-10-26', 'Sidoarjo, Jawa Timur', '< 1 Tahun', '2021-10-18 16:40:21'),
(43, 'Desain Grafis', 'Design', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang desain grafis', '', '', '[\"Penuh waktu\",\"Fresh Graduate\",\"Kontrak\"]', 'Rp. 3.000.000 - Rp 4.000.000', 'Kirimkan portfolio dari hasil kerja yang pernah dilakukan (bisa berupa URL/link ke sosmed, youtube, dsb), informasikan kontribusi pribadi bila project dilakukan bbrp orang dlm 1 team.', '2023-10-26', 'Sidoarjo, Jawa Timur', '< 1 Tahun', '2021-10-18 16:40:21'),
(44, 'Therapist', 'Layanan', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang terapi dan kesehatan', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(45, 'Social Media Specialist', 'Medsos', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang sosial media', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(46, 'Admin Online', 'Administrasi', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang admin online', '', '', '[\"Penuh waktu\",\"Fresh Graduate\",\"Kontrak\"]', 'Rp. 3.000.000 - Rp 4.000.000', 'Kirimkan portfolio dari hasil kerja yang pernah dilakukan (bisa berupa URL/link ke sosmed, youtube, dsb), informasikan kontribusi pribadi bila project dilakukan bbrp orang dlm 1 team.', '2023-10-26', 'Sidoarjo, Jawa Timur', '< 1 Tahun', '2021-10-18 16:40:21'),
(47, 'Therapist', 'Layanan', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang terapi dan kesehatan', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(48, 'Social Media Specialist', 'Medsos', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang sosial media', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48'),
(49, 'Desain Grafis', 'Design', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang desain grafis', '', '', '[\"Penuh waktu\",\"Fresh Graduate\",\"Kontrak\"]', 'Rp. 3.000.000 - Rp 4.000.000', 'Kirimkan portfolio dari hasil kerja yang pernah dilakukan (bisa berupa URL/link ke sosmed, youtube, dsb), informasikan kontribusi pribadi bila project dilakukan bbrp orang dlm 1 team.', '2023-10-26', 'Sidoarjo, Jawa Timur', '< 1 Tahun', '2021-10-18 16:40:21'),
(50, 'Therapist', 'Layanan', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang terapi dan kesehatan', '', '', '[]', 'Rp. 3.000.000 - Rp 4.000.000', '', '2021-10-21', 'Semarang, Jawa Tengah', '< 1 Tahun', '2021-10-18 16:47:48');

-- --------------------------------------------------------

--
-- Table structure for table `pelatihan`
--

CREATE TABLE `pelatihan` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `jenis` varchar(20) NOT NULL DEFAULT 'offline',
  `subtitle` varchar(100) DEFAULT NULL,
  `img` varchar(255) NOT NULL,
  `tempat` varchar(150) DEFAULT NULL,
  `waktu` varchar(50) DEFAULT NULL,
  `akses` varchar(100) DEFAULT NULL,
  `expire` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelatihan`
--

INSERT INTO `pelatihan` (`id`, `title`, `jenis`, `subtitle`, `img`, `tempat`, `waktu`, `akses`, `expire`, `created_at`) VALUES
(3, 'Pelatihan Offline PAZ Al Kasaw Basic Mei 2021', 'online', 'Khusus muslimin muslimah', '1634485585883potrait5.png', 'Bandung', '2021-10-29', 'Waktu Akses Lifetime', 'Kapanpun', '2021-10-29 20:25:16'),
(4, 'Pelatihan Offline PAZ Al Kasaw Basic Oktober 2021', 'offline', 'Khusus muslimah', '1634485653120potrait4.png', 'Bogor, Jl. Merdeka, No.3', '', 'Waktu Akses Lifetime', 'Seumur hidup', '2021-10-17 15:47:33'),
(5, 'Pelatihan Offline PAZ Al Kasaw Basic November 2021', 'online', 'Khusus muslim', '1634485707572potrait1.png', 'Bandung', '', 'Waktu Akses Lifetime', 'Kapanpun', '2021-10-17 15:48:27'),
(6, 'Pelatihan Offline PAZ Al Kasaw Basic Mei 2021', 'offline', 'Khusus muslim', '1634485757213potrait6.png', 'Bogor, Jl. Merdeka, No.3', '2021-10-12', 'Waktu Akses Lifetime', 'Seumur hidup', '2021-10-17 15:49:17'),
(7, 'Pelatihan Online PAZ Al Kasaw Basic November 2021', 'online', 'Khusus muslim', '1634485894326potrait6.png', 'Zoom meeting', '2021-10-28', 'Waktu Akses Lifetime', 'Seumur hidup', '2021-10-17 15:51:34'),
(9, 'Pelatihan Online PAZ Al Kasaw Basic Januari 2022', 'online', 'Khusus muslim', '1634486024600potrait2.png', 'Bogor, Jl. Merdeka, No.3', '2022-10-07', 'Waktu Akses Lifetime', 'Kapanpun', '2021-10-17 15:53:44'),
(10, 'Pelatihan Online PAZ Al Kasaw Basic Januari 2022', 'online', 'Khusus muslimah', '1634486139606potrait5.png', 'Google meet', '2022-10-01', 'Waktu Akses Lifetime', 'Kapanpun', '2021-10-17 15:55:39'),
(11, 'Pelatihan Offline PAZ Al Kasaw Basic Mei 2021', 'offline', 'Khusus muslim', '1634486328873potrait1.png', 'Bogor, Jl. Merdeka, No.3', '', 'Waktu Akses Lifetime', 'Kapanpun', '2021-10-17 15:58:48'),
(12, 'Pelatihan Online PAZ Al Kasaw Basic Januari 2022', 'online', 'Muslim & Muslimah', '1634493019312potrait1.png', 'Bogor, Jl. Merdeka, No.3', '2022-10-07', 'Sesuai waktu', 'Sekali', '2021-10-17 17:50:19');

-- --------------------------------------------------------

--
-- Table structure for table `struktur`
--

CREATE TABLE `struktur` (
  `id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL,
  `nip` varchar(50) DEFAULT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `struktur`
--

INSERT INTO `struktur` (`id`, `title`, `name`, `img`, `telp`, `nip`, `prefix`, `created_at`) VALUES
(2, 'Direktur', 'Tri Hariyanto', '1635352099073Rectangle 21831.png', '081121728344', 'MB13412001', 'direktur', '2021-10-27 23:41:56'),
(3, 'Ka.Div Pelatihan', 'M. Baihaqi M.', '1635352208422Rectangle 21831 (1).png', '0821212121', 'MB13412020', 'pelatih', '2021-10-27 23:41:56'),
(4, 'Ka. Div Operasional', 'Haryanto Bilal M.', '1635352276149Rectangle 21831 (2).png', '0812727281', 'MB13412023', 'operasional', '2021-10-27 23:41:56'),
(5, 'Ka. Div Finance', 'Yusuf Ardianto', '1635352397196Rectangle 21831 (3).png', '0823827383', 'MB13412024', 'finance', '2021-10-27 23:41:56'),
(6, 'Ka. Div Human Capital', 'Anjrah Ari Susanto', '1635352466999Rectangle 21831 (4).png', '0823738475', 'MB13412025', 'human', '2021-10-27 23:41:56'),
(7, 'Ka. Div Marketing', 'Andimara Nur', '1635352518321Rectangle 21831 (5).png', '0823726384', 'MB13412029', 'marketing', '2021-10-27 23:41:56');

-- --------------------------------------------------------

--
-- Table structure for table `testimoni`
--

CREATE TABLE `testimoni` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `tipe` varchar(10) DEFAULT NULL,
  `address` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `testimoni`
--

INSERT INTO `testimoni` (`id`, `name`, `img`, `video`, `tipe`, `address`, `content`, `created_at`) VALUES
(2, 'Pak Tri Haryanto', '1634496013846avatar-2.jpg', NULL, NULL, 'Klaten', 'Bukan sekedar cerita orang, tapi saya alami sendiri asma menahun bahkan setiap bangun tidur asma saya kambuh, dalam sehari minimal 3 kali saya menyemprotkan ventolin ke dalam mulut. Namun Alhamdullillah setelah terapi dengan pengobatan akhir jaman oleh ustadz Haris Moedjahid asma saya sudah sembuh', '2021-10-17 18:40:13'),
(3, 'Ibu Noviyani', '1634496132934avatar-1.jpg', NULL, NULL, 'Jakarta Barat', 'Wasilah PAZ yang membuat saya sembuh dari syaraf kejepit yang selama 7 tahun di derita dan asma dari kecil. Bukan sekedar omdo ya, tapi real. Alhamdulillah sekarang jadi terapis yang menyembuhkan syaraf kejepit yang dulu bagi saya tuh hal ga mungkin, wong buat berdiri aja susah kog, Biidznillah', '2021-10-30 18:08:31'),
(5, 'Darmansyah', '1634496205286avatar-7.jpg', NULL, NULL, 'Samarinda', 'Saya kemaren sakit bagian leher. Sekali paz, bi idznillah sakit hilang. Kata istri enak ya kalau ada sakit bisa langsung mengobati sendiri. Istri hasil scan getah bening agak besar, diperiksa ala s.o.p paz terasa sakit. Sekali paz bi idznillah sakit berkurang drastis, 2x paz sakit hilang. Saya belajar baru weekend kemaren', '2021-10-17 18:43:25'),
(6, 'Yahya Waloni', '1634496248881avatar-6.jpg', NULL, NULL, 'Manado', 'Wasilah PAZ yang membuat saya sembuh dari syaraf kejepit yang selama 7 tahun di derita dan asma dari kecil. Bukan sekedar omdo ya, tapi real. Alhamdulillah sekarang jadi terapis yang menyembuhkan syaraf kejepit yang dulu bagi saya tuh hal ga mungkin, wong buat berdiri aja susah kog, Biidznillah', '2021-10-17 18:44:08'),
(12, 'Ibu Noviyani', NULL, '1635677473549sample-mp4-file-small.mp4', 'video', 'Jl. Tomang Raya ', 'Wasilah PAZ yang membuat saya sembuh dari syaraf kejepit yang selama 7 tahun di derita dan asma dari kecil. Bukan sekedar omdo ya, tapi real. Alhamdulillah sekarang jadi terapis yang menyembuhkan syaraf kejepit yang dulu bagi saya tuh hal ga mungkin, wong buat berdiri aja susah kog, Biidznillah	\n', '2021-10-31 10:51:13');

-- --------------------------------------------------------

--
-- Table structure for table `timeline`
--

CREATE TABLE `timeline` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `lokasi` varchar(100) DEFAULT NULL,
  `bulan` varchar(20) DEFAULT NULL,
  `date_range` varchar(50) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `timeline`
--

INSERT INTO `timeline` (`id`, `title`, `lokasi`, `bulan`, `date_range`, `img`, `created_at`) VALUES
(12, 'PAZ Basic Batam', 'Batams', 'november 2021', '6 - 7 November 2021', '1635432068191Document.png', '2021-10-28 14:41:08'),
(13, 'PAZ Basic Surabaya', 'surabaya', 'november 2021', '9 - 15 November 2021', '1635432068191Document.png', '2021-10-28 14:41:08'),
(14, 'PAZ Basic Online', 'Batam', 'november 2021', '16 - 20 November 2021', '1635432068191Document.png', '2021-10-28 14:41:08'),
(15, 'PAZ Basic Solo', 'solok', 'november 2021', '21 - 25 November 2021', '1635432068191Document.png', '2021-10-28 14:41:08'),
(16, 'PAZ Basic PADANG', 'padang', 'desember 2021', '4 - 5 Desember 2021', '1635432242347Document.png', '2021-10-28 14:44:02'),
(17, 'PAZ Basic Medan', 'medan', 'desember 2021', '7 - 9 Desember 2021', '1635432242347Document.png', '2021-10-28 14:44:02'),
(18, 'PAZ Basic Bogor', 'Bogorss', 'januari 2022', '8 - 9 Januari 2022', '1635432313480Document.png', '2021-10-28 14:45:13'),
(19, 'PAZ Basic Bandung', 'bandung', 'januari 2022', '11 - 12 Januari 2022', '1635432313480Document.png', '2021-10-28 14:45:13'),
(20, 'PAZ Basic MALANG', 'Malang', 'februari 2022', '12 - 13 februari', '1635432380071Document.png', '2021-10-28 14:46:20');

-- --------------------------------------------------------

--
-- Table structure for table `timeline_group`
--

CREATE TABLE `timeline_group` (
  `id` int(11) NOT NULL,
  `bulan` varchar(20) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `timeline_group`
--

INSERT INTO `timeline_group` (`id`, `bulan`, `status`, `created_at`) VALUES
(1, 'oktober 2021', 'on', '2021-10-27 20:46:20'),
(2, 'november 2021', 'on', '2021-10-27 20:57:33'),
(3, 'desember 2021', 'on', '2021-10-27 20:58:44'),
(9, 'januari 2022', 'on', '2021-10-28 06:11:55'),
(10, 'februari 2022', 'on', '2021-10-28 06:12:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(255) NOT NULL,
  `nama_depan` varchar(100) NOT NULL,
  `nama_bel` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `telp` varchar(50) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `registered_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama_depan`, `nama_bel`, `email`, `telp`, `alamat`, `password`, `role`, `last_login`, `registered_at`) VALUES
('0218982e-5809-475c-8a60-86daf2e381dd', 'admin', NULL, 'admin@admin.com', NULL, NULL, '$2a$10$VsyHkLR9y51KGMn.bs9bwegKjNvDYRSGolC45mlMzTHwrq.rr61Da', 'admin', '2021-11-03 01:41:37', '2021-11-02 18:41:37'),
('17fb97aa-0008-4cc0-8f0a-bad1cb315432', 'new', 'new', 'new@new.com', '08123827364', 'Jl. Kuini II, No. 2', '$2a$10$/2VzjowwlWUmwmx084qr6eO0lLo/Jo7HUpWvK6D5XaQgRL07ME6fS', NULL, '2021-10-29 22:36:53', '2021-10-29 15:36:53'),
('2ed837a5-68ff-40d7-be2b-317711bc782c', 'hrd', 'paz', 'hrd@hrd.com', '08238273485', 'Bandung', '$2a$10$LA/YeVt7m7ZdzlEErl4b..yE6WpaxI1BxAyja3K740InC2KpdZesK', 'hrd', '2021-10-29 22:35:04', '2021-10-29 15:35:04'),
('3eb53177-c9af-49bb-828d-c4a8a134db10', 'Staff', 'staff', 'staff@staff.com', '0755325031', 'Jl. Kuini II, No. 2', '$2a$10$RCk0eH7Ha9IGDD6lzdXvJux8TA5Nd1y42HSn1LFlUMx23y7zlgCVK', 'staff', '2021-11-01 19:57:27', '2021-11-01 12:57:27');

-- --------------------------------------------------------

--
-- Table structure for table `visi`
--

CREATE TABLE `visi` (
  `id` int(11) NOT NULL,
  `visi` text DEFAULT NULL,
  `misi` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `visi`
--

INSERT INTO `visi` (`id`, `visi`, `misi`, `created_at`) VALUES
(1, NULL, 'Riset & pengembangan Keilmuan PAZ Al Kasaw dalam konteks pondasi yang sudah diletakkan oleh Ustadz Haris Moedjahid Rahimahullah', '2021-10-29 19:04:56'),
(2, NULL, 'Pendidikan dan pelatihan ilmu paz al kasaw berketerlanjutan dengan karakter paztrooper yang unggul', '2021-10-16 19:48:06'),
(3, NULL, 'Pengelolaan manajerial alumni berbasis IT untuk kemudahan masyarakat mendapat layanan terapi PAZ Al Kasaw', '2021-10-16 19:48:12'),
(4, NULL, 'Menjadi perusahaan yang profitable, high margin, dan memberikan intangiable values bagi stakeholder yang terlibat', '2021-10-16 19:48:16'),
(8, 'Mencetak Paztrooper (Terapis PAZ Al-Kasaw) yang Profesional, Beradab, dan Berdaya Juang', 'Memberikan inspirasi cara sehat alamiah, islami, dan praktis ke seluas luas umat muslim di dunia', '2021-10-16 19:41:58');

-- --------------------------------------------------------

--
-- Table structure for table `waktu`
--

CREATE TABLE `waktu` (
  `id` int(11) NOT NULL,
  `time` int(255) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `waktu`
--

INSERT INTO `waktu` (`id`, `time`, `status`) VALUES
(5, 100, 'off'),
(6, 50, 'on');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apply`
--
ALTER TABLE `apply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cabang`
--
ALTER TABLE `cabang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery_group`
--
ALTER TABLE `gallery_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instruktur`
--
ALTER TABLE `instruktur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kopdar_group`
--
ALTER TABLE `kopdar_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kuis`
--
ALTER TABLE `kuis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kurikulum`
--
ALTER TABLE `kurikulum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `legalitas`
--
ALTER TABLE `legalitas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `liputan`
--
ALTER TABLE `liputan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loker`
--
ALTER TABLE `loker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelatihan`
--
ALTER TABLE `pelatihan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `struktur`
--
ALTER TABLE `struktur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimoni`
--
ALTER TABLE `testimoni`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timeline`
--
ALTER TABLE `timeline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timeline_group`
--
ALTER TABLE `timeline_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visi`
--
ALTER TABLE `visi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `waktu`
--
ALTER TABLE `waktu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apply`
--
ALTER TABLE `apply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cabang`
--
ALTER TABLE `cabang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `gallery_group`
--
ALTER TABLE `gallery_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `instruktur`
--
ALTER TABLE `instruktur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `kopdar_group`
--
ALTER TABLE `kopdar_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `kuis`
--
ALTER TABLE `kuis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `kurikulum`
--
ALTER TABLE `kurikulum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `legalitas`
--
ALTER TABLE `legalitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `liputan`
--
ALTER TABLE `liputan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `loker`
--
ALTER TABLE `loker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `pelatihan`
--
ALTER TABLE `pelatihan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `struktur`
--
ALTER TABLE `struktur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `testimoni`
--
ALTER TABLE `testimoni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `timeline`
--
ALTER TABLE `timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `timeline_group`
--
ALTER TABLE `timeline_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `visi`
--
ALTER TABLE `visi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `waktu`
--
ALTER TABLE `waktu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
