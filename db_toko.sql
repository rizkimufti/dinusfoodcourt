-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2018 at 08:23 PM
-- Server version: 5.5.39
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_toko`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `no_telp` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `level` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT 'user',
  `blokir` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`username`, `password`, `nama_lengkap`, `email`, `no_telp`, `level`, `blokir`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 'redaksi@bukulokomedia.com', '08238923848', 'admin', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `hubungi`
--

CREATE TABLE IF NOT EXISTS `hubungi` (
`id_hubungi` int(5) NOT NULL,
  `id_kustomer` int(5) NOT NULL,
  `subjek` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `pesan` text COLLATE latin1_general_ci NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
`id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(12, 'Minuman'),
(13, 'Makanan');

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE IF NOT EXISTS `kota` (
`id_kota` int(3) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `ongkos_kirim` int(10) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`id_kota`, `nama_kota`, `ongkos_kirim`) VALUES
(11, 'Surabaya', 13000);

-- --------------------------------------------------------

--
-- Table structure for table `kustomer`
--

CREATE TABLE IF NOT EXISTS `kustomer` (
`id_kustomer` int(5) NOT NULL,
  `password` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `alamat` text COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `telpon` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `id_kota` int(5) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `kustomer`
--

INSERT INTO `kustomer` (`id_kustomer`, `password`, `nama_lengkap`, `alamat`, `email`, `telpon`, `id_kota`) VALUES
(1, 'e10adc3949ba59abbe56e057f20f883e', 'Lukmanul Hakim', 'Jl. Prof. Dr. Soepomo No. 178, Tebet, Jakarta Timur 17280', 'algosigma@gmail.com', '081804396000', 1),
(2, 'cec1de94b66011a1cfed0a45f8ba8e16', 'budiono', 'Jl. Dipenogoro', 'budiono_114@yahoo.com', '083242233323', 5),
(3, '4b0cf71ac4f5267ae87e1092e98395ba', 'budionokompas1', 'Jl. Dorak, Selatpanjang1', 'budiono.115@gmail.com', '081275371724', 3),
(4, '4b0cf71ac4f5267ae87e1092e98395ba', 'budionokompas', 'tes', 'budiono.114@gmail.com', '081275371724', 5),
(8, '21232f297a57a5a743894a0e4a801fc3', 'rizki', 'local', 'admin@gmail.com', '291299121', 7),
(9, '21232f297a57a5a743894a0e4a801fc3', 'mufti', '', 'mufti@gmail.com', '09493', 0);

-- --------------------------------------------------------

--
-- Table structure for table `modul`
--

CREATE TABLE IF NOT EXISTS `modul` (
`id_modul` int(5) NOT NULL,
  `static_content` text COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=58 ;

--
-- Dumping data for table `modul`
--

INSERT INTO `modul` (`id_modul`, `static_content`, `gambar`) VALUES
(1, '<p>\r\n<font color="#ff0000">tulis</font>\r\n</p>\r\n', 'dinus.png'),
(2, 'tesrt\r\n', ''),
(3, '<p>\r\nPembayaran dilakukan langsung melalui kasir Dinus Food Court\r\n</p>\r\n', '');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
`id_orders` int(5) NOT NULL,
  `status_order` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT 'Baru',
  `tgl_order` date NOT NULL,
  `jam_order` time NOT NULL,
  `id_kustomer` int(5) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=53 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id_orders`, `status_order`, `tgl_order`, `jam_order`, `id_kustomer`) VALUES
(26, 'Lunas', '2018-06-06', '18:38:40', 8),
(27, 'Baru', '2018-06-06', '18:40:11', 8),
(28, 'Baru', '2018-06-06', '19:20:11', 8),
(29, 'Baru', '2018-06-06', '19:21:08', 8),
(30, 'Baru', '2018-06-06', '19:23:04', 8),
(31, 'Baru', '2018-06-06', '19:26:56', 0),
(32, 'Baru', '2018-06-06', '19:27:06', 0),
(33, 'Baru', '2018-06-06', '19:27:32', 8),
(34, 'Baru', '2018-06-06', '19:27:41', 8),
(35, 'Baru', '2018-06-06', '19:27:52', 8),
(36, 'Baru', '2018-06-06', '19:28:09', 8),
(37, 'Baru', '2018-06-06', '19:28:20', 8),
(38, 'Baru', '2018-06-06', '19:28:35', 8),
(39, 'Baru', '2018-06-06', '19:29:47', 8),
(40, 'Baru', '2018-06-06', '19:29:57', 8),
(41, 'Baru', '2018-06-06', '19:31:34', 8),
(42, 'Baru', '2018-06-06', '19:32:06', 8),
(43, 'Baru', '2018-06-06', '19:32:06', 8),
(44, 'Baru', '2018-06-06', '19:32:13', 8),
(45, 'Baru', '2018-06-06', '19:32:39', 8),
(46, 'Baru', '2018-06-06', '19:33:17', 8),
(47, 'Baru', '2018-06-06', '19:33:36', 8),
(48, 'Baru', '2018-06-06', '19:34:00', 8),
(49, 'Lunas', '2018-06-06', '19:34:20', 8),
(50, 'Baru', '2018-06-06', '20:20:13', 9),
(51, 'Baru', '2018-06-06', '20:20:42', 9),
(52, 'Baru', '2018-06-06', '20:20:55', 9);

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE IF NOT EXISTS `orders_detail` (
  `id_orders` int(5) NOT NULL,
  `id_produk` int(5) NOT NULL,
  `jumlah` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders_detail`
--

INSERT INTO `orders_detail` (`id_orders`, `id_produk`, `jumlah`) VALUES
(26, 32, 1),
(28, 42, 1),
(30, 42, 1),
(33, 42, 1),
(40, 42, 1),
(49, 42, 1),
(50, 44, 1),
(50, 42, 1),
(50, 36, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_temp`
--

CREATE TABLE IF NOT EXISTS `orders_temp` (
`id_orders_temp` int(5) NOT NULL,
  `id_produk` int(5) NOT NULL,
  `id_session` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `jumlah` int(5) NOT NULL,
  `tgl_order_temp` date NOT NULL,
  `jam_order_temp` time NOT NULL,
  `stok_temp` int(5) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=191 ;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
`id_produk` int(5) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `deskripsi` text COLLATE latin1_general_ci NOT NULL,
  `harga` int(20) NOT NULL,
  `stok` int(5) NOT NULL,
  `berat` decimal(5,2) unsigned NOT NULL DEFAULT '0.00',
  `tgl_masuk` date NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `dibeli` int(5) NOT NULL DEFAULT '1',
  `diskon` int(5) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=46 ;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `deskripsi`, `harga`, `stok`, `berat`, `tgl_masuk`, `gambar`, `dibeli`, `diskon`) VALUES
(35, 13, 'Ayam Geprek', '', 10000, 40, '0.00', '2018-06-06', '74240-ayam_geprek_yang_sedang_kekinian_dokresepku-718x452.jpg', 1, 0),
(36, 13, 'Nasi Pecel', '', 8000, 40, '0.00', '2018-06-06', '36pecel.jpeg', 1, 0),
(37, 13, 'Nasi Goreng', '', 13000, 40, '0.00', '2018-06-06', '16nasgor.jpg', 1, 0),
(38, 13, 'Bubur Ayam', '', 8000, 40, '0.00', '2018-06-06', '18bubur.jpg', 1, 0),
(39, 13, 'Soto Ayam', '', 8000, 40, '0.00', '2018-06-06', '15soto.jpg', 1, 0),
(40, 12, 'Es Teh Manis', '', 2500, 40, '0.00', '2018-06-06', '15esteh.jpg', 1, 0),
(41, 12, 'Es Kopi', '', 3000, 40, '0.00', '2018-06-06', '92kopi.jpg', 1, 0),
(42, 12, 'Es Milo', '', 4000, 39, '0.00', '2018-06-06', '80lo.jpg', 2, 0),
(43, 12, 'Teh Botol Sosro', '', 5000, 100, '0.00', '2018-06-06', '1tehboto.jpg', 1, 0),
(44, 12, 'Coca Cola', '', 4000, 50, '0.00', '2018-06-06', '66cocacola.jpg', 1, 0),
(45, 12, 'Aqua Botol', '', 3000, 100, '0.00', '2018-06-06', '2aqua.jpg', 1, 0),
(34, 13, 'Ayam Penyet', '', 10000, 10, '0.00', '2018-06-06', '96Ayam_penyet.JPG', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
 ADD PRIMARY KEY (`username`);

--
-- Indexes for table `hubungi`
--
ALTER TABLE `hubungi`
 ADD PRIMARY KEY (`id_hubungi`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
 ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
 ADD PRIMARY KEY (`id_kota`);

--
-- Indexes for table `kustomer`
--
ALTER TABLE `kustomer`
 ADD PRIMARY KEY (`id_kustomer`);

--
-- Indexes for table `modul`
--
ALTER TABLE `modul`
 ADD PRIMARY KEY (`id_modul`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`id_orders`);

--
-- Indexes for table `orders_temp`
--
ALTER TABLE `orders_temp`
 ADD PRIMARY KEY (`id_orders_temp`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
 ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hubungi`
--
ALTER TABLE `hubungi`
MODIFY `id_hubungi` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
MODIFY `id_kota` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `kustomer`
--
ALTER TABLE `kustomer`
MODIFY `id_kustomer` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `modul`
--
ALTER TABLE `modul`
MODIFY `id_modul` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `id_orders` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `orders_temp`
--
ALTER TABLE `orders_temp`
MODIFY `id_orders_temp` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=191;
--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
MODIFY `id_produk` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
