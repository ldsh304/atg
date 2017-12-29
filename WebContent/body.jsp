<%@ page contentType="text/html; charset=gb2312" pageEncoding="gb2312"%>
<html>
	<head>
		<link rel="icon" href="res/favicon.ico" type="image/x-icon">
	</head>
	<body style="margin: 0px;">
		<div style="margin-left: 30px;margin-top: 7px">
		 	欢迎来到ATG(Algorithm Training Ground)
		 	<% 	
		 		if(session.getAttribute("uname") != null){
		 	%>
			 	<label style="color:#000000;center;position: absolute;right:160px;text-decoration: none;"><%=session.getAttribute("uname")%></label>
			 	<a href="handquit" style="color:#FFFFFF; background-color:#2BA6CB;text-align:center;position: absolute;right:100px;text-decoration: none;">[退出]</a>
		 	<% 	}else {%>
			 	<a href="login.jsp" style="color:#FFFFFF; background-color:#2BA6CB; text-align:center;position: absolute;right:160px;text-decoration: none;">[登录]</a>
			 	<a href="register.jsp" style="color:#FFFFFF; background-color:#2BA6CB;text-align:center;position: absolute;right:100px;text-decoration: none;">[注册]</a>
		 	<% 	} %>
		 </div>
	
		<div style="background-color:#323A45;margin-top: 10px;">
			<img alt="图片" src="res/logo.png" style="float:left;"/>
			<table style="width:1155px;height:100px;color:#00FF00">
				<tr >
					<th><a href="index.jsp" style="text-decoration: none;">首页</a></th>
					<th><a href="introduce.jsp" style="text-decoration: none;">介绍</a></th>
					<th><a href="contests.jsp" style="text-decoration: none;">题库</a></th>
					<th><a href="discuss.jsp" style="text-decoration: none;">讨论区</a></th>
					<th><a href="about.jsp" style="text-decoration: none;">关于我们</a></th>
				</tr>
			</table>
		</div>
	</body>
</html>