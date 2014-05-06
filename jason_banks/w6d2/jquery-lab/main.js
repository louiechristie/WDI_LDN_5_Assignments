var ToDoApp = {};

ToDoApp.items_list = [];

ToDoApp.add_item = function () {
  var $new_item = $('#new_item');
  var $list = $('#list');

  if ($new_item.val()){
    ToDoApp.items_list.push($new_item);
  } else {
    alert("Cannot add a blank item.");
  }

}

// ToDoApp.list_items = function () {;}



ToDoApp.setup = function () {
  $('#add_button').click(ToDoApp.add_item);

}

$(document).ready(ToDoApp.setup);