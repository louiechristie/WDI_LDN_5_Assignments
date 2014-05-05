function calcIt() {
  var y = document.getElementById("operation").selectedIndex;
  var x = document.getElementById("operation").options;

  switch (unescape(x[y].text)) {
    case "+":
      sum();
      break;
    case "-":
      subtract();
      break;
    case "\xD7":
      multiply();
      break;
    case "\xF7":
      divide();
      break;
    default:
      break;
  }

}

function getFirstInput() {
  var first = parseInt(document.getElementById("first").value);
  return first;
}

function getSecondInput () {
  var second = parseInt(document.getElementById("second").value);
  return second;
}

function sum() {
  var first = getFirstInput();
  var second = getSecondInput();
  var result = document.getElementById("result");
  var maths = first + second;

  result.innerHTML = " | Result: ";

  if (maths) {
    result.innerHTML += maths;
  } else if (maths == 0) {
    result.innerHTML += "0";
  } else if (isNaN(first) || isNaN(second)) {
    result.innerHTML += "could not be determined due to invalid inputs.";
  }
}

function subtract() {
  var first = getFirstInput();
  var second = getSecondInput();
  var result = document.getElementById("result");
  var maths = first - second;

  result.innerHTML = " | Result: ";

  if (maths) {
    result.innerHTML += maths;
  } else if (maths == 0) {
    result.innerHTML += "0";
  } else if (isNaN(first) || isNaN(second)) {
    result.innerHTML += "could not be determined due to invalid inputs.";
  }
}

function multiply() {
  var first = getFirstInput();
  var second = getSecondInput();
  var result = document.getElementById("result");
  var maths = first * second;

  result.innerHTML = " | Result: ";

  if (maths) {
    result.innerHTML += maths;
  } else if (maths == 0) {
    result.innerHTML += "0";
  } else if (isNaN(first) || isNaN(second)) {
    result.innerHTML += "could not be determined due to invalid inputs.";
  }
}

function divide() {
  var first = getFirstInput();
  var second = getSecondInput();
  var result = document.getElementById("result");
  var maths = first / second;

  result.innerHTML = " | Result: ";

  if (second == 0) {
    result.innerHTML += "cannot divide by zero.";
  } else if (maths) {
    result.innerHTML += maths;
  } else if (maths == 0) {
    result.innerHTML += "0";
  } else if (isNaN(first) || isNaN(second)) {
    result.innerHTML += "could not be determined due to invalid inputs.";
  }
}

// function squareRoot() {
//   var first = parseInt(prompt("Please enter number."));
//   var result = Math.sqrt(first);

//   if (first < 0) {
//     alert ("Cannot find the square of a number less than 0.")
//   } else {
//     alert ("The square of " + first + " is " + result + ".");
//   }
// }