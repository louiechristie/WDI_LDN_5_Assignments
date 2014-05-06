function isNumber(event) {
  if (event) {
    var charCode = (event.which) ? event.which : event.keyCode;
    if (charCode != 190 && charCode > 31 && 
       (charCode < 48 || charCode > 57) && 
       (charCode < 96 || charCode > 105) && 
       (charCode < 37 || charCode > 40) && 
        charCode != 110 && charCode != 8 && charCode != 46 )
       return false;
  }
  return true;
}

function operator() {
  var numberOne = parseInt(document.getElementById('numberOne').value),
      numberTwo = parseInt(document.getElementById('numberTwo').value),
      operator = document.getElementById('operator').value,
      answer;


  if (numberTwo !== 0) {
    if (operator == "add") {
         answer = numberOne + numberTwo;
    } else if (operator == "subtract") { 
         answer = numberOne - numberTwo;
    } else if (operator == "divide") {
         answer = numberOne / numberTwo;
    } else if (operator == "multiply") {
          answer = numberOne * numberTwo;
    } else if (operator == "squareroot") {
          answer = Math.sqrt(numberOne) 
    }

    printResult('result', answer);
  } else {
    printResult('result', '0');
  }
  
};

function printResult(elementId, message) {
  document.getElementById(elementId).innerText = message;
}


function mortgage() {
  var a = parseFloat(document.getElementById('loan_amount').value);
  var b = parseFloat(document.getElementById('interest_rate').value);
  var c = parseFloat(document.getElementById('number_of_payments').value);
  var d = (1+b);  
  var result = a * b * d / (d-1);

  printResult('mortgage_result', "Your mortgage will be: " + result + "!");
}



function calculateBMI()
{
   var weight = parseFloat(document.getElementById('weight').value);
   var height = parseFloat(document.getElementById('height').value);

   var result = weight  / (height * height);

     printResult( 'BMI', "Your BMI is: " + result + "!");

}


function tripCalculator()
{
   var distance = parseFloat(document.getElementById('distance').value);
   var mpg = parseFloat(document.getElementById('mpg').value);
   var speed = parseFloat(document.getElementById('speed').value);
   var cost = parseFloat(document.getElementById('cost').value);
   var caption = parseFloat.getElementById('tripHours' + 'tripCost');

   var tripHours = distance/speed
   var tripCost = (distance/mpg)*cost

       printResult( 'trip', "Your journey will take  " + tripHours + " hours and will cost " + tripCost + " pounds!");

}

document.getElementById('operator').onchange = function() { 
  if (this.value == 'squareroot') { 
    numberTwo.style.display = 'none'; 
  } else { 
    numberTwo.style.display = ""; 
  } 
};


function validate(type) {
  if (document.feet_or_meters.values.value=='') {
    return false;
  } else {
    if(type=="to_feet") {
      var res=3.2808*document.feet_or_meters.values.value;
          var unit=" feet";
    } else {
      var res=0.3048*document.feet_or_meters.values.value;
      var unit=" meter";
    }
    document.getElementById("result_for_feet_to_meters").innerHTML=res.toFixed(2) + unit;
  }
}


