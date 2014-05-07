var Gachat = Gachat || {};

Gachat.chat = function(ev){
  ev.preventDefault();
  var bits =['message', 'username', 'since'];
  var data = {};
  $.each(bits, function(i,name) {
      // console.log(name)
      // console.log('#' + name);
      // console.log($('#' + name).val());
      data[name] = $('#' + name).val();
  });

  console.log(data);

  var ajaxOptions = {
          url: "/chat",
          type: 'POST',
          data: data,
          error: function(data) {
            console.error("ajax error");
            console.log(data);
          }
        }
  $.ajax(ajaxOptions);  
}


Gachat.setup =function(){
   $('form').on('submit', Gachat.chat)
}



$(Gachat.setup);