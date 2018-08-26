$(document).ready(function() {
  clockTime();
});
function clockTime() {
  var clock;
  var presale = $('.presale-count').val();
  clock = $('.clock').FlipClock(presale,{
    clockFace: 'DailyCounter',
    autoStart: false,
    callbacks: {
      stop: function() {
        $.ajax({
          url: "landing/landings",
          method: "GET",
          success: function(response) {
            $(".token-sale-counter").replaceWith(response.html);
            clockTime();
          }
        });
      }
    }
  });
  clock.setCountdown(true);
  clock.start();
}
