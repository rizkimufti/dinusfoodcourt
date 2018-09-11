<?php
$aksi="modul/mod_rekening/aksi_rekening.php";
switch($_GET[act]){
  // Tampil Rekening
  default:
    $sql  = mysql_query("SELECT * FROM modul WHERE id_modul='3'");
    $r    = mysql_fetch_array($sql);

    echo "<h2>Rekening Toko Online</h2>
          <form method=POST enctype='multipart/form-data' action=$aksi?module=rekening&act=update>
          <input type=hidden name=id value=$r[id_modul]>
          <table>
         <tr><td>Isi Rekening Toko</td><td><textarea name='isi' style='width: 560px; height: 250px;'>$r[static_content]</textarea></td></tr>
         <tr><td colspan=2><input type=submit value=Update>
                           <input type=button value=Batal onclick=self.history.back()></td></tr>
         </form></table>";
    break;  
}
?>
