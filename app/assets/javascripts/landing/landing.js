$(document).ready(function(){
  toastr.options = {
    "closeButton": true,
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut",
    "newestOnTop": true
  }

  $("#js-subscribe-email").on("click", function() {
    var email = $("#email-subscrible").val();
    if (email != ""){
      var csrfToken = $("#authenticity_token").val();
      $.ajax({
        url: "landings/subscrible",
        method: "POST",
        dataType: "json",
        data: {email: email},
        headers: {
          'X-CSRF-Token': csrfToken
        },
        success: function(response) {
          if (!response.status_sub)
            toastr["warning"]("Subscrible ended please reload page");
          else if (response.status)
            toastr["success"]("You has subscribed");
          else {
            var messages = "";
            $.each(response.errors, function(value, key){
              messages += key + "</br>";
            })
            toastr["error"](messages);
          }
        }
      });
    } else {
      toastr["error"]("Please input your email");
    }
  })
})
