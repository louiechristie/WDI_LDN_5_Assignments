
// var A, var B and var C must be numbers, and can be negative

function add() {
  var A = parseInt(prompt("Please enter first number."));
  var B = parseInt(prompt("Please enter second number."));
  if ( isNaN(A) || isNaN(B) ) {
    alert("Please make sure you enter numbers");
  } else { 
  var result = A + B; 
  alert("Your result is:" + result);
  }
}



function subtract() {
  var A = parseInt(prompt("Please enter first number."));
  var B = parseInt(prompt("Please enter second number."));
  var result = A - B;
  alert("Your result is:" + result);
}



function divide() {
  var A = parseInt(prompt("Please enter first number."));
  var B = parseInt(prompt("Please enter second number."));
  if (B == 0) {
    alert("Please do not attempt to divide by 0");
  } else {
  var result = A / B;
  alert("Your result is:" + result);
  }
}




function multiply() {
  var A = parseInt(prompt("Please enter first number."));
  var B = parseInt(prompt("Please enter second number."));
  var result = A * B;
  alert("Your result is:" + result);
}



function square_root() {
  var C = parseInt(prompt("Please enter a number."));
  var result = Math.sqrt(C);
  alert("Your result is:" + result);
}