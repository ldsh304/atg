<%@page import="java.io.PrintWriter,java.util.*"%>
<%@ page import="java.sql.*,com.ldsh.imp.*,com.ldsh.bean.*" language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html>
	<head>
		<title>后台管理</title>
		<link rel="icon" href="res/favicon.ico" type="image/x-icon">
	</head>
	<body style="background-color: #29508B;width:950px;margin:0 auto;">
		<div style="background-color: #FFFFFF;padding-top: 5px;overflow:hidden;"> 
			<h1 style="padding-left:15px;text-align: center;">后台管理</h1><hr>
		</div>
		<div style="background-color:#FFFFFF;height: 300px;border-right: 1px solid #9A9A9A;">
			<div style="width: 100px;float: left;">
				<br>
				<ul>
					<li style="list-style-type: none;"><a href="<%=basePath %>admin.jsp" style="text-decoration: none">退出</a></li>
					<li style="list-style-type: none;"><a href="javascript:history.go(-1);">返回</a></li>
				</ul>
			</div>
			<div style="background-color:#FFFFFF;padding:10px;" >
				<%
					String name = request.getParameter("name");
					if(name == null || new UserImp().deleteByName(name)==0){
						out.print("<span>删除用户失败</span>");
					}else{
						out.print("<span>删除用户" + name + "成功</span>");
					}
				%>
			</div>
			
		</div>
		<div style="text-align:center;background-color: #FFFFFF">
		 	 <span style="margin-bottom: 10px;">版权所有(C)2017 武昌理工学院 LDSH</span>
		</div>
	</body>
</html>