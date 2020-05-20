search_author = function(){
  $("#authorname").on("keyup", function(){
    var filter , li , value , menu;
	  filter = $(this).val().toUpperCase();
	  menu = $("#myMenu");
    li = $("#myMenu li");
    if(filter.length > 0)
    {
      for (i = 0; i < li.length; i++) {
			  value = li.eq(i).text();
			  if (value.indexOf(filter) > -1){
				  li.eq(i).show();
			  }
			  else
			  {
				  li.eq(i).hide();
			  }
			  menu.css("display","block");
		    }	
	  }
	  else{
      menu.css("display","none");
    }
  });
}

transfer_data_from_li_to_input = function()
{
  $("#myMenu li").on("click",function(){
      $("#authorname").val($(this).text());
  });
}

$(document).on("turbolinks:load",function(){ 
  $("#author_name_tick").on("click",function(){
    if($(this).is(":checked"))
    {
      $("#authorname").show().attr("required", "true");
      $(".advance-btn").attr("disabled", false);
    }
    else
    {
      $("#authorname").val("").hide().removeAttr("required");
      $("#myMenu").hide();
      if(!$("#price_tick").is(":checked"))
      {
        $(".advance-btn").attr("disabled", true);
      }
    }
  });

  $("#price_tick").on("click",function(){
    if($(this).is(":checked"))
    {
      $("#maxprice").show().attr("required", "true");
      $(".advance-btn").attr("disabled", false);
    }
    else
    {
      $("#maxprice").val("").hide().removeAttr("required");
      if(!$("#author_name_tick").is(":checked"))
      {
        $(".advance-btn").attr("disabled", true);
      }
    }
  });
  search_author();
  transfer_data_from_li_to_input();
});