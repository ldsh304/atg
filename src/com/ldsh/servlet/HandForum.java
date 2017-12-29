package com.ldsh.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ldsh.bean.DiscussSubject;
import com.ldsh.bean.User;
import com.ldsh.imp.DiscussSubjectImp;
import com.ldsh.imp.UserImp;
import com.ldsh.utils.JDBCUtil;

public class HandForum extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int type = Integer.parseInt(request.getParameter("type"));
		List<String> moderators = getModerators(type);
		List<DiscussSubject> forumes = new DiscussSubjectImp().queryByBlock(type);
		String uname = (String)request.getSession().getAttribute("uname");
		User user = new UserImp().queryByName(uname);
		request.setAttribute("moderators", moderators);
		request.setAttribute("forumes", forumes);
		request.setAttribute("user", user);
		request.getRequestDispatcher("forum.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	private  List<String> getModerators(int type){
		List<String> moderators = new ArrayList<String>();
		String sql = "select u_name from moderators where m_type=?";
		Connection conn = null;
		PreparedStatement pstate = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtil.getConnection();
			pstate = conn.prepareStatement(sql);
			pstate.setInt(1, type);
			rs = pstate.executeQuery();
			while(rs.next()) {
				moderators.add(rs.getString(1));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			JDBCUtil.close(rs, pstate, conn);
		}
		return moderators;
	}
	
	
}
