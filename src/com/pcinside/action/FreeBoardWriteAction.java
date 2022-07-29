package com.pcinside.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pcinside.dao.FreeBoardDao;

public class FreeBoardWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute(("ID")); //로그인세션에서 아이디 꺼내옴
		String title = request.getParameter("title"); 
		String content = request.getParameter("content");
		FreeBoardDao fdao = new FreeBoardDao();
		fdao.freeBoardWrite(id,title,content);
		
		RequestDispatcher rd = request.getRequestDispatcher("Controller?command=freeboard&pageNum=1");
		rd.forward(request, response);
	}

}
