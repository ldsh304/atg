<%@ page import="java.util.*,com.ldsh.bean.*" language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%
	String uname = (String)session.getAttribute("uname");
%>
<html>
	<head>
		<title>ATG-讨论区</title>
		<link rel="icon" href="res/favicon.ico" type="image/x-icon">
	</head>
	<body style="background-color: #29508B;width:950px;margin:0 auto">
		<div style="background-color: #FFFFFF;padding-top: 5px;overflow:hidden;">
			<b style="padding-left: 10px;font-size: 40px;">讨论区</b>
			<%	if(uname != null) {%>
				<a href="handquit" style="color:#FFFFFF; background-color:#2BA6CB;text-align:center;position: absolute;right:230px;text-decoration: none;margin-top: 30px">[退出]</a>
			<%	}%>
		 	<hr>
		</div>
		
		<div style="background-color: #FFFFFF;width: 950px;height: 60%;">
			<div style="width: 150px;float: left;">
				<ul>
					<li style="list-style-type: none;"><a href="index.jsp" style="text-decoration: none;">主页</a></li>
					<li style="list-style-type: none;"><a href="contests.jsp" style="text-decoration: none;font-size: 10px;">题库分类</a></li>
					<li style="list-style-type: none;"><a href="#" style="text-decoration: none;">讨论区</a></li>
				</ul>
			</div >
			<div style="background-color:#9A9A9A;width:1px;float: left;height:100%;" >
			</div>
			<div style="padding: 10px;padding-left: 160;">
				<%	if(uname == null){
						response.setHeader("refresh", "3;url=index.jsp");
						out.print("<div style=\"height:50%;background-color: #FFFFFF;overflow:hidden;\">");
						out.print("<div style=\"background-color: #FFFFFF;padding:10px;\">");
						out.print("游客没有讨论权限<br>");
						out.print("<a href=\"index.jsp\" style=\"text-decoration: none;\">3秒后返回主页</a>");
						out.print("</div>"); 
						out.print("</div>");
						}else{/*用户*/%>
					<ul>
						<li style="list-style-type: none;font-weight:bold;font-size: 20px">讨论区板块：</li>
						<li style="list-style-type: none;"><br></li>
						<li style="list-style-type: none;"><a href="forum?type=1" style="text-decoration: none;">C++板块</a></li>
						<li style="list-style-type: none;"><a href="forum?type=2" style="text-decoration: none;">JAVAS板块</a></li>
						<li style="list-style-type: none;"><a href="forum?type=3" style="text-decoration: none;">其他板块</a></li>
					</ul>
				<%	}%>
			</div>
		</div>
		
		<div style="text-align:center;background-color: #FFFFFF;overflow: hidden;padding-bottom: 5px">
			<hr>版权所有(C)2017 武昌理工学院 LDSH
		</div>
	</body>
</html>