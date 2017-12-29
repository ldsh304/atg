package com.ldsh.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ldsh.bean.User;
import com.ldsh.dao.IUserDao;
import com.ldsh.utils.JDBCUtil;

public class UserImp implements IUserDao{

	
	@Override
	public List<User> queryAll() {
		List<User> users = new ArrayList<User>();;
		try(Connection conn = JDBCUtil.getConnection();
			Statement state = conn.createStatement();
			ResultSet rs = state.executeQuery("select * from users");
				) {
			while(rs.next()) {
				User user = new User();
				user.setName(rs.getString("u_name"));
				user.setTime(rs.getString("u_time"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getLong("phone"));
				user.setTopicCount(rs.getInt("topic_count"));
				users.add(user);
			}
		} catch (SQLException e) {
			System.out.print("表users： ");
			System.out.println(e.getMessage());
		}
		return users;
	}

	@Override
	public User queryByName(String uname) {
		User user = null;
		Connection conn = null;
		PreparedStatement pstate = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			pstate = conn.prepareStatement("select u_name,curdatetime(u_time),email,phone,"
					+ "topic_count from users where u_name=?");
			pstate.setString(1, uname);
			rs = pstate.executeQuery();
			if(rs.next()) {
				user = new User();
				user.setName(rs.getString("u_name"));
				user.setTime(rs.getString(2));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getLong("phone"));
				user.setTopicCount(rs.getInt("topic_count"));
			}
			} catch (SQLException e) {
				System.out.print("表users： ");
				System.out.println(e.getMessage());
			}finally {
				JDBCUtil.close(rs, pstate, conn);
			}
		return user;
	}
	
	public void updateTopic(String uname) {
		Connection conn = null;
		PreparedStatement pstate = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			pstate = conn.prepareStatement("update users topic_count set topic_count=topic_count+1 where u_name=?");
			pstate.setString(1, uname);
			rs = pstate.executeQuery();
			} catch (SQLException e) {
				System.out.print("表users： ");
				System.out.println(e.getMessage());
			}finally {
				JDBCUtil.close(rs, pstate, conn);
			}
	}
	@Override
	public boolean insert(User user) {
		Connection conn = null;
		PreparedStatement pstate = null;
		int updateCount = 0;
		try{
			conn = JDBCUtil.getConnection();
			pstate = conn.prepareStatement("insert into users values(?,?,sysdate,?,?,?)");
			pstate.setString(1, user.getName());
			pstate.setString(2, user.getPsw());
			pstate.setString(3, user.getEmail());
			pstate.setLong(4, user.getPhone());
			pstate.setInt(5, user.getTopicCount());
			updateCount = pstate.executeUpdate();
			} catch (SQLException e) {
				System.out.print("表users： ");
				System.out.println(e.getMessage());
				return false;
			}finally {
				JDBCUtil.close(null, pstate, conn);
		}
		return updateCount==0?false:true;
	}

	@Override
	public int deleteByName(String uname) {
		Connection conn = null;
		PreparedStatement pstate = null;
		ResultSet rs = null;
		int deleteCount = 0;
		try{
			conn = JDBCUtil.getConnection();
			pstate = conn.prepareStatement("delete from users where u_name=?");
			pstate.setString(1, uname);
			deleteCount = pstate.executeUpdate();
			} catch (SQLException e) {
				System.out.print("表users： ");
				System.out.println(e.getMessage());
			}finally {
				JDBCUtil.close(rs, pstate, conn);
		}
		return deleteCount;
	}
	
	
}
