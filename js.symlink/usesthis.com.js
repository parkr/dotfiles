$("a").each(function(){
	if(!this.href.match(/usesthis\.com/g)){
		$(this).attr('target', "_blank");
	}
});