(function(){
	$("a.tableViewCellTitleLink").attr("target", "_blank");
	$("body, .tableViewCell").css('font-family', 'Verdana');
	
	// When "s" is clicked, make listings smaller:
	//		1. Set CSS Styles
	// 			- ".tableViewCell .summary".css("display", "none")
	//			- ".host".css("display", "none")
	//			- "a.tableViewCellTitleLink, a.tableViewCellTitleLink:visited".css("font-size", "20px")
	document.Parker = {
		instapaper: {
			is_small: false
		}
	};
	$(document).keypress(function(e){
		if(e.keyCode == 115){
			if(!document.Parker.instapaper.is_small){
				$(".tableViewCell .summary").css("display", "none");
				$(".host").css("display", "none");
				$("a.tableViewCellTitleLink, a.tableViewCellTitleLink:visited").css("font-size", "20px");
				$("#bookmarkListDeckAd").css("display", "none");
				$("#right_column").css("display", "none");
				
				width = 700;
				titleWidth = 530;
				$("#left_column").css("width", width+"px");
				$("#bookmark_list").css("width", width+"px");
				$(".tableViewCell .titleRow").css("width", titleWidth+"px");
				
				document.Parker.instapaper.is_small = true;
			}else{
				$(".tableViewCell .summary").css("display", "block");
				$(".host").css("display", "inline");
				$("a.tableViewCellTitleLink, a.tableViewCellTitleLink:visited").css("font-size", "16px");
				$("#bookmarkListDeckAd").css("display", "block");
				$("#right_column").css("display", "block");
				
				$("#left_column").css("width", "550px");
				$("#bookmark_list").css("width", "550px");
				$(".tableViewCell .titleRow").css("width", "375px");
				
				document.Parker.instapaper.is_small = false;
			}
		}
	});
})();