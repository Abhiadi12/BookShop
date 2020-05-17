// Get the element with id="defaultOpen" and click on it
user_detail = function()
{
  var acc = document.getElementsByClassName("accordion");
  var i;

  for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function() {
    this.classList.toggle("acc-active");
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
}
}

$(document).on("turbolinks:load", function(){
  $(".tablinks").on("click" , function(evt) {
    var i , tablinks , chat_id;
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
      tablinks[i].className = tablinks[i].className.replace("active", "");
    }
    evt.currentTarget.className += " active";
    $(".tabcontent h3").text(evt.currentTarget.innerHTML);
    chat_id = evt.currentTarget.getAttribute("data-chatinfo");
    $("#chat_id").attr("value",chat_id);

    // ajax call to load the user data
    $.ajax({
      type:"GET",
      url:"/admin/index",
      data: {chat: chat_id}// send data to the controller
      })
    });
    user_detail();
    $("#content").animate({ scrollTop: $('#content').prop("scrollHeight")}, 1000);
  });

 /* $("#c").on("click", function(){
    $.ajax({
      type:"GET",
      url:"/check",
      dataType:"html", // js , xml ,json 
      data: {some_parameter: 'hello'}, // send data to the controller
      success:function(result){ // response manage by this function call
        $("#hoo").append(result);
      }
      })
    });
    
    $("#foo").on("click" , function(){
      $.ajax({
        type:"GET",
        url:"/check",
        data: {chat: $(this).attr("data-info")},
        success:function(result){
          alert(result);
          console.log("ok");
        }// send data to the controller
        })
    });
      
    */