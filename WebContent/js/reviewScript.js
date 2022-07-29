function bestClick(){
	$(".normal").removeClass("on");
	$(".best").addClass("on");
	$(".review").each(function(){
		if($(this).find(".best").val() == "null"){
			$(this).hide();
		}	
	})
}
function normalClick(){
	$(".best").removeClass("on");
	$(".normal").addClass("on");
	$(".review").each(function(){
		if($(this).find(".best").val() == "null"){
			$(this).show();
		}	
	})
}
