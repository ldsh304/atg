<%@ page import="java.sql.*,java.util.*,com.ldsh.bean.*,com.ldsh.imp.*" language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<%
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html>
	<head>
	<title>后台管理</title>
	<link rel="icon" href="res/favicon.ico" type="image/x-icon">
	</head>
	<body style="background-color: #29508B;width:950px;margin:0 auto;">
		<div style="background-color: #FFFFFF;padding-top: 5px;overflow:hidden;"> 
			<h1 style="padding-left:15px;text-align: center;">后台管理</h1><hr>
		</div>
		<div style="background-color:#FFFFFF;height: 300px auto;">
			<div style="width: 100px;float: left;">
				<br>
				<ul>
					<li style="list-style-type: none;"><a href="<%=basePath %>admin.jsp" style="text-decoration: none">退出</a></li>
					<li style="list-style-type: none;"><a href="javascript:history.go(-1);" style="text-decoration: none">返回</a></li>
				</ul>
			</div>
			<div style="background-color:#FFFFFF;padding:10px;" >
				<table border="1" style="border-color: blue;">
					<tr>
						<td width="70%">主题</td>
						<td width="10%">发表</td>
						<td width="20%">发帖时间</td>
					</tr>
					<%	
						if(!request.getParameter("type").equals("2")){
							List<DiscussSubject> dss = new DiscussSubjectImp().queryAll();
							if(dss.size() == 0){
								out.print("<tr><td colspan=\"3\" style=\"border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;\">暂无数据</td></tr>");
							}else{
								for(DiscussSubject ds : dss){
									out.print("<tr>");
									String title = ds.getSubject();
									if(title.length() > 20)
										title = title.substring(0, 20);
									out.print("  <td style=\"border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;\">"+title+ "</td>");
									out.print("  <td style=\"border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;\">"+ds.getCurrentUser()+ "</td>");
									out.print("  <td style=\"border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;\">"+ds.getLastUser()+" " + "<span style=\"font-size: 10px;padding-left: 5px\">"+ds.getTime()+"</span></td>");
									out.print("</tr>");
								}
							}
						}else{
							String id = request.getParameter("name");
							
							if(!id.matches("[0-9]+")){
								out.print("<tr><td colspan=\"3\" style=\"border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;\">暂无数据</td></tr>");
							}else{
								DiscussSubject ds = new DiscussSubjectImp().queryById(Integer.parseInt(id));
								out.print("<tr>");
								String title = ds.getSubject();
								if(title.length() > 20)
									title = title.substring(0, 20);
								out.print("  <td style=\"border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;\">"+title+ "</td>");
								out.print("  <td style=\"border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;\">"+ds.getCurrentUser()+ "</td>");
								out.print("  <td style=\"border-left: 1px solid #000000;border-top: 1px solid #000000;text-align: center;font-size: 15px;\">"+ds.getLastUser()+" " + "<span style=\"font-size: 5px;padding-left: 5px\">"+ds.getTime()+"</span></td>");
								out.print("</tr>");
							}
						}
					%>
					<tr></tr>
				</table>
			</div>
		</div>
	</body>
</html>