var FunnyPictures = FunnyPictures || {};

FunnyPictures.setup = function() {

  var stage = new Kinetic.Stage({
    container: 'container',
    width: 480,
    height: 480
  });
  
  var mustache_k
  var layer = new Kinetic.Layer();
  var background = new Image();
  background.onload = function() {
    var background_k = new Kinetic.Image({
      x: 0,
      y: 0,
      image: background,
      width: 480,
      height:480,
    });
    layer.add(background_k);
    stage.add(layer);
  };
  background.src = 'silhouette.png';

  var mustache = new Image();
  mustache.onload = function() {
    mustache_k = new Kinetic.Image({
      x: 240-(100/2),
      y: 240-(38/2),
      image: mustache,
      width: 100,
      height: 38,
      draggable: true
    });
    mustache_k.on('mouseover', function() {
      document.body.style.cursor = 'pointer';
    });
    mustache_k.on('mouseout', function() {
      document.body.style.cursor = 'default';
    });
    layer.add(mustache_k);
    stage.add(layer);
    mustache_k.moveToTop();
    layer.draw();
  };
  mustache.src = 'mustache.png';


  
};

$(FunnyPictures.setup)