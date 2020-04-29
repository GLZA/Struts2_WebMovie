$(function() {
	$('#Fpass').blur(checkPassword);
	$('#Spass').blur(checkConfirmPassword);
});
function checkPassword() {
	var password = $('#Fpass').val();
	$('#Fpass-msg').empty();
	if(password == null || password == "") {
		//提示错误
		$('#Fpass-msg').html("密码不能为空");
		return false;
	}
	var reg = /^\w{3,10}$/;
	if(!reg.test(password)) {
		$('#Fpass-msg').html("输入3-10个字母或数字或下划线");
		return false;
	}
	return true;
}

function checkConfirmPassword() {
	var password = $('#Fpass').val();
	var passwordConfirm = $('#Spass').val();

	if(passwordConfirm == null || passwordConfirm == "") {
		//提示错误
		$('#Spass-msg').html("请再次输入密码");
		return false;
	}
	if(passwordConfirm!=password) {
		$('#Spass-msg').html("请再次输入相同的密码");
		return false;
	}
	$('#Spass-msg').empty();
	return true;
}