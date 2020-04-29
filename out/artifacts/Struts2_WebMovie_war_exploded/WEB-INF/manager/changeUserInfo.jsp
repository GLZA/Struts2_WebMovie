<%@ page import="java.util.*" language="java" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/formStyle.css" />
<script type="text/javascript" src="js/jquery-3.4.0.js"></script>
<script type="text/javascript" src="js/changeUserInfo.js"></script>
<script>
	$(function() {
		var sex = "<%=sex %>";
		$('select').find('option[value="' + sex + '"]').prop('selected', true);
		var now = new Date();
		now = "<%=born%>";
		$('#bornDate').val(now);
	});
</script>
	<div class="warrp">
		<div class="logo">个人信息修改</div>
		<div class="form">
			<form id="changeUserInfo" name="changeUserInfo" method="post" onsubmit="" action="updateInfo.action">
				<input type="hidden" id="username" name="username" class="input" value="<%=username%>"/>
				<li class="item">
					<span>UID</span>
					<input type="text" id="userID" name="userID" class="input" value="<%=userID%>" readonly="readonly" style="background-color:white;" />
					</li>
				<li class="item">
					<span>昵称：</span>
					<input type="text" id="nickName" name="nickName" class="input" value="<%=nickName%>">
					<span id="nickName-msg" class="error"></span>
				</li>
				<li class="item">
					<span>性别：</span>
					<select name="sex" id="sex" class="input" />
						<option value="保密">保密</option>
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
				</li>
				<li class="item">
					<span>邮箱：</span>
					<input type="email" id="email" name="email" class="input" value="<%=email%>" />
					<span id="email-msg" class="error"></span>
				</li>
				<li class="item">
					<span>出生日期：</span>
					<input type="date" id="bornDate" name="bornDate" class="input" value="" />
					<span id="bornDate-msg" class="error"></span>
				</li>
				<li class="sub">
					<input type="submit" value="提交" />
					<input type="reset" value="重置" />
				</li>
			</form>
		</div>
	</div>