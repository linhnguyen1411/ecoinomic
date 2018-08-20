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
})

