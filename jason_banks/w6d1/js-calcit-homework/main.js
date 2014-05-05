function calcIt() {
  var y = document.getElementById("operation").selectedIndex;
  var x = document.getElementById("operation").options;

  switch (x[y].text) {
    case "+":
      sum();
      break;
    case "-":
      subtract();
      break;
    case "&times;":
      multiply();
      break;
    case "&divide":
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
  } else {
    result.innerHTML;
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
  } else {
    result.innerHTML;
  }
}

// function multiply() {
//   var array = getTwoInputs();
//   var result = array[0] * array[1];

//   if (isNaN(result)) {
//     alert (errorNAN);
//   } else {
//     alert ("The product of " + array[0] + " and " + array[1] + " is " + result + ".");
//   }
// }

// function divide() {
//   var array = getTwoInputs();
//   var result = array[0] / array[1];

//   if (array[1] == 0) {
//     alert ("Cannot divide by 0.");
//   } else if (isNaN(result)) {
//     alert (errorNAN);
//   } else {
//     alert ("The quotient of " + array[0] + " and " + array[1] + " is " + result + ".");
//   }
// }

// function squareRoot() {
//   var first = parseInt(prompt("Please enter number."));
//   var result = Math.sqrt(first);

//   if (first < 0) {
//     alert ("Cannot find the square of a number less than 0.")
//   } else {
//     alert ("The square of " + first + " is " + result + ".");
//   }
// }