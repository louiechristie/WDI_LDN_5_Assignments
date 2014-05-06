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
  var currentbalance = parseInt($('#currentOutput').val());
  var newbalance = currentbalance - input
  var savingsbalance = parseInt($('#savingsOutput').val());


  if (currentbalance == parseInt(currentbalance)) {
    currentbalance = parseInt($('#currentOutput').val());
  } else {
      currentbalance = 0;
  }

  if (newbalance < 0 ){
    alert("You cannot withdraw this amount, but we will try to access your savings.");
    var newbalance = Math.abs(newbalance);
    var newsavingsbalance = savingsbalance - newbalance;
    console.log(newsavingsbalance);
      if (newsavingsbalance < 0) {
        alert("You do not have enough money in your savings. No withdrawl possible.");
      } else {
          $('#savingsOutput').val(savingsbalance - newbalance);
          $('#currentOutput').val(currentbalance - currentbalance);
      }
  } else {
    newbalance = $('#currentOutput').val(currentbalance - input);
  }
  
}




// if ($newsavingsbalance < 0) {
// alert("You do not have enough money in your savings. Withdrawl cannot be made.");
// } else {
// document.getElementById('balance-savings').value=($savingsbalance - $newbalance);
// document.getElementById('balance-current').value=($currentbalance - $currentbalance);
// }
// } else {
// document.getElementById('balance-current').value=($currentbalance - $amount);
// }
// }

//SAMS START

// myApp.currentwithdraw = function() {

// var $amount = parseInt($('#amount-current').val());
// var $currentbalance = parseInt($('#balance-current').val());
// var $newbalance = $currentbalance - $amount
// var $savingsbalance = parseInt($('#balance-savings').val());

// if ($newbalance < 0) {
// alert("You cannot withdraw this much money from this account. We will attempt to take the remainder from your savings.");
// var $newbalance = Math.abs($newbalance);
// var $newsavingsbalance = $savingsbalance - $newbalance;


myApp.addToSavings = function() {
  var input = parseInt($('#amountSavings').val());
  var savingsBalance = parseInt($('#savingsOutput').val());

  if (savingsBalance == parseInt(savingsBalance)) {
    savingsBalance = parseInt($('#savingsOutput').val());
  } else {
      savingsBalance = 0;
  }

  $('#savingsOutput').val(savingsBalance + input);
  
}


myApp.withdrawFromSavings = function() {
  var input = parseInt($('#amountSavings').val());
  var savingsBalance = parseInt($('#savingsOutput').val());

  if (savingsBalance == parseInt(savingsBalance)) {
    savingsBalance = parseInt($('#savingsOutput').val());
  } else {
      savingsBalance = 0;
  }

  if (savingsBalance > 0) {
    savingsBalance = $('#savingsOutput').val(savingsBalance - input);
  } else {
    savingsBalance = 0;
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