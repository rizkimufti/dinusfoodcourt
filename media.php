<?php 
  error_reporting(0);
  session_start();	
  include "config/koneksi.php";
	include "config/fungsi_indotgl.php";
	include "config/fungsi_combobox.php";
	include "config/library.php";
  include "config/fungsi_autolink.php";
  include "config/fungsi_rupiah.php";
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Welcome to Toko Online</title>
	<link rel="shortcut icon" type="image/x-icon" href="template/images/favicon.ico" />

  <link rel="stylesheet" type="text/css" href="template/css/style.css?<?php echo time(); ?>" /> 
  <link rel="stylesheet" type="text/css" href="template/css/common.css?<?php echo time(); ?>" /> 
  <link rel="stylesheet" type="text/css" href="template/css/button.css?<?php echo time(); ?>" /> 


	<script src="template/js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="template/js/slides.min.jquery.js" type="text/javascript"></script>


	<script type="text/javascript">
		$(function(){
			$('.slides').slides({
				preload: true,
				generatePagination: true,
				play:3000
			});
		});
	</script>
</head>
	<body>
<!--Wrapper-->
<div id="wrapper"> 
      <!--Page-->
      <div class="page shadow"> 
    <!--Header-->
    <div id="header">
          <div class="primary-section">
        <div class="logo"><img src="template/images/logo-dinus.png" /></div>
        <div class="header-aside"> 
          <ul>
		<?php
		if ($_SESSION[email]=="") {
			echo "
			<li class='border'><a href='media.php?module=login' class='log'> login </a></li>
            <li><a href='media.php?module=register' class='user'>register</a></li>
			";
		}
		else {
			echo "<li class='border'><a href='logout.php' class='log'> Logout </a></li>";
		}
		?>
            <li class="carts"><a href="media.php?module=keranjangbelanja" class="cart">Shopping Cart</a></li>
          </ul>
            </div>
      </div>
          <div class="nav-section">
        <ul class="navigation">
              <li class="home"><a href="media.php?module=home" class="home">Home </a></li>
              <li><a href="media.php?module=profilkami">Profil </a></li>
              <li><a href="media.php?module=carabeli">Cara Pembelian</a></li>
              <li><a href="media.php?module=keranjangbelanja">Keranjang Belanja </a></li>
            </ul>
        </div>
    <!--Header--> 
    <!--Content-->
    <div id="content">
          <div class="sidebar">
		  
	<?php
	if ($_SESSION[email] !="") {
	echo "
        <div class='latest-product'>
              <h2>Your Menu</h2>
              <ul class='info'>
			  <img src='template/images/user.png' />
			  <li><a href='media.php?module=profilKustomer'>My Profil</a></li>
			  <li><a href='media.php?module=keranjangbelanja'>Shoping Cart<img src='template/images/cart.gif' /></a></li>
			  ";
			 echo "<div style='color:#E1473D;border:1px solid #E78686;padding:10px;background:#FFE1E1;'>";
			  include "item.php";
			 echo "</div>";
	echo "
			  
			  <li><a href='logout.php'>Logout</a></li>
          </ul>
             </div>
		";
			}
	?>
        <div class="latest-product">
              <h2>Produk Terlaris</h2>
              <ul class="info">
      <?php
      $best=mysql_query("SELECT * FROM produk ORDER BY dibeli DESC LIMIT 3");
      while($a=mysql_fetch_array($best)){
        $harga = format_rupiah($a[harga]);
		    echo "<li><img src='foto_produk/small_$a[gambar]' height='50' width='30' />
					<div class='p-info'><a href='media.php?module=detailproduk&id=$a[id_produk]'>$a[nama_produk]<br></a></div>			
				</li>
			";
      }

        ?>
          </ul>
             </div>
        <div class="latest-product ">
              <h2>Kategori Produk</h2>
              <ul class="info">
			  <?php
			              $kategori=mysql_query("select nama_kategori, kategori.id_kategori, 
                                  count(produk.id_produk) as jml 
                                  from kategori left join produk 
                                  on produk.id_kategori=kategori.id_kategori 
                                  group by nama_kategori");
            $no=1;
            while($k=mysql_fetch_array($kategori)){
                echo "<li><a href=' media.php?module=detailkategori&id=$k[id_kategori]'> $k[nama_kategori] ($k[jml])</a></li>";
              $no++;
            }
            ?>
			
          </ul>
           </div>
        <div class="latest-product f-des">

<div class="plugin">             
              <div id="fb-root"></div>
              <div class="fb-like-box" data-href="http://www.facebook.com/webgranth" data-width="289" data-show-faces="true" data-stream="false" data-header="true"></div>
</div>            </div>
      </div>
          <div class="content-right" >
	<?PHP include "tengah.php";?> 
      </div>
     </div>
    <!-- Content--> 
  </div>
      <!--Footer-->
      <div id="footer">
    <div class="footer-top">
    
    <div class="page">
          <div class="footer-bottom">
        <div class="copyright">
              <ul>
            <li>&copy; 2018 </li>
            <li><a href="#" class="select"> Team Dinus Food Court</a> All Rights Reserved.</li>
              <li class="last"></li>
          </ul>
            </div>
        <div class="social-icon">
              <ul>
      </div>
        </div>
  </div>
      <!--Footer--> 
    </div>
<!--Wrapper-->
</body>
</html>
