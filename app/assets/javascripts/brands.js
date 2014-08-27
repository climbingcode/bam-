var colorOperations = {

  cutHex: function(h) {
    return (h.charAt(0)=="#") ? h.substring(1,7):h
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

     // if (hex.length != 6) {
     //  alert ('Invalid length of the input hex value!');   
     //  return; 
     // }
     // if (/[0-9a-f]{6}/i.test(hex) != true) {
     //  alert ('Invalid digits in the input hex value!');
     //  return; 
     // }

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

  createNewColor: function(data) {
        var $color = $("#color"),
        r = colorOperations.hexToR(data.hex),
        g = colorOperations.hexToG(data.hex),
        b = colorOperations.hexToG(data.hex),
        upperCaseHex = data.hex.toUpperCase(),
        colorWrapper = $("<div>").attr("id", data.id).addClass("col-sm-4 swatch-wrapper"),
        targetColor = "#"+data.id, 
        colorSwatch = $("<div>").addClass("swatch").css("background-color", "#"+data.hex),
        colorList = $("<ul>").addClass("color-list"),
        colorName = $("<li>").addClass("color-name").html(data.name),
        colorHex = $("<li>").html("CSS HEX: <span>#" + upperCaseHex + "</span>"),
        colorRgb = $("<li>").html("RGB: <span>" + r + ", " + g + ", "+ b + "</span>"),
        colorCmyk = $("<li>").html("CMYK: <span>" + colorOperations.hexToCMYK(data.hex) + "</span>"),
        colorListItems = targetColor + " ul.color-list",
        colorSass = $("<li>").html("Sass: <span></span>");
    
    $color.append(colorWrapper);
    colorSwatch.appendTo(colorWrapper);
    colorList.appendTo(colorWrapper);
    colorName.appendTo(colorListItems);
    colorHex.appendTo(colorListItems);
    colorRgb.appendTo(colorListItems);
    colorCmyk.appendTo(colorListItems);
    colorSass.appendTo(colorListItems);
  }


};




$( document ).ready(function() {

  $("#load_color").submit();


	$('#dashboardTab').on("click", "dashboardTab", function (e) {
  	e.preventDefault()
  	$(this).tab('show')
	});

	$('#accountTab').on("click", "accountTab", function (e) {
  	e.preventDefault()
  	$(this).tab('show')
	});

  



  function loadColors(colorArray){
    var i = 0,
        len = colorArray.length; 
    if(len === 0) {
      $("<p>").html("Looks like your brand needs some colors!");
    } else {
      for(i;i < len; i++){
        var color = colorArray[i]
          colorOperations.createNewColor(color);
      }
    };

  };

  function addNewLogo(logo){

  var logoId = logo.result.id;
  var logoPath = logo.result.path.url;
  var logoName = logo.result.name;
  var logoDescription = logo.result.description;
  var $logoParent = $("#logos");
  var logoWrapper = $("<div>").attr("id", "logo" + logoId).addClass("col-sm-4").data("logoid", logoId);
  var logoBackground = $("<div>").addClass("img-background").css("height", "339px");
  var logoPicture = $("<img>").attr("src", logoPath).addClass("img-responsive logo");
  var logoMeta = $("<div>").addClass("logo-meta");
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
  var logoDelete = $("<li>");
  var logoToAiLink = $("<a>").attr("href", "#").html(logoName + ".ai");
  var logoToPngLink = $("<a>").attr("href", "#").html(logoName + ".png");
  var logoToJpgLink = $("<a>").attr("href", "#").html(logoName + ".jpg");
  var logoDeleteLink = $("<a>").attr("href", "#").addClass("list-delete").html("Delete");   


  // <li><a class="list-delete" href="#">Delete</a></li>
  
    // $logoParent.append(logoWrapper);
    logoBackground.appendTo(logoWrapper);
    logoPicture.appendTo(logoBackground);
    logoMeta.appendTo(logoWrapper);
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
    logoDelete.appendTo(logoMenu);
    logoDeleteLink.appendTo(logoDelete);

     $logoParent.append(logoWrapper);


    $('.dropdown-toggle').dropdown();

    function onDeleteFadeOut(asset){
      $("#logo" + asset.id).animate({
        "width" : "0px"
      }, 500, function(){
        $(this).css("display", "none");
      });
  };


  function onActionAdvisory(response, message) {
    var advisory = $("#user-action-messages");
    var showClass = "user-action-messages-show";
    var hideClass = "user-action-messages-hidden";
    var messageHolder = $("<p>").addClass("advisory-message")
                          .html(response.name + " " + message);
    advisory.append(messageHolder);
    advisory.removeClass(hideClass).addClass(showClass);
    setTimeout(function(){
      advisory.removeClass(showClass).addClass(hideClass);
      advisory.empty();
    }, 3000);
  };


    $(".logo-options .list-delete").on("click", function(event){
      event.preventDefault();
      var logoHolder = ".col-sm-4";
      var logoId = $(this).closest(logoHolder).data("logoid");
      var path = window.location.pathname + "/logos/" + logoId;

      $.ajax({
        type: "DELETE",
        url: path,
        dataType: "json",
        success: function(response){
          console.log(response);
          onDeleteFadeOut(response);
          onActionAdvisory(response, "Logo deleted");
          }
      });

      console.log( path, logoId );

    });

  };  

  function addTypography(data){
    var fontName = data.name,
        fontFamily = data.font_family,
        upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
        $typo = $("#typography"),
        lowerCaseLetters = upperCaseLetters.toLowerCase(),
        typoWrapper = $("<div>").addClass("letters_wrapper col-sm-10"),
        typoFontHeader = $("<div>").addClass("font-header"),
        typoFontDescription = $("<h3>").addClass("font-description").html(fontName + ":"),
        typoFontFamily = $("<h3>").addClass("font-name").html(fontFamily),
        lineDivider = $("<hr>"),
        typoCapitalLetters = $("<p>").addClass("primary_capital_letters").css("font-family", fontFamily).html(upperCaseLetters),
        typoLowerCaseLetters = $("<p>").addClass("primary_lower_case_letters").css("font-family", fontFamily).html(lowerCaseLetters);
        
    
    typoFontHeader.appendTo(typoWrapper);
    typoFontDescription.appendTo(typoFontHeader);
    typoFontFamily.appendTo(typoFontHeader);
    $("<hr>").appendTo(typoWrapper);
    typoCapitalLetters.appendTo(typoWrapper);
    typoLowerCaseLetters.appendTo(typoWrapper);
    lineDivider.appendTo(typoWrapper);
    $typo.append(typoWrapper);
  };





  $('#new_color').on('ajax:success', function(e,data) {
    colorOperations.createNewColor(data);
    this.reset(); 
  });

  $('#new_copy').on('ajax:success', function(e,data) {
    console.log("success", data);
  });

  $('#new_font').on('ajax:success', function(e, data){
    addTypography(data);
    console.log(data);

  }); 

  $("#new_guideline").on('ajax:success', function(e, data) {
    console.log(data);
  });


  function clearFileInput(element) {
    console.log(element);
    element.wrap("<form>").parent("form").trigger("reset");
    element.unwrap();
  };
  
  $('#load_color').on('ajax:success', function(e, data) {;
    loadColors(data);
  });
  
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
        $('#logo-upload-status').append(data.context)
        $("#logo_submit").on("click", function(event){
          event.preventDefault();
          data.submit();
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
      addNewLogo(data);
      onActionAdvisory(assetName, "logo uploaded")
      $("#logo_name").val("");
      $("#logo_description").val("");
      clearFileInput( $("#logo_path") );
      $("#logo-upload-status").empty();
    }
  });

  $('#new_misc_asset').fileupload({
    dataType: 'json',
    done: function(e, data){
      console.log(data)
    }
  });


  function onDeleteFadeOut(asset){
    $("#logo" + asset.id).animate({
      "width" : "0px"
    }, 500, function(){
      $(this).css("display", "none");
    });
  };

  function onActionAdvisory(response, message) {
    var advisory = $("#user-action-messages");
    var showClass = "user-action-messages-show";
    var hideClass = "user-action-messages-hidden";
    var messageHolder = $("<p>").addClass("advisory-message")
                          .html( + " " + message);
    advisory.append(messageHolder); 
    advisory.removeClass(hideClass).addClass(showClass);
    setTimeout(function(){
      advisory.removeClass(showClass).addClass(hideClass);
      advisory.empty();
    }, 3000);
  };

  $(".logo-options .list-delete").on("click", function(event){
    event.preventDefault();
    var logoHolder = ".col-sm-4";
    var logoId = $(this).closest(logoHolder).data("logoid");
    var path = window.location.pathname + "/logos/" + logoId;

    $.ajax({
        type: "DELETE",
        url: path,
        dataType: "json",
        success: function(response){
          console.log(response);
          onDeleteFadeOut(response);
          onActionAdvisory(response, "Logo deleted");
        }
      })

    console.log( path, logoId );

  });

  // BUSINESS CARD METHODS

  $('.open_business_card_modal').on('click', function(e) {
    e.preventDefault()    
    $('.business_card_pdf').addClass('business_card_preview');
  }); 

  $('.change_background').on('click', function(e) {
    e.preventDefault();
    var color = $(this).data("color");
    $('.business_card_preview').css('background-color', color)
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


});