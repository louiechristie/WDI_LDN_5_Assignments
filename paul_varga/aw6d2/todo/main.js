var myApp = myApp || {};

myApp.addToList = function() {
  var $input = $('#task');

  if($input.val()) {
    $('ul#list').append($('<li></li><input type="checkbox" class="done_button" /></br>').attr('class', 'todos').text($input.val()));
  }
}

// myApp.setupDoneButtons = function()
//   var buttons = $('.done_button');
//   buttons.click(function() {
//     $(this).parent('li').attr('style', 'text-decoration: line-through;');
//   });

myApp.setup = function() {
  $('#target').submit(function(e){
    e.preventDefault();
    myApp.addToList();
    return false;
  });
}

$(document).ready(myApp.setup);