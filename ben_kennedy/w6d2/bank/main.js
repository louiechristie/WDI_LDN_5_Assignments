var bankApp = bankApp || {};

bankApp.setup = function() { 
  bankApp.balance = 0;
  bankApp.updateBalance(bankApp.balance);
  $('.deposit').click(bankApp.deposit);
}




bankApp.updateBalance = function(balance) {  
  $( '.balance' ).html("£ " + balance); 
}

// bankApp.deposit = function(amount, id) {
//   balance = parseInt($( id ).html());
//   deposit = parseInt($( id))
//   updatedBalance = balance
// }

$(bankApp.setup);