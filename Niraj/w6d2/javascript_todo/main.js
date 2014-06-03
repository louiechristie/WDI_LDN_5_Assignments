$(document).ready(function(){

  $("#button").click(function(event){
       event.preventDefault();

    var titleVal = document.getElementById('title').value;
    var descriptionVal = document.getElementById('description').value;
    var dateVal = document.getElementById('date').value;

    var completed = $("#radiobuttons input:radio").click(function() {
    $("completed").val($(this).val());
    });

    $("ol").append("<li>" +  titleVal + " " + descriptionVal + " " + dateVal + completed + "</li>");
  });

});
