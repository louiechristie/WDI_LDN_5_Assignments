var myApp = myApp || {};

myApp.balance = function() {
  if (arguments.length == 0) {
    var balance = parseFloat($('#checking .amount').text());
    console.log("balance() balance: "+balance);
    return balance;
  }
  if (arguments.length > 0) {
    console.log("setBalance("+arguments[0]+")");
    $('#checking .amount').text(arguments[0])  
  }
}

myApp.deposit = function() {
  var amount = parseFloat($('#checking .input').val());
  var balance = myApp.balance();
  console.log("deposit(): "+amount);
  myApp.balance(balance+amount);
}

myApp.withdraw = function() {
  var amount = parseFloat($('#checking .input').val());
  var balance = myApp.balance();
  console.log("withdraw(): "+amount);
  myApp.balance(balance-amount);
}

myApp.setup = function() {
  console.log("setup()");
  $('.amount').text("0");
  $('.input').val("0");

  var $checking_deposit_button = $('#checking .deposit');
  $checking_deposit_button.click(function () { myApp.deposit(); });
  var $checking_withdraw_button = $('#checking .withdraw');
  $checking_withdraw_button.click(function () { myApp.withdraw(); });
}

$(myApp.setup);