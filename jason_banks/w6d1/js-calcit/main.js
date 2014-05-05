function getFirstInput() {
  var first = parseInt(prompt("Please enter first number."));
  return first;
}

function getSecondInput() {
  var second = parseInt(prompt("Please enter second number."));
  return second;
}

function add() {
  var first = getFirstInput();
  var second = getSecondInput();

  var result = first + second;
  alert ("The sum of " + first + " and " + second + " is " + result + ".");
}

function subtract() {
  var first = getFirstInput();
  var second = getSecondInput();

  var result = first - second;
  alert ("The difference between " + first + " and " + second + " is " + result + ".");

}