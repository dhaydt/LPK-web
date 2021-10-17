-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 17, 2021 at 10:20 PM
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
  `img` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `title`, `status`, `img`, `date`, `created_at`) VALUES
(6, 'bandung', 'kopdar', '1634459436319land1.png', '2021-10-17', '2021-10-17 08:30:36'),
(8, 'ngopi', 'kopdar', '163447455468697746-gading-marten-ngopi-bareng-presiden-jokowi.jpg', '2021-10-17', '2021-10-17 12:42:35'),
(9, 'ngopi2', 'kopdar', '163447457637868637446407-img-20201004-wa0023.jpg', '2021-10-17', '2021-10-17 12:42:56'),
(10, 'ngopi3', 'kopdar', '1634474589681akbp-tulus-wartawan.jpg', '2021-10-17', '2021-10-17 12:43:09'),
(11, '1', 'galeri', '1634477177338qEq59t-3_400x400.jpg', '2021-10-17', '2021-10-17 13:26:17'),
(12, '2', 'galeri', '1634477189699pelatihan-Apps-orlokjakbar-2020-3.jpg', '2021-10-17', '2021-10-17 13:26:29'),
(13, '3', 'galeri', '1634477213431images.jpeg', '2021-10-17', '2021-10-17 13:26:53'),
(14, '4', 'galeri', '1634477238811Bimtek-Pelatihan-Perpajakan-Omnibus-Law-Pada-Instansi-Pemerintah.jpeg', '2021-10-17', '2021-10-17 13:27:18');

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
  `title` varchar(100) NOT NULL,
  `subtitle` varchar(200) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `content` text NOT NULL,
  `img` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `liputan`
--

INSERT INTO `liputan` (`id`, `title`, `subtitle`, `date`, `content`, `img`, `user_id`, `created_at`) VALUES
(3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'null', '2021-10-16 00:00:00', '<p><i><strong>Lorem ipsum</strong> dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</i></p>', '1634391506898authentication-bg.jpg', '016241c8-b725-43d5-8a50-94f5c86ea494', '2021-10-16 13:38:27'),
(7, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet', 'pencarian', '2021-10-15 00:00:00', '<p>adadadadada dad ddddaaa</p>', '1634392469162police.png', '016241c8-b725-43d5-8a50-94f5c86ea494', '2021-10-16 13:54:29'),
(8, 'Google Hanya Izinkan Pinjol yang Terdaftar di OJK sejak 28 Juli 2021', 'null', '2021-10-15 00:00:00', '<p>Mulai 28 Juli 2021, Google memperbarui kebijakan bagi para pengembang aplikasi pinjaman online di India dan Indonesia. Khusus di Indonesia, Google hanya akan mengizinkan aplikasi pinjaman pribadi yang diberi lisensi oleh, atau terdaftar di OJK. \"Sesuai dengan kebijakan kami, harus ada nomor yang terdaftar di OJK atau minimal nomor registrasi pendaftaran ke OJK,\" jelas perwakilan Google Indonesia ketika dihubungi KompasTekno melalui pesan singkat, Jumat (15/10/2021).</p>', '1634405166567newssss.jpg', '016241c8-b725-43d5-8a50-94f5c86ea494', '2021-10-16 17:26:07'),
(9, 'Dianggap Langgar Privasi, Google Blokir Iklan Aplikasi Penyadap', 'null', '2021-10-16 00:00:00', '<p><strong>RAKSASA </strong>Google memperketat privasi untuk para penggunanya dengan menutup beberapa iklan yang dianggap memata-matai. Iklan tersebut dianggap mempromosikan aplikasi yang mendorong pengguna memata-matai ponsel pasangan.</p><p>Aplikasi spyware ini memang biasa digunakan orangtua yang ingin memantau panggilan, pesan, aplikasi, foto dan lokasi anak mereka. Namun, aplikasi tersebut sering dirancang untuk dipasang secara diam-diam tanpa persetujuan pemilik perangkat.</p><p>“Kami tidak mengizinkan iklan yang mempromosikan spyware untuk pengawasan pengguna,\" kata juru bicara Google, dikutip dari TechCrunch, Sabtu (16/19/2021).</p>', '1634405373201google.jpg', '016241c8-b725-43d5-8a50-94f5c86ea494', '2021-10-16 17:29:33');

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

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for dumped tables
--

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `legalitas`
--
ALTER TABLE `legalitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `liputan`
--
ALTER TABLE `liputan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
