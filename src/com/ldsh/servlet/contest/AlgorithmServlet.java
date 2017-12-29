package com.ldsh.servlet.contest;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ldsh.bean.Question;
import com.ldsh.utils.JDBCUtil;

public class AlgorithmServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void dealData(HttpServletRequest request, HttpServletResponse response,int q_type)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("gb2312");
		request.setCharacterEncoding("gb2312");
		if(JDBCUtil.isConnect == false) {
			request.getSession().setAttribute("questions",new HashMap<Integer, Question>());
			loadingHTML(request,response,q_type);
			return ;
		}
		HashMap<Integer, Question> questions = new HashMap<Integer, Question>();
		try(Connection conn = JDBCUtil.getConnection();
			Statement state = conn.createStatement();
			ResultSet rs = state.executeQuery("select q_id,q_title,q_content,q_in_format,q_out_format,degree,lcplus,ljava,lothers,analysis from questions where q_type=" + q_type);
				) {
			while(rs.next()) {
				Question question = new Question();
				int id = rs.getInt("q_id");
				question.setId(id);
				question.setTitle(rs.getString("q_title"));
				question.setContent(rs.getString("q_content"));
				question.setInputFormat(rs.getString("q_in_format"));
				question.setOutputFormat(rs.getString("q_out_format"));
				question.setType(q_type);
				question.setDegree(rs.getInt("degree"));
				question.setCplus(rs.getString("lcplus"));
				question.setJava(rs.getString("ljava"));
				question.setOthers(rs.getString("lothers"));
				question.setAnlalysis(rs.getString("analysis"));
				questions.put(id, question);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			request.getSession().setAttribute("questions",questions);
			loadingHTML(request,response,q_type);
		}
	}
	
	protected void loadingHTML(HttpServletRequest request, HttpServletResponse response, int q_type)
			throws ServletException, IOException {
		//��Ŀ¼
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String str = "";
		switch(q_type) {
			case 1:str = "�� (simple algorithm)";break;
			case 2:str = "���� (sort algorithm)";break;
			case 3:str = "���η� (divide and conquer)";break;
			case 4:str = "���ݽṹ (data structure)";break;
			case 5:str = "��̬�滮 (dynamic planning)";break;
			case 6:str = "̰���㷨 (greedy algorithm)";break;
			case 7:str = "���ݷ� (backtracking)";break;
			case 8:str = "ͼ�㷨 (graph algorithms)";break;
			case 9:str = "�߼��㷨 (advanced algorithms)";break;
		}
		out.println("<html>\r\n" + 
				"	<head>\r\n" + 
				"		<title>ATG-���</title>\r\n" + 
				"		<link rel=\"icon\" href=\""+basePath +"res/favicon.ico\" type=\"image/x-icon\">\r\n" + 
				"	</head>\r\n" + 
				"	<body style=\"background-color: #29508B;width:950px;margin:0 auto\">\r\n" + 
				"		<div style=\"background-color: #FFFFFF;padding-top: 5px;overflow:hidden;\">\r\n" + 
				"			<b style=\"padding-left: 10px;font-size: 40px;\">���</b>");
		if(session.getAttribute("uname") != null){
			out.println("<span style=\"color:#000000;center;position: absolute;right:290px;text-decoration: none;margin-top: 30px;\">"+session.getAttribute("uname")+"</span>\r\n" + 
					"			 	<a href=\""+basePath+"handquit\" style=\"color:#FFFFFF; background-color:#2BA6CB;text-align:center;position: relative;right:230px;text-decoration: none;margin-top: 30px;\">[�˳�]</a>");
		}else {
			out.println("<a href=\""+basePath+"login.jsp\" style=\"color:#FFFFFF; background-color:#2BA6CB; text-align:center;position: absolute;right:290px;text-decoration: none;margin-top: 30px;\">[��¼]</a>\r\n" + 
					"	 <a href=\""+basePath+"register.jsp\" style=\"color:#FFFFFF; background-color:#2BA6CB;text-align:center;position: absolute;right:230px;text-decoration: none;margin-top: 30px;\">[ע��]</a>");
		}
		out.println("<hr>\r\n" + 
				"		</div>\r\n" + 
				"		<div style=\"background-color: #FFFFFF;width: 950px;height: 70%;\">\r\n" + 
				"			<div style=\"width: 100px;float: left;\">\r\n" + 
				"				<br>\r\n" + 
				"				<ul>\r\n" + 
				"					<li style=\"list-style-type: none;\"><a href=\""+basePath +"index.jsp\" style=\"text-decoration: none;\">��ҳ</a></li>\r\n" + 
				"					<li style=\"list-style-type: none;\"><a href=\""+basePath+"contests.jsp\" style=\"text-decoration: none;font-size: 10px\">������</a></li>\r\n" + 
				"				</ul>\r\n" + 
				"			</div>\r\n" + 
				"			<div style=\"background-color:#9A9A9A;width:1px;float: left;height:100%;\" ></div>\r\n" + 
				"			<div style=\"width: 804px;float: left;padding-left: 23px;\" >\r\n" + 
				"				<h2>"+str+"</h2>");
		@SuppressWarnings("unchecked")
		HashMap<Integer, Question> questions = (HashMap<Integer, Question>)session.getAttribute("questions");
		if(questions != null){
			out.println("<table style=\"width: 100%; text-align: left;\">\r\n" + 
					"					<tr style=\"width: 90%;background-color:#C3D9FF\">\r\n" + 
					"						<td style=\"width:15%;padding-left: 10px;\">���<td>\r\n" + 
					"						<td style=\"width:70%;padding-left: 10px;\">��Ŀ</td>\r\n" + 
					"						<td style=\"width:15%;padding-left: 10px;\">�Ѷȵȼ�</td>\r\n" + 
					"					</tr>");
			Set<Integer> ks = questions.keySet();
			int i = -1;
			for(Integer keyid : ks) {
				i++;
				Question question = questions.get(keyid);
				int id = question.getId();
				int degree = question.getDegree();
				String title = question.getTitle();
				if(i % 2 == 0){
					out.println("<tr style=\"background-color:#F7F7F7\">");
				}else {
					out.println("<tr style=\"background-color:#E5ECF9\">");
				}
				out.println("<td style=\"width:15%;padding-left: 10px;\">"+"<a href=\""+ basePath + "question.jsp?id="+id+"&type="+q_type+"\" style=\"text-decoration: none;\">"+id+"</a>"+"<td>\r\n" + 
						"						<td style=\"width:70%;padding-left: 10px;\">"+"<a href=\""+basePath +"question.jsp?id="+id+"&type="+q_type+"\"style=\"text-decoration: none;\">"+title+"</a>"+"</td>\r\n" + 
						"						<td style=\"width:15%;padding-left: 10px;\">"+degree+"</td>\r\n" + 
						"					</tr>");
			}
			out.println("</table>");
		}else {
			out.println("<span>��ѯ���ݳ���</span>");
		}
		out.println("			</div>\r\n" + 
				"		</div>\r\n" + 
				"		<div style=\"text-align:center;background-color: #FFEEEE;overflow: hidden;padding-bottom: 5px\">\r\n" + 
				"			<hr>\r\n" + 
				"		 	 ��Ȩ����(C)2017 �����ѧԺ LDSH\r\n" + 
				"		</div>\r\n" + 
				"	</body>\r\n" + 
				"</html>");
	}
}
