package com.ldsh.bean;

public class DiscussSubject {
	private int tid;//rootid
	private String subject;//����
	private String currentUser;//�����������
	private String lastUser;//���ظ�����
	private String time;//���ظ���ʱ��
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
