<%@ page contentType="text/html; charset=gb2312" pageEncoding="gb2312"%>
<html>
	<head>
		<link rel="icon" href="res/favicon.ico" type="image/x-icon">
	</head>
	<body style="margin: 0px;">
		<div style="margin-left: 30px;margin-top: 7px">
		 	��ӭ����ATG(Algorithm Training Ground)
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
			<img alt="ͼƬ" src="res/logo.png" style="float:left;"/>
			<table style="width:1155px;height:100px;color:#00FF00">
				<tr >
					<th><a href="index.jsp" style="text-decoration: none;">��ҳ</a></th>
					<th><a href="introduce.jsp" style="text-decoration: none;">����</a></th>
					<th><a href="contests.jsp" style="text-decoration: none;">���</a></th>
					<th><a href="discuss.jsp" style="text-decoration: none;">������</a></th>
					<th><a href="about.jsp" style="text-decoration: none;">��������</a></th>
				</tr>
			</table>
		</div>
	</body>
</html>