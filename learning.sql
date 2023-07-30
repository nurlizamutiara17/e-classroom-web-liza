-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2023 at 02:31 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `learning`
--

-- --------------------------------------------------------

--
-- Table structure for table `analisis`
--

CREATE TABLE `analisis` (
  `id_analisis` int(100) NOT NULL,
  `id_ujian` int(100) NOT NULL,
  `id_soal` int(100) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `jawaban` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `analisis`
--

INSERT INTO `analisis` (`id_analisis`, `id_ujian`, `id_soal`, `id_siswa`, `jawaban`) VALUES
(1, 12, 107, 21, '1'),
(2, 12, 111, 21, '2'),
(3, 12, 112, 21, '2'),
(4, 12, 113, 21, '2'),
(5, 12, 114, 21, '2'),
(6, 13, 115, 22, '2'),
(7, 13, 116, 22, '2'),
(8, 13, 117, 22, '2'),
(9, 13, 118, 22, '0'),
(10, 13, 119, 22, '2'),
(11, 13, 115, 21, '2'),
(12, 13, 116, 21, '3'),
(13, 13, 117, 21, '2'),
(14, 13, 118, 21, '2'),
(15, 13, 119, 21, '2'),
(16, 14, 120, 1, '1'),
(17, 14, 121, 1, '2'),
(18, 14, 122, 1, '2'),
(19, 14, 123, 1, '2'),
(20, 14, 124, 1, '3'),
(21, 14, 120, 2, '1'),
(22, 14, 121, 2, '2'),
(23, 14, 122, 2, '2'),
(24, 14, 123, 2, '2'),
(25, 14, 124, 2, '3');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_tugas`
--

CREATE TABLE `kelas_tugas` (
  `id_klstugas` int(11) NOT NULL,
  `id_tugas` int(11) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas_tugas`
--

INSERT INTO `kelas_tugas` (`id_klstugas`, `id_tugas`, `id_kelas`, `id_jurusan`, `aktif`) VALUES
(1, 1, 13, 6, 'Y'),
(2, 3, 13, 6, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_ujian`
--

CREATE TABLE `kelas_ujian` (
  `id_klsujian` int(11) NOT NULL,
  `id_ujian` int(5) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas_ujian`
--

INSERT INTO `kelas_ujian` (`id_klsujian`, `id_ujian`, `id_kelas`, `id_jurusan`, `aktif`) VALUES
(3, 15, 13, 6, 'Y'),
(4, 14, 13, 6, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_ujianessay`
--

CREATE TABLE `kelas_ujianessay` (
  `id_klsessay` int(11) NOT NULL,
  `id_ujianessay` int(11) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(10) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_ujian` varchar(100) NOT NULL,
  `acak_soal` text NOT NULL,
  `jawaban` text NOT NULL,
  `sisa_waktu` time NOT NULL,
  `waktu_selesai` time NOT NULL,
  `jml_benar` int(5) NOT NULL,
  `jml_kosong` int(5) NOT NULL,
  `jml_salah` int(5) NOT NULL,
  `nilai` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `id_siswa`, `id_ujian`, `acak_soal`, `jawaban`, `sisa_waktu`, `waktu_selesai`, `jml_benar`, `jml_kosong`, `jml_salah`, `nilai`) VALUES
(1, 1, '14', '120,123,124,121,122', '1,2,3,2,2', '00:05:00', '20:05:05', 5, 0, 0, '100'),
(2, 2, '14', '122,123,124,120,121', '2,2,3,1,2', '00:05:00', '08:47:43', 5, 0, 0, '100');

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE `pesan` (
  `id_pesan` int(10) NOT NULL,
  `id_pengirim` varchar(30) NOT NULL,
  `id_penerima` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `isi_pesan` longtext NOT NULL,
  `sudah_dibaca` enum('belum','sudah') NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesan`
--

INSERT INTO `pesan` (`id_pesan`, `id_pengirim`, `id_penerima`, `tanggal`, `isi_pesan`, `sudah_dibaca`, `id_kelas`, `id_jurusan`) VALUES
(3, '123456789', '199509090001', '2023-07-10', 'ABCD', 'belum', 13, 6),
(4, '123456789', '199509090001', '2023-07-10', 'Re: ABC', 'belum', 13, 6);

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

CREATE TABLE `soal` (
  `id_soal` int(5) NOT NULL,
  `id_ujian` int(5) NOT NULL,
  `soal` text NOT NULL,
  `pilihan_1` text NOT NULL,
  `pilihan_2` text NOT NULL,
  `pilihan_3` text NOT NULL,
  `pilihan_4` text NOT NULL,
  `pilihan_5` text NOT NULL,
  `kunci` int(2) NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`id_soal`, `id_ujian`, `soal`, `pilihan_1`, `pilihan_2`, `pilihan_3`, `pilihan_4`, `pilihan_5`, `kunci`, `status`) VALUES
(106, 11, '1+18', '18', '19', '20', '21', '22', 2, 'Y'),
(105, 11, '1+17', '17', '18', '19', '20', '21', 1, 'Y'),
(104, 11, '1+16', '16', '17', '18', '19', '20', 1, 'Y'),
(103, 11, '1+15', '15', '16', '17', '18', '19', 1, 'Y'),
(102, 11, '1+14', '14', '15', '16', '17', '18', 1, 'Y'),
(101, 11, '1+13', '13', '14', '15', '16', '17', 2, 'Y'),
(100, 11, '1+12', '12', '13', '14', '15', '16', 3, 'Y'),
(99, 11, '1+11', '11', '12', '13', '14', '15', 4, 'Y'),
(98, 11, '1+10', '10', '11', '12', '13', '14', 5, 'Y'),
(97, 11, '1+9', '9', '10', '11', '12', '13', 4, 'Y'),
(96, 11, '1+8', '8', '9', '10', '11', '12', 3, 'Y'),
(95, 11, '1+7', '7', '8', '9', '10', '11', 2, 'Y'),
(94, 11, '1+6', '6', '7', '8', '9', '10', 3, 'Y'),
(93, 11, '1+5', '5', '6', '7', '8', '9', 2, 'Y'),
(92, 11, '1+4', '4', '5', '6', '7', '8', 2, 'Y'),
(91, 11, '1+3', '3', '4', '5', '6', '7', 2, 'Y'),
(90, 11, '1+2', '2', '3', '4', '5', '6', 3, 'Y'),
(89, 11, '1+1', '1', '2', '3', '4', '5', 2, 'Y'),
(107, 12, '<p>Pertanyaan 1?</p>\r\n', 'A', 'B', 'C', 'D', 'E', 1, 'Y'),
(113, 12, '1+3', '3', '4', '5', '6', '7', 2, 'Y'),
(112, 12, '1+2', '2', '3', '4', '5', '6', 3, 'Y'),
(111, 12, '1+1', '1', '2', '3', '4', '5', 2, 'Y'),
(114, 12, '1+4', '4', '5', '6', '7', '8', 2, 'Y'),
(115, 13, '1+1', '1', '2', '3', '4', '5', 2, 'Y'),
(116, 13, '1+2', '2', '3', '4', '5', '6', 3, 'Y'),
(117, 13, '1+3', '3', '4', '5', '6', '7', 2, 'Y'),
(118, 13, '1+4', '4', '5', '6', '7', '8', 2, 'Y'),
(119, 13, '1+5', '5', '6', '7', '9', '8', 2, 'Y'),
(120, 14, '<p>Soal nomor satu?</p>\r\n', 'A benar', 'B', 'C', 'D', 'E', 1, 'Y'),
(121, 14, '1+1', '1', '2', '3', '4', '5', 2, 'Y'),
(122, 14, '1+2', '2', '3', '4', '5', '6', 2, 'Y'),
(123, 14, '1+3', '3', '4', '5', '6', '7', 2, 'Y'),
(124, 14, '1+4', '4', '6', '5', '7', '8', 3, 'Y'),
(125, 15, '<p>Abcd</p>\r\n', '1', '2', '3', '4', '5', 1, 'Y'),
(126, 16, '<p>Dibawah ini merupakan macam-macam percabangan pada pemrograman PHP, <strong>kecuali&hellip;</strong>?</p>\r\n', 'a.	Foreach', 'b.	If', 'c.	If else', 'd.	Switch case', 'e.	If else if dan else', 1, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `aktif` varchar(5) NOT NULL,
  `foto` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `nama_lengkap`, `username`, `password`, `aktif`, `foto`) VALUES
(1, 'Admin', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Y', 'support.png');

-- --------------------------------------------------------

--
-- Table structure for table `tb_guru`
--

CREATE TABLE `tb_guru` (
  `id_guru` int(11) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nama_guru` varchar(120) NOT NULL,
  `email` varchar(65) NOT NULL,
  `password` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` varchar(5) NOT NULL,
  `date_created` date NOT NULL,
  `confirm` enum('Yes','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_guru`
--

INSERT INTO `tb_guru` (`id_guru`, `nik`, `nama_guru`, `email`, `password`, `foto`, `status`, `date_created`, `confirm`) VALUES
(9, '19050974004', 'Nur Liza Mutiara Dini', 'nurlizamutiara02@gmail.com', 'c976841ec1a4d782dd375c2ed348ee00bde3f7c3', 'orang_3.png', 'Y', '2023-07-29', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenisperangkat`
--

CREATE TABLE `tb_jenisperangkat` (
  `id_jenisperangkat` int(11) NOT NULL,
  `jenis_perangkat` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jenisperangkat`
--

INSERT INTO `tb_jenisperangkat` (`id_jenisperangkat`, `jenis_perangkat`) VALUES
(1, 'RPP'),
(2, 'SILABUS'),
(3, 'MODUL PEMBELAJARAN'),
(4, 'LKPD');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenistugas`
--

CREATE TABLE `tb_jenistugas` (
  `id_jenistugas` int(11) NOT NULL,
  `jenis_tugas` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jenistugas`
--

INSERT INTO `tb_jenistugas` (`id_jenistugas`, `jenis_tugas`) VALUES
(1, 'INDIVIDU'),
(2, 'KELOMPOK');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenisujian`
--

CREATE TABLE `tb_jenisujian` (
  `id_jenis` int(11) NOT NULL,
  `jenis_ujian` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jenisujian`
--

INSERT INTO `tb_jenisujian` (`id_jenis`, `jenis_ujian`) VALUES
(2, 'Quiz');

-- --------------------------------------------------------

--
-- Table structure for table `tb_master_jurusan`
--

CREATE TABLE `tb_master_jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `jurusan` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_master_jurusan`
--

INSERT INTO `tb_master_jurusan` (`id_jurusan`, `jurusan`) VALUES
(6, 'Rekayasa Perangkat Lunak');

-- --------------------------------------------------------

--
-- Table structure for table `tb_master_kelas`
--

CREATE TABLE `tb_master_kelas` (
  `id_kelas` int(11) NOT NULL,
  `kelas` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_master_kelas`
--

INSERT INTO `tb_master_kelas` (`id_kelas`, `kelas`) VALUES
(13, 'XI');

-- --------------------------------------------------------

--
-- Table structure for table `tb_master_mapel`
--

CREATE TABLE `tb_master_mapel` (
  `id_mapel` int(11) NOT NULL,
  `mapel` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_master_mapel`
--

INSERT INTO `tb_master_mapel` (`id_mapel`, `mapel`) VALUES
(11, 'Pemrograman Web');

-- --------------------------------------------------------

--
-- Table structure for table `tb_master_semester`
--

CREATE TABLE `tb_master_semester` (
  `id_semester` int(11) NOT NULL,
  `semester` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_master_semester`
--

INSERT INTO `tb_master_semester` (`id_semester`, `semester`) VALUES
(1, 'SEMESTER 1');

-- --------------------------------------------------------

--
-- Table structure for table `tb_materi`
--

CREATE TABLE `tb_materi` (
  `id_materi` int(11) NOT NULL,
  `judul_materi` varchar(120) NOT NULL,
  `materi` text NOT NULL,
  `nama_file` varchar(120) NOT NULL,
  `tipe_file` varchar(20) NOT NULL,
  `ukuran_file` varchar(30) NOT NULL,
  `file` varchar(255) NOT NULL,
  `tgl_entry` date NOT NULL,
  `id_roleguru` int(11) NOT NULL,
  `public` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_materi`
--

INSERT INTO `tb_materi` (`id_materi`, `judul_materi`, `materi`, `nama_file`, `tipe_file`, `ukuran_file`, `file`, `tgl_entry`, `id_roleguru`, `public`) VALUES
(1, 'Modul Pembelajaran Percabangan dan Perulangan', '', '1690646122', 'docx', '0', '../vendor/file/PERANGKAT_1690646122.docx', '2023-07-29', 1, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tb_perangkat`
--

CREATE TABLE `tb_perangkat` (
  `id_perangkat` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `nama_file` varchar(120) NOT NULL,
  `tipe_file` varchar(20) NOT NULL,
  `ukuran_file` varchar(30) NOT NULL,
  `file` varchar(255) NOT NULL,
  `isi_perangkat` text NOT NULL,
  `id_jenisperangkat` int(11) NOT NULL,
  `tgl_entry` date NOT NULL,
  `publish` int(11) NOT NULL,
  `id_roleguru` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_perangkat`
--

INSERT INTO `tb_perangkat` (`id_perangkat`, `judul`, `nama_file`, `tipe_file`, `ukuran_file`, `file`, `isi_perangkat`, `id_jenisperangkat`, `tgl_entry`, `publish`, `id_roleguru`) VALUES
(1, 'Modul Pembelajaran Percabangan', '1690645719', 'pdf', '1063604', '../vendor/file/PERANGKAT_1690645719.pdf', '', 3, '2023-07-29', 1, 1),
(2, 'Silabus', '1690645869', 'pdf', '242130', '../vendor/file/PERANGKAT_1690645869.pdf', '', 2, '2023-07-29', 1, 1),
(3, 'RPP', '1690646076', 'pdf', '901061', '../vendor/file/PERANGKAT_1690646076.pdf', '', 1, '2023-07-29', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_roleguru`
--

CREATE TABLE `tb_roleguru` (
  `id_roleguru` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_roleguru`
--

INSERT INTO `tb_roleguru` (`id_roleguru`, `id_guru`, `id_kelas`, `id_mapel`, `id_semester`, `id_jurusan`) VALUES
(1, 9, 13, 11, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tb_sekolah`
--

CREATE TABLE `tb_sekolah` (
  `id_sekolah` int(11) NOT NULL,
  `nama_sekolah` varchar(120) NOT NULL,
  `kepsek` varchar(120) NOT NULL,
  `textlogo` varchar(120) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `copyright` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_sekolah`
--

INSERT INTO `tb_sekolah` (`id_sekolah`, `nama_sekolah`, `kepsek`, `textlogo`, `logo`, `copyright`) VALUES
(1, 'SMK Negeri 2 Mojokerto', 'Dadang Sunarno, M.Pd.', 'E-Classroom', 'favicon.png', ' Copyright ï¿½ 2023 <b>E-Learning</b>. Nur Liza M D | PTI 2019');

-- --------------------------------------------------------

--
-- Table structure for table `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `id_siswa` int(11) NOT NULL,
  `nis` varchar(15) NOT NULL,
  `nama_siswa` varchar(120) NOT NULL,
  `jk` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(15) NOT NULL,
  `aktif` varchar(30) NOT NULL,
  `tingkat` varchar(20) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `confirm` enum('Yes','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tb_siswa`
--

INSERT INTO `tb_siswa` (`id_siswa`, `nis`, `nama_siswa`, `jk`, `password`, `status`, `aktif`, `tingkat`, `foto`, `id_kelas`, `id_jurusan`, `confirm`) VALUES
(1, '119200001', 'Achmad Yoga Bactiar Teguh Suseno', 'L', 'af5e7eeac40eeeee5fc7192de5359f5029e4cc4e', 'off', 'Y', '0', 'orang_2.png', 13, 6, 'Yes'),
(2, '119200002', 'Afrizal Dwi Pramudya', 'L', 'fe7bd1a2d50a19e21954c9f93fac7466387ceba9', 'off', 'Y', '0', 'orang_2.png', 13, 6, 'Yes'),
(5, '119200003', 'Aldo Rohman Arifin', 'L', '170b7866da2a2e17c190545081c0958c0a120386', 'off', 'Y', '0', 'orang_2.png', 13, 6, 'Yes'),
(6, '119200004', 'Arjuna Okta Pratama', 'L', '07cf5209dd60569bfb4dad3bd285de7a4cca25f7', 'off', 'Y', '0', 'orang_2.png', 13, 6, 'Yes'),
(7, '119200005', 'Aulia Dwi Lestari', 'P', '3b23189ed86502b0fb0eb0685dfe5033cfb43004', 'off', 'Y', '0', 'orang_3.png', 13, 6, 'Yes'),
(8, '119200006', 'Chintiya Erianti', 'P', '8a073c126ef2fcf73065be4b5cb781958f5cb3b2', 'off', 'Y', '0', 'orang_3.png', 13, 6, 'Yes'),
(9, '119200007', 'Citra Septi Anggraeni', 'P', '52817870ba43a958821fc8c33e3c472ee673f08f', 'off', 'Y', '0', 'orang_3.png', 13, 6, 'Yes'),
(10, '119200008', 'David Ardi Saputra', 'L', 'c3ab1c17973f614f252154ff36e80e96205d3002', 'off', 'Y', '0', 'orang_2.png', 13, 6, 'Yes'),
(11, '119200009', 'Delio Arvanda Qolba', 'L', 'e69cc2dd0253115c1072a3f19b8a758f42162ead', 'off', 'Y', '0', 'orang_2.png', 13, 6, 'Yes'),
(12, '119200010', 'Dimas Dewa Ndaru Putra Widodo', 'L', '69c67b9e8ca0079ba1710b0da637d1f2181f70e7', 'off', 'Y', '0', 'orang_2.png', 13, 6, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tugas`
--

CREATE TABLE `tb_tugas` (
  `id_tugas` int(11) NOT NULL,
  `id_jenistugas` int(11) NOT NULL,
  `judul_tugas` varchar(100) NOT NULL,
  `isi_tugas` text NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` int(30) NOT NULL,
  `jml_anggota` int(30) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_tugas`
--

INSERT INTO `tb_tugas` (`id_tugas`, `id_jenistugas`, `judul_tugas`, `isi_tugas`, `tanggal`, `waktu`, `jml_anggota`, `id_guru`, `id_mapel`, `id_semester`) VALUES
(1, 1, 'Membuat Kalkulator sederhan dengan PHP', '<p>Segera kerjakan tugas makalah membuat kalkulator berbasis web PHP</p>\r\n', '2020-04-21', 3, 0, 7, 11, 2),
(2, 1, 'Struktur Dasar', '<p>ABC</p>\r\n', '2023-05-24', 1, 0, 7, 11, 2),
(3, 2, 'Tugas Percabangan', '<p>Kerjakan Tugas Sesuai dengan Petunjuk</p>\r\n', '2023-07-29', 3, 0, 9, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tugas_siswa`
--

CREATE TABLE `tugas_siswa` (
  `id_tgssiswa` int(11) NOT NULL,
  `id_tugas` int(11) NOT NULL,
  `subjek` varchar(120) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `kelompok` text NOT NULL,
  `nama_file` varchar(120) NOT NULL,
  `tipe_file` varchar(30) NOT NULL,
  `ukuran_file` varchar(30) NOT NULL,
  `file` varchar(255) NOT NULL,
  `tgl_upload` date NOT NULL,
  `ket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tugas_siswa`
--

INSERT INTO `tugas_siswa` (`id_tgssiswa`, `id_tugas`, `subjek`, `id_siswa`, `kelompok`, `nama_file`, `tipe_file`, `ukuran_file`, `file`, `tgl_upload`, `ket`) VALUES
(1, 1, 'Membuat Kalkulator sederhan dengan PHP', 1, '', '1587473255', 'doc', '1483', '../vendor/file/tugasTUGAS-INDIVIDU_1587473255.doc', '2020-04-21', 'Selesai'),
(2, 1, ' Subjek', 4, '', '1685426299', 'pdf', '1657864', '../vendor/file/tugasTUGAS-INDIVIDU_1685426299.pdf', '2023-05-30', '');

-- --------------------------------------------------------

--
-- Table structure for table `ujian`
--

CREATE TABLE `ujian` (
  `id_ujian` int(5) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `jml_soal` int(30) NOT NULL,
  `acak` varchar(100) NOT NULL,
  `tipe` int(1) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ujian`
--

INSERT INTO `ujian` (`id_ujian`, `judul`, `tanggal`, `waktu`, `jml_soal`, `acak`, `tipe`, `id_jenis`, `id_guru`, `id_mapel`, `id_semester`) VALUES
(14, 'Kalkulator', '2020-04-21', '00:05:00', 5, 'acak', 0, 2, 7, 11, 2),
(15, 'Struktur Dasar', '2023-05-24', '00:00:00', 10, 'acak', 0, 2, 7, 11, 2),
(16, 'Quiz Pertemuan Ke 1', '2023-07-29', '01:00:00', 25, 'acak', 0, 2, 9, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ujian_essay`
--

CREATE TABLE `ujian_essay` (
  `id_ujianessay` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `jml_soal` int(30) NOT NULL,
  `soal_essay` text NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `analisis`
--
ALTER TABLE `analisis`
  ADD PRIMARY KEY (`id_analisis`);

--
-- Indexes for table `kelas_tugas`
--
ALTER TABLE `kelas_tugas`
  ADD PRIMARY KEY (`id_klstugas`);

--
-- Indexes for table `kelas_ujian`
--
ALTER TABLE `kelas_ujian`
  ADD PRIMARY KEY (`id_klsujian`);

--
-- Indexes for table `kelas_ujianessay`
--
ALTER TABLE `kelas_ujianessay`
  ADD PRIMARY KEY (`id_klsessay`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indexes for table `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`id_soal`);

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indexes for table `tb_jenisperangkat`
--
ALTER TABLE `tb_jenisperangkat`
  ADD PRIMARY KEY (`id_jenisperangkat`);

--
-- Indexes for table `tb_jenistugas`
--
ALTER TABLE `tb_jenistugas`
  ADD PRIMARY KEY (`id_jenistugas`);

--
-- Indexes for table `tb_jenisujian`
--
ALTER TABLE `tb_jenisujian`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `tb_master_jurusan`
--
ALTER TABLE `tb_master_jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `tb_master_kelas`
--
ALTER TABLE `tb_master_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `tb_master_mapel`
--
ALTER TABLE `tb_master_mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indexes for table `tb_master_semester`
--
ALTER TABLE `tb_master_semester`
  ADD PRIMARY KEY (`id_semester`);

--
-- Indexes for table `tb_materi`
--
ALTER TABLE `tb_materi`
  ADD PRIMARY KEY (`id_materi`),
  ADD KEY `id_roleguru` (`id_roleguru`);

--
-- Indexes for table `tb_perangkat`
--
ALTER TABLE `tb_perangkat`
  ADD PRIMARY KEY (`id_perangkat`),
  ADD KEY `id_roleguru` (`id_roleguru`);

--
-- Indexes for table `tb_roleguru`
--
ALTER TABLE `tb_roleguru`
  ADD PRIMARY KEY (`id_roleguru`),
  ADD KEY `id_guru` (`id_guru`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_mapel` (`id_mapel`),
  ADD KEY `id_semester` (`id_semester`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indexes for table `tb_sekolah`
--
ALTER TABLE `tb_sekolah`
  ADD PRIMARY KEY (`id_sekolah`);

--
-- Indexes for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indexes for table `tb_tugas`
--
ALTER TABLE `tb_tugas`
  ADD PRIMARY KEY (`id_tugas`);

--
-- Indexes for table `tugas_siswa`
--
ALTER TABLE `tugas_siswa`
  ADD PRIMARY KEY (`id_tgssiswa`);

--
-- Indexes for table `ujian`
--
ALTER TABLE `ujian`
  ADD PRIMARY KEY (`id_ujian`);

--
-- Indexes for table `ujian_essay`
--
ALTER TABLE `ujian_essay`
  ADD PRIMARY KEY (`id_ujianessay`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `analisis`
--
ALTER TABLE `analisis`
  MODIFY `id_analisis` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `kelas_tugas`
--
ALTER TABLE `kelas_tugas`
  MODIFY `id_klstugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `kelas_ujian`
--
ALTER TABLE `kelas_ujian`
  MODIFY `id_klsujian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `kelas_ujianessay`
--
ALTER TABLE `kelas_ujianessay`
  MODIFY `id_klsessay` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id_pesan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `soal`
--
ALTER TABLE `soal`
  MODIFY `id_soal` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;
--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_guru`
--
ALTER TABLE `tb_guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tb_jenisperangkat`
--
ALTER TABLE `tb_jenisperangkat`
  MODIFY `id_jenisperangkat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tb_jenistugas`
--
ALTER TABLE `tb_jenistugas`
  MODIFY `id_jenistugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_jenisujian`
--
ALTER TABLE `tb_jenisujian`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_master_jurusan`
--
ALTER TABLE `tb_master_jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tb_master_kelas`
--
ALTER TABLE `tb_master_kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tb_master_mapel`
--
ALTER TABLE `tb_master_mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tb_master_semester`
--
ALTER TABLE `tb_master_semester`
  MODIFY `id_semester` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_materi`
--
ALTER TABLE `tb_materi`
  MODIFY `id_materi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_perangkat`
--
ALTER TABLE `tb_perangkat`
  MODIFY `id_perangkat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_roleguru`
--
ALTER TABLE `tb_roleguru`
  MODIFY `id_roleguru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_sekolah`
--
ALTER TABLE `tb_sekolah`
  MODIFY `id_sekolah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tb_tugas`
--
ALTER TABLE `tb_tugas`
  MODIFY `id_tugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tugas_siswa`
--
ALTER TABLE `tugas_siswa`
  MODIFY `id_tgssiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ujian`
--
ALTER TABLE `ujian`
  MODIFY `id_ujian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `ujian_essay`
--
ALTER TABLE `ujian_essay`
  MODIFY `id_ujianessay` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_materi`
--
ALTER TABLE `tb_materi`
  ADD CONSTRAINT `tb_materi_ibfk_1` FOREIGN KEY (`id_roleguru`) REFERENCES `tb_roleguru` (`id_roleguru`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_perangkat`
--
ALTER TABLE `tb_perangkat`
  ADD CONSTRAINT `tb_perangkat_ibfk_1` FOREIGN KEY (`id_roleguru`) REFERENCES `tb_roleguru` (`id_roleguru`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_roleguru`
--
ALTER TABLE `tb_roleguru`
  ADD CONSTRAINT `tb_roleguru_ibfk_1` FOREIGN KEY (`id_guru`) REFERENCES `tb_guru` (`id_guru`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_roleguru_ibfk_2` FOREIGN KEY (`id_jurusan`) REFERENCES `tb_master_jurusan` (`id_jurusan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_roleguru_ibfk_3` FOREIGN KEY (`id_kelas`) REFERENCES `tb_master_kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_roleguru_ibfk_4` FOREIGN KEY (`id_mapel`) REFERENCES `tb_master_mapel` (`id_mapel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_roleguru_ibfk_5` FOREIGN KEY (`id_semester`) REFERENCES `tb_master_semester` (`id_semester`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
