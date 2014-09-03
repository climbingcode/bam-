
$('#lh-background').css('background-color', 'blue');



// var businessCardOperations = {
  
//   initializeListeners: function(){
//     $('.open_business_card_modal').on('click', function(e) {
//       e.preventDefault()    
//       $('business_card_pdf').addClass('business_card_preview');
//     }); 

//     $('.change_background').on('click', function(e) {
//       e.preventDefault();
//       var color = $(this).data("color");
//       $(element).attr("no_background", "background-color")
//     });


//     $('#add_border').on('click', function(e) {
//       e.preventDefault();
//       $('.no_border').toggleClass('add_card_border');
//     });

//     $('.change_image').on('click', function(e) {
//       e.preventDefault();
//       var imageString = $(this).data("image");
//       var image = imageString.slice(1);
//       var source = $('<img>').attr('src', image).addClass('business_image_format')
//       if($('.business_card_pdf').find('img') != 'undefined') {
//           $('#business_card_image').find('img').remove();
//         };
//         $(source).appendTo('#business_card_image');
//     });

//     // FIND ALL STYLES

//     $('#business_card_generation').on('click', function(e) {
//       styles = document.getElementsByClassName('business_card_pdf')
//       console.log(styles)
//     });
//   }
// };