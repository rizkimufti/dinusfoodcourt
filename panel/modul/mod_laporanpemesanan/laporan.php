<?php
session_start();
 if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{
   echo "<h2>Laporan Pemesanan Barang</h2>
          <input type=button value='Klik Disini Untuk Mencetak Pemesanan' 
          onclick=\"window.location.href='modul/mod_laporanpemesanan/pdf_toko_sekarang.php';\">";
		 
}
?>



