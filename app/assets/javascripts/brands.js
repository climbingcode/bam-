$( document ).ready(function() {

	$('#dashboardTab a').click(function (e) {
  	e.preventDefault()
  	$(this).tab('show')
	});

		$('#accountTab a').click(function (e) {
  	e.preventDefault()
  	$(this).tab('show')
	});
 
});