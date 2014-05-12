var musicPlayer = musicPlayer || {};

musicPlayer.play = function() {
sound = $(this).attr("id");
     var my_sound = soundManager.createSound({
                 url: '/wavs/' + sound + '.wav',
                 id: sound
        });
             my_sound.play(); 

    };

musicPlayer.setup = function() {


   $('#better').click(musicPlayer.play);
   $('#doit').click(musicPlayer.play);
   $('#ever').click(musicPlayer.play);
   $('#faster').click(musicPlayer.play);
   $('#harder').click(musicPlayer.play);
   $('#hour').click(musicPlayer.play);
   $('#makeit').click(musicPlayer.play);
   $('#makesus').click(musicPlayer.play);
   $('#morethan').click(musicPlayer.play);
   $('#never').click(musicPlayer.play);
   $('#our').click(musicPlayer.play);
   $('#over').click(musicPlayer.play);
   $('#stronger').click(musicPlayer.play);
   $('#workis').click(musicPlayer.play);
   $('#workit').click(musicPlayer.play);
};


// TRYING TO PLAY SOUND ON KEY DOWN!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// document.onkeydown = function(event) {
//     event = event || window.event;
//     switch (event.keyCode || event.which) {
//         case 37:
//          $('#better').click(musicPlayer.play);
//             break;
//         case 39:
//             alert('right');
//             break;
//     }
// };

        



$(document).ready(function() {

    soundManager.setup({
      url: '/swf/',
      preferFlash: true,
      onready: musicPlayer.setup
      
    }); // End call to soundManager.setup
}); // End document.ready function



