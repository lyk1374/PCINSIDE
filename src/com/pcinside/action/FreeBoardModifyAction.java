package com.pcinside.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.dao.FreeBoardDao;

public class FreeBoardModifyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		String title = request.getParameter("title"); 
		String content = request.getParameter("content");
		FreeBoardDao dao = new FreeBoardDao();
		dao.freeBoardModify(bno,title,content);
		
		RequestDispatcher rd = request.getRequestDispatcher("Controller?command=freeboardshow&bno="+bno+"");
		rd.forward(request, response);
	}

}
