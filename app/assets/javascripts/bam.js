  // var $menuTrigger = $('[data-ic-class="button-trigger"]'),
  //   $menuOverlay = $('[data-ic-class="overlay"]'),
  //   $menuItem = $('.menu-item'),
  //   activeClass = 'active';

$( document ).ready(function() {

  $('#dashboard_toggle').on('click', function() {
    console.log('hello')
    $("#dashboard").toggleClass('closed');
    $("#brand-page").toggleClass('dashboard-open');
    // $("#multi_asset_form").animate({'left': '-500px'}, 500);
    var initWidth = $('.img-background').width();
    $('.img-background').height(initWidth);
  });

  var initWidth = $('.img-background').width();
    $('.img-background').height(initWidth);

  
  $(window).resize(function(){
      var divWidth = $('.img-background').width();
      $('.img-background').height(divWidth);
  });

  $('.dropdown-toggle').dropdown()

  $("#primary_capital_letters").fitText(2.5);
  $("#primary_lower_case_letters").fitText(2.5);
  $("#secondary_capital_letters").fitText(2.5);
  $("#secondary_lower_case_letters").fitText(2.5);


});



  // $menuTrigger.click(function(){
  // $menuTrigger.toggleClass(activeClass);
  // });




