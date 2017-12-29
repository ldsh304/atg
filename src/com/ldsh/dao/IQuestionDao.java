package com.ldsh.dao;

import java.util.List;

import com.ldsh.bean.Question;

public interface IQuestionDao {
	List<Question> queryAll();
	Question queryById(int qid);
	List<Question> queryByBlurTitle(String qtitle);
	int insert(Question question);
	int delete(int qid);
}
