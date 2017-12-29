<%@ page import="java.sql.*" language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<html>
	<head>
	<title>后台管理</title>
	<link rel="icon" href="res/favicon.ico" type="image/x-icon">
	</head>
	<body style="background-color: #29508B;width:950px;margin:0 auto;">
		<div style="background-color: #FFFFFF;padding-top: 5px;overflow:hidden;"> 
			<h1 style="padding-left:15px;text-align: center;">后台管理</h1><hr>
			
		</div>
		<div>
			<div style="background-color: #FFFFFF;width: 149px;float: left;height: 400;">
				<br>
				<ul>
					<li style="list-style-type: none;"><a href="admin.jsp" style="text-decoration: none;">退出</a></li>
					<li style="list-style-type: none;"><a href="javascript:history.go(-1);" style="text-decoration: none;">返回</a></li>
				</ul>
			</div>
			
			<div style="background-color: #FFFFFF;width: 760px;height: 360;padding:20px;paborder-left: 1px solid;border-left-color: red;float: right;">
				<form action="manage/queryuser.jsp?type=1" method="post" style="margin: 10px">
					用户名：<input type="text" name="name" id="userone"><br>
					<input type="submit" style="margin-top:10px;background:none;border: none;color: blue;font-size: 15px;" value="查询用户" ><br>
				</form>
				<a style="text-decoration: none;color: blue;" href="manage/queryuser.jsp?type=2">查看所有用户</a>
				<form action="manage/deleteuser.jsp" method="post">
					<input type="hidden" name="name" id="userall">
					<input type="submit" style="margin-top:10px;background:none;border: none;color: blue;font-size: 15px;" value="删除用户" onclick="setNmae()" >
				</form>
			</div>
		</div>
		<script type="text/javascript">
			function setNmae(){
				document.getElementById("userall").value = document.getElementById("userone").value;
			}
		</script>
	</body>
</html>