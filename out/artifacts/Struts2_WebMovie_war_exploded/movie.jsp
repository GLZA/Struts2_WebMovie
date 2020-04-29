<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	response.setCharacterEncoding("UTF-8");
	String MVsrc=request.getParameter("src");
	String MVtitle=request.getParameter("title");
	String MVuser=request.getParameter("MVuser");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Index</title>
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript" src="js/jquery-3.4.0.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/canvas-particle.js"></script>
<link rel="stylesheet" type="text/css" href="css/movie.css" />
</head>
<body>
	<div id="full">
		<div id="header_area">
			<%@include file="header.jsp"%>
		</div>
		<div id="main">
			<div id="moive">
				<div id="view">


					
					<div id="videoBox">
						<div id="video-title">
							<span id=""><%=MVtitle %>&nbsp&nbsp&nbsp&nbsp&nbspBy--<%=MVuser%></span>
							
						</div>
						<video width="" controls="controls">
							<source src="<%=MVsrc%>" type="video/mp4" /> 
							你的浏览器不支持 HTML5 video
						</video>
					</div>
					<script type="text/javascript">
						$('#videoBox').hover(function() {
							timer = setTimeout(function() {
								$("#video-title").css("background-color", "rgba(0,0,0,0.2)");
							}, 1200);
						}, function() {
							clearTimeout(timer);
							$("#video-title").css("background-color", "rgba(0,0,0,1)");
						});
						$(document).ready(function() {
							$("html,body").animate({
								scrollTop : 80
							}, 1000);
						})
						$(window).scroll(function() {
							if ($(window).scrollTop() < 450) {
								$('#videoBox').removeClass('out').addClass('in');
								$('#video-title').removeClass('out').addClass('in');
							} else {
								$('#videoBox').removeClass('in').addClass('out');
								$('#video-title').removeClass('in').addClass('out');
								$('#videoBox').css('bottom', '0px');
							}
							;
					
						});
					</script>

				</div>
			</div>
			<div id="vedioBar">
				<div id="vedioBar-list">
					<svg id="svg-source" height="0" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
						 style="position: absolute">
						<g id="collect" data-iconmelon="e-commerce icons:7c96e2dece0152dc594d66b260f79db0">
							<path d="M32 12.408l-11.056-1.607-4.944-10.018-4.944 10.018-11.056 1.607 8 7.798-1.889 11.011 9.889-5.199 9.889 5.199-1.889-11.011 8-7.798zM16 23.547l-6.983 3.671 1.334-7.776-5.65-5.507 7.808-1.134 3.492-7.075 3.492 7.075 7.807 1.134-5.65 5.507 1.334 7.776-6.983-3.671z"></path>
						</g>
						<g id="good" data-iconmelon="e-commerce icons:7c96e2dece0152dc594d66b260f79db0">
							<path d="M23.6 2c-3.363 0-6.258 2.736-7.599 5.594-1.342-2.858-4.237-5.594-7.601-5.594-4.637 0-8.4 3.764-8.4 8.401 0 9.433 9.516 11.906 16.001 21.232 6.13-9.268 15.999-12.1 15.999-21.232 0-4.637-3.763-8.401-8.4-8.401z"></path>
						</g>
						<g id="coin" data-iconmelon="e-commerce icons:7c96e2dece0152dc594d66b260f79db0">
							<path d="M16 0c-8.825 0-16 7.175-16 16s7.175 16 16 16 16-7.175 16-16-7.175-16-16-16zM16 29.863c-1.431 0-2.806-0.219-4.106-0.619 0.563-0.919 1.412-2.431 1.725-3.631 0.169-0.65 0.863-3.294 0.863-3.294 0.45 0.863 1.775 1.594 3.175 1.594 4.181 0 7.194-3.844 7.194-8.625 0-4.581-3.738-8.006-8.544-8.006-5.981 0-9.156 4.019-9.156 8.387 0 2.031 1.081 4.563 2.813 5.369 0.262 0.125 0.4 0.069 0.463-0.188 0.044-0.194 0.281-1.131 0.387-1.575 0.031-0.137 0.019-0.262-0.094-0.4-0.575-0.694-1.031-1.975-1.031-3.162 0-3.056 2.313-6.019 6.256-6.019 3.406 0 5.788 2.319 5.788 5.637 0 3.75-1.894 6.35-4.356 6.35-1.363 0-2.381-1.125-2.050-2.506 0.394-1.65 1.15-3.425 1.15-4.613 0-1.063-0.569-1.95-1.756-1.95-1.394 0-2.506 1.438-2.506 3.369 0 1.225 0.412 2.056 0.412 2.056s-1.375 5.806-1.625 6.887c-0.281 1.2-0.169 2.881-0.050 3.975-5.156-2.012-8.813-7.025-8.813-12.9 0-7.656 6.206-13.863 13.862-13.863s13.863 6.206 13.863 13.863c0 7.656-6.206 13.863-13.863 13.863z"></path>						</g>
						<g id="share" data-iconmelon="e-commerce icons:7c96e2dece0152dc594d66b260f79db0">
							<path d="M13.757 19.868c-0.416 0-0.832-0.159-1.149-0.476-2.973-2.973-2.973-7.81 0-10.783l6-6c1.44-1.44 3.355-2.233 5.392-2.233s3.951 0.793 5.392 2.233c2.973 2.973 2.973 7.81 0 10.783l-2.743 2.743c-0.635 0.635-1.663 0.635-2.298 0s-0.635-1.663 0-2.298l2.743-2.743c1.706-1.706 1.706-4.481 0-6.187-0.826-0.826-1.925-1.281-3.094-1.281s-2.267 0.455-3.094 1.281l-6 6c-1.706 1.706-1.706 4.481 0 6.187 0.635 0.635 0.635 1.663 0 2.298-0.317 0.317-0.733 0.476-1.149 0.476z"></path>
							<path d="M8 31.625c-2.037 0-3.952-0.793-5.392-2.233-2.973-2.973-2.973-7.81 0-10.783l2.743-2.743c0.635-0.635 1.664-0.635 2.298 0s0.635 1.663 0 2.298l-2.743 2.743c-1.706 1.706-1.706 4.481 0 6.187 0.826 0.826 1.925 1.281 3.094 1.281s2.267-0.455 3.094-1.281l6-6c1.706-1.706 1.706-4.481 0-6.187-0.635-0.635-0.635-1.663 0-2.298s1.663-0.635 2.298 0c2.973 2.973 2.973 7.81 0 10.783l-6 6c-1.44 1.44-3.355 2.233-5.392 2.233z"></path>
						</g>
					</svg>
					<ul>
						<li id="good">
							<span>喜欢</span>
							<div class="icon">
								<svg viewBox="0 0 32 32">
									<g filter="">
										<use xlink:href="#good"></use>
									</g>
								</svg>
							</div>
						</li id="coin">
						<li id="coin">
							<span>投币</span>
							<div class="icon">
								<svg viewBox="0 0 32 32">
									<g filter="">
										<use xlink:href="#coin"></use>
									</g>
								</svg>
							</div>
						</li>
						<li id="collect">
							<span>收藏</span>
							<div class="icon">
								<svg viewBox="0 0 32 32">
									<g filter="">
										<use xlink:href="#collect"></use>
									</g>
								</svg>
							</div>
						</li>
						<li id="share">
							<span>分享</span>
							<div class="icon">
								<svg viewBox="0 0 32 32">
									<g filter="">
										<use xlink:href="#share"></use>
									</g>
								</svg>
							</div>
						</li>
						<li id="Post">
							<div id="way">
							    <div class="input">
							        <input type="text" id="postway"><span class="clear" id="cls">X</span>
							    </div>
							    <button>发送</button>
							</div>
							<script type="text/javascript">
								document.getElementById("postway").addEventListener("keyup", function() {
									if (this.value.length > 0) {
										document.getElementById("cls").style.visibility = "visible";
										document.getElementById("cls").onclick = function() {
											document.getElementById("postway").value = "";
											document.getElementById("cls").style.visibility = "hidden";
										}
									} else {
										document.getElementById("cls").style.visibility = "hidden";
									}
								});
							</script>
						</li>
					</ul>
				</div>
				
			</div>
			<%@include file="tab_region.jsp"%>
			<style type="text/css">
			.grid {
				margin: 0 auto;
				width: 100%;
			}
			
			.grid-item {
				float: left;
				margin: 1.25rem 1.25rem 1.25rem 1.25rem;
				box-shadow: 1px 1px #9E9E9E;
				width: 208px;
				height: 217px;
				border-radius: 3px;
				background-color: royalblue;
			}
			
			.ah-tab-content {
				height: 546px;
			}
			</style>
		</div>
		<%@include file="footer.jsp"%>
		<div id="wrapper">
			<a href="javascript:void(0)" id="toTop" style="display: block;">
			</a>
		</div>
	</div>
</body>

</html>
