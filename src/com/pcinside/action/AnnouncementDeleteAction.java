package com.pcinside.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pcinside.dao.AnnouncementDao;

public class AnnouncementDeleteAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		AnnouncementDao aDao = new AnnouncementDao();
		aDao.deleteAnnouncement(bno);
		RequestDispatcher rd = request.getRequestDispatcher("Controller?command=announcement&pageNum=1");
		rd.forward(request, response);
	}

}
