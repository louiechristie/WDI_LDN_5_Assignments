function handleResponse(data){
  console.log('GOt from server: ' + data);
}

function handleClick(e) {
  var text = $('#comment').val();
  console.log('user typed: ' + text);
  $('#output').append('<li>' + text + '</li>');
  $.ajax('/',{
    type: 'POST',
    data: {
      text: text
    },
    success: handleResponse,
    error:
  });
}

$(document).ready(function(){
  $('#GAButton').click(handleClick);
})