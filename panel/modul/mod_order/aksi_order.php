<?php
session_start();
if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{
include "../../../config/koneksi.php";

$module=$_GET[module];
$act=$_GET[act];

if ($module=='order' AND $act=='update'){
   // Update stok barang saat transaksi sukses (Lunas)
   if ($_POST[status_order]=='Lunas'){ 
    
      // Update untuk mengurangi stok 
      mysql_query("UPDATE produk,orders_detail SET produk.stok=produk.stok-orders_detail.jumlah WHERE produk.id_produk=orders_detail.id_produk and orders_detail.id_orders='$_POST[id]'");
	  
	  // Update untuk menambahkan produk yang dibeli (best seller = produk yang paling laris)
      mysql_query("UPDATE produk,orders_detail SET produk.dibeli=produk.dibeli+orders_detail.jumlah WHERE produk.id_produk=orders_detail.id_produk and orders_detail.id_orders='$_POST[id]'");

      // Update status order
      mysql_query("UPDATE orders SET status_order='$_POST[status_order]' where id_orders='$_POST[id]'");

      // Update status order
      mysql_query("UPDATE orders SET status_order='$_POST[status_order]' where id_orders='$_POST[id]'");

      header('location:../../media.php?module='.$module);
    }	  
	  elseif($_POST[status_order]=='Batal'){
	    // Update untuk menambah stok
	    mysql_query("UPDATE produk,orders_detail SET produk.stok=produk.stok+orders_detail.jumlah WHERE produk.id_produk=orders_detail.id_produk and orders_detail.id_orders='$_POST[id]'"); 
	    
	    // Update untuk menambahkan produk yang tidak jadi dibeli (tidak jd best seller)
      mysql_query("UPDATE produk,orders_detail SET produk.dibeli=produk.dibeli-orders_detail.jumlah WHERE produk.id_produk=orders_detail.id_produk and orders_detail.id_orders='$_POST[id]'");

	    // Update status order Batal
      mysql_query("UPDATE orders SET status_order='$_POST[status_order]' where id_orders='$_POST[id]'");

	    header('location:../../media.php?module='.$module);
	  }
    else{
      mysql_query("UPDATE orders SET status_order='$_POST[status_order]' where id_orders='$_POST[id]'");
      header('location:../../media.php?module='.$module);
    }
}
}
?>
