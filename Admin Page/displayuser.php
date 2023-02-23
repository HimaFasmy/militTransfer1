<?php
include 'addusers.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Milit Transfer</title>
</head>
<body>
<h1>Welcome to the Milit Transfer</h1>
<table class="table">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">First Name</th>
      <th scope="col">Last Name</th>
      <th scope="col">Gender</th>
      <th scope="col">User Name</th>
      <th scope="col">Password</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
    <?php
    $sql="Select * from `mltusers`";
    $result=mysqli_query($con,$sql);
    if($result){
        while($row=mysqli_fetch_assoc($result)){
            $id=$row['id'];
            $first_name=$row['first_name'];
            $last_name=$row['last_name'];
            $gender=$row['gender'];
            $user_name=$row['user_name'];
            $password=$row['password'];
            echo'<tr>
            <th scope="row">'.$id.'</th>
            <td>'.$first_name.'</td>
            <td>'.$last_name.'</td>
            <td>'.$gender.'</td>
            <td>'.$user_name.'</td>
            <td>'.$password.'</td>
            <td>
                <button><a href="edit.php? editid='.$id.'">Edit</a></button>
                <button><a href="delete.php? deleteid='.$id.'">Delete</a></button>
            </td>
          </tr>';
        }   
    }
    ?>
  </tbody>
</table>
<h3>Add a New MLT User
<button><a href="mluser.php">Add</a></button></h3>
</body>
</html>