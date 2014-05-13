var calcit = calcit || {};

calcit.simplemath = function() {

	var a = document.getElementById('numberone');
	var b = document.getElementById('numbertwo');

	 if (isNaN(a.value) || isNaN(b.value)) { 
	 	alert("The values must be numbers");
	 } 
	
	var operator = document.getElementById('operator').value;

	switch(operator) {
		case 'add':
			answer.innerHTML = parseInt(a.value) + parseInt(b.value);
			break;
		case 'subtract':
			answer.innerHTML = parseInt(a.value) - parseInt(b.value);
			break;
		case 'multiply':
			answer.innerHTML = parseInt(a.value) * parseInt(b.value);
			break;
		case 'divide':
			answer.innerHTML = parseInt(a.value) / parseInt(b.value);
			break;
		case 'sqrt':
			answer.innerHTML = Math.sqrt(parseInt(a.value))
			break;	
			
	}
}

calcit.bmi = function() {

	var height = document.getElementById('height');
	var weight = document.getElementById('weight');

	if (isNaN(height.value) || isNaN(weight.value)) { 
	 	alert("The values must be numbers");
	 }

	var bmi = weight.value / (height.value * height.value)

	answer.innerHTML = "You have a BMI of: " + bmi

}

calcit.trip = function() {

	var distance = document.getElementById('distance');
	var mpg = document.getElementById('mpg');
	var fuelcost = document.getElementById('fuelcost');
	var speed = document.getElementById('speed');

	if (isNaN(distance.value) || isNaN(mpg.value) || isNaN(fuelcost.value) || isNaN(speed.value)) { 
	 	alert("The values must all be numbers");
	 }

	var time = parseInt(distance.value) / parseInt(speed.value)
	var cost = (parseInt(distance.value) / parseInt(mpg.value)) * parseInt(fuelcost.value)

	answer.innerHTML = "Your trip will cost $" + cost + ". It will take " + time  + " hours."

}

calcit.mortgage = function() {

	var loanamount = document.getElementById('loanamount');
	var loantime = document.getElementById('loantime');
	var interestrate = document.getElementById('interestrate');

	if (isNaN(loanamount.value) || isNaN(loantime.value) || isNaN(interestrate.value)) { 
	 	alert("The values must all be numbers");
	 }

	var monthlyinterestrate = parseInt(interestrate.value) / 12;
	var numberofpayments = parseInt(loantime.value) * 12;
	var loanterm = Math.pow((1 + monthlyinterestrate), numberofpayments);

	var monthlypayments = loanamount * (monthlyinterestrate * loanterm) / (loanterm - 1);

	answer.innerHTML = "Your monthly payment amount is: " + monthlypayments

}

calcit.power = function() {

	var power = document.getElementById('power');

	if (isNaN(power.value)) { 
	 	alert("The value must be a number");
	 }

	var result = Math.pow(power.value, 10);

	answer.innerHTML = result

}

calcit.setup = function() {
var buttonone = document.getElementById('one');
buttonone.addEventListener('click', calcit.simplemath);
var buttontwo = document.getElementById('two');
buttontwo.addEventListener('click', calcit.bmi);
var buttonthree = document.getElementById('three');
buttonthree.addEventListener('click', calcit.trip);
var buttonfour = document.getElementById('four');
buttonfour.addEventListener('click', calcit.mortgage);
var buttonfive = document.getElementById('five');
buttonfive.addEventListener('click', calcit.power);

}

document.addEventListener('DOMContentLoaded', calcit.setup);

calcit.setup();