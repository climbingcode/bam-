var colorOperations = {

 cutHex: function(hex) {
   return (hex.charAt(0)=="#") ? hex.substring(1,7):hex;
 },

 // Converting Hex to R, G and B values.

 hexToR: function(hex) {
   return parseInt((colorOperations.cutHex(hex)).substring(0,2),16)
 },

 hexToG: function(hex) {
   return parseInt((colorOperations.cutHex(hex)).substring(2,4),16)
 },

 hexToB: function(hex) {
   return parseInt((colorOperations.cutHex(hex)).substring(4,6),16)
 },

 hexToCMYK: function(hex) {
    var computedC = 0;
    var computedM = 0;
    var computedY = 0;
    var computedK = 0;

    hex = (hex.charAt(0)=="#") ? hex.substring(1,7) : hex;

    var r = colorOperations.hexToR(hex); 
    var g = colorOperations.hexToG(hex); 
    var b = colorOperations.hexToB(hex); 

    // BLACK
    if (r==0 && g==0 && b==0) {
     computedK = 1;
     return [0,0,0,1];
    }

    computedC = 1 - (r/255);
    computedM = 1 - (g/255);
    computedY = 1 - (b/255);

    var minCMY = Math.min(computedC,Math.min(computedM,computedY));

    computedC = Math.round( 100 * (computedC - minCMY) / (1 - minCMY)) ;
    computedM = Math.round( 100 * (computedM - minCMY) / (1 - minCMY)) ;
    computedY = Math.round( 100 * (computedY - minCMY) / (1 - minCMY)) ;
    computedK = Math.round(100 * minCMY);

    return [computedC + "% ", " " + computedM + "% ", " " + computedY + "% ", " " + computedK + "%"];
 },

 destroyColor: function(event) { 
   ajaxOperations.destroyAsset(event, "color"); 
 },

 createNewColor: function(data) {

   var $color = $("#color");
   var r = colorOperations.hexToR(data.hex);
   var g = colorOperations.hexToG(data.hex);
   var b = colorOperations.hexToG(data.hex);
   var upperCaseHex = data.hex.toUpperCase();
   var colorWrapper = $("<div>").attr("id", "color" + data.id).addClass("col-sm-4 swatch-wrapper");
   var targetColor = "#color"+data.id; 
   var colorDelete = $("<a>").attr("href", "#").data("colorid", data.id).addClass("delete-asset");
   var copyAlert = $("<div>").addClass('copy-alert');
   var copyAlertMessage = $("<p>").html('Copied!').addClass('copy-alert-message');
   var colorSwatch = $("<div>").addClass("swatch").css("background-color", "#"+data.hex);
   var colorList = $("<ul>").addClass("color-list");
   var colorName = $("<li>").addClass("color-name").data("colorid", data.id).html(data.name);
   var colorHex = $("<li>").html("CSS HEX: <span class='copy_text' data-clipboard-text>#" + upperCaseHex +  "</span>" + "<span class='clipboard hex-clipboard'></span>");
   var colorRgb = $("<li>").html("RGB: <span>" + r + ", " + g + ", "+ b + "</span>");
   var colorCmyk = $("<li>").html("CMYK: <span>" + colorOperations.hexToCMYK(data.hex) + "</span>");
   var colorListItems = targetColor + " ul.color-list";
   var colorSass = $("<li>").html("Sass: <span class='sass'>$" + data.name +  ": #" + upperCaseHex + ";</span>" + "<span class='clipboard sass-clipboard'></span>");

   $color.append(colorWrapper);
   colorSwatch.appendTo(colorWrapper);
   copyAlertMessage.appendTo(copyAlert);
   copyAlert.appendTo(colorSwatch);
   colorList.appendTo(colorWrapper);
   colorName.appendTo(colorList);
   colorDelete.appendTo(colorName);
   colorHex.appendTo(colorListItems);
   colorRgb.appendTo(colorListItems);
   colorCmyk.appendTo(colorListItems);
   colorSass.appendTo(colorListItems);

   $(".color-name .delete-asset").on("click", function(event){
     colorOperations.destroyColor(event);
   });

   colorOperations.colorToClipboard();

 },

 colorToClipboard: function(){

   var hexClipboard = new ZeroClipboard( $('.hex-clipboard') );

     hexClipboard.on( 'ready', function(event) {

       hexClipboard.on( 'copy', function(event) {
         var targetText = $(event.target).parents('li').find('.copy_text').text();
         event.clipboardData.setData('text/plain', targetText);
       });

       hexClipboard.on( 'aftercopy', function(event) {
         console.log('Copied text to clipboard: ' + event.data['text/plain']);

         var copyAlert = $(event.target).parents('.swatch-wrapper').find('.copy-alert')

         copyAlert.toggleClass('copied')

         setTimeout(function () {
           copyAlert.toggleClass('copied')
         }, 1000);

       });

     });

     hexClipboard.on( 'error', function(event) {
       // console.log( 'ZeroClipboard error of type "' + event.name + '": ' + event.message );
       ZeroClipboard.destroy();

   });

         var sassClipboard = new ZeroClipboard( $('.sass-clipboard') );

     sassClipboard.on( 'ready', function(event) {

       sassClipboard.on( 'copy', function(event) {
         var targetText = $(event.target).parents('li').find('.sass').text();
         event.clipboardData.setData('text/plain', targetText);
       });

       sassClipboard.on( 'aftercopy', function(event) {
         console.log('Copied text to clipboard: ' + event.data['text/plain']);

         var copyAlert = $(event.target).parents('.swatch-wrapper').find('.copy-alert')

         copyAlert.toggleClass('copied')

         setTimeout(function () {
           copyAlert.toggleClass('copied')
         }, 1000);

       });

     });

     sassClipboard.on( 'error', function(event) {
       // console.log( 'ZeroClipboard error of type "' + event.name + '": ' + event.message );
       ZeroClipboard.destroy();

   });

 }

};


var logoOperations = {


 destroyLogo: function(event){ 
   ajaxOperations.destroyAsset(event, "logo");
 },

 addNewLogo: function(logo) {

   var logoId = logo.result.id;
   var logoPath = logo.result.path.url;
   var logoName = logo.result.name;
   var logoDescription = logo.result.description;
   var $logoParent = $("#logos");
   var logoWrapper = $("<div>").attr("id", "logo" + logoId).addClass("col-sm-4").data("logoid", logoId);
   var logoBackground = $("<div>").addClass("img-background").css("height", "339px");
   var logoPicture = $("<img>").attr("src", logoPath).addClass("img-responsive logo");
   var logoMeta = $("<div>").addClass("logo-meta");
   var logoDeleteLink = $("<a>").attr("href", "#").data("logoid", logoId).addClass("delete-asset"); 
   var logoLabel = $("<label>").addClass("img-label").html(logoName);
   var logoOptions = $("<div>").addClass("logo-options");
   var logoCaret = $("<span>").addClass("caret");
   var logoDropDownLink = 
         $("<a>").attr({
             "href" : "#",
             "data-toggle" : "dropdown"
           }).addClass("dropdown-toggle").html("Options");
   var logoMenu = $("<ul role='menu'>").addClass("dropdown-menu");
   var logoMenuHeader = $("<li>").addClass("dropdown-header").html("Download");
   var logoMenuDivider = $("<li>").addClass("divider");
   var logoAi = $("<li>");
   var logoPng = $("<li>");
   var logoJpg = $("<li>");
   var logoToAiLink = $("<a>").attr("href", "#").html(logoName + ".ai");
   var logoToPngLink = $("<a>").attr("href", "#").text(logoName + ".png");
   var logoToJpgLink = $("<a>").attr("href", "#").text(logoName + ".jpg");

   logoBackground.appendTo(logoWrapper);
   logoPicture.appendTo(logoBackground);
   logoMeta.appendTo(logoWrapper);
   logoDeleteLink.appendTo(logoMeta);
   logoLabel.appendTo(logoMeta);
   logoOptions.appendTo(logoMeta);
   logoOptions.html(logoDropDownLink);
   logoDropDownLink.appendTo(logoOptions);
   logoCaret.appendTo(logoDropDownLink);
   logoMenu.appendTo(logoOptions);
   logoMenuHeader.appendTo(logoMenu);
   // logoMenuDivider.appendTo(logoMenu);
   logoAi.appendTo(logoMenu);
   logoToAiLink.appendTo(logoAi);
   logoPng.appendTo(logoMenu);
   logoToPngLink.appendTo(logoPng);
   logoJpg.appendTo(logoMenu);
   logoToJpgLink.appendTo(logoJpg);


    $logoParent.append(logoWrapper);


   $('.dropdown-toggle').dropdown();

   $(".logo-meta .delete-asset").on("click", function(event){
     logoOperations.destroyLogo(event);
   });

 } 

};

var typographyOperations = {

   destroyTypography: function(event){
     ajaxOperations.destroyAsset(event, "font");
   },  

   addTypography: function(data){

     var fontName = data.name;
     var fontFamily = data.font_family;
     var upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
     var $typo = $("#typography");
     var lowerCaseLetters = upperCaseLetters.toLowerCase();
     var typoWrapper = $("<div>").attr("id", "font" + data.id).addClass("letters_wrapper col-sm-10");
     var typoFontHeader = $("<div>").addClass("font-header");
     var typoFontDelete = $("<a>").attr('href', '#').data("fontid", data.id).addClass("asset-delete");
     var typoFontDescription = $("<h3>").addClass("font-description").html(fontName + ":");
     var typoFontFamily = $("<h3>").addClass("font-name").html(fontFamily);
     var lineDivider = $("<hr>");
     var typoCapitalLetters = $("<p>").addClass("primary_capital_letters").css("font-family", fontFamily).html(upperCaseLetters);
     var typoLowerCaseLetters = $("<p>").addClass("primary_lower_case_letters").css("font-family", fontFamily).html(lowerCaseLetters);


     typoFontHeader.appendTo(typoWrapper);
     typoFontDescription.appendTo(typoFontHeader); 
     typoFontFamily.appendTo(typoFontHeader);
     typoFontDelete.appendTo(typoFontHeader)
     $("<hr>").appendTo(typoWrapper);
     typoCapitalLetters.appendTo(typoWrapper);
     typoLowerCaseLetters.appendTo(typoWrapper);
     lineDivider.appendTo(typoWrapper);
     $typo.append(typoWrapper);
 }

};

var copyOperations = {

 destroyCopy: function(event) {
   ajaxOperations.destroyAsset(event, "copie");
 },

 addNewCopy: function(data) {

   var $copy = $('#copy')
   var copyId = data.id;
   var copyDesc = data.description;
   var copyText = data.text;
   var copyWrapper = $('<div>').attr("id", "copie" + data.id).addClass('copy-text');
   var copyDelete = $('<a>').attr('href', '#').addClass('delete-asset').data("copieid", data.id);
   var copyDescription = $('<h3>').text(copyDesc).append('<hr>').addClass('header');
   var copyBody = $('<h4>').text(copyText).append('<hr>');


   copyDescription.appendTo(copyWrapper);
   copyDelete.appendTo(copyDescription);
   copyBody.appendTo(copyWrapper);

   $copy.append(copyWrapper);

   $(".copy-text .delete-asset").on('click', function(event) {
     copyOperations.destroyCopy(event);
   });
 },
};

var guidelineOperations = {

 destroyGuide: function(event) {
   ajaxOperations.destroyAsset(event, "guideline");
 },

 addNewGuide: function(data) {
   var $guide = $('#guide')
   var guideId = data.id;
   var guideDesc = data.description;
   var guideText = data.text;
   var guideWrapper = $('<div>').addClass('guide-text').attr("id", "guideline" + data.id);
   var guideDelete = $('<a>').attr('href', '#').addClass('delete-asset').data("guidelineid", data.id);
   var guideDescription = $('<h3>').text(guideDesc).append('<hr>').addClass('header');
   var guideBody = $('<h4>').text(guideText).append('<hr>');


   guideDescription.appendTo(guideWrapper);
   guideDelete.appendTo(guideDescription);
   guideBody.appendTo(guideWrapper);
   $guide.append(guideWrapper);

   $(".guide-text .delete-asset").on('click', function(event) {
     $('#guide-add-message').remove();
     guidelineOperations.destroyGuide(event);
   });

 },
};


var interfaceOperations = {

 hideFileUpload: function(){
   $('#hide-file-upload').css({
     'visibility': 'hidden'
   })

 },

 displayAdvisory: function(message) {
   var advisory = $("#user-action-messages");
   var showClass = "user-action-messages-show";
   var hideClass = "user-action-messages-hidden";
   var messageHolder = $("<p>").addClass("advisory-message").html(message);
   advisory.append(messageHolder); 
   advisory.removeClass(hideClass).addClass(showClass);
   setTimeout(function(){
     advisory.removeClass(showClass).addClass(hideClass);
     advisory.empty();
   }, 2500);
 },

 deleteAssetEvents: function(){
   $(".color-name  .delete-asset").on("click", function(event){
     colorOperations.destroyColor(event);
   });

   $(".logo-meta .delete-asset").on("click", function(event){
     logoOperations.destroyLogo(event);
   });

   $(".font-header .delete-asset").on("click", function(event){
     typographyOperations.destroyTypography(event);
   });

   $(".copy-text .delete-asset").on('click', function(event) {
     copyOperations.destroyCopy(event);
   });

   $(".guide-text .delete-asset").on('click', function(event) {
     guidelineOperations.destroyGuide(event);
   });
 },

 dashBoardEvents: function(){
   $('#dashboardTab').on("click", "dashboardTab", function (e) {
     e.preventDefault()
     $(this).tab('show')
   });

   $('#accountTab').on("click", "accountTab", function (e) {
     e.preventDefault()
     $(this).tab('show')
   });
 },

 validationActions: function(){

 },

 initializeListeners: function(){
   interfaceOperations.deleteAssetEvents();
   interfaceOperations.dashBoardEvents();
 }


};

var ajaxOperations = {

 destroyAsset: function(event, assetName) {
   event.preventDefault();
   var $target = $(event.target);
   console.log($target);
   var assetId = $target.data(assetName + "id");
   var path = window.location.pathname + "/" + assetName + "s/"+ assetId;
   var $elementToRemove = $("#" + assetName + assetId); 
   $.ajax({
     type: "DELETE",
     url: path,
     dataType: "json",
     success: function(response){
       console.log(response);
       $elementToRemove.slideUp("fast");
       interfaceOperations.displayAdvisory("Asset deleted");
     }
   });
 },

 uploadSuccessEvents: function(){

   $('#new_color').on('ajax:success', function(e,data) {
     $('#no-color').remove();
     colorOperations.createNewColor(data);
   });

   $('#new_copy').on('ajax:success', function(e,data) {
     $('#copy-add-message').remove();
     copyOperations.addNewCopy(data);
   });

   $('#new_font').on('ajax:success', function(e, data){
     typographyOperations.addTypography(data);
   }); 

   $("#new_guideline").on('ajax:success', function(e, data) {
     $('#guide-add-message').remove();
     guidelineOperations.addNewGuide(data)
   });

 },

 ajaxFileUploadActions: function() {

     $('#new_logo').fileupload({
       dataType: 'json',
       // drop: function(e, data){
       //   $.each(data.files, function(index, file){
       //     // $('#upload_file_name').append("<p>" + file.name +"</p>");
       //   });
       // },

       // change: function(e, data){
       //   $.each(data.files, function(index, file){
       //     // $('#upload_file_name').append("<p>" + file.name +"</p>");
       //   });
       // },

       add: function(e, data){

         data.context = $(tmpl("logo_upload", data.files[0]))
           console.log(data.files);
           $('#logo-upload-status').append(data.context)
           $("#logo_submit").on("click", function(event){
             event.preventDefault();

               data.submit();
         var assetPathInput = $('logo_submit');
         assetPathInput.wrap("<form>").parent("form").trigger("reset");
         console.log(assetPathInput);
             });
         },

       progress: function(e, data){
         if(data.context){
           console.log(data);
           var progress = parseInt(data.loaded / data.total * 100, 10);
           data.context.find('.file-progress-strip').css('width', progress + '%');
         };
       },

       done: function(e, data){
         console.log("success!", data);
         var assetName = data.name;
         logoOperations.addNewLogo(data);
         interfaceOperations.displayAdvisory("Logo Uploaded")
         $("#logo_name").val("");
         $("#logo_description").val("");
         // assetPathInput.unwrap();
         console.log(data.files, data.files.length);
         data.files = [];
         data.originalFiles = [];
         console.log(data.files.length);
         $("#logo-upload-status").empty();
       }
     });

     $('#new_misc_asset').fileupload({
       dataType: 'json',
       done: function(e, data){
         console.log(data)
       }
     });
 },

 initializeListeners: function(){
   ajaxOperations.ajaxFileUploadActions();
   ajaxOperations.uploadSuccessEvents();
 }
};

var letterheadOperations = {

  initializeListeners: function(){

   var path = window.location.pathname
   console.log(path)

   $.ajax({
   type: "GET",
   url: path,
   dataType: "json",
   success: function(data){
       console.log(data) 
     }
   });

   $('.letter_head_one').on('click', function() {
     $('.lh-background').toggleClass('lh-background-one');
   });

   $('.letter_head_two').on('click', function() {
     $('.lh-background').toggleClass('lh-background-two');
   });
 } 
}

var businessCardOperations = {

 initializeListeners: function(){
   $('.open_business_card_modal').on('click', function(e) {
     e.preventDefault()    
     $('business_card_pdf').addClass('business_card_preview');
   }); 

   $('.change_background').on('click', function(e) {
     e.preventDefault();
     var color = $(this).data("color");
     $(element).attr("no_background", "background-color")
   });


   $('#add_border').on('click', function(e) {
     e.preventDefault();
     $('.no_border').toggleClass('add_card_border');
   });

   $('.change_image').on('click', function(e) {
     e.preventDefault();
     var imageString = $(this).data("image");
     var image = imageString.slice(1);
     var source = $('<img>').attr('src', image).addClass('business_image_format')
     if($('.business_card_pdf').find('img') != 'undefined') {
         $('#business_card_image').find('img').remove();
       };
       $(source).appendTo('#business_card_image');
   });

   // FIND ALL STYLES

   $('#business_card_generation').on('click', function(e) {
     styles = document.getElementsByClassName('business_card_pdf')
     console.log(styles)
   });
 }
};

var brandPageInit = function(){

 ajaxOperations.initializeListeners();
 businessCardOperations.initializeListeners();
 interfaceOperations.initializeListeners();
 colorOperations.colorToClipboard();
 interfaceOperations.hideFileUpload();
 letterheadOperations.initializeListeners();
 ;

  $('.check-private').on('click', function() {
   var brand_id = $(this).data('brand')
   var url = window.location.pathname.split('/');
   url.pop();
   var str = url.join('/') + '/' + brand_id + '/change_privacy'
   console.log(str);
   $.ajax({
     type: "POST",
     url: str,
     data: brand_id,
     success: function(data) {
       console.log(data)
     },
     dataType: "json"
   });
 });

};

$( document ).ready(function() {

 brandPageInit();  

});