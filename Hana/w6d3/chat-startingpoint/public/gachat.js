$.ajax

var Messages = Messages || {};

Messages.textSubmitHandler = function(ev){
  ev.preventDefault();
  
  var message = $('#message').val();
  var since = $('#since').val();
  var username = $('#username').val();

  var data = {message: message, username: username, since: since}

  var ajaxOptions = {
    url: '/chat',
    type: 'POST',
    data: data,
    success: Messages.updatePage,
    error: function(data){
      console.error("Ajax request failed.");
      console.log(data);}
  };
  $.ajax(ajaxOptions).done(Messages.updatePage);

};

Messages.updatePage = function(data){

  console.log(data)
  $.each(data, function(i, name)){

    $("ul").append($('<li><span class="username">&lt;' + name['username'] + '&gt;</span><span class="message">' + name['message'] + '</span></li>'));
    $("#since").val(name["timestamp"]);
  });
  };

 
// $(".chat").append($('<li><span class="username">&lt;&gt;</span><span class="message"></span></li>'));
// $("ul li .username").last().text($('#username').val());
// $("ul li .message").last().text($('#message').val());
// $lastMessage = $("ul li").last()  
// $lastMessage.text()


};






Messages.setup = function() {
  $('form').on('submit', Messages.textSubmitHandler);
};


$(Messages.setup)