$(document).ready(function() {
  $(".add-question").on("click", function(){
    event.preventDefault();

    var url = $(this).attr('href');
    var $that = $(this)

    var request = $.ajax({
      url: url
    });

    request.done(function(response){
      $that.hide();
      $(".add-q-form").append(response);
    });

    $(".add-q-form").on("submit", "form", function(){
      event.preventDefault();
       var url = $(this).attr("action");
       var data = $(this).serialize();
       var $that = $(this);

       var request = $.ajax({
        url: url,
        method: "Post",
        data: data
       });

       request.done(function(response){
        $("ul").append(response);
        $that.hide();
        $(".add-question").show();
       });
    });

  });
});
