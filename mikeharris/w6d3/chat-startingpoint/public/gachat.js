var Gachat = Gachat || {};

Gachat.chat = function(ev){
  console.log();
  var data = {};
  if(ev) {
    ev.preventDefault();
  var bits =['message', 'username', 'since'];
  
  $.each(bits, function(i,name) {
        data[name] = $('#' + name).val();
  });
  } else {
    data['since'] = $('#since').val();
  }

  var ajaxOptions = {
          url: "/chat",
          type: 'POST',
          data: data,
          error: function(data) {
            console.error("ajax error");
            console.log(data);
          }
        }
  $.ajax(ajaxOptions).done(Gachat.updatePage) 
}

Gachat.flash = function(n){
      $item = $('li').slice(-n);
      $item.addClass('test');
      setTimeout(function () {
            $item.removeClass('test');
      }, 50);
}
 
Gachat.updatePage = function(data) {
     $.each(data, function(i,message) {          
          $a = ("<li><span class='username'>&lt;" + message['username']  +"&gt;</span><span class='message'> " + message['message'] + '</span></li>')
          $('ul').append($a)        
          $('#since').val(message['timestamp']);
          if($('li').length >=  10) {
              $('li:first').remove();
          }
     });
     Gachat.flash(data.length)
}

Gachat.updateRegularly = function() {
    setInterval(function() {
        Gachat.chat();
      }, 1000);
  }

Gachat.setup =function(){
   $('form').on('submit', Gachat.chat)
   Gachat.updateRegularly();
}

$(Gachat.setup);