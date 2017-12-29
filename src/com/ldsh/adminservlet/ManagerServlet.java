package com.ldsh.adminservlet;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServlet;

import com.ldsh.bean.User;
import com.ldsh.utils.JDBCUtil;

public class ManagerServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	
	
	/**
	 * 
	 * @param map
	 * @param tablename
	 * @return
	 */
	protected boolean update(HashMap map,String tablename) {
		Connection conn = JDBCUtil.getConnection();
		StringBuilder sql = new StringBuilder("update user");
		try(Statement state = conn.createStatement();
			ResultSet rs = state.executeQuery("select * from users");		) {
			
			Set keySet = map.keySet();
		} catch (SQLException e) {
			System.out.println(e.getMessage()+"数据库连接失败");
		}
		return true;
	}
}
