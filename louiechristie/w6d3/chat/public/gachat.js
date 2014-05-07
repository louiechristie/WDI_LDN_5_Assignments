var chatApp = chatApp || {};

chatApp.getLines = function() {
  console.log('getLines');
  var lines = [];
  return lines;

}

chatApp.messageSubmitHandler = function(ev) {
  ev.preventDefault();
  console.log('messageSubmitHandler');
  var username = $('#username').val();
  var message = $('#message').val();
  var timestamp = Date.now();
  console.log('message: '+message);
  console.log('username: '+username);
  console.log('timestamp: '+timestamp);

  var ajaxOptions = {
    url: '/chat',
    username: username,
    message: message,
    since: timestamp,
    type: 'POST',
    success: chatApp.updatePage,
    error: function(data) {
      console.error("AJAX request failed.");
      console.log(data);
      },
    };
    console.log('ajaxOptions: '+ajaxOptions);
    $.ajax(ajaxOptions).done(chatApp.updatePage());
    
}

chatApp.updatePage = function(data) {
  console.log('updatePage()');

  // chatApp.addMessage(data);
  
}

chatApp.addMessage = function(data) {
  console.log('data: '+data)
  $('.chat').append( "<li><span class='username'>"+data[username]+"</span> <span class='message'>"+data[message]+"</span></li>" );

  var bits = ['username', 'message', 'since'];
  $.each(bits, function(i, name) {


    chatApp.updateBits($('.chat .'+name), data[name]);
  });
}

chatApp.updateBits = function(el, content) {
  var $el = $(el);
  $el.text(content);

  var up = true;
  var level = 15;
  var step = function() {
    var hex = level.toString(16);
    $el.css('background-color', '#FAFA' + hex + hex);
    if (up) {
      if (level > 0) {
        level--;
        setTimeout(step, 25);
      } else {
        up = false;
        level = 1;
        setTimeout(step, 25);
      }
    } else if (level < 15) {
      level++
      setTimeout(step, 25);
    } else {
      $el.css('background-color', '#FFF');
    }
  };
  setTimeout(step, 25);
}


chatApp.setup = function() {
  $('[name=submit]').on('click', chatApp.messageSubmitHandler);
};

$(chatApp.setup);
console.log('chatApp.setup');