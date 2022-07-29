$(function(){
	$(".chkTree01").click(function(){
		if($(this).is(":checked")){
			$(this).siblings(".tree02").show();
			var str = $(this).next().text();		
			$(".item").each(function() {
				if($(this).find(".cpuMaker").text() != str){
					$(this).hide();
				}
			})			
		}else{
			$(this).siblings(".tree02").hide();
			$(this).siblings().find(".chkTree02").prop("checked", false);
			$(this).siblings().find(".chkTree03").prop("checked", false);
			$(this).siblings().find(".chkTree04").prop("checked", false);
			$(this).siblings().find(".tree03").hide();
			$(this).siblings().find(".tree04").hide();
			var str = $(this).next().text();
			$(".item").each(function() {
				$(this).show();
			})	
		}	
	});	
	$(".chkTree02").click(function(){	
		if($(this).is(":checked")){
			$(this).siblings(".tree03").show();
			var str = $(this).next().text();
			
			$(".item").each(function(){
				if($(this).find(".cpuType").text() != str){
					$(this).hide();
				}
			})
		}else{
			$(this).siblings(".tree03").hide();
			$(this).siblings().find(".chkTree03").prop("checked", false);
			$(this).siblings().find(".chkTree04").prop("checked", false);
			$(this).siblings().find(".tree04").hide();
			var str = $(this).parent().parent().siblings(".label").text();
			$(".item").each(function(){
				if($(this).find(".cpuMaker").text() == str){
					$(this).show();
				}
			})
		}	
	});	
	$(".chkTree03").click(function(){	
		if($(this).is(":checked")){
			$(this).siblings(".tree04").show();
			var str = $(this).next().text();
			var str2 = $(this).parent().parent().parent().parent().siblings(".label").text();
			$(".item").each(function() {
				if($(this).find(".cpuGen").text() != str || $(this).find(".cpuMaker").text() != str2){
					$(this).hide();
				}
			})
		}else{			
			$(this).siblings(".tree04").hide();
			$(this).siblings().find(".chkTree04").prop("checked", false);
			var str = $(this).parent().parent().siblings(".label").text();
			$(".item").each(function(){
				if($(this).find(".cpuType").text() == str) {
					$(this).show();
				}
			})
		}		
	});	
	$(".chkTree04").click(function(){	
		if($(this).is(":checked")){
			var str = $(this).next().text();
			$(".item").each(function(){
				if($(this).find(".cpuName").text() != str){
					$(this).hide();
				}
			})
		}else{
			var str = $(this).parent().parent().siblings(".label").text();
			var str2 = $(this).parent().parent().parent().parent().siblings(".label").text();
			var str3 = $(this).parent().parent().parent().parent().parent().parent().siblings(".label").text();
			$(".item").each(function(){
				if($(this).find(".cpuGen").text() == str && $(this).find(".cpuType").text() == str2 && $(this).find(".cpuMaker").text() == str3){
					$(this).show();
				}
			})
		}
	});
	$(".reset").click(function() {
		location.reload();
	});
	
	$(".searchBox").change(function(){
		var v = $(".searchBox").val();
		var arr = new Array();
		var i = 0;
		
		if(v == "searchRecent"){
			$(".item").each(function(){
				arr[i] = $(this);
				i++;
				$(this).remove();
			});
			arr.sort(function(a, b) {
				return parseInt(b.find(".pcNum").text()) - parseInt(a.find(".pcNum").text());
			})
			for(var j = 0; j < arr.length; j++){
				$(".itemBox").append(arr[j]);
			}
		}else if(v == "searchDesc"){			
			$(".item").each(function(){
				arr[i] = $(this);
				i++;
				$(this).remove();
			});
			arr.sort(function(a, b) {
				return parseInt(b.find("#price").text()) - parseInt(a.find("#price").text());
			})
			for(var j = 0; j < arr.length; j++){
				$(".itemBox").append(arr[j]);
			}
		}else if(v == "searchAsc"){
			$(".item").each(function(){
				arr[i] = $(this);
				i++;
				$(this).remove();
			});
			arr.sort(function(a, b) {
				return parseInt(a.find("#price").text()) - parseInt(b.find("#price").text());
			})
			for(var j = 0; j < arr.length; j++){
				$(".itemBox").append(arr[j]);
			}
		}
	});
	
});