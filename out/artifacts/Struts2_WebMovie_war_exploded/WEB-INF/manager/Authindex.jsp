<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
//获取选项参数
request.setCharacterEncoding("UTF-8");
	String choose1 = null;
	String choose2 = null;
	String choose3 = null;
try {
	choose1 = request.getParameter("cs1");
	choose2 = request.getParameter("cs2");
	choose3 = request.getParameter("cs3");
}catch (Exception e){

}

if(choose1==null)
{
	//初始化
	choose1="pim";
	choose2="fitst";
	choose3="one";
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>Index</title>
		<link rel="stylesheet" type="text/css" href="css/reset.css" />
		<link rel="stylesheet" type="text/css" href="css/index.css" />
		<script type="text/javascript" src="js/jquery-3.4.0.js"></script>
		<script type="text/javascript" src="js/main.js"></script>
		<script type="text/javascript" src="js/canvas-particle.js"></script>
		<link rel="stylesheet" type="text/css" href="css/pim.css" />
		<script type="text/javascript">
			$(document).ready(function() {
				$("#personal").find('.<%=choose1%>').addClass('active');
				$("#personal").find('.<%=choose1%> .icon').addClass('active');
				$("#personal").find('#<%=choose2%>').addClass('active');
				$("#personal").find('#line').addClass('<%=choose3%>');
			});
		</script>
	</head>
	<body>
		<div id="full">
			<div id="header_area">
				<%@include file="/header.jsp"%>
			</div>
			<div id="main">

				<div id="">
					

					<svg id="svg-source" height="0" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
					 style="position: absolute">
						<g id="pim-cart" data-iconmelon="e-commerce icons:7c96e2dece0152dc594d66b260f79db0">
							<path d="M28 8v-4h-28v22c0 1.105 0.895 2 2 2h27c1.657 0 3-1.343 3-3v-17h-4zM26 26h-24v-20h24v20zM4 10h20v2h-20zM16 14h8v2h-8zM16 18h8v2h-8zM16 22h6v2h-6zM4 14h10v10h-10z"></path>
						</g>
						<g id="history" data-iconmelon="e-commerce icons:c3144b166f93e0f6b73aee04a0a48397">
							<path d="M20.586 23.414l-6.586-6.586v-8.828h4v7.172l5.414 5.414zM16 0c-8.837 0-16 7.163-16 16s7.163 16 16 16 16-7.163 16-16-7.163-16-16-16zM16 28c-6.627 0-12-5.373-12-12s5.373-12 12-12c6.627 0 12 5.373 12 12s-5.373 12-12 12z"></path>
						</g>
						<g id="secure" data-iconmelon="e-commerce icons:05fa65d254ada5a9cb5c2f1e8d87f02b">
							<path d="M22 0c-5.523 0-10 4.477-10 10 0 0.626 0.058 1.238 0.168 1.832l-12.168 12.168v6c0 1.105 0.895 2 2 2h2v-2h4v-4h4v-4h4l2.595-2.595c1.063 0.385 2.209 0.595 3.405 0.595 5.523 0 10-4.477 10-10s-4.477-10-10-10zM24.996 10.004c-1.657 0-3-1.343-3-3s1.343-3 3-3 3 1.343 3 3-1.343 3-3 3z"></path>
						</g>
						<g id="upload" data-iconmelon="e-commerce icons:de2d76203b2448ee25bda0d82fa73c00">
							<path d="M26 2h-20l-6 6v21c0 0.552 0.448 1 1 1h30c0.552 0 1-0.448 1-1v-21l-6-6zM20 20v6h-8v-6h-6l10-8 10 8h-6zM4.828 6l2-2h18.343l2 2h-22.343z"></path>
						</g>
						<g id="about" data-iconmelon="e-commerce icons:de2d76203b2448ee25bda0d82fa73c00">
							<path d="M16 0.395c-8.836 0-16 7.163-16 16 0 7.069 4.585 13.067 10.942 15.182 0.8 0.148 1.094-0.347 1.094-0.77 0-0.381-0.015-1.642-0.022-2.979-4.452 0.968-5.391-1.888-5.391-1.888-0.728-1.849-1.776-2.341-1.776-2.341-1.452-0.993 0.11-0.973 0.11-0.973 1.606 0.113 2.452 1.649 2.452 1.649 1.427 2.446 3.743 1.739 4.656 1.33 0.143-1.034 0.558-1.74 1.016-2.14-3.554-0.404-7.29-1.777-7.29-7.907 0-1.747 0.625-3.174 1.649-4.295-0.166-0.403-0.714-2.030 0.155-4.234 0 0 1.344-0.43 4.401 1.64 1.276-0.355 2.645-0.532 4.005-0.539 1.359 0.006 2.729 0.184 4.008 0.539 3.054-2.070 4.395-1.64 4.395-1.64 0.871 2.204 0.323 3.831 0.157 4.234 1.026 1.12 1.647 2.548 1.647 4.295 0 6.145-3.743 7.498-7.306 7.895 0.574 0.497 1.085 1.47 1.085 2.963 0 2.141-0.019 3.864-0.019 4.391 0 0.426 0.288 0.925 1.099 0.768 6.354-2.118 10.933-8.113 10.933-15.18 0-8.837-7.164-16-16-16z"></path>

						</g>
					</svg>
					<!-- ICONS -->

					<div id="personal">

						<div id="left-side">
							<ul>
								<div class="" id="left-side-top">
									<div id="sculpture">
										<a href="javascript:void(0)"> <img src="img/icon.png" alt="Tina">
										</a>
									</div>
									<div id="sculptureName" class="">
										<a href="javascript:void(0)" title="PandaThemes">
											<%
											User user = (User)session.getAttribute("user");
											String username = user.getUsername();
											int userID = user.getUserID();
											String nickName = user.getNickName();
											String born = user.getBorn();
											String email = user.getEmail();
											String sex = user.getSex();
											if(nickName==null&&user!=null){
												nickName=username;
											}
											if(email==null){
												email="";
											}
											if(sex==null){
												sex="";
											}
											%>
											<span>
												<%=nickName %> </span>
											<%
										 %>
										</a>
									</div>
								</div>
								<li class="pim">
									<div class="icon">
										<svg viewBox="0 0 32 32">
											<g filter="">
												<use xlink:href="#pim-cart"></use>
											</g>
										</svg>
									</div> 个人信息
								</li>
								<li class="history">
									<div class="icon">
										<svg viewBox="0 0 32 32">
											<g filter="">
												<use xlink:href="#history"></use>
											</g>
										</svg>
									</div> 观看历史
								</li>
								<li class="secure">
									<div class="icon">
										<svg viewBox="0 0 32 32">
											<g filter="">
												<use xlink:href="#secure"></use>
											</g>
										</svg>
									</div> 安全设置
								</li>
								<li class="upload">
									<div class="icon">
										<svg viewBox="0 0 32 32">
											<g filter="">
												<use xlink:href="#upload"></use>
											</g>
										</svg>
									</div> 上传视频
								</li>
								<li class="about">
									<div class="icon">
										<svg viewBox="0 0 32 32">
											<g filter="">
												<use xlink:href="#about"></use>
											</g>
										</svg>
									</div> 关于我们
								</li>
							</ul>
						</div>

						<div id="border">
							<div id="line" class="one"></div>
						</div>

						<div id="right-side">
							<div id="first" class="">
							
								<%@ include file="changeUserInfo.jsp" %>
							
							</div>
							<div id="second">
						
								
								
							</div>
							<div id="third">
								
							<%@include file="security.jsp" %>

							</div>
						<div id="fourth">
							<%
								if(request.getParameter("type")==null){
									%>
										<%@include file="upload.jsp" %>
									<%
								}else if(Integer.parseInt(request.getParameter("type"))==1){
									%>
										<%@include file="uploadhis.jsp" %>
									<%
								}else if(Integer.parseInt(request.getParameter("type"))==2){
									%>
										<%@include file="movieEidt.jsp" %>
									<%
								}else{
									%>
										<%@include file="upload.jsp" %>
									<%
								}
							%>
						</div>
						<div id="fifth">
						
								<p>
									Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Donec at viverra est, eu finibus mauris. Quisque tempus
									vestibulum fringilla. Morbi tortor eros, sollicitudin eu arcu
									sit amet, aliquet sagittis dolor.
								</p>
								
								<p>
									Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Donec at viverra est, eu finibus mauris. Quisque tempus
									vestibulum fringilla. Morbi tortor eros, sollicitudin eu arcu
									sit amet, aliquet sagittis dolor.
								</p>
								
								<p>
									Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Donec at viverra est, eu finibus mauris. Quisque tempus
									vestibulum fringilla. Morbi tortor eros, sollicitudin eu arcu
									sit amet, aliquet sagittis dolor.
								</p>

							</div>
						</div>
					</div>
					

				</div>
				<script src="js/pim.js" type="text/javascript"></script>
			</div>

			<%@include file="/footer.jsp"%>
			
			<div id="wrapper">
				<a href="javascript:void(0)" id="toTop" style="display: block;">
				</a>
			</div>
		</div>

	</body>

</html>

