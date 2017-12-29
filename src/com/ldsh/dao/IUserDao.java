package com.ldsh.dao;

import java.util.List;

import com.ldsh.bean.User;

public interface IUserDao {
	List<User> queryAll();
	User queryByName(String uname);
	boolean insert(User user);
	int deleteByName(String uname);
}
