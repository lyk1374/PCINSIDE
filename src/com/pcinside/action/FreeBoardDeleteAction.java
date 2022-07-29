package com.pcinside.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.dao.FreeBoardDao;

public class FreeBoardDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		FreeBoardDao fdao = new FreeBoardDao();
		fdao.freeBoardDelete(bno);
		
		RequestDispatcher rd = request.getRequestDispatcher("Controller?command=freeboard&pageNum=1");
		rd.forward(request, response);
	}

}
