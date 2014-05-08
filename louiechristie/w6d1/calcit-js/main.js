
function calculate() {
  var selectBox = document.getElementById("selectBox");
  var selectedValue = selectBox.options[selectBox.selectedIndex].value;

  switch(selectedValue)
  {
  case "add":
    add();
    break;
  case "subtract":
    subtract();
    break;
  case "divide":
    divide();
    break;
  case "multiply":
    multiply();
    break;
  case "root":
    var second_number_section = document.getElementById("second_number_section")
    second_number_section.setAttribute('style', 'display: none');
    root();
    break;
  default:
    result.innerHTML = "Select an operation.";
  }
}

function has_bad_input() {
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

function add() {

  var first_number = document.getElementById('first_number');
  var first_number = document.getElementById('first_number');
  var result = document.getElementById('result');

  
  if (!has_bad_input()) { 
    result.innerHTML = parseInt(first_number.value) + parseInt(second_number.value);
  }

}

function subtract(){

  var first_number = document.getElementById('first_number');
  var first_number = document.getElementById('first_number');
  var result = document.getElementById('result');

  
  if (!has_bad_input()) { 
    result.innerHTML = parseInt(first_number.value) - parseInt(second_number.value);
  }

}

function divide(){

  var first_number = document.getElementById('first_number');
  var first_number = document.getElementById('first_number');
  var result = document.getElementById('result');

  
  if (!has_bad_input()) { 
    result.innerHTML = parseInt(first_number.value) / parseInt(second_number.value);
  }

}

function multiply(){

  var first_number = document.getElementById('first_number');
  var first_number = document.getElementById('first_number');
  var result = document.getElementById('result');

  
  if (!has_bad_input()) { 
    result.innerHTML = parseInt(first_number.value) * parseInt(second_number.value);
  }

}

function root(){

  var first_number = document.getElementById('first_number');
  var first_number = document.getElementById('first_number');
  var result = document.getElementById('result');

  
  result.innerHTML = Math.sqrt(parseInt(first_number.value));

}