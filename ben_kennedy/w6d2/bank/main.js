var bankApp = bankApp || {};

bankApp.setup = function() { 
  bankApp.balance = 0;
  bankApp.updateBalance('#checking', bankApp.balance);
  bankApp.updateBalance('#savings', bankApp.balance);
  $('.deposit').click(bankApp.deposit);
  $('.withdraw').click(bankApp.withdraw);
}

bankApp.updateBalance = function(accountTypeID, balance) {  
  $( accountTypeID + ' p.balance' ).html("£ " + balance); 
}

bankApp.deposit = function() {
  accountTypeID = bankApp.getAccountTypeID($(this));
  currentBalance = parseFloat(bankApp.getBalance(accountTypeID));
  deposit = parseFloat($(accountTypeID + " .amount").val());
  newBalance = currentBalance + deposit;
  bankApp.updateBalance(accountTypeID, newBalance);
}

bankApp.withdraw = function() {
  accountTypeID = bankApp.getAccountTypeID($(this));
  currentBalance = parseFloat(bankApp.getBalance(accountTypeID));
  withdraw = parseFloat($(accountTypeID + " .amount").val());
  if (withdraw <= currentBalance) {
    newBalance = currentBalance - withdraw;
    bankApp.updateBalance(accountTypeID, newBalance);  
  }
  else if (accountTypeID == "#checking") {
    bankApp.checkingOverdraft(withdraw, currentBalance);
  }
  else if (accountTypeID == "#savings") {
    bankApp.insufficientFunds();
  }
  else {

  }
}

bankApp.checkingOverdraft = function(withdraw, currentBalance) {
  overdraft = withdraw - currentBalance;
  savingsBalance = bankApp.getBalance('#savings');
  if (overdraft <= savingsBalance) {
    bankApp.updateBalance('#checking', 0); 
    bankApp.updateBalance('#savings', savingsBalance - overdraft )
  } else {
    bankApp.insufficientFunds();
  }
}

bankApp.errors = function(message) {
  $('main').before( "<H2 class='errors'>" + message + "</h2>");
}

bankApp.insufficientFunds = function() {
    bankApp.errors("Insufficient Funds");
}

bankApp.getBalance = function(accountTypeID) {
  return $( accountTypeID + ' p.balance' ).html().substring(2);

}

bankApp.getAccountTypeID = function(buttonObject) {
  accountTypeID = "#" + buttonObject.parent().attr('id');
  return accountTypeID;
}

$(bankApp.setup);