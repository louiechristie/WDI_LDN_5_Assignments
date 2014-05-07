var toDo = toDo || {};

toDo.addItem = function(){
    var input = $('input');
    var node=document.createElement("P");
    $('<p></p>')
    var $p = $('<p></p>').text(input.val())
    $('body').append($p);
}

toDo.setup = function() {
  var $button = $("#additem");
  $button.click(toDo.addItem);
}

$(document).ready(toDo.setup);