

$( document ).ready(function() {

  // $("#load_color").submit();


	$('#dashboardTab').on("click", "dashboardTab", function (e) {
  	e.preventDefault()
  	$(this).tab('show')
	});

	$('#accountTab').on("click", "accountTab", function (e) {
  	e.preventDefault()
  	$(this).tab('show')
	});

  function cutHex(h) {
    return (h.charAt(0)=="#") ? h.substring(1,7):h
  }

  function hexToR(h) {
    return parseInt((cutHex(h)).substring(0,2),16)
  }
  function hexToG(h) {
    return parseInt((cutHex(h)).substring(2,4),16)
  }
  function hexToB(h) {
    return parseInt((cutHex(h)).substring(4,6),16)
  }


function hexToCMYK (hex) {
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

   var r = parseInt(hex.substring(0,2),16); 
   var g = parseInt(hex.substring(2,4),16); 
   var b = parseInt(hex.substring(4,6),16); 

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
}
  

  function createNewColor(data){

    var $color = $("#color"),
        r = hexToR(data.hex),
        g = hexToG(data.hex),
        b = hexToG(data.hex),
        upperCaseHex = data.hex.toUpperCase(),
        colorWrapper = $("<div>").attr("id", data.id).addClass("col-sm-4 swatch-wrapper"),
        targetColor = "#"+data.id, 
        colorSwatch = $("<div>").addClass("swatch").css("background-color", "#"+data.hex),
        colorList = $("<ul>").addClass("color-list"),
        colorName = $("<li>").addClass("color-name").html(data.name),
        colorHex = $("<li>").html("CSS HEX: <span>#" + upperCaseHex + "</span>"),
        colorRgb = $("<li>").html("RGB: <span>" + r + ", " + g + ", "+ b + "</span>"),
        colorCmyk = $("<li>").html("CMYK: <span>" + hexToCMYK(data.hex) + "</span>"),
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
    

  };

  function loadColors(colorArray){
    var i = 0,
        len = colorArray.length; 
    if(len === 0) {
      $("<p>").html("Looks like your brand needs some colors!");
    } else {
      for(i;i < len; i++){
        var color = colorArray[i]
          createNewColor(color);
      }
    };

  };

  function addNewLogo(logo){

  var logoId = logo.result.id;
  var logoPath = logo.result.path.url;
  var logoName = logo.result.name;
  var    logoDescription = logo.result.description;
  var    $logoParent = $("#logos");
  var    logoWrapper = $("<div>").attr("id", logoId).addClass("col-sm-4");
  var   logoBackground = $("<div>").addClass("img-background").css("height", "339px");
  var    logoPicture = $("<img>").attr("src", logoPath).addClass("img-responsive logo");
  var    logoMeta = $("<div>").addClass("logo-meta");
  var    logoLabel = $("<label>").addClass("img-label").html(logoName);
  var    logoOptions = $("<div>").addClass("logo-options");
  var    logoCaret = $("<span>").addClass("caret");
  var    logoDropDownLink = 
        $("<a>").attr({
            "href" : "#",
            "data-toggle" : "dropdown"
          }).addClass("dropdown-toggle").html("Options");
  var      logoMenu = $("<ul role='menu'>").addClass("dropdown-menu");
  var      logoMenuHeader = $("<li>").addClass("dropdown-header").html("Download");
  var      logoMenuDivider = $("<li>").addClass("divider");
  var      logoAi = $("<li>");
  var      logoPng = $("<li>");
  var      logoJpg = $("<li>");
  var      logoToAiLink = $("<a>").attr("href", "#").html(logoName + ".ai");
  var      logoToPngLink = $("<a>").attr("href", "#").html(logoName + ".png");
  var      logoToJpgLink = $("<a>").attr("href", "#").html(logoName + ".jpg");

  
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
    logoMenuDivider.appendTo(logoMenu);
    logoAi.appendTo(logoMenu);
    logoToAiLink.appendTo(logoAi);
    logoPng.appendTo(logoMenu);
    logoToPngLink.appendTo(logoPng);
    logoJpg.appendTo(logoMenu);
    logoToJpgLink.appendTo(logoJpg);

     $logoParent.append(logoWrapper);


    $('.dropdown-toggle').dropdown();
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
    createNewColor(data);
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



  // $('#load_color').on('ajax:success', function(e, data) {;
  //   loadColors(data);
  // });
  
  $('#new_logo').fileupload({
    dataType: 'json',
    
    drop: function(e, data){
      $.each(data.files, function(index, file){
        // $('#upload_file_name').append("<p>" + file.name +"</p>");
      });
    },

    change: function(e, data){
      $.each(data.files, function(index, file){
        // $('#upload_file_name').append("<p>" + file.name +"</p>");
      });
    },

    add: function(e, data){
      data.context = $(tmpl("logo_upload", data.files[0]))
        $('#upload_status').append(data.context)
        $("#logo_submit").on("click", function(){
          data.submit();
        });
    },

    done: function(e, data){
      console.log("success!", data);
      addNewLogo(data);

    }
  });

  $('#new_misc_asset').fileupload({
    dataType: 'json',
    done: function(e, data){
      console.log(data)
    }
  });



});