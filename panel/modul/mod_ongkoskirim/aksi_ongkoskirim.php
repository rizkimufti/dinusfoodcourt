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

// Hapus Ongkos Kirim
if ($module=='ongkoskirim' AND $act=='hapus'){
  mysql_query("DELETE FROM kota WHERE id_kota='$_GET[id]'");
  header('location:../../media.php?module='.$module);
}

// Input Ongkos Kirim
elseif ($module=='ongkoskirim' AND $act=='input'){
  mysql_query("INSERT INTO kota(nama_kota,ongkos_kirim) VALUES('$_POST[nama_kota]','$_POST[ongkos_kirim]')");
  header('location:../../media.php?module='.$module);
}

// Update Ongkos Kirim
elseif ($module=='ongkoskirim' AND $act=='update'){
  mysql_query("UPDATE kota SET nama_kota = '$_POST[nama_kota]', ongkos_kirim='$_POST[ongkos_kirim]' WHERE id_kota = '$_POST[id]'");
  header('location:../../media.php?module='.$module);
}
}
?>
