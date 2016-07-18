$(document).ready(function() {
  $('.vote-button').on('click', function(event){
    event.preventDefault();
    var theLink = $(this)
    var url = $(this).attr('href');

    var ajaxRequest = $.ajax({
      type: "GET",
      url: url
    })

    ajaxRequest.done(function(response){
      $("#"+response.id).find(".points").html(response.votes)
      // $(theLink).parent().find(".points").html(response.votes)
      $(theLink).css("color", "red");
    });
  });

  $('.delete').on('click', function(event){

  });
});
