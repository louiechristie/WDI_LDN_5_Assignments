var myApp = myApp || {}


var checkings = 0;
var savings = 0;


myApp.checkingsDeposit = function(){
 var input = $('#checkingsNewitem').val();
checkings += parseFloat(input);
myApp.showBalances(checkings,savings);
}

myApp.checkingsWithdraw = function(){
  var total = checkings + savings;
  var input = $('#checkingsNewitem').val();

  if(input<=total&&input<=checkings){
    checkings -= parseFloat(input);
    myApp.showBalances(checkings,savings); 
  }
  else if(input<=total&&input>checkings){
    remainder = parseFloat(input) - checkings;
    checkings = 0;
    savings -= remainder;
    myApp.showBalances(checkings,savings); 
  }


}

myApp.savingsDeposit = function(){
 var input = $('#savingsNewitem').val();

total += parseFloat(input);
savings += parseFloat(input);
myApp.showBalances(checkings,savings); 


}


myApp.savingsWithdraw = function(){
var total = checkings + savings;
var input = $('#savingsNewitem').val();

  if(input<=savings){
    savings -= parseFloat(input); 
    myApp.showBalances(checkings,savings); 
  }
}

myApp.showBalances = function(checkings, savings){
  var total = checkings + savings;
  var checkingsCaption = $('#checkingsText');
  checkingsCaption.text("$" + checkings.toFixed(2));
  var savingsCaption = $('#savingsText');
  savingsCaption.text("$" + savings.toFixed(2)); 

  var captionTotal = $('#total');
  captionTotal.text("$" + total.toFixed(2)); 
}

myApp.setup = function(){
  var $CheckingsDepositButton = $("#CheckingsDepositButton");
  $CheckingsDepositButton.on("click", myApp.checkingsDeposit);

  var $CheckingsWithdrawButton = $("#CheckingsWithdrawButton");
  $CheckingsWithdrawButton.on("click", myApp.checkingsWithdraw);

  var $SavingsDepositButton = $("#SavingsDepositButton");
  $SavingsDepositButton.on("click", myApp.savingsDeposit);

  var $SavingsWithdrawButton = $("#SavingsWithdrawButton");
  $SavingsWithdrawButton.on("click", myApp.savingsWithdraw);

  myApp.showBalances(checkings,savings,total); 
}

$(myApp.setup);








