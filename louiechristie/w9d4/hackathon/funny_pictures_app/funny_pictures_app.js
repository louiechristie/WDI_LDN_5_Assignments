var FunnyPictures = FunnyPictures || {};



FunnyPictures.setup = function() {

  function writeMessage(canvas, message, x, y) {
        var context = canvas.getContext('2d');
        context.clearRect(0, 0, canvas.width, canvas.height);
        context.font = '18pt Calibri';
        context.fillStyle = 'black';
        context.fillText(message, x, y);
      }
      function getMousePos(canvas, evt) {
        var rect = canvas.getBoundingClientRect();
        return {
          x: evt.clientX - rect.left,
          y: evt.clientY - rect.top
        };
      }

  function loadImages(sources, callback) {
        var images = {};
        var loadedImages = 0;
        var numImages = 0;
        // get num of sources
        for(var src in sources) {
          numImages++;
        }
        for(var src in sources) {
          images[src] = new Image();
          images[src].onload = function() {
            if(++loadedImages >= numImages) {
              callback(images);
            }
          };
          images[src].src = sources[src];
        }
      }
      var canvas = document.getElementById('myCanvas');
      var context = canvas.getContext('2d');

      var sources = {
        darthVader: 'http://www.html5canvastutorials.com/demos/assets/darth-vader.jpg',
        yoda: 'http://www.html5canvastutorials.com/demos/assets/yoda.jpg'
      };

      loadImages(sources, function(images) {
        context.drawImage(images.darthVader, 100, 30, 200, 137);
        context.drawImage(images.yoda, 350, 55, 93, 104);
      });

      context.font = 'bold 40pt Helvetica';
      context.fillText('Hello World!', 150, 100);
      context.strokeStyle = 'white';
      context.strokeText('Hello World!', 150, 100);

      // save canvas image as data url (png format by default)
      var dataURL = canvas.toDataURL();

      // set canvasImg image src to dataURL
      // so it can be saved as an image
      document.getElementById('canvasImg').src = dataURL;      
      var dataURL = canvas.toDataURL();

      canvas.addEventListener('mousemove', function(evt) {
        var mousePos = getMousePos(canvas, evt);
        var message = 'Mouse position: ' + mousePos.x + ',' + mousePos.y;
        writeMessage(canvas, message, mousePos.x, mousePos.y);
      }, false);
};

$(FunnyPictures.setup)