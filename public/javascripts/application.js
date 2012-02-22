// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function saveDirtyForms () {
	console.log('call')
	$.each($('form.dirty-form'), function(key, value) { 
			submit_form($(value));
		});	  	
}

function add_window(item_name, width, height){
	stock = $('#stock_id').val();
	sector = $('#sector_id').val();
	$('body').append("<div id='add-item' style=''></div>");
	console.log('/'+item_name+'s/new?stock='+stock+'+&sector='+sector+'  #new_'+item_name);
	$('#add-item').load('/'+item_name+'s/new?stock='+stock+'+&sector='+sector+'  #new_'+item_name, function(){
		primary_formatting();

		$('#new_'+item_name).submit(function(event) {
			event.preventDefault();
		});
		$('#new_'+item_name).scrollTop(0)
		$('.hide').hide();
	});
     $( "#add-item" ).dialog({
     			height: height,
     			width: width,
     			modal: true,
				title: 'Add an item',
				close: function(event, ui) {
					$("#new_"+item_name+" textarea").each(function(index) { tinyMCE.execCommand('mceRemoveControl', false, $(this).attr('id')  ); });

					$( "#add-item" ).remove();

					//$('.recap-frais-consignation').load('/dossiers/'+$("#dossier_id").val()+'/encours_frais');
					
					},
     			buttons: {
					"Save": function() {
								
								$('#new_'+item_name).ajaxSubmit();
               					$( this ).dialog( "close" );
								location.reload(true);

               				},
           				"Close": function() {
                   					$( this ).dialog( "close" );

                   				}
                   	}			
     });
}

function processTextAreas(){
  $('textarea').each(function(index) { 
    if (!$(this).hasClass('hidden')){
      hideDivWithTextArea($(this));
    }
  });
}

function hideDivWithTextArea(textarea){
  var newDiv = jQuery('<div/>', {
      id: textarea.attr('id')+'_html',
      html: textarea[0].value
  });
  newDiv.height(textarea.height());
  
  newDiv.css('overflow', 'scroll');
  textarea.parent().append(newDiv);
  textarea.hide();
  textarea.addClass('hidden');
}

function edit_window(item_name, id, width, height){
	stock = $('#stock_id').val();
	sector = $('#sector_id').val();
	$('body').append("<div id='add-item' style=''></div>");
	console.log('/'+item_name+'s/'+id+'/edit  #edit_'+item_name);
	$('#add-item').load('/'+item_name+'s/'+id+'/edit  #edit_'+item_name+'_'+id, function(){
		primary_formatting();


		$('#edit_'+item_name).submit(function(event) {
			event.preventDefault();
		});
		
	//	console.log('#edit_'+item_name+'_'+id)
		//$('#edit_'+item_name+'_'+id+' :input:visible:first').focus();
		//$('#edit_'+item_name+'_'+id).scrollTop(0)
		$('.hide').hide();
	});
     $( "#add-item" ).dialog({
     			height: height,
     			width: width,
     			modal: true,
				title: 'Edit an item',
				close: function(event, ui) {

					$( "#add-item" ).remove(); 
					
					},
     			buttons: {
					"Delete": function() {
								
								$.post('/'+item_name+'s/'+id+'/destroy')
               					$( this ).dialog( "close" );
								location.reload(true);
								
								

               				},
					"Save": function() {
								
								$('#edit_'+item_name+'_'+id).ajaxSubmit();
               					$( this ).dialog( "close" );
								location.reload(true);

               				},
           				"Close": function() {
                   					$( this ).dialog( "close" );

                   				}
                   	}			
     });
}

var savedFormsCount;

function saveForms() {
  savedFormsCount = 1;
  $.blockUI({ message: '<h1>Sauvegarde en cours ...</h1>' });
  
	$.each($('form'), function(key, value) { 
			submit_form($(value));
		})
}


function submit_form(form){
	form.ajaxSubmit({
		success:function(){
		  savedFormsCount +=1;
			$("#save").removeClass("ui-state-active");
	    if (savedFormsCount==$('form').length){
	      $.unblockUI();
	      $.growlUI('', 'Modifications enregistrées !'); 
	    }
		}
		});	
}


function add_user(item_name, width, height){
	stock = $('#stock_id').val();
	sector = $('#sector_id').val();
	$('body').append("<div id='add-item' style=''></div>");
	console.log('/'+item_name+'s/new?stock='+stock+'+&sector='+sector+'  #new_'+item_name);
	$('#add-item').load('/'+item_name+'s/new?stock='+stock+'+&sector='+sector+'  #new_'+item_name, function(){
		primary_formatting();
		$('#new_'+item_name).submit(function(event) {
			event.preventDefault();
		});
		$('.hide').hide();
	});
     $( "#add-item" ).dialog({
     			height: height,
     			width: width,
     			modal: true,
				title: 'Add an item',
				close: function(event, ui) {
					$( "#add-item" ).remove(); 
					//$('.recap-frais-consignation').load('/dossiers/'+$("#dossier_id").val()+'/encours_frais');
					
					},
     			buttons: {
					"Save": function() {
								
								$('#new_'+item_name).ajaxSubmit({url:'settings/new_user'});
               					$( this ).dialog( "close" );
								$( "#add-item" ).remove(); 
								location.reload(true);

               				},
           				"Close": function() {
                   					$( this ).dialog( "close" );
									$( "#add-item" ).remove(); 

                   				}
                   	}			
     });
}

function edit_user(item_name, id, width, height){
	stock = $('#stock_id').val();
	sector = $('#sector_id').val();
	$('body').append("<div id='add-item' style=''></div>");
	console.log('/'+item_name+'s/'+id+'/edit  #edit_'+item_name);
	$('#add-item').load('/'+item_name+'s/'+id+'/edit  #edit_'+item_name+'_'+id, function(){
		primary_formatting();
		$('#edit_'+item_name).submit(function(event) {
			event.preventDefault();
		});
		$('.hide').hide();
	});
     $( "#add-item" ).dialog({
     			height: height,
     			width: width,
     			modal: true,
				title: 'Edit an item',
				close: function(event, ui) {
					$( "#add-item" ).remove(); 
					//$('.recap-frais-consignation').load('/dossiers/'+$("#dossier_id").val()+'/encours_frais');
					
					},
     			buttons: {
					"Delete": function() {
								
								$.post('/settings/'+id+'/destroy_user')
               					$( this ).dialog( "close" );
								$( "#add-item" ).remove(); 
								location.reload(true);
								
								

               				},
					"Save": function() {
								
								$('#edit_'+item_name+'_'+id).ajaxSubmit({url:'/settings/'+id+'/update_user'});
               					$( this ).dialog( "close" );
								$( "#add-item" ).remove(); 
								location.reload(true);

               				},
           				"Close": function() {
                   					$( this ).dialog( "close" );
									$( "#add-item" ).remove(); 

                   				}
                   	}			
     });
}





function remove_stock(){
	var id = prompt("Input stock ID");
	$.ajax({
	  url: '/stocks/'+id+'.js',
	  success: function(data){
			var password = prompt("You're about to destroy stock "+data.stock.stock_name+". Please input password");
				if (password=='bdlcapmgt'){
					$.post('/stocks/'+id+'/destroy'); 
					alert('Stock has been removed');
				}else{alert('Password wrong')}
		},
	  dataType: 'json'
	});
}


function remove_sector(){
	var id = prompt("Input sector ID");
	$.ajax({
	  url: '/sectors/'+id+'.js',
	  success: function(data){
			var password = prompt("You're about to destroy sector "+data.sector.sector_name+". Please input password");
				if (password=='bdlcapmgt'){
					$.post('/sectors/'+id+'/destroy'); 
					alert('Sector has been removed');
				}else{alert('Password wrong')}
		},
	  dataType: 'json'
	});
}



function loadinparent(url){
	self.opener.location = url;
 
}


// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
/*
	Masked Input plugin for jQuery
	Copyright (c) 2007-2011 Josh Bush (digitalbush.com)
	Licensed under the MIT license (http://digitalbush.com/projects/masked-input-plugin/#license) 
	Version: 1.3
*/
(function(a){var b=(a.browser.msie?"paste":"input")+".mask",c=window.orientation!=undefined;a.mask={definitions:{9:"[0-9]",a:"[A-Za-z]","*":"[A-Za-z0-9]"},dataName:"rawMaskFn"},a.fn.extend({caret:function(a,b){if(this.length!=0){if(typeof a=="number"){b=typeof b=="number"?b:a;return this.each(function(){if(this.setSelectionRange)this.setSelectionRange(a,b);else if(this.createTextRange){var c=this.createTextRange();c.collapse(!0),c.moveEnd("character",b),c.moveStart("character",a),c.select()}})}if(this[0].setSelectionRange)a=this[0].selectionStart,b=this[0].selectionEnd;else if(document.selection&&document.selection.createRange){var c=document.selection.createRange();a=0-c.duplicate().moveStart("character",-1e5),b=a+c.text.length}return{begin:a,end:b}}},unmask:function(){return this.trigger("unmask")},mask:function(d,e){if(!d&&this.length>0){var f=a(this[0]);return f.data(a.mask.dataName)()}e=a.extend({placeholder:"_",completed:null},e);var g=a.mask.definitions,h=[],i=d.length,j=null,k=d.length;a.each(d.split(""),function(a,b){b=="?"?(k--,i=a):g[b]?(h.push(new RegExp(g[b])),j==null&&(j=h.length-1)):h.push(null)});return this.trigger("unmask").each(function(){function v(a){var b=f.val(),c=-1;for(var d=0,g=0;d<k;d++)if(h[d]){l[d]=e.placeholder;while(g++<b.length){var m=b.charAt(g-1);if(h[d].test(m)){l[d]=m,c=d;break}}if(g>b.length)break}else l[d]==b.charAt(g)&&d!=i&&(g++,c=d);if(!a&&c+1<i)f.val(""),t(0,k);else if(a||c+1>=i)u(),a||f.val(f.val().substring(0,c+1));return i?d:j}function u(){return f.val(l.join("")).val()}function t(a,b){for(var c=a;c<b&&c<k;c++)h[c]&&(l[c]=e.placeholder)}function s(a){var b=a.which,c=f.caret();if(a.ctrlKey||a.altKey||a.metaKey||b<32)return!0;if(b){c.end-c.begin!=0&&(t(c.begin,c.end),p(c.begin,c.end-1));var d=n(c.begin-1);if(d<k){var g=String.fromCharCode(b);if(h[d].test(g)){q(d),l[d]=g,u();var i=n(d);f.caret(i),e.completed&&i>=k&&e.completed.call(f)}}return!1}}function r(a){var b=a.which;if(b==8||b==46||c&&b==127){var d=f.caret(),e=d.begin,g=d.end;g-e==0&&(e=b!=46?o(e):g=n(e-1),g=b==46?n(g):g),t(e,g),p(e,g-1);return!1}if(b==27){f.val(m),f.caret(0,v());return!1}}function q(a){for(var b=a,c=e.placeholder;b<k;b++)if(h[b]){var d=n(b),f=l[b];l[b]=c;if(d<k&&h[d].test(f))c=f;else break}}function p(a,b){if(!(a<0)){for(var c=a,d=n(b);c<k;c++)if(h[c]){if(d<k&&h[c].test(l[d]))l[c]=l[d],l[d]=e.placeholder;else break;d=n(d)}u(),f.caret(Math.max(j,a))}}function o(a){while(--a>=0&&!h[a]);return a}function n(a){while(++a<=k&&!h[a]);return a}var f=a(this),l=a.map(d.split(""),function(a,b){if(a!="?")return g[a]?e.placeholder:a}),m=f.val();f.data(a.mask.dataName,function(){return a.map(l,function(a,b){return h[b]&&a!=e.placeholder?a:null}).join("")}),f.attr("readonly")||f.one("unmask",function(){f.unbind(".mask").removeData(a.mask.dataName)}).bind("focus.mask",function(){m=f.val();var b=v();u();var c=function(){b==d.length?f.caret(0,b):f.caret(b)};(a.browser.msie?c:function(){setTimeout(c,0)})()}).bind("blur.mask",function(){v(),f.val()!=m&&f.change()}).bind("keydown.mask",r).bind("keypress.mask",s).bind(b,function(){setTimeout(function(){f.caret(v(!0))},0)}),v()})}})})(jQuery)

jQuery(function($){
   $("#date").mask("99/99/9999");
   $(".phone").mask("+99.9.99.99.99.99");
   $("#tin").mask("99-9999999");
   $("#ssn").mask("999-99-9999");
});

$.fn.capitalize = function() {
    $(this).keypress(function(e) {
        if (e.target.createTextRange) {
                var r = document.selection.createRange().duplicate();
                r.moveEnd('character', e.target.value.length);
                if (r.text == '') mstart = e.target.value.length;
                else mstart = e.target.value.lastIndexOf(r.text);
                r.moveStart('character', -e.target.value.length);
                mend = r.text.length;
        } else {
                mstart = e.target.selectionStart;
                mend = e.target.selectionEnd;
        }
        if(e.which>96 && e.which<123) {
                e.preventDefault();
                e.stopPropagation();
                z = $(e.target).val();
                front = z.substring(0, mstart);
                back = z.substring(mend);
                $(e.target).val(front+String.fromCharCode(e.which-32)+back);
 
                if(e.target.createTextRange) { 
                    var range = e.target.createTextRange(); 
                    range.move("character", mend+1); 
                    range.select(); 
                } else if(e.target.selectionStart) { 
                    e.target.focus(); 
                    e.target.setSelectionRange(mend+1, mend+1); 
                }  
        }
    });
}
