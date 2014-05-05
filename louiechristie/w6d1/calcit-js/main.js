
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
    alert("Select an operation.");
  }


}

function add(){

  var first_number = document.getElementById('first_number');
  var first_number = document.getElementById('first_number');
  var result = document.getElementById('result');

  
  result.innerHTML = parseInt(first_number.value) + parseInt(second_number.value);

}

function subtract(){

  var first_number = document.getElementById('first_number');
  var first_number = document.getElementById('first_number');
  var result = document.getElementById('result');

  
  result.innerHTML = parseInt(first_number.value) - parseInt(second_number.value);

}

function divide(){

  var first_number = document.getElementById('first_number');
  var first_number = document.getElementById('first_number');
  var result = document.getElementById('result');

  
  result.innerHTML = parseInt(first_number.value) / parseInt(second_number.value);

}

function multiply(){

  var first_number = document.getElementById('first_number');
  var first_number = document.getElementById('first_number');
  var result = document.getElementById('result');

  
  result.innerHTML = parseInt(first_number.value) * parseInt(second_number.value);

}

function root(){

  var first_number = document.getElementById('first_number');
  var first_number = document.getElementById('first_number');
  var result = document.getElementById('result');

  
  result.innerHTML = Math.sqrt(parseInt(first_number.value));

}