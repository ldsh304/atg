
<%@ page import="java.util.*,com.ldsh.bean.*" language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%
	String uname = (String)session.getAttribute("uname");
	int type = Integer.parseInt(request.getParameter("type"));
	List<String> moderators = (List<String>)request.getAttribute("moderators");
	ArrayList<DiscussSubject> forumes = (ArrayList<DiscussSubject>)request.getAttribute("forumes");
	User user = (User)request.getAttribute("user");
%>
<html>
	<head>
		<title>讨论区--帖子列表</title>
		<link rel="icon" href="res/favicon.ico" type="image/x-icon">
	</head>
	<body style="background-color: #29508B;width:950px;margin:0 auto;">
		<div style="background-color: #FFFFFF;padding-top: 5px;overflow:hidden;">
			<%
				String blockTitle = "";
				switch(type){
					case 1:blockTitle="C/C++板块讨论区";break;
					case 2:blockTitle="JAVA板块讨论区";break;
					case 3:blockTitle="其他板块讨论区";break;
					default:type=1;break;
				}
			%>
			<b style="padding-left: 10px;font-size: 35px;"><%=blockTitle %></b>
		 	<hr>
		</div>
		<div style="background-color: #FFFFFF;width: 950px;height: 360px;">
			<div style="width: 150px;float: left;">
				<ul>
					<li style="list-style-type: none;"><a href="index.jsp" style="text-decoration: none;">主页</a></li>
					<li style="list-style-type: none;"><a href="contests.jsp" style="text-decoration: none;">题库</a></li>
					<li style="list-style-type: none;"><a href="discuss.jsp" style="text-decoration: none;">讨论区</a></li>
				</ul>
				<hr width="93%">
				<ul>
					<% 	if(type != 1){%>
					<li style="list-style-type: none;"><a href="forum?type=1" style="text-decoration: none;">C/C++</a></li>
					<% 	}if(type != 2){%>
					<li style="list-style-type: none;"><a href="forum?type=2" style="text-decoration: none;">JAVA</a></li>
					<%	} if(type != 3){%>
					<li style="list-style-type: none;"><a href="forum?type=3" style="text-decoration: none;">其他</a></li>
					<% 	}%>
				</ul>
				<hr width="93%">
				<table style="padding-left: 5px;font-size: 15px;">
					<tr>
						<td><span style="color:background;">用 户：</span><%=user.getName() %></td>
					</tr>
					<tr>
						<td><span style="color:background;">帖 子：</span><%=user.getTopicCount() %></td>
					</tr>
					<tr>
						<td><span style="color:background;">注 册：</span><%=user.getTime() %></td>
					</tr>
				</table>
				<br>
				<hr width="93%">
			</div >
			<div style="background-color:#9A9A9A;width:1px;height: 300px;float: left;" >
			</div>
			<div style="padding: 10px; padding-left: 165px;border-left:1px solid #9A9A9A;height: 360px;">
				<table>
					<tr>
						<td style="color:background;">版主:</td>
						<% for(String elem : moderators){
							out.print("<td style=\"color:#295088;\">"+ elem +"</td>");
						}
						%>
					</tr>
				</table>
				<table style="border-bottom:1px #a9d46d solid;background:#F4FAED;">
					<tr >
						<td style="width:70%;color:white;background-color: #6C9A2E;text-align: center;">主题</td>
						<td style="width:10%;color:white;background-color: #6C9A2E;text-align: center;">发表</td>
						<td style="width:20%;color:white;background-color: #6C9A2E;text-align: center;">最后更新</td>
					</tr>
					<%	for(DiscussSubject ds : forumes){
						String lastUser = ds.getLastUser();
						if(ds.getLastUser() == null || ds.getLastUser().trim().equals("null")){
							lastUser = ds.getCurrentUser();
						}
						String time = ds.getTime();
						if(ds.getTime() == null || ds.getTime().trim().equals("null")){
							time = "";
						}
					%>
					<tr bgcolor="#B4DC82">
						<td style="padding-left: 3px;"><a href="thread?tid=<%=ds.getTid() %>&type=<%=type %>" style="text-decoration: none;color: blue;"><%=ds.getSubject() %></a></td>
						<td style="padding-left: 3px"><%=ds.getCurrentUser() %></td>
						<td style="padding-left: 3px"><%=lastUser %><span style="font-size: 10px;padding-left: 5px"><%=time %></span> </td>
					</tr>
					<%	}%>
				</table>
				<form action="newtopic.jsp" style="text-align: center;">
					<input type="hidden" value="<%=type%>" name="type">
					<input type="submit" style="margin-top:10px;color: blue;font-size: 15px;width: 100px" value="发表新帖" ><br>
				</form>
			</div>
		</div>
		<div style="text-align:center;background-color: #FFFFFF;overflow: hidden;padding-bottom: 5px;">
			<hr>版权所有(C)2017 武昌理工学院 LDSH
		</div>
	</body>
</html>