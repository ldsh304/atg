<%@ page import="java.sql.*" language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<html>
	<head>
	<title>��̨����</title>
	<link rel="icon" href="res/favicon.ico" type="image/x-icon">
	</head>
	<body style="background-color: #29508B;width:950px;margin:0 auto;">
		<div style="background-color: #FFFFFF;padding-top: 5px;overflow:hidden;"> 
			<h1 style="padding-left:15px;text-align: center;">��̨��̳����</h1><hr>
		</div>
		<div>
			<div style="background-color: #FFFFFF;width: 149px;float: left;height: 400;">
				<br>
				<ul>
					<li style="list-style-type: none;"><a href="admin.jsp" style="text-decoration: none;">�˳�</a></li>
					<li style="list-style-type: none;"><a href="javascript:history.go(-1);" style="text-decoration: none;">����</a></li>
				</ul>
			</div>
			<div style="background-color: #FFFFFF;width: 760px;height: 360;padding:20px;paborder-left: 1px solid;border-left-color: red;float: right;">
				<a href="manage/querytopic.jsp?type=1" style="text-decoration: none;">��ѯ����������</a>
				<form action="manage/querytopic.jsp?type=2" method="post" style="margin-top:10px;">
					���ӱ�ţ�<input type="text" name="name" id="tid1"><br>
					<input type="submit" style="margin-top:10px;background:none;border: none;color: blue;font-size: 15px;" value="��ѯ������" ><br>
				</form>
				<form action="manage/deletetopic.jsp" method="post">
					<input type="hidden" name="name" id="tid2">
					<input type="submit" style="margin-top:10px;background:none;border: none;color: blue;font-size: 15px;" value="ɾ������" onclick="setNmae()" >
				</form>
			</div>
			<script type="text/javascript">
			function setNmae(){
				document.getElementById("tid2").value = document.getElementById("tid1").value;
			}
		</script>
		</div>
	</body>
</html>