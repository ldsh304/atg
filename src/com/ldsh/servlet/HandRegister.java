package com.ldsh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ldsh.bean.User;
import com.ldsh.imp.UserImp;

public class HandRegister extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("gb2312");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>注册</TITLE></HEAD>");
		out.println("  <BODY>");
		String uname = request.getParameter("uname");
		String upsw = request.getParameter("upsw");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		User user = new User(uname,upsw,email);
		if(phone.matches("[0-9]+"))
			user.setPhone(Long.parseLong(phone));
		try {
			if(new UserImp().insert(user)) {
				response.setHeader("refresh", "3;url=index.jsp");
				out.println("注册成功<br>");
				//response.sendRedirect("login.jsp");
				out.println("<a href=\"login.jsp\" style=\"text-decoration: none;\">3秒后跳回首页</a>");
			}else {
				out.println("注册失败<br>");
				out.println("<a href=\"register.jsp\" style=\"text-decoration: none;\">重新注册</a><br>");
				out.println("<a href=\"index.jsp\" style=\"text-decoration: none;\">返回首页</a>");
			}
		}catch(Exception e) {
			if(new UserImp().insert(user)) {
				response.setHeader("refresh", "3;url=index.jsp");
				out.println("注册成功<br>");
				//response.sendRedirect("login.jsp");
				out.println("<a href=\"login.jsp\" style=\"text-decoration: none;\">3秒后跳回首页</a>");
			}else {
				out.println("注册失败<br>");
				out.println("<a href=\"register.jsp\" style=\"text-decoration: none;\">重新注册</a><br>");
				out.println("<a href=\"index.jsp\" style=\"text-decoration: none;\">返回首页</a>");
			}
		}
		
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
		
	}

}
