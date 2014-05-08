var gaBank = gaBank || {},
    balance = 0;

gaBank.update = function() {
    $('h1').text('$' + balance);
    $('#amount').val("");
  }

  gaBank.deposit = function() {
    var amount = $('#amount').val();
    balance = parseInt(amount) + balance; 
  }

  gaBank.withdraw = function() {
    var amount = $('#amount').val();
    balance = balance - parseInt(amount);
  }

// get input from user -
// storing it in a variable -
// we want to update <h1>

// update is either depositing (adding) or withdrwaing (subtracting)

// the way we update:
// 1. is by tracking a 'click' event on a a button
// 2. 

gaBank.setup = function(){
  var depositButton = $("#deposit");
  var withdrawButton = $("#withdraw");
  

  depositButton.on('click', function() {
    gaBank.deposit();
    gaBank.update();
  });

  withdrawButton.on('click', function() {
    gaBank.withdraw();
    gaBank.update();
  });
}


$(function(){
  gaBank.setup();
});



