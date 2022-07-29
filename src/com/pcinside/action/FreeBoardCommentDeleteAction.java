package com.pcinside.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.dao.FreeBoardDao;

public class FreeBoardCommentDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		int rno = Integer.parseInt(request.getParameter("rno"));
		FreeBoardDao fdao = new FreeBoardDao();
		fdao.commentDelete(rno);
		
		RequestDispatcher rd = request.getRequestDispatcher("Controller?command=freeboardshow&bno="+bno+"");
		rd.forward(request, response);
	}

}
