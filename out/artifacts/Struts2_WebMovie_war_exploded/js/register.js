$(function() {
	$('#username').blur(checkName);
	$('#password').blur(checkPassword);
	$('#password-confirm').blur(checkConfirmPassword);
});
function show() {
	if(checkName() && checkPassword() && checkConfirmPassword()) {
		$("#body div").hide("fast");
		$("#full").animate({
			"margin-top": '0',
			height: '180px'
		}, 500);
		$("#body").animate({
			height: '0px'
		}, 500);
		$("#full").animate({
			width: '1080px',
			height: '1550px'
		}, 500);
		$("#body").animate({
			width: '100%',
			height: '1380px'
		}, 500, function() {
			$(location).attr('href', 'index.jsp');
		});
		return false;
	} else {
		return false;
	}
}
function checkName() {
	var name = $('#username').val();
	$('#count-msg').empty();
	if(name == null || name == "") {
		//提示错误
		$('#count-msg').html("用户名不能为空");
		return false;
	}
	var reg = /^\w{3,10}$/;
	if(!reg.test(name)) {
		$('#count-msg').html("输入3-10个字母或数字或下划线");
		return false;
	}
	return true;
}

function checkPassword() {
	var password = $('#password').val();
	$('#password-msg').empty();
	if(password == null || password == "") {
		//提示错误
		$('#password-msg').html("密码不能为空");
		return false;
	}
	var reg = /^\w{3,10}$/;
	if(!reg.test(password)) {
		$('#password-msg').html("输入3-10个字母或数字或下划线");
		return false;
	}
	return true;
}

function checkConfirmPassword() {
	var password = $('#password').val();
	var passwordConfirm = $('#password-confirm').val();

	if(passwordConfirm == null || passwordConfirm == "") {
		//提示错误
		$('#password-onfirm-msg').html("请再次输入密码");
		return false;
	}
	if(passwordConfirm!=password) {
		$('#password-confirm-msg').html("请再次输入相同的密码");
		return false;
	}
	$('#password-confirm-msg').empty();
	return true;
}