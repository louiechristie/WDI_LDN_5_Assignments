var Chat = Chat || {};

Chat.updatePage = function(data) {

  var $chat = $("ul");

  $.each(data, function(i, chatline) {
    $chat.append("<li><span class='username'>&lt;" + chatline["username"] + "&gt; </span><span class='message'>" + chatline["message"] + "</span></li>");
  });

}

Chat.formSubmitHandler = function(ev) {
  ev.preventDefault();
 
  if ($("#username").val() && $("#message").val()) {
    var ajaxOptions = {
    url: "/chat",
    type: "POST",
    data: {username: $("#username").val(), message: $("#message").val(), since: $("#since").val()},
    error: function(data) {
      console.log("Error!");
      console.log(data);
    }
  };
  $.ajax(ajaxOptions).done(Chat.updatePage);
  } else {
    alert("Must enter username and message.");
  }

};


Chat.setup = function() {
  $('form').on('submit', Chat.formSubmitHandler);
};



$(Chat.setup);