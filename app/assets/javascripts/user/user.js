$(document).ready(function() {
  toastr.options = {
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut",
    "newestOnTop": true
  }
  $('.btn-copy').on('click', function(){
    var copyText = document.getElementById("referral-link");
    copyText.select();
    document.execCommand("copy");
    toastr["info"]("Coppied");
  })

  $('.coin-tranfer').on('change', '#inpETH', function(){
    var inp = Number($('#inpETH').val());
    var out = inp*1200;
    $('#outNEET').val(out);
  });

  $("#js-form-change-pass").on("submit", function(e) {
    e.preventDefault();
    $("#js-form-change-pass .btn-block-ct").attr("disabled", true);
    var actionURL = $(this).attr("action");
    var url = new URL(location.href);
    $.ajax({
      url: actionURL,
      method: "PUT",
      dataType: "json",
      data: new FormData(this),
      processData: false,
      contentType: false,
      success: function(response) {
        setTimeOutSubmit("#js-form-change-pass .btn-block-ct");
        if (response.status) {
          toastr["success"](response.message_success);
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
});
function setTimeOutSubmit(elm) {
  setTimeout(function(){
    $(elm).attr("disabled", false);
  }, 2000);
}
