display = function()
{
  $("#spinner").hide();
  $(".all-notification").show();
}
loadGenre = function()
{
  var genreArray = ["Self-help book" , "Novel" , "Non-fiction" , "Fantasy" , "Autobiography" ,"Adventure" ,"Romance" ,"Contemporary" ,"Dystopian" ,"Mystery" ,"Horror" ,"Thriller" ,"Paranormal" ,"Historical fiction" ,"Science Fiction" ,"Memoir" ,"Cooking" ,"Art" ,"Development" ,"Health" ,"History" ,"Travel" ,"Humor" ,"Children’s" , "Others"];
  var value=""
  for(let i=0;i<genreArray.length;i++)
  {
    value = value + `<option value='${genreArray[i]}'>${genreArray[i]}</option>`
  }
  $("#inlineFormCustomSelectPref").append(value);
}

$(document).on("turbolinks:load",function(){
    $("#loadMore").on("click",function(){
      window.setTimeout(function() {
      display(); }, 3000);
    });
    window.setTimeout(function() {
      display(); }, 3000);
      loadGenre();
});