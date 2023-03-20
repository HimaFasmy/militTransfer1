<?php 
session_start();

if (isset($_SESSION['id']) && isset($_SESSION['user_name'])) {

 ?>
<!DOCTYPE html>
<html>
<head>
     <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>HOME</title>
	<link rel="stylesheet" type="text/css" href="./style.css">
</head>
<body style="background-color: black;">

<div style="display: flex; height: 100vh; justify-content: center; align-items: center;">
     <img src="../images/logo.png" alt="" class="spin-image2">
</div>


<div class="mytabs">
     <input type="radio" id="firstTab" name="mytabs" checked="checked">
     <label for="firstTab" class="tab_label">Users</label>
     <div class="tab">
          <iframe src="table.php" width="100%" height="100%" style=" border: 0; background-color:"></iframe>
     </div>

     <input type="radio" id="secondTab" name="mytabs">
     <label for="secondTab" class="tab_label">User Registration</label>
     <div class="tab">
          <div class="register_container">

          <div style="position: absolute; margin-top: 0px;">
               <div id="form-error" style="display: none; color: red; background: #6a6a6a2b;">Please fill out all fields.</div>
               <div id="password-error" style="position: absolute; display: none; color: red; background: #6a6a6a2b;"></div>
          </div>

               <form action="./user-registration/formHandling.php" method="post" class="register_form" onsubmit="return validateForm()">
                    <h2>Registration Form</h2>

                    <div class="register_textbox">
                         <label for="firstName">First Name :</label>
                         <input type="text" class="register_input" id="firstName" name="firstName" placeholder="First Name"/>
                    </div><br>

                    <div class="register_textbox">
                         <label for="lastName">Last Name :</label>
                         <input type="text" class="register_input" id="lastName" name="lastName" placeholder="Last Name"/>
                    </div><br>
                    
                    <div class="register_textbox" style="display: flex; align-items: center;">
                         <label for="gender">Gender :</label>
                         
                                   <label for="male" class="radio-inline"><input type="radio" name="gender" value="m" id="male" style="display: unset; accent-color: #229206; cursor: pointer;"/> Male</label>

                                   <label for="female" class="radio-inline"><input type="radio" name="gender" value="f" id="female" style="display: unset; accent-color: #229206; cursor: pointer;"/> Female</label>

                    </div><br>

                    <div  style="display: flex; width: 100%; justify-content: center; align-items: center;">
                         <div style="width: 100%;">
                              <label for="password">Password :</label>
                              <input type="password" class="register_input_password" id="password" name="password" placeholder="Password" pattern="[0-9]+" title="Password must contain only numbers"/>
                         </div>

                         <div style="width: 100%;">
                              <label for="password">Confirm Password :</label>
                              <input type="password" class="register_input_password_confirm" id="password_confirm" name="password" placeholder="Confirm Password"/>
                         </div>
                         <div id="error-message" style="color: red;"></div>
                    </div><br>

                    <button type="submit" class="submit_btn">Submit</button>
               </form>
          </div>
     </div>

</div>

<a href="./logout.php" class="logout_btn">Logout</a>

<script>


document.querySelector('.submit_btn').onclick = function() {
  var password = document.querySelector('.register_input_password').value;
  var confirmPassword = document.querySelector('.register_input_password_confirm').value;

  var firstNameInput = document.getElementById("firstName");
  var lastNameInput = document.getElementById("lastName");
  var genderRadios = document.getElementsByName("gender");
  var formError = document.getElementById("form-error");
  var passwordError = document.getElementById("password-error");
  var isFormValid = true;

  if (firstNameInput.value.trim() === "" || lastNameInput.value.trim() === "") {
    isFormValid = false;
    formError.style.display = "block";
  } else {
    formError.style.display = "none";
  }

  var isGenderSelected = false;
  for (var i = 0; i < genderRadios.length; i++) {
    if (genderRadios[i].checked) {
      isGenderSelected = true;
      break;
    }
  }
  if (!isGenderSelected) {
    isFormValid = false;
    formError.style.display = "block";
  }

  if (password == "") {
    isFormValid = false;
    passwordError.textContent = "Please enter a password.";
    passwordError.style.display = "block";
  } else if (password != confirmPassword) {
    isFormValid = false;
    passwordError.textContent = "Passwords don't match. Please try again.";
    passwordError.style.display = "block";
  } else {
    passwordError.style.display = "none";
  }

  return isFormValid;
}



// document.querySelector('.submit_btn').onclick = function(){
//      var password = document.querySelector('.register_input_password').value,
//           confirmPassword = document.querySelector('.register_input_password_confirm').value;

//           if(password == ""){
//           alert("Enter a password!");
//           }

//           else if(password != confirmPassword){
//           alert("Password didn't match. Re-enter the password!");
//           return false
//           }
// }


// function validateForm() {
//   var firstNameInput = document.getElementById("firstName");
//   var lastNameInput = document.getElementById("lastName");
//   var genderRadios = document.getElementsByName("gender");
//   var formError = document.getElementById("form-error");
//   var isFormValid = true;

//   if (firstNameInput.value.trim() === "" || lastNameInput.value.trim() === "") {
//     isFormValid = false;
//     formError.style.display = "block";
//   } else {
//     formError.style.display = "none";
//   }

//   var isGenderSelected = false;
//   for (var i = 0; i < genderRadios.length; i++) {
//     if (genderRadios[i].checked) {
//       isGenderSelected = true;
//       break;
//     }
//   }
//   if (!isGenderSelected) {
//     isFormValid = false;
//     formError.style.display = "block";
//   }

//   return isFormValid;
// }


// function validateForm() {
//   var radios = document.getElementsByName("gender");
//   var errorMessage = document.getElementById("error-message");
//   errorMessage.innerHTML = "";
//   for (var i = 0; i < radios.length; i++) {
//     if (radios[i].checked) {
//       return true;
//     }
//   }
//   errorMessage.innerHTML = "Please select an option.";
//   return false;
// }

</script>

</body>
</html>


<?php 
}else{
     header("Location: http://localhost/web-app/PROJECT/auth-system/index.php"); 
     exit();
}
 ?>