var Gachat = Gachat || {};

Gachat.chatSubmitHandler = function(ev) {

	ev.preventDefault();

	var username = $('#username').val();
	var message = $('#message').val();
	var since = $('#since').val();

	data = {message: message, username: username, since: since}
	
	var ajaxOptions = {
		url: '/chat',
		type: 'POST',
		data: data,
		success: Gachat.refresh,
		error: function(data) {
			console.error("AJAX FAILED");
			console.log(data);
		}
	}	

	$.ajax(ajaxOptions);

};

Gachat.refresh = function(data) {
  $.each(data, function(i,name){
    $( "ul" ).append("<li><span class='username'>&lt;" + name["username"] + "&gt;</span><span class='message'> " +  name["message"] + "</span></li>");
    $( "#since" ).val(name["timestamp"]);

    if ($('li').length >= 10) {
		$( "li:first" ).remove();
	}
  });
};

// Gachat.refresh = function() {
// 	var username = $('#username').val();
// 	window.location = "/?username=" + username
// };

Gachat.setup = function() {
	$('form').on('submit', Gachat.chatSubmitHandler);
	// setInterval ( "Gachat.refresh()", 5000 );
};

$(Gachat.setup);
