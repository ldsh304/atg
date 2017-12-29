package com.ldsh.test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ldsh.utils.JDBCUtil;

/**
 * Servlet implementation class InsertServlet
 */
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void insertUser(HttpServletRequest request, HttpServletResponse response){
		String uname = request.getParameter("uname");
		String upsw = request.getParameter("upsw");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		Connection conn = JDBCUtil.getConnection();
		PreparedStatement state = null;
		try {
			state = conn.prepareStatement("insert into users values(sq_users_id.nextval,?,?,sysdate,?,?,0)");
			state.setString(1, uname);
			state.setString(2, upsw);
			state.setString(3, email);
			state.setLong(4, Long.parseLong(phone));
			state.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
