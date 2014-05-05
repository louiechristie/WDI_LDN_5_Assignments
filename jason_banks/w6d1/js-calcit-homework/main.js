// function update() {
//   var y = document.getElementById("operation").selectedIndex;
//   var x = document.getElementById("operation").options;
//   var second = document.getElementById("second");

//   switch (unescape(x[y].text)) {
//     case "\u221A":
//       second.setAttribute("disabled", true);
//       break
//     default:
//       break;
// }

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
    case "sqrt":
      squareRoot();
      break
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

function squareRoot() {
  var first = getFirstInput();
  var result = document.getElementById("result");
  var maths = Math.sqrt(first);

  result.innerHTML = " | Result: ";

  if (first < 0) {
    result.innerHTML += "cannot find the square of a negative number.";
  } else if (maths) {
    result.innerHTML += maths;
  } else if (maths == 0) {
    result.innerHTML += "0";
  } else if (isNaN(first)) {
    result.innerHTML += "could not be determined due to invalid inputs. ";
  }
}