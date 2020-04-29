<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<meta charset="utf-8" />
<title>Welcome To Register</title>
<link rel="stylesheet" type="text/css" href="css/register.css" />
<link rel="stylesheet" type="text/css" href="css/formStyle.css" />
<script type="text/javascript" src="js/jquery-3.4.0.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/register.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		if($("#username").val() != "" || $("#username").val() != null){
			$("#username").blur(function() {
				
					$.ajax({
						type : "POST",
						contentType : 'application/x-www-form-urlencoded;charset=utf-8',
						url : "jsonVd_select.action",
						dataType : "json",
						data : {
							username : $("#username").val()
						},
						success : function(data) {
							if (data.status) {
								$("#count-msg").html(data.tip);
							} else {
								$("#count-msg").html(data.tip);
							}
						},
						error : function(jqXHR) {
							alert("发生错误：" + jqXHR.status);
						},
						async : true
					});
				
			});
		}
		//AJAX提交
		$("#submitBtn").click(function() {
			$.ajax({
				type : "POST",
				contentType : 'application/x-www-form-urlencoded;charset=utf-8',
				url : "jsonVd_reg.action",
				dataType : "json",
				data : {
					username : $("#username").val(),
					password : $("#password").val(),
				},
				success : function(data) {
					if (data.status) {
						show();
					}
					else {
						$("#msg").html(data.tip);
					}
				},
				error : function(jqXHR) {
					//alert("发生错误：" + jqXHR.status);
					$("#msg").html(data.tip);
				},
				async : true
			});
		});
	});
	
</script>
<body>
	<div id="full">
		<header>
		<div>
			<img id="icon" src="img/icon.png" />
		</div>
		<div id="name">PILIPILI</div>

		</header>
		<div id="body">
			<div class="warrp">
				<div class="logo">用户注册</div>
				<div class="form">
					<form id="formId">
						<li class="item">
							<span id="tn">昵称：</span>
							<input type="text" id="username" name="username" class="input"><br />
							<span id="count-msg" class="error"></span>
						</li>
						<li class="item">
							<span id="tn">密码：</span>
							<input type="password" id="password" name="password" class="input"><br />
							<span id="password-msg" class="error"></span>
						</li>
						<li class="item">
							<span id="tn">确认密码:</span>
							<input type="password" id="password-confirm" name="password-confirm" class="input"><br />
							<span id="password-confirm-msg" class="error"></span>
						</li>
						<li class="sub">
							<input type="button" id="submitBtn" value="注册">
							<input type="reset" id="reset" value="重置">
						</li>
						<div id="msg" class="error"></div>
					</form>

				</div>
			</div>
		</div>

		<script type="text/javascript" src="js/canvas-particle.js"></script>
		<footer>
		<div>© 2019 Kits, Inc.</div>
		<div id="terms">
			<a href="#">条款</a>
		</div>
		<div id="privacy">
			<a href="#">隐私</a>
		</div>
		
		</footer>
	</div>

</body>

</html>