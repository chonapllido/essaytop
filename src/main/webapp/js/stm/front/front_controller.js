$(document).ready(function(){
	
	var url = "../../../";
	
    if($('.scroll-pane').length > 0){
		$('.scroll-pane').jScrollPane({showArrows: true});
	}
	$('.main-menu >li').on('mouseover', function(){
		if($(this).children('.sub-menu').length > 0){
			$(this).children('.sub-menu').stop().slideDown(300);
		}
	}).on('mouseleave', function(){
		if($(this).children('.sub-menu').length > 0){
			$(this).children('.sub-menu').stop().slideUp(300);
		}	
	});
	
	$('.question-and-answer li >span').click(function(){
		$(this).siblings('p').toggle();											  
	});												  
	// datepicker
	if($('.datepicker').length > 0) {
		$( ".datepicker" ).datepicker({
			showOn: "button",
			buttonImage: url+"/images/icon/calendar.png",
			buttonImageOnly: true,
			buttonText: "Select date",
			dateFormat: "yy-mm-dd"
		});	
	}
});

