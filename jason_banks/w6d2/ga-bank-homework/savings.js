var BankApp = {};

BankApp.savingsAmount = 0;

BankApp.getSavingsInput = function () {
  $savings_input = parseFloat($("#savings_input").val());
}

BankApp.getDisplaySavings = function () {
  $display_savings = $("#display_savings");
}

BankApp.displaySavingsAmount = function () {
  $display_savings.text(BankApp.savingsAmount);
}

BankApp.clearSavingsInput = function () {
  $("#savings_input").val("");
}

BankApp.reduceSavingsAmount = function () {
  BankApp.getSavingsInput();
  BankApp.getDisplaySavings();
  BankApp.savingsAmount -= $savings_input;

  BankApp.displaySavingsAmount();
  BankApp.clearSavingsInput();
}

BankApp.increaseSavingsAmount = function () {
  BankApp.getSavingsInput();
  BankApp.getDisplaySavings();
  BankApp.savingsAmount += $savings_input;

  BankApp.displaySavingsAmount();
  BankApp.clearSavingsInput();
}

BankApp.setup = function () {
  $display_savings = $("#display_savings");
  BankApp.displaySavingsAmount();

  $("#savings_withdraw_button").click( function (ev) {
    ev.preventDefault();
    BankApp.reduceSavingsAmount();
  });
  
$("#savings_deposit_button").click( function (ev) {
    ev.preventDefault();
    BankApp.increaseSavingsAmount();
  });
  
}

$(document).ready(BankApp.setup);