<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.pili.pojo.User"%>
<link rel="stylesheet" type="text/css" href="css/header/header.css" />
<script type="text/javascript" src="js/header/header_float.js"></script>
<link rel="stylesheet" type="text/css" href="css/search/default.css" />
<link rel="stylesheet" type="text/css" href="css/search/search-form.css" />
<link rel="stylesheet" type="text/css" href="css/user_sub/base.css" />
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
<header>

	<div id="title">
		<a href="index.jsp"> <img id="icon" src="img/icon.png" /> <span
			id="name">PILIPILI</span>
		</a>
	</div>
	<div id="search">
		<form onsubmit="submitFn(this, event);">
			<div class="search-wrapper">
				<div class="input-holder">
					<input type="text" class="search-input"
						placeholder="Type to search" />
					<button class="search-icon" onclick="searchToggle(this, event);">
						<span></span>
					</button>
				</div>
				<span class="close" onclick="searchToggle(this, event);"></span>
				<div class="result-container"></div>
			</div>
		</form>

		<script src="js/search/search.js" type="text/javascript"></script>
	</div>
	<div id="info">


		<ul class="quick_menu">
			<li class="user_icon"><a href="auth"> <img src="img/icon.png"
					alt="Tina"> <b>test</b>
			</a></li>
			<li class="user_fun">
				<a href="auth" title="userwindow">
				<%
						if(session.getAttribute("user")==null){
							%> 请登录 <%
						}
						else{
							User user = (User)session.getAttribute("user");
							String username = user.getUsername();
							
							%> <span><%=username %> </span><%
						}
					%>
				</a> 
				<%
					if(session.getAttribute("user")==null){
						%> 
						
						<%
					}
						else{
						%> 
							<ul class="user_fun_sub">
								<li><a href="javascript:doPost('auth', {'cs1':'pim','cs2':'first','cs3':'one'})">个人信息</a></li>
								<li><a href="javascript:doPost('auth', {'cs1':'history','cs2':'second','cs3':'two'})">观看历史</a></li>
								<li><a href="javascript:doPost('auth', {'cs1':'secure','cs2':'third','cs3':'three'})">安全设置</a></li>
								<li><a href="javascript:doPost('auth', {'cs1':'upload','cs2':'fourth','cs3':'four','type':'0'})">上传视频</a></li>
							</ul>
						<%
						}
				%>
			</li>
			<%
			
			if(session.getAttribute("user")==null){
				%> 
					<li class="log_out"><a href="login.jsp" title="Log In"> Log In </a></li>
				<%
			}else{
				%>
					<li class="log_out"><a href="exit" title="Log Out"> Log Out </a></li>
				<%	
			}
			%> 
		</ul>

	</div>
</header>
