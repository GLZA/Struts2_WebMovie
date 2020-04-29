$(function() {
	$('#username').blur(checkName);
	$('#password').blur(checkPassword);
	

});
function show() {
	if(checkName() && checkPassword()) {
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
		return true;
	} else {
		return false;
	}
}
function checkName() {
	var name = $('#username').val();
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
	$('#count-msg').empty();
	return true;
}

function checkPassword() {
	var password = $('#password').val();
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
	$('#password-msg').empty();
	return true;
}