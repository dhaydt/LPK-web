-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 24, 2021 at 11:32 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

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
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wa` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domisili` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provinsi` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kelamin` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pendidikan` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jurusan` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agama` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pengalaman` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alasan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempat_lhr` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_lhr` date DEFAULT NULL,
  `menikah` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `komputer` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bahasa` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ktp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ijazah` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sertifikat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skck` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `portfolio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pertanyaan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jawaban` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nilai` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loker_id` int(11) NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `apply`
--

INSERT INTO `apply` (`id`, `nama`, `wa`, `email`, `domisili`, `provinsi`, `kelamin`, `pendidikan`, `jurusan`, `agama`, `pengalaman`, `alasan`, `tempat_lhr`, `tgl_lhr`, `menikah`, `komputer`, `bahasa`, `instagram`, `facebook`, `foto`, `ktp`, `ijazah`, `sertifikat`, `skck`, `portfolio`, `pertanyaan`, `jawaban`, `nilai`, `loker_id`, `status`, `created_at`) VALUES
(35, 'Muhammad Hidayatullah', '82382852283', 'intanmandirisejahtera@gmail.com', 'solok', 'Sumatera Barat', 'laki-laki', 'S-1', 'Teknik Informatika', 'Islam', 'Sudah pernah bekerja', 'Rajin bekerja', 'Manado', '1992-09-10', 'Lajang', 'Ya', 'English, Indonesia', '910dayat', 'dhaydt', 'foto1636549911727Screenshot from 2021-10-08 19-45-16.png', 'ktp1636549911727Scan KTP.JPG', 'ijazah1636549911727ijazah.jpeg', 'serti1636549911727contoh-siup-kecil.jpg', NULL, 'porto163654991172716.06.439_jurnal_eproc.pdf', '[\"aku adalah\",\"Jumlah rukun islam\",\"Jumlah nabi ada berapa dalam islam ?\",\"Jumlah rukun iman ada berapa ?\",\"Jumlah rukun islam ada berapa ?\"]', '[{\"text\":\"saya\",\"correct\":true},{\"text\":\"5\",\"correct\":true},{\"text\":\"25\",\"correct\":true},{\"text\":\"6\",\"correct\":true},{\"text\":\"ada 4\"}]', '80', 49, 'Proses ADM', '2021-11-10 13:12:28'),
(36, 'Muhammad Hidayatullah', '822838283', 'intanmandirisejahtera@gmail.com', 'solok', 'Sumbar', 'laki-laki', 'S-1', 'TI', 'Islam', 'Sudah pernah bekerja', 'Pekerja keras', 'Padang', '1992-09-10', 'Lajang', 'Ya', 'Indonesia', 'dhyatd', 'facebook', 'foto1636573585050potrait6.png', 'ktp1636573585050potrait3.png', 'ijazah1636573585050potrait3.png', 'serti1636573585050potrait4.png', 'skck1636573585050potrait2.png', 'porto1636573585050Muhammad hidayatullah.pdf', '[\"aku adalah\",\"Jumlah rukun islam\",\"Jumlah nabi ada berapa dalam islam ?\",\"Jumlah rukun iman ada berapa ?\",\"Jumlah rukun islam ada berapa ?\"]', '[{\"text\":\"\",\"correct\":false},{\"text\":\"\",\"correct\":false},{\"text\":\"\",\"correct\":false},{\"text\":\"\",\"correct\":false},{\"text\":\"\",\"correct\":false}]', '0', 24, 'Lamaran Masuk', '2021-11-10 19:46:25');

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cabang`
--

CREATE TABLE `cabang` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cabang`
--

INSERT INTO `cabang` (`id`, `name`, `address`, `telp`, `img`, `created_at`) VALUES
(2, 'Ayub Camps', 'Jl. Tomang Raya Kav 21 – 23, Jakarta Barats', '08227282738121', '1634408235799business-address-slovenia-europe-800x445.jpg', '2021-10-29 19:59:14'),
(4, 'Yoesop Camp', 'Jl. Daan Mogot KM. 18, Cengkareng, Jakarta 11840 – Indonesia', '073 28374', '1636403406118Company-profile-3.jpg', '2021-11-08 20:30:06');

-- --------------------------------------------------------

--
-- Table structure for table `galeri`
--

CREATE TABLE `galeri` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imgTitle` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imgDesc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galeri`
--

INSERT INTO `galeri` (`id`, `title`, `desc`, `date`, `imgTitle`, `imgDesc`, `img`, `created_at`) VALUES
(39, 'Pelatihan PAZ Basic Padang', 'Pelatihan yang dilakukan pada tanggal 20 - 25 Oktober 2021 secara offline dikota Padang. peserta pada pelatihan ini mencapai 100 orang', '21 - 25 Oktober', 'PAZ Bandung 2021', '20 - 15 september', '1636372395995Image.png', '2021-11-04 08:00:21'),
(40, 'Pelatihan PAZ Basic Padang', 'Pelatihan yang dilakukan pada tanggal 20 - 25 Oktober 2021 secara offline dikota Padang. peserta pada pelatihan ini mencapai 100 orang', '21 - 25 Oktober', 'Galeri PAZ basic Padang', 'Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font,', '1636012821697Image (1).png', '2021-11-04 08:00:21'),
(41, 'Pelatihan PAZ Basic Padang', 'Pelatihan yang dilakukan pada tanggal 20 - 25 Oktober 2021 secara offline dikota Padang. peserta pada pelatihan ini mencapai 100 orang', '21 - 25 Oktober', 'Galeri PAZ basic Padang', 'Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font,', '1636012821697Image.png', '2021-11-04 08:00:22'),
(42, 'Pelatihan PAZ Basic Padang', 'Pelatihan yang dilakukan pada tanggal 20 - 25 Oktober 2021 secara offline dikota Padang. peserta pada pelatihan ini mencapai 100 orang', '21 - 25 Oktober', 'Galeri PAZ basic Padang', 'Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font,', '1636012821697google.jpg', '2021-11-04 08:00:22'),
(43, 'Pelatihan PAZ Basic Padang', 'Pelatihan yang dilakukan pada tanggal 20 - 25 Oktober 2021 secara offline dikota Padang. peserta pada pelatihan ini mencapai 100 orang', '21 - 25 Oktober', 'Galeri PAZ basic Padang', 'Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font,', '1636012821697Company-profile-3.jpg', '2021-11-04 08:00:22'),
(44, 'Pelatihan PAZ Basic Padang', 'Pelatihan yang dilakukan pada tanggal 20 - 25 Oktober 2021 secara offline dikota Padang. peserta pada pelatihan ini mencapai 100 orang', '21 - 25 Oktober', 'Galeri PAZ basic Padang', 'Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font,', '1636012821697cek-rp-359-miliar-dikembalikan-ke-pemiliknya-pengusaha-bernama-sunardi-batik-1_169.jpeg', '2021-11-04 08:00:22'),
(45, 'Pelatihan PAZ Basic Padang', 'Pelatihan yang dilakukan pada tanggal 20 - 25 Oktober 2021 secara offline dikota Padang. peserta pada pelatihan ini mencapai 100 orang', '21 - 25 Oktober', 'Galeri PAZ basic Padang', 'Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font,', '1636012821698business-address-slovenia-europe-800x445.jpg', '2021-11-04 08:00:22'),
(46, 'Pelatihan PAZ Basic Padang', 'Pelatihan yang dilakukan pada tanggal 20 - 25 Oktober 2021 secara offline dikota Padang. peserta pada pelatihan ini mencapai 100 orang', '21 - 25 Oktober', 'Galeri PAZ basic Padang', 'Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font,', '1636012821698akbp-tulus-wartawan.jpg', '2021-11-04 08:00:22'),
(47, 'Pelatihan PAZ Basic Padang', 'Pelatihan yang dilakukan pada tanggal 20 - 25 Oktober 2021 secara offline dikota Padang. peserta pada pelatihan ini mencapai 100 orang', '21 - 25 Oktober', 'PAZ ti Berhasil', '20 - 15 september', '1636365989486unauth.jpg', '2021-11-04 08:00:23'),
(48, 'PAZ Basic Premium (Ayub Camp KLATEN)', 'Galeri Pelatihan PAZ premium ', '20 - 25 Oktober', 'Galeri Pelatihan', 'Bercerita setelah pelatihan', '1636149257475IMG-20191212-WA0000.jpg', '2021-11-05 21:54:17'),
(49, 'PAZ Basic Premium (Ayub Camp KLATEN)', 'Galeri Pelatihan PAZ premium ', '20 - 25 Oktober', 'Galeri Ayyub Camp', 'Ini kegiatan PAZ Premium', '1636149257478Image (1).png', '2021-11-05 21:54:17'),
(50, 'PAZ Basic Premium (Ayub Camp KLATEN)', 'Galeri Pelatihan PAZ premium ', '20 - 25 Oktober', 'Galeri Premium', 'Lorem ipsum color dummet', '1636149257478google.jpeg', '2021-11-05 21:54:18'),
(51, 'PAZ Basic Online', 'Pelatihan Online via zoom atau google meet', '24 - 26 desember', 'Pelatihanonline kami', 'Ini kegiatan PAZ Premium', '1636149404655Image (2).png', '2021-11-05 21:56:44'),
(52, 'PAZ Basic Online', 'Pelatihan Online via zoom atau google meet', '24 - 26 desember', 'Pelatihanonline kami', 'Ini kegiatan PAZ Premium', '1636149404659Image (1).png', '2021-11-05 21:56:44'),
(53, 'PAZ Basic Online', 'Pelatihan Online via zoom atau google meet', '24 - 26 desember', 'Pelatihanonline kami', 'Ini kegiatan PAZ Premium', '1636149404659Image.png', '2021-11-05 21:56:44'),
(54, 'Pelatihan Online PAZ Al Kasaw Basic Januari 2022', 'Pelatihan Online via zoom atau google meet', '20 - 21 Januari 2022', 'Pelatihanonline kami', 'Ini kegiatan PAZ Premium', '1636149439817Image (2).png', '2021-11-05 21:57:19'),
(55, 'Pelatihan Online PAZ Al Kasaw Basic Januari 2022', 'Pelatihan Online via zoom atau google meet', '20 - 21 Januari 2022', 'Pelatihanonline kami', 'Ini kegiatan PAZ Premium', '1636149439817Image (1).png', '2021-11-05 21:57:19'),
(56, 'Pelatihan Online PAZ Al Kasaw Basic Januari 2022', 'Pelatihan Online via zoom atau google meet', '20 - 21 Januari 2022', 'Pelatihanonline kami', 'Ini kegiatan PAZ Premium', '1636149439818google.jpg', '2021-11-05 21:57:20'),
(57, 'Pelatihan Online PAZ Al Kasaw Basic Januari 2022', 'Pelatihan Online via zoom atau google meet', '20 - 21 Januari 2022', 'Pelatihanonline kami', 'Ini kegiatan PAZ Premium', '1636149439818google.jpeg', '2021-11-05 21:57:20');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'galeri',
  `lokasi` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_range` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `instruktur`
--

CREATE TABLE `instruktur` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telp` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instruktur`
--

INSERT INTO `instruktur` (`id`, `name`, `img`, `title`, `address`, `telp`, `created_at`) VALUES
(2, 'Ust. M. Baihaqi Al-Maghriby', '16366173081015.jpg', 'Trainer', 'Yogyakarta', '-', '2021-10-28 17:28:44'),
(3, 'Ust. Aslam Askarullah', '16366173191824.jpg', 'Trainer', 'Solo', '-', '2021-10-28 17:29:13'),
(4, 'Ust. Adi Bayu Nugroho', '1636616732776Desain tanpa judul (10).jpg', 'trainer online', 'Yogyakarta', '-', '2021-10-28 17:29:41'),
(5, 'Budi Purnomo', '16366173481061.jpg', 'trainer ', 'Cilacap', '-', '2021-10-28 17:30:15'),
(6, 'Sukirno', '16366174562768.jpg', 'Trainer Standar BNSP', 'Klaten', '-', '2021-10-28 17:30:43'),
(8, 'Iman Sapaat', '163661748251610.jpg', 'Trainer Standar BNSP', 'Pekalongan', '-', '2021-10-28 17:29:13'),
(9, 'Haryanto Bilal Zainul Mustaqin', '16366175594076.jpg', 'trainer Kompeten BNSP', 'Klaten', '-', '2021-10-28 17:29:41'),
(10, 'Dr. Sentot Primadianto', '16366175880989.jpg', 'trainer joss', 'Sidoarjo', '-', '2021-10-28 17:30:15'),
(11, 'Tri Hariyanto', '16366176169153.jpg', 'Trainer Kompeten', 'Klaten', '-', '2021-10-28 17:30:43'),
(12, 'Anjrah Ari Susanto', '16366175176857.jpg', 'Trainer Kompeten BNSP', 'Klaten', '-', '2021-11-11 07:58:37');

-- --------------------------------------------------------

--
-- Table structure for table `kopdar`
--

CREATE TABLE `kopdar` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imgTitle` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imgDesc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kopdar`
--

INSERT INTO `kopdar` (`id`, `title`, `desc`, `date`, `imgTitle`, `imgDesc`, `img`, `created_at`) VALUES
(49, 'Pelatihan PAZ Basic Yogyakarta', 'Petemuan alumni PAZ di Yogyakarta', '26 -27 desember', 'Pelatihan PAZ Basic Yogyakarta', 'Kopdar alumni PAZ Jogakarta', '1637312878694WhatsApp Image 2021-11-12 at 07.38.49.jpeg', '2021-11-04 08:16:14'),
(50, 'Pelatihan PAZ Basic Yogyakarta', 'Petemuan alumni PAZ di Yogyakarta', '26 -27 desember', 'Pelatihan PAZ Basic Yogyakarta', 'Kopdar alumni PAZ Jogakarta', '1637312885129WhatsApp Image 2021-11-12 at 07.38.51 (1).jpeg', '2021-11-04 08:16:14'),
(51, 'Pelatihan PAZ Basic Yogyakarta', 'Petemuan alumni PAZ di Yogyakarta', '26 -27 desember', 'Pelatihan PAZ Basic Yogyakarta', 'Kopdar alumni PAZ Jogakarta', '1637312896705WhatsApp Image 2021-11-12 at 07.38.51.jpeg', '2021-11-04 08:16:14'),
(52, 'Pelatihan PAZ Basic Yogyakarta', 'Petemuan alumni PAZ di Yogyakarta', '26 -27 desember', 'Pelatihan PAZ Basic Yogyakarta', 'Kopdar alumni PAZ Jogakarta', '1637312909166WhatsApp Image 2021-11-12 at 07.38.52 (1).jpeg', '2021-11-04 08:16:14'),
(53, 'Pelatihan PAZ Basic Yogyakarta', 'Petemuan alumni PAZ di Yogyakarta', '26 -27 desember', 'Pelatihan PAZ Basic Yogyakarta', 'Kopdar alumni PAZ Jogakarta', '1637312921108WhatsApp Image 2021-11-12 at 07.38.53.jpeg', '2021-11-04 08:16:15'),
(54, 'Pelatihan PAZ Basic Yogyakarta', 'Petemuan alumni PAZ di Yogyakarta', '26 -27 desember', 'Pelatihan PAZ Basic Yogyakarta', 'Kopdar alumni PAZ Jogakarta', '1637312930393WhatsApp Image 2021-11-12 at 07.38.52 (2).jpeg', '2021-11-04 08:16:15'),
(55, 'Pelatihan PAZ Basic Yogyakarta', 'Petemuan alumni PAZ di Yogyakarta', '26 -27 desember', 'Pelatihan PAZ Basic Yogyakarta', 'Kopdar alumni PAZ Jogakarta', '1637312940510WhatsApp Image 2021-11-12 at 07.38.52.jpeg', '2021-11-04 08:16:15'),
(56, 'Pelatihan PAZ Basic Yogyakarta', 'Petemuan alumni PAZ di Yogyakarta', '26 -27 desember', 'PAZ ti Berhasil', '20 - 15 september', '1637312947747WhatsApp Image 2021-11-12 at 07.38.53 (1).jpeg', '2021-11-04 08:16:15'),
(57, 'Kopdar PAZ Alumni Surabaya', 'Temu kangen Alumni PAZ surabaya', '12 -16 Oktober 2021', 'Kopdar alumni', 'Ini kegiatan PAZ Premium', '1637312960299WhatsApp Image 2021-11-12 at 07.38.54 (1).jpeg', '2021-11-05 21:58:15'),
(58, 'Kopdar PAZ Alumni Surabaya', 'Temu kangen Alumni PAZ surabaya', '12 -16 Oktober 2021', 'Kopdar alumni', 'Ini kegiatan PAZ Premium', '1637312974338WhatsApp Image 2021-11-12 at 07.38.54 (2).jpeg', '2021-11-05 21:58:15'),
(59, 'Kopdar PAZ Alumni Surabaya', 'Temu kangen Alumni PAZ surabaya', '12 -16 Oktober 2021', 'Kopdar alumni', 'Ini kegiatan PAZ Premium', '1637312990459WhatsApp Image 2021-11-12 at 07.38.54.jpeg', '2021-11-05 21:58:15'),
(60, 'Kopdar PAZ Alumni Klaten', 'Temu kangen alumni PAZ Klaten', '1 - 2 Janurai 2022', 'Kopdar alumni', 'Ini kegiatan PAZ Premium', '1637313008781WhatsApp Image 2021-11-12 at 07.38.55.jpeg', '2021-11-05 21:58:58');

-- --------------------------------------------------------

--
-- Table structure for table `kuis`
--

CREATE TABLE `kuis` (
  `id` int(11) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `responses` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jawaban` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `penyakit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `konten` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipe` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kurikulum`
--

INSERT INTO `kurikulum` (`id`, `name`, `subtitle`, `penyakit`, `konten`, `img`, `tipe`) VALUES
(1, 'PAZ Survival', 'How To Survive with PAZ', 'Penangan pertama pada kasus-kasus survive', '<p>PAZ Survival<br><br>Adalah salah satu upgrading yang ada di PAZ, yang bertujuan untuk membahas cara penangan pertama ketika kita sedang survive<br><br>Contoh kasus</p><ul><li>Ketika digigit ular berbisa,</li><li>ketika disengat kalajengking beracun</li><li>Ketika setelah menolong orang yang tenggelam dan menelan banyak air</li><li>Ketika anggota tubuh tersiram air panas</li><li>ketika duri ikan tertancap di tenggorokan</li><li>dan masih banyak lagi kasus-kasus unik yang dibahas di Upgrading PAZ Survival</li></ul>', '1636408815331bonfire 1.png', 'upgrading'),
(2, 'PAZ Stroke', 'All About Stroke', 'Stroke Ringan, Stoke Sebelah kanan/kiri, Stroke berat', '<p>Di Kelas Upgrading Stroke kita akan mempelajari muladi dari penyebab stroke menurut PAZ, kemudian solusi untuk berbagai macam kasus Stroke.<br>Karena pada kasus Stroke memiliki kaidah yang berbeda dari PAZ Basic, maka dari itu kami buat Upgrading Stroke<br>Contoh kasus-kasus yang dibahas di Upgrading Stroke seperti :</p><p>&nbsp;</p><ul><li>Stroke Ringan</li><li>Stroke Masih Bisa Berjalan</li><li>Stroke Bisa Tapi Tidak Bisa Berjalan</li><li>Stroke hanya Bisa Duduk dan &nbsp;berbaring</li><li>Stroke hanya bisa berbaring</li></ul><p>&nbsp;</p>', '1635617933332cerebral 1.png', 'upgrading'),
(3, 'PAZ Maryam', 'Materi ibu hamil', 'Melahirkan secara alami, tanpa robekan, tanpa rasa sakit yang berlebih', '<p>Melahirkan, adalah sesuatu yang normal bagi setiap manusia<br>Tapi kini, banyak ummahat/wanita yang takut untuk melahirkan karena khawatir dengan rasa sakitnya atau bahkan khawatir jika harus dioperasi caesar.&nbsp;<br><br>PAZ Maryam hadir untuk menjadi solusi untuk para ummahat/wanita agar bisa melahirkan dengan mudah, tanpa rasa sakit, tanpa robekan dan jahitan<br><br>Agar bisa membangun generasi unggul dari ummat islam</p>', '1635617881178mother 1.png', 'upgrading'),
(4, 'Diabetes', 'Materi mengenai penyakit gula', 'Mudah terinfeksi, luka sulit mengering merupakan salah satu gejala diabetes', '<p>Diabetes merupakan momok yang mengerikan. Bagaimana tidak, dari satu penyakit diabetes ini bisa memberikan dampak komplikasi sistemik pada tubuh manusia.<br><br>Maka dari itu Kami Munculkan Upgrading Diabetes, guna membantu teman-teman dalam menangani kasus Diabetes, karena pada saat praktek kasus diabetes butuh treatment khusus</p>', '1635617833097sugar-blood-level 1.png', 'upgrading'),
(5, 'Autoimun', 'Imun tubuh', 'Mudah sakit', '<p><strong>Kisi - Kisi Kurikulum</strong></p><p>Maecenas lorem eros, luctus placerat blandit et, mattis sed enim. Ut lacus urna, efficitur et fringilla id, pretium ac ex.</p><ul><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li><li>Nullam eu orci nisl. Aliquam et nisl libero</li></ul><p>&nbsp;</p>', '1635617775642immunity 1.png', 'upgrading'),
(6, 'Skoliosis', 'Materi mengenai tulang belakang dan saraf', 'Bentuk tulang belakang yang tidak simetris', '<p><strong>Kisi - Kisi Kurikulum</strong></p><p>Maecenas lorem eros, luctus placerat blandit et, mattis sed enim. Ut lacus urna, efficitur et fringilla id, pretium ac ex.&nbsp;</p><ul><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li><li>Nullam eu orci nisl. Aliquam et nisl libero.</li></ul>', '1635617663362Group (1) 1.png', 'upgrading'),
(7, 'Benjolan', 'PAZ Benjolan', 'Benjolan/Kanker/tumor Payudara, lipoma, benjolan di leher, dsb', '<p>Upgrading PAZ Benjolan<br><br>Adalah Upgrading yang membahas kasus-kasus benjolan<br>Seperti :</p><ul><li>Benjolan/kanker/tumor Payudara</li><li>Benjolan/tumor di leher</li><li>Benjolan di bagian pergelangan</li><li>Lipoma</li></ul><p>Bukan hanya belajar cara menterapi nya, tapi teman-teman akan diajarkan juga mengapa bisa terjadi benjolan-benjolan tersebut versi PAZ</p>', '1635531868998breast-cancer (1) 1.png', 'upgrading'),
(8, 'Babypaz', 'Seputar Bayi dan Anak-Anak', 'Cerebral palsy, down syndrom, jantung bocor, pneumonia, asma, kejang, epilepsi, polio', '<p>Upgrading BabyPAZ</p><p>Adalah Upgrading yang membahas tentang penyakit-penyakit yang ada pada bayi yang baru lahir hingga anak-anak<br>Seperti kasus</p><ul><li>Celebral Palsy</li><li>Autis</li><li>DownSyndrom</li><li>Speechdelay</li><li>Epilepsi</li></ul><p>Dengan belajar ilmu Upgrading BabyPAZ secara tidak langsung kita membantu mempresiapkan Generasi Unggul untuk ummat di masa yang akan medatang</p>', '1635530769369newborn 1.png', 'upgrading'),
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
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instansi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `legalitas`
--

INSERT INTO `legalitas` (`id`, `name`, `instansi`, `img`, `created_at`) VALUES
(11, 'Izin Menyelenggarakan Kursus', 'Disdik / Kemendikbud', '1634405969570izinfull1.png', '2021-10-16 17:39:29'),
(12, 'Surat izin pelakasanaa pelatihan', 'Dirjen', '1636402108233legalPAZ (2).png', '2021-11-08 20:08:43'),
(13, 'Sertifikat NPSN ', 'Kemendikbud', '1634406020587izin3.png', '2021-10-16 17:40:20'),
(14, 'Izin penyelenggaraan acara', 'kelurahan', '1636402177608file.png', '2021-11-08 20:09:37');

-- --------------------------------------------------------

--
-- Table structure for table `liputan`
--

CREATE TABLE `liputan` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quote` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `liputan`
--

INSERT INTO `liputan` (`id`, `title`, `tag`, `subtitle`, `date`, `quote`, `content`, `content2`, `img`, `user_id`, `created_at`) VALUES
(3, 'lorem ipsum coler met domet', '[{\"text\":\"google\"},{\"text\":\"internet\"}]', 'lorem ipsum coler met domet', '2021-10-16 23:13:00', 'lorem ipsum coler met domet', '<p>lorem</p>', 'new news', '1636403149546business-address-slovenia-europe-800x445.jpg', '016241c8-b725-43d5-8a50-94f5c86ea494', '2021-11-08 20:26:14'),
(7, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet', '[{\"text\":\"google\"},{\"text\":\"internet\"}]', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero. In euismod et urna ut pulvinar. Donec vitae est arcu. Proin eget lacus vel massa feugiat porta.', '2021-10-15 00:00:00', '“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero. In euismod et urna ut pulvinar.\"', '<p>adadadadada dad ddddaaa</p>', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero. In euismod et urna ut pulvinar. Donec vitae est arcu. Proin eget lacus vel massa feugiat porta.', '1634392469162police.png', '016241c8-b725-43d5-8a50-94f5c86ea494', '2021-11-01 12:17:01'),
(8, 'Google Hanya Izinkan Pinjol yang Terdaftar di OJK sejak 28 Juli 2021', '[{\"text\":\"google\"},{\"text\":\"internet\"}]', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero. In euismod et urna ut pulvinar. Donec vitae est arcu. Proin eget lacus vel massa feugiat porta.', '2021-10-15 00:00:00', '“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero. In euismod et urna ut pulvinar.\"', '<p>Mulai 28 Juli 2021, Google memperbarui kebijakan bagi para pengembang aplikasi pinjaman online di India dan Indonesia. Khusus di Indonesia, Google hanya akan mengizinkan aplikasi pinjaman pribadi yang diberi lisensi oleh, atau terdaftar di OJK. \"Sesuai dengan kebijakan kami, harus ada nomor yang terdaftar di OJK atau minimal nomor registrasi pendaftaran ke OJK,\" jelas perwakilan Google Indonesia ketika dihubungi KompasTekno melalui pesan singkat, Jumat (15/10/2021).</p>', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero. In euismod et urna ut pulvinar. Donec vitae est arcu. Proin eget lacus vel massa feugiat porta.', '1634405166567newssss.jpg', '016241c8-b725-43d5-8a50-94f5c86ea494', '2021-11-01 12:17:40'),
(9, 'Dianggap Langgar Privasi, Google Blokir Iklan Aplikasi Penyadap', '[{\"text\":\"google\"},{\"text\":\"internet\"}]', 'loremipsumsum tulang belakang', '2021-10-16 00:00:00', '“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero. In euismod et urna ut pulvinar.\"', '<p><strong>RAKSASA </strong>Google memperketat privasi untuk para penggunanya dengan menutup beberapa iklan yang dianggap memata-matai. Iklan tersebut dianggap mempromosikan aplikasi yang mendorong pengguna memata-matai ponsel pasangan.</p><p>Aplikasi spyware ini memang biasa digunakan orangtua yang ingin memantau panggilan, pesan, aplikasi, foto dan lokasi anak mereka. Namun, aplikasi tersebut sering dirancang untuk dipasang secara diam-diam tanpa persetujuan pemilik perangkat.</p><p>“Kami tidak mengizinkan iklan yang mempromosikan spyware untuk pengawasan pengguna,\" kata juru bicara Google, dikutip dari TechCrunch, Sabtu (16/19/2021).</p>', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero. In euismod et urna ut pulvinar. Donec vitae est arcu. Proin eget lacus vel massa feugiat porta.', '1634405373201google.jpg', '016241c8-b725-43d5-8a50-94f5c86ea494', '2021-11-01 12:17:44'),
(11, 'Hujan Longsor melanda sitinjau lauik', '[{\"text\":\"google\"},{\"text\":\"internet\"}]', 'Terjadi longsor akibat hujan lebat', '2021-10-20 00:00:00', '“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero. In euismod et urna ut pulvinar.\"', '<p>beberapa korban berhasil diselamatkan</p>', 'disini berisi konten dua', '1635257507582google.jpeg', '016241c8-b725-43d5-8a50-94f5c86ea494', '2021-11-01 12:17:48'),
(12, 'soal RI Banyak Minta Hapus Konten', '[{\"text\":\"teknologi\"},{\"text\":\"google\"},{\"text\":\"terbaru\"}]', 'Google mencatat Indonesia menjadi negara yang paling banyak menghapus dan mengajukan permintaan penghapusan konten atau informasi', '2021-10-26 00:00:00', '“Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu orci nisl. Aliquam et nisl libero. In euismod et urna ut pulvinar.\"', '<p>Jakarta, CNN Indonesia -- Peneliti Lembaga Studi &amp; Advokasi Masyarakat (ELSAM), Alia Yofira menanggapi laporan transparansi Google terkait Indonesia menjadi negara yang banyak menghapus dan mengajukan permintaan penghapusan konten atau informasi terbanyak pada periode Januari-Juni 2021.<br>Menurut Alia, permintaan penghapusan konten di Indonesia memiliki sejumlah masalah jika merujuk pada pasal 40 ayat 2b yang secara khusus mengatur pemutusan akses ke sebuah konten.<br><br>Penghapusan konten di Indonesia dilakukan berdasarkan UU ITE, khususnya pasal 40 ayat 2b yang mengatur bahwa pemerintah berwenang untuk melakukan pemutusan akses ke konten yang memiliki muatan yang melanggar hukum, kata Alia kepada CNNindonesia.com melalui pesan teks, Selasa (26/10).<br><br>Baca artikel CNN Indonesia ELSAM Tanggapi Laporan Google soal RI Banyak Minta Hapus Konten selengkapnya di sini: <a href=\"https://www.cnnindonesia.com/teknologi/20211026190406-185-712725/elsam-tanggapi-laporan-google-soal-ri-banyak-minta-hapus-konten\">https://www.cnnindonesia.com/teknologi/20211026190406-185-712725/elsam-tanggapi-laporan-google-soal-ri-banyak-minta-hapus-konten</a>.<br><br>Download Apps CNN Indonesia sekarang https://app.cnnindonesia.com/</p>', 'disini konten dua', '1635257849060google.jpeg', '016241c8-b725-43d5-8a50-94f5c86ea494', '2021-11-10 00:26:54'),
(17, 'Cek5,9 yang Tercecer di Bandara', '[{\"text\":\"detik.news\"}]', 'Cek Rp 35,9 miliar dikembalikan ke pemiliknya, pengusaha bernama Sunardi', '2021-11-01T19:43:00+07:00', 'Polisi Ungkap Cek Rp 35,9 M Tercecer di Soetta Milik Pengusaha Jambi  ', '<p>Jakarta - Dompet dan cek senilai Rp 35,9 miliar yang tercecer di Bandara Soekarno-Hatta bernama akhirnya dikembalikan ke pemiliknya. Dompet dan cek tersebut sebelumnya ditemukan cleaning service bandara bernama Halimah.<br>Agenda pengembalian dompet dan cek senilai Rp 35,9 miliar ini dilakukan di Bandara Sultan Thaha II di Jambi, Senin (1/10/2021). Pengembalian dilakukan oleh perwakilan Aviation Security Bandara Internasional Soekarno-Hatta AP II kepada pemiliknya, pengusaha bernama Sunardi.<br><br>\"Kami sangat bersyukur barang yang tertinggal ini dapat diamankan dan dikembalikan ke pemiliknya,\" kata Direktur Utama PT Angkasa Pura Solusi Dorma Manalu dalam keterangannya, Senin (1/10/2021).<br><br>Baca artikel detiknews, \"Cek Rp 35,9 M yang Tercecer di Bandara Soetta Dikembalikan, Ini Pemiliknya\" selengkapnya <a href=\"https://news.detik.com/berita/d-5792465/cek-rp-359-m-yang-tercecer-di-bandara-soetta-dikembalikan-ini-pemiliknya\">https://news.detik.com/berita/d-5792465/cek-rp-359-m-yang-tercecer-di-bandara-soetta-dikembalikan-ini-pemiliknya</a>.<br><br>Download Apps Detikcom Sekarang https://apps.detik.com/detik/</p>', '<p>\"Ini dapat terjadi berkat koordinasi para pihak, dan seluruh staf bandara termasuk Ibu Halimah yang bekerja dengan mengedepankan kejujuran dan amanah sesuai nilai utama SDM AP II yaitu Amanah, Kompeten, Harmonis, Loyal, Adaptif dan Kolaboratif (AKHLAK),\" sambungnya.<br><br>Dorma mengatakan, dirinya berterima kasih atas dukungan masyarakat sehingga karyawannya bisa mempraktikkan nilai-nilai utama yang diterapkan perusahaan.<br><br>Baca artikel detiknews, \"Cek Rp 35,9 M yang Tercecer di Bandara Soetta Dikembalikan, Ini Pemiliknya\" selengkapnya <a href=\"https://news.detik.com/berita/d-5792465/cek-rp-359-m-yang-tercecer-di-bandara-soetta-dikembalikan-ini-pemiliknya\">https://news.detik.com/berita/d-5792465/cek-rp-359-m-yang-tercecer-di-bandara-soetta-dikembalikan-ini-pemiliknya</a>.<br><br>Download Apps Detikcom Sekarang https://apps.detik.com/detik/</p>', '1635771681319cek-rp-359-miliar-dikembalikan-ke-pemiliknya-pengusaha-bernama-sunardi-batik-1_169.jpeg', '3eb53177-c9af-49bb-828d-c4a8a134db10', '2021-11-10 00:26:24'),
(19, 'Test artikel ', '[{\"text\":\"#SejarahPAZ\"}]', 'josss', '2021-11-24T14:41:28+07:00', 'kerja sekarang jangan dinanti-nanti', '<p>dengan menyebut nama Allah dan restu mama papa</p>', '<p>ini niatnya adalah untuk test ya, soalnya tadi aku edit kok loading nya lama banget<br>aku kan jadi kesel</p>', '1637566966531The Real Medical Hacker.png', '0218982e-5809-475c-8a60-86daf2e381dd', '2021-11-22 07:42:46');

-- --------------------------------------------------------

--
-- Table structure for table `loker`
--

CREATE TABLE `loker` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bidang` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kriteria` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kualifikasi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gaji` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pengalaman` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loker`
--

INSERT INTO `loker` (`id`, `judul`, `bidang`, `kriteria`, `deskripsi`, `kualifikasi`, `jenis`, `gaji`, `note`, `deadline`, `alamat`, `pengalaman`, `created_at`) VALUES
(4, 'Admin Onlineners', 'Administrasi', 'Selalu up to date', '<ul><li>Edit foto dan upload produk ke marketplace seperti Tokopedia, Shopee, Lazada, Blibli, dsb</li><li>Mengurus sistem Jubelio</li><li>Melakukan photo dan video editing untuk content social media perusahaan</li><li>Melakukan rekaman video semacam menjual/mengulas/review produk</li><li>Bila dibutuhkan, siap menjadi talent untuk content media</li><li>Pekerjaan digital marketing, administrasi dan operasional lainnya</li></ul>', '<p>Syarat Wajib:</p><ul><li>Usia 18-25</li><li>Mahir menggunakan Adobe Photoshop atau punya basic editing Design Grafis</li><li>Jujur, Bertanggung Jawab, Loyal/Setia, Semangat kerja yang tinggi</li><li>Rajin dan mampu bekerja sendiri tanpa harus dipantau</li><li>FULL TIME, jangka panjang, tidak sedang/tidak akan kuliah/tidak sedang kelas karyawan</li></ul><p>Syarat Opsional (nilai lebih jika ada):</p><ul><li>Bisa menggunakan software video editing</li></ul>', '[\"Penuh waktu\",\"Fresh Graduate\",\"Kontrak\"]', 'Rp 3.000.000 - Rp 4.000.000', 'Kirimkan portfolio dari hasil kerja yang pernah dilakukan (bisa berupa URL/link ke sosmed, youtube, dsb), informasikan kontribusi pribadi bila project dilakukan bbrp orang dlm 1 team.', '2021-10-07', 'Sidoarjo, Jawa Timur', '< 1 Tahun', '2021-11-03 17:34:01'),
(8, 'Admin Online', 'Administrasi', 'Memiliki motivasi yang kuat untuk belajar hal baru terutama bidang admin online', '', '', '[\"Penuh waktu\",\"Fresh Graduate\",\"Kontrak\"]', 'Rp. 3.000.000 - Rp 4.000.000', 'Kirimkan portfolio dari hasil kerja yang pernah dilakukan (bisa berupa URL/link ke sosmed, youtube, dsb), informasikan kontribusi pribadi bila project dilakukan bbrp orang dlm 1 team.', '2021-07-15', 'Sidoarjo, Jawa Timur', '< 1 Tahun', '2021-11-03 17:35:06'),
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
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id` int(11) NOT NULL,
  `pembuka` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proses` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interview` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pengumuman` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifikasi`
--

INSERT INTO `notifikasi` (`id`, `pembuka`, `proses`, `interview`, `pengumuman`, `created_at`) VALUES
(1, 'Selamat siang saudara', 'anda berhasil melewati seleksi administrasi kami', 'anda berhasil masuk ke tahap  interview', 'Hasil dari rekrutmen adalah kami menerima anda sebagai salah satu kandidat yang dapat melanjutkan ke tahap magang', '2021-11-09 10:11:24');

-- --------------------------------------------------------

--
-- Table structure for table `pelatihan`
--

CREATE TABLE `pelatihan` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'offline',
  `subtitle` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `waktu` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `akses` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pelatihan`
--

INSERT INTO `pelatihan` (`id`, `title`, `jenis`, `subtitle`, `url`, `img`, `tempat`, `waktu`, `akses`, `expire`, `created_at`) VALUES
(14, 'PAZ BASIC Online  Desember 2021', 'online', '', 'https://pazofficial.com/', '16367102870394-5 Des 21 Basic Online.jpeg', 'Online', '2021-12-05', '5 - 6 Desember 2021', '', '2021-11-12 09:47:26'),
(15, 'PAZ Basic Batam Desember 2021', 'offline', 'PAZ Basic Batam', 'https://pazindonesia.com/pelatihan', '1636960905383Desain tanpa judul (12).jpg', 'Batam, Kepulauan Riau', '', '11 - 12 Desember 2021', '-', '2021-11-15 07:22:24');

-- --------------------------------------------------------

--
-- Table structure for table `struktur`
--

CREATE TABLE `struktur` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telp` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `struktur`
--

INSERT INTO `struktur` (`id`, `title`, `name`, `img`, `telp`, `nip`, `prefix`, `created_at`) VALUES
(2, 'Direktur', 'Tri Hariyanto', '163718730719416366176169153.jpg', '081121728344', 'MB13412001', 'direktur', '2021-10-27 23:41:56'),
(3, 'Ka.Div Pelatihan', 'M. Baihaqi M.', '16366183834965.jpg', '0821212121', 'MB13412020', 'pelatih', '2021-10-27 23:41:56'),
(4, 'Ka. Div Operasional', 'Haryanto Bilal M.', '16366183708176.jpg', '0812727281', 'MB13412023', 'operasional', '2021-10-27 23:41:56'),
(5, 'Ka. Div Finance', 'Yusuf Ardianto', '1636618486850Team pengajar LKP PGU.jpg', '0823827383', 'MB13412024', 'finance', '2021-10-27 23:41:56'),
(6, 'Ka. Div Human Capital', 'Anjrah Ari Susanto', '16366184998047.jpg', '0823738475', 'MB13412025', 'human', '2021-10-27 23:41:56'),
(7, 'Ka Div Marketing', 'Andimara Nur', '1636402606802foto.jpg', '0823726384', 'MB13412025', 'marketing', '2021-10-27 23:41:56');

-- --------------------------------------------------------

--
-- Table structure for table `testimoni`
--

CREATE TABLE `testimoni` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipe` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimoni`
--

INSERT INTO `testimoni` (`id`, `name`, `img`, `video`, `tipe`, `address`, `content`, `created_at`) VALUES
(13, 'Buk Dedeh', NULL, 'https://www.youtube.com/watch?v=3iRbrV36h7I', 'video', 'Jakarta', 'Bukan sekedar cerita orang, tapi saya alami sendiri asma menahun bahkan setiap bangun tidur asma saya kambuh, dalam sehari minimal 3 kali saya menyemprotkan ventolin ke dalam mulut. Namun Alhamdullillah setelah terapi dengan pengobatan akhir jaman oleh ustadz Haris Moedjahid asma saya sudah sembuh', '2021-11-04 17:56:15'),
(14, 'dr. Galeh', NULL, 'https://www.youtube.com/watch?v=2dYTi0lCWh4', 'video', 'Solo', 'Awal nya tidak percaya dengan PAZ, tapi setelah mengikuti pelatihan nya  dan membuktikkan nya sendiri, GERD nya sembuh atas izin Allah. dan Sekarang Dr. Galeh menjadi salahsatu terapis rujukan di Solo', '2021-11-19 09:18:45'),
(15, 'dr. Sentot Primadianto', NULL, 'https://www.youtube.com/watch?v=3iRbrV36h7I', 'video', 'Sidoarjo', 'Awalnya berniat untuk mengobati anaknya yang memiliki keluhan Alergi dan Mimisan. Sudah berikhtiar kesana kemari dan juga konsultasi dengan kawan-kawan sejawat nyaDan Akhirnya beiau memutuskan mengikuti pelatihan PAZ Al Kasaw di Yogyakarta, dan kemudian beliau praktikan ilmu PAZ Al Kasaw nya untuk putra nya, dan Alhamdulillah progress nya sangat membaik.', '2021-11-19 21:33:00'),
(16, 'Ibu Miji (Guru Sekolah Dasar)', NULL, 'https://www.youtube.com/watch?v=gSmcRlSk-O4', 'video', 'Magelang', '12 Tahun Saraf Kejepit, Alhamdulillah tuntas setelah mengikuti pelatihan PAZ Basic. Sekarang, Selain mengajar di Sekolah Dasar ibu Miji sering didatangi oleh wali murid dan orang-orang hanya sekedar untuk membantu mengikhtiarkan keluhan-keluhan nya', '2021-11-22 04:01:17');

-- --------------------------------------------------------

--
-- Table structure for table `timeline`
--

CREATE TABLE `timeline` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lokasi` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bulan` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_range` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timeline`
--

INSERT INTO `timeline` (`id`, `title`, `url`, `lokasi`, `bulan`, `date_range`, `img`, `created_at`) VALUES
(21, 'PAZ Basic Jakarta', 'https://wa.me/628115011492?text=Pak%20Bilal%2C%20Saya%20mau%20daftar%20Pelatihan%20PAZ%20Basic%20di%20Jakarta%0A%0ATransfer%20ke%20Mana?%3F', 'Jakarta', 'desember 2021', '04 - 05 Desember 2021', '16366009721744-5 Des 21 Basic Jakarta.jpeg', '2021-11-11 03:22:52'),
(22, 'PAZ Basic Online', 'https://wa.me/628115011492?text=Pak%20Bilal%2C%20Saya%20mau%20daftar%20Pelatihan%20PAZ%20Basic%20Online%0A%0ATransfer%20ke%20Mana?%3F', 'Online', 'desember 2021', '04 - 05 Desember 2021', '16366010854054-5 Des 21 Basic Online.jpeg', '2021-11-11 03:24:45'),
(23, 'PAZ Basic Batam', 'https://wa.me/628115011492?text=Pak%20Bilal%2C%20Saya%20mau%20daftar%20Pelatihan%20PAZ%20Basic%20di%20Batam%0A%0ATransfer%20ke%20Mana?%3F', 'Batam', 'desember 2021', '11 - 12 Desember 2021', '163660120019711-12 Des 21 Basic Batam.jpeg', '2021-11-11 03:26:40'),
(24, 'PAZ Basic Padang', 'https://wa.me/628115011492?text=Pak%20Bilal%2C%20Saya%20mau%20daftar%20Pelatihan%20PAZ%20Basic%20di%20Padang%0A%0ATransfer%20ke%20Mana?%3F', 'Padang', 'desember 2021', '11 - 12 Desember 2021', '163660123181011-12 Des 2021 Basic Padang.jpeg', '2021-11-11 03:27:11'),
(25, 'PAZ Basic Bengkulu', 'https://wa.me/628115011492?text=Pak%20Bilal%2C%20Saya%20mau%20daftar%20Pelatihan%20PAZ%20Basic%20di%20Bengkulu%0A%0ATransfer%20ke%20Mana?%3F', 'Bengkulu', 'desember 2021', '18 - 19 Desember 2021', '163660127543618-19 Des 21 Basic Bengkulu.jpeg', '2021-11-11 03:27:55'),
(26, 'PAZ Basic Pekanbaru', 'https://wa.me/628115011492?text=Pak%20Bilal%2C%20Saya%20mau%20daftar%20Pelatihan%20PAZ%20Basic%20di%20Pekanbaru%0A%0ATransfer%20ke%20Mana?%3F', 'Pekanbaru', 'desember 2021', '18 - 19 Desember 2021', '163660138206218-19 Des Basic Pekanbaru.jpeg', '2021-11-11 03:29:42'),
(27, 'PAZ Basic Premium', 'https://wa.me/628115011492?text=Pak%20Bilal%2C%20Saya%20mau%20daftar%20Pelatihan%20PAZ%20Basic%20Premium%0A%0ATransfer%20ke%20Mana?%3F', 'Klaten', 'desember 2021', '24 - 26 Desember 2021', '163660155081824-26 Des 21 Basic Premium.jpeg', '2021-11-11 03:32:30'),
(28, 'PAZ Basic Samarinda', 'https://pazindonesia.com/pelatihan', 'Samarinda', 'november 2021', '13 - 14 November 2021', '163660314998213-14 Nov 21 Basic Samarinda.jpeg', '2021-11-11 03:59:09'),
(29, 'Basic Ternate', 'https://pazindonesia.com/pelatihan', 'Ternate', 'november 2021', '13 - 14 November 2021', '163660317942513-14 Nov 21 Basic Ternate.jpeg', '2021-11-11 03:59:39'),
(31, 'Basic Berau', 'https://pazindonesia.com/pelatihan', 'berau', 'november 2021', '20 - 21 November 2021', '163660327879820-21 Nov 21 Basic Berau.jpeg', '2021-11-11 04:01:18'),
(32, 'Basic Kendari', 'https://pazindonesia.com/pelatihan', 'Kendari', 'november 2021', '20 -21 Desember 2021', '163660331244220-21 Nov 21 Basic Kendari.jpeg', '2021-11-11 04:01:52');

-- --------------------------------------------------------

--
-- Table structure for table `timeline_group`
--

CREATE TABLE `timeline_group` (
  `id` int(11) NOT NULL,
  `bulan` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_depan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_bel` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `registered_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama_depan`, `nama_bel`, `email`, `telp`, `alamat`, `password`, `role`, `last_login`, `registered_at`) VALUES
('17fb97aa-0008-4cc0-8f0a-bad1cb315432', 'new', 'new', 'new@new.com', '08123827364', 'Jl. Kuini II, No. 2', '$2a$10$/2VzjowwlWUmwmx084qr6eO0lLo/Jo7HUpWvK6D5XaQgRL07ME6fS', NULL, '2021-10-29 22:36:53', '2021-10-29 15:36:53'),
('2ed837a5-68ff-40d7-be2b-317711bc782c', 'hrd', 'paz', 'hrd@hrd.com', '08238273485', 'Bandung', '$2a$10$LA/YeVt7m7ZdzlEErl4b..yE6WpaxI1BxAyja3K740InC2KpdZesK', 'admin', '2021-11-23 22:35:25', '2021-11-24 12:47:15'),
('3eb53177-c9af-49bb-828d-c4a8a134db10', 'Staff', 'staff', 'staff@staff.com', '0755325031', 'Jl. Kuini II, No. 2', '$2a$10$RCk0eH7Ha9IGDD6lzdXvJux8TA5Nd1y42HSn1LFlUMx23y7zlgCVK', 'staff', '2021-11-01 19:57:27', '2021-11-01 12:57:27'),
('8737d2bd-0cb2-4d94-bc90-590c8324b850', 'Boas', 'Salosa', 'boas@hrd.com', '08293827382', 'Jayapura', '$2a$10$CcOYSi7a3BT52V/LeckAiOm9bjIC/NLg4MbLorYPW.R6C4h4Ru1Tm', 'hrd', '2021-11-04 00:28:23', '2021-11-03 17:28:23'),
('99df22a3-3ff7-43cf-b000-39777b32ed0b', 'admin', 'administrato', 'admin@admin.com', '224223', 'indon', '$2a$10$VXgM/1BNdkMUzSh/OTjuiuslLfsAESfMEvMY8d7iNglCwnl3iaki2', 'admin', NULL, '2021-11-24 12:51:12'),
('a2eedc91-461d-4cea-839d-1694de6344c5', 'Anjrah ', 'Ari Susanto', 'anjraharisusanto@gmail.com', '081931822389', 'Klaten', '$2a$10$hfYyUW/t9eQIwzg/vn3DguvkjspqP3fOM4DNTYZRctEEE7rFT0IPa', 'admin', NULL, '2021-11-16 05:57:57');

-- --------------------------------------------------------

--
-- Table structure for table `visi`
--

CREATE TABLE `visi` (
  `id` int(11) NOT NULL,
  `visi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `time` int(11) DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indexes for table `galeri`
--
ALTER TABLE `galeri`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instruktur`
--
ALTER TABLE `instruktur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kopdar`
--
ALTER TABLE `kopdar`
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
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

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
-- AUTO_INCREMENT for table `galeri`
--
ALTER TABLE `galeri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `instruktur`
--
ALTER TABLE `instruktur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kopdar`
--
ALTER TABLE `kopdar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `loker`
--
ALTER TABLE `loker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pelatihan`
--
ALTER TABLE `pelatihan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `struktur`
--
ALTER TABLE `struktur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `testimoni`
--
ALTER TABLE `testimoni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `timeline`
--
ALTER TABLE `timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

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
