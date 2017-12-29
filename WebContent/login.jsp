<%@ page import="java.sql.*" language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<html>
	<head>
	<title>登录</title>
	<link rel="icon" href="res/favicon.ico" type="image/x-icon">
	</head>
	<body style="background-color: #29508B;width:950px;margin:0 auto">
		<div style="background-color: #FFFFFF;padding-top: 5px;overflow:hidden;">
			<h1 style="padding-left:15px;">算法训练场</h1><hr>
		</div>
		<div style="background-color: #FFFFFF;width: 950px;height: 500px;">
			<div style="width: 100px;float: left;">
				<br>
				<ul>
					<li style="list-style-type: none;"><a href="index.jsp" style="text-decoration: none;">主页</a></li>
					<li style="list-style-type: none;"><a href="contests" style="text-decoration: none;">题库</a></li>
					<li style="list-style-type: none;"><a href="register.jsp" style="text-decoration: none;">注册</a></li>
				</ul>
			</div>
			<div style="background-color:#9A9A9A;width:1px;float: left;height:100%;" ></div>
			<div style="width: 804px;float: left;padding-left: 23px;">
				<h2>登录</h2>
	            <form action="handlogin" method="post">
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
	            			<td><input type="submit" value="登录"></td>
	            		</tr>
	            	</table>
	            </form>
			</div>
		</div>
	</body>
</html>