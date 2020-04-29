$(
	function() {
		$(window).scroll(function() {
			$('header').addClass("header_float");
			if($(window).scrollTop() > 150) {
				$(".header_float").fadeIn(500);
			} else {
				$("header").removeClass("header_float");
			}
		});
	}
);