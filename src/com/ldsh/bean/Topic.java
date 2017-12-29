package com.ldsh.bean;

public class Topic {
	private int tid;
	private int fid;
	private int rid;
	private String uname;
	private String subject;
	private String time;
	private String content;
	private int block;
	private String lastTime;
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getBlock() {
		return block;
	}
	public void setBlock(int block) {
		this.block = block;
	}
	public String getLastTime() {
		return lastTime;
	}
	public void setLastTime(String lastTime) {
		this.lastTime = lastTime;
	}
	@Override
	public String toString() {
		return "Topic [tid=" + tid + ", fid=" + fid + ", rid=" + rid + ", uname=" + uname + ", subject=" + subject
				+ ", time=" + time + ", content=" + content + ", block=" + block + ", lastTime=" + lastTime + "]";
	}
}
