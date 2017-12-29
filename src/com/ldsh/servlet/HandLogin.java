package com.ldsh.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ldsh.utils.JDBCUtil;

public class HandLogin extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("gb2312");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String uname = request.getParameter("uname");
		String upsw = request.getParameter("upsw");
		Connection conn = JDBCUtil.getConnection();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		try(PreparedStatement pstate = conn.prepareStatement("select u_psw from users where u_name=?")) {
				pstate.setString(1, uname);
			ResultSet rs = pstate.executeQuery();
			if(rs.next()){
				if(upsw.equals(rs.getString(1))){
					session.setAttribute("uname", uname);
					dealLoginError(response, out, true);
				}else{//密码错误
					dealLoginError(response, out, false);
				}
			}else{//用户不存在
				dealLoginError(response, out, false);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage()+"数据库查询失败！");
			dealLoginError(response, out, false);
		}finally {
			out.println("  </BODY>");
			out.println("</HTML>");
			out.flush();
			out.close();
		}
	}
	
	private void dealLoginError(HttpServletResponse response,PrintWriter out, boolean isSuccess){
		response.setHeader("refresh", "3;url=index.jsp");
		if(isSuccess){
			out.println("登录成功<BR>");
			out.println("<a href=\"index.jsp\" style=\"text-decoration: none;\">3秒后跳回首页</a>");
		}else{
			out.println("用户或密码错误<BR>");
			out.println("<a href=\"login.jsp\" style=\"text-decoration: none;\">3秒后返回登录</a>");
		}
	}
	
	

}
