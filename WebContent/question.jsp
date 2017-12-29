<%@ page import="java.util.*,com.ldsh.utils.*,com.ldsh.bean.*" language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	int type = Integer.parseInt(request.getParameter("type"));
	HashMap<Integer, Question> questions = (HashMap<Integer, Question>)session.getAttribute("questions");
	Question question = null;
	if(questions != null){
		question = questions.get(id);
	}
%>
<html>
	<head>
		<title><%=question.getTitle() %></title>
		<link rel="icon" href="res/favicon.ico" type="image/x-icon">
	</head>
	<body style="background-color: #29508B;width:950px;margin:0 auto">
		<div style="background-color: #FFFFFF;padding-top: 5px;overflow:hidden;">
			<h1 style="padding-left:15px;">算法训练场</h1><hr>
		</div>
		<div style="background-color: #FFFFFF;width: 950px;height: 500px;">
		<%
			
			session.setAttribute("currentQtype", type);
			String ahref = "";
			switch(type){
				case 1:ahref = "contest/simple";break;
				case 2:ahref = "contest/sort";break;
				case 3:ahref = "contest/divide_and_conquer";break;
				case 4:ahref = "contest/data_structure";break;
				case 5:ahref = "contest/dynamic";break;
				case 6:ahref = "contest/greedy";break;
				case 7:ahref = "contest/backtracking";break;
				case 8:ahref = "contest/graph";break;
				case 9:ahref = "contest/advanced";break;
			}
		%>
			<div style="width: 100px;float: left;">
				<br>
				<ul>
					<li style="list-style-type: none;"><a href="index.jsp" style="text-decoration: none;">主页</a></li>
					<li style="list-style-type: none;"><a href="<%=ahref %>" style="text-decoration: none;">题库</a></li>
					<li style="list-style-type: none;"><a href="register.jsp" style="text-decoration: none;">注册</a></li>
				</ul>
			</div>
			<div style="background-color:#9A9A9A;width:1px;float: left;height:100%;" ></div>
			<div style="width: 804px;float: left;padding-left: 23px;">
	           <h3><%=id %>.
	           <%=question.getTitle() %></h3>
	           <b>问题描述: </b><br><%=question.getContent() %><br>
	           <b>输入格式: </b><%=question.getInputFormat() %><br><br>
	           <b>输出格式: </b><%=question.getOutputFormat() %><br><br>
	           <b>答案：</b><br>
	           <% 
	          	 if(session.getAttribute("uname") == null){
	          		 out.print("游客无法查看答案！");
	          	 }else{
	          		 %>
	          		<table>
		           		<tr>
		           			<td>
		           				<a href="answer.jsp?id=<%=id %>&type=1" style="text-decoration: none;">查看代码</a>
		           				<form action="answer.jsp">
		           					<input type="hidden" name="qtype" value="<%=type %>"/>
		           				</form>
		           			</td>
		           		</tr>
		           		<tr>
		           			<td>
		           				<a href="answer.jsp?id=<%=id %>&type=4" style="text-decoration: none;">查看分析</a>
		           			</td>
		           		</tr>
		           </table>
	          <% } %>
			</div>
			
		</div>
	</body>
</html>