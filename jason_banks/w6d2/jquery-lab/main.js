var ToDoApp = {};

ToDoApp.items_list = ["Get keys from the key maker", "Buy krugerands", "Drink Dan's orange juice"];

ToDoApp.add_item = function () {
  var $new_item = $('#new_item');

  if ($new_item.val()){
    ToDoApp.items_list.push($new_item.val());
  } else {
    alert("Cannot add a blank item.");
  }

}

// ToDoApp.list_items = function () {;}



ToDoApp.setup = function () {
  $('#add_button').click( function (ev) {
    ev.preventDefault();
    ToDoApp.add_item();
  });

}

$(document).ready(ToDoApp.setup);