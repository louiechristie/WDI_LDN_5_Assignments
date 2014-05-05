function trip() {
    var distance = parseInt(document.getElementById('distance').value);
    var mpg = parseInt(document.getElementById('mpg').value);
    var cpg = parseInt(document.getElementById('cpg').value);
    var speed = parseInt(document.getElementById('speed').value);

    if (speed >= 60) {
      var reduce = 2 * (speed - 60);
      mpg = mpg - reduce;
    }
    document.getElementById('distance_out').innerHTML = distance.toString();
    document.getElementById('mpg_out').innerHTML = mpg;
    document.getElementById('cpg_out').innerHTML = cpg;
    document.getElementById('speed_out').innerHTML = speed;

    document.getElementById('hours').innerHTML = distance / speed; 
    document.getElementById('cost').innerHTML = (distance / mpg) * cpg; 
}