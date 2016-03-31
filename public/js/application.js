$(document).ready(function () {
  $(".vote").on("click", function(event){
    event.preventDefault();
    var vote = $(this).attr("value");
    var url = $(this).parent("form").attr("action");
    console.log(vote);
    var request = $.ajax({
      url: url,
      data: { vote: vote },
      method: "post"
    });
    request.done(function(response){
      $('.container').append(response);
    });
  });
});
