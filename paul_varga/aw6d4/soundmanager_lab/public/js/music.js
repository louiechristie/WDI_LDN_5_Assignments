var musicPlayer = musicPlayer || {};

musicPlayer.setup = function() {

  var data = [ 'after', 'better', 'doit', 'ever', 'faster', 'harder', 'hour', 'makeit', 'makeus', 'morethan', 'never', 'our', 'stronger', 'workis', 'workit' ];
  var $player = $('#player');

    $.each(data, function(i, el) {
      // $sound = $('<div id="' + el + '">' + el + '</div>');
      $sound = $('<div></div>').attr('id', el).text(el);
      $player.append($sound);

      var mySound = soundManager.createSound({
        id: el,
        url: '/' + el + '.wav'
      });

      $sound.click(function() {
        soundManager.play(el);
      });
  });
};

$(document).ready(function() {
  soundManager.setup({
    url: '/swf/', 
    preferFlash: true,
    onready: musicPlayer.setup
  }); // End call to soundManager.setup
}); // End document.ready