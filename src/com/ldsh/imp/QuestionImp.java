package com.ldsh.imp;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ldsh.bean.Question;
import com.ldsh.bean.Topic;
import com.ldsh.dao.IQuestionDao;
import com.ldsh.utils.JDBCUtil;

import oracle.jdbc.OracleResultSet;
import oracle.jdbc.internal.OracleTypes;

public class QuestionImp implements IQuestionDao{

	@Override
	public List<Question> queryAll() {
		String sql = "select q_id,q_title,q_content,q_in_format,q_out_format,degree,lcplus,ljava,lothers,analysis emp from questions";
		List<Question> questions = new ArrayList<Question>();
		try(Connection conn = JDBCUtil.getConnection();
			Statement state = conn.createStatement();
			ResultSet rs = state.executeQuery(sql);	) {
			while(rs.next()) {
				Question question = new Question();
				question.setId(rs.getInt("q_id"));
				question.setTitle(rs.getString("q_title"));
				question.setContent(rs.getString("q_content"));
				question.setInputFormat(rs.getString("q_in_format"));
				question.setOutputFormat(rs.getString("q_out_format"));
				question.setDegree(rs.getInt("degree"));
				question.setCplus(rs.getString("lcplus"));
				question.setJava(rs.getString("ljava"));
				question.setOthers(rs.getString("lothers"));
				question.setAnlalysis(rs.getString("analysis"));
				questions.add(question);
			}
		} catch (SQLException e) {
			System.out.print("表questions： ");
			System.out.println(e.getMessage());
		}
		return questions;
	}

	@Override
	public Question queryById(int qid) {
		String sql = "select q_title,q_content,q_in_format,q_out_format,degree,lcplus,ljava,lothers,analysis emp from questions where q_id=?";
		Question question = null;
		Connection conn = null;
		PreparedStatement pstate = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			pstate = conn.prepareStatement(sql);
			pstate.setInt(1, qid);
			rs = pstate.executeQuery();
			if(rs.next()) {
				question = new Question();
				question.setId(qid);
				question.setTitle(rs.getString("q_title"));
				question.setContent(rs.getString("q_content"));
				question.setInputFormat(rs.getString("q_in_format"));
				question.setOutputFormat(rs.getString("q_out_format"));
				question.setDegree(rs.getInt("degree"));
				question.setCplus(rs.getString("lcplus"));
				question.setJava(rs.getString("ljava"));
				question.setOthers(rs.getString("lothers"));
				question.setAnlalysis(rs.getString("analysis"));
			}
		} catch (SQLException e) {
			System.out.print("表questions： ");
			System.out.println(e.getMessage());
		}finally {
			JDBCUtil.close(rs, pstate, conn);
		}
		return question;
	}

	@Override
	public List<Question> queryByBlurTitle(String qtitle) {
		String sql = "{call quest_blur_title(?, ?)}";
		List<Question> questions = new ArrayList<Question>();
		Connection conn = null;
		CallableStatement call = null;
		OracleResultSet rs = null;
		try {
			conn = JDBCUtil.getConnection();
			call = conn.prepareCall(sql);
			call.registerOutParameter(2, OracleTypes.CURSOR);
			call.setString(1, qtitle);
			call.execute();
			rs = (OracleResultSet)call.getObject(2);
			while(rs.next()) {
				Question question = new Question();
				question = new Question();
				question.setId(rs.getInt(1));
				question.setTitle(rs.getString(2));
				questions.add(question);
			}
		} catch (SQLException e) {
			System.out.print("存储过程quest_blur_title： ");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, call, conn);
		}
		return questions;
	}

	@Override
	public int delete(int qid) {
		String sql = "delete from questions where q_id=?";
		Connection conn = null;
		PreparedStatement pstate = null;
		int deleteCount = 0;
		try {
			conn = JDBCUtil.getConnection();
			pstate = conn.prepareStatement(sql);
			pstate.setInt(1, qid);
			deleteCount = pstate.executeUpdate();
		} catch (SQLException e) {
			System.out.print("表questions： ");
			System.out.println(e.getMessage());
		}finally {
			JDBCUtil.close(null, pstate, conn);
		}
		return deleteCount;
	}

	@Override
	public int insert(Question question) {
		String sql = "insert into question values(sq_questions_id.nextval,?,?,?,?,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstate = null;
		int addCount = 0;
		try {
			conn = JDBCUtil.getConnection();
			pstate = conn.prepareStatement(sql);
			pstate.setString(1, question.getTitle());
			pstate.setString(2, question.getContent());
			pstate.setString(3, question.getInputFormat());
			pstate.setString(4, question.getOutputFormat());
			pstate.setInt(5, question.getType());
			pstate.setInt(6, question.getDegree());
			pstate.setString(7, question.getCplus());
			pstate.setString(8, question.getJava());
			pstate.setString(9, question.getOthers());
			pstate.setString(10, question.getAnlalysis());
			addCount = pstate.executeUpdate();
		} catch (SQLException e) {
			System.out.print("表questions： ");
			System.out.println(e.getMessage());
		}finally {
			JDBCUtil.close(null, pstate, conn);
		}
		return addCount;
	}

}
