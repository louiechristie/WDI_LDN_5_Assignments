function bmi(){
  var selectedElement = document.getElementById("units");
  var selectedLabel = sel.options[sel.selectedIndex].value;

  if(selectedLabel == "imperial"){
    imperial();
  }
  else if(selectedLabel == "metric"){
    metric();
  }
}

function imperial(){
  var weight = parseInt(document.getElementById("weight").value);
  var height = parseInt(document.getElementById("height").value);
  var result = Math.pow((weight/height),2) * 703
  var rounded = Math.round(result*10 ) / 10;
  var answer = parse('Your BMI is %s.', rounded);
}

function metric(){
  var weight = parseInt(document.getElementById("weight").value);
  var height = parseInt(document.getElementById("height").value);
  var result = Math.pow((weight/height),2)
  var rounded = Math.round( result * 10 ) / 10;
  var answer = parse('Your BMI is %s.', rounded);
}

function answer(result){
  var caption = document.getElementById('answer');
  caption.innerHTML = answer;
}