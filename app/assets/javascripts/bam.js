  // var $menuTrigger = $('[data-ic-class="button-trigger"]'),
  //   $menuOverlay = $('[data-ic-class="overlay"]'),
  //   $menuItem = $('.menu-item'),
  //   activeClass = 'active';

$( document ).ready(function() {

    var initWidth = $('.img-background').width();
    $('.img-background').height(initWidth);

  $('#dashboard_toggle').on('click', function() {
    $("#dashboard").toggleClass('dashboard-closed');
    $("#brand-page").toggleClass('dashboard-closed');
    $("#dashboard").toggleClass('display-none');
    $('#mobile-nav').toggleClass('open');
        var divWidth = $('.img-background').width();
      $('.img-background').height(divWidth);
    // $("#multi_asset_form").animate({'left': '-500px'}, 500);

  });

  //Dropdown for Logo Files


    

  var initWidth = $('.img-background').width();
    $('.img-background').height(initWidth);

  
  $(window).resize(function(){
      var divWidth = $('.img-background').width();
      $('.img-background').height(divWidth);
  });


  $('.dropdown-toggle').dropdown()

  $("#primary_capital_letters").fitText(2.5);
  $("#primary_lower_case_letters").fitText(1.9);
  $("#secondary_capital_letters").fitText(2.5);
  $("#secondary_lower_case_letters").fitText(1.9);


});



  // $menuTrigger.click(function(){
  // $menuTrigger.toggleClass(activeClass);
  // });





