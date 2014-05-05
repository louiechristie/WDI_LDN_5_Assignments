function calc() {
  var a = parseFloat(document.getElementById('first_number').value);
  var b = parseFloat(document.getElementById('second_number').value);
  var caption = document.getElementById('result');

  var sel = document.getElementById('operations');
  var selTitle = sel.options[sel.selectedIndex].value;

    switch(selTitle) {
      case 'add':
        var result = (a + b).toFixed(2);
        break;
      case 'subtract':
        var result = (a - b).toFixed(2);
        break;
      case 'multiply':
        var result = (a * b).toFixed(2);
      case 'divide':
        var result = (a / b).toFixed(2);
      case 'squareRoot':
        var result = (Math.sqrt(a)).toFixed(2);
      default: 
        break; 
    }
  caption.innerHTML = "Your result is: " + result + "!";
}

function mortgage() {
  var principal = parseFloat(document.getElementById('principal').value);
  var yearlyInterestRate = parseFloat(document.getElementById('yearlyInterestRate').value) / 1200;
  var numberOfYears = parseFloat(document.getElementById('numberOfYears').value) * 12;

  var caption = document.getElementById('repayment');

  var repayment = (principal * ((yearlyInterestRate * (Math.pow((1 + yearlyInterestRate), numberOfYears))) / ((Math.pow((1 + yearlyInterestRate), numberOfYears))-1))).toFixed(2) 

  caption.innerHTML = "Your repayment is: " + repayment + " per month!";
}

function bmiMetric() {
  var weight = parseFloat(document.getElementById('weight').value);
  var height = parseFloat(document.getElementById('height').value);
  console.log(weight, height)
  var caption = document.getElementById('bmiM');

  var bmiM = ((weight / Math.pow(height, 2))).toFixed(2); 

  caption.innerHTML = "Your BMI is: " + bmiM + "!";
}

function bmiImperial() {
  var weight = parseFloat(document.getElementById('weight2').value);
  var height = parseFloat(document.getElementById('height2').value);

  var caption = document.getElementById('bmiI');

  var bmiI = ((weight / Math.pow(height, 2))*703).toFixed(2); 

  caption.innerHTML = "Your BMI is: " + bmiI + "!";
}

function trip() {
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




