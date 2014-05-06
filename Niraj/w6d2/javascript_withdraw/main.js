var myApp = myApp || {}


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

myApp.deposit_to_checkings = function(event) {
  event.preventDefault();
  var amount = parseInt($('#balance_checkings').val());
  var balance = parseInt($('#amount_checkings').val());

  document.getElementById('balance_checkings').value=(balance + amount)

}

myApp.withdraw_from_checkings = function() {
  event.preventDefault();

  var amount = parseInt($('#balance_checkings').val());
  var balance = parseInt($('#amount_checkings').val());
  var newbalance = amount - balance
  var savingsbalance = parseInt($('#savingsOutput').val());

  if (newbalance < 0 ){
    alert("You do not have enough money to withdraw the requested amount, we will try to deduct from your savings account.");
    var newbalance = Math.abs(newbalance);
    var newsavingsbalance = savingsbalance - newbalance;

      if (newsavingsbalance < 0) {
        alert("Sorry, you do not have enough money, please deposit some money.");
      } else {
          $('#savingsOutput').val(savingsbalance - newbalance);
          $('#amount_checkings').val(balance - balance);
      }
  } else {
  document.getElementById('balance_checkings').value=(amount - balance);
  }
  
}






myApp.deposit_to_savings = function(event) {
  event.preventDefault();
  var amount = parseInt($('#savings_amount').val());
  var balance = parseInt($('#savings_balance').val());

  document.getElementById('savings_balance').value=(balance + amount)

}

myApp.withdraw_to_savings = function() {
  event.preventDefault();
  var amount = parseInt($('#savings_amount').val());
  var balance = parseInt($('#savings_balance').val());

  document.getElementById('savings_balance').value=(balance - amount);
}


myApp.setup = function() {
    event.preventDefault();
$('#deposit_to_checkings').on('click', myApp.deposit_to_checkings);
$('#withdraw_from_checkings').on('click', myApp.withdraw_from_checkings);
$('#deposit_to_savings').on('click', myApp.deposit_to_savings);
$('#withdraw_to_savings').on('click', myApp.withdraw_to_savings);


}





$(document).ready(function() {
myApp.setup();
});
