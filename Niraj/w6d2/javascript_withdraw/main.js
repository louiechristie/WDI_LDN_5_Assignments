var myApp = myApp || {}

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

  document.getElementById('balance_checkings').value=(amount - balance);

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
