var myApp = myApp || {};

myApp.add = function() {
	var $item = $('#todoitem');

	$( "ul" ).append( "<li>"+ $item.val() + "</li>" );

	myApp.colors()
	
}

myApp.colors = function() {
	$( "ul li" ).eq(0).addClass( "oldest" );
	$( "ul li" ).eq(1).addClass( "oldest2" );
	$( "ul li" ).eq(2).addClass( "oldest3" );
}

myApp.remove = function() {
	$( "#clear" ).click(function() {
  		$( "ul li" ).eq(0).remove();
			});
}

myApp.hide = function() {
	$( "li" ).slideUp( "slow", function() {
  		});
}

myApp.show = function() {
	$( "li" ).slideDown( "slow", function() {
  		});
}


myApp.setup = function() {
	$('#submit').click(function( event ) { event.preventDefault() });
	$('#submit').on('click', myApp.add);
	$('#clear').on('click', myApp.remove);
	$('#hide').on('click', myApp.hide);
	$('#show').on('click', myApp.show);
}

$(myApp.setup);