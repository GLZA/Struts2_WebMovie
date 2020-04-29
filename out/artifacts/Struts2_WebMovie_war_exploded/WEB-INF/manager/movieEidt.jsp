<%@ page import="java.util.*" language="java" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.pili.pojo.User"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<link rel="stylesheet" href="css/formStyle.css" />
<script type="text/javascript" src="js/jquery-3.4.0.js"></script>
<script type="text/javascript" src="js/changeUserInfo.js"></script>
<sql:setDataSource 
	var="database"
	driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/pili?useUnicode=true&characterEncoding=utf-8"
	user="root"  password="295796"
/>
<%
	request.setCharacterEncoding("UTF-8");
	User updateur =(User)session.getAttribute("user");
	String id = request.getParameter("movieID");
	String name = updateur.getUsername();
	if(name==null){
		
	}else{
		
		%>
			<sql:query dataSource="${database}" var="result">
				SELECT * from movies where movieID = <%=id%>;
			</sql:query>
		<%
	}
%>
	<div class="warrp">
		<div class="logo">个人信息修改</div>
		<div class="form">
			<form id="changeUserInfo" name="changeUserInfo" method="post" action="mv_update.action">
				<input type="hidden" id="username" name="movieUser" class="input" value="<%=name%>"/>
				<ul>
				<c:forEach var="row" items="${result.rows}">
					<li class="upload-item">
						<span id="tn">视频ID:</span>
						<input type="text" id="movieName" name="movieID" value="<c:out value="${row.movieID}" />" class="upload_input" readonly="readonly">
						<span id="title-msg" class="error"></span>
					</li>
					<li class="upload-item">
						<span id="tn">视频标题:</span>
						<input type="text" id="movieName" name="movieName" value="<c:out value="${row.movieName}" />" class="upload_input" required="required" autocomplete="off">
						<span id="title-msg" class="error"></span>
					</li>
					<li class="upload-item">
						<span id="tn">类型:</span>
						<input type="hidden" id="HselectType" name="" class="input" value="<c:out value="${row.movieType}" />"/>
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
					<li class="sub">
						<input type="submit" value="更改" />
						<a href="javascript:doPost('auth', {'cs1':'upload','cs2':'fourth','cs3':'four','type':'1'})">
							<input type="button" id="reset" value="上传历史">
						</a>
					</li>
				</c:forEach>
				</ul>
			</form>
			<script type="text/javascript">
				$(document).ready(function(){
					var type = $('#HselectType').val();
					$('#upload-select').find("option[value='"+type+"']").attr("selected","selected");
				});
			</script>
		</div>
	</div>