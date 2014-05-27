var musicPlayer = musicPlayer || {};

// musicPlayer.play = function(ev) {
//   console.log("*********")
//   console.log($(ev.originalTarget).data('mp3'))
//   var $playButton = $('#player');
//     var mySound = soundManager.createSound({
//       id: 'whatever',
//       url: $(ev.target).data('mp3')
//   });

//   if($playButton.data('state') === 'playing') {
//       $playButton.html('&#9654').data('state', 'paused');
//       mySound.pause();
//     } else if ($playButton.data('state') === 'paused') {
//       $playButton.html('&#x275a; &#x275a;').data('state', 'playing');
//       mySound.resume();
//     } else {
//       console.info("Playing");
//       $playButton.html('&#x275a; &#x275a;').data('state', 'playing');
//       mySound.play();
//     }

// };
musicPlayer.playrandom = function() {
  var nostimes = 40;
  console.log($('.musicbutton').length);
  for (var i = 0; i < nostimes; i++) {          
      setTimeout(function () {
            nos = Math.floor((Math.random() * $('.musicbutton').length) )
            console.log(nos);
            $('.musicbutton').eq(nos).click();  
      }, i * 500);
  }
}

musicPlayer.play = function(ev) {
  $button_pressed = $(ev.target)
  var mp3 = $button_pressed.data('mp3')
  musicPlayer.flash($button_pressed);
  console.log(mp3)
    var mySound = soundManager.createSound({
      id: mp3,
      url: mp3
  });
  mySound.play();
};

musicPlayer.flash = function(what){ 
      what.addClass('flash');
      setTimeout(function () {
            what.removeClass('flash');           
      }, 1000);
}

musicPlayer.setuphtml = function() {
    var music = ["/after.wav", "/better.wav", "/doit.wav", "/ever.wav","/faster.wav","/harder.wav", "/hour.wav", "/makeit.wav", "/makesus.wav", "/morethan.wav", "/never.wav", "/our.wav", "/stronger.wav", "/workis.wav", "/workit.wav"]
    $.each(music, function(i, mp3) { 
      $a = "<div class='musicbutton' data-mp3=" + mp3 + ">" + mp3.substring(1 , mp3.length - 4) + "</div>"
      $('#player').append($a);
    })
};

musicPlayer.setup = function() {
  musicPlayer.setuphtml();
  // $('#player').data('state','stopped').on('click', musicPlayer.play)
  $('.musicbutton').on('click', musicPlayer.play)
  $('#random').on('click', musicPlayer.playrandom)
};

$(document).ready(function(){
    soundManager.setup({
      url: '/swf/',
      preferFlash: true,
      onready: musicPlayer.setup
      })
  });

