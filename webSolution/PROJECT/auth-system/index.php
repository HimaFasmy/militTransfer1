<!DOCTYPE html>
<html>
<head>
	<title>LOGIN</title>
	<link rel="stylesheet" href="style.css">
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<link rel="shortcut icon" type="images/jpg" href="../images/logo.png">
</head>
<body>
	<div class="login_container">

		<img src="../images/logo.png" alt="" class="spin-image">

		<form action="./login.php" method="post" class="login_form">
			<h2>Login</h2>
			<?php if (isset($_GET['error'])) { ?>
				<p class="login_error"><?php echo $_GET['error']; ?></p>
			<?php } ?>

			<div class="login_textbox">
                <i class='bx bxs-user'></i>
                <input type="password" name="uname" placeholder="User Name" class="login_input"><br>
            </div>

			<div class="login_textbox">
                <i class='bx bxs-lock-alt' ></i>
                <input type="password" name="password" placeholder="Password" class="login_input"><br>
            </div>

			<button type="submit" class="login_btn">Login</button>
		</form>

	</div>
</body>
</html>