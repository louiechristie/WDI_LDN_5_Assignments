var socket = io.connect('http://localhost:4000/');
var nickname = undefined;
var textcolor = undefined;

socket.on('connected', function(name, color) {
  $('.connecting').slideUp();
  $('input').attr('disabled', false);
  $('#name').text('Hello, '+name);
  $('#name').addClass(color);

  nickname = name
  textcolor = color;
});

socket.on('pm', function(data) {
  writeLine(data.name, data.color, data.line);
});

function writeLine(name, color, line) {
  var $span = $('<span>');
  var $li = $('<li>');
  $span.addClass('nick').text(name+": ");
  $li.addClass(color).text(line);
  $li.prepend($span);
  $('.chatlines').append($li);
};

$(function () { 
  $('form').on('submit', function(ev) {
    ev.preventDefault();
    var chattext = $('#chattext').val();
    var firstchar = chattext.split(" ")[0].charAt(0);
    var to = "All"
    console.log("firstchar: "+firstchar);
    if (firstchar == "@") {
      var atTo = chattext.split(" ")[0]
      to = atTo.substring(1, atTo.length)
    }
      socket.emit('pm', {name: nickname, to: to, color: textcolor, line: chattext});
    
    writeLine(nickname, textcolor, chattext);
    $('#chattext').val(""); 
  });
});