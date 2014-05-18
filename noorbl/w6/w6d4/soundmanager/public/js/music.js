

var musicPlayer = musicPlayer || {};


musicPlayer.play = function() {
  var $playButton = $('#player');
  var mySound = soundManager.createSound({
      id: 'whatever',
      url: '/fullsong.mp3'
    });

  if ($playButton.data('state') === 'playing') {
    $playButton.html('&#9654').data('state', 'paused');
    mySound.pause();
  } else if ($playButton.data('state') == 'paused') {
    $playButton.html('&#x275A;&#x275A;').data('state', 'playing');
    mySound.resume();
  } else {  
    $playButton.html('&#x275A;&#x275A;').data('state', 'playing');
    mySound.play();
  }
};





musicPlayer.play1 = function() {
  soundManager.play('work it');
};


musicPlayer.play2 = function() {
  soundManager.play('make it');
};
      

musicPlayer.play3 = function() {
  soundManager.play('do it');
};

 musicPlayer.play4 = function() {
  soundManager.play('makes us');
};

musicPlayer.play5 = function() {
  soundManager.play('harder');
};

musicPlayer.play6 = function() {
  soundManager.play('better');
};

musicPlayer.play7 = function() {
  soundManager.play('faster');
};

musicPlayer.play8 = function() {
  soundManager.play('stronger');
};

musicPlayer.play9 = function() {
  soundManager.play('more than');
};

musicPlayer.play10 = function() {
  soundManager.play('hour');
};

musicPlayer.play11 = function() {
  soundManager.play('our');
};

musicPlayer.play12 = function() {
  soundManager.play('never');
};

musicPlayer.play13 = function() {
  soundManager.play('ever');
};

musicPlayer.play14 = function() {
  soundManager.play('after');
};

musicPlayer.play15 = function() {
  soundManager.play('work is');
};

musicPlayer.play16 = function() {
  soundManager.play('over');
};




musicPlayer.setup = function() {

  soundManager.createSound({
      id: 'work it',
      url: '/workit.wav'
    });

  soundManager.createSound({
      id: 'make it',
      url: '/make it.wav'
    });

  soundManager.createSound({
      id: 'do it',
      url: '/do it.wav'
    });

soundManager.createSound({
      id: 'makes us',
      url: '/makes us.wav'
    });


soundManager.createSound({
      id: 'harder',
      url: '/harder.wav'
    });

soundManager.createSound({
      id: 'better',
      url: '/better.wav'
    });

soundManager.createSound({
      id: 'faster',
      url: '/faster.wav'
    });

soundManager.createSound({
      id: 'stronger',
      url: '/stronger.wav'
    });

soundManager.createSound({
      id: 'more than',
      url: '/more than.wav'
    });

soundManager.createSound({
      id: 'hour',
      url: '/hour.wav'
    });

soundManager.createSound({
      id: 'our',
      url: '/our.wav'
    });

soundManager.createSound({
      id: 'never',
      url: '/never.wav'
    });

soundManager.createSound({
      id: 'ever',
      url: '/ever.wav'
    });

soundManager.createSound({
      id: 'after',
      url: '/after.wav'
    });

soundManager.createSound({
      id: 'work is',
      url: '/work is.wav'
    });

soundManager.createSound({
      id: 'over',
      url: '/over.wav'
    });


  $('#player').data('state', 'stop').click(musicPlayer.play);
  $('#player1').click(musicPlayer.play1);
  $('#player2').click(musicPlayer.play2);
  $('#player3').click(musicPlayer.play3);
  $('#player4').click(musicPlayer.play4);
  $('#player5').click(musicPlayer.play5);
  $('#player6').click(musicPlayer.play6);
  $('#player7').click(musicPlayer.play7);
  $('#player8').click(musicPlayer.play8);
  $('#player9').click(musicPlayer.play9);
  $('#player10').click(musicPlayer.play10);
  $('#player11').click(musicPlayer.play11);
  $('#player12').click(musicPlayer.play12);
  $('#player13').click(musicPlayer.play13);
  $('#player14').click(musicPlayer.play14);
  $('#player15').click(musicPlayer.play15);
  $('#player16').click(musicPlayer.play16);

};








$(document).ready(function() {
  soundManager.setup({
    url: '/swf/',
    preferFlash: true,
    onready: musicPlayer.setup
  }); // end call to soundPlayer.setup
}); // end document.ready function









