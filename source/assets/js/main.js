$(document).ready(function() {

  // Navigation

  var $nav     = $('[data-js="primary-nav"]'),
      $navLink = $('[data-js="primary-nav-link"]');
  
  $navLink.click(function() {
    $nav.toggleClass('primary-nav-active');
    return false;
  });

  // iPad hover

  $('[data-js="primary-nav"]').on("touchstart", function (e) {
    "use strict"; // Satisfy the code inspectors
    var nav = $(this); // Preselect the nav
    if (nav.hasClass('primary-nav-hover')) {
      return true;
    } else {
      nav.addClass("primary-nav-hover");
      $('[data-js="primary-nav"]').not(this).removeClass("primary-nav-hover");
      e.preventDefault();
      return false; // Extra, and to make sure the function has consistent return points
    }
  });

  // Forms

  var $form             = $('[data-js="form"]'),
      $formConfirmation = $('[data-js="form-confirmation"]');

  $form.submit(function() {
    $form.toggle();
    $formConfirmation.toggle();
  });

  // On page scrolling slide

  $(function(){
    $('a[href*=#]').click(function() {
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
        var $target = $(this.hash);
        $target = $target.length && $target || $('[name=' + this.hash.slice(1) +']');
        if (Modernizr.mq('screen and (max-width: 740px)')) {
          if ($target.length) { var targetOffset = $target.offset().top - 54;
            $('html,body').animate({scrollTop: targetOffset}, 1000);
            return false;
          }
        }
        if (Modernizr.mq('screen and (min-width: 741px)')) {
          if ($target.length) { var targetOffset = $target.offset().top - 120;
            $('html,body').animate({scrollTop: targetOffset}, 1000);
            return false;
          }
        }
      }
    });
  });

});
