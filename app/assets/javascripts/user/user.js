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
})

