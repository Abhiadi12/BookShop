import consumer from "./consumer"

consumer.subscriptions.create("WebNotificationsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    
      $("#notificationbody").prepend(data.html);
      $(".unseen-header").hide();
      $("#notificationcount").text(data.count);
   
  }
});