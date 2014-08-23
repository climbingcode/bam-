$( document ).ready(function() {

	$('#dashboardTab').on("click", "dashboardTab", function (e) {
  	e.preventDefault()
  	$(this).tab('show')
	});

	$('#accountTab').on("click", "accountTab", function (e) {
  	e.preventDefault()
  	$(this).tab('show')
	});
 
});