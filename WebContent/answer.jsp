<%@page import="java.util.HashMap"%>
<%@ page import="com.ldsh.bean.*" language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<html>
	<head>
		<title>答案及解析</title>
		<link rel="icon" href="res/favicon.ico" type="image/x-icon">
	</head>
	<body style="background-color: #29508B;width:950px;margin:0 auto">
		<div style="background-color: #FFFFFF;padding-top: 5px;overflow:hidden;">
			<h1 style="padding-left:15px;">算法训练场</h1><hr>
		</div>
		<div style="background-color: #FFFFFF;width: 950px;height: 500px;">
			<%	int type = Integer.parseInt(request.getParameter("type"));
				int currentQtype = (Integer)session.getAttribute("currentQtype");
				int id = Integer.parseInt(request.getParameter("id"));
				HashMap<Integer, Question> questions = (HashMap<Integer, Question>)session.getAttribute("questions");
				Question  question = null;
				if(questions != null){
					question = questions.get(id);
				}
			%>
			<div style="width: 100px;float: left;">
				<ul>
					<li style="list-style-type: none;"><a href="question.jsp?id=<%=id %>&type=<%=currentQtype %>" style="text-decoration: none;font-size: 10px;margin-right: 3px">返回到<br>题目</a></li>
					<li style="list-style-type: none;"><a href="javascript:history.back(-1)" style="text-decoration: none;">返回</a></li>
				</ul>
				<hr style="width: 85%"/>
				<ul>
					<li style="list-style-type: none;"><a href="index.jsp" style="text-decoration: none;">主页</a></li>
					<li style="list-style-type: none;"><a href="contests.jsp" style="text-decoration: none;font-size: 10px;">题库分类</a></li>
				</ul>
				<hr style="width: 85%"/>
				<ul>
					<% 	if(type != 1){%>
					<li style="list-style-type: none;"><a href="answer.jsp?id=<%=id %>&type=1" style="text-decoration: none;">C/C++</a></li>
					<% 	}
						if(type!= 2){%>
					<li style="list-style-type: none;"><a href="answer.jsp?id=<%=id %>&type=2" style="text-decoration: none;">JAVA</a></li>
					<% 	}
						if(type != 3){%>
					<li style="list-style-type: none;"><a href="answer.jsp?id=<%=id %>&type=3" style="text-decoration: none;">其他</a></li>
					<% 	}
						if(type != 4){%>
					<li style="list-style-type: none;"><a href="answer.jsp?id=<%=id %>&type=4" style="text-decoration: none;">解析</a></li>
					<% 	}%>
				</ul>
			</div>
			<div style="background-color:#9A9A9A;width:1px;float: left;height:100%;" ></div>
			<div style="width: 804px;float: left;padding-left: 23px;">
				<%	if(type == 1){%><h3>C/C++代码</h3>
					<code><%=question.getCplus() %></code>
					
				 <%	}else if(type == 2){ %><h3>JAVA代码</h3>
					<code><%=question.getJava() %></code>
					
				 <%	}else if(type == 3){ %><h3>其他代码</h3>
					<code><%=question.getOthers() %></code>
					
				 <% }else if(type == 4){%><h3>解析</h3>
				 	<span><%=question.getAnlalysis() %></span>
				 <% }%>
			</div>
		</div>
	</body>
</html>