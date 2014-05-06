


function trip() {
  var A = parseInt(prompt("Please enter distance in km."));
  var B = parseInt(prompt("Please enter efficiency"))
  var C = parseInt(prompt("Please entre price"));
  var D = parseInt(prompt("Please enter speed"));

  var result_duration = (A / D).toFixed(2);
  var result_cost = ((A / B) * C).toFixed(2);
  alert("The cost of your trip is: " + result_cost + "$" + ".\nThe duration of your trip is: " + result_duration + "h.")
}

function mortgage() {
  var A = parseInt(prompt("Please enter principal amount"));
  var B = parseInt(prompt("Please enter interest"));
  var C = parseInt(prompt("Please enter number of payments"));

  var result = A * (B / 1200) * (Math.pow((1 + B / 1200), (C*12)) ) / (Math.pow( (1 + B / 1200), (C*12 - 1) ) ).toFixed(2);
  alert("The result is: " + result);
}


function bmi() {
  var A = parseInt(prompt("Please enter your weight in kg."));
  var B = parseInt(prompt("Please enter your height in cm."));

  var result = A / Math.pow((B / 100), 2).toFixed(2);
  alert("The result is: " + result);
}

function volume() {
  var A = parseInt(prompt("Please input the mean radius of a planet of your choice in km."));
  var result = 4 / 3 * Math.PI * Math.pow(A, 3);

  alert("The result is: " + result);
}


