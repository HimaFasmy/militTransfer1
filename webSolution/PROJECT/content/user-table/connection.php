<?php 
    $servername = "192.168.34.21";
    $username = "megha";
    $password = "000000";
    $db_name = "steganographyappserver";  
    $conn = new mysqli($servername, $username, $password, $db_name);
    if($conn->connect_error){
        die("Connection failed".$conn->connect_error);
    }
    echo "";
    
    ?>