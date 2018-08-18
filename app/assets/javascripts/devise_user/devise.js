$(function() {
  toastr.options = {
    "closeButton": true,
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut",
    "newestOnTop": true
  }
  $("#js-form-register").on("submit", function(e){
    e.preventDefault();
    $("#js-form-register .btn-block").attr("disabled", true);
    var actionURL = $(this).attr("action");
    var url = new URL(location.href);
    var refToken = url.searchParams.get("token_ref");

    $.ajax({
      url: actionURL + "?token_ref=" + refToken,
      method: "POST",
      dataType: "json",
      data: new FormData(this),
      processData: false,
      contentType: false,
      success: function(response) {
        setTimeOutSubmit("#js-form-register .btn-block");
        if (response.status) {
          toastr["success"](response.message_success);
          $("#js-render").html(response.html);
        } else {
          var messages = "";
          _.forEach(response.errors, function(value, key){
            messages += value + "</br>";
          })
          toastr["error"](messages);
        }
      }
    });
  });

  $("#js-form-login").on("submit", function(e){
    e.preventDefault();
    $("#js-form-login .btn-block").attr("disabled", true);
    var actionURL = $(this).attr("action");

    $.ajax({
      url: actionURL,
      method: "POST",
      dataType: "json",
      data: new FormData(this),
      processData: false,
      contentType: false,
      success: function(response) {
        if (_.isUndefined(response.id)) {
          toastr["error"]("Invalid user name or password");
          setTimeOutSubmit("#js-form-login .btn-block");
        } else {
          location.reload();
        }
      },
      complete: function() {
      }
    });
  });
});

function setTimeOutSubmit(elm) {
  setTimeout(function(){
    $(elm).attr("disabled", false);
  }, 3000);
}
