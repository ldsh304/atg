<%@ page contentType="text/html; charset=gb2312" pageEncoding="gb2312"%>
<html>
	<head>
		<title>������</title>
		<link rel="icon" href="res/favicon.ico" type="image/x-icon">
	</head>
	<body style="background-color:#FFFFFF; margin: 0px;">
	<div style="margin-left: 30px;margin-top: 7px">
		 	��ӭ�������
		 	<% 	
		 		if(session.getAttribute("uname") != null){
		 	%>
			 	<label style="color:#000000;center;position: absolute;right:160px;text-decoration: none;"><%=session.getAttribute("uname")%></label>
			 	<a href="handquit" style="color:#FFFFFF; background-color:#2BA6CB;text-align:center;position: absolute;right:100px;text-decoration: none;">[�˳�]</a>
		 	<% 	}else {%>
			 	<a href="login.jsp" style="color:#FFFFFF; background-color:#2BA6CB; text-align:center;position: absolute;right:160px;text-decoration: none;">[��¼]</a>
			 	<a href="register.jsp" style="color:#FFFFFF; background-color:#2BA6CB;text-align:center;position: absolute;right:100px;text-decoration: none;">[ע��]</a>
		 	<% 	} %>
		 </div>

	<div style="background-color:#323A45;margin-top: 10px;">
		<img alt="ͼƬ" src="res/logo.png" style="float:left;">
		<table style="width:1155px;height:100px;color:#00FF00">
			<tr>
				<th><a href="index.jsp" style="text-decoration: none;">��ҳ</a></th>
				<th><a href="introduce.jsp" style="text-decoration: none;">����</a></th>
				<th><a href="#" style="text-decoration: none;">���</a></th>
				<th><a href="discuss.jsp" style="text-decoration: none;">������</a></th>
				<th><a href="about.jsp" style="text-decoration: none;">��������</a></th>
			</tr>
		</table>
	</div>
	
	<div style="margin-left: 10px">
	<BR>
		<a href="contest/simple" style="text-decoration: none;">�� (simple algorithm)</a><BR>
		<a href="contest/sort" style="text-decoration: none;">���� (sort algorithm)</a><BR>
		<a href="contest/divide_and_conquer" style="text-decoration: none;">���η� (divide and conquer)</a><BR>
		<a href="contest/data_structure" style="text-decoration: none;">���ݽṹ (data structure)</a><BR>
		<a href="contest/dynamic" style="text-decoration: none;">��̬�滮 (dynamic planning)</a><BR>
		<a href="contest/greedy" style="text-decoration: none;">̰���㷨 (greedy algorithm)</a><BR>
		<a href="contest/backtracking" style="text-decoration: none;">���ݷ� (backtracking)</a><BR>
		<a href="contest/graph" style="text-decoration: none;">ͼ�㷨 (graph algorithms)</a><BR>
		<a href="contest/advanced" style="text-decoration: none;">�߼��㷨 (advanced algorithms)</a>

	</div>
	</body>
</html>