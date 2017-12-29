package com.ldsh.imp;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ldsh.bean.Topic;
import com.ldsh.dao.ITopicDao;
import com.ldsh.utils.JDBCUtil;

import oracle.jdbc.OracleResultSet;
import oracle.jdbc.internal.OracleTypes;

public class TopicImp implements ITopicDao{

	@Override
	public List<Topic> queryAll() {
		String sql = "select tid,fid,rid,u_name,subject,curdatetime(t_time) ct_time,content,block,curdatetime(last_time) clast_time from topics";
		List<Topic> topics = new ArrayList<Topic>();
		
		try(Connection conn = JDBCUtil.getConnection();
			Statement state = conn.createStatement();
			ResultSet rs = state.executeQuery(sql);	) {
			while(rs.next()) {
				Topic topic = new Topic();
				topic.setTid(rs.getInt("tid"));
				topic.setFid(rs.getInt("fid"));
				topic.setRid(rs.getInt("rid"));
				topic.setUname(rs.getString("u_name"));
				topic.setSubject(rs.getString("subject"));
				topic.setTime(rs.getString("ct_time"));
				topic.setBlock(rs.getInt("block"));
				topic.setLastTime(rs.getString("clast_time"));
				topics.add(topic);
			}
		} catch (SQLException e) {
			System.out.print("表topics： ");
			System.out.println(e.getMessage());
		}
		return topics;
	}
	@Override
	public List<Topic> queryById(int rootid) {
		List<Topic> topics = new ArrayList<Topic>();
		String sql = "select tid,rid,fid,u_name,subject,t_time,content,block,last_time from topics where rid=? or tid=?";
		Connection conn = null;
		PreparedStatement pstate = null;
		ResultSet rs = null;
		try{
				conn = JDBCUtil.getConnection();
				pstate = conn.prepareStatement(sql);
				pstate.setInt(1, rootid);
				pstate.setInt(2, rootid);
				rs = pstate.executeQuery();
				while(rs.next()) {
					Topic topic = new Topic();
					topic.setTid(rs.getInt("tid"));
					topic.setFid(rs.getInt("fid"));
					topic.setRid(rs.getInt("rid"));
					topic.setUname(rs.getString("u_name"));
					topic.setSubject(rs.getString("subject"));
					topic.setContent(rs.getString("content").trim());
					topic.setTime(rs.getString("t_time"));
					topic.setBlock(rs.getInt("block"));
					topic.setLastTime(rs.getString("last_time"));
					topics.add(topic);
				}
			} catch (SQLException e) {
				System.out.print("表topics： ");
				System.out.println(e.getMessage());
			}finally {
				JDBCUtil.close(rs, pstate, conn);
			}
		return topics;
	}
	@Override
	public List<Topic> queryBySubject(String subject) {
		String sql = "{call topics_blur_subject(?, ?)}";
		List<Topic> topics = new ArrayList<Topic>();
		Connection conn = null;
		CallableStatement call = null;
		OracleResultSet rs = null;
		try {
			conn = JDBCUtil.getConnection();
			call = conn.prepareCall(sql);
			call.registerOutParameter(2, OracleTypes.CURSOR);
			call.setString(1, subject);
			call.execute();
			rs = (OracleResultSet)call.getObject(2);
			while(rs.next()) {
				Topic topic = new Topic();
				topic.setTid(rs.getInt(1));
				topic.setUname(rs.getString(2));
				topic.setSubject(rs.getString(3));
				topic.setBlock(rs.getInt(4));
				topic.setTime(rs.getString(5));
				topics.add(topic);
			}
		} catch (SQLException e) {
			System.out.print("存储过程topics_blur_subject： ");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, call, conn);
		}
		return topics;
	}


	@Override
	public int insert(Topic topic) {
		String sql = "insert into topics(fid,rid,u_name,subject,t_time,content,block,last_time) values(?,?,?,?,sysdate,?,?,sysdate) ";
		Connection conn = null;
		PreparedStatement pstate = null;
		int addCount = 0;
		try {
			conn = JDBCUtil.getConnection();
			pstate = conn.prepareStatement(sql);
			if(topic.getFid() == 0) {
				pstate.setString(1, null);
			}
			else {
				pstate.setInt(1, topic.getFid());
			}
			if(topic.getRid() == 0) {
				pstate.setString(2, null);
			}else {
				pstate.setInt(2, topic.getRid());
			}
			pstate.setString(3, topic.getUname());
			pstate.setString(4, topic.getSubject());
			pstate.setString(5, topic.getContent());
			pstate.setInt(6, topic.getBlock());
			addCount = pstate.executeUpdate();
		} catch (SQLException e) {
			System.out.print("表topics： ");
			System.out.println(e.getMessage());
		}finally {
			JDBCUtil.close(null, pstate, conn);
		}
		return addCount;
	}
	/**
	 * 根据帖子id删除它及其它的子孙帖
	 */
	@Override
	public void delete(int id) {
		String sql = "{call delete_topic(?)}";
		Connection conn = null;
		CallableStatement call = null;
		try{
			conn = JDBCUtil.getConnection();//获取连接对象
			call = conn.prepareCall(sql);
			call.setInt(1, id);
			call.execute();//执行存储过程
			} catch (SQLException e) {
				System.out.print("存储过程delete_topic： ");
				System.out.println(e.getMessage());
				e.printStackTrace();
			}finally {
				JDBCUtil.close(null, call, conn);//关闭流
			}
	}
	
	public static void main(String[] args) {
		TopicImp ti = new TopicImp();
		Topic topic = new Topic();
		List<Topic> list = new TopicImp().queryById(1);
		Topic post = null;
		List<Topic> reply = new ArrayList<Topic>();
		for(Topic tp : list){
			if(tp.getFid() == 0 && tp.getRid()== 0 && tp.getSubject()!=null)
				post = tp;
			else{
				reply.add(tp);
			}
		}
		System.out.println(post);
		System.out.println(reply.size());
	}

}
