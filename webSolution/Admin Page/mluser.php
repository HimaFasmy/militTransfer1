<?php
include 'addusers.php';
if(isset($_POST['submit'])){
    $first_name=$_POST['first_name'];
    $last_name=$_POST['last_name'];
    $gender=$_POST['gender'];
    $user_name=$_POST['user_name'];
    $password=$_POST['password'];

    $sql="insert into `mltusers` (first_name, last_name, gender, user_name, password)
    values('$first_name','$last_name','$gender', '$user_name', '$password')";
    
    $result=mysqli_query($con,$sql);

    if($result){
        // echo "Data inserted successfully";
        header('location:displayuser.php');
    }else{
        die(mysqli_error($con));
    }
}
?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add MLT Users</title>
  </head>
  <body>
    <h1>Add a New User</h1>
    <div class="container">
    <form method="post">
        <div class="form-group">
            <label>First Name</label>
            <input type="text" class="form-control" placeholder="Enter First Name" name="first_name">
        </div>
        <div class="form-group">
            <label>Last Name</label>
            <input type="text" class="form-control" placeholder="Enter Last Name" name="last_name">
        </div>
        <div class="form-group">
            <label>Gender</label>
            <input type="text" class="form-control" placeholder="Enter Gender" name="gender">
        </div>
        <div class="form-group">
            <label>User Name</label>
            <input type="text" class="form-control" placeholder="Enter User Name" name="user_name">
        </div>
        <div class="form-group">
            <label>Password</label>
            <input type="text" class="form-control" placeholder="Enter Password" name="password">
        </div>
    <button type="submit" class="btn btn-primary" name="submit">Submit</button>
    </form>
  </body>
</html>