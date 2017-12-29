package com.ldsh.adminservlet;

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


public class HandAdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("gb2312");
		PrintWriter out = response.getWriter();
		String mname = request.getParameter("mname");
		String mpsw = request.getParameter("mpsw");
		Connection conn = JDBCUtil.getConnection();
		try(PreparedStatement pstate = conn.prepareStatement("select m_psw,privilege from managers where m_name=?")) {
				pstate.setString(1, mname);
			ResultSet rs = pstate.executeQuery();
			if(rs.next()){
				if(mpsw.equals(rs.getString(1))){
					System.out.println(rs.getInt(1));
					switch(rs.getInt(2)) {
						case 1:response.sendRedirect("sysdba.jsp");break;
						case 2:response.sendRedirect("manageusers.jsp");break;
						case 3:response.sendRedirect("managequestions.jsp");break;
						case 4:response.sendRedirect("managetopics.jsp");break;
						default:out.println("查询数据库权限错误--->privilege<BR>");break;
					}
				}else{//密码错误
					out.println("用户或密码错误不存在<BR>");
					out.print("<li style=\"list-style-type: none;\"><a href=\"javascript:history.go(-1);\">返回</a></li>");
				}
			}else{//用户不存在
				out.println("用户或密码错误不存在<BR>");
				out.print("<li style=\"list-style-type: none;\"><a href=\"javascript:history.go(-1);\">返回</a></li>");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage()+"数据库查询失败！");
			out.println("用户或密码错误不存在<BR>");
			out.print("<li style=\"list-style-type: none;\"><a href=\"javascript:history.go(-1);\">返回</a></li>");
		}finally {
			out.flush();
			out.close();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
