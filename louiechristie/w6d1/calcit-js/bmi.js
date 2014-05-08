function calculate() {

    console.log("At start of BMI");

    var height1 = parseFloat(document.getElementById('height1').value);
    var h_unit1 = document.getElementById('h_unit1').value;
    var height2 = parseFloat(document.getElementById('height2').value);
    var h_unit2 = document.getElementById('h_unit2').value;
    var weight = parseFloat(document.getElementById('weight').value);
    var w_unit = document.getElementById('w_unit').value;
    var result = parseFloat(document.getElementById('result').value);

 

    if (h_unit1 == "feet") {height1 = 0.3048 * height1;}
    if (h_unit2 == "inches") {height2 = 2.54 * height2;}
    height1 = height1 + (0.01 * height2);

    if (w_unit == "stone") {weight = weight * 6.35029;}

    var bottom = Math.pow(height1, 2);
    result = (weight/bottom).toFixed(2);

    document.getElementById('result').innerHTML = result; 

    console.log(height1, h_unit1, height2, h_unit2, weight, w_unit, result);

    var calculation = document.getElementById("calculation");
    console.log(calculation);
     
    calculation.style.display = 'block';
}



