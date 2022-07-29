package com.pcinside.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.dao.FreeBoardDao;
import com.pcinside.dto.CommentDto;
import com.pcinside.dto.FreeBoardDto;

public class FreeBoardShow implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		FreeBoardDao fDao = new FreeBoardDao();
		FreeBoardDto writing = fDao.getFreeBoardShow(bno);
		ArrayList<CommentDto> list = fDao.getCommentList(bno);
		request.setAttribute("bno", bno);
		request.setAttribute("writing", writing);
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("FreeBoardShow.jsp");
		rd.forward(request, response);
	}

}
