package com.ldsh.bean;

public class DiscussSubject {
	private int tid;//rootid
	private String subject;//主题
	private String currentUser;//发起主题的人
	private String lastUser;//最后回复的人
	private String time;//最后回复的时间
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String title) {
		this.subject = title;
	}
	public String getCurrentUser() {
		return currentUser;
	}
	public void setCurrentUser(String currentUser) {
		this.currentUser = currentUser;
	}
	public String getLastUser() {
		return lastUser;
	}
	public void setLastUser(String lastUser) {
		this.lastUser = lastUser;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "DiscussSubject [tid=" + tid + ", subject=" + subject + ", currentUser=" + currentUser + ", lastUser="
				+ lastUser + ", time=" + time + "]";
	}
}
