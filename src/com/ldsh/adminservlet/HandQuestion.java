package com.ldsh.adminservlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ldsh.bean.Question;
import com.ldsh.imp.QuestionImp;

public class HandQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Question question = new Question();
		question.setTitle(request.getParameter("title"));
		question.setContent(request.getParameter("content"));
		question.setInputFormat(request.getParameter("inforamt"));
		question.setOutputFormat(request.getParameter("outforamt"));
		question.setType(Integer.parseInt(request.getParameter("type")));
		question.setDegree(Integer.parseInt(request.getParameter("degree")));
		question.setCplus(request.getParameter("cplus"));
		question.setJava(request.getParameter("java"));
		question.setOthers(request.getParameter("others"));
		question.setAnlalysis(request.getParameter("anlalysis"));
		int count = new QuestionImp().insert(question);
		PrintWriter out = response.getWriter();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
		out.println("<a href=\""+ (basePath+"managequestions.jsp") +"\">返回管理主页</a>");
		if(count == 1) {
			out.println("插入成功！<br>");
			out.println("<a href=\""+ (basePath+"manage/addquestion.jsp") +"\">继续插入</a>");
		}else{
			out.println("插入失败！<br>");
			out.println("<a href=\""+ (basePath+"manage/addquestion.jsp") +"\">重新插入</a>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
