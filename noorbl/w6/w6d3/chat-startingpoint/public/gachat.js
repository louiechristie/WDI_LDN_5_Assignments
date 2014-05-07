var Msg = Msg || {};


$( function() {

  $('#chat').submit(function(ev) {
    ev.preventDefault();

  //$('#username')

  var message = $('input#message').val();
  var username = $('input#username').val();
  $.ajax({
    type: 'POST',
    url: '/chat',
    data: {
      username: username, 
      message: message,
      since: 1
    },
    success: function(avocado) {
      console.log(username);
      $('.chat').append('<li><span class="username">&lt;' + username + '&gt; </span><span class="message">' + message + '</span></li>');
    }

  });

  });

});

