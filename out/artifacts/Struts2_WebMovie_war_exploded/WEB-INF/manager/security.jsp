<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="css/security.css" />
<script type="text/javascript" src="js/security.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		if($("#Fpass").val() != "" || $("#Fpass").val() != null){
			$("#upload-submit").click(function() {
				if(checkPassword()&&checkConfirmPassword()){
					$.ajax({
						type : "POST",
						contentType : 'application/x-www-form-urlencoded;charset=utf-8',
						url : "jsonVd_security.action",
						dataType : "json",
						data : {
							username : $("#hiddenuser").val(),
							password : $("#Fpass").val(),
						},
						success : function(data) {
							if (data.status==1) {
								$("#msg").html(data.tip)
							}
							else if(data.status==0){
								$("#msg").html(data.tip);
							}
							else{
								$("#msg").html(data.tip);
							}
						},
						error : function(jqXHR) {
							//alert("发生错误：" + jqXHR.status);
							$("#msg").html(data.tip);
						},
						async : true
					});
				}
			});
		}
	});

</script>
<form class="auth-form" method="post" enctype="multipart/form-data">
	<input type="hidden" id="hiddenuser" name="username" value="<%=username %>" />
	<ul>
		<li class="upload-item">
			<span id="tn">修改密码:</span>
			<input type="text" id="Fpass" name="password" class="upload_input">
			<span id="Fpass-msg" class="error"></span>
		</li>
		<li class="upload-item">
			<span id="tn">确认密码:</span>
			<input type="text" id="Spass" name="" class="upload_input">
			<span id="Spass-msg" class="error"></span>
		</li>
		<li class="upload-sub">
			<input type="button" id="upload-submit" value="修改">
			<input type="reset" id="reset" value="重置">
		</li>
	</ul>
	<div id="msg" class="error">
		
	</div>
</form>