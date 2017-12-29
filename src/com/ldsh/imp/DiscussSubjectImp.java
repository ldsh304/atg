package com.ldsh.imp;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ldsh.bean.DiscussSubject;
import com.ldsh.utils.JDBCUtil;

import oracle.jdbc.OracleResultSet;
import oracle.jdbc.internal.OracleTypes;


public class DiscussSubjectImp{
	
	public List<DiscussSubject> queryAll(){
		String sql = "select p_tid from v$_post";
		List<Integer> ids = new ArrayList<Integer>();
		try(Connection conn = JDBCUtil.getConnection();
			Statement state = conn.createStatement();
			ResultSet rs = state.executeQuery(sql);
					) {
				while(rs.next()) {
					ids.add(rs.getInt("p_tid"));
				}
			} catch (SQLException e) {
				System.out.print("��v$_post�� ");
				System.out.println(e.getMessage());
			}
		List<DiscussSubject> list = new ArrayList<DiscussSubject>();
		for(int id : ids) {
			DiscussSubject ds = queryById(id);
			list.add(ds);
		}
		return list;
	}
	
	/**
	 * ���ݰ��id��ѯ����
	 * @param type
	 * @return
	 */
	public List<DiscussSubject> queryByBlock(int type){
		String sql = "select p_tid from v$_post where p_block=?";
		List<Integer> ids = new ArrayList<Integer>();
		Connection conn = null;
		PreparedStatement pstate = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			pstate = conn.prepareStatement(sql);
			pstate.setInt(1, type);
			rs = pstate.executeQuery();
			while(rs.next()) {
				ids.add(rs.getInt("p_tid"));
			}
			} catch (SQLException e) {
				System.out.print("��p_block�� ");
				System.out.println(e.getMessage());
			}
		List<DiscussSubject> list = new ArrayList<DiscussSubject>();
		for(int id : ids) {
			DiscussSubject ds = queryById(id);
			list.add(ds);
		}
		return list;
	}
	
	/**
	 * ��������id��ѯ���ظ���������Ϣ
	 */
	public DiscussSubject queryById(int id){
		String sql = "{? = call ds_lastone(?)}";
		DiscussSubject ds = null;
		Connection conn = null;
		ResultSet rs = null;
		CallableStatement call = null;
		try{
			conn = JDBCUtil.getConnection();
			call = conn.prepareCall(sql);
			call.registerOutParameter(1, OracleTypes.CURSOR);
			call.setInt(2, id);//����Ҫ������id
			call.execute();
			rs = (OracleResultSet)call.getObject(1);//��ȡ��ѯ���
			if(rs.next()) {
				ds = new DiscussSubject();//��װ��������
				ds.setTid(rs.getInt(1));
				ds.setSubject(rs.getString(2));
				ds.setCurrentUser(rs.getString(3));
				ds.setLastUser(rs.getString(4));
				ds.setTime(rs.getString(5));
			}
			} catch (SQLException e) {
				System.out.print("����ds_lastone�� ");
				System.out.println(e.getMessage());
			}finally {
				JDBCUtil.close(rs, call, conn);//�ر���
			}
		return ds;
	}
	
	
	public static void main(String[] args) {
		DiscussSubjectImp dsi = new DiscussSubjectImp();
		List<DiscussSubject> list = dsi.queryByBlock(1);
		
		for(DiscussSubject ds : list) {
			System.out.println(ds);
		}
	}

}
