var CalcItBasic = {};

// CalcItBasic.update = function () {
//   var y = document.getElementById("operation").selectedIndex;
//   var x = document.getElementById("operation").options;
//   var second = document.getElementById("second");

//   switch (unescape(x[y].text)) {
//     case "sqrt":
//       second.setAttribute("disabled", "disabled");
//       break
//     default:
//       break;
//   }
// }

CalcItBasic.calcIt = function () {
  var y = document.getElementById("operation").selectedIndex;
  var x = document.getElementById("operation").options;

  switch (unescape(x[y].text)) {
    case "+":
      CalcItBasic.sum();
      break;
    case "-":
      CalcItBasic.subtract();
      break;
    case "\xD7":
      CalcItBasic.multiply();
      break;
    case "\xF7":
      CalcItBasic.divide();
      break;
    case "sqrt":
      CalcItBasic.squareRoot();
      break
    default:
      break;
  }
}

CalcItBasic.getFirstInput = function () {
  var first = parseInt(document.getElementById("first").value);
  return first;
}

CalcItBasic.getSecondInput = function () {
  var second = parseInt(document.getElementById("second").value);
  return second;
}

CalcItBasic.sum = function () {
  var first = CalcItBasic.getFirstInput();
  var second = CalcItBasic.getSecondInput();
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

CalcItBasic.subtract = function () {
  var first = CalcItBasic.getFirstInput();
  var second = CalcItBasic.getSecondInput();
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

CalcItBasic.multiply = function () {
  var first = CalcItBasic.getFirstInput();
  var second = CalcItBasic.getSecondInput();
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

CalcItBasic.divide = function () {
  var first = CalcItBasic.getFirstInput();
  var second = CalcItBasic.getSecondInput();
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

CalcItBasic.squareRoot = function () {
  var first = CalcItBasic.getFirstInput();
  var second = CalcItBasic.getSecondInput();
  var result = document.getElementById("result");
  var maths = Math.sqrt(first);

  result.innerHTML = " | Result: ";
  
  if (second) {
    result.innerHTML = " Only the first number is evaluated" + result.innerHTML;
  }

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

CalcItBasic.setup = function () {

  var button_basic = document.getElementById("button_basic");
  button_basic.addEventListener('click', CalcItBasic.calcIt);

  var box_basic = document.getElementById("box_basic");
  box_basic.addEventListener('mouseover', function() {
    this.setAttribute('class', 'over');});
  box_basic.addEventListener('mouseout', function() { this.setAttribute('class', 'out')});

  var box_mortgage = document.getElementById("box_mortgage");
  box_mortgage.addEventListener('mouseover', function() {
    this.setAttribute('class', 'over');});
  box_mortgage.addEventListener('mouseout', function() { this.setAttribute('class', 'out')});

  var box_bmi = document.getElementById("box_bmi");
  box_bmi.addEventListener('mouseover', function() {
    this.setAttribute('class', 'over');});
  box_bmi.addEventListener('mouseout', function() { this.setAttribute('class', 'out')});

  var box_trip = document.getElementById("box_trip");
  box_trip.addEventListener('mouseover', function() {
    this.setAttribute('class', 'over');});
  box_trip.addEventListener('mouseout', function() { this.setAttribute('class', 'out')});

  var box_too_many = document.getElementById("box_too_many");
  box_too_many.addEventListener('mouseover', function() {
    this.setAttribute('class', 'over');});
  box_too_many.addEventListener('mouseout', function() { this.setAttribute('class', 'out')});
}

document.addEventListener('DOMContentLoaded', CalcItBasic.setup);
