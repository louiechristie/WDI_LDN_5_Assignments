var Chat = Chat || {};

Chat.updatePage = function(data) {

}






Chat.formSubmitHandler = function(ev) {
  ev.preventDefault();
  // var username = $("#username").val();
  // var message = $("#message").val();

  if ($("#username").val() && $("#message").val()) {
    var ajaxOptions = {
    url: "/chat",
    type: "POST",
    data: {username: $("#username").val(), message: $("#message").val(), since: $("#since").val()},
    error: function(data) {
      console.log("Error!");
      console.log(data);
    },
    success: function(data) {
      console.log("Success!");
      console.log(data);
    }
  };
  $.ajax(ajaxOptions);
  } else {
    alert("Must enter username and message.");
  }

  

};


Chat.setup = function() {
  $('form').on('submit', Chat.formSubmitHandler);
};



$(Chat.setup);