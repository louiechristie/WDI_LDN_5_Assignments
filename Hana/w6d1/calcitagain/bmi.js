var myApp = myApp || {}

myApp.unitplaceholder = function(){
  var selectedElement = document.getElementById("units");
  var selectedUnit = selectedElement.options[selectedElement.selectedIndex].value;
  if(selectedUnit == "imperial"){
    document.getElementById("weight").setAttribute("placeholder","Pounds");
    document.getElementById("height").setAttribute("placeholder","Inches")}
  else if(selectedUnit == "metric"){
     document.getElementById("weight").setAttribute("placeholder", "Kg");
    document.getElementById("height").setAttribute("placeholder", "Meters");
  }

}

myApp.bmi = function(){
  var selectedElement = document.getElementById("units");
  var selectedLabel = selectedElement.options[selectedElement.selectedIndex].value;

  if(selectedLabel == "imperial"){
    imperial();
  }
  else if(selectedLabel == "metric"){
    metric();
  }
}

myApp.imperial = function(){
  var weight = parseFloat(document.getElementById("weight").value);
  var height = parseFloat(document.getElementById("height").value);
  var number = ((weight / Math.pow(height, 2))*703).toFixed(2);
  var result = "Your BMI is " + number + ".";
  myApp.answer(result);
}

myApp.metric = function(){
  var weight = parseFloat(document.getElementById("weight").value);
  var height = parseFloat(document.getElementById("height").value);
  var number = ((weight / Math.pow(height, 2))).toFixed(2);  var result = "Your BMI is " + number + ".";
  
  myApp.answer(result);
}

myApp.answer = function(result){
  var caption = document.getElementById('answer');
  caption.innerHTML = result;
}