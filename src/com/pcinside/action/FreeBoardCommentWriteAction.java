package com.pcinside.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pcinside.dao.FreeBoardDao;

public class FreeBoardCommentWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute(("ID"));
		String content = request.getParameter("content");
		int bno = Integer.parseInt(request.getParameter("bno"));
		FreeBoardDao dao = new FreeBoardDao();
		dao.commentWrite(bno,id,content);
		
		RequestDispatcher rd = request.getRequestDispatcher("Controller?command=freeboardshow&bno="+bno+"");
		rd.forward(request, response);
	}

}
