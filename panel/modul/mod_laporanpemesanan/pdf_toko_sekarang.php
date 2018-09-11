<?php
session_start();
if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{
error_reporting(0);

include "class.ezpdf.php";
include "../../../config/koneksi.php";
include "../../../config/fungsi_indotgl.php";
include "rupiah.php";
  
$pdf = new Cezpdf();
 
// Set margin dan font
$pdf->ezSetCmMargins(3, 3, 3, 3);
$pdf->selectFont('fonts/Courier.afm');

$all = $pdf->openObject();

// Tampilkan logo
$pdf->setStrokeColor(0, 0, 0, 1);
$pdf->addJpegFromFile('logo.jpg',20,800,69);

// Teks di tengah atas untuk judul header
$pdf->addText(190, 820, 16,'<b>Laporan Pemesanan Barang</b>');
$pdf->addText(200, 800, 18,'<b>Toko Komputer Wincom</b>');

// Garis atas untuk header
$pdf->line(10, 795, 578, 795);

// Garis bawah untuk footer
$pdf->line(10, 50, 578, 50);

// Teks kiri bawah
$pdf->addText(30,34,8,'Dicetak tgl:' . date( 'd-m-Y, H:i:s'));

$pdf->closeObject();

// Tampilkan object di semua halaman
$pdf->addObject($all, 'all');

$sekarang=date('Y-m-d');

// Query untuk merelasikan kedua tabel di filter berdasarkan tanggal
$sql = mysql_query("SELECT * FROM hubungi WHERE status='Lunas'");
$jml = mysql_num_rows($sql);

if ($jml > 0){
$i = 1;

while($r = mysql_fetch_array($sql)){
  $quantityharga=rp($r[jumlah]*$r[harga]);
  $hargarp=rp($r[harga]); 
  $faktur=$r[faktur];
  $tanggal=tgl_indo($r[tanggal]);
  
  $data[$i]=array('<b>No</b>'=>$i, 
                  '<b>No Pemesanan</b>'=>$r[id_hubungi], 
				  '<b>Tanggal</b>'=>$tanggal,
                  '<b>Nama Barang</b>'=>$r[subjek], 
                  '<b>Harga</b>'=>$hargarp);

			  
   $total = $total+$r[harga];
	$totqu = $totqu + $r[jumlah];
  $i++;
}

$pdf->ezTable($data, '', '', '');

$tot=rp($total);
$pdf->ezText("\n\nTotal keseluruhan : Rp.{$tot}");
$pdf->ezText("\nJumlah yang terjual : {$jml} unit");

// Penomoran halaman
$pdf->ezStartPageNumbers(320, 15, 8);
$pdf->ezStream();
}
else{
  $skrg=date('d-M-Y');
  echo "Tidak ada transaksi/order pada Tanggal <b>$skrg</b><br /><br />
       <input type=button value=Kembali onclick=self.history.back()>";
}
}
?>