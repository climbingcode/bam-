$( document ).ready(function() {

    function resize(){
    var divWidth = $('.img-background').width();
    $('.img-background').height(divWidth);

    };

  var initWidth = function(){ $('.image-column').width();
    $('.img-background').height(initWidth - 30);
  }

  var pricingHeight = $('#agency-column').height();
    $('#business-column').height(pricingHeight + 50);
    $('#personal-column').height(pricingHeight);

  var dashboard = $('#dashboard');
  var dashboardToggle = $('#dashboard_toggle');
  var brandPage = $('#brand-page');

    dashboardToggle.on('click', function() {
      dashboard.animate({
        'margin-left:': '-400px'
      }, 1000);
      // dashboard.toggleClass('dashboard-closed');
      $('#mobile-nav').toggleClass('open');
      var divWidth = $('.img-background').width();
      $('.img-background').height(divWidth);

    //   if(brandPage.css('width') != window.innerWidth){
    //     brandPage.animate({
    //     'width': '100%'
    //     }, 500, function(){resize()});
    //   }else if(brandPage.css('width') == window.innerWidth){
    //     brandPage.animate({
    //     'width': '75%'
    //     }, 500, function(){resize()});
    // }
 });

      // $("#brand-page").toggleClass('dashboard-closed');



      // setTimeout(function () {
      //   dashboard.toggleClass('display-none');
      // }, 20);


      // $("#multi_asset_form").animate({'left': '-500px'}, 500);
   

  $('#close-notification-icon').on('click', function() {
    $('#access-request-notification').addClass('close-notification')
    $(this).addClass('close-notification')
        setTimeout(function () {
        $('#access-request-notification').addClass('display-none')
      }, 1000);
  });

  // $('#view-notifivation-icon').on('click', function(){
  //   // $(this).addClass('close-notification');
  // });



  //Dropdown for Logo Files

  $('.switch_brand').on('click', function(){

  })


  $('.dropdown-toggle').dropdown()

  $("#primary_capital_letters").fitText(2.5);
  $("#primary_lower_case_letters").fitText(1.9);
  $("#secondary_capital_letters").fitText(2.5);
  $("#secondary_lower_case_letters").fitText(1.9);


  $(window).resize(function(){

    var divWidth = $('.img-background').width();
    $('.img-background').height(divWidth);

    var pricingHeight = $('#agency-column').height();
    $('#business-column').height(pricingHeight + 50);
    $('#personal-column').height(pricingHeight);
  });


});






