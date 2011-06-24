function primary_formatting(){
	$('.tabs').tabs();
	$( ".button" ).button({ icons: {primary:'ui-icon-plusthick'}});
	$( ".button-minus" ).button({ icons: {primary:'ui-icon-minusthick'}});
	$( ".button-edit" ).button({ icons: {primary:'ui-icon-pencil'}});
	
	$( ".button-save" ).button({ icons: {primary:'ui-icon-disk'}});
	$(".phone").mask("+99.9.99.99.99.99");
	$("input").addClass("ui-widget-content ui-corner-all");
	$("textarea").addClass("ui-widget-content ui-corner-all");
	
	$( ".datepicker" ).datepicker();
	
	$(':input').change(function(){
		$(this).parents('form:first').addClass('dirty-form active-form')
		$(this).addClass('dirty-input')
		}
	);
	
	$( "#stock_search" ).autocomplete({
		  source: "/stocks.js",
		  minLength: 2,
		  select: function( event, ui ) {
				console.log('/stocks/'+ui.item.value+"/edit");
				window.location.href= '/stocks/'+ui.item.value+"/edit";
					}
	});
	$( "#sector_search" ).autocomplete({
		  source: "/sectors.js",
		  minLength: 2,
		  select: function( event, ui ) {
				console.log('/sectors/'+ui.item.value);
				window.location.href= '/sectors/'+ui.item.value;
					}
	});
	

}

primary_formatting()