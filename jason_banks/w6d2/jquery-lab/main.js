var ToDoApp = {};

ToDoApp.add_item = function () {
  var $new_item = $('#new_item');

  if ($new_item.val()){
    $("#list_items").append("<li>" + $new_item.val() + "</li>");
  } else {
    alert("Cannot add a blank item.");
  }
  $new_item.val("");
}

// ToDoApp.list_items = function () {
//   var $list_items = $('#list_items');

//   $.each(ToDoApp.itemsList, function(i, el) {
//     var $el = $(el);
//     $list_items.text($el);
//   });
// }



ToDoApp.setup = function () {
  $('#add_button').click( function (ev) {
    ev.preventDefault();
    ToDoApp.add_item();
  });

  $('#list').mouseover(ToDoApp.list_items);
}

$(document).ready(ToDoApp.setup);