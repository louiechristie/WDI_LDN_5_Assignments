var BankApp = {};

BankApp.currentAmount = 0;
BankApp.savingsAmount = 0;

BankApp.displayCurrentAmount = function () {
  $display_current.text(BankApp.currentAmount);
}

BankApp.getDisplayCurrent = function () {
  $display_current = $("#display_current");
}

BankApp.clearCurrentInput = function () {
  $("#current_input").val("");
}

BankApp.displaySavingsAmount = function () {
  $display_savings.text(BankApp.savingsAmount);
}

BankApp.getCurrentInput = function () {
  $current_input = parseFloat($("#current_input").val());
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

  $display_savings = $("#display_savings");
  BankApp.displaySavingsAmount();

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