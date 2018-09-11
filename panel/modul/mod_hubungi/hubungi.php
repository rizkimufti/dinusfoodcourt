<?php
$aksi="modul/mod_hubungi/aksi_hubungi.php";
switch($_GET[act]){
  // Tampil Hubungi Kami
  default:
    echo "<h2>Pemesanan Barang</h2>
          <table>
          <tr><th>no</th><th>nama</th><th>email</th><th>subjek</th><th>tanggal</th><th>Status</th><th>Harga</th><th>aksi</th></tr>";


    $tampil=mysql_query("SELECT * FROM hubungi,kustomer WHERE hubungi.id_kustomer=kustomer.id_kustomer ORDER BY id_hubungi DESC LIMIT 6");

    $no = $posisi+1;
    while ($r=mysql_fetch_array($tampil)){
      $tgl=tgl_indo($r[tanggal]);
      echo "<tr><td>$no</td>
                <td>$r[nama_lengkap]</td>
                <td>$r[telpon]</td>
                <td>$r[subjek]</td>
                <td>$tgl</a></td>
				<td>$r[status]</td>
				<td>$r[harga]</td>
                <td><a href=$aksi?module=hubungi&act=hapus&id=$r[id_hubungi]>Hapus</a> | <a href=?module=hubungi&act=view&id=$r[id_hubungi]>View</a>
                </td></tr>";
    $no++;
    }
    echo "</table>";
    break;
	
	case "view":
	 $edit=mysql_query("SELECT * FROM hubungi,kustomer WHERE hubungi.id_kustomer=kustomer.id_kustomer AND hubungi.id_hubungi='$_GET[id]'");
    $r    = mysql_fetch_array($edit);
    $tanggal=tgl_indo($r[tanggal]);
    
    if ($r[status_order]=='Baru'){
        $pilihan_status = array('Baru', 'Lunas');
    }
    elseif ($r[status_order]=='Lunas'){
        $pilihan_status = array('Lunas', 'Batal');    
    }
    else{
        $pilihan_status = array('Baru', 'Lunas', 'Batal');    
    }

    $pilihan_order = '';
    foreach ($pilihan_status as $status) {
	   $pilihan_order .= "<option value=$status";
	   if ($status == $r[status_order]) {
		    $pilihan_order .= " selected";
	   }
	   $pilihan_order .= ">$status</option>\r\n";
    }

    echo "
          <form method=POST action=$aksi?module=hubungi&act=update>
          <input type=hidden name=id value=$r[id_hubungi]>

          <table>
          <tr><td>No. Pesanan</td>        <td> : $r[id_hubungi]</td></tr>
          <tr><td>Tanggal Pesan</td> <td> : $tanggal</td></tr>
          <tr><td>Status Pesan     </td><td>: <select name=status>$pilihan_order</select> 
		  <tr><td>Harga Barang</td><td> : <input type=text name=harga value='$r[harga]'></td></tr>
          <tr><td colspan=2><input type=submit value='Ubah Status'></td></tr>
          </table></form>";

    $tampil=mysql_query("SELECT * FROM hubungi,kustomer WHERE hubungi.id_kustomer=kustomer.id_kustomer AND hubungi.id_hubungi='$_GET[id]'");
	$r=mysql_fetch_array($tampil);
	echo"
	<h2>Pemesanan Barang</h2>
	<table width='70%'>
	<tr><td colspan=2 ><b>Informasi Kustomer</b></td></tr>
	<tr><td>Nama </td><td> : $r[nama_lengkap]</td></tr>
	<tr><td>Email</td><td> : $r[email]</td></tr>
	<tr><td>Nomor Rekening</td><td> : $r[telpon]</td></tr>
	<tr><td>Alamat</td><td> : $r[alamat]</td></tr>
	<tr><td colspan=2><b>Permintaan Kustomer</b></td></tr>
	<tr><td>Subjek</td><td> : $r[subjek]</td></tr>
	<tr><td>Pesan</td><td> : $r[pesan]</td></tr>
	</table>
	";
	break;

}
?>
