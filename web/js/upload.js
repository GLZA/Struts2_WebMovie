$(function() {
	$('#movieName').blur(checkName);
});

function checkName() {
	var name = $('#movieName').val();
	$('#tiltle-msg').empty();
	if(name == null || name == "") {
		//提示错误
		$('#title-msg').html("标题不能为空");
		return false;
	}
	return true;
}
