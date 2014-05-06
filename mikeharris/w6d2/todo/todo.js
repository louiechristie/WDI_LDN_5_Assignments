

var todo = todo || {};

todo.addToDo = function () {
     $todoList = $('#todo_list');
     $newItem = $('#new_item').val();
     $itemToAdd = $('<li>' +$newItem + "<div class='up'>move up</div><div class='down'>move down</div></li>");
     $itemToAdd.addClass('highlight');
     $itemToAdd.on('click', todo.done)
     $todoList.append($itemToAdd);
     todo.setup;
    }

todo.done = function() {
    $todoListItems = $(this);
    $todoListItems.toggleClass('cross_off')
}
todo.down = function() {
  event.stopPropagation();
  $todoItem = $(this).parent();
  $todoItem.insertAfter($todoItem.next());
}
todo.up = function() {
  event.stopPropagation();
  $todoItem = $(this).parent();
  $todoItem.insertBefore($todoItem.prev());
}

todo.setup = function () {
  $('#add_to_do').on('click', todo.addToDo);
  $('#todo_list li').on('click', todo.done);
  $('.down').on('click', todo.down);
  $('.up').on('click', todo.up);
}


$(todo.setup)