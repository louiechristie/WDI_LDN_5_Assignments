var myApp = myApp || {}


myApp.mortgage = function(){
 var principal = parseFloat(document.getElementById("principal").value);
  var interest = parseFloat(document.getElementById("interest").value)/1200;
  var frequency = parseFloat(document.getElementById("frequency").value);



  var x = Math.pow((1+interest),frequency);
  var result = (principal * (( interest * x) / (x-1))).toFixed(2);
  var message = "Your monthly mortgage is $" + result;
  myApp.answer(message);
  }


myApp.answer = function(message){
  var caption = document.getElementById("answer");
  caption.innerHTML = message;
}