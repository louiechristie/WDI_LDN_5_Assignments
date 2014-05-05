function calc() {
  var a = parseInt(document.getElementById('first_number').value);
  var b = parseInt(document.getElementById('second_number').value);
  var caption = document.getElementById('result');

  var sel = document.getElementById('operations');
  var selTitle = sel.options[sel.selectedIndex].value;

    switch(selTitle) {
      case 'add':
        var result = a + b;
        break;
      case 'subtract':
        var result = a - b;
        break;
      case 'multiply':
        var result = a * b;
      case 'divide':
        var result = a / b;
      case 'squareRoot':
        var result = Math.sqrt(a);
      default: 
        break; 
    }
  caption.innerHTML = "Your result is: " + result + "!";
}

function mortgage() {
  var principal = parseInt(document.getElementById('principal').value);
  var yearlyInterestRate = parseInt(document.getElementById('yearlyInterestRate').value) / 1200;
  var numberOfYears = parseInt(document.getElementById('numberOfYears').value) * 12;

  var caption = document.getElementById('repayment');

  var repayment = (principal * ((yearlyInterestRate * Math.pow((1 + yearlyInterestRate), numberOfYears) / (Math.pow((1 + yearlyInterestRate), numberOfYears))  -1)))            



  caption.innerHTML = "Your repayment is: " + repayment + "!";
}













