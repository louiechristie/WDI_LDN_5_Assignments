console.log("todos.js");

var myApp = myApp || {};

myApp.setup = function() {

  var $buttons = $("[name='commit']");

  $buttons.click(function () {
    alert ("Update Todo button was clicked.");
  });
}

$(myApp.setup);



















