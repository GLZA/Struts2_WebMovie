<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/upload.css" />
<script type="text/javascript" src="js/upload.js">
<!--

//-->
</script>
<script type="text/javascript">
	function doPost(to, p) { // to:提交动作（action）,p:参数  

		var myForm = document.createElement("form");

		myForm.method = "post";

		myForm.action = to;

		for (var i in p) {

			var myInput = document.createElement("input");

			myInput.setAttribute("name", i); // 为input对象设置name  

			myInput.setAttribute("value", p[i]); // 为input对象设置value  

			myForm.appendChild(myInput);

		}

		document.body.appendChild(myForm);

		myForm.submit();

		document.body.removeChild(myForm); // 提交后移除创建的form  

	}
</script>

<form action="uploads" class="auth-form" method="post" enctype="multipart/form-data">
	<input type="hidden" name="movieUser" value="<%=username%>" />
	<ul>
		<li class="upload-item">
			<span id="tn">标题:</span>
			<input type="text" id="movieName" name="movieName" class="upload_input" required="required" autocomplete="off">
			<span id="title-msg" class="error"></span>
		</li>
		<li class="upload-item">
			<span>标题图片:</span> 
			<input type="file" name="upload1" class="upload_input" accept=".jpg" required="required">
			<span id="img-msg" class="error"></span>
		</li>
		<li class="upload-item">
			<span id="tn">类型:</span>
			<select name="movieType" id="upload-select" class="upload_input" required="required">
				<option value="Funny">
					搞笑
				</option>
				<option value="Film">
					电影
				</option>
				<option value="Variety">
					综艺
				</option>
				<option value="Comic">
					番剧
				</option>
				<option value="TV">
					电视剧
				</option>
				<option value="Documentary">
					纪录片
				</option>
				<option value="Education">
					教育
				</option>
			</select>
			<span id="type-msg" class="error"></span>
		</li>
		<li class="upload-item">
			<span>文件:</span> 
			<input type="file" name="upload2" class="upload_input" accept=".mp4" required="required">
			<span id="file-msg" class="error"></span>
		</li>
		<li class="upload-sub">
			<input type="submit" id="upload-submit" value="上传">
			<input type="reset" id="reset" value="重置">
			<p>
				<a href="javascript:doPost('auth', {'cs1':'upload','cs2':'fourth','cs3':'four','type':'1'})">
					<input type="button" id="reset" value="上传历史">
				</a>
			</p>
		</li>
	</ul>
	<div id="msg" class="error">
		<%
			if(request.getParameter("Err")==null){
			
			}
			else{
				String Err=request.getParameter("Err");
				if (Err.equals("-1"))//将对应获取的错误信息进行，错误提示
				{
					%>上传失败Status=-1<%
				} else if (Err.equals("-2")) {
					%>上传失败Status=-2<%
				} else if (Err.equals("0")) {
					out.print("<span style='color:#53ff53'>##上传成功!##</span>");
				} else if(Err.equals("-99")){
					%>##服务器出错!##<%
				} else{
					%>##未知错误!##<%
				}
			}
		%>
	</div>
</form>