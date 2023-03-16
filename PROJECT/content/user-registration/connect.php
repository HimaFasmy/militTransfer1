<?php
$servername = "192.168.34.21";
$username = "megha";
$password = "000000";
$dbName = "steganographyappserver";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbName);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
?>