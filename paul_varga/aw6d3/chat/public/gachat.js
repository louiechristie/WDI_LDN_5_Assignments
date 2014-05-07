var myApp = myApp || {};


myApp.updatePage = function(data){
  document.location.reload(true);
};

myApp.formSubmitHandler = function(ev) {
    ev.preventDefault();
    var message = $('#message').val();
    var username = $('#username').val();
    var since = $('#since').val();

    var data = {message: message, username: username, since: since};

    console.log(data)

    var ajaxOptions = {
      url: '/chat',
      type: 'POST',
      data: data,
      success: myApp.updatePage,
      error: function(data) {
        console.error("Ajax request failed.");
        console.log(data);
      },
    };
  $.ajax(ajaxOptions);
};

myApp.setup = function() {
  $('form').on('submit', myApp.formSubmitHandler); 
};

$(myApp.setup);