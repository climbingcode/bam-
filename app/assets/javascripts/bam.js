  // var $menuTrigger = $('[data-ic-class="button-trigger"]'),
  //   $menuOverlay = $('[data-ic-class="overlay"]'),
  //   $menuItem = $('.menu-item'),
  //   activeClass = 'active';

$( document ).ready(function() {

  var initWidth = $('.image-column').width();
  $('.img-background').height(initWidth - 30);

  var pricingHeight = $('#agency-column').height();
  $('#business-column').height(pricingHeight + 50);
  $('#personal-column').height(pricingHeight);

  $('#dashboard_toggle').on('click', function() {
    $("#dashboard").toggleClass('dashboard-closed');
    $("#brand-page").toggleClass('dashboard-closed');
    $("#dashboard").toggleClass('display-none');
    $('#mobile-nav').toggleClass('open');
      var divWidth = $('.img-background').width();
      $('.img-background').height(divWidth);
    // $("#multi_asset_form").animate({'left': '-500px'}, 500);

  });

  $('#close-notification-icon').on('click', function() {
    $('#access-request-notification').addClass('close-notification');



});

  $(window).resize(function(){
    var divWidth = $('.img-background').width();
    $('.img-background').height(divWidth);

    var pricingHeight = $('#agency-column').height();
    $('#business-column').height(pricingHeight + 50);
    $('#personal-column').height(pricingHeight);
  });

  //Dropdown for Logo Files

  $('.switch_brand').on('click', function(){
    alert('hello')
  })
  $('.dropdown-toggle').dropdown()

  $("#primary_capital_letters").fitText(2.5);
  $("#primary_lower_case_letters").fitText(1.9);
  $("#secondary_capital_letters").fitText(2.5);
  $("#secondary_lower_case_letters").fitText(1.9);





});



  // $menuTrigger.click(function(){
  // $menuTrigger.toggleClass(activeClass);
  // });





