$(document).ready(function(){
  toastr.options = {
    "closeButton": true,
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut",
    "newestOnTop": true
  }

  $('.js-tilt').tilt({
    scale: 1.1
  });

  $("#js-form-login").on("submit", function(e){
    e.preventDefault();
    $("#js-form-login .btn-block").attr("disabled", true);
    var actionURL = $(this).attr("action");
    var flag = true;

    $.ajax({
      url: actionURL,
      method: "POST",
      data: new FormData(this),
      processData: false,
      contentType: false,
      success: function(response) {
        if (!_.isUndefined(response)) {
          flag = false;
          toastr["error"]("Invalid user name or password");
          setTimeOutSubmit("#js-form-login .btn-block");
        } else {
          location.href = location.origin + "/admin/dashboard";
        }
      },
      complete: function() {
        if (flag){
          location.href = location.origin + "/admin/dashboard";
        }
      }
    });
  });
});

function setTimeOutSubmit(elm) {
  setTimeout(function(){
    $(elm).attr("disabled", false);
  }, 2000);
}
