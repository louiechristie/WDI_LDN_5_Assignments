var Chat = Chat || {};

Chat.setScrollPosition = function () {
  $('#chatwindow').scrollTop(9999999);
}

Chat.updateTimeStamp = function() {
  $('#since').val(new Date().getTime() / 1000);
}

Chat.updateChat = function(data) {
  $.each (data, function (i, chatObject) {
  $('ul').append("<li><span class=username>&lt;" + chatObject['username'] + "&gt;</span><span class=message>" + chatObject['message'] + "</span><li>");
  }
  );
  Chat.updateTimeStamp();
  Chat.setScrollPosition();
}



Chat.formSubmitHandler = function(ev) {
  ev.preventDefault();
  var username = $('#username').val();
  var message = $('#message').val();
  var since = $('#since').val();
  var ajaxOptions = {
    url: '/chat',
    type: 'POST',
    data: {
      "username": username,
      "message": message,
      "since": since 
    },
    success: function(data) {
      console.log('Ajax success');
      console.log(data);
      Chat.updateChat(data);
    }, 
    error: function() {
      console.log('Ajax failure');
    }
  };
  $.ajax(ajaxOptions);
}



Chat.setup = function() {
  $('form').on('submit', Chat.formSubmitHandler);
}

$(Chat.setup);