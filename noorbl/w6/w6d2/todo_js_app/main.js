
// toDo.update = function() {
//   var $caption = $('#greeting');
//   var $input = $('#name');

//   if ($input.val()) {
//     $caption.text("Hello, " + $input.val() + "!");
//   } else {
//     $caption.text("Hello!");
//   }
// }

// toDo.add = function() {





// toDo.setup = function() {
// var $input = $('#name');
// $input.on('keyup', toDo.update);
// var $button = $('#greeter');
//}

var toDo = toDo || {};

$(function(){

  toDo.avocado = function() {
    var $todo = $('#todo').val();
    $('#list').prepend('<li>' + $todo + '<br><button class="donetodo">Done</button></li>');
    $('#todo').val("");
  }

  toDo.done = function() {
  $('#list').on('click', ".donetodo", function(){
    $(this).parent().remove();
  });

}

var $form = $("#newtodo");

$form.on('submit', function(ev) {
  ev.preventDefault();
  toDo.avocado();
});

toDo.done();

});



