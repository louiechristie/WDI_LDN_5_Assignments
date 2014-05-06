var myApp = myApp || {};


myApp.addToCurrent = function() {
  var input = parseInt($('#amountCurrent').val());
  var balance = parseInt($('#currentOutput').val());

  if (balance == parseInt(balance)) {
    balance = parseInt($('#currentOutput').val());
  } else {
      balance = 0;
  }

  $('#currentOutput').val(balance + input);
  
}

myApp.withdrawFromCurrent = function() {
  var input = parseInt($('#amountCurrent').val());
  var balance = parseInt($('#currentOutput').val());

  if (balance == parseInt(balance)) {
    balance = parseInt($('#currentOutput').val());
  } else {
      balance = 0;
  }

  if (balance > 0) {
    balance = $('#currentOutput').val(balance - input);
  } else {
    balance = 0;
    alert("You currently have no overdraft - call your bank manager.");
  }
  
}

myApp.addToSavings = function() {
  var input = parseInt($('#amountSavings').val());
  var balance = parseInt($('#savingsOutput').val());

  if (balance == parseInt(balance)) {
    balance = parseInt($('#savingsOutput').val());
  } else {
      balance = 0;
  }

  $('#savingsOutput').val(balance + input);
  
}


myApp.withdrawFromSavings = function() {
  var input = parseInt($('#amountSavings').val());
  var balance = parseInt($('#savingsOutput').val());

  if (balance == parseInt(balance)) {
    balance = parseInt($('#savingsOutput').val());
  } else {
      balance = 0;
  }

  if (balance > 0) {
    balance = $('#savingsOutput').val(balance - input);
  } else {
    balance = 0;
    alert("You currently have no overdraft - call your bank manager.");
  }
  
}

myApp.setup = function() {
  $('#addCurrent').on('click', myApp.addToCurrent);
  $('#withdrawCurrent').on('click', myApp.withdrawFromCurrent);
  $('#addSavings').on('click', myApp.addToSavings);
  $('#withdrawSavings').on('click', myApp.withdrawFromSavings);
}

$(myApp.setup);

myApp.setup();