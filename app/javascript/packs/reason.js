$(document).on("turbolinks:load", function(){
 $("#others").hide();
 var count=0;
 $("#other_reason").on("click",function(){
  if($(this).is(":checked"))
  {
    $("#others").show();
    count++;
    $("#deletebtn").attr("disabled", false);
  }
  else
  {
    $("#others").hide();
    count--;
    if(count == 0)
    $("#deletebtn").attr("disabled", true);
  }
 });
 $("#reason_one").on("click",function(){
  if($("#reason_one").is(":checked"))
  {
    count++;
    $("#deletebtn").attr("disabled", false);
  }
  else
  {
    count--;
    if(count == 0)
    $("#deletebtn").attr("disabled", true);
  }
 });
 $("#reason_two").on("click",function(){
  if($("#reason_two").is(":checked"))
  {
    count++;
    $("#deletebtn").attr("disabled", false);
  }
  else
  {
    count--;
    if(count == 0)
    $("#deletebtn").attr("disabled", true);
  }
 });
  $("#delete_message").text("Please select one reason").css("color","red");
});