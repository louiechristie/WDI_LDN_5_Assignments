var bankApp = bankApp || {};

bankApp.savingWithdrawCalc = function (withdrawl) {
  $saving = $('#saving');
  amount = parseInt($saving.html());
  new_amount = Math.max(0, amount - withdrawl);
  if(!(new_amount == amount)) {
      $('#saving_box').toggleClass('spin');
  };
  $saving.html(new_amount);
}

bankApp.savingWithdraw = function () {
  withdrawl =  parseInt($('#saving_withdraw').val()) || 0;
  bankApp.savingWithdrawCalc(withdrawl)
}

bankApp.currentWithdraw = function () {

  $current = $('#current');
  withdrawl = parseInt($('#current_withdraw').val()) || 0;
  amount = parseInt($current.html());
  new_amount = Math.max(0, amount - withdrawl);
  if(!(new_amount == amount)) {
      $('#current_box').toggleClass('spin');
  };
  $current.html(new_amount);
  bankApp.savingWithdrawCalc(Math.max(0,withdrawl - amount));
}

bankApp.currentDeposit = function() {
  $current = $('#current');
  deposit = parseInt($('#current_withdraw').val()) || 0;
  amount = parseInt($current.html());
  new_amount = Math.max(0, amount + deposit);
  if(!(new_amount == amount)) {
      $('#current_box').toggleClass('spin');
  };
  $current.html(new_amount);
}

bankApp.savingDeposit = function() {
  $saving = $('#saving');
  deposit = parseInt($('#saving_withdraw').val()) || 0;
  amount = parseInt($saving.html());
  new_amount = Math.max(0, amount + deposit);
  if(!(new_amount == amount)) {
      $('#saving_box').toggleClass('spin');
  };
  $saving.html(new_amount);
}

bankApp.setup = function(){
  $('#saving_button').on('click',bankApp.savingWithdraw);
  $('#current_button').on('click',bankApp.currentWithdraw);
  $('#saving_deposit_button').on('click',bankApp.savingDeposit);
  $('#current_deposit_button').on('click',bankApp.currentDeposit);
}


$(bankApp.setup)