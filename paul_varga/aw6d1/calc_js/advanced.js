var myApp = myApp || {};

myApp.mortgage = function() {
  var principal = parseFloat(document.getElementById('principal').value);
  var yearlyInterestRate = parseFloat(document.getElementById('yearlyInterestRate').value) / 1200;
  var numberOfYears = parseFloat(document.getElementById('numberOfYears').value) * 12;
  var caption = document.getElementById('repayment');

  var repayment = (principal * ((yearlyInterestRate * (Math.pow((1 + yearlyInterestRate), numberOfYears))) / ((Math.pow((1 + yearlyInterestRate), numberOfYears))-1))).toFixed(2) 
  console.log(repayment)

  caption.innerHTML = "Your repayment is: " + repayment + " per month!";
}

myApp.bmiMetric = function() {
  var weight = parseFloat(document.getElementById('weight').value);
  var height = parseFloat(document.getElementById('height').value);
  console.log(weight, height)
  var caption = document.getElementById('bmiM');

  var bmiM = ((weight / Math.pow(height, 2))).toFixed(2); 

  caption.innerHTML = "Your BMI is: " + bmiM + "!";
}

myApp.bmiImperial = function() {
  var weight = parseFloat(document.getElementById('weight2').value);
  var height = parseFloat(document.getElementById('height2').value);

  var caption = document.getElementById('bmiI');

  var bmiI = ((weight / Math.pow(height, 2))*703).toFixed(2); 

  caption.innerHTML = "Your BMI is: " + bmiI + "!";
}

myApp.trip = function() {
  var distance = parseFloat(document.getElementById('distance').value);
  var fuelEfficiency = parseFloat(document.getElementById('fuelEfficiency').value);
  var costPerGallon = parseFloat(document.getElementById('costPerGallon').value);
  var speed = parseFloat(document.getElementById('speed').value);

  if (speed > 60) {
    fuelEfficiency - ((speed - 60) * 2)
  }
  
  var caption = document.getElementById('tripResult');

  var duration = (distance / speed).toFixed(1);
  var cost = (costPerGallon * (distance / fuelEfficiency)).toFixed(2);

  caption.innerHTML = "The duration of your trip is " + duration + " hours and the costs are GBP " + cost + "!";
}

myApp.fizzbuzz = function() {
  var input = parseInt(document.getElementById('input').value);
  var caption = document.getElementById('show');

    if (input % 3 == 0 && input % 5 == 0) {
       var show = 'Fizzbuzz';
    } else if (input % 5 == 0) {
       var show = 'Buzz';
    } else if (input % 3 == 0) {
        var show = 'Fizz';
    } else { 
       var show = input;
    }

  caption.innerHTML = show + "!";

}

myApp.setup = function() {
  var mortButton = document.getElementById('mortgage');
  mortButton.addEventListener('click', myApp.mortgage);

  var bmiMButton = document.getElementById('bmiMetric');
  bmiMButton.addEventListener('click', myApp.bmiMetric);

  var bmiIButton = document.getElementById('bmiImperial');
  bmiIButton.addEventListener('click', myApp.bmiImperial);

  var trip = document.getElementById('trip');
  trip.addEventListener('click', myApp.trip);

  var fizz = document.getElementById('fizzbuzz');
  fizz.addEventListener('click', myApp.fizzbuzz);
}


document.addEventListener('DOMContentLoaded', myApp.setup);