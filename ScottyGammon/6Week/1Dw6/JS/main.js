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

//var one = parsInt("please enter first number.");
//var two = parsInt("please enter second number.");

//var result = one + two;
//alert("your result was: " + result);

//cat = (name: 'Fluffy'),
//  sound: 'Meow',
//  talk: function() {
//  return this.sound + ", " + this.sound;
//}

bar = function() {
  return a -b;
}

function foo(a, b) {
  return a -b;
}

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

function isPalindromic(number){
  stringnumber = number.toString();
  return stringnumber == stringnumber.split('').reverse().join('');
}

// function numberChecker(number2){
//   number =100;
//   while (number <= 999){
//       isPalindromic(number*number2);
//       maxPal=(number*number2);
//       number=number+1;
//   }
// }

function fn(n){
    max_palindrome = 1;
    while (x.range(n,1,-1)){
        while (y.range(n,x-1,-1)){
            if isPalindromic(x*y) && x*y > max_palindrome;
                isPalindromic = x*y;
            else if x*y < max_palindrome;
                break;
    return max_palindrome
        }
    }
}

alert(fn(999));