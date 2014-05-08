
// var A, var B and var C must be numbers, and can be negative

var cosmiCalc = cosmiCalc || {}

cosmiCalc.add = function() {
  var A = parseInt(prompt("Please enter first number."));
  var B = parseInt(prompt("Please enter second number."));
  if ( isNaN(A) || isNaN(B) ) {
    alert("Please make sure you enter numbers");
  } else { 
  var result = A + B; 
  alert("Your result is:" + result);
  }
}



cosmiCalc.subtract = function() {
  var A = parseInt(prompt("Please enter first number."));
  var B = parseInt(prompt("Please enter second number."));
  var result = A - B;
  alert("Your result is:" + result);
}



cosmiCalc.divide = function() {
  var A = parseInt(prompt("Please enter first number."));
  var B = parseInt(prompt("Please enter second number."));
  if (B == 0) {
    alert("Please do not attempt to divide by 0");
  } else {
  var result = A / B;
  alert("Your result is:" + result);
  }
}




cosmiCalc.multiply = function() {
  var A = parseInt(prompt("Please enter first number."));
  var B = parseInt(prompt("Please enter second number."));
  var result = A * B;
  alert("Your result is:" + result);
}



cosmiCalc.square_root = function() {
  var C = parseInt(prompt("Please enter a number."));
  var result = Math.sqrt(C);
  alert("Your result is:" + result);
}




cosmiCalc.main_setup = function() {
  var button = document.getElementById('add');
  button.addEventListener('click', cosmiCalc.add);
  var button = document.getElementById('subtract');
  button.addEventListener('click', cosmiCalc.subtract);
  var button = document.getElementById('divide');
  button.addEventListener('click', cosmiCalc.divide);
  var button = document.getElementById('multiply');
  button.addEventListener('click', cosmiCalc.multiply);
  var button = document.getElementById('square_root');
  button.addEventListener('click', cosmiCalc.square_root);

}

document.addEventListener('DOMContentLoaded', cosmiCalc.main_setup);

