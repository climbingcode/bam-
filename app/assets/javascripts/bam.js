$(window).resize(function(){
    var divWidth = $('.img-background').width();
    $('.img-background').height(divWidth);

    var pricingHeight = $('#agency-column').height();
    $('#business-column').height(pricingHeight + 50);
    $('#personal-column').height(pricingHeight);
  });


$( document ).ready(function() {

    // function resize(){
    // var divWidth = $('.img-background').width();
    // $('.img-background').height(divWidth);

    // };



  var initWidth = function(){ $('.image-column').width();
    $('.img-background').height(initWidth - 30);
  }

  var pricingHeight = $('#agency-column').height();
    $('#business-column').height(pricingHeight + 50);
    $('#personal-column').height(pricingHeight);


  var divWidth = $('.img-background').width();
  $('.img-background').height(divWidth);

  //DASHBOARD ==================================================

  var dashboard = $('#dashboard');
  var dashboardToggle = $('#dashboard_toggle');
  var brandPage = $('#brand-page');
  var dasboardBtn = $('#dashboard_btn')

    dasboardBtn.on('click', function() {
      alert('success')
    });

    dashboardToggle.on('click', function() {
      // dashboard.animate(
      // {
      //   'color:': 'red'
      // }, 2000);
      dashboard.toggleClass('dashboard-closed');

      setTimeout(function () {
         brandPage.toggleClass('dashboard-closed');
      });




      $('#mobile-nav').toggleClass('open');


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



  $('.dropdown-toggle').dropdown()

  $(".primary_capital_letters").fitText(2.5);
  $(".primary_lower_case_letters").fitText(2.5);
  // $(".secondary_capital_letters").fitText(2.5);
  // $(".secondary_lower_case_letters").fitText(1.9);


});

window.setInterval(function(){
  
  $(".primary_capital_letters").fitText(2.5);
  $(".primary_lower_case_letters").fitText(2.5);
    var divWidth = $('.img-background').width();
  $('.img-background').height(divWidth);
      var pricingHeight = $('#agency-column').height();
    $('#business-column').height(pricingHeight + 50);
    $('#personal-column').height(pricingHeight);

}, 1000);

// JS GRAVEYARD - - WHAT IS ALL THIS THIS???


  // $('.switch_brand').on('click', function(){

  // })


  // $('#view-notifivation-icon').on('click', function(){
  //   // $(this).addClass('close-notification');
  // });






