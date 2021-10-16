-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 15, 2021 at 12:43 AM
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
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `telp` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `legalitas`
--

CREATE TABLE `legalitas` (
  `id` int(11) NOT NULL,
  `titile` varchar(100) NOT NULL,
  `instansi` varchar(100) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
('016241c8-b725-43d5-8a50-94f5c86ea494', 'adm', NULL, 'adm@adm.com', NULL, NULL, '$2a$10$lkTZt4C1w4vFxC759p/01ujxjz3ElNzZbYLMol1DN/dFOjFmQ4VFy', NULL, '2021-10-14 21:37:26', '2021-10-14 14:37:26'),
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
(1, '', 'Riset dan pengembangan Keilmuan PAZ Al Kasaw dalam konteks pondasi yang sudah diletakkan oleh Ustadz Haris Moedjahid Rahimahullah', '2021-10-14 22:30:13'),
(2, '', 'Pendidikan dan pelatihan ilmu paz al kasaw berketerlanjutan dengan karakter paztrooper yang unggul', '2021-10-14 22:30:39'),
(3, '', 'Pengelolaan manajerial alumni berbasis IT untuk kemudahan masyarakat mendapat layanan terapi PAZ Al Kasaw', '2021-10-14 22:30:57'),
(4, '', 'Menjadi perusahaan yang profitable, high margin, dan memberikan intangiable values bagi stakeholder yang terlibat', '2021-10-14 22:31:16'),
(6, '', 'Memberikan inspirasi cara sehat alamiah, islami, dan praktis ke seluas luas umat muslim di dunia', '2021-10-14 22:42:30');

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
-- Indexes for table `legalitas`
--
ALTER TABLE `legalitas`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `legalitas`
--
ALTER TABLE `legalitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visi`
--
ALTER TABLE `visi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
