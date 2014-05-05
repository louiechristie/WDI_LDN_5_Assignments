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

  var maths = (mass / Math.pow(height,2)) * 703;
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

  var maths = mass / Math.pow((height / 100),2);
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

//   var metric_mass = parseFloat(document.getElementById("metric_mass").value);
//   var metric_height = parseFloat(document.getElementById("metric_height").value);





//   @imperial_mass = params[:imperial_mass].to_f
//   imperial_height = params[:imperial_height].to_f

//   @metric_mass = params[:metric_mass].to_f
//   metric_height = params[:metric_height].to_f

//   if params[:metric_mass] && params[:imperial_mass].empty?
//     @metric_result = @metric_mass / (metric_height**2)
//   elsif params[:imperial_mass] && params[:metric_mass].empty?
//     @imperial_result = (@imperial_mass / (imperial_height**2)) * 703
//   else
//     @nothing = true
//   end
// }