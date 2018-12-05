-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 05, 2018 at 03:02 PM
-- Server version: 5.7.24-0ubuntu0.16.04.1
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skatech_pkl`
--

-- --------------------------------------------------------

--
-- Table structure for table `pkl_admin`
--

CREATE TABLE `pkl_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pkl_detail_kelompok`
--

CREATE TABLE `pkl_detail_kelompok` (
  `id` int(11) NOT NULL,
  `id_kelompok` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `acc` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pkl_detail_kelompok`
--

INSERT INTO `pkl_detail_kelompok` (`id`, `id_kelompok`, `id_siswa`, `acc`) VALUES
(1, 1, 1, 0),
(2, 2, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pkl_dudi`
--

CREATE TABLE `pkl_dudi` (
  `id` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `nama_perusahaan` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `phone` varchar(14) NOT NULL,
  `deskripsi` text NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pkl_dudi`
--

INSERT INTO `pkl_dudi` (`id`, `id_jurusan`, `username`, `password`, `nama_perusahaan`, `alamat`, `phone`, `deskripsi`, `image`) VALUES
(1, 1, 'isp1', 'isp', 'isp', 'sini', '09012312', 'untuk TKJ', 'http://ardhana.co.id/wp-content/uploads/2016/07/CITRANET.png'),
(2, 2, 'dudimm', 'dudimm', 'video shoot', 'asdasda', 'asdas', 'dfsdfsf', 'fasasfds'),
(3, 1, 'isp2', 'dasdasda', 'isp 2 yoi', 'dasdasdasd', '09090912321', 'jajdaskdjalsjdlasdl', 'https://pbs.twimg.com/profile_images/459598765674860544/I5BfzLao_400x400.png');

-- --------------------------------------------------------

--
-- Table structure for table `pkl_jurusan`
--

CREATE TABLE `pkl_jurusan` (
  `id` int(11) NOT NULL,
  `jurusan` text NOT NULL,
  `deskripsi` text NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pkl_jurusan`
--

INSERT INTO `pkl_jurusan` (`id`, `jurusan`, `deskripsi`, `image`) VALUES
(1, 'TKJ', 'TKJ', ''),
(2, 'Multimedia', 'Multimedia', '');

-- --------------------------------------------------------

--
-- Table structure for table `pkl_kelompok`
--

CREATE TABLE `pkl_kelompok` (
  `id` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `id_dudi` int(11) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `period` int(11) NOT NULL,
  `verif_by_pj` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pkl_kelompok`
--

INSERT INTO `pkl_kelompok` (`id`, `id_jurusan`, `id_dudi`, `tahun`, `period`, `verif_by_pj`) VALUES
(1, 1, 1, '2001', 1, 0),
(2, 2, 2, '2018', 1, 0),
(3, 1, 3, '2018', 1, 0),
(5, 1, 3, '2018', 1, 0),
(6, 1, 3, '2018', 1, 0),
(7, 1, 3, '2018', 1, 0),
(8, 1, 3, '2018', 1, 0),
(9, 1, 3, '2018', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pkl_pj_jurusan`
--

CREATE TABLE `pkl_pj_jurusan` (
  `id` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `nama` varchar(100) NOT NULL,
  `phone` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pkl_pj_jurusan`
--

INSERT INTO `pkl_pj_jurusan` (`id`, `id_jurusan`, `username`, `password`, `nama`, `phone`) VALUES
(1, 1, 'pjTKJ', '83218ac34c1834c26781fe4bde918ee4', 'pj', '089123'),
(2, 2, 'pjMM', '83218ac34c1834c26781fe4bde918ee4', 'pj mm', '08123123');

-- --------------------------------------------------------

--
-- Table structure for table `pkl_siswa`
--

CREATE TABLE `pkl_siswa` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `nama` varchar(100) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `kelas` varchar(8) NOT NULL,
  `alamat` text NOT NULL,
  `phone` int(14) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pkl_siswa`
--

INSERT INTO `pkl_siswa` (`id`, `username`, `password`, `nama`, `id_jurusan`, `kelas`, `alamat`, `phone`, `image`) VALUES
(1, 'siswa1', 'bcd724d15cde8c47650fda962968f102', 'saya', 1, 'XIITKJ1', 'omah', 123, ''),
(2, 'siswa2', 'bcd724d15cde8c47650fda962968f102', 'siswaw', 2, 'XIITKJ2', 'sini', 1231, 'asdas'),
(3, 'siswa3', 'bcd724d15cde8c47650fda962968f102', 'siswa3', 1, 'XIITKJ1', 'hdhdhdh', 1234556654, 'asdasd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pkl_admin`
--
ALTER TABLE `pkl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pkl_detail_kelompok`
--
ALTER TABLE `pkl_detail_kelompok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kelompok` (`id_kelompok`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indexes for table `pkl_dudi`
--
ALTER TABLE `pkl_dudi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indexes for table `pkl_jurusan`
--
ALTER TABLE `pkl_jurusan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pkl_kelompok`
--
ALTER TABLE `pkl_kelompok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_jurusan` (`id_jurusan`),
  ADD KEY `id_dudi` (`id_dudi`);

--
-- Indexes for table `pkl_pj_jurusan`
--
ALTER TABLE `pkl_pj_jurusan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indexes for table `pkl_siswa`
--
ALTER TABLE `pkl_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pkl_admin`
--
ALTER TABLE `pkl_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pkl_detail_kelompok`
--
ALTER TABLE `pkl_detail_kelompok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pkl_dudi`
--
ALTER TABLE `pkl_dudi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pkl_jurusan`
--
ALTER TABLE `pkl_jurusan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pkl_kelompok`
--
ALTER TABLE `pkl_kelompok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `pkl_pj_jurusan`
--
ALTER TABLE `pkl_pj_jurusan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pkl_siswa`
--
ALTER TABLE `pkl_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `pkl_detail_kelompok`
--
ALTER TABLE `pkl_detail_kelompok`
  ADD CONSTRAINT `pkl_detail_kelompok_ibfk_1` FOREIGN KEY (`id_kelompok`) REFERENCES `pkl_kelompok` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `pkl_detail_kelompok_ibfk_2` FOREIGN KEY (`id_siswa`) REFERENCES `pkl_siswa` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `pkl_dudi`
--
ALTER TABLE `pkl_dudi`
  ADD CONSTRAINT `pkl_dudi_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `pkl_jurusan` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `pkl_kelompok`
--
ALTER TABLE `pkl_kelompok`
  ADD CONSTRAINT `pkl_kelompok_ibfk_1` FOREIGN KEY (`id_dudi`) REFERENCES `pkl_dudi` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `pkl_kelompok_ibfk_2` FOREIGN KEY (`id_jurusan`) REFERENCES `pkl_jurusan` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `pkl_pj_jurusan`
--
ALTER TABLE `pkl_pj_jurusan`
  ADD CONSTRAINT `pkl_pj_jurusan_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `pkl_jurusan` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `pkl_siswa`
--
ALTER TABLE `pkl_siswa`
  ADD CONSTRAINT `pkl_siswa_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `pkl_jurusan` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
