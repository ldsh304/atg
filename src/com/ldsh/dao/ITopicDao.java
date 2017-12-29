package com.ldsh.dao;

import java.util.List;

import com.ldsh.bean.Topic;

public interface ITopicDao {

	List<Topic> queryAll();
	List<Topic> queryBySubject(String subject);
	List<Topic> queryById(int rootid);
	int insert(Topic topic);
	void delete(int id);
}
