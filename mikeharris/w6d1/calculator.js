 (function() {
    var calcIt = calcIt || {};

calcIt.sqrtHide = function(){
   var operator = document.getElementById('operator').value;
   if(operator == "sqrt") {
      document.getElementById('numb2').setAttribute("style","opacity: 0");
   } else {
     document.getElementById('numb2').setAttribute("style","opacity:  1");
    };
  };



calcIt.calculate = function(){
    var numb1 = Number(document.getElementById('numb1').value);
    var numb2 = Number(document.getElementById('numb2').value);
    var operator = document.getElementById('operator').value;
    var answer =  document.getElementById('answer');

        var the_answer = 0

        switch(operator) {
            case '+':
              the_answer = numb1 + numb2;
              break;
            case '-':
              the_answer = numb1 - numb2;
              break;
            case '*':
              the_answer = numb1 * numb2;
              break;
            case '/':
              the_answer = numb1 / numb2;
              break;
              case 'sqrt':
              the_answer = Math.sqrt(numb1);
              break;
              };

            if(the_answer) {    
                answer.innerHTML = the_answer;
              };

        };
      

calcIt.bmi = function(){
    var weight= Number(document.getElementById('weight').value);
    var height= Number(document.getElementById('height').value);
     var units= document.getElementById('units').value;
    var factor = 1   


  if(units == "imperial") {
    var factor = 703;
    };
  
      var BMIresult = (weight / (height * height * factor));
      
       document.getElementById('bmiresult').innerHTML = "Your BMI is :" + BMIresult; 
}


calcIt.mort = function() {
  var mort_prin = Number(document.getElementById('mort_prin').value);
  var mort_rate = Number(document.getElementById('mort_rate').value);
  var mort_years = Number(document.getElementById('mort_years').value);
  
    mort_rate = mort_rate /1200;
    var mort_nos_payments = mort_years * 12;


    var mort_monthly_payment = (mort_prin * mort_rate  * (Math.pow((1 + mort_rate),mort_nos_payments)) / (Math.pow((1 + mort_rate),mort_nos_payments) - 1)  );
    document.getElementById('mort_result').innerHTML = "monthly payments: " + mort_monthly_payment;
  

}


calcIt.trip = function () {
    var trip_dist=Number(document.getElementById('trip_dist').value);
    var trip_mpg=Number(document.getElementById('trip_mpg').value);
    var trip_mpgcost=Number(document.getElementById('trip_mpgcost').value);
    var trip_speed = Number(document.getElementById('trip_speed').value);

    trip_mpg = trip_mpg - Math.max(0, trip_speed - 60) * 2;

    var trip_time = (trip_dist / trip_speed);
    var trip_cost = (trip_dist / trip_mpg * trip_mpgcost);

    document.getElementById('trip_result').innerHTML = "The trip will take: " + trip_time + " and cost " + trip_cost;


}

calcIt.setup =function () {
var operator_button = document.getElementById("operator");
var basic_button = document.getElementById("calculate");
var bmi_button = document.getElementById("bmi");
var mort_button = document.getElementById("mort");
var trip_button = document.getElementById("trip");


operator_button.addEventListener('change', calcIt.sqrtHide);
basic_button.addEventListener('click', calcIt.calculate);
bmi_button.addEventListener('click', calcIt.bmi);
mort_button.addEventListener('click', calcIt.mort);
trip_button.addEventListener('click', calcIt.trip);
};

calcIt.setup();
})();

