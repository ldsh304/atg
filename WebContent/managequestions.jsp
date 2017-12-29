<%@ page import="java.sql.*" language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<html>
	<head>
	<title>后台管理</title>
	<link rel="icon" href="res/favicon.ico" type="image/x-icon">
	</head>
	<body style="background-color: #29508B;width:950px;margin:0 auto;">
		<div style="background-color: #FFFFFF;padding-top: 5px;overflow:hidden;"> 
			<h1 style="padding-left:15px;text-align: center;">后台论坛管理</h1><hr>
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
				<a href="manage/queryquestion.jsp" style="text-decoration: none;">分类显示题库</a>
			</div>
			
		</div>
	</body>
</html>