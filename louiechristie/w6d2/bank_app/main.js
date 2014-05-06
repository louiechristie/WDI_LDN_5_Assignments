var myApp = myApp || {};

myApp.checkingBalance = function() {
  if (arguments.length == 0) {
    var balance = parseFloat($('#checking .amount').text());
    return balance;
  }
  if (arguments.length > 0) {
    $('#checking .amount').text(arguments[0])  
  }
}

myApp.checkingDeposit = function() {
  var amount = parseFloat($('#checking .input').val());
  if (!isNaN(amount)) {
    var balance = myApp.checkingBalance();
    myApp.checkingBalance(balance+amount);
  }
}

myApp.checkingWithdraw = function() {
  var amount = parseFloat($('#checking .input').val());
  var balance = myApp.checkingBalance();
  var combined_balance = myApp.checkingBalance() + myApp.savingBalance();
  if (!isNaN(amount)) {
    if (balance >= amount) {
      myApp.checkingBalance(balance-amount);
    }
    else {
      if (combined_balance >= amount) {
        var amount_off_checking = balance;
        var amount_off_savings = amount - balance;



        myApp.savingBalance(myApp.savingBalance()-amount_off_savings)
        myApp.checkingBalance(0);

      }
    }

  }
}

myApp.savingBalance = function() {
  if (arguments.length == 0) {
    var balance = parseFloat($('#saving .amount').text());
    return balance;
  }
  if (arguments.length > 0) {
    $('#saving .amount').text(arguments[0])  
  }
}

myApp.savingDeposit = function() {
  var amount = parseFloat($('#saving .input').val());
  if (!isNaN(amount)) {
    var balance = myApp.savingBalance();
    myApp.savingBalance(balance+amount);
  }
}

myApp.savingWithdraw = function() {
  var amount = parseFloat($('#saving .input').val());
  var balance = myApp.savingBalance();
  if (!isNaN(amount)) {
    if (balance >= amount) {
      myApp.savingBalance(balance-amount);
    }
  }
}

myApp.setup = function() {
  $('.amount').text("0");
  $('.input').val("0");

  var $checking_deposit_button = $('#checking .deposit');
  var $checking_withdraw_button = $('#checking .withdraw');
  var $saving_deposit_button = $('#saving .deposit');
  var $saving_withdraw_button = $('#saving .withdraw');
  $checking_deposit_button.click(function () { myApp.checkingDeposit(); });
  $checking_withdraw_button.click(function () { myApp.checkingWithdraw(); });
  $saving_deposit_button.click(function () { myApp.savingDeposit(); });
  $saving_withdraw_button.click(function () { myApp.savingWithdraw(); });
}

$(myApp.setup);