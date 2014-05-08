var calcField = "";

function updateScreen() {
  document.getElementById('calc').value = calcField;
}

function clearScreen() {
  calcField = "";
  updateScreen();
}

function digit(input) {
  calcField = calcField + input;
  updateScreen();
}

var savedValue = ""

function add() {
  savedValue = calcField + "+";
  clearScreen();
}

function subtract() {
  savedValue = calcField + "-";
  clearScreen();
}

function multiply() {
  savedValue = calcField + "*";
  clearScreen();
}

function divide() {
  savedValue = calcField + "/";
  clearScreen();
}

function sqrt() {
  calcField = Math.sqrt(parseFloat(calcField));
  updateScreen();
}

function equals() {
  operator = savedValue.slice(savedValue.length - 1, savedValue.length);
  firstValue = savedValue.slice(0, savedValue.length -1); 
  if (operator == "+"){
    calcField = (parseFloat(firstValue) + parseFloat(calcField)).toString();  
  }
    if (operator == "-"){
    calcField = (parseFloat(firstValue) - parseFloat(calcField)).toString();  
  }
    if (operator == "*"){
    calcField = (parseFloat(firstValue) * parseFloat(calcField)).toString();  
  }
    if (operator == "/"){
    calcField = (parseFloat(firstValue) / parseFloat(calcField)).toString();  
  }
  updateScreen();
}

var specialType = "";

function mortgageDisplay() {
  basicHide();
  bmiHide();
  tripHide()
  var mortgage = document.getElementsByClassName('mortgage');
  for (var i=0; i < mortgage.length; i++) {
    mortgage[i].style.display = 'inline-block';
}
}
function mortgageHide() {
  var mortgage = document.getElementsByClassName('mortgage');
  for (var i=0; i < mortgage.length; i++) {
    mortgage[i].style.display = 'none';
}
}

function mortgageCalc() {
  var principal = parseFloat(document.getElementById('principal').value);
  var rate = parseFloat(document.getElementById('rate').value) / 100 / 12;
  var payments = parseFloat(document.getElementById('years').value)  * 12;
  var payment = (principal * ((rate * Math.pow((1 + rate), payments)/(Math.pow((1 + rate), payments) - 1))));
  document.getElementById('monthly_payment').innerHTML = "Estimated Monthly Payment: £" + Math.round(payment).toString(); 
}

function bmiDisplay() {
  basicHide();
  tripHide();
  mortgageHide();
  var bmi = document.getElementsByClassName('bmi');
  for (var i=0; i < bmi.length; i++) {
    bmi[i].style.display = 'inline-block';
}
}
function bmiHide() {
  var bmi = document.getElementsByClassName('bmi');
  for (var i=0; i < bmi.length; i++) {
    bmi[i].style.display = 'none';
}
}

function defBMIMetric() {
  document.getElementById('bmi weight-units').innerHTML = "kg";
  document.getElementById('bmi height-units').innerHTML = "m";
}

function defBMIImperial() {
  document.getElementById('bmi weight-units').innerHTML = "pounds";
  document.getElementById('bmi height-units').innerHTML = "inches";
}

function bmiCalc() {
  var bmiweight = parseFloat(document.getElementById('weight').value);
  var bmiheight = parseFloat(document.getElementById('height').value);
  if (document.getElementById('bmi-type').value == "imperial") {
    var bmi = (703 * bmiweight / Math.pow(bmiheight, 2));
  }
  if (document.getElementById('bmi-type').value == "metric") {
    var bmi = bmiweight / Math.pow(bmiheight, 2);
}
  document.getElementById('bmi_index').innerHTML = "BMI Index: " + (Math.round(bmi)).toString();
}

function tripDisplay() {
  mortgageHide();
  bmiHide();
  basicHide();
  var trip = document.getElementsByClassName('trip');
  for (var i=0; i < trip.length; i++) {
    trip[i].style.display = 'inline-block';
}
}
function tripHide() {
  var trip = document.getElementsByClassName('trip');
  for (var i=0; i < trip.length; i++) {
    trip[i].style.display = 'none';
}
}
function basicHide() {
  var basic = document.getElementsByClassName('basic');
  for (var i=0; i < basic.length; i++) {
    basic[i].style.display = 'none';
}
}

function tripCalc() {
  var distance = parseFloat(document.getElementById('distance').value);
  var speed = parseFloat(document.getElementById('speed').value);
  var mpg = parseFloat(document.getElementById('mpg').value);
  var mpg = Math.max(5, mpg - Math.max((speed - 60), 0) * 2);
  var price = parseFloat(document.getElementById('price').value);
  var time = (distance / speed);
  var cost = (distance / mpg * price);
  document.getElementById('trip_details').innerHTML = "Your trip will take " + time + " hours and will cost $" + cost + ". The trip's average fuel efficiency will be: " + mpg + "mpg.";
}

  


 // @distance = params[:distance].to_f
 //  @speed = params[:speed].to_f
 //  @mpg = [5, params[:mpg].to_f - (@speed - 60) * 2].min.to_f if params[:mpg]
 //  @price = params[:price].to_f
 //  @time = (@distance.to_f / @speed).round(1)
 //  @cost = (@distance / @mpg * @price).round(0) if params[:mpg]


