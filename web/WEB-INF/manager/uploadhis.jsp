<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.pili.pojo.User"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<link rel="stylesheet" type="text/css" href="css/upload.css" />
<link rel="stylesheet" type="text/css" href="css/NewFile.css" />
<script type="text/javascript" src="js/upload.js"></script>
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
<sql:setDataSource 
	var="database"
	driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/pili?useUnicode=true&characterEncoding=utf-8"
	user="root"  password="295796"
/>
<%
	request.setCharacterEncoding("UTF-8");
	User ur =(User)session.getAttribute("user");
	String name = ur.getUsername();
	if(name==null){
	
	}else{
		
		%>
			<sql:query dataSource="${database}" var="result">
				SELECT * from movies where movieUser = '<%=name %>' ORDER BY movieID DESC;
			</sql:query>
		<%
	}
%>

<div id="staffinfo" >
	<a href="javascript:doPost('auth', {'cs1':'upload','cs2':'fourth','cs3':'four','type':'0'})">
		<input type="button" id="reset" value="返回">
	</a>
	<div id="search">
		<span id="infotitle">上传历史信息表</span>
		<%
			if(request.getParameter("error")!=null){
				String err = request.getParameter("error");
				if(err.equals("-99")){
					out.print("<span style='color:#53ff53;float:right;margin-top:65px;'>##删除成功!##</span>");
				}
				else if(err.equals("-66")){
					out.print("<span style='color:#53ff53;float:right;margin-top:65px;'>##修改成功!##</span>");
				}
				else if(err.equals("-1")){
					out.print("<span style='color:#CC0033;float:right;margin-top:65px;'>##删除失败!##</span>");
				}
				else if(err.equals("-2")){
					out.print("<span style='color:#CC0033;float:right;margin-top:65px;'>##修改失败!##</span>");
				}
				else{
					out.print("<span style='color:#FFCC00;float:right;margin-top:65px;'>##未知错误!##</span>");
				}
			}
		 %>
	</div>
	<div id="scrollbar">
		<div id="tableposi">
			<table width="300px" id="table" align="center" cellpadding="4" cellspacing="1">
				<tr>
					<th>视频ID</th>
					<th>视频标题</th>
					<th>视频类型</th>
					<th>操作</th>
				</tr>
				<c:forEach var="row" items="${result.rows}">
					<tr>
						<td>
							<c:out value="${row.movieID}" />
						</td>
						<td>
							<c:out value="${row.movieName}" />
						</td>
						<td>
							<c:out value="${row.movieType}" />
						</td>
						<td>
							<a href="javascript:doPost('auth', {'cs1':'upload','cs2':'fourth','cs3':'four','type':'2','movieID':'<c:out value="${row.movieID}"/>'})">
								<img src="img/recordedit.gif" title="修改" />
							</a>
							<a href="mv_delect.action?movieID=<c:out value="${row.movieID}"/>">
								<img src="img/recorddelete.gif" title="删除" />
							</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>