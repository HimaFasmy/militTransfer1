<?php
    include "connection.php";
    if(isset($_GET['userId'])){
        $id = $_GET['userId'];
        $sql = "DELETE from `users` where userId=$id";
        $conn->query($sql);
    }

    // check the location
    header('');
    exit;
?>