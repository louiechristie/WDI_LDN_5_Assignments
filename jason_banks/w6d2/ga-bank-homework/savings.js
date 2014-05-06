var BankSavings = {};

BankSavings.savingsAmount = 0;

BankSavings.getSavingsInput = function () {
  pre_valid_savings_input = parseFloat($("#savings_input").val());
  $savings_input = null;

  if (pre_valid_savings_input && $.isNumeric(pre_valid_savings_input) && pre_valid_savings_input > 0) {
    $savings_input = pre_valid_savings_input;
  } else {
    alert("Must enter a number greater than zero.");
  }
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

  if ($savings_input && $savings_input > BankSavings.savingsAmount) {
    $savings_overdraft = $("#savings_overdraft");
    $savings_overdraft.text("Profligacy! Cannot withdraw greater than your Savings Account balance.");
  } else {
    BankSavings.savingsAmount -= $savings_input;
  }

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

BankSavings.clearOverdraftError = function () {
  $("#savings_overdraft").text("");
  $("#current_overdraft").text("");
}

BankSavings.setup = function () {
  $display_savings = $("#display_savings");
  BankSavings.displaySavingsAmount();

  $("#savings_withdraw_button").click( function (ev) {
    BankSavings.clearOverdraftError();
    ev.preventDefault();
    BankSavings.reduceSavingsAmount();
  });
  
$("#savings_deposit_button").click( function (ev) {
    BankSavings.clearOverdraftError();
    ev.preventDefault();
    BankSavings.increaseSavingsAmount();
  });
  
}

$(document).ready(BankSavings.setup);