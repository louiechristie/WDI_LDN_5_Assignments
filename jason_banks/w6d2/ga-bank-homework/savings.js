var BankSavings = {};

BankSavings.savingsAmount = 0;

BankSavings.getSavingsInput = function () {
  $savings_input = parseFloat($("#savings_input").val());
}

BankSavings.getDisplaySavings = function () {
  $display_savings = $("#display_savings");
}

BankSavings.displaySavingsAmount = function () {
  $display_savings.text(BankSavings.savingsAmount);
}

BankSavings.clearSavingsInput = function () {
  $("#savings_input").val("");
}

BankSavings.reduceSavingsAmount = function () {
  BankSavings.getSavingsInput();
  BankSavings.getDisplaySavings();
  BankSavings.savingsAmount -= $savings_input;

  BankSavings.displaySavingsAmount();
  BankSavings.clearSavingsInput();
}

BankSavings.increaseSavingsAmount = function () {
  BankSavings.getSavingsInput();
  BankSavings.getDisplaySavings();
  BankSavings.savingsAmount += $savings_input;

  BankSavings.displaySavingsAmount();
  BankSavings.clearSavingsInput();
}

BankSavings.setup = function () {
  $display_savings = $("#display_savings");
  BankSavings.displaySavingsAmount();

  $("#savings_withdraw_button").click( function (ev) {
    ev.preventDefault();
    BankSavings.reduceSavingsAmount();
  });
  
$("#savings_deposit_button").click( function (ev) {
    ev.preventDefault();
    BankSavings.increaseSavingsAmount();
  });
  
}

$(document).ready(BankSavings.setup);