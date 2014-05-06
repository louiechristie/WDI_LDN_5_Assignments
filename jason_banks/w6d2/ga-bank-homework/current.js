var BankCurrent = {};

BankCurrent.currentAmount = 0;

BankCurrent.getCurrentInput = function () {
  $current_input = parseFloat($("#current_input").val());
}

BankCurrent.getDisplayCurrent = function () {
  $display_current = $("#display_current");
}

BankCurrent.displayCurrentAmount = function () {
  $display_current.text(BankCurrent.currentAmount);
}

BankCurrent.clearCurrentInput = function () {
  $("#current_input").val("");
}


BankCurrent.reduceCurrentAmount = function () {
  BankCurrent.getCurrentInput();
  BankCurrent.getDisplayCurrent();
  BankCurrent.currentAmount -= $current_input;

  BankCurrent.displayCurrentAmount();
  BankCurrent.clearCurrentInput();
}

BankCurrent.increaseCurrentAmount = function () {
  BankCurrent.getCurrentInput();
  BankCurrent.getDisplayCurrent();
  BankCurrent.currentAmount += $current_input;

  BankCurrent.displayCurrentAmount();
  BankCurrent.clearCurrentInput();
}

BankCurrent.setup = function () {
  BankCurrent.getDisplayCurrent();
  BankCurrent.displayCurrentAmount();
  
  $("#current_withdraw_button").click( function (ev) {
    ev.preventDefault();
    BankCurrent.reduceCurrentAmount();
  });
  
$("#current_deposit_button").click( function (ev) {
    ev.preventDefault();
    BankCurrent.increaseCurrentAmount();
  });
  
}

$(document).ready(BankCurrent.setup);