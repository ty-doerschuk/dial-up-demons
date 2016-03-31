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


  $(".a-comment").on("click", function(){
    event.preventDefault();

    var $that = $(this);
    var url = $(this).attr('action');
    var data = $(this).serialize();
    var request = $.ajax({
      url: url,
      data: data
    });

    request.done(function(response){
      $that.hide();
      $(".a-c-form").append(response);
    });


    $(".answer-container").on("submit", "._a_c_form", function(){
      event.preventDefault();
      $that = $(this);

      var url = $(this).attr('action')
      var data = $(this).serialize();
      var request = $.ajax({
        url: url,
        data: data,
        method: "post"
      });

      request.done(function(response){
        $that.remove();
        $(".a-comment").show();
        $(".comments ul").append(response);
      })
    });
  });

  $(".comments > form").on("click", function(){
    event.preventDefault();

    var $that = $(this);
    var url = $(this).attr('action');
    var data = $(this).serialize();

    var request = $.ajax({
      url: url,
      data: data
    });

    request.done(function(response){
      $that.hide();
      $(".comments").append(response);
    });
  });

  $(".comments").on("submit", "._q_c_form", function(){
    event.preventDefault();

    var $that = $(this);
    var url = $(this).attr('action');
    var data = $(this).serialize();

    var request = $.ajax({
      url: url,
      data: data,
      method: "post"
    });

    request.done(function(response){
      $that.hide();
      $(".comments").show();
      $("ul").append(response);
    });
  });

});
