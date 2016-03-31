$(document).ready(function () {
  $(".vote").on("click", function(event){
    event.preventDefault();
    var vote = $(this).attr("value");
    var url = $(this).parent("form").attr("action");
    var info = url.split("/");
    if (info.indexOf("questions") > 0) {
      var id = "#question-votes";
    } else {
      var id = "#answer-" + info[2] + "-votes";
    }
    console.log(id)
    var request = $.ajax({
      url: url,
      data: { vote: vote },
      method: "post"
    });
    request.done(function(response){
      var jsVotes = $(id).text(response);
      // console.log(jsVotes);
    });
  });
});
