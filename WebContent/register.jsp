<%@ page import="java.sql.*" language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<html>
	<head>
	<title>ע��</title>
	<link rel="icon" href="res/favicon.ico" type="image/x-icon">
	</head>
	<body style="background-color: #29508B;width:950px;margin:0 auto">
		<div style="background-color: #FFFFFF;padding-top: 5px;overflow:hidden;">
			<h1 style="padding-left:15px;">�㷨ѵ����</h1><hr>
		</div>
		<div style="background-color: #FFFFFF;width: 950px;height: 500px;">
			<div style="width: 100px;float: left;">
				<br>
				<ul>
					<li style="list-style-type: none;"><a href="index.jsp" style="text-decoration: none;">��ҳ</a></li>
					<li style="list-style-type: none;"><a href="contests.jsp" style="text-decoration: none;">���</a></li>
					<li style="list-style-type: none;"><a href="login.jsp" style="text-decoration: none;">��¼</a></li>
				</ul>
			</div>
			<div style="background-color:#9A9A9A;width:1px;float: left;height:400px;" ></div>
			<div style="width: 804px;float: left;padding-left: 23px;">
				<h2 style="color:red ">ע��</h2>
	            <form action="handregister" method="post" id ="form" onsubmit="return checkcomplete()">
				     <table >
			    		<tr>
			    			
			    			<th style="text-align: right;">*�û�����</th>
			    			<th><input type="text" name="uname" id="uname" onchange="checkuname()"/></th>
			    			<th style="text-align: left;"><label id="lluname" style="color:red;"></label></th>
			    		</tr>
			    		<tr >
			    			<th style="text-align: right;">*���룺</th>
			    			<th><input type="password" name="upsw" id="upsw" onchange="clearpsw()"/></th>
			    			<th style="text-align: left;"><label id="llupsw" style="color:red;"></label></th>
			    		</tr>
			    		<tr>
			    			<th style="text-align: right;">*ȷ�����룺</th>
			    			<th><input type="password" id="ckupsw" onchange="checkpsw()" /></th>
			    			<th style="text-align: left;"><label id="llckupsw" style="color:red;"></label></th>
			    		</tr>
			    		<tr>
			    			<th style="text-align: right;">���䣺</th>
			    			<th><input type="email" name="email" id="email" onchange="checkemail()"/></th>
			    			<th style="text-align: left;"><label id="llemail" style="color:red;"></label></th>
			    		</tr>
			    		<tr>
			    			<th style="text-align: right;">�绰��</th>
			    			<th><input type="text" name="phone" id="phone" onchange="checkphone()"/></th>
			    			<th style="text-align: left;"><label id="llphone" style="color:red;"></label></th>
			    		</tr>
			    		<tr>
			    			<th></th>
			    			<th></th>
			    			<th></th>
			    		</tr>
			    		<tr>
			    			<th><input type="submit"  value="ע�� "/></th>
			    			<th><input type="reset" onclick="clearall()" value="���� "/></th>
			    			<th style="text-align: left;"><label id="llconfirm" style="color:red;"></label></th>
			    		</tr>	
			    	</table>
	            	<br>
	            	
	            </form>
			</div>
		</div>
		
	<script type="text/javascript">
	
		function checkuname(){
			var uname = document.getElementById("uname").value;
			var re =new RegExp("^[a-zA-Z]+[a-zA-Z0-9]*");
			if(uname.length < 6 || uname.length > 16){
				document.getElementById("lluname").innerHTML = "�û����ĳ���Ϊ6 -- 16";
				return false;
			}
			document.getElementById("lluname").innerHTML = "re.test(uname)";
			if(!re.test(uname)){
				document.getElementById("lluname").innerHTML = "�û���������ĸ����ĸ�����ֵ�������";
				return false;
			}
			document.getElementById("lluname").innerHTML = "��";
			return true;
		}
		function clearpsw(){
			var psw1 = document.getElementById("upsw").value.trim();
			document.getElementById("ckupsw").value = "";
			if(psw1.length < 6 || psw1.length > 16){
				document.getElementById("llupsw").innerHTML = "����ĳ���Ϊ6 -- 16";
			   	return false;
			}
			document.getElementById("llupsw").innerHTML = "";
			document.getElementById("llckupsw").innerHTML = "";
			return true;
		}
		function checkpsw(){
			var psw1 = document.getElementById("upsw").value;
			var psw2 = document.getElementById("ckupsw").value;
			
			if(psw1 != psw2){
			   	document.getElementById("llupsw").innerHTML = "������������벻һ�£�����������";
			   	document.getElementById("ckupsw").value = "";
			   	return false;
			}
			document.getElementById("llupsw").innerHTML = "";
			document.getElementById("llckupsw").innerHTML = "��";
			return true;
		}
	
		function checkemail(){
			var email = document.getElementById("email").value;
			var re =new RegExp("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+");
			if(re.test(email)){
				document.getElementById("llemail").innerHTML = "��";
				return true;
			}
			document.getElementById("llemail").innerHTML = "�����ʽ����";
			return false;
		}
		
		function checkphone(){
			var phone = document.getElementById("phone").value;
			var re =new RegExp("^1[3|4|5|8][0-9]\\d{8}$");
			if(re.test(phone)){
				document.getElementById("llphone").innerHTML = "��";
				return true;
			}
			document.getElementById("llphone").innerHTML = " �绰�����ʽ����";
			return false;
		}
		
		function checkcomplete(){
		
			if(!checkphone() && !checkemail()){
			    document.getElementById("llconfirm").innerText = "����͵绰������дһ��";
				return false;
			}else if(checkphone() && !checkemail()){
				document.getElementById("email").value = "";
			}else if(!checkphone() && checkemail()){
				document.getElementById("phone").value = "";
			}
			if(checkuname() && checkpsw()){
				return true;
			}
			return false;
		}
		
		function clearall(){
			document.getElementById("lluname").innerHTML = "";
			document.getElementById("llupsw").innerHTML = "";
			document.getElementById("llckupsw").innerHTML = "";
			document.getElementById("llemail").innerHTML = "";
			document.getElementById("llphone").innerHTML = "";
			document.getElementById("llconfirm").innerHTML = "";
		}
	</script>
	</body>
</html>