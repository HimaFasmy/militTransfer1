<?php 
session_start();

session_unset();
session_destroy();

header("Location: http://localhost/web-app/PROJECT/auth-system/index.php");