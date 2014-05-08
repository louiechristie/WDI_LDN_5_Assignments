var Chat = Chat || {};






Chat.formSubmitHandler = function(ev) {
  ev.preventDefault();
  var $username = $("#username").val();
  var $message = $("#message").val();

  if ($username && $message) {
    var ajaxOptions = {
    url: "/chat",
    type: "POST",
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