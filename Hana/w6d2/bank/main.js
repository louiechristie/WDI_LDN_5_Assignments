var myApp = myApp || {}

var $total = 0;
var $checkings = 0;
var $savings = 0;

myApp.deposit = function(){
 var $caption = $('#checkingsText');
 var $input = $('#checkingsNewitem');

 if($input.val()){
  $caption.text("$" + $input.val().toFixed(2))
 };
  
}


myApp.setup = function(){

 
  var $depositButtons = $("input.deposit:button");
  $depositButtons.on("click", myApp.deposit);
}

$(myApp.setup);











