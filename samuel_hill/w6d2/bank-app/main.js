var myApp = myApp || {}

myApp.currentdeposit = function() {
	var $amount = parseInt($('#amount-current').val());
	var $balance = parseInt($('#balance-current').val());

	document.getElementById('balance-current').value=($balance + $amount);
	
}	

myApp.currentwithdraw = function() {

	var $amount = parseInt($('#amount-current').val());
	var $currentbalance = parseInt($('#balance-current').val());
	var $newbalance = $currentbalance - $amount
	var $savingsbalance = parseInt($('#balance-savings').val());

	if ($newbalance < 0) {
		alert("You cannot withdraw this much money from this account. We will attempt to take the remainder from your savings.");
		var $newbalance = Math.abs($newbalance);
		var $newsavingsbalance = $savingsbalance - $newbalance;
		if ($newsavingsbalance < 0) {
			alert("You do not have enough money in your savings. Withdrawl cannot be made.");
		} else {
		document.getElementById('balance-savings').value=($savingsbalance - $newbalance);
		document.getElementById('balance-current').value=($currentbalance - $currentbalance);
		}
	} else {
	document.getElementById('balance-current').value=($currentbalance - $amount);
	}

}

myApp.savingsdeposit = function() {

	var $amount = parseInt($('#amount-savings').val());
	var $balance = parseInt($('#balance-savings').val());

	document.getElementById('balance-savings').value=($balance + $amount);

}

myApp.savingswithdraw = function() {

	var $amount = parseInt($('#amount-savings').val());
	var $balance = parseInt($('#balance-savings').val());
	var $newbalance = $balance - $amount

	if ($newbalance < 0) {
		alert("You cannot withdraw this much money from this account.");
	} else {
	document.getElementById('balance-savings').value=($balance - $amount);
	}

}

myApp.setup = function() {
	$('#deposit-current').on('click', myApp.currentdeposit);
	$('#withdraw-current').on('click', myApp.currentwithdraw);
	$('#deposit-savings').on('click', myApp.savingsdeposit);
	$('#withdraw-savings').on('click', myApp.savingswithdraw);
}

$(myApp.setup);