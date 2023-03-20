<?php
include 'addusers.php';
if(isset($_GET['deleteid'])){
    $id=$_GET['deleteid'];
    $sql="delete from `mltusers` where id=$id";
    $result=mysqli_query($con,$sql);
    if($result){
        // echo "Deleted Successfully";
        header('location:displayuser.php');
    }else{
        die(mysqli_error($con));
    }
}
?>