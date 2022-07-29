package com.pcinside.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.dao.FreeBoardDao;
import com.pcinside.dto.FreeBoardDto;

public class FreeBoard implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		FreeBoardDao fDao = new FreeBoardDao();
		int freeBoardAll = fDao.freeBoardAll();
		ArrayList<FreeBoardDto> list = fDao.getFreeBoardList(pageNum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("freeBoardAll", freeBoardAll);
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("FreeBoard.jsp");
		rd.forward(request, response);
	}

}
