<%@page import="com.ldsh.utils.JDBCUtil,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=GB2312"
    pageEncoding="GB2312"%>
<html>
<head>
		<title>插入用户</title>
</head>
<body> 
	<form action="inserttest?type=1">
		<table>
			<tr>
				<td>用户名：</td>
				<td><input type="text" name="uname"></td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><input type="password" name="upsw"></td>
			</tr>
			<tr>
				<td>邮箱：</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td>电话：</td>
				<td><input type="text" name="phone"></td>
			</tr>
			
		</table>
		
	</form>
	
</body>
</html>