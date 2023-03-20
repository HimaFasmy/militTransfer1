<?php
  include "connection.php";
  $userId="";
  $firstName="";
  $lastName="";
  $gender="";
  $password="";

  $error="";
  $success="";

  if($_SERVER["REQUEST_METHOD"]=='GET'){
    if(!isset($_GET['userId'])){
      header("location:crud100/table.php");
      exit;
    }
    $id = $_GET['userId'];
    $sql = "select * from users where id=$id";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    while(!$row){
      header("location: crud100/table.php");
      exit;
    }
    $firstName=$row["firstName"];
    $lastName=$row["lastName"];
    $gender=$row["gender"];
    $password=$row["password"];

  }
  else{
    $id = $_POST["userId"];
    $firstName=$row["firstName"];
    $lastName=$row["lastName"];
    $gender=$row["gender"];
    $password=$row["password"];

    $sql = "update users set firstName='$firstName', lastName='$lastName', gender='$gender', password='$password' where id='$id'";
    $result = $conn->query($sql);
    
  }
  
?>
<!DOCTYPE html>
<html>
<head>
 <title>USERS</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
<!-- <nav class="navbar navbar-expand-lg navbar-dark bg-dark" class="fw-bold">
      <div class="container-fluid">
        <a class="navbar-brand" href="table.php">PHP USER OPERATION</a>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="table.php">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="create.php">Add New</a>
            </li>
          </ul>
        </div>
      </div>
    </nav> -->
 <div class="col-lg-6 m-auto">
 
 <form method="post">
 
 <br><br><div class="card">
 
 <div class="card-header bg-warning">
 <h1 class="text-white text-center">  Update User </h1>
 </div><br>

 <input type="hidden" name="userId" value="<?php echo $userId; ?>" class="form-control"> <br>

 <div class="">
    <label for="firstName">First Name :</label>
    <input type="text" class="register_input" id="firstName" name="firstName" value="<?php echo $firstName; ?>" placeholder="First Name"/>
  </div><br>

  <div class="">
    <label for="lastName">Last Name :</label>
    <input type="text" class="register_input" id="lastName" name="lastName" value="<?php echo $lastName; ?>" placeholder="Last Name"/>
  </div><br>
                    
  <div class="" style="display: flex; align-items: center;">
    <label for="gender">Gender :</label>
        <div>
              <label for="male" class="radio-inline"><input type="radio" name="gender" value="m" id="male" style="accent-color: #229206; cursor: pointer;" value="<?php echo $gender; ?>" required /> Male</label>
        </div>

        <div>
              <label for="female" class="radio-inline"><input type="radio" name="gender" value="f" id="female" style="accent-color: #229206; cursor: pointer;"/> Female</label>
        </div>
  </div><br>

  <div  style="display: flex; width: 100%; justify-content: center; align-items: center;">
    <div style="width: 100%;">
        <label for="password">Password :</label>
        <input type="password" class="register_input_password" id="password" name="password" placeholder="Password" onkeypress="restrictAlphabets(event)"/>
    </div>

    <div style="width: 100%;">
        <label for="password">Confirm Password :</label>
        <input type="password" class="register_input_password" id="password" name="password" value="<?php echo $password; ?>" placeholder="Confirm Password"/>
    </div>
  </div><br>

 <button class="btn btn-success" type="submit" name="submit"> Submit </button><br>
 <a class="btn btn-info" type="submit" name="cancel" href="table.php"> Cancel </a><br>

 </div>
 </form>
 </div>
</body>
</html>