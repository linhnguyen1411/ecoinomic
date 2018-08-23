$(document).ready(function(){
  toastr.options = {
    "closeButton": true,
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut",
    "newestOnTop": true
  }
  $('#progress-percent').on('change', function(){
    var percent = $(this).val();
    if (percent > 100) {
      toastr['error']("cmm làm đéo gì lên hơn 100% rồi m");
      percent = 100;
    }
    $('#stage-progress').attr('style','width: '+percent+'%');
    $('#stage-progress').html(percent+'%')
  })

  $('#stage3').on('change', function(){
    if( $(this).val() == "on") {
      $('.stage-setting').removeClass('disabled');
    }
    else {
      alert('asdas');
     $('.stage-setting').addClass('disabled');
    }
  });
});
