registrationFormValidator = function()
{
  $(".reg_form").validate({
      rules:{
        "user[username]":{
          required: true
        },
        "user[email]":{
          required: true,
          email: true
        },
        "user[password]":{
          required: true,
          minlength: 6
        },
        "user[password_confirmation]": {
          required: true,
          equalTo: "#password"
        }
      }
  });
}
addBookForm = function()
{
  $(".push_book").validate({
    rules:{
      "user_book[name]":{
        required: true
      },
      "user_book[price]":{
        required: true,
        min:1
      },
      "user_book[review]":{
        required:true,
        maxlength:1000
      },
      "user_book[page_count]":{
        required:true,
        min:1
      }
    }
  });
}
$(document).on("turbolinks:load", function(){
  registrationFormValidator();
  addBookForm();
});