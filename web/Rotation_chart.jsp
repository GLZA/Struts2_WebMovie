<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/main/Rotation_chart/Rotation_chart.css" />
<link rel="stylesheet" href="js/src/jquery.skidder.css">
<script src="js/src/imagesloaded.js"></script>
<script src="js/src/smartresize.js"></script>
<script src="js/src/jquery.skidder.js"></script>
<div id="Rotation_chart">
	<div class="slideshow">
		
		<div class="slide">
			<a href="movie.html"><img src="img/Rotation_chart/2.jpg"></a>
		</div>
		<div class="slide">
			<img src="img/Rotation_chart/2.jpg">
		</div>
		<div class="slide">
			<img src="img/Rotation_chart/2.jpg">
		</div>
		<div class="slide">
			<img src="img/Rotation_chart/2.jpg">
		</div>
		<div class="slide">
			<img src="img/Rotation_chart/2.jpg">
		</div>
		<div class="slide">
			<img src="img/Rotation_chart/2.jpg">
		</div>
		<div class="slide">
			<img src="img/Rotation_chart/2.jpg">
		</div>
		<script type="text/javascript">
			$('.slideshow').each(function() {
				var $slideshow = $(this);
				$slideshow.imagesLoaded(function() {
					$slideshow.skidder({
						slideClass : '.slide',
						animationType : 'css',
						scaleSlides : true,
						maxWidth : 1300,
						maxHeight : 300,
						paging : true,
						autoPaging : true,
						pagingWrapper : ".skidder-pager",
						pagingElement : ".skidder-pager-dot",
						swiping : true,
						leftaligned : false,
		
						cycle : true,
						jumpback : false,
						speed : 400,
						autoplay : false,
						autoplayResume : true,
						interval : 4000,
						transition : "slide",
						afterSliding : function() {},
						afterInit : function() {}
					});
				});
			});
			$(window).smartresize(function() {
				$('.slideshow').skidder('resize');
			});
		</script>
	</div>

</div>