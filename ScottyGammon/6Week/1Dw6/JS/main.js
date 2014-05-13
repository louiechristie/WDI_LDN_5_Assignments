//while(true) {
//  alert("lol");
//}

//var items = [];
//for (var i=0; i < 3; i++) {
//  var thing = prompt("please enter " + i);
//  items.push(thing);
//}

//alert("your items are: " + items.join(', '));


//  var one = prompt("please enter first number.");
//var two = prompt("please enter second number.");

//var result = one + two;
//alert("your result was: " + result);

//var one = parseInt("please enter first number.");
//var two = parseInt("please enter second number.");

//var result = one + two;
//alert("your result was: " + result);

//cat = (name: 'Fluffy'),
//  sound: 'Meow',
//  talk: function() {
//  return this.sound + ", " + this.sound;
//}

// bar = function() {
//   return a -b;
// }

// function foo(a, b) {
//   return a -b;
// }

//function cat(name)
//  name: 
//  sound: 'Meow',
//  talk: function() {
//  return this.sound + ", " + this.sound;
//}

// var max = prompt("please enter number");
// number =1;
// while (number <= max){
//   if (number%15==0){
//     alert("FizzBuzz");
//   }
//   else if (number%5==0){
//     alert ("Buzz");
//   }
//   else if (number%3==0){
//     alert("Fizz");
//   }
//   else {
//     alert(number);
//   }
//   number=number+1;
// }

// function isPalindromic(number){
//   stringnumber = number.toString();
//   middle = Math.floor(stringnumber.length / 2);
//   before = stringnumber.lastIndexOf(' ', middle);
//   after = stringnumber.indexOf(' ', middle + 1);
//   if (middle - before < after - middle) {
//         middle = before;
//   } 
//   else {
//     middle = after;
//   }
//   s1 = stringnumber.substr(0, middle);
//   alert(s1);
//   s2 = stringnumber.substr(middle + 1);
//   alert(s2);
// }

// function isPalindromic(number){
//   stringnumber = number.toString();
//   return stringnumber == stringnumber.split('').reverse().join('');
// }

// // function numberChecker(number2){
// //   number =100;
// //   while (number <= 999){
// //       isPalindromic(number*number2);
// //       maxPal=(number*number2);
// //       number=number+1;
// //   }
// // }

// function fn(n){
//     max_palindrome = 1;
//     for (x.range(n,1,-1)){
//         for (y.range(n,x-1,-1)){
//             if isPalindromic(x*y) && x*y > max_palindrome;
//                 isPalindromic = x*y;
//             else if x*y < max_palindrome;
//                 break;
//     return max_palindrome
//         }
//     }
// }

// alert(fn(999));

// function update() {
//   var caption = document.getElementById('greeting');
//   var input = document.getElementById('name');

//   caption.innerHTML = "Hello, " +input.value + "!";
// } 



// function mortgage() {
//   var principal = parseInt(document.getElementById("principal").value);
//   var num2 = parseInt(document.getElementById("num2").value);
//   var number = parseInt(document.getElementById("number").value);

//   var interest = (apr / 12) / 100;

//   var interest_sub_calc = Math.pow((1 + interest), number);
//   var numerator = interest * interest_sub_calc;
//   var denominator = interest_sub_calc - 1;
//   var maths = (principal * (numerator / denominator)).toFixed(2);

//   var mortgage = document.getElementById("mortgage");
//   mortgage.innerHTML = " | Monthly payment amount: ";

//   mortgage.innerHTML += maths;
//   } 
// }

// function bmi() {
//   var weight = parseInt(document.getElementById("weight").value);
//   var height = parseInt(document.getElementById("height").value);

//   var c = (weight / Math.pow((height / 100),2)).toFixed(2);
//   var bmi = document.getElementById("bmi");
//   bmi.innerHTML = "BMI: ";

//   if (isNaN(weight) || isNaN(height)) {
//     bmi.innerHTML += "could not be determined due to invalid inputs.";
//   } else if (weight <= 0 || height <= 0) {
//     bmi.innerHTML += "dont use zero."; 
//   } else if (c) {
//     bmi.innerHTML += c
//   }
//   alert(c)
// }

// function trip() {
//   var distance = parseInt(document.getElementById("distance").value);
//   var mpg = parseInt(document.getElementById("mpg").value);
//   var cost = parseInt(document.getElementById("cost").value);
//   var mph = parseInt(document.getElementById("mph").value);

//   var trip = document.getElementById("trip");

//   if (distance <= 0 || mpg <= 0 || cost_per_gallon <= 0 || mph <= 0) {
//     trip.innerHTML = "dont use zero";
//   } else {
//       if (mph > 60) {
//         mpg = mpg - (2 * (mph - 60));
//       }

//       if (mpg <= 0) {
//         var trip_cost = 0;
//       } else {
//         var trip_cost = ((distance / mpg) * cost);
//       }

//       if (trip_cost <= 0) {
//         trip_cost = 0;
//       }

//       var trip_time = (distance / mph);

//       trip.innerHTML = " | Cost: " + trip_cost.toFixed(2) + " Time: " + trip_time.toFixed(2);
      
//       alert(" | Cost: " + trip_cost.toFixed(2) + " Time: " + trip_time.toFixed(2))
//   }
// }
var myApp = myApp || {};

myApp.sayHello = function () {
  alert('Hello WDI!')
}
myApp.update = function() {
  var $caption = $('#greeting');
  var $input = $('#name');

  if ($input.val() == 'Scotty') {
    $input.val('Scott');
  }

  if ($input.val()) {
  $caption.text = "Hello, " + $input.value + "!";
  }
  else {
    $caption.text("<h1>Hello</h1>");
  }
}

var colors = ["red", "green", "blue", "orange", "purple"]
var count = 0;

myApp.rotate = function() {
  var listItems = $('li');
  $.each(listItems, function(i, el) {
    var $el = $(el);
    el.setAttribute('style', 'background-color: ' + colors[(i+count) % colors.length]);
});
  myApp.count++;
}

myApp.permaRotate = function() {
  setInterval(myApp.rotate, 200);
}

myApp.addition = function(){ 
var a = document.getElementById('num1');
var b = document.getElementById('num2');
  if(isNaN(a.value)||isNaN(b.value)){
    alert("Must input numbers");
  }
  else {
    var c = parseInt(a.value) + parseInt(b.value); 
    alert(c)
  }
}  

myApp.subtraction = function(){ 
var a = document.getElementById('num1');
var b = document.getElementById('num2');
if(isNaN(a.value)||isNaN(b.value)){
    alert("Must input numbers");
  }
  else {
    var c = parseInt(a.value) - parseInt(b.value); 
    alert(c)
  } 
} 

myApp.multiply = function(){ 
var a = document.getElementById('num1');
var b = document.getElementById('num2');
if(isNaN(a.value)||isNaN(b.value)){
    alert("Must input numbers");
  }
  else {
    var c = parseInt(a.value) * parseInt(b.value); 
    alert(c)
  } 
}

myApp.division = function(){ 
var a = document.getElementById('num1');
var b = document.getElementById('num2');
if(isNaN(a.value)||isNaN(b.value)){
    alert("Must input numbers");
  }
  else if(b.value==0){
    alert("dont divide by zero");
}
  else {
    var c = parseInt(a.value) / parseInt(b.value); 
    alert(c)
  } 
}

myApp.sqrt = function(){ 
var a = document.getElementById('num1');
var b = document.getElementById('num2');
if(isNaN(a.value)||isNaN(b.value)){
    alert("Must input numbers");
  }
else if(b.value!=0){
    alert("Only use first box");
}
  else {
    var c = Math.sqrt(parseInt(a.value)) 
    alert(c)
  }
} 

myApp.setup = function() {
  var input = document.getElementById('name')
  input.addEventListener('keyup', myApp.update)
  var button = document.$("#greeter");
  button.addEventListener('click', myApp.sayHello);
  var button = document.getElementById("disco");
  button.addEventListener('click', myApp.permaRotate);
  var button = document.getElementById("add");
  button.addEventListener('click', myApp.addition);
  var button = document.getElementById("sub");
  button.addEventListener('click', myApp.subtraction);
  var button = document.getElementById("mul");
  button.addEventListener('click', myApp.multiply);
  var button = document.getElementById("div");
  button.addEventListener('click', myApp.division);
  var button = document.getElementById("sqrt");
  button.addEventListener('click', myApp.sqrt);
}

$document.ready(myApp.setup)
$(myApp.setup)

var input = document.getElementById('name')

input.addEventListener('keyup', myApp.update);