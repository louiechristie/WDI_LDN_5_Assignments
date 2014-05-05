function calcItMortgage() {
  var principal = parseFloat(document.getElementById("principal").value);
  var apr = parseFloat(document.getElementById("apr").value);
  var number = parseFloat(document.getElementById("number").value);

  var interest = (apr / 12) / 100;

  var interest_sub_calc = Math.pow((1 + interest), number);
  var numerator = interest * interest_sub_calc;
  var denominator = interest_sub_calc - 1;
  var maths = (principal * (numerator / denominator)).toFixed(2);

  var mortgage = document.getElementById("mortgage");
  mortgage.innerHTML = " | Monthly payment amount: ";

  if (principal <= 0 || apr <= 0 || number <= 0) {
    mortgage.innerHTML += "must enter amounts greater than zero."; 
  } else if (isNaN(principal) || isNaN(apr) || isNaN(number)) {
    mortgage.innerHTML += "could not be determined due to invalid inputs.";
  } else if (maths) {
    mortgage.innerHTML += maths;
  } 
}

function calcItBmiImperial() {
  var mass = parseFloat(document.getElementById("imperial_mass").value);
  var height = parseFloat(document.getElementById("imperial_height").value);

  var maths = ((mass / Math.pow(height,2)) * 703).toFixed(2);
  var bmi = document.getElementById("bmi_imperial");
  bmi.innerHTML = " | BMI: ";

  if (isNaN(mass) || isNaN(height)) {
    bmi.innerHTML += "could not be determined due to invalid inputs.";
  } else if (mass <= 0 || height <= 0) {
    bmi.innerHTML += "must enter amounts greater than zero."; 
  } else if (maths) {
    bmi.innerHTML += maths
  }
}

function calcItBmiMetric() {
  var mass = parseFloat(document.getElementById("metric_mass").value);
  var height = parseFloat(document.getElementById("metric_height").value);

  var maths = (mass / Math.pow((height / 100),2)).toFixed(2);
  var bmi = document.getElementById("bmi_metric");
  bmi.innerHTML = " | BMI: ";

  if (isNaN(mass) || isNaN(height)) {
    bmi.innerHTML += "could not be determined due to invalid inputs.";
  } else if (mass <= 0 || height <= 0) {
    bmi.innerHTML += "must enter amounts greater than zero."; 
  } else if (maths) {
    bmi.innerHTML += maths
  }
}

function calcItTrip() {
  var distance = parseFloat(document.getElementById("distance").value);
  var mpg = parseFloat(document.getElementById("mpg").value);
  var cost_per_gallon = parseFloat(document.getElementById("cost_per_gallon").value);
  var mph = parseFloat(document.getElementById("mph").value);

  var trip = document.getElementById("trip");

  if (isNaN(distance) || isNaN(mpg) || isNaN(cost_per_gallon) || isNaN(mph)) {
    trip.innerHTML = " | Cost and time could not be determined due to invalid inputs.";
  } else if (distance <= 0 || mpg <= 0 || cost_per_gallon <= 0 || mph <= 0) {
    trip.innerHTML = " | Must enter amounts greater than zero.";
  } else {
      if (mph > 60) {
        mpg = mpg - (2 * (mph - 60));
      }

      var trip_time = (distance / mph).toFixed(2);
      var trip_cost = ((distance / mpg) * cost_per_gallon).toFixed(2)

      if (trip_cost <= 0) {
        trip_cost = 0;
        trip.innerHTML = " | Cost: " + trip_cost + " Time: " + trip_time + " hours. How economic!";
      } else {
        trip.innerHTML = " | Cost: " + trip_cost + " Time: " + trip_time + " hours. Have a lovely journey.";
      }
  }
}

function calcItTooMany() {
  var too_many = parseInt(document.getElementById("too_many").value);
  array = ["This isn't too many?", "This may be too many.", "Surely this is too many.", "You're right; this does not feel like too many.", "Maybe you really meant this, because this feels like too many.", "Whoops, no, this is too many.", "This is surely very nearly too many.", "Wooo, doggie, this has got to be too many.", "Well, this isn't nearly too many."]

  if (isNaN(too_many) || too_many <= 0) {
    var response = document.getElementById("response");
    response.innerHTML = "| Please enter a number greater than zero.";
  } else {
      for (var i = 0; i < too_many-1; i++) {
        alert(array[Math.floor((Math.random() * array.length))]);
      }
      alert("Yep, too many.");
    }
}


