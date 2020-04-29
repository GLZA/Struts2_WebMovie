//总体box阴影开始
// $(
// 	function() {
// 		$("#full").hover(
// 			function() {
// 				$(this).css(
// 					"box-shadow", "10px 10px 5px #888888"
// 				);
// 			},
// 			function() {
// 				$(this).css(
// 					"box-shadow", "0 0 0 0"
// 				);
// 			}
// 		)
// 	}
// );
$(document).ready(function(){
	$("#full").css(
		"box-shadow", "0px 10px 10px 10px #888888"
	);
});
//总体box阴影结束


// 返回顶部开始
$(
	function() {
		$(window).scroll(function() {
			if($(window).scrollTop() > 100) {
				$("#toTop").fadeIn(500);
			} else {
				$("#toTop").fadeOut(100);
			}
		});
		$("#toTop").click(function() {
			$("html,body").animate({
				scrollTop: 0
			}, 1000);
		});
	}
);
// 返回顶部结束
$(document).ready(function() {
	var config = {
		vx: 4,
		vy: 4,
		height: 2,
		width: 2,
		count: 500,
		color: "121, 162, 185",
		stroke: "100, 200, 180",
		dist: 6000,
		e_dist: 20000,
		max_conn: 10
	}
	CanvasParticle(config);
});