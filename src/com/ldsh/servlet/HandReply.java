package com.ldsh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ldsh.bean.Topic;
import com.ldsh.imp.DiscussSubjectImp;
import com.ldsh.imp.TopicImp;
import com.ldsh.imp.UserImp;
import com.ldsh.utils.FormatUtil;
import com.ldsh.utils.ServletUtil;

/**
 * Servlet implementation class HandReply
 */
public class HandReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("gb2312");
		String rid = request.getParameter("rid");
		String fid = request.getParameter("fid");
		String type = request.getParameter("type");
		String url = request.getParameter("lasturl");
		System.out.println(url);
		Topic topic = new Topic();
		System.out.println(rid +"==="+ fid);
		if(rid == null || fid == null) {
			topic.setRid(0);
			topic.setFid(0);
			topic.setSubject(FormatUtil.changeEncoding(request.getParameter("subject").trim(), "gb2312"));
			System.out.println("afsdasfd");
		}else {
			topic.setRid(Integer.parseInt(rid));
			topic.setFid(Integer.parseInt(fid));
		}
		topic.setBlock(Integer.parseInt(type));
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
		String uname = (String)request.getSession().getAttribute("uname");
		topic.setUname(uname);
		topic.setContent(FormatUtil.changeEncoding(request.getParameter("content").trim(), "gb2312"));
		int count = new TopicImp().insert(topic);
		PrintWriter out = response.getWriter();
		response.setHeader("refresh", "2;url=index.jsp");
		if(count == 1){
			new UserImp().updateTopic(uname);
			out.println("发表成功<BR>");
			out.println("<a href=\""+basePath+ "forum?type="+type + "\" style=\"text-decoration: none;\">3秒后返回帖子列表</a>");
		}else{
			out.println("发表失败<BR>");
			out.println("<a href=\"javascript:history.back(-1)\" style=\"text-decoration: none;\">重新发帖</a>");
			out.println("<a href=\""+url+"\" style=\"text-decoration: none;\">放弃发帖</a>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
