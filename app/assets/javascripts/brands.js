$( document ).ready(function() {

	$('#dashboardTab a').click(function (e) {
  	e.preventDefault()
  	$(this).tab('show')
	});

	$('#accountTab a').click(function (e) {
  	e.preventDefault()
  	$(this).tab('show')
	});
  

  function createNewColor(data){
    console.log(data);
    var $color = $("#color"),
        colors = document.getElementsByClassName("swatch-wrapper"), 
        colorWrapper = $("<div>").attr("id", data.id).addClass("col-sm-4 swatch-wrapper"),
        colorSwatch = $("<div>").addClass("swatch"),
        colorList = $("<ul>").addClass("color-list"),
        colorName = $("<li>").addClass("color-name"),
        colorHex = $("<li>").addClass("color-hex"),
        colorRgb = $("<li>").addClass("color-rgb"),
        colorCmyk = $("<li>").addClass("color-cmyk"),
        colorSass = $("<li>").addClass("color-sass");
    console.log(colors);
    
    $color.append(colorWrapper);
    // $wrapper.append(colorSwatch).css("background", data.hex)
    //   .append(colorList)
    //   .append(colorName)
    //   .append(colorHex)
    //   .append(colorRgb)
    //   .append(colorCmyk)
    //   .append(colorSass);

//   <div class="swatch" id="swatch-1">
//   </div>
//   <ul class="color-list">
//     <li class="color-name">Lighthouse Blue</li>
//     <li>CSS HEX: <span>#002D3C</span></li>
//     <li>RGB: <span></span></li>
//     <li>CMYK: <span></span></li>
//     <li>Sass:<span></span></li>
//   </ul>
// </div>

  };

  // $('#new_logo').on('ajax:success', function(e,data) {
  //   console.log(data);
  // });

  $('#new_color').on('ajax:success', function(e,data) {
    createNewColor(data);

  });

  $('#new_copy').on('ajax:success', function(e,data) {
    console.log("success", data);
  });

  $('#new_font').on("ajax:success", function(e, data){
    console.log(data);
  }); 



});