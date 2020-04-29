$(
	function() {
		var theImage = new Image(); 
		theImage.src = $("#body img").attr("src");
		$("#body img").css({
			"width":theImage.width/3+"px",
			"height":theImage.height/3+"px"
		});
	}
)