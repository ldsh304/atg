<%@page import="com.ldsh.utils.JDBCUtil,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=GB2312"
    pageEncoding="GB2312"%>
<html>
<head>
		<title>�����û�</title>
</head>
<body> 
	<form action="inserttest?type=1">
		<table>
			<tr>
				<td>�û�����</td>
				<td><input type="text" name="uname"></td>
			</tr>
			<tr>
				<td>���룺</td>
				<td><input type="password" name="upsw"></td>
			</tr>
			<tr>
				<td>���䣺</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td>�绰��</td>
				<td><input type="text" name="phone"></td>
			</tr>
			
		</table>
		
	</form>
	
</body>
</html>