starCalculator = function(value)
{
  for(let i=0; i < 5; i++)
  {
    if(i <  value)
      $(".Rating").children().eq(i).attr("src","https://img.icons8.com/emoji/32/000000/star-emoji.png")
    else
      $(".Rating").children().eq(i).attr("src","https://img.icons8.com/windows/32/000000/star.png")
  }
}
$(document).on("turbolinks:load",function(){
  var rate = $(".Rating").attr("data-rating");
  if ( rate > 0 )
  {
    starCalculator(Number(rate));
  }
});