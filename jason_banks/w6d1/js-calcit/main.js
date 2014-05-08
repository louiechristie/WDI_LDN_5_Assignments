function getTwoInputs() {
  array = [];
  var first = parseInt(prompt("Please enter first number."));
  var second = parseInt(prompt("Please enter second number."));
  array.push(first);
  array.push(second);
  return array;
}

var errorNAN = "Not all of the inputs were numbers. Please try again.";

function add() {
  var array = getTwoInputs();
  var result = array[0] + array[1];

  if (isNaN(result)) {
    alert (errorNAN);
  } else {
    alert ("The sum of " + array[0] + " and " + array[1] + " is " + result + ".");
  }
}

function subtract() {
  var array = getTwoInputs();
  var result = array[0] - array[1];

   if (isNaN(result)) {
    alert (errorNAN);
  } else {
    alert ("The difference between " + array[0] + " and " + array[1] + " is " + result + ".");
  }
}

function multiply() {
  var array = getTwoInputs();
  var result = array[0] * array[1];

  if (isNaN(result)) {
    alert (errorNAN);
  } else {
    alert ("The product of " + array[0] + " and " + array[1] + " is " + result + ".");
  }
}

function divide() {
  var array = getTwoInputs();
  var result = array[0] / array[1];

  if (array[1] == 0) {
    alert ("Cannot divide by 0.");
  } else if (isNaN(result)) {
    alert (errorNAN);
  } else {
    alert ("The quotient of " + array[0] + " and " + array[1] + " is " + result + ".");
  }
}

function squareRoot() {
  var first = parseInt(prompt("Please enter number."));
  var result = Math.sqrt(first);

  if (first < 0) {
    alert ("Cannot find the square of a number less than 0.")
  } else {
    alert ("The square of " + first + " is " + result + ".");
  }
}