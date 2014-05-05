function sqrt_hide(){
   var operator = document.getElementById('operator').value;

   if(operator == "sqrt") {
      document.getElementById('numb2').setAttribute("style","opacity: 0");
   } else {
     document.getElementById('numb2').setAttribute("style","opacity:  1");
    };
  };


function calculate(){
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
    answer.innerHTML = the_answer;

        };
      


