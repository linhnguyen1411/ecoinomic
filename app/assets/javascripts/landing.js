//= require jquery
//= require jquery_ujs
//= require landing/theme-assets/vendors/particles.min.js
//= require landing/theme-assets/vendors/vendors.min.js
//= require landing/theme-assets/vendors/flipclock/flipclock.min.js
//= require landing/theme-assets/vendors/particles.js
//= require swiper
//= require_tree ./landing
var clock;
$(document).ready(function() {
  var clock;
  clock = $('.clock').FlipClock({
    clockFace: 'DailyCounter',
    autoStart: false,
    callbacks: {
      stop: function() {
        $('.message').html('The clock has stopped!')
      }
    }
  });
  clock.setTime(5000000);
  clock.setCountdown(true);
  clock.start();
});
