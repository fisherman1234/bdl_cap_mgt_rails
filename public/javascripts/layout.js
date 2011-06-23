function primary_formatting(){
	$('.tabs').tabs();
	$( ".button" ).button({ icons: {primary:'ui-icon-plusthick'}});
	$( ".button-save" ).button({ icons: {primary:'ui-icon-disk'}});
	$(".phone").mask("+99.9.99.99.99.99");
	$("input").addClass("ui-widget-content ui-corner-all");
	$(':input').change(function(){
		$(this).parents('form:first').addClass('dirty-form active-form')
		$(this).addClass('dirty-input')
		}
	);
	

	

}

primary_formatting()