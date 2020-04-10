$(document).on("turbolinks:load",function(){ 
  $("#author_name_tick").on("click",function(){
    if($(this).is(":checked"))
    {
      $("#authorname").show();
      $("#authorname").attr("required", "true");
    }
    else
    {
      $("#authorname").hide();
      $("#authorname").removeAttr("required");
    }
  });

  $("#price_tick").on("click",function(){
    if($(this).is(":checked"))
    {
      $("#maxprice").show();
      $("#maxprice").attr("required", "true");
    }
    else
    {
      $("#maxprice").hide();
      $("#maxprice").removeAttr("required")
    }
  });
  
});