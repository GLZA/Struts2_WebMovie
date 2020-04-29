<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/tab_region/style.css">
<link rel="stylesheet" href="css/tab_region/jquery.horizontalmenu.css">
<script>
	$(document).ready(function() {
		//首次AJAX
			var firsttype = $(".ah-tab-item[data-ah-tab-active='true']").text();
			$(".grid").empty();
			$.ajax({
				type : "post",
				contentType : 'application/x-www-form-urlencoded;charset=utf-8',
				url : "showMovieAction.action",
				dataType : "json",
				data : {
					movieType : firsttype
				},
				success : function(data){
					if(data!= null){
						for(var i=0;i <= data.length;i++){
							$(".grid").append(
							"<div class='grid-item'>"
								+"<a href='movie.jsp?"
									+"src="+data[i].moviesSr+"/0.mp4&"
									+"title="+data[i].moviesNa+"&"
									+"MVuser="+data[i].moviesUr
									+"'>"
									
									+"<img class='Allmovies' src='"+data[i].moviesImg+"/0.jpg' width='208px' height='130px' />"
									+"<span class='Alltitle'>"+data[i].moviesNa+"</span>"
								+"</a>"
							+"</div>");				
						}
					}
					
				},
				error : function(jqXHR) {
					//alert("发生错误：" + jqXHR.status);
					alert("error");
				},
				async : true
			});
		$(".ah-tab-item").click(function() {
			var type = $(this).text();
			$(".grid").empty();
			$.ajax({
				type : "post",
				contentType : 'application/x-www-form-urlencoded;charset=utf-8',
				url : "showMovieAction.action",
				dataType : "json",
				data : {
					movieType : type
				},
				success : function(data){
					if(data!= null){
						for(var i=0;i <= data.length;i++){
							$(".grid").append(
							"<div class='grid-item'>"
								+"<a href='movie.jsp?"
									+"src="+data[i].moviesSr+"/0.mp4&"
									+"title="+data[i].moviesNa+"&"
									+"MVuser="+data[i].moviesUr
									+"'>"
									
									+"<img class='Allmovies' src='"+data[i].moviesImg+"/0.jpg' width='208px' height='130px' />"
									+"<span class='Alltitle'>"+data[i].moviesNa+"</span>"
								+"</a>"
							+"</div>");				
						}
					}
				},
				error : function(jqXHR) {
					//alert("发生错误：" + jqXHR.status);
					alert("error");
				},
				async : true
			});
		});
	});
</script>
<div id="tab_region">
	<div class="content">
		<script src="js/tab_region/jquery.horizontalmenu.js"></script>
		<div class="ah-tab-wrapper">
			<div class="ah-tab">
				<a class="ah-tab-item" data-ah-tab-active="true"  href="">搞笑</a>
				<a class="ah-tab-item" href="">电影</a>
				<a class="ah-tab-item" href="">综艺</a>
				<a class="ah-tab-item" href="">番剧</a>
				<a class="ah-tab-item" href="">电视剧</a>
				<a class="ah-tab-item" href="">纪录片</a>
				<a class="ah-tab-item" href="">教育</a>
			</div>
		</div>
		<div class="ah-tab-content-wrapper">
			<div class="ah-tab-content" data-ah-tab-active="true">
				<div>
					<div class="grid">
					
						
						

					</div>

				</div>
			</div>

			<div class="ah-tab-content" data-ah-tab-active="false">
				<div>

					<div class="grid">

					</div>

				</div>
			</div>

			<div class="ah-tab-content" data-ah-tab-active="false">
				<div>

					<div class="grid">

					</div>

				</div>
			</div>

			<div class="ah-tab-content" data-ah-tab-active="false">
				<div>

					<div class="grid">

					</div>

				</div>
			</div>

			<div class="ah-tab-content" data-ah-tab-active="false">
				<div>

					<div class="grid">

					</div>

				</div>
			</div>
			<div class="ah-tab-content" data-ah-tab-active="false">
				<div>

					<div class="grid">

					</div>

				</div>
			</div>
			<div class="ah-tab-content" data-ah-tab-active="false">
				<div>

					<div class="grid">

					</div>

				</div>
			</div>
			<div class="ah-tab-content" data-ah-tab-active="false">
				<div>

					<div class="grid">

					</div>

				</div>
			</div>

		</div>
	</div>
	<script>
		$(function() {
			$('.ah-tab-wrapper').horizontalmenu({
				itemClick : function(item) {
	
					$('.ah-tab-content-wrapper .ah-tab-content')
						.attr('data-ah-tab-active', 'false');
	
					$('.ah-tab-content-wrapper .ah-tab-content:eq(' + $(item).index() + ')')
						.attr('data-ah-tab-active', 'true');
	
					return false; //if this finction return true then will be executed http request
				}
			});
	
		});
	</script>
</div>
