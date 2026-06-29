// ==================================================
// * Project Name   :  Udemo - Education, Online Course, LMS Creative Site Template
// * File           :  JS Base
// * Version        :  1.0.0
// * Last change    :  14 October 2022, Friday
// * Author         :  FroxTheme (https://themeforest.net/user/froxtheme)
// * Developer      :  webrok (https://www.fiverr.com/webrok?up_rollout=true)
// ==================================================

(function($) {
  "use strict";

  // Mobile menu toggle - Start
  // --------------------------------------------------
  $(document).on('click', '.mobile_menu_btn', function() {
    var $target = $($(this).data('bs-target'));
    $target.toggleClass('show');
    $(this).attr('aria-expanded', $target.hasClass('show'));
  });
  // Mobile menu toggle - End
  // --------------------------------------------------

  // Back To Top - Start
  // --------------------------------------------------
  $(window).scroll(function() {
    if ($(this).scrollTop() > 200) {
      $('.backtotop:hidden').stop(true, true).fadeIn();
    } else {
      $('.backtotop').stop(true, true).fadeOut();
    }
  });
  $(function() {
    $(".scroll").on('click', function() {
      $("html,body").animate({scrollTop: 0}, "slow");
      return false
    });
  });
  // Back To Top - End
  // --------------------------------------------------

  // sticky header - Start
  // --------------------------------------------------
  $(window).on('scroll', function () {
    if ($(this).scrollTop() > 60) {
      $('header').addClass("sticky");
    } else {
      $('header').removeClass("sticky");
    }
  });
  // sticky header - End
  // --------------------------------------------------

  // Preloader - Start
  // --------------------------------------------------
  // $(window).on('load', function(){
  //   $('#preloader').fadeOut('slow',function(){$(this).remove();});
  // });
  // Preloader - End
  // --------------------------------------------------

  // Tooltip - Start
  // --------------------------------------------------
  /*var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  });*/
  // Tooltip - End
  // --------------------------------------------------

  // OffCanvas - Start
  // --------------------------------------------------
  // $(document).ready(function () {
  //   $('.cart_close_btn, .cart_sidebar_overlay').on('click', function () {
  //     $('.cart_sidebar').removeClass('active');
  //     $('.cart_sidebar_overlay').removeClass('active');
  //   });

  //   $('.cart_btn').on('click', function () {
  //     $('.cart_sidebar').addClass('active');
  //     $('.cart_sidebar_overlay').addClass('active');
  //   });
  // });
  // OffCanvas - End
  // --------------------------------------------------

  // wow js - Start
  // --------------------------------------------------
  var wow = new WOW({
    animateClass: 'animated',
    offset: 100,
    mobile: true,
    duration: 1000,
  });
  wow.init();
  // wow js - End
  // --------------------------------------------------

  // Mouse Move Parallax - Start
  // --------------------------------------------------
  $('.mouse_move').parallax({
    scalarX: 10.0,
    scalarY: 10.0,
  });
  // Mouse Move Parallax - End
  // --------------------------------------------------

  // Tilt - Start
  // --------------------------------------------------
  $('.tilt').tilt({
    maxTilt:        20,
    perspective:    1000,
    scale:          1.02,
    speed:          1000,
    glare:          false,
    maxGlare:       1
  });
  // Tilt - End
  // --------------------------------------------------

  // Dropdown - Start
  // --------------------------------------------------
  $('.dropdown').hover(function() {
    $(this).find('.dropdown-menu').addClass('show');
  }, function() {
    $(this).find('.dropdown-menu').removeClass('show');
  });
  // Dropdown - End
  // --------------------------------------------------

 
  // Counter Up - End
  // --------------------------------------------------

  
  
  // Videos & Images popup - End
  // --------------------------------------------------

})(jQuery);