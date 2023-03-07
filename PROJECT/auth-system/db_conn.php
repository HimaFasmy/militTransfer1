<?php

$sname= "192.168.34.21";
$unmae= "megha";
$password = "000000";

$db_name = "admin_db";

$conn = mysqli_connect($sname, $unmae, $password, $db_name);

if (!$conn) {
	echo "Connection failed!";
}