<?php
include 'connect.php';
    $firstName = $_POST['firstName'];
	$lastName = $_POST['lastName'];
	$gender = $_POST['gender'];
	$password = $_POST['password'];

    $sql = "INSERT INTO users (firstName, lastName, gender, password)
            VALUES ('$firstName', '$lastName', '$gender', '$password')";
    if (mysqli_query($conn, $sql)) {
        header("Location: http://localhost/web-app/PROJECT/content/home.php");
        exit;
    }else {
        echo "Error : " . $sql .  "<br>" . mysqli_error($conn);
    }
    mysqli_close($conn);
?>
