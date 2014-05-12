var musicPlayer = musicPlayer || {};

musicPlayer.play = function(ev) {
  var el = ev.currentTarget;
  
  console.log(ev.currentTarget);
  console.log(el.id);
  var id= el.id;
  var $playButton = $('#'+id);
  
  var mySound = soundManager.createSound({
    id: id,
    url: id+'.wav'
  });
    console.info('Playing: '+id);
    mySound.play();
};

musicPlayer.setup = function() {
  var ids = ['after', 'better', 'do_it']
  $.each(ids, function(i, id) {
    console.log('#'+id);
    $('#'+id).on('click', musicPlayer.play);
  });
}

$(document).ready(function() {
  soundManager.setup({
    url: '/swf/',
    preferFlash: true,
    onready: musicPlayer.setup
  }); // End call to soundManager.setup
}); // End call to document.ready function
