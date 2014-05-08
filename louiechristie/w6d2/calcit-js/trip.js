(function (){

var myApp = myApp || {};


myApp.calculate = function() {
    var distance = parseFloat(document.getElementById('distance').value);
    var mpg = parseFloat(document.getElementById('mpg').value);
    var cpg = parseFloat(document.getElementById('cpg').value);
    var speed = parseFloat(document.getElementById('speed').value);

    if (speed >= 60) {
      var reduce = 2 * (speed - 60);
      mpg = mpg - reduce;
    }
    document.getElementById('distance_out').innerHTML = distance;
    document.getElementById('mpg_out').innerHTML = mpg;
    document.getElementById('cpg_out').innerHTML = cpg;
    document.getElementById('speed_out').innerHTML = speed;

    document.getElementById('hours').innerHTML = (distance / speed).toFixed(2); 
    document.getElementById('cost').innerHTML = ((distance / mpg) * cpg).toFixed(2); 
}

myApp.setup = function() {
  var button = document.getElementById('calculate');
  button.addEventListener('click', myApp.calculate);
}

myApp.setup();

})();