package com.ldsh.bean;

public class Question {

	private int id;
	private String title;
	private String content;
	private String inputFormat;
	private String outputFormat;
	private int type;
	private int degree;
	private String cplus;
	private String java;
	private String others;
	private String anlalysis;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title==null?"":title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content==null?"":content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getInputFormat() {
		return inputFormat==null?"":inputFormat;
	}
	public void setInputFormat(String inputFormat) {
		this.inputFormat = inputFormat;
	}
	public String getOutputFormat() {
		return outputFormat==null?"":outputFormat;
	}
	public void setOutputFormat(String outputFormat) {
		this.outputFormat = outputFormat;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getDegree() {
		return degree;
	}
	public void setDegree(int degree) {
		this.degree = degree;
	}
	public String getCplus() {
		return cplus==null?"":cplus;
	}
	public void setCplus(String cplus) {
		this.cplus = cplus;
	}
	public String getJava() {
		return java==null?"":java;
	}
	public void setJava(String java) {
		this.java = java;
	}
	public String getOthers() {
		return others==null?"":others;
	}
	public void setOthers(String others) {
		this.others = others;
	}
	public String getAnlalysis() {
		return anlalysis==null?"":anlalysis;
	}
	public void setAnlalysis(String anlalysis) {
		this.anlalysis = anlalysis;
	}
	
	
}
