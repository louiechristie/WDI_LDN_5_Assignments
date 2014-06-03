var myApp = myApp || {}

myApp.trip = function(){
 var distance = parseFloat(document.getElementById("distance").value);
  var efficiency = parseFloat(document.getElementById("efficiency").value);
  var gas = parseFloat(document.getElementById("gas").value);
  var speed = parseFloat(document.getElementById("speed").value);

  var time =  (distance / speed).toFixed(2);
  var cost = (distance * gas / efficiency).toFixed(2);
  var message = "Your trip will take " + time + " hours and $" + cost + ".";
  myApp.answer(message);
  }


myApp.answer = function(result){
  var caption = document.getElementById('answer');
  caption.innerHTML = result;
}