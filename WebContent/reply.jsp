<%@ page import="java.sql.*" language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>

<html>
	<head>
	<title>�ظ�</title>
	<link rel="icon" href="res/favicon.ico" type="image/x-icon">
	</head>
	<body style="background-color: #29508B;width:950px;margin:0 auto">
		<%
			final String rid = request.getParameter("rid");
			final String fid = request.getParameter("fid");
			final String type = request.getParameter("type");
		%>
		<div style="background-color: #FFFFFF;padding-top: 5px;overflow:hidden;">
			<h1 style="padding-left:15px;">�ظ�����</h1><hr>
		</div>
		<div style="background-color: #FFFFFF;width: 950px;height: 500px;">
			
			<div style="background-color:#9A9A9A;width:1px;float: left;height:100%;" ></div>
			<div style="width: 804px;float: left;padding-left: 23px;">
	            <form action="handreply?rid=<%=rid %>&fid=<%=fid %>&type=<%=type%>" method="post" onsubmit="return check()">
					<input type="hidden" value="<%=request.getHeader("Referer")%>" name="lasturl">
	            	<table>
	            		<tr>
	            			<td>���⣺</td>
	            			<td><input type="text" name="subject" style="width: 600px;"><span style="color: gray;">(�ɲ���)</span></td>
	            		</tr>
	            		<tr>
	            			<td>���ݣ�</td>
	            			<td><textarea rows="20" cols="100" name="content" id="content" style="text-align: left;">
	            			</textarea></td>
	            		</tr>
	            		<tr>
	            			<td><input type="button" value="����" onclick="javascript:history.back(-1);"></td>
	            			<td style="text-align: center;"><input type="submit" value="����"></td>
	            		</tr>
	            	</table>
	            </form>
			</div>
		</div>
		<script type="text/javascript">
			function check() {
				if(document.getElementById("content").value.trim() == ""){
					return false;
				}
				return true;
			}
		</script>
	</body>
</html>