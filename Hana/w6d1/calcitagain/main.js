
var myApp = myApp || {}

myApp.numberoftextfields = function(){
  var sel = document.getElementById("operations");
  var selTitle = sel.options[sel.selectedIndex].value;

  if(selTitle == "Square"){
    document.getElementById("secondNumber").setAttribute("style","display:none");
  }
}

myApp.maths = function(){
  var sel = document.getElementById("operations");
  var selTitle = sel.options[sel.selectedIndex].value;

  switch(selTitle){
    case "+":
      myApp.addition();
      break;
    case "-":
      myApp.subtraction();
      break;
    case "*":
      myApp.multiplication();
      break;
    case "/":
      myApp.division();
      break;
    case "Square":
      myApp.square();
      break;
    default:
      break; 
  }
}

myApp.addition = function(){
  var firstInt = parseInt(document.getElementById("firstNumber").value);
  var secondInt = parseInt(document.getElementById("secondNumber").value);
  var result = firstInt + secondInt;
  myApp.answer(result);
}

myApp.subtraction = function(){
  var firstInt = parseInt(document.getElementById("firstNumber").value);
  var secondInt = parseInt(document.getElementById("secondNumber").value);
  myApp.answer(firstInt - secondInt);
}

myApp.multiplication = function(){
  var firstInt = parseInt(document.getElementById("firstNumber").value);
  var secondInt = parseInt(document.getElementById("secondNumber").value);
  myApp.answer(firstInt * secondInt);
}

myApp.division = function(){
  var firstInt = parseInt(document.getElementById("firstNumber").value);
  var secondInt = parseInt(document.getElementById("secondNumber").value);
  myApp.answer(firstInt / secondInt);
}

myApp.square = function(){
  var firstInt = parseInt(document.getElementById("firstNumber").value);
  var secondInt = parseInt(document.getElementById("secondNumber").value);
  myApp.answer(Math.sqrt(firstInt));
}

 myApp.answer = function(result){
  var caption = document.getElementById('answer');
  caption.innerHTML = result;
}

myApp.setup = function(){
  var operationsinput = document.getElementById("operations");
  operationsinput.addEventListener("onchange", myApp.numberoftextfields);
  var button = document.getElementById("basicbutton");
  button.addEventListener('click', myApp.maths);
}

  myApp.setup();
  


