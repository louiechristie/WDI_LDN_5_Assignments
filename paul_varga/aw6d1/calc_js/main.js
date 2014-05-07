var myApp = myApp || {};

myApp.calc = function() {
  var a = parseFloat(document.getElementById('first_number').value);
  var b = parseFloat(document.getElementById('second_number').value);
  var caption = document.getElementById('result');

  var sel = document.getElementById('operations');
  var selTitle = sel.options[sel.selectedIndex].value;

    switch(selTitle) {
      case 'add':
        var result = (a + b).toFixed(2);
        break;
      case 'subtract':
        var result = (a - b).toFixed(2);
        break;
      case 'multiply':
        var result = (a * b).toFixed(2);
        break;
      case 'divide':
        var result = (a / b).toFixed(2);
        break;
      case 'squareRoot':
        var result = (Math.sqrt(a)).toFixed(2);
        break;
      default: 
        break; 
    }
  caption.innerHTML = "Your result is: " + result + "!";
}

myApp.setup = function() {
  var button = document.getElementById('calc');
  button.addEventListener('click', myApp.calc);
}

document.addEventListener('DOMContentLoaded', myApp.setup);





