var myApp = myApp || {}

myApp.update = function(){
  // var $text = $('.item');
  var $input = $('#newItem');
 
  if($input.val()){
    // input_value = $input.val();
    // console.log(input_value)
    $("table tbody").append($('<tr><td></td><td></td></tr>'));
    $lastTr = $("table tbody tr").last();
      $lastTr.find('td').first().text($input.val());
      $lastTr.find('td').last().text($('<input type="radio"/>'));

    // $("ul#list").prepend($('<li>').attr("class", "item").text($input.val()) ); 
    // $( "<p>Test</p>" ).appendTo( ".inner" );
    // $text.text($input.val());
  }

}


myApp.setup = function(){
  var $button = $("button");
  $button.on("click", myApp.update);
}

$(myApp.setup);