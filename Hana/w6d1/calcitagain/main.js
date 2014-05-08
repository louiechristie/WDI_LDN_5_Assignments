function maths(){
  var sel = document.getElementById("operations");
  var selTitle = sel.options[sel.selectedIndex].value;

  switch(selTitle){
    case "+":
      addition();
      break;
    case "-":
      subtraction();
      break;
    case "*":
      multiplication();
      break;
    case "/":
      division();
      break;
    case "Square":
      square();
      break;
    default:
      break; 
  }
}

function addition(){
  var firstInt = parseInt(document.getElementById("firstNumber").value);
  var secondInt = parseInt(document.getElementById("secondNumber").value);
  var result = firstInt + secondInt;
  answer(result);
 
}

function subtraction(){
  var firstInt = parseInt(document.getElementById("firstNumber").value);
  var secondInt = parseInt(document.getElementById("secondNumber").value);
  answer(firstInt - secondInt);
}

function multiplication(){
  var firstInt = parseInt(document.getElementById("firstNumber").value);
  var secondInt = parseInt(document.getElementById("secondNumber").value);
  answer(firstInt * secondInt);
}

function division(){
  var firstInt = parseInt(document.getElementById("firstNumber").value);
  var secondInt = parseInt(document.getElementById("secondNumber").value);
  answer(firstInt / secondInt);
}

function square(){
  var firstInt = parseInt(document.getElementById("firstNumber").value);
  var secondInt = parseInt(document.getElementById("secondNumber").value);
  answer(Math.sqrt(firstInt));

}

function answer(result){
  var caption = document.getElementById('answer');
  caption.innerHTML = result;
}
