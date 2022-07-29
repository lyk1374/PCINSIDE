package com.pcinside.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.dao.AnnouncementDao;
import com.pcinside.dto.AnnouncementDto;

public class AnnouncementShow implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		AnnouncementDao aDao = new AnnouncementDao();
		AnnouncementDto writing = aDao.getAnnouncementShow(bno);
		request.setAttribute("writing", writing);
		request.setAttribute("bno", bno);
		RequestDispatcher rd = request.getRequestDispatcher("AnnouncementShow.jsp");
		rd.forward(request, response);
	}

}
