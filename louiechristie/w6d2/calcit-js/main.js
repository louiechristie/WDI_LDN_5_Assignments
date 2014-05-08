(function (){

var myApp = myApp || {};

myApp.calculate = function() {
  var selectBox = document.getElementById("selectBox");
  var selectedValue = selectBox.options[selectBox.selectedIndex].value;

  switch(selectedValue)
  {
  case "add":
    myApp.add();
    break;
  case "subtract":
    myApp.subtract();
    break;
  case "divide":
    myApp.divide();
    break;
  case "multiply":
    myApp.multiply();
    break;
  case "root":
    var second_number_section = document.getElementById("second_number_section")
    second_number_section.setAttribute('style', 'display: none');
    myApp.root();
    break;
  }
}

myApp.has_bad_input = function() {
  var first_number = document.getElementById('first_number');
  var first_number = document.getElementById('first_number');
  var result = document.getElementById('result');

  if (isNaN(first_number.value) || isNaN(second_number.value)) {

    result.innerHTML = "Errors:"


    if (isNaN(first_number.value)) {
      result.innerHTML = result.innerHTML + " First number '" + first_number.value + "' is not a number."
    }
    if (isNaN(second_number.value)) {
      result.innerHTML = result.innerHTML + " Second number '" + second_number.value + "' is not a number."
    }

    return true;
  }
  else {
    return false;
  }
}

myApp.add = function() {

  var first_number = document.getElementById('first_number');
  var first_number = document.getElementById('first_number');
  var result = document.getElementById('result');

  
  if (!myApp.has_bad_input()) { 
    result.innerHTML = parseInt(first_number.value) + parseInt(second_number.value);
  }

}

myApp.subtract = function() {

  var first_number = document.getElementById('first_number');
  var first_number = document.getElementById('first_number');
  var result = document.getElementById('result');

  
  if (!myApp.has_bad_input()) { 
    result.innerHTML = parseInt(first_number.value) - parseInt(second_number.value);
  }

}

myApp.divide = function() {

  var first_number = document.getElementById('first_number');
  var first_number = document.getElementById('first_number');
  var result = document.getElementById('result');

  
  if (!myApp.has_bad_input()) { 
    result.innerHTML = parseInt(first_number.value) / parseInt(second_number.value);
  }

}

myApp.multiply = function() {

  var first_number = document.getElementById('first_number');
  var first_number = document.getElementById('first_number');
  var result = document.getElementById('result');

  
  if (!myApp.has_bad_input()) { 
    result.innerHTML = parseInt(first_number.value) * parseInt(second_number.value);
  }

}

myApp.root = function() {

  var first_number = document.getElementById('first_number');
  var first_number = document.getElementById('first_number');
  var result = document.getElementById('result');

  
  result.innerHTML = Math.sqrt(parseInt(first_number.value));
}

myApp.setup = function() {
  var button = document.getElementById('calculate');
  button.addEventListener('click', myApp.calculate);
}

myApp.setup();
})();