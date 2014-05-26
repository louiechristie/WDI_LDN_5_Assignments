var musicPlayer = musicPlayer || {};

var SoundObject = [];
daft = function() {
        for(var i = 1; i <= 16; i++){
            SoundObject[i] = soundManager.createSound({
                stream: false,
                id: 'sound'+i,
                url:'/sound'+i+'.wav',
                autoPlay: false
            }).load();
        };
};

$(document).ready(function() {

$("button:not(#triggerAll)").click(function (){ //$("button").first().attr("id")
                var i = this.id;
                SoundObject[i].play();
});

$('#triggerAll').on('click',function(){
    var index = 1;
    interval = setInterval( function() {
      $('#'+index).trigger('click')
      if(index<=16){
        index++;
      }
      else{
        clearInterval(interval);
      }
    }, 500);
});


soundManager.setup({
    url: '/swf', 
    preferFlash: true,
    onready: daft
    }); //End call to soundManager.setup
}); // End document ready function
