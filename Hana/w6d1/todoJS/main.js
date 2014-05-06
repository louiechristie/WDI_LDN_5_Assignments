var myApp = myApp || {}



myApp.update = function(){
  // var $text = $('.item');
  var $input = $('#newItem');
 
  if($input.val()){
    // input_value = $input.val();
    // console.log(input_value)
    $("ul#list").prepend($('<li>').attr("class", "item").text($input.val()) );



 
    // $( "<p>Test</p>" ).appendTo( ".inner" );
    // $text.text($input.val());
  }

}


myApp.setup = function(){
  var $button = $("button");
  $button.on("click", myApp.update);
}

$(myApp.setup);