display = function()
{
  $("#spinner").hide();
  $(".all-notification").show();
}

$(document).on("turbolinks:load",function(){
    $("#loadMore").on("click",function(){
      window.setTimeout(function() {
      display(); }, 3000);
    });
    window.setTimeout(function() {
      display(); }, 3000);
});