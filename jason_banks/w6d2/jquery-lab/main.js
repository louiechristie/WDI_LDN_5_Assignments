var ToDoApp = {};

ToDoApp.add_item = function () {
  var $new_item = $('#new_item');

  if ($new_item.val()){
    $("#list_items").append("<li>" + $new_item.val() + "<input type='checkbox' name='checkbox' id='" + $new_item.val() + "' /></li>");
  } else {
    alert("Cannot add a blank item.");
  }
  $new_item.val("");
}




ToDoApp.setup = function () {
  $('#add_button').click( function (ev) {
    ev.preventDefault();
    ToDoApp.add_item();
  });

}

$(document).ready(ToDoApp.setup);