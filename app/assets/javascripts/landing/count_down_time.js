$(document).ready(function() {
  var clock;
  var presale = $('.presale-count').val();
  clock = $('.clock').FlipClock(presale,{
    clockFace: 'DailyCounter',
    autoStart: false,
    callbacks: {
      stop: function() {
        $('.message').html('The clock has stopped!')
      }
    }
  });
  clock.setCountdown(true);
  clock.start();
});
