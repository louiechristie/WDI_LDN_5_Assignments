var Bank = Bank || {};

Bank.currentAmount = 0;

Bank.getCurrentInput = function () {
  pre_valid_current_input = parseFloat($("#current_input").val());
  $current_input = null;

  if (pre_valid_current_input && $.isNumeric(pre_valid_current_input) && pre_valid_current_input > 0) {
    $current_input = pre_valid_current_input;
  } else {
    alert("Must enter a number greater than zero.");
  }
}

Bank.getDisplayCurrent = function () {
  $display_current = $("#display_current");
}

Bank.displayCurrentAmount = function () {
  $display_current.text("\xA3" + Bank.currentAmount.toFixed(2));
}

Bank.clearCurrentInput = function () {
  $("#current_input").val("");
}


Bank.reduceCurrentAmount = function () {
  Bank.getCurrentInput();
  Bank.getDisplayCurrent();

  if ($current_input && $current_input > Bank.currentAmount) {
    if ($current_input > (Bank.currentAmount + Bank.savingsAmount)) {
    $current_overdraft = $("#current_overdraft");
    $current_overdraft.text("Profligacy! Cannot withdraw greater than your Current Account balance.");
    } else {
      Bank.savingsAmount = Bank.savingsAmount - $current_input + Bank.currentAmount;
      Bank.currentAmount = 0;
    }
  } else {
    Bank.currentAmount -= $current_input;
  }

  Bank.displayCurrentAmount();
  Bank.displaySavingsAmount();
  Bank.clearCurrentInput();
}

Bank.increaseCurrentAmount = function () {
  Bank.getCurrentInput();
  Bank.getDisplayCurrent();
  Bank.currentAmount += $current_input;

  Bank.displayCurrentAmount();
  Bank.clearCurrentInput();
}

Bank.clearOverdraftError = function () {
  $("#savings_overdraft").text("");
  $("#current_overdraft").text("");
}

Bank.setup = function () {
  Bank.getDisplayCurrent();
  Bank.displayCurrentAmount();
  
  $("#current_withdraw_button").click( function (ev) {
    Bank.clearOverdraftError();
    ev.preventDefault();
    Bank.reduceCurrentAmount();
  });
  
$("#current_deposit_button").click( function (ev) {
    Bank.clearOverdraftError();
    ev.preventDefault();
    Bank.increaseCurrentAmount();
  }); 
}

$(document).ready(Bank.setup);