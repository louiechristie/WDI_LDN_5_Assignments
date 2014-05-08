var myApp = myApp || {};

myApp.addToList = function() {
  var $input = $('#task');

  if($input.val()) {
    $('ul#list').append($('<li></li>').attr('class', 'todos').text($input.val()));
  }
}


myApp.setup = function() {
  $('#target').submit(function(e){
    e.preventDefault();
    myApp.addToList();
    return false;
  })
}

$(document).ready(myApp.setup);