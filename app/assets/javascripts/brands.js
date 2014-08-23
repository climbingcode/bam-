$( document ).ready(function() {

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
    console.log(data);
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

    console.log(targetColor);
    
    $color.append(colorWrapper);
    colorSwatch.appendTo(targetColor);
    colorList.appendTo(targetColor);
    colorName.appendTo(colorListItems);
    colorHex.appendTo(colorListItems);
    colorRgb.appendTo(colorListItems);
    colorCmyk.appendTo(colorListItems);
    colorSass.appendTo(colorListItems);

  };

  // $('#new_logo').on('ajax:success', function(e,data) {
  //   console.log(data);
  // });

  $('#new_color').on('ajax:success', function(e,data) {
    createNewColor(data);
    this.reset(); 
  });

  $('#new_copy').on('ajax:success', function(e,data) {
    console.log("success", data);
  });

  $('#new_font').on("ajax:success", function(e, data){
    console.log(data);
  }); 



});