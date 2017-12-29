<%@page import="com.ldsh.utils.JDBCUtil,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=GB2312"
    pageEncoding="GB2312"%>
<html>
<head>
		<title>≤Â»Î”√ªß</title>
</head>
<body>
	<form action="inserttest?type=2">
		<table>
			<tr>
				<td>fid£∫</td>
				<td><input type="text" name="fid"></td>
			</tr>
			<tr>
				<td>rid£∫</td>
				<td><input type="text" name="rid"></td>
			</tr>
			<tr>
				<td>u_id£∫</td>
				<td><input type="text" name="u_id"></td>
			</tr>
			<tr>
				<td>subject£∫</td>
				<td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<td>content£∫</td>
				<td><textarea rows="10" cols="20" name="content"></textarea>
			</tr>
			<tr>
				<td>block£∫</td>
				<td><input type="text" name="block"></td>
			</tr>
			
		</table>
		
	</form>
	
</body>
</html>