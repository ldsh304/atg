<%@ page import="java.util.*,com.ldsh.bean.*" language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<html>
	<head>
		<title>ATG-题库</title>
		<link rel="icon" href="res/favicon.ico" type="image/x-icon">
	</head>
	<body style="background-color: #29508B;width:950px;margin:0 auto">
		<a href="question?id=">id</a>
		<div style="background-color: #FFFFFF;padding-top: 5px;overflow:hidden;">
			<b style="padding-left: 10px;font-size: 40px;">题库</b>
			<% 	
		 		if(session.getAttribute("uname") != null){
		 	%>
			 	<span style="color:#000000;center;position: absolute;right:290px;text-decoration: none;margin-top: 30px;"><%=session.getAttribute("uname")%></span>
			 	<a href="handquit" style="color:#FFFFFF; background-color:#2BA6CB;text-align:center;position: relative;right:230px;text-decoration: none;margin-top: 30px;">[退出]</a>
		 	<% 	}else {%>
			 	<a href="login.jsp" style="color:#FFFFFF; background-color:#2BA6CB; text-align:center;position: absolute;right:290px;text-decoration: none;margin-top: 30px;">[登录]</a>
			 	<a href="register.jsp" style="color:#FFFFFF; background-color:#2BA6CB;text-align:center;position: absolute;right:230px;text-decoration: none;margin-top: 30px;">[注册]</a>
		 	<% 	} %>
		 	<hr>
		</div>
		<div style="background-color: #FFFFFF;width: 950px;height: 100%;">
			<div style="width: 100px;float: left;">
				<br>
				<ul>
					<li style="list-style-type: none;"><a href="index.jsp" style="text-decoration: none;">主页</a></li>
					<li style="list-style-type: none;"><a href="contests" style="text-decoration: none;">题库</a></li>
				</ul>
			</div>
			<div style="background-color:#9A9A9A;width:1px;float: left;height:100%;" ></div>
			<div style="width: 804px;float: left;padding-left: 23px;" >
				<h2>简单 (simple algorithm)</h2>
				<% 	Object obj = session.getAttribute("questions");
					if(obj != null){
				%>
				<table style="width: 100%; text-align: left;">
					<tr style="width: 90%;background-color:#C3D9FF">
						<td style="width:15%;padding-left: 10px;">标号<td>
						<td style="width:70%;padding-left: 10px;">题目</td>
						<td style="width:15%;padding-left: 10px;">难度等级</td>
					</tr>
				<%
						ArrayList<Question> questions = (ArrayList<Question>)obj;
						int len = questions.size();
						for(int i = 0; i < len; i++){
							Question question = questions.get(i);
							int id = question.getId();
							int dgree = question.getDegree();
							String title = question.getTitle();
							if(i % 2 == 0){
				%>
				
					<tr style="background-color:#F7F7F7">
								<%}else{%>
					<tr style="background-color:#E5ECF9">
								<%}%>
						<td style="width:15%;padding-left: 10px;"><%=id %><td>
						<td style="width:70%;padding-left: 10px;"><%=title %></td>
						<td style="width:15%;padding-left: 10px;"><%=dgree %></td>
					</tr>
				<% 		}%>
				</table>
				<%	}else{%>
					<span>查询数据出错</span>
				<%	}%>
				
			</div>
		</div>
		<div style="text-align:center;background-color: #FFEEEE;overflow: hidden;padding-bottom: 5px">
			<hr>
		 	 版权所有(C)2017 武昌理工学院 LDSH
		</div>
	</body>
</html>