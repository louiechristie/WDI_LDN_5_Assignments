var myApp = myApp || {}

var total = 0;
var checkings = 0;
var savings = 0;

myApp.checkingsDeposit = function(){
 // var caption = $('#checkingsText');
 var input = $('#checkingsNewitem').val();

total += parseFloat(input);
checkings += parseFloat(input);
// caption.text("$" + checkings.toFixed(2));  
myApp.showBalances(checkings);
}

myApp.checkingsWithdraw = function(){
 // var caption = $('#checkingsText');
 var input = $('#checkingsNewitem').val();

  if(input<=total&&input<=checkings){
    total -= parseFloat(input);
    checkings -= parseFloat(input);
    // caption.text("$" + checkings.toFixed(2)); 
    myApp.showBalances(checkings,savings,total); 
  }
  else if(input<=total&&input>=checkings){
    remainder = parseFloat(input) - checkings;
    checkings = 0;
    total -= remainder;
    // caption.text("$" + checkings.toFixed(2));
    myApp.showBalances(checkings,savings,total); 
  }


// //show total
// var caption = $('#total');
// caption.text("$" + total.toFixed(2)); 
}

myApp.savingsDeposit = function(){
 // var caption = $('#savingsText');
 var input = $('#savingsNewitem').val();

total += parseFloat(input);
savings += parseFloat(input);
// caption.text("$" + savings.toFixed(2));  
myApp.showBalances(checkings,savings,total); 


// //show total
// var caption = $('#total');
// caption.text("$" + total.toFixed(2)); 
}


myApp.savingsWithdraw = function(){
 // var caption = $('#savingsText');
 var input = $('#savingsNewitem').val();

total -= parseFloat(input);
savings -= parseFloat(input);
// caption.text("$" + savings.toFixed(2));  
myApp.showBalances(checkings,savings,total); 

//show total
// var caption = $('#total');
// caption.text("$" + total.toFixed(2)); 
}

myApp.showBalances = function(checkings, savings, total){
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







// ["savings, "checkings"].each { |type|
//   $("button." + type).click(
//     $("input." + type).val()
//   )
// }




