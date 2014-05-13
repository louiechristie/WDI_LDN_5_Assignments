

var todo = todo || {};

todo.addToDo = function () {
     $todoList = $('#todo_list');
     $newItem = $('#new_item').val();
     $itemToAdd = $('<li>' +$newItem + "<div class='up'>move up</div><div class='down'>move down</div></li>");
     $itemToAdd.addClass('highlight');
     $itemToAdd.on('click', todo.done)
     $todoList.append($itemToAdd);
     todo.setup;
      $('.down').on('click', todo.down);
      $('.up').on('click', todo.up);
    }

todo.done = function() {
    $todoListItems = $(this);
    $todoListItems.toggleClass('cross_off');   
}
todo.down = function() {
  event.stopPropagation();
  $todoItem = $(this).parent();
  // $todoItem.toggleClass("down_ani");
  // $todoItem.next().toggleClass("up_ani")
  // $todoItem.toggleClass("notransition")
  // $todoItem.next().toggleClass("notransition")
  $todoItem.insertAfter($todoItem.next());
}
todo.up = function() {
  event.stopPropagation();
  $todoItem = $(this).parent();
  // $todoItem.toggleClass("up_ani")
  // $todoItem.prev().toggleClass("down_ani")
  $todoItem.insertBefore($todoItem.prev());
  
}

todo.setup = function () {
  $('#add_to_do').on('click', todo.addToDo);
  $('#todo_list li').on('click', todo.done);
  $('.down').on('click', todo.down);
  $('.up').on('click', todo.up);
}


$(todo.setup)