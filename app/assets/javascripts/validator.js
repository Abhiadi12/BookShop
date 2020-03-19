function isValidData()
{
  // regex for confirmation
  var nameRegex = /^(?!.*\.\.)(?!.*\.$)[^\W][\w.]{2,20}$/
  var emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,20})+$/

  var username = document.getElementById("username");
  var email = document.getElementById("email");
  var password = document.getElementById("password");
  var confirmpassword = document.getElementById("confirmpassword");
  var flag = true;
  console.log("happy");
  if ( !nameRegex.test(username.value) )
  {
    username.style.border = "1px solid red";
    username.title = "please enter a valid username"
    flag = false;
  }
  if ( !emailRegex.test(email.value) )
  {
    email.style.border = "1px solid red";
    email.title = "please enter a valid email"
    flag = false;
  }
  if ( password.value.length < 6 )
  {
    password.style.border = "1px solid red";
    password.title = " enter a strong password ";
    flag = false;
  }
  if ( password.value != confirmpassword.value )
  {
    confirmpassword.style.border = "1px solid red";
    confirmpassword.title = "must be same"
    flag = false;
  }
  console.log(flag);
  return flag;
}