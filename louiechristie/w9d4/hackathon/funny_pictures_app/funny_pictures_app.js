var FunnyPictures = FunnyPictures || {};

FunnyPictures.setup = function() {

  var stage = new Kinetic.Stage({
    container: 'container',
    width: 480,
    height: 480
  });
  var layer = new Kinetic.Layer();

  var imageObj = new Image();

  imageObj.onload = function() {
    var yoda = new Kinetic.Image({
      x: 200,
      y: 50,
      image: imageObj,
      width: 106,
      height: 118,
      draggable: true
    });

    // add cursor styling
    yoda.on('mouseover', function() {
      document.body.style.cursor = 'pointer';
    });
    yoda.on('mouseout', function() {
      document.body.style.cursor = 'default';
    });

    // add the shape to the layer
    layer.add(yoda);

    // add the layer to the stage
    stage.add(layer);
  };
  imageObj.src = 'http://www.html5canvastutorials.com/demos/assets/yoda.jpg';
  
};

$(FunnyPictures.setup)