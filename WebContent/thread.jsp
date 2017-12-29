<%@page import="com.ldsh.imp.*"%>
<%@ page import="java.util.*,com.ldsh.bean.*" language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%
	String uname = (String)session.getAttribute("uname");
	int type = Integer.parseInt(request.getParameter("type"));
	int rootid = Integer.parseInt(request.getParameter("tid"));
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html>
	<head>
		<title>ATG-讨论区</title>
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
		<div style="background-color: #FFFFFF;width: 950px;">
			<div style="width: 150px;float: left;">
				<ul>
					<li style="list-style-type: none;"><a href="index.jsp" style="text-decoration: none;">主页</a></li>
					<li style="list-style-type: none;"><a href="contests.jsp" style="text-decoration: none;">题库</a></li>
					<li style="list-style-type: none;"><a href="discuss.jsp" style="text-decoration: none;">讨论区</a></li>
					<li style="list-style-type: none;"><a href="<%=basePath %>forum?type=<%=type %>" style="text-decoration: none;">帖子列表</a></li>
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
			</div >
			<div style="border:1px solid #8DC741;overflow: hidden;margin-right:8px;">
				<% 
				
					List<Topic> list = new TopicImp().queryById(rootid);
					Topic post = null;
					List<Topic> reply = new ArrayList<Topic>();
					for(Topic tp : list){
						if(tp.getFid() == 0 && tp.getRid()== 0 && tp.getSubject()!=null)
							post = tp;
						else{
							reply.add(tp);
						}
					}
					if(post != null){
				%>
					<div style="padding-left: 10px;">主题：<%=post.getSubject() %> </div>
					<hr style="height:2px;border:none;border-top:2px solid #A9D46D;">
					
					<div style="padding-left: 10px;height:10px;margin-top: -8px;padding-bottom: 1px;font-size: 10px;">用户：<%=post.getUname() %> 
						<div style="height:15px;float:right;margin-right: 20px;">回复次数：<%=reply.size() %>&nbsp;&nbsp;&nbsp;&nbsp;<b>楼 主</b></div>
					</div>
					<hr style="height:1px;border:none;border-top:1px solid #A9D46D;">
					<div style="padding-left: 10px;"><%=post.getContent() %><br></div>
					<hr style="height:1px;border:none;border-top:1px solid #A9D46D;">
					<div style="height:10px;">
						<div style="height:10px;float:right;margin-right: 20px;margin-top: -5px;font-size: 15px;"><a href="reply.jsp?rid=<%=rootid%>&fid=<%=post.getTid()%>&type=<%=type%>" style="text-decoration: none;">回复</a>   <a href="#" style="text-decoration: none;">编辑</a>  <a href="#" style="text-decoration: none;">删除</a></div>
					</div>
					<hr style="height:3px;border:none;border-top:3px solid #A9D46D;">
				<% 		for(int i = 0; i < reply.size(); i++){  Topic tp = reply.get(i);%>
							<div style="padding-left: 10px;height:10px;margin-top: -8px;padding-bottom: 1px;font-size: 10px;">用户：<%=tp.getUname() %> 
								<div style="height:15px;float:right;margin-right: 20px;">第<%=i+2 %>楼</div>
							</div>
							<hr style="height:1px;border:none;border-top:1px solid #A9D46D;">
							<div style="padding-left: 10px;"><%=tp.getContent() %><br></div>
							<hr style="height:1px;border:none;border-top:1px solid #A9D46D;">
							<div style="height:10px;">
								<div style="height:10px;float:right;margin-right: 20px;margin-top: -5px;font-size: 15px;"><a href="reply.jsp?rid=<%=rootid%>&fid=<%=tp.getTid()%>&type=<%=type%>" style="text-decoration: none;">回复</a>   <a href="#" style="text-decoration: none;">编辑</a>  <a href="#" style="text-decoration: none;">删除</a></div>
							</div>
							<hr style="height:5px;border:none;border-top:3px solid #A9D46D;">
				<%		}%>
							<form action="reply.jsp" style="text-align: center;">
								<input type="submit" style="margin-top:10px;color: blue;font-size: 15px;width: 100px" value="回复此贴" ><br>
								<input type="hidden" value="<%=rootid%>" name="rid">
								<input type="hidden" value="<%=post.getTid()%>" name="fid">
								<input type="hidden" value="<%=type%>" name="type">
							</form>
							<form action="newtopic.jsp" style="text-align: center;">
								<input type="hidden" value="<%=type%>" name="type">
								<input type="submit" style="margin-top:10px;color: blue;font-size: 15px;width: 100px" value="发表新帖" ><br>
							</form>
				<%	}else{ %>
					<span style="color: red;">查询错误</span>
				<%	}%>
			</div>
		</div>
		<div style="text-align:center;background-color: #FFFFFF;overflow: hidden;padding-bottom: 5px;">
			<hr>版权所有(C)2017 武昌理工学院 LDSH
		</div>
	</body>
</html>