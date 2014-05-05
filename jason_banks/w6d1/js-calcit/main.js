function getTwoInputs() {
  array = [];
  var first = parseInt(prompt("Please enter first number."));
  var second = parseInt(prompt("Please enter second number."));
  array.push(first);
  array.push(second);
  return array;
}

function add() {
  var array = getTwoInputs();
  var result = array[0] + array[1];

  alert ("The sum of " + array[0] + " and " + array[1] + " is " + result + ".");
}

function subtract() {
  var array = getTwoInputs();
  var result = array[0] - array[1];

  alert ("The difference between " + array[0] + " and " + array[1] + " is " + result + ".");
}

function multiply() {
  var array = getTwoInputs();
  var result = array[0] * array[1];

  alert ("The product of " + array[0] + " and " + array[1] + " is " + result + ".");
}

function divide() {
  var array = getTwoInputs();
  var result = array[0] / array[1];

  alert ("The quotient of " + array[0] + " and " + array[1] + " is " + result + ".");
}

function squareRoot() {
  var first = parseInt(prompt("Please enter number."));
  var result = Math.sqrt(first);

  alert ("The square of " + first + " is " + result + ".");
}