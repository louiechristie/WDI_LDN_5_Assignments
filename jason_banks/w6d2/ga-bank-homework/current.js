var BankApp = {};

BankApp.currentAmount = 0;


BankApp.getCurrentInput = function () {
  $current_input = parseFloat($("#current_input").val());
}

BankApp.getDisplayCurrent = function () {
  $display_current = $("#display_current");
}

BankApp.displayCurrentAmount = function () {
  $display_current.text(BankApp.currentAmount);
}

BankApp.clearCurrentInput = function () {
  $("#current_input").val("");
}


BankApp.reduceCurrentAmount = function () {
  BankApp.getCurrentInput();
  BankApp.getDisplayCurrent();
  BankApp.currentAmount -= $current_input;

  BankApp.displayCurrentAmount();
  BankApp.clearCurrentInput();
}

BankApp.increaseCurrentAmount = function () {
  BankApp.getCurrentInput();
  BankApp.getDisplayCurrent();
  BankApp.currentAmount += $current_input;

  BankApp.displayCurrentAmount();
  BankApp.clearCurrentInput();
}


BankApp.setup = function () {
  $display_current = $("#display_current");
  BankApp.displayCurrentAmount();

  
  $("#current_withdraw_button").click( function (ev) {
    ev.preventDefault();
    BankApp.reduceCurrentAmount();
  });
  
$("#current_deposit_button").click( function (ev) {
    ev.preventDefault();
    BankApp.increaseCurrentAmount();
  });
  
}

$(document).ready(BankApp.setup);