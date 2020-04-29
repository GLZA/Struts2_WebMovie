<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
</head>
<body>
	<div id="full">
		<div id="header_area">
			<%@include file="header.jsp"%>
		</div>
		<div id="main">

			<%@include file="Rotation_chart.jsp"%>

			<%@include file="tab_region.jsp"%>
			<style type="text/css">
			.grid {
				width: 100%;
				height: auto;
			}
			
			.grid-item {
				float: left;
				margin: 1.25rem 1.25rem 1.25rem 1.25rem;
				border:1px solid #708090;
				box-shadow: 1px 1px #9E9E9E;
				width: 208px;
				height: 190px;
				border-radius: 5px 5px 15px 15px;
				background-color: white;
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