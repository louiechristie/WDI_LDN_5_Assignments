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