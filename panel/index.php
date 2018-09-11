    <head>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
		<style>
			body {
				background: url(images/blurred.jpg) no-repeat center top;
				-webkit-background-size: cover;
				-moz-background-size: cover;
				background-size: cover;
			}
		</style>
<script language="javascript">
function validasi(form){
  if (form.username.value == ""){
    alert("Anda belum mengisikan Username.");
    form.username.focus();
    return (false);
  }
     
  if (form.password.value == ""){
    alert("Anda belum mengisikan Password.");
    form.password.focus();
    return (false);
  }
  return (true);
}
</script>
    </head>
<body OnLoad="document.login.username.focus();">
        <div class="container">
			<section class="main">
			<form name="login" action="cek_login.php" method="POST" onSubmit="return validasi(this)" class="form-3">
				    <p class="clearfix">
				        <label for="login">Username</label>
				        <input type="text" name="username" id="login" placeholder="Username">
				    </p>
				    <p class="clearfix">
				        <label for="password">Password</label>
				        <input type="password" name="password" id="password" placeholder="Password"> 
				    </p>
				    <p class="clearfix">
				        <input type="submit" name="submit" value="Sign in">
				    </p>       
				</form>​
			</section>
			
        </div>
    </body>
