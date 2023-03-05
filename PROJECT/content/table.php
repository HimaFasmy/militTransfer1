<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="./style.css">
    <title>table of users</title>
  </head>
<body>

<!-- <div style="display: flex; height: 100vh; justify-content: center; align-items: center;">
     <img src="../images/logo.png" alt="" class="spin-image2">
</div> -->

<div class="user_container">
  <table class="user_table">
    <thead>
      <tr>
        <th>ID</th>
        <th>FIRST NAME</th>
        <th>LAST NAME</th>
        <th>GENDER</th>
        <th>PASSWORD</th>
        <th>EDIT</th>
        <th>DELETE</th>
      </tr>
    </thead>
    <tbody>
      <?php
        include "./user-table/connection.php";
        $sql = "select * from users";
        $result = $conn->query($sql);
        if(!$result){
          die("Invalid query!");
        }
        while($row=$result->fetch_assoc()){
          echo "
      <tr class='user_rows'>
        <td>$row[userId]</td>
        <td>$row[firstName]</td>
        <td>$row[lastName]</td>
        <td>$row[gender]</td>
        <td>$row[password]</td>
        <td><a class='btn-user_edit' href='./user-table/edit.php?id=$row[userId]'>Edit</a></td>
        <td><a class='btn-user_delete' href='./user-table/delete.php?id=$row[userId]'>Delete</a></td>
      </tr>
      ";
        }
      ?>
    </tbody>
  </table>
</div>

</body>
</html>