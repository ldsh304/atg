package com.ldsh.bean;

public class User {

	private String name;
	private String psw;
	private String time;
	private String email;
	private Long phone;
	private int topicCount;
	
	public User() {
		this.topicCount = 0;
	}
	
	public User(String name, String psw, String email) {
		super();
		this.name = name;
		this.psw = psw;
		this.email = email;
	}
	
	public String getPsw() {
		return psw;
	}
	public void setPsw(String psw) {
		this.psw = psw;
	}
	public int getTopicCount() {
		return topicCount;
	}
	public void setTopicCount(int topicCount) {
		this.topicCount = topicCount;
	}
	public String getName() { 
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Long getPhone() {
		return phone;
	}
	public void setPhone(Long phone) {
		this.phone = phone;
	}
	
	
	
}
