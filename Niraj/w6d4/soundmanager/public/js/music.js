var musicPlayer = musicPlayer || {};

musicPlayer.play = function(id) {
sound = $(this).attr("id");
     var my_sound = soundManager.createSound({
                 url: '/wavs/' + sound + '.wav',
                 id: sound
        });
             my_sound.play(); 

    };

musicPlayer.setup = function() {



   $('#after').click(musicPlayer.play);
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


// $( "musicPlayer" ).keydown(function( event ) {
//   if ( event.which == 13 ) {
//    event.preventDefault();
//     my_sound.play('#after'); 

//   }
// }
        



$(document).ready(function() {

    soundManager.setup({
      url: '/swf/',
      preferFlash: true,
      onready: musicPlayer.setup
      
    }); // End call to soundManager.setup
}); // End document.ready function



