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
		<div style="background-color:#FFFFFF;height: 300px auto;">
			<div style="width: 100px;float: left;">
				<br>
				<ul>
					<li style="list-style-type: none;"><a href="<%=basePath %>admin.jsp" style="text-decoration: none">退出</a></li>
					<li style="list-style-type: none;"><a href="javascript:history.go(-1);" style="text-decoration: none">返回</a></li>
				</ul>
			</div>
			<div style="background-color:#FFFFFF;padding:10px;" >
					
				<table border="0" style="border-right: 1px solid #000000;border-bottom: 1px solid #000000;">
					<tr>
						<td style="border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;">用户名</td>
						<td style="border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;">注册时间</td>
						<td style="border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;">邮箱</td>
						<td style="border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;">电话</td>
						<td style="border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;">发帖个数</td>
					</tr>
					
					<%
						String type = request.getParameter("type");
						if("1".equals(type)){//查询单个
							String name = request.getParameter("name");
							User user = new UserImp().queryByName(name);
							if(user == null){
								out.print("<tr><td colspan=\"6\" style=\"border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;\">暂无数据</td></tr>");
							}else {
								out.print("<tr>");
								out.print("  <td style=\"border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;\">"+user.getName()+ "</td>");
								out.print("  <td style=\"border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;\">"+user.getTime()+ "</td>");
								out.print("  <td style=\"border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;\">"+(user.getEmail()==null?"":user.getEmail())+ "</td>");
								out.print("  <td style=\"border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;\">"+(user.getPhone()==0?"":user.getPhone())+ "</td>");
								out.print("  <td style=\"border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;\">"+user.getTopicCount()+ "</td>");
								out.print("</tr>");
							}
						}else{
							List<User> users = new UserImp().queryAll();
							if(users.size() == 0){
								out.print("<tr><td colspan=\"6\" style=\"border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;\">2暂无数据</td></tr>");
							}else{
								for(User user:users){
									out.print("<tr>");
									out.print("  <td style=\"border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;\">"+user.getName()+ "</td>");
									out.print("  <td style=\"border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;\">"+user.getTime()+ "</td>");
									out.print("  <td style=\"border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;\">"+(user.getEmail()==null?"":user.getEmail())+ "</td>");
									out.print("  <td style=\"border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;\">"+(user.getPhone()==0?"":user.getPhone())+ "</td>");
									out.print("  <td style=\"border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;\">"+user.getTopicCount()+ "</td>");
									out.print("</tr>");
								}
							}
						}
					%>
				</table>
			</div>
			
		</div>
		<div style="text-align:center;background-color: #FFFFFF">
		 	 <span style="margin-bottom: 10px;">版权所有(C)2017 武昌理工学院 LDSH</span>
		</div>
	</body>
</html>