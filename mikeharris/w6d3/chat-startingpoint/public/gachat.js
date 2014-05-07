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
    $('#message').val(""); 
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
      $item.addClass('flash');
      setTimeout(function () {
            $item.removeClass('flash');
            Gachat.styleList();
      }, 50);
}
 
Gachat.updatePage = function(data) {
     $.each(data, function(i,message) {          
          $a = ("<li><span class='username'>" + message['username']  +"</span><span class='message'> " + message['message'] + '</span></li>')
          $('ul').append($a)        
          $('#since').val(message['timestamp']);
          if($('li').length >  10) {
              $('li:first').remove();
          }
     });
     Gachat.flash(data.length);
     Gachat.styleList();
}

Gachat.updateRegularly = function() {
    setInterval(function() {
        Gachat.chat();
      }, 1000);
  }

Gachat.styleList = function() {
    $items = $('li')
    $username = $('#username').val();
    $items.each(function(i) {
          if($items.eq(i).find('.username').text() === $username) {
            $items.eq(i).addClass('current_user')
            $items.eq(i).removeClass('user1')
            } else {
              $items.eq(i).addClass('user1')
              $items.eq(i).removeClass('current_user')
            }
    });
}

Gachat.setup =function(){
   $('form').on('submit', Gachat.chat)
   Gachat.styleList();
   Gachat.updateRegularly();
}

$(Gachat.setup);