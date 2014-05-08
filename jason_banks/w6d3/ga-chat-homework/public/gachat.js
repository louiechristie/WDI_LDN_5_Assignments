var Chat = Chat || {};

Chat.updatePage = function(chatline) {

  var line_parts = ["username", "message"];

  $.each(line_parts, function(i, line_part) {
    $("." + line_part).text(chatline[i][line_part]);
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