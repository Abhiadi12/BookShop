$(document).on("turbolinks:load",function(){ 
  $("#author_name_tick").on("click",function(){
    if($(this).is(":checked"))
    {
      $("#authorname").show();
      $("#authorname").attr("required", "true");
      $(".advance-btn").attr("disabled", false);
    }
    else
    {
      $("#authorname").hide();
      $("#authorname").removeAttr("required");
      if(!$("#price_tick").is(":checked"))
      {
        $(".advance-btn").attr("disabled", true);
      }
    }
  });

  $("#price_tick").on("click",function(){
    if($(this).is(":checked"))
    {
      $("#maxprice").show();
      $("#maxprice").attr("required", "true");
      $(".advance-btn").attr("disabled", false);
    }
    else
    {
      $("#maxprice").hide();
      $("#maxprice").removeAttr("required");
      if(!$("#author_name_tick").is(":checked"))
      {
        $(".advance-btn").attr("disabled", true);
      }
    }
  });
});