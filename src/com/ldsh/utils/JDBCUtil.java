package com.ldsh.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCUtil {
	public static boolean isConnect = true;
	private static String url="jdbc:oracle:thin:@192.168.16.16:1521:orcl";
	private static String user = "atgmanager";
	private static String psw = "atgmanager";
//	private static String url="jdbc:oracle:thin:@localhost:1521:orcl";
//	private static String user = "scott";
//	private static String psw = "tiger";
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			isConnect = false;
			System.out.println("类没有找到, 数据库连接失败！");
			System.exit(-1);
		}
	}
	public static Connection getConnection(){
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, psw);
		} catch (SQLException e) {
			isConnect = false;
			System.out.println(e.getMessage() + "数据库连接失败！");
			System.exit(-1);
		}
		return conn;
	}
	
	
	public static void close(Connection conn) {
		try {
			if(conn != null)
				conn.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	public static void close(Statement state) {
		try {
			if(state != null)
				state.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	public static void close(ResultSet rs) {
		try {
			if(rs != null)
				rs.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	public static void close(ResultSet rs, Statement state, Connection conn) {
		
			try {
				if(rs != null)
					rs.close();
				if(state != null)
					state.close();
				if(conn != null)
					conn.close();
				
				
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
	}
}
