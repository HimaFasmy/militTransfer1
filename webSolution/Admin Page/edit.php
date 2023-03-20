<?php
include 'addusers.php';
$id=$_GET['editid'];
$sql="Select * from `mltusers` where id=$id";
$result=mysqli_query($con,$sql);
$row=mysqli_fetch_assoc($result);
$first_name=$row['first_name'];
$last_name=$row['last_name'];
$gender=$row['gender'];
$user_name=$row['user_name'];
$password=$row['password'];
        

if(isset($_POST['submit'])){
    $first_name=$_POST['first_name'];
    $last_name=$_POST['last_name'];
    $gender=$_POST['gender'];
    $user_name=$_POST['user_name'];
    $password=$_POST['password'];

    $sql="update `mltusers` set id=$id, first_name='$first_name', last_name='$last_name', 
    gender='$gender', user_name='$user_name', password='$password' where id=$id";
    
    $result=mysqli_query($con,$sql);

    if($result){
        // echo "Updated successfully";
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
    <h1>Update a User details</h1>
    <div class="container">
    <form method="post">
        <div class="form-group">
            <label>First Name</label>
            <input type="text" class="form-control" placeholder="Enter First Name" name="first_name" value=<?php echo $first_name;?>>
        </div>
        <div class="form-group">
            <label>Last Name</label>
            <input type="text" class="form-control" placeholder="Enter Last Name" name="last_name" value=<?php echo $last_name;?>>
        </div>
        <div class="form-group">
            <label>Gender</label>
            <input type="text" class="form-control" placeholder="Enter Gender" name="gender" value=<?php echo $gender;?>>
        </div>
        <div class="form-group">
            <label>User Name</label>
            <input type="text" class="form-control" placeholder="Enter User Name" name="user_name" value=<?php echo $user_name;?>>
        </div>
        <div class="form-group">
            <label>Password</label>
            <input type="text" class="form-control" placeholder="Enter Password" name="password" value=<?php echo $password;?>>
        </div>
    <button type="submit" class="btn btn-primary" name="submit">Update</button>
    </form>
  </body>
</html>