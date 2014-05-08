var musicPlayer = musicPlayer || {};

musicPlayer.play = function() {
  var $playButton = $('#player');
  var mySound = soundManager.createSound({
    id:'anything',
    url:'/legacy.mp3'
  });
  if ($playButton.data('state') === 'playing') {
    console.info ('track playing: pausing now');
    $playButton.html('&#9654').data('state', 'paused');
    mySound.pause();
  } else if ($playButton.data('state') == 'paused') {
    console.info ('track paused: playing now');
    $playButton.html('&#x275A;&#x275A;').data('state', 'playing');;
    mySound.resume();
  } else {
    console.info ('track in some other state: playing now');
    $playButton.html('&#x275A;&#x275A;').data('state', 'playing')
    mySound.play();
  }
};

musicPlayer.setup = function() {
  $('#player').data('state', 'stopped').click(musicPlayer.play);
};

$(document).ready(function() {
  soundManager.setup({
    url: '/swf', 
    preferFlash: true,
    onready: musicPlayer.setup
    }); //End call to soundManager.setup
  }); // End document ready function