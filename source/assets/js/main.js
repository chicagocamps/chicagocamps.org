$(document).ready(function() {

  var $nav     = $('[data-js="primary-nav"]'),
      $navLink = $('[data-js="primary-nav-link"]');
  
  $navLink.click(function() {
    $nav.toggleClass('primary-nav-active');
    return false;
  });

});