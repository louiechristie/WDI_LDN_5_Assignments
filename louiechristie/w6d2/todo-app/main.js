var myApp = myApp || {};

myApp.add = function() {
  
  $('li').removeClass("new")
  $('ul').append("<li class='new'>"+$('#new_item').val()+" "+"<button class='done_button'>Done</button></li>")
  myApp.setupDoneButtons();
}

myApp.setupDoneButtons = function () {
  var buttons = $('li.new .done_button');
  buttons.click(function () {
    $(this).parent('li').attr('style', 'text-decoration:line-through;');
  });

};

myApp.setup = function() {
  var $button = $('#submit');
  $button.click(function () { myApp.add(); });
  $button.click(function(event){
    event.preventDefault();
  });
}

$(myApp.setup);