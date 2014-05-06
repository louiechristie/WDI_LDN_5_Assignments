function bmi(){
  var selectedElement = document.getElementById("units");
  var selectedLabel = selectedElement.options[selectedElement.selectedIndex].value;

  if(selectedLabel == "imperial"){
    imperial();
  }
  else if(selectedLabel == "metric"){
    metric();
  }
}

function imperial(){
  var weight = parseFloat(document.getElementById("weight").value);
  var height = parseFloat(document.getElementById("height").value);
  var number = ((weight / Math.pow(height, 2))*703).toFixed(2);
  var result = "Your BMI is " + number + ".";
  answer(result);
}

function metric(){
  var weight = parseFloat(document.getElementById("weight").value);
  var height = parseFloat(document.getElementById("height").value);
  var number = ((weight / Math.pow(height, 2))).toFixed(2);  var result = "Your BMI is " + number + ".";
  
  answer(result);
}

function answer(result){
  var caption = document.getElementById('answer');
  caption.innerHTML = result;
}