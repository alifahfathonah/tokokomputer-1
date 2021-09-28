-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Sep 2021 pada 07.41
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_barang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
  `idbarang` int(11) NOT NULL,
  `namabarang` char(255) DEFAULT NULL,
  `hargabarang` varchar(30) DEFAULT NULL,
  `fotobarang` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_barang`
--

INSERT INTO `tb_barang` (`idbarang`, `namabarang`, `hargabarang`, `fotobarang`) VALUES
(4, 'RAM 64GBx', 'Rp. 650.000', '1629279585_1.jpg'),
(5, 'Charger Laptop 4 A', 'Rp. 70.000', '1629278280_1629272464_barang.png'),
(14, 'Laptop Asus', 'Rp. 100.000', '1629273407_barang.png'),
(15, 'Mouse Logitech', 'Rp. 120.000', '1629275496_1629275460_1629269787_barang.png'),
(16, 'Hansfree', 'Rp. 150.000', '1629275558_1629275496_1629275460_1629269787_barang.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_detail_jual`
--

CREATE TABLE `tb_detail_jual` (
  `id_jual_detai` int(11) NOT NULL,
  `idtransaksi_detail` int(11) DEFAULT NULL,
  `idbarang_temp_detail` int(11) DEFAULT NULL,
  `nama_detail` varchar(30) DEFAULT NULL,
  `nohp_detail` varchar(12) DEFAULT NULL,
  `kota_tujuan_detail` char(30) DEFAULT NULL,
  `alamat_lengkap_detail` char(50) DEFAULT NULL,
  `ekspedisi_detail` char(50) DEFAULT NULL,
  `berat_detail` int(11) DEFAULT NULL,
  `biaya_kirim_detail` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jual`
--

CREATE TABLE `tb_jual` (
  `idtransaksi` int(11) NOT NULL,
  `namabarangjual` char(255) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `totalharga` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jual_temp`
--

CREATE TABLE `tb_jual_temp` (
  `idbarang_temp` int(11) DEFAULT NULL,
  `namabarang_temp` char(255) DEFAULT NULL,
  `hargabarang_temp` char(30) DEFAULT NULL,
  `qty_temp` int(11) DEFAULT NULL,
  `totalharga_temp` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kota_rajaongkir`
--

CREATE TABLE `tb_kota_rajaongkir` (
  `city_id` int(11) DEFAULT NULL,
  `city_name` varchar(100) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_kota_rajaongkir`
--

INSERT INTO `tb_kota_rajaongkir` (`city_id`, `city_name`, `province_id`) VALUES
(1, 'Aceh Barat', 21),
(2, 'Aceh Barat Daya', 21),
(3, 'Aceh Besar', 21),
(4, 'Aceh Jaya', 21),
(5, 'Aceh Selatan', 21),
(6, 'Aceh Singkil', 21),
(7, 'Aceh Tamiang', 21),
(8, 'Aceh Tengah', 21),
(9, 'Aceh Tenggara', 21),
(10, 'Aceh Timur', 21),
(11, 'Aceh Utara', 21),
(12, 'Agam', 32),
(13, 'Alor', 23),
(14, 'Ambon', 19),
(15, 'Asahan', 34),
(16, 'Asmat', 24),
(17, 'Badung', 1),
(18, 'Balangan', 13),
(19, 'Balikpapan', 15),
(20, 'Banda Aceh', 21),
(21, 'Bandar Lampung', 18),
(22, 'Bandung', 9),
(23, 'Bandung', 9),
(24, 'Bandung Barat', 9),
(25, 'Banggai', 29),
(26, 'Banggai Kepulauan', 29),
(27, 'Bangka', 2),
(28, 'Bangka Barat', 2),
(29, 'Bangka Selatan', 2),
(30, 'Bangka Tengah', 2),
(31, 'Bangkalan', 11),
(32, 'Bangli', 1),
(33, 'Banjar', 13),
(34, 'Banjar', 9),
(35, 'Banjarbaru', 13),
(36, 'Banjarmasin', 13),
(37, 'Banjarnegara', 10),
(38, 'Bantaeng', 28),
(39, 'Bantul', 5),
(40, 'Banyuasin', 33),
(41, 'Banyumas', 10),
(42, 'Banyuwangi', 11),
(43, 'Barito Kuala', 13),
(44, 'Barito Selatan', 14),
(45, 'Barito Timur', 14),
(46, 'Barito Utara', 14),
(47, 'Barru', 28),
(48, 'Batam', 17),
(49, 'Batang', 10),
(50, 'Batang Hari', 8),
(51, 'Batu', 11),
(52, 'Batu Bara', 34),
(53, 'Bau-Bau', 30),
(54, 'Bekasi', 9),
(55, 'Bekasi', 9),
(56, 'Belitung', 2),
(57, 'Belitung Timur', 2),
(58, 'Belu', 23),
(59, 'Bener Meriah', 21),
(60, 'Bengkalis', 26),
(61, 'Bengkayang', 12),
(62, 'Bengkulu', 4),
(63, 'Bengkulu Selatan', 4),
(64, 'Bengkulu Tengah', 4),
(65, 'Bengkulu Utara', 4),
(66, 'Berau', 15),
(67, 'Biak Numfor', 24),
(68, 'Bima', 22),
(69, 'Bima', 22),
(70, 'Binjai', 34),
(71, 'Bintan', 17),
(72, 'Bireuen', 21),
(73, 'Bitung', 31),
(74, 'Blitar', 11),
(75, 'Blitar', 11),
(76, 'Blora', 10),
(77, 'Boalemo', 7),
(78, 'Bogor', 9),
(79, 'Bogor', 9),
(80, 'Bojonegoro', 11),
(81, 'Bolaang Mongondow (Bolmong)', 31),
(82, 'Bolaang Mongondow Selatan', 31),
(83, 'Bolaang Mongondow Timur', 31),
(84, 'Bolaang Mongondow Utara', 31),
(85, 'Bombana', 30),
(86, 'Bondowoso', 11),
(87, 'Bone', 28),
(88, 'Bone Bolango', 7),
(89, 'Bontang', 15),
(90, 'Boven Digoel', 24),
(91, 'Boyolali', 10),
(92, 'Brebes', 10),
(93, 'Bukittinggi', 32),
(94, 'Buleleng', 1),
(95, 'Bulukumba', 28),
(96, 'Bulungan (Bulongan)', 16),
(97, 'Bungo', 8),
(98, 'Buol', 29),
(99, 'Buru', 19),
(100, 'Buru Selatan', 19),
(101, 'Buton', 30),
(102, 'Buton Utara', 30),
(103, 'Ciamis', 9),
(104, 'Cianjur', 9),
(105, 'Cilacap', 10),
(106, 'Cilegon', 3),
(107, 'Cimahi', 9),
(108, 'Cirebon', 9),
(109, 'Cirebon', 9),
(110, 'Dairi', 34),
(111, 'Deiyai (Deliyai)', 24),
(112, 'Deli Serdang', 34),
(113, 'Demak', 10),
(114, 'Denpasar', 1),
(115, 'Depok', 9),
(116, 'Dharmasraya', 32),
(117, 'Dogiyai', 24),
(118, 'Dompu', 22),
(119, 'Donggala', 29),
(120, 'Dumai', 26),
(121, 'Empat Lawang', 33),
(122, 'Ende', 23),
(123, 'Enrekang', 28),
(124, 'Fakfak', 25),
(125, 'Flores Timur', 23),
(126, 'Garut', 9),
(127, 'Gayo Lues', 21),
(128, 'Gianyar', 1),
(129, 'Gorontalo', 7),
(130, 'Gorontalo', 7),
(131, 'Gorontalo Utara', 7),
(132, 'Gowa', 28),
(133, 'Gresik', 11),
(134, 'Grobogan', 10),
(135, 'Gunung Kidul', 5),
(136, 'Gunung Mas', 14),
(137, 'Gunungsitoli', 34),
(138, 'Halmahera Barat', 20),
(139, 'Halmahera Selatan', 20),
(140, 'Halmahera Tengah', 20),
(141, 'Halmahera Timur', 20),
(142, 'Halmahera Utara', 20),
(143, 'Hulu Sungai Selatan', 13),
(144, 'Hulu Sungai Tengah', 13),
(145, 'Hulu Sungai Utara', 13),
(146, 'Humbang Hasundutan', 34),
(147, 'Indragiri Hilir', 26),
(148, 'Indragiri Hulu', 26),
(149, 'Indramayu', 9),
(150, 'Intan Jaya', 24),
(151, 'Jakarta Barat', 6),
(152, 'Jakarta Pusat', 6),
(153, 'Jakarta Selatan', 6),
(154, 'Jakarta Timur', 6),
(155, 'Jakarta Utara', 6),
(156, 'Jambi', 8),
(157, 'Jayapura', 24),
(158, 'Jayapura', 24),
(159, 'Jayawijaya', 24),
(160, 'Jember', 11),
(161, 'Jembrana', 1),
(162, 'Jeneponto', 28),
(163, 'Jepara', 10),
(164, 'Jombang', 11),
(165, 'Kaimana', 25),
(166, 'Kampar', 26),
(167, 'Kapuas', 14),
(168, 'Kapuas Hulu', 12),
(169, 'Karanganyar', 10),
(170, 'Karangasem', 1),
(171, 'Karawang', 9),
(172, 'Karimun', 17),
(173, 'Karo', 34),
(174, 'Katingan', 14),
(175, 'Kaur', 4),
(176, 'Kayong Utara', 12),
(177, 'Kebumen', 10),
(178, 'Kediri', 11),
(179, 'Kediri', 11),
(180, 'Keerom', 24),
(181, 'Kendal', 10),
(182, 'Kendari', 30),
(183, 'Kepahiang', 4),
(184, 'Kepulauan Anambas', 17),
(185, 'Kepulauan Aru', 19),
(186, 'Kepulauan Mentawai', 32),
(187, 'Kepulauan Meranti', 26),
(188, 'Kepulauan Sangihe', 31),
(189, 'Kepulauan Seribu', 6),
(190, 'Kepulauan Siau Tagulandang Biaro (Sitaro)', 31),
(191, 'Kepulauan Sula', 20),
(192, 'Kepulauan Talaud', 31),
(193, 'Kepulauan Yapen (Yapen Waropen)', 24),
(194, 'Kerinci', 8),
(195, 'Ketapang', 12),
(196, 'Klaten', 10),
(197, 'Klungkung', 1),
(198, 'Kolaka', 30),
(199, 'Kolaka Utara', 30),
(200, 'Konawe', 30),
(201, 'Konawe Selatan', 30),
(202, 'Konawe Utara', 30),
(203, 'Kotabaru', 13),
(204, 'Kotamobagu', 31),
(205, 'Kotawaringin Barat', 14),
(206, 'Kotawaringin Timur', 14),
(207, 'Kuantan Singingi', 26),
(208, 'Kubu Raya', 12),
(209, 'Kudus', 10),
(210, 'Kulon Progo', 5),
(211, 'Kuningan', 9),
(212, 'Kupang', 23),
(213, 'Kupang', 23),
(214, 'Kutai Barat', 15),
(215, 'Kutai Kartanegara', 15),
(216, 'Kutai Timur', 15),
(217, 'Labuhan Batu', 34),
(218, 'Labuhan Batu Selatan', 34),
(219, 'Labuhan Batu Utara', 34),
(220, 'Lahat', 33),
(221, 'Lamandau', 14),
(222, 'Lamongan', 11),
(223, 'Lampung Barat', 18),
(224, 'Lampung Selatan', 18),
(225, 'Lampung Tengah', 18),
(226, 'Lampung Timur', 18),
(227, 'Lampung Utara', 18),
(228, 'Landak', 12),
(229, 'Langkat', 34),
(230, 'Langsa', 21),
(231, 'Lanny Jaya', 24),
(232, 'Lebak', 3),
(233, 'Lebong', 4),
(234, 'Lembata', 23),
(235, 'Lhokseumawe', 21),
(236, 'Lima Puluh Koto/Kota', 32),
(237, 'Lingga', 17),
(238, 'Lombok Barat', 22),
(239, 'Lombok Tengah', 22),
(240, 'Lombok Timur', 22),
(241, 'Lombok Utara', 22),
(242, 'Lubuk Linggau', 33),
(243, 'Lumajang', 11),
(244, 'Luwu', 28),
(245, 'Luwu Timur', 28),
(246, 'Luwu Utara', 28),
(247, 'Madiun', 11),
(248, 'Madiun', 11),
(249, 'Magelang', 10),
(250, 'Magelang', 10),
(251, 'Magetan', 11),
(252, 'Majalengka', 9),
(253, 'Majene', 27),
(254, 'Makassar', 28),
(255, 'Malang', 11),
(256, 'Malang', 11),
(257, 'Malinau', 16),
(258, 'Maluku Barat Daya', 19),
(259, 'Maluku Tengah', 19),
(260, 'Maluku Tenggara', 19),
(261, 'Maluku Tenggara Barat', 19),
(262, 'Mamasa', 27),
(263, 'Mamberamo Raya', 24),
(264, 'Mamberamo Tengah', 24),
(265, 'Mamuju', 27),
(266, 'Mamuju Utara', 27),
(267, 'Manado', 31),
(268, 'Mandailing Natal', 34),
(269, 'Manggarai', 23),
(270, 'Manggarai Barat', 23),
(271, 'Manggarai Timur', 23),
(272, 'Manokwari', 25),
(273, 'Manokwari Selatan', 25),
(274, 'Mappi', 24),
(275, 'Maros', 28),
(276, 'Mataram', 22),
(277, 'Maybrat', 25),
(278, 'Medan', 34),
(279, 'Melawi', 12),
(280, 'Merangin', 8),
(281, 'Merauke', 24),
(282, 'Mesuji', 18),
(283, 'Metro', 18),
(284, 'Mimika', 24),
(285, 'Minahasa', 31),
(286, 'Minahasa Selatan', 31),
(287, 'Minahasa Tenggara', 31),
(288, 'Minahasa Utara', 31),
(289, 'Mojokerto', 11),
(290, 'Mojokerto', 11),
(291, 'Morowali', 29),
(292, 'Muara Enim', 33),
(293, 'Muaro Jambi', 8),
(294, 'Muko Muko', 4),
(295, 'Muna', 30),
(296, 'Murung Raya', 14),
(297, 'Musi Banyuasin', 33),
(298, 'Musi Rawas', 33),
(299, 'Nabire', 24),
(300, 'Nagan Raya', 21),
(301, 'Nagekeo', 23),
(302, 'Natuna', 17),
(303, 'Nduga', 24),
(304, 'Ngada', 23),
(305, 'Nganjuk', 11),
(306, 'Ngawi', 11),
(307, 'Nias', 34),
(308, 'Nias Barat', 34),
(309, 'Nias Selatan', 34),
(310, 'Nias Utara', 34),
(311, 'Nunukan', 16),
(312, 'Ogan Ilir', 33),
(313, 'Ogan Komering Ilir', 33),
(314, 'Ogan Komering Ulu', 33),
(315, 'Ogan Komering Ulu Selatan', 33),
(316, 'Ogan Komering Ulu Timur', 33),
(317, 'Pacitan', 11),
(318, 'Padang', 32),
(319, 'Padang Lawas', 34),
(320, 'Padang Lawas Utara', 34),
(321, 'Padang Panjang', 32),
(322, 'Padang Pariaman', 32),
(323, 'Padang Sidempuan', 34),
(324, 'Pagar Alam', 33),
(325, 'Pakpak Bharat', 34),
(326, 'Palangka Raya', 14),
(327, 'Palembang', 33),
(328, 'Palopo', 28),
(329, 'Palu', 29),
(330, 'Pamekasan', 11),
(331, 'Pandeglang', 3),
(332, 'Pangandaran', 9),
(333, 'Pangkajene Kepulauan', 28),
(334, 'Pangkal Pinang', 2),
(335, 'Paniai', 24),
(336, 'Parepare', 28),
(337, 'Pariaman', 32),
(338, 'Parigi Moutong', 29),
(339, 'Pasaman', 32),
(340, 'Pasaman Barat', 32),
(341, 'Paser', 15),
(342, 'Pasuruan', 11),
(343, 'Pasuruan', 11),
(344, 'Pati', 10),
(345, 'Payakumbuh', 32),
(346, 'Pegunungan Arfak', 25),
(347, 'Pegunungan Bintang', 24),
(348, 'Pekalongan', 10),
(349, 'Pekalongan', 10),
(350, 'Pekanbaru', 26),
(351, 'Pelalawan', 26),
(352, 'Pemalang', 10),
(353, 'Pematang Siantar', 34),
(354, 'Penajam Paser Utara', 15),
(355, 'Pesawaran', 18),
(356, 'Pesisir Barat', 18),
(357, 'Pesisir Selatan', 32),
(358, 'Pidie', 21),
(359, 'Pidie Jaya', 21),
(360, 'Pinrang', 28),
(361, 'Pohuwato', 7),
(362, 'Polewali Mandar', 27),
(363, 'Ponorogo', 11),
(364, 'Pontianak', 12),
(365, 'Pontianak', 12),
(366, 'Poso', 29),
(367, 'Prabumulih', 33),
(368, 'Pringsewu', 18),
(369, 'Probolinggo', 11),
(370, 'Probolinggo', 11),
(371, 'Pulang Pisau', 14),
(372, 'Pulau Morotai', 20),
(373, 'Puncak', 24),
(374, 'Puncak Jaya', 24),
(375, 'Purbalingga', 10),
(376, 'Purwakarta', 9),
(377, 'Purworejo', 10),
(378, 'Raja Ampat', 25),
(379, 'Rejang Lebong', 4),
(380, 'Rembang', 10),
(381, 'Rokan Hilir', 26),
(382, 'Rokan Hulu', 26),
(383, 'Rote Ndao', 23),
(384, 'Sabang', 21),
(385, 'Sabu Raijua', 23),
(386, 'Salatiga', 10),
(387, 'Samarinda', 15),
(388, 'Sambas', 12),
(389, 'Samosir', 34),
(390, 'Sampang', 11),
(391, 'Sanggau', 12),
(392, 'Sarmi', 24),
(393, 'Sarolangun', 8),
(394, 'Sawah Lunto', 32),
(395, 'Sekadau', 12),
(396, 'Selayar (Kepulauan Selayar)', 28),
(397, 'Seluma', 4),
(398, 'Semarang', 10),
(399, 'Semarang', 10),
(400, 'Seram Bagian Barat', 19),
(401, 'Seram Bagian Timur', 19),
(402, 'Serang', 3),
(403, 'Serang', 3),
(404, 'Serdang Bedagai', 34),
(405, 'Seruyan', 14),
(406, 'Siak', 26),
(407, 'Sibolga', 34),
(408, 'Sidenreng Rappang/Rapang', 28),
(409, 'Sidoarjo', 11),
(410, 'Sigi', 29),
(411, 'Sijunjung (Sawah Lunto Sijunjung)', 32),
(412, 'Sikka', 23),
(413, 'Simalungun', 34),
(414, 'Simeulue', 21),
(415, 'Singkawang', 12),
(416, 'Sinjai', 28),
(417, 'Sintang', 12),
(418, 'Situbondo', 11),
(419, 'Sleman', 5),
(420, 'Solok', 32),
(421, 'Solok', 32),
(422, 'Solok Selatan', 32),
(423, 'Soppeng', 28),
(424, 'Sorong', 25),
(425, 'Sorong', 25),
(426, 'Sorong Selatan', 25),
(427, 'Sragen', 10),
(428, 'Subang', 9),
(429, 'Subulussalam', 21),
(430, 'Sukabumi', 9),
(431, 'Sukabumi', 9),
(432, 'Sukamara', 14),
(433, 'Sukoharjo', 10),
(434, 'Sumba Barat', 23),
(435, 'Sumba Barat Daya', 23),
(436, 'Sumba Tengah', 23),
(437, 'Sumba Timur', 23),
(438, 'Sumbawa', 22),
(439, 'Sumbawa Barat', 22),
(440, 'Sumedang', 9),
(441, 'Sumenep', 11),
(442, 'Sungaipenuh', 8),
(443, 'Supiori', 24),
(444, 'Surabaya', 11),
(445, 'Surakarta (Solo)', 10),
(446, 'Tabalong', 13),
(447, 'Tabanan', 1),
(448, 'Takalar', 28),
(449, 'Tambrauw', 25),
(450, 'Tana Tidung', 16),
(451, 'Tana Toraja', 28),
(452, 'Tanah Bumbu', 13),
(453, 'Tanah Datar', 32),
(454, 'Tanah Laut', 13),
(455, 'Tangerang', 3),
(456, 'Tangerang', 3),
(457, 'Tangerang Selatan', 3),
(458, 'Tanggamus', 18),
(459, 'Tanjung Balai', 34),
(460, 'Tanjung Jabung Barat', 8),
(461, 'Tanjung Jabung Timur', 8),
(462, 'Tanjung Pinang', 17),
(463, 'Tapanuli Selatan', 34),
(464, 'Tapanuli Tengah', 34),
(465, 'Tapanuli Utara', 34),
(466, 'Tapin', 13),
(467, 'Tarakan', 16),
(468, 'Tasikmalaya', 9),
(469, 'Tasikmalaya', 9),
(470, 'Tebing Tinggi', 34),
(471, 'Tebo', 8),
(472, 'Tegal', 10),
(473, 'Tegal', 10),
(474, 'Teluk Bintuni', 25),
(475, 'Teluk Wondama', 25),
(476, 'Temanggung', 10),
(477, 'Ternate', 20),
(478, 'Tidore Kepulauan', 20),
(479, 'Timor Tengah Selatan', 23),
(480, 'Timor Tengah Utara', 23),
(481, 'Toba Samosir', 34),
(482, 'Tojo Una-Una', 29),
(483, 'Toli-Toli', 29),
(484, 'Tolikara', 24),
(485, 'Tomohon', 31),
(486, 'Toraja Utara', 28),
(487, 'Trenggalek', 11),
(488, 'Tual', 19),
(489, 'Tuban', 11),
(490, 'Tulang Bawang', 18),
(491, 'Tulang Bawang Barat', 18),
(492, 'Tulungagung', 11),
(493, 'Wajo', 28),
(494, 'Wakatobi', 30),
(495, 'Waropen', 24),
(496, 'Way Kanan', 18),
(497, 'Wonogiri', 10),
(498, 'Wonosobo', 10),
(499, 'Yahukimo', 24),
(500, 'Yalimo', 24),
(501, 'Yogyakarta', 5),
(1, 'Aceh Barat', 21),
(2, 'Aceh Barat Daya', 21),
(3, 'Aceh Besar', 21),
(4, 'Aceh Jaya', 21),
(5, 'Aceh Selatan', 21),
(6, 'Aceh Singkil', 21),
(7, 'Aceh Tamiang', 21),
(8, 'Aceh Tengah', 21),
(9, 'Aceh Tenggara', 21),
(10, 'Aceh Timur', 21),
(11, 'Aceh Utara', 21),
(12, 'Agam', 32),
(13, 'Alor', 23),
(14, 'Ambon', 19),
(15, 'Asahan', 34),
(16, 'Asmat', 24),
(17, 'Badung', 1),
(18, 'Balangan', 13),
(19, 'Balikpapan', 15),
(20, 'Banda Aceh', 21),
(21, 'Bandar Lampung', 18),
(22, 'Bandung', 9),
(23, 'Bandung', 9),
(24, 'Bandung Barat', 9),
(25, 'Banggai', 29),
(26, 'Banggai Kepulauan', 29),
(27, 'Bangka', 2),
(28, 'Bangka Barat', 2),
(29, 'Bangka Selatan', 2),
(30, 'Bangka Tengah', 2),
(31, 'Bangkalan', 11),
(32, 'Bangli', 1),
(33, 'Banjar', 13),
(34, 'Banjar', 9),
(35, 'Banjarbaru', 13),
(36, 'Banjarmasin', 13),
(37, 'Banjarnegara', 10),
(38, 'Bantaeng', 28),
(39, 'Bantul', 5),
(40, 'Banyuasin', 33),
(41, 'Banyumas', 10),
(42, 'Banyuwangi', 11),
(43, 'Barito Kuala', 13),
(44, 'Barito Selatan', 14),
(45, 'Barito Timur', 14),
(46, 'Barito Utara', 14),
(47, 'Barru', 28),
(48, 'Batam', 17),
(49, 'Batang', 10),
(50, 'Batang Hari', 8),
(51, 'Batu', 11),
(52, 'Batu Bara', 34),
(53, 'Bau-Bau', 30),
(54, 'Bekasi', 9),
(55, 'Bekasi', 9),
(56, 'Belitung', 2),
(57, 'Belitung Timur', 2),
(58, 'Belu', 23),
(59, 'Bener Meriah', 21),
(60, 'Bengkalis', 26),
(61, 'Bengkayang', 12),
(62, 'Bengkulu', 4),
(63, 'Bengkulu Selatan', 4),
(64, 'Bengkulu Tengah', 4),
(65, 'Bengkulu Utara', 4),
(66, 'Berau', 15),
(67, 'Biak Numfor', 24),
(68, 'Bima', 22),
(69, 'Bima', 22),
(70, 'Binjai', 34),
(71, 'Bintan', 17),
(72, 'Bireuen', 21),
(73, 'Bitung', 31),
(74, 'Blitar', 11),
(75, 'Blitar', 11),
(76, 'Blora', 10),
(77, 'Boalemo', 7),
(78, 'Bogor', 9),
(79, 'Bogor', 9),
(80, 'Bojonegoro', 11),
(81, 'Bolaang Mongondow (Bolmong)', 31),
(82, 'Bolaang Mongondow Selatan', 31),
(83, 'Bolaang Mongondow Timur', 31),
(84, 'Bolaang Mongondow Utara', 31),
(85, 'Bombana', 30),
(86, 'Bondowoso', 11),
(87, 'Bone', 28),
(88, 'Bone Bolango', 7),
(89, 'Bontang', 15),
(90, 'Boven Digoel', 24),
(91, 'Boyolali', 10),
(92, 'Brebes', 10),
(93, 'Bukittinggi', 32),
(94, 'Buleleng', 1),
(95, 'Bulukumba', 28),
(96, 'Bulungan (Bulongan)', 16),
(97, 'Bungo', 8),
(98, 'Buol', 29),
(99, 'Buru', 19),
(100, 'Buru Selatan', 19),
(101, 'Buton', 30),
(102, 'Buton Utara', 30),
(103, 'Ciamis', 9),
(104, 'Cianjur', 9),
(105, 'Cilacap', 10),
(106, 'Cilegon', 3),
(107, 'Cimahi', 9),
(108, 'Cirebon', 9),
(109, 'Cirebon', 9),
(110, 'Dairi', 34),
(111, 'Deiyai (Deliyai)', 24),
(112, 'Deli Serdang', 34),
(113, 'Demak', 10),
(114, 'Denpasar', 1),
(115, 'Depok', 9),
(116, 'Dharmasraya', 32),
(117, 'Dogiyai', 24),
(118, 'Dompu', 22),
(119, 'Donggala', 29),
(120, 'Dumai', 26),
(121, 'Empat Lawang', 33),
(122, 'Ende', 23),
(123, 'Enrekang', 28),
(124, 'Fakfak', 25),
(125, 'Flores Timur', 23),
(126, 'Garut', 9),
(127, 'Gayo Lues', 21),
(128, 'Gianyar', 1),
(129, 'Gorontalo', 7),
(130, 'Gorontalo', 7),
(131, 'Gorontalo Utara', 7),
(132, 'Gowa', 28),
(133, 'Gresik', 11),
(134, 'Grobogan', 10),
(135, 'Gunung Kidul', 5),
(136, 'Gunung Mas', 14),
(137, 'Gunungsitoli', 34),
(138, 'Halmahera Barat', 20),
(139, 'Halmahera Selatan', 20),
(140, 'Halmahera Tengah', 20),
(141, 'Halmahera Timur', 20),
(142, 'Halmahera Utara', 20),
(143, 'Hulu Sungai Selatan', 13),
(144, 'Hulu Sungai Tengah', 13),
(145, 'Hulu Sungai Utara', 13),
(146, 'Humbang Hasundutan', 34),
(147, 'Indragiri Hilir', 26),
(148, 'Indragiri Hulu', 26),
(149, 'Indramayu', 9),
(150, 'Intan Jaya', 24),
(151, 'Jakarta Barat', 6),
(152, 'Jakarta Pusat', 6),
(153, 'Jakarta Selatan', 6),
(154, 'Jakarta Timur', 6),
(155, 'Jakarta Utara', 6),
(156, 'Jambi', 8),
(157, 'Jayapura', 24),
(158, 'Jayapura', 24),
(159, 'Jayawijaya', 24),
(160, 'Jember', 11),
(161, 'Jembrana', 1),
(162, 'Jeneponto', 28),
(163, 'Jepara', 10),
(164, 'Jombang', 11),
(165, 'Kaimana', 25),
(166, 'Kampar', 26),
(167, 'Kapuas', 14),
(168, 'Kapuas Hulu', 12),
(169, 'Karanganyar', 10),
(170, 'Karangasem', 1),
(171, 'Karawang', 9),
(172, 'Karimun', 17),
(173, 'Karo', 34),
(174, 'Katingan', 14),
(175, 'Kaur', 4),
(176, 'Kayong Utara', 12),
(177, 'Kebumen', 10),
(178, 'Kediri', 11),
(179, 'Kediri', 11),
(180, 'Keerom', 24),
(181, 'Kendal', 10),
(182, 'Kendari', 30),
(183, 'Kepahiang', 4),
(184, 'Kepulauan Anambas', 17),
(185, 'Kepulauan Aru', 19),
(186, 'Kepulauan Mentawai', 32),
(187, 'Kepulauan Meranti', 26),
(188, 'Kepulauan Sangihe', 31),
(189, 'Kepulauan Seribu', 6),
(190, 'Kepulauan Siau Tagulandang Biaro (Sitaro)', 31),
(191, 'Kepulauan Sula', 20),
(192, 'Kepulauan Talaud', 31),
(193, 'Kepulauan Yapen (Yapen Waropen)', 24),
(194, 'Kerinci', 8),
(195, 'Ketapang', 12),
(196, 'Klaten', 10),
(197, 'Klungkung', 1),
(198, 'Kolaka', 30),
(199, 'Kolaka Utara', 30),
(200, 'Konawe', 30),
(201, 'Konawe Selatan', 30),
(202, 'Konawe Utara', 30),
(203, 'Kotabaru', 13),
(204, 'Kotamobagu', 31),
(205, 'Kotawaringin Barat', 14),
(206, 'Kotawaringin Timur', 14),
(207, 'Kuantan Singingi', 26),
(208, 'Kubu Raya', 12),
(209, 'Kudus', 10),
(210, 'Kulon Progo', 5),
(211, 'Kuningan', 9),
(212, 'Kupang', 23),
(213, 'Kupang', 23),
(214, 'Kutai Barat', 15),
(215, 'Kutai Kartanegara', 15),
(216, 'Kutai Timur', 15),
(217, 'Labuhan Batu', 34),
(218, 'Labuhan Batu Selatan', 34),
(219, 'Labuhan Batu Utara', 34),
(220, 'Lahat', 33),
(221, 'Lamandau', 14),
(222, 'Lamongan', 11),
(223, 'Lampung Barat', 18),
(224, 'Lampung Selatan', 18),
(225, 'Lampung Tengah', 18),
(226, 'Lampung Timur', 18),
(227, 'Lampung Utara', 18),
(228, 'Landak', 12),
(229, 'Langkat', 34),
(230, 'Langsa', 21),
(231, 'Lanny Jaya', 24),
(232, 'Lebak', 3),
(233, 'Lebong', 4),
(234, 'Lembata', 23),
(235, 'Lhokseumawe', 21),
(236, 'Lima Puluh Koto/Kota', 32),
(237, 'Lingga', 17),
(238, 'Lombok Barat', 22),
(239, 'Lombok Tengah', 22),
(240, 'Lombok Timur', 22),
(241, 'Lombok Utara', 22),
(242, 'Lubuk Linggau', 33),
(243, 'Lumajang', 11),
(244, 'Luwu', 28),
(245, 'Luwu Timur', 28),
(246, 'Luwu Utara', 28),
(247, 'Madiun', 11),
(248, 'Madiun', 11),
(249, 'Magelang', 10),
(250, 'Magelang', 10),
(251, 'Magetan', 11),
(252, 'Majalengka', 9),
(253, 'Majene', 27),
(254, 'Makassar', 28),
(255, 'Malang', 11),
(256, 'Malang', 11),
(257, 'Malinau', 16),
(258, 'Maluku Barat Daya', 19),
(259, 'Maluku Tengah', 19),
(260, 'Maluku Tenggara', 19),
(261, 'Maluku Tenggara Barat', 19),
(262, 'Mamasa', 27),
(263, 'Mamberamo Raya', 24),
(264, 'Mamberamo Tengah', 24),
(265, 'Mamuju', 27),
(266, 'Mamuju Utara', 27),
(267, 'Manado', 31),
(268, 'Mandailing Natal', 34),
(269, 'Manggarai', 23),
(270, 'Manggarai Barat', 23),
(271, 'Manggarai Timur', 23),
(272, 'Manokwari', 25),
(273, 'Manokwari Selatan', 25),
(274, 'Mappi', 24),
(275, 'Maros', 28),
(276, 'Mataram', 22),
(277, 'Maybrat', 25),
(278, 'Medan', 34),
(279, 'Melawi', 12),
(280, 'Merangin', 8),
(281, 'Merauke', 24),
(282, 'Mesuji', 18),
(283, 'Metro', 18),
(284, 'Mimika', 24),
(285, 'Minahasa', 31),
(286, 'Minahasa Selatan', 31),
(287, 'Minahasa Tenggara', 31),
(288, 'Minahasa Utara', 31),
(289, 'Mojokerto', 11),
(290, 'Mojokerto', 11),
(291, 'Morowali', 29),
(292, 'Muara Enim', 33),
(293, 'Muaro Jambi', 8),
(294, 'Muko Muko', 4),
(295, 'Muna', 30),
(296, 'Murung Raya', 14),
(297, 'Musi Banyuasin', 33),
(298, 'Musi Rawas', 33),
(299, 'Nabire', 24),
(300, 'Nagan Raya', 21),
(301, 'Nagekeo', 23),
(302, 'Natuna', 17),
(303, 'Nduga', 24),
(304, 'Ngada', 23),
(305, 'Nganjuk', 11),
(306, 'Ngawi', 11),
(307, 'Nias', 34),
(308, 'Nias Barat', 34),
(309, 'Nias Selatan', 34),
(310, 'Nias Utara', 34),
(311, 'Nunukan', 16),
(312, 'Ogan Ilir', 33),
(313, 'Ogan Komering Ilir', 33),
(314, 'Ogan Komering Ulu', 33),
(315, 'Ogan Komering Ulu Selatan', 33),
(316, 'Ogan Komering Ulu Timur', 33),
(317, 'Pacitan', 11),
(318, 'Padang', 32),
(319, 'Padang Lawas', 34),
(320, 'Padang Lawas Utara', 34),
(321, 'Padang Panjang', 32),
(322, 'Padang Pariaman', 32),
(323, 'Padang Sidempuan', 34),
(324, 'Pagar Alam', 33),
(325, 'Pakpak Bharat', 34),
(326, 'Palangka Raya', 14),
(327, 'Palembang', 33),
(328, 'Palopo', 28),
(329, 'Palu', 29),
(330, 'Pamekasan', 11),
(331, 'Pandeglang', 3),
(332, 'Pangandaran', 9),
(333, 'Pangkajene Kepulauan', 28),
(334, 'Pangkal Pinang', 2),
(335, 'Paniai', 24),
(336, 'Parepare', 28),
(337, 'Pariaman', 32),
(338, 'Parigi Moutong', 29),
(339, 'Pasaman', 32),
(340, 'Pasaman Barat', 32),
(341, 'Paser', 15),
(342, 'Pasuruan', 11),
(343, 'Pasuruan', 11),
(344, 'Pati', 10),
(345, 'Payakumbuh', 32),
(346, 'Pegunungan Arfak', 25),
(347, 'Pegunungan Bintang', 24),
(348, 'Pekalongan', 10),
(349, 'Pekalongan', 10),
(350, 'Pekanbaru', 26),
(351, 'Pelalawan', 26),
(352, 'Pemalang', 10),
(353, 'Pematang Siantar', 34),
(354, 'Penajam Paser Utara', 15),
(355, 'Pesawaran', 18),
(356, 'Pesisir Barat', 18),
(357, 'Pesisir Selatan', 32),
(358, 'Pidie', 21),
(359, 'Pidie Jaya', 21),
(360, 'Pinrang', 28),
(361, 'Pohuwato', 7),
(362, 'Polewali Mandar', 27),
(363, 'Ponorogo', 11),
(364, 'Pontianak', 12),
(365, 'Pontianak', 12),
(366, 'Poso', 29),
(367, 'Prabumulih', 33),
(368, 'Pringsewu', 18),
(369, 'Probolinggo', 11),
(370, 'Probolinggo', 11),
(371, 'Pulang Pisau', 14),
(372, 'Pulau Morotai', 20),
(373, 'Puncak', 24),
(374, 'Puncak Jaya', 24),
(375, 'Purbalingga', 10),
(376, 'Purwakarta', 9),
(377, 'Purworejo', 10),
(378, 'Raja Ampat', 25),
(379, 'Rejang Lebong', 4),
(380, 'Rembang', 10),
(381, 'Rokan Hilir', 26),
(382, 'Rokan Hulu', 26),
(383, 'Rote Ndao', 23),
(384, 'Sabang', 21),
(385, 'Sabu Raijua', 23),
(386, 'Salatiga', 10),
(387, 'Samarinda', 15),
(388, 'Sambas', 12),
(389, 'Samosir', 34),
(390, 'Sampang', 11),
(391, 'Sanggau', 12),
(392, 'Sarmi', 24),
(393, 'Sarolangun', 8),
(394, 'Sawah Lunto', 32),
(395, 'Sekadau', 12),
(396, 'Selayar (Kepulauan Selayar)', 28),
(397, 'Seluma', 4),
(398, 'Semarang', 10),
(399, 'Semarang', 10),
(400, 'Seram Bagian Barat', 19),
(401, 'Seram Bagian Timur', 19),
(402, 'Serang', 3),
(403, 'Serang', 3),
(404, 'Serdang Bedagai', 34),
(405, 'Seruyan', 14),
(406, 'Siak', 26),
(407, 'Sibolga', 34),
(408, 'Sidenreng Rappang/Rapang', 28),
(409, 'Sidoarjo', 11),
(410, 'Sigi', 29),
(411, 'Sijunjung (Sawah Lunto Sijunjung)', 32),
(412, 'Sikka', 23),
(413, 'Simalungun', 34),
(414, 'Simeulue', 21),
(415, 'Singkawang', 12),
(416, 'Sinjai', 28),
(417, 'Sintang', 12),
(418, 'Situbondo', 11),
(419, 'Sleman', 5),
(420, 'Solok', 32),
(421, 'Solok', 32),
(422, 'Solok Selatan', 32),
(423, 'Soppeng', 28),
(424, 'Sorong', 25),
(425, 'Sorong', 25),
(426, 'Sorong Selatan', 25),
(427, 'Sragen', 10),
(428, 'Subang', 9),
(429, 'Subulussalam', 21),
(430, 'Sukabumi', 9),
(431, 'Sukabumi', 9),
(432, 'Sukamara', 14),
(433, 'Sukoharjo', 10),
(434, 'Sumba Barat', 23),
(435, 'Sumba Barat Daya', 23),
(436, 'Sumba Tengah', 23),
(437, 'Sumba Timur', 23),
(438, 'Sumbawa', 22),
(439, 'Sumbawa Barat', 22),
(440, 'Sumedang', 9),
(441, 'Sumenep', 11),
(442, 'Sungaipenuh', 8),
(443, 'Supiori', 24),
(444, 'Surabaya', 11),
(445, 'Surakarta (Solo)', 10),
(446, 'Tabalong', 13),
(447, 'Tabanan', 1),
(448, 'Takalar', 28),
(449, 'Tambrauw', 25),
(450, 'Tana Tidung', 16),
(451, 'Tana Toraja', 28),
(452, 'Tanah Bumbu', 13),
(453, 'Tanah Datar', 32),
(454, 'Tanah Laut', 13),
(455, 'Tangerang', 3),
(456, 'Tangerang', 3),
(457, 'Tangerang Selatan', 3),
(458, 'Tanggamus', 18),
(459, 'Tanjung Balai', 34),
(460, 'Tanjung Jabung Barat', 8),
(461, 'Tanjung Jabung Timur', 8),
(462, 'Tanjung Pinang', 17),
(463, 'Tapanuli Selatan', 34),
(464, 'Tapanuli Tengah', 34),
(465, 'Tapanuli Utara', 34),
(466, 'Tapin', 13),
(467, 'Tarakan', 16),
(468, 'Tasikmalaya', 9),
(469, 'Tasikmalaya', 9),
(470, 'Tebing Tinggi', 34),
(471, 'Tebo', 8),
(472, 'Tegal', 10),
(473, 'Tegal', 10),
(474, 'Teluk Bintuni', 25),
(475, 'Teluk Wondama', 25),
(476, 'Temanggung', 10),
(477, 'Ternate', 20),
(478, 'Tidore Kepulauan', 20),
(479, 'Timor Tengah Selatan', 23),
(480, 'Timor Tengah Utara', 23),
(481, 'Toba Samosir', 34),
(482, 'Tojo Una-Una', 29),
(483, 'Toli-Toli', 29),
(484, 'Tolikara', 24),
(485, 'Tomohon', 31),
(486, 'Toraja Utara', 28),
(487, 'Trenggalek', 11),
(488, 'Tual', 19),
(489, 'Tuban', 11),
(490, 'Tulang Bawang', 18),
(491, 'Tulang Bawang Barat', 18),
(492, 'Tulungagung', 11),
(493, 'Wajo', 28),
(494, 'Wakatobi', 30),
(495, 'Waropen', 24),
(496, 'Way Kanan', 18),
(497, 'Wonogiri', 10),
(498, 'Wonosobo', 10),
(499, 'Yahukimo', 24),
(500, 'Yalimo', 24),
(501, 'Yogyakarta', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_provinsi_rajaongkir`
--

CREATE TABLE `tb_provinsi_rajaongkir` (
  `province_id` int(11) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_provinsi_rajaongkir`
--

INSERT INTO `tb_provinsi_rajaongkir` (`province_id`, `province`) VALUES
(1, 'Bali'),
(2, 'Bangka Belitung'),
(3, 'Banten'),
(4, 'Bengkulu'),
(5, 'DI Yogyakarta'),
(6, 'DKI Jakarta'),
(7, 'Gorontalo'),
(8, 'Jambi'),
(9, 'Jawa Barat'),
(10, 'Jawa Tengah'),
(11, 'Jawa Timur'),
(12, 'Kalimantan Barat'),
(13, 'Kalimantan Selatan'),
(14, 'Kalimantan Tengah'),
(15, 'Kalimantan Timur'),
(16, 'Kalimantan Utara'),
(17, 'Kepulauan Riau'),
(18, 'Lampung'),
(19, 'Maluku'),
(20, 'Maluku Utara'),
(21, 'Nanggroe Aceh Darussalam (NAD)'),
(22, 'Nusa Tenggara Barat (NTB)'),
(23, 'Nusa Tenggara Timur (NTT)'),
(24, 'Papua'),
(25, 'Papua Barat'),
(26, 'Riau'),
(27, 'Sulawesi Barat'),
(28, 'Sulawesi Selatan'),
(29, 'Sulawesi Tengah'),
(30, 'Sulawesi Tenggara'),
(31, 'Sulawesi Utara'),
(32, 'Sumatera Barat'),
(33, 'Sumatera Selatan'),
(34, 'Sumatera Utara');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `iduser` int(11) NOT NULL,
  `namauser` char(30) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `pasword` char(255) DEFAULT NULL,
  `fotouser` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`iduser`, `namauser`, `username`, `pasword`, `fotouser`) VALUES
(1, 'Pirdaus', 'admin', '12345', '2.jpg'),
(2, 'Adil Pratama', 'adil', 'adil', '1.svg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`idbarang`);

--
-- Indeks untuk tabel `tb_detail_jual`
--
ALTER TABLE `tb_detail_jual`
  ADD PRIMARY KEY (`id_jual_detai`);

--
-- Indeks untuk tabel `tb_jual`
--
ALTER TABLE `tb_jual`
  ADD PRIMARY KEY (`idtransaksi`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `idbarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `tb_detail_jual`
--
ALTER TABLE `tb_detail_jual`
  MODIFY `id_jual_detai` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_jual`
--
ALTER TABLE `tb_jual`
  MODIFY `idtransaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
