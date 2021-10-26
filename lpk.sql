-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 26, 2021 at 10:20 PM
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
(31, 'Muhammad Hidayatullah', '081282734', 'intanmandirisejahtera@gmail.com', 'solok', 'Sumbar', 'laki-laki', 'S-1', 'TI', 'Islam', 'Sudah pernah bekerja', 'asasasas', 'Manado', '1992-09-10', 'Lajang', 'Ya', 'asasassa', 'asasas', 'asasas', 'foto1635087980667foto.jpg', 'ktp1635087980667Scan KTP.JPG', 'ijazah1635087980667ijazah.jpeg', 'serti1635087980667sert.jpeg', 'skck1635087980667skck.jpg', 'porto1635087980667Muhammad hidayatullah.pdf', '[\"Jumlah rukun islam\",\"Jumlah nabi ada berapa dalam islam ?\",\"Jumlah rukun iman ada berapa ?\",\"Jumlah rukun islam ada berapa ?\"]', '[{\"text\":\"5\",\"correct\":true},{\"text\":\"25\",\"correct\":true},{\"text\":\"6\",\"correct\":true},{\"text\":\"Ada 5\",\"correct\":true}]', '100', 50, 'Lamaran Masuk', '2021-10-24 15:08:00');

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
(2, 'Ayub Camp', 'Jl. Tomang Raya Kav 21 – 23, Jakarta Barat.', '08227282738', '1634408235799business-address-slovenia-europe-800x445.jpg', '2021-10-16 18:17:15'),
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
  `posisi` varchar(100) DEFAULT NULL,
  `img` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `title`, `status`, `lokasi`, `date_range`, `posisi`, `img`, `date`, `created_at`) VALUES
(6, 'bandung', 'kopdar', 'Pelatihan PAZ Basic Yogyakarta', '17 - 18 Oktober 2021', NULL, '1634459436319land1.png', '2021-10-17', '2021-10-25 15:15:36'),
(8, 'ngopi', 'kopdar', 'Pelatihan PAZ Basic Yogyakarta', '17 - 18 Oktober 2021', NULL, '163447455468697746-gading-marten-ngopi-bareng-presiden-jokowi.jpg', '2021-10-17', '2021-10-25 15:15:41'),
(9, 'ngopi2', 'kopdar', 'Pelatihan PAZ Basic Yogyakarta', '17 - 18 Oktober 2021', NULL, '163447457637868637446407-img-20201004-wa0023.jpg', '2021-10-17', '2021-10-25 15:15:46'),
(10, 'ngopi3', 'kopdar', 'Pelatihan PAZ Basic Yogyakarta', '17 - 18 Oktober 2021', NULL, '1634474589681akbp-tulus-wartawan.jpg', '2021-10-17', '2021-10-25 15:15:53'),
(11, '1', 'galeri', 'Pelatihan PAZ Basic Surabaya', '20 - 21 Oktober 2021', NULL, '1634477177338qEq59t-3_400x400.jpg', '2021-10-17', '2021-10-25 15:16:32'),
(12, '2', 'galeri', 'Pelatihan PAZ Basic Surabaya', '20 - 21 Oktober 2021', NULL, '1634477189699pelatihan-Apps-orlokjakbar-2020-3.jpg', '2021-10-17', '2021-10-25 15:16:36'),
(13, '3', 'galeri', 'Pelatihan PAZ Basic Surabaya', '20 - 21 Oktober 2021', NULL, '1634477213431images.jpeg', '2021-10-17', '2021-10-25 15:16:42'),
(14, '4', 'galeri', 'Kopdar PAZTI Kalimantan Barat', '30 Oktober 2021', NULL, '1634477238811Bimtek-Pelatihan-Perpajakan-Omnibus-Law-Pada-Instansi-Pemerintah.jpeg', '2021-10-17', '2021-10-25 15:17:05'),
(15, 'test', 'galeri', 'Kopdar PAZTI Kalimantan Barat', '30 Oktober 2021', 'undefined', '163516858059797746-gading-marten-ngopi-bareng-presiden-jokowi.jpg', '2021-10-25', '2021-10-25 15:17:08'),
(16, 'tt', 'galeri', 'Kopdar PAZTI Kalimantan Barat', '30 Oktober 2021', 'landscape', '1635169453725Company-profile-3.jpg', '2021-10-15', '2021-10-25 15:17:12'),
(17, 'tt', 'galeri', 'Kopdar PAZTI Kalimantan Barat', '30 Oktober 2021', 'landscape', '1635169453826Company-profile-3.jpg', '2021-10-15', '2021-10-25 15:17:16'),
(18, 'Sesuatu', 'galeri', 'Pelatihan PAZ Basic Yogyakarta', '20 - 21 Oktober 2021', 'landscape', '1635193247546newssss.jpg', '2021-10-26', '2021-10-25 20:20:47'),
(19, 'bandung', 'kopdar', 'Pelatihan PAZ Basic Yogyakarta', '17 - 18 Oktober 2021', NULL, '1634459436319land1.png', '2021-10-17', '2021-10-25 15:15:36'),
(20, 'ngopi', 'kopdar', 'Pelatihan PAZ Basic Yogyakarta', '17 - 18 Oktober 2021', NULL, '163447455468697746-gading-marten-ngopi-bareng-presiden-jokowi.jpg', '2021-10-17', '2021-10-25 15:15:41'),
(21, 'ngopi2', 'kopdar', 'Pelatihan PAZ Basic Yogyakarta', '17 - 18 Oktober 2021', NULL, '163447457637868637446407-img-20201004-wa0023.jpg', '2021-10-17', '2021-10-25 15:15:46'),
(22, 'ngopi3', 'kopdar', 'Pelatihan PAZ Basic Yogyakarta', '17 - 18 Oktober 2021', NULL, '1634474589681akbp-tulus-wartawan.jpg', '2021-10-17', '2021-10-25 15:15:53'),
(23, 'Sesuatu', 'galeri', 'Pelatihan PAZ Basic Yogyakarta', '20 - 21 Oktober 2021', 'landscape', '1635193247546newssss.jpg', '2021-10-26', '2021-10-25 20:20:47'),
(24, 'bandung', 'kopdar', 'Pelatihan PAZ Basic Yogyakarta', '17 - 18 Oktober 2021', NULL, '1634459436319land1.png', '2021-10-17', '2021-10-25 15:15:36'),
(25, 'ngopi', 'kopdar', 'Pelatihan PAZ Basic Yogyakarta', '17 - 18 Oktober 2021', NULL, '163447455468697746-gading-marten-ngopi-bareng-presiden-jokowi.jpg', '2021-10-17', '2021-10-25 15:15:41'),
(26, 'ngopi2', 'kopdar', 'Pelatihan PAZ Basic Yogyakarta', '17 - 18 Oktober 2021', NULL, '163447457637868637446407-img-20201004-wa0023.jpg', '2021-10-17', '2021-10-25 15:15:46'),
(27, 'ngopi3', 'kopdar', 'Pelatihan PAZ Basic Yogyakarta', '17 - 18 Oktober 2021', NULL, '1634474589681akbp-tulus-wartawan.jpg', '2021-10-17', '2021-10-25 15:15:53'),
(28, 'Sesuatu', 'galeri', 'Pelatihan PAZ Basic Yogyakarta', '20 - 21 Oktober 2021', 'landscape', '1635193247546newssss.jpg', '2021-10-26', '2021-10-25 20:20:47'),
(29, 'bandung', 'kopdar', 'Pelatihan PAZ Basic Yogyakarta', '17 - 18 Oktober 2021', NULL, '1634459436319land1.png', '2021-10-17', '2021-10-25 15:15:36'),
(30, 'ngopi', 'kopdar', 'Pelatihan PAZ Basic Yogyakarta', '17 - 18 Oktober 2021', NULL, '163447455468697746-gading-marten-ngopi-bareng-presiden-jokowi.jpg', '2021-10-17', '2021-10-25 15:15:41'),
(31, 'ngopi2', 'kopdar', 'Pelatihan PAZ Basic Yogyakarta', '17 - 18 Oktober 2021', NULL, '163447457637868637446407-img-20201004-wa0023.jpg', '2021-10-17', '2021-10-25 15:15:46'),
(32, 'ngopi3', 'kopdar', 'Pelatihan PAZ Basic Yogyakarta', '17 - 18 Oktober 2021', NULL, '1634474589681akbp-tulus-wartawan.jpg', '2021-10-17', '2021-10-25 15:15:53'),
(33, 'Sesuatu', 'galeri', 'Pelatihan PAZ Basic Yogyakarta', '20 - 21 Oktober 2021', 'landscape', '1635193247546newssss.jpg', '2021-10-26', '2021-10-25 20:20:47');

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
(23, 'aku adalah', '[{\"text\":\"kamu\",\"correct\":false},{\"text\":\"saya\",\"correct\":true},{\"text\":\"dia\",\"correct\":false},{\"text\":\"mereka\"}]', NULL, 'off', '{}', '2021-10-24 15:03:42');

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
(14, 'Surat Izin Usaha Perdagangan', 'Badan Perizinan Usaha Terpadu', '1634406101458contoh-siup-kecil.jpg', '2021-10-16 17:41:41');

-- --------------------------------------------------------

--
-- Table structure for table `liputan`
--

CREATE TABLE `liputan` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `tag` text DEFAULT NULL,
  `subtitle` text DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `content` text NOT NULL,
  `img` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `liputan`
--

INSERT INTO `liputan` (`id`, `title`, `tag`, `subtitle`, `date`, `content`, `img`, `user_id`, `created_at`) VALUES
(3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', NULL, 'null', '2021-10-16 00:00:00', '<p><i><strong>Lorem ipsum</strong> dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</i></p>', '1634391506898authentication-bg.jpg', '016241c8-b725-43d5-8a50-94f5c86ea494', '2021-10-16 13:38:27'),
(7, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet', NULL, 'pencarian', '2021-10-15 00:00:00', '<p>adadadadada dad ddddaaa</p>', '1634392469162police.png', '016241c8-b725-43d5-8a50-94f5c86ea494', '2021-10-16 13:54:29'),
(8, 'Google Hanya Izinkan Pinjol yang Terdaftar di OJK sejak 28 Juli 2021', NULL, 'null', '2021-10-15 00:00:00', '<p>Mulai 28 Juli 2021, Google memperbarui kebijakan bagi para pengembang aplikasi pinjaman online di India dan Indonesia. Khusus di Indonesia, Google hanya akan mengizinkan aplikasi pinjaman pribadi yang diberi lisensi oleh, atau terdaftar di OJK. \"Sesuai dengan kebijakan kami, harus ada nomor yang terdaftar di OJK atau minimal nomor registrasi pendaftaran ke OJK,\" jelas perwakilan Google Indonesia ketika dihubungi KompasTekno melalui pesan singkat, Jumat (15/10/2021).</p>', '1634405166567newssss.jpg', '016241c8-b725-43d5-8a50-94f5c86ea494', '2021-10-16 17:26:07'),
(9, 'Dianggap Langgar Privasi, Google Blokir Iklan Aplikasi Penyadap', NULL, 'null', '2021-10-16 00:00:00', '<p><strong>RAKSASA </strong>Google memperketat privasi untuk para penggunanya dengan menutup beberapa iklan yang dianggap memata-matai. Iklan tersebut dianggap mempromosikan aplikasi yang mendorong pengguna memata-matai ponsel pasangan.</p><p>Aplikasi spyware ini memang biasa digunakan orangtua yang ingin memantau panggilan, pesan, aplikasi, foto dan lokasi anak mereka. Namun, aplikasi tersebut sering dirancang untuk dipasang secara diam-diam tanpa persetujuan pemilik perangkat.</p><p>“Kami tidak mengizinkan iklan yang mempromosikan spyware untuk pengawasan pengguna,\" kata juru bicara Google, dikutip dari TechCrunch, Sabtu (16/19/2021).</p>', '1634405373201google.jpg', '016241c8-b725-43d5-8a50-94f5c86ea494', '2021-10-16 17:29:33'),
(11, 'sadasddsdas', '[{\"text\":\"sadasdasd\"},{\"text\":\"sadasdasd\"}]', 'sdasdasd', '2021-10-26 00:00:00', '<p>sadasdasdasd</p>', '1635257507582google.jpeg', '016241c8-b725-43d5-8a50-94f5c86ea494', '2021-10-26 14:11:47'),
(12, 'ELSAM Tanggapi Laporan Google soal RI Banyak Minta Hapus Konten  Baca artikel CNN Indonesia \"ELSAM Tanggapi Laporan Google soal RI Banyak Minta Hapus Konten\"', '[{\"text\":\"teknologi\"},{\"text\":\"google\"},{\"text\":\"terbaru\"}]', 'Google mencatat Indonesia menjadi negara yang paling banyak menghapus dan mengajukan permintaan penghapusan konten atau informasi. (Foto: istockphoto/volkan.basar)  Baca artikel CNN Indonesia \"ELSAM Tanggapi Laporan Google soal RI Banyak Minta Hapus Konten\"', '2021-10-26 00:00:00', '<p>Jakarta, CNN Indonesia -- Peneliti Lembaga Studi &amp; Advokasi Masyarakat (ELSAM), Alia Yofira menanggapi laporan transparansi Google terkait Indonesia menjadi negara yang banyak menghapus dan mengajukan permintaan penghapusan konten atau informasi terbanyak pada periode Januari-Juni 2021.<br>Menurut Alia, permintaan penghapusan konten di Indonesia memiliki sejumlah masalah jika merujuk pada pasal 40 ayat 2b yang secara khusus mengatur pemutusan akses ke sebuah konten.<br><br>Penghapusan konten di Indonesia dilakukan berdasarkan UU ITE, khususnya pasal 40 ayat 2b yang mengatur bahwa pemerintah berwenang untuk melakukan pemutusan akses ke konten yang memiliki muatan yang melanggar hukum, kata Alia kepada CNNindonesia.com melalui pesan teks, Selasa (26/10).<br><br>Baca artikel CNN Indonesia ELSAM Tanggapi Laporan Google soal RI Banyak Minta Hapus Konten selengkapnya di sini: <a href=\"https://www.cnnindonesia.com/teknologi/20211026190406-185-712725/elsam-tanggapi-laporan-google-soal-ri-banyak-minta-hapus-konten\">https://www.cnnindonesia.com/teknologi/20211026190406-185-712725/elsam-tanggapi-laporan-google-soal-ri-banyak-minta-hapus-konten</a>.<br><br>Download Apps CNN Indonesia sekarang https://app.cnnindonesia.com/</p>', '1635257849060google.jpeg', '016241c8-b725-43d5-8a50-94f5c86ea494', '2021-10-26 14:19:53');

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
(4, 'Admin Online', 'Administrasi', NULL, '<ul><li>Edit foto dan upload produk ke marketplace seperti Tokopedia, Shopee, Lazada, Blibli, dsb</li><li>Mengurus sistem Jubelio</li><li>Melakukan photo dan video editing untuk content social media perusahaan</li><li>Melakukan rekaman video semacam menjual/mengulas/review produk</li><li>Bila dibutuhkan, siap menjadi talent untuk content media</li><li>Pekerjaan digital marketing, administrasi dan operasional lainnya</li></ul>', '<p>Syarat Wajib:</p><ul><li>Usia 18-25</li><li>Mahir menggunakan Adobe Photoshop atau punya basic editing Design Grafis</li><li>Jujur, Bertanggung Jawab, Loyal/Setia, Semangat kerja yang tinggi</li><li>Rajin dan mampu bekerja sendiri tanpa harus dipantau</li><li>FULL TIME, jangka panjang, tidak sedang/tidak akan kuliah/tidak sedang kelas karyawan</li></ul><p>Syarat Opsional (nilai lebih jika ada):</p><ul><li>Bisa menggunakan software video editing</li></ul>', '[\"Penuh waktu\",\"Fresh Graduate\",\"Kontrak\"]', 'Rp 3.000.000 - Rp 4.000.000', 'Kirimkan portfolio dari hasil kerja yang pernah dilakukan (bisa berupa URL/link ke sosmed, youtube, dsb), informasikan kontribusi pribadi bila project dilakukan bbrp orang dlm 1 team.', NULL, 'Sidoarjo, Jawa Timur', '< 1 Tahun', '2021-10-18 14:37:56'),
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
(3, 'Pelatihan Offline PAZ Al Kasaw Basic Mei 2021', 'offline', 'Khusus muslimah', '1634485585883potrait5.png', 'Bandung', '', 'Waktu Akses Lifetime', 'Kapanpun', '2021-10-17 15:46:25'),
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
-- Table structure for table `testimoni`
--

CREATE TABLE `testimoni` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `img` varchar(255) NOT NULL,
  `address` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `testimoni`
--

INSERT INTO `testimoni` (`id`, `name`, `img`, `address`, `content`, `created_at`) VALUES
(2, 'Pak Tri Haryanto', '1634496013846avatar-2.jpg', 'Klaten', 'Bukan sekedar cerita orang, tapi saya alami sendiri asma menahun bahkan setiap bangun tidur asma saya kambuh, dalam sehari minimal 3 kali saya menyemprotkan ventolin ke dalam mulut. Namun Alhamdullillah setelah terapi dengan pengobatan akhir jaman oleh ustadz Haris Moedjahid asma saya sudah sembuh', '2021-10-17 18:40:13'),
(3, 'Ibu Noviyani', '1634496132934avatar-1.jpg', 'Jakarta', 'Wasilah PAZ yang membuat saya sembuh dari syaraf kejepit yang selama 7 tahun di derita dan asma dari kecil. Bukan sekedar omdo ya, tapi real. Alhamdulillah sekarang jadi terapis yang menyembuhkan syaraf kejepit yang dulu bagi saya tuh hal ga mungkin, wong buat berdiri aja susah kog, Biidznillah', '2021-10-17 18:42:12'),
(5, 'Darmansyah', '1634496205286avatar-7.jpg', 'Samarinda', 'Saya kemaren sakit bagian leher. Sekali paz, bi idznillah sakit hilang. Kata istri enak ya kalau ada sakit bisa langsung mengobati sendiri. Istri hasil scan getah bening agak besar, diperiksa ala s.o.p paz terasa sakit. Sekali paz bi idznillah sakit berkurang drastis, 2x paz sakit hilang. Saya belajar baru weekend kemaren', '2021-10-17 18:43:25'),
(6, 'Yahya Waloni', '1634496248881avatar-6.jpg', 'Manado', 'Wasilah PAZ yang membuat saya sembuh dari syaraf kejepit yang selama 7 tahun di derita dan asma dari kecil. Bukan sekedar omdo ya, tapi real. Alhamdulillah sekarang jadi terapis yang menyembuhkan syaraf kejepit yang dulu bagi saya tuh hal ga mungkin, wong buat berdiri aja susah kog, Biidznillah', '2021-10-17 18:44:08'),
(7, 'Dian', '1634496296863avatar-5.jpg', 'Medan', 'Wasilah PAZ yang membuat saya sembuh dari syaraf kejepit yang selama 7 tahun di derita dan asma dari kecil. Bukan sekedar omdo ya, tapi real. Alhamdulillah sekarang jadi terapis yang menyembuhkan syaraf kejepit yang dulu bagi saya tuh hal ga mungkin, wong buat berdiri aja susah kog, Biidznillah', '2021-10-17 18:44:56');

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
('016241c8-b725-43d5-8a50-94f5c86ea494', 'adm', NULL, 'adm@adm.com', NULL, NULL, '$2a$10$lkTZt4C1w4vFxC759p/01ujxjz3ElNzZbYLMol1DN/dFOjFmQ4VFy', NULL, '2021-10-18 00:55:20', '2021-10-17 17:55:20'),
('0218982e-5809-475c-8a60-86daf2e381dd', 'admin', NULL, 'admin@admin.com', NULL, NULL, '$2a$10$VsyHkLR9y51KGMn.bs9bwegKjNvDYRSGolC45mlMzTHwrq.rr61Da', NULL, '2021-10-14 17:28:12', '2021-10-14 10:28:12'),
('245c17a8-a7c8-454c-8225-8cf7359485ea', 'aaa', 'sssss', 'dyt@dyt.coms', '1112222', 'asdsadas', '$2a$10$.BdBZ0qDKhNmJTmkLmFW5uuzAnuZleN/2yn3ktzZXqSNyuP3T9ZYC', NULL, NULL, '2021-10-14 13:09:51'),
('9083d588-0b0c-4dfd-9b8a-f87480b9c44b', 'assas', 'ddfd', 'dyts@dyt.com', '32423423423', 'Kuini', '$2a$10$aV9ap/DUAk/UORhFgEKC4u2hXQBh.cLvvoGlk/YCT.jXy.8xp4ab2', NULL, '2021-10-14 20:03:51', '2021-10-14 13:03:51');

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
(1, NULL, 'Riset dan pengembangan Keilmuan PAZ Al Kasaw dalam konteks pondasi yang sudah diletakkan oleh Ustadz Haris Moedjahid Rahimahullah', '2021-10-16 19:48:02'),
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
(5, 100, 'on'),
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
-- Indexes for table `kuis`
--
ALTER TABLE `kuis`
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
-- Indexes for table `testimoni`
--
ALTER TABLE `testimoni`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `gallery_group`
--
ALTER TABLE `gallery_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kuis`
--
ALTER TABLE `kuis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `legalitas`
--
ALTER TABLE `legalitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `liputan`
--
ALTER TABLE `liputan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
-- AUTO_INCREMENT for table `testimoni`
--
ALTER TABLE `testimoni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
