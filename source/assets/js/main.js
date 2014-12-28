$(document).ready(function() {

  // Navigation

  var $nav     = $('[data-js="primary-nav"]'),
      $navLink = $('[data-js="primary-nav-link"]');
  
  $navLink.click(function() {
    $nav.toggleClass('primary-nav-active');
    return false;
  });

  // Forms

  var $form             = $('[data-js="form"]'),
      $formConfirmation = $('[data-js="form-confirmation"]');

  $form.submit(function() {
    $form.toggle();
    $formConfirmation.toggle();
  });

});