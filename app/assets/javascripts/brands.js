$( document ).ready(function() {

	$('#dashboardTab').click(function (e) {
  	e.preventDefault()
  	$(this).tab('show')
	});

		$('#accountTab').click(function (e) {
  	e.preventDefault()
  	$(this).tab('show')
	});
 
});