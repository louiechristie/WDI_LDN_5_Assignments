var BankCurrent = {};

BankCurrent.currentAmount = 0;

BankCurrent.getCurrentInput = function () {
  pre_valid_current_input = parseFloat($("#current_input").val());

  if (pre_valid_current_input && $.isNumeric(pre_valid_current_input) && pre_valid_current_input > 0) {
    $current_input = pre_valid_current_input;
  } else {
    alert("Must enter a number greater than zero.");
  }
}

BankCurrent.getDisplayCurrent = function () {
  $display_current = $("#display_current");
}

BankCurrent.displayCurrentAmount = function () {
  $display_current.text("\xA3" + BankCurrent.currentAmount.toFixed(2));
}

BankCurrent.clearCurrentInput = function () {
  $("#current_input").val("");
}


BankCurrent.reduceCurrentAmount = function () {
  BankCurrent.getCurrentInput();
  BankCurrent.getDisplayCurrent();

  if ($current_input && $current_input > BankCurrent.currentAmount) {
    $current_overdraft = $("#current_overdraft");
    $current_overdraft.text("Profligacy! Cannot withdraw greater than your Current Account balance.");
  } else {
    BankCurrent.currentAmount -= $current_input;
  }

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

BankCurrent.clearOverdraftError = function () {
  $("#savings_overdraft").text("");
  $("#current_overdraft").text("");
}

BankCurrent.setup = function () {
  BankCurrent.getDisplayCurrent();
  BankCurrent.displayCurrentAmount();
  
  $("#current_withdraw_button").click( function (ev) {
    BankCurrent.clearOverdraftError();
    ev.preventDefault();
    BankCurrent.reduceCurrentAmount();
  });
  
$("#current_deposit_button").click( function (ev) {
    BankCurrent.clearOverdraftError();
    ev.preventDefault();
    BankCurrent.increaseCurrentAmount();
  });
  
}

$(document).ready(BankCurrent.setup);