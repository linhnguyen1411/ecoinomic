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
     $('.stage-setting').addClass('disabled');
    }
  });

  $('#position-select').on('change', function(){
    $('.image-choise-note').html($("option:selected", this).data('note'));
  })

  $('#update-image').on('submit', function(e) {
    e.preventDefault();
    $.ajax({
      url: 'images',
      method: "POST",
      dataType: "script",
      data: new FormData(this),
      processData: false,
      contentType: false,
      success: function(response) {
      }
    });
  });
});
