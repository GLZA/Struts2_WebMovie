<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<meta charset="utf-8" />
		<title>Welcome To Login</title>
		<link rel="stylesheet" type="text/css" href="css/login.css" />
		<link rel="stylesheet" type="text/css" href="css/formStyle.css" />
		<script type="text/javascript" src="js/jquery-3.4.0.js"></script>
		<script type="text/javascript" src="js/main.js"></script>
		<script type="text/javascript" src="js/login.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				//AJAX提交
				$("#submitBtn").click(function() {
					$.ajax({
						type : "POST",
						contentType : 'application/x-www-form-urlencoded;charset=utf-8',
						url : "jsonVd_login.action",
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
								$("#msg").html("用户名或密码错误");
							}
						},
						error : function(jqXHR) {
							//alert("发生错误：" + jqXHR.status);
							$("#msg").html("用户名或密码错误");
						},
						async : true
					});
				});
			});
		</script>
	</head>
	<body>
		<div id="full">
			<header>
				<div><img id="icon" src="img/icon.png" /></div>
				<div id="name">PILIPILI</div>

			</header>
			<div id="body">
				<div class="warrp">
					<div class="logo">用户登陆</div>
					<div class="form">
						<form id="formId">
							<li class="item">
								<span id="tn">用户名：</span>
								<input type="text" id="username" name="username" class="input">
								<span id="count-msg" class="error"></span>
							</li>
							<li class="item">
								<span>密　码：</span>
								<input type="password" id="password" name="password" class="input">
								<span id="password-msg" class="error"></span>
							</li>
							<li class="sub">
								<input type="button" id="submitBtn" value="登陆">
								<a href="register.jsp"><input type="button" id="reset" value="注册"></a>
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