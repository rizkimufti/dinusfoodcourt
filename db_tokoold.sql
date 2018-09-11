-- phpMyAdmin SQL Dump
-- version 3.1.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 14, 2014 at 04:23 PM
-- Server version: 5.1.33
-- PHP Version: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_tokoeva`
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
  `blokir` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`username`)
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
  `id_hubungi` int(5) NOT NULL AUTO_INCREMENT,
  `id_kustomer` int(5) NOT NULL,
  `subjek` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `pesan` text COLLATE latin1_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id_hubungi`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=18 ;

--
-- Dumping data for table `hubungi`
--

INSERT INTO `hubungi` (`id_hubungi`, `id_kustomer`, `subjek`, `pesan`, `tanggal`) VALUES
(17, 3, 'komputer PC saya dirumah tidak bisa hidup', 'Terdapat kerusaakan komputer saya dirumah, tidak bisa masuk ke windows, dan hanya bisa loading', '2014-04-14');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `id_kategori` int(5) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(12, 'Printer'),
(5, 'Internet'),
(6, 'Laptop Seken'),
(7, 'Laptop Baru'),
(9, 'Flashdisk'),
(10, 'Mouse'),
(13, 'Komputer (PC)');

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE IF NOT EXISTS `kota` (
  `id_kota` int(3) NOT NULL AUTO_INCREMENT,
  `nama_kota` varchar(100) NOT NULL,
  `ongkos_kirim` int(10) NOT NULL,
  PRIMARY KEY (`id_kota`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`id_kota`, `nama_kota`, `ongkos_kirim`) VALUES
(1, 'Jakarta', 13000),
(2, 'Bandung', 13500),
(3, 'Semarang', 10000),
(4, 'Medan', 20000),
(5, 'Aceh', 25000),
(6, 'Banjarmasin', 17500),
(7, 'Balikpapan', 18500),
(8, 'Samarinda', 19500),
(9, 'Lainnya', 10000),
(10, 'Palembang', 23000),
(11, 'Surabaya', 13000);

-- --------------------------------------------------------

--
-- Table structure for table `kustomer`
--

CREATE TABLE IF NOT EXISTS `kustomer` (
  `id_kustomer` int(5) NOT NULL AUTO_INCREMENT,
  `password` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `alamat` text COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `telpon` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `id_kota` int(5) NOT NULL,
  PRIMARY KEY (`id_kustomer`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `kustomer`
--

INSERT INTO `kustomer` (`id_kustomer`, `password`, `nama_lengkap`, `alamat`, `email`, `telpon`, `id_kota`) VALUES
(1, 'e10adc3949ba59abbe56e057f20f883e', 'Lukmanul Hakim', 'Jl. Prof. Dr. Soepomo No. 178, Tebet, Jakarta Timur 17280', 'algosigma@gmail.com', '081804396000', 1),
(2, 'cec1de94b66011a1cfed0a45f8ba8e16', 'budiono', 'Jl. Dipenogoro', 'budiono_114@yahoo.com', '083242233323', 5),
(3, '4b0cf71ac4f5267ae87e1092e98395ba', 'budionokompas1', 'Jl. Dorak, Selatpanjang1', 'budiono.115@gmail.com', '081275371724', 3),
(4, '4b0cf71ac4f5267ae87e1092e98395ba', 'budionokompas', 'tes', 'budiono.114@gmail.com', '081275371724', 5);

-- --------------------------------------------------------

--
-- Table structure for table `modul`
--

CREATE TABLE IF NOT EXISTS `modul` (
  `id_modul` int(5) NOT NULL AUTO_INCREMENT,
  `static_content` text COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_modul`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=58 ;

--
-- Dumping data for table `modul`
--

INSERT INTO `modul` (`id_modul`, `static_content`, `gambar`) VALUES
(1, '<p>\r\n<font color="#FF0000">Toko Wincom , Menjual Bermacam-Macam Komputer, Mulai dari , Laptop,Pc,Flashdisk, dan lain-lain\r\n</font>\r\n</p>\r\n<font color="#FF0000">\r\n</font>\r\n<p>\r\n<font color="#FF0000">\r\nKami Juga menerima service komputer,Printer yang pemesananya secara online \r\n</font>\r\n</p>\r\n<p>\r\n<font color="#FF0000">Alamat Toko :</font>\r\n</p>\r\n<p>\r\n<font color="#FF0000">Jl. Ahmad Yani, No.12</font>\r\n</p>\r\n<p>\r\n<font color="#FF0000">Selatpanjang, Kab.Kepulauan Meranti-Riau1</font>\r\n</p>\r\n', 'logo.jpg'),
(2, 'tesrt\r\n', ''),
(3, '<p>\r\nPembayaran dilakukan Melalui Rekening Toko Kami di bawah ini :\r\n</p>\r\n<p>\r\n<strong>BRI :1909.8099.00.11</strong>\r\n</p>\r\n<p>\r\nA/n &nbsp; : Acuan \r\n</p>\r\n<p>\r\n<strong>Mandiri : 503.0292.22</strong>\r\n</p>\r\n<p>\r\nA/n : Acuan\r\n</p>\r\n<p>\r\n<strong>BNI :&nbsp; 09.8099.00.</strong>\r\n</p>\r\n<p>\r\nA/n : Acuan\r\n</p>\r\n<p>\r\n&nbsp;\r\n</p>\r\n<p>\r\n&nbsp;\r\n</p>\r\n<p>\r\n&nbsp;\r\n</p>\r\n<p>\r\n&nbsp;\r\n</p>\r\n<p>\r\n&nbsp;\r\n</p>\r\n<p>\r\n&nbsp;\r\n</p>\r\n', '');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id_orders` int(5) NOT NULL AUTO_INCREMENT,
  `status_order` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT 'Baru',
  `tgl_order` date NOT NULL,
  `jam_order` time NOT NULL,
  `id_kustomer` int(5) NOT NULL,
  PRIMARY KEY (`id_orders`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=26 ;

--
-- Dumping data for table `orders`
--


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


-- --------------------------------------------------------

--
-- Table structure for table `orders_temp`
--

CREATE TABLE IF NOT EXISTS `orders_temp` (
  `id_orders_temp` int(5) NOT NULL AUTO_INCREMENT,
  `id_produk` int(5) NOT NULL,
  `id_session` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `jumlah` int(5) NOT NULL,
  `tgl_order_temp` date NOT NULL,
  `jam_order_temp` time NOT NULL,
  `stok_temp` int(5) NOT NULL,
  PRIMARY KEY (`id_orders_temp`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=181 ;

--
-- Dumping data for table `orders_temp`
--


-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
  `id_produk` int(5) NOT NULL AUTO_INCREMENT,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `deskripsi` text COLLATE latin1_general_ci NOT NULL,
  `harga` int(20) NOT NULL,
  `stok` int(5) NOT NULL,
  `berat` decimal(5,2) unsigned NOT NULL DEFAULT '0.00',
  `tgl_masuk` date NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `dibeli` int(5) NOT NULL DEFAULT '1',
  `diskon` int(5) NOT NULL,
  PRIMARY KEY (`id_produk`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=34 ;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `deskripsi`, `harga`, `stok`, `berat`, `tgl_masuk`, `gambar`, `dibeli`, `diskon`) VALUES
(27, 7, 'Asus A450CA-WX103D - 14" - Merah', '<p>\r\n<strong>Spesifikasi : \r\n</strong>\r\n</p>\r\n<p>\r\nSKU 	\r\nAS100ELACFEAANID-131894\r\nModel 	A450CA-WX103D\r\nUkuran (L x W x H cm) 	34.8 x 24.1 x 2.48 cm\r\nBerat (kg) 	2.4\r\nWarna 	Merah\r\nUkuran Layar (in) 	14.0\r\nHard Disk 	500\r\nRAM 	2\r\nFitur 	Bluetooth|Wi-Fi|DVD\r\nGaransi produk 	1 Tahun Garansi Spare-Part &amp; Servis\r\nKoneksi Nirkabel 	Bluetooth|WiFi\r\n</p>\r\n<p>\r\n<strong>Ulasan :&nbsp;\r\n</strong>\r\n</p>\r\n<p>\r\nDidesain dengan konsep untuk membuat laptop lebih personal, Asus \r\nA450CA-WX103D - 14&quot; - Biru hadir dengan layar sebesar 14&quot;. Ukurannya \r\nyang kompak membuat notebook ini menjadi lebih ringan dengan bobot 2.4 \r\nkg. Tampil dengan desain yang modern serta dinamis, laptop ini sangat \r\ncocok untuk menemani kegiatan Anda bersama pekerjaan sehari-hari. \r\n</p>\r\n<div class="prd-package-content rfloat box">\r\n<h3 class="txtLight">Apa yang ada di dalam kotak:</h3>\r\n<ul class="ui-listBulleted">\r\n	<li><span>Asus A450CA-WX103D - 14&quot; - Merah</span></li>\r\n	<li><span>Charger</span></li>\r\n	<li><span>Driver</span></li>\r\n	<li><span>Manual Book</span></li>\r\n	<li><span>Kartu Garansi</span></li>\r\n	<li><span>Tas Laptop</span></li>\r\n</ul>\r\n</div>\r\n<p>\r\n&nbsp;\r\n</p>\r\n', 4199000, 14, 2.40, '2014-04-14', '56asus.jpg', 1, 10),
(28, 7, 'HP Pavillion 1000 - 1432TU - Hitam', '<p>\r\nHP Pavillion 1000 -1432TU merupakan laptop performa tinggi dengan harga \r\nyang terjangkau. Dirancang khusus memenuhi tuntutan komputasi Anda. \r\nDibekali dengan prosesor Intel Celeron Dual Core berkecepatan 1.8 GHz, 2\r\nGB RAM serta 320 GB HDD, Anda dapat dengan mudah melakukan multitasking\r\ndimana saja. Dengan desainnya yang ramping dan ringan, notebook dengan \r\nukuran 14&quot; ini dirancang bagi Anda yang membutuhkan kemudahan \r\nportabilitas tanpa mengorbankan pengalaman komputasi yang optimal.\r\n</p>\r\n<p>\r\n<strong>Spesifikasi</strong> : SKU 	\r\nHP467ELACITLANID-137484\r\nModel 	Pavillion 1000 - 1432TU\r\nUkuran (L x W x H cm) 	15 x 50 x 37\r\nBerat (kg) 	2.2 kg\r\nWarna 	Hitam\r\nGaransi produk 	1 Tahun Garansi Resmi HP\r\n</p>\r\n', 3799000, 50, 2.20, '2014-04-14', '67hp-0945-507711-2-zoom.jpg', 1, 8),
(29, 7, 'ASUS X200CA-KX184D DOS Putih - 11.6" - 500 GB', '<p>\r\nASUS X200CA-KX184D hadir dengan desain yang kompak dan dikemas dengan \r\nlayar berukuran 11.6&quot;. Dengan bobot dibawah 3 kg, Asus menyertakan \r\nberbagai teknologi yang hanya terdapat pada produknya seperti \r\nSonicMaster, Instan On, juga Ice Cool.<br />\r\n<br />\r\n<strong>Kinerja Optimal</strong><br />\r\nLaptop ini didukung dengan prosesor Dual Core 1007 berkecepatan 1.5 \r\nGHz, memori 2 GB RAM akan memberikan kemudahan bagi Anda dalam \r\nmengerjakan pekerjaan yang multitasking. Untuk grafisnya dibekali dengan\r\nIntel HD Graphics 4000. Dengan kapasitas memori penyimpanan 500 GB, \r\nAnda memiliki ruang penyimpanan yang cukup besar untuk menyimpan \r\nberbagai data berharga Anda.\r\n</p>\r\n<p>\r\n<strong>&nbsp;Spesifikasi :</strong>\r\n</p>\r\nSKU 	\r\nAS100ELABQVKANID-91057\r\nUkuran (L x W x H cm) 	1x1x1\r\nBerat (kg) 	-\r\nWarna 	Putih\r\nUkuran Layar (in) 	11.6\r\nKecepatan CPU 	1.50\r\nSistem Operasi 	Free DOS \r\nFitur Tampilan 	HD\r\nFitur 	Dual Core\r\nGaransi produk 	2 Tahun Garansi Global\r\nInput 	USB|LAN\r\nKoneksi Nirkabel 	WiFi\r\nKamera 	Ya\r\nBuilt in Memory 	2GB\r\nKapasitas Penyimpanan 	500GB\r\nTipe Processor 	Dual Core 1007\r\n', 3379000, 8, 2.00, '2014-04-14', '64asus-9605-88418-1-.jpg', 1, 0),
(30, 12, 'Epson L210 - All In One', 'Sistem tinta Epson L210 akan memberikan Anda performa yang lebih baik dengan biaya yang sangat rendah.<br />\r\n<div id="prd-detail-page">\r\n<div>\r\n<div id="prodinfo" class="l-main prd-detail-wrapper">\r\n<div class="prd-description">\r\n<p style="text-align: justify">\r\n&nbsp;\r\n</p>\r\n<p style="text-align: justify">\r\n<strong>Desain Minimalis</strong><br />\r\nPrinter Epson L210 memiliki desain yang kompak untuk kemudahan dalam \r\npenempatannya, membutuhkan sedikit ruang jika dibanding dengan printer \r\nlain, sehingga Anda bisa dengan mudah menempatkannya dimana saja.<br />\r\n&nbsp;\r\n</p>\r\n<p>\r\n<img style="width: 420px; height: 257px; display: inline" class="productlazyimage" src="https://lh6.googleusercontent.com/-RFz10r4mtbg/UhbV0ZKVZEI/AAAAAAAAETY/syfejVnThHw/w420-h257-no/Epson+L210+%25281%2529.png" alt="" />\r\n</p>\r\n<p style="text-align: justify">\r\n<br />\r\n<strong>Hemat Tinta</strong><br />\r\nDengan menggunakan tinta asli dari Epson, Anda bisa melakukan \r\npenghematan hingga 4.000 halaman (tinta hitam) dengan biaya yang sangat \r\nmurah. Selain itu juga printer ini memiliki sistem pengisian tinta yang \r\nsangat mudah dilakukan.\r\n</p>\r\n</div>\r\n</div>\r\n<div class="l-main prd-detail-wrapper">\r\n<div id="productDetails" class="prd-descriptionWrapper" style="display: block">\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<p>\r\n&nbsp;\r\n</p>\r\n', 2100000, 4, 4.40, '2014-04-14', '76Epson L210 (32).jpg', 1, 10),
(31, 12, 'Canon Pixma iP2770', '<p>\r\n<strong>Spesifikasi Canon Pixma iP2770 - Inkjet - Hitam</strong>\r\n</p>\r\n<p>\r\nSKU 	\r\nCA189EL61JZEALID-6738\r\nModel 	Printer Inkjet\r\nUkuran (L x W x H cm) 	44.5 x 25 x 13 cm\r\nBerat (kg) 	1\r\nWarna 	Hitam\r\nTipe 	Canon Pixma iP2770\r\nGaransi produk 	1 Tahun Garansi (Spare-part dan Servis)\r\nInput 	USB\r\nKonsumsi Daya 	11 W\r\nMetode Cetak 	Inkjet\r\nResolusi Cetak Maksimum (warna) 	4800 x 1200 dpi\r\nResolusi Cetak Maksimum (monokrom) 	4800 x 1200 dpi\r\nKecepatan Cetak (warna) 	4.8 ipm\r\nKecepatan Cetak (monokrom) 	7 ipm\r\nTipe Media 	A4, Letter, Legal, A5, B5, Envelope\r\nKapasitas Tray 	100 Lembar\r\n</p>\r\n<p style="text-align: justify">\r\nCanon Pixma iP2770 dapat mampu mencetak dengan kecepatan hingga 4,8 ipm,\r\nuntuk tinta warna dan 7.0 ipm untuk tinta hitam. Produk tersebut juga \r\ndilengkapi fitur Auto Photo Fix II pada printer yang dapat diakses \r\nmelalui software EX-Cetak EasyPhoto, untuk dapat mengkoreksi gambar \r\nsehingga Anda dapat mendapatkan kualitas gambar terbaik dan dengan \r\nmaksimal resolusi sebesar 4800x1200 dpi.<br />\r\n&nbsp;\r\n</p>\r\n<p>\r\n<img style="display: inline" class="productlazyimage" src="https://lh5.googleusercontent.com/-qQbdQh34AqU/Uh7NNppvf9I/AAAAAAAAEhU/oa1Kp892TIY/w958-h574-no/Canon%252BPIXMA%252BiP36801.jpg" alt="" width="313" height="145" />\r\n</p>\r\n<p style="text-align: justify">\r\n<br />\r\n<strong>Teknologi FINE&trade; print head</strong><br />\r\nSesuatu yang unik dalam dunia percetakan, teknologi FINE&trade; print head \r\nmilik Canon memungkinkan photolab untuk menghasilkan kualitas dengan \r\ndetail yang jelas tanpa mengorbankan kecepatan. Tetesan ejeksi yang \r\nstabil, kualitas luar biasa dan daya tahan yang lama telah dicapai untuk\r\nmenghasilkan gambar dengan kualitas tertinggi.\r\n</p>\r\n<p style="text-align: justify">\r\n&nbsp;\r\n</p>\r\n<p style="text-align: justify">\r\n<strong><img style="float: left; margin: 5px 10px; display: block" class="productlazyimage" src="https://lh6.googleusercontent.com/-UdjQ9Toorrw/UdY3k-8JofI/AAAAAAAAC5Q/K0xV_LW_P6Y/w209-h100-no/pixma-usb2highspeed.jpg" alt="" width="265" height="126" />Mencetak A4 Tanpa Batas</strong><br />\r\nMencetak foto yang indah dan gambar hingga ukuran A4 dengan fungsi \r\npencetakan tanpa batas - memudahkan Anda membuat album foto profesional,\r\nmenu gambar, presentasi bisnis dan banyak lagi.\r\n</p>\r\n<p style="text-align: justify">\r\n<br />\r\n<strong>USB 2.0</strong><br />\r\nDengan koneksi built-in USB 2.0 berkecepatan tinggi, Anda dapat dengan \r\nmudah dan transfer dengan kecepatan penuh antara perangkat dan printer \r\nPIXMA tanpa jeda waktu atau keterlambatan. Anda cukup memasukkan kabel \r\nuntuk printer dan secara langsung akan melakukan setting.\r\n</p>\r\n<p>\r\n&nbsp;\r\n</p>\r\n', 627000, 5, 1.00, '2014-04-14', '17canon-4163-8376-2-zoom.jpg', 1, 17),
(32, 13, 'Lenovo M70e (Tower) DOS + LCD - 18.5"', '<p>\r\nLenovo menghadirkan PC Lenovo M70e (Tower) untuk memenuhi kebutuhan \r\npersonal komputer yang akan membantu Anda dalam kegiatan komputasi \r\nsehari-hari baik di rumah maupun di kantor. Dilengkapi dengan layar 18.5\r\nkeyboard dan mouse, personal komputer ini dapat menjadi pilihan bagi \r\nyang mencari PC dengan kinerja optimal dan handal.<br />\r\n<br />\r\n<strong>Kinerja Optimal</strong><br />\r\nAnda dapat dengan mudah melakukan banyak tugas tanpa masalah karena PC \r\nLenovo M70e (Tower) menawarkan Processor Dual Core E5800 3.2Ghz 2MB L2 \r\nCache 800Mhz, Memory 2GB DDR3, Chipset G41, Hard Disk 500GB, DVDRW, \r\nIntegrated Video GMA 4500, Gigabit Ethernet, Keyboard Scroll Lock, \r\nMouse,&nbsp; LCD 18.5&quot;, dan dilengkapi pula dengan DOS<br />\r\n<br />\r\n<strong>Konektivitas</strong><br />\r\nTerdapat berbagai pilihan konektivitas dalam laptop ini antara lain port\r\nUSB 2.0 dan Bluetooth. Anda juga dapat menemukan 6-in-1 Card Reader \r\nuntuk membaca berbagai macam kartu memori milik Anda. Untuk keperluan \r\njaringan, laptop ini dilengkapi dengan Ethernet LAN dan Wireless LAN \r\nyang memungkinkan Anda untuk berbagi data dengan kecepatan tinggi dan \r\nterhubung ke internet.\r\n</p>\r\n<p>\r\n&nbsp;\r\n</p>\r\n<p>\r\n<strong>Spesifikasi Lengkap :</strong>\r\n</p>\r\n<p>\r\n&nbsp;\r\n</p>\r\n<p>\r\nSKU 	\r\nLE629ELABPDSANID-87405\r\nUkuran (L x W x H cm) 	107.1 x.40.6 x 98.5 cm\r\nBerat (kg) 	12\r\nWarna 	Hitam\r\nTipe 	Lenovo M70e\r\nUkuran Layar (in) 	18.5\r\nHard Disk 	500\r\nRAM 	2\r\nKapasitas Penyimpanan 	500\r\nMemori Grafis 	2\r\nKecepatan CPU 	3.20\r\nSistem Operasi 	Free DOS \r\nGaransi produk 	3 Tahun Garansi (Spare-part dan Servis)\r\nInput 	USB|Card Reader|LAN\r\nOutput 	3.5mm jack|USB\r\nKoneksi Nirkabel 	Bluetooth|WiFi\r\nTipe Memori 	DDR3\r\nBuilt in Memory 	2 GB RAM\r\nTipe Layar 	LCD\r\nKapasitas Penyimpanan 	500 GB\r\nKecepatan Processor 	3.2 GHz\r\nTipe Processor 	Processor Dual Core E5800\r\n</p>\r\n', 5150000, 14, 12.00, '2014-04-14', '15lenovo-9079-25597-1-zoom.jpg', 2, 20);
