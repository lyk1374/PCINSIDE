package com.pcinside.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.dao.FreeBoardDao;
import com.pcinside.dto.FreeBoardDto;

public class FreeBoardModify implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		FreeBoardDao fDao = new FreeBoardDao();
		FreeBoardDto fDto = fDao.getTitleAndContent(bno);
		request.setAttribute("bno", bno);
		request.setAttribute("fDto", fDto);
		RequestDispatcher rd = request.getRequestDispatcher("FreeBoardModify.jsp");
		rd.forward(request, response);
	}

}
