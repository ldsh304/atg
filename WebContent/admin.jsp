<%@ page import="java.sql.*" language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<html>
	<head>
	<title>��̨��¼</title>
	<link rel="icon" href="res/favicon.ico" type="image/x-icon">
	</head>
	<body style="background-color: #29508B;width:950px;margin:0 auto;">
		<div style="background-color: #FFFFFF;padding-top: 5px;overflow:hidden;"> 
			<h1 style="padding-left:15px;text-align: center;">��̨��¼</h1><hr>
		</div>
		<div style="background-color: #FFFFFF;width: 950px;height: 500px;">
			<div style="width: 800px;float: left;padding-left: 350px;">
				<br>
				<br>
				<br>
	            <form action="adminlogin" method="post">
	            	<table>
	            		<tr>
	            			<td>�û�����</td>
	            			<td><input type="text" name="mname"></td>
	            		</tr>
	            		<tr>
	            			<td>���룺</td>
	            			<td><input type="password" name="mpsw"></td>
	            		</tr>
	            		<tr height="20px"/>
	            		<tr>
	            			<td> </td>
	            			<td><input type="submit" value="  ��    ¼   "></td>
	            		</tr>
	            	</table>
	            </form>
			</div>
		</div>
	</body>
</html>