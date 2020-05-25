// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import $ from 'jquery';
global.$ = jQuery;
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("bootstrap/dist/js/bootstrap")
require("jquery-validation")
//= require rails_emoji_picker
require('packs/reason')
require('packs/imagemanager')
require('packs/inputboxtoggle')
require('packs/rating')
require('packs/loadmore')
require('packs/senddata')
require('packs/validator')

$(document).on("turbolinks:load",function(){
  $("#categoryid").click(function(){
    $(".category-toggle").toggle(1000);
  });
  $('[data-toggle="tooltip"]').tooltip();
  
  var global_notification = document.querySelector('.global-notification');
  if(global_notification) {
    window.setTimeout(function() {
      global_notification.style.display = "none";
    }, 4000);
  }
});


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
